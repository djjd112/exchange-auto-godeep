package controllers

import (
	"encoding/json"
	"net/http"
	"strconv"
	"time"

	"github.com/mgface/exchange-auto-godeep/utils"
	"golang.org/x/crypto/ssh"

	"github.com/gin-gonic/gin"
	"github.com/gorilla/websocket"
	"github.com/mgface/exchange-auto-godeep/middleware"
	"github.com/mgface/exchange-auto-godeep/models"
	"github.com/mgface/exchange-auto-godeep/service"
	"github.com/sirupsen/logrus"
)

type ServerController struct {
	ServerService service.ServerService
	UserService   service.UserService
}

func NewServerController(serverService service.ServerService, userService service.UserService) *ServerController {
	return &ServerController{ServerService: serverService, UserService: userService}
}

// ServerRequest 服务器请求
type ServerRequest struct {
	IP         string `json:"ip" binding:"required"`
	Name       string `json:"name" binding:"required"`
	Password   string `json:"password" binding:"required"`
	ExpireTime string `json:"expire_time"`
	Remark     string `json:"remark"`
}

// GetServerList 获取服务器列表
func (sc *ServerController) GetServerList(c *gin.Context) {
	page, _ := strconv.Atoi(c.DefaultQuery("page", "1"))
	pageSize, _ := strconv.Atoi(c.DefaultQuery("page_size", "10"))

	query := make(map[string]interface{})
	if name := c.Query("name"); name != "" {
		query["name"] = name
	}
	if ip := c.Query("ip"); ip != "" {
		query["ip"] = ip
	}

	servers, total, err := sc.ServerService.ListServers(page, pageSize, query)
	if err != nil {
		logrus.Errorf("获取服务器列表失败: %v", err)
		c.JSON(http.StatusInternalServerError, gin.H{"code": 500, "message": "服务器内部错误"})
		return
	}

	// ✅ 加在这里（关键！！）
	for i := range servers {
		ok := utils.CheckSSH(
			servers[i].IP,
			servers[i].Password,
		)
		servers[i].Status = ok
	}

	c.JSON(http.StatusOK, gin.H{
		"code":    200,
		"message": "获取服务器列表成功",
		"data":    gin.H{"total": total, "servers": servers},
	})
}

// GetServerDetail 获取服务器详情
func (sc *ServerController) GetServerDetail(c *gin.Context) {
	id, err := strconv.ParseUint(c.Param("id"), 10, 32)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"code": 400, "message": "无效的服务器ID"})
		return
	}

	server, err := sc.ServerService.GetServerByID(uint(id))
	if err != nil {
		c.JSON(http.StatusNotFound, gin.H{"code": 404, "message": "服务器不存在"})
		return
	}

	c.JSON(http.StatusOK, gin.H{"code": 200, "message": "获取服务器详情成功", "data": server})
}

// AddServer 添加服务器
func (sc *ServerController) AddServer(c *gin.Context) {
	var req ServerRequest
	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"code": 400, "message": "请求参数错误"})
		return
	}

	server := &models.Server{
		IP:       req.IP,
		Name:     req.Name,
		Password: req.Password,
		Remark:   req.Remark,
	}

	if req.ExpireTime != "" {
		expireTime, err := time.Parse("2006-01-02 15:04:05", req.ExpireTime)
		if err != nil {
			c.JSON(http.StatusBadRequest, gin.H{"code": 400, "message": "到期时间格式错误"})
			return
		}
		server.ExpireTime = &expireTime
	}

	if err := sc.ServerService.CreateServer(server); err != nil {
		logrus.Errorf("创建服务器失败: %v", err)
		c.JSON(http.StatusInternalServerError, gin.H{"code": 500, "message": "服务器内部错误"})
		return
	}

	c.JSON(http.StatusOK, gin.H{"code": 200, "message": "添加服务器成功", "data": server})
}

// UpdateServer 更新服务器
func (sc *ServerController) UpdateServer(c *gin.Context) {
	id, err := strconv.ParseUint(c.Param("id"), 10, 32)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"code": 400, "message": "无效的服务器ID"})
		return
	}

	var req ServerRequest
	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"code": 400, "message": "请求参数错误"})
		return
	}

	server, err := sc.ServerService.GetServerByID(uint(id))
	if err != nil {
		c.JSON(http.StatusNotFound, gin.H{"code": 404, "message": "服务器不存在"})
		return
	}

	server.IP = req.IP
	server.Name = req.Name
	server.Password = req.Password
	server.Remark = req.Remark

	if err := sc.ServerService.UpdateServer(server); err != nil {
		logrus.Errorf("更新服务器失败: %v", err)
		c.JSON(http.StatusInternalServerError, gin.H{"code": 500, "message": "服务器内部错误"})
		return
	}

	c.JSON(http.StatusOK, gin.H{"code": 200, "message": "更新服务器成功", "data": server})
}

// DeleteServer 删除服务器
func (sc *ServerController) DeleteServer(c *gin.Context) {
	id, err := strconv.ParseUint(c.Param("id"), 10, 32)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"code": 400, "message": "无效的服务器ID"})
		return
	}

	if err := sc.ServerService.DeleteServer(uint(id)); err != nil {
		logrus.Errorf("删除服务器失败: %v", err)
		c.JSON(http.StatusInternalServerError, gin.H{"code": 500, "message": "服务器内部错误"})
		return
	}

	c.JSON(http.StatusOK, gin.H{"code": 200, "message": "删除服务器成功"})
}

// ConnectServer 连接服务器
func (sc *ServerController) ConnectServer(c *gin.Context) {
	id, err := strconv.ParseUint(c.Param("id"), 10, 32)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"code": 400, "message": "无效的服务器ID"})
		return
	}

	server, err := sc.ServerService.ConnectServer(uint(id))
	if err != nil {
		logrus.Errorf("连接服务器失败: %v", err)
		c.JSON(http.StatusInternalServerError, gin.H{"code": 500, "message": "服务器内部错误"})
		return
	}

	c.JSON(http.StatusOK, gin.H{"code": 200, "message": "连接服务器成功", "data": server})
}

// GetServerStatus 获取服务器状态
func (sc *ServerController) GetServerStatus(c *gin.Context) {
	id, err := strconv.ParseUint(c.Param("id"), 10, 32)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"code": 400, "message": "无效的服务器ID"})
		return
	}

	status, err := sc.ServerService.GetServerStatus(uint(id))
	if err != nil {
		logrus.Errorf("获取服务器状态失败: %v", err)
		c.JSON(http.StatusInternalServerError, gin.H{"code": 500, "message": "获取服务器状态失败"})
		return
	}

	c.JSON(http.StatusOK, gin.H{"code": 200, "message": "获取服务器状态成功", "data": status})
}

// WebSocket升级器
var upgrader = websocket.Upgrader{
	CheckOrigin: func(r *http.Request) bool {
		return true // 允许所有来源
	},
}

// TerminalHandler 处理终端WebSocket连接
func (sc *ServerController) TerminalHandler(c *gin.Context) {
	// 获取服务器ID
	id, err := strconv.ParseUint(c.Param("id"), 10, 64)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"code":    400,
			"message": "无效的服务器ID",
		})
		return
	}
	// 获取token
	token := c.Query("token")
	if token == "" {
		c.JSON(http.StatusBadRequest, gin.H{
			"code":    400,
			"message": "无效的token",
		})
	}
	// 验证令牌
	claims, err := middleware.ParseToken(token)
	if err != nil {
		c.JSON(http.StatusUnauthorized, gin.H{
			"code":    401,
			"message": "认证令牌无效",
		})
		return
	}

	// 检查用户是否存在
	_, err = sc.UserService.GetUserByID(claims.UserID)
	if err != nil {
		c.JSON(http.StatusUnauthorized, gin.H{
			"code":    401,
			"message": "用户不存在",
		})
		return
	}
	// 查询服务器
	server, err := sc.ServerService.GetServerByID(uint(id))
	if err != nil {
		c.JSON(http.StatusNotFound, gin.H{
			"code":    404,
			"message": "服务器不存在",
		})
		return
	}

	// 升级HTTP连接为WebSocket
	ws, err := upgrader.Upgrade(c.Writer, c.Request, nil)
	if err != nil {
		logrus.Errorf("升级WebSocket失败: %v", err)
		return
	}
	defer ws.Close()

	// 连接SSH
	sshClient, err := utils.ConnectSSH(server.IP, server.Password)
	if err != nil {
		utils.SendTerminalError(ws, "SSH连接失败: "+err.Error())
		return
	}
	defer sshClient.Close()

	// 创建SSH会话
	session, err := sshClient.NewSession()
	if err != nil {
		utils.SendTerminalError(ws, "创建SSH会话失败: "+err.Error())
		return
	}
	defer session.Close()

	// 请求伪终端
	modes := ssh.TerminalModes{
		ssh.ECHO:          1,
		ssh.TTY_OP_ISPEED: 14400,
		ssh.TTY_OP_OSPEED: 14400,
	}

	// 默认终端大小
	termWidth, termHeight := 120, 48

	if err := session.RequestPty("xterm", termHeight, termWidth, modes); err != nil {
		utils.SendTerminalError(ws, "请求伪终端失败: "+err.Error())
		return
	}

	// 创建SSH输入管道
	stdin, err := session.StdinPipe()
	if err != nil {
		utils.SendTerminalError(ws, "创建SSH输入管道失败: "+err.Error())
		return
	}

	// 创建SSH输出管道
	stdout, err := session.StdoutPipe()
	if err != nil {
		utils.SendTerminalError(ws, "创建SSH输出管道失败: "+err.Error())
		return
	}

	// 创建SSH错误输出管道
	stderr, err := session.StderrPipe()
	if err != nil {
		utils.SendTerminalError(ws, "创建SSH错误输出管道失败: "+err.Error())
		return
	}

	// 启动远程shell
	if err := session.Shell(); err != nil {
		utils.SendTerminalError(ws, "启动Shell失败: "+err.Error())
		return
	}

	// 处理来自SSH的输出
	go utils.CopyOutput(ws, stdout)
	go utils.CopyOutput(ws, stderr)

	// 处理WebSocket消息
	for {
		_, data, err := ws.ReadMessage()
		if err != nil {
			logrus.Errorf("读取WebSocket消息失败: %v", err)
			break
		}

		var msg utils.TerminalMessage
		if err := json.Unmarshal(data, &msg); err != nil {
			logrus.Errorf("解析WebSocket消息失败: %v", err)
			continue
		}

		switch msg.Type {
		case "input":
			// 发送输入到SSH
			_, err = stdin.Write([]byte(msg.Data))
			if err != nil {
				logrus.Errorf("写入SSH输入失败: %v", err)
				return
			}
		case "resize":
			// 调整终端大小
			err = session.WindowChange(msg.Rows, msg.Cols)
			if err != nil {
				logrus.Errorf("调整终端大小失败: %v", err)
			}
		}
	}

	// 等待会话结束
	if err := session.Wait(); err != nil {
		logrus.Errorf("SSH会话结束: %v", err)
	}
}

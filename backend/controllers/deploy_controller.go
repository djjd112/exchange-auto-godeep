package controllers

import (
	"net/http"
	"strconv"

	"github.com/gin-gonic/gin"
	"github.com/mgface/exchange-auto-godeep/models"
	"github.com/mgface/exchange-auto-godeep/service"
	"github.com/sirupsen/logrus"
)

type DeployController struct {
	DeployService service.DeployService
}

func NewDeployController(deployService service.DeployService) *DeployController {
	return &DeployController{DeployService: deployService}
}

// DeployRequest 部署请求
type DeployRequest struct {
	ServiceID     uint   `json:"serviceId" binding:"required"`
	ServiceName   string `json:"serviceName" binding:"required"`
	ContainerID   uint   `json:"containerId" binding:"required"`
	ContainerName string `json:"containerName" binding:"required"`
	FileID        uint   `json:"fileId"`
	FileName      string `json:"fileName"`
	ServerID      uint   `json:"serverId"`
	ServerName    string `json:"serverName"`
	Version       string `json:"version" binding:"required"`
	Remark        string `json:"remark"`
}

// GetDeployList 获取部署列表
func (dc *DeployController) GetDeployList(c *gin.Context) {
	page, _ := strconv.Atoi(c.DefaultQuery("page", "1"))
	pageSize, _ := strconv.Atoi(c.DefaultQuery("pageSize", "10"))
	serviceIDStr := c.DefaultQuery("serviceId", "0")
	serviceID, _ := strconv.ParseUint(serviceIDStr, 10, 32)
	status := c.DefaultQuery("status", "")

	deploys, total, err := dc.DeployService.ListDeploys(page, pageSize, uint(serviceID), status)
	if err != nil {
		logrus.Errorf("获取部署列表失败: %v", err)
		c.JSON(http.StatusInternalServerError, gin.H{"code": 500, "message": "服务器内部错误"})
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"code":    200,
		"message": "获取部署列表成功",
		"data":    gin.H{"list": deploys, "total": total, "page": page, "pageSize": pageSize},
	})
}

// GetDeployDetail 获取部署详情
func (dc *DeployController) GetDeployDetail(c *gin.Context) {
	id, err := strconv.ParseUint(c.Param("id"), 10, 32)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"code": 400, "message": "无效的部署ID"})
		return
	}

	deploy, err := dc.DeployService.GetDeployByID(uint(id))
	if err != nil {
		c.JSON(http.StatusNotFound, gin.H{"code": 404, "message": "部署不存在"})
		return
	}

	c.JSON(http.StatusOK, gin.H{"code": 200, "message": "获取部署详情成功", "data": deploy})
}

// CreateDeploy 创建部署
func (dc *DeployController) CreateDeploy(c *gin.Context) {
	var req DeployRequest
	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"code": 400, "message": "请求参数错误"})
		return
	}

	deploy := &models.Deploy{
		ServiceID:     req.ServiceID,
		ServiceName:   req.ServiceName,
		ContainerID:   req.ContainerID,
		ContainerName: req.ContainerName,
		FileID:        req.FileID,
		FileName:      req.FileName,
		ServerID:      req.ServerID,
		ServerName:    req.ServerName,
		Version:       req.Version,
		Remark:        req.Remark,
	}

	if err := dc.DeployService.CreateDeploy(deploy); err != nil {
		logrus.Errorf("创建部署失败: %v", err)
		c.JSON(http.StatusInternalServerError, gin.H{"code": 500, "message": "服务器���部错误"})
		return
	}

	c.JSON(http.StatusOK, gin.H{"code": 200, "message": "创建部署成功", "data": deploy})
}

// ExecuteDeploy 执行部署
func (dc *DeployController) ExecuteDeploy(c *gin.Context) {
	id, err := strconv.ParseUint(c.Param("id"), 10, 32)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"code": 400, "message": "无效的部署ID"})
		return
	}

	if err := dc.DeployService.ExecuteDeploy(uint(id)); err != nil {
		logrus.Errorf("执行部署失败: %v", err)
		c.JSON(http.StatusInternalServerError, gin.H{"code": 500, "message": "执行部署失败"})
		return
	}

	c.JSON(http.StatusOK, gin.H{"code": 200, "message": "执行部署成功"})
}

// GetDeployLogs 获取部署日志
func (dc *DeployController) GetDeployLogs(c *gin.Context) {
	id, err := strconv.ParseUint(c.Param("id"), 10, 32)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"code": 400, "message": "无效的部署ID"})
		return
	}

	logs, err := dc.DeployService.GetDeployLogs(uint(id))
	if err != nil {
		logrus.Errorf("获取部署日志失败: %v", err)
		c.JSON(http.StatusInternalServerError, gin.H{"code": 500, "message": "服务器内部错误"})
		return
	}

	c.JSON(http.StatusOK, gin.H{"code": 200, "message": "获取部署日志成功", "data": logs})
}

// TestDeploy 测试部署
func (dc *DeployController) TestDeploy(c *gin.Context) {
	id, err := strconv.ParseUint(c.Param("id"), 10, 32)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"code": 400, "message": "无效的部署ID"})
		return
	}

	if err := dc.DeployService.TestDeploy(uint(id)); err != nil {
		logrus.Errorf("测试部署失败: %v", err)
		c.JSON(http.StatusInternalServerError, gin.H{"code": 500, "message": "测试部署失败"})
		return
	}

	c.JSON(http.StatusOK, gin.H{"code": 200, "message": "测试部署成功"})
}

package controllers

import (
	"net/http"
	"strconv"

	"github.com/gin-gonic/gin"
	"github.com/mgface/exchange-auto-godeep/models"
	"github.com/mgface/exchange-auto-godeep/service"
	"github.com/sirupsen/logrus"
)

type ContainerController struct {
	ContainerService service.ContainerService
}

func NewContainerController(containerService service.ContainerService) *ContainerController {
	return &ContainerController{ContainerService: containerService}
}

// ContainerRequest 容器请求
type ContainerRequest struct {
	Name        string `json:"name" binding:"required"`
	Address     string `json:"address" binding:"required"`
	ServiceName string `json:"service_name" binding:"required"`
	MD5         string `json:"md5"`
	Version     string `json:"version" binding:"required"`
	ServiceID   uint   `json:"service_id" binding:"required"`
}

func (cc *ContainerController) NotifyFromGithub(c *gin.Context) {
	var buildNotification models.BuildNotification
	if err := c.ShouldBindJSON(&buildNotification); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"code": 400, "message": "请求参数错误"})
		return
	}

	if err := cc.ContainerService.NotifyFromGithub(&buildNotification); err != nil {
		logrus.Errorf("通知处理失败: %v", err)
		c.JSON(http.StatusInternalServerError, gin.H{"code": 500, "message": "服务器内部错误"})
		return
	}
	c.JSON(http.StatusOK, gin.H{"code": 200, "message": "通知成功"})
}

// GetContainerList 获取容器列表
func (cc *ContainerController) GetContainerList(c *gin.Context) {
	page, _ := strconv.Atoi(c.DefaultQuery("page", "1"))
	pageSize, _ := strconv.Atoi(c.DefaultQuery("page_size", "10"))

	query := make(map[string]interface{})
	if name := c.Query("name"); name != "" {
		query["name"] = name
	}
	if serviceName := c.Query("service_name"); serviceName != "" {
		query["service_name"] = serviceName
	}
	if serverID := c.Query("server_id"); serverID != "" {
		id, err := strconv.ParseUint(serverID, 10, 64)
		if err == nil {
			query["server_id"] = uint(id)
		}
	}

	containers, total, err := cc.ContainerService.ListContainers(page, pageSize, query)
	if err != nil {
		logrus.Errorf("获取容器列表失败: %v", err)
		c.JSON(http.StatusInternalServerError, gin.H{"code": 500, "message": "服务器内部错误"})
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"code":    200,
		"message": "获取容器列表成功",
		"data":    gin.H{"total": total, "containers": containers},
	})
}

// GetContainerDetail 获取容器详情
func (cc *ContainerController) GetContainerDetail(c *gin.Context) {
	id, err := strconv.ParseUint(c.Param("id"), 10, 32)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"code": 400, "message": "无效的容器ID"})
		return
	}

	container, err := cc.ContainerService.GetContainerByID(uint(id))
	if err != nil {
		c.JSON(http.StatusNotFound, gin.H{"code": 404, "message": "容器不存在"})
		return
	}

	c.JSON(http.StatusOK, gin.H{"code": 200, "message": "获取容器详情成功", "data": container})
}

// AddContainer 添加��器
func (cc *ContainerController) AddContainer(c *gin.Context) {
	var req ContainerRequest
	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"code": 400, "message": "请求参数错误"})
		return
	}

	container := &models.Container{
		Name:        req.Name,
		Address:     req.Address,
		ServiceName: req.ServiceName,
		MD5:         req.MD5,
		Version:     req.Version,
		ServiceID:   req.ServiceID,
	}

	if err := cc.ContainerService.CreateContainer(container); err != nil {
		logrus.Errorf("创建容器失败: %v", err)
		c.JSON(http.StatusInternalServerError, gin.H{"code": 500, "message": "服务器内部错误"})
		return
	}

	c.JSON(http.StatusOK, gin.H{"code": 200, "message": "添加容器成功", "data": container})
}

// UpdateContainer 更新容器
func (cc *ContainerController) UpdateContainer(c *gin.Context) {
	id, err := strconv.ParseUint(c.Param("id"), 10, 32)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"code": 400, "message": "无效的容器ID"})
		return
	}

	var req ContainerRequest
	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"code": 400, "message": "请求参数错误"})
		return
	}

	container := &models.Container{
		Name:        req.Name,
		Address:     req.Address,
		ServiceName: req.ServiceName,
		MD5:         req.MD5,
		Version:     req.Version,
		ServiceID:   req.ServiceID,
	}

	if err := cc.ContainerService.UpdateContainer(uint(id), container); err != nil {
		logrus.Errorf("更新容器失败: %v", err)
		c.JSON(http.StatusInternalServerError, gin.H{"code": 500, "message": "服务器内部错误"})
		return
	}

	c.JSON(http.StatusOK, gin.H{"code": 200, "message": "更新容器成功", "data": container})
}

// DeleteContainer 删除容器
func (cc *ContainerController) DeleteContainer(c *gin.Context) {
	id, err := strconv.ParseUint(c.Param("id"), 10, 32)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"code": 400, "message": "无效的容器ID"})
		return
	}

	if err := cc.ContainerService.DeleteContainer(uint(id)); err != nil {
		logrus.Errorf("删除容器失败: %v", err)
		c.JSON(http.StatusInternalServerError, gin.H{"code": 500, "message": "服务器内部错误"})
		return
	}

	c.JSON(http.StatusOK, gin.H{"code": 200, "message": "删除容器成功"})
}

// GetContainerVersions 获取容器的所有版本
func (cc *ContainerController) GetContainerVersions(c *gin.Context) {
	id, err := strconv.ParseUint(c.Param("id"), 10, 32)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"code": 400, "message": "无效的容器ID"})
		return
	}

	versions, err := cc.ContainerService.GetContainerVersions(uint(id))
	if err != nil {
		logrus.Errorf("获取容器版本列表失败: %v", err)
		c.JSON(http.StatusInternalServerError, gin.H{"code": 500, "message": "服务器内部错误"})
		return
	}

	c.JSON(http.StatusOK, gin.H{"code": 200, "message": "获取容器版本列表成功", "data": gin.H{"versions": versions}})
}

// GetContainersByServiceID 根据服务ID获取容器列表
func (cc *ContainerController) GetContainersByServiceID(c *gin.Context) {
	serviceID, err := strconv.ParseUint(c.Param("service_id"), 10, 32)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"code": 400, "message": "无效的服务ID"})
		return
	}

	containers, err := cc.ContainerService.GetContainersByServiceID(uint(serviceID))
	if err != nil {
		logrus.Errorf("获取服务关联的容器列表失败: %v", err)
		c.JSON(http.StatusInternalServerError, gin.H{"code": 500, "message": "服务器内部错误"})
		return
	}

	c.JSON(http.StatusOK, gin.H{"code": 200, "message": "获取服务关联的容器列表成功", "data": gin.H{"containers": containers}})
}

// GetContainersVersionsByServiceID 根据服务ID获取容器版本列表
func (cc *ContainerController) GetContainersVersionsByServiceID(c *gin.Context) {
	serviceID, err := strconv.ParseUint(c.Param("service_id"), 10, 32)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"code": 400, "message": "无效的服务ID"})
		return
	}

	containers, err := cc.ContainerService.GetContainersVersionsByServiceID(uint(serviceID))
	if err != nil {
		logrus.Errorf("获取服务关联的容器列表失败: %v", err)
		c.JSON(http.StatusInternalServerError, gin.H{"code": 500, "message": "服务器内部错误"})
		return
	}

	c.JSON(http.StatusOK, gin.H{"code": 200, "message": "获取服务关联的容器列表成功", "data": gin.H{"containers": containers}})
}

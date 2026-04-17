package controllers

import (
	"net/http"
	"strconv"
	"time"

	"github.com/gin-gonic/gin"
	"github.com/mgface/exchange-auto-godeep/models"
	"github.com/mgface/exchange-auto-godeep/service"
	"github.com/sirupsen/logrus"
)

type ServiceController struct {
	AppService service.AppService
}

func NewServiceController(appService service.AppService) *ServiceController {
	return &ServiceController{AppService: appService}
}

// ServiceRequest 服务请求
type ServiceRequest struct {
	Name        string `json:"name" binding:"required"`
	GitUrl      string `json:"gitUrl" binding:"required"`
	Category    string `json:"category" binding:"required"`
	SubCategory string `json:"subCategory" binding:"required"`
	Remark      string `json:"remark"`
}

// GetServiceList 获取服务列表
func (sc *ServiceController) GetServiceList(c *gin.Context) {
	page, _ := strconv.Atoi(c.DefaultQuery("page", "1"))
	pageSize, _ := strconv.Atoi(c.DefaultQuery("page_size", "10"))

	query := make(map[string]interface{})
	if name := c.Query("name"); name != "" {
		query["name"] = name
	}
	if category := c.Query("category"); category != "" {
		query["category"] = category
	}
	if subCategory := c.Query("subCategory"); subCategory != "" {
		query["subCategory"] = subCategory
	}
	if status := c.Query("status"); status != "" {
		query["status"] = status
	}

	services, total, err := sc.AppService.ListServices(page, pageSize, query)
	if err != nil {
		logrus.Errorf("获取服务列表失败: %v", err)
		c.JSON(http.StatusInternalServerError, gin.H{"code": 500, "message": "服务器内部错误"})
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"code":    200,
		"message": "获取服务列表成功",
		"data":    gin.H{"total": total, "services": services},
	})
}

// GetServiceDetail 获取服务详情
func (sc *ServiceController) GetServiceDetail(c *gin.Context) {
	id, err := strconv.ParseUint(c.Param("id"), 10, 32)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"code": 400, "message": "无效的服务ID"})
		return
	}

	service, err := sc.AppService.GetServiceByID(uint(id))
	if err != nil {
		c.JSON(http.StatusNotFound, gin.H{"code": 404, "message": "服务不存在"})
		return
	}

	c.JSON(http.StatusOK, gin.H{"code": 200, "message": "获取服务详情成功", "data": service})
}

// AddService 添加服务
func (sc *ServiceController) AddService(c *gin.Context) {
	var req ServiceRequest
	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"code": 400, "message": "请求参数错误"})
		return
	}

	service := &models.Service{
		Name:        req.Name,
		GitUrl:      req.GitUrl,
		Category:    req.Category,
		SubCategory: req.SubCategory,
		Remark:      req.Remark,
	}

	if err := sc.AppService.CreateService(service); err != nil {
		logrus.Errorf("创建服务失败: %v", err)
		c.JSON(http.StatusInternalServerError, gin.H{"code": 500, "message": "服务器内部错误"})
		return
	}

	c.JSON(http.StatusOK, gin.H{"code": 200, "message": "添加服务成功", "data": service})
}

// UpdateService 更新服务
func (sc *ServiceController) UpdateService(c *gin.Context) {
	id, err := strconv.ParseUint(c.Param("id"), 10, 32)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"code": 400, "message": "无效的服务ID"})
		return
	}

	var req ServiceRequest
	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"code": 400, "message": "请求参数错误"})
		return
	}

	service := &models.Service{
		Name:        req.Name,
		GitUrl:      req.GitUrl,
		Category:    req.Category,
		SubCategory: req.SubCategory,
		Remark:      req.Remark,
		CreatedAt:   time.Now(),
	}

	if err := sc.AppService.UpdateService(uint(id), service); err != nil {
		logrus.Errorf("更新服务失败: %v", err)
		c.JSON(http.StatusInternalServerError, gin.H{"code": 500, "message": "服务器内部错误"})
		return
	}

	c.JSON(http.StatusOK, gin.H{"code": 200, "message": "更新服务成功", "data": service})
}

// DeleteService 删除服务
func (sc *ServiceController) DeleteService(c *gin.Context) {
	id, err := strconv.ParseUint(c.Param("id"), 10, 64)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"code": 400, "message": "无效的服务ID"})
		return
	}

	if err := sc.AppService.DeleteService(uint(id)); err != nil {
		logrus.Errorf("删除服务失败: %v", err)
		c.JSON(http.StatusInternalServerError, gin.H{"code": 500, "message": "服务器内部错误"})
		return
	}

	c.JSON(http.StatusOK, gin.H{"code": 200, "message": "删除服务成功"})
}

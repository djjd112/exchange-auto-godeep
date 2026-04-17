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

type FileController struct {
	FileService service.FileService
}

func NewFileController(fileService service.FileService) *FileController {
	return &FileController{FileService: fileService}
}

// FileRequest 文件请求
type FileRequest struct {
	Name        string `json:"name" binding:"required"`
	Content     string `json:"content"`
	ServiceName string `json:"service_name" binding:"required"`
	ServiceID   uint   `json:"service_id" binding:"required"`
	CreatedBy   uint   `json:"created_by"`
}

// GetFileList 获取文件列表
func (fc *FileController) GetFileList(c *gin.Context) {
	page, _ := strconv.Atoi(c.DefaultQuery("page", "1"))
	pageSize, _ := strconv.Atoi(c.DefaultQuery("page_size", "10"))

	query := make(map[string]interface{})
	if name := c.Query("name"); name != "" {
		query["name"] = name
	}
	if createdBy := c.Query("created_by"); createdBy != "" {
		id, err := strconv.ParseUint(createdBy, 10, 64)
		if err == nil {
			query["created_by"] = uint(id)
		}
	}

	files, total, err := fc.FileService.ListFiles(page, pageSize, query)
	if err != nil {
		logrus.Errorf("获取文件列表失败: %v", err)
		c.JSON(http.StatusInternalServerError, gin.H{"code": 500, "message": "服务器内部错误"})
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"code":    200,
		"message": "获取文件列表成功",
		"data":    gin.H{"total": total, "files": files},
	})
}

// GetFileDetail 获取文件详情
func (fc *FileController) GetFileDetail(c *gin.Context) {
	id, err := strconv.ParseUint(c.Param("id"), 10, 32)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"code": 400, "message": "无效的文件ID"})
		return
	}

	file, err := fc.FileService.GetFileByID(uint(id))
	if err != nil {
		c.JSON(http.StatusNotFound, gin.H{"code": 404, "message": "文件不存在"})
		return
	}

	c.JSON(http.StatusOK, gin.H{"code": 200, "message": "获取文件详情成功", "data": file})
}

// AddFile 添加文件
func (fc *FileController) AddFile(c *gin.Context) {
	var req FileRequest
	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"code": 400, "message": "请求参数错误"})
		return
	}

	file := &models.File{
		Name:        req.Name,
		Content:     req.Content,
		CreatedAt:   time.Now(),
		ServiceName: req.ServiceName,
		ServiceID:   req.ServiceID,
	}

	if err := fc.FileService.CreateFile(file); err != nil {
		logrus.Errorf("创建文件失败: %v", err)
		c.JSON(http.StatusInternalServerError, gin.H{"code": 500, "message": "服务器内部错误"})
		return
	}

	c.JSON(http.StatusOK, gin.H{"code": 200, "message": "添加文件成功", "data": file})
}

// UpdateFile 更新文件
func (fc *FileController) UpdateFile(c *gin.Context) {
	id, err := strconv.ParseUint(c.Param("id"), 10, 32)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"code": 400, "message": "无效的文件ID"})
		return
	}

	var req FileRequest
	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"code": 400, "message": "请求参数错误"})
		return
	}

	file := &models.File{
		Name:        req.Name,
		Content:     req.Content,
		ServiceName: req.ServiceName,
		ServiceID:   req.ServiceID,
		CreatedAt:   time.Now(),
		UpdatedAt:   time.Now(),
	}

	if err := fc.FileService.UpdateFile(uint(id), file); err != nil {
		logrus.Errorf("更新文件失败: %v", err)
		c.JSON(http.StatusInternalServerError, gin.H{"code": 500, "message": "服务器内部错误"})
		return
	}

	c.JSON(http.StatusOK, gin.H{"code": 200, "message": "更新文件成功", "data": file})
}

// DeleteFile 删除文件
func (fc *FileController) DeleteFile(c *gin.Context) {
	id, err := strconv.ParseUint(c.Param("id"), 10, 32)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"code": 400, "message": "无效的文件ID"})
		return
	}

	if err := fc.FileService.DeleteFile(uint(id)); err != nil {
		logrus.Errorf("删除文件失败: %v", err)
		c.JSON(http.StatusInternalServerError, gin.H{"code": 500, "message": "服务器内部错误"})
		return
	}

	c.JSON(http.StatusOK, gin.H{"code": 200, "message": "删除文件成功"})
}

// GetFilesByServiceID 根据服务ID获取文件列表
func (fc *FileController) GetFilesByServiceID(c *gin.Context) {
	serviceID, err := strconv.ParseUint(c.Param("service_id"), 10, 32)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"code": 400, "message": "无效的服务ID"})
		return
	}

	files, err := fc.FileService.GetFilesByServiceID(uint(serviceID))
	if err != nil {
		logrus.Errorf("获取服务关联的文件列表失败: %v", err)
		c.JSON(http.StatusInternalServerError, gin.H{"code": 500, "message": "服务器内部错误"})
		return
	}

	c.JSON(http.StatusOK, gin.H{"code": 200, "message": "获取服务关联的文件列表成功", "data": gin.H{"files": files}})
}

// SendFile 发送文件到服务器
func (fc *FileController) SendFile(c *gin.Context) {
	var req models.SendFileRequest
	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"code": 400, "message": "请求参数错误"})
		return
	}

	filePath, err := fc.FileService.SendFile(&req)
	if err != nil {
		logrus.Errorf("文件发送失败: %v", err)
		c.JSON(http.StatusInternalServerError, gin.H{"code": 500, "message": "文件发送失败"})
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"code":    200,
		"message": "文件发送成功",
		"data": gin.H{
			"file_id":   req.FileID,
			"server_id": req.ServerID,
			"directory": req.Directory,
			"file_path": filePath,
		},
	})
}

// ValidateYamlRequest YAML验证请求
type ValidateYamlRequest struct {
	Content string `json:"content" binding:"required"`
}

// ValidateYaml 验证YAML格式
func (fc *FileController) ValidateYaml(c *gin.Context) {
	var req ValidateYamlRequest
	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"code": 400, "message": "请求参数错误"})
		return
	}

	if err := fc.FileService.ValidateYaml(req.Content); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"code": 400, "message": err.Error(), "valid": false})
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"code":    200,
		"message": "YAML格式验证通过",
		"data":    gin.H{"valid": true},
	})
}

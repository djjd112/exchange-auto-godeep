package models

import (
	"time"
)

// File 文件模型
type File struct {
	ID          uint64    `gorm:"primary_key" json:"id"`
	CreatedAt   time.Time `json:"created_at"`
	UpdatedAt   time.Time `json:"updated_at"`
	Name        string    `gorm:"size:100;not null" json:"name"`
	Content     string    `gorm:"type:text" json:"content"`
	ServiceID   uint      `json:"service_id"`
	ServiceName string    `gorm:"size:100" json:"service_name"`
}

// SendFileRequest 发送文件请求
type SendFileRequest struct {
	FileID    uint   `json:"file_id" binding:"required"`
	ServerID  uint   `json:"server_id" binding:"required"`
	Directory string `json:"directory" binding:"required"`
	Version   string `json:"version"`
}

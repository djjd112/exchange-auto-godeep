package models

import "time"

// Container 容器模型
type Container struct {
	ID          uint64    `gorm:"primary_key" json:"id"`
	CreatedAt   time.Time `json:"created_at"`
	UpdatedAt   time.Time `json:"updated_at"`
	Name        string    `gorm:"size:100;not null" json:"name"`
	Address     string    `gorm:"size:100;not null" json:"address"`
	ServiceName string    `gorm:"size:100;not null" json:"service_name"`
	MD5         string    `gorm:"size:32" json:"md5"`
	Version     string    `gorm:"size:20" json:"version"`
	ServiceID   uint      `json:"service_id"`
}

// BuildNotification 镜像构建通知
type BuildNotification struct {
	Version   string `json:"version" binding:"required"`
	Address   string `json:"address" binding:"required"`
	Md5       string `json:"md5" binding:"required"`
	Name      string `json:"name" binding:"required"`
	ServiceId uint   `json:"service_id" binding:"required"`
}

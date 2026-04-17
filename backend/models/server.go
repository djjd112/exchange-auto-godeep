package models

import (
	"time"
)

// Server 服务器模型
type Server struct {
	ID         uint64     `gorm:"primary_key" json:"id"`
	CreatedAt  time.Time  `json:"created_at"`
	UpdatedAt  time.Time  `json:"updated_at"`
	ExpireTime *time.Time `json:"expire_time" gorm:"column:expire_time;comment:到期时间"`
	IP         string     `gorm:"size:50;not null" json:"ip"`
	Name       string     `gorm:"size:100;not null" json:"name"`
	Password   string     `gorm:"size:100;not null" json:"-"`
	Remark     string     `gorm:"size:500" json:"remark"`
	Status     bool       `gorm:"default:false" json:"status"` // 在线状态
	LastPing   time.Time  `json:"last_ping"`
}

// ServerStatus 服务器状态信息
type ServerStatus struct {
	ID           uint64  `json:"id"`
	IP           string  `json:"ip"`
	Name         string  `json:"name"`
	Status       bool    `json:"status"`
	CPUUsage     float64 `json:"cpu_usage"`
	MemoryUsage  float64 `json:"memory_usage"`
	DiskUsage    float64 `json:"disk_usage"`
	NetworkSpeed string  `json:"network_speed"`
	Uptime       string  `json:"uptime"`
	Processes    int     `json:"processes"`
}

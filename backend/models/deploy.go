package models

import (
	"time"
)

// Deploy 部署模型
type Deploy struct {
	ID            uint      `json:"id" gorm:"primaryKey"`
	ServiceID     uint      `json:"serviceId" gorm:"column:service_id;not null;comment:服务ID"`
	ServiceName   string    `json:"serviceName" gorm:"column:service_name;not null;comment:服务名称"`
	ContainerID   uint      `json:"containerId" gorm:"column:container_id;not null;comment:容器ID"`
	ContainerName string    `json:"containerName" gorm:"column:container_name;not null;comment:容器名称"`
	FileID        uint      `json:"fileId" gorm:"column:file_id;comment:文件ID"`
	FileName      string    `json:"fileName" gorm:"column:file_name;comment:文件名称"`
	ServerID      uint      `json:"serverId" gorm:"column:server_id;comment:服务器ID"`
	ServerName    string    `json:"serverName" gorm:"column:server_name;comment:服务器名称"`
	Version       string    `json:"version" gorm:"column:version;not null;comment:版本号"`
	Status        string    `json:"status" gorm:"column:status;not null;default:pending;comment:状态：pending-待部署，deploying-部署中，success-部署成功，failed-部署失败，canceled-已取消"`
	Remark        string    `json:"remark" gorm:"column:remark;comment:备注"`
	CreateTime    time.Time `json:"createTime" gorm:"column:create_time;not null;autoCreateTime;comment:创建时间"`
	DeployTime    time.Time `json:"deployTime" gorm:"column:deploy_time;comment:部署时间"`
}

// DeployLog 部署日志模型
type DeployLog struct {
	ID         uint      `json:"id" gorm:"primaryKey"`
	DeployID   uint      `json:"deployId" gorm:"column:deploy_id;not null;comment:部署ID"`
	Content    string    `json:"content" gorm:"column:content;not null;comment:日志内容"`
	CreateTime time.Time `json:"createTime" gorm:"column:create_time;not null;autoCreateTime;comment:创建时间"`
}

// TableName 设置Deploy表名
func (Deploy) TableName() string {
	return "deploys"
}

// TableName 设置DeployLog表名
func (DeployLog) TableName() string {
	return "deploy_logs"
}

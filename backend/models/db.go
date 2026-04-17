package models

import (
	"fmt"
	logx "github.com/mgface2022/mgface-alert-public/com.mgface.alert/logger"
	"gorm.io/driver/mysql"
	"gorm.io/gorm/logger"
	"gorm.io/gorm/schema"
	"log"
	"os"
	"time"

	"github.com/mgface/exchange-auto-godeep/config"
	"gorm.io/gorm"
)

var DB *gorm.DB

// InitDB 初始化数据库连接池
func InitDB(dbConfig config.Config) error {
	// 添加日志配置
	newLogger := logger.New(
		log.New(os.Stdout, "\r\n", log.LstdFlags), // io writer
		logger.Config{
			SlowThreshold:             time.Second, // 慢 SQL 阈值
			LogLevel:                  logger.Info, // 日志级别
			IgnoreRecordNotFoundError: true,        // 忽略ErrRecordNotFound错误
			Colorful:                  true,        // 启用彩色打印
		},
	)
	// 构建数据库连接字符串
	dsn := fmt.Sprintf("%s:%s@tcp(%s:%d)/%s?charset=utf8mb4&parseTime=True&loc=Local",
		dbConfig.DBUser,
		dbConfig.DBPassword,
		dbConfig.DBHost,
		dbConfig.DBPort,
		dbConfig.DBName)

	// 配置GORM
	DB, _ = gorm.Open(mysql.Open(dsn), &gorm.Config{
		Logger: newLogger, // 使用自定义Logger
		NamingStrategy: schema.NamingStrategy{
			//SingularTable: true, // 禁用复数表名
		},
	})

	// 自动迁移表结构
	//migrateDB()

	logx.GetLogger().Info("数据库连接成功")

	return nil
}

// CloseDB 关闭数据库连接
func CloseDB() error {
	if DB != nil {
		sqlDB, err := DB.DB()
		if err != nil {
			return err
		}
		return sqlDB.Close()
	}
	return nil
}

// migrateDB 自动迁移表结构
func migrateDB() {
	err := DB.AutoMigrate(
		&User{},
		&Server{},
		&Container{},
		&File{},
		&Service{},
	)
	if err != nil {
		return
	}
	logx.GetLogger().Info("数据库表结构迁移完成")
}

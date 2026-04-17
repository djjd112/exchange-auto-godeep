package main

import (
	"fmt"
	"os"

	"github.com/mgface/exchange-auto-godeep/api"
	"github.com/mgface/exchange-auto-godeep/config"
	"github.com/mgface/exchange-auto-godeep/models"
	"github.com/mgface/exchange-auto-godeep/repository"
	"github.com/mgface/exchange-auto-godeep/service"
	"github.com/mgface2022/mgface-alert-public/com.mgface.alert/logger"
	"go.uber.org/zap/zapcore"
)

func main() {
	// 初始化日志
	logger.InitLogger(zapcore.InfoLevel)
	log := logger.GetLogger()
	log.Sugar().Info("启动自动化运维平台后端服务...")

	// 加载配置
	cfg, err := config.LoadConfig()
	if err != nil {
		log.Sugar().Fatalf("加载配置失败: %v", err)
	}

	// 初始化数据库连接
	if err := models.InitDB(cfg); err != nil {
		log.Sugar().Fatalf("初始化数据库连接: %v", err)
	}
	defer models.CloseDB()

	// 初始化 repository 和 service
	userRepository := repository.NewUserRepository(models.DB)
	userService := service.NewUserService(userRepository)
	serverRepository := repository.NewServerRepository(models.DB)
	serverService := service.NewServerService(serverRepository)
	containerRepository := repository.NewContainerRepository(models.DB)
	containerService := service.NewContainerService(containerRepository)
	fileRepository := repository.NewFileRepository(models.DB)
	fileService := service.NewFileService(fileRepository, serverRepository)
	serviceRepository := repository.NewServiceRepository(models.DB)
	appService := service.NewAppService(serviceRepository)
	deployRepository := repository.NewDeployRepository(models.DB)
	deployService := service.NewDeployService(deployRepository)

	// 设置路由
	r := api.SetupRouter(userService, serverService, containerService, fileService, appService, deployService)

	// 启动服务
	port := os.Getenv("PORT")
	if port == "" {
		port = "8080"
	}
	//client := utils.NewEurekaClient(
	//	"https://admin:xiang5326865@eureka.mgface.com/eureka/", // 带账号密码的 Eureka 地址
	//	"exchange-auto-godeep",                                 // 服务名
	//	18080,                                                  // 端口
	//	map[string]interface{}{
	//		"VERSION": "1.0.0",
	//		"ZONE":    "shanghai",
	//	},
	//)
	//
	//client.Start()

	log.Sugar().Infof("服务启动在 http://localhost:%s", port)
	if err := r.Run(fmt.Sprintf(":%s", port)); err != nil {
		log.Sugar().Fatalf("启动服务失败: %v", err)
	}
}

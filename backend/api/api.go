package api

import (
	"github.com/gin-gonic/gin"
	"github.com/mgface/exchange-auto-godeep/controllers"
	"github.com/mgface/exchange-auto-godeep/middleware"
	"github.com/mgface/exchange-auto-godeep/service"
)

// SetupRouter 设置路由
func SetupRouter(userService service.UserService, serverService service.ServerService, containerService service.ContainerService, fileService service.FileService, appService service.AppService, deployService service.DeployService) *gin.Engine {
	r := gin.Default()
	// 跨域中间件
	r.Use(middleware.Cors())

	// 初始化 Controller
	userController := controllers.NewUserController(userService)
	serverController := controllers.NewServerController(serverService, userService)
	containerController := controllers.NewContainerController(containerService)
	fileController := controllers.NewFileController(fileService)
	serviceController := controllers.NewServiceController(appService)
	deployController := controllers.NewDeployController(deployService)

	// 健康检查
	r.GET("/health", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"status": "ok",
		})
	})

	r.GET("/info", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"status": "ok",
		})
	})
	ws := r.Group("/ws_backend")
	{
		// 服务器相关路由
		server := ws.Group("/server")
		{
			// WebSocket终端连接
			server.GET("/terminal/:id", serverController.TerminalHandler)
		}
	}
	// API路由组
	api := r.Group("/api")
	{
		notify := api.Group("/notify")
		{
			notify.POST("", containerController.NotifyFromGithub)
		}
		// 用户相关路由
		user := api.Group("/user")
		{
			user.POST("/login", userController.Login)
			user.POST("/verify-2fa", userController.VerifyTwoFactor)
			user.GET("/info", middleware.JWTAuth(userService), userController.GetUserInfo)
			user.POST("/logout", middleware.JWTAuth(userService), userController.Logout)
			user.POST("/register", userController.RegisterUser)
			user.PUT("/update", middleware.JWTAuth(userService), userController.UpdateUser)
			user.DELETE("/delete/:id", middleware.JWTAuth(userService), userController.DeleteUser)
			user.GET("/list", middleware.JWTAuth(userService), userController.GetUserList)
		}

		// 服务器相关路由
		server := api.Group("/server")
		{
			server.GET("/list", middleware.JWTAuth(userService), serverController.GetServerList)
			server.GET("/detail/:id", middleware.JWTAuth(userService), serverController.GetServerDetail)
			server.POST("/add", middleware.JWTAuth(userService), serverController.AddServer)
			server.PUT("/update/:id", middleware.JWTAuth(userService), serverController.UpdateServer)
			server.DELETE("/delete/:id", middleware.JWTAuth(userService), serverController.DeleteServer)
			server.POST("/connect/:id", middleware.JWTAuth(userService), serverController.ConnectServer)
			server.GET("/status/:id", middleware.JWTAuth(userService), serverController.GetServerStatus)
		}

		// 容器相关路由
		container := api.Group("/container")
		{
			container.GET("/list", middleware.JWTAuth(userService), containerController.GetContainerList)
			container.GET("/detail/:id", middleware.JWTAuth(userService), containerController.GetContainerDetail)
			container.POST("/add", middleware.JWTAuth(userService), containerController.AddContainer)
			container.PUT("/update/:id", middleware.JWTAuth(userService), containerController.UpdateContainer)
			container.DELETE("/delete/:id", middleware.JWTAuth(userService), containerController.DeleteContainer)
			container.GET("/versions/:id", middleware.JWTAuth(userService), containerController.GetContainerVersions)
			container.GET("/by-service/:service_id", middleware.JWTAuth(userService), containerController.GetContainersByServiceID)
			container.GET("/version-by-service/:service_id", middleware.JWTAuth(userService), containerController.GetContainersVersionsByServiceID)
		}

		// 文件相关路由
		file := api.Group("/file")
		{
			file.GET("/list", middleware.JWTAuth(userService), fileController.GetFileList)
			file.GET("/detail/:id", middleware.JWTAuth(userService), fileController.GetFileDetail)
			file.POST("/add", middleware.JWTAuth(userService), fileController.AddFile)
			file.PUT("/update/:id", middleware.JWTAuth(userService), fileController.UpdateFile)
			file.DELETE("/delete/:id", middleware.JWTAuth(userService), fileController.DeleteFile)
			file.POST("/send", middleware.JWTAuth(userService), fileController.SendFile)
			file.POST("/validate-yaml", middleware.JWTAuth(userService), fileController.ValidateYaml)
			file.GET("/by-service/:service_id", middleware.JWTAuth(userService), fileController.GetFilesByServiceID)
		}

		// 服务相关路由
		appServiceRoutes := api.Group("/service")
		{
			appServiceRoutes.GET("/list", middleware.JWTAuth(userService), serviceController.GetServiceList)
			appServiceRoutes.GET("/detail/:id", middleware.JWTAuth(userService), serviceController.GetServiceDetail)
			appServiceRoutes.POST("/add", middleware.JWTAuth(userService), serviceController.AddService)
			appServiceRoutes.PUT("/update/:id", middleware.JWTAuth(userService), serviceController.UpdateService)
			appServiceRoutes.DELETE("/delete/:id", middleware.JWTAuth(userService), serviceController.DeleteService)
		}

		// 部署相关路由
		deploy := api.Group("/deploy")
		{
			deploy.GET("/list", middleware.JWTAuth(userService), deployController.GetDeployList)
			deploy.GET("/detail/:id", middleware.JWTAuth(userService), deployController.GetDeployDetail)
			deploy.POST("/create", middleware.JWTAuth(userService), deployController.CreateDeploy)
			deploy.POST("/execute/:id", middleware.JWTAuth(userService), deployController.ExecuteDeploy)
			deploy.GET("/logs/:id", middleware.JWTAuth(userService), deployController.GetDeployLogs)
			deploy.POST("/test/:id", middleware.JWTAuth(userService), deployController.TestDeploy)
		}
	}

	return r
}

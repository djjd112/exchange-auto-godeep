package config

import (
	"os"
	"strconv"

	"github.com/joho/godotenv"
	"github.com/sirupsen/logrus"
)

// Config 应用程序配置
type Config struct {
	Port       int
	DBHost     string
	DBPort     int
	DBUser     string
	DBPassword string
	DBName     string
	JWTSecret  string
	LogLevel   string
}

var AppConfig Config

// LoadConfig 从环境变量加载配置
func LoadConfig() (Config, error) {
	// 加载.env文件
	err := godotenv.Load()
	if err != nil {
		logrus.Warning("未找到.env文件，将使用环境变量")
	}

	// 设置默认值
	appConfig := Config{
		Port:       8080,
		DBHost:     "middleware.soeasyex.com",
		DBPort:     3306,
		DBUser:     "root",
		DBPassword: "milliondao123456",
		DBName:     "exchange_auto",
		JWTSecret:  "exchange_auto_secret_key",
		LogLevel:   "debug",
	}

	AppConfig = appConfig

	// 从环境变量覆盖默认值
	if port, err := strconv.Atoi(os.Getenv("PORT")); err == nil {
		appConfig.Port = port
	}

	if dbHost := os.Getenv("DB_HOST"); dbHost != "" {
		appConfig.DBHost = dbHost
	}

	if dbPort, err := strconv.Atoi(os.Getenv("DB_PORT")); err == nil {
		appConfig.DBPort = dbPort
	}

	if dbUser := os.Getenv("DB_USER"); dbUser != "" {
		appConfig.DBUser = dbUser
	}

	if dbPassword := os.Getenv("DB_PASSWORD"); dbPassword != "" {
		appConfig.DBPassword = dbPassword
	}

	if dbName := os.Getenv("DB_NAME"); dbName != "" {
		appConfig.DBName = dbName
	}

	if jwtSecret := os.Getenv("JWT_SECRET"); jwtSecret != "" {
		appConfig.JWTSecret = jwtSecret
	}

	if logLevel := os.Getenv("LOG_LEVEL"); logLevel != "" {
		appConfig.LogLevel = logLevel
	}

	// 设置日志级别
	level, err := logrus.ParseLevel(appConfig.LogLevel)
	if err != nil {
		logrus.SetLevel(logrus.InfoLevel)
	} else {
		logrus.SetLevel(level)
	}

	logrus.Info("配置加载完成")
	return appConfig, nil
}

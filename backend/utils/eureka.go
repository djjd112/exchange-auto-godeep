package utils

import (
	"fmt"
	eureka "github.com/xuanbo/eureka-client"
	"io"
	"log"
	"net/http"
)

type EurekaClient struct {
	client *eureka.Client
}

// getOutboundIP 获取宿主机对外 IP（避免写死 127.0.0.1）
func getOutboundIP() string {
	// 使用http.Get函数请求外部服务
	resp, err := http.Get("https://ipinfo.io/ip")
	if err != nil {
		fmt.Printf("请求失败: %s\n", err)
		return "127.0.0.1"
	}
	defer resp.Body.Close() // 确保关闭响应体

	// 读取响应体内容
	ip, err := io.ReadAll(resp.Body)
	if err != nil {
		fmt.Printf("读取响应失败: %s\n", err)
		return "127.0.0.1"
	}

	// 输出获取到的外网IP
	fmt.Printf("当前的外网IP是: %s\n", string(ip))
	return string(ip)
}

// NewEurekaClient 初始化并返回 EurekaClient
func NewEurekaClient(eurekaURL, appName string, port int, metadata map[string]interface{}) *EurekaClient {
	ip := getOutboundIP()

	client := eureka.NewClient(&eureka.Config{
		DefaultZone:           eurekaURL, // 例如 "http://admin:password@127.0.0.1:8761/eureka/"
		App:                   appName,
		Port:                  port,
		IP:                    ip,
		RenewalIntervalInSecs: 20, // 心跳间隔（秒）
		DurationInSecs:        30, // 租约有效期
		Metadata:              metadata,
	})

	return &EurekaClient{client: client}
}

// Start 启动客户端（注册 + 心跳）
func (ec *EurekaClient) Start() {
	ec.client.Start()
	log.Println("✅ 已注册到 Eureka 并启动心跳")
}

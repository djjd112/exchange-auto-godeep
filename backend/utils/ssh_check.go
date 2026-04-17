package utils

import (
	"fmt"
	"time"

	"golang.org/x/crypto/ssh"
)

// 最简单稳定版本
func CheckSSH(ip, password string) bool {
	config := &ssh.ClientConfig{
		User: "root", // ⚠️ 先写死，保证成功率
		Auth: []ssh.AuthMethod{
			ssh.Password(password),
		},
		HostKeyCallback: ssh.InsecureIgnoreHostKey(), // 必须
		Timeout:         5 * time.Second,
	}

	addr := fmt.Sprintf("%s:%d", ip, 22) // ⚠️ 写死22端口

	client, err := ssh.Dial("tcp", addr, config)
	if err != nil {
		fmt.Println("SSH失败:", err)
		return false
	}
	defer client.Close()

	return true
}

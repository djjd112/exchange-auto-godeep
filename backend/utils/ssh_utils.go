package utils

import (
	"encoding/json"
	"fmt"
	"golang.org/x/crypto/ssh"
	"io"
	"time"

	"github.com/gorilla/websocket"
	"github.com/sirupsen/logrus"
)

// TerminalMessage WebSocket消息结构
type TerminalMessage struct {
	Type string `json:"type"`
	Data string `json:"data,omitempty"`
	Cols int    `json:"cols,omitempty"`
	Rows int    `json:"rows,omitempty"`
}

// SendTerminalError 发送终端错误消息
func SendTerminalError(ws *websocket.Conn, errMsg string) {
	msg := TerminalMessage{
		Type: "output",
		Data: "\r\n\x1b[31m错误: " + errMsg + "\x1b[0m\r\n",
	}
	data, _ := json.Marshal(msg)
	ws.WriteMessage(websocket.TextMessage, data)
}

// ConnectSSH 连接SSH服务器
func ConnectSSH(ip, password string) (*ssh.Client, error) {
	// SSH配置
	config := &ssh.ClientConfig{
		User: "root", // 默认使用root用户，可以根据需要修改
		Auth: []ssh.AuthMethod{
			ssh.Password(password),
		},
		HostKeyCallback: ssh.InsecureIgnoreHostKey(),
		Timeout:         10 * time.Second,
	}

	// 连接SSH服务器
	client, err := ssh.Dial("tcp", ip+":22", config)
	if err != nil {
		return nil, err
	}

	return client, nil
}

// ExecuteSSHCommand 执行SSH命令
func ExecuteSSHCommand(client *ssh.Client, command string) error {
	session, err := client.NewSession()
	if err != nil {
		return err
	}
	defer session.Close()

	return session.Run(command)
}

// SendFileToServer 发送文件到服务器
func SendFileToServer(client *ssh.Client, content, filePath string) error {
	session, err := client.NewSession()
	if err != nil {
		return err
	}
	defer session.Close()

	// 使用cat命令和重定向将内容写入文件
	stdin, err := session.StdinPipe()
	if err != nil {
		return err
	}

	if err := session.Start(fmt.Sprintf("cat > %s", filePath)); err != nil {
		return err
	}

	// 写入文件内容
	if _, err := stdin.Write([]byte(content)); err != nil {
		return err
	}

	// 关闭标准输入，表示写入完成
	if err := stdin.Close(); err != nil {
		return err
	}

	// 等待命令执行完成
	return session.Wait()
}

// CopyOutput 将SSH输出复制到WebSocket
func CopyOutput(ws *websocket.Conn, r io.Reader) {
	buf := make([]byte, 8192)
	for {
		n, err := r.Read(buf)
		if err != nil {
			if err != io.EOF {
				logrus.Errorf("读取SSH输出失败: %v", err)
			}
			return
		}

		if n > 0 {
			msg := TerminalMessage{
				Type: "output",
				Data: string(buf[:n]),
			}
			data, err := json.Marshal(msg)
			if err != nil {
				logrus.Errorf("序列化消息失败: %v", err)
				continue
			}

			if err := ws.WriteMessage(websocket.TextMessage, data); err != nil {
				logrus.Errorf("发送WebSocket消息失败: %v", err)
				return
			}
		}
	}
}

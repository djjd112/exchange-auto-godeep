package service

import (
	"fmt"
	"net"
	"strings"
	"text/template"
	"time"

	"github.com/mgface/exchange-auto-godeep/models"
	"github.com/mgface/exchange-auto-godeep/repository"
	"github.com/mgface/exchange-auto-godeep/utils"
	"gopkg.in/yaml.v2"
)

type DeployService interface {
	ListDeploys(page, pageSize int, serviceID uint, status string) ([]models.Deploy, int64, error)
	GetDeployByID(id uint) (*models.Deploy, error)
	CreateDeploy(deploy *models.Deploy) error
	ExecuteDeploy(id uint) error
	GetDeployLogs(deployID uint) ([]models.DeployLog, error)
	TestDeploy(id uint) error
}

type deployService struct {
	deployRepo repository.DeployRepository
}

func NewDeployService(deployRepo repository.DeployRepository) DeployService {
	return &deployService{deployRepo: deployRepo}
}

func (s *deployService) ListDeploys(page, pageSize int, serviceID uint, status string) ([]models.Deploy, int64, error) {
	return s.deployRepo.List(page, pageSize, serviceID, status)
}

func (s *deployService) GetDeployByID(id uint) (*models.Deploy, error) {
	return s.deployRepo.FindByID(id)
}

func (s *deployService) CreateDeploy(deploy *models.Deploy) error {
	deploy.Status = "pending"
	deploy.DeployTime = time.Date(2006, time.January, 2, 15, 4, 5, 0, time.Local)
	return s.deployRepo.Create(deploy)
}

func (s *deployService) ExecuteDeploy(id uint) error {
	s.addDeployLog(id, "开始执行部署...")

	deploy, err := s.deployRepo.FindByID(id)
	if err != nil {
		s.addDeployLog(id, fmt.Sprintf("获取部署信息失败: %v", err))
		s.deployRepo.UpdateStatus(id, "failed")
		return err
	}

	if deploy.FileID == 0 || deploy.ServerID == 0 {
		err := fmt.Errorf("部署缺少文件或服务器信息")
		s.addDeployLog(id, err.Error())
		s.deployRepo.UpdateStatus(id, "failed")
		return err
	}

	s.deployRepo.UpdateStatus(id, "deploying")

	file, err := s.deployRepo.GetFileByID(deploy.FileID)
	if err != nil {
		s.addDeployLog(id, fmt.Sprintf("获取文件信息失败: %v", err))
		s.deployRepo.UpdateStatus(id, "failed")
		return err
	}

	server, err := s.deployRepo.GetServerByID(deploy.ServerID)
	if err != nil {
		s.addDeployLog(id, fmt.Sprintf("获取服务器信息失败: %v", err))
		s.deployRepo.UpdateStatus(id, "failed")
		return err
	}

	targetDir := "/root/deploys"
	s.addDeployLog(id, fmt.Sprintf("准备发送文件 %s 到服务器 %s(%s) 的 %s 目录", file.Name, server.Name, server.IP, targetDir))

	client, err := utils.ConnectSSH(server.IP, server.Password)
	if err != nil {
		s.addDeployLog(id, fmt.Sprintf("连接服务器失败: %v", err))
		s.deployRepo.UpdateStatus(id, "failed")
		return err
	}
	defer client.Close()

	err = utils.ExecuteSSHCommand(client, fmt.Sprintf("mkdir -p %s", targetDir))
	if err != nil {
		s.addDeployLog(id, fmt.Sprintf("创建目录失败: %v", err))
		s.deployRepo.UpdateStatus(id, "failed")
		return err
	}

	t := template.New("deploy")
	t, err = t.Parse(file.Content)
	if err != nil {
		s.addDeployLog(id, fmt.Sprintf("模板解析失败: %v", err))
		s.deployRepo.UpdateStatus(id, "failed")
		return err
	}

	data := struct{ Version string }{Version: deploy.Version}
	var builder strings.Builder
	err = t.Execute(&builder, data)
	if err != nil {
		s.addDeployLog(id, fmt.Sprintf("模板执行失败: %v", err))
		s.deployRepo.UpdateStatus(id, "failed")
		return err
	}
	result := builder.String()
	filePath := fmt.Sprintf("%s/%s", targetDir, file.Name)
	err = utils.SendFileToServer(client, result, filePath)
	if err != nil {
		s.addDeployLog(id, fmt.Sprintf("发送文件失败: %v", err))
		s.deployRepo.UpdateStatus(id, "failed")
		return err
	}
	s.addDeployLog(id, fmt.Sprintf("文件发送成功: %s", filePath))

	s.addDeployLog(id, "开始拉取镜像...")
	pullCmd := fmt.Sprintf("cd %s && docker-compose -f %s pull", targetDir, file.Name)
	err = utils.ExecuteSSHCommand(client, pullCmd)
	if err != nil {
		s.addDeployLog(id, fmt.Sprintf("拉取镜像失败: %v", err))
		s.deployRepo.UpdateStatus(id, "failed")
		return err
	}
	s.addDeployLog(id, "镜像拉取成功")

	s.addDeployLog(id, "开始启动容器...")
	upCmd := fmt.Sprintf("cd %s && docker-compose -f %s up -d", targetDir, file.Name)
	err = utils.ExecuteSSHCommand(client, upCmd)
	if err != nil {
		s.addDeployLog(id, fmt.Sprintf("启动容器失败: %v", err))
		s.deployRepo.UpdateStatus(id, "failed")
		return err
	}
	s.addDeployLog(id, "容器启动成功")

	deploy.Status = "success"
	deploy.DeployTime = time.Now()
	if err := s.deployRepo.Update(deploy); err != nil {
		s.addDeployLog(id, fmt.Sprintf("更新部署状态失败: %v", err))
		return err
	}

	s.addDeployLog(id, "部署完成")
	return nil
}

func (s *deployService) GetDeployLogs(deployID uint) ([]models.DeployLog, error) {
	return s.deployRepo.GetLogs(deployID)
}

func (s *deployService) TestDeploy(id uint) error {
	s.addDeployLog(id, "开始测试部署...")

	deploy, err := s.deployRepo.FindByID(id)
	if err != nil {
		return fmt.Errorf("获取部署信息失败: %v", err)
	}

	server, err := s.deployRepo.GetServerByID(deploy.ServerID)
	if err != nil {
		return fmt.Errorf("获取服务器信息失败: %v", err)
	}

	file, err := s.deployRepo.GetFileByID(deploy.FileID)
	if err != nil {
		return fmt.Errorf("获取部署文件失败: %v", err)
	}

	var yamlData map[interface{}]interface{}
	if err := yaml.Unmarshal([]byte(file.Content), &yamlData); err != nil {
		return fmt.Errorf("解析YAML文件失败: %v", err)
	}

	ports, ok := s.extractYAMLValue(yamlData, "ports").([]interface{})
	if !ok || len(ports) == 0 {
		return fmt.Errorf("无法从YAML文件中提取端口信息")
	}

	for _, port := range ports {
		portStr := port.(string)
		portParts := strings.Split(portStr, ":")
		if len(portParts) > 0 {
			port = portParts[0]
		}
		address := fmt.Sprintf("%s:%s", server.IP, port)
		conn, err := net.DialTimeout("tcp", address, 5*time.Second)
		if err != nil {
			s.addDeployLog(id, "测试端口连接:"+address+" 失败")
			return fmt.Errorf("端口连接失败: %v", err)
		}
		conn.Close()
		s.addDeployLog(id, "测试端口连接:"+address+" 成功")
	}

	s.deployRepo.UpdateStatus(id, "success")
	s.addDeployLog(id, "测试部署完成")
	return nil
}

func (s *deployService) addDeployLog(deployID uint, content string) {
	log := &models.DeployLog{
		DeployID: deployID,
		Content:  content,
	}
	s.deployRepo.CreateLog(log)
}

func (s *deployService) extractYAMLValue(data map[interface{}]interface{}, key string) interface{} {
	if val, exists := data[key]; exists {
		return val
	}

	for _, v := range data {
		if nestedMap, ok := v.(map[interface{}]interface{}); ok {
			if val := s.extractYAMLValue(nestedMap, key); val != nil {
				return val
			}
		}
	}
	return nil
}

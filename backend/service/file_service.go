package service

import (
	"fmt"
	"strings"
	"text/template"
	"time"

	"github.com/mgface/exchange-auto-godeep/models"
	"github.com/mgface/exchange-auto-godeep/repository"
	"golang.org/x/crypto/ssh"
	"gopkg.in/yaml.v2"
)

type FileService interface {
	ListFiles(page, pageSize int, query map[string]interface{}) ([]models.File, int64, error)
	GetFileByID(id uint) (*models.File, error)
	CreateFile(file *models.File) error
	UpdateFile(id uint, file *models.File) error
	DeleteFile(id uint) error
	GetFilesByServiceID(serviceID uint) ([]models.File, error)
	SendFile(req *models.SendFileRequest) (string, error)
	ValidateYaml(content string) error
}

type fileService struct {
	fileRepo   repository.FileRepository
	serverRepo repository.ServerRepository
}

func NewFileService(fileRepo repository.FileRepository, serverRepo repository.ServerRepository) FileService {
	return &fileService{fileRepo: fileRepo, serverRepo: serverRepo}
}

func (s *fileService) ListFiles(page, pageSize int, query map[string]interface{}) ([]models.File, int64, error) {
	return s.fileRepo.List(page, pageSize, query)
}

func (s *fileService) GetFileByID(id uint) (*models.File, error) {
	return s.fileRepo.FindByID(id)
}

func (s *fileService) CreateFile(file *models.File) error {
	return s.fileRepo.Create(file)
}

func (s *fileService) UpdateFile(id uint, file *models.File) error {
	_, err := s.fileRepo.FindByID(id)
	if err != nil {
		return err
	}
	file.ID = uint64(id)
	return s.fileRepo.Update(file)
}

func (s *fileService) DeleteFile(id uint) error {
	return s.fileRepo.Delete(id)
}

func (s *fileService) GetFilesByServiceID(serviceID uint) ([]models.File, error) {
	return s.fileRepo.GetByServiceID(serviceID)
}

func (s *fileService) SendFile(req *models.SendFileRequest) (string, error) {
	file, err := s.fileRepo.FindByID(req.FileID)
	if err != nil {
		return "", err
	}

	server, err := s.serverRepo.FindByID(req.ServerID)
	if err != nil {
		return "", err
	}

	client, err := s.connectSSH(server)
	if err != nil {
		return "", err
	}
	defer client.Close()

	session, err := client.NewSession()
	if err != nil {
		return "", err
	}
	defer session.Close()

	mkdirCmd := fmt.Sprintf("mkdir -p %s", req.Directory)
	if err := session.Run(mkdirCmd); err != nil {
		return "", err
	}
	session.Close() // Close session after mkdir

	session, err = client.NewSession()
	if err != nil {
		return "", err
	}
	defer session.Close()

	filePath := fmt.Sprintf("%s/%s", req.Directory, file.Name)
	stdin, err := session.StdinPipe()
	if err != nil {
		return "", err
	}

	if err := session.Start(fmt.Sprintf("cat > %s", filePath)); err != nil {
		return "", err
	}

	var result string
	if req.Version != "" {
		t := template.New("file")
		t, _ = t.Parse(file.Content)
		data := struct{ Version string }{Version: req.Version}
		var builder strings.Builder
		_ = t.Execute(&builder, data)
		result = builder.String()
	} else {
		result = file.Content
	}

	if _, err := stdin.Write([]byte(result)); err != nil {
		return "", err
	}

	if err := stdin.Close(); err != nil {
		return "", err
	}

	if err := session.Wait(); err != nil {
		return "", err
	}

	return filePath, nil
}

func (s *fileService) ValidateYaml(content string) error {
	var composeConfig map[string]interface{}
	err := yaml.Unmarshal([]byte(content), &composeConfig)
	if err != nil {
		return fmt.Errorf("YAML格式错误: %w", err)
	}

	if _, exists := composeConfig["version"]; !exists {
		return fmt.Errorf("缺少必要的version字段")
	}

	services, exists := composeConfig["services"]
	if !exists {
		return fmt.Errorf("缺少必要的services字段")
	}

	servicesMap, ok := services.(map[interface{}]interface{})
	if !ok {
		return fmt.Errorf("services字段格式错误")
	}

	for serviceName, serviceConfig := range servicesMap {
		serviceMap, ok := serviceConfig.(map[interface{}]interface{})
		if !ok {
			return fmt.Errorf("服务 %s 配置格式错误", serviceName)
		}

		if _, exists := serviceMap["image"]; !exists {
			if _, hasBuild := serviceMap["build"]; !hasBuild {
				return fmt.Errorf("服务 %s 缺少必要的image或build字段", serviceName)
			}
		}
	}

	return nil
}

func (s *fileService) connectSSH(server *models.Server) (*ssh.Client, error) {
	config := &ssh.ClientConfig{
		User:            "root",
		Auth:            []ssh.AuthMethod{ssh.Password(server.Password)},
		HostKeyCallback: ssh.InsecureIgnoreHostKey(),
		Timeout:         30 * time.Second,
	}

	client, err := ssh.Dial("tcp", server.IP+":22", config)
	if err != nil {
		return nil, err
	}

	return client, nil
}

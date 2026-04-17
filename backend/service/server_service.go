package service

import (
	"strconv"
	"strings"
	"time"

	"github.com/mgface/exchange-auto-godeep/models"
	"github.com/mgface/exchange-auto-godeep/repository"
	"github.com/mgface/exchange-auto-godeep/utils"
)

type ServerService interface {
	ListServers(page, pageSize int, query map[string]interface{}) ([]models.Server, int64, error)
	GetServerByID(id uint) (*models.Server, error)
	CreateServer(server *models.Server) error
	UpdateServer(server *models.Server) error
	DeleteServer(id uint) error
	ConnectServer(id uint) (*models.Server, error)
	GetServerStatus(id uint) (*models.ServerStatus, error)
}

type serverService struct {
	serverRepo repository.ServerRepository
}

func NewServerService(serverRepo repository.ServerRepository) ServerService {
	return &serverService{serverRepo: serverRepo}
}

func (s *serverService) ListServers(page, pageSize int, query map[string]interface{}) ([]models.Server, int64, error) {
	return s.serverRepo.List(page, pageSize, query)
}

func (s *serverService) GetServerByID(id uint) (*models.Server, error) {
	return s.serverRepo.FindByID(id)
}

func (s *serverService) CreateServer(server *models.Server) error {
	server.Status = false
	server.LastPing = time.Now()
	return s.serverRepo.Create(server)
}

func (s *serverService) UpdateServer(server *models.Server) error {
	return s.serverRepo.Update(server)
}

func (s *serverService) DeleteServer(id uint) error {
	return s.serverRepo.Delete(id)
}

func (s *serverService) ConnectServer(id uint) (*models.Server, error) {
	server, err := s.serverRepo.FindByID(id)
	if err != nil {
		return nil, err
	}

	// Here you can add actual SSH connection logic to verify connectivity
	// For now, we just update the status as in the original controller
	server.Status = true
	server.LastPing = time.Now()

	if err := s.serverRepo.Update(server); err != nil {
		return nil, err
	}
	return server, nil
}

func (s *serverService) GetServerStatus(id uint) (*models.ServerStatus, error) {
	server, err := s.serverRepo.FindByID(id)
	if err != nil {
		return nil, err
	}

	client, err := utils.ConnectSSH(server.IP, server.Password)
	if err != nil {
		return nil, err
	}
	defer client.Close()

	session, err := client.NewSession()
	if err != nil {
		return nil, err
	}
	defer session.Close()

	cmd := `
		echo "CPU:$(top -bn1 | grep "Cpu(s)" | awk '{print $2}')"
		echo "Memory:$(free -m | awk '/^Mem/{print $3 "/" $2}')"
		echo "Disk:$(df -h / | awk 'NR==2{print $3 "/" $2 " " $5}')"
		echo "Network:$(sar -n DEV 1 1 | grep -v Average | grep eth0 | tail -1 | awk '{print $5 " " $6}')"
		echo "Processes:$(ps aux | wc -l)"
		echo "Uptime:$(uptime -p)"
	`
	output, err := session.CombinedOutput(cmd)
	if err != nil {
		return nil, err
	}

	status := &models.ServerStatus{
		ID:     server.ID,
		IP:     server.IP,
		Name:   server.Name,
		Status: true,
	}

	lines := strings.Split(string(output), "\n")
	for _, line := range lines {
		parts := strings.SplitN(line, ":", 2)
		if len(parts) != 2 {
			continue
		}
		key := strings.TrimSpace(parts[0])
		value := strings.TrimSpace(parts[1])

		switch key {
		case "CPU":
			status.CPUUsage, _ = strconv.ParseFloat(strings.TrimSuffix(value, "%"), 64)
		case "Memory":
			memParts := strings.Split(value, "/")
			if len(memParts) == 2 {
				used, _ := strconv.ParseFloat(memParts[0], 64)
				total, _ := strconv.ParseFloat(memParts[1], 64)
				if total > 0 {
					status.MemoryUsage = (used / total) * 100
				}
			}
		case "Disk":
			// Simplified parsing
			diskParts := strings.Fields(value)
			if len(diskParts) > 1 {
				status.DiskUsage, _ = strconv.ParseFloat(strings.TrimSuffix(diskParts[1], "%"), 64)
			}
		case "Network":
			status.NetworkSpeed = value
		case "Processes":
			status.Processes, _ = strconv.Atoi(value)
		case "Uptime":
			status.Uptime = value
		}
	}

	return status, nil
}

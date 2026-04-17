package service

import (
	"github.com/mgface/exchange-auto-godeep/models"
	"github.com/mgface/exchange-auto-godeep/repository"
)

type AppService interface {
	ListServices(page, pageSize int, query map[string]interface{}) ([]models.Service, int64, error)
	GetServiceByID(id uint) (*models.Service, error)
	CreateService(service *models.Service) error
	UpdateService(id uint, service *models.Service) error
	DeleteService(id uint) error
}

type appService struct {
	serviceRepo repository.ServiceRepository
}

func NewAppService(serviceRepo repository.ServiceRepository) AppService {
	return &appService{serviceRepo: serviceRepo}
}

func (s *appService) ListServices(page, pageSize int, query map[string]interface{}) ([]models.Service, int64, error) {
	return s.serviceRepo.List(page, pageSize, query)
}

func (s *appService) GetServiceByID(id uint) (*models.Service, error) {
	return s.serviceRepo.FindByID(id)
}

func (s *appService) CreateService(service *models.Service) error {
	return s.serviceRepo.Create(service)
}

func (s *appService) UpdateService(id uint, service *models.Service) error {
	_, err := s.serviceRepo.FindByID(id)
	if err != nil {
		return err
	}
	service.ID = uint64(id)
	return s.serviceRepo.Update(service)
}

func (s *appService) DeleteService(id uint) error {
	return s.serviceRepo.Delete(id)
}

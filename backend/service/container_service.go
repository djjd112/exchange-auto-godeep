package service

import (
	"github.com/mgface/exchange-auto-godeep/models"
	"github.com/mgface/exchange-auto-godeep/repository"
)

type ContainerService interface {
	NotifyFromGithub(buildNotification *models.BuildNotification) error
	ListContainers(page, pageSize int, query map[string]interface{}) ([]models.Container, int64, error)
	GetContainerByID(id uint) (*models.Container, error)
	CreateContainer(container *models.Container) error
	UpdateContainer(id uint, container *models.Container) error
	DeleteContainer(id uint) error
	GetContainerVersions(containerID uint) ([]string, error)
	GetContainersByServiceID(serviceID uint) ([]models.Container, error)
	GetContainersVersionsByServiceID(serviceID uint) ([]models.Container, error)
}

type containerService struct {
	containerRepo repository.ContainerRepository
}

func NewContainerService(containerRepo repository.ContainerRepository) ContainerService {
	return &containerService{containerRepo: containerRepo}
}

func (s *containerService) NotifyFromGithub(buildNotification *models.BuildNotification) error {
	service, err := s.containerRepo.GetServiceByID(buildNotification.ServiceId)
	if err != nil {
		return err
	}

	container := &models.Container{
		Name:        buildNotification.Name,
		Address:     buildNotification.Address,
		ServiceName: service.Name,
		MD5:         buildNotification.Md5,
		Version:     buildNotification.Version,
		ServiceID:   buildNotification.ServiceId,
	}

	return s.containerRepo.Create(container)
}

func (s *containerService) ListContainers(page, pageSize int, query map[string]interface{}) ([]models.Container, int64, error) {
	return s.containerRepo.List(page, pageSize, query)
}

func (s *containerService) GetContainerByID(id uint) (*models.Container, error) {
	return s.containerRepo.FindByID(id)
}

func (s *containerService) CreateContainer(container *models.Container) error {
	return s.containerRepo.Create(container)
}

func (s *containerService) UpdateContainer(id uint, container *models.Container) error {
	_, err := s.containerRepo.FindByID(id)
	if err != nil {
		return err
	}

	_, err = s.containerRepo.GetServiceByID(container.ServiceID)
	if err != nil {
		return err
	}

	container.ID = uint64(id)
	return s.containerRepo.Update(container)
}

func (s *containerService) DeleteContainer(id uint) error {
	return s.containerRepo.Delete(id)
}

func (s *containerService) GetContainerVersions(containerID uint) ([]string, error) {
	return s.containerRepo.GetVersions(containerID)
}

func (s *containerService) GetContainersByServiceID(serviceID uint) ([]models.Container, error) {
	return s.containerRepo.GetByServiceID(serviceID)
}

func (s *containerService) GetContainersVersionsByServiceID(serviceID uint) ([]models.Container, error) {
	return s.containerRepo.GetVersionsByServiceID(serviceID)
}

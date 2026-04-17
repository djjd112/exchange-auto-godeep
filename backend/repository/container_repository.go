package repository

import (
	"github.com/mgface/exchange-auto-godeep/models"
	"gorm.io/gorm"
)

type ContainerRepository interface {
	Create(container *models.Container) error
	FindByID(id uint) (*models.Container, error)
	Update(container *models.Container) error
	Delete(id uint) error
	List(page, pageSize int, query map[string]interface{}) ([]models.Container, int64, error)
	GetVersions(containerID uint) ([]string, error)
	GetByServiceID(serviceID uint) ([]models.Container, error)
	GetVersionsByServiceID(serviceID uint) ([]models.Container, error)
	GetServiceByID(id uint) (*models.Service, error)
}

type containerRepository struct {
	db *gorm.DB
}

func NewContainerRepository(db *gorm.DB) ContainerRepository {
	return &containerRepository{db: db}
}

func (r *containerRepository) Create(container *models.Container) error {
	return r.db.Create(container).Error
}

func (r *containerRepository) FindByID(id uint) (*models.Container, error) {
	var container models.Container
	err := r.db.First(&container, id).Error
	if err != nil {
		return nil, err
	}
	return &container, nil
}

func (r *containerRepository) Update(container *models.Container) error {
	return r.db.Save(container).Error
}

func (r *containerRepository) Delete(id uint) error {
	return r.db.Delete(&models.Container{}, id).Error
}

func (r *containerRepository) List(page, pageSize int, query map[string]interface{}) ([]models.Container, int64, error) {
	var containers []models.Container
	var count int64
	db := r.db

	if name, ok := query["name"]; ok && name != "" {
		db = db.Where("name LIKE ?", "%"+name.(string)+"%")
	}
	if serviceName, ok := query["service_name"]; ok && serviceName != "" {
		db = db.Where("service_name LIKE ?", "%"+serviceName.(string)+"%")
	}
	if serviceID, ok := query["service_id"]; ok && serviceID != 0 {
		db = db.Where("service_id = ?", serviceID)
	}

	db.Model(&models.Container{}).Count(&count)

	offset := (page - 1) * pageSize
	err := db.Offset(offset).Order("created_at desc").Limit(pageSize).Find(&containers).Error
	if err != nil {
		return nil, 0, err
	}

	return containers, count, nil
}

func (r *containerRepository) GetVersions(containerID uint) ([]string, error) {
	var container models.Container
	err := r.db.First(&container, containerID).Error
	if err != nil {
		return nil, err
	}

	var versions []string
	err = r.db.Model(&models.Container{}).
		Where("name = ? AND service_id = ?", container.Name, container.ServiceID).
		Order("created_at DESC").
		Pluck("version", &versions).Error

	return versions, err
}

func (r *containerRepository) GetByServiceID(serviceID uint) ([]models.Container, error) {
	var containers []models.Container
	subQuery := r.db.Model(&models.Container{}).
		Select("MAX(id) as id").
		Where("service_id = ?", serviceID).
		Group("name")

	err := r.db.Where("id IN (?)", subQuery).
		Order("name ASC").
		Find(&containers).Error

	return containers, err
}

func (r *containerRepository) GetVersionsByServiceID(serviceID uint) ([]models.Container, error) {
	var containers []models.Container
	err := r.db.Model(&models.Container{}).
		Where("service_id = ?", serviceID).
		Order("created_at DESC").Find(&containers).Error

	return containers, err
}

func (r *containerRepository) GetServiceByID(id uint) (*models.Service, error) {
	var service models.Service
	err := r.db.First(&service, id).Error
	if err != nil {
		return nil, err
	}
	return &service, nil
}

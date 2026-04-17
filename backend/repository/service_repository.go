package repository

import (
	"github.com/mgface/exchange-auto-godeep/models"
	"gorm.io/gorm"
)

type ServiceRepository interface {
	Create(service *models.Service) error
	FindByID(id uint) (*models.Service, error)
	Update(service *models.Service) error
	Delete(id uint) error
	List(page, pageSize int, query map[string]interface{}) ([]models.Service, int64, error)
}

type serviceRepository struct {
	db *gorm.DB
}

func NewServiceRepository(db *gorm.DB) ServiceRepository {
	return &serviceRepository{db: db}
}

func (r *serviceRepository) Create(service *models.Service) error {
	return r.db.Create(service).Error
}

func (r *serviceRepository) FindByID(id uint) (*models.Service, error) {
	var service models.Service
	err := r.db.First(&service, id).Error
	if err != nil {
		return nil, err
	}
	return &service, nil
}

func (r *serviceRepository) Update(service *models.Service) error {
	return r.db.Save(service).Error
}

func (r *serviceRepository) Delete(id uint) error {
	return r.db.Delete(&models.Service{}, id).Error
}

func (r *serviceRepository) List(page, pageSize int, query map[string]interface{}) ([]models.Service, int64, error) {
	var services []models.Service
	var count int64
	db := r.db

	if name, ok := query["name"]; ok && name != "" {
		db = db.Where("name LIKE ?", "%"+name.(string)+"%")
	}
	if category, ok := query["category"]; ok && category != "" {
		db = db.Where("category = ?", category)
	}
	if subCategory, ok := query["subCategory"]; ok && subCategory != "" {
		db = db.Where("sub_category = ?", subCategory)
	}

	db.Model(&models.Service{}).Count(&count)

	offset := (page - 1) * pageSize
	err := db.Offset(offset).Order("created_at DESC").Limit(pageSize).Find(&services).Error
	if err != nil {
		return nil, 0, err
	}

	return services, count, nil
}

package repository

import (
	"github.com/mgface/exchange-auto-godeep/models"
	"gorm.io/gorm"
)

type FileRepository interface {
	Create(file *models.File) error
	FindByID(id uint) (*models.File, error)
	Update(file *models.File) error
	Delete(id uint) error
	List(page, pageSize int, query map[string]interface{}) ([]models.File, int64, error)
	GetByServiceID(serviceID uint) ([]models.File, error)
	GetServerByID(id uint) (*models.Server, error)
}

type fileRepository struct {
	db *gorm.DB
}

func NewFileRepository(db *gorm.DB) FileRepository {
	return &fileRepository{db: db}
}

func (r *fileRepository) Create(file *models.File) error {
	return r.db.Create(file).Error
}

func (r *fileRepository) FindByID(id uint) (*models.File, error) {
	var file models.File
	err := r.db.First(&file, id).Error
	if err != nil {
		return nil, err
	}
	return &file, nil
}

func (r *fileRepository) Update(file *models.File) error {
	return r.db.Save(file).Error
}

func (r *fileRepository) Delete(id uint) error {
	return r.db.Delete(&models.File{}, id).Error
}

func (r *fileRepository) List(page, pageSize int, query map[string]interface{}) ([]models.File, int64, error) {
	var files []models.File
	var count int64
	db := r.db

	if name, ok := query["name"]; ok && name != "" {
		db = db.Where("name LIKE ?", "%"+name.(string)+"%")
	}
	if serviceID, ok := query["serviceId"]; ok && serviceID != 0 {
		db = db.Where("service_id = ?", serviceID)
	}
	if createdBy, ok := query["created_by"]; ok && createdBy != 0 {
		db = db.Where("created_by = ?", createdBy)
	}

	db.Model(&models.File{}).Count(&count)

	offset := (page - 1) * pageSize
	err := db.Offset(offset).Order("created_at DESC").Limit(pageSize).Find(&files).Error
	if err != nil {
		return nil, 0, err
	}

	return files, count, nil
}

func (r *fileRepository) GetByServiceID(serviceID uint) ([]models.File, error) {
	var files []models.File
	err := r.db.Where("service_id = ?", serviceID).
		Order("name ASC").
		Find(&files).Error

	return files, err
}

func (r *fileRepository) GetServerByID(id uint) (*models.Server, error) {
	var server models.Server
	err := r.db.First(&server, id).Error
	if err != nil {
		return nil, err
	}
	return &server, nil
}

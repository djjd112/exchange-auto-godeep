package repository

import (
	"github.com/mgface/exchange-auto-godeep/models"
	"gorm.io/gorm"
)

type ServerRepository interface {
	Create(server *models.Server) error
	FindByID(id uint) (*models.Server, error)
	Update(server *models.Server) error
	Delete(id uint) error
	List(page, pageSize int, query map[string]interface{}) ([]models.Server, int64, error)
}

type serverRepository struct {
	db *gorm.DB
}

func NewServerRepository(db *gorm.DB) ServerRepository {
	return &serverRepository{db: db}
}

func (r *serverRepository) Create(server *models.Server) error {
	return r.db.Create(server).Error
}

func (r *serverRepository) FindByID(id uint) (*models.Server, error) {
	var server models.Server
	err := r.db.First(&server, id).Error
	if err != nil {
		return nil, err
	}
	return &server, nil
}

func (r *serverRepository) Update(server *models.Server) error {
	return r.db.Save(server).Error
}

func (r *serverRepository) Delete(id uint) error {
	return r.db.Delete(&models.Server{}, id).Error
}

func (r *serverRepository) List(page, pageSize int, query map[string]interface{}) ([]models.Server, int64, error) {
	var servers []models.Server
	var count int64
	db := r.db

	if ip, ok := query["ip"]; ok && ip != "" {
		db = db.Where("ip LIKE ?", "%"+ip.(string)+"%")
	}
	if name, ok := query["name"]; ok && name != "" {
		db = db.Where("name LIKE ?", "%"+name.(string)+"%")
	}

	db.Model(&models.Server{}).Count(&count)

	offset := (page - 1) * pageSize
	err := db.Offset(offset).Order("created_at DESC").Limit(pageSize).Find(&servers).Error
	if err != nil {
		return nil, 0, err
	}

	return servers, count, nil
}

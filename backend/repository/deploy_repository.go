package repository

import (
	"github.com/mgface/exchange-auto-godeep/models"
	"gorm.io/gorm"
)

type DeployRepository interface {
	Create(deploy *models.Deploy) error
	FindByID(id uint) (*models.Deploy, error)
	Update(deploy *models.Deploy) error
	Delete(id uint) error
	List(page, pageSize int, serviceID uint, status string) ([]models.Deploy, int64, error)
	CreateLog(log *models.DeployLog) error
	GetLogs(deployID uint) ([]models.DeployLog, error)
	GetFileByID(id uint) (*models.File, error)
	GetServerByID(id uint) (*models.Server, error)
	UpdateStatus(id uint, status string) error
}

type deployRepository struct {
	db *gorm.DB
}

func NewDeployRepository(db *gorm.DB) DeployRepository {
	return &deployRepository{db: db}
}

func (r *deployRepository) Create(deploy *models.Deploy) error {
	return r.db.Create(deploy).Error
}

func (r *deployRepository) FindByID(id uint) (*models.Deploy, error) {
	var deploy models.Deploy
	err := r.db.Where("id = ?", id).First(&deploy).Error
	return &deploy, err
}

func (r *deployRepository) Update(deploy *models.Deploy) error {
	return r.db.Save(deploy).Error
}

func (r *deployRepository) Delete(id uint) error {
	return r.db.Delete(&models.Deploy{}, id).Error
}

func (r *deployRepository) List(page, pageSize int, serviceID uint, status string) ([]models.Deploy, int64, error) {
	var deploys []models.Deploy
	var total int64

	query := r.db.Model(&models.Deploy{})

	if serviceID > 0 {
		query = query.Where("service_id = ?", serviceID)
	}

	if status != "" {
		query = query.Where("status = ?", status)
	}

	err := query.Count(&total).Error
	if err != nil {
		return nil, 0, err
	}

	err = query.Order("create_time DESC").
		Limit(pageSize).
		Offset((page - 1) * pageSize).
		Find(&deploys).Error

	return deploys, total, err
}

func (r *deployRepository) CreateLog(log *models.DeployLog) error {
	return r.db.Create(log).Error
}

func (r *deployRepository) GetLogs(deployID uint) ([]models.DeployLog, error) {
	var logs []models.DeployLog
	err := r.db.Where("deploy_id = ?", deployID).
		Order("create_time DESC").
		Limit(10).
		Find(&logs).Error
	return logs, err
}

func (r *deployRepository) GetFileByID(id uint) (*models.File, error) {
	var file models.File
	err := r.db.First(&file, id).Error
	return &file, err
}

func (r *deployRepository) GetServerByID(id uint) (*models.Server, error) {
	var server models.Server
	err := r.db.First(&server, id).Error
	return &server, err
}

func (r *deployRepository) UpdateStatus(id uint, status string) error {
	return r.db.Model(&models.Deploy{}).Where("id = ?", id).Update("status", status).Error
}

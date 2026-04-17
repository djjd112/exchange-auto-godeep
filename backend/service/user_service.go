package service

import (
	"fmt"
	"time"

	"github.com/mgface/exchange-auto-godeep/models"
	"github.com/mgface/exchange-auto-godeep/repository"
	"golang.org/x/crypto/bcrypt"
)

type UserService interface {
	Register(user *models.User) error
	Login(username, password string) (*models.User, error)
	GetUserByID(id uint64) (*models.User, error)
	GetUserByUsername(username string) (*models.User, error)
	UpdateUser(user *models.User) error
	DeleteUser(id uint) error
	ListUsers(page, pageSize int) ([]models.User, int64, error)
}

type userService struct {
	userRepo repository.UserRepository
}

func NewUserService(userRepo repository.UserRepository) UserService {
	return &userService{userRepo: userRepo}
}

func (s *userService) Register(user *models.User) error {
	hashedPassword, err := bcrypt.GenerateFromPassword([]byte(user.Password), bcrypt.DefaultCost)
	if err != nil {
		return err
	}
	user.Password = string(hashedPassword)
	return s.userRepo.Create(user)
}

func (s *userService) Login(username, password string) (*models.User, error) {
	user, err := s.userRepo.FindByUsername(username)
	if err != nil {
		return nil, err
	}

	hashedPassword, err := bcrypt.GenerateFromPassword([]byte(user.Password), bcrypt.DefaultCost)
	fmt.Println("--", string(hashedPassword))

	err = bcrypt.CompareHashAndPassword([]byte(user.Password), []byte(password))
	if err != nil {
		return nil, err
	}

	now := time.Now()
	user.LastLogin = &now
	err = s.userRepo.Update(user)
	if err != nil {
		return nil, err
	}

	return user, nil
}

func (s *userService) GetUserByID(id uint64) (*models.User, error) {
	return s.userRepo.FindByID(id)
}

func (s *userService) GetUserByUsername(username string) (*models.User, error) {
	return s.userRepo.FindByUsername(username)
}

func (s *userService) UpdateUser(user *models.User) error {
	return s.userRepo.Update(user)
}

func (s *userService) DeleteUser(id uint) error {
	return s.userRepo.Delete(id)
}

func (s *userService) ListUsers(page, pageSize int) ([]models.User, int64, error) {
	return s.userRepo.List(page, pageSize)
}

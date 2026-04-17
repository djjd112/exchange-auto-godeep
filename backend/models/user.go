package models

import (
	"time"
)

// User 用户模型
type User struct {
	ID        uint64     `gorm:"primary_key" json:"id"`
	CreatedAt time.Time  `json:"created_at"`
	UpdatedAt time.Time  `json:"updated_at"`
	Username  string     `gorm:"size:50;not null;unique" json:"username"`
	Password  string     `gorm:"size:100;not null" json:"-"`
	Email     string     `gorm:"size:100;unique" json:"email"`
	Role      string     `gorm:"size:20;default:'user'" json:"role"` // admin, user
	LastLogin *time.Time `json:"last_login"`
}

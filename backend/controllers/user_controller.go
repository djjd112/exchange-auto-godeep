package controllers

import (
	"net/http"
	"strconv"

	"github.com/gin-gonic/gin"
	"github.com/mgface/exchange-auto-godeep/middleware"
	"github.com/mgface/exchange-auto-godeep/models"
	"github.com/mgface/exchange-auto-godeep/service"
	"github.com/pquerna/otp/totp"
	"github.com/sirupsen/logrus"
)

type UserController struct {
	UserService service.UserService
}

func NewUserController(userService service.UserService) *UserController {
	return &UserController{UserService: userService}
}

// LoginRequest 登录请求
type LoginRequest struct {
	Username string `json:"username" binding:"required"`
	Password string `json:"password" binding:"required"`
}

// RegisterRequest 注册请求
type RegisterRequest struct {
	Username string `json:"username" binding:"required"`
	Password string `json:"password" binding:"required"`
	Email    string `json:"email" binding:"required,email"`
	Role     string `json:"role" binding:"required"`
}

// UpdateUserRequest 更新用户请求
type UpdateUserRequest struct {
	ID       uint64 `json:"id" binding:"required"`
	Username string `json:"username"`
	Email    string `json:"email"`
	Role     string `json:"role"`
}

// VerifyTwoFactorRequest 二次验证请求
type VerifyTwoFactorRequest struct {
	Username  string `json:"username" binding:"required"`
	Code      string `json:"code" binding:"required"`
	TempToken string `json:"tempToken"`
}

// Login 用户登录
func (uc *UserController) Login(c *gin.Context) {
	var req LoginRequest
	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"code": 400, "message": "请求参数错误"})
		return
	}

	user, err := uc.UserService.Login(req.Username, req.Password)
	if err != nil {
		c.JSON(http.StatusUnauthorized, gin.H{"code": 401, "message": "用户名或密码错误"})
		return
	}

	// 检查是否需要二次验证（这里简化处理，所有用户都需要二次验证）
	// 你可以根据需要修改这个逻辑，比如只对管理员用户启用二次验证
	needTwoFactor := false

	if needTwoFactor {
		// 生成临时token（可选，用于标识用户已通过第一步验证）
		tempToken, err := middleware.GenerateToken(user.ID, user.Username+"_temp")
		if err != nil {
			logrus.Errorf("生成临时Token失败: %v", err)
			c.JSON(http.StatusInternalServerError, gin.H{"code": 500, "message": "服务器内部错误"})
			return
		}

		c.JSON(http.StatusOK, gin.H{
			"code":    200,
			"message": "需要二次验证",
			"data": gin.H{
				"requireTwoFactor": true,
				"tempToken":        tempToken,
			},
		})
		return
	}

	// 不需要二次验证，直接返回正式token
	token, err := middleware.GenerateToken(user.ID, user.Username)
	if err != nil {
		logrus.Errorf("生成Token失败: %v", err)
		c.JSON(http.StatusInternalServerError, gin.H{"code": 500, "message": "服务器内部错误"})
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"code":    200,
		"message": "登录成功",
		"data": gin.H{
			"token":    token,
			"username": user.Username,
			"role":     user.Role,
		},
	})
}

// GetUserInfo 获取用户信息
func (uc *UserController) GetUserInfo(c *gin.Context) {
	userID, exists := c.Get("user_id")
	if !exists {
		c.JSON(http.StatusUnauthorized, gin.H{"code": 401, "message": "未授权"})
		return
	}

	user, err := uc.UserService.GetUserByID(userID.(uint64))
	if err != nil {
		c.JSON(http.StatusNotFound, gin.H{"code": 404, "message": "用户不存在"})
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"code":    200,
		"message": "获取用户信息成功",
		"data": gin.H{
			"id":       user.ID,
			"username": user.Username,
			"email":    user.Email,
			"role":     user.Role,
			"created":  user.CreatedAt,
		},
	})
}

// RegisterUser 注册用户
func (uc *UserController) RegisterUser(c *gin.Context) {
	var req RegisterRequest
	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"code": 400, "message": "请求参数错误"})
		return
	}

	user := &models.User{
		Username: req.Username,
		Password: req.Password,
		Email:    req.Email,
		Role:     req.Role,
	}

	if err := uc.UserService.Register(user); err != nil {
		logrus.Errorf("创建用户失败: %v", err)
		c.JSON(http.StatusInternalServerError, gin.H{"code": 500, "message": "服务器内部错误"})
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"code":    200,
		"message": "注册成功",
		"data": gin.H{
			"id":       user.ID,
			"username": user.Username,
		},
	})
}

// UpdateUser 更新用户
func (uc *UserController) UpdateUser(c *gin.Context) {
	var req UpdateUserRequest
	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"code": 400, "message": "请求参数错误"})
		return
	}

	user, err := uc.UserService.GetUserByID(req.ID)
	if err != nil {
		c.JSON(http.StatusNotFound, gin.H{"code": 404, "message": "用户不存在"})
		return
	}

	if req.Username != "" {
		user.Username = req.Username
	}
	if req.Email != "" {
		user.Email = req.Email
	}
	if req.Role != "" {
		user.Role = req.Role
	}

	if err := uc.UserService.UpdateUser(user); err != nil {
		logrus.Errorf("更新用户失败: %v", err)
		c.JSON(http.StatusInternalServerError, gin.H{"code": 500, "message": "服务器内部错误"})
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"code":    200,
		"message": "更新用户成功",
		"data": gin.H{
			"id":       user.ID,
			"username": user.Username,
		},
	})
}

// DeleteUser 删除用户
func (uc *UserController) DeleteUser(c *gin.Context) {
	id, err := strconv.ParseUint(c.Param("id"), 10, 64)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"code": 400, "message": "无效的用户ID"})
		return
	}

	if err := uc.UserService.DeleteUser(uint(id)); err != nil {
		logrus.Errorf("删除用户失败: %v", err)
		c.JSON(http.StatusInternalServerError, gin.H{"code": 500, "message": "服务器内部错误"})
		return
	}

	c.JSON(http.StatusOK, gin.H{"code": 200, "message": "删除用户成功"})
}

// GetUserList 获取用户列表
func (uc *UserController) GetUserList(c *gin.Context) {
	page, _ := strconv.Atoi(c.DefaultQuery("page", "1"))
	pageSize, _ := strconv.Atoi(c.DefaultQuery("page_size", "10"))

	users, total, err := uc.UserService.ListUsers(page, pageSize)
	if err != nil {
		logrus.Errorf("获取用户列表失败: %v", err)
		c.JSON(http.StatusInternalServerError, gin.H{"code": 500, "message": "服务器内部错误"})
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"code":    200,
		"message": "获取用户列表成功",
		"data": gin.H{
			"total": total,
			"users": users,
		},
	})
}

// VerifyTwoFactor 验证Google验证码
func (uc *UserController) VerifyTwoFactor(c *gin.Context) {
	var req VerifyTwoFactorRequest
	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"code": 400, "message": "请求参数错误"})
		return
	}

	// 验证用户是否存在
	user, err := uc.UserService.GetUserByUsername(req.Username)
	if err != nil {
		c.JSON(http.StatusUnauthorized, gin.H{"code": 401, "message": "用户不存在"})
		return
	}

	// Google验证码密钥（你的自定义密钥）
	googleSecret := "YGGFRUWCZA2JA2DC6EZHF6T3E7YJGDDJ" // 你的Google验证器密钥

	//验证Google验证码
	valid := totp.Validate(req.Code, googleSecret)
	if !valid {
		c.JSON(http.StatusUnauthorized, gin.H{"code": 401, "message": "验证码错误"})
		return
	}

	// 验证成功，生成正式token
	token, err := middleware.GenerateToken(user.ID, user.Username)
	if err != nil {
		logrus.Errorf("生成Token失败: %v", err)
		c.JSON(http.StatusInternalServerError, gin.H{"code": 500, "message": "服务器内部错误"})
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"code":    200,
		"message": "验证成功",
		"data": gin.H{
			"token":    token,
			"username": user.Username,
			"role":     user.Role,
		},
	})
}

// Logout 用户登出
func (uc *UserController) Logout(c *gin.Context) {
	c.JSON(http.StatusOK, gin.H{"code": 200, "message": "登出成功"})
}

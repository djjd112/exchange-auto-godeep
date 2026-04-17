# 自动化运维部署平台后端

这是一个使用Go语言开发的自动化运维部署平台后端，提供了用户管理、服务器管理、容器管理、文件管理和服务管理等功能。

## 技术栈

- Go 1.20+
- Gin Web框架
- GORM ORM框架
- MySQL数据库
- JWT认证

## 目录结构

```
exchange-auto-godeep/
├── api/            # API文档
├── config/         # 配置文件
├── controllers/    # 控制器
├── middleware/     # 中间件
├── models/         # 数据模型
├── routes/         # 路由配置
├── utils/          # 工具函数
├── .env.example    # 环境变量示例
├── go.mod          # Go模块文件
├── main.go         # 主程序入口
└── README.md       # 项目说明
```

## 功能模块

1. **用户管理**：用户登录、获取用户信息、用户登出
2. **服务器管理**：服务器列表、服务器详情、添加服务器、更新服务器、删除服务器、连接服务器、获取服务器状态
3. **容器管理**：容器列表、容器详情、添加容器、更新容器、删除容器
4. **文件管理**：文件列表、文件详情、添加文件、更新文件、删除文件、发送文件、验证YAML
5. **服务管理**：服务列表、服务详情、添加服务、更新服务、删除服务、部署服务、测试服务

## 安装和运行

### 前提条件

- Go 1.20+
- MySQL 5.7+

### 安装步骤

1. 克隆项目

```bash
git clone https://github.com/mgface/exchange-auto-godeep.git
cd exchange-auto-godeep
```

2. 安装依赖

```bash
go mod tidy
```

3. 配置环境变量

```bash
cp .env.example .env
# 编辑.env文件，设置数据库连接等信息
```

4. 运行项目

```bash
go run main.go
```

服务器将在配置的端口上启动（默认为8080）。

## API文档

API接口遵循RESTful风格，主要包括以下几类：

- `/api/user/*`：用户相关接口
- `/api/server/*`：服务器相关接口
- `/api/container/*`：容器相关接口
- `/api/file/*`：文件相关接口
- `/api/service/*`：服务相关接口

详细的API文档请参考`api/`目录下的文档。

## 开发说明

### 添加新功能

1. 在`models/`目录下添加新的数据模型
2. 在`controllers/`目录下添加新的控制器
3. 在`routes/routes.go`中注册新的路由

### 数据库迁移

数据库表结构会在应用启动时自动创建和更新。

## 许可证

MIT 
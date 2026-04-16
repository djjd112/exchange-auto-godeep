<template>
  <div class="dashboard-container">
    <!-- 背景装饰元素 -->
    <div class="background-decoration">
      <div class="bg-circle bg-circle-1"></div>
      <div class="bg-circle bg-circle-2"></div>
      <div class="bg-circle bg-circle-3"></div>
      <div class="bg-circle bg-circle-4"></div>
    </div>
    <el-container class="dashboard-layout">
      <!-- 侧边栏 -->
      <el-aside :width="sidebarWidth" class="dashboard-aside">
        <div class="dashboard-logo">
          <div class="logo-icon">🚀</div>
          <h3 v-if="!isSidebarCollapsed">自动化运维部署平台</h3>
        </div>
        <el-menu
          :default-active="activeMenu"
          class="dashboard-menu"
          router
          background-color="transparent"
          text-color="rgba(255, 255, 255, 0.9)"
          active-text-color="#ffffff"
          :collapse="isSidebarCollapsed"
        >
          <el-menu-item index="/dashboard/server">
            <el-icon><Monitor /></el-icon>
            <span>服务器管理</span>
          </el-menu-item>
          <el-menu-item index="/dashboard/service">
            <el-icon><Service /></el-icon>
            <span>服务管理</span>
          </el-menu-item>
          <el-menu-item index="/dashboard/file">
            <el-icon><Document /></el-icon>
            <span>文件管理</span>
          </el-menu-item>
          <el-menu-item index="/dashboard/container">
            <el-icon><Box /></el-icon>
            <span>容器管理</span>
          </el-menu-item>
          <el-menu-item index="/dashboard/deploy">
            <el-icon><Upload /></el-icon>
            <span>部署管理</span>
          </el-menu-item>
          <el-menu-item index="/dashboard/graph">
            <el-icon><DataLine /></el-icon>
            <span>拓扑图管理</span>
          </el-menu-item>
        </el-menu>
      </el-aside>
      
      <!-- 主内容区 -->
      <el-container class="dashboard-main-container">
        <!-- 头部 -->
        <el-header height="60px" class="dashboard-header">
          <div class="dashboard-header-left">
            <el-icon class="dashboard-fold-icon" @click="toggleSidebar">
              <Fold v-if="!isSidebarCollapsed" />
              <Expand v-else />
            </el-icon>
            <div class="header-breadcrumb">
              <span class="breadcrumb-text">{{ getBreadcrumbText() }}</span>
            </div>
          </div>
          <div class="dashboard-header-right">
            <div class="header-status-indicator">
              <div class="status-dot"></div>
              <span class="status-text">在线</span>
            </div>
            <el-dropdown trigger="click" @command="handleCommand">
              <span class="dashboard-user-info">
                <el-avatar :size="32" class="dashboard-avatar">
                  {{ userStore.username.charAt(0).toUpperCase() }}
                </el-avatar>
                <span class="dashboard-username">{{ userStore.username }}</span>
                <el-icon><ArrowDown /></el-icon>
              </span>
              <template #dropdown>
                <el-dropdown-menu>
                  <el-dropdown-item command="logout">
                    <el-icon><SwitchButton /></el-icon>
                    退出登录
                  </el-dropdown-item>
                </el-dropdown-menu>
              </template>
            </el-dropdown>
          </div>
        </el-header>
        
        <!-- 内容区 -->
        <el-main class="dashboard-main">
          <div class="main-content-wrapper">
            <router-view />
          </div>
          <!-- 装饰性背景元素 -->
          <div class="main-decoration">
            <div class="decoration-circle decoration-circle-1"></div>
            <div class="decoration-circle decoration-circle-2"></div>
            <div class="decoration-circle decoration-circle-3"></div>
          </div>
        </el-main>
      </el-container>
    </el-container>
  </div>
</template>

<script setup>
import { ref, computed } from 'vue'
import { useRouter, useRoute } from 'vue-router'
import { useUserStore } from '@/store/user'
import { ElMessageBox } from 'element-plus'
import { logout } from '@/api/user'

const router = useRouter()
const route = useRoute()
const userStore = useUserStore()

// 侧边栏折叠状态
const isSidebarCollapsed = ref(false)

// 侧边栏宽度
const sidebarWidth = computed(() => {
  return isSidebarCollapsed.value ? '64px' : '220px'
})

// 切换侧边栏折叠状态
const toggleSidebar = () => {
  isSidebarCollapsed.value = !isSidebarCollapsed.value
}

// 当前激活的菜单
const activeMenu = computed(() => {
  return route.path
})

// 获取面包屑文本
const getBreadcrumbText = () => {
  const pathMap = {
    '/dashboard/server': '服务器管理',
    '/dashboard/service': '服务管理',
    '/dashboard/file': '文件管理',
    '/dashboard/container': '容器管理',
    '/dashboard/deploy': '部署管理',
    '/dashboard/graph': '拓扑图管理'
  }
  return pathMap[route.path] || '控制台'
}

// 处理下拉菜单命令
const handleCommand = (command) => {
  if (command === 'logout') {
    ElMessageBox.confirm('确定要退出登录吗?', '提示', {
      confirmButtonText: '确定',
      cancelButtonText: '取消',
      type: 'warning'
    }).then(async () => {
      try {
        // 先调用后端退出登录接口
        await logout()
        // 等待接口调用完成后再清除用户信息
        userStore.clearUser()
        // 跳转到登录页
        router.push('/login')
      } catch (error) {
        console.error('退出登录失败:', error)
        // 即使接口调用失败，也要清除本地信息
        userStore.clearUser()
        router.push('/login')
      }
    }).catch(() => {})
  }
}

</script>

<style scoped>
.dashboard-container {
  height: 100vh;
  width: 100%;
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  padding: 16px;
  box-sizing: border-box;
  position: relative;
  overflow: hidden;
}

.background-decoration {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  pointer-events: none;
  z-index: 0;
}

.bg-circle {
  position: absolute;
  border-radius: 50%;
  background: radial-gradient(circle, rgba(255, 255, 255, 0.1) 0%, transparent 70%);
  animation: float-bg 12s ease-in-out infinite;
}

.bg-circle-1 {
  width: 300px;
  height: 300px;
  top: -150px;
  left: -150px;
  animation-delay: 0s;
}

.bg-circle-2 {
  width: 200px;
  height: 200px;
  top: 20%;
  right: -100px;
  animation-delay: 3s;
}

.bg-circle-3 {
  width: 250px;
  height: 250px;
  bottom: -125px;
  right: 20%;
  animation-delay: 6s;
}

.bg-circle-4 {
  width: 180px;
  height: 180px;
  bottom: 30%;
  left: -90px;
  animation-delay: 9s;
}

@keyframes float-bg {
  0%, 100% { 
    transform: translateY(0px) rotate(0deg);
    opacity: 0.1;
  }
  50% { 
    transform: translateY(-30px) rotate(180deg);
    opacity: 0.05;
  }
}

.dashboard-layout {
  height: 100%;
  gap: 16px;
  display: flex;
  position: relative;
  z-index: 1;
}

.dashboard-aside {
  background: rgba(255, 255, 255, 0.15);
  backdrop-filter: blur(20px);
  -webkit-backdrop-filter: blur(20px);
  border-radius: var(--lg-radius-xl, 20px);
  border: 1px solid rgba(255, 255, 255, 0.3);
  box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
  transition: all 0.3s var(--lg-ease, cubic-bezier(0.4, 0, 0.2, 1));
  overflow: hidden;
  margin-bottom: 16px;
}

.dashboard-logo {
  height: 60px;
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 12px;
  color: white;
  font-size: 16px;
  border-bottom: 1px solid rgba(255, 255, 255, 0.2);
  overflow: hidden;
  white-space: nowrap;
  background: rgba(255, 255, 255, 0.1);
  backdrop-filter: blur(10px);
  padding: 0 16px;
}

.logo-icon {
  font-size: 24px;
  animation: float 3s ease-in-out infinite;
}

@keyframes float {
  0%, 100% { transform: translateY(0px); }
  50% { transform: translateY(-3px); }
}

.dashboard-logo h3 {
  margin: 0;
  transition: all 0.3s;
  font-weight: 600;
  text-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  background: linear-gradient(135deg, #ffffff 0%, #f0f0f0 100%);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-clip: text;
  flex: 1;
}

.dashboard-menu {
  border-right: none;
  background: transparent !important;
}

.dashboard-menu:not(.el-menu--collapse) {
  width: 220px;
}

/* 菜单项样式覆盖 */
.dashboard-menu :deep(.el-menu-item) {
  background: transparent !important;
  color: rgba(255, 255, 255, 0.9) !important;
  border-radius: var(--lg-radius-md, 12px);
  margin: 4px 8px;
  transition: all 0.3s var(--lg-ease, cubic-bezier(0.4, 0, 0.2, 1));
  font-weight: 500;
}

.dashboard-menu :deep(.el-menu-item:hover) {
  background: rgba(255, 255, 255, 0.15) !important;
  color: white !important;
  transform: translateX(4px);
}

.dashboard-menu :deep(.el-menu-item.is-active) {
  background: rgba(255, 255, 255, 0.2) !important;
  color: white !important;
  box-shadow: 0 4px 12px rgba(255, 255, 255, 0.2);
  font-weight: 600;
}

.dashboard-menu :deep(.el-menu-item .el-icon) {
  color: inherit !important;
  margin-right: 8px;
}

/* 折叠状态下的菜单项样式 */
.dashboard-menu.el-menu--collapse :deep(.el-menu-item) {
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 0 !important;
}

.dashboard-menu.el-menu--collapse :deep(.el-menu-item .el-icon) {
  margin-right: 0 !important;
  font-size: 20px;
}

.dashboard-menu.el-menu--collapse :deep(.el-menu-item:hover) {
  transform: translateX(0) scale(1.05);
}

.dashboard-header {
  background: rgba(255, 255, 255, 0.15);
  backdrop-filter: blur(20px);
  -webkit-backdrop-filter: blur(20px);
  border-radius: var(--lg-radius-xl, 20px);
  border: 1px solid rgba(255, 255, 255, 0.3);
  box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 0 24px;
  margin-bottom: 16px;
  transition: all 0.3s var(--lg-ease, cubic-bezier(0.4, 0, 0.2, 1));
}

.dashboard-header:hover {
  box-shadow: 0 12px 40px rgba(0, 0, 0, 0.15);
}

.dashboard-header-left {
  display: flex;
  align-items: center;
  gap: 16px;
}

.dashboard-fold-icon {
  font-size: 20px;
  cursor: pointer;
  color: white;
  padding: 10px;
  border-radius: var(--lg-radius-md, 12px);
  transition: all 0.3s var(--lg-ease, cubic-bezier(0.4, 0, 0.2, 1));
  background: rgba(255, 255, 255, 0.1);
  backdrop-filter: blur(10px);
}

.dashboard-fold-icon:hover {
  background: rgba(255, 255, 255, 0.2);
  transform: scale(1.05);
}

.header-breadcrumb {
  display: flex;
  align-items: center;
}

.breadcrumb-text {
  color: white;
  font-size: 16px;
  font-weight: 600;
  text-shadow: 0 1px 2px rgba(0, 0, 0, 0.1);
}

.dashboard-header-right {
  display: flex;
  align-items: center;
  gap: 16px;
}

.header-status-indicator {
  display: flex;
  align-items: center;
  gap: 8px;
  padding: 6px 12px;
  background: rgba(255, 255, 255, 0.1);
  backdrop-filter: blur(10px);
  border-radius: var(--lg-radius-md, 12px);
  border: 1px solid rgba(255, 255, 255, 0.2);
}

.status-dot {
  width: 8px;
  height: 8px;
  background: #52c41a;
  border-radius: 50%;
  animation: pulse 2s infinite;
}

@keyframes pulse {
  0% { box-shadow: 0 0 0 0 rgba(82, 196, 26, 0.7); }
  70% { box-shadow: 0 0 0 6px rgba(82, 196, 26, 0); }
  100% { box-shadow: 0 0 0 0 rgba(82, 196, 26, 0); }
}

.status-text {
  color: white;
  font-size: 12px;
  font-weight: 500;
}

.dashboard-user-info {
  display: flex;
  align-items: center;
  cursor: pointer;
  padding: 8px 16px;
  border-radius: var(--lg-radius-md, 12px);
  transition: all 0.3s var(--lg-ease, cubic-bezier(0.4, 0, 0.2, 1));
  background: rgba(255, 255, 255, 0.1);
  backdrop-filter: blur(10px);
  color: white;
}

.dashboard-user-info:hover {
  background: rgba(255, 255, 255, 0.2);
  transform: translateY(-1px);
}

.dashboard-avatar {
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  margin-right: 12px;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
  border: 2px solid rgba(255, 255, 255, 0.3);
}

.dashboard-username {
  margin-right: 8px;
  font-size: 14px;
  font-weight: 500;
  color: white;
  text-shadow: 0 1px 2px rgba(0, 0, 0, 0.1);
}

.dashboard-main-container {
  flex-direction: column;
  background: transparent;
  flex: 1;
}

.dashboard-main {
  background: rgba(255, 255, 255, 0.1);
  backdrop-filter: blur(20px);
  -webkit-backdrop-filter: blur(20px);
  border-radius: var(--lg-radius-xl, 20px);
  border: 1px solid rgba(255, 255, 255, 0.2);
  box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
  padding: 24px;
  overflow-y: auto;
  flex: 1;
  transition: all 0.3s var(--lg-ease, cubic-bezier(0.4, 0, 0.2, 1));
  position: relative;
  margin-bottom: 16px;
}

.dashboard-main:hover {
  box-shadow: 0 12px 40px rgba(0, 0, 0, 0.15);
}

.main-content-wrapper {
  position: relative;
  z-index: 2;
  height: 100%;
}

.main-decoration {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  pointer-events: none;
  z-index: 1;
  overflow: hidden;
  border-radius: var(--lg-radius-xl, 20px);
}

.decoration-circle {
  position: absolute;
  border-radius: 50%;
  background: radial-gradient(circle, rgba(255, 255, 255, 0.1) 0%, transparent 70%);
  animation: float-decoration 8s ease-in-out infinite;
}

.decoration-circle-1 {
  width: 200px;
  height: 200px;
  top: -100px;
  right: -100px;
  animation-delay: 0s;
}

.decoration-circle-2 {
  width: 150px;
  height: 150px;
  bottom: -75px;
  left: -75px;
  animation-delay: 2s;
}

.decoration-circle-3 {
  width: 100px;
  height: 100px;
  top: 50%;
  right: 10%;
  animation-delay: 4s;
}

@keyframes float-decoration {
  0%, 100% { 
    transform: translateY(0px) scale(1);
    opacity: 0.3;
  }
  50% { 
    transform: translateY(-20px) scale(1.1);
    opacity: 0.1;
  }
}

/* 响应式设计 */
@media (max-width: 768px) {
  .dashboard-container {
    padding: 8px;
  }
  
  .dashboard-layout {
    gap: 8px;
  }
  
  .dashboard-aside {
    border-radius: var(--lg-radius-lg, 16px);
  }
  
  .dashboard-header {
    border-radius: var(--lg-radius-lg, 16px);
    padding: 0 16px;
  }
  
  .dashboard-main {
    border-radius: var(--lg-radius-lg, 16px);
    padding: 16px;
  }
}

/* 折叠状态下的特殊样式 */
.dashboard-aside[style*="width: 64px"] .dashboard-logo {
  justify-content: center;
  padding: 0;
}

.dashboard-aside[style*="width: 64px"] .dashboard-logo .logo-icon {
  margin: 0;
}

/* 确保下拉菜单也有glass效果 */
:deep(.el-dropdown-menu) {
  background: rgba(255, 255, 255, 0.15) !important;
  backdrop-filter: blur(20px) !important;
  -webkit-backdrop-filter: blur(20px) !important;
  border: 1px solid rgba(255, 255, 255, 0.3) !important;
  border-radius: var(--lg-radius-md, 12px) !important;
  box-shadow: 0 8px 32px rgba(0, 0, 0, 0.15) !important;
}

:deep(.el-dropdown-menu .el-dropdown-menu__item) {
  color: rgba(255, 255, 255, 0.9) !important;
  border-radius: var(--lg-radius-sm, 8px) !important;
  margin: 2px 4px !important;
  transition: all 0.3s var(--lg-ease, cubic-bezier(0.4, 0, 0.2, 1)) !important;
}

:deep(.el-dropdown-menu .el-dropdown-menu__item:hover) {
  background: rgba(255, 255, 255, 0.2) !important;
  color: white !important;
}
</style> 
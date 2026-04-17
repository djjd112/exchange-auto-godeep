<template>
  <div class="not-found-container">
    <div class="not-found-content">
      <h1 class="not-found-code">404</h1>
      <h2 class="not-found-title">页面不存在</h2>
      <p class="not-found-desc">抱歉，您访问的页面不存在或已被删除</p>
      <el-button type="primary" @click="goHome" class="not-found-button">
        返回首页
      </el-button>
    </div>
  </div>
</template>

<script setup>
import { useRouter } from 'vue-router'

const router = useRouter()

const goHome = () => {
  router.push('/dashboard/server')
}
</script>

<style scoped>
.not-found-container {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
  background-color: var(--background-color);
}

.not-found-content {
  text-align: center;
  padding: 40px;
  background-color: white;
  border-radius: 16px;
  box-shadow: 0 4px 16px rgba(0, 0, 0, 0.08);
  max-width: 500px;
}

.not-found-code {
  font-size: 120px;
  color: var(--primary-color);
  margin: 0;
  line-height: 1;
}

.not-found-title {
  font-size: 32px;
  color: var(--text-color);
  margin: 20px 0;
}

.not-found-desc {
  font-size: 16px;
  color: #606266;
  margin-bottom: 30px;
}

.not-found-button {
  width: 200px;
  height: 50px;
  border-radius: 8px;
  font-size: 16px;
}
</style> 
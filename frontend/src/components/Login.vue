<template>
  <div class="login-container">
    <div class="login-card">
      <h2 class="login-title">自动化运维部署平台</h2>
      <el-form ref="loginFormRef" :model="loginForm" :rules="loginRules" class="login-form">
        <el-form-item prop="username">
          <el-input 
            v-model="loginForm.username" 
            placeholder="用户名" 
            prefix-icon="User"
            class="login-input"
          />
        </el-form-item>
        <el-form-item prop="password">
          <el-input 
            v-model="loginForm.password" 
            placeholder="密码" 
            prefix-icon="Lock"
            type="password" 
            show-password
            class="login-input"
          />
        </el-form-item>
        <el-form-item>
          <el-button 
            type="primary" 
            :loading="loading" 
            class="login-button" 
            @click="handleLogin"
          >
            登录
          </el-button>
        </el-form-item>
      </el-form>
    </div>

    <!-- Google验证码弹框 - Liquid Glass风格 -->
    <div v-if="twoFactorDialogVisible" class="liquid-glass-overlay" @click="handleCancelTwoFactor">
      <div class="liquid-glass-modal" @click.stop>
        <div class="liquid-glass-header">
          <div class="security-icon-container">
            <div class="security-icon">
              <svg width="64" height="64" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M12 1L3 5V11C3 16.55 6.84 21.74 12 23C17.16 21.74 21 16.55 21 11V5L12 1Z" stroke="url(#gradient)" stroke-width="2" fill="url(#fillGradient)"/>
                <path d="M9 12L11 14L15 10" stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                <defs>
                  <linearGradient id="gradient" x1="0%" y1="0%" x2="100%" y2="100%">
                    <stop offset="0%" style="stop-color:#667eea"/>
                    <stop offset="100%" style="stop-color:#764ba2"/>
                  </linearGradient>
                  <linearGradient id="fillGradient" x1="0%" y1="0%" x2="100%" y2="100%">
                    <stop offset="0%" style="stop-color:#667eea;stop-opacity:0.3"/>
                    <stop offset="100%" style="stop-color:#764ba2;stop-opacity:0.3"/>
                  </linearGradient>
                </defs>
              </svg>
            </div>
          </div>
          <h3 class="liquid-glass-title">安全验证</h3>
          <p class="liquid-glass-subtitle">请输入Google验证器中的6位数字验证码</p>
        </div>
        
        <div class="liquid-glass-content">
          <div class="verification-code-container">
            <div class="code-input-group">
              <input
                v-for="(digit, index) in codeDigits"
                :key="index"
                :ref="el => codeInputs[index] = el"
                v-model="codeDigits[index]"
                type="text"
                maxlength="1"
                :class="['code-digit-input', { 'code-error': codeError }]"
                @input="handleCodeInput(index, $event)"
                @keydown="handleKeyDown(index, $event)"
                @paste="handlePaste($event)"
              />
            </div>
            <div class="code-input-hint">
              <div class="hint-icon">📱</div>
              <span>打开Google Authenticator查看验证码</span>
            </div>
          </div>
        </div>
        
        <div class="liquid-glass-footer">
          <button class="liquid-glass-btn secondary" @click="handleCancelTwoFactor">
            <span>取消</span>
          </button>
          <button 
            class="liquid-glass-btn primary" 
            :class="{ loading: twoFactorLoading, disabled: !isCodeComplete }"
            :disabled="!isCodeComplete || twoFactorLoading"
            @click="handleVerifyTwoFactor"
          >
            <div v-if="twoFactorLoading" class="loading-spinner"></div>
            <span v-else>验证</span>
          </button>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, reactive, computed } from 'vue'
import { useRouter } from 'vue-router'
import { ElMessage } from 'element-plus'
import { useUserStore } from '@/store/user'
import { login, verifyTwoFactor } from '@/api/user'

const router = useRouter()
const userStore = useUserStore()
const loading = ref(false)
const twoFactorLoading = ref(false)
const twoFactorDialogVisible = ref(false)

// 登录表单引用
const loginFormRef = ref(null)
const twoFactorFormRef = ref(null)

// 登录表单
const loginForm = reactive({
  username: '',
  password: ''
})

// 二次验证表单
const twoFactorForm = reactive({
  code: ''
})

// 验证码数字数组
const codeDigits = ref(['', '', '', '', '', ''])
const codeInputs = ref([])
const codeError = ref(false) // 验证码错误状态

// 检查验证码是否完整
const isCodeComplete = computed(() => {
  return codeDigits.value.every(digit => digit !== '')
})

// 临时存储登录响应数据
let tempLoginData = null

// 表单验证规则
const loginRules = {
  username: [
    { required: true, message: '请输入用户名', trigger: 'blur' }
  ],
  password: [
    { required: true, message: '请输入密码', trigger: 'blur' },
    { min: 6, message: '密码长度不能少于6位', trigger: 'blur' }
  ]
}

// 二次验证表单验证规则
const twoFactorRules = {
  code: [
    { required: true, message: '请输入验证码', trigger: 'blur' },
    { pattern: /^\d{6}$/, message: '验证码必须是6位数字', trigger: 'blur' }
  ]
}

// 处理登录
const handleLogin = async () => {
  if (!loginFormRef.value) return
  
  try {
    await loginFormRef.value.validate()
    loading.value = true
    
    // 调用登录接口
    const res = await login(loginForm)
    
    // 检查是否需要二次验证
    if (res.data.requireTwoFactor) {
      // 需要二次验证，保存登录数据并显示验证码弹框
      tempLoginData = res.data
      twoFactorDialogVisible.value = true
      twoFactorForm.code = ''
      loading.value = false
    } else {
      // 不需要二次验证，直接登录成功
      handleLoginSuccess(res.data)
    }
  } catch (error) {
    console.error('登录失败:', error)
    ElMessage({
      message: error?.message || '登录失败，请检查用户名和密码',
      type: 'error'
    })
    loading.value = false
  }
}

// 处理验证码输入
const handleCodeInput = (index, event) => {
  const value = event.target.value
  if (!/^\d*$/.test(value)) {
    codeDigits.value[index] = ''
    return
  }
  
  // 清除错误状态
  if (codeError.value) {
    codeError.value = false
  }
  
  codeDigits.value[index] = value
  
  // 自动跳转到下一个输入框
  if (value && index < 5) {
    codeInputs.value[index + 1]?.focus()
  }
  
  // 更新表单数据
  twoFactorForm.code = codeDigits.value.join('')
  
  // 如果输入完第6位，自动验证
  if (index === 5 && value && codeDigits.value.every(digit => digit !== '')) {
    setTimeout(() => {
      handleVerifyTwoFactor()
    }, 100) // 稍微延迟一下，确保UI更新完成
  }
}

// 处理键盘事件
const handleKeyDown = (index, event) => {
  if (event.key === 'Backspace' && !codeDigits.value[index] && index > 0) {
    codeInputs.value[index - 1]?.focus()
  }
  if (event.key === 'ArrowLeft' && index > 0) {
    codeInputs.value[index - 1]?.focus()
  }
  if (event.key === 'ArrowRight' && index < 5) {
    codeInputs.value[index + 1]?.focus()
  }
}

// 处理粘贴事件
const handlePaste = (event) => {
  event.preventDefault()
  const pastedData = event.clipboardData.getData('text').replace(/\D/g, '').slice(0, 6)
  for (let i = 0; i < 6; i++) {
    codeDigits.value[i] = pastedData[i] || ''
  }
  twoFactorForm.code = codeDigits.value.join('')
  
  // 如果粘贴的是完整的6位验证码，自动验证
  if (pastedData.length === 6) {
    setTimeout(() => {
      handleVerifyTwoFactor()
    }, 100)
  }
}

// 处理二次验证
const handleVerifyTwoFactor = async () => {
  if (!isCodeComplete.value) return
  
  try {
    twoFactorLoading.value = true
    
    // 调用二次验证接口
    const verifyData = {
      username: loginForm.username,
      code: twoFactorForm.code,
      tempToken: tempLoginData?.tempToken // 如果后端需要临时token
    }
    
    const res = await verifyTwoFactor(verifyData)
    
    // 验证成功，处理登录
    handleLoginSuccess(res.data)
    twoFactorDialogVisible.value = false
  } catch (error) {
    console.error('验证码验证失败:', error)
    
    // 处理不同的错误情况
    let errorMessage = '验证码错误，请重新输入'
    
    if (error.response && error.response.data) {
      const { code, message } = error.response.data
      if (code === 401) {
        errorMessage = '验证码错误，请重新输入'
      } else if (message) {
        errorMessage = message
      }
    } else if (error.message) {
      errorMessage = error.message
    }
    
    ElMessage({
      message: errorMessage,
      type: 'error',
      duration: 3000
    })
    
    // 设置错误状态
    codeError.value = true
    
    // 清空验证码
    codeDigits.value = ['', '', '', '', '', '']
    twoFactorForm.code = ''
    
    // 聚焦到第一个输入框
    setTimeout(() => {
      codeInputs.value[0]?.focus()
      // 1秒后清除错误状态
      setTimeout(() => {
        codeError.value = false
      }, 1000)
    }, 100)
    
    twoFactorLoading.value = false
  }
}

// 处理登录成功
const handleLoginSuccess = (data) => {
  const { token, username, role } = data
  userStore.setToken(token)
  userStore.setUsername(username)
  userStore.setRole(role)
  
  ElMessage({
    message: '登录成功',
    type: 'success'
  })
  
  router.push('/dashboard/server')
  loading.value = false
  twoFactorLoading.value = false
}

// 取消二次验证
const handleCancelTwoFactor = () => {
  twoFactorDialogVisible.value = false
  twoFactorForm.code = ''
  codeDigits.value = ['', '', '', '', '', '']
  codeError.value = false
  tempLoginData = null
  loading.value = false
}
</script>

<style scoped>
/* Liquid Glass 登录页面样式 */
.login-container {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  position: relative;
  overflow: hidden;
}

.login-container::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: 
    radial-gradient(circle at 20% 80%, rgba(120, 119, 198, 0.3) 0%, transparent 50%),
    radial-gradient(circle at 80% 20%, rgba(255, 255, 255, 0.15) 0%, transparent 50%),
    radial-gradient(circle at 40% 40%, rgba(120, 119, 198, 0.2) 0%, transparent 50%);
  animation: float 20s ease-in-out infinite;
}

@keyframes float {
  0%, 100% { transform: translateY(0px) rotate(0deg); }
  33% { transform: translateY(-20px) rotate(1deg); }
  66% { transform: translateY(10px) rotate(-1deg); }
}

.login-card {
  width: 420px;
  padding: 48px;
  background: rgba(255, 255, 255, 0.1);
  backdrop-filter: blur(20px);
  -webkit-backdrop-filter: blur(20px);
  border-radius: 24px;
  border: 1px solid rgba(255, 255, 255, 0.2);
  box-shadow: 
    0 8px 32px rgba(0, 0, 0, 0.1),
    inset 0 1px 0 rgba(255, 255, 255, 0.2);
  animation: slideUp 0.8s cubic-bezier(0.16, 1, 0.3, 1);
  position: relative;
  z-index: 1;
}

@keyframes slideUp {
  from {
    opacity: 0;
    transform: translateY(40px) scale(0.95);
  }
  to {
    opacity: 1;
    transform: translateY(0) scale(1);
  }
}

.login-title {
  text-align: center;
  margin-bottom: 40px;
  color: white;
  font-size: 32px;
  font-weight: 700;
  text-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  background: linear-gradient(135deg, #ffffff 0%, #f0f0f0 100%);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-clip: text;
}

.login-form {
  margin-top: 20px;
}

.login-input {
  height: 56px;
  margin-bottom: 24px;
}

.login-input :deep(.el-input__inner) {
  background: rgba(255, 255, 255, 0.1);
  backdrop-filter: blur(10px);
  border: 1px solid rgba(255, 255, 255, 0.2);
  border-radius: 16px;
  height: 56px;
  color: white;
  font-size: 16px;
  padding: 0 20px;
  transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
}

.login-input :deep(.el-input__inner):focus {
  background: rgba(255, 255, 255, 0.15);
  border-color: rgba(255, 255, 255, 0.4);
  box-shadow: 0 0 0 4px rgba(255, 255, 255, 0.1);
}

.login-input :deep(.el-input__inner)::placeholder {
  color: rgba(255, 255, 255, 0.6);
}

.login-input :deep(.el-input__prefix) {
  color: rgba(255, 255, 255, 0.7);
}

.login-button {
  width: 100%;
  height: 56px;
  border-radius: 16px;
  font-size: 16px;
  font-weight: 600;
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  border: none;
  color: white;
  transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
  position: relative;
  overflow: hidden;
}

.login-button::before {
  content: '';
  position: absolute;
  top: 0;
  left: -100%;
  width: 100%;
  height: 100%;
  background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
  transition: left 0.5s;
}

.login-button:hover::before {
  left: 100%;
}

.login-button:hover {
  transform: translateY(-2px);
  box-shadow: 0 12px 24px rgba(102, 126, 234, 0.4);
}

.login-button:active {
  transform: translateY(0);
}

/* Liquid Glass 二次验证弹框样式 */
.liquid-glass-overlay {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: rgba(0, 0, 0, 0.5);
  backdrop-filter: blur(8px);
  display: flex;
  justify-content: center;
  align-items: center;
  z-index: 9999;
  animation: fadeIn 0.3s ease-out;
}

.liquid-glass-modal {
  width: 480px;
  background: rgba(255, 255, 255, 0.25);
  backdrop-filter: blur(20px);
  -webkit-backdrop-filter: blur(20px);
  border-radius: 24px;
  border: 1px solid rgba(255, 255, 255, 0.4);
  box-shadow: 
    0 20px 40px rgba(0, 0, 0, 0.2),
    inset 0 1px 0 rgba(255, 255, 255, 0.4);
  animation: modalSlideUp 0.4s cubic-bezier(0.16, 1, 0.3, 1);
  overflow: hidden;
}

@keyframes modalSlideUp {
  from {
    opacity: 0;
    transform: translateY(40px) scale(0.9);
  }
  to {
    opacity: 1;
    transform: translateY(0) scale(1);
  }
}

.liquid-glass-header {
  padding: 32px 32px 24px;
  text-align: center;
  border-bottom: 1px solid rgba(255, 255, 255, 0.3);
  background: rgba(255, 255, 255, 0.1);
}

.security-icon-container {
  margin-bottom: 20px;
}

.security-icon {
  display: inline-block;
  animation: pulse 2s ease-in-out infinite;
}

@keyframes pulse {
  0%, 100% { transform: scale(1); }
  50% { transform: scale(1.05); }
}

.liquid-glass-title {
  color: #2c3e50;
  font-size: 24px;
  font-weight: 700;
  margin: 0 0 8px 0;
  text-shadow: 0 1px 2px rgba(255, 255, 255, 0.5);
}

.liquid-glass-subtitle {
  color: #34495e;
  font-size: 14px;
  margin: 0;
  line-height: 1.5;
  font-weight: 500;
}

.liquid-glass-content {
  padding: 32px;
}

.verification-code-container {
  text-align: center;
}

.code-input-group {
  display: flex;
  justify-content: center;
  gap: 12px;
  margin-bottom: 24px;
}

.code-digit-input {
  width: 48px;
  height: 56px;
  background: rgba(255, 255, 255, 0.4);
  backdrop-filter: blur(10px);
  border: 2px solid rgba(255, 255, 255, 0.6);
  border-radius: 12px;
  text-align: center;
  font-size: 24px;
  font-weight: 600;
  color: #2c3e50;
  transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
  outline: none;
  text-shadow: 0 1px 2px rgba(255, 255, 255, 0.5);
}

.code-digit-input:focus {
  background: rgba(255, 255, 255, 0.6);
  border-color: #667eea;
  box-shadow: 0 0 0 4px rgba(102, 126, 234, 0.2);
  transform: scale(1.05);
}

.code-digit-input.code-error {
  border-color: #ff4757 !important;
  background: rgba(255, 71, 87, 0.1) !important;
  animation: shake 0.5s ease-in-out;
}

@keyframes shake {
  0%, 100% { transform: translateX(0); }
  25% { transform: translateX(-5px); }
  75% { transform: translateX(5px); }
}

.code-input-hint {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 8px;
  color: #2c3e50;
  font-size: 14px;
  font-weight: 600;
  text-shadow: 0 1px 2px rgba(255, 255, 255, 0.3);
  background: rgba(255, 255, 255, 0.1);
  backdrop-filter: blur(10px);
  padding: 8px 16px;
  border-radius: 8px;
  border: 1px solid rgba(255, 255, 255, 0.2);
}

.hint-icon {
  font-size: 18px;
}

.liquid-glass-footer {
  padding: 24px 32px 32px;
  display: flex;
  gap: 16px;
  justify-content: flex-end;
  background: rgba(255, 255, 255, 0.05);
  border-top: 1px solid rgba(255, 255, 255, 0.2);
}

.liquid-glass-btn {
  padding: 12px 24px;
  border-radius: 12px;
  font-size: 14px;
  font-weight: 600;
  border: none;
  cursor: pointer;
  transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
  position: relative;
  overflow: hidden;
  min-width: 80px;
  height: 44px;
  display: flex;
  align-items: center;
  justify-content: center;
}

.liquid-glass-btn.secondary {
  background: rgba(255, 255, 255, 0.3);
  color: #34495e;
  border: 1px solid rgba(255, 255, 255, 0.4);
  font-weight: 600;
}

.liquid-glass-btn.secondary:hover {
  background: rgba(255, 255, 255, 0.4);
  color: #2c3e50;
}

.liquid-glass-btn.primary {
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  color: white;
  box-shadow: 0 4px 12px rgba(102, 126, 234, 0.3);
}

.liquid-glass-btn.primary:hover:not(.disabled) {
  transform: translateY(-2px);
  box-shadow: 0 8px 20px rgba(102, 126, 234, 0.4);
}

.liquid-glass-btn.primary.disabled {
  opacity: 0.5;
  cursor: not-allowed;
}

.liquid-glass-btn.primary.loading {
  cursor: not-allowed;
}

.loading-spinner {
  width: 16px;
  height: 16px;
  border: 2px solid rgba(255, 255, 255, 0.3);
  border-top: 2px solid white;
  border-radius: 50%;
  animation: spin 1s linear infinite;
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}

@keyframes fadeIn {
  from { opacity: 0; }
  to { opacity: 1; }
}

/* 响应式设计 */
@media (max-width: 768px) {
  .login-card {
    width: 90%;
    max-width: 400px;
    padding: 32px 24px;
  }
  
  .liquid-glass-modal {
    width: 90%;
    max-width: 400px;
    margin: 20px;
  }
  
  .code-input-group {
    gap: 8px;
  }
  
  .code-digit-input {
    width: 40px;
    height: 48px;
    font-size: 20px;
  }
}
</style> 
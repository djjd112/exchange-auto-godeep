import request from '@/utils/request'

// 登录接口
export function login(data) {
  return request({
    url: '/user/login',
    method: 'post',
    data
  })
}

// 获取用户信息
export function getUserInfo() {
  return request({
    url: '/user/info',
    method: 'get'
  })
}

// 登出接口
export function logout() {
  return request({
    url: '/user/logout',
    method: 'post'
  })
}

// 二次验证接口
export function verifyTwoFactor(data) {
  return request({
    url: '/user/verify-2fa',
    method: 'post',
    data
  })
} 
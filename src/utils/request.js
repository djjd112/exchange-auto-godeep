import axios from 'axios'
import {ElMessage} from 'element-plus'
import router from '@/router'

console.log(process.env.NODE_ENV)

const service = axios.create({
    baseURL: 'http://localhost:8080/api',
    timeout: 10000,
    headers: {
        'Content-Type': 'application/json'
    },
    withCredentials: true,
})

// 请求拦截器
service.interceptors.request.use(
    config => {
        const token = localStorage.getItem('token')
        if (token) {
            config.headers['Authorization'] = `Bearer ${token}`
        }
        return config
    },
    error => {
        console.error('请求错误:', error)
        return Promise.reject(error)
    }
)

// 响应拦截器
service.interceptors.response.use(
    response => {
        const res = response.data
        console.log('响应数据res:', res)
        // 如果返回的状态码不是200，说明接口请求有误
        if (res.code !== 200) {
            ElMessage({
                message: res.message || '请求失败',
                type: 'error',
                duration: 5 * 1000
            })

            // 401: 未登录或token过期
            if (res.code === 401) {
                router.push('/login')
            }

            return Promise.reject(new Error(res.message || '请求失败'))
        } else {
            return res
        }
    },
    error => {
         console.error('响应错误onRejected:', error.response)
        const res = error.response.data
        if (res.code === 401) {
            router.push('/login')
        }
        // ElMessage({
        //   message: error.message || '请求失败',
        //   type: 'error',
        //   duration: 5 * 1000
        // })
        return Promise.reject(res.message)
    }
)

export default service 
import request from '@/utils/request'

// 获取部署列表
export function getDeployList(params) {
  return request({
    url: '/deploy/list',
    method: 'get',
    params
  })
}
// 获取部署详情
export function getDeployDetail(id) {
  return request({
    url: `/deploy/detail/${id}`,
    method: 'get'
  })
}

// 创建部署任务
export function createDeploy(data) {
  return request({
    url: '/deploy/create',
    method: 'post',
    data
  })
}

// 执行部署
export function executeDeploy(id) {
  return request({
    url: `/deploy/execute/${id}`,
    method: 'post'
  })
}

// 获取部署日志
export function getDeployLogs(id) {
  return request({
    url: `/deploy/logs/${id}`,
    method: 'get'
  })
}

// 测试部署
export function testDeploy(id) {
  return request({
    url: `/deploy/test/${id}`,
    method: 'post'
  })
} 
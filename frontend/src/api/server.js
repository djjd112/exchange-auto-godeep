import request from '@/utils/request'

// 获取服务器列表
export function getServerList(params) {
  return request({
    url: '/server/list',
    method: 'get',
    params
  })
}

// 获取服务器详情
export function getServerDetail(id) {
  return request({
    url: `/server/detail/${id}`,
    method: 'get'
  })
}

// 新增服务器
export function addServer(data) {
  return request({
    url: '/server/add',
    method: 'post',
    data
  })
}

// 更新服务器
export function updateServer(id, data) {
  return request({
    url: `/server/update/${id}`,
    method: 'put',
    data
  })
}

// 删除服务器（逻辑删除）
export function deleteServer(id) {
  return request({
    url: `/server/delete/${id}`,
    method: 'delete'
  })
}

// 连接服务器
export function connectServer(id) {
  return request({
    url: `/server/connect/${id}`,
    method: 'post'
  })
}

// 获取服务器状态信息
export function getServerStatus(id) {
  return request({
    url: `/server/status/${id}`,
    method: 'get'
  })
} 
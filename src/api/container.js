import request from '@/utils/request'

// 获取容器列表
export function getContainerList(params) {
  return request({
    url: '/container/list',
    method: 'get',
    params
  })
}

// 获取容器详情
export function getContainerDetail(id) {
  return request({
    url: `/container/detail/${id}`,
    method: 'get'
  })
}

// 新增容器
export function addContainer(data) {
  return request({
    url: '/container/add',
    method: 'post',
    data
  })
}

// 更新容器
export function updateContainer(id, data) {
  return request({
    url: `/container/update/${id}`,
    method: 'put',
    data
  })
}

// 删除容器（逻辑删除）
export function deleteContainer(id) {
  return request({
    url: `/container/delete/${id}`,
    method: 'delete'
  })
}

// 获取容器版本列表
export function getContainerVersions(id) {
  return request({
    url: `/container/versions/${id}`,
    method: 'get'
  })
}

// 根据服务ID获取容器列表
export function getContainersByServiceID(serviceId) {
  return request({
    url: `/container/by-service/${serviceId}`,
    method: 'get'
  })
}

// 根据服务ID获取容器列表
export function getContainersVersionsByServiceID(serviceId) {
  return request({
    url: `/container/version-by-service/${serviceId}`,
    method: 'get'
  })
}
import request from '@/utils/request'

// 获取服务列表
export function getServiceList(params) {
  return request({
    url: '/service/list',
    method: 'get',
    params
  })
}

// 获取服务详情
export function getServiceDetail(id) {
  return request({
    url: `/service/detail/${id}`,
    method: 'get'
  })
}

// 新增服务
export function addService(data) {
  return request({
    url: '/service/add',
    method: 'post',
    data
  })
}

// 更新服务
export function updateService(id, data) {
  return request({
    url: `/service/update/${id}`,
    method: 'put',
    data
  })
}

// 删除服务
export function deleteService(id) {
  return request({
    url: `/service/delete/${id}`,
    method: 'delete'
  })
}

// 部署服务
export function deployService(id) {
  return request({
    url: `/service/deploy/${id}`,
    method: 'post'
  })
}

// 测试服务
export function testService(id) {
  return request({
    url: `/service/test/${id}`,
    method: 'post'
  })
} 
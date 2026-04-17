import request from '@/utils/request'

// 获取文件列表
export function getFileList(params) {
  return request({
    url: '/file/list',
    method: 'get',
    params
  })
}

// 获取文件详情
export function getFileDetail(id) {
  return request({
    url: `/file/detail/${id}`,
    method: 'get'
  })
}

// 新增文件
export function addFile(data) {
  return request({
    url: '/file/add',
    method: 'post',
    data
  })
}

// 更新文件
export function updateFile(id, data) {
  return request({
    url: `/file/update/${id}`,
    method: 'put',
    data
  })
}

// 删除文件（逻辑删除）
export function deleteFile(id) {
  return request({
    url: `/file/delete/${id}`,
    method: 'delete'
  })
}

// 发送文件到服务器
export function sendFile(data) {
  return request({
    url: '/file/send',
    method: 'post',
    data
  })
}

// 验证YAML格式
export function validateYaml(data) {
  return request({
    url: '/file/validate-yaml',
    method: 'post',
    data
  })
}

// 根据服务ID获取文件列表
export function getFilesByServiceID(serviceId) {
  return request({
    url: `/file/by-service/${serviceId}`,
    method: 'get'
  })
} 
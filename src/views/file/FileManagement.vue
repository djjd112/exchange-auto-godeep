<template>
  <div class="file-management-container">
    <div class="file-management-header">
      <h2 class="file-management-title">📁 文件管理</h2>
      <el-button type="primary" @click="handleAddFile">
        <el-icon><Plus /></el-icon>
        新增文件
      </el-button>
    </div>
    
    <!-- 搜索区域 -->
    <div class="file-search-container apple-card">
      <el-form :inline="true" :model="searchForm" class="file-search-form">
        <el-form-item label="文件名称">
          <el-input 
            v-model="searchForm.name" 
            placeholder="请输入文件名称" 
            clearable
            style="width: 200px;"
          />
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="handleSearch">
            <el-icon><Search/></el-icon>
            搜索
          </el-button>
          <el-button @click="resetSearch">
            <el-icon><Refresh/></el-icon>
            重置
          </el-button>
        </el-form-item>
      </el-form>
    </div>
    
    <!-- 表格区域 -->
    <div class="file-table-container apple-card">
      <el-table
        v-loading="loading"
        :data="fileList"
        border
        style="width: 100%"
        :scroll-x="true"
        table-layout="auto"
      >
        <el-table-column prop="name" label="文件名称" min-width="220" show-overflow-tooltip/>
        <el-table-column prop="service_name" label="服务名称" min-width="160" show-overflow-tooltip/>
        <el-table-column label="操作" min-width="260" align="center">
          <template #default="scope">
            <div class="table-actions">
              <el-button
                  type="primary"
                  link
                  size="small"
                  @click="handleView(scope.row)"
              >
                <el-icon><View /></el-icon>查看
              </el-button>
              <el-button
                  type="primary"
                  link
                  size="small"
                  @click="handleEdit(scope.row)"
              >
                <el-icon><Edit /></el-icon>编辑
              </el-button>
              <el-button
                  type="primary"
                  link
                  size="small"
                  @click="handleSend(scope.row)"
              >
                <el-icon><Upload /></el-icon>发送
              </el-button>
              <el-button
                  type="danger"
                  link
                  size="small"
                  @click="handleDelete(scope.row)"
              >
                <el-icon><Delete /></el-icon>作废
              </el-button>
            </div>
          </template>
        </el-table-column>
      </el-table>
      
      <!-- 分页 -->
      <div class="file-pagination">
        <el-pagination
          v-model:current-page="currentPage"
          v-model:page-size="pageSize"
          :page-sizes="[10, 20, 50, 100]"
          layout="total, sizes, prev, pager, next, jumper"
          :total="total"
          @size-change="handleSizeChange"
          @current-change="handleCurrentChange"
        />
      </div>
    </div>
    
    <!-- 新增/编辑文件对话框 -->
    <el-dialog
      v-model="dialogVisible"
      :title="dialogType === 'add' ? '新增文件' : '编辑文件'"
      width="800px"
    >
      <el-form
        ref="fileFormRef"
        :model="fileForm"
        :rules="fileRules"
        label-width="100px"
      >
        <el-form-item label="文件名称" prop="name">
          <el-input v-model="fileForm.name" placeholder="请输入文件名称" />
        </el-form-item>
        <el-form-item label="服务" prop="service_id">
          <el-popover
            placement="bottom-start"
            :width="400"
            trigger="manual"
            v-model:visible="serviceSelectVisible"
          >
            <template #reference>
              <el-input
                v-model="serviceSearchText"
                placeholder="请选择或搜索服务"
                clearable
                readonly
                style="width: 100%; cursor: pointer;"
                @click="handleServiceInputClick"
                @clear="clearServiceSelection"
              >
                <template #suffix>
                  <el-icon class="el-input__icon">
                    <ArrowDown />
                  </el-icon>
                </template>
              </el-input>
            </template>
            
            <div class="service-select-panel" @click.stop>
              <div class="service-search-input">
                <el-input
                  v-model="serviceFilterText"
                  placeholder="搜索服务名称..."
                  clearable
                  size="small"
                >
                  <template #prefix>
                    <el-icon><Search /></el-icon>
                  </template>
                </el-input>
              </div>
              
              <div class="service-category-tabs">
                <div 
                  v-for="category in serviceCategories" 
                  :key="category.value"
                  class="category-tab-small"
                  :class="{ 'active': selectedServiceCategory === category.value }"
                  @click="selectedServiceCategory = category.value"
                >
                  <span class="category-icon-small">{{ getCategoryIcon(category.value) }}</span>
                  <span class="category-label-small">{{ category.label }}</span>
                  <span class="category-count-small">({{ getServiceCountByCategory(category.value) }})</span>
                </div>
              </div>
              
              <div class="service-options-list">
                <div v-if="filteredServices.length === 0" class="no-services">
                  暂无匹配的服务
                </div>
                <div 
                  v-for="service in filteredServices" 
                  :key="service.id"
                  class="service-option"
                  :class="{ 'selected': fileForm.service_id === service.id }"
                  @click="selectService(service)"
                >
                  <div class="service-option-main">
                    <span class="service-option-name">{{ service.name }}</span>
                    <el-tag v-if="service.subCategory" type="info" size="small">{{ service.subCategory }}</el-tag>
                  </div>
                  <div class="service-option-desc">{{ service.remark || '暂无描述' }}</div>
                </div>
              </div>
            </div>
          </el-popover>
        </el-form-item>
        <el-form-item label="文件内容" prop="content">
          <el-input
            v-model="fileForm.content"
            type="textarea"
            :rows="15"
            placeholder="请输入YAML格式的文件内容"
            class="file-content-textarea"
          />
        </el-form-item>
      </el-form>
      <template #footer>
        <span class="dialog-footer">
          <el-button @click="dialogVisible = false">取消</el-button>
          <el-button type="primary" @click="handleValidateYaml">验证YAML</el-button>
          <el-button type="primary" @click="submitFileForm">确定</el-button>
        </span>
      </template>
    </el-dialog>
    
    <!-- 查看文件对话框 -->
    <el-dialog
      v-model="viewDialogVisible"
      title="文件详情"
      width="800px"
    >
      <div v-if="currentFile" class="file-detail">
        <div class="file-info-item">
          <span class="file-info-label">文件名称：</span>
          <span class="file-info-value">{{ currentFile.name }}</span>
        </div>
        <div class="file-info-item">
          <span class="file-info-label">服务名称：</span>
          <span class="file-info-value">{{ currentFile.service_name }}</span>
        </div>
        <div class="file-content">
          <h4>文件内容：</h4>
          <pre class="file-content-pre">{{ currentFile.content }}</pre>
        </div>
      </div>
    </el-dialog>
    
    <!-- 发送文件对话框 -->
    <el-dialog
      v-model="sendDialogVisible"
      title="发送文件"
      width="500px"
    >
      <el-form
        ref="sendFormRef"
        :model="sendForm"
        :rules="sendRules"
        label-width="100px"
      >
        <el-form-item label="选择服务器" prop="server_id">
          <el-select v-model="sendForm.server_id" placeholder="请选择服务器" style="width: 100%" :loading="serverLoading">
            <el-option
              v-for="item in serverOptions"
              :key="item.id"
              :label="item.name + ' (' + item.ip + ')'"
              :value="item.id"
            />
          </el-select>
        </el-form-item>
        <el-form-item label="版本号" prop="version">
          <el-select v-model="sendForm.version" placeholder="请选择版本号" style="width: 100%" :loading="versionLoading">
            <el-option
              v-for="item in versionOptions"
              :key="item"
              :label="item"
              :value="item"
            />
          </el-select>
        </el-form-item>
        <el-form-item label="发送目录" prop="directory">
          <el-input v-model="sendForm.directory" placeholder="请输入发送目录" />
        </el-form-item>
      </el-form>
      <template #footer>
        <span class="dialog-footer">
          <el-button @click="sendDialogVisible = false">取消</el-button>
          <el-button type="primary" @click="handleSendFile">确定</el-button>
        </span>
      </template>
    </el-dialog>
  </div>
</template>

<script setup>
import { ref, reactive, onMounted, onUnmounted, computed } from 'vue'
import { ElMessage, ElMessageBox } from 'element-plus'
import { getFileList, getFileDetail, addFile, updateFile, deleteFile, sendFile, validateYaml } from '@/api/file'
import { getServiceList } from '@/api/service'
import { getServerList } from '@/api/server'
import {getContainersVersionsByServiceID} from "@/api/container";

// 加载状态
const loading = ref(false)
const serviceLoading = ref(false)
const serverLoading = ref(false)
const versionLoading = ref(false)

// 文件列表
const fileList = ref([])

// 分页相关
const currentPage = ref(1)
const pageSize = ref(10)
const total = ref(0)

// 搜索表单
const searchForm = reactive({
  name: ''
})

// 对话框相关
const dialogVisible = ref(false)
const dialogType = ref('add') // add 或 edit
const viewDialogVisible = ref(false)
const sendDialogVisible = ref(false)

// 当前选中的文件
const currentFile = ref(null)

// 文件表单
const fileFormRef = ref(null)
const fileForm = reactive({
  id: '',
  name: '',
  service_id: '',
  service_name: '',
  content: ''
})

// 发送表单
const sendFormRef = ref(null)
const sendForm = reactive({
  file_id: '',
  server_id: '',
  directory: '/root/deploys',
  version: ''
})

// 服务器选项
const serverOptions = ref([])

// 服务选项
const serviceOptions = ref([])

// 版本号选项
const versionOptions = ref([])

// 服务选择相关
const serviceSelectVisible = ref(false)
const serviceSearchText = ref('')
const serviceFilterText = ref('')
const selectedServiceCategory = ref('全部')

// 服务分类选项
const serviceCategories = ref([
  { value: '全部', label: '全部' },
  { value: '现货', label: '现货' },
  { value: '合约', label: '合约' },
  { value: '钱包', label: '钱包' },
  { value: '中间件', label: '中间件' },
  { value: '用户中心', label: '用户中心' },
  { value: 'OTC服务', label: 'OTC服务' },
  { value: '告警服务', label: '告警服务' }
])

// 表单验证规则
const fileRules = {
  name: [
    { required: true, message: '请输入文件名称', trigger: 'blur' }
  ],
  service_id: [
    { required: true, message: '请选择服务', trigger: 'change' }
  ],
  content: [
    { required: true, message: '请输入文件内容', trigger: 'blur' }
  ]
}

// 发送表单验证规则
const sendRules = {
  server_id: [
    { required: true, message: '请选择服务器', trigger: 'change' }
  ],
  version: [
    { required: false, message: '请选择版本号', trigger: 'change' }
  ],
  directory: [
    { required: true, message: '请输入发送目录', trigger: 'blur' }
  ]
}

// 获取文件列表
const fetchFileList = async () => {
  loading.value = true
  try {
    const params = {
      page: currentPage.value,
      page_size: pageSize.value,
      ...searchForm
    }
    
    const res = await getFileList(params)
    fileList.value = res.data.files
    total.value = res.data.total
  } catch (error) {
    console.error('获取文件列表失败:', error)
    ElMessage.error('获取文件列表失败')
  } finally {
    loading.value = false
  }
}

// 搜索
const handleSearch = () => {
  currentPage.value = 1
  fetchFileList()
}

// 重置搜索
const resetSearch = () => {
  searchForm.name = ''
  handleSearch()
}

// 处理页码变化
const handleCurrentChange = (val) => {
  currentPage.value = val
  fetchFileList()
}

// 处理每页条数变化
const handleSizeChange = (val) => {
  pageSize.value = val
  currentPage.value = 1
  fetchFileList()
}

// 获取服务列表
const fetchServiceList = async () => {
  serviceLoading.value = true
  try {
    //为了显示加载所有的数据
    const res = await getServiceList({page: 1, page_size: 1000})
    if (res.data && res.data.services) {
      serviceOptions.value = res.data.services
    }
  } catch (error) {
    console.error('获取服务列表失败:', error)
    ElMessage.error('获取服务列表失败')
  } finally {
    serviceLoading.value = false
  }
}

// 处理服务变化（保留原方法以防其他地方使用）
const handleServiceChange = (value) => {
  // 根据选择的服务ID查找对应的服务信息
  const selectedService = serviceOptions.value.find(item => item.id === value)
  if (selectedService) {
    fileForm.service_name = selectedService.name
  }
}

// 新增文件
const handleAddFile = () => {
  dialogType.value = 'add'
  fileForm.id = ''
  fileForm.name = ''
  fileForm.service_id = ''
  fileForm.service_name = ''
  fileForm.content = ''
  
  // 重置服务选择相关状态
  serviceSearchText.value = ''
  serviceFilterText.value = ''
  selectedServiceCategory.value = '全部'
  serviceSelectVisible.value = false
  
  dialogVisible.value = true
  
  // 获取服务列表
  fetchServiceList()
}

// 编辑文件
const handleEdit = (row) => {
  dialogType.value = 'edit'
  currentFile.value = row
  fileForm.id = row.id
  fileForm.name = row.name
  fileForm.service_id = row.service_id
  fileForm.service_name = row.service_name
  fileForm.content = row.content
  
  // 设置服务选择相关状态
  serviceSearchText.value = row.service_name || ''
  serviceFilterText.value = ''
  selectedServiceCategory.value = '全部'
  serviceSelectVisible.value = false
  
  dialogVisible.value = true
  
  // 获取服务列表
  fetchServiceList()
}

// 查看文件
const handleView = (row) => {
  currentFile.value = row
  viewDialogVisible.value = true
}

// 发送文件
const handleSend = (row) => {
  currentFile.value = row
  sendForm.file_id = row.id
  sendForm.server_id = ''
  sendForm.version = ''
  sendForm.directory = '/root/deploys'
  sendDialogVisible.value = true
  
  // 获取服务器列表
  fetchServerList()
  // 获取版本号列表
  fetchVersionList(row.service_id)
}

// 删除文件
const handleDelete = (row) => {
  ElMessageBox.confirm(
    `确定要删除文件 ${row.name} 吗？`,
    '警告',
    {
      confirmButtonText: '确定',
      cancelButtonText: '取消',
      type: 'warning'
    }
  ).then(async () => {
    try {
      await deleteFile(row.id)
      ElMessage.success('删除文件成功')
      await fetchFileList() // 刷新列表
    } catch (error) {
      console.error('删除文件失败:', error)
      ElMessage.error('删除文件失败')
    }
  }).catch(() => {
    // 取消删除
  })
}

// 验证YAML
const handleValidateYaml = async () => {
  try {
    const res = await validateYaml({ content: fileForm.content })
    if (res.data.valid) {
      ElMessage.success('YAML格式验证通过')
    }
  } catch (error) {
    console.error('YAML格式验证失败:', error.response.data.message)
    ElMessage.error(error.response.data.message)
  }
}

// 提交文件表单
const submitFileForm = async () => {
  if (!fileFormRef.value) return
  
  try {
    await fileFormRef.value.validate()
    
    if (dialogType.value === 'add') {
      // 新增文件
      await addFile(fileForm)
      ElMessage.success('新增文件成功')
    } else {
      // 编辑文件
      const file_id = fileForm.id
      await updateFile(file_id, fileForm)
      ElMessage.success('编辑文件成功')
    }
    
    dialogVisible.value = false
    fetchFileList() // 刷新列表
  } catch (error) {
    console.error('提交文件表单失败:', error)
    ElMessage.error('提交失败，请检查表单')
  }
}

// 发送文件
const handleSendFile = async () => {
  if (!sendFormRef.value) return
  
  try {
    await sendFormRef.value.validate()
    
    const data = {
      file_id: sendForm.file_id,
      server_id: sendForm.server_id,
      directory: sendForm.directory,
      version: sendForm.version
    }
    
    await sendFile(data)
    ElMessage.success('文件发送成功')
    sendDialogVisible.value = false
  } catch (error) {
    console.error('发送文件失败:', error)
    ElMessage.error('发送文件失败')
  }
}

// 获取服务器列表
const fetchServerList = async () => {
  serverLoading.value = true
  try {
    const res = await getServerList({})
    if (res.data && res.data.servers) {
      serverOptions.value = res.data.servers
    }
  } catch (error) {
    console.error('获取服务器列表失败:', error)
    ElMessage.error('获取服务器列表失败')
  } finally {
    serverLoading.value = false
  }
}

// 获取版本号列表
const fetchVersionList = async (serviceId) => {
  versionOptions.value = []
  if (!serviceId) {
    return
  }
  
  versionLoading.value = true
  try {
    const res = await getContainersVersionsByServiceID(serviceId)
    if (res.data) {
      //res.data.versions是一个数组，对数据进行遍历取出version
      res.data.containers.forEach(item => {
        versionOptions.value.push(item.version)
      })
    }
  } catch (error) {
    console.error('获取版本号列表失败:', error)
    ElMessage.error('获取版本号列表失败')
  } finally {
    versionLoading.value = false
  }
}

// 过滤后的服务列表
const filteredServices = computed(() => {
  let services = serviceOptions.value
  
  // 按分类过滤
  if (selectedServiceCategory.value !== '全部') {
    services = services.filter(service => service.category === selectedServiceCategory.value)
  }
  
  // 按搜索文本过滤
  if (serviceFilterText.value) {
    const searchText = serviceFilterText.value.toLowerCase()
    services = services.filter(service => 
      service.name.toLowerCase().includes(searchText) ||
      (service.remark && service.remark.toLowerCase().includes(searchText))
    )
  }
  
  return services.slice(0, 20) // 最多显示20个
})

// 获取分类图标
const getCategoryIcon = (category) => {
  const icons = {
    '现货': '💰',
    '合约': '📊',
    '钱包': '👛',
    '中间件': '⚙️',
    '用户中心': '👤',
    '告警服务': '🔔',
    'OTC服务': '📈'
  }
  return icons[category] || '📦'
}

// 获取分类下的服务数量
const getServiceCountByCategory = (category) => {
  if (category === '全部') {
    return serviceOptions.value.length
  }
  return serviceOptions.value.filter(service => service.category === category).length
}

// 处理服务输入框点击
const handleServiceInputClick = (event) => {
  event.preventDefault()
  event.stopPropagation()
  serviceSelectVisible.value = !serviceSelectVisible.value
}

// 选择服务
const selectService = (service) => {
  fileForm.service_id = service.id
  fileForm.service_name = service.name
  serviceSearchText.value = service.name
  serviceSelectVisible.value = false
}

// 清空服务选择
const clearServiceSelection = () => {
  fileForm.service_id = ''
  fileForm.service_name = ''
  serviceSearchText.value = ''
}

// 全局点击处理函数
const handleGlobalClick = (event) => {
  // 检查点击的元素是否在服务选择区域内
  const serviceSelectPanel = document.querySelector('.service-select-panel')
  const serviceInput = document.querySelector('.file-management-container .el-input')
  
  if (serviceSelectVisible.value && 
      serviceSelectPanel && 
      serviceInput &&
      !serviceSelectPanel.contains(event.target) && 
      !serviceInput.contains(event.target)) {
    serviceSelectVisible.value = false
  }
}

// 页面加载时获取文件列表
onMounted(() => {
  fetchFileList()
  
  // 添加全局点击监听器
  document.addEventListener('click', handleGlobalClick)
})

// 组件卸载时清理事件监听器
onUnmounted(() => {
  document.removeEventListener('click', handleGlobalClick)
})
</script>

<style lang="scss" scoped>
@import '@/assets/styles/views/file.css';
</style> 
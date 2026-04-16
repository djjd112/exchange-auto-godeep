<template>
  <div class="container-management-container">
    <div class="container-management-header">
      <h2 class="container-management-title">🐳 容器管理</h2>
      <el-button type="primary" @click="handleAddContainer">
        <el-icon><Plus /></el-icon>
        新增容器
      </el-button>
    </div>
    
    <!-- 搜索区域 -->
    <div class="container-search-container apple-card">
      <el-form :inline="true" :model="searchForm" class="container-search-form">
        <el-form-item label="容器名称">
          <el-input 
            v-model="searchForm.name" 
            placeholder="请输入容器名称" 
            clearable
            style="width: 200px;"
          />
        </el-form-item>
        <el-form-item label="服务名称">
          <el-input 
            v-model="searchForm.service_name" 
            placeholder="请输入服务名称" 
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
    <div class="container-table-container apple-card">
      <el-table
        v-loading="loading"
        :data="containerList"
        border
        style="width: 100%"
        :scroll-x="true"
        table-layout="auto"
      >
        <el-table-column prop="name" label="容器名称" min-width="160" show-overflow-tooltip />
        <el-table-column prop="address" label="容器地址" min-width="220" show-overflow-tooltip/>
        <el-table-column prop="service_name" label="服务名称" min-width="160" show-overflow-tooltip />
        <el-table-column prop="md5" label="MD5值" min-width="180" show-overflow-tooltip/>
        <el-table-column prop="version" label="版本号" min-width="130" show-overflow-tooltip />
        <el-table-column label="操作" min-width="200" align="center">
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
                  type="danger"
                  link
                  size="small"
                  @click="handleDelete(scope.row)"
              >
                <el-icon><Delete /></el-icon>删除
              </el-button>
            </div>
          </template>
        </el-table-column>
      </el-table>
      
      <!-- 分页 -->
      <div class="container-pagination">
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
    
    <!-- 新增/编辑容器对话框 -->
    <el-dialog
      v-model="dialogVisible"
      :title="dialogType === 'add' ? '新增容器' : '编辑容器'"
      width="600px"
      :close-on-click-modal="false"
    >
      <div class="container-form-card">
        <!-- 基本信息卡片 -->
        <div class="form-card">
          <div class="card-header">
            <el-icon class="card-icon"><Box /></el-icon>
            <h3 class="card-title">基本信息</h3>
          </div>
          <div class="card-content">
            <el-form
              ref="containerFormRef"
              :model="containerForm"
              :rules="containerRules"
              label-width="100px"
            >
              <el-form-item label="容器名称" prop="name">
                <el-input 
                  v-model="containerForm.name" 
                  placeholder="请输入容器名称"
                  :prefix-icon="Document"
                />
              </el-form-item>
              <el-form-item label="容器地址" prop="address">
                <el-input 
                  v-model="containerForm.address" 
                  placeholder="请输入容器地址"
                  :prefix-icon="Link"
                />
              </el-form-item>
            </el-form>
          </div>
        </div>

        <!-- 服务配置卡片 -->
        <div class="form-card">
          <div class="card-header">
            <el-icon class="card-icon"><Service /></el-icon>
            <h3 class="card-title">服务配置</h3>
          </div>
          <div class="card-content">
            <el-form
              :model="containerForm"
              :rules="containerRules"
              label-width="100px"
            >
              <el-form-item label="关联服务" prop="service_id">
                <el-select 
                  v-model="containerForm.service_id"
                  placeholder="请选择服务" 
                  style="width: 100%" 
                  @change="handleServerChange"
                  :loading="serviceLoading"
                >
                  <el-option
                    v-for="item in serviceOptions"
                    :key="item.id"
                    :label="`${item.label} (ID: ${item.id})`"
                    :value="item.id"
                  />
                  <template #empty>
                    <div class="empty-service-tip">
                      <p>暂无服务数据</p>
                      <p>请先在服务管理页面添加服务</p>
                    </div>
                  </template>
                </el-select>
              </el-form-item>
              <el-form-item label="服务名称">
                <el-input 
                  v-model="containerForm.service_name" 
                  placeholder="服务名称将自动关联" 
                  disabled 
                  :prefix-icon="Service"
                />
              </el-form-item>
            </el-form>
          </div>
        </div>

        <!-- 版本信息卡片 -->
        <div class="form-card">
          <div class="card-header">
            <el-icon class="card-icon"><Setting /></el-icon>
            <h3 class="card-title">版本信息</h3>
          </div>
          <div class="card-content">
            <el-form
              :model="containerForm"
              :rules="containerRules"
              label-width="100px"
            >
              <el-form-item label="MD5值" prop="md5">
                <el-input 
                  v-model="containerForm.md5" 
                  placeholder="请输入MD5值"
                  :prefix-icon="Key"
                />
              </el-form-item>
              <el-form-item label="版本号" prop="version">
                <el-input 
                  v-model="containerForm.version" 
                  placeholder="请输入版本号"
                  :prefix-icon="PriceTag"
                />
              </el-form-item>
            </el-form>
          </div>
        </div>
      </div>
      
      <template #footer>
        <div class="dialog-footer">
          <el-button @click="dialogVisible = false">取消</el-button>
          <el-button type="primary" @click="submitContainerForm" :loading="loading">
            <el-icon><Check /></el-icon>
            {{ dialogType === 'add' ? '创建容器' : '保存修改' }}
          </el-button>
        </div>
      </template>
    </el-dialog>
    
    <!-- 查看容器对话框 -->
    <el-dialog
      v-model="viewDialogVisible"
      title="容器详情"
      width="600px"
      :close-on-click-modal="false"
    >
      <div v-if="currentContainer" class="container-detail-card">
        <!-- 基本信息卡片 -->
        <div class="detail-card">
          <div class="card-header">
            <el-icon class="card-icon"><Box /></el-icon>
            <h3 class="card-title">基本信息</h3>
          </div>
          <div class="card-content">
            <div class="info-grid">
              <div class="info-item">
                <div class="info-label">
                  <el-icon><Document /></el-icon>
                  容器名称
                </div>
                <div class="info-value">{{ currentContainer.name }}</div>
              </div>
              <div class="info-item">
                <div class="info-label">
                  <el-icon><Service /></el-icon>
                  服务名称
                </div>
                <div class="info-value">{{ currentContainer.service_name }}</div>
              </div>
            </div>
          </div>
        </div>

        <!-- 配置信息卡片 -->
        <div class="detail-card">
          <div class="card-header">
            <el-icon class="card-icon"><Setting /></el-icon>
            <h3 class="card-title">配置信息</h3>
          </div>
          <div class="card-content">
            <div class="info-row">
              <div class="info-label">
                <el-icon><Link /></el-icon>
                容器地址
              </div>
              <div class="info-value address-value">
                <span class="address-text" :title="currentContainer.address">{{ currentContainer.address }}</span>
                <el-button 
                  type="primary" 
                  link 
                  size="small" 
                  @click="copyToClipboard(currentContainer.address)"
                >
                  <el-icon><CopyDocument /></el-icon>复制
                </el-button>
              </div>
            </div>
            <div class="info-row">
              <div class="info-label">
                <el-icon><Key /></el-icon>
                MD5值
              </div>
              <div class="info-value md5-value">
                <code class="md5-text" :title="currentContainer.md5">{{ currentContainer.md5 }}</code>
                <el-button 
                  type="primary" 
                  link 
                  size="small" 
                  @click="copyToClipboard(currentContainer.md5)"
                >
                  <el-icon><CopyDocument /></el-icon>
                </el-button>
              </div>
            </div>
            <div class="info-row">
              <div class="info-label">
                <el-icon><PriceTag /></el-icon>
                版本号
              </div>
              <div class="info-value">
                <el-tag type="success" size="small">{{ currentContainer.version }}</el-tag>
              </div>
            </div>
          </div>
        </div>
      </div>
      
      <template #footer>
        <div class="dialog-footer">
          <el-button @click="viewDialogVisible = false">关闭</el-button>
          <el-button type="primary" @click="handleEdit(currentContainer)">
            <el-icon><Edit /></el-icon>编辑容器
          </el-button>
        </div>
      </template>
    </el-dialog>
  </div>
</template>

<script setup>
import { ref, reactive, onMounted } from 'vue'
import { ElMessage, ElMessageBox } from 'element-plus'
import { getContainerList, getContainerDetail, addContainer, updateContainer, deleteContainer } from '@/api/container'
import { getServiceList } from '@/api/service'

// 加载状态
const loading = ref(false)
const serviceLoading = ref(false) // 服务列表加载状态

// 容器列表
const containerList = ref([])

// 分页相关
const currentPage = ref(1)
const pageSize = ref(10)
const total = ref(0)

// 搜索表单
const searchForm = reactive({
  name: '',
  service_name: ''
})

// 对话框相关
const dialogVisible = ref(false)
const dialogType = ref('add') // add 或 edit
const viewDialogVisible = ref(false)

// 当前选中的容器
const currentContainer = ref(null)

// 容器表单
const containerFormRef = ref(null)
const containerForm = reactive({
  id: '',
  name: '',
  address: '',
  service_name: '',
  service_id:'',
  md5: '',
  version: ''
})

// 服务选项
const serviceOptions = ref([])

// 表单验证规则
const containerRules = {
  name: [
    { required: true, message: '请输入容器名称', trigger: 'blur' }
  ],
  address: [
    { required: true, message: '请输入容器地址', trigger: 'blur' }
  ],
  service_id: [
    { required: true, message: '请选择服务ID', trigger: 'change' }
  ],
  md5: [
    { required: true, message: '请输入MD5值', trigger: 'blur' }
  ],
  version: [
    { required: true, message: '请输入版本号', trigger: 'blur' }
  ]
}

// 获取容器列表
const fetchContainerList = async () => {
  loading.value = true
  try {
    const params = {
      page: currentPage.value,
      page_size: pageSize.value,
      ...searchForm
    }
    
    const res = await getContainerList(params)
    // 确保每个容器对象都有状态字段和统一的属性名
    containerList.value = res.data.containers.map(container => ({
      ...container,
      service_name: container.service_name // 统一服务名称属性
    }))
    total.value = res.data.total
  } catch (error) {
    console.error('获取容器列表失败:', error)
    ElMessage.error('获取容器列表失败')
  } finally {
    loading.value = false
  }
}

// 搜索
const handleSearch = () => {
  currentPage.value = 1
  fetchContainerList()
}

// 重置搜索
const resetSearch = () => {
  searchForm.name = ''
  searchForm.service_name = ''
  handleSearch()
}

// 处理页码变化
const handleCurrentChange = (val) => {
  currentPage.value = val
  fetchContainerList()
}

// 处理每页条数变化
const handleSizeChange = (val) => {
  pageSize.value = val
  currentPage.value = 1
  fetchContainerList()
}

// 获取服务列表
const fetchServiceList = async () => {
  serviceLoading.value = true
  try {
    const res = await getServiceList({})
    if (res.data && res.data.services) {
      // 将服务列表转换为选项格式
      serviceOptions.value = res.data.services.map(service => ({
        id: service.id,
        value: service.name,
        label: service.name
      }))
    } else {
      ElMessage.warning('服务列表为空，请先添加服务')
    }
  } catch (error) {
    console.error('获取服务列表失败:', error)
    ElMessage.error('获取服务列表失败')
  } finally {
    serviceLoading.value = false
  }
}

// 处理服务ID变化
const handleServerChange = (value) => {
  // 根据选择的服务ID查找对应的服务信息
  const selectedService = serviceOptions.value.find(item => item.id === value)
  if (selectedService) {
    // 自动填充服务名称
    containerForm.service_name = selectedService.value
  } else {
    containerForm.service_name = ''
  }
}

// 新增容器
const handleAddContainer = () => {
  // 检查是否有可用的服务
  if (serviceOptions.value.length === 0) {
    ElMessage.warning('没有可用的服务，请先添加服务')
    return
  }
  
  dialogType.value = 'add'
  containerForm.id = ''
  containerForm.name = ''
  containerForm.address = ''
  containerForm.service_name = ''
  containerForm.service_id = ''
  containerForm.md5 = ''
  containerForm.version = ''
  dialogVisible.value = true
}

// 编辑容器
const handleEdit = (row) => {
  dialogType.value = 'edit'
  currentContainer.value = row
  containerForm.id = row.id
  containerForm.name = row.name
  containerForm.address = row.address
  containerForm.service_name = row.service_name
  
  // 根据服务名称查找对应的服务ID
  const service = serviceOptions.value.find(item => item.value === (row.service_name))
  containerForm.service_id = service ? service.id : row.service_id
  
  containerForm.md5 = row.md5
  containerForm.version = row.version
  dialogVisible.value = true
}

// 查看容器
const handleView = (row) => {
  // 确保当前容器对象包含正确的属性名
  currentContainer.value = {
    ...row,
    service_name: row.service_name
  }
  viewDialogVisible.value = true
}

// 删除容器
const handleDelete = (row) => {
  ElMessageBox.confirm(
    `确定要删除容器 ${row.name} 吗？`,
    '警告',
    {
      confirmButtonText: '确定',
      cancelButtonText: '取消',
      type: 'warning'
    }
  ).then(async () => {
    try {
      await deleteContainer(row.id)
      ElMessage.success('删除容器成功')
      fetchContainerList() // 刷新列表
    } catch (error) {
      console.error('删除容器失败:', error)
      ElMessage.error('删除容器失败')
    }
  }).catch(() => {
    // 取消删除
  })
}

// 提交容器表单
const submitContainerForm = async () => {
  if (!containerFormRef.value) return
  
  try {
    await containerFormRef.value.validate()
    
    // 确保服务ID和服务名称正确匹配
    const selectedService = serviceOptions.value.find(item => item.id === containerForm.service_id)
    if (selectedService) {
      containerForm.service_name = selectedService.value
    }
    
    // 准备提交的数据，确保属性名与后端一致
    const submitData = {
      ...containerForm,
      service_id: containerForm.service_id,
      service_name: containerForm.service_name
    }
    
    if (dialogType.value === 'add') {
      // 新增容器
      await addContainer(submitData)
      ElMessage.success('新增容器成功')
    } else {
      // 编辑容器
      const containerId = containerForm.id
      await updateContainer(containerId, submitData)
      ElMessage.success('编辑容器成功')
    }
    
    dialogVisible.value = false
    await fetchContainerList() // 刷新列表
  } catch (error) {
    console.error('提交容器表单失败:', error)
    ElMessage.error('提交失败，请检查表单')
  }
}

// 复制到剪贴板
const copyToClipboard = async (text) => {
  try {
    await navigator.clipboard.writeText(text)
    ElMessage.success('已复制到剪贴板')
  } catch (error) {
    console.error('复制失败:', error)
    ElMessage.error('复制失败')
  }
}

// 页面加载时获取容器列表和服务列表
onMounted(() => {
  fetchContainerList()
  fetchServiceList() // 获取服务列表
})
</script>

<style lang="scss" scoped>
@import '@/assets/styles/views/contain.css';
</style> 
<template>
  <div class="service-management-container">
    <div class="service-management-header">
      <h2 class="service-management-title">🔧 服务管理</h2>
      <el-button type="primary" @click="handleAddService">
        <el-icon><Plus /></el-icon>
        新增服务
      </el-button>
    </div>
    
    <!-- 搜索区域 -->
    <div class="service-search-container apple-card">
      <el-form :inline="true" :model="searchForm" class="service-search-form">
        <el-form-item label="服务名称">
          <el-input 
            v-model="searchForm.name" 
            placeholder="请输入服务名称" 
            clearable
            style="width: 200px;"
          />
        </el-form-item>
        <el-form-item label="服务大类">
          <el-select v-model="searchForm.category" placeholder="请选择服务大类" clearable style="width: 180px;">
            <el-option
              v-for="item in categoryOptions"
              :key="item.value"
              :label="item.label"
              :value="item.value"
            />
          </el-select>
        </el-form-item>
        <el-form-item label="服务小类">
          <el-select v-model="searchForm.subCategory" placeholder="请选择服务小类" clearable style="width: 180px;">
            <el-option
              v-for="item in subCategoryOptions"
              :key="item.value"
              :label="item.label"
              :value="item.value"
            />
          </el-select>
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
    <div class="service-table-container apple-card">
      <el-table
        v-loading="loading"
        :data="serviceList"
        border
        style="width: 100%"
        :scroll-x="true"
        table-layout="auto"
      >
        <el-table-column prop="id" label="服务Id" min-width="80" show-overflow-tooltip/>
        <el-table-column prop="name" label="服务名称" min-width="160" show-overflow-tooltip/>
        <el-table-column prop="gitUrl" label="Git地址" min-width="220" show-overflow-tooltip />
        <el-table-column prop="category" label="服务大类" min-width="110" show-overflow-tooltip/>
        <el-table-column prop="subCategory" label="服务小类" min-width="110" show-overflow-tooltip/>
        <el-table-column label="操作" min-width="160" align="center">
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
      <div class="service-pagination">
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
    
    <!-- 新增/编辑服务对话框 -->
    <el-dialog
      v-model="dialogVisible"
      :title="dialogType === 'add' ? '新增服务' : '编辑服务'"
      width="600px"
    >
      <el-form
        ref="serviceFormRef"
        :model="serviceForm"
        :rules="serviceRules"
        label-width="100px"
      >
        <el-form-item label="服务名称" prop="name">
          <el-input v-model="serviceForm.name" placeholder="请输入服务名称" />
        </el-form-item>
        <el-form-item label="Git地址" prop="gitUrl">
          <el-input v-model="serviceForm.gitUrl" placeholder="请输入Git仓库地址" />
        </el-form-item>
        <el-form-item label="服务大类" prop="category">
          <el-select v-model="serviceForm.category" placeholder="请选择服务大类" style="width: 100%">
            <el-option
              v-for="item in categoryOptions"
              :key="item.value"
              :label="item.label"
              :value="item.value"
            />
          </el-select>
        </el-form-item>
        <el-form-item label="服务小类" prop="subCategory">
          <el-select v-model="serviceForm.subCategory" placeholder="请选择服务小类" style="width: 100%">
            <el-option
              v-for="item in subCategoryOptions"
              :key="item.value"
              :label="item.label"
              :value="item.value"
            />
          </el-select>
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input
            v-model="serviceForm.remark"
            type="textarea"
            placeholder="请输入备注信息"
            :rows="3"
          />
        </el-form-item>
      </el-form>
      <template #footer>
        <span class="dialog-footer">
          <el-button @click="dialogVisible = false">取消</el-button>
          <el-button type="primary" @click="submitServiceForm">确定</el-button>
        </span>
      </template>
    </el-dialog>
    
    <!-- 查看服务对话框 -->
    <el-dialog
      v-model="viewDialogVisible"
      title="服务详情"
      width="600px"
    >
      <div v-if="currentService" class="service-detail">
        <div class="service-info-item">
          <span class="service-info-label">服务名称：</span>
          <span class="service-info-value">{{ currentService.name }}</span>
        </div>
        <div class="service-info-item">
          <span class="service-info-label">Git地址：</span>
          <span class="service-info-value">{{ currentService.gitUrl }}</span>
        </div>
        <div class="service-info-item">
          <span class="service-info-label">服务大类：</span>
          <span class="service-info-value">{{ currentService.category }}</span>
        </div>
        <div class="service-info-item">
          <span class="service-info-label">服务小类：</span>
          <span class="service-info-value">{{ currentService.subCategory }}</span>
        </div>
        <div class="service-info-item">
          <span class="service-info-label">备注：</span>
          <span class="service-info-value">{{ currentService.remark }}</span>
        </div>
      </div>
    </el-dialog>
  </div>
</template>

<script setup>
import { ref, reactive, onMounted } from 'vue'
import { useRouter } from 'vue-router'
import { ElMessage, ElMessageBox } from 'element-plus'
import { getServiceList, getServiceDetail, addService, updateService, deleteService, deployService, testService } from '@/api/service'

// 路由
const router = useRouter()

// 加载状态
const loading = ref(false)

// 服务列表
const serviceList = ref([])

// 分页相关
const currentPage = ref(1)
const pageSize = ref(10)
const total = ref(0)

// 搜索表单
const searchForm = reactive({
  name: '',
  category: '',
  subCategory: ''
})

// 对话框相关
const dialogVisible = ref(false)
const dialogType = ref('add') // add 或 edit
const viewDialogVisible = ref(false)
const deployDialogVisible = ref(false)
const testDialogVisible = ref(false)

// 当前选中的服务
const currentService = ref(null)

// 测试结果
const testResult = ref(null)

// 服务表单
const serviceFormRef = ref(null)
const serviceForm = reactive({
  id: '',
  name: '',
  gitUrl: '',
  category: '',
  subCategory: '',
  remark: ''
})

// 部署表单
const deployFormRef = ref(null)
const deployForm = reactive({
  serviceId: '',
  serverId: '',
  environment: 'dev',
  version: ''
})

// 服务大类选项
const categoryOptions = ref([
  { value: '现货', label: '现货' },
  { value: '合约', label: '合约' },
  { value: '钱包', label: '钱包' },
  { value: '中间件', label: '中间件' },
  { value: '用户中心', label: '用户中心' },
  { value: '告警服务', label: '告警服务' },
  { value: 'OTC服务', label: 'OTC服务' }
])

// 服务小类选项
const subCategoryOptions = ref([
  { value: '仓位', label: '仓位' },
  { value: '撮合', label: '撮合' },
  { value: '委托', label: '委托' },
  { value: '管理后端', label: '管理后端' },
  { value: '行情', label: '行情' },
  { value: '核心', label: '核心' },
  { value: 'OTC', label: 'OTC' },
  { value: '其他', label: '其他' }
])

// 表单验证规则
const serviceRules = {
  name: [
    { required: true, message: '请输入服务名称', trigger: 'blur' }
  ],
  gitUrl: [
    { required: true, message: '请输入Git地址', trigger: 'blur' }
  ],
  category: [
    { required: true, message: '请选择服务大类', trigger: 'change' }
  ],
  subCategory: [
    { required: true, message: '请选择服务小类', trigger: 'change' }
  ]
}

// 部署表单验证规则
const deployRules = {
  serverId: [
    { required: true, message: '请选择服务器', trigger: 'change' }
  ],
  environment: [
    { required: true, message: '请选择部署环境', trigger: 'change' }
  ],
  version: [
    { required: true, message: '请输入部署版本', trigger: 'blur' }
  ]
}

// 获取服务列表
const fetchServiceList = async () => {
  loading.value = true
  try {
    const params = {
      page: currentPage.value,
      page_size: pageSize.value,
      ...searchForm
    }
    
    const res = await getServiceList(params)
    serviceList.value = res.data.services
    total.value = res.data.total
  } catch (error) {
    console.error('获取服务列表失败:', error)
    ElMessage.error('获取服务列表失败')
  } finally {
    loading.value = false
  }
}

// 搜索
const handleSearch = () => {
  currentPage.value = 1
  fetchServiceList()
}

// 重置搜索
const resetSearch = () => {
  searchForm.name = ''
  searchForm.category = ''
  searchForm.subCategory = ''
  handleSearch()
}

// 处理页码变化
const handleCurrentChange = (val) => {
  currentPage.value = val
  fetchServiceList()
}

// 处理每页条数变化
const handleSizeChange = (val) => {
  pageSize.value = val
  currentPage.value = 1
  fetchServiceList()
}

// 新增服务
const handleAddService = () => {
  dialogType.value = 'add'
  serviceForm.id = ''
  serviceForm.name = ''
  serviceForm.gitUrl = ''
  serviceForm.category = ''
  serviceForm.subCategory = ''
  serviceForm.remark = ''
  dialogVisible.value = true
}

// 编辑服务
const handleEdit = (row) => {
  dialogType.value = 'edit'
  currentService.value = row
  serviceForm.id = row.id
  serviceForm.name = row.name
  serviceForm.gitUrl = row.gitUrl
  serviceForm.category = row.category
  serviceForm.subCategory = row.subCategory
  serviceForm.remark = row.remark
  dialogVisible.value = true
}

// 查看服务
const handleView = (row) => {
  currentService.value = row
  viewDialogVisible.value = true
}

// 部署服务
const handleDeploy = async (row) => {
  try {
    await deployService(row.id)
    ElMessage.success('服务部署成功')
    fetchServiceList() // 刷新列表
  } catch (error) {
    console.error('部署服务失败:', error)
    ElMessage.error('部署服务失败')
  }
}

// 测试服务
const handleTest = async (row) => {
  try {
    const res = await testService(row.id)
    ElMessage.success('服务测试成功')
    
    // 显示测试结果
    testResult.value = res.data
    testDialogVisible.value = true
  } catch (error) {
    console.error('测试服务失败:', error)
    ElMessage.error('测试服务失败')
  }
}

// 删除服务
const handleDelete = (row) => {
  ElMessageBox.confirm(
    `确定要删除服务 ${row.name} 吗？`,
    '警告',
    {
      confirmButtonText: '确定',
      cancelButtonText: '取消',
      type: 'warning'
    }
  ).then(async () => {
    try {
      await deleteService(row.id)
      ElMessage.success('删除服务成功')
      fetchServiceList() // 刷新列表
    } catch (error) {
      console.error('删除服务失败:', error)
      ElMessage.error('删除服务失败')
    }
  }).catch(() => {
    // 取消删除
  })
}

// 提交服务表单
const submitServiceForm = async () => {
  if (!serviceFormRef.value) return
  
  try {
    await serviceFormRef.value.validate()
    
    if (dialogType.value === 'add') {
      // 新增服务
      await addService(serviceForm)
      ElMessage.success('新增服务成功')
    } else {
      // 编辑服务
      const serviceId = serviceForm.id
      await updateService(serviceId, serviceForm)
      ElMessage.success('编辑服务成功')
    }
    
    dialogVisible.value = false
    await fetchServiceList() // 刷新列表
  } catch (error) {
    console.error('提交服务表单失败:', error)
    ElMessage.error('提交失败，请检查表单')
  }
}

// 提交部署表单
const submitDeployForm = async () => {
  if (!deployFormRef.value) return
  
  try {
    await deployFormRef.value.validate()
    
    // 实际项目中应该调用后端接口
    // deployService(deployForm).then(() => {
    //   ElMessage({
    //     message: '部署成功',
    //     type: 'success'
    //   })
    //   deployDialogVisible.value = false
    //   getServices()
    // })
    
    // 模拟部署过程
    ElMessage({
      message: '正在部署服务，请稍候...',
      type: 'info'
    })
    
    setTimeout(() => {
      ElMessage({
        message: '服务部署成功',
        type: 'success'
      })
      deployDialogVisible.value = false
      fetchServiceList()
    }, 2000)
  } catch (error) {
    console.error('表单验证失败:', error)
  }
}


// 页面加载时获取服务列表
onMounted(() => {
  fetchServiceList()
})
</script>

<style lang="scss" scoped>
@import '@/assets/styles/views/service.css';
</style> 
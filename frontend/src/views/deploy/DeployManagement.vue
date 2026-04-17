<template>
  <div class="deploy-management-container">
    <div class="deploy-management-header">
      <h2 class="deploy-management-title">🚀 部署管理</h2>
      <el-button type="primary" @click="handleCreateDeploy">
        <el-icon><Plus /></el-icon>
        创建部署任务
      </el-button>
    </div>
    
    <!-- 搜索区域 -->
    <div class="deploy-search-container apple-card">
      <el-form :inline="true" :model="searchForm" class="deploy-search-form">
        <el-form-item label="服务名称">
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
                style="width: 200px; cursor: pointer;"
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
                  v-for="category in searchServiceCategories" 
                  :key="category.value"
                  class="category-tab-small"
                  :class="{ 'active': searchSelectedCategory === category.value }"
                  @click="searchSelectedCategory = category.value"
                >
                  <span class="category-icon-small">{{ getCategoryIcon(category.value) }}</span>
                  <span class="category-label-small">{{ category.label }}</span>
                  <span class="category-count-small">({{ getSearchServiceCountByCategory(category.value) }})</span>
                </div>
              </div>
              
              <div class="service-options-list">
                <div v-if="filteredSearchServices.length === 0" class="no-services">
                  暂无匹配的服务
                </div>
                <div 
                  v-for="service in filteredSearchServices" 
                  :key="service.id"
                  class="service-option"
                  :class="{ 'selected': searchForm.serviceId === service.id }"
                  @click="selectSearchService(service)"
                >
                  <div class="service-option-main">
                    <span class="service-option-name">{{ service.name }}</span>
                    <el-tag v-if="service.subCategory" type="info" size="small">{{ service.subCategory }}</el-tag>
                  </div>
                  <div class="service-option-desc">{{ service.description || service.remark || '暂无描述' }}</div>
                </div>
              </div>
            </div>
          </el-popover>
        </el-form-item>
        <el-form-item label="容器名称">
          <el-input 
            v-model="searchForm.containerName" 
            placeholder="请输入容器名称" 
            clearable
            style="width: 200px;"
          />
        </el-form-item>
        <el-form-item label="状态">
          <el-select v-model="searchForm.status" placeholder="请选择状态" clearable style="width: 120px;">
            <el-option label="待部署" value="pending" />
            <el-option label="部署中" value="deploying" />
            <el-option label="部署成功" value="success" />
            <el-option label="部署失败" value="failed" />
            <el-option label="已取消" value="canceled" />
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
    <div class="deploy-table-container apple-card">
      <el-table
        v-loading="loading"
        :data="deployList"
        border
        style="width: 100%"
        :scroll-x="true"
        table-layout="auto"
      >
        <el-table-column prop="serviceName" label="服务名称" min-width="120" show-overflow-tooltip />
        <el-table-column prop="containerName" label="容器名称" min-width="140" show-overflow-tooltip />
        <el-table-column prop="fileName" label="部署文件" min-width="140" show-overflow-tooltip />
        <el-table-column label="部署服务器" min-width="160" show-overflow-tooltip>
          <template #default="scope">
            {{ scope.row.serverName ? `${scope.row.serverName}(${scope.row.serverIp || '无IP'})` : '无' }}
          </template>
        </el-table-column>
        <el-table-column prop="version" label="版本号" min-width="120" show-overflow-tooltip />
        <el-table-column prop="status" label="状态" min-width="90" align="center">
          <template #default="scope">
            <el-tag :type="getStatusType(scope.row.status)" size="small">
              {{ getStatusText(scope.row.status) }}
            </el-tag>
          </template>
        </el-table-column>
        <el-table-column prop="deployTime" label="部署时间" min-width="140" show-overflow-tooltip>
          <template #default="scope">
            {{ formatTime(scope.row.deployTime) }}
          </template>
        </el-table-column>
        <el-table-column label="操作" min-width="240" align="center">
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
                  @click="handleExecute(scope.row)"
                  v-if="scope.row.status === 'pending'"
              >
                <el-icon><VideoPlay /></el-icon>执行
              </el-button>
              <el-button
                  type="primary"
                  link
                  size="small"
                  @click="handleTest(scope.row)"
              >
                <el-icon><Operation /></el-icon>测试
              </el-button>
              <el-button
                  type="primary"
                  link
                  size="small"
                  @click="handleViewLogs(scope.row)"
              >
                <el-icon><Document /></el-icon>日志
              </el-button>
            </div>
          </template>
        </el-table-column>
      </el-table>
      
      <!-- 分页 -->
      <div class="deploy-pagination">
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
    
    <!-- 创建部署任务对话框 -->
    <el-dialog
      v-model="createDialogVisible"
      title="创建部署任务"
      width="900px"
      :close-on-click-modal="false"
    >
      <div class="deploy-form-container">
        <!-- 步骤指示器 -->
        <el-steps :active="currentStep" finish-status="success" class="deploy-steps">
          <el-step title="选择服务大类" />
          <el-step title="选择具体服务" />
          <el-step title="配置部署" />
          <el-step title="选择版本" />
          <el-step title="部署服务器" />
          <el-step title="确认信息" />
        </el-steps>

        <!-- 第一步：选择服务大类 -->
        <div v-show="currentStep === 0" class="step-content">
          <h3 class="step-title">选择服务大类</h3>
          <p class="step-hint">{{ getStepHint(0) }}</p>
          
          <div class="category-selector">
            <div class="category-grid">
              <div 
                v-for="category in serviceCategories" 
                :key="category.value"
                class="category-card"
                :class="{ 'selected': selectedCategory === category.value }"
                @click="selectCategory(category.value)"
              >
                <div class="category-icon">{{ getCategoryIcon(category.value) }}</div>
                <div class="category-info">
                  <div class="category-name">{{ category.label }}</div>
                  <div class="category-count">{{ getServiceCountByCategory(category.value) }} 个服务</div>
                </div>
              </div>
            </div>
          </div>
          
          <div class="step-actions">
            <el-button type="primary" :disabled="!selectedCategory" @click="nextStep">
              下一步
            </el-button>
          </div>
        </div>

        <!-- 第二步：选择具体服务 -->
        <div v-show="currentStep === 1" class="step-content">
          <h3 class="step-title">选择具体服务</h3>
          <p class="step-hint">{{ getStepHint(1) }}</p>
          <div class="current-category">
            <el-tag type="primary" size="large">{{ selectedCategory }}</el-tag>
            <el-button type="text" @click="prevStep">重新选择分类</el-button>
          </div>

          <div class="service-list-container">
            <div v-if="filteredServices.length === 0" class="empty-services">
              <el-empty description="该分类下暂无服务" />
            </div>
            <div v-else class="service-grid">
              <div 
                v-for="item in filteredServices" 
                :key="item.id"
                class="service-card"
                :class="{ 'selected': deployForm.service_id === item.id }"
                @click="selectService(item)"
              >
                <div class="service-card-header">
                  <h4 class="service-card-title">{{ item.name }}</h4>
                  <div class="service-tags">
                    <el-tag v-if="item.subCategory" type="info" size="small">{{ item.subCategory }}</el-tag>
                    <el-tag v-if="item.status" :type="item.status === 'active' ? 'success' : 'info'" size="small">
                      {{ item.status === 'active' ? '运行中' : '停止' }}
                    </el-tag>
                  </div>
                </div>
                <p class="service-card-desc">{{ item.description || item.remark || '暂无描述' }}</p>
                <div class="service-card-meta">
                  <span class="meta-item">容器: {{ getServiceContainerCount(item.id) }}</span>
                  <span class="meta-item">文件: {{ getServiceFileCount(item.id) }}</span>
                </div>
              </div>
            </div>
          </div>
          
          <div class="step-actions">
            <el-button @click="prevStep">上一步</el-button>
            <el-button type="primary" :disabled="!deployForm.service_id" @click="nextStep">
              下一步
            </el-button>
          </div>
        </div>

        <!-- 第三步：配置部署 -->
        <div v-show="currentStep === 2" class="step-content">
          <h3 class="step-title">配置部署参数</h3>
          <p class="step-hint">{{ getStepHint(2) }}</p>
          <div class="selected-service-info">
            <el-tag type="success" size="large">{{ deployForm.service_name }}</el-tag>
            <el-button type="text" @click="goToStep(1)">重新选择服务</el-button>
          </div>

          <!-- 部署文件选择 -->
          <div class="config-section">
            <h4 class="section-title">部署文件</h4>
            <div class="file-grid">
              <div 
                v-for="item in fileOptions" 
                :key="item.id"
                class="file-card"
                :class="{ 'selected': deployForm.file_id === item.id }"
                @click="selectFile(item)"
              >
                <div class="file-icon">📄</div>
                <div class="file-info">
                  <div class="file-name">{{ item.name }}</div>
                  <div class="file-size">{{ formatFileSize(item.size) }}</div>
                </div>
              </div>
            </div>
          </div>

          <!-- 容器选择 -->
          <div class="config-section">
            <h4 class="section-title">容器配置</h4>
            <div class="container-grid">
              <div 
                v-for="item in containerOptions" 
                :key="item.id"
                class="container-card"
                :class="{ 'selected': deployForm.container_id === item.id }"
                @click="selectContainer(item)"
              >
                <div class="container-header">
                  <span class="container-name">{{ item.name }}</span>
                  <el-tag size="small" type="info">{{ item.image || 'N/A' }}</el-tag>
                </div>
                <div class="container-ports">
                  端口: {{ item.ports || '未配置' }}
                </div>
              </div>
            </div>
          </div>
          
          <div class="step-actions">
            <el-button @click="prevStep">上一步</el-button>
            <el-button type="primary" :disabled="!deployForm.file_id || !deployForm.container_id" @click="nextStep">
              下一步
            </el-button>
          </div>
        </div>

        <!-- 第四步：选择版本 -->
        <div v-show="currentStep === 3" class="step-content">
          <h3 class="step-title">选择版本</h3>
          <p class="step-hint">{{ getStepHint(3) }}</p>
          <div class="selected-info">
            <div class="info-item">
              <span class="info-label">服务：</span>
              <el-tag type="success">{{ deployForm.service_name }}</el-tag>
            </div>
            <div class="info-item">
              <span class="info-label">容器：</span>
              <el-tag type="info">{{ deployForm.container_name }}</el-tag>
            </div>
          </div>

          <div class="version-list" v-if="displayVersions.length > 0">
            <el-radio-group v-model="deployForm.version" class="version-radio-group">
              <el-radio 
                v-for="(version, index) in displayVersions" 
                :key="index"
                :label="version"
                class="version-item"
              >
                <div class="version-content">
                  <span class="version-name">{{ version }}</span>
                  <el-tag v-if="index === 0" type="success" size="small" class="latest-tag">最新</el-tag>
                </div>
              </el-radio>
            </el-radio-group>
          </div>
          <div v-else class="empty-versions">
            <el-empty description="暂无可用版本" />
          </div>
          
          <div class="step-actions">
            <el-button @click="prevStep">上一步</el-button>
            <el-button type="primary" :disabled="!deployForm.version" @click="nextStep">
              下一步
            </el-button>
          </div>
        </div>

        <!-- 第五步：部署服务器 -->
        <div v-show="currentStep === 4" class="step-content">
          <h3 class="step-title">选择部署服务器</h3>
          <p class="step-hint">{{ getStepHint(4) }}</p>
          <div class="selected-info">
            <div class="info-item">
              <span class="info-label">服务：</span>
              <el-tag type="success">{{ deployForm.service_name }}</el-tag>
            </div>
            <div class="info-item">
              <span class="info-label">版本：</span>
              <el-tag type="warning">{{ deployForm.version }}</el-tag>
            </div>
          </div>

          <div class="config-section">
            <div class="server-grid">
              <div 
                v-for="item in serverOptions" 
                :key="item.id"
                class="server-card"
                :class="{ 'selected': deployForm.server_id === item.id }"
                @click="selectServer(item)"
              >
                <div class="server-header">
                  <span class="server-name">{{ item.name }}</span>
                  <el-tag :type="getServerStatusType(item.status)" size="small">
                    {{ getServerStatusText(item.status) }}
                  </el-tag>
                </div>
                <div class="server-info">
                  <div class="server-ip">IP: {{ item.ip }}</div>
                  <div class="server-os">{{ item.os || 'Linux' }}</div>
                </div>
              </div>
            </div>
          </div>

          <!-- 备注 -->
          <div class="config-section">
            <h4 class="section-title">备注信息</h4>
            <el-input
              v-model="deployForm.remark"
              type="textarea"
              placeholder="请输入备注信息（可选）"
              :rows="3"
            />
          </div>
          
          <div class="step-actions">
            <el-button @click="prevStep">上一步</el-button>
            <el-button type="primary" :disabled="!deployForm.server_id" @click="nextStep">
              下一步
            </el-button>
          </div>
        </div>

        <!-- 第六步：确认信息 -->
        <div v-show="currentStep === 5" class="step-content">
          <h3 class="step-title">确认部署信息</h3>
          <p class="step-hint">{{ getStepHint(5) }}</p>
          <div class="deploy-summary">
            <div class="summary-item">
              <span class="summary-label">服务名称：</span>
              <span class="summary-value">{{ deployForm.service_name }}</span>
            </div>
            <div class="summary-item">
              <span class="summary-label">部署文件：</span>
              <span class="summary-value">{{ deployForm.file_name }}</span>
            </div>
            <div class="summary-item">
              <span class="summary-label">容器名称：</span>
              <span class="summary-value">{{ deployForm.container_name }}</span>
            </div>
            <div class="summary-item">
              <span class="summary-label">版本号：</span>
              <span class="summary-value">{{ deployForm.version }}</span>
            </div>
            <div class="summary-item">
              <span class="summary-label">部署服务器：</span>
              <span class="summary-value">{{ deployForm.server_name }}</span>
            </div>
            <div class="summary-item" v-if="deployForm.remark">
              <span class="summary-label">备注：</span>
              <span class="summary-value">{{ deployForm.remark }}</span>
            </div>
          </div>
          
          <div class="deploy-warning">
            <el-alert
              title="请确认以上信息无误后再创建部署任务"
              type="warning"
              :closable="false"
              show-icon
            />
          </div>
          
          <div class="step-actions">
            <el-button @click="prevStep">上一步</el-button>
            <el-button type="primary" @click="submitDeployForm" :loading="submitLoading">
              创建部署任务
            </el-button>
          </div>
        </div>
      </div>
    </el-dialog>
    
    <!-- 查看部署详情对话框 -->
    <el-dialog
      v-model="viewDialogVisible"
      title="部署详情"
      width="600px"
    >
      <div v-if="currentDeploy" class="deploy-detail">
        <div class="deploy-info-item">
          <span class="deploy-info-label">服务名称：</span>
          <span class="deploy-info-value">{{ currentDeploy.serviceName }}</span>
        </div>
        <div class="deploy-info-item">
          <span class="deploy-info-label">容器名称：</span>
          <span class="deploy-info-value">{{ currentDeploy.containerName }}</span>
        </div>
        <div class="deploy-info-item">
          <span class="deploy-info-label">部署文件：</span>
          <span class="deploy-info-value">{{ currentDeploy.fileName || '无' }}</span>
        </div>
        <div class="deploy-info-item">
          <span class="deploy-info-label">部署服务器：</span>
          <span class="deploy-info-value">{{ currentDeploy.serverName ? `${currentDeploy.serverName}(${currentDeploy.serverIp || '无IP'})` : '无' }}</span>
        </div>
        <div class="deploy-info-item">
          <span class="deploy-info-label">版本号：</span>
          <span class="deploy-info-value">{{ currentDeploy.version }}</span>
        </div>
        <div class="deploy-info-item">
          <span class="deploy-info-label">状态：</span>
          <span class="deploy-info-value">
            <el-tag :type="getStatusType(currentDeploy.status)">
              {{ getStatusText(currentDeploy.status) }}
            </el-tag>
          </span>
        </div>
        <div class="deploy-info-item">
          <span class="deploy-info-label">部署时间：</span>
          <span class="deploy-info-value">{{ currentDeploy.deployTime || '未部署' }}</span>
        </div>
        <div class="deploy-info-item">
          <span class="deploy-info-label">备注：</span>
          <span class="deploy-info-value">{{ currentDeploy.remark || '无' }}</span>
        </div>
      </div>
    </el-dialog>
    
    <!-- 查看部署日志对话框 -->
    <el-dialog
      v-model="logsDialogVisible"
      title="部署日志"
      width="800px"
    >
      <div v-if="deployLogs && deployLogs.length > 0" class="deploy-logs">
        <div v-for="(log, index) in deployLogs" :key="index" class="deploy-log-item">
          <div class="deploy-log-time">{{ formatTime(log.createTime) }}</div>
          <div class="deploy-log-content">{{ log.content }}</div>
        </div>
      </div>
      <div v-else class="deploy-logs-empty">
        暂无日志记录
      </div>
    </el-dialog>
    
    <!-- 测试结果对话框 -->
    <el-dialog
      v-model="testDialogVisible"
      title="测试结果"
      width="600px"
    >
      <div v-if="testResult" class="test-result">
        <div class="test-result-header">
          <el-tag :type="testResult.success ? 'success' : 'danger'" class="test-result-tag">
            {{ testResult.success ? '测试通过' : '测试失败' }}
          </el-tag>
          <span class="test-result-time">测试时间: {{ formatTime(testResult.time) }}</span>
        </div>
        <div class="test-result-content">
          <h4>测试详情：</h4>
          <pre class="test-result-pre">{{ testResult.detail }}</pre>
        </div>
      </div>
    </el-dialog>
  </div>
</template>

<script setup>
import { ref, reactive, onMounted, onUnmounted, watch, computed } from 'vue'
import { useRoute } from 'vue-router'
import { ElMessage, ElMessageBox } from 'element-plus'
import { getDeployList, getDeployDetail, createDeploy, executeDeploy, getDeployLogs, testDeploy } from '@/api/deploy'
import { getServiceList } from '@/api/service'
import { getContainerList, getContainersByServiceID, getContainerVersions } from '@/api/container'
import { getFileList, getFilesByServiceID } from '@/api/file'
import { getServerList, getServerDetail } from '@/api/server'

// 路由
const route = useRoute()

// 加载状态
const loading = ref(false)
const serviceLoading = ref(false)
const containerLoading = ref(false)
const fileLoading = ref(false)
const versionLoading = ref(false)
const serverLoading = ref(false)

// 部署列表
const deployList = ref([])

// 分页相关
const currentPage = ref(1)
const pageSize = ref(10)
const total = ref(0)

// 搜索表单
const searchForm = reactive({
  serviceId: '',
  containerName: '',
  status: ''
})

// 对话框相关
const createDialogVisible = ref(false)
const viewDialogVisible = ref(false)
const logsDialogVisible = ref(false)
const testDialogVisible = ref(false)

// 创建部署任务步骤
const currentStep = ref(0)
const submitLoading = ref(false)

// 服务分类相关
const selectedCategory = ref('')
const serviceCategories = ref([
  { value: '现货', label: '现货' },
  { value: '合约', label: '合约' },
  { value: '钱包', label: '钱包' },
  { value: '中间件', label: '中间件' },
  { value: '用户中心', label: '用户中心' },
  { value: 'OTC服务', label: 'OTC服务' },
  { value: '告警服务', label: '告警服务' }
])

// 搜索服务相关
const serviceSelectVisible = ref(false)
const serviceSearchText = ref('')
const serviceFilterText = ref('')
const searchSelectedCategory = ref('全部')
const searchServiceCategories = ref([
  { value: '全部', label: '全部' },
  { value: '现货', label: '现货' },
  { value: '合约', label: '合约' },
  { value: '钱包', label: '钱包' },
  { value: '中间件', label: '中间件' },
  { value: '用户中心', label: '用户中心' },
  { value: 'OTC服务', label: 'OTC服务' },
  { value: '告警服务', label: '告警服务' }
])

// 当前选中的部署
const currentDeploy = ref(null)

// 部署日志
const deployLogs = ref('')

// 测试结果
const testResult = ref(null)

// 部署表单
const deployFormRef = ref(null)
const deployForm = reactive({
  service_id: '',
  service_name: '',
  container_id: '',
  container_name: '',
  file_id: '',
  file_name: '',
  server_id: '',
  server_name: '',
  version: '',
  remark: ''
})

// 服务选项
const serviceOptions = ref([])

// 容器选项
const containerOptions = ref([])

// 文件选项
const fileOptions = ref([])

// 版本选项
const versionOptions = ref([])

// 服务器选项
const serverOptions = ref([])

// 表单验证规则
const deployRules = {
  service_id: [
    { required: true, message: '请选择服务', trigger: 'change' }
  ],
  container_id: [
    { required: true, message: '请选择容器', trigger: 'change' }
  ],
  file_id: [
    { required: true, message: '请选择部署文件', trigger: 'change' }
  ],
  server_id: [
    { required: true, message: '请选择部署服务器', trigger: 'change' }
  ],
  version: [
    { required: true, message: '请选择版本号', trigger: 'change' }
  ]
}

// 获取状态类型
const getStatusType = (status) => {
  switch (status) {
    case 'pending':
      return 'info'
    case 'deploying':
      return 'warning'
    case 'success':
      return 'success'
    case 'failed':
      return 'danger'
    case 'canceled':
      return ''
    default:
      return 'info'
  }
}

// 获取状态文本
const getStatusText = (status) => {
  switch (status) {
    case 'pending':
      return '待部署'
    case 'deploying':
      return '部署中'
    case 'success':
      return '部署成功'
    case 'failed':
      return '部署失败'
    case 'canceled':
      return '已取消'
    default:
      return '未知状态'
  }
}

// 获取部署列表
const fetchDeployList = async () => {
  loading.value = true
  try {
    const params = {
      page: currentPage.value,
      pageSize: pageSize.value
    }
    
    if (searchForm.serviceId) {
      params.serviceId = searchForm.serviceId
    }
    
    if (searchForm.containerName) {
      params.containerName = searchForm.containerName
    }
    
    if (searchForm.status) {
      params.status = searchForm.status
    }
    
    const res = await getDeployList(params)
    if (res.code === 200 && res.data) {
      deployList.value = res.data.list || []
      total.value = res.data.total || 0
      
      // 获取服务器IP地址
      const serverIds = new Set(deployList.value.filter(item => item.serverId).map(item => item.serverId))
      if (serverIds.size > 0) {
        const serverPromises = Array.from(serverIds).map(async (serverId) => {
          try {
            const serverRes = await getServerDetail(serverId)
            if (serverRes.code === 200 && serverRes.data) {
              return { id: serverId, ip: serverRes.data.ip }
            }
          } catch (error) {
            console.error(`获取服务器(ID: ${serverId})详情失败:`, error)
          }
          return { id: serverId, ip: '无IP' }
        })
        
        const serverDetails = await Promise.all(serverPromises)
        const serverMap = new Map(serverDetails.map(item => [item.id, item.ip]))
        
        // 更新部署列表中的服务器IP
        deployList.value.forEach(item => {
          if (item.serverId && serverMap.has(item.serverId)) {
            item.serverIp = serverMap.get(item.serverId)
          }
        })
      }
    } else {
      deployList.value = []
      total.value = 0
      ElMessage.warning('获取部署列表返回异常')
    }
  } catch (error) {
    console.error('获取部署列表失败:', error)
    ElMessage.error('获取部署列表失败')
    deployList.value = []
    total.value = 0
  } finally {
    loading.value = false
  }
}

// 获取服务列表
const fetchServiceList = async () => {
  serviceLoading.value = true
  try {
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

// 获取容器列表
const fetchContainerList = async (serviceId = '') => {
  containerLoading.value = true
  try {
    if (!serviceId) {
      containerOptions.value = []
      return
    }
    
    const res = await getContainersByServiceID(serviceId)
    if (res.data && res.data.containers) {
      containerOptions.value = res.data.containers
    }
  } catch (error) {
    console.error('获取容器列表失败:', error)
    ElMessage.error('获取容器列表失败')
  } finally {
    containerLoading.value = false
  }
}

// 获取文件列表
const fetchFileList = async (serviceId = '') => {
  fileLoading.value = true
  try {
    if (!serviceId) {
      fileOptions.value = []
      return
    }
    
    const res = await getFilesByServiceID(serviceId)
    if (res.data && res.data.files) {
      fileOptions.value = res.data.files
    }
  } catch (error) {
    console.error('获取文件列表失败:', error)
    ElMessage.error('获取文件列表失败')
  } finally {
    fileLoading.value = false
  }
}

// 获取版本列表
const fetchVersionList = async (containerId = '') => {
  versionLoading.value = true
  try {
    if (!containerId) {
      versionOptions.value = []
      return
    }
    
    const res = await getContainerVersions(containerId)
    if (res.data && res.data.versions) {
      versionOptions.value = res.data.versions
    }
  } catch (error) {
    console.error('获取版本列表失败:', error)
    ElMessage.error('获取版本列表失败')
  } finally {
    versionLoading.value = false
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

// 搜索
const handleSearch = () => {
  currentPage.value = 1
  fetchDeployList()
}

// 重置搜索
const resetSearch = () => {
  searchForm.serviceId = ''
  searchForm.containerName = ''
  searchForm.status = ''
  serviceSearchText.value = ''
  serviceFilterText.value = ''
  searchSelectedCategory.value = '全部'
  handleSearch()
}

// 处理页码变化
const handleCurrentChange = (val) => {
  currentPage.value = val
  fetchDeployList()
}

// 处理每页条数变化
const handleSizeChange = (val) => {
  pageSize.value = val
  currentPage.value = 1
  fetchDeployList()
}

// 处理服务变化
const handleServiceChange = (value) => {
  // 根据选择的服务ID查找对应的服务信息
  const selectedService = serviceOptions.value.find(item => item.id === value)
  if (selectedService) {
    deployForm.service_name = selectedService.name
    // 重新获取该服务下的容器列表和文件列表
    fetchContainerList(value)
    fetchFileList(value)
    // 清空容器选择和文件选择
    deployForm.container_id = ''
    deployForm.container_name = ''
    deployForm.file_id = ''
    deployForm.file_name = ''
    deployForm.version = ''
  }
}

// 选择服务
const selectService = async (service) => {
  deployForm.service_id = service.id
  deployForm.service_name = service.name
  
  // 获取该服务下的容器列表和文件列表
  await Promise.all([
    fetchContainerList(service.id),
    fetchFileList(service.id)
  ])
  
  // 清空其他选择
  deployForm.container_id = ''
  deployForm.container_name = ''
  deployForm.file_id = ''
  deployForm.file_name = ''
  deployForm.version = ''
  
  // 如果只有一个文件，自动选择
  if (fileOptions.value.length === 1) {
    selectFile(fileOptions.value[0])
  }
}

// 选择文件
const selectFile = (file) => {
  deployForm.file_id = file.id
  deployForm.file_name = file.name
}

// 选择容器
const selectContainer = async (container) => {
  deployForm.container_id = container.id
  deployForm.container_name = container.name
  
  // 获取版本列表
  await fetchVersionList(container.id)
  
  // 自动选择最新版本（使用displayVersions确保在10个版本范围内）
  if (displayVersions.value.length > 0) {
    deployForm.version = displayVersions.value[0]
  }
}

// 选择服务器
const selectServer = (server) => {
  deployForm.server_id = server.id
  deployForm.server_name = server.name
}

// 下一步
const nextStep = () => {
  if (currentStep.value < 5) {
    currentStep.value++
  }
}

// 上一步
const prevStep = () => {
  if (currentStep.value > 0) {
    currentStep.value--
  }
}

// 跳转到指定步骤
const goToStep = (step) => {
  currentStep.value = step
}

// 检查配置是否完整
const isConfigComplete = computed(() => {
  return deployForm.service_id && 
         deployForm.file_id && 
         deployForm.container_id && 
         deployForm.version && 
         deployForm.server_id
})

// 过滤后的服务列表
const filteredServices = computed(() => {
  if (!selectedCategory.value) return []
  return serviceOptions.value.filter(service => service.category === selectedCategory.value)
})

// 显示的版本列表（最多10个最新版本）
const displayVersions = computed(() => {
  return versionOptions.value.slice(0, 10)
})

// 搜索面板中过滤后的服务列表
const filteredSearchServices = computed(() => {
  let services = serviceOptions.value
  
  // 按分类过滤
  if (searchSelectedCategory.value !== '全部') {
    services = services.filter(service => service.category === searchSelectedCategory.value)
  }
  
  // 按搜索文本过滤
  if (serviceFilterText.value) {
    const searchText = serviceFilterText.value.toLowerCase()
    services = services.filter(service => 
      service.name.toLowerCase().includes(searchText) ||
      (service.description && service.description.toLowerCase().includes(searchText)) ||
      (service.remark && service.remark.toLowerCase().includes(searchText))
    )
  }
  
  return services.slice(0, 20) // 最多显示20个
})

// 获取服务的容器数量
const getServiceContainerCount = (serviceId) => {
  // 这里可以根据实际情况返回容器数量，暂时返回默认值
  return '1'
}

// 获取服务的文件数量
const getServiceFileCount = (serviceId) => {
  // 这里可以根据实际情况返回文件数量，暂时返回默认值
  return '1'
}

// 格式化文件大小
const formatFileSize = (size) => {
  if (!size) return '未知'
  if (size < 1024) return size + 'B'
  if (size < 1024 * 1024) return (size / 1024).toFixed(1) + 'KB'
  return (size / (1024 * 1024)).toFixed(1) + 'MB'
}

// 获取服务器状态类型
const getServerStatusType = (status) => {
  switch (status) {
    case 'online':
      return 'success'
    case 'offline':
      return 'danger'
    default:
      return 'info'
  }
}

// 获取服务器状态文本
const getServerStatusText = (status) => {
  switch (status) {
    case 'online':
      return '在线'
    case 'offline':
      return '离线'
    default:
      return '未知'
  }
}

// 选择服务分类
const selectCategory = (category) => {
  selectedCategory.value = category
  // 清空之前选择的服务
  deployForm.service_id = ''
  deployForm.service_name = ''
  deployForm.container_id = ''
  deployForm.container_name = ''
  deployForm.file_id = ''
  deployForm.file_name = ''
  deployForm.version = ''
}

// 获取分类图标
const getCategoryIcon = (category) => {
  const icons = {
    '现货': '💰',
    '合约': '📊',
    '钱包': '👛',
    '中间件': '⚙️',
    '用户中心': '👤',
    'OTC服务': '📈',
    '告警服务': '🔔'
  }
  return icons[category] || '📦'
}

// 获取分类下的服务数量
const getServiceCountByCategory = (category) => {
  return serviceOptions.value.filter(service => service.category === category).length
}

// 获取搜索面板中分类下的服务数量
const getSearchServiceCountByCategory = (category) => {
  if (category === '全部') {
    return serviceOptions.value.length
  }
  return serviceOptions.value.filter(service => service.category === category).length
}

// 选择搜索服务
const selectSearchService = (service) => {
  searchForm.serviceId = service.id
  serviceSearchText.value = service.name
  serviceSelectVisible.value = false
}

// 清空服务选择
const clearServiceSelection = () => {
  searchForm.serviceId = ''
  serviceSearchText.value = ''
}

// 处理服务输入框点击
const handleServiceInputClick = (event) => {
  event.preventDefault()
  event.stopPropagation()
  serviceSelectVisible.value = !serviceSelectVisible.value
}

// 检查步骤是否可以继续
const canProceedToNextStep = (step) => {
  switch (step) {
    case 0: // 选择服务大类
      return selectedCategory.value !== ''
    case 1: // 选择具体服务
      return deployForm.service_id !== ''
    case 2: // 配置部署
      return deployForm.file_id !== '' && deployForm.container_id !== ''
    case 3: // 选择版本
      return deployForm.version !== ''
    case 4: // 部署服务器
      return deployForm.server_id !== ''
    case 5: // 确认信息
      return isConfigComplete.value
    default:
      return false
  }
}

// 获取步骤提示文本
const getStepHint = (step) => {
  switch (step) {
    case 0:
      return '请选择一个服务大类以查看相关服务'
    case 1:
      return '请从当前分类中选择要部署的具体服务'
    case 2:
      return '请选择部署文件和容器配置'
    case 3:
      return '请选择要部署的版本号'
    case 4:
      return '请选择部署的目标服务器'
    case 5:
      return '请确认所有配置信息无误'
    default:
      return ''
  }
}

// 处理容器变化
const handleContainerChange = (value) => {
  // 根据选择的容器ID查找对应的容器信息
  const selectedContainer = containerOptions.value.find(item => item.id === value)
  if (selectedContainer) {
    deployForm.container_name = selectedContainer.name
    // 获取该容器的版本列表
    fetchVersionList(value)
    // 清空版本选择
    deployForm.version = ''
  }
}

// 处理文件变化
const handleFileChange = (value) => {
  // 根据选择的文件ID查找对应的文件信息
  const selectedFile = fileOptions.value.find(item => item.id === value)
  if (selectedFile) {
    deployForm.file_name = selectedFile.name
  }
}

// 处理服务器变化
const handleServerChange = (value) => {
  // 根据选择的服务器ID查找对应的服务器信息
  const selectedServer = serverOptions.value.find(item => item.id === value)
  if (selectedServer) {
    deployForm.server_name = selectedServer.name
  }
}

// 创建部署任务
const handleCreateDeploy = async () => {
  createDialogVisible.value = true
  currentStep.value = 0
  
  // 重置表单
  deployForm.service_id = ''
  deployForm.service_name = ''
  deployForm.container_id = ''
  deployForm.container_name = ''
  deployForm.file_id = ''
  deployForm.file_name = ''
  deployForm.server_id = ''
  deployForm.server_name = ''
  deployForm.version = ''
  deployForm.remark = ''
  
  // 重置分类选择
  selectedCategory.value = ''
  
  // 获取基础数据
  await Promise.all([
    fetchServiceList(),
    fetchServerList()
  ])
  
  // 如果从服务管理页面传递了服务ID和服务名称，则自动填充并跳到第三步
  if (route.query.service_id && route.query.service_name) {
    const serviceId = Number(route.query.service_id)
    const selectedService = serviceOptions.value.find(item => item.id === serviceId)
    if (selectedService) {
      // 自动选择对应的分类和服务
      selectedCategory.value = selectedService.category
      await selectService(selectedService)
      currentStep.value = 2 // 跳到配置部署步骤
    }
  } else {
    // 默认选择第一个分类
    if (serviceCategories.value.length > 0) {
      selectedCategory.value = serviceCategories.value[0].value
    }
  }
}

// 查看部署详情
const handleView = async (row) => {
  try {
    const res = await getDeployDetail(row.id)
    if (res.code === 200 && res.data) {
      currentDeploy.value = res.data
      
      // 如果有服务器ID，获取服务器详情以获取IP地址
      if (currentDeploy.value.serverId) {
        try {
          const serverRes = await getServerDetail(currentDeploy.value.serverId)
          if (serverRes.code === 200 && serverRes.data) {
            currentDeploy.value.serverIp = serverRes.data.ip
          }
        } catch (error) {
          console.error('获取服务器详情失败:', error)
          // 不影响主流程，继续显示对话框
        }
      }
      
      viewDialogVisible.value = true
    } else {
      ElMessage.warning('获取部署详情失败')
    }
  } catch (error) {
    console.error('获取部署详情失败:', error)
    ElMessage.error('获取部署详情失败')
  }
}

// 执行部署
const handleExecute = async (row) => {
  try {
    await executeDeploy(row.id)
    ElMessage.success('部署任务已开始执行')
    await fetchDeployList() // 刷新列表
  } catch (error) {
    console.error('执行部署失败:', error)
    ElMessage.error('执行部署失败')
  }
}

// 测试部署
const handleTest = async (row) => {
  try {
    const res = await testDeploy(row.id)
    ElMessage.success('测试成功')
    
    // 显示测试结果
    testResult.value = res.data
    testDialogVisible.value = true
  } catch (error) {
    console.error('测试失败:', error)
    ElMessage.error('测试失败')
  }
}


// 查看部署日志
const handleViewLogs = async (row) => {
  try {
    const res = await getDeployLogs(row.id)
    if (res.code === 200 && res.data) {
      // 只取最新的10条日志
      deployLogs.value = Array.isArray(res.data) ? res.data.slice(0, 10) : []
      logsDialogVisible.value = true
    } else {
      ElMessage.warning('获取部署日志失败')
      deployLogs.value = []
    }
  } catch (error) {
    console.error('获取部署日志失败:', error)
    ElMessage.error('获取部署日志失败')
    deployLogs.value = []
  }
}

// 格式化时间
const formatTime = (timeStr) => {
  if (!timeStr) return ''
  const date = new Date(timeStr)
  return `${date.getFullYear()}-${String(date.getMonth() + 1).padStart(2, '0')}-${String(date.getDate()).padStart(2, '0')} ${String(date.getHours()).padStart(2, '0')}:${String(date.getMinutes()).padStart(2, '0')}:${String(date.getSeconds()).padStart(2, '0')}`
}

// 提交部署表单
const submitDeployForm = async () => {
  if (!isConfigComplete.value) {
    ElMessage.warning('请完善部署配置信息')
    return
  }
  
  submitLoading.value = true
  try {
    const data = {
      serviceId: deployForm.service_id,
      serviceName: deployForm.service_name,
      containerId: deployForm.container_id,
      containerName: deployForm.container_name,
      fileId: deployForm.file_id,
      fileName: deployForm.file_name,
      serverId: deployForm.server_id,
      serverName: deployForm.server_name,
      version: deployForm.version,
      remark: deployForm.remark
    }
    
    await createDeploy(data)
    ElMessage.success('创建部署任务成功')
    createDialogVisible.value = false
    await fetchDeployList() // 刷新列表
  } catch (error) {
    console.error('创建部署任务失败:', error)
    ElMessage.error('创建部署任务失败，请检查配置信息')
  } finally {
    submitLoading.value = false
  }
}

// 全局点击处理函数
const handleGlobalClick = (event) => {
  // 检查点击的元素是否在服务选择区域内
  const serviceSelectPanel = document.querySelector('.service-select-panel')
  const serviceInput = document.querySelector('.deploy-search-form .el-input')
  
  if (serviceSelectVisible.value && 
      serviceSelectPanel && 
      serviceInput &&
      !serviceSelectPanel.contains(event.target) && 
      !serviceInput.contains(event.target)) {
    serviceSelectVisible.value = false
  }
}

// 页面加载时获取部署列表
onMounted(async () => {
  await Promise.all([
    fetchDeployList(),
    fetchServiceList()
  ])
  
  // 初始化服务搜索文本
  if (searchForm.serviceId) {
    const selectedService = serviceOptions.value.find(item => item.id === searchForm.serviceId)
    if (selectedService) {
      serviceSearchText.value = selectedService.name
    }
  }
  
  // 如果从服务管理页面传递了服务ID和服务名称，则自动打开创建部署任务对话框
  if (route.query.service_id && route.query.service_name) {
    handleCreateDeploy()
  }
  
  // 添加全局点击监听器
  document.addEventListener('click', handleGlobalClick)
})

// 组件卸载时清理事件监听器
onUnmounted(() => {
  document.removeEventListener('click', handleGlobalClick)
})
</script>

<style scoped>
@import '@/assets/styles/views/deploy.css';
</style>
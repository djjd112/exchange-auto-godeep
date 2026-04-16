<template>
  <div class="server-management-container">
    <div class="server-management-header">
      <h2 class="server-management-title">🖥️ 服务器管理</h2>
      <el-button type="primary" @click="handleAddServer">
        <el-icon>
          <Plus/>
        </el-icon>
        新增服务器
      </el-button>
    </div>

    <!-- 搜索区域 -->
    <div class="server-search-container apple-card">
      <el-form :inline="true" :model="searchForm" class="server-search-form">
        <el-form-item label="服务器IP">
          <el-input
              v-model="searchForm.ip"
              placeholder="请输入服务器IP"
              clearable
              style="width: 200px;"
          />
        </el-form-item>
        <el-form-item label="服务器名称">
          <el-input
              v-model="searchForm.name"
              placeholder="请输入服务器名称"
              clearable
              style="width: 200px;"
          />
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="handleSearch">
            <el-icon>
              <Search/>
            </el-icon>
            搜索
          </el-button>
          <el-button @click="resetSearch">
            <el-icon>
              <Refresh/>
            </el-icon>
            重置
          </el-button>
        </el-form-item>
      </el-form>
    </div>

    <!-- 表格区域 -->
    <div class="server-table-container apple-card">
      <el-table
          v-loading="loading"
          :data="serverList"
          border
          style="width: 100%"
          :scroll-x="true"
          table-layout="auto"
      >
        <el-table-column prop="ip" label="服务器IP" min-width="140" show-overflow-tooltip/>
        <el-table-column prop="name" label="服务器名称" min-width="120" show-overflow-tooltip/>
        <el-table-column prop="remark" label="备注" min-width="150" show-overflow-tooltip/>
        <el-table-column prop="expire_time" label="到期时间" min-width="160" show-overflow-tooltip>
          <template #default="scope">
            <span :class="{ 'expire-warning': isExpireSoon(scope.row.expire_time) }">
              {{ formatExpireTime(scope.row.expire_time) }}
            </span>
          </template>
        </el-table-column>
        <el-table-column label="服务器状态" min-width="180" show-overflow-tooltip>
          <template #default="scope">
            <div class="server-status">
              <el-tag type="success" v-if="scope.row.status">在线</el-tag>
              <el-tag type="danger" v-else>离线</el-tag>
              <el-button
                  type="primary"
                  link
                  size="small"
                  @click="handleViewStatus(scope.row)"
              >
                查看详情
              </el-button>
            </div>
          </template>
        </el-table-column>
        <el-table-column label="操作" min-width="260" align="center">
          <template #default="scope">
            <div class="table-actions">
              <el-button
                  type="primary"
                  link
                  size="small"
                  @click="handleConnect(scope.row)"
              >
                <el-icon>
                  <Connection/>
                </el-icon>
                连接
              </el-button>
              <el-button
                  type="primary"
                  link
                  size="small"
                  @click="handleView(scope.row)"
              >
                <el-icon>
                  <View/>
                </el-icon>
                查看
              </el-button>
              <el-button
                  type="primary"
                  link
                  size="small"
                  @click="handleEdit(scope.row)"
              >
                <el-icon>
                  <Edit/>
                </el-icon>
                编辑
              </el-button>
              <el-button
                  type="danger"
                  link
                  size="small"
                  @click="handleDelete(scope.row)"
              >
                <el-icon>
                  <Delete/>
                </el-icon>
                作废
              </el-button>
            </div>
          </template>
        </el-table-column>
      </el-table>

      <!-- 分页 -->
      <div class="server-pagination">
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

    <!-- 新增/编辑服务器对话框 -->
    <el-dialog
        v-model="dialogVisible"
        :title="dialogType === 'add' ? '新增服务器' : '编辑服务器'"
        width="500px"
    >
      <el-form
          ref="serverFormRef"
          :model="serverForm"
          :rules="serverRules"
          label-width="100px"
      >
        <el-form-item label="服务器IP" prop="ip">
          <el-input v-model="serverForm.ip" placeholder="请输入服务器IP"/>
        </el-form-item>
        <el-form-item label="服务器名称" prop="name">
          <el-input v-model="serverForm.name" placeholder="请输入服务器名称"/>
        </el-form-item>
        <el-form-item label="服务器密码" prop="password">
          <el-input
              v-model="serverForm.password"
              type="password"
              placeholder="请输入服务器密码"
              show-password
          />
        </el-form-item>
        <el-form-item label="到期时间" prop="expire_time">
          <el-date-picker
              v-model="serverForm.expire_time"
              type="datetime"
              placeholder="请选择到期时间"
              format="YYYY-MM-DD HH:mm:ss"
              value-format="YYYY-MM-DD HH:mm:ss"
              :disabled-date="disabledDate"
          />
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input
              v-model="serverForm.remark"
              type="textarea"
              placeholder="请输入备注信息"
              :rows="3"
          />
        </el-form-item>
      </el-form>
      <template #footer>
        <span class="dialog-footer">
          <el-button @click="dialogVisible = false">取消</el-button>
          <el-button type="primary" @click="submitServerForm">确定</el-button>
        </span>
      </template>
    </el-dialog>

    <!-- 服务器状态对话框 -->
    <el-dialog
        v-model="statusDialogVisible"
        title="服务器状态"
        width="600px"
    >
      <div v-if="currentServer" class="server-status-detail">
        <div class="server-info-item">
          <span class="server-info-label">服务器IP：</span>
          <span class="server-info-value">{{ currentServer.ip }}</span>
        </div>
        <div class="server-info-item">
          <span class="server-info-label">服务器名称：</span>
          <span class="server-info-value">{{ currentServer.name }}</span>
        </div>
        <el-divider/>
        <div class="server-status-cards">
          <div class="server-status-card">
            <h4>CPU负载</h4>
            <el-progress
                type="dashboard"
                :percentage="currentServer.cpuUsage || 0"
                :color="getStatusColor(currentServer.cpuUsage || 0)"
            />
            <div class="server-status-value">{{ currentServer.cpuUsage || 0 }}%</div>
          </div>
          <div class="server-status-card">
            <h4>内存使用</h4>
            <el-progress
                type="dashboard"
                :percentage="currentServer.memoryUsage || 0"
                :color="getStatusColor(currentServer.memoryUsage || 0)"
            />
            <div class="server-status-value">{{ currentServer.memoryUsage || 0 }}%</div>
          </div>
          <div class="server-status-card">
            <h4>磁盘使用</h4>
            <el-progress
                type="dashboard"
                :percentage="currentServer.diskUsage || 0"
                :color="getStatusColor(currentServer.diskUsage || 0)"
            />
            <div class="server-status-value">{{ currentServer.diskUsage || 0 }}%</div>
          </div>
        </div>
        <div class="server-info-item">
          <span class="server-info-label">网络带宽：</span>
          <span class="server-info-value">{{ currentServer.networkSpeed || '0 Mbps' }}</span>
        </div>
        <div class="server-info-item">
          <span class="server-info-label">运行时间：</span>
          <span class="server-info-value">{{ currentServer.uptime || '0天0小时0分钟' }}</span>
        </div>
        <div class="server-info-item">
          <span class="server-info-label">处理器核数：</span>
          <span class="server-info-value">{{ currentServer.processes || '0' }}</span>
        </div>
      </div>
    </el-dialog>

    <!-- 查看服务器对话框 -->
    <el-dialog
        v-model="viewDialogVisible"
        title="服务器详情"
        width="500px"
    >
      <div v-if="currentServer" class="server-detail">
        <div class="server-info-item">
          <span class="server-info-label">服务器IP：</span>
          <span class="server-info-value">{{ currentServer.ip }}</span>
        </div>
        <div class="server-info-item">
          <span class="server-info-label">服务器名称：</span>
          <span class="server-info-value">{{ currentServer.name }}</span>
        </div>
        <div class="server-info-item">
          <span class="server-info-label">服务器密码：</span>
          <span class="server-info-value">******</span>
        </div>
        <div class="server-info-item">
          <span class="server-info-label">备注：</span>
          <span class="server-info-value">{{ currentServer.remark }}</span>
        </div>
        <div class="server-info-item">
          <span class="server-info-label">到期时间：</span>
          <span class="server-info-value">{{ formatExpireTime(currentServer.expire_time) }}</span>
        </div>
      </div>
    </el-dialog>

    <!-- 终端连接对话框 -->
    <el-dialog
        v-model="terminalDialogVisible"
        :title="`终端连接 - ${currentServer?.name || ''} (${currentServer?.ip || ''})`"
        width="80%"
        :before-close="handleCloseTerminal"
        fullscreen
        destroy-on-close
        @opened="handleDialogOpened"
    >
      <template #default>
        <div class="terminal-container">
          <div v-show="terminalConnecting" class="terminal-connecting">
            <el-icon class="is-loading">
              <Loading/>
            </el-icon>
            <span>正在连接服务器，请稍候...</span>
          </div>
          <div v-show="terminalError" class="terminal-error">
            <el-icon>
              <CircleClose/>
            </el-icon>
            <span>{{ terminalError }}</span>
            <el-button type="primary" @click="reconnectTerminal">重新连接</el-button>
          </div>
          <div ref="terminalRef" class="terminal-content" v-show="!terminalConnecting && !terminalError"></div>
        </div>
      </template>
    </el-dialog>
  </div>
</template>

<script setup>
import {nextTick, onMounted, reactive, ref} from 'vue'
import {ElMessage, ElMessageBox} from 'element-plus'
import {addServer, connectServer, deleteServer, getServerList, getServerStatus, updateServer} from '@/api/server'
import 'xterm/css/xterm.css' // 导入xterm.js样式表

// 加载状态
const loading = ref(false)

// 服务器列表
const serverList = ref([])

// 分页相关
const currentPage = ref(1)
const pageSize = ref(10)
const total = ref(0)

// 搜索表单
const searchForm = reactive({
  ip: '',
  name: ''
})

// 对话框相关
const dialogVisible = ref(false)
const dialogType = ref('add') // add 或 edit
const statusDialogVisible = ref(false)
const viewDialogVisible = ref(false)

// 当前选中的服务器
const currentServer = ref(null)

// 服务器表单
const serverFormRef = ref(null)
const serverForm = reactive({
  id: '',
  ip: '',
  name: '',
  password: '',
  expire_time: '',
  remark: ''
})

// 表单验证规则
const serverRules = {
  ip: [
    {required: true, message: '请输入服务器IP', trigger: 'blur'},
    {pattern: /^(\d{1,3}\.){3}\d{1,3}$/, message: 'IP格式不正确', trigger: 'blur'}
  ],
  name: [
    {required: true, message: '请输入服务器名称', trigger: 'blur'}
  ],
  password: [
    {required: true, message: '请输入服务器密码', trigger: 'blur'}
  ],
  expire_time: [
    {required: false, message: '请选择到期时间', trigger: 'change'}
  ]
}

// 终端相关
const terminalDialogVisible = ref(false)
const terminalConnecting = ref(false)
const terminalError = ref('')
const terminalRef = ref(null)
const terminalInstance = ref(null)
const terminalSocket = ref(null)

// 获取服务器列表
const fetchServerList = async () => {
  loading.value = true
  try {
    const params = {
      page: currentPage.value,
      page_size: pageSize.value,
      ...searchForm
    }

    const res = await getServerList(params)
    serverList.value = res.data.servers
    total.value = res.data.total
  } catch (error) {
    console.error('获取服务器列表失败:', error)
    ElMessage.error('获取服务器列表失败')
  } finally {
    loading.value = false
  }
}

// 搜索
const handleSearch = () => {
  currentPage.value = 1
  fetchServerList()
}

// 重置搜索
const resetSearch = () => {
  searchForm.ip = ''
  searchForm.name = ''
  handleSearch()
}

// 处理页码变化
const handleCurrentChange = (val) => {
  currentPage.value = val
  fetchServerList()
}

// 处理每页条数变化
const handleSizeChange = (val) => {
  pageSize.value = val
  currentPage.value = 1
  fetchServerList()
}

// 新增服务器
const handleAddServer = () => {
  dialogType.value = 'add'
  serverForm.id = ''
  serverForm.ip = ''
  serverForm.name = ''
  serverForm.password = ''
  serverForm.expire_time = ''
  serverForm.remark = ''
  dialogVisible.value = true
}

// 编辑服务器
const handleEdit = (row) => {
  dialogType.value = 'edit'
  currentServer.value = row
  serverForm.id = row.id
  serverForm.ip = row.ip
  serverForm.name = row.name
  serverForm.password = '' // 密码不回显
  serverForm.expire_time = row.expire_time
  serverForm.remark = row.remark
  dialogVisible.value = true
}

// 查看服务器
const handleView = (row) => {
  currentServer.value = row
  viewDialogVisible.value = true
}

// 查看服务器状态
const handleViewStatus = async (row) => {
  currentServer.value = row
  statusDialogVisible.value = true

  try {
    const res = await getServerStatus(row.id)
    const result = res.data
    console.log("result", result)
    // 更新当前服务器状态信息
    currentServer.value = {
      ...currentServer.value,
      cpuUsage: Number(result.cpu_usage),
      memoryUsage: Number(result.memory_usage)?.toFixed(2),
      diskUsage: Number(result.disk_usage)?.toFixed(2),
      networkSpeed: result.network_speed || '',
      uptime: result.uptime || '',
      processes: result.processes || 0
    };
    console.log("currentServer=", currentServer.value)
  } catch (error) {
    console.error('获取服务器状态失败:', error)
    ElMessage.error('获取服务器状态失败')
  }
}

// 连接服务器
const handleConnect = async (row) => {
  console.log('开始连接服务器:', row)
  currentServer.value = row
  terminalDialogVisible.value = true

  // 注意：终端初始化移到handleDialogOpened方法中
  // 这里只设置初始状态
  terminalConnecting.value = true
  terminalError.value = null

  try {
    // 先调用后端连接接口
    console.log('调用后端连接接口')
    await connectServer(row.id)
    console.log('后端连接接口调用成功')
  } catch (error) {
    console.error('连接服务器失败:', error)
    terminalError.value = '连接服务器失败: ' + (error.message || '未知错误')
    terminalConnecting.value = false
  }
}

// 对话框打开后的处理函数
const handleDialogOpened = async () => {
  console.log('对话框已打开，currentServer:', currentServer.value)
  if (!currentServer.value) {
    console.error('没有选择服务器')
    return
  }

  // 使用setTimeout确保DOM完全渲染
  setTimeout(async () => {
    try {
      console.log('延迟后DOM状态检查 - terminalRef:', terminalRef.value)

      // 确保terminalRef元素存在
      if (!terminalRef.value) {
        console.error('终端DOM元素不存在，尝试再次等待')
        await nextTick()
        console.log('nextTick后 - terminalRef:', terminalRef.value)

        if (!terminalRef.value) {
          throw new Error('终端DOM元素不存在，无法初始化终端')
        }
      }

      // 初始化终端
      terminalConnecting.value = true
      terminalError.value = null
      await initTerminal(currentServer.value)
    } catch (error) {
      console.error('初始化终端失败:', error)
      terminalError.value = '初始化终端失败: ' + (error.message || '未知错误')
    } finally {
      terminalConnecting.value = false
    }
  }, 300) // 延迟300毫秒确保DOM已渲染
}

// 初始化终端
const initTerminal = async (server) => {
  try {
    console.log('初始化终端开始，terminalRef:', terminalRef.value)

    // 确保terminalRef元素存在
    if (!terminalRef.value) {
      throw new Error('终端DOM元素不存在，无法初始化终端')
    }

    // 检查DOM元素尺寸
    const domRect = terminalRef.value.getBoundingClientRect()
    console.log('terminalRef的DOM尺寸:', {
      width: domRect.width,
      height: domRect.height,
      offsetWidth: terminalRef.value.offsetWidth,
      offsetHeight: terminalRef.value.offsetHeight,
      clientWidth: terminalRef.value.clientWidth,
      clientHeight: terminalRef.value.clientHeight
    })

    // 如果DOM元素尺寸为0，可能还未完全渲染
    if (domRect.width === 0 || domRect.height === 0) {
      console.warn('终端DOM元素尺寸为0，可能还未完全渲染')
    }

    // 动态导入xterm库
    console.log('导入xterm库开始')
    const {Terminal} = await import('xterm')
    const {FitAddon} = await import('xterm-addon-fit')
    console.log('导入xterm库完成')

    // 如果已经有终端实例，先销毁
    if (terminalInstance.value) {
      console.log('销毁现有终端实例')
      terminalInstance.value.dispose()
      terminalInstance.value = null
    }

    console.log('创建终端实例开始')
    // 创建新的终端实例
    const terminal = new Terminal({
      cursorBlink: true,
      theme: {
        background: '#1e1e1e',
        foreground: '#f0f0f0'
      },
      fontSize: 14,
      fontFamily: 'Menlo, Monaco, "Courier New", monospace',
      rows: 24,
      cols: 150
    })
    console.log('终端实例创建完成')

    // 创建自适应插件
    const fitAddon = new FitAddon()
    terminal.loadAddon(fitAddon)

    console.log('打开终端到DOM元素')
    // 渲染终端
    try {
      terminal.open(terminalRef.value)
      console.log('终端已打开到DOM元素')
    } catch (openError) {
      console.error('打开终端到DOM元素失败:', openError)
      throw new Error('打开终端失败: ' + (openError.message || '未知错误'))
    }

    // 等待DOM更新
    await nextTick()

    try {
      console.log('尝试适应终端大小')
      fitAddon.fit()
      console.log('终端大小已适应:', {
        cols: terminal.cols,
        rows: terminal.rows
      })
    } catch (fitError) {
      console.error('适应终端大小失败:', fitError)
      // 继续执行，不抛出异常
    }

    // 保存终端实例
    terminalInstance.value = terminal

    console.log('连接WebSocket开始')
    // 连接WebSocket
    connectWebSocket(server, terminal)
    console.log('WebSocket连接已初始化')

    // 监听窗口大小变化
    const resizeObserver = new ResizeObserver(() => {
      console.log('终端容器大小变化')
      try {
        if (fitAddon && terminal) {
          fitAddon.fit()
          console.log('终端大小已重新适应:', {
            cols: terminal.cols,
            rows: terminal.rows
          })

          // 发送终端大小变化事件到服务器
          if (terminalSocket.value && terminalSocket.value.readyState === WebSocket.OPEN) {
            terminalSocket.value.send(JSON.stringify({
              type: 'resize',
              cols: terminal.cols,
              rows: terminal.rows
            }))
          }
        }
      } catch (error) {
        console.error('处理终端大小变化失败:', error)
      }
    })

    console.log('开始观察终端容器大小变化')
    resizeObserver.observe(terminalRef.value)

    // 在对话框关闭时清理
    return () => {
      console.log('清理终端资源')
      resizeObserver.disconnect()
      if (terminal) {
        terminal.dispose()
      }
      if (terminalSocket.value) {
        terminalSocket.value.close()
      }
    }
  } catch (error) {
    console.error('初始化终端失败:', error)
    throw new Error('初始化终端失败: ' + (error.message || '未知错误'))
  }
}

// 连接WebSocket
const connectWebSocket = (server, terminal) => {
  if (!server || !server.id) {
    const error = new Error('服务器信息不完整，无法建立WebSocket连接')
    console.error(error)
    terminalError.value = error.message
    throw error
  }

  if (!terminal) {
    const error = new Error('终端实例不存在，无法建立WebSocket连接')
    console.error(error)
    terminalError.value = error.message
    throw error
  }

  try {
    const token = localStorage.getItem('token')
    // 创建WebSocket连接
    const wsUrl = process.env.VUE_APP_WS_BASE_URL + `/server/terminal/${server.id}?token=${token}`
    console.log('连接WebSocket URL:', wsUrl)

    // 如果已有连接，先关闭
    if (terminalSocket.value) {
      console.log('关闭现有WebSocket连接')
      terminalSocket.value.close()
      terminalSocket.value = null
    }

    const wsProtocol = window.location.protocol === 'https:' ? 'wss:' : 'ws:'
    const socket = new WebSocket(wsUrl, [], {
      headers: {
        'Connection': 'Upgrade',
        'Upgrade': 'websocket',
        'Authorization': token ? `Bearer ${token}` : ''
      }
    })
    console.log('WebSocket实例已创建')

    // 设置连接超时
    const connectionTimeout = setTimeout(() => {
      if (socket.readyState !== WebSocket.OPEN) {
        console.error('WebSocket连接超时')
        socket.close()
        terminalError.value = 'WebSocket连接超时，请重试'
      }
    }, 10000) // 10秒超时

    // 保存WebSocket实例
    terminalSocket.value = socket

    // 连接建立时
    socket.onopen = () => {
      console.log('WebSocket连接已建立')
      clearTimeout(connectionTimeout) // 清除超时定时器

      terminal.writeln('连接成功，欢迎使用终端！')
      terminal.focus() // 自动聚焦终端

      // 发送终端大小
      try {
        const sizeData = JSON.stringify({
          type: 'resize',
          cols: terminal.cols,
          rows: terminal.rows
        })
        console.log('发送终端大小:', sizeData)
        socket.send(sizeData)
      } catch (error) {
        console.error('发送终端大小失败:', error)
      }

      // 监听终端输入
      terminal.onData(data => {
        if (socket.readyState === WebSocket.OPEN) {
          try {
            const inputData = JSON.stringify({
              type: 'input',
              data: data
            })
            console.log('发送终端输入:', data.length > 10 ? data.substring(0, 10) + '...' : data)
            socket.send(inputData)
          } catch (error) {
            console.error('发送终端输入失败:', error)
          }
        }
      })
    }

    // 接收服务器消息
    socket.onmessage = (event) => {
      console.log('收到WebSocket消息:', typeof event.data, event.data.length > 100 ? event.data.substring(0, 100) + '...' : event.data)
      try {
        const message = JSON.parse(event.data)
        if (message.type === 'output') {
          terminal.write(message.data)
        } else {
          console.log('收到未知类型的消息:', message.type)
        }
      } catch (e) {
        // 如果不是JSON格式，直接输出
        console.log('消息不是JSON格式，直接输出')
        terminal.write(event.data)
      }
    }

    // 连接关闭时
    socket.onclose = (event) => {
      console.log('WebSocket连接已关闭:', event.code, event.reason)
      clearTimeout(connectionTimeout) // 清除超时定时器

      terminal.writeln('\r\n\n连接已关闭')
      if (event.wasClean) {
        console.log('WebSocket连接正常关闭')
      } else {
        console.error('WebSocket连接异常关闭')
        terminalError.value = `连接已关闭: ${event.reason || '服务器断开连接'}`
      }
    }

    // 连接错误时
    socket.onerror = (error) => {
      console.error('WebSocket连接错误:', error)
      clearTimeout(connectionTimeout) // 清除超时定时器
      terminalError.value = '连接错误，请检查网络或服务器状态'
    }

    return socket
  } catch (error) {
    console.error('创建WebSocket连接失败:', error)
    terminalError.value = '创建WebSocket连接失败: ' + (error.message || '未知错误')
    throw error
  }
}

// 重新连接终端
const reconnectTerminal = async () => {
  console.log('尝试重新连接终端')
  if (!currentServer.value) {
    console.error('没有选择服务器，无法重新连接')
    return
  }

  // 清理现有资源
  if (terminalSocket.value) {
    console.log('关闭现有WebSocket连接')
    terminalSocket.value.close()
    terminalSocket.value = null
  }

  if (terminalInstance.value) {
    console.log('销毁现有终端实例')
    terminalInstance.value.dispose()
    terminalInstance.value = null
  }

  // 重置状态
  terminalConnecting.value = true
  terminalError.value = null

  try {
    console.log('重新调用后端连接接口')
    await connectServer(currentServer.value.id)

    console.log('重新初始化终端')
    await nextTick()

    // 使用setTimeout确保DOM已更新
    setTimeout(async () => {
      try {
        await initTerminal(currentServer.value)
        console.log('终端重新连接成功')
      } catch (error) {
        console.error('重新初始化终端失败:', error)
        terminalError.value = '重新连接终端失败: ' + (error.message || '未知错误')
      } finally {
        terminalConnecting.value = false
      }
    }, 300)
  } catch (error) {
    console.error('重新连接服务器失败:', error)
    terminalError.value = '重新连接服务器失败: ' + (error.message || '未知错误')
    terminalConnecting.value = false
  }
}

// 关闭终端
const handleCloseTerminal = () => {
  ElMessageBox.confirm(
      '确定要关闭终端连接吗？',
      '警告',
      {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }
  ).then(() => {
    console.log('用户确认关闭终端')
    cleanupTerminal()
    terminalDialogVisible.value = false
  }).catch(() => {
    console.log('用户取消关闭终端')
    // 取消关闭
  })
}

// 清理终端资源
const cleanupTerminal = () => {
  console.log('清理终端资源')

  // 关闭WebSocket连接
  if (terminalSocket.value) {
    console.log('关闭WebSocket连接')
    terminalSocket.value.close()
    terminalSocket.value = null
  }

  // 销毁终端实例
  if (terminalInstance.value) {
    console.log('销毁终端实例')
    terminalInstance.value.dispose()
    terminalInstance.value = null
  }

  // 重置状态
  terminalConnecting.value = false
  terminalError.value = null
  console.log('终端资源清理完成')
}

// 删除服务器
const handleDelete = (row) => {
  ElMessageBox.confirm(
      `确定要作废服务器 ${row.name} 吗？`,
      '警告',
      {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }
  ).then(async () => {
    try {
      console.log('删除服务器:', row.id)
      await deleteServer(row.id)
      ElMessage.success('作废服务器成功')
      await fetchServerList() // 刷新列表
    } catch (error) {
      console.error('作废服务器失败:', error)
      ElMessage.error('作废服务器失败')
    }
  }).catch(() => {
    // 取消删除
  })
}

// 提交服务器表单
const submitServerForm = async () => {
  if (!serverFormRef.value) return

  try {
    await serverFormRef.value.validate()

    if (dialogType.value === 'add') {
      // 新增服务器
      await addServer(serverForm)
      ElMessage.success('新增服务器成功')
    } else {
      // 编辑服务器
      const serverId = serverForm.id
      await updateServer(serverId, serverForm)
      ElMessage.success('编辑服务器成功')
    }

    dialogVisible.value = false
    await fetchServerList() // 刷新列表
  } catch (error) {
    console.error('提交服务器表单失败:', error)
    ElMessage.error('提交失败，请检查表单')
  }
}

// 获取状态颜色
const getStatusColor = (percentage) => {
  if (percentage < 60) return '#67c23a'
  if (percentage < 80) return '#e6a23c'
  return '#f56c6c'
}

// 添加日期禁用函数
const disabledDate = (time) => {
  return time.getTime() < Date.now() - 8.64e7 // 禁用今天之前的日期
}

// 添加到期时间格式化函数
const formatExpireTime = (time) => {
  if (!time) return '永久有效'
  const date = new Date(time)
  return `${date.getFullYear()}-${String(date.getMonth() + 1).padStart(2, '0')}-${String(date.getDate()).padStart(2, '0')} ${String(date.getHours()).padStart(2, '0')}:${String(date.getMinutes()).padStart(2, '0')}:${String(date.getSeconds()).padStart(2, '0')}`
}

// 添加到期时间检查函数
const isExpireSoon = (time) => {
  if (!time) return false
  const expireDate = new Date(time)
  const now = new Date()
  const diffDays = Math.ceil((expireDate - now) / (1000 * 60 * 60 * 24))
  return diffDays <= 7 && diffDays > 0
}

// 页面加载时获取服务器列表
onMounted(() => {
  fetchServerList()
})
</script>

<style lang="scss" scoped>
@import '@/assets/styles/views/server.css';
</style> 
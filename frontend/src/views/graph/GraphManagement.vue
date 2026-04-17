<template>
  <div class="topology-container">
    <header class="toolbar">
      <div class="title">
        <el-icon><Connection /></el-icon>
        服务依赖拓扑图
      </div>
      <div class="actions">
        <el-input
          v-model="keyword"
          placeholder="搜索服务/Topic/API"
          :prefix-icon="Search"
          clearable
          style="width: 200px; margin-right: 12px;"
        />
        <el-select 
          v-model="selectedDataType" 
          placeholder="选择数据类型" 
          style="width: 150px; margin-right: 12px;"
          @change="onDataTypeChange"
        >
          <el-option label="Spot数据" value="spot" />
          <el-option label="Tiger数据" value="tiger" />
        </el-select>
        <el-button type="primary" @click="reload" :loading="loading">
          <el-icon><Refresh /></el-icon>
          刷新拓扑
        </el-button>
        <el-button @click="resetView">
          <el-icon><ZoomIn /></el-icon>
          重置视图
        </el-button>
        <el-button @click="toggleLayout">
          <el-icon><Grid /></el-icon>
          {{ layoutType === 'force' ? '切换环形布局' : '切换力导向布局' }}
        </el-button>
      </div>
    </header>
    
    <div class="main-content">
      <div id="container" class="topology-canvas" ref="graphRef"></div>
      
      <!-- 缩放控制按钮 -->
      <div class="zoom-controls">
        <el-button-group>
          <el-button size="small" @click="zoomIn" :icon="ZoomIn" circle></el-button>
          <el-button size="small" @click="zoomOut" :icon="ZoomOut" circle></el-button>
          <el-button size="small" @click="resetZoom" :icon="FullScreen" circle></el-button>
        </el-button-group>
      </div>
      
      <!-- 动画状态指示器 -->
      <div class="animation-indicator" v-if="isAnimating">
        <el-icon class="rotating"><Refresh /></el-icon>
        <span>数据流转中...</span>
      </div>
      
      <aside class="info-panel" v-if="selection">
        <div class="panel-header">
          <h3>节点详情</h3>
          <el-button size="small" @click="selection = null" circle>
            <el-icon><Close /></el-icon>
          </el-button>
        </div>
        <div class="panel-content">
          <div class="info-item">
            <label>ID:</label>
            <span>{{ selection.id }}</span>
          </div>
          <div class="info-item">
            <label>名称:</label>
            <span>{{ selection.label }}</span>
          </div>
          <div class="info-item">
            <label>类型:</label>
            <el-tag :type="getTagType(selection.type)" size="small">
              {{ getTypeLabel(selection.type) }}
            </el-tag>
          </div>
          <div class="info-item" v-if="selection.status">
            <label>状态:</label>
            <el-tag :type="selection.status === 'UP' ? 'success' : 'danger'" size="small">
              {{ selection.status }}
            </el-tag>
          </div>
          <div class="info-item" v-if="selection.vulnerabilities">
            <label>漏洞信息:</label>
            <div class="vuln-list">
              <el-tag 
                v-for="vuln in selection.vulnerabilities" 
                :key="vuln.id"
                :type="vuln.severity === 'high' ? 'danger' : vuln.severity === 'medium' ? 'warning' : 'info'"
                size="small"
                style="margin: 2px;"
              >
                {{ vuln.name }}
              </el-tag>
            </div>
          </div>
        </div>
    </aside>
    </div>
    
    <!-- 统计信息面板 -->
    <div class="stats-panel">
      <div class="stats-item">
        <div class="stats-number">{{ graphStats.nodes }}</div>
        <div class="stats-label">节点总数</div>
      </div>
      <div class="stats-item">
        <div class="stats-number">{{ graphStats.edges }}</div>
        <div class="stats-label">连接总数</div>
      </div>
      <div class="stats-item">
        <div class="stats-number">{{ graphStats.services }}</div>
        <div class="stats-label">服务节点</div>
      </div>
      <div class="stats-item">
        <div class="stats-number">{{ graphStats.topics }}</div>
        <div class="stats-label">Topic节点</div>
      </div>
      <div class="stats-item">
        <div class="stats-number">{{ graphStats.apis }}</div>
        <div class="stats-label">API节点</div>
      </div>
      <div class="stats-item">
        <div class="stats-number">{{ graphStats.upServices }}/{{ graphStats.services }}</div>
        <div class="stats-label">正常服务</div>
      </div>
    </div>
  </div>
</template>

<script setup>
import G6 from '@antv/g6'
import { onMounted, onBeforeUnmount, ref, watch, computed } from 'vue'
import { ElMessage } from 'element-plus'
import { 
  Connection, 
  Search, 
  Refresh, 
  ZoomIn, 
  ZoomOut,
  FullScreen,
  Grid, 
  Close 
} from '@element-plus/icons-vue'

const graphRef = ref(null)
let graph = null
let timer = null
const selection = ref(null)
const keyword = ref('')
const loading = ref(false)
const layoutType = ref('force')
const animationTimer = ref(null)
const isAnimating = ref(false)
const selectedDataType = ref('spot') // 当前选择的数据类型

// 统计信息
const graphStats = ref({
  nodes: 0,
  edges: 0,
  services: 0,
  topics: 0,
  apis: 0,
  upServices: 0,
  downServices: 0
})

// 导入示例数据
import { mockA, mockB, mockC } from './exampleData.js'

// 默认使用mockA数据
const mockData = mockA

// 获取标签类型
function getTagType(type) {
  const typeMap = {
    service: 'primary',
    topic: 'info',
    api: 'warning'
  }
  return typeMap[type] || 'default'
}

// 获取类型标签
function getTypeLabel(type) {
  const labelMap = {
    service: '服务',
    topic: 'Topic',
    api: 'API'
  }
  return labelMap[type] || type
}

// 优化箭头布局，避免重叠
function optimizeArrowLayout(edges) {
  const targetGroups = {}
  
  // 按目标节点分组
  edges.forEach(edge => {
    if (!targetGroups[edge.target]) {
      targetGroups[edge.target] = []
    }
    targetGroups[edge.target].push(edge)
  })
  
  // 为每个目标节点的多条边调整箭头位置
  Object.keys(targetGroups).forEach(targetId => {
    const edgesToTarget = targetGroups[targetId]
    if (edgesToTarget.length > 1) {
      // 多条边指向同一节点，调整箭头位置
      edgesToTarget.forEach((edge, index) => {
        const offset = (index - (edgesToTarget.length - 1) / 2) * 3
        edge.style = edge.style || {}
        edge.style.endArrowOffset = 8 + offset
        edge.style.endArrowPosition = 0.95
      })
    }
  })
  
  return edges
}

// 转换数据为G6格式
function toG6Data(data) {
  // 数据验证
  if (!data || !Array.isArray(data.nodes) || !Array.isArray(data.edges)) {
    console.warn('⚠️ 数据格式无效:', data)
    return { nodes: [], edges: [] }
  }
  
  console.log('🔄 开始转换数据为G6格式...')
  
  const nodes = data.nodes.map((node, index) => {
    const isDown = node.status === 'DOWN'
    const isApi = node.type === 'api'
    const isService = node.type === 'service'
    const isTopic = node.type === 'topic'
    
    // 节点样式配置
    let nodeStyle = {
      lineWidth: 2,
      radius: 0
    }
    
    if (isService) {
      nodeStyle = {
        ...nodeStyle,
        fill: isDown ? '#f5222d' : '#52c41a', // 红色表示DOWN，绿色表示UP
        stroke: isDown ? '#ff4d4f' : '#389e0d',
        radius: 6
      }
    } else if (isTopic) {
      nodeStyle = {
        ...nodeStyle,
        fill: '#5b8ff9', // 蓝色主题
        stroke: '#1d39c4'
      }
    } else if (isApi) {
      nodeStyle = {
        ...nodeStyle,
        fill: '#faad14', // 黄色API
        stroke: '#d48806'
      }
    } else {
      nodeStyle = {
        ...nodeStyle,
        fill: '#d9d9d9', // 默认灰色
        stroke: '#bfbfbf'
      }
    }
    
    return {
      id: node.id,
      label: node.label,
      type: isService ? 'rect' : isTopic ? 'circle' : 'diamond',
      size: isTopic ? 35 : isApi ? [60, 40] : [80, 40],
      style: nodeStyle,
      labelCfg: {
        position: 'bottom',
        offset: 10,
        style: {
          fill: '#333',
          fontSize: 12,
          fontWeight: 500
        }
      },
      data: node
    }
  })

  const edges = data.edges.map((edge, index) => {
    // 优化连接标签显示
    let edgeLabel = edge.label || edge.kind
    let edgeColor = '#bfbfbf'
    let edgeStyle = 'cubic-horizontal'
    
    if (edge.kind === 'kafka') {
      edgeLabel = edge.label || 'Kafka'
      edgeColor = '#722ed1' // Kafka主题连接使用紫色
      edgeStyle = 'cubic-vertical' // 垂直曲线更适合Kafka连接
    } else if (edge.kind === 'http') {
      edgeLabel = edge.label || 'HTTP'
      edgeColor = '#1890ff' // HTTP连接使用蓝色
      edgeStyle = 'cubic-horizontal' // 水平曲线适合HTTP连接
    } else {
      console.warn(`⚠️ 未知连接类型: ${edge.kind}, 使用默认样式`)
    }
    
    // 根据连接类型设置不同的箭头样式
    let arrowStyle = {
      path: G6.Arrow.triangle(8, 8, 0), // 默认三角形箭头
      fill: edgeColor,
      stroke: edgeColor,
      lineWidth: 1
    }
    
    if (edge.kind === 'kafka') {
      arrowStyle = {
        path: G6.Arrow.triangle(10, 10, 0), // Kafka连接使用稍大的箭头
        fill: edgeColor,
        stroke: edgeColor,
        lineWidth: 1
      }
    } else if (edge.kind === 'http') {
      arrowStyle = {
        path: G6.Arrow.triangle(8, 8, 0), // HTTP连接使用标准箭头
        fill: edgeColor,
        stroke: edgeColor,
        lineWidth: 1
      }
    }
    
    return {
      source: edge.source,
      target: edge.target,
      label: edgeLabel,
      type: edgeStyle,
      style: {
        endArrow: arrowStyle,
        stroke: edgeColor,
        lineWidth: 2,
        labelFill: '#666',
        radius: 20,
        cursor: 'pointer', // 添加鼠标指针样式
        // 箭头位置调整，避免重叠
        endArrowOffset: 8,  // 箭头偏移量
        endArrowPosition: 0.95 // 箭头位置，0.95表示在距离目标节点95%的位置
      },
      data: edge
    }
  })
  
  console.log(`✅ 数据转换完成: ${nodes.length}个节点, ${edges.length}个连接`)
  
  // 优化箭头布局，避免重叠
  const optimizedEdges = optimizeArrowLayout(edges)
  console.log('🎯 箭头布局优化完成')

  return { nodes, edges: optimizedEdges }
}

// 更新统计信息
function updateStats(data) {
  const services = data.nodes.filter(n => n.type === 'service')
  const topics = data.nodes.filter(n => n.type === 'topic')
  const apis = data.nodes.filter(n => n.type === 'api')
  
  // 计算服务状态统计
  const upServices = services.filter(s => s.status === 'UP').length
  const downServices = services.filter(s => s.status === 'DOWN').length
  
  graphStats.value = {
    nodes: data.nodes.length,
    edges: data.edges.length,
    services: services.length,
    topics: topics.length,
    apis: apis.length,
    upServices: upServices,
    downServices: downServices
  }
  
  console.log('📊 统计信息更新:', {
    总节点数: data.nodes.length,
    总连接数: data.edges.length,
    服务节点: services.length,
    主题节点: topics.length,
    API节点: apis.length,
    正常服务: upServices,
    异常服务: downServices
  })
}

// 验证后端数据格式
function validateBackendData(data) {
  if (!data) {
    console.error('❌ 数据为空')
    return false
  }
  
  const requiredFields = ['nodes', 'edges']
  const hasRequiredFields = requiredFields.every(field => data.hasOwnProperty(field))
  
  if (!hasRequiredFields) {
    const missingFields = requiredFields.filter(field => !data.hasOwnProperty(field))
    console.error('❌ 缺少必需字段:', missingFields)
    return false
  }
  
  if (!Array.isArray(data.nodes) || !Array.isArray(data.edges)) {
    console.error('❌ nodes和edges必须是数组')
    return false
  }
  
  if (data.nodes.length === 0) {
    console.error('❌ 节点数据为空')
    return false
  }
  
  // 验证节点数据
  const validNodes = data.nodes.every((node, index) => {
    if (!node.id || !node.label || !node.type) {
      console.error(`❌ 节点${index}缺少必需字段:`, node)
      return false
    }
    
    if (!['service', 'topic', 'api'].includes(node.type)) {
      console.error(`❌ 节点${index}类型无效: ${node.type}`, node)
      return false
    }
    
    // 验证服务节点的状态字段
    if (node.type === 'service' && !node.hasOwnProperty('status')) {
      console.warn(`⚠️ 服务节点${node.id}缺少status字段`)
    }
    
    return true
  })
  
  if (!validNodes) {
    console.error('❌ 节点数据验证失败')
    return false
  }
  
  // 验证连接数据
  const validEdges = data.edges.every((edge, index) => {
    if (!edge.source || !edge.target || !edge.kind) {
      console.error(`❌ 连接${index}缺少必需字段:`, edge)
      return false
    }
    
    // 验证连接类型
    if (!['http', 'kafka'].includes(edge.kind)) {
      console.warn(`⚠️ 连接${index}类型未知: ${edge.kind}`, edge)
    }
    
    // 验证源节点和目标节点是否存在
    const sourceExists = data.nodes.some(n => n.id === edge.source)
    const targetExists = data.nodes.some(n => n.id === edge.target)
    
    if (!sourceExists) {
      console.error(`❌ 连接${index}的源节点不存在: ${edge.source}`)
      return false
    }
    
    if (!targetExists) {
      console.error(`❌ 连接${index}的目标节点不存在: ${edge.target}`)
      return false
    }
    
    return true
  })
  
  if (!validEdges) {
    console.error('❌ 连接数据验证失败')
    return false
  }
  
  console.log('✅ 数据格式验证通过')
  return true
}

// 数据类型切换处理
function onDataTypeChange(type) {
  console.log(`🔄 切换数据类型: ${type}`)
  selectedDataType.value = type
  
  // 更新URL参数
  const url = new URL(window.location)
  url.searchParams.set('type', type)
  window.history.pushState({}, '', url)
  
  // 重新加载拓扑图
  loadGraph()
}

// 获取拓扑数据
async function fetchGraphData() {
  loading.value = true
  try {
    // 使用当前选择的数据类型
    const type = selectedDataType.value
    
    // 根据type参数选择不同的数据
    let selectedData
    switch (type) {
      case 'spot':
        selectedData = mockA
        break
      case 'tiger':
        selectedData = mockB
        break
      default:
        selectedData = mockA
    }
    
    // 模拟API调用延迟
    await new Promise(resolve => setTimeout(resolve, 500))
    
    // 这里可以替换为真实的API调用
    // const response = await axios.get(`/graph?type=${type}`)
    // return response.data
    
    console.log(`📊 加载拓扑数据: type=${type}`)
    console.log('🔧 使用模拟数据:', selectedData)
    return JSON.parse(JSON.stringify(selectedData))
  } catch (error) {
    ElMessage.error('获取拓扑数据失败')
    console.error('获取拓扑数据失败:', error)
    return mockA // 降级到默认数据
  } finally {
    loading.value = false
  }
}

// 加载拓扑图
async function loadGraph() {
  try {
    console.log('🔄 开始加载拓扑图...')
    
    const rawData = await fetchGraphData()
    console.log('📥 获取到原始数据:', rawData)
    
    // 验证后端数据格式
    if (!validateBackendData(rawData)) {
      ElMessage.error('数据格式错误，请检查后端返回的数据结构')
      console.error('❌ 数据格式验证失败:', rawData)
      return
    }
    
    // 关键词过滤
    let filteredData = rawData
    if (keyword.value.trim()) {
      const kw = keyword.value.trim().toLowerCase()
      console.log('🔍 应用关键词过滤:', kw)
      
      const keepNodes = new Set()
      
      rawData.nodes.forEach(node => {
        if ((node.label || node.id).toLowerCase().includes(kw)) {
          keepNodes.add(node.id)
        }
      })
      
      const filteredEdges = rawData.edges.filter(edge => 
        keepNodes.has(edge.source) || keepNodes.has(edge.target)
      )
      
      filteredData = {
        nodes: rawData.nodes.filter(node => keepNodes.has(node.id)),
        edges: filteredEdges
      }
      
      console.log(`🔍 过滤结果: ${filteredData.nodes.length}/${rawData.nodes.length} 节点, ${filteredData.edges.length}/${rawData.edges.length} 连接`)
    }
    
    const g6Data = toG6Data(filteredData)
    updateStats(filteredData)
    
    if (graph) {
      graph.changeData(g6Data)
      console.log('🎯 拓扑图数据更新完成')
    }
    
    console.log('✅ 拓扑图加载成功:', {
      原始数据: rawData,
      过滤后数据: filteredData,
      G6数据: g6Data
    })
    
    ElMessage.success(`拓扑图加载成功: ${filteredData.nodes.length}个节点, ${filteredData.edges.length}个连接`)
  } catch (error) {
    ElMessage.error('加载拓扑图失败')
    console.error('❌ 加载拓扑图失败:', error)
  }
}

// 动态流转动画函数
function animateFlow(startNodeId, endNodeId, duration = 2000) {
  if (isAnimating.value || !graph) return
  
  isAnimating.value = true
  console.log(`🎬 开始动画: ${startNodeId} -> ${endNodeId}`)
  
  // 查找连接路径
  const path = findPath(startNodeId, endNodeId)
  if (!path || path.length === 0) {
    console.log('⚠️ 未找到连接路径')
    isAnimating.value = false
    return
  }
  
  console.log(`🛤️ 找到路径: ${path.length} 条边`)
  console.log('🛤️ 路径详情:', path.map(edge => `${edge.source} -> ${edge.target}`))
  
  // 在现有实线上添加动画效果，按照路径顺序依次激活
  const animatedEdges = []
  const nodeActivationOrder = [startNodeId] // 记录节点激活顺序
  
  // 按顺序激活每条边和节点
  path.forEach((edge, index) => {
    // 查找现有的边
    const existingEdge = graph.findById(edge.id)
    if (!existingEdge) {
      console.warn(`⚠️ 未找到边: ${edge.id}`)
      return
    }
    
    // 保存原始样式
    const originalStyle = { ...existingEdge.getModel().style }
    
    // 延迟激活，确保按顺序进行
    setTimeout(() => {
      console.log(`🎯 激活边 ${index + 1}/${path.length}: ${edge.source} -> ${edge.target}`)
      
      // 激活源节点（如果还没激活）
      if (!nodeActivationOrder.includes(edge.source)) {
        nodeActivationOrder.push(edge.source)
        activateNode(edge.source, index)
      }
      
      // 激活边
      activateEdge(existingEdge, originalStyle, index)
      
      // 激活目标节点
      if (!nodeActivationOrder.includes(edge.target)) {
        nodeActivationOrder.push(edge.target)
        activateNode(edge.target, index)
      }
      
      // 记录动画边
      animatedEdges.push({ edge: existingEdge, originalStyle })
      
    }, index * 300) // 每条边延迟300ms，确保顺序清晰
  })
  
  // 清理动画
  setTimeout(() => {
    console.log('🧹 清理动画效果')
    
    // 恢复边的原始样式
    animatedEdges.forEach(({ edge, originalStyle }) => {
      if (edge && !edge.destroyed) {
        graph.updateItem(edge, originalStyle)
      }
    })
    
    // 移除所有节点高亮
    nodeActivationOrder.forEach(nodeId => {
      const node = graph.findById(nodeId)
      if (node) {
        const model = node.getModel()
        graph.updateItem(node, {
          style: {
            ...model.style,
            shadowColor: 'transparent',
            shadowBlur: 0,
            shadowOffsetX: 0,
            shadowOffsetY: 0
          }
        })
      }
    })
    
    isAnimating.value = false
    console.log('✅ 动画清理完成')
  }, path.length * 300 + 1000) // 根据路径长度调整清理时间
}

// 激活节点的函数
function activateNode(nodeId, activationIndex) {
  const node = graph.findById(nodeId)
  if (!node) return
  
  console.log(`✨ 激活节点: ${nodeId} (第${activationIndex + 1}步)`)
  
  // 添加高亮效果
  const model = node.getModel()
  graph.updateItem(node, {
    style: {
      ...model.style,
      shadowColor: '#1890ff',
      shadowBlur: 20 + activationIndex * 5, // 激活顺序越晚，阴影越明显
      shadowOffsetX: 0,
      shadowOffsetY: 0
    }
  })
}

// 激活边的函数
function activateEdge(edge, originalStyle, activationIndex) {
  if (!edge || edge.destroyed) return
  
  console.log(`✨ 激活边: ${edge.getModel().source} -> ${edge.getModel().target} (第${activationIndex + 1}步)`)
  
  // 添加动画效果到现有边
  graph.updateItem(edge, {
    style: {
      ...originalStyle,
      stroke: '#1890ff',        // 动画时使用蓝色
      lineWidth: 4,             // 动画时加粗
      lineDash: [5, 5],         // 添加虚线效果
      lineDashOffset: 0,        // 初始偏移
      opacity: 1,               // 完全不透明
      // 动画时箭头样式
      endArrow: {
        path: G6.Arrow.triangle(10, 10, 0), // 动画时箭头稍大
        fill: '#1890ff',                     // 动画时箭头填充色
        stroke: '#1890ff',                   // 动画时箭头边框色
        lineWidth: 2                         // 动画时箭头边框加粗
      }
    }
  })
  
  // 流动动画 - 使用定时器模拟流动效果
  let dashOffset = 0
  const flowInterval = setInterval(() => {
    if (edge && !edge.destroyed) {
      dashOffset -= 2
      graph.updateItem(edge, {
        style: {
          ...originalStyle,
          stroke: '#1890ff',
          lineWidth: 4,
          lineDash: [5, 5],
          lineDashOffset: dashOffset,
          opacity: 1,
          // 保持动画时箭头样式
          endArrow: {
            path: G6.Arrow.triangle(10, 10, 0), // 动画时箭头稍大
            fill: '#1890ff',                     // 动画时箭头填充色
            stroke: '#1890ff',                   // 动画时箭头边框色
            lineWidth: 2                         // 动画时箭头边框加粗
          }
        }
      })
    } else {
      clearInterval(flowInterval)
    }
  }, 50)
  
  // 清理定时器
  setTimeout(() => {
    clearInterval(flowInterval)
  }, 2000) // 每条边的动画持续2秒
}

// 查找节点间的路径
function findPath(startId, endId) {
  const visited = new Set()
  const queue = [{ node: startId, path: [] }]
  
  while (queue.length > 0) {
    const { node, path } = queue.shift()
    
    if (node === endId) {
      return path
    }
    
    if (visited.has(node)) continue
    visited.add(node)
    
    // 查找所有出边
    const edges = graph.getEdges()
    edges.forEach(edge => {
      const model = edge.getModel()
      if (model.source === node && !visited.has(model.target)) {
        // 确保路径包含完整的边信息，包括ID
        const pathEdge = {
          id: edge.get('id'),           // 边的ID
          source: model.source,         // 源节点
          target: model.target,         // 目标节点
          label: model.label,           // 边标签
          kind: model.data?.kind        // 连接类型
        }
        
        queue.push({
          node: model.target,
          path: [...path, pathEdge]
        })
      }
    })
  }
  
  return null
}

// 查找节点的所有下游节点
function findDownstreamNodes(nodeId) {
  const visited = new Set()
  const queue = [nodeId]
  const downstream = []
  
  while (queue.length > 0) {
    const node = queue.shift()
    if (visited.has(node)) continue
    visited.add(node)
    
    const edges = graph.getEdges()
    edges.forEach(edge => {
      const model = edge.getModel()
      if (model.source === node && !visited.has(model.target)) {
        downstream.push(model.target)
        queue.push(model.target)
      }
    })
  }
  
  return downstream
}

// 查找节点的所有可能路径
function findAllPaths(nodeId) {
  const paths = []
  const edges = graph.getEdges()
  const visited = new Set()
  
  // 使用BFS查找所有可达路径
  const queue = [{ node: nodeId, path: [], depth: 0 }]
  const maxDepth = 20 // 最多12跳
  
  while (queue.length > 0) {
    const { node, path, depth } = queue.shift()
    
    if (depth >= maxDepth || visited.has(node)) continue
    visited.add(node)
    
    // 查找所有出边
    edges.forEach(edge => {
      const model = edge.getModel()
      if (model.source === node && !visited.has(model.target)) {
        const newPath = [...path, { source: node, target: model.target, edgeId: edge.get('id') }]
        
        // 记录路径
        if (depth === 0) {
          // 直接连接
          paths.push({ 
            start: nodeId, 
            end: model.target, 
            path: newPath,
            type: 'direct'
          })
        } else {
          // 间接连接
          paths.push({ 
            start: nodeId, 
            end: model.target, 
            path: newPath,
            type: 'indirect',
            depth: depth + 1
          })
        }
        
        // 继续搜索
        queue.push({ 
          node: model.target, 
          path: newPath, 
          depth: depth + 1 
        })
      }
    })
  }
  
  // 按深度排序，直接连接优先
  paths.sort((a, b) => {
    if (a.type === 'direct' && b.type === 'indirect') return -1
    if (a.type === 'indirect' && b.type === 'direct') return 1
    if (a.depth !== b.depth) return a.depth - b.depth
    return 0
  })
  
  console.log(`🔍 找到 ${paths.length} 条路径:`, paths.map(p => `${p.start} -> ${p.end} (${p.type}, 深度: ${p.depth || 1})`))
  
  return paths
}

// 缩放控制函数
function zoomIn() {
  if (graph) {
    const zoom = graph.getZoom()
    graph.zoomTo(zoom * 1.2)
  }
}

function zoomOut() {
  if (graph) {
    const zoom = graph.getZoom()
    graph.zoomTo(zoom * 0.8)
  }
}

function resetZoom() {
  if (graph) {
    graph.zoomTo(1)
    graph.fitView()
  }
}

// 创建拓扑图
function createGraph() {
  const container = document.getElementById('container')
  
  graph = new G6.Graph({
    container,
    width: container.clientWidth,
    height: container.clientHeight,
    layout: {
      type: layoutType.value,
      preventOverlap: true,
      nodeSpacing: 80,
      ...(layoutType.value === 'force' ? {
        nodeStrength: -50,
        edgeStrength: 0.2,
        nodeSize: 60,
        alpha: 0.3,
        alphaDecay: 0.028,
        alphaMin: 0.001,
        velocityDecay: 0.09
      } : {
        center: [container.clientWidth / 2, container.clientHeight / 2],
        radius: 250,
        startAngle: 0,
        endAngle: 2 * Math.PI
      })
    },
    defaultNode: {
      labelCfg: {
        style: {
          fill: '#333',
          fontSize: 12,
          fontWeight: 500
        }
      }
    },
    defaultEdge: {
      style: {
        endArrow: {
          path: G6.Arrow.triangle(8, 8, 0), // 三角形箭头，尺寸8x8
          fill: '#bfbfbf',                    // 默认箭头填充色
          stroke: '#bfbfbf',                  // 默认箭头边框色
          lineWidth: 1                       // 箭头边框宽度
        },
        stroke: '#bfbfbf',
        lineWidth: 2,
        endArrowOffset: 8,  // 箭头偏移量
        endArrowPosition: 0.95 // 箭头位置
      }
    },
    modes: {
      default: [
        'drag-canvas',
        'drag-node'
      ]
    },
    // 禁用鼠标滚轮缩放
    wheelZoom: false,
  })

  // 绑定事件
  graph.on('node:click', (evt) => {
    selection.value = evt.item.getModel().data
    
    // 触发动态流转动画
    const nodeId = evt.item.getModel().id
    if (nodeId) {
      // 查找该节点的所有下游节点，创建流转效果
      const downstreamNodes = findDownstreamNodes(nodeId)
      if (downstreamNodes.length > 0) {
        downstreamNodes.forEach(targetId => {
          setTimeout(() => {
            animateFlow(nodeId, targetId, 1500)
          }, Math.random() * 500)
        })
      }
    }
  })
  
  graph.on('edge:click', (evt) => {
    selection.value = evt.item.getModel().data
    
    // 触发动态流转动画
    const edge = evt.item.getModel()
    if (edge.source && edge.target) {
      animateFlow(edge.source, edge.target, 2000)
    }
  })
  
  graph.on('canvas:click', () => {
    selection.value = null
  })
  
  graph.on('node:dblclick', (evt) => {
    const model = evt.item.getModel()
    ElMessage.warning(`双击了节点: ${model.label}`)
    
    // 双击时显示完整的流转路径
    const nodeId = model.id
    const allPaths = findAllPaths(nodeId)
    if (allPaths.length > 0) {
      console.log(`🎬 双击节点 ${nodeId}，开始显示 ${allPaths.length} 条流转路径`)
      
      // 按顺序显示每条路径，确保流转逻辑清晰
      allPaths.forEach((pathInfo, index) => {
        setTimeout(() => {
          console.log(`🔄 显示路径 ${index + 1}/${allPaths.length}: ${pathInfo.start} -> ${pathInfo.end} (${pathInfo.type})`)
          animateFlow(pathInfo.start, pathInfo.end, 3000)
        }, index * 800) // 每条路径间隔800ms，确保前一条路径完成后再开始下一条
      })
    }
  })
}

// 刷新拓扑图
function reload() {
  loadGraph()
}

// 重置视图
function resetView() {
  if (graph) {
    graph.fitView()
    graph.translate(0, 0)
  }
}

// 切换布局
function toggleLayout() {
  layoutType.value = layoutType.value === 'force' ? 'circular' : 'force'
  if (graph) {
    const container = document.getElementById('container')
    const newLayout = layoutType.value === 'force' ? {
      type: 'force',
      preventOverlap: true,
      nodeSpacing: 80,
      nodeStrength: -50,
      edgeStrength: 0.2,
      nodeSize: 60,
      alpha: 0.3,
      alphaDecay: 0.028,
      alphaMin: 0.001,
      velocityDecay: 0.09
    } : {
      type: 'circular',
      preventOverlap: true,
      nodeSpacing: 80,
      center: [container.clientWidth / 2, container.clientHeight / 2],
      radius: 250,
      startAngle: 0,
      endAngle: 2 * Math.PI
    }
    
    graph.updateLayout(newLayout)
  }
}

// 监听关键词变化
watch(keyword, () => {
  loadGraph()
})

// 监听窗口大小变化
function handleResize() {
  if (graph && graphRef.value) {
    graph.changeSize(
      graphRef.value.clientWidth,
      graphRef.value.clientHeight
    )
  }
}

onMounted(async () => {
  // 从URL参数初始化数据类型
  const urlParams = new URLSearchParams(window.location.search)
  const type = urlParams.get('type') || 'spot'
  selectedDataType.value = type
  
  createGraph()
  await loadGraph()
  
  // 自动刷新
  timer = setInterval(loadGraph, 30000) // 30秒刷新一次
  
  // 监听窗口大小变化
  window.addEventListener('resize', handleResize)
})

onBeforeUnmount(() => {
  if (timer) {
    clearInterval(timer)
  }
  if (graph) {
    graph.destroy()
  }
  window.removeEventListener('resize', handleResize)
})
</script>

<style scoped>
@import '@/assets/styles/views/graph.css';
</style>
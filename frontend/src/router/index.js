import { createRouter, createWebHistory } from 'vue-router'

const router = createRouter({
  history: createWebHistory(),
  routes: [
    {
      path: '/',
      redirect: '/login'
    },
    {
      path: '/login',
      name: 'Login',
      component: () => import('@/components/Login.vue')
    },
    {
      path: '/dashboard',
      name: 'Dashboard',
      component: () => import('@/components/Dashboard.vue'),
      meta: { requiresAuth: true },
      children: [
        {
          path: 'server',
          name: 'ServerManagement',
          component: () => import('@/views/server/ServerManagement.vue')
        },
        {
          path: 'container',
          name: 'ContainerManagement',
          component: () => import('@/views/container/ContainerManagement.vue')
        },
        {
          path: 'file',
          name: 'FileManagement',
          component: () => import('@/views/file/FileManagement.vue')
        },
        {
          path: 'service',
          name: 'ServiceManagement',
          component: () => import('@/views/service/ServiceManagement.vue')
        },
        {
          path: 'deploy',
          name: 'DeployManagement',
          component: () => import('@/views/deploy/DeployManagement.vue')
        },
        {
          path: 'graph',
          name: 'GraphManagement',
          component: () => import('@/views/graph/GraphManagement.vue')
        }
      ]
    },
    {
      path: '/:pathMatch(.*)*',
      name: 'NotFound',
      component: () => import('@/components/NotFound.vue')
    }
  ]
})

// 路由守卫
router.beforeEach((to, from, next) => {
  const isAuthenticated = localStorage.getItem('token')
  
  if (to.meta.requiresAuth && !isAuthenticated) {
    next('/login')
  } else {
    next()
  }
})

export default router 
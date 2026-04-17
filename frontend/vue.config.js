const { defineConfig } = require('@vue/cli-service')

module.exports = defineConfig({
  transpileDependencies: true,
  lintOnSave: false,
  devServer: {
    port: 4000,
    proxy: {
      '/api': {
        target: process.env.VUE_APP_HTTP_BASE_URL,
        changeOrigin: true
      },
      '/ws_backend': {
        target: process.env.VUE_APP_WS_BASE_URL,
        changeOrigin: true,
        ws: true
      },
      '/ws':{
        ws: false,
        target: process.env.VUE_APP_WS_BASE_URL,
      }
    }
  },
  configureWebpack: {
    resolve: {
      alias: {
        '@': '/src'
      }
    }
  }
}) 
const { defineConfig } = require('@vue/cli-service')

module.exports = defineConfig({
  transpileDependencies: true,
  lintOnSave: false,
  devServer: {
    port: 4000,
    proxy: {
      '/api': {
        target: 'http://localhost:8080',
        changeOrigin: true
      },
      '/ws_backend': {
        target: 'ws://localhost:8080',
        changeOrigin: true,
        ws: true
      },
      '/ws':{
        ws: false,
        target: 'http://localhost:8080',
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
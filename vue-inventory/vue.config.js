module.exports = {
  configureWebpack: {
    resolve: {
      fallback: {
        "vm": require.resolve("vm-browserify"),
        "stream": require.resolve("stream-browserify")
      }
    }
  },
    devServer: {
        // 启动项目时监听80端口
        port: 88,
        // 项目启动成功后,自动打开系统默认浏览器
        open: true
    }
}
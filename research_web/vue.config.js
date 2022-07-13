const FilemanagerPlugin = require('filemanager-webpack-plugin') // 压缩插件

module.exports = {
    publicPath: process.env.NODE_ENV === 'production' ? '/test/' : '/', // 部署应用包时的基本 URL
    outputDir: 'dist', // 生产环境构建文件的目录
    assetsDir: '', // 放置生成的静态资源 (js、css、img、fonts) 的 (相对于 outputDir 的) 目录
    indexPath: 'index.html', // 指定生成的 index.html 的输出路径 (相对于 outputDir)。也可以是一个绝对路径
    lintOnSave: process.env.NODE_ENV !== 'production', // 是否在开发环境下通过 eslint-loader 在每次保存时 lint 代码
    productionSourceMap: true, // 是否需要生产环境的 source map
    devServer: {
        // host: "localhost", //要设置当前访问的ip 否则失效
        // port: 8080,//当前web服务端口
        // open: false, //浏览器自动打开页面
        proxy: {
          '/api': {
            target: 'http://localhost:9000',//目标地址
            ws: true,//是否代理websocket
            changeOrigin: true,//是否跨域
            pathRewrite: {
              '^/api': '/'//url重写
            }
          }
        }
    },
    configureWebpack: config => {
      if (process.env.NODE_ENV === 'production') {
        return {
          plugins: [
            new FilemanagerPlugin({ // 初始化 filemanager-webpack-plugin 插件实例
              onEnd: {
                delete: [ // 首先需要删除项目根目录下的dist.zip
                  './dist.zip'
                ],
                archive: [ // 然后我们选择dist文件夹将之打包成dist.zip并放在根目录
                  { source: './dist', destination: './dist.zip' }
                ]
              }
            })
          ]
        }
      }
    }

}
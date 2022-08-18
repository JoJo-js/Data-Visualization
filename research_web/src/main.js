import Vue from 'vue'
import App from './App.vue'
import router from './router'
import axios from 'axios'
import httpf from './service/http.js' // 引用封装axios
import ElementUI from 'element-ui'
import 'element-ui/lib/theme-chalk/index.css'
import VueCookies from 'vue-cookies'
// import echarts from 'echarts'
import * as echarts from 'echarts'
import 'echarts-wordcloud'
import store from './store'
import gojs from 'gojs'  // 在 main.js 中引入



Vue.prototype.$go = gojs  // 挂载

Vue.use(VueCookies);
Vue.prototype.$http=axios; /**全局注册*/
Vue.prototype.$httpf=httpf; /**全局注册*/
Vue.prototype.$cookies=VueCookies; /**全局注册*/
Vue.prototype.$echarts=echarts; /**全局注册*/

Vue.config.productionTip = false
Vue.use(ElementUI);


new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')

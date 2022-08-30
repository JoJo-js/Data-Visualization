import Vue from 'vue'
import App from './App.vue'
import router from './router'
import axios from 'axios'
import httpf from './service/http.js'
import ElementUI from 'element-ui'
import 'element-ui/lib/theme-chalk/index.css'
import VueCookies from 'vue-cookies'
// import echarts from 'echarts'
import * as echarts from 'echarts'
import 'echarts-wordcloud'
import store from './store'
import gojs from 'gojs'



Vue.prototype.$go = gojs

Vue.use(VueCookies);
Vue.prototype.$http=axios;
Vue.prototype.$httpf=httpf;
Vue.prototype.$cookies=VueCookies;
Vue.prototype.$echarts=echarts;

Vue.config.productionTip = false
Vue.use(ElementUI);


new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')

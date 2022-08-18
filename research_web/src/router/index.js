import Vue from 'vue'
import VueRouter from 'vue-router'
import Login from '../views/Login.vue'

Vue.use(VueRouter)

const routes = [
    {
    path: '/',
    name:'/',
    component: Login
  },
  {
    path: '/login',
    name:'login',
    component: Login
  },
  {
    path: '/index',
    name:'index',
    component: () => import('../views/Index.vue')
  },
  {
    path:'/emphasis',
    name:'emphasis',
    component: () => import('../views/Index.vue'),
    redirect:'../../views/Index.vue', // 设置默认打开的页面
    children:[
      {
        path: '/emphasis/sql',
        name: 'sql',
        component: () => import('../components/emphasis/sql.vue'),
      },
        {
        path: '/emphasis/er',
        name: 'er',
        component: () => import('../components/emphasis/er.vue'),
      },
        {
        path: '/emphasis/visualization',
        name: 'visualization',
        component: () => import('../components/emphasis/visualization.vue'),
      },
    ]
  }
  
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

router.beforeEach((to, from, next) => {
  if (to.path === '/login') return next() ;
  const token = $cookies.get('token')
  if (token) return next();
  router.push({
    path: '/login',
  })
})
export default router

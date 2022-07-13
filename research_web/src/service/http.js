import service from './contactApi'
import axios from 'axios'
import VueCookies from 'vue-cookies'
import { Loading } from 'element-ui';
import { Message } from 'element-ui';


// service 循环遍历输出不同请求方法
let instance = axios.create({
	baseURL:process.env.VUE_APP_BASE_API,
	timeout:30000,
	headers:{'token':VueCookies.get('token')}
})
const http = {}; // 包裹请求方法容器

// 请求格式/参数的统一
for(let key in service){
	let api = service[key] // url method
	console.log(key,api)
	// async await 作用：避免进入回调地狱 （ajax 嵌套请求）
	http[key] = async function(
			params,//请求参数 get:url,put,post,patch(data),delete:url
			isFormData = false,//是否form-data 请求
			config = {} // 配置参数
		){
			let newParams = {}
			// content-type 是否是 from-data 的判断
			if(params && isFormData){
				newParams = new FormData()
				for(let i in params){
					newParams.append(i,params[i])
				}
			}else{
				newParams = params
			}
			let response = {} // 请求返回值
			//不同请求判断
			if(api.method == 'put' || api.method == 'post' || api.method == 'patch'){
				try{
					response = await instance[api.method](api.url,newParams,config)	
				}catch(err){
					response = err
				}
				
			}else{
				// delete get
				config.params = newParams
				try{
					response = await instance[api.method](api.url,config)	
				}catch(err){
					response = err
				}
			}
			return response
		}
}

let loading = null
// 请求拦截器
instance.interceptors.request.use(config=>{
	loading = Loading.service({lock: true, text:'加载中...', spinner: 'el-icon-loading', background: 'rgba(255, 255, 255, 0.7)'})
	return config
},()=>{
	loading.close();
	Message.error('请求错误，请稍后重试')
})

// 相应拦截器
instance.interceptors.response.use(res=>{
	loading.close();
	return res.data
},()=>{
	loading.close();
	Message.error('请求错误，请稍后重试')
})
export default http
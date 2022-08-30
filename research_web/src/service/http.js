import service from './contactApi'
import axios from 'axios'
import VueCookies from 'vue-cookies'
import { Loading } from 'element-ui';
import { Message } from 'element-ui';


let instance = axios.create({
	baseURL:process.env.VUE_APP_BASE_API,
	timeout:30000,
	headers:{'token':VueCookies.get('token')}
})
const http = {};

for(let key in service){
	let api = service[key] // url method
	console.log(key,api)
	http[key] = async function(
			params,
			isFormData = false,
			config = {}
		){
			let newParams = {}
			if(params && isFormData){
				newParams = new FormData()
				for(let i in params){
					newParams.append(i,params[i])
				}
			}else{
				newParams = params
			}
			let response = {}
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
instance.interceptors.request.use(config=>{
	loading = Loading.service({lock: true, text:'Loading...', spinner: 'el-icon-loading', background: 'rgba(255, 255, 255, 0.7)'})
	return config
},()=>{
	loading.close();
	Message.error('Request error, please try again later')
})

instance.interceptors.response.use(res=>{
	loading.close();
	return res.data
},()=>{
	loading.close();
	Message.error('Request error, please try again later')
})
export default http
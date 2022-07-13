// api 管理文件
const CONTACT_API={
	login:{
		method:'post',
		//url:'/login'
		url : '/basicAuth/login'
	},
	database:{
		method:'get',
		// url:'/database'
		url: '/data/database'
	},
	table:{
		method:'post',
		// url:'/table'
		url: '/data/table'
	},
	fundtype:{
		method:'post',
		// url:'/fundtype'
		url: '/data/type'
	},
	fundListBytable:{
		method:'post',
		// url:'/public/fundListBytable'
		url: '/data/list'
	},
	// 公司平台研究

	sql:{
		method:'post',
		// url:'/emphasis/sql'
		url: '/data/performance/sql'
	},

	er:{
		method:'post',
		// url:'/emphasis/sql'
		url: '/data/performance/er'
	},


	
}
export default CONTACT_API  //导出  外面才能引用
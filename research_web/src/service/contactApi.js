
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
	vstable:{
		method:'post',
		// url:'/table'
		url: '/data/vstable'
	},
	vstable2:{
		method:'post',
		// url:'/table'
		url: '/data/vstable2'
	},
	attributeList:{
		method:'post',
		// url:'/public/fundListBytable'
		url: '/data/list'
	},
	judgepic:{
		method:'post',
		// url:'/public/fundListBytable'
		url: '/data/judgepic'
	},
	picdata:{
		method:'post',
		// url:'/public/fundListBytable'
		url: '/data/picdata'
	},

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
export default CONTACT_API
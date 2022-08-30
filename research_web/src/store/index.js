import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

const store = new Vuex.Store({
  state: {
    count: 0,
    pdfData :[],
    database: "",
    table: "",
    tableOptions:[],
    databaseOptions:[]
  },

  mutations: {
    addCount: function(state, payload){
        state.count += payload.num 
    },
    increment:function(state){
        state.count++
    },
    decrement: function(state){
        state.count--
    },
    table:function(state, payload){
        if(payload.type == 'table'){
            state.table = payload.value
        }else if(payload.type == 'database'){
            state.database = payload.value
        }else if(payload.type == 'tableOptions'){
            state.tableOptions = payload.value
        }else if(payload.type == 'databaseOptions'){
            state.databaseOptions = payload.value
        }
    },
    database: function(state, payload){
        if(payload.type == 'table'){
            state.table = payload.value
        }else{
            state.database = payload.value
        }
    },
    pdfOperate: function(state, payload){
        console.log(payload)
        var f = false
        state.pdfData.forEach((item,index) =>{
            if(item.name==payload.name){
                f = true
                
                if(payload.data.length == 0 && payload.head.length == 0){
                    state.pdfData.splice(index,1)
                }else{
                    item.data = payload.data
                    item.head = payload.head
                }

            }
        })
        if(!f){
            state.pdfData.push({"name": payload.name, "data": payload.data, "type": payload.type, "head": payload.head})
        }
    }

  },
 // {{this.$store.getters.gettersCount}}
  getters:{
      gettersCount:function(state){
        return state.count + 1
      }
  },

  actions:{
    incrementAsync: function(context, payload){
        console.log(context.state)
        console.log(context.getters)
        return new Promise((resolve, reject) => {
            setTimeout(() => {
                context.commit('increment', payload)
                resolve('async finished')
            }, 1000)
        })
    }
  }


})

export default store
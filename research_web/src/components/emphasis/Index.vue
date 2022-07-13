<template>
    <div>
        <el-form style="text-align:left" :inline="true" :model="searchForm" class="demo-form-inline">
            <el-form-item label="database">
                <el-select v-model="searchForm.database" filterable  placeholder="select" @change="fundChange">
                    <el-option v-for="item in databaseOptions" :key="item" :label="item" :value="item"></el-option>
                </el-select>
            </el-form-item>
            <el-form-item label="table">
                <el-select v-model="searchForm.table" value-key ='id' filterable placeholder="select" @change="tableChange">
                    <el-option v-for="item in tableOptions" :key="item.id" :label="item.name" :value="item"></el-option>
                </el-select>
            </el-form-item>
        </el-form>
    </div>
</template>
<script>
export default {
  name: 'emphasis_index',
  data () {
    return {
        searchForm:{
            database:"",
            table:""
        },
        databaseOptions:[],
        tableOptions:[]
    }
  },
  mounted(){
      this.searchForm.database=this.$store.state.database
      this.searchForm.table=this.$store.state.table
      this.getdatabase()
  },
  methods: {
        async getdatabase(){
            let res =await this.$httpf.database()
            if(res.code==0){
                this.databaseOptions = res.data
                 this.$store.commit('fundOperate',{"value":res.data, "type":"databaseOptions"})
            }
        },
        async fundChange(value){
            this.tableOptions = []
            let res =await this.$httpf.table({"database_code":value},true)
            if(res.code==0){
                this.tableOptions = res.data
                 this.$store.commit('fundOperate',{"value":res.data, "type":"tableOptions"})
            }
            this.$store.commit('platform',{"value":value, "type":"database"})
        },
        async tableChange(value){
            console.log(value)
            this.$store.commit('platform',{"value":value, "type":"table"})
        },
  }
}
</script>
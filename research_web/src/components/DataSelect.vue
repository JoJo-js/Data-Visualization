<template>

        <!-- <el-form style="text-align:left" :inline="true" :model="searchForm" class="demo-form-inline"> -->
           <span>
            <el-form-item label="Database">
                <el-select v-model="searchForm.database" filterable  placeholder="select" @change="databaseChange">
                    <el-option v-for="item in this.$store.state.databaseOptions" :key="item" :label="item" :value="item"></el-option>
                </el-select>
            </el-form-item>
            
            <el-form-item label="Table" v-if="showtable">
                <el-select v-model="searchForm.table" value-key ='id' filterable placeholder="select" @change="tableChange">
                    <el-option v-for="item in this.$store.state.tableOptions" :key="item.id" :label="item.name" :value="item"></el-option>
                </el-select>
            </el-form-item>
           </span>
        <!-- </el-form> -->

</template>
<script>
export default {
  name: 'emphasis_index',
  props: {
      fatherMethod: {
        type: Function,
        default: null
      },
      showtable: {
          type: Boolean,
          default: true
      } 
    },
  data () {
    return {
        searchForm:{
            database:this.$store.state.database,
            table:this.$store.state.table
        },
        // databaseOptions:this.$store.state.databaseOptions,
        // tableOptions:this.$store.state.tableOptions
    }
  },
  mounted(){
      if(this.$store.state.databaseOptions.length == 0)
        this.getdatabase()
  },
  methods: {
        async getdatabase(){
            let res =await this.$httpf.database()
            if(res.code==0){
                this.$store.commit('table',{"value":res.data, "type":"databaseOptions"})
            }
        },
        async databaseChange(value){
            this.tableOptions = []
            let res =await this.$httpf.table({"database_code":value},true)
            if(res.code==0){
                // this.tableOptions = res.data
                 this.$store.commit('table',{"value":res.data, "type":"tableOptions"})
                 this.$store.commit('database',{"value":value, "type":"database"})
            }
            if(this.showtable == false && this.fatherMethod){
                this.fatherMethod();
            }
            
        },
        async tableChange(value){
            this.$store.commit('database',{"value":value, "type":"table"})
            if (this.fatherMethod) {
                this.fatherMethod();
            }
        },
  }
}
</script>
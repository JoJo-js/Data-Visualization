<template>
    <div>
        <PDFCommon ref="pdfCommon" @changeHeader="handleChecChange"></PDFCommon>
        <el-form style="text-align:left" :inline="true" :model="searchForm" class="demo-form-inline">
            <DataSelect :fatherMethod="initData" :showtable="true"></DataSelect>
        </el-form>

      <el-row v-if="searchForm.table">
              <el-table :data="tableData" border stripe style="width: 100%" :row-style="{height: '0'}" @selection-change="handleSelectionChange">
                <el-table-column type="selection" width="55"> </el-table-column>
                <el-table-column v-for="header in headerData" :prop="header.param" :key="header.label" :label="header.label" :width="header.width" header-align="center" align="center">

            </el-table-column>
              </el-table>
        </el-row>

<!--        <el-row v-if="searchForm.database">-->
<!--            <el-col :span="1"><el-checkbox  style="float:left;" true-label="sql" false-label="remove_sql"  @change="checkboxChange">Select</el-checkbox></el-col>-->
<!--            <el-col :span="23"><div id="sql" :style="{width: '100%', height: '500px',display : 'block'}"></div></el-col>-->
<!--        </el-row>-->
<!--        <el-row v-if="searchForm.database">-->
<!--            <el-col :span="1"><el-checkbox  style="float:left;" true-label="sqlstockstar3" false-label="remove_sqlstockstar3"  @change="checkboxChange">Select</el-checkbox></el-col>-->
<!--            <el-col :span="23"><div id="sqlstockstar3" :style="{width: '100%', height: '500px',display : 'block'}"></div></el-col>-->
<!--        </el-row>-->
    </div>
</template>
<script>
import PDFCommon from '../PDFCommon.vue'
import DataSelect from '../DataSelect.vue'
import ehcartsUtils from '../EChartsUtils'
export default {
  name: 'sql',
  components:{
    PDFCommon,DataSelect
  },
  data () {
    return {
      title: "sql",
      fundOptions: [],
      chartData:[],
      searchForm:{
          database:this.$store.state.database,
          table:this.$store.state.table
      },
      headerData:[],
      tableData:[],
    }
  },
  mounted(){
    if(this.$store.state.database)
        this.sql()
  },
  methods: {
      initData(){
          console.log('------subcomponent called---------', this.$store.state.table)
          this.headerData=[],
          this.tableData=[]
          this.sql()
      },
      async sql(){
            this.searchForm.database=this.$store.state.database,
            this.searchForm.table=this.$store.state.table
            let res_table =await this.$httpf.sql(this.searchForm,true)
            console.log(Object.keys(res_table.data).length)
            if(res_table.code==0){
              for(var key in res_table.data){
                this.headerData.push({ label: key, param: key, align: "center", show: true})
              }
              for(var i=0;i<res_table.data[this.headerData[0]['label']].length;i++){
                var kk = {}
                for(var key in res_table.data){
                  kk[key] = res_table.data[key][i]
                }
                this.tableData.push(kk)
              }
              // console.log(this.headerData)
              console.log(this.tableData)
            }

        },
        handleSelectionChange(value){
            this.$refs.pdfCommon.handleSelectionChangeMultiple(value,"sql",this.headerData)
        },
        handleChecChange(value){
            this.headerData = value
        },
        removeDuplicationData(value){
            this.chartData.forEach((item, index) =>{
                if(item.id == value.id){
                    this.chartData.splice(index, 1);
                }
            })
            this.chartData.push(value)
        }
  }
}
</script>
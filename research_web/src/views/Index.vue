<template>
    <el-container :style="styleObject">
        <bugLeft></bugLeft>
        <el-container :style="styleObject">
          <el-header style="text-align: left; font-size: 20px;position:absolute">
            <span>Data Visualization</span>
          </el-header>  
          <el-header style="text-align: right; font-size: 18px">
            <el-dropdown @command="handleCommand">
              <i class="el-icon-setting" style="margin-right: 15px"></i>
              <el-dropdown-menu slot="dropdown">
                <el-dropdown-item command="logout">Log out</el-dropdown-item>
              </el-dropdown-menu>
            </el-dropdown>
            <span>{{busername}}</span>
          </el-header>
          <el-main>
            <!-- 路由视图 -->
            <router-view></router-view>
          </el-main>
        </el-container>
    </el-container>
  
</template>
<style>
  .el-header {
    background-color: #B3C0D1;
    color: #333;
    line-height: 60px;
  }
  
  .el-aside {
    color: #333;
  }
</style>

<script>
  import bugLeft from './Left.vue'
  export default {
    components:{
      bugLeft
    },
    data() {
       return {
          styleObject: {
            height: '500px',
            border: '1px solid #eee',
          },
          busername:'',
          projectname:''
       }
    },
    mounted:function(){
        var obj = this
        obj.styleObject.height=window.innerHeight*0.90 + 'px'
        obj.busername = localStorage.getItem('busername');
        // obj.getProjectList()
    },
    methods:{
      handleCommand(command) {
        console.log('logout',command)
        if(command=='logout'){
          this.$cookies.remove('token')
          this.$cookies.remove('project')
          this.$router.push({ path: '/login' })
          
        }
      },
      // async getProjectList(){
      //     let res = await this.$httpf.getProjectList({"projectId":this.$cookies.get("project")})
      //     if(res.code==0){
      //         this.projectname = res.data[0].name
      //     }
      // },
    }
  };
</script>
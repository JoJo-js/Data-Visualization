<template>
	<el-aside style="width:15%;border-right: solid 1px #e6e6e6;"> <!-- this.$route.path -->
        <el-menu router :default-openeds="['1','2','3','4','5']" :default-active="activeIndex" @select="handleSelect">
          
          <el-submenu index="1">
              <template slot="title"><i class="el-icon-menu"></i>Database</template>

              <el-menu-item index="/emphasis/sql" route>SQL</el-menu-item>
              <el-menu-item index="/emphasis/er" route>ER</el-menu-item>
            <el-menu-item index="/emphasis/er1" route>ER</el-menu-item>

          </el-submenu>

        </el-menu>
      </el-aside>
</template>
<script type="text/javascript">
  	export default {
        name:'bugLeft',
        data() {
          return {
            activeIndex: '/bug/manageProject',
            bugData:[],
            sysData:[]
          }
        },
        mounted:function(){
            // var obj = this
            // obj.getUserAuthority()
        },
        methods: {
          handleSelect(key, keyPath) {
            console.log(key, keyPath)
            // this.$router.push({path:keyPath});
          },
          setCurrentRoute () {
            this.activeIndex = this.$route.path;//关键   通过他就可以监听到当前路由状态并激活当前菜单
          },
          // async getUserAuthority(){
          //     var obj = this
          //     let res = await obj.$httpf.getUserAuthority()
          //     if(res.code==0){
          //         obj.bugData = res.data.bug;
          //         obj.sysData = res.data.sys;
          //     }
          // },
        },
        watch: {
          $route () {
            this.setCurrentRoute()
          }
        },
        created () {
          this.setCurrentRoute()
        }
  	}

</script>
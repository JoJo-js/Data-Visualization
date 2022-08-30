<template>
    <div>
        <div class = "outer_label" :style="{backgroundImage:'url('+require('../assets/login.jpg')+')'}">
            <!-- <el-image :src="src" fit ></el-image> -->
            <div class = "divForm">
                <el-form :model="ruleForm" status-icon :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm">
                    <el-form-item label="User:" prop="userName" class="labelSize">
                        <el-input v-model="ruleForm.userName"></el-input>
                    </el-form-item>
                    <el-form-item label="Password:" prop="password" class="labelSize">
                        <el-input type="password" v-model="ruleForm.password"></el-input>
                    </el-form-item>
                    <el-form-item>
                        <el-button type="primary" @click="submitForm">Log in</el-button>
                        <el-alert title="Incorrect User or password" type="error" :closable="false" v-if="isShow"></el-alert>
                    </el-form-item>
                </el-form>
            </div>
        </div>
        
    </div>
</template>
<style>
    .outer_label {
        background-size: 100% 100%;
        height: 100%;
        position: fixed;
        width: 100%
    }
    .divForm{
        position: absolute;
        width: 500px;
        height: 200px;
        text-align: center;
        top: 30%;
        left: 40%;
    }
    .labelSize .el-form-item__label{
        font-size: 18px;
        font-weight:bold;
    }
</style>
<script>
export default {
    data() {
      var validatePassword = (rule, value, callback) => {
        if (value === '') {
          callback(new Error('please input password'));
        } else {
          callback();
        }
      };
      var validateUserName = (rule, value, callback) => {
        if (value === '') {
          callback(new Error('please input user name'));
        } else {
          callback();
        }
      };
      return {
        ruleForm: {
          password: '',
          userName: ''
        },
        rules: {
          password: [
            { validator: validatePassword, trigger: 'blur' }
          ],
          userName: [
            { validator: validateUserName, trigger: 'blur' }
          ]
        },
        backgroundDiv: {
            backgroundImage: 'url(../assets/login.jpg)'
        },
        isShow:false
      };
    },
    methods: {
        submitForm() {
          // console.log(this.ruleForm)
            this.$refs['ruleForm'].validate((valid) => {
                if (valid) {
                    this.loginPost()
                } else {
                    return false;
                }
            });
      },
      async loginPost(){
            let res =await this.$httpf.login(this.ruleForm,true)
            if(res.code==0){
                this.$cookies.set("token", res.token)
                localStorage.setItem('busername', res.username);
                let redirect = decodeURIComponent(this.$route.query.redirect || '/index');
                this.$router.push({ path: redirect })
            }else{
                this.isShow = true
            }
      }
    }
  }
</script>
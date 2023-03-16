<template >
    <div class="fCover">
        <el-card class="cover" v-if="loginAdmin.id">
            <slide-verify   :l="42"
                            :r="10"
                            :w="310"
                            :h="155"
                            :accuracy="5" 
                            slider-text="向右滑动"
                            @success="onSuccess"
                            @fail="onFail"
                            @refresh="onRefresh"
            ></slide-verify>
        </el-card>

        <div class="loginBox">
            <div class="loginText">登录</div>
            <el-form :model="admin" :rules="rules" ref="loginForm">
                <el-form-item prop="username">
                    <el-input placeholder="请输入账号" prefix-icon="el-icon-user" size="medium" v-model="admin.username"></el-input>
                </el-form-item>
                <el-form-item prop="password">
                    <el-input placeholder="请输入密码" show-password prefix-icon="el-icon-lock" size="medium" v-model="admin.password"></el-input>
                </el-form-item>
                <el-form-item>
                    <el-button class="btn" size="medium" type="primary" @click="login">登录</el-button>
                </el-form-item>
            </el-form>
        </div>
    </div>
</template>
<script>
import request from '@/utils/request'
import Cookies from 'js-cookie'

export default {
    name:'LOGIN',
    data() {
        return {
            loginAdmin:{},
            admin:{},
            rules: {
                username: [
                    { required: true, message: '请输入用户名', trigger: 'blur' },
                    { min: 1, max: 10, message: '长度在 1 到 10 个字符', trigger: 'blur' }
                ],
                password: [
                    { required: true, message: '请输入密码', trigger: 'blur' },
                    { min: 3, max: 10, message: '长度在 3 到 10 个字符', trigger: 'blur' }
                ]
            }
        }
    },
    methods: {
        login() {
            this.$refs['loginForm'].validate((vaild) => {
                if(vaild){
                    request.post('admin/login', this.admin).then(res => {
                        if(res.code === '200'){
                            this.loginAdmin = res.data //滑块组件出现了
                        }else {
                            this.$notify.error(res.msg)
                        }
                    })
                }
            })
            
        },
        onSuccess() { //滑块验证通过之后出发的
            Cookies.set('admin', JSON.stringify(this.loginAdmin))
            this.$notify.success('登录成功')
            this.$router.push('/')
        },
        onFail() {
            console.log('onFail')
        },
        onRefresh() {
            console.log('refresh')
        }
    },
}
</script>
<style scoped>
    .fCover {
        position: relative;
        height: 100vh; 
        overflow: hidden; 
    }
    .cover {
        width: fit-content;
        background-color: white;
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        z-index: 1000;
    }
    .loginBox {
        width: 500px;
        height: 400px;
        background-color: white;
        border-radius: 10px;
        margin: 150px auto;
        padding: 50px;
    }
    .loginText {
        margin: 30px;
        font-size: 30px;
        font-weight: bold;
        text-align: center;
        color: dodgerblue;

    }
    .btn {
        width: 100%;
    }
</style>
<template lang="">
    <div class="topBox">
        <div class="topText">编辑管理员信息</div>
        <el-form :inline="true" :model="form"  class="mainForm" label-width="100px">
            <el-form-item label="用户名" prop="username">
              <el-input v-model="form.username" placeholder="请输入用户名"></el-input>
            </el-form-item>
            
            <el-form-item label="联系方式" prop="phone">
                <el-input v-model="form.phone" placeholder="请输入联系方式"></el-input>
            </el-form-item>
            <el-form-item label="邮箱" prop="email">
                <el-input v-model="form.email" placeholder="请输入地址"></el-input>
            </el-form-item>
        </el-form>

        <div class="bottomBtns">
            <el-button type="primary" @click="save" size="medium">提交</el-button>
            <!-- <el-button type="danger">取消</el-button> -->
        </div>
    </div>
</template>
<script>
   import request from '@/utils/request'

export default {
    name:'EditAdmin',
    data() {
        return {
            form: {}
        }
    },
    created() {
        const id = this.$route.query.id
        request.get('/admin/' + id).then(res => {
            this.form = res.data
        })
    },
    methods: {
        save(){
            request.put('/admin/update', this.form).then(res => {
                if(res.code === '200'){
                    this.$notify.success('更新成功')
                    this.$router.push('/adminList')
                }else{
                    this.$notify.error(res.msg);
                    console.log('失败');
                }
            })
            
        }
    },
}
</script>

<style  scoped>
    .topBox {
        padding: 10px;
        width: 80%;
    }
    .topText {
        font-size: 20px;
        padding: 10px 0;
    }
    .topBox .mainForm {
        /* width: 80%; */
    }
    .bottomBtns {
        text-align: center;
        margin-top: 20px;
    }
</style>
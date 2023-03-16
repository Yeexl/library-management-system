<template lang="">
    <div class="topBox">
        <div class="topText">修改借书信息</div>
        <el-form :inline="true" :rules="rules" ref="ruleForm" :model="form"  class="mainForm" label-width="100px">
            <el-form-item label="图书标准码" prop="bookNo">
                <el-select v-model="form.bookNo" filterable placeholder="请选择" @change="selBook">
                    <el-option
                      v-for="item in books"
                      :key="item.id"
                      :label="item.bookNo"
                      :value="item.bookNo">
                    </el-option>
                  </el-select>
            </el-form-item>
            <el-form-item label="图书名称" prop="bookName">
                <el-input  v-model="form.bookName" disabled ></el-input>
            </el-form-item>
            <el-form-item label="借书积分" prop="score">
                <el-input  v-model="form.score" disabled></el-input>
            </el-form-item>
            <el-form-item label="图书数量" prop="nums">
                <el-input  v-model="form.nums" disabled></el-input>
            </el-form-item>
            <br>
            <el-form-item label="会员码" prop="userNo">
                <el-select v-model="form.userNo" filterable placeholder="请选择" @change="selUser">
                    <el-option
                      v-for="item in users"
                      :key="item.id"
                      :label="item.username"
                      :value="item.username">
                    </el-option>
                  </el-select>
            </el-form-item>
            <el-form-item label="用户名称" prop="userName">
                <el-input v-model="form.userName" disabled></el-input>
            </el-form-item>
            <el-form-item label="用户联系方式" prop="userPhone">
                <el-input v-model="form.userPhone" disabled></el-input>
            </el-form-item>
            <el-form-item label="用户账户积分" prop="account">
                <el-input v-model="form.account" disabled></el-input>
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
    name:'EditBook',
    data() {
        return {
            form: {},
            books:[],
            users:[],
            categories: [],
            rules: {
                bookNo: [
                    { required: true, message: '请输入图书标准码', trigger: 'blur' },
                ],
                userNo: [
                    { required: true, message: '请输入会员码', trigger: 'blur' },
                ],
            }
        }
    },
    created() {
        request.get('/book/list').then(res => {
            this.books = res.data
        }),
        request.get('/user/list').then(res => {
            this.users = res.data.filter(v => v.status)
        })

        const id = this.$route.query.id
        request.get('/borrow/' + id).then(res => {
            this.form = res.data
            
        })
    },
    methods: {
        save(){
            this.$refs['ruleForm'].validate((vaild) => {
                if(vaild){
                    request.put('/borrow/update', this.form).then(res => {
                        if(res.code === '200'){
                            this.$notify.success('更新成功')
                            this.$router.push('/borrowList')
                        }else{
                            this.$notify.error(res.msg);
                        }
                    })
                }
            })
        },
        selBook() {
            const book = this.books.find(v => v.bookNo === this.form.bookNo)
            this.form.bookName = book.name
            this.form.score = book.score
            this.form.nums = book.nums
        },
        selUser() {
            const user = this.users.find(v => v.username === this.form.userNo)
            this.form.userName = user.name
            this.form.userPhone = user.phone
            this.form.account = user.account
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
    .desText {
        width: 400px;
    }
</style>
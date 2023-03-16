<template lang="">
    <div class="topBox">
        <div class="topText">编辑图书</div>
        <el-form :inline="true" :rules="rules" ref="ruleForm" :model="form"  class="mainForm" label-width="100px">
            <el-form-item label="名称" prop="name">
                <el-input v-model="form.name" placeholder="请输入名称"></el-input>
              </el-form-item>
              
              <el-form-item label="描述" prop="description" >
                  <el-input type="textarea" class="desText" v-model="form.description" placeholder="请输入描述"></el-input>
              </el-form-item>
  
              <el-form-item label="出版日期" prop="publishData">
                  <el-date-picker
                      v-model="form.publishData"
                      type="date"
                      placeholder="请选择出版日期">
                  </el-date-picker>
              </el-form-item>
  
              <el-form-item label="作者" prop="author">
                  <el-input v-model="form.author" placeholder="请输入作者"></el-input>
              </el-form-item>
  
              <el-form-item label="出版社" prop="publisher">
                  <el-input v-model="form.publisher" placeholder="请输入出版社"></el-input>
              </el-form-item>
  
              <el-form-item label="分类" prop="category">
                <el-cascader
                    :props="{value: 'name', label:'name'}"
                    v-model="form.categories"
                    :options="categories"></el-cascader>
              </el-form-item>
  
              <el-form-item label="标准码" prop="bookNo">
                  <el-input v-model="form.bookNo" placeholder="请输入标准码"></el-input>
              </el-form-item>
                <br>
              <el-form-item label="封面" prop="cover">
                  <el-input v-model="form.cover" placeholder="请输入封面"></el-input>
                  <el-upload
                    class="avatar-uploader"
                    :action="'http://localhost:9090/api/book/file/upload?token=' + this.admin.token"
                    :show-file-list="false"
                    :on-success="handleCoverSuccess">
                    <img v-if="form.cover" :src="form.cover" class="avatar">
                    <i v-else class="el-icon-plus avatar-uploader-icon"></i>
                </el-upload>
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
import Cookies from 'js-cookie'


export default {
    name:'EditBook',
    data() {
        return {
      admin:Cookies.get('admin') ? JSON.parse(Cookies.get('admin')) : {},
            form: {cover:''},
            categories: [],
            rules: {
                name: [
                    { required: true, message: '请输入图书名称', trigger: 'blur' },
                ],
            }
        }
    },
    created() {
        request.get('/category/tree').then(res => {
            this.categories = res.data
        })

        const id = this.$route.query.id
        request.get('/book/' + id).then(res => {
            this.form = res.data
            if(this.form.category) {
                this.form.categories = this.form.category.split(' > ')
            }
        })
    },
    methods: {
        handleCoverSuccess(res){
            if(res.code === '200') {
                this.form.cover = res.data
            }
        },
        save(){
            this.$refs['ruleForm'].validate((vaild) => {
                if(vaild){
                    request.put('/book/update', this.form).then(res => {
                        if(res.code === '200'){
                            this.$notify.success('更新成功')
                            this.$router.push('/bookList')
                        }else{
                            this.$notify.error(res.msg);
                            console.log('失败');
                        }
                    })
                }
            })
        },
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
    .avatar-uploader .el-upload {
    border: 1px dashed #d9d9d9;
    border-radius: 6px;
    cursor: pointer;
    position: relative;
    overflow: hidden;
  }
  .avatar-uploader .el-upload:hover {
    border-color: #409EFF;
  }
  .avatar-uploader-icon {
    font-size: 28px;
    color: #8c939d;
    width: 178px;
    height: 178px;
    line-height: 178px;
    text-align: center;
  }
  .avatar {
    width: 178px;
    height: 178px;
    display: block;
  }
</style>
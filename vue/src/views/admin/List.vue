<template >
    <div class="mainBox">
        <!-- 搜索表单 -->
    <div class="search">
        <el-input style="width: 240px;" placeholder="请输入用户名" v-model="params.username"></el-input>
        <el-input style="width: 240px; margin-left: 5px;" placeholder="请输入联系方式" v-model="params.phone"></el-input>
        <el-input style="width: 240px; margin-left: 5px;" placeholder="请输入邮箱" v-model="params.email"></el-input>
        <el-button class="searchButton" type="primary" @click="load">
          <i class="el-icon-search"></i>
          搜索
        </el-button>
        <el-button class="searchButton" type="warning" @click="reset">
          <i class="el-icon-refresh"></i>
          重置
        </el-button>
      </div>
  
      <el-table :data="tableData" stripe >
        <el-table-column prop="id" label="编号" ></el-table-column>
        <el-table-column prop="username" label="用户名"></el-table-column>
        <el-table-column prop="phone" label="联系方式"></el-table-column>
        <el-table-column prop="email" label="邮箱"></el-table-column>
        <el-table-column prop="createtime" label="创建时间"></el-table-column>
        <el-table-column prop="updatetime" label="更新时间"></el-table-column>

        <el-table-column label="状态" width="230px">
          <template v-slot="scoped">
            <el-switch
              v-model="scoped.row.status"
              @change="changeStatus(scoped.row)"
              active-color="#13ce66"
              inactive-color="#ff4949">
            </el-switch>
          </template>
        </el-table-column>

        <el-table-column label="操作" width="230px">
            <template v-slot="scoped">
                <!-- scoped.row 就是当前行数据 -->
                <el-button type="primary" @click="$router.push('/editAdmin?id=' + scoped.row.id)">编辑</el-button>
                <el-popconfirm
                    class="delBtn"
                    title="您确定删除这条数据吗"
                    @confirm="del(scoped.row.id)"
                    >
                    <el-button type="danger" slot="reference">删除</el-button>
                </el-popconfirm>

                <el-button class="changebtn" type="warning" @click="handlechangePass(scoped.row)">修改密码</el-button>

            </template>
        </el-table-column>
      </el-table>
  
      <!-- 分页 -->
      <div class="pages">
        <el-pagination
          background
          :current-page="params.pageNum"
          :page-size="params.pageSize"
          layout="prev, pager, next"
          @current-change="handleCurrentChange"
          :total="total">
        </el-pagination>
      </div>

      <el-dialog title="修改密码" :visible.sync="dialogFormVisible" width="30%">
        <el-form :model="form" label-width="100px" ref="formRef" :rules="rules">
          <el-form-item label="新密码" prop="newPass">
            <el-input v-model="form.newPass" autocomplete="off" show-password></el-input>
          </el-form-item>
        </el-form>
        <div slot="footer" class="dialog-footer">
          <el-button @click="dialogFormVisible = false">取 消</el-button>
          <el-button type="primary" @click="savePass">确 定</el-button>
        </div>
      </el-dialog>
    </div>
</template>
<script>
import request from '@/utils/request'
import Cookies from 'js-cookie'

export default {
  name: 'AdminList',
  data() {
    return {
      admin:Cookies.get('admin') ? JSON.parse(Cookies.get('admin')) : {},
      tableData: [],
      total: 0,
      form:{},
      dialogFormVisible: false,
      params: {
        pageNum:1,
        pageSize:10,
        username:'',
        phone:'',
        email:''
      },
      rules:{
        newPass: [
          { required: true, message: '请输入新密码', trigger: 'blur' },
          { min: 1, max: 10, message: '长度在 1 到 10 个字符', trigger: 'blur' }
        ],
      }
    }
  },
  created() {
    this.load()
  },
  methods: {
    changeStatus(row){
      if(this.admin.id === row.id && !row.status){
        row.status = true
        this.$notify.warning('您的操作不合法')
        return 
      }
      request.put('/admin/update', row).then(res => {
                if(res.code === '200'){
                    this.$notify.success('操作成功')
                    this.load()
                }else{
                    this.$notify.error(res.msg);
                }
            })
    },
    handlechangePass(row){
      this.form = JSON.parse(JSON.stringify(row))
      this.dialogFormVisible = true
    },
    savePass(){
      this.$refs['formRef'].validate((vaild) => {
        if(vaild) {
          request.put('/admin/password', this.form).then(res => {
            if(res.code === '200') {
              this.$notify.success('修改成功')
              if(this.form.id === this.admin.id){  //当前修改的用户id 等于当前登录的管理员id，那么修改成功之后需要重新登录
                Cookies.remove('admin')
                this.$router.push('/login')
              }else {
                this.load()
                this.dialogFormVisible = false
              }
            }else {
              this.$notify.error('修改失败')
            }
          })
        }
      })
    },
    load() {

      request.get('/admin/page',{
        params:this.params
      }).then(res => {
        if(res.code === '200' ) {
          this.tableData = res.data.list
          this.total = res.data.total
        }
      })

    },
    reset(){
      this.params = {
        pageNum:1,
        pageSize:10,
        username:'',
        phone:'',
        email:''
      },
      this.load()
    },
    handleCurrentChange(pageNum){
      // 点击分页按钮触发分页
      this.params.pageNum = pageNum
      this.load()
    },
    del(id){
        request.delete('/admin/delete/' + id).then(res => {
            if(res.code === '200'){
                this.$notify.success('删除成功')
                this.load()
            }else {
                this.$notify.error(res.msg);
            }
        })
    }
  },
  
}
</script>
<style scoped>
    .search {
    margin-bottom: 10px;
  }
  .search .searchButton {
    margin-left: 5px;
    
  }
  .pages {
    margin-top: 20px;
  }
  .delBtn {
    margin-left:5px;
  }
  .changebtn {
    margin-left:5px;
  }
  
</style>
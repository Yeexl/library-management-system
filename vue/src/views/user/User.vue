<template >
    <div class="mainBox">
        <!-- 搜索表单 -->
    <div class="search">
        <el-input style="width: 240px;" placeholder="请输入名称" v-model="params.name"></el-input>
        <el-input style="width: 240px; margin-left: 5px;" placeholder="请输入联系方式" v-model="params.phone"></el-input>
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
        <el-table-column prop="username" label="会员号"></el-table-column>
        <el-table-column prop="name" label="名字"></el-table-column>
        <el-table-column prop="age" label="年龄"></el-table-column>
        <el-table-column prop="address" label="地址"></el-table-column>
        <el-table-column prop="phone" label="联系方式"></el-table-column>
        <el-table-column prop="sex" label="性别"></el-table-column>
        <el-table-column prop="account" label="账户积分" ></el-table-column>
        <el-table-column label="状态" width="100px">
          <template v-slot="scoped">
            <el-switch
              v-model="scoped.row.status"
              @change="changeStatus(scoped.row)"
              active-color="#13ce66"
              inactive-color="#ff4949">
            </el-switch>
          </template>
        </el-table-column>
        <el-table-column prop="createtime" label="创建时间"></el-table-column>
        <el-table-column prop="updatetime" label="更新时间"></el-table-column>

        <el-table-column label="操作" width="210">
            <template v-slot="scoped">
                <!-- scoped.row 就是当前行数据 -->
                <el-button type="warning" @click="handleAccountAdd(scoped.row)">充值</el-button>
                <el-button type="primary" @click="$router.push('/editUser?id=' + scoped.row.id)">重置</el-button>
                <el-popconfirm
                    class="delBtn"
                    title="您确定删除这条数据吗"
                    @confirm="del(scoped.row.id)"
                    >
                    <el-button type="danger" slot="reference">删除</el-button>
                </el-popconfirm>

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

      <el-dialog title="充值" :visible.sync="dialogFormVisible" width="30%">
        <el-form :model="form" label-width="100px" ref="ruleForm" :rules="rules">
          <el-form-item label="当前账户积分" prop="account">
            <el-input disabled v-model="form.account" autocomplete="off"></el-input>
          </el-form-item>
          <el-form-item label="积分" prop="score">
            <el-input v-model="form.score" autocomplete="off"></el-input>
          </el-form-item>
        </el-form>
        <div slot="footer" class="dialog-footer">
          <el-button @click="dialogFormVisible = false">取 消</el-button>
          <el-button type="primary" @click="addAccount">确 定</el-button>
        </div>
      </el-dialog>
    </div>
</template>
<script>
import request from '@/utils/request'

export default {
  name: 'User',
  data() {
    const checkNums = (rule, value, callback) => {
      value = parseInt(value)
      if(value < 10 || value > 1000) {
        callback(new Error('请输入大于10或小于1000的整数'))
      }
      callback()
    }
    return {
      tableData: [],
      total: 0,
      dialogFormVisible: false,
      form: {},
      params: {
        pageNum:1,
        pageSize:10,
        name:'',
        phone:'',
      },
      rules: {
          score: [
                { required: true, message: '请输入充值积分', trigger: 'blur' },
                {validator: checkNums, trigger: 'blur'}
          ],
        }
      
    }
  },
  created() {
    this.load()
  },
  methods: {
    changeStatus(row){
      request.put('/user/update', row).then(res => {
                if(res.code === '200'){
                    this.$notify.success('操作成功')
                    this.load()
                }else{
                    this.$notify.error(res.msg);
                }
            })
    },
    load() {
      // fetch( 'http://localhost:9090/user/list').then(res => res.json()).then(res => {
      //   console.log(res);
      //   this.tableData = res
      // })

      request.get('/user/page',{
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
        name:'',
        phone:''
      },
      this.load()
    },
    handleCurrentChange(pageNum){
      // 点击分页按钮触发分页
      this.params.pageNum = pageNum
      this.load()
    },
    del(id){
        request.delete('/user/delete/' + id).then(res => {
            if(res.code === '200'){
                this.$notify.success('删除成功')
                this.load()
            }else {
                this.$notify.error(res.msg);
            }
        })
    },
    handleAccountAdd(row) {
      this.form = JSON.parse(JSON.stringify(row))
      this.dialogFormVisible = true
    },
    addAccount() {
      this.$refs['ruleForm'].validate((vaild) => {
        if(vaild) {
          request.post('/user/account', this.form).then(res => {
            if(res.code === '200'){
              this.$notify.success('充值成功')
              this.load()
              this.dialogFormVisible = false
            }else {
              this.$notify.error(res.msg);
            }
          })
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
  
</style>
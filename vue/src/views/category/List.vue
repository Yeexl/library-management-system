<template >
    <div class="mainBox">
        <!-- 搜索表单 -->
    <div class="search">
        <el-input style="width: 240px;" placeholder="请输入分类名称" v-model="params.name"></el-input>
        <el-button class="searchButton" type="primary" @click="load">
          <i class="el-icon-search"></i>
          搜索
        </el-button>
        <el-button class="searchButton" type="warning" @click="reset">
          <i class="el-icon-refresh"></i>
          重置
        </el-button>
      </div>
  
      <el-table :data="tableData" stripe row-key="id" default-expand-all>
        <el-table-column prop="id" label="编号" ></el-table-column>
        <el-table-column prop="name" label="名称"></el-table-column>
        <el-table-column prop="remark" label="备注"></el-table-column>
        <el-table-column prop="createtime" label="创建时间"></el-table-column>
        <el-table-column prop="updatetime" label="更新时间"></el-table-column>

        <el-table-column label="操作" width="280px">
            <template v-slot="scoped">
                <!-- scoped.row 就是当前行数据 -->
                <el-button type="primary" @click="$router.push('/editCategory?id=' + scoped.row.id)">编辑</el-button>
                <el-popconfirm
                    class="delBtn"
                    title="您确定删除这条数据吗"
                    @confirm="del(scoped.row.id)"
                    >
                    <el-button type="danger" slot="reference">删除</el-button>
                </el-popconfirm>
                <el-button type="success" v-if="!scoped.row.pid" @click="handleAdd(scoped.row)">添加二级分类</el-button>
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

      <el-dialog title="添加二级分类" :visible.sync="dialogFormVisible" width="30%">
        <el-form :model="form" label-width="100px" ref="ruleForm" :rules="rules">
          <el-form-item label="分类名称" prop="name">
            <el-input v-model="form.name" autocomplete="off"></el-input>
          </el-form-item>
          <!-- <el-form-item label="分类备注" prop="remark">
            <el-input v-model="form.remark" autocomplete="off"></el-input>
          </el-form-item> -->
        </el-form>
        <div slot="footer" class="dialog-footer">
          <el-button @click="dialogFormVisible = false">取 消</el-button>
          <el-button type="primary" @click="save">确 定</el-button>
        </div>
      </el-dialog>

    </div>
</template>
<script>
import request from '@/utils/request'
import Cookies from 'js-cookie'

export default {
  name: 'CategoryList',
  data() {
    return {
      admin:Cookies.get('admin') ? JSON.parse(Cookies.get('admin')) : {},
      tableData: [],
      total: 0,
      dialogFormVisible: false,
      form: {},
      pid:null,
      params: {
        pageNum:1,
        pageSize:10,
        name:'',
      },
      rules:{
        name: [
          { required: true, message: '请输入分类名称', trigger: 'blur' },
        ],
      }
    }
  },
  created() {
    this.load()
  },
  methods: {
    load() {
      request.get('/category/page',{
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
      },
      this.load()
    },
    handleCurrentChange(pageNum){
      // 点击分页按钮触发分页
      this.params.pageNum = pageNum
      this.load()
    },
    del(id){
        request.delete('/category/delete/' + id).then(res => {
            if(res.code === '200'){
                this.$notify.success('删除成功')
                this.load()
            }else {
                this.$notify.error(res.msg);
            }
        })
    },
    handleAdd(row) {
      // 将当前行的id作为二级分类的id
      this.pid = row.id
      this.dialogFormVisible = true
    },
    save(){
            this.$refs['ruleForm'].validate((vaild) => {
                if(vaild){
                  // 给二级分类赋值 pid
                  this.form.pid = this.pid
                    request.post('/category/save', this.form).then(res => {
                        if(res.code === '200'){
                            this.$notify.success('新增二级分类成功')
                            this.$refs['ruleForm'].resetFields()
                            this.dialogFormVisible = false
                            this.load()
                        }else{
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
    margin:0 5px;
  }
  .changebtn {
    margin-left:5px;
  }
  
</style>
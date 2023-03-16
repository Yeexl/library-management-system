<template >
    <div class="mainBox">
        <!-- 搜索表单 -->
    <div class="search">
        <el-input style="width: 240px; margin-right: 5px;"  placeholder="请输入图书名称" v-model="params.name"></el-input>
        <el-input style="width: 240px;" placeholder="请输入图书标准码" v-model="params.bookNo"></el-input>
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
        <el-table-column prop="name" label="图书名称"></el-table-column>
        <el-table-column prop="description" label="描述" width="180"></el-table-column>
        <el-table-column prop="publishDate" label="出版日期"></el-table-column>
        <el-table-column prop="author" label="作者"></el-table-column>
        <el-table-column prop="publisher" label="出版社"></el-table-column>
        <el-table-column prop="category" label="分类"></el-table-column>
        <el-table-column prop="bookNo" label="标准码"></el-table-column>
        <el-table-column prop="score" label="借书积分"></el-table-column>
        <el-table-column prop="nums" label="数量"></el-table-column>
        <el-table-column prop="cover" label="封面">
          <template v-slot="scoped">
            <el-image :src="scoped.row.cover" :preview-src-list="[scoped.row.cover]"></el-image>
          </template>
        </el-table-column>
        <el-table-column prop="createtime" label="创建时间" width="90"></el-table-column>
        <el-table-column prop="updatetime" label="更新时间" width="90"></el-table-column>

        <el-table-column label="操作" width="150px">
            <template v-slot="scoped">
                <!-- scoped.row 就是当前行数据 -->
                <el-button type="primary" @click="$router.push('/editBook?id=' + scoped.row.id)">编辑</el-button>
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

    </div>
</template>
<script>
import request from '@/utils/request'
import Cookies from 'js-cookie'

export default {
  name: 'BookList',
  data() {
    return {
      admin:Cookies.get('admin') ? JSON.parse(Cookies.get('admin')) : {},
      tableData: [],
      total: 0,
      params: {
        pageNum:1,
        pageSize:10,
        name:'',
        bookNo:''
      },
    }
  },
  created() {
    this.load()
  },
  methods: {
    load() {
      request.get('/book/page',{
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
        bookNo:''
      },
      this.load()
    },
    handleCurrentChange(pageNum){
      // 点击分页按钮触发分页
      this.params.pageNum = pageNum
      this.load()
    },
    del(id){
        request.delete('/book/delete/' + id).then(res => {
            if(res.code === '200'){
                this.$notify.success('删除成功')
                this.load()
            }else {
                this.$notify.error(res.msg);
            }
        })
    },
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
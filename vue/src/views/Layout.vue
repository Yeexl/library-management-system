<template >
    <div id="app">
        <!-- 头部区域 -->
        <div class="headerTop">
          <div class="headerLeft">
            <img src="@/assets/logo.png" alt="" class="headerImg">
            <span class="text">图书管理系统</span>
          </div>
          <div class="headerRight">
            <el-dropdown size="medium" class="selecter">
              <span class="el-dropdown-link">
                {{admin.username}} <i class="el-icon-arrow-down el-icon--right"></i>
              </span>
              <el-dropdown-menu slot="dropdown" style="margin-top: -5px;">
                <el-dropdown-item>
                  <div class="logout" @click="logout">退出</div>
                </el-dropdown-item>
              </el-dropdown-menu>
            </el-dropdown>
          </div>
        </div>
    
        <!-- 侧边栏和主体 -->
        <div class="bigBox">
          <!-- 侧边栏导航 -->
          <div class="aside">
            <el-menu :default-active="$route.path"  router class="el-menu-demo" >
              <el-menu-item index="/">
                <i class="el-icon-s-home"></i>
                <span>首页</span>
              </el-menu-item>
              <el-submenu index="user">
                <template slot="title">
                  <i class="el-icon-info"></i>
                  <span>会员管理</span>
                </template>         
                <el-menu-item index="/addUser">会员添加</el-menu-item>                                                      
                <el-menu-item index="/userList">会员列表</el-menu-item>                                                      
              </el-submenu>
    
              <el-submenu index="admin">
                <template slot="title">
                  <i class="el-icon-user"></i>
                  <span>管理员管理</span>
                </template>         
                <el-menu-item index="/addAdmin">管理员添加</el-menu-item>                                                      
                <el-menu-item index="/adminList">管理员列表</el-menu-item>                                                      
              </el-submenu>

              <el-submenu index="category">
                <template slot="title">
                  <i class="el-icon-s-operation"></i>
                  <span>图书分类管理</span>
                </template>         
                <el-menu-item index="/addCategory">图书分类添加</el-menu-item>                                                      
                <el-menu-item index="/categoryList">图书分类列表</el-menu-item>                                                      
              </el-submenu>

              <el-submenu index="book">
                <template slot="title">
                  <i class="el-icon-notebook-1"></i>
                  <span>图书管理</span>
                </template>         
                <el-menu-item index="/addBook">图书添加</el-menu-item>                                                      
                <el-menu-item index="/bookList">图书列表</el-menu-item>                                                      
              </el-submenu>

              <el-submenu index="borrow">
                <template slot="title">
                  <i class="el-icon-document-copy"></i>
                  <span>借书管理</span>
                </template>         
                <el-menu-item index="/addBorrow">借书</el-menu-item>                                                      
                <el-menu-item index="/borrowList">借书列表</el-menu-item>                                                      
              </el-submenu>

              <el-submenu index="retur">
                <template slot="title">
                  <i class="el-icon-document"></i>
                  <span>还书管理</span>
                </template>                                                        
                <el-menu-item index="/returList">还书列表</el-menu-item>                                                      
              </el-submenu>
            </el-menu>
          </div>
          
          <!-- 主体数据 -->
          <div class="mainBox">
            <router-view/>
          </div>
        </div>
        
      </div>
</template>
<script>
  import Cookies from 'js-cookie'

export default {
    name:'Layout',
    data() {
      return {
        admin: Cookies.get('admin') ? JSON.parse(Cookies.get('admin')) : {}
      }
    },
    methods: {
      logout() {
        // 清除浏览器用户数据
        Cookies.remove('admin')
        this.$router.push('login')
      }
    },
}
</script>
<style >
    .headerTop{
      display: flex;
      height: 60px; 
      line-height: 60px; 
      background-color: white;
      margin-bottom: 2px;
  }
  .headerLeft {
    width: 300px;
  }
  .headerRight {
    flex: 1;
    width: 0;
    text-align: right;
    padding-right: 20px;
  }
  .selecter {
    cursor: pointer;
  }
  .logout {
    width: 50px;
    text-align: center;
  }
  .headerImg{
    width: 40px; 
    position: relative; 
    top: 10px; 
    left: 20px;
  }
  .headerTop .text {
    margin-left: 25px;
    font-size: 24px;
  }
  .bigBox {
    display: flex;
    background-color: rgb(242, 242, 242);
  }
  .aside {
    width: 200px;
    overflow: hidden;
    margin-right: 2px;
    margin-bottom: 10px;
    background-color: white;
    min-height: calc(100vh - 62px);
  }
  .mainBox {
    flex: 1;
    /* background-color: white; */
    padding: 5px;
  }
</style>
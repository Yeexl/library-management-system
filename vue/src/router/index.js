import Vue from 'vue'
import VueRouter from 'vue-router'
import Layout from '../views/Layout'
import User from '../views/user/User.vue'
import AddUser from '../views/user/AddUser'
import EditUser from '../views/user/EditUser'
import Cookies from 'js-cookie'

Vue.use(VueRouter)

const routes = [
  // 登录
  {
    path:'/login',
    name:'Login',
    component: () => import('@/views/login/Login')
  },
  
  // 主页
  {
    path: '/',
    name: 'Layout',
    component: Layout,
    redirect: '/home',
    children:[
      {
        path:'home',
        name:'Home',
        component: () => import('@/views/home/HomeView')
      },
      // User
      {
        path: 'userList',
        name: 'UserList',
        component: User,
      },
      {
        path: 'editUser',
        name: 'EditUser',
        component: EditUser,
      },
      {
        path: 'addUser',
        name: 'AddUser',
        component: AddUser,
      },

      // Admin
      {
        path: 'adminList',
        name: 'AdminList',
        component: () => import('@/views/admin/List.vue'),
      },
      {
        path: 'editAdmin',
        name: 'EditAdmin',
        component: () => import('@/views/admin/Edit.vue'),
      },
      {
        path: 'addAdmin',
        name: 'AddAdmin',
        component: () => import('@/views/admin/Add.vue'),
      },

      // Category
      {
        path: 'categoryList',
        name: 'CategoryList',
        component: () => import('@/views/category/List.vue'),
      },
      {
        path: 'editCategory',
        name: 'EditCategory',
        component: () => import('@/views/category/Edit.vue'),
      },
      {
        path: 'addCategory',
        name: 'AddCategory',
        component: () => import('@/views/category/Add.vue'),
      },

      // Book
      {
        path: 'bookList',
        name: 'BookList',
        component: () => import('@/views/book/List.vue'),
      },
      {
        path: 'editBook',
        name: 'EditBook',
        component: () => import('@/views/book/Edit.vue'),
      },
      {
        path: 'addBook',
        name: 'AddBook',
        component: () => import('@/views/book/Add.vue'),
      },
      // Borrow
      {
        path: 'borrowList',
        name: 'BorrowList',
        component: () => import('@/views/borrow/List.vue'),
      },
      {
        path: 'editBorrow',
        name: 'EditBorrow',
        component: () => import('@/views/borrow/Edit.vue'),
      },
      {
        path: 'addBorrow',
        name: 'AddBorrow',
        component: () => import('@/views/borrow/Add.vue'),
      },
      // Return
      {
        path: 'returList',
        name: 'ReturList',
        component: () => import('@/views/retur/List.vue'),
      },
    ]
  },
  {
    path: '*',
    component:() => import('@/views/404')
  }
  
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

router.beforeEach((to, from, next) => {
  if(to.path === 'login') next()
  const admin = Cookies.get('admin')
  if(!admin && to.path !== '/login') return next('/login') // 强制退回到登录页面
  next()
})

export default router

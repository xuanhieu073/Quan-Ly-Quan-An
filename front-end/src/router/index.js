import Vue from 'vue'
import VueRouter from 'vue-router'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'Home',
    component: () => import('../views/Login.vue')
  },
  {
    path: '/login',
    name: 'Login',
    component: () => import('../views/Login.vue')
  },
  {
    path: '/signup',
    name: 'SignUp',
    component: () => import('../views/SignUp.vue')
  },
  {
    path: '/about',
    name: 'About',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/About.vue')
  },
  {
    path: '/categories',
    name: 'Categories',
    component: () => import('../views/Categories.vue')
  },
  {
    path: '/bill',
    name: 'Bill',
    component: () => import('../views/Bill.vue')
  },
  {
    path: '/bill/:banid',
    name: 'BillCN',
    component: () => import('../views/BillCN.vue')
  },
  {
    path: '/history',
    name: 'History',
    component: () => import('../views/History.vue')
  },
  {
    path: '/history/:donhangid',
    name: 'History',
    component: () => import('../views/History.vue')
  },
  {
    path: '/historycn/:banid',
    name: 'HistoryCN',
    component: () => import('../views/HistoryCN.vue')
  },
  {
    path: '/historycn/:banid/:donhangid',
    name: 'HistoryCN',
    component: () => import('../views/HistoryCN.vue')
  },
  {
    path: '/categories/:catId/chinhanh/:chinhanhId/food',
    name: 'CategoriesFood',
    component: () => import('../views/Categories.vue')
  },
  {
    path: '/categoriescn',
    name: 'CategoriesCN',
    component: () => import('../views/CategoriesCN.vue')
  },
  {
    path: '/categoriescn/:catId/chinhanh/:chinhanhId/food',
    name: 'CategoriesFood',
    component: () => import('../views/CategoriesCN.vue')
  },
  {
    path: '/categories-list',
    name: 'CatProductEdit',
    component: () => import('../views/CatProductEdit.vue')
  },
  {
    path: '/cat-product-edit/:catId/food',
    name: 'CatProductEditProduct',
    component: () => import('../views/CatProductEdit.vue')
  },
  {
    path: '/branch',
    name: 'branch',
    component: () => import('../views/Branch.vue')
  },
]

const router = new VueRouter({
  routes
})

export default router

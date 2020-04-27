import Vue from 'vue'
import VueRouter from 'vue-router'

Vue.use(VueRouter)

const routes = [
  {
    path: '/login',
    name: 'Login',
    component: () => import('../views/Login.vue')
  },
  {
    path: '/',
    name: 'Home',
    component: () => import('../views/Login.vue')
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
    path: '/categories/:catId/food',
    name: 'CategoriesFood',
    component: () => import('../views/Categories.vue')
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

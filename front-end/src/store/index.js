import axios from 'axios'
import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    user: {
      token: localStorage.getItem('token'),
      payload: (localStorage.getItem('payload')) ?  JSON.parse(localStorage.getItem('payload')) : {}
    },
    tinhthanhlist: undefined,
    count: 0,
    chinhanh:{
      list: [],
      vsbdetail: false,
      chinhanhslc: {}
    },
    category:{
      list:[]
    },
    cart: (localStorage.getItem('cart')) ?  JSON.parse(localStorage.getItem('cart')) : []
  },
  mutations: {
    //test
    increment (state) {
        state.count++
    },
    //untils
    fetchTinhThanh(state){
      if(!state.tinhthanhlist)
      axios.get(`http://localhost:3000/tinhthanh`,{headers : {'x-access-token': state.user.token}})
      .then(res => {
        state.tinhthanhlist = res.data
      })
      .catch(err => {
        console.error(err); 
      })
    },
    //user
    setuser(state,user){
      state.user = user;
    },
    //chinhanh
    fetchChiNhanh(state){
      axios.get(`http://localhost:3000/chinhanh`,{headers : {'x-access-token':state.user.token}})
      .then(res => {
        state.chinhanh.list = res.data;
      })
      .catch(err => {
        console.error(err); 
      })
    },
    //cat
    fetchCategory(state){
      axios.get(`http://localhost:3000/categories`,{headers : {'x-access-token':state.user.token}})
      .then(res => {
        state.category.list = res.data
      })
    },
    comitchinhanhchange(state, list){
      state.chinhanh.list = list;
    },
    showChiNhanhDetail(state, chinhanh = {}){
      state.chinhanh.chinhanhslc = chinhanh;
      state.chinhanh.vsbdetail = true;
    },
    hideChiNhanhDetail(state){
      state.chinhanh.vsbdetail = false
    },
    //cart
    setcart(state,cart){
      state.cart = [...cart]
      localStorage.setItem('cart', JSON.stringify(cart));
    },
  },
  actions: {
    afetchchinhanh({commit, state}, filter = {}) {
      return new Promise((resolve,reject) => {
        axios.get(`http://localhost:3000/chinhanh?idtt=${filter.idtt}&tenchinhanh=${filter.tenchinhanh}&sdt=${filter.sdt}`,{headers : {'x-access-token': state.user.token}},)
        .then(res => {
          commit('comitchinhanhchange',res.data);
          resolve(200)
        })
        .catch((err) => {
          reject({status: 500,err})
        })
      })
    }
  },
  modules: {
  }
})

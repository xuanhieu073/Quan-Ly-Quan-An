import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    tinhthanhlist: undefined,
    count: 0,
    chinhanh:{
      list: [],
      vsbdetail: false,
    },
  },
  mutations: {
    //test
    increment (state) {
        state.count++
    },
    //untils
    fetchTinhThanh(state){
      if(!state.tinhthanhlist)
      axios.get(`http://localhost:3000/tinhthanh`)
      .then(res => {
        state.tinhthanhlist = res.data
      })
      .catch(err => {
        console.error(err); 
      })
    },
    //chinhanh
    fetchChiNhanh(state){
      axios.get(`http://localhost:3000/chinhanh`)
      .then(res => {
        state.chinhanh.list = res.data;
      })
      .catch(err => {
        console.error(err); 
      })
    },
    comitchinhanhchange(state, list){
      state.chinhanh.list = list;
    },
    showChiNhanhDetail (state){
      state.chinhanh.vsbdetail = true
    },
    hideChiNhanhDetail (state){
      state.chinhanh.vsbdetail = false
    }
  },
  actions: {
    afetchchinhanh ({commit}) {
      return new Promise((resolve,reject) => {
        axios.get(`http://localhost:3000/chinhanh`)
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

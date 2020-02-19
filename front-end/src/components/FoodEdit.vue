<template>
  <div class="card shadow mb-4">
    <h4 class="card-header">Danh sách món ăn</h4>

    <div v-if="empty" class="card-body">
      <p class="card-text">Không có dữ liệu.</p>
    </div>

    <div v-else class="card-body">
      <b-row>
        <b-col cols="8"></b-col>
        <b-col cols="4"> <b-button variant="primary float-right" v-b-modal.modal-1>Tạo mới</b-button> </b-col>
      </b-row>
      <div class="row">
        <table class="table">
          <thead class="thead-dark">
            <tr>
              <th>ProName</th>
              <th>Price</th>
              <th>TinyDes</th>
              <th style="width:80px">tools</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="item in list" :key="item.ProID">
              <td>{{item.ProName}}</td>
              <td>{{item.Price}}</td>
              <td>{{item.TinyDes}}</td>
              <td> 
                <b-row>
                  <b-col class="px-0"><b-button variant="success" size="sm"><BIconPencil/></b-button></b-col>
                  <b-col class="px-0"><b-button variant="danger" size="sm"><BIconXCircle/></b-button></b-col>
                </b-row>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
      <b-button v-if="hasMore" block variant="primary" @click="fetchProducts($route.params.catId,2)">Load more...</b-button>
    </div>
    
    <b-modal id="modal-1" :title="this.isEdit ? 'tạo mới' : '' " >
      <p class="my-4"></p>
    </b-modal>
  </div>
</template>

<script>
import axios from "axios";
import {  BIconPencil, BIconXCircle } from 'bootstrap-vue'

export default {
  components: {
    BIconPencil,BIconXCircle
  },
  data() {
    return {
      list: [],
      empty: true,
      hasMore: false,
      isEdit: false
    };
  },

  mounted() {
    this.fetchProducts(this.$route.params.catId);
  },

  watch: {
    $route(to) {
      this.fetchProducts(to.params.catId);
    }
  },

  methods: {
    format(val) {
      return `${val} đ`;
    },

    fetchProducts(catId) {
      axios
        .get(`http://localhost:3000/categories/${catId}/products`)
        .then(res => {
          console.log(res)
          this.list = res.data;
          this.empty = this.list.length === 0;
        })
        .catch(err => {
          console.log(err);
        });
    }
  }
};
</script>

<style lang="scss" scoped>
</style>
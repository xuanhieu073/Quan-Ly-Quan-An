<template>
  <div class="mx-5 my-3">
    <!-- <b-container class="bv-example-row mt-3"> -->
      <b-row class="mb-3">
        <b-col cols="12">
          <b-card no-body header-tag="header" footer-tag="footer" class="shadow">
            <template v-slot:header>
              <h4 class="mb-0">Categories</h4>
            </template>
            <b-list-group>
              <b-list-group-item>
                <b-row>
                  <b-col cols="4">
                    <tinhthanhddl v-model="tinhthanhId" />
                  </b-col>
                  <b-col cols="4">
                    <chinhanhddl :TinhThanhId="tinhthanhId" v-model="chinhanhId"/>
                  </b-col>
                </b-row>
              </b-list-group-item>
            </b-list-group>
          </b-card>
        </b-col>
      </b-row>
      <b-row>
        <b-col cols="3">
          <b-card no-body header-tag="header" footer-tag="footer" class="shadow">
            <template v-slot:header>
              <h4 class="mb-0">Danh mục</h4>
            </template>
            <b-list-group>
              <b-list-group-item v-for="item in list" :key="item.CatID" :to="`/categories/${item.CatID}/chinhanh/${chinhanhId}/food`">
                {{ item.CatName }}
                <span v-show="item.num_of_products" class="badge badge-danger float-right">{{item.num_of_products}}</span>
              </b-list-group-item>
            </b-list-group>
          </b-card>
        </b-col>
        <b-col >
            <FoodList/>
        </b-col>
        <b-col cols="3">
          <b-card no-body header-tag="header" footer-tag="footer" class="shadow">
            <template v-slot:header>
              <h4 class="mb-0">Đơn hàng</h4>
            </template>
            <b-list-group>
              <b-list-group-item v-for="item in cart" :key="item.ProID">
                {{ item.ProName }} -
                {{ item.Price*item.num_of_products | capitalize}}
                <span v-show="item.num_of_products" class="badge badge-danger float-right">{{item.num_of_products}}</span>
              </b-list-group-item>
              <b-list-group-item >
                tổng: {{total | capitalize}}
              </b-list-group-item>
              <b-list-group-item >
                <b-button variant="primary" :to="`/bill`">Thanh toán</b-button>
              </b-list-group-item>
            </b-list-group>
          </b-card>
        </b-col>
      </b-row>
    <!-- </b-container> -->
  </div>
</template>

<script>
import axios from 'axios'
import FoodList from '@/components/FoodList.vue';
import { mapState } from 'vuex';
import tinhthanhddl from "@/components/utils/tinhthanhddl.vue";
import chinhanhddl from '@/components/utils/chinhanhddl.vue';

export default {
    components: {
      FoodList,
      tinhthanhddl,
      chinhanhddl,
    },
    data() {
        return {
            list: [],
            tinhthanhId: 0,
            chinhanhId: 1,
        }
    },
    watch: {
    },
    computed: {
      ...mapState(['user','cart']),
      total(){
        let t = 0;
        this.cart.forEach(element => {
          t+=element.Price*element.num_of_products
        });
        return t;
      }
    },
    mounted () {
        this.fetch();
        console.log(this.cart)
    },
    methods: {
        fetch() {
            axios.get(`http://localhost:3000/categories`,{headers : {'x-access-token':this.user.token}})
            .then(rs => {
                this.list = rs.data
            })
            .catch(err =>{
                console.log(err);
            })
        }
    },
};
</script>

<style lang="scss" scoped>
</style>
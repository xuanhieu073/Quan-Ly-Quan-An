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
                    <b-input-group size="sm" prepend="Bàn">
                      <b-form-select v-model="banid" :options="listBan" value-field="Id" text-field="Ban" size="sm" @change="nulllist">
                          <!-- <template v-slot:first>
                              <b-form-select-option :value="null">--none--</b-form-select-option>
                          </template> -->
                      </b-form-select>
                    </b-input-group>
                  </b-col>
                  <!-- <b-col cols="4">
                    <chinhanhddl :TinhThanhId="tinhthanhId" v-model="chinhanhId"/>
                  </b-col> -->
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
              <b-list-group-item v-for="item in list" :key="item.CatID" :to="`/categoriescn/${item.CatID}/chinhanh/${banid}/food`">
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
              <b-list-group-item v-for="item in cart" :key="item.ProID*10+item.banid" v-show="item.banid == banid">
                {{ item.ProName }} -
                {{ item.Price*item.num_of_products | capitalize}}
                <span v-show="item.num_of_products" class="badge badge-danger float-right">{{item.num_of_products}}</span>
              </b-list-group-item>
              <b-list-group-item >
                tổng: {{total | capitalize}}
              </b-list-group-item>
              <b-list-group-item >
                <b-button variant="primary" :to="`/bill/${this.banid}`">Thanh toán</b-button>
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
import FoodList from '@/components/FoodListCN.vue';
import { mapState } from 'vuex';

export default {
    components: {
      FoodList,
    },
    data() {
        return {
            list: [],
            listBan: [1,2,3,4,5,6,7,8,9,10],
            banid : 1,
        }
    },
    watch: {
    },
    computed: {
      ...mapState(['user','cart']),
      total(){
        let t = 0;
        this.cart.forEach(element => {
          if(this.banid == element.banid)
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
        },
        nulllist(){
          window.location.href = 'http://localhost:8000/#/categoriescn/-1/chinhanh/2/food'
        }
    },
};
</script>

<style lang="scss" scoped>
</style>
<template>
  <div class="mx-5 my-3">
    <b-container class="bv-example-row mt-3">
      <b-row >
        <b-col cols="4">
          <b-card no-body header-tag="header" footer-tag="footer" class="shadow">
            <template v-slot:header>
              <h4 class="mb-0">Đơn hàng</h4>
            </template>
            <b-list-group>
              <b-list-group-item v-for="item in list" :key="item.ProID"  :to="`/history/${item.Id}`">
                <b-row>
                  <b-col>Đơn hàng: {{ item.Id }}</b-col>
                  <b-col cols="12" md="auto"> {{item.createdate | date}}</b-col>
                </b-row>
              </b-list-group-item>
            </b-list-group>
          </b-card>
        </b-col>
        <b-col cols="8">
          <b-card no-body header-tag="header" footer-tag="footer" class="shadow">
            <template v-slot:header>
              <h4 class="mb-0">Chi tiết Đơn hàng</h4>
            </template>
            <b-list-group>
              <b-list-group-item v-for="item in chitiets" :key="item.ProID">
                <b-row>
                  <b-col>{{ item.ProName }}</b-col>
                  <b-col cols="12" md="auto"> {{ item.Price*item.soluong | capitalize}}</b-col>
                  <b-col col lg="2"> {{item.soluong}}</b-col>
                </b-row>
              </b-list-group-item>
              <b-list-group-item >
                tổng: {{total | capitalize}}
              </b-list-group-item>
            </b-list-group>
          </b-card>
        </b-col>
      </b-row>
    </b-container>
  </div>
</template>

<script>
import axios from 'axios'
import { mapState } from 'vuex';

export default {
    components: {
    },
    data() {
        return {
            list: [],
            chitiets: [],
            alert: 0,
        }
    },
    watch: {
      $route(to) {
        this.fetctChitiet(to.params.donhangid)
      }
    },
    computed: {
      ...mapState(['user','cart']),
      total(){
        let t = 0;
        this.chitiets.forEach(element => {
          t+=element.Price*element.soluong
        });
        return t;
      }
    },
    mounted () {
      this.donhang()
    },
    methods: {
        change(item) {
          if(item.num_of_products<0)
            item.num_of_products = 0;
        },
        async checkout(){
          if(this.cart.length == 0){
            alert('chưa có món ăn');
            return
          }
          const userId = this.user.payload.userId
          const donhang = {
            userid: userId
          }
          const res = await axios.post(`http://localhost:3000/donhang`,donhang,{headers : {'x-access-token':this.user.token}})
            debugger
            console.log(res)
            let chitietdonhang = []
            for(let i=0;i<this.cart.length;i++){
              const item = {
                foodid : this.cart[i].ProID,
                chinhanhid : this.cart[i].chinhanhId,
                soluong : parseInt(this.cart[i].num_of_products),
              }
              chitietdonhang.push(item)
            }
            const s = this.alerts();
            const resc = await axios.post(`http://localhost:3000/donhang/${res.data.Id}`,chitietdonhang,{headers : {'x-access-token':this.user.token}})
            console.log(resc)
            s();
        },
        alerts(){
           this.$swal({
            icon: 'success',
            title: 'đơn hàng đang được tiếp nhận',
            showConfirmButton: false,
            timer: 1500,
            onClose: () => {
              this.$router.push('history')
            }
          })
        },
        async donhang(){
          const userId = this.user.payload.userId
          const res = await axios.get(`http://localhost:3000/donhang/user/${userId}`,{headers : {'x-access-token':this.user.token}})
          console.log(res)
          this.list = res.data
        },
        async fetctChitiet(donhangid){
          const res = await axios.get(`http://localhost:3000/donhang/${donhangid}/chitiet`,{headers : {'x-access-token':this.user.token}})
          this.chitiets = res.data
          console.log(this.chitiets)
        }
    },
};
</script>

<style lang="scss" scoped>
</style>
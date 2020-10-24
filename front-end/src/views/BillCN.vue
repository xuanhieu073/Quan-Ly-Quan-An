<template>
  <div class="mx-5 my-3">
    <b-container class="bv-example-row mt-3">
      <b-row >
        <b-col cols="12">
          <b-card no-body header-tag="header" footer-tag="footer" class="shadow">
            <template v-slot:header>
              <h4 class="mb-0">Đơn hàng</h4>
            </template>
            <b-list-group>
              <b-list-group-item v-for="item in cart" :key="item.ProID*10+item.banid" v-show="item.banid == banid">
                <b-row>
                  <b-col>{{ item.ProName }}</b-col>
                  <b-col cols="12" md="auto"> {{ item.Price*item.num_of_products | capitalize}}</b-col>
                  <b-col col lg="2"> <b-form-input type="number" v-model="item.num_of_products" @change="change(item)"></b-form-input></b-col>
                </b-row>
              </b-list-group-item>
              <b-list-group-item >
                tổng: {{total | capitalize}}
              </b-list-group-item>
              <b-list-group-item >
                <b-button variant="primary" @click="checkout">Thanh toán</b-button>
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
import { mapState, mapMutations } from 'vuex';

export default {
    components: {
    },
    data() {
        return {
            list: [],
            alert: 0,
            banid: -1,
        }
    },
    watch: {
      alert:function (newValue, oldValue) {
        console.log(newValue)
        if(newValue >= oldValue){
          console.log('alert')
          this.$swal({
            icon: 'success',
            title: 'đơn hàng đang được tiếp nhận',
            showConfirmButton: false,
            timer: 1500
          })
        }
      }
    },
    computed: {
      ...mapState(['user','cart']),
      total(){
        let t = 0;
        this.cart.forEach(element => {
          if(element.banid == this.banid)
            t+=element.Price*element.num_of_products
        });
        return t;
      }
    },
    mounted () {
      this.banid = this.$route.params.banid
    },
    methods: {
        ...mapMutations(['setcart']),
        change(item) {
          if(item.num_of_products<0)
            item.num_of_products = 0;
        },
        async checkout(){
          if(this.cart.length == 0){
            alert('chưa có món ăn');
            return
          }
          const donhang = {
            bananid: this.banid,
            chinhanhid: this.user.payload.f_ChiNhanhId,
          }
          const res = await axios.post(`http://localhost:3000/donhang`,donhang,{headers : {'x-access-token':this.user.token}})
            console.log(res)
            let chitietdonhang = []
            for(let i=0;i<this.cart.length;i++){
              if(this.cart[i].banid == this.banid){
                const item = {
                  donhangid : res.data.CatID,
                  foodid : this.cart[i].ProID,
                  chinhanhid : this.cart[i].chinhanhId,
                  soluong : parseInt(this.cart[i].num_of_products),
                  Price: parseInt(this.cart[i].Price),
                  ProName: this.cart[i].ProName,
                }
                chitietdonhang.push(item)
              }
            }
            const s = this.alerts();
            const resc = await axios.post(`http://localhost:3000/donhang/${res.data.CatID}`,chitietdonhang,{headers : {'x-access-token':this.user.token}})
            console.log(resc)
            s();
        },
        alerts(){
          let tempcart = this.cart;
           this.$swal({
            icon: 'success',
            title: 'đơn hàng đang được tiếp nhận',
            showConfirmButton: false,
            timer: 1500,
            onClose: () => {
              debugger
              for(let i=0;i<tempcart.length;i++){
                if(tempcart[i].banid == this.banid){
                  tempcart.splice(i, 1)
                  i--
                }
              }
              this.setcart(tempcart);
              window.location.href = `http://localhost:8000/#/historycn/${this.banid}`
            }
          })
        }
    },
};
</script>

<style lang="scss" scoped>
</style>
<template>
    <div class="card shadow mb-4">
    <h4 class="card-header">Danh sách món ăn</h4>

    <div v-if="empty" class="card-body">
      <p class="card-text">Không có dữ liệu.</p>
    </div>

    <div v-else class="card-body">
      <div class="row">
        <div class="col-sm-4 mb-3" v-for="item in list" :key="item.ProID" v-show="item.check == 1">
          <div class="card h-100">
            <img :src="`http://localhost:3000/imgs/sp/${item.ProID}/main_thumbs.jpg`" :alt="item.ProName" :title="item.ProName" class="card-img-top" />
            <div class="card-body">
              <h6 class="card-title">{{item.ProName}}</h6>
              <h5 class="card-title text-danger">{{ item.Price  | capitalize}}</h5>
              <p class="card-text">{{item.TinyDes}}</p>
            </div>
            <div class="card-footer text-center">
              <!-- <b-link class="btn btn-sm btn-outline-primary mr-2" :to="`/products/${item.ProID}`" event="">
                Details
              </b-link> -->
              <b-link  class="btn btn-sm btn-outline-success" @click="addcart(item)">
                Add to cart
              </b-link>
            </div>
          </div>
        </div>
      </div>
      <b-button v-if="hasMore" block variant="primary">
        Load more...
      </b-button>
    </div>

    <div class="card-footer text-muted">Footer</div>
  </div>
</template>

<script>
import axios from 'axios';
import { mapState, mapMutations, mapActions } from 'vuex';

export default {
  name: 'ProductsByCat',
  data() {
    return {
      list: [],
      empty: true,
      hasMore: false,
      tempcart: [],
    };
  },
  computed: {
    ...mapState(['user','cart'])
  },
  mounted() {
    // this.fetchProducts(this.$route.params.catId);
    const check = localStorage.getItem("cart")
    this.tempcart = check ? JSON.parse(localStorage.getItem('cart')) : []
  },

  watch: {
    $route(to) {
        this.fetchProducts(to.params.catId,to.params.chinhanhId);
    }
  },

  methods: {
    ...mapMutations(['setcart']),
    ...mapActions(['']),
    fetchProducts(catId, chinhanhId) {
      axios
        .get(`http://localhost:3000/categories/${catId}/chinhanh/${chinhanhId}/products`,{headers : {'x-access-token':this.user.token}})
        .then(res => {
          this.list = res.data;
          // this.hasMore = res.data.hasMore;
          this.empty = this.list.length === 0;
        })
        .catch(err => {
          console.log(err);
        });
    },
    addcart(food){
      const found = this.tempcart.find(e => e.ProID == food.ProID)
      if(found){
        found.num_of_products ++;
        this.setcart(this.tempcart);
      }
      else{
        food.num_of_products = 1;
        food.chinhanhId = this.$route.params.chinhanhId;
        this.tempcart.push(food)
        this.setcart(this.tempcart);
      }
    }
  }
}
</script>

<style lang="scss" scoped>

</style>
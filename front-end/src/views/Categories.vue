<template>
  <div>
    <b-container class="bv-example-row">
      <b-row>
        <b-col cols="4">
          <b-card no-body header-tag="header" footer-tag="footer" class="shadow">
      <template v-slot:header>
        <h4 class="mb-0">Categories</h4>
      </template>
      <b-list-group>
        <b-list-group-item v-for="item in list" :key="item.CatID" :to="`/categories/${item.CatID}/food`">
          {{ item.CatName }}
          <span v-show="item.num_of_products" class="badge badge-danger float-right">{{item.num_of_products}}</span>
        </b-list-group-item>
      </b-list-group>
    </b-card>
        </b-col>
        <b-col cols="8">
            <FoodList/>
        </b-col>
      </b-row>
    </b-container>
  </div>
</template>

<script>
import axios from 'axios'
import FoodList from '@/components/FoodList.vue';
import { mapState } from 'vuex';

export default {
    components: {
        FoodList,
    },
    data() {
        return {
            list: []
        }
    },
    computed: {
      ...mapState(['user'])
    },
    mounted () {
        this.fetch();
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
<template>
    <div class="mt-4">
    <b-container class="bv-example-row mb-4">
      <b-row>
        <b-col cols="4">
          <b-card no-body header-tag="header" footer-tag="footer" class="shadow">
      <template v-slot:header>
        <h4 class="mb-0">Danh mục món ăn</h4>
      </template>
      <b-list-group>
        <b-list-group-item v-for="item in list" :key="item.CatID" :to="`/cat-product-edit/${item.CatID}/food`">
          <span v-if="!item.isEdit" class="badge badge-primary float-left" @click="item.isEdit = true"><BIconPencil/></span>
          <span v-if="item.isEdit" class="badge badge-danger float-left " @click="item.isEdit = false"><BIconXCircle/></span>
          <label v-if="!item.isEdit">{{ item.CatName }}</label>
          <input v-if="item.isEdit" v-model="item.CatName" type="text" />
          <span v-if="item.isEdit" class="badge badge-success float-right " @click="editCat(item)"><BIconCheck/></span>
          <span v-if="!item.isEdit" class="badge badge-danger float-right" @click="deleteCat(item)"><BIconXSquareFill/></span>
          <!-- <span v-if="!item.isEdit" v-show="item.num_of_products" class="badge badge-danger float-right">{{item.num_of_products}}</span> -->
        </b-list-group-item>
        <b-list-group-item href="#" v-if="!isCreCat">
          <b-button variant="primary" @click="isCreCat = true">Thêm</b-button>
        </b-list-group-item>
        <b-list-group-item href="#" v-if="isCreCat">
          <b-input-group class="mt-3">
            <b-form-input v-model="newCatName"></b-form-input>
            <b-input-group-append>
              <b-button variant="outline-success" @click="addCategory(newCatName)">lưu</b-button>
              <b-button variant="info" @click="isCreCat = false">huỷ</b-button>
            </b-input-group-append>
          </b-input-group>
        </b-list-group-item>
      </b-list-group>
    </b-card>
        </b-col>
        <b-col cols="8">
          <FoodEdit/>
        </b-col>
      </b-row>
    </b-container>
    </div>
</template>

<script>
import axios from 'axios'
import FoodEdit from '@/components/FoodEdit.vue';
import {  BIconPencil,BIconXCircle,BIconCheck,BIconXSquareFill } from 'bootstrap-vue'
import { mapState } from 'vuex';

export default {
    components: {
      FoodEdit,
      BIconPencil,
      BIconXCircle,
      BIconCheck,
      BIconXSquareFill,
    },
    data() {
        return {
            list: [],
            isCreCat: false,
            isEditCat: false,
            newCatName: "",
            
        }
    },
    computed: {
      ...mapState(['user'])
    },
    mounted () {
      console.log(this.user)
        this.fetch();
    },
    methods: {
        fetch() {
            axios.get(`http://localhost:3000/categories/all`,{headers : {'x-access-token':this.user.token}})
            .then(rs => {
                rs.data.forEach(function (element) {
                  element.isEdit = false;
                });
                this.list = rs.data
            })
            .catch(err =>{
                console.log(err);
            })
        },
        addCategory(CatName){
          const category = {
            CatName,
          };
          axios.post(`http://localhost:3000/categories`,category,{headers : {'x-access-token':this.user.token}})
          .then(res => {
            this.list.push(res.data);
            this.isCreCat = false;
          })
          .catch(err => {
            console.error(err); 
          })
        },
        editCat(item){
          const category={
            CatID: item.CatID,
            CatName: item.CatName,
          };
          axios.patch(`http://localhost:3000/categories/${item.CatID}`,category,{headers : {'x-access-token':this.user.token}})
          .then(res => {
            console.log(res);
            item.isEdit = false;
          })
          .catch(err => {
            console.error(err); 
          })
        },
        async deleteCat(item){
          const res = await axios.delete(`http://localhost:3000/categories/${item.CatID}`,{headers : {'x-access-token':this.user.token}})
          console.log(res)
          window.location.href = `http://localhost:8000/#/cat-product-edit/8/food`
        }
      }
    }
</script>

<style lang="scss" scoped>

</style>
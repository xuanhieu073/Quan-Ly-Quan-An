<template>
  <div class="card shadow mb-4">
    <h4 class="card-header">Danh sách món ăn</h4>

    <div v-if="empty" class="card-body">
      <p class="card-text">Không có dữ liệu.</p>
    </div>

    <div v-else class="card-body">
      <b-row>
        <b-col cols="8"></b-col>
        <b-col cols="4">
          <b-button variant="primary float-right" @click="OnCreate()">Tạo mới</b-button>
        </b-col>
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
                  <b-col class="px-0">
                    <b-button variant="success" size="sm" @click="OnEdit(item)">
                      <BIconPencil />
                    </b-button>
                  </b-col>
                  <b-col class="px-0">
                    <b-button variant="danger" size="sm" @click="OnDelete(item)">
                      <BIconXCircle />
                    </b-button>
                  </b-col>
                </b-row>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>

    <b-modal size="lg" id="modal-action" ref="modal-action" v-model="visible" :title="this.isEdit ? 'tạo mới' : '' ">
      <b-row>
        <b-col cols="4" class="mt-2">
          <label for="ProName">ProName</label>
          <b-input-group size="sm" prepend="ProName">
            <b-form-input v-model="prosec.ProName" ></b-form-input>
          </b-input-group>
        </b-col>
        <b-col cols="4" class="mt-2">
          <label for="TinyDes">TinyDes</label>
          <b-input-group size="sm" prepend="TinyDes">
            <b-form-input v-model="prosec.TinyDes"></b-form-input>
          </b-input-group>
        </b-col>
        <!-- <b-col cols="4" class="mt-2">
          <label for="FullDes">FullDes</label>
          <b-input-group size="sm" prepend="FullDes">
            <b-form-input v-model="prosec.FullDes"></b-form-input>
          </b-input-group>
        </b-col> -->
        <b-col cols="4" class="mt-2">
          <label for="Price">Price</label>
          <b-input-group size="sm" prepend="Price">
            <b-form-input v-model="prosec.Price"></b-form-input>
          </b-input-group>
        </b-col>
        <!-- <b-col cols="4" class="mt-2">
          <label for="Category">Category</label>
            <b-input-group>
              <template>
                <b-form-select v-model="prosec.CatID" :options="catlist" size="sm"></b-form-select>
              </template>
            </b-input-group>
        </b-col> -->
        <b-col cols="4" class="mt-2">
          <label>Quantity</label>
          <b-input-group size="sm" prepend="Quantity" >
            <b-form-input v-model="prosec.Quantity"></b-form-input>
          </b-input-group>
        </b-col>
        <b-col></b-col>
      </b-row>

      <template v-slot:modal-footer>
        <div class="w-100">
          <b-button variant="secondary" size="sm" class="float-right" @click="visible=false" >Close</b-button>
          <b-button variant="primary" size="sm" class="float-right mr-3" @click="EditSubmit()" >save</b-button>
        </div>
      </template>
    </b-modal>
  </div>
</template>

<script>
import axios from "axios";
import { BIconPencil, BIconXCircle } from "bootstrap-vue";

export default {
  components: {
    BIconPencil,
    BIconXCircle
  },
  data() {
    return {
      list: [],
      empty: true,
      visible: false,
      isEdit: false,
      prosec: {},
      catlist: [],
    };
  },

  mounted() {
    this.fetchProducts(this.$route.params.catId);
    this.DDLCat();
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
    DDLCat(){
      this.fetchCat().then((res)=>{
        const catdata = res.data;
        for(let i = 0; i< catdata.length ; i++){
          this.catlist.push({value: catdata[i].CatID, text: catdata[i].CatName})
        }
        console.log(this.catlist)
      });
    },
    fetchCat(){
      return axios.get(`http://localhost:3000/categories`);
    },
    fetchProduct(ProID){
      axios.get(`http://localhost:3000/products/${ProID}`)
      .then(res => {
        console.log(res)
      })
      .catch(err => {
        console.error(err); 
      })
    },
    fetchProducts(catId) {
      axios
        .get(`http://localhost:3000/categories/${catId}/products`)
        .then(res => {
          console.log(res);
          this.list = res.data;
          this.empty = this.list.length === 0;
        })
        .catch(err => {
          console.log(err);
        });
    },
    OnEdit(product) {
      console.log(product)
      this.visible = true;
      this.isEdit = true;
      this.prosec = product;
    },
    OnCreate(){
      this.visible = true;
      this.isEdit = false;
      this.prosec = {CatID: this.$route.params.catId};
    },
    EditSubmit(){
      if(this.isEdit)
      {
        axios.patch(`http://localhost:3000/products/${this.prosec.ProID}`,this.prosec)
        .then(res => {
          console.log(res)
          this.$swal({
            icon: 'success',
            title: 'This product has been saved',
            showConfirmButton: false,
            timer: 1500
          })
        })
        .catch(err => {
          console.error(err); 
        })
      }
      else
      {
        axios.post(`http://localhost:3000/products`,this.prosec)
        .then(res => {
          console.log(res);
          this.list.push(res.data)
          this.$swal({
            icon: 'success',
            title: `${res.data.ProName} has been saved`,
            showConfirmButton: false,
            timer: 1500
          })
        })
        .catch(err => {
          console.error(err); 
        })
      }
    },
    OnDelete(product){
      console.log(product)
      this.$swal({
        title: 'Are you sure?',
        text: "You won't be able to revert this!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Yes, delete it!'
      })
      .then((res)=>{
        if (res.value) {
          axios.delete(`http://localhost:3000/products/${product.ProID}`)
          .then(() => {
            for(let i =0;i<this.list.length;i++){
              if(this.list[i].ProID == product.ProID){
                this.list.splice(i, 1); 
              }
            }
            this.$swal(
              'Deleted!',
              `${product.ProName} has been deleted.`,
              'success')
          })
          .catch(err => {
            console.error(err); 
          })
        }
      })
    }
  }
};
</script>

<style lang="scss" scoped>
</style>
<template>
  <b-container class="mt-3">
    <b-card no-body>
      <b-tabs card>
        <b-tab title="Danh sách chi nhánh" active>
          <b-list-group>
            <b-list-group-item>
              <b-row>
                <b-col>
                    <tinhthanhddl v-model="filter.idtt"/>
                </b-col>
                <b-col>
                  <b-input-group size="sm" prepend="tên chi nhánh">
                    <b-form-input v-model="filter.tenchinhanh"></b-form-input>
                  </b-input-group>
                </b-col>
                <b-col>
                  <b-input-group size="sm" prepend="điện thoại">
                    <b-form-input v-model="filter.sdt"></b-form-input>
                  </b-input-group>
                </b-col>
              </b-row>
              <b-row>
                <b-col>
                  <b-button variant="primary" class="mt-2 float-left" size="sm" @click="onsearch()">tìm kiếm</b-button>
                  <b-button variant="primary" class="mt-2 float-right" size="sm" @click="showcreate()">tạo chi nhánh</b-button>
                </b-col>
              </b-row>
            </b-list-group-item>
            <b-list-group-item>
              <table class="table table-sm">
                <thead class="thead-light" size="sm">
                  <tr>
                    <th scope="col">#</th>
                    <th scope="col">Tên chi nhánh</th>
                    <th scope="col">Địa chỉ</th>
                    <th scope="col">Số điện thoại</th>
                    <th style="width:100px">công cụ</th>
                  </tr>
                </thead>
                <tbody>
                  <tr v-for="(item, index) in chinhanh.list" :key="item.Id">
                    <th scope="row">{{index+1}}</th>
                    <td>{{item.TenChiNhanh}}</td>
                    <td>{{item.DiaChi}}</td>
                    <td>{{item.SDT}}</td> 
                    <td>
                      <b-row>
                        <b-col class="px-0">
                          <b-button variant="success" size="sm" @click="ShowEdit(item)">
                            <BIconPencil />
                          </b-button>
                        </b-col>
                        <b-col>
                          <b-button variant="danger" size="sm" @click="ondelete(item)">
                            <BIconXCircle />
                          </b-button>
                        </b-col>
                      </b-row>
                    </td>
                  </tr>
                </tbody>
              </table>
            </b-list-group-item>
          </b-list-group>
        </b-tab>
        <b-tab title="Chi nhánh - danh mục">
          <danhmucchinhanh />
        </b-tab>
      </b-tabs>
    </b-card>
    <chinhanhmodal :isEdit="this.isEdit"/>
  </b-container>
</template>

<script>
import { mapState,mapMutations,mapActions } from 'vuex'
import axios from "axios";
import { BIconPencil, BIconXCircle } from "bootstrap-vue";
import chinhanhmodal from './../components/chinhanh/chinhanhmodal'
import tinhthanhddl from './../components/utils/tinhthanhddl'
import danhmucchinhanh from '@/components/chinhanh/danhmucchinhanh.vue';

export default {
  components: {chinhanhmodal,tinhthanhddl,BIconPencil,BIconXCircle,danhmucchinhanh},
  data() {
    return {
      list: [],
      provincelist: [{ value: 1, text: "a" }],
      filter: {
        idtt: undefined,
        tenchinhanh: "",
        sdt: "",
      },
      isEdit:false,
    };
  },
  async mounted() {
    this.$store.dispatch('afetchchinhanh').then(() => {
    })
  },
  computed: {
    ...mapState([
      'chinhanh', 'user'
    ])
  },
  methods: {
    ...mapMutations([
      'increment',
      'showChiNhanhDetail',
      'hideChiNhanhDetail',
      'fetchChiNhanh',
    ]),
    ...mapActions(['afetchchinhanh']),
    ShowEdit(chinhanh){
      this.isEdit = true;
      this.showChiNhanhDetail(chinhanh);
    },
    showcreate(){
      this.isEdit = false;
      this.showChiNhanhDetail();
    },
    onsearch(){
      this.afetchchinhanh(this.filter);
    },
    ondelete(chinhanh){
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
          axios.delete(`http://localhost:3000/chinhanh/${chinhanh.Id}`,this.user.token)
          .then(() => {
            this.afetchchinhanh(this.filter);
            this.$swal(
              'Deleted!',
              `${chinhanh.TenChiNhanh} has been deleted.`,
              'success')
          })
          .catch(err => {
            this.$swal({
              icon: 'warning',
              text: err,
              showConfirmButton: false,
              timer: 1500
            })
          })
        }
      })
    },
  }
};
</script>

<style lang="scss" scoped>
</style>
<template>
  <b-container class="mt-3">
    <b-card no-body>
      <b-tabs card>
        <b-tab title="Tab 1" active>
          <b-list-group>
            <b-list-group-item>
              <b-row>
                <b-col>
                    <tinhthanhddl/>
                </b-col>
                <b-col>
                  <b-input-group size="sm" prepend="tên chi nhánh">
                    <b-form-input></b-form-input>
                  </b-input-group>
                </b-col>
                <b-col>
                  <b-input-group size="sm" prepend="điện thoại">
                    <b-form-input></b-form-input>
                  </b-input-group>
                </b-col>
              </b-row>
              <b-row>
                <b-col>
                  <b-button variant="primary" class="mt-2 float-left" size="sm">tìm kiếm</b-button>
                  <b-button variant="primary" class="mt-2 float-right" size="sm" @click="showChiNhanhDetail()">tạo chi nhánh</b-button>
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
                  <tr v-for="item in chinhanh.list" :key="item.Id">
                    <th scope="row">1</th>
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
                          <b-button variant="danger" size="sm">
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
        <b-tab title="Tab 2">
          <b-card-text>Tab contents 2</b-card-text>
        </b-tab>
      </b-tabs>
    </b-card>
    <chinhanhmodal/>
  </b-container>
</template>

<script>
import { mapState,mapMutations,mapActions } from 'vuex'
// import axios from "axios";
import { BIconPencil, BIconXCircle } from "bootstrap-vue";
import chinhanhmodal from './../components/chinhanh/chinhanhmodal'
import tinhthanhddl from './../components/utils/tinhthanhddl'

export default {
  components: {chinhanhmodal,tinhthanhddl,BIconPencil,BIconXCircle},
  data() {
    return {
      list: [],
      provincelist: [{ value: 1, text: "a" }],
      filter: {},
    };
  },
  async mounted() {
    this.$store.dispatch('afetchchinhanh').then((status) => {
      console.log(status)
    })
  },
  computed: {
    ...mapState([
      'chinhanh'
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
    // fetchchinhanh: function() {
    //   axios
    //     .get(`http://localhost:3000/chinhanh`)
    //     .then(res => {
    //       this.list = res.data;
    //       console.log(res);
    //     })
    //     .catch(err => {
    //       console.error(err);
    //     });ss
    // },
    ShowEdit(chinhanh){
      this.showChiNhanhDetail(chinhanh)
    },
    test: function(){
      this.$store.commit('hideChiNhanhDetail')
      console.log(this.vsbdetail);
    }
  }
};
</script>

<style lang="scss" scoped>
</style>
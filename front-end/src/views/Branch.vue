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
                  <b-button variant="primary" class="mt-2 float-right" size="sm" @click="showChiNhanhDetail">tạo chi nhánh</b-button>
                </b-col>
              </b-row>
            </b-list-group-item>
            <b-list-group-item>
              <table class="table table-sm">
                <thead class="thead-light" size="sm">
                  <tr>
                    <th scope="col">#</th>
                    <th scope="col">First</th>
                    <th scope="col">Last</th>
                    <th scope="col">Handle</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <th scope="row">1</th>
                    <td>Mark</td>
                    <td>Otto</td>
                    <td>@mdo</td>
                  </tr>
                  <tr>
                    <th scope="row">2</th>
                    <td>Jacob</td>
                    <td>Thornton</td>
                    <td>@fat</td>
                  </tr>
                  <tr>
                    <th scope="row">3</th>
                    <td>Larry</td>
                    <td>the Bird</td>
                    <td>@twitter</td>
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
import { mapState,mapMutations } from 'vuex'
import axios from "axios";
import chinhanhmodal from './../components/chinhanh/chinhanhmodal'
import tinhthanhddl from './../components/utils/tinhthanhddl'

export default {
  components: {chinhanhmodal,tinhthanhddl},
  data() {
    return {
      list: [],
      provincelist: [{ value: 1, text: "a" }],
      filter: {},
    };
  },
  mounted() {
    this.fetchchinhanh();
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
    ]),
    fetchchinhanh: function() {
      axios
        .get(`http://localhost:3000/chinhanh`)
        .then(res => {
          this.list = res.data;
          console.log(res);
        })
        .catch(err => {
          console.error(err);
        });
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
<template>
  <div>
    <b-container>
      <b-modal size="lg" v-model="chinhanh.vsbdetail" @hidden="hideChiNhanhDetail" title="thông tin chi nhánh">
        <template v-slot:default>
            <b-row>
                <b-col cols="4" class="mt-2">
                    <label for="Tỉnh thành">Tỉnh thành</label>
                    <tinhthanhddl @change="bindTinhThanh"/>
                </b-col>
                <b-col cols="8" class="mt-2">
                    <label for="Tên chi nhánh">Tên chi nhánh</label>
                    <b-input-group size="sm" prepend="Tên chi nhánh">
                        <b-form-input v-model="TenChiNhanh" ></b-form-input>
                    </b-input-group>
                </b-col>
                <b-col cols="4" class="mt-2">
                    <label for="Địa chỉ">Địa chỉ</label>
                    <b-input-group size="sm" prepend="Địa chỉ">
                        <b-form-input v-model="DiaChi" ></b-form-input>
                    </b-input-group>
                </b-col>
                <b-col cols="4" class="mt-2">
                    <label for="Điện thoại">Điện thoại</label>
                    <b-input-group size="sm" prepend="Điện thoại">
                        <b-form-input v-model="SDT" ></b-form-input>
                    </b-input-group>
                </b-col>
            </b-row>
        </template>
        <template v-slot:modal-footer>
          <div class="w-100">
            <b-button variant="secondary" size="sm" class="float-right" @click="hideChiNhanhDetail">Close</b-button>
            <b-button variant="primary" size="sm" class="float-right mr-3" @click="Submit()">save</b-button>
          </div>
        </template>
      </b-modal>
    </b-container>
  </div>
</template>

<script>
import { mapState, mapMutations } from "vuex";
import axios from 'axios';
import tinhthanhddl from './../../components/utils/tinhthanhddl'

export default {
  components: {
      tinhthanhddl,
  },
  data() {
      return {
          IdTinhThanh: null,
          TenChiNhanh: "",
          DiaChi: "",
          SDT: "",
      }
  },
  computed: {
    ...mapState([
        'chinhanh',
        'tinhthanhlist'
    ])
  },
  methods: {
    ...mapMutations(["showChiNhanhDetail", "hideChiNhanhDetail"]),
    bindTinhThanh (value) {
      this.IdTinhThanh = value;
    },
    Submit(){
      const entity ={
        TenChiNhanh: this.TenChiNhanh,
        DiaChi: this.DiaChi,
        SDT: this.SDT,
        IdTinhThanh: this.IdTinhThanh,
      }
      axios.post(`http://localhost:3000/chinhanh`,entity)
      .then(res => {
        console.log(res)
      })
      .catch(err => {
        console.error(err); 
      })
    }
  }
};
</script>

<style lang="scss" scoped>
</style>
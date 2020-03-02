<template>
  <div>
    <b-container>
      <b-modal size="lg" v-model="chinhanh.vsbdetail" @hidden="hideChiNhanhDetail" title="thông tin chi nhánh">
        <template v-slot:default>
            <b-row>
                <b-col cols="4" class="mt-2">
                    <label for="Tỉnh thành">Tỉnh thành</label>
                    <tinhthanhddl :IdTinhThanh="chinhanh.chinhanhslc.IdTinhThanh" @change="bindTinhThanh"/>
                </b-col>
                <b-col cols="8" class="mt-2">
                    <label for="Tên chi nhánh">Tên chi nhánh</label>
                    <b-input-group size="sm" prepend="Tên chi nhánh">
                        <b-form-input v-model="chinhanh.chinhanhslc.TenChiNhanh" ></b-form-input>
                    </b-input-group>
                </b-col>
                <b-col cols="4" class="mt-2">
                    <label for="Địa chỉ">Địa chỉ</label>
                    <b-input-group size="sm" prepend="Địa chỉ">
                        <b-form-input v-model="chinhanh.chinhanhslc.DiaChi" ></b-form-input>
                    </b-input-group>
                </b-col>
                <b-col cols="4" class="mt-2">
                    <label for="Điện thoại">Điện thoại</label>
                    <b-input-group size="sm" prepend="Điện thoại">
                        <b-form-input v-model="chinhanh.chinhanhslc.SDT" ></b-form-input>
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
import { mapState, mapMutations, mapActions } from "vuex";
import axios from 'axios';
import tinhthanhddl from './../../components/utils/tinhthanhddl'

export default {
  props: {
    isEdit: {
      type: Boolean,
      default: false,
    },
  },
  data() {
      return {
      }
  },
  components: {
      tinhthanhddl,
  },
  mounted () {
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
      this.chinhanh.chinhanhslc.IdTinhThanh = value;
    },
    ...mapActions(['afetchchinhanh']),
    Submit(){
        const entity ={
          Id: this.chinhanh.chinhanhslc.Id,
          TenChiNhanh: this.chinhanh.chinhanhslc.TenChiNhanh,
          DiaChi: this.chinhanh.chinhanhslc.DiaChi,
          SDT: this.chinhanh.chinhanhslc.SDT,
          IdTinhThanh: this.chinhanh.chinhanhslc.IdTinhThanh,
        }
      if(this.isEdit){
        axios.patch(`http://localhost:3000/chinhanh/${entity.Id}`,entity)
        .then(res => {
          console.log(res)
          this.afetchchinhanh();
            this.$swal({
              icon: 'success',
              title: 'sửa chi nhánh thành công',
              showConfirmButton: false,
              timer: 1500
            })
        })
        .catch(err => {
          console.error(err); 
            this.$swal({
              icon: 'warning',
              title: 'lỗi',
              showConfirmButton: false,
              timer: 1500
            })
        })
      }
      else{
        console.log('create');
        axios.post(`http://localhost:3000/chinhanh`,entity)
        .then(res => {
          console.log(res)
          this.afetchchinhanh();
            this.$swal({
              icon: 'success',
              title: 'thêm chi nhánh thành công',
              showConfirmButton: false,
              timer: 1500
            })
        })
        .catch(err => {
          console.error(err); 
            this.$swal({
              icon: 'warning',
              title: 'lỗi',
              showConfirmButton: false,
              timer: 1500
            })
        })
        return;
      }
    }
  }
};
</script>

<style lang="scss" scoped>
</style>
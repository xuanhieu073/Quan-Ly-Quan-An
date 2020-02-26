<template>
  <div>
    <b-container>
      <b-modal size="lg" v-model="chinhanh.vsbdetail" @hidden="hideChiNhanhDetail" title="BootstrapVue">
        <template v-slot:default>
            <b-row>
                <b-col cols="4" class="mt-2">
                    <label for="Tỉnh thành">Tỉnh thành</label>
                    <tinhthanhddl/>
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
                        <b-form-input v-model="TenChiNhanh" ></b-form-input>
                    </b-input-group>
                </b-col>
                <b-col cols="4" class="mt-2">
                    <label for="Điện thoại">Điện thoại</label>
                    <b-input-group size="sm" prepend="Điện thoại">
                        <b-form-input v-model="TenChiNhanh" ></b-form-input>
                    </b-input-group>
                </b-col>
            </b-row>
        </template>
        <template v-slot:modal-footer>
          <div class="w-100">
            <b-button variant="secondary" size="sm" class="float-right" @click="hideChiNhanhDetail">Close</b-button>
            <b-button variant="primary" size="sm" class="float-right mr-3" @click="EditSubmit()">save</b-button>
          </div>
        </template>
      </b-modal>
    </b-container>
  </div>
</template>

<script>
import { mapState, mapMutations } from "vuex";
import tinhthanhddl from './../../components/utils/tinhthanhddl'

export default {
  components: {
      tinhthanhddl,
  },
  data() {
      return {
          IdTinhThanh: null,
          TenChiNhanh: ""
      }
  },
  computed: {
    ...mapState([
        'chinhanh',
        'tinhthanhlist'
    ])
  },
  methods: {
    ...mapMutations(["showChiNhanhDetail", "hideChiNhanhDetail"])
  }
};
</script>

<style lang="scss" scoped>
</style>
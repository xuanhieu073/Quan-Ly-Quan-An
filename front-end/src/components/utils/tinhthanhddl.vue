<template>
  <b-input-group size="sm" prepend="Tỉnh thành">
    <b-form-select v-model="IdTinhThanh" :options="tinhthanhlist" value-field="Id" text-field="Name" size="sm">
        <template v-slot:first>
            <b-form-select-option :value="null">--none--</b-form-select-option>
        </template>
    </b-form-select>
  </b-input-group>
</template>

<script>
import { mapState, mapMutations } from "vuex";
export default {
  data() {
      return {
          IdTinhThanh: null
      }
  },
  computed: {
    ...mapState(["tinhthanhlist"])
  },
  mounted() {
      this.fetchTinhThanh();
  },
  methods: {
      ...mapMutations(["fetchTinhThanh"])
  },
};
</script>

<style lang="scss" scoped>
</style>
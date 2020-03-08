<template>
  <b-input-group size="sm" prepend="Tỉnh thành">
    <b-form-select v-model="Id" :options="tinhthanhlist" value-field="Id" text-field="NameVN" size="sm" @change="emitToParent">
        <template v-slot:first>
            <b-form-select-option :value="null">--none--</b-form-select-option>
        </template>
    </b-form-select>
  </b-input-group>
</template>

<script>
import { mapState, mapMutations } from "vuex";
export default {
  props: {
    value: {
      type: Number,
    },
  },
  data() {
      return {
          Id: Number,
      }
  },
  computed: {
    ...mapState(["tinhthanhlist"])
  },
  mounted() {
      this.fetchTinhThanh();
      this.Id = this.value;
  },
  methods: {
    ...mapMutations(["fetchTinhThanh"]),
    emitToParent () {
      this.$emit('input', this.Id)
    }
  },
};
</script>

<style lang="scss" scoped>
</style>
<template>
    <b-input-group size="sm" prepend="Chi nhánh">
    <b-form-select v-model="Id" :options="chinhanh.list" value-field="Id" text-field="TenChiNhanh" size="sm" @change="emitToParent">
        <template v-slot:first>
            <b-form-select-option :value="null">--none--</b-form-select-option>
        </template>
    </b-form-select>
  </b-input-group>
</template>

<script>
    import { mapState, mapMutations,mapActions } from "vuex";

    export default {
        props: {
            value: {
            type: Number,
            },
            TinhThanhId: {
                type: Number,
            }
        },
        data() {
            return {
                Id: Number,
                filter: {
                    idtt: undefined,
                    tenchinhanh: "",
                    sdt: "",
                },
            }
        },
        computed: {
            ...mapState([ 'chinhanh' ])
        },
        watch: {
            TinhThanhId(newValue) {
                if(newValue) 
                    this.filter.idtt = newValue;
                else 
                    this.filter.idtt = undefined
                this.afetchchinhanh(this.filter);
            }
        },
        mounted() {
            this.fetchTinhThanh();
            this.Id = this.value;
            this.afetchchinhanh();
        },
        methods: {
            ...mapMutations(["fetchTinhThanh"]),
            ...mapActions(['afetchchinhanh']),
            emitToParent () {
            this.$emit('input', this.Id)
            }
        },       
    }
</script>
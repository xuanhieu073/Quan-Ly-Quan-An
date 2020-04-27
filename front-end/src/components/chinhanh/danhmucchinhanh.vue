<template>
  <b-container class="mt-3">
    <b-list-group>
      <b-list-group-item>
        <b-row>
          <b-col cols="6">
            <tinhthanhddl v-model="tinhthanhId" />
          </b-col>
          <b-col cols="6">
            <chinhanhddl :TinhThanhId="tinhthanhId" v-model="chinhanhId"/>
          </b-col>
        </b-row>
      </b-list-group-item>
      <b-list-group-item>
        <b-button size="sm float-left" variant="primary" @click="fetchmenu" style="margin-right:10px">Search</b-button>
        <b-button size="sm float-left" variant="primary" @click="save">Save</b-button>
      </b-list-group-item>
      <b-list-group-item>
        <table class="table table-sm table-responsive table-bordered">
          <tbody>
            <tr v-for="item in fields" :key="item.CatID">
              <td nowrap>{{item.CatName}}</td>
              <td v-for="food in item.items" :key="food.ProID">
                <div style="width:150px">
                  <b-row>
                    <b-col md="8">
                      {{food.ProName}}
                    </b-col>
                    <b-col md="4">
                      <b-form-checkbox v-model="food.check" name="check-button" switch>
                      </b-form-checkbox>
                    </b-col>
                  </b-row>
                </div>
              </td>
            </tr>
          </tbody>
        </table>
      </b-list-group-item>
    </b-list-group>
  </b-container>
</template>

<script>
import { mapState, mapMutations } from "vuex";
import tinhthanhddl from "@/components/utils/tinhthanhddl.vue";
import chinhanhddl from '@/components/utils/chinhanhddl.vue';
import axios from 'axios';

export default {
  components: {
    tinhthanhddl,
    chinhanhddl,
  },
  data() {
    return {
      chinhanhId: 1,
      fields: [],
      tinhthanhId: 0,
    };
  },
  computed: {
    ...mapState(["category","user"])
  },
  mounted () {
    this.fetchCategory();
  },
  methods: {
    ...mapMutations(["fetchCategory"]),
    fetchmenuchinhanh() {
      let fields = this.fields = [];
      axios.get(`http://localhost:3000/categories`,{headers : {'x-access-token':this.user.token}})
      .then(res => {
        for(let i=0;i<res.data.length;i++)
        {
          let item =res.data[i];
          fields.push(item)
          axios.get(`http://localhost:3000/chinhanh/1/cat/${item.CatID}/food`,{headers : {'x-access-token':this.user.token}})
          .then(res => {
            fields[i].items = res.data
          })
          .catch(err => {
            console.error(err); 
          })
        }
      })
      .catch(err => {
        console.error(err); 
      })
    },
    fetchmenu(){
      if(!this.chinhanhId) {
        alert('vui lòng chọn chi nhánh')
        return;
      }
      axios.get(`http://localhost:3000/menuchinhanh/chinhanh/${this.chinhanhId}`,{headers : {'x-access-token':this.user.token}})
      .then(res=>{
        this.fields = res.data;
      })
    },
    save(){
      let saveitems = []
      let deleteitems = []
      for(let i =0;i<this.fields.length;i++){
        for(let j=0;j<this.fields[i].items.length;j++){
          if(this.fields[i].items[j].check){
            const itemsave = {ChiNhanhId: this.chinhanhId, FoodId:this.fields[i].items[j].ProID}
            saveitems.push(itemsave)
          }
          else{
            const itemdelete = {ChiNhanhId: this.chinhanhId, FoodId:this.fields[i].items[j].ProID}
            deleteitems.push(itemdelete);
          }
        }
      }

      axios.post('http://localhost:3000/menuchinhanh',saveitems,{headers : {'x-access-token':this.user.token}})
            .then(res=>{
              console.log(res);
                this.$swal({
                icon: 'success',
                title: 'đã lưu menu chi nhánh',
                showConfirmButton: false,
                timer: 1500
              })
            })
            .catch(err=>{
              this.$swal({
                icon: 'warning',
                title: err,
                showConfirmButton: false,
                timer: 1500
              })
            })

      
      axios.delete(`http://localhost:3000/menuchinhanh`, {data: deleteitems,headers : {'x-access-token':this.user.token}})
      .then(res=>{console.log(res)}).catch(err=>{console.log(err)})
    }
  },
};
</script>

<style lang="scss" scoped>
</style>
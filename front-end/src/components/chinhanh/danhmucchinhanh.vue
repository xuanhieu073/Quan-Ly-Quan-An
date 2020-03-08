<template>
  <b-container class="mt-3">
    <b-list-group>
      <b-list-group-item>
        <b-row>
          <b-col cols="6">
            <tinhthanhddl />
          </b-col>
        </b-row>
      </b-list-group-item>
      <b-list-group-item>
        <b-button size="sm float-left" variant="primary" @click="fetchmenu">Search</b-button>
      </b-list-group-item>
      <b-list-group-item>
        <table class="table table-sm table-responsive table-bordered">
          <tbody>
            <tr v-for="item in fields" :key="item.CatID">
              <td nowrap>{{item.CatName}}</td>
              <td v-for="food in item.items" :key="food.ProID">
                {{food.ProName}}
              </td>
            </tr>
          </tbody>
        </table>
      </b-list-group-item>
    </b-list-group>
  </b-container>
</template>

<script>
import tinhthanhddl from "@/components/utils/tinhthanhddl.vue";
import axios from 'axios';

export default {
  components: {
    tinhthanhddl
  },
  data() {
    return {
      fields: [],
    };
  },
  mounted () {
  },
  methods: {
    fetchmenuchinhanh() {
      let fields = this.fields;
      axios.get(`http://localhost:3000/categories`)
      .then(res => {
        res.data.forEach(function(item,i){
          fields.push(item)
          axios.get(`http://localhost:3000/chinhanh/1/cat/${item.CatID}/food`)
          .then(res => {
            fields[i].items = res.data
          })
          .catch(err => {
            console.error(err); 
          })
        })
        console.log(this.fields)
      })
      .catch(err => {
        console.error(err); 
      })
    },
    fetchmenu(){
      axios.get(`http://localhost:3000/menuchinhanh/chinhanh/1`)
      .then(res=>{
        console.log(res.data)
        this.fields = res.data;
      })
    }
  },
};
</script>

<style lang="scss" scoped>
</style>
<template>
  <div>
    <CategoriesList/>
  </div>
</template>

<script>
import axios from "axios";
import CategoriesList from '@/components/CategoriesEdit.vue';
import { mapState } from 'vuex';
export default {
  components: {
    CategoriesList,
  },
  data() {
    return {
      categories: []
    };
  },
  mounted() {
  },
  computed: {
    ...mapState(['user'])
  },
  methods: {
    fetchCategories: function() {
      axios
        .get(`http://localhost:3000/categories`,{headers : {'x-access-token':this.user.token}})
        .then(res => {
          this.categories = res.data;
          console.log(res);
        })
        .catch(err => {
          console.error(err);
        });
    }
  }
};
</script>

<style lang="scss" scoped>
</style>
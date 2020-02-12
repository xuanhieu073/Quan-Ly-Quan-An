<template>
  <div>
    <CategoriesList/>
  </div>
</template>

<script>
import axios from "axios";
import CategoriesList from '@/components/CategoriesEdit.vue';
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
  methods: {
    fetchCategories: function() {
      axios
        .get(`http://localhost:3000/categories`)
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
<template>
  <div id="app">
    <TopMenu v-show="user.token"/>
    <router-view/>
  </div>
</template>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}

#nav {
  padding: 30px;
}

#nav a {
  font-weight: bold;
  color: #2c3e50;
}

#nav a.router-link-exact-active {
  color: #42b983;
}
</style>
<script>
import TopMenu from '@/components/TopMenu.vue';
import { mapState } from 'vuex';
export default {
  components: {
    TopMenu,
  },
  computed: {
    ...mapState(['user'])
  },
}
</script>

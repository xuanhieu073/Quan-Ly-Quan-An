<template>
    <div>
  <b-navbar toggleable="lg" type="dark" variant="info">
    <b-navbar-brand href="#" :to="`/categories`">Menu</b-navbar-brand>

    <b-navbar-toggle target="nav-collapse"></b-navbar-toggle>

    <b-collapse id="nav-collapse" is-nav>
      <b-navbar-nav>
        <!-- <b-nav-item-dropdown
          id="my-nav-dropdown"
          text="Chi nhánh"
          toggle-class="nav-link-custom"
          right
        >
          <b-dropdown-item :to="`/Branch`">Danh sách Chi nhánh</b-dropdown-item>
        </b-nav-item-dropdown> -->
        <b-nav-item :to="`/Branch`">Danh sách Chi nhánh</b-nav-item>
        <b-nav-item :to="`/categories-list`" v-show="user.payload.permission == 1">Danh mục</b-nav-item>
        <b-nav-item :to="`/categories`" v-show="!user.payload.permission">Danh sách món ăn</b-nav-item>
        <b-nav-item :to="`/categoriescn`" v-show="user.payload.permission == 2">Danh sách món ăn</b-nav-item>
        <!-- <b-nav-item href="#" disabled>Disabled</b-nav-item> -->
      </b-navbar-nav>

      <!-- Right aligned nav items -->
      <b-navbar-nav class="ml-auto">
        <!-- <b-nav-form>
          <b-form-input size="sm" class="mr-sm-2" placeholder="Search"></b-form-input>
          <b-button size="sm" class="my-2 my-sm-0" type="submit">Search</b-button>
        </b-nav-form> -->

        <b-nav-item-dropdown right>
          <!-- Using 'button-content' slot -->
          <template v-slot:button-content>
            <em>{{user.payload.f_Name}}</em>
          </template>
          <b-dropdown-item href="#" @click="signout">Sign Out</b-dropdown-item>
        </b-nav-item-dropdown>
      </b-navbar-nav>
    </b-collapse>
  </b-navbar>
</div>
</template>

<script>
import {mapState} from 'vuex'

    export default {
      computed: {
          ...mapState([
              'user',
          ])
      },
      methods: {
        signout() {
          localStorage.setItem('token','');
          localStorage.setItem('user','');
          localStorage.setItem('cart','');
          window.location.href='http://localhost:8000/'
        }
      },
    }
</script>

<style lang="scss" scoped>

</style>
<template>
  <div>
    <div class="p-grid p-fluid p-jc-center">
      <div class="p-col-12 p-md-4">
        <div class="p-inputgroup">
          <span class="p-inputgroup-addon">
            <i class="pi pi-user"></i>
          </span>
          <InputText placeholder="Username" v-model="username" />
        </div>
      </div>
    </div>
    <div class="p-grid p-fluid p-jc-center">
      <div class="p-col-12 p-md-4">
        <div class="p-inputgroup">
          <span class="p-inputgroup-addon">
            <i class="pi pi-lock"></i>
          </span>
          <Password v-model="password" @keyup.enter="login" placeholder="Password" />
        </div>
      </div>
    </div>
    <div class="p-grid p-fluid p-jc-center">
      <div class="p-col-6 p-md-2">
        <a href="/#/register">create account</a>
      </div>
      <div class="p-col- p-md-2" style="text-align: right">
        <a>forgot password</a>
      </div>
    </div>
    <div class="p-grid p-fluid p-jc-center">
      <div class="p-col-12 p-md-4">
        <Button label="Login" @click="login" />
      </div>
    </div>
  </div>
</template>

<script>
	import AuthService from '../service/AuthService'
	export default {
		data() {
			return {
				username: '',
				password: '',
			}
		},
    authService: null,
		created () {
			this.authService = new AuthService();
		},
		methods: {
			async login() {
        const res = await this.authService.login({user:this.username,pwd:this.password})
        // console.log(res)
        localStorage.setItem('user',JSON.stringify(res.data))
        // window.location='/#/cat/0/products'
        this.$router.push('/cat/0/products')
			}
		},
	};
</script>

<style lang="scss" scoped>
</style>
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
          <Password v-model="password" placeholder="Password" />
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
			login() {
				console.log(this.username+'_'+this.password);
				this.authService.login({user:this.username,pwd:this.password}).then(data => console.log(data))
				// window.location='/#/'
			}
		},
	};
</script>

<style lang="scss" scoped>
</style>
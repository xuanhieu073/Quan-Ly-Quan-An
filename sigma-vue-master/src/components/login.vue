<template>
    <div>
        <div class="p-grid p-jc-center">
            <div class="p-col-6">
                <div class="p-inputgroup">
                    <span class="p-inputgroup-addon">
                        <i class="pi pi-user"></i>
                    </span>
                    <InputText v-model="username" placeholder="username"></InputText>
                </div>
            </div>
        </div>
        <div class="p-grid p-jc-center">
            <div class="p-col-6">
                <div class="p-inputgroup">
                    <span class="p-inputgroup-addon">
                        <i class="pi pi-lock"></i>
                    </span>
                    <InputText type="password" v-model="password" placeholder="password"></InputText>
                </div>
            </div>
        </div>
        <div class="p-grid p-jc-center">
            <div class="p-col-6">
                <a href="/#/sigup">create account</a>
            </div>
        </div>
        <div class="p-grid p-jc-center">
            <div class="p-col-6">
                <Button label="Login" style="width:100%" @click="login"></Button>
            </div>
        </div>
        <alert v-model="dalert" :content="dcontent"/>
    </div>
</template>

<script>
import Axios from 'axios'
import alert from './alert.vue'
    export default {
        components: {
            alert,
        },
        data() {
            return {
                dalert: false,
                dcontent: '',
                username: '',
                password: '',
            }
        },
        methods: {
            async login() {
                const f_Username = this.username;
                const f_Password = this.password;
                try{
                    const res = await Axios.post("http://localhost:3000/api/auth",{f_Username,f_Password})
                    console.log(res);
                    localStorage.setItem('user',JSON.stringify(res.data.payload))
                    window.location = "/#/";
                }
                catch(err){
                    if(err.response.status == 400){
                        this.dalert = true
                        this.dcontent = 'sai tài khoản hoặc mật khẩu'
                    }
                }
            }
        },
    }
</script>

<style lang="scss" scoped>

</style>
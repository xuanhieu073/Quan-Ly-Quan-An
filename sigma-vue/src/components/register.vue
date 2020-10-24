<template>
    <div>
        <div class="p-grid p-jc-center">
            <div class="p-col-6">
                <div class="p-inputgroup">
                    <span class="p-inputgroup-addon">
                        <i class="pi pi-user"></i>
                    </span>
                    <InputText v-model="newUser.f_Username" placeholder="username"></InputText>
                </div>
            </div>
        </div>
        <div class="p-grid p-jc-center">
            <div class="p-col-6">
                <div class="p-inputgroup">
                    <span class="p-inputgroup-addon"><i class="pi pi-lock"></i></span>
                    <InputText v-model="newUser.f_Password" type="password" placeholder="password"></InputText>
                </div>
            </div>
        </div>
        <div class="p-grid p-jc-center">
            <div class="p-col-6">
                <div class="p-inputgroup">
                    <span class="p-inputgroup-addon"><i class="pi pi-calendar"></i></span>
                    <Calendar v-model="newUser.f_DOB" style="width:100%"/>
                </div>
            </div>
        </div>
        <div class="p-grid p-jc-center">
            <div class="p-col-6">
                <Button label="Signup" style="width: 100%" @click="Sigup"/>
            </div>
        </div>
    </div>
</template>

<script>
    import AuthService from '../service/AuthService'
    export default {
        data() {
            return {
                newUser:{
                    f_Username:"",
                    f_Password:"",
                    f_DOB:"",
                }
            }
        },
        authService: null,
        created () {
            this.authService = new AuthService();
        },
        methods: {
            async Sigup() {
                const res = await this.authService.register(this.newUser);
                console.log(res);
            }
        },
    }
</script>

<style lang="scss" scoped>

</style>
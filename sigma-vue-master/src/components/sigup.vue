<template>
    <div>
        <div class="p-grid">
            <div class="p-col-6">
                <div class="p-inputgroup">
                    <span class="p-inputgroup-addon"><i class="pi pi-user"></i></span>
                    <InputText v-model="newuser.f_Username" placeholder="username"/>
                </div>
            </div>
            <div class="p-col-6">
                <div class="p-inputgroup">
                    <span class="p-inputgroup-addon"><i class="pi pi-lock"></i></span>
                    <InputText v-model="newuser.f_Password" type="password" placeholder="password"/>
                </div>
            </div>
            <div class="p-col-6">
                <div class="p-inputgroup">
                    <span class="p-inputgroup-addon"><i class="pi pi-lock"></i></span>
                    <Calendar v-model="newuser.f_DOB" dateFormat="yy-mm-dd" style="width: 100%" />
                </div>
            </div>
        </div>
        <div class="p-grid">
            <div class="p-col-6">
                <Button label="submit" @click="Sigup"/>
            </div>
        </div>
    </div>
</template>

<script>
import Axios from 'axios'
    export default {
        data() {
            return {
                newuser: {
                    f_Username: '',
                    f_Password:'',
                    f_Name: '',
                    f_Email: '',
                    f_Mobile: '',
                    f_Address: '',
                    f_DOB: ''
                },
            }
        },
        methods: {
            Sigup() {
                const dob = new Date(this.newuser.f_DOB)
                this.newuser.f_DOB = dob.getFullYear()+'-'+(dob.getMonth()+1)+'-'+dob.getDate();
                Axios.post(`http://localhost:3000/api/users`,this.newuser)
                .then(res=>{
                    console.log(res)
                    this.$router.push('login')
                })
                .catch(err=>{
                    alert(err)
                })
            }
        },
    }
</script>

<style lang="scss" scoped>

</style>
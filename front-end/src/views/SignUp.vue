<template>
    <b-container class="mt-5">
        <b-row align-h="center">
            <b-col cols="6">
                <b-form @submit="onSubmit"  v-if="show">
                    <b-form-group id="input-group-sdt" label="Số điện thoại" label-for="input-sdt">
                        <b-form-input
                        id="input-sdt"
                        v-model="form.f_Mobile"
                        required
                        placeholder="Enter mobile"
                        ></b-form-input>
                    </b-form-group>

                    <b-form-group id="input-group-sdt" label="Họ và tên" label-for="input-sdt">
                        <b-form-input
                        id="input-sdt"
                        v-model="form.f_Name"
                        required
                        placeholder="Enter your name"
                        ></b-form-input>
                    </b-form-group>

                    <b-form-group id="input-group-dbo" label="Địa chỉ" label-for="input-dbo">
                        <b-form-input
                        id="input-dbo"
                        v-model="form.f_Address"
                        required
                        placeholder="Enter address"
                        ></b-form-input>
                    </b-form-group>

                    <b-form-group id="input-group-dbo" label="Ngày sinh" label-for="input-dbo">
                        <b-form-datepicker id="example-datepicker"
                        :date-format-options="{ year: 'numeric', month: 'numeric', day: 'numeric' }" 
                        initial-date="2000-01-01"
                        v-model="form.f_DOB" class="mb-2"></b-form-datepicker>
                    </b-form-group>

                    <b-form-group id="input-group-1" label="Địa chỉ email" label-for="input-1" >
                        <b-form-input
                        id="input-1"
                        v-model="form.f_Email"
                        type="email"
                        placeholder="Enter email"
                        ></b-form-input>
                    </b-form-group>

                    <b-form-group id="input-group-2" label="Username" label-for="input-2">
                        <b-form-input
                        id="input-2"
                        v-model="form.f_Username"
                        required
                        placeholder="Enter username"
                        ></b-form-input>
                    </b-form-group>

                    <b-form-group id="input-group-cp" label="Password" label-for="input-cp">
                        <b-form-input
                        type="password"
                        id="input-cp"
                        v-model="form.f_Password"
                        required
                        placeholder="Enter password"
                        ></b-form-input>
                    </b-form-group>

                    <b-form-group id="input-group-cp" label="Confirm Password" label-for="input-cp">
                        <b-form-input
                        type="password"
                        id="input-cp"
                        v-model="cpwd"
                        required
                        placeholder="Enter password"
                        ></b-form-input>
                    </b-form-group>

                    <b-button type="submit" variant="primary" style="float:left">Submit</b-button>
                    <b-button variant="light" style="float:right" :to="`/login`">Đăng nhập</b-button>
                    </b-form>
            </b-col>
        </b-row>
    </b-container>
</template>

<script>
import {mapState,mapMutations} from 'vuex'
import axios from 'axios'
    export default {
        data() {
            return {
                form: {
                    f_Username: '',
                    f_Password:'',
                    f_Name: '',
                    f_Email: '',
                    f_Mobile: '',
                    f_Address: '',
                    f_DOB: ''
                    },
                foods: [{ text: 'Select One', value: null }, 'Carrots', 'Beans', 'Tomatoes', 'Corn'],
                show: true,
                cpwd: ''
            }
        },
        computed: {
            ...mapState([
                'user',
            ])
        },
        methods: {
            ...mapMutations(["setuser"]),
            onSubmit() {
                axios.post(`http://localhost:3000/api/users`,this.form)
                .then(res=>{
                    console.log(res)
                    this.$swal({
                        icon: 'success',
                        title: 'đăng kí thàng công',
                        showConfirmButton: false,
                        timer: 1500,
                        onClose: () => {
                            this.$router.push('login')
                        }
                    })
                })
                .catch(err=>{
                    alert(err)
                })
            },
        },
    }
</script>

<style lang="scss" scoped>

</style>
<template>
    <b-container>
        <b-form v-if="show">
            <b-form-group id="input-group-1" label="Your Name:" label-for="input-1">
                <b-form-input
                id="input-1"
                v-model="form.user"
                required
                placeholder="Enter name"
                ></b-form-input>
            </b-form-group>

            <b-form-group id="input-group-2" label="Your Name:" label-for="input-2">
                <b-form-input
                type="password"
                id="input-2"
                v-model="form.pwd"
                required
                placeholder="Enter password"
                ></b-form-input>
            </b-form-group>

            <b-button variant="primary" style="float:left" @click="onSubmit">Submit</b-button>
        </b-form>
    </b-container>
</template>

<script>
import {mapState,mapMutations} from 'vuex'
import axios from 'axios'
    export default {
        data() {
        return {
            form: {
                user: '',
                pwd:'',
                food: null,
                checked: []
                },
                foods: [{ text: 'Select One', value: null }, 'Carrots', 'Beans', 'Tomatoes', 'Corn'],
                show: true
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
                const user = {
                    user: this.form.user,
                    pwd: this.form.pwd
                }
                axios.post(`http://localhost:3000/api/auth`,user)
                .then(res=>{
                    localStorage.setItem('token',res.data.accessToken);
                    localStorage.setItem('payload', res.data.payload);
                    this.user.token = res.data.accessToken;
                    this.user.payload = res.data.payload;
                    console.log(this.user)
                    if(this.user.payload.permission == 1){
                        this.$router.push('categories-list') 
                    }
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
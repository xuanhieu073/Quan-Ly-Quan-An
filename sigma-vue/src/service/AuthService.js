import axios from 'axios'

export default class AuthService {
	login(user) {
        return axios.post('http://localhost:3000/api/auth',user)
    }
    register(user){
        return axios.post('http://localhost:3000/api/users',user)
    }
}
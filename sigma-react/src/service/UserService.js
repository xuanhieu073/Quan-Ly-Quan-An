import Axios from "axios"
import BaseService from "./BaseService"

export class UserService extends BaseService {
    Login(user){
        return Axios.post(`${this.url}/api/auth`,user);
    }
}

export default UserService

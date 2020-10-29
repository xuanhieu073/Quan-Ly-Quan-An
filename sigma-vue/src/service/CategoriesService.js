import Axios from "axios";
import BaseService from './BaseService'

// const { default: BaseService } = require("./BaseService");

export default class CategoriesService extends BaseService {
    getCategories(){
        return Axios.get(`${this.url}/api/categories`,{headers: {
            "x-access-token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjgsInBlcm1pc3Npb24iOjEsImZfSUQiOjgsImZfVXNlcm5hbWUiOiJhZG1pbiIsImZfUGFzc3dvcmQiOiIkMmEkMDgkd0JYRUJMcVNzQTRNWVRJanZCMnlMZVVnOUdDVnB2VjRpWEROcXZtcGNYZWZ0dG5zYkV2VnEiLCJmX05hbWUiOiJhZG1pbiIsImZfRW1haWwiOiIiLCJmX0RPQiI6IjE5OTktMTItMzFUMTc6MDA6MDAuMDAwWiIsImZfUGVybWlzc2lvbiI6MSwiZl9Nb2JpbGUiOiJhZG1pbiIsImZfQWRkcmVzcyI6ImFkbWluIiwiZl9DaGlOaGFuaElkIjpudWxsLCJpYXQiOjE2MDM2MjQ5OTYsImV4cCI6MTYwNDIyNDk5Nn0.rHTkyzYnJ2GdU09set9iMROWskFwUsDXzy5hps_omts"
        }})
    }
}
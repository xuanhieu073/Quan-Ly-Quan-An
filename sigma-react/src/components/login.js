import React, { Component } from 'react'
import { InputText } from 'primereact/inputtext'
import { Button } from 'primereact/button'
import UserService from '../service/UserService'

export class login extends Component {
    constructor(props) {
        super(props)
        this.userService = new UserService();
    
        this.state = {
             username: "",
             password: "",
        }
        this.OnLogin = this.OnLogin.bind(this);
        this.handleChange = this.handleChange.bind(this);
    }
    
    handleChange(event) {
        this.setState({[event.target.name]: event.target.value});
    }

    OnLogin = async () =>{
        const user = this.state.username
        const pwd = this.state.password
        try{
            const res = await this.userService.Login({user,pwd})
            if(res.status === 200){
                alert("authorized")
            }
        }
        catch(err){
            if(err.response.status === 400);
            alert("incorrect username or password")
        }
    }

    render() {
        return (
            <div>
                <div className="p-grid p-justify-center">
                    <div className="p-sm-12 p-md-6">
                        <div className="p-inputgroup">
                            <span className="p-inputgroup-addon"><i className="pi pi-user"></i></span>
                            <InputText value={this.state.username} name="username" onChange={this.handleChange} placeholder="username" style={{width:"100%"}}></InputText>
                        </div>
                    </div>
                </div>
                <div className="p-grid p-justify-center">
                    <div className="p-sm-12 p-md-6">
                        <div className="p-inputgroup"><span className="p-inputgroup-addon"><i className="pi pi-lock"></i></span>
                            <InputText value={this.state.password} name={"password"} onChange={this.handleChange} placeholder="password" type="password" style={{width:"100%"}}></InputText>
                        </div>
                    </div>
                </div>
                <div className="p-grid p-justify-center">
                    <div className="p-sm-12 p-md-6">
                        <Button to={`/usdf`} label="Login" style={{width:"100%"}} onClick={this.OnLogin} />
                    </div>
                </div>
            </div>
        )
    }
}

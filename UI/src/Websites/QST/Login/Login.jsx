import React, { Component } from 'react';
import Logo from '../assets/images/logo.png'
import './login.css';
//import { bool } from 'yup';
import { variables } from 'Variables';
import Swal from 'sweetalert2'

export default class Login extends Component {
    constructor (props) {
        super(props);
        this.state = {
            email: "",
            password: "",
            rememberMe: false,
            // eslint-disable-next-line react-hooks/rules-of-hooks
        }
        this.isRemembered();
    }
    isRemembered() {
        debugger
        var reMemberMe = localStorage.getItem("rememberMe")
        if (reMemberMe === "true")
            window.location.href = '/mainPage';
    }
    handleChange = (e) => {
        this.setState({ rememberMe: e.target.checked });
    }

    Login() {
        if (this.state.email !== null && this.state.email !== "") {
            if (this.state.password !== null && this.state.password !== "") {
                var data = JSON.stringify({
                    email: this.state.email,
                    password: this.state.password,
                    rememberMe: this.state.rememberMe,
                })
                fetch(variables.API_URL + 'User/search/user', {
                    method: 'POST',
                    headers: {
                        'Accept': 'application/json',
                        'Content-Type': 'application/json'
                    },
                    body: data
                })
                    .then(res => res.json())
                    .then((result) => {
                        if (this.state.rememberMe === true)
                            localStorage.setItem("rememberMe", "true")
                        else
                            localStorage.setItem("rememberMe", "false")
                        localStorage.setItem("token", `Email: ${this.state.email}, RememberMe: ${this.state.rememberMe}`)
                        if (result === true) {
                            const Toast = Swal.mixin({
                                toast: true,
                                position: 'top-end',
                                background: '#fffff',
                                showConfirmButton: false,
                                timer: 3000,
                                timerProgressBar: true,
                                didOpen: (toast) => {
                                    toast.addEventListener('mouseenter', Swal.stopTimer)
                                    toast.addEventListener('mouseleave', Swal.resumeTimer)
                                }
                            })

                            Toast.fire({
                                icon: 'success',
                                title: 'Welcome to Qam Soft Technologies'
                            })
                            window.location.href = '/mainPage';
                        } else {
                            Swal.fire({
                                icon: 'error',
                                title: 'Oops...',
                                text: 'Please Recheck Your Email and Password!',
                                toast: true
                            })
                        }
                        console.warn(result)
                    }, (error) => {
                        alert('Failed');
                    })
            } else alert('Please Enter Your Password');
        } else
            alert('Please Enter Your Email Address');
    }
    render() {
        const {
            email,
            password
        } = this.state
        return (
            <div lang="en">
                <React.Fragment>
                    <meta charSet="utf-8" />
                    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
                        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossOrigin="anonymous" />
                    <title>Login</title>
                </React.Fragment>
                <div>
                    <div className="container">
                        <div className="row">
                            <div className="col-lg-6">
                                <div className="login-left">
                                    <img src={ Logo } alt="" />
                                    <h3>Nice to see you again</h3>
                                    <h1>Welcome Back</h1>
                                    <div className="bar-login"></div>
                                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the
                                        industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and
                                        scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into
                                        electronic typesetting, remaining essentially unchanged.</p>
                                </div>
                            </div>
                            <div className="col-lg-6">
                                <div className="login-right">
                                    <h2>Login Account</h2>
                                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the
                                        industry's standard dummy text ever since the 1500s.</p>
                                    <div className='form'>

                                        <div className="form-group email-label">
                                            <input type="email" className="form-control" id="exampleInputEmail1"
                                                value={ email }
                                                onChange={ event => this.setState({ email: event.target.value }) }
                                                aria-describedby="emailHelp"
                                                placeholder="EMAIL ID" />
                                        </div>
                                        <div className="form-group pass-label">
                                            <input type="password" className="form-control" id="exampleInputPassword1"
                                                value={ password }
                                                onChange={ event => this.setState({ password: event.target.value }) }
                                                placeholder="PASSWORD" />
                                        </div>
                                        <div className="form-check">
                                            <input type="checkbox" onChange={ this.handleChange } className="form-check-input" id="exampleCheck1" />
                                            <label className="form-check-label"
                                                htmlFor="exampleCheck1">Keep Me Signed In</label>
                                        </div>
                                        <button type='button' onClick={ () => this.Login() } className="login-btn">Login</button>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
                        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
                        crossOrigin="anonymous"></script>
                    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
                        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
                        crossOrigin="anonymous"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
                        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
                        crossOrigin="anonymous"></script>
                </div>
            </div>
        )
    }
}


/* eslint-disable jsx-a11y/anchor-is-valid */
import React, { Component } from 'react'
import './contact.css';
import { variables } from 'Variables';
import Swal from 'sweetalert2';
export default class Contact extends Component {
    constructor (props) {
        super(props);
        this.state = {
            name: "",
            cell: "",
            email: "",
            comments: "",
            id: 0,
            isInValidName: false,
            //isInValidCell: false,
            isInValidEmail: false
        }
    }
    SubmitInquiry() {
        if (this.state.name !== null && this.state.name !== "") {
            if (this.state.email !== null && this.state.email !== "") {
                var data = JSON.stringify({
                    name: this.state.name,
                    cell: this.state.cell,
                    email: this.state.email,
                    comments: this.state.comments
                })
                fetch(variables.API_URL + 'Inquiry', {
                    method: 'POST',
                    headers: {
                        'Accept': 'application/json',
                        'Content-Type': 'application/json'
                    },
                    body: data
                })
                    .then(res => res.json())
                    .then((result) => {
                        this.setState({ name: "" });
                        this.setState({ email: "" });
                        this.setState({ cell: "" });
                        this.setState({ comments: "" });
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
                            title: 'Successfully Sent'
                        })
                    }, (error) => {
                        Swal.fire({
                            icon: 'error',
                            title: 'Oops...',
                            text: 'Error Occurred!',
                            toast: true
                        })
                        alert('Failed');
                    })

            } else
                alert('Plaese Enter Your Email');
        } else
            alert('Plaese Enter Your Name');
    }
    render() {
        const {
            name,
            cell,
            email,
            comments,
        } = this.state;
        return (
            <div lang='en'>
                <React.Fragment>
                    {/* <!-- Required meta tags --> */ }
                    <meta charSet="utf-8" />
                    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

                    {/* <!-- Bootstrap CSS --> */ }
                    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossOrigin="anonymous" />

                    <title>Contact</title>

                </React.Fragment>
                <div>

                    {/* <!-----------------------main---------------bg--> */ }

                    {/* <include src={ require("../header.html") }></include> */ }
                    <section id="main-contact-bg">
                    </section>

                    <section id="contact-bar">
                        <div className="container">
                            <div className="row">
                                <div className="col-lg-12">
                                    <div className="contact-bar">
                                        <h2>Contact</h2>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                    {/* <!-----------------------main----------------bg-->
                            <!-- Contact page--> */}

                    <div className="container contactUs">
                        <div className="row">
                            {/* <!-----FIRST HALF-----> */ }
                            <div className="col-lg-7">
                                <div className="contact-head">
                                    <h5>Contact Us</h5>
                                    <h1>Get In Touch With Us</h1>
                                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.</p>
                                </div>

                                <div className="row">
                                    <div className="col-lg-2">
                                        <div className="contact-icon">
                                            <i className="fa-solid fa-house"></i>
                                        </div>
                                    </div>
                                    <div className="col-lg-10">
                                        <div className="Location" ></div>
                                        <h3>Our Location</h3>
                                        <p>Lahore, Pakistan</p>

                                    </div>
                                </div>

                                <div className="row">
                                    <div className="col-lg-2">
                                        <div className="contact-icon">
                                            <i className="fa-solid fa-phone"></i>
                                        </div>
                                    </div>
                                    <div className="col-lg-10">
                                        <div className="Telephone"> </div>
                                        <h3>Telephone</h3>
                                        <a href="#">+92 000 111 000</a>

                                    </div>
                                </div>

                                <div className="row">
                                    <div className="col-lg-2">
                                        <div className="contact-icon">
                                            <i className="fa-solid fa-envelope"></i>
                                        </div>
                                    </div>
                                    <div className="col-lg-10">
                                        <h3>Email Address</h3>
                                        <p>demo@info.com</p>

                                    </div>
                                </div>


                            </div>

                            {/* <!-----first hallf-->
                                    <!------2nd half--> */}

                            <div className="col-lg-5">
                                <div className="contact-form">
                                    <form className='contactForm'>
                                        <div className="form-group">
                                            <input type="text" className="form-control"
                                                value={ name }
                                                onChange={ e => this.setState({ name: e.target.value }) }
                                                id="name" aria-describedby="emailHelp" placeholder="Your Name" />
                                        </div>
                                        <div className="form-group">
                                            <input type="email"
                                                value={ email }
                                                onChange={ e => this.setState({ email: e.target.value }) }
                                                className="form-control" id="email" placeholder="Your Email" />
                                        </div>
                                        <div className="form-group">
                                            <input type="phone number" value={ cell }
                                                onChange={ e => this.setState({ cell: e.target.value }) }
                                                className="form-control" id="cell" placeholder="Phone number" />
                                        </div>
                                        <div className="form-group">
                                            <textarea className="form-control" value={ comments }
                                                onChange={ e => this.setState({ comments: e.target.value }) }
                                                id="comments" rows={ 3 } placeholder="Your Message"></textarea>
                                        </div>
                                        <button type='button' onClick={ () => this.SubmitInquiry() } className="contact-btn">Send Message</button>
                                    </form>
                                </div>
                            </div>
                            {/* <!------2nd half--> */ }
                        </div>
                    </div>

                    {/* <!-- Contact page-->
                            <!-- Optional JavaScript -->
                            <!-- jQuery first, then Popper.js, then Bootstrap JS --> */}
                    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossOrigin="anonymous"></script>
                    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossOrigin="anonymous"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossOrigin="anonymous"></script>
                </div>
            </div>
        )
    }
}

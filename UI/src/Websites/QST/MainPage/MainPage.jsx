/* eslint-disable jsx-a11y/anchor-is-valid */
// @ts-nocheck
import HomeSVG from '../assets/images/main-home.svg'
import React, { Component } from 'react'
import './style.css'
export default class MainPage extends Component {
    render() {
        return (
            <div>
                <React.Fragment>
                    {/* <!-- Required meta tags --> */ }
                    <meta charSet="utf-8" />
                    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

                    {/* <!-- Bootstrap CSS --> */ }
                    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
                        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossOrigin="anonymous" />

                    <title>Courses</title>
                </React.Fragment>

                {/* <!----------main landing--> */ }

                <div>
                    <section id="main">
                        <div className="container">
                            <div className="row">
                                <div className="col-lg-8">
                                    <div className="main-data">
                                        <h1>Learn By Doing Code <br />
                                        </h1>
                                        <p>Learn live from Microsoft MVPs and Google GDEs to master in demand job skills.<br />
                                            Build real-world projects with recommended design patterns and best practices.<br />
                                            Empower yourself to crack your next job interviews at world top tech companies.</p>

                                        <button className="main-btn">Know More About Program</button>
                                    </div>

                                    <div className="row stats">

                                    </div>
                                </div>
                                <div className="col-lg-4">

                                    <div className="main-img">
                                        <img src={ HomeSVG } alt="" className="img-fluid" />
                                    </div>

                                    <div className="form-landing">

                                        <h3>Have any questions ?</h3>
                                        <div className="form-group">

                                            <input type="text" className="form-control" id="exampleInputEmail1" aria-describedby="emailHelp"
                                                placeholder="Full Name" />

                                        </div>
                                        <div className="form-group">

                                            <input type="email" className="form-control" id="exampleInputEmail1" aria-describedby="emailHelp"
                                                placeholder="Email ID" />

                                        </div>
                                        <div className="form-group">

                                            <input type="tel" className="form-control" id="exampleInputEmail1" aria-describedby="emailHelp"
                                                placeholder="Cell No" />

                                        </div>
                                        <div className="form-group">

                                            <textarea className="form-control" id="exampleFormControlTextarea1"
                                                rows="3"
                                                placeholder="Your Message"></textarea>
                                        </div>

                                        <button type="button" className="landing-form-btn">Send</button>

                                    </div>


                                </div>
                            </div>
                        </div>
                    </section>
                    {/* <!-----------MAIN LANDING-->

                                <!----------courses-------------------------> */}
                    <div className="container">
                        <div className="row">
                            <div className="col-lg-12">
                                <div className="courses-data">
                                    <h3>Unlimited Live Training</h3>
                                    <p>Get intensive hands-on live training on .NET, JavaScript, Mobile Apps, Cloud, DevOps, Docker, Front-end
                                        technologies and many more cutting edge technologies.</p>
                                </div>
                            </div>
                        </div>
                        <div className="row courses-row-1">
                            <div className="col-lg-4">
                                <div className="angular">
                                    {/* <!---course------> */ }
                                    <div className="card">
                                        <img src={ require("../assets/images/python.png") } className="card-img-top img-fluid" alt="..." />
                                        <div className="card-body">
                                            <h5 className="card-title">Python</h5>
                                            <p className="card-text">04 Courses<br />10 Skills</p>
                                            <a href="#" className="btn btn-primary">Enroll Now</a>
                                        </div>
                                    </div>
                                    {/* <!---course------> */ }
                                </div>
                            </div>
                            <div className="col-lg-4">
                                <div className="angular">
                                    {/* <!---course------> */ }
                                    <div className="card">
                                        <img src={ require("../assets/images/React1.png") } className="card-img-top img-fluid" alt="..." />
                                        <div className="card-body">
                                            <h5 className="card-title">React</h5>
                                            <p className="card-text">04 Courses<br />10 Skills</p>
                                            <a href="#" className="btn btn-primary">Enroll Now</a>
                                        </div>
                                    </div>
                                    {/* <!---course------> */ }
                                </div>
                            </div>
                            <div className="col-lg-4">
                                <div className="angular">
                                    {/* <!---course------> */ }
                                    <div className="card">
                                        <img src={ require("../assets/images/Jquery.jpg") } className="card-img-top img-fluid" alt="..." />
                                        <div className="card-body">
                                            <h5 className="card-title">Jquery</h5>
                                            <p className="card-text">04 Courses<br />10 Skills</p>
                                            <a href="#" className="btn btn-primary">Enroll Now</a>
                                        </div>
                                    </div>
                                    {/* <!---course------> */ }
                                </div>
                            </div>
                        </div>
                    </div>
                    {/* <!----------courses------------------------->


                                <!----------courses----- 2--------------------> */}
                    <div className="container">

                        <div className="row courses-row-2">
                            <div className="col-lg-4">
                                <div className="angular">
                                    {/* <!---course------> */ }
                                    <div className="card">
                                        <img src={ require("../assets/images/JavaScript.png") } className="card-img-top img-fluid" alt="..." />
                                        <div className="card-body">
                                            <h5 className="card-title">JavaScript</h5>
                                            <p className="card-text">04 Courses<br />10 Skills</p>
                                            <a href="#" className="btn btn-primary">Enroll Now</a>
                                        </div>
                                    </div>
                                    {/* <!---course------> */ }
                                </div>
                            </div>
                            <div className="col-lg-4">
                                <div className="angular">
                                    {/* <!---course------> */ }
                                    <div className="card">
                                        <img src={ require("../assets/images/Arbuino.png") } className="card-img-top img-fluid" alt="..." />
                                        <div className="card-body">
                                            <h5 className="card-title">Arbuino</h5>
                                            <p className="card-text">04 Courses<br />10 Skills</p>
                                            <a href="#" className="btn btn-primary">Enroll Now</a>
                                        </div>
                                    </div>
                                    {/* <!---course------> */ }
                                </div>
                            </div>
                            <div className="col-lg-4">
                                <div className="angular">
                                    {/* <!---course------> */ }
                                    <div className="card">
                                        <img src={ require("../assets/images/Photoshop.png") } className="card-img-top img-fluid" alt="..." />
                                        <div className="card-body">
                                            <h5 className="card-title">Photoshop</h5>
                                            <p className="card-text">04 Courses<br />10 Skills</p>
                                            <a href="#" className="btn btn-primary">Enroll Now</a>
                                        </div>
                                    </div>
                                    {/* <!---course------> */ }
                                </div>
                            </div>
                        </div>
                        <div className="row">
                            <div className="col-lg-12">
                                <div className="courses-btn">
                                    <button className="courses-main-btn">Explore All</button>
                                </div>
                            </div>
                        </div>
                    </div>

                    {/* <!----------courses-----2-------------------->
                                <!-----------services-----------------------> */}
                    <section id="services">
                        <div className="container">
                            <div className="row">
                                <div className="col-lg-12">
                                    <div className="ser-heading">
                                        <h1>QamSoft Services For Business</h1>
                                    </div>
                                </div>
                            </div>

                            <div className="row service-row">
                                {/* <!-------SINGLE service--> */ }
                                <div className="col-lg-4">
                                    <div className="card">
                                        <img src={ require("../assets/images/corporate.jpg") } className="card-img-top img-fluid" alt="..." />
                                        <div className="card-body">
                                            <h5 className="card-title">Corporate Training</h5>
                                            <p className="card-text">Some quick example text to build on the card title and make up the bulk of the card's
                                                content.</p>
                                            <a href="#" className="btn btn-primary">Read More</a>
                                        </div>
                                    </div>
                                </div>
                                {/* <!----------single service end here-->
                                            <!-------SINGLE service--> */}
                                <div className="col-lg-4">
                                    <div className="card">
                                        <img src={ require("../assets/images/software.jpg") } className="card-img-top img-fluid" alt="..." />
                                        <div className="card-body">
                                            <h5 className="card-title">Software Consulting</h5>
                                            <p className="card-text">Some quick example text to build on the card title and make up the bulk of the card's
                                                content.</p>
                                            <a href="#" className="btn btn-primary">Read More</a>
                                        </div>
                                    </div>
                                </div>
                                {/* <!----------single service end here-->
                                            <!-------SINGLE service--> */}
                                <div className="col-lg-4">
                                    <div className="card">
                                        <img src={ require("../assets/images/corporate.jpg") } className="card-img-top img-fluid" alt="..." />
                                        <div className="card-body">
                                            <h5 className="card-title">Technical Recruiting</h5>
                                            <p className="card-text">Some quick example text to build on the card title and make up the bulk of the card's
                                                content.</p>
                                            <a href="#" className="btn btn-primary">Read More</a>
                                        </div>
                                    </div>
                                </div>
                                {/* <!----------single service end here--> */ }
                            </div>
                        </div>
                    </section>
                    {/* <!-----------services------------------------>
                                <!------------BOOKS-------------------------> */}
                    <div className="container">
                        <div className="row">
                            <div className="col-lg-12">
                                <div className="books-head">
                                    <h3>Interview Q&A eBooks</h3>
                                    <p>Looking for a job change, but don't have confidence to face the interview. Be prepare yourself for your
                                        next job interview in a short time by referring our eBooks.</p>
                                </div>
                            </div>
                        </div>

                        <div className="row books-row">

                            {/* <!----------single-books-----------------> */ }
                            <div className="col-lg-4">
                                <div className="card mb-3">
                                    <div className="row no-gutters">
                                        <div className="col-md-4">
                                            <img src={ require("../assets/images/course1.png") } className="card-img" alt="..." />
                                        </div>
                                        <div className="col-md-8">
                                            <div className="card-body">
                                                <h5 className="card-title">Card title</h5>
                                                <p className="card-text">This is a wider card with supporting text below as a natural lead-in to additional
                                                    content. This content is a little bit longer.</p>
                                                <p className="card-text"><small className="text-muted">Last updated 3 mins ago</small></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            {/* <!-----------single books----------------->
                                        <!----------single-books-----------------> */}
                            <div className="col-lg-4">
                                <div className="card mb-3">
                                    <div className="row no-gutters">
                                        <div className="col-md-4">
                                            <img src={ require("../assets/images/course1.png") } className="card-img" alt="..." />
                                        </div>
                                        <div className="col-md-8">
                                            <div className="card-body">
                                                <h5 className="card-title">Card title</h5>
                                                <p className="card-text">This is a wider card with supporting text below as a natural lead-in to additional
                                                    content. This content is a little bit longer.</p>
                                                <p className="card-text"><small className="text-muted">Last updated 3 mins ago</small></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            {/* <!-----------single books----------------->

                                        <!----------single-books-----------------> */}
                            <div className="col-lg-4">
                                <div className="card mb-3">
                                    <div className="row no-gutters">
                                        <div className="col-md-4">
                                            <img src={ require("../assets/images/course1.png") } className="card-img" alt="..." />
                                        </div>
                                        <div className="col-md-8">
                                            <div className="card-body">
                                                <h5 className="card-title">Card title</h5>
                                                <p className="card-text">This is a wider card with supporting text below as a natural lead-in to additional
                                                    content. This content is a little bit longer.</p>
                                                <p className="card-text"><small className="text-muted">Last updated 3 mins ago</small></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            {/* <!-----------single books-----------------> */ }

                        </div>
                        <div className="row">
                            <div className="col-lg-12">
                                <div className="book-btn">
                                    <button className="book-btn-main">Explore All</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    {/* <!-------------BOOKS------------------------> */ }




                    {/* <!-- Optional JavaScript -->
                                <!-- jQuery first, then Popper.js, then Bootstrap JS --> */}
                    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
                        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
                        crossOrigin="anonymous"></script>
                    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js"
                        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
                        crossOrigin="anonymous"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js"
                        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
                        crossOrigin="anonymous"></script>
                </div>
            </div>
        )
    }
}

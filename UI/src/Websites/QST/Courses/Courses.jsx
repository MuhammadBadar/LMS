// @ts-nocheck
/* eslint-disable jsx-a11y/anchor-is-valid */
import React, { Component } from 'react'
import './courses.css';
import { variables } from 'Variables';
//import Angular from '../assets/images/angular1.png'
export default class Courses extends Component {
    constructor (props) {
        super(props);
        this.state = {
            courses: [],
        }
    }
    componentDidMount() {
        this.courseList()
    }
    courseList() {
        fetch(variables.API_URL + 'Course')
            .then(response => response.json())
            .then(data => {
                this.setState({ courses: data });
            });
    }
    render() {
        const {
            courses
        } = this.state;
        return (
            <div>
                <React.Fragment>
                    {/* <!-- Required meta tags --> */ }
                    <meta charSet="utf-8" />
                    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

                    {/* <!-- Bootstrap CSS --> */ }
                    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossOrigin="anonymous" />
                    <title>Courses</title>
                </React.Fragment>
                <div>

                    {/* <!-----banner--> */ }
                    <section id="banner-bg">
                        <div className="seciton-bg"></div>
                    </section>
                    {/* <!-----Baner--->
                            <!------bar-----> */}
                    <section id="bar">
                        <div className="container">
                            <div className="row">
                                <div className="col-lg-12">
                                    <div className="bar-courses">
                                        <h2>Courses</h2>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                    {/* <!------bar------>
                            <!------courses---------------> */}
                    <section id="main-courses">
                        {/* <div className="container">
                            <div className="row courses-row">
                                <div className="col-lg-4">
                                    <div className="card">
                                        <img className="card-img-top" src={ Angular } alt="Card  cap" />
                                        <div className="card-body">
                                            <h4>299$</h4>
                                            <h5 className="card-title">Angular</h5>
                                            <p className="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                            <a href="#" className="btn btn-primary">Register Now</a>
                                        </div>
                                    </div>
                                </div>
                                <div className="col-lg-4">
                                    <div className="card">
                                        <img className="card-img-top" src={ require('../assets/images/angular1.png') } alt="Card  cap" />
                                        <div className="card-body">
                                            <h4>299$</h4>
                                            <h5 className="card-title">Node</h5>

                                            <p className="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                            <a href="#" className="btn btn-primary">Register Now</a>
                                        </div>
                                    </div>
                                </div>
                                <div className="col-lg-4">
                                    <div className="card">
                                        <img className="card-img-top" src={ require("../assets/images/React1.png") } alt="Card  cap" />
                                        <div className="card-body">
                                            <h4>299$</h4>
                                            <h5 className="card-title">React</h5>
                                            <p className="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                            <a href="#" className="btn btn-primary">Register Now</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div> */}
                        <div className="container">
                            <div className="row courses-row">
                                {
                                    courses.map(val => {
                                        return (
                                            <div className="col-lg-4" key={ val.id }>
                                                <div className="card" >
                                                    <img className="card-img-top" src={ val.logoBase64Path } alt="Card  cap" />
                                                    <div className="card-body" >
                                                        <h4>{ val.fee }$</h4>
                                                        <h5 className="card-title">{ val.title }</h5>
                                                        <p className="card-text">{ val.shortDescription }</p>
                                                        <a href="#" className="btn btn-primary">Register Now</a>
                                                    </div>
                                                </div>
                                            </div>

                                        )
                                    })
                                }
                            </div>
                        </div>
                        {/* <!------courses---row-1------------->


                                <!----------course    row-2--> */}
                        {/* <div className="container">
                            <div className="row courses-row">
                                <div className="col-lg-4">
                                    <div className="card">
                                        <img className="card-img-top" src={ require("../assets/images/python.png") } alt="Card  cap" />
                                        <div className="card-body">
                                            <h4>299$</h4>
                                            <h5 className="card-title">Python</h5>
                                            <p className="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                            <a href="#" className="btn btn-primary">Register Now</a>
                                        </div>
                                    </div>
                                </div>
                                <div className="col-lg-4">
                                    <div className="card">
                                        <img className="card-img-top" src={ require("../assets/images/TypeScript.png") } alt="Card  cap" />
                                        <div className="card-body">
                                            <h4>299$</h4>
                                            <h5 className="card-title">TypeScript</h5>
                                            <p className="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                            <a href="#" className="btn btn-primary">Register Now</a>
                                        </div>
                                    </div>
                                </div>
                                <div className="col-lg-4">
                                    <div className="card">
                                        <img className="card-img-top" src={ require("../assets/images/Dart.png") } alt="Card  cap" />
                                        <div className="card-body">
                                            <h4>299$</h4>
                                            <h5 className="card-title">Dart</h5>
                                            <p className="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                            <a href="#" className="btn btn-primary">Register Now</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div> */}
                        {/* <!----------course    row-2-->
                                <!-----------course- row3--> */}
                        {/* <div className="container">
                            <div className="row courses-row">
                                <div className="col-lg-4">
                                    <div className="card">
                                        <img className="card-img-top" src="./assets/images/Android.png" alt="Card  cap" />
                                        <div className="card-body">
                                            <h4>299$</h4>
                                            <h5 className="card-title">Andriod</h5>
                                            <p className="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                            <a href="#" className="btn btn-primary">Register Now</a>
                                        </div>
                                    </div>
                                </div>
                                <div className="col-lg-4">
                                    <div className="card">
                                        <img className="card-img-top" src="./assets/images/IOS.png" alt="Card  cap" />
                                        <div className="card-body">
                                            <h4>299$</h4>
                                            <h5 className="card-title">IOS</h5>
                                            <p className="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                            <a href="#" className="btn btn-primary">Register Now</a>
                                        </div>
                                    </div>
                                </div>
                                <div className="col-lg-4">
                                    <div className="card">
                                        <img className="card-img-top" src="./assets/images/JavaScript.png" alt="Card  cap" />
                                        <div className="card-body">
                                            <h4>299$</h4>
                                            <h5 className="card-title">JavaScript</h5>
                                            <p className="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                            <a href="#" className="btn btn-primary">Register Now</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div> */}
                        {/* <!-----     course-row3-->


                                <!-----------course- row4--> */}
                        {/* <div className="container">
                            <div className="row courses-row">
                                <div className="col-lg-4">
                                    <div className="card">
                                        <img className="card-img-top" src="./assets/images/Jquery.png" alt="Card  cap" />
                                        <div className="card-body">
                                            <h4>299$</h4>
                                            <h5 className="card-title">JQuery</h5>
                                            <p className="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                            <a href="#" className="btn btn-primary">Register Now</a>
                                        </div>
                                    </div>
                                </div>
                                <div className="col-lg-4">
                                    <div className="card">
                                        <img className="card-img-top" src="./assets/images/MySQL.png" alt="Card  cap" />
                                        <div className="card-body">
                                            <h4>299$</h4>
                                            <h5 className="card-title">MySQL</h5>
                                            <p className="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                            <a href="#" className="btn btn-primary">Register Now</a>
                                        </div>
                                    </div>
                                </div>
                                <div className="col-lg-4">
                                    <div className="card">
                                        <img className="card-img-top" src="./assets/images/angular1.png" alt="Card  cap" />
                                        <div className="card-body">
                                            <h4>299$</h4>
                                            <h5 className="card-title">SQL Server</h5>
                                            <p className="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                            <a href="#" className="btn btn-primary">Register Now</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div> */}
                        {/* <!-----     course-row4-->


                                <!-----------course- row5--> */}
                        {/* <div className="container">
                            <div className="row courses-row">
                                <div className="col-lg-4">
                                    <div className="card">
                                        <img className="card-img-top" src="./assets/images/Arbuino.png" alt="Card  cap" />
                                        <div className="card-body">
                                            <h4>299$</h4>
                                            <h5 className="card-title">Arbuino</h5>
                                            <p className="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                            <a href="#" className="btn btn-primary">Register Now</a>
                                        </div>
                                    </div>
                                </div>
                                <div className="col-lg-4">
                                    <div className="card">
                                        <img className="card-img-top" src="./assets/images/angular1.png" alt="Card  cap" />
                                        <div className="card-body">
                                            <h4>299$</h4>
                                            <h5 className="card-title">Odoo</h5>
                                            <p className="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                            <a href="#" className="btn btn-primary">Register Now</a>
                                        </div>
                                    </div>
                                </div>
                                <div className="col-lg-4">
                                    <div className="card">
                                        <img className="card-img-top" src="./assets/images/angular1.png" alt="Card  cap" />
                                        <div className="card-body">
                                            <h4>299$</h4>
                                            <h5 className="card-title">Flutter</h5>
                                            <p className="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                            <a href="#" className="btn btn-primary">Register Now</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div> */}
                        {/* <!-----     course-row5-->


                                <!-----------course- row6--> */}
                        {/* <div className="container">
                            <div className="row courses-row">
                                <div className="col-lg-4">
                                    <div className="card">
                                        <img className="card-img-top" src="./assets/images/angular1.png" alt="Card  cap" />
                                        <div className="card-body">
                                            <h4>299$</h4>
                                            <h5 className="card-title">C Sharp</h5>
                                            <p className="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                            <a href="#" className="btn btn-primary">Register Now</a>
                                        </div>
                                    </div>
                                </div>
                                <div className="col-lg-4">
                                    <div className="card">
                                        <img className="card-img-top" src="./assets/images/angular1.png" alt="Card  cap" />
                                        <div className="card-body">
                                            <h4>299$</h4>
                                            <h5 className="card-title">Illustrator</h5>
                                            <p className="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                            <a href="#" className="btn btn-primary">Register Now</a>
                                        </div>
                                    </div>
                                </div>
                                <div className="col-lg-4">
                                    <div className="card">
                                        <img className="card-img-top" src="./assets/images/Photoshop.png" alt="Card  cap" />
                                        <div className="card-body">
                                            <h4>299$</h4>
                                            <h5 className="card-title">Photoshop</h5>
                                            <p className="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                            <a href="#" className="btn btn-primary">Register Now</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div> */}
                    </section>
                    {/* <!-----     course-row6-->
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

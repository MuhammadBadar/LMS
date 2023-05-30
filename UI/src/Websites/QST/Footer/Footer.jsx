/* eslint-disable jsx-a11y/anchor-is-valid */
// @ts-nocheck
/* eslint-disable jsx-a11y/alt-text */
import React, { Component } from 'react'
import './footer.css'
export default class Footer extends Component {
    render() {
        return (
            <div>
                <React.Fragment>
                    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

                    {/* <!-- Bootstrap CSS --> */ }
                    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
                        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossOrigin="anonymous" />

                </React.Fragment>
                {/* <!------------footer----------------------> */ }

                <section id="footer">
                    <div className="container">
                        <div className="row">
                            <div className="col-lg-3">
                                <div className="footer-logo">
                                    <img src={ require('../assets/images/main-logo.png') } className="img-fluid" />
                                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the
                                        industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and
                                        scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into
                                        electronic typesetting, remaining essentially unchanged.</p>
                                </div>
                            </div>
                            <div className="col-lg-3">
                                <div className="main-nav">
                                    <ul className="nav flex-column">
                                        <li className="nav-item">
                                            <a className="nav-link active Link" href="#">Active</a>
                                        </li>
                                        <li className="nav-item">
                                            <a className="nav-link Link" href="#">Link</a>
                                        </li>
                                        <li className="nav-item">
                                            <a className="nav-link Link" href="#">Link</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div className="col-lg-3">
                                <div className="quick-links">
                                    <ul className="nav flex-column">
                                        <li className="nav-item">
                                            <a className="nav-link active Link" href="#">Active</a>
                                        </li>
                                        <li className="nav-item">
                                            <a className="nav-link Link" href="#">Link</a>
                                        </li>
                                        <li className="nav-item">
                                            <a className="nav-link Link" href="#">Link</a>
                                        </li>
                                        <li className="nav-item">
                                            <a className="nav-link disabled Link" href="#">Disabled</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div className="col-lg-3">
                                <div className="form-footer">
                                    <form>
                                        <div className="form-group">
                                            <input type="email" className="form-control" id="exampleInputEmail1" aria-describedby="emailHelp"
                                                placeholder="Enter email" />
                                        </div>
                                        <div className="form-group">
                                            <input type="password" className="form-control" id="exampleInputPassword1" placeholder="Password" />
                                        </div>

                                        <button type="submit" className="btn btn-primary">Subscribe</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        )
    }
}

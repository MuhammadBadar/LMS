/* eslint-disable no-unused-vars */
// @ts-nocheck
/* eslint-disable jsx-a11y/anchor-is-valid */
import Button from 'react-bootstrap/Button';
import Container from 'react-bootstrap/Container';
import Form from 'react-bootstrap/Form';
import Nav from 'react-bootstrap/Nav';
import Navbar from 'react-bootstrap/Navbar';
import NavDropdown from 'react-bootstrap/NavDropdown';
import Offcanvas from 'react-bootstrap/Offcanvas';
import React, { Component } from 'react'
import { RxComponent1 } from "react-icons/rx";
import { Link } from "react-router-dom";
import './header.css';
import { Tooltip } from 'react-tooltip'
import { useNavigate } from "react-router-dom";
const Header = () => {
    const Logout = () => {
        localStorage.removeItem("token")
        localStorage.removeItem("rememberMe")
        window.location.href = "/"
    }
    return (
        <div>
            <React.Fragment>
                {/* <!-- Required meta tags --> */ }
                <meta charSet="utf-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

                {/* <!-- Bootstrap CSS --> */ }
                <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
                    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossOrigin="anonymous" />
                <title>Project</title>
            </React.Fragment>
            <div>
                {/* <!----------navbar--> */ }
                <section id="navbar">
                    <div className="container-fluid">
                        <nav className="navbar navbar-expand-lg" >
                            <Tooltip id="my-tooltip" />
                            {/* <button type="button" className='backOfficeBtn' aria-label="Left Align">
                                    <RxComponent1 className='backOfficeIcon' data-tooltip-id="my-tooltip"
                                        data-tooltip-content="Back Office"
                                        data-tooltip-place="top">

                                    </RxComponent1>
                                </button> */}

                            <Link className="navbar-brand" to="/">
                                <img
                                    src={ require('../assets/images/main-logo.png') } alt="logo">
                                </img>
                            </Link>
                            <button className="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                                <span className="navbar-toggler-icon"></span>
                            </button>
                            <div className="collapse navbar-collapse" nav-item={ true.toString() } id="navbarSupportedContent">

                                <ul className="navbar-nav mr-auto">

                                    <li className="nav-item list-unstyled">
                                        {/* <a className="nav-link" href=''>Courses</a> */ }
                                        <Link to="/course" className="nav-link upLink">Course</Link>
                                    </li>

                                    <li className="nav-item">
                                        <Link to="/schedule" className="nav-link upLink">Schedule</Link>
                                        {/* <a className="nav-link" href="">Schedule</a> */ }
                                    </li>

                                    <li className="nav-item">
                                        <Link to="/singleCourse" className="nav-link upLink">Single Course</Link>
                                        {/* <a className="nav-link" href="">Single
                                                Course</a> */}
                                    </li>
                                    <li className="nav-item">
                                        <Link to="/contact" className="nav-link upLink">Contact</Link>
                                        {/* <a className="nav-link" href="">Contact</a> */ }
                                    </li>


                                    <button className="btn btn-outline-success my-2 my-sm-0" type="submit">+92 323 4027206</button>
                                    <img src="" alt="" className="img-fluid" />

                                </ul>

                            </div>
                            <NavDropdown
                                id="nav-dropdown-dark-example"
                                title={ <RxComponent1 className='header-drop-down backOfficeIcon' data-tooltip-id="my-tooltip"
                                    data-tooltip-content="Back Office"
                                    data-tooltip-place="top">

                                </RxComponent1> }
                                menuVariant="dark"
                            >
                                <Link to="/mngUser" className='dropDownItem'>
                                    Manage User
                                </Link>
                                <NavDropdown.Divider />
                                <Link to="/mngInquiry" className='dropDownItem'>
                                    Manage Inquiry
                                </Link>
                                <Link onClick={ () => Logout() } className='dropDownItem logoutItem'>
                                    <p id="logBtn">LogOut</p>
                                </Link>
                            </NavDropdown>
                        </nav>
                    </div>
                </section>
            </div>
        </div>
    )
}

export default Header


/* eslint-disable no-unused-vars */
import { variables } from 'Variables';
import React, { Component } from 'react'
import { Col, Row } from 'react-bootstrap';
import './User.css';
import Form from 'react-bootstrap/Form';
import Button from 'react-bootstrap/Button';
import InputGroup from 'react-bootstrap/InputGroup';
import Swal from 'sweetalert2';
export default class ManageUser extends Component {
    constructor (props) {
        super(props);
        this.state = {
            users: [],
            id: 0,
            email: "",
            password: "",
            isInvalidEmail: false,
            isInvalidPassword: false
        }
    }
    reset() {
        this.setState({
            id: 0,
            email: "",
            password: "",
        })
    }
    componentDidMount() {
        this.setState()
        this.userList()
    }
    changeEmail = (e) => {
        this.setState({ email: e.target.value });
        if (e.target.value === "")
            this.setState({ isInvalidEmail: true });
        else
            this.setState({ isInvalidEmail: false });
    }
    changePassword = (e) => {
        this.setState({ password: e.target.value });
        if (e.target.value === "")
            this.setState({ isInvalidPassword: true });
        else
            this.setState({ isInvalidPassword: false });
    }
    userList() {
        fetch(variables.API_URL + "User")
            .then(response => response.json())
            .then(data => {
                this.setState({ users: data });
            });
    }
    submit() {
        if (this.state.email === "")
            this.setState({ isInvalidEmail: true });
        if (this.state.password === "")
            this.setState({ isInvalidPassword: true });

        if (this.state.email === "" || this.state.password === "") {
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: 'Please fill all required fields',
                toast: true
            })
        }
        else {
            var user = JSON.stringify({
                id: this.state.id,
                email: this.state.email,
                password: this.state.password,
            })
            this.state.id === 0 ? (fetch(variables.API_URL + "User", {
                method: 'POST',
                headers: {
                    'Accept': 'application/json',
                    'Content-Type': 'application/json'
                },
                body: user
            })
                .then((result) => {
                    this.userList();
                    this.reset()

                    console.warn(this.state.isInvalidEmail)
                    console.warn(this.state.isInvalidPassword)
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
                        title: 'Successfully Added'
                    })
                }, (error) => {
                    console.warn(error)
                    alert('Failed');
                })) : (fetch(variables.API_URL + "User", {
                    method: 'PUT',
                    headers: {
                        'Accept': 'application/json',
                        'Content-Type': 'application/json'
                    },
                    body: user
                })
                    .then((result) => {
                        this.userList();
                        this.reset()
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
                            title: 'Successfully Updated'
                        })
                    }, (error) => {
                        console.warn(error)
                        alert('Failed');
                    }))
        }

        console.warn(this.state.isInvalidEmail)
        console.warn(this.state.isInvalidPassword)
    }
    editUser(user) {
        this.setState({
            modalTitle: "Update user",
            id: user.id,
            email: user.email,
            password: user.password
        });
    }
    deleteUser(id) {
        if (window.confirm('Are you sure?')) {
            fetch(variables.API_URL + "User/" + id, {
                method: 'DELETE',
                headers: {
                    'Accept': 'application/json',
                    'Content-Type': 'application/json'
                }
            }).then((res) => {

                console.warn(res)
            }).then((result) => {
                console.warn(result)
                alert("Successfully Deleted");
                this.userList();
            }, (error) => {
                alert('Failed');
            })
        }
    }
    render() {
        const {
            id,
            users,
            password,
            email,
            isInvalidEmail,
            isInvalidPassword
        } = this.state;
        return (
            <div className='mainContainer '>
                { id === 0 ?
                    <h1 className=' text-center m-5 uheading'>Manage User</h1>
                    : <h1 className=' text-center m-5 uHeading'>Update User</h1> }
                <Form noValidate validated={ false } className='mx-auto col-10 col-md-8 col-lg-6 formBody'>
                    <Form.Group as={ Row } className="mb-3" controlId="formBasicEmail">
                        <Form.Label column sm="2" >Email </Form.Label>
                        <Col sm="10">
                            <Form.Control type="email" size="lg" placeholder="Enter email" required isInvalid={ isInvalidEmail }
                                value={ email }
                                onChange={ this.changeEmail }
                            />
                        </Col>
                    </Form.Group>
                    <Form.Group as={ Row } className="mb-3" controlId="formPlaintextPassword">
                        <Form.Label column sm="2">
                            Password
                        </Form.Label>
                        <Col sm="10">
                            <Form.Control type="password" size="lg" placeholder="Password" required isInvalid={ isInvalidPassword }
                                value={ password }
                                onChange={ this.changePassword }
                            />
                        </Col>
                    </Form.Group>
                    <Row className='d-flex justify-content-center p-1'>  { id === 0 ?
                        <Button type="button"
                            className=" uSubmitBtn "
                            onClick={ () => this.submit() }
                        >Submit
                        </Button>
                        : <Button type="button"
                            className="  uSubmitBtn "
                            onClick={ () => this.submit() }
                        >Update
                        </Button> }
                        <Button style={ {
                            background: " #363535", color: "white",
                            marginTop: "30px",
                            marginBottom: "30px",
                            marginLeft: "10px",
                            border: "none",
                            width: "120px",
                            textAlign: "center",
                            justifyContent: "center"
                        } } onClick={ () => this.reset() } >Reset</Button></Row>
                </Form>
                <div className='mx-auto col-10 col-md-8 col-lg-6 tableWraper '>
                    <table className="table table-striped userTable">
                        <thead id='tableHead'>
                            <tr>
                                {/* <th className='head'>
                                    useruiry Id
                                </th> */}
                                <th className='head otherCol'>
                                    Email
                                </th>
                                <th className='head otherCol'>
                                    Password
                                </th>
                                <th className='head actions userActionLabel'>
                                    Actions
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            { users.map(user =>
                                <tr
                                    key={ user.id }
                                >
                                    {/* <td>{ user.id }</td> */ }
                                    <td className='otherCol'>{ user.email }</td>
                                    <td className='otherCol'>{ user.password }</td>
                                    <td className='actions actionBtnCol'>
                                        <button type="button"
                                            className="btn btn-light mr-1 actionBtn"

                                            onClick={ () => this.editUser(user) }>
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" className="bi bi-pencil-square" viewBox="0 0 16 16">
                                                <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
                                                <path fillRule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z" />
                                            </svg>
                                        </button>
                                        <button type="button"
                                            className="btn btn-light mr-1 actionBtn"
                                            onClick={ () => this.deleteUser(user.id) }>
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" className="bi bi-trash-fill" viewBox="0 0 16 16">
                                                <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z" />
                                            </svg>
                                        </button>
                                    </td>
                                </tr>
                            ) }
                        </tbody>
                    </table>
                </div>
                <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossOrigin="anonymous"></script>
                <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossOrigin="anonymous"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossOrigin="anonymous"></script>

            </div>

        )
    }
}





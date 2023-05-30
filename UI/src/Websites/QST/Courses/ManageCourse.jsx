
import { variables } from 'Variables';
import React, { useEffect, useState } from 'react'
import { Col, Row } from 'react-bootstrap';
//import './User.css';
import Form from 'react-bootstrap/Form';
import Button from 'react-bootstrap/Button';

import Swal from 'sweetalert2';

const ManageCourse = () => {
    useEffect(() => {
        userList()
    }, []);
    const [user, setUser] = useState({
        email: "",
        password: "",
        id: 0,
    });
    const [isInvalidEmail, inValidEmail] = useState(false);
    const [isInvalidPassword, inValidPassword] = useState(false);
    const [users, Users] = useState([]);
    const userList = () => {
        fetch(variables.API_URL + "User")
            .then(response => response.json())
            .then(data => {
                Users(data)
            });
    }
    const reset = () => {
        setUser(previousState => {
            return { ...previousState, email: "", password: "", id: 0 }
        });

    }
    const submit = () => {
        debugger

        if (user.email === "")
            inValidEmail(true)
        if (user.password === "")
            inValidPassword(true);
        if (user.email === "" || user.password === "") {
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: 'Please fill all required fields',
                toast: true
            })
        }
        else {
            var _user = JSON.stringify({
                id: user.id,
                email: user.email,
                password: user.password,
            })
            user.id === 0 ? (fetch(variables.API_URL + "User", {
                method: 'POST',
                headers: {
                    'Accept': 'application/json',
                    'Content-Type': 'application/json'
                },
                body: _user
            })
                .then((result) => {
                    userList();
                    reset()
                    alert("Successfully Added")
                }, (error) => {
                    console.warn(error)
                    alert('Failed');
                })) : (fetch(variables.API_URL + "User", {
                    method: 'PUT',
                    headers: {
                        'Accept': 'application/json',
                        'Content-Type': 'application/json'
                    },
                    body: _user
                })
                    .then((result) => {
                        userList();
                        reset()
                        alert("Successfully Updated")
                    }, (error) => {
                        console.warn(error)
                        alert('Failed');
                    }))
        }
    }
    const editUser = (user) => {
        setUser(user)
    }
    const deleteUser = (id) => {
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
                userList();
            }, (error) => {
                alert('Failed');
            })
        }
    }
    const handleChange = (e) =>
        setUser(prevState => ({ ...prevState, [e.target.name]: e.target.value }))
    return (
        <div><React.Fragment>
            {/* <!-- Required meta tags --> */ }
            <meta charSet="utf-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

            {/* <!-- Bootstrap CSS --> */ }
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossOrigin="anonymous" />

            <title>Contact</title>

        </React.Fragment> <div >
                { user.id === 0 ?
                    <h1 className='heading'>Manage User</h1>
                    : <h1 className='heading'>Update User</h1> }
                <Form noValidate validated={ false }>
                    <Form.Group as={ Row } className="mb-3" controlId="formBasicEmail">
                        <Form.Label column sm="1">Email </Form.Label>
                        <Col sm="11">
                            <Form.Control type="email" size="lg" name="email" placeholder="Enter email" required
                                value={ user.email }
                                isInvalid={ isInvalidEmail }
                                onChange={ handleChange }
                            />
                        </Col>
                    </Form.Group>
                    <Form.Group as={ Row } className="mb-3" controlId="formPlaintextPassword">
                        <Form.Label column sm="1">
                            Password
                        </Form.Label>
                        <Col sm="11">
                            <Form.Control type="password" size="lg" name="password" placeholder="Password" required
                                value={ user.password }
                                isInvalid={ isInvalidPassword }
                                onChange={ handleChange }
                            />
                        </Col>
                    </Form.Group>
                    <Row>  { user.id === 0 ?
                        <Button type="button"
                            className="btn submitBtn "
                            onClick={ () => submit() }
                        >Submit</Button>
                        : <Button type="button"
                            className="btn  submitBtn "
                            onClick={ () => submit() }
                        >Update</Button> }
                        <Button className="btn reSetBtn " onClick={ () => reset() } >Reset</Button></Row>
                </Form>
                <h1 className='heading'>User List</h1>
                <Row className='body'>
                    <div className='tableWraper'> <table className="table table-striped">
                        <thead className='tableHead'>
                            <tr>
                                {/* <th className='head'>
                                    useruiry Id
                                </th> */}
                                <th className='head '>
                                    Email
                                </th>
                                <th className='head'>
                                    Passowrd
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            { users.map(user =>
                                <tr
                                    key={ user.id }
                                >
                                    {/* <td>{ user.id }</td> */ }
                                    <td>{ user.email }</td>
                                    <td>{ user.password }</td>

                                    <td className='actions actionBtnCol'>
                                        <button type="button"
                                            className="btn btn-light mr-1 actionBtn"

                                            onClick={ () => editUser(user) }>
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" className="bi bi-pencil-square" viewBox="0 0 16 16">
                                                <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
                                                <path fillRule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z" />
                                            </svg>
                                        </button>
                                        <button type="button"
                                            className="btn btn-light mr-1 actionBtn"
                                            onClick={ () => deleteUser(user.id) }>
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" className="bi bi-trash-fill" viewBox="0 0 16 16">
                                                <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z" />
                                            </svg>
                                        </button>
                                    </td>
                                </tr>
                            ) }
                        </tbody>
                    </table></div>
                </Row>
                <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossOrigin="anonymous"></script>
                <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossOrigin="anonymous"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossOrigin="anonymous"></script>

            </div></div>

    )
}

export default ManageCourse


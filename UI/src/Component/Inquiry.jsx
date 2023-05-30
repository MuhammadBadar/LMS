
import React, { Component } from 'react';
import { variables } from '../Variables.js';
import Form from 'react-bootstrap/Form';
import Button from 'react-bootstrap/Button';
import InputGroup from 'react-bootstrap/InputGroup';
import './Inquiry.css';
import Col from 'react-bootstrap/Col';
import Row from 'react-bootstrap/Row';

export default class Inquiry extends Component {

    constructor (props) {
        super(props);
        this.state = {
            name: "",
            cell: "",
            email: "",
            comments: "",
            id: 0,
            inquires: [],
            modalTitle: "",
            isInValidName: false,
            //isInValidCell: false,
            isInValidEmail: false
        }
        //  this.refreshList()
    }
    refreshList() {
        fetch(variables.API_URL + 'Inquiry')
            .then(response => response.json())
            .then(data => {
                this.setState({ inquires: data });
            });
    }
    componentDidMount() {
        this.refreshList();
    }
    changeName = (e) => {
        debugger
        this.setState({ name: e.target.value });
        if (e.target.value === "")
            this.setState({ isInValidName: true });
        else
            this.setState({ isInValidName: false });

    }
    changecell = (e) => {
        this.setState({ cell: e.target.value });

    }
    changeemail = (e) => {
        this.setState({ email: e.target.value });
        if (e.target.value === "")
            this.setState({ isInValidEmail: true });
        else
            this.setState({ isInValidEmail: false });
    }
    changecomments = (e) => {
        this.setState({ comments: e.target.value });
    }
    addClick() {
        this.setState({
            modalTitle: "Add Inquiry",
            id: 0,
            name: "",
            cell: "",
            email: "",
            comments: "",
            isValidName: true,
            isValidCell: true,
            isValidEmail: true
        });
    }
    editClick(inq) {
        console.warn(inq)
        debugger;
        this.setState({
            modalTitle: "Edit Inquiry",
            id: inq.id,
            name: inq.name,
            cell: inq.cell,
            email: inq.email,
            comments: inq.comments,
        });
    }
    createClick() {
        debugger
        // eslint-disable-next-line react/no-direct-mutation-state
        if (this.state.name === "" || this.state.email === "") {
            alert("Please fill all required Fields")
            this.setState({ isInValidName: true });
            this.setState({ isInValidEmail: true });
        }
        else {
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
                    alert("Successfully Added");
                    this.refreshList();
                }, (error) => {
                    alert('Failed');
                })
        }
    }
    updateClick() {
        var data = JSON.stringify({
            id: this.state.id,
            name: this.state.name,
            cell: this.state.cell,
            email: this.state.email,
            comments: this.state.comments
        })
        fetch(variables.API_URL + 'Inquiry', {
            method: 'PUT',
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
            body: data
        })
            .then(res => res.json())
            .then((result) => {
                alert("Successfully Updated");
                this.refreshList();
            }, (error) => {
                alert('Failed');
            })
    }
    deleteClick(id) {
        if (window.confirm('Are you sure?')) {
            fetch(variables.API_URL + 'Inquiry/' + id, {
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
                this.refreshList();
            }, (error) => {
                alert('Failed');
            })
        }
    }

    render() {
        const {
            inquires,
            modalTitle,
            id,
            name,
            cell,
            email,
            comments,
            isInValidName,
            // isInValidCell,
            isInValidEmail

        } = this.state;
        return (
            <div>
                <div className='mx-auto col-12 col-md-10 col-lg-8 '>
                    <Row>
                        <Row> <button type="button"
                            className="  float-end addBtn"
                            data-bs-toggle="modal"
                            data-bs-target="#exampleModal"
                            onClick={ () => this.addClick() }>
                            Add Inquiry
                        </button>
                        </Row>
                        <div className='iTableWraper'> <table className="table table-striped">
                            <thead className='iTableHead'>
                                <tr>
                                    {/* <th className='head'>
                                    Inquiry Id
                                </th> */}
                                    <th className='head '>
                                        Name
                                    </th>
                                    <th className='head'>
                                        Cell
                                    </th>
                                    <th className='head'>
                                        Email
                                    </th>
                                    <th className='head'>
                                        Comments
                                    </th>
                                    <th className='head iActions'>
                                        Actions
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                { inquires.map(inq =>
                                    <tr
                                        key={ inq.id }
                                    >
                                        {/* <td>{ inq.id }</td> */ }
                                        <td>{ inq.name }</td>
                                        <td>{ inq.cell }</td>
                                        <td>{ inq.email }</td>
                                        <td>{ inq.comments }</td>
                                        <td className='iActions actionBtnCol'>
                                            <button type="button"
                                                className="btn btn-light mr-1 actionBtn"
                                                data-bs-toggle="modal"
                                                data-bs-target="#exampleModal"
                                                onClick={ () => this.editClick(inq) }>
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" className="bi bi-pencil-square" viewBox="0 0 16 16">
                                                    <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
                                                    <path fillRule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z" />
                                                </svg>
                                            </button>
                                            <button type="button"
                                                className="btn btn-light mr-1 actionBtn"
                                                onClick={ () => this.deleteClick(inq.id) }>
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
                    <div className="modal fade" id="exampleModal"
                        // @ts-ignore
                        tabIndex="-1" aria-hidden="true">
                        <div className="modal-dialog modal-lg modal-dialog-centered">
                            <div className="modal-content">
                                <div className="modal-header iHeader" >
                                    <h5 className="modal-title">{ modalTitle }</h5>
                                    <button type="button" className="btn-close closeBtn" data-bs-dismiss="modal" aria-label="Close"
                                    ></button>
                                </div>
                                <Form noValidate validated={ false } className='inquiryForm'>
                                    <Row className="mb-3">
                                        <Form.Group as={ Col } md="4" controlId="name">
                                            {/* <Form.Label>Name</Form.Label> */ }
                                            <InputGroup hasValidation>
                                                <InputGroup.Text id="name">Name</InputGroup.Text>
                                                <Form.Control
                                                    type="text"
                                                    placeholder="Name"
                                                    aria-describedby="name"
                                                    required
                                                    value={ name }
                                                    isInvalid={ isInValidName }
                                                    onChange={ this.changeName }
                                                />

                                            </InputGroup>
                                        </Form.Group>
                                        <Form.Group as={ Col } md="4" controlId="email">
                                            {/* <Form.Label>Email</Form.Label> */ }
                                            <InputGroup hasValidation>
                                                <InputGroup.Text id="email">Email</InputGroup.Text>
                                                <Form.Control
                                                    type="email"
                                                    placeholder="Email"
                                                    aria-describedby="email"
                                                    required
                                                    value={ email }
                                                    isInvalid={ isInValidEmail }
                                                    onChange={ this.changeemail }
                                                />
                                            </InputGroup>
                                        </Form.Group>
                                        <Form.Group as={ Col } md="4" controlId="cell">
                                            {/* <Form.Label>Cell</Form.Label> */ }
                                            <InputGroup hasValidation>
                                                <InputGroup.Text id="cell">Cell</InputGroup.Text>
                                                <Form.Control
                                                    type="cell"
                                                    placeholder="Cell"
                                                    aria-describedby="cell"
                                                    required
                                                    value={ cell }
                                                    onChange={ this.changecell }
                                                />

                                            </InputGroup>
                                        </Form.Group>

                                    </Row>
                                    <Row>
                                        <Form.Group as={ Col } md="12" controlId="comments">
                                            {/* <Form.Label>Email</Form.Label> */ }
                                            <InputGroup>
                                                <InputGroup.Text>Comments</InputGroup.Text>
                                                <Form.Control as="textarea" value={ comments }
                                                    onChange={ this.changecomments } aria-label="With textarea" />
                                            </InputGroup>

                                        </Form.Group>
                                    </Row>
                                    { id === 0 ?
                                        <Button type="button"
                                            className="  float-end iSubmitBtn"
                                            onClick={ () => this.createClick() }
                                        >Create</Button>
                                        : <Button type="button"
                                            className="  float-end iSubmitBtn"
                                            onClick={ () => this.updateClick() }
                                        >Update</Button> }
                                    {/* <Button type="submit">Submit form</Button>  */ }
                                </Form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        )
    }
}







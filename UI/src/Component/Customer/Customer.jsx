/* eslint-disable react-hooks/rules-of-hooks */
import React, { Component } from 'react'
import Row from 'react-bootstrap/Row';
import './Customer.css';
import Form from 'react-bootstrap/Form';
import Button from 'react-bootstrap/Button';
import InputGroup from 'react-bootstrap/InputGroup';
import Col from 'react-bootstrap/Col';
import Checkbox from 'semantic-ui-react/dist/commonjs/modules/Checkbox';

//import Input from 'semantic-ui-react/dist/commonjs/elements/Input/Input';
var settings = {
    id: Number,
    enumTypeId: Number,
    levelId: Number
}
export default class Customer extends Component {

    constructor (props) {
        super(props);
        this.state = {
            cities: [],
            countries: [],
            accounts: [],
            customers: [],
            id: 0,
            accId: 0,
            countryId: 0,
            cityId: 0,
            name: "",
            phone: "",
            email: "",
            address: "",
            region: "",
            sendEmail: false,
            title: "Manage Customer",
            isInValidName: false,
            //isInValidCell: false,
            isInValidEmail: false
        }
        this.customerList()
        // this.cityList()
    }
    reset() {
        this.setState({
            id: 0,
            accId: 0,
            countryId: 0,
            cityId: 0,
            name: "",
            phone: "",
            email: "",
            address: "",
            region: "",
            sendEmail: false,
        })
    }
    componentDidMount() {
        this.cityList()
        this.countryList();
        this.accountList();
    }
    customerList() {
        fetch("https://localhost:8100/api/Customer")
            .then(response => response.json())
            .then(data => {
                this.setState({ customers: data });
            });
    }
    submit() {
        var customer = JSON.stringify({
            id: this.state.id,
            name: this.state.name,
            phone: this.state.phone,
            email: this.state.email,
            address: this.state.address,
            cityId: this.state.cityId,
            countryId: this.state.countryId,
            accId: this.state.accId,
            region: this.state.region,
            sendEmail: this.state.sendEmail
        })
        console.warn(customer)
        this.state.id === 0 ? (fetch("https://localhost:8100/api/Customer", {
            method: 'POST',
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
            body: customer
        })
            .then((result) => {
                this.customerList();
                this.reset()
                alert("Successfully Added")
            }, (error) => {
                console.warn(error)
                alert('Failed');
            })) : (fetch("https://localhost:8100/api/Customer", {
                method: 'PUT',
                headers: {
                    'Accept': 'application/json',
                    'Content-Type': 'application/json'
                },
                body: customer
            })
                .then((result) => {
                    this.customerList();
                    this.reset()
                    alert("Successfully Updated")
                }, (error) => {
                    console.warn(error)
                    alert('Failed');
                }))

    }
    editCustomer(cust) {
        this.setState({
            modalTitle: "Update Customer",
            id: cust.id,
            name: cust.name,
            phone: cust.phone,
            email: cust.email,
            address: cust.address,
            cityId: cust.cityId,
            countryId: cust.countryId,
            accId: cust.accId,
            region: cust.region,
            sendEmail: cust.sendEmail
        });
    }
    deleteCustomer(id) {
        if (window.confirm('Are you sure?')) {
            fetch("https://localhost:8100/api/Customer/" + id, {
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
                this.customerList();
            }, (error) => {
                alert('Failed');
            })
        }
    }
    onDropdownSelected(e) {
        console.log("THE VAL", e.target.value);
        //here you will see the current selected value of the select input
    }
    cityList() {
        // @ts-ignore
        settings = JSON.stringify({
            enumTypeId: 1016
        })

        fetch("https://localhost:8100/api/Settings/Search/", {
            method: 'POST',
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
            // @ts-ignore
            body: settings
        })
            .then(res => res.json())
            .then((result) => {
                this.setState({ cities: result });
            }, (error) => {
                console.warn(error)
                alert('Failed');
            })
    }
    countryList() {
        // @ts-ignore
        settings = JSON.stringify({
            enumTypeId: 1015
        })

        fetch("https://localhost:8100/api/Settings/Search/", {
            method: 'POST',
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
            // @ts-ignore
            body: settings
        })
            .then(res => res.json())
            .then((result) => {
                this.setState({ countries: result });
            }, (error) => {
                console.warn(error)
                alert('Failed');
            })
    }
    accountList() {
        // @ts-ignore
        settings = JSON.stringify({
            levelId: 1008
        })

        fetch("https://localhost:8100/api/Settings/Search/", {
            method: 'POST',
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
            // @ts-ignore
            body: settings
        })
            .then(res => res.json())
            .then((result) => {
                this.setState({ accounts: result });
            }, (error) => {
                console.warn(error)
                alert('Failed');
            })
    }
    handleChange = (e) => {
        this.setState({ sendEmail: e.target.checked });
    }
    render() {

        const {
            id,
            cities,
            name,
            email,
            address,
            phone,
            region,
            cityId = undefined,
            //  sendEmail,
            countries,
            customers,
            accounts,
            initialAccVal = 0,
        } = this.state;
        // let optionTemplate = cities.map(v => (
        //     <option key={ v.id } onClick={ event => this.setState({ cityId: 9 }) } value={ v.id } >{ v.name }</option>
        // ));
        return (
            <div >
                { id === 0 ?
                    <h1 className='heading'>Manage Customer</h1>
                    : <h1 className='heading'>Update Customer</h1> }
                <Form noValidate validated={ false } className='body' >
                    <Row className="mb-3">
                        <Form.Group as={ Col } md="6" controlId="name" className='inputField'>
                            {/* <Form.Label>Name</Form.Label> */ }
                            <InputGroup hasValidation>
                                <InputGroup.Text id="name">Name</InputGroup.Text>
                                <Form.Control
                                    type="text"

                                    aria-describedby="name"
                                    required
                                    value={ name }
                                    // isInvalid={ isInValidName }
                                    onChange={ e => this.setState({ name: e.target.value }) }
                                />

                            </InputGroup>
                        </Form.Group>
                        <Form.Group as={ Col } md="6" controlId="email" className='inputField'>
                            {/* <Form.Label>Email</Form.Label> */ }
                            <InputGroup hasValidation>
                                <InputGroup.Text id="email">Email</InputGroup.Text>
                                <Form.Control
                                    type="email"

                                    aria-describedby="email"
                                    required
                                    value={ email }
                                    // isInvalid={ isInValidName }
                                    onChange={ e => this.setState({ email: e.target.value }) }
                                />
                            </InputGroup>
                        </Form.Group>
                        <Form.Group as={ Col } md="6" controlId="phone" className='inputField'>
                            {/* <Form.Label>Cell</Form.Label> */ }
                            <InputGroup hasValidation>
                                <InputGroup.Text id="phone">Phone</InputGroup.Text>
                                <Form.Control
                                    type="cell"

                                    aria-describedby="phone"
                                    required
                                    value={ phone }
                                    // isInvalid={ isInValidName }
                                    onChange={ e => this.setState({ phone: e.target.value }) }
                                />

                            </InputGroup>
                        </Form.Group>
                        <Form.Group as={ Col } md="6" controlId="region" className='inputField'>
                            {/* <Form.Label>Cell</Form.Label> */ }
                            <InputGroup hasValidation>
                                <InputGroup.Text id="region">Region</InputGroup.Text>
                                <Form.Control
                                    type="text"

                                    aria-describedby="region"
                                    value={ region }
                                    onChange={ e => this.setState({ region: e.target.value }) }
                                />

                            </InputGroup>
                        </Form.Group>
                    </Row>
                    <Row>
                        <div className='input-group inputField'  >
                            <div className="input-group-prepend">
                                <label className="input-group-text" htmlFor='countryId'>Select Country</label>
                            </div>
                            <select className="form-control" id="countryId"
                                value={ this.state.countryId }
                                onChange={ event => this.setState({ countryId: event.target.value }) }>
                                {
                                    countries.map(val => {
                                        return (

                                            <option key={ val.id } value={ val.id }>
                                                { val.name }
                                            </option>
                                        )
                                    })
                                }
                            </select>
                        </div>
                        <div className='input-group  inputField' >
                            <div className="input-group-prepend">
                                <label className="input-group-text" htmlFor='cityId'>Select City</label>
                            </div>
                            <select className="form-control" id="cityId"
                                value={ cityId }
                                onChange={ event => this.setState({ cityId: event.target.value }) }>
                                {
                                    cities.map(val => {
                                        return (
                                            <option key={ val.id } value={ val.id }>
                                                { val.name }
                                            </option>
                                        )
                                    })
                                }
                            </select>
                        </div>
                        <div className='input-group inputField' >
                            <div className="input-group-prepend">
                                <label className="input-group-text" htmlFor='accId'>Select Account</label>
                            </div>
                            <select className="form-control" id="accId"
                                value={ this.state.accId }
                                onChange={ event => this.setState({ accId: event.target.value }) }>
                                {
                                    accounts.map(val => {
                                        return (
                                            <>
                                                <option key={ initialAccVal }  >--Please Select--</option>
                                                <option key={ val.id } value={ val.id }>
                                                    { val.name }
                                                </option>
                                            </>
                                        )
                                    })
                                }
                            </select>
                        </div>
                        <div className="form-check inputField ">
                            <Checkbox
                                checked={ this.state.sendEmail }
                                onChange={ this.handleChange } id="sendEmail" />
                            {/* <input className="form-check-input" type="checkbox"
                                onChange={ e => this.setState({ sendEmail: e.target.value }) } id="sendEmail" /> */}
                            <label className="form-check-label checkBox" htmlFor="sendEmail" >
                                Send Email
                            </label>
                        </div>
                    </Row>
                    <Row>
                        <Form.Group as={ Col } md="12" controlId="address" className='addressFeild'>
                            {/* <Form.Label>Email</Form.Label> */ }
                            <InputGroup>
                                <InputGroup.Text>Address</InputGroup.Text>
                                <Form.Control as="textarea"
                                    value={ address }
                                    onChange={ e => this.setState({ address: e.target.value }) }
                                    aria-label="With textarea" />
                            </InputGroup>

                        </Form.Group>
                    </Row>
                    <Row>  { id === 0 ?
                        <Button type="button"
                            className="btn submitBtn "
                            onClick={ () => this.submit() }
                        >Submit</Button>
                        : <Button type="button"
                            className="btn  submitBtn "
                            onClick={ () => this.submit() }
                        >Update</Button> }
                        <Button className="btn reSetBtn " onClick={ () => this.reset() } >Reset</Button></Row>

                    {/* <Button type="submit">Submit form</Button>  */ }
                </Form>
                <h1 className='heading'>Customer List</h1>
                <Row className='body'>
                    <div className='tableWraper'> <table className="table table-striped">
                        <thead className='tableHead'>
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
                                    Address
                                </th>
                                <th className='head'>
                                    City
                                </th>
                                <th className='head'>
                                    Country
                                </th>
                                <th className='head'>
                                    Account
                                </th>
                                <th className='head'>
                                    Region
                                </th>

                                <th className='head actions actionLabel'>
                                    Actions
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            { customers.map(inq =>
                                <tr
                                    key={ inq.id }
                                >
                                    {/* <td>{ inq.id }</td> */ }
                                    <td>{ inq.name }</td>
                                    <td>{ inq.phone }</td>
                                    <td>{ inq.email }</td>
                                    <td>{ inq.address }</td>
                                    <td>{ inq.city }</td>
                                    <td>{ inq.country }</td>
                                    <td>{ inq.account }</td>
                                    <td>{ inq.region }</td>

                                    <td className='actions actionBtnCol'>
                                        <button type="button"
                                            className="btn btn-light mr-1 actionBtn"

                                            onClick={ () => this.editCustomer(inq) }>
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" className="bi bi-pencil-square" viewBox="0 0 16 16">
                                                <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
                                                <path fillRule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z" />
                                            </svg>
                                        </button>
                                        <button type="button"
                                            className="btn btn-light mr-1 actionBtn"
                                            onClick={ () => this.deleteCustomer(inq.id) }>
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
            </div>
        )
    }
}

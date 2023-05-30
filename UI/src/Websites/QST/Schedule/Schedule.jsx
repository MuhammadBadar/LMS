// @ts-nocheck
/* eslint-disable jsx-a11y/anchor-is-valid */
import React, { Component } from 'react'
import { variables } from 'Variables';
import './schedule.css';
//import moment from 'moment';
import Moment from 'react-moment';
export default class Schedule extends Component {
    constructor (props) {
        super(props);
        this.state = {
            schedules: [],
        }
    }
    componentDidMount() {
        this.scheduleList()
    }
    scheduleList() {
        fetch(variables.API_URL + 'Schedule')
            .then(response => response.json())
            .then(data => {
                this.setState({ schedules: data });
            });
    }
    render() {
        const {
            schedules
        } = this.state
        return (
            <div>
                <React.Fragment>
                    {/* <!-- Required meta tags --> */ }
                    <meta charSet="utf-8" />
                    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

                    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
                    {/* <!-- Bootstrap CSS --> */ }


                    <title>Schedule</title>
                </React.Fragment>
                <div>
                    {/* <!----------navbar--> */ }
                    <section id="main-sch-bg">

                    </section>
                    <section id="bar-sch">
                        <div className="container">
                            <div className="row">
                                <div className="col-lg-12">
                                    <div className="bar-sch">
                                        <h2>Schedule</h2>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                    <div className="container">
                        <div className="row row-1-sch">
                            {
                                schedules.map(val => {
                                    return (
                                        <div className="col-lg-4" key={ val.id }>
                                            <div className="card" >
                                                <img src={ val.logoBase64Path } className="card-img-top" alt="..." />
                                                <div className="card-body">
                                                    <h5 className="card-title">{ val.description }/{ val.course }</h5>
                                                    <h6><i className="fa-solid fa-calendar-days"></i>  Seminar on <Moment format="YYYY/MM/DD hh:mm:ss a">{ val.orientationclassName }</Moment></h6>
                                                    <h6><i className="fa-solid fa-arrow-right"></i>  class start from  <Moment format="YYYY/MM/DD">{ val.startDate }</Moment></h6>
                                                    <p className="card-text" >
                                                        { val.classTimings.map(timings => {
                                                            return (
                                                                <div>{ timings.weekDay } : { timings.timeFrom } to { timings.timeTo } <br /></div>
                                                            )
                                                        }) }
                                                    </p>
                                                    <a href="#" className="btn btn-primary ">Enroll Now</a>
                                                </div>
                                            </div>
                                        </div>
                                    )
                                })
                            }
                        </div>
                        {/* <div className="row row-1-sch">
                            <div className="col-lg-4">
                                <div className="card">
                                    <img src={ require("../assets/images/python.png") } className="card-img-top" alt="..." />
                                    <div className="card-body">
                                        <h5 className="card-title">C# & ASP .NET CORE/ASP .NET MVC COURSE</h5>
                                        <h6><i className="fa-solid fa-calendar-days"></i> Seminar on April 29 , 2023 at 07:30</h6>
                                        <h6><i className="fa-solid fa-arrow-right"></i> classNamees start from April 30, 2023</h6>
                                        <p className="card-text">
                                            Saturday: 01:30 PM To 03:00 PM<br />
                                            Saturday (Lab): 03:00 PM To 04:30 PM<br />
                                            Sunday: 04:30 PM To 06:00 PM
                                        </p>
                                        <a href="#" className="btn btn-primary">Enroll Now</a>
                                    </div>
                                </div>
                            </div>
                            <div className="col-lg-4">
                                <div className="card">
                                    <img src={ require("../assets/images/python.png") } className="card-img-top" alt="..." />
                                    <div className="card-body">
                                        <h5 className="card-title">C# & ASP .NET CORE/ASP .NET MVC COURSE</h5>
                                        <h6><i className="fa-solid fa-calendar-days"></i> Seminar on April 29 , 2023 at 07:30</h6>
                                        <h6><i className="fa-solid fa-arrow-right"></i> classNamees start from April 30, 2023</h6>
                                        <p className="card-text">
                                            Saturday: 01:30 PM To 03:00 PM<br />
                                            Saturday (Lab): 03:00 PM To 04:30 PM<br />
                                            Sunday: 04:30 PM To 06:00 PM
                                        </p>
                                        <a href="#" className="btn btn-primary ">Enroll Now</a>
                                    </div>
                                </div>
                            </div>
                            <div className="col-lg-4" >
                                <div className="card box" >
                                    <img src={ require("../assets/images/python.png") } className="card-img-top" alt="..." />
                                    <div className="card-body">
                                        <h5 className="card-title">C# & ASP .NET CORE/ASP .NET MVC COURSE</h5>
                                        <h6><i className="fa-solid fa-calendar-days"></i> Seminar on April 29 , 2023 at 07:30</h6>
                                        <h6><i className="fa-solid fa-arrow-right"></i> classNamees start from April 30, 2023</h6>
                                        <p className="card-text">
                                            Saturday: 01:30 PM To 03:00 PM<br />
                                            Saturday (Lab): 03:00 PM To 04:30 PM<br />
                                            Sunday: 04:30 PM To 06:00 PM <br />
                                            Saturday: 01:30 PM To 03:00 PM<br />
                                            Saturday (Lab): 03:00 PM To 04:30 PM<br />
                                            Sunday: 04:30 PM To 06:00 PM
                                        </p>
                                        <div className="enroll-btn"></div>
                                        <a href="#" className="btn btn-primary">Enroll Now</a>
                                    </div>
                                </div>
                            </div>
                        </div> */}
                    </div>

                    {/* <!-- Optional JavaScript -->
                                                        <!-- jQuery first, then Popper.js, then Bootstrap JS --> */}
                    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossOrigin="anonymous"></script>
                    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossOrigin="anonymous"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossOrigin="anonymous"></script>
                </div>
            </div>
        )
    }
}

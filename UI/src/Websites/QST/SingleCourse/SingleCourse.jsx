// @ts-nocheck
/* eslint-disable jsx-a11y/anchor-is-valid */
import React, { Component } from 'react'
import Accordion from 'react-bootstrap/Accordion';
import './single-course.css'
export default class SingleCourse extends Component {
    render() {
        return (
            <div>
                <React.Fragment>
                    <meta charSet="utf-8" />
                    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                    {/* <!-- Bootstrap CSS --> */ }
                    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
                        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossOrigin="anonymous" />

                </React.Fragment>
                <div>
                    <div>
                        <div className="container">
                            <div className="row">
                                <div className="ToDo">
                                    <h1>What You'll be Doing?</h1>
                                </div>
                            </div>
                            <div className="row">
                                <div className="col-lg-4">
                                    <div className="ToDoTraining">
                                        <div className="shadow p-3 mb-5 bg-white rounded">
                                            <i className="fa-solid fa-terminal"></i>
                                            <h3>ASP.NET Core Training</h3>
                                            <li> ASP.NET Core Fundamentals</li>
                                            <li> Entity Framework Core</li>
                                            <li> Web API Core</li>
                                            <li>Advanced ASP.NET Core</li>
                                            <li>Hands-On Assignments</li>
                                            <li> 24X7 Support Using Discord</li>
                                            <li>Unlimited Live Sessions for 12 Months</li>
                                        </div>
                                    </div>
                                </div>
                                <div className="col-lg-4">
                                    <div className="ToDoTraining">
                                        <div className="shadow p-3 mb-5 bg-white rounded">
                                            <i className="fa-solid fa-truck-fast"></i>
                                            <h3>Food Delivery Project</h3>
                                            <li>Implement clean architecture</li>
                                            <li>Repository Design Pattern</li>
                                            <li>Mobile-first UI using Bootstrap</li>
                                            <li>Implementing Security using Identity</li>
                                            <li> Error Logging using Serilog</li>
                                            <li>Integrate RazorPay payment gateway</li>
                                            <li>Integrate RazorPay payment gateway</li>
                                        </div>
                                    </div>
                                </div>
                                <div className="col-lg-4">
                                    <div className="ToDoTraining">
                                        <div className="shadow p-3 mb-5 bg-white rounded">
                                            <i className="fa-sharp fa-solid fa-lightbulb"></i>
                                            <h3>Career Coaching</h3>
                                            <li>Personalized Career Coaching</li>
                                            <li>Resume Building</li>
                                            <li> Physical Fitness</li>
                                            <li>Mental Fitness</li>
                                            <li>Secrets of Time Management</li>
                                            <li>Success Habits</li>
                                            <li>Secrets of Productivity</li>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div className="container">
                            <div className="row">
                                <div className="done">
                                    <h3>About the ASP.NET Core Course</h3>
                                    <div className="shadow p-3 mb-5 bg-white rounded">
                                        <p>The ASP.NET Core certification training is primarily designed for .NET Beginner(s)/Professional(s) who want
                                            to learn how to develop the modern cloud-based app using ASP.NET Core and Visual Studio. In this training
                                            program, you will learn about .NET Core, middleware, MVC pattern, HTML helpers, tag helpers, custom helpers,
                                            validation and custom validation, and querying database using Entity Framework Core. Further, learn how to
                                            take advantage of the new features in ASP.NET Core.</p>
                                        <h5>ASP.NET Core Training Objective</h5>
                                        <p>At the completion of this course, attendees will be able to;</p>
                                        <ol>
                                            <li>Understand .NET Core architecture and Advantagesb <br /></li>
                                            <li> Build and run cross-platform ASP.NET apps on Windows, Mac and Linux </li>
                                            <li> Understand ASP.NET Core middleware <br /></li>
                                            <li> Configure ASP.NET Core MVC <br /></li>
                                            <li> Use Dependency Injection in ASP.NET Core <br /></li>
                                            <li> Work with Entity Framework Core <br /></li>
                                            <li> Handle Errors in ASP.NET Core <br /></li>
                                            <li> Create REST Service using Web API <br /> </li>
                                            <li> Understand and Implement Repository, Unit of Work and Dependency Injection Design Patterns <br /></li>
                                            <li> Publish ASP.NET Core Application </li>
                                        </ol>
                                    </div>
                                    <h5>Who can do this course?</h5>
                                    <p>All .NET Beginner(s)/Professional(s) who are keen to develop modern, lightweight and cloud-based web
                                        applications should go for this course.</p>
                                    <h5>Pre-requisites</h5>
                                    <p>Anyone who wants to learn ASP.NET Core should have a basic knowledge of C# and HTML.</p>
                                    <h5>Tools/SDK/IDE</h5>
                                    <p>Visual Studio 2022 or higher, SQL Server 2017 or higher</p>
                                    <Accordion defaultActiveKey="0">
                                        <Accordion.Item eventKey="0">
                                            <Accordion.Header>  Why should you go for this DotNetTricks ASP.NET Core Project Development Training?</Accordion.Header>
                                            <Accordion.Body>
                                                <p>The below reasons highlight why one must go for the ASP.NET core project development training from
                                                    Dotnettricks:</p>
                                                <li>Offers Unlimited Live Training.</li>
                                                <li> Provides training on ASP.NET Core 6 from scratch.</li>
                                                <li> Teaches entity framework core and ASP.NET Web API.</li>
                                                <li> Implementation of Design Patterns like DI, Repository, etc.</li>
                                                <li> Lets you learn to build and review a resume.</li>
                                                <li> You will learn from the Microsoft MVPs and know how to build a project.</li>
                                                <li> Includes practical examples in all sessions.</li>
                                                <li> Every module is followed by quizzes and mockup tests.</li>
                                            </Accordion.Body>
                                        </Accordion.Item>
                                        <Accordion.Item eventKey="1">
                                            <Accordion.Header>  Who Should take up these ASP.NET Core Courses?</Accordion.Header>
                                            <Accordion.Body>
                                                <li>Testers and web developers (front end and back end)</li>
                                                <li> Anybody willing to learn ASP NET MVC Core right from basics to advance</li>
                                                <li> Anybody willing to learn the recent changes with the latest Microsoft framework</li>
                                                <li> Anybody interested in learning the way to design large scale projects</li>
                                                <li> Freshers who have started a career in web development</li>
                                                <p>Any of these target audiences can take up the ASP.NET core course to write an application that can
                                                    design, edit, and view the data from a database.</p>
                                            </Accordion.Body>
                                        </Accordion.Item>
                                        <Accordion.Item eventKey="2">
                                            <Accordion.Header>  Why take an online ASP.NET Core course? How is it better than an offline course?</Accordion.Header>
                                            <Accordion.Body>
                                                There are enough study materials available when you opt for the online ASP.NET courses. The facility
                                                of live training makes sure all your doubts get cleared instantly. So, you can begin fresh with the
                                                next module without any doubts. <br />

                                                In offline courses, there is no live contact with the instructors and tutors. On the other hand, the
                                                online ASP.NET courses provide thorough guidance with face-to-face facility for learning from the
                                                experts in this field. Depending on your skill sets and budget, you can choose the level of training
                                                you want. In this way, you will be saved from spending unnecessary money.
                                            </Accordion.Body>
                                        </Accordion.Item>
                                        <Accordion.Item eventKey="3">
                                            <Accordion.Header>   How will ASP.NET Core Online Training help your Career?</Accordion.Header>
                                            <Accordion.Body>
                                                Once you accomplish online training for ASP.NET core, you can implement a live project using ASP.NET
                                                Core, Entity Core, and jQuery. If you are skilled enough after completing the course then there are
                                                higher odds of getting placed at higher job positions. You will be efficient at resume building and
                                                the technical interviews with questions revolving around the ASP.NET core. For skilled and exceptional
                                                ASP.NET developers, there are several bright job opportunities available. They guarantee a significant
                                                salary hike and may place you in an esteem position in the organization. You will become more
                                                versatile for learning other programming languages.
                                            </Accordion.Body>
                                        </Accordion.Item>
                                        <Accordion.Item eventKey="4">
                                            <Accordion.Header> What are the benefits of learning .Net Core?</Accordion.Header>
                                            <Accordion.Body>
                                                <p>Here is the list of benefits:</p>
                                                <li>Effectively design and develop ASP.NET applications.</li>
                                                <li> Get access to the outstanding features of the rich toolbox. Some of these features are automatic
                                                    deployment, drag-and drop-server controls, etc.</li>
                                                <li> You will significantly save time on coding when working on creating large web applications. The
                                                    code lines are greatly reduced.</li>
                                                <li> Since HTML and source code are together, it becomes easy to write as well as maintain web pages.
                                                </li>
                                                <li> You can develop modern cloud-based applications.</li>
                                                <li> You can easily work on various web development frameworks</li>
                                                <li> More chances of getting well-paying jobs</li>
                                            </Accordion.Body>
                                        </Accordion.Item>
                                    </Accordion>
                                </div>
                            </div>
                        </div>
                    </div>

                    {/* <!-------------ToDOList------------>

            <!---------ToDoList2--------------> */}
                    <div className="container">
                        <div className="row">
                            <div className="ToDoList2Head">
                                <h2>Build ASP.NET Core Real-Projects</h2>
                                <p>Apply your coding skills to solve real-world problems. You’ll learn how to start a project from scratch by
                                    following recommended architecture, practices and deploy to server.</p>
                            </div>
                        </div>
                        <div className="row">
                            <div className="col-lg-4">
                                <div className="shadow p-3 mb-5 bg-white rounded">
                                    <div className="card">
                                        <img src={ require("../assets/images/swiggy.png") } className="card-img-top" alt="..." />
                                        <div className="card-body">
                                            <h5 className="card-title">Build Food Delivery Website <br />
                                                (Like Swiggy, Dominoz)</h5>
                                            <p className="card-text">Learn to implement clean architecture, repository design pattern, take order online,
                                                show order listing, integrate payment gateway for accepting payment.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div className="col-lg-4">
                                <div className="shadow p-3 mb-5 bg-white rounded">
                                    <div className="card">
                                        <img src={ require("../assets/images/gana.png") } className="card-img-top" alt="..." />
                                        <div className="card-body">
                                            <h5 className="card-title">Build Music Website <br />
                                                (Like Gana.com, JioSaavn)</h5>
                                            <p className="card-text">Learn to implement n-layer architecture, design patterns, security and play audio,
                                                create songs library, payment gateway for payment.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div className="col-lg-4">
                                <div className="shadow p-3 mb-5 bg-white rounded">
                                    <div className="card">
                                        <img src={ require("../assets/images/flipkart.png") } className="card-img-top" alt="..." />
                                        <div className="card-body">
                                            <h5 className="card-title">Build Online Shopping Website
                                                (Like Flipkart, Pepperfry)</h5>
                                            <p className="card-text">Learn to implement n-tier architecture, design patterns, dependency injection and
                                                OAuth login, integrate payment gateway for payment.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    {/* <!---------ToDoList2-------------->

            <!---------ToDoList3--------------> */}
                    <div className="container">
                        <div className="row">
                            <div className="ToDoList3">
                                <h2>ASP.NET Core Project Architecture</h2>
                                <div className="shadow p-3 mb-5 bg-white rounded">
                                    <p>The primary purpose of an application architecture is to support the development life cycle of the system.
                                        Good architecture makes the system easy to understand, easy to develop, easy to maintain, and easy to
                                        deploy. The ultimate benefit of architecture is to minimize the lifetime cost of the system and to maximize
                                        programmer productivity.

                                        The goal of the given architecture is to learn and implement important principles and design patterns to
                                        build various domains applications like eCommerce, edTech, Food Delivery or other Service based industries
                                        applications.</p>
                                    <img src={ require("../assets/images/Architecture.png") } alt="" />
                                    <h4>What you will learn through project?</h4>
                                    <p>At the completion of project, attendees will be able to;</p>
                                    <li>Setup and build project using Clean Architecture.</li>
                                    <li>Decouples Application modules using Dependency Injection.</li>
                                    <li>Integrate RazorPay/Paypal payment gateway.</li>
                                    <li>Implement Repository pattern to perform database operations.</li>
                                    <li>Build responsive UI using Bootstrap.</li>
                                    <li>Implement Errors logging and save into Database, File system etc.</li>
                                    <li>Optimize web pages to boost-up performance.</li>
                                    <li>Implement Login/Signup workflow using ASP.NET Core Identity.</li>
                                    <li>Implement Authentication/Authorization for unauthorize access.</li>
                                    <li>Implement ASP.NET Core best practices.</li>
                                    <li>Deployment project to cloud or IIS.</li>
                                </div>
                            </div>
                        </div>
                    </div>
                    {/* <!---------ToDoList3-------------->

            <!---------ToDoList4--------------> */}
                    <div className="container">
                        <div className="row">
                            <div className="ToDoList4">
                                <h2>Why Learn ASP.NET Core?</h2>
                            </div>
                        </div>
                        <div className="row">
                            <div className="col-lg-4">
                                <div className="shadow p-3 mb-5 bg-white rounded">
                                    <i className="fa-sharp fa-solid fa-link"></i>
                                    <h5>Open-source and Cross-platform</h5>
                                    <p>A framework which runs on Windows, Mac, & Linux and used to develop modern cloud-based applications.</p>
                                </div>
                            </div>
                            <div className="col-lg-4">
                                <div className="shadow p-3 mb-5 bg-white rounded">
                                    <i className="fa-solid fa-hand-holding-dollar"></i>
                                    <h5>Salary Trends</h5>
                                    <p>The average salary of Microsoft .Net Developer is $99k (based on Indeed.com salary data).</p>
                                </div>
                            </div>
                            <div className="col-lg-4">
                                <div className="shadow p-3 mb-5 bg-white rounded">
                                    <i className="fa-solid fa-gauge-high"></i>
                                    <h5>Performance</h5>
                                    <p>Fastest web development frameworks from Java Servlet, NodeJS, and PHP in raw performance.</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    {/* <!---------ToDoList4-------------->

            <!---------ToDoList5--------------> */}
                    <div className="container">
                        <div className="row">
                            <div className="ToDoList5">
                                <h2>Choose Training Options</h2>
                            </div>
                        </div>
                        <div className="row">
                            <div className="col-lg-4">
                                <div className="shadow p-3 mb-5 bg-white rounded">
                                    <h6>Live Training</h6>
                                    <li> Expert-led Live Sessions</li>
                                    <li> Tests & Quizzes</li>
                                    <li> Tests & Quizzes</li>
                                    <li> Learn By Doing Code</li>
                                    <li> Build Real-world Projects</li>
                                    <li> 24X7 Support Using Discord</li>
                                    <li> Unlimited Live Sessions for 12 Months</li>
                                    <div className="btn1">
                                        <button>Enroll Now</button>
                                    </div>
                                </div>
                            </div>
                            <div className="col-lg-4">
                                <div className="shadow p-3 mb-5 bg-white rounded">
                                    <h6>One-to-One Training</h6>
                                    <li> Exclusive 1-1 Live Training</li>
                                    <li> Expert-led Live Sessions</li>
                                    <li> Tests & Quizzes</li>
                                    <li> Hands-On Assignments</li>
                                    <li> Build Real-world Projects</li>
                                    <li> 24X7 Support Using Discord</li>
                                    <div className="btn2">
                                        <button>Contact Us</button>
                                    </div>
                                </div>
                            </div>
                            <div className="col-lg-4">
                                <div className="shadow p-3 mb-5 bg-white rounded">
                                    <h6>Corporate Training</h6>
                                    <li>Expert-led Live Sessions</li>
                                    <li> Customized Course Content</li>
                                    <li> classNameroom Training</li>
                                    <li> Flexible Schedule</li>
                                    <li> Tests & Quizzes</li>
                                    <li> Build Real-world Projects</li>
                                    <li> 24X7 Access to LMS</li>
                                    <div className="btn3">
                                        <button>Contact Us</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    {/* <!---------ToDoList5-------------->

            <!---------ToDoList6--------------> */}
                    <div className="container shadow p-3 mb-5 bg-white rounded">
                        <div className="row">
                            <div className="money-head">
                                <h5>100% Money Back Guarantee</h5>
                            </div>
                        </div>
                        <div className="row">
                            <div className="col-lg-2">
                                <div className="money-img">
                                    <img src={ require("../assets/images/money-back.png") } alt="" />
                                </div>
                            </div>
                            <div className="col-lg-10">
                                <div className="money-p">
                                    <p>Our training programs are empowering thousands with expert knowledge - they will you too. If you're
                                        disappointed for whatever reason, you'll get your 100% refund. We won't make you beg or invoke any silly
                                        rules or conditions – if you're not satisfied within your first 5 days then we'll refund you without any
                                        fuss.
                                        For more details do refer our <a href="#">Refund Policy.</a></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    {/* <!---------ToDoList6-------------->

            <!---------ToDoList7--------------> */}
                    <div className="container">
                        <div className="row">
                            <div className="col-lg-6">
                                <div className="course-head">
                                    <h3>ASP.NET Core Course Curriculum</h3>
                                </div>
                            </div>
                            <div className="col-lg-6">
                                <div className="btn4">
                                    <button>Download Curriculum</button>
                                </div>
                            </div>
                            <div className="row">
                                <div className="accordion">
                                    <div className="accordion" id="accordionExample">
                                        <div className="card">
                                            <div className="card-header" id="headingOne">
                                                <h2 className="mb-0">
                                                    <button className="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseOne"
                                                        aria-expanded="true" aria-controls="collapseOne">
                                                        Collapsible Group Item #1
                                                    </button>
                                                </h2>
                                            </div>

                                            <div id="collapseOne" className="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
                                                <div className="card-body">
                                                    Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf
                                                    moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod.
                                                    Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda
                                                    shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea
                                                    proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim
                                                    aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                                                </div>
                                            </div>
                                        </div>
                                        <div className="card">
                                            <div className="card-header" id="headingTwo">
                                                <h2 className="mb-0">
                                                    <button className="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo"
                                                        aria-expanded="false" aria-controls="collapseTwo">
                                                        Collapsible Group Item #2
                                                    </button>
                                                </h2>
                                            </div>
                                            <div id="collapseTwo" className="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
                                                <div className="card-body">
                                                    Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf
                                                    moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod.
                                                    Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda
                                                    shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea
                                                    proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim
                                                    aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                                                </div>
                                            </div>
                                        </div>
                                        <div className="card">
                                            <div className="card-header" id="headingThree">
                                                <h2 className="mb-0">
                                                    <button className="btn btn-link collapsed" type="button" data-toggle="collapse"
                                                        data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                                        Collapsible Group Item #3
                                                    </button>
                                                </h2>
                                            </div>
                                            <div id="collapseThree" className="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
                                                <div className="card-body">
                                                    Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf
                                                    moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod.
                                                    Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda
                                                    shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea
                                                    proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim
                                                    aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    {/* <!---------ToDoList7-------------->

            <!---------ToDoList8--------------> */}
                    <div className="container">
                        <div className="row">
                            <div className="benefit">
                                <div className="bene-head">
                                    <h3>DotNetTricks Benefits</h3>
                                </div>
                            </div>
                        </div>

                        <div className="row">
                            <div className="col-lg-4">
                                <div className="row">
                                    <div className="col-lg-2">
                                        <i className="fa-solid fa-infinity"></i>
                                    </div>
                                    <div className="col-lg-10">
                                        <h5> Unlimited Live Sessions</h5>
                                        <p>Live Training Membership give you unlimited access to all our live training and sessions recording from
                                            anywhere, and using any device staying at home.</p>
                                    </div>
                                </div>
                                <div className="row">
                                    <div className="col-lg-2">
                                        <i className="fa-solid fa-book-open-reader"></i>
                                    </div>
                                    <div className="col-lg-10">
                                        <h5>Build Real-Projects</h5>
                                        <p>All the sessions are delivered using real-life examples. You will learn how to build real projects using
                                            industry recommended principles & practices.</p>
                                    </div>
                                </div>
                                <div className="row">
                                    <div className="col-lg-2">
                                        <i className="fa-regular fa-file-word"></i>
                                    </div>
                                    <div className="col-lg-10">
                                        <h5> Resume Building</h5>
                                        <p>Optimize your resume with the help of our experienced experts to get your desired jobs.</p>
                                    </div>
                                </div>
                                <div className="row">
                                    <div className="col-lg-2">
                                        <i className="fa-solid fa-headphones"></i>
                                    </div>
                                    <div className="col-lg-10">
                                        <h5> Technical Support</h5>
                                        <p>We have online support team available to help you with any technical queries you may have during the
                                            course.</p>
                                    </div>
                                </div>
                            </div>

                            <div className="col-lg-4">
                                <div className="row">
                                    <div className="col-lg-2">
                                        <i className="fa-solid fa-user"></i>
                                    </div>
                                    <div className="col-lg-10">
                                        <h5> Expert-led Live Sessions</h5>
                                        <p>All sessions are led by our expert mentors who are well connected to the open source communities. They
                                            explain complex technical concepts in an easy way.</p>
                                    </div>
                                </div>
                                <div className="row">
                                    <div className="col-lg-2">
                                        <i className="fa-solid fa-chalkboard-user"></i>
                                    </div>
                                    <div className="col-lg-10">
                                        <h5> Personal Career Coach</h5>
                                        <p>Get career guidance from top experts as your personal coach, align your preparation strategy & learning
                                            resources to achieve your goal.</p>
                                    </div>
                                </div>
                                <div className="row">
                                    <div className="col-lg-2">
                                        <i className="fa-solid fa-flask"></i>
                                    </div>
                                    <div className="col-lg-10">
                                        <h5> Hands-on Assignments</h5>
                                        <p>Learn by doing hands-on to gain confidence to solve real-world challenges and assignments.</p>
                                    </div>
                                </div>
                                <div className="row">
                                    <div className="col-lg-2">
                                        <i className="fa-solid fa-certificate"></i>
                                    </div>
                                    <div className="col-lg-10">
                                        <h5>Get Certified</h5>
                                        <p>Master in-demand job skills to become a technology expert, get certified, and accelerate your career.</p>
                                    </div>
                                </div>
                            </div>


                            <div className="col-lg-4">
                                <div className="row">
                                    <div className="col-lg-2">
                                        <i className="fa-solid fa-list-check"></i>
                                    </div>
                                    <div className="col-lg-10">
                                        <h5>Tests & Quizzes</h5>
                                        <p>Each Module will be followed by mockup tests and quizzes which help you to monitor your learning progress
                                            and Evaluate yourself.</p>
                                    </div>
                                </div>
                                <div className="row">
                                    <div className="col-lg-2">
                                        <i className="fa-solid fa-question"></i>
                                    </div>
                                    <div className="col-lg-10">
                                        <h5> Interview Prep Sessions</h5>
                                        <p>Get career guidance and ask your questions & doubts live. Join to prepare yourself for next job interview
                                            to crack and get hired!</p>
                                    </div>
                                </div>
                                <div className="row">
                                    <div className="col-lg-2">
                                        <i className="fa-brands fa-discord"></i>
                                    </div>
                                    <div className="col-lg-10">
                                        <h5>Discord Community Access</h5>
                                        <p>Get access to Discord community to discuss doubts, access assignments and learning with peer interaction.
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    {/* <!---------ToDoList8-------------->

            <!---------ToDoList9--------------> */}
                    <div className="container">
                        <div className="row">
                            <div className="career">
                                <h3>Career & Certification</h3>
                            </div>
                        </div>
                        <div className="row">
                            <div className="col-lg-5">
                                <img src={ require("../assets/images/how-it-works-certificate.webp") } alt="" className="img-fluid" />
                            </div>
                            <div className="col-lg-7">
                                <div className="row">
                                    <div className="accordion9">
                                        <div className="accordion" id="accordionExample">
                                            <div className="card">
                                                <div className="card-header" id="headingOne">
                                                    <h2 className="mb-0">
                                                        <button className="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseOne"
                                                            aria-expanded="true" aria-controls="collapseOne">
                                                            Collapsible Group Item #1
                                                        </button>
                                                    </h2>
                                                </div>

                                                <div id="collapseOne" className="collapse show" aria-labelledby="headingOne"
                                                    data-parent="#accordionExample">
                                                    <div className="card-body">
                                                        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3
                                                        wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum
                                                        eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla
                                                        assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt
                                                        sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer
                                                        farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus
                                                        labore sustainable VHS.
                                                    </div>
                                                </div>
                                            </div>
                                            <div className="card">
                                                <div className="card-header" id="headingTwo">
                                                    <h2 className="mb-0">
                                                        <button className="btn btn-link collapsed" type="button" data-toggle="collapse"
                                                            data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                                            Collapsible Group Item #2
                                                        </button>
                                                    </h2>
                                                </div>
                                                <div id="collapseTwo" className="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
                                                    <div className="card-body">
                                                        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3
                                                        wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum
                                                        eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla
                                                        assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt
                                                        sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer
                                                        farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus
                                                        labore sustainable VHS.
                                                    </div>
                                                </div>
                                            </div>
                                            <div className="card">
                                                <div className="card-header" id="headingThree">
                                                    <h2 className="mb-0">
                                                        <button className="btn btn-link collapsed" type="button" data-toggle="collapse"
                                                            data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                                            Collapsible Group Item #3
                                                        </button>
                                                    </h2>
                                                </div>
                                                <div id="collapseThree" className="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
                                                    <div className="card-body">
                                                        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3
                                                        wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum
                                                        eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla
                                                        assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt
                                                        sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer
                                                        farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus
                                                        labore sustainable VHS.
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    {/* <!---------ToDoList9-------------->

            <!---------ToDoList10--------------> */}
                    <div className="container">
                        <div className="row">
                            <h2>FAQs</h2>
                        </div>
                        <div className="row">
                            <div className="col-lg-12">
                                <div className="row">
                                    <div className="accordion10">
                                        <div className="accordion" id="accordionExample">
                                            <div className="card">
                                                <div className="card-header" id="headingOne">
                                                    <h2 className="mb-0">
                                                        <button className="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseOne"
                                                            aria-expanded="true" aria-controls="collapseOne">
                                                            Collapsible Group Item #1
                                                        </button>
                                                    </h2>
                                                </div>

                                                <div id="collapseOne" className="collapse show" aria-labelledby="headingOne"
                                                    data-parent="#accordionExample">
                                                    <div className="card-body">
                                                        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3
                                                        wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum
                                                        eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla
                                                        assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt
                                                        sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer
                                                        farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus
                                                        labore sustainable VHS.
                                                    </div>
                                                </div>
                                            </div>
                                            <div className="card">
                                                <div className="card-header" id="headingTwo">
                                                    <h2 className="mb-0">
                                                        <button className="btn btn-link collapsed" type="button" data-toggle="collapse"
                                                            data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                                            Collapsible Group Item #2
                                                        </button>
                                                    </h2>
                                                </div>
                                                <div id="collapseTwo" className="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
                                                    <div className="card-body">
                                                        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3
                                                        wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum
                                                        eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla
                                                        assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt
                                                        sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer
                                                        farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus
                                                        labore sustainable VHS.
                                                    </div>
                                                </div>
                                            </div>
                                            <div className="card">
                                                <div className="card-header" id="headingThree">
                                                    <h2 className="mb-0">
                                                        <button className="btn btn-link collapsed" type="button" data-toggle="collapse"
                                                            data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                                            Collapsible Group Item #3
                                                        </button>
                                                    </h2>
                                                </div>
                                                <div id="collapseThree" className="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
                                                    <div className="card-body">
                                                        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3
                                                        wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum
                                                        eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla
                                                        assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt
                                                        sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer
                                                        farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus
                                                        labore sustainable VHS.
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    {/* <!---------ToDoList10-------------->


            <!-- Optional JavaScript -->
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
            </div >
        )

    }
}

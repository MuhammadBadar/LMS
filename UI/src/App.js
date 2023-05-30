/* eslint-disable no-unused-vars */



//import './App.css';
import 'bootstrap/dist/css/bootstrap.min.css';
//import Inquiry from './Component/Inquiry';
//import Customer from './Component/Customer/Customer';
import React from 'react';
import { Navigate, Route, Routes, redirect } from 'react-router-dom';
import MainPage from 'Websites/QST/MainPage/MainPage';
import Courses from 'Websites/QST/Courses/Courses';
import Header from 'Websites/QST/Header/Header';
import Footer from 'Websites/QST/Footer/Footer';
import Schedule from 'Websites/QST/Schedule/Schedule';
import Contact from 'Websites/QST/Pages/Contact/Contact';
import SingleCourse from 'Websites/QST/SingleCourse/SingleCourse';
import Login from 'Websites/QST/Login/Login';
import NotFound from 'Websites/QST/NotFound';
import ManageUser from 'Websites/QST/Pages/User/ManageUser';
import ManageSchedule from 'Websites/QST/Schedule/ManageSchedule';
import Inquiry from 'Component/Inquiry';
import Customer from 'Component/Customer/Customer';
import ManageCourse from 'Websites/QST/Courses/ManageCourse';

function f() {
  var message = "Hello, world!";

  message = "oiiuu"
}
function App() {
  return (

    <div className="App">
      { (window.location.pathname !== "/" && window.location.pathname !== "/backOffice") ? <Header /> : null }
      <Routes>

        <Route path="/" element={ <Login /> } />
        <Route path="singleCourse" element={ <SingleCourse /> } />
        <Route path="mainPage" element={ <MainPage /> } />
        <Route path="course" element={ <Courses /> } />
        <Route path="schedule" element={ <Schedule /> } />
        <Route path="contact" element={ <Contact /> } />
        <Route path="mngCourse" element={ <ManageCourse /> } />
        <Route path="mngSchedule" element={ <ManageSchedule /> } />
        <Route path="mngUser" element={ <ManageUser /> } />
        <Route path="mngInquiry" element={ <Inquiry /> } />
        <Route path="customer" element={ <Customer /> } />
        <Route path="/404" element={ <NotFound /> } />
        <Route path="*" element={ <Navigate to="/404" /> } />

      </Routes>
      { (window.location.pathname !== "/" && window.location.pathname !== "/backOffice") ? <Footer /> : null }
    </div>
  );
}
export default App;

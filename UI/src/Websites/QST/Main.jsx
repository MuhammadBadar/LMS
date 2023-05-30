import React from 'react';
import { Route, Routes } from 'react-router-dom';
import ManageCourse from 'Websites/QST/Courses/ManageCourse';
import Courses from './Courses/Courses';
function Main() {
    return (
        <div className="Main">
            <Routes>
                <Route path="/" element={ <ManageCourse /> } />
                <Route path="course" element={ <Courses /> } />
            </Routes>
        </div>
    );
}

export default Main;

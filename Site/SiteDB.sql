-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 28, 2023 at 03:05 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lms`
--

-- --------------------------------------------------------

--
-- Table structure for table `announcement`
--
DROP TABLE IF EXISTS `announcement`;
CREATE TABLE `announcement` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `announcement`
--

INSERT INTO `announcement` (`id`, `title`, `description`) VALUES
(1, 'AI Based Attendance System', 'Task & Scheduling Based Attendance System would be launched sooner'),
(2, 'English Vocabulary Assistant', 'Now our kids would be able to read, pronounce and understand the most difficult and the most vocabulary rich novel (A Christmas Carol) by our AI based Software'),
(3, 'Accounts & Inventory System', 'Accounts & Inventory system would be launched sooner'),
(4, 'Inquiry Management System', 'Work on Dynamic field based Inquiry Management System is in progress and is planned to release till end of October, 2023'),
(5, 'Patient Visity History Management System', 'Patient Visit History system is going to launch in First Week of October, 2023'),
(6, 'Odoo ERP Development', 'A New Course of Odoo ERP Development is launched. Odoo is a flexible & modular platform for enterprise resource planning and it delivers arrays of applications and modules for business management. ),
(7, 'Project & Task Based Trainings', 'Project & Task-Based Trainings of Software Development Technologies by experienced Software Industry Specialists')


-- --------------------------------------------------------

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `Id` int(11) NOT NULL,
  `Title` varchar(200) NOT NULL,
  `ShortDescription` mediumtext NOT NULL,
  `LogoPath` varchar(100) NOT NULL,
  `Fee` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`Id`, `Title`, `ShortDescription`, `LogoPath`, `Fee`) VALUES
(1, 'Angular Web Development' 
, 'Angular is a Frontend Development Framework provided by Google, mostly used to build responsive, scalable and Single Page Web (SPA) Applications. 
This is the most demanding framework for the Software Industry.'
, '/assets/images/angular-main.png',0)
,
(2, 'React Web Development' 
, 'React is a Frontend Development Library developed by Facebook, mostly used for building interactive user interfaces and web applications quickly and 
efficiently with significantly less code than other frameworks. It is simple to learn and SEO friendly as well.'
, './assets/images/react.png',0)
,
(3, 'PHP Web Development' 
, 'PHP web development uses the PHP language for dynamic websites. It is server-based, integrates with HTML, handles databases, and supports frameworks. 
Used in CMS, e-commerce. Secure, scalable, and very popular.'
, './assets/images/php-main.png',0)
,
(4, 'Flutter Mobile Development' 
, 'Flutter is an open-source framework by Google for building apps on iOS and Android mostly by using a single codebase which results in the faster 
application launch and also the coste effective methodology.'
, './assets/images/flutter-main.jpg',0)
,
(5, 'Odoo ERP Development' 
, 'Odoo is a flexible business software suite with applications for CRM, sales, inventory, HR, and accounting. Its user-friendly design and modular 
structure streamline operations and support businesses of all sizes.'
, './assets/images/odoo-main.png',0)


-- --------------------------------------------------------

27-Jun-2022 — It's used for building interactive user interfaces and web applications quickly and efficiently with significantly less code than you would with ...


--
-- Table structure for table `coursedetails`
--

CREATE TABLE `coursedetails` (
  `id` int(11) NOT NULL,
  `courseId` int(11) NOT NULL,
  `courseDetails` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `coursedetails`
--

INSERT INTO `coursedetails` (`id`, `courseId`, `courseDetails`) VALUES
(1, 1, '<u><b>Course Title:</b></u> Comprehensive Angular Development<u><b><br></b></u><div><u><b>Angular Course Outline:</b></u></div><div>1:Introduction to Angular</div><div>2:Components and Templates</div><div>3:Directives and Pipes</div><div>4:Services and Dependency Injection</div><div>5:Routing and Navigation</div><div>6:Forms and Validation</div><div>7:HTTP and Observables</div><div>8:State Management with NgRx (Optional)</div><div>9:Unit Testing and Debugging</div>\r\n\r\n\r\n\r\n'),
(2, 2, '<div style=\"text-align: left;\"><u style=\"font-weight: bold;\"></u><h3 style=\"\"><u style=\"font-weight: bold;\">Course Title</u>: <span style=\"font-weight: normal;\">Mastering Odoo Development and Customization</span></h3><div><span style=\"font-weight: normal;\"><br></span></div><div><div style=\"color: rgb(33, 37, 41); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px;\"><u style=\"font-weight: bolder;\">Odoo Course outline:</u><span style=\"font-weight: bolder;\">&nbsp;</span></div><div style=\"color: rgb(33, 37, 41); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px;\"><b><br>Introduction to Odoo</b><br><ul><li>Setting Up Odoo Development Environment</li><li>Building Odoo Modules</li><li>Data Management in Odoo</li><li>Odoo User Interface Customization</li><li>Business Logic with Odoo APIs</li><li>Odoo Workflows and Business Processes</li><li>Security and Access Control</li><li>Integrating with Other Systems</li><li>Odoo Deployment and Performance Optimization</li></ul></div></div><b><h4></h4><h1></h1> &nbsp;</b></div>oyment and Performance Optimization</div></div><div><br></div>'),
(3, 3, '<div><u style=\"font-weight: bold;\">Course Title: </u>Complete Flutter Development<br></div><div><u><b>Flutter Course Outline:</b></u></div><div>1:Introduction to Flutter</div><div>2:Dart Programming Basics</div><div>3:Flutter Widgets and UI</div><div>&nbsp;4:Navigation and Routing</div><div>5:State Management</div><div>6:Networking and API Integration</div><div>7:Forms and User Input</div><div>8:Persistence and Local Storage</div><div>9:Flutter Animation and Effects</div><div>10:Flutter Widgets for UI Polish</div>'),
(4, 4, '<div><u><b>Course Title</b></u>: Complete PHP Web Development</div><div><div><u><b>Introduction to PHP</b></u></div><div>&nbsp;1:PHP Basics</div><div>&nbsp;2:Working with HTML and PHP</div><div>&nbsp;3:PHP Arrays</div><div>&nbsp;4:PHP and Databases</div><div>&nbsp;5:PHP Object-Oriented Programming (OOP)</div><div>&nbsp;6:PHP Security</div><div>&nbsp;7:PHP and APIs</div><div>&nbsp;8:Error Handling and Debugging</div><div>&nbsp;9:PHP Frameworks&nbsp;</div><div>10:Building a Complete Web Application</div></div><div><br></div>'),
(5, 5, '<b>Course Title:</b> Angular Development<div><b><u><br></u></b></div><div><b><u>Course Outlines:</u></b><div><ul><li>Line1</li><li>Line2</li><li>Line 3</li> <li>Line4</li><li>Line5</li></ul></div><div><br>\r\n</div></div>'),
(6, 6, '<b>Course Title:</b> Software Development<div><b><u><br></u></b></div><div><b><u>Course Outlines:</u></b><div><ul><li>Line 1</li><li>Line 2</li><li>Line 3</li><li>Line 4</li><li>Line 5</li><li>Line 6</li> </ul></div><div><br>\r\n</div></div>'),
(7, 7, '<b>Course Title:</b> React<div><b><u><br></u></b></div><div><b><u>Course Outlines:</u></b><div><ul><li>Line 1</li><li>Line 2</li><li>Line 3</li><li>Line 4</li><li>Line 5</li><li>Line 6</li><li>Line 7</li> </ul></div><div><br>\r\n</div></div>'),
(8, 8, '<b>Course Title:</b> Js<div><b><u><br></u></b></div><div><b><u>Course Outlines:</u></b><div><ul><li>Line 1</li><li>Line 2</li><li>Line 3</li><li>Line 4</li><li>Line 5</li><li>Line 6</li><li>Line 7</li><li>Line 8</li> </ul></div><div><br>\r\n</div></div>'),
(9, 9, '<b>Course Title:</b> C#<div><b><u><br></u></b></div><div><b><u>Course Outlines:</u></b><div><ul><li>Line 1</li><li>Line 2</li><li>Line 3</li><li>Line 4</li><li>Line 5</li><li>Line 6</li><li>Line 7</li><li>Line 8</li><li>Line 9</li> </ul></div><div><br></div></div>'),
(10, 10, '<div style=\"text-align: left;\"><u style=\"font-weight: bold;\"></u><h3 style=\"\"><u style=\"font-weight: bold;\">Course Title</u>: <span style=\"font-weight: normal;\">Mastering Odoo Development and Customization</span></h3><div><span style=\"font-weight: normal;\"><br></span></div><div><div style=\"color: rgb(33, 37, 41); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px;\"><u style=\"font-weight: bolder;\">Odoo Course outline:</u><span style=\"font-weight: bolder;\">&nbsp;</span></div><div style=\"color: rgb(33, 37, 41); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px;\"><b><br>Introduction to Odoo</b><br><ul><li>Setting Up Odoo Development Environment</li><li>Building Odoo Modules</li><li>Data Management in Odoo</li><li>Odoo User Interface Customization</li><li>Business Logic with Odoo APIs</li><li>Odoo Workflows and Business Processes</li><li>Security and Access Control</li><li>Integrating with Other Systems</li><li>Odoo Deployment and Performance Optimization</li></ul></div></div><b><h4></h4><h1></h1> &nbsp;</b></div>'),
(11, 11, '<b>Course Title:</b> MySQL<div><b><u><br></u></b></div><div><b><u>Course Outlines:</u></b><div><ul><li>Line 1</li><li>Line 2</li><li>Line 3</li><li>Line 4</li><li>Line 5</li><li>Line 6</li><li>Line 7</li><li>Line 8</li><li>Line 9</li><li>Line 10</li> <li>Line 11</li></ul></div><div><br></div></div>');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `eventTitle` varchar(255) NOT NULL,
  `eventPlace` varchar(200) NOT NULL,
  `startTime` time NOT NULL,
  `endTime` time NOT NULL,
  `eventDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `eventTitle`, `eventPlace`, `startTime`, `endTime`, `eventDate`) VALUES
(1, 'Angular Orientation Class', 'A Free Orientation Class of Angular Web Development using Angular & WebAPI Core is scheduled', '11:00:00', '12:30:00', '2023-09-09'),
(2, 'Php Orientation Class', 'A Free Orientation Class of Web Development using PhP is scheduled', '12:30:00', '14:00:00', '2023-09-09'),
(3, 'React Orientation Class', 'A Free Orientation Class of Web Development using React & WebAPI Core is scheduled', '14:00:00', '15:30:00', '2023-09-09'),
(4, 'Flutter Orientation Class', 'A Free Orientation Class of Android & IOS Development using Flutter is scheduled', '15:30:00', '17:00:00', '2023-09-09'),

(5, 'Angular Orientation Class', 'A Free Orientation Class of Angular Web Development using Angular & WebAPI Core is scheduled', '11:00:00', '12:30:00', '2023-09-16'),
(6, 'Php Orientation Class', 'A Free Orientation Class of Web Development using PhP is scheduled', '12:30:00', '14:00:00', '2023-09-16'),
(7, 'React Orientation Class', 'A Free Orientation Class of Web Development using React & WebAPI Core is scheduled', '14:00:00', '15:30:00', '2023-09-16'),
(8, 'Flutter Orientation Class', 'A Free Orientation Class of Android & IOS Development using Flutter is scheduled', '15:30:00', '17:00:00', '2023-09-16')



DROP TABLE IF EXISTS `Events`;
CREATE TABLE `Events` (
  `id` int(11) NOT NULL,
  `eventTitle` varchar(255) NOT NULL,
  `eventPlace` varchar(200) NOT NULL,
  `startTime` time NOT NULL,
  `endTime` time NOT NULL,
  `eventDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `eventTitle`, `eventPlace`, `startTime`, `endTime`, `eventDate`) VALUES
(1, 'Angular Orientation Class', 'A Free Orientation Class of Angular Web Development in Angular is planned on coming Satuday', '11:00:00', '12:30:00', '2023-09-09'),
(2, 'Php Orientation Class', 'A Free Orientation Class of Web Development in PhP is planned on coming Satuday', '12:30:00', '14:00:00', '2023-09-09'),


-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `Password` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id`, `username`, `Password`) VALUES
(1, 'Hira ', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `Id` int(11) NOT NULL,
  `logoPath` varchar(255) NOT NULL,
  `title` varchar(200) NOT NULL,
  `StartTime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`Id`, `logoPath`, `title`, `StartTime`) VALUES
(1, './assets/images/Jquery.png', 'JQuerry', '2023-08-08 20:24:33'),
(2, './assets/images/JavaScript.png', 'JavaScript', '2023-08-08 20:54:36'),
(3, './assets/images/Android.png', 'Android', '2023-08-08 21:00:00'),
(4, './assets/images/IOS.png', 'IOS', '2023-08-08 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `cellno` varchar(15) NOT NULL,
  `message` varchar(255) NOT NULL,
  `createdbyid` int(11) NOT NULL,
  `createdon` datetime DEFAULT NULL,
  `modifiedon` datetime DEFAULT NULL,
  `modifiedbyid` int(11) NOT NULL,
  `isactive` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `cellno`, `message`, `createdbyid`, `createdon`, `modifiedon`, `modifiedbyid`, `isactive`) VALUES
(56, 'Hira Naeem', 'hiranaeem789z@gmail.com', '03007922180', 'test', 0, NULL, NULL, 0, b'0'),
(58, 'Hira Naeem', 'hiranaeem789z@gmail.com', '03007922180', 'test', 0, NULL, NULL, 0, b'0'),
(59, 'Hira Naeem', 'hiranaeem789z@gmail.com', '03007922180', 'test', 0, NULL, NULL, 0, b'0'),
(60, 'Hira Naeem', 'hiranaeem789z@gmail.com', '03007922180', 'Hira', 0, NULL, NULL, 0, b'0'),
(62, 'Hira princess', 'hiraprincess@gmail.com', '03191195639', 'hi,hira here.', 0, NULL, NULL, 0, b'0'),
(67, 'ii', 'abc@gmail.com', '399934949', 'Testing ...', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, b'0'),
(68, 'Hira Naeem', 'hiranaeem789z@gmail.com', '03007922180', 'aa', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, b'0');

-- --------------------------------------------------------

--
-- Table structure for table `videolecture`
--

CREATE TABLE `videolecture` (
  `id` int(11) NOT NULL,
  `Title` varchar(200) NOT NULL,
  `Lec.No` varchar(200) NOT NULL,
  `URL` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `videolecture`
--

INSERT INTO `videolecture` (`id`, `Title`, `Lec.No`, `URL`) VALUES
(1, 'Angular WebDevelopment', '1', 'https://www.youtube.com/embed/iesHNJnzVQw'),
(2, 'Odoo', '1 ', 'https://www.youtube.com/embed/iesHNJnzVQw'),
(1, 'Angular WebDevelopment', '2', 'https://www.youtube.com/embed/iesHNJnzVQw');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `announcement`
--
ALTER TABLE `announcement`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `coursedetails`
--
ALTER TABLE `coursedetails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `test` (`courseId`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `announcement`
--
ALTER TABLE `announcement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `schedule`
--
ALTER TABLE `schedule`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

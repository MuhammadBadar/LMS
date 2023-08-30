-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 29, 2023 at 02:10 PM
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
(1, 'WEb DEVELOPMENT', 'TESTING...'),
(2, ' dd', 'dd'),
(3, ' web', 'c');

-- --------------------------------------------------------

--
-- Table structure for table `course`
--
DROP TABLE IF EXISTS `Course`;
CREATE TABLE `Course` (
  `Id` int(11) NOT NULL,
  `Fee` double NOT NULL,
  `ShortDescription` mediumtext NOT NULL,
  `Title` varchar(200) NOT NULL,
  `LogoPath` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course`
--

INSERT INTO `Course` (`Id`, `Fee`, `ShortDescription`, `Title`, `LogoPath`) VALUES
(1, 12000, 'Odoo is a flexible business software suite with applications for CRM, sales, inventory, HR, and accounting. Its user-friendly design and modular structure streamline operations and support businesses of all sizes.', 'Odoo', './assets/images/odoo-main.png'),
(2, 12000, 'Flutter is an open-source framework by Google for building apps on iOS, Android, web, and desktop platforms. With a single codebase, it offers beautiful UI, fast performance, and  \"Hot Reload\" for quick testing.', 'Flutter', './assets/images/flutter-main.jpg'),
(3, 12000, 'PHP web development uses the PHP language for dynamic websites. It\'s server-based, integrates with HTML, handles databases, and supports frameworks. Used in CMS, e-commerce. Secure, scalable, and and popular.', 'PHP Web Development', './assets/images/php-main.png'),
(4, 12000, 'Angular is a powerful open-source framework developed by Google, crafts dynamic web apps. It simplifies coding, offers two-way data binding, and eases development with TypeScript and CLI tools.', 'Angular', './assets/images/angular-main.png');

-- --------------------------------------------------------

--
-- Table structure for table `coursedetails`
--

DROP TABLE IF EXISTS `CourseDetails`;
CREATE TABLE `CourseDetails` (
  `id` int(11) NOT NULL,
  `courseId` int(11) NOT NULL,
  `CourseDetails` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `coursedetails`
--

INSERT INTO `CourseDetails` (`id`, `courseId`, `CourseDetails`) VALUES
(1, 1, '<div style=\"text-align: left;\"><u style=\"font-weight: bold;\"></u><h3 style=\"\"><u style=\"font-weight: bold;\">Course Title</u>: <span style=\"font-weight: normal;\">Mastering Odoo Development and Customization</span></h3><div><span style=\"font-weight: normal;\"><br></span></div><div><div style=\"color: rgb(33, 37, 41); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px;\"><u style=\"font-weight: bolder;\">Odoo Course outline:</u><span style=\"font-weight: bolder;\">&nbsp;</span></div><div style=\"color: rgb(33, 37, 41); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px;\"><b><br>Introduction to Odoo</b><br><ul><li>Setting Up Odoo Development Environment</li><li>Building Odoo Modules</li><li>Data Management in Odoo</li><li>Odoo User Interface Customization</li><li>Business Logic with Odoo APIs</li><li>Odoo Workflows and Business Processes</li><li>Security and Access Control</li><li>Integrating with Other Systems</li><li>Odoo Deployment and Performance Optimization</li></ul></div></div><b><h4></h4><h1></h1> &nbsp;</b></div>oyment and Performance Optimization</div></div><div><br></div>'),
(2, 2, '<div style=\"\"><h3 style=\"margin-bottom: 0.5rem; font-weight: 500; line-height: 1.2; font-size: 1.75rem; color: rgb(33, 37, 41); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;\"><u style=\"font-weight: bold;\">Course Title</u>:&nbsp;Complete Flutter Development</h3><div style=\"color: rgb(33, 37, 41); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px;\"><br></div><div style=\"\"><div style=\"color: rgb(33, 37, 41); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px;\"><u style=\"font-weight: bolder;\">Flutter Course outline:</u><span style=\"font-weight: bolder;\">&nbsp;</span></div><div style=\"\"><span style=\"color: rgb(33, 37, 41); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-weight: bolder;\"><br>Introduction to Flutter</span><br><ul style=\"margin-top: 0px; margin-bottom: 1rem; margin-left: 200px;\"><li style=\"\"><font color=\"#212529\" face=\"-apple-system, BlinkMacSystemFont, Segoe UI, Roboto, Helvetica Neue, Arial, Noto Sans, sans-serif, Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol, Noto Color Emoji\">Introduction to Flutter</font><br></li><li style=\"\"><font color=\"#212529\" face=\"-apple-system, BlinkMacSystemFont, Segoe UI, Roboto, Helvetica Neue, Arial, Noto Sans, sans-serif, Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol, Noto Color Emoji\">Dart Programming Basics</font><br></li><li style=\"\"><font color=\"#212529\" face=\"-apple-system, BlinkMacSystemFont, Segoe UI, Roboto, Helvetica Neue, Arial, Noto Sans, sans-serif, Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol, Noto Color Emoji\">Flutter Widgets and UI</font><br></li><li style=\"\"><font color=\"#212529\" face=\"-apple-system, BlinkMacSystemFont, Segoe UI, Roboto, Helvetica Neue, Arial, Noto Sans, sans-serif, Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol, Noto Color Emoji\">Navigation and Routing</font><br></li><li style=\"\"><font color=\"#212529\" face=\"-apple-system, BlinkMacSystemFont, Segoe UI, Roboto, Helvetica Neue, Arial, Noto Sans, sans-serif, Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol, Noto Color Emoji\">State Management</font><br></li><li style=\"\"><font color=\"#212529\" face=\"-apple-system, BlinkMacSystemFont, Segoe UI, Roboto, Helvetica Neue, Arial, Noto Sans, sans-serif, Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol, Noto Color Emoji\">Networking and API Integration</font><br></li><li style=\"\"><font color=\"#212529\" face=\"-apple-system, BlinkMacSystemFont, Segoe UI, Roboto, Helvetica Neue, Arial, Noto Sans, sans-serif, Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol, Noto Color Emoji\">Forms and User Input</font></li><li style=\"\"><font color=\"#212529\" face=\"-apple-system, BlinkMacSystemFont, Segoe UI, Roboto, Helvetica Neue, Arial, Noto Sans, sans-serif, Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol, Noto Color Emoji\">Persistence and Local Storage</font><br></li><li style=\"\">Flutter Animation and Effects<br></li><li style=\"\">Flutter Widgets for UI Polish<br></li></ul></div></div></div>'),
(3, 3, '<div style=\"\"><h3 style=\"margin-bottom: 0.5rem; font-weight: 500; line-height: 1.2; font-size: 1.75rem; color: rgb(33, 37, 41); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;\"><u style=\"font-weight: bold;\">Course Title</u>:&nbsp;&nbsp;Complete PHP Web Development</h3><div style=\"color: rgb(33, 37, 41); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px;\"><br></div><div style=\"\"><div style=\"color: rgb(33, 37, 41); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px;\"><u style=\"font-weight: bolder;\">PHP Course outline:</u><span style=\"font-weight: bolder;\">&nbsp;</span></div><div style=\"\"><span style=\"color: rgb(33, 37, 41); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-weight: bolder;\"><br>Introduction to PHP</span><br><ul style=\"margin-top: 0px; margin-bottom: 1rem; margin-left: 200px;\"><li style=\"\"><font color=\"#212529\" face=\"-apple-system, BlinkMacSystemFont, Segoe UI, Roboto, Helvetica Neue, Arial, Noto Sans, sans-serif, Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol, Noto Color Emoji\">PHP Basics</font><br></li><li style=\"\"><font color=\"#212529\" face=\"-apple-system, BlinkMacSystemFont, Segoe UI, Roboto, Helvetica Neue, Arial, Noto Sans, sans-serif, Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol, Noto Color Emoji\">Working with HTML and PHP</font><br></li><li style=\"\"><font color=\"#212529\" face=\"-apple-system, BlinkMacSystemFont, Segoe UI, Roboto, Helvetica Neue, Arial, Noto Sans, sans-serif, Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol, Noto Color Emoji\">PHP Arrays</font><br></li><li style=\"\"><font color=\"#212529\" face=\"-apple-system, BlinkMacSystemFont, Segoe UI, Roboto, Helvetica Neue, Arial, Noto Sans, sans-serif, Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol, Noto Color Emoji\">PHP and Databases</font><br></li><li style=\"\"><font color=\"#212529\" face=\"-apple-system, BlinkMacSystemFont, Segoe UI, Roboto, Helvetica Neue, Arial, Noto Sans, sans-serif, Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol, Noto Color Emoji\">PHP Object-Oriented Programming (OOP)</font><br></li><li style=\"\"><font color=\"#212529\" face=\"-apple-system, BlinkMacSystemFont, Segoe UI, Roboto, Helvetica Neue, Arial, Noto Sans, sans-serif, Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol, Noto Color Emoji\">Error Handling and Debugging</font><br></li><li style=\"\"><font color=\"#212529\" face=\"-apple-system, BlinkMacSystemFont, Segoe UI, Roboto, Helvetica Neue, Arial, Noto Sans, sans-serif, Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol, Noto Color Emoji\">PHP Security</font><br></li><li style=\"\"><font color=\"#212529\" face=\"-apple-system, BlinkMacSystemFont, Segoe UI, Roboto, Helvetica Neue, Arial, Noto Sans, sans-serif, Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol, Noto Color Emoji\">PHP and APIs</font><br></li><li style=\"\">PHP Frameworks&nbsp;<br></li><li style=\"\">Building a Complete Web Application<br></li></ul></div></div></div>'),
(4, 4, '<div style=\"\"><h3 style=\"margin-bottom: 0.5rem; font-weight: 500; line-height: 1.2; font-size: 1.75rem; color: rgb(33, 37, 41); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;\"><u style=\"font-weight: bold;\">Course Title</u>:&nbsp;&nbsp;Complete Angular Development</h3><div style=\"color: rgb(33, 37, 41); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px;\"><br></div><div style=\"\"><div style=\"color: rgb(33, 37, 41); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px;\"><u style=\"font-weight: bolder;\">Angular Course outline:</u><span style=\"font-weight: bolder;\">&nbsp;</span></div><div style=\"\"><span style=\"color: rgb(33, 37, 41); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-weight: bolder;\"><br>Introduction to Angular</span><br><ul style=\"margin-top: 0px; margin-bottom: 1rem; margin-left: 200px;\"><li style=\"\"><font color=\"#212529\" face=\"-apple-system, BlinkMacSystemFont, Segoe UI, Roboto, Helvetica Neue, Arial, Noto Sans, sans-serif, Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol, Noto Color Emoji\">Components and Templates</font><br></li><li style=\"\"><font color=\"#212529\" face=\"-apple-system, BlinkMacSystemFont, Segoe UI, Roboto, Helvetica Neue, Arial, Noto Sans, sans-serif, Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol, Noto Color Emoji\">Directives and Pipes</font><br></li><li style=\"\"><font color=\"#212529\" face=\"-apple-system, BlinkMacSystemFont, Segoe UI, Roboto, Helvetica Neue, Arial, Noto Sans, sans-serif, Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol, Noto Color Emoji\">Services and Dependency Injection</font><br></li><li style=\"\"><font color=\"#212529\" face=\"-apple-system, BlinkMacSystemFont, Segoe UI, Roboto, Helvetica Neue, Arial, Noto Sans, sans-serif, Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol, Noto Color Emoji\">Routing and Navigation</font><br></li><li style=\"\"><font color=\"#212529\" face=\"-apple-system, BlinkMacSystemFont, Segoe UI, Roboto, Helvetica Neue, Arial, Noto Sans, sans-serif, Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol, Noto Color Emoji\">Forms and Validation</font><br></li><li style=\"\"><font color=\"#212529\" face=\"-apple-system, BlinkMacSystemFont, Segoe UI, Roboto, Helvetica Neue, Arial, Noto Sans, sans-serif, Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol, Noto Color Emoji\">HTTP and Observables</font><br></li><li style=\"\"><font color=\"#212529\" face=\"-apple-system, BlinkMacSystemFont, Segoe UI, Roboto, Helvetica Neue, Arial, Noto Sans, sans-serif, Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol, Noto Color Emoji\">State Management with NgRx (Optional)</font><br></li><li style=\"\"><font color=\"#212529\" face=\"-apple-system, BlinkMacSystemFont, Segoe UI, Roboto, Helvetica Neue, Arial, Noto Sans, sans-serif, Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol, Noto Color Emoji\">Unit Testing and Debugging</font></li></ul></div></div></div>');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--
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
(1, 'webDevelopment', 'QamSoft Technologies', '04:12:00', '04:18:00', '2023-08-29'),
(2, 'webDevelopment', 'QamSoft Technologies', '04:12:00', '04:15:00', '2023-08-28');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

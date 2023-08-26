-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 26, 2023 at 10:43 AM
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

CREATE TABLE `announcement` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `announcement`
--

INSERT INTO `announcement` (`id`, `title`, `description`) VALUES
(2, 'WEb DEVELOPMENT', 'TESTING...');

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `Id` int(11) NOT NULL,
  `Fee` double NOT NULL,
  `ShortDescription` mediumtext NOT NULL,
  `Title` varchar(200) NOT NULL,
  `LogoPath` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`Id`, `Fee`, `ShortDescription`, `Title`, `LogoPath`) VALUES
(2, 12000, 'Odoo is a flexible business software suite with applications for CRM, sales, inventory, HR, and accounting. Its user-friendly design and modular structure streamline operations and support businesses of all sizes.', 'Odoo', './assets/images/odoo-main.png'),
(3, 12000, 'Flutter is an open-source framework by Google for building apps on iOS, Android, web, and desktop platforms. With a single codebase, it offers beautiful UI, fast performance, and ', 'Flutter.......', './assets/images/flutter-main.jpg'),
(4, 12000, 'PHP web development uses the PHP language for dynamic websites. It\'s server-based, integrates with HTML, handles databases, and supports frameworks. Used in CMS, e-commerce. Secure, scalable, and and popular.', 'PHP Web Development', './assets/images/php-main.png'),
(25, 0, 'Hypertext Preprocessor Language', 'php..............', 'use input type here'),
(26, 0, 'this is a frontend language', 'react', 'angular-main.jpg'),
(28, 0, 'hello', 'odoo', 'odoo-main.png'),
(29, 0, 'Testing', 'abc', '.net2.png'),
(30, 0, 'yuuu', 'huuu', 'angular-main.png'),
(31, 0, 'Hypertext Preprocessor Language', 'oop', '.net.png'),
(33, 0, 'Hypertext Preprocessor Language', 'oop', '6ec677d9-a18b-4ea3-8842-3586e8e8cd5b.jpg'),
(34, 0, 'Hypertext Preprocessor Language', 'oop', 'angular-main.png'),
(35, 0, 'Hypertext Preprocessor Language', 'PHP', '6ec677d9-a18b-4ea3-8842-3586e8e8cd5b.jpg');

-- --------------------------------------------------------

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
(2, 2, '<div><u><b>Course Title:</b></u><span style=\"font-weight: bold;\"> </span>Mastering Odoo Development and Customization<u><b><br></b></u><div><u><b>Odoo Course outline:</b></u></div><div>1:Introduction to Odoo</div><div>&nbsp;2:Setting Up Odoo Development Environment</div><div>&nbsp;3:Building Odoo Modules</div><div>4:Data Management in Odoo</div><div>5:Odoo User Interface Customization</div><div>6:Business Logic with Odoo APIs</div><div>7:Odoo Workflows and Business Processes</div><div>8:Security and Access Control</div><div>9:Integrating with Other Systems</div><div>10:Odoo Deployment and Performance Optimization</div></div><div><br></div>'),
(3, 3, '<div><u style=\"font-weight: bold;\">Course Title: </u>Complete Flutter Development<br></div><div><u><b>Flutter Course Outline:</b></u></div><div>1:Introduction to Flutter</div><div>2:Dart Programming Basics</div><div>3:Flutter Widgets and UI</div><div>&nbsp;4:Navigation and Routing</div><div>5:State Management</div><div>6:Networking and API Integration</div><div>7:Forms and User Input</div><div>8:Persistence and Local Storage</div><div>9:Flutter Animation and Effects</div><div>10:Flutter Widgets for UI Polish</div>'),
(4, 4, '<div><u><b>Course Title</b></u>: Complete PHP Web Development</div><div><div><u><b>Introduction to PHP</b></u></div><div>&nbsp;1:PHP Basics</div><div>&nbsp;2:Working with HTML and PHP</div><div>&nbsp;3:PHP Arrays</div><div>&nbsp;4:PHP and Databases</div><div>&nbsp;5:PHP Object-Oriented Programming (OOP)</div><div>&nbsp;6:PHP Security</div><div>&nbsp;7:PHP and APIs</div><div>&nbsp;8:Error Handling and Debugging</div><div>&nbsp;9:PHP Frameworks&nbsp;</div><div>10:Building a Complete Web Application</div></div><div><br></div>'),
(5, 5, '<b>Course Title:</b> Angular Development<div><b><u><br></u></b></div><div><b><u>Course Outlines:</u></b><div><ul><li>Line1</li><li>Line2</li><li>Line 3</li> <li>Line4</li><li>Line5</li></ul></div><div><br>\r\n</div></div>'),
(6, 6, '<b>Course Title:</b> Software Development<div><b><u><br></u></b></div><div><b><u>Course Outlines:</u></b><div><ul><li>Line 1</li><li>Line 2</li><li>Line 3</li><li>Line 4</li><li>Line 5</li><li>Line 6</li> </ul></div><div><br>\r\n</div></div>'),
(7, 7, '<b>Course Title:</b> React<div><b><u><br></u></b></div><div><b><u>Course Outlines:</u></b><div><ul><li>Line 1</li><li>Line 2</li><li>Line 3</li><li>Line 4</li><li>Line 5</li><li>Line 6</li><li>Line 7</li> </ul></div><div><br>\r\n</div></div>'),
(8, 8, '<b>Course Title:</b> Js<div><b><u><br></u></b></div><div><b><u>Course Outlines:</u></b><div><ul><li>Line 1</li><li>Line 2</li><li>Line 3</li><li>Line 4</li><li>Line 5</li><li>Line 6</li><li>Line 7</li><li>Line 8</li> </ul></div><div><br>\r\n</div></div>'),
(9, 9, '<b>Course Title:</b> C#<div><b><u><br></u></b></div><div><b><u>Course Outlines:</u></b><div><ul><li>Line 1</li><li>Line 2</li><li>Line 3</li><li>Line 4</li><li>Line 5</li><li>Line 6</li><li>Line 7</li><li>Line 8</li><li>Line 9</li> </ul></div><div><br></div></div>'),
(10, 10, '<b>Course Title:</b> MySQL<div><b><u><br></u></b></div><div><b><u>Course Outlines:</u></b><div><ul><li>Line 1</li><li>Line 2</li><li>Line 3</li><li>Line 4</li><li>Line 5</li><li>Line 6</li><li>Line 7</li><li>Line 8</li><li>Line 9</li><li>Line 10</li> </ul></div><div><br></div></div>'),
(11, 11, '<b>Course Title:</b> MySQL<div><b><u><br></u></b></div><div><b><u>Course Outlines:</u></b><div><ul><li>Line 1</li><li>Line 2</li><li>Line 3</li><li>Line 4</li><li>Line 5</li><li>Line 6</li><li>Line 7</li><li>Line 8</li><li>Line 9</li><li>Line 10</li> <li>Line 11</li></ul></div><div><br></div></div>');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

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
(1, 'Web Development', 'Qam-Soft Technologies', '00:00:22', '00:00:23', '0000-00-00'),
(7, 'web', 'software', '12:00:00', '13:00:00', '2023-12-23'),
(8, 'web', 'software', '12:00:00', '13:00:00', '2023-12-23');

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
(62, 'Hira princess', 'hiraprincess@gmail.com', '03191195639', 'hi,hira here.', 0, NULL, NULL, 0, b'0');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

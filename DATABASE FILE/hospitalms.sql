
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `hospitalms`
--
-- Table structure for table `admintb`
CREATE TABLE `admintb` (
  `username` varchar(50) NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table `admintb`
INSERT INTO `admintb` (`username`, `password`) VALUES
('admin', 'admin123');

-- Table structure for table `contact`
CREATE TABLE `contact` (
  `name` varchar(30) NOT NULL,
  `email` text NOT NULL,
  `contact` varchar(10) NOT NULL,
  `message` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table `contact`
INSERT INTO `contact` (`name`, `email`, `contact`, `message`) VALUES
('Demo', 'demo@demail.com', '7014500000', 'this is a demo test');

-- Table structure for table `patreg`
CREATE TABLE `patreg` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(20) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `email` varchar(30) NOT NULL,
  `contact` varchar(10) NOT NULL,
  `password` varchar(30) NOT NULL,
  `cpassword` varchar(30) NOT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table `patreg`
INSERT INTO `patreg` (`pid`, `fname`, `lname`, `gender`, `email`, `contact`, `password`, `cpassword`) VALUES
(1, 'Liam', 'Moore', 'Male', 'liam@gmail.com', '7412225680', 'password', 'password');

-- Table structure for table `doctb`
CREATE TABLE `doctb` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `doctorname` varchar(255) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `spec` varchar(50) NOT NULL,
  `docFees` int(5) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table `doctb`
INSERT INTO `doctb` (`username`, `password`, `doctorname`, `email`, `spec`, `docFees`)
VALUES ('ryan', 'password', 'Ryan Chandler', 'ryanc@gmail.com', 'Pediatrician', 440);

-- Table structure for table `appointmenttb`
CREATE TABLE `appointmenttb` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL,
  `doctor` varchar(50) NOT NULL,
  `docFees` int(5) NOT NULL,
  `appdate` date NOT NULL,
  `apptime` time NOT NULL,
  `userStatus` int(5) NOT NULL,
  `doctorStatus` int(5) NOT NULL,
  PRIMARY KEY (`ID`),
  FOREIGN KEY (`pid`) REFERENCES `patreg`(`pid`),
  FOREIGN KEY (`doctor`) REFERENCES `doctb`(`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table `appointmenttb`
INSERT INTO `appointmenttb` (`pid`, `doctor`, `docFees`, `appdate`, `apptime`, `userStatus`, `doctorStatus`)
VALUES (1, 'ryan', 440, '2021-07-06', '10:00:00', 1, 1);



-- Table structure for table `prestb`
CREATE TABLE `prestb` (
  `prescriptionID` int(11) NOT NULL AUTO_INCREMENT,
  `doctor` varchar(50) NOT NULL,
  `pid` int(11) NOT NULL,
  -- `fname` varchar(50) NOT NULL,
  -- `lname` varchar(50) NOT NULL,
  `appdate` date NOT NULL,
  `apptime` time NOT NULL,
  `disease` varchar(250) NOT NULL,
  `allergy` varchar(250) NOT NULL,
  `prescription` varchar(1000) NOT NULL,
  PRIMARY KEY (`prescriptionID`),
  FOREIGN KEY (`pid`) REFERENCES `patreg`(`pid`),
  FOREIGN KEY (`doctor`) REFERENCES `doctb`(`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table `prestb`
-- INSERT INTO `prestb` (`doctor`, `pid`, `fname`, `lname`, `appdate`, `apptime`, `disease`, `allergy`, `prescription`)
-- VALUES ('ryan', 1, 'Curtis', 'Hicks', '2021-07-05', '10:00:00', 'Tuberculosis', 'lumpy rash on the legs - or lupus vulgaris which gives lumps or ulcers', 'Isoniazid, Ethambutol (Myambutol), Linezolid (Zyvox)');

INSERT INTO `prestb` (`doctor`, `pid`, `appdate`, `apptime`, `disease`, `allergy`, `prescription`)
VALUES ('ryan', 1, '2021-07-05', '10:00:00', 'Tuberculosis', 'lumpy rash on the legs - or lupus vulgaris which gives lumps or ulcers', 'Isoniazid, Ethambutol (Myambutol), Linezolid (Zyvox)');

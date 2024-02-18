-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 19, 2024 at 12:26 AM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `guard_healthy_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `appointmentid` varchar(20) NOT NULL,
  `childid` varchar(50) NOT NULL,
  `providerid` varchar(50) NOT NULL,
  `date` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`appointmentid`, `childid`, `providerid`, `date`) VALUES
('54321', '12345', '123456', '2024-02-19');

-- --------------------------------------------------------

--
-- Table structure for table `childtable`
--

CREATE TABLE `childtable` (
  `ChildID` varchar(30) NOT NULL,
  `name` varchar(50) NOT NULL,
  `dob` varchar(50) NOT NULL,
  `gender` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `childtable`
--

INSERT INTO `childtable` (`ChildID`, `name`, `dob`, `gender`) VALUES
('1234', 'Eric', '2024-02-18', 'Female'),
('12345', 'ewf', '2024-02-19', 'Female'),
('432', 'hedjwg', '2024-02-19', 'Male');

-- --------------------------------------------------------

--
-- Table structure for table `guardian`
--

CREATE TABLE `guardian` (
  `guardianid` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `guardian`
--

INSERT INTO `guardian` (`guardianid`, `name`, `email`) VALUES
('32423', 'nmsed', 'ewrf');

-- --------------------------------------------------------

--
-- Table structure for table `provider`
--

CREATE TABLE `provider` (
  `providerid` varchar(20) NOT NULL,
  `providername` varchar(50) NOT NULL,
  `contactinfo` varchar(50) NOT NULL,
  `speciality` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `provider`
--

INSERT INTO `provider` (`providerid`, `providername`, `contactinfo`, `speciality`) VALUES
('0899', 'Eric', '078788', 'earsdytu'),
('123456', 'frwsd', 'efw', 'erg');

-- --------------------------------------------------------

--
-- Table structure for table `recordtable`
--

CREATE TABLE `recordtable` (
  `RecordId` int(10) NOT NULL,
  `vid` varchar(50) NOT NULL,
  `vname` varchar(50) NOT NULL,
  `administrateddate` varchar(40) NOT NULL,
  `nextdate` varchar(30) NOT NULL,
  `childid` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userid` int(10) NOT NULL,
  `names` varchar(50) NOT NULL,
  `username` varchar(40) NOT NULL,
  `password` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userid`, `names`, `username`, `password`) VALUES
(1, 'Manishimwe Eric', 'eric', '12345'),
(2, 'swaertyu', 'data', '123');

-- --------------------------------------------------------

--
-- Table structure for table `vaccine`
--

CREATE TABLE `vaccine` (
  `vaccineid` varchar(20) NOT NULL,
  `description` varchar(50) NOT NULL,
  `age` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vaccine`
--

INSERT INTO `vaccine` (`vaccineid`, `description`, `age`) VALUES
('12234', 'Eriofre;sl', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`appointmentid`),
  ADD KEY `fh_providerid` (`providerid`),
  ADD KEY `fh_ChildID` (`childid`);

--
-- Indexes for table `childtable`
--
ALTER TABLE `childtable`
  ADD PRIMARY KEY (`ChildID`);

--
-- Indexes for table `guardian`
--
ALTER TABLE `guardian`
  ADD PRIMARY KEY (`guardianid`);

--
-- Indexes for table `provider`
--
ALTER TABLE `provider`
  ADD PRIMARY KEY (`providerid`);

--
-- Indexes for table `recordtable`
--
ALTER TABLE `recordtable`
  ADD PRIMARY KEY (`RecordId`),
  ADD KEY `fk_ChildID` (`childid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userid`);

--
-- Indexes for table `vaccine`
--
ALTER TABLE `vaccine`
  ADD PRIMARY KEY (`vaccineid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `recordtable`
--
ALTER TABLE `recordtable`
  MODIFY `RecordId` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `fh_ChildID` FOREIGN KEY (`childid`) REFERENCES `childtable` (`ChildID`),
  ADD CONSTRAINT `fh_providerid` FOREIGN KEY (`providerid`) REFERENCES `provider` (`providerid`);

--
-- Constraints for table `recordtable`
--
ALTER TABLE `recordtable`
  ADD CONSTRAINT `fk_ChildID` FOREIGN KEY (`childid`) REFERENCES `childtable` (`ChildID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

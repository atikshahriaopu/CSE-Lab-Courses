-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 01, 2024 at 11:25 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `student_tracker`
--

-- --------------------------------------------------------

--
-- Table structure for table `atcoder`
--

CREATE TABLE `atcoder` (
  `id` int(11) DEFAULT NULL,
  `handle_name` varchar(100) DEFAULT NULL,
  `total_solved` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `atcoder`
--

INSERT INTO `atcoder` (`id`, `handle_name`, `total_solved`) VALUES
(1066, 'alpha_447', 50),
(1058, 'chatok.jr', 100);

-- --------------------------------------------------------

--
-- Table structure for table `codechef`
--

CREATE TABLE `codechef` (
  `id` int(11) DEFAULT NULL,
  `handle_name` varchar(100) DEFAULT NULL,
  `total_solved` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `codechef`
--

INSERT INTO `codechef` (`id`, `handle_name`, `total_solved`) VALUES
(1066, 'alpha_447', 100),
(1058, 'chatok.jr', 300);

-- --------------------------------------------------------

--
-- Table structure for table `codeforces`
--

CREATE TABLE `codeforces` (
  `id` int(11) DEFAULT NULL,
  `handle_name` varchar(100) DEFAULT NULL,
  `total_solved` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `codeforces`
--

INSERT INTO `codeforces` (`id`, `handle_name`, `total_solved`) VALUES
(1066, 'alpha_447', 300),
(1058, 'chatok.jr', 500);

-- --------------------------------------------------------

--
-- Table structure for table `cses`
--

CREATE TABLE `cses` (
  `id` int(11) DEFAULT NULL,
  `handle_name` varchar(100) DEFAULT NULL,
  `total_solved` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cses`
--

INSERT INTO `cses` (`id`, `handle_name`, `total_solved`) VALUES
(1066, 'alpha_447', 10),
(1058, 'chatok.jr', 20);

-- --------------------------------------------------------

--
-- Table structure for table `overall`
--

CREATE TABLE `overall` (
  `id` int(11) DEFAULT NULL,
  `total_problem_solved` int(11) NOT NULL,
  `codeforces` int(11) NOT NULL,
  `atcoder` int(11) NOT NULL,
  `codechef` int(11) NOT NULL,
  `cses` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `overall`
--

INSERT INTO `overall` (`id`, `total_problem_solved`, `codeforces`, `atcoder`, `codechef`, `cses`) VALUES
(1066, 460, 300, 50, 100, 10),
(1058, 920, 500, 100, 300, 20);

-- --------------------------------------------------------

--
-- Table structure for table `student_info`
--

CREATE TABLE `student_info` (
  `student_id` int(11) NOT NULL,
  `student_name` varchar(100) DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  `batch` varchar(100) DEFAULT NULL,
  `section` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student_info`
--

INSERT INTO `student_info` (`student_id`, `student_name`, `department`, `batch`, `section`, `email`, `phone`) VALUES
(1058, 'sakib', 'cse', '52', 'B', 'sakibgandu@gmail.com', '01615558270'),
(1066, 'seyam', 'cse', '52', 'B', 'siyamgandu@gmail.com', '01912377841');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `atcoder`
--
ALTER TABLE `atcoder`
  ADD KEY `id` (`id`);

--
-- Indexes for table `codechef`
--
ALTER TABLE `codechef`
  ADD KEY `id` (`id`);

--
-- Indexes for table `codeforces`
--
ALTER TABLE `codeforces`
  ADD KEY `id` (`id`);

--
-- Indexes for table `cses`
--
ALTER TABLE `cses`
  ADD KEY `id` (`id`);

--
-- Indexes for table `overall`
--
ALTER TABLE `overall`
  ADD KEY `id` (`id`);

--
-- Indexes for table `student_info`
--
ALTER TABLE `student_info`
  ADD PRIMARY KEY (`student_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `atcoder`
--
ALTER TABLE `atcoder`
  ADD CONSTRAINT `atcoder_ibfk_1` FOREIGN KEY (`id`) REFERENCES `student_info` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `codechef`
--
ALTER TABLE `codechef`
  ADD CONSTRAINT `codechef_ibfk_1` FOREIGN KEY (`id`) REFERENCES `student_info` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `codeforces`
--
ALTER TABLE `codeforces`
  ADD CONSTRAINT `codeforces_ibfk_1` FOREIGN KEY (`id`) REFERENCES `student_info` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cses`
--
ALTER TABLE `cses`
  ADD CONSTRAINT `cses_ibfk_1` FOREIGN KEY (`id`) REFERENCES `student_info` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `overall`
--
ALTER TABLE `overall`
  ADD CONSTRAINT `overall_ibfk_1` FOREIGN KEY (`id`) REFERENCES `student_info` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

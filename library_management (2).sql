-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 02, 2024 at 01:19 PM
-- Server version: 8.3.0
-- PHP Version: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `library_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
CREATE TABLE IF NOT EXISTS `books` (
  `book_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `genre` varchar(50) DEFAULT NULL,
  `published_year` int DEFAULT NULL,
  `isbn` varchar(13) NOT NULL,
  `total_copies` int NOT NULL,
  `available_copies` int NOT NULL,
  PRIMARY KEY (`book_id`),
  UNIQUE KEY `isbn` (`isbn`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`book_id`, `title`, `author`, `genre`, `published_year`, `isbn`, `total_copies`, `available_copies`) VALUES
(1, 'The Great Gatsby', 'F. Scott Fitzgerald', 'Fiction', 1925, 'Scribner', 2147483647, 3),
(2, 'To Kill a Mockingbird', 'Harper Lee', 'Fiction', 1960, 'J.B. Lippinco', 2147483647, 2),
(3, '1984', 'George Orwell', 'Dystopian', 1949, 'Secker & Warb', 2147483647, 1);

-- --------------------------------------------------------

--
-- Table structure for table `borrowingrecords`
--

DROP TABLE IF EXISTS `borrowingrecords`;
CREATE TABLE IF NOT EXISTS `borrowingrecords` (
  `record_id` int NOT NULL,
  `patron_id` int DEFAULT NULL,
  `book_id` int DEFAULT NULL,
  `borrow_date` date DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `patron_id` (`patron_id`),
  KEY `book_id` (`book_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `borrowingrecords`
--

INSERT INTO `borrowingrecords` (`record_id`, `patron_id`, `book_id`, `borrow_date`, `return_date`, `due_date`, `status`) VALUES
(1001, 101, 1, '2023-08-01', '2023-08-10', '2023-08-07', 'Returned'),
(1002, 102, 2, '2023-08-05', NULL, '2023-08-20', 'Borrowed'),
(1003, 103, 3, '2023-08-02', NULL, '2023-08-12', 'Overdue');

-- --------------------------------------------------------

--
-- Table structure for table `overdueitems`
--

DROP TABLE IF EXISTS `overdueitems`;
CREATE TABLE IF NOT EXISTS `overdueitems` (
  `overdue_id` int NOT NULL,
  `record_id` int DEFAULT NULL,
  `days_overdue` int DEFAULT NULL,
  `fine_amount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`overdue_id`),
  KEY `record_id` (`record_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `overdueitems`
--

INSERT INTO `overdueitems` (`overdue_id`, `record_id`, `days_overdue`, `fine_amount`) VALUES
(1, 1003, 5, 25.00),
(2, 1002, 2, 10.00);

-- --------------------------------------------------------

--
-- Table structure for table `patrons`
--

DROP TABLE IF EXISTS `patrons`;
CREATE TABLE IF NOT EXISTS `patrons` (
  `patron_id` int NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `membership_date` date DEFAULT NULL,
  PRIMARY KEY (`patron_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `patrons`
--

INSERT INTO `patrons` (`patron_id`, `first_name`, `last_name`, `email`, `phone_number`, `address`, `membership_date`) VALUES
(101, 'John', 'Doe', 'john.doe@example.com', '555-1234', '123 Main St', '2023-01-15'),
(102, 'Jane', 'Smith', 'jane.smith@example.com', '555-5678', '456 Maple Ave', '2023-03-10'),
(103, 'Alice', 'Johnson', 'alice.j@example.com', '555-9101', '789 Elm St', '2023-02-20');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 18, 2024 at 09:54 AM
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
-- Database: `siddhaushadha`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(20) NOT NULL,
  `title` varchar(100) NOT NULL,
  `price` int(20) NOT NULL,
  `quantity` int(20) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `title`, `price`, `quantity`, `image`) VALUES
(45, 7, 'Sukumara Churnaya', 260, 1, 'image8.jpg'),
(46, 9, 'siddhalepa balm', 50, 1, 'image9.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Ayurvedic medicine'),
(2, 'Oils'),
(3, 'Capsules'),
(4, 'Skin care'),
(5, 'Healthy soap ');

-- --------------------------------------------------------

--
-- Table structure for table `contact_form`
--

CREATE TABLE `contact_form` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `message` varchar(800) NOT NULL,
  `date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `newsletter_emails`
--

CREATE TABLE `newsletter_emails` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `date_time` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `newsletter_emails`
--

INSERT INTO `newsletter_emails` (`id`, `email`, `date_time`) VALUES
(1, 'shamal@gmail.com', '2022-05-17'),
(2, 'shamal98@gmail.com', '2022-05-17');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `payment_method` varchar(50) NOT NULL,
  `address` varchar(500) NOT NULL,
  `total_books` varchar(500) NOT NULL,
  `total_price` int(20) NOT NULL,
  `placed_date` date NOT NULL DEFAULT current_timestamp(),
  `order_status` varchar(30) NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `producer` varchar(50) NOT NULL,
  `price` int(20) NOT NULL,
  `qty` int(20) NOT NULL,
  `category_id` int(20) NOT NULL,
  `description` varchar(800) NOT NULL,
  `image` varchar(100) NOT NULL,
  `date_time` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `producer`, `price`, `qty`, `category_id`, `description`, `image`, `date_time`) VALUES
(1, 'Sukumara Churnaya', 'Sidhdhaurvedha company', 260, 100, 1, 'An Ayurvedic medicine that can help with digestive problems. It helps treat colic which can be distressing for many people. It helps relieve heartburn and acidity caused by indigestion. Helps with issues like appliances and gas. Cures piles, hemorrhoids, flatulence, eye diseases.\r\n\r\n \r\n\r\nInstructions for use\r\nGroup 5 water, hot water, with or with a suitable supplement.\r\n', 'image8.jpg', '2022-05-31'),
(2, 'siddhalepa balm', 'Sidhdhaurvedha company', 50, 300, 1, 'Siddhalepa Balm is a herbal formulation based on Ayurveda pharmacopoeia chronicled over 4000 years ago (2000 BC). The balm was researched and developed 60 years ago and introduced to traditional Ayurveda physicians for clinical trials in 1932. The balm was introduced to the market in 1934.\r\n', 'image9.jpg', '2024-06-10'),
(3, 'Kothala Himbutu', 'Sidhdhaurvedha company', 500, 100, 1, 'Kothala Himbutu  (Salacia reticulata) is a herb that is widely used in Ayurvedic medicine to treat diabetes and obesity.', 'image1.jpg', '2024-06-30'),
(4, 'Heen Bovitiya (Osbeckia octandra)', 'Sidhdhaurvedha company', 260, 100, 1, '\r\n\r\n\"Heen Bovitia, endemic to Sri Lanka, features bright purple flowers and is esteemed for its medicinal properties, especially in treating jaundice and liver ailments in traditional Ayurvedic medicine.\"', 'image4.jpg', '2024-06-30'),
(7, 'Chandanalepa healthy soap', 'Sanjeewaka ayurvedic products pvt ltd', 2, 100, 5, '', 'image7.jpg', '2024-06-30'),
(8, 'Chandalepa ayurvedic herbal hair oil', 'Sanjeewaka ayurvedic products pvt ltd', 20, 100, 2, 'Chandanalepa Ayurvedic Herbal Hair Oil is a blend of 32 Ayurvedic medicinal herbs, pure Coconut Oil, Olive Oil, and Almond Oil, enriched with Vitamin E. It is designed to nourish the hair, soothe the scalp, and strengthen hair from root to tip. This formula helps prevent hair fall and premature graying, promoting healthy and strong hair growth.', 'image2.jpg', '2024-06-30');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `user_type` varchar(10) NOT NULL DEFAULT 'user',
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` varchar(100) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `zipCode` varchar(20) NOT NULL,
  `country` varchar(50) NOT NULL,
  `password` varchar(300) NOT NULL,
  `date_time` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_type`, `firstName`, `lastName`, `email`, `phone`, `address`, `city`, `state`, `zipCode`, `country`, `password`, `date_time`) VALUES
(1, 'admin', 'Sandunika', 'Mihidini ', 'sandunikamihidini@gmail.com', '0756160102', '316/2/A batuwatta ', 'Ragama', 'Sri lanka', '11010', 'Sri Lanka', '08f90c1a417155361a5c4b8d297e0d78', '2024-04-24'),
(7, 'user', 'inoka', 'priyanthi', 'inokapriyanthi67@gmail.com', '0716162387', '316/2/A batuwatta ragama ', 'Ragama', 'Western ', '11010', 'Sri Lanka', 'a82d922b133be19c1171534e6594f754', '2024-05-12'),
(9, 'user', 'amal', 'udayantha', 'amaludayantha@gmail.com', '0758527245', '384/2/A polipitimukalana', 'kandana', 'Sri lanka', '11010', 'Sri Lanka', '3f088ebeda03513be71d34d214291986', '2024-06-16');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ED_Checkout` (`user_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_form`
--
ALTER TABLE `contact_form`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `newsletter_emails`
--
ALTER TABLE `newsletter_emails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ED_Category` (`category_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `contact_form`
--
ALTER TABLE `contact_form`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `newsletter_emails`
--
ALTER TABLE `newsletter_emails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `ED_Checkout` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `ED_Category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

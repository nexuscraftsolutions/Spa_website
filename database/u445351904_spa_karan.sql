-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 01, 2025 at 04:35 PM
-- Server version: 10.11.10-MariaDB-log
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u445351904_spa_karan`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `username`, `email`, `password`, `created_at`) VALUES
(1, 'admin', 'admin@spa.com', '$2y$10$Y6lkHWkr9MLCmXAGQJxy0OhFEAcIOkfffrIlWjeHMRlcskdUcljVG', '2025-06-19 11:34:23');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(11) NOT NULL,
  `therapist_id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `booking_date` date NOT NULL,
  `booking_time` time NOT NULL,
  `message` text DEFAULT NULL,
  `status` enum('pending','confirmed','cancelled','completed') DEFAULT 'pending',
  `payment_status` enum('pending','paid','failed') DEFAULT 'pending',
  `total_amount` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `therapist_id`, `full_name`, `email`, `phone`, `booking_date`, `booking_time`, `message`, `status`, `payment_status`, `total_amount`, `created_at`) VALUES
(1, 1, 'test', 'test@gmail.com', '7692921393', '2025-06-21', '11:00:00', 'etsti n afj sajfhs', 'completed', 'pending', 2500.00, '2025-06-20 05:05:17'),
(2, 2, 'karan', 'karan@gmail.com', '8178413777', '2025-06-27', '11:00:00', '', 'completed', 'pending', 3000.00, '2025-06-24 05:09:42'),
(3, 1, 'Sumit', 'karan@gmail.com', '8178413777', '2025-06-30', '18:00:00', 'I want some time with you and your family is a new job', 'confirmed', 'pending', 2500.00, '2025-06-26 19:07:02'),
(4, 1, 'Rohit', 'Rohit@gmail.com', '8178413777', '2025-06-30', '10:00:00', 'Hi this is a trst booking', 'confirmed', 'pending', 2500.00, '2025-06-28 20:26:19');

-- --------------------------------------------------------

--
-- Table structure for table `contact_inquiries`
--

CREATE TABLE `contact_inquiries` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `subject` varchar(200) DEFAULT NULL,
  `message` text NOT NULL,
  `status` enum('new','replied','closed') DEFAULT 'new',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact_inquiries`
--

INSERT INTO `contact_inquiries` (`id`, `name`, `email`, `phone`, `subject`, `message`, `status`, `created_at`) VALUES
(1, 'Narendra Patel', 'narender@gmail.com', '2564856549', 'General Inquiry', 'I want to book a Therapists for treatment', 'new', '2025-06-28 05:35:26');

-- --------------------------------------------------------

--
-- Table structure for table `leads`
--

CREATE TABLE `leads` (
  `id` int(11) NOT NULL,
  `type` enum('inquiry','booking','whatsapp','contact') NOT NULL,
  `therapist_id` int(11) DEFAULT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `message` text DEFAULT NULL,
  `status` enum('new','follow_up','converted','closed') DEFAULT 'new',
  `admin_notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `leads`
--

INSERT INTO `leads` (`id`, `type`, `therapist_id`, `full_name`, `email`, `phone`, `message`, `status`, `admin_notes`, `created_at`, `updated_at`) VALUES
(1, 'booking', 2, 'karan', 'karan@gmail.com', '8178413777', '', 'new', NULL, '2025-06-24 05:09:42', '2025-06-24 05:09:42'),
(2, 'inquiry', 2, 'Nukul', 'k1@gmail.com', '9876565456', 'test bookings\n\nPreferred Date: 2025-07-03', 'new', NULL, '2025-06-24 18:06:38', '2025-06-24 18:06:38'),
(3, 'booking', 1, 'Sumit', 'karan@gmail.com', '8178413777', 'I want some time with you and your family is a new job', 'new', NULL, '2025-06-26 19:07:02', '2025-06-26 19:07:02'),
(4, 'booking', 1, 'Rohit', 'Rohit@gmail.com', '8178413777', 'Hi this is a trst booking', 'new', NULL, '2025-06-28 20:26:19', '2025-06-28 20:26:19'),
(5, 'inquiry', 1, 'rawat ji', 'dev456rawat@gmail.com', '9389014941', 'testing\n\nPreferred Date: 2025-06-30', 'new', NULL, '2025-06-30 08:16:43', '2025-06-30 08:16:43');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `icon_type` varchar(255) DEFAULT NULL,
  `icon_value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `name`, `description`, `created_at`, `icon_type`, `icon_value`) VALUES
(1, 'Swedish Massage', 'Relaxing full body massage with smooth, long strokes', '2025-06-19 11:34:23', 'bootstrap', 'bi-fire'),
(2, 'Deep Tissue Massage', 'Therapeutic massage targeting deeper muscle layers', '2025-06-19 11:34:23', 'bootstrap', 'bi-moon'),
(3, 'Hot Stone Therapy', 'Massage using heated stones to relax muscles', '2025-06-19 11:34:23', 'bootstrap', 'bi-gem'),
(4, 'Aromatherapy Massage', 'Massage with essential oils for relaxation', '2025-06-19 11:34:23', 'bootstrap', 'bi-heart-pulse'),
(5, 'Reflexology', 'Pressure point massage focusing on feet and hands', '2025-06-19 11:34:23', 'bootstrap', 'bi-sun'),
(6, 'Thai Massage', 'Traditional stretching and pressure point massage', '2025-06-19 11:34:23', 'bootstrap', 'bi-hand-thumbs-up');

-- --------------------------------------------------------

--
-- Table structure for table `therapists`
--

CREATE TABLE `therapists` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price_per_session` decimal(10,2) NOT NULL,
  `height` varchar(20) DEFAULT NULL,
  `weight` varchar(20) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `availability_slots` text DEFAULT NULL,
  `main_image` varchar(255) DEFAULT NULL,
  `status` enum('active','inactive') DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `therapists`
--

INSERT INTO `therapists` (`id`, `name`, `price_per_session`, `height`, `weight`, `description`, `availability_slots`, `main_image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Sarah Johnson', 2500.00, '5&amp;#039;6', '55kg', 'Certified massage therapist with 8+ years of experience in Swedish and deep tissue massage.', 'Mon-Fri: 9 AM - 6 PM, Sat: 10 AM - 4 PM', '685c3de3b0486_1750875619.webp', 'active', '2025-06-19 11:34:23', '2025-06-25 18:20:19'),
(2, 'Maya Patel', 3000.00, '5&#039;4&quot;', '52kg', 'Specialist in aromatherapy and hot stone therapy. Trained in traditional healing techniques.', 'Tue-Sat: 10 AM - 7 PM', '685c3df7699a4_1750875639.webp', 'active', '2025-06-19 11:34:23', '2025-06-25 18:20:39'),
(3, 'Lisa Chen', 2800.00, '5', '50kg', 'Expert in Thai massage and reflexology. Focuses on holistic wellness and stress relief.', 'Mon-Wed-Fri: 9 AM - 5 PM, Sat-Sun: 11 AM - 3 PM', '685c3e091eb68_1750875657.webp', 'active', '2025-06-19 11:34:23', '2025-06-25 18:20:57');

-- --------------------------------------------------------

--
-- Table structure for table `therapist_images`
--

CREATE TABLE `therapist_images` (
  `id` int(11) NOT NULL,
  `therapist_id` int(11) NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `is_main` tinyint(4) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `therapist_images`
--

INSERT INTO `therapist_images` (`id`, `therapist_id`, `image_path`, `is_main`, `created_at`) VALUES
(87, 1, 'therapists/685c3de3b0486_1750875619.webp', 1, '2025-06-25 18:20:19'),
(88, 1, 'therapists/685c3de3b0b09_1750875619.webp', 0, '2025-06-25 18:20:19'),
(89, 1, 'therapists/685c3de3b0d38_1750875619.webp', 0, '2025-06-25 18:20:19'),
(90, 2, 'therapists/685c3df7699a4_1750875639.webp', 1, '2025-06-25 18:20:39'),
(91, 2, 'therapists/685c3df769dab_1750875639.webp', 0, '2025-06-25 18:20:39'),
(92, 2, 'therapists/685c3df769f5a_1750875639.webp', 0, '2025-06-25 18:20:39'),
(93, 3, 'therapists/685c3e091eb68_1750875657.webp', 1, '2025-06-25 18:20:57'),
(94, 3, 'therapists/685c3e091f017_1750875657.webp', 0, '2025-06-25 18:20:57'),
(95, 3, 'therapists/685c3e091f257_1750875657.webp', 0, '2025-06-25 18:20:57');

-- --------------------------------------------------------

--
-- Table structure for table `therapist_services`
--

CREATE TABLE `therapist_services` (
  `id` int(11) NOT NULL,
  `therapist_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `therapist_services`
--

INSERT INTO `therapist_services` (`id`, `therapist_id`, `service_id`, `created_at`) VALUES
(19, 1, 2, '2025-06-25 18:20:19'),
(20, 1, 1, '2025-06-25 18:20:19'),
(21, 2, 4, '2025-06-25 18:20:39'),
(22, 2, 3, '2025-06-25 18:20:39'),
(23, 3, 3, '2025-06-25 18:20:57'),
(24, 3, 5, '2025-06-25 18:20:57');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('user','admin') DEFAULT 'user',
  `status` enum('active','inactive') DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `city`, `password`, `role`, `status`, `created_at`) VALUES
(1, 'karan', 'karan@gmail.com', '8178413777', 'Delhi', '$2y$10$FyMfdtLXF8WYVlkqbtQiROgmYUUbAomlJDMOZEsVXUrTP5aDpRkdi', 'user', 'active', '2025-06-23 05:15:08');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `therapist_id` (`therapist_id`);

--
-- Indexes for table `contact_inquiries`
--
ALTER TABLE `contact_inquiries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leads`
--
ALTER TABLE `leads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `therapist_id` (`therapist_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `therapists`
--
ALTER TABLE `therapists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `therapist_images`
--
ALTER TABLE `therapist_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `therapist_id` (`therapist_id`);

--
-- Indexes for table `therapist_services`
--
ALTER TABLE `therapist_services`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_therapist_service` (`therapist_id`,`service_id`),
  ADD KEY `service_id` (`service_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `contact_inquiries`
--
ALTER TABLE `contact_inquiries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `leads`
--
ALTER TABLE `leads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `therapists`
--
ALTER TABLE `therapists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `therapist_images`
--
ALTER TABLE `therapist_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT for table `therapist_services`
--
ALTER TABLE `therapist_services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`therapist_id`) REFERENCES `therapists` (`id`);

--
-- Constraints for table `leads`
--
ALTER TABLE `leads`
  ADD CONSTRAINT `leads_ibfk_1` FOREIGN KEY (`therapist_id`) REFERENCES `therapists` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `therapist_images`
--
ALTER TABLE `therapist_images`
  ADD CONSTRAINT `therapist_images_ibfk_1` FOREIGN KEY (`therapist_id`) REFERENCES `therapists` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `therapist_services`
--
ALTER TABLE `therapist_services`
  ADD CONSTRAINT `therapist_services_ibfk_1` FOREIGN KEY (`therapist_id`) REFERENCES `therapists` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `therapist_services_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

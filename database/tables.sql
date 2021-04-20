-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 19, 2021 at 07:02 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mycadenza`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `uploadsongs` (IN `artist_id` INT(11), IN `song_name` VARCHAR(255), IN `song_format` VARCHAR(255), IN `artist_name` VARCHAR(255), IN `song_image` VARCHAR(255), IN `audio_file` VARCHAR(255))  NO SQL
INSERT INTO upload_albums(`artist_id`,`song_name`,`song_format`,`artist_name`,`song_image`,`audio_file`) VALUES(artist_id,song_name,song_format,artist_name,song_image,audio_file)$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `favorite_songs`
--

CREATE TABLE `favorite_songs` (
  `id` int(11) NOT NULL,
  `gen_id` int(11) NOT NULL,
  `song_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `song_name` varchar(255) NOT NULL,
  `artist_name` varchar(255) NOT NULL,
  `audio_file` varchar(255) NOT NULL,
  `song_image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `favorite_songs`
--

INSERT INTO `favorite_songs` (`id`, `gen_id`, `song_id`, `user_id`, `song_name`, `artist_name`, `audio_file`, `song_image`) VALUES
(3, 0, 1, 3, 'Hamari', 'abc', '01 - Hamari.mp3', 'musical-world.jpg'),
(4, 0, 7, 3, 'enna sona', 'abc', 'Enna Sona  Ok Jaanu -(Mr-Jatt.com).mp3', 'musical-world.jpg'),
(5, 0, 4, 3, 'Kareyole', 'abc', 'Kareyole.mp3', 'musical-world.jpg'),
(6, 0, 1, 4, 'Hamari', 'abc', '01 - Hamari.mp3', 'musical-world.jpg'),
(8, 0, 4, 4, 'Kareyole', 'abc', 'Kareyole.mp3', 'musical-world.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `genre`
--

CREATE TABLE `genre` (
  `gen_id` int(11) NOT NULL,
  `gen_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `genre`
--

INSERT INTO `genre` (`gen_id`, `gen_name`) VALUES
(1, 'english'),
(2, 'hindi'),
(3, 'japanese'),
(4, 'uploaded_albums');

-- --------------------------------------------------------

--
-- Table structure for table `upload_albums`
--

CREATE TABLE `upload_albums` (
  `song_id` int(100) NOT NULL,
  `artist_id` int(11) NOT NULL,
  `song_name` varchar(255) NOT NULL,
  `song_format` varchar(100) NOT NULL,
  `artist_name` varchar(100) NOT NULL,
  `song_image` varchar(255) NOT NULL,
  `audio_file` varchar(255) NOT NULL,
  `song_album` varchar(255) NOT NULL,
  `genre_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `upload_albums`
--

INSERT INTO `upload_albums` (`song_id`, `artist_id`, `song_name`, `song_format`, `artist_name`, `song_image`, `audio_file`, `song_album`, `genre_id`) VALUES
(1, 3, 'Hamari', 'mp3', 'abc', 'musical-world.jpg', '01 - Hamari.mp3', '', 0),
(4, 3, 'Kareyole', 'mp3', 'abc', 'musical-world.jpg', 'Kareyole.mp3', '', 0),
(6, 4, 'kabil hoon', 'mp3', 'Aurius', 'musical-world.jpg', '05 Kaabil Hoon (Sad Version) Jubin 190Kbps.mp3', '', 0),
(7, 3, 'enna sona', 'mp3', 'abc', 'musical-world.jpg', 'Enna Sona  Ok Jaanu -(Mr-Jatt.com).mp3', '', 0),
(14, 3, 'mai tera boyfriend', 'mp3', 'abc', 'musical-world.jpg', 'Mein tera boyfriend tu meri girlfriend.mp3', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `mobile_number` varchar(10) NOT NULL,
  `email_address` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `contributions` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `username`, `mobile_number`, `email_address`, `password`, `contributions`) VALUES
(1, 'Shankar', '9876543210', 'admin@gmail.com', 'c12b240b5710c6c9ee00ef4529803aac', 0),
(3, 'abc', '9900000000', 'abc@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 0),
(4, 'Aurius', '9900000099', 'aurius@gmail.com', '202cb962ac59075b964b07152d234b70', 0),
(5, 'test-user', '9899000000', 'testuser@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `favorite_songs`
--
ALTER TABLE `favorite_songs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`gen_id`);

--
-- Indexes for table `upload_albums`
--
ALTER TABLE `upload_albums`
  ADD PRIMARY KEY (`song_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `favorite_songs`
--
ALTER TABLE `favorite_songs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `upload_albums`
--
ALTER TABLE `upload_albums`
  MODIFY `song_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

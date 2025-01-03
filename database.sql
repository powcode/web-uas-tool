-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 31, 2024 at 03:06 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_game`
--

-- --------------------------------------------------------

--
-- Table structure for table `game`
--

CREATE TABLE `game` (
  `id_game` int NOT NULL,
  `judul` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `id_kategori` int NOT NULL,
  `deskripsi` text COLLATE utf8mb4_general_ci,
  `spesifikasi` text COLLATE utf8mb4_general_ci,
  `gambar` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `game`
--

INSERT INTO `game` (`id_game`, `judul`, `id_kategori`, `deskripsi`, `spesifikasi`, `gambar`) VALUES
(1, 'God of War : Ragnarok', 1, 'Game Keren', 'Minimum:\n\nMinimum:\r\n• Requires a 64-bit processor and operating system\r\n• OS: Windows 11\r\n• Processor: Intel Core 11\r\n• Memory: 16gb DDR6\r\n• Graphics: RTX 7000\r\n• DirectX:DirectX 11\r\n• Storage: 1tb\r\n\r\nRecommended:\r\n• Requires a 64-bit processor and operating system\r\n• OS: \r\n• Processor: \r\n• Memory: \r\n• Graphics: \r\n• DirectX: \r\n• Storage: \r\nAdditional Notes: \n\nRecommended:\n\n', 'gow.jpg'),
(2, 'Assassins Creed : Mirage', 1, 'Petualangan Assassins yang penuh misteri', 'Minimum:\r\n• Requires a 64-bit processor and operating system\r\n• OS: Core i9\r\n• Processor:\r\n• Memory: \r\n• Graphics:\r\n• DirectX: \r\n• Storage: \r\n\r\nRecommended:\r\n• Requires a 64-bit processor and operating system\r\n• OS: \r\n• Processor: \r\n• Memory: \r\n• Graphics: \r\n• DirectX: \r\n• Storage: \r\nAdditional Notes: ', 'ass.jpg'),
(4, 'Tekken 7', 3, 'Best Fighting game ever', 'Minimum:\r\n• Requires a 64-bit processor and operating system\r\n• OS: \r\n• Processor:\r\n• Memory: \r\n• Graphics:\r\n• DirectX: \r\n• Storage: \r\n\r\nRecommended:\r\n• Requires a 64-bit processor and operating system\r\n• OS: \r\n• Processor: \r\n• Memory: \r\n• Graphics: \r\n• DirectX: \r\n• Storage: \r\nAdditional Notes: ', 'tekken.jpg'),
(5, 'Stronghold Crusader HD', 5, 'Best Strategy game ', 'Minimum:\r\n• Requires a 64-bit processor and operating system\r\n• OS: \r\n• Processor:\r\n• Memory: \r\n• Graphics:\r\n• DirectX: \r\n• Storage: \r\n\r\nRecommended:\r\n• Requires a 64-bit processor and operating system\r\n• OS: \r\n• Processor: \r\n• Memory: \r\n• Graphics: \r\n• DirectX: \r\n• Storage: \r\nAdditional Notes: ', 'stronghold.jpg'),
(6, 'Outlast II', 2, 'Best Horror game ever', 'Minimum:\r\n• Requires a 64-bit processor and operating system\r\n• OS: \r\n• Processor:\r\n• Memory: \r\n• Graphics:\r\n• DirectX: \r\n• Storage: \r\n\r\nRecommended:\r\n• Requires a 64-bit processor and operating system\r\n• OS: \r\n• Processor: \r\n• Memory: \r\n• Graphics: \r\n• DirectX: \r\n• Storage: \r\nAdditional Notes: ', 'outlast2.jpg'),
(7, 'The Forest', 2, 'Best Multiplayer Gemm', 'Minimum:\r\n• Requires a 64-bit processor and operating system\r\n• OS: \r\n• Processor:\r\n• Memory: \r\n• Graphics:\r\n• DirectX: \r\n• Storage: \r\n\r\nRecommended:\r\n• Requires a 64-bit processor and operating system\r\n• OS: \r\n• Processor: \r\n• Memory: \r\n• Graphics: \r\n• DirectX: \r\n• Storage: \r\nAdditional Notes: ', 'the forest.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int NOT NULL,
  `nama_kategori` varchar(50) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`) VALUES
(1, 'Action'),
(2, 'Adventure'),
(3, 'Fighting'),
(4, 'RPG'),
(5, 'Strategy'),
(6, 'Racing'),
(7, 'Anime');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` int NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `nama` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `role` enum('user','admin') COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `username`, `nama`, `password`, `role`) VALUES
(1, 'admin', 'Admin', '$2y$10$IHbzmkEgHJLnZXgKgXqFZuJAT2/AWjzkemTmO.2TjpMdcLmEvgvRe', 'admin'),
(2, 'Asep', 'Asep Nuraeudin', '$2y$10$SytqnJyWYHPJE3c9ZOgYA.Y0GHs/rlho46MzxtxVVHuh/8HnhF1Je', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `game`
--
ALTER TABLE `game`
  ADD PRIMARY KEY (`id_game`),
  ADD KEY `id_kategori` (`id_kategori`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `game`
--
ALTER TABLE `game`
  MODIFY `id_game` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `game`
--
ALTER TABLE `game`
  ADD CONSTRAINT `game_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

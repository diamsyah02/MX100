-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 24, 2025 at 12:49 AM
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
-- Database: `mx100`
--

-- --------------------------------------------------------

--
-- Table structure for table `applications`
--

CREATE TABLE `applications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `job_id` bigint(20) UNSIGNED NOT NULL,
  `freelancer_id` bigint(20) UNSIGNED NOT NULL,
  `cv_path` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `applications`
--

INSERT INTO `applications` (`id`, `job_id`, `freelancer_id`, `cv_path`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 'cvs/CQNVHTYnRnOMgWWc5uTt2XDsNJkXgwuV0SFSV0Hd.pdf', '2025-10-23 15:05:03', '2025-10-23 15:05:03');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `status` enum('draft','published') NOT NULL DEFAULT 'draft',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `user_id`, `title`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Laravel Backend Developer', 'Membangun API berbasis Laravel', 'published', '2025-10-23 02:46:17', '2025-10-23 02:46:17'),
(2, 1, 'Create rest Api', 'Create rest Api with Laravel', 'published', '2025-10-23 06:45:04', '2025-10-23 14:49:58'),
(4, 1, 'Create rest Api', 'Create rest Api with Laravel', 'draft', '2025-10-23 15:07:20', '2025-10-23 15:07:20');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '2025_10_23_090403_create_jobs_table', 1),
(3, '2025_10_23_090412_create_applications_table', 1),
(4, '2025_10_23_090805_create_personal_access_tokens_table', 1),
(5, '2025_10_23_132644_create_cache_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'api_token', '906f5f9d4233fde6209d1891454e53a749e47eb91c7540b0c55554c5f331acd8', '[\"*\"]', NULL, NULL, '2025-10-23 03:45:40', '2025-10-23 03:45:40'),
(2, 'App\\Models\\User', 1, 'api_token', '853cce7ca1896f5d6586f97505554c34cb1da80344ddefc360c0b028abbac5ed', '[\"*\"]', NULL, NULL, '2025-10-23 05:45:44', '2025-10-23 05:45:44'),
(3, 'App\\Models\\User', 1, 'api_token', 'c6e7f0dd0bc75f27b000dd3c870925554c9298b777512fa0ec52324ab57f35c3', '[\"*\"]', NULL, NULL, '2025-10-23 05:55:56', '2025-10-23 05:55:56'),
(4, 'App\\Models\\User', 1, 'api_token', '012dcfea7b961dca3027b5fc0cfa516aa2176e5045fb70cf6d7bd4466cef612b', '[\"*\"]', '2025-10-23 14:45:19', NULL, '2025-10-23 06:01:57', '2025-10-23 14:45:19'),
(5, 'App\\Models\\User', 1, 'api_token', '13ad4676a3029c0e8d26a62915927d34688c64b1e4acf550dae158325290aa4a', '[\"*\"]', NULL, NULL, '2025-10-23 06:22:35', '2025-10-23 06:22:35'),
(6, 'App\\Models\\User', 1, 'api_token', '9695ea7b8dae64ac5eeb84a9d4ea8f6c4e5507f09ef90fb7e34e5a4a8608534c', '[\"*\"]', '2025-10-23 06:45:20', NULL, '2025-10-23 06:43:21', '2025-10-23 06:45:20'),
(7, 'App\\Models\\User', 1, 'api_token', '03293cf5af74bafc9eed4049fcf1daab8425e3b8f13c225c61228bb953122290', '[\"*\"]', '2025-10-23 15:07:20', NULL, '2025-10-23 14:44:51', '2025-10-23 15:07:20'),
(8, 'App\\Models\\User', 1, 'api_token', '2bdf36b3bcd94602b704917fe1189c5207ec697328bba5e9233b646e8032d638', '[\"*\"]', NULL, NULL, '2025-10-23 15:04:01', '2025-10-23 15:04:01'),
(10, 'App\\Models\\User', 2, 'api_token', 'e2acdc2ea5b1cb69b0b1f4619af8a111b0c3d0d98d52c2074fe78d6723027206', '[\"*\"]', '2025-10-23 15:26:51', NULL, '2025-10-23 15:12:54', '2025-10-23 15:26:51'),
(11, 'App\\Models\\User', 1, 'api_token', '2959f981bacf272e41111e49924f1aa14bd73da362751342f141296840ea34fc', '[\"*\"]', NULL, NULL, '2025-10-23 15:14:58', '2025-10-23 15:14:58');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','freelancer') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `created_at`, `updated_at`) VALUES
(1, 'PT ABC', 'admin@abc.com', '$2y$12$seL49qCrK5uSvfgPSH11Yu3..N.DJJxGLlph0BLqw9AEuIxsjbpoW', 'admin', '2025-10-23 02:46:17', '2025-10-23 02:46:17'),
(2, 'X Freelancer', 'x_freelancer@gmail.com', '$2y$12$BqCI5FKxJ2SFDw9.vlQ.Y.MxZzGSgrXjsNJscQxuE8eSe0qxhCecm', 'freelancer', '2025-10-23 02:46:17', '2025-10-23 02:46:17');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `applications`
--
ALTER TABLE `applications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `applications_job_id_foreign` (`job_id`),
  ADD KEY `applications_freelancer_id_foreign` (`freelancer_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_user_id_foreign` (`user_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `applications`
--
ALTER TABLE `applications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `applications`
--
ALTER TABLE `applications`
  ADD CONSTRAINT `applications_freelancer_id_foreign` FOREIGN KEY (`freelancer_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `applications_job_id_foreign` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `jobs`
--
ALTER TABLE `jobs`
  ADD CONSTRAINT `jobs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

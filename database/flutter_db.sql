-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 17, 2024 at 06:17 PM
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
-- Database: `flutter_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `photos`
--

CREATE TABLE `photos` (
  `id` bigint(20) NOT NULL,
  `title` varchar(1024) DEFAULT NULL,
  `url` varchar(1024) DEFAULT NULL,
  `thumbnailUrl` varchar(1024) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `photos`
--

INSERT INTO `photos` (`id`, `title`, `url`, `thumbnailUrl`) VALUES
(1, 'accusamus beatae ad facilis cum similique qui sunt', 'https://via.placeholder.com/600/92c952', 'https://via.placeholder.com/150/92c952'),
(2, 'reprehenderit est deserunt velit ipsam', 'https://via.placeholder.com/600/771796', 'https://via.placeholder.com/150/771796'),
(3, 'officia porro iure quia iusto qui ipsa ut modi', 'https://via.placeholder.com/600/24f355', 'https://via.placeholder.com/150/24f355'),
(4, 'culpa odio esse rerum omnis laboriosam voluptate repudiandae', 'https://via.placeholder.com/600/d32776', 'https://via.placeholder.com/150/d32776'),
(5, 'natus nisi omnis corporis facere molestiae rerum in', 'https://via.placeholder.com/600/f66b97', 'https://via.placeholder.com/150/f66b97'),
(6, 'accusamus ea aliquid et amet sequi nemo', 'https://via.placeholder.com/600/56a8c2', 'https://via.placeholder.com/150/56a8c2'),
(7, 'officia delectus consequatur vero aut veniam explicabo molestias', 'https://via.placeholder.com/600/b0f7cc', 'https://via.placeholder.com/150/b0f7cc'),
(8, 'aut porro officiis laborum odit ea laudantium corporis', 'https://via.placeholder.com/600/54176f', 'https://via.placeholder.com/150/54176f'),
(9, 'qui eius qui autem sed', 'https://via.placeholder.com/600/51aa97', 'https://via.placeholder.com/150/51aa97'),
(10, 'beatae et provident et ut vel', 'https://via.placeholder.com/600/810b14', 'https://via.placeholder.com/150/810b14'),
(11, 'nihil at amet non hic quia qui', 'https://via.placeholder.com/600/1ee8a4', 'https://via.placeholder.com/150/1ee8a4'),
(12, 'mollitia soluta ut rerum eos aliquam consequatur perspiciatis maiores', 'https://via.placeholder.com/600/66b7d2', 'https://via.placeholder.com/150/66b7d2'),
(13, 'repudiandae iusto deleniti rerum', 'https://via.placeholder.com/600/197d29', 'https://via.placeholder.com/150/197d29'),
(14, 'est necessitatibus architecto ut laborum', 'https://via.placeholder.com/600/61a65', 'https://via.placeholder.com/150/61a65'),
(15, 'harum dicta similique quis dolore earum ex qui', 'https://via.placeholder.com/600/f9cee5', 'https://via.placeholder.com/150/f9cee5'),
(16, 'iusto sunt nobis quasi veritatis quas expedita voluptatum deserunt', 'https://via.placeholder.com/600/fdf73e', 'https://via.placeholder.com/150/fdf73e'),
(17, 'natus doloribus necessitatibus ipsa', 'https://via.placeholder.com/600/9c184f', 'https://via.placeholder.com/150/9c184f'),
(18, 'laboriosam odit nam necessitatibus et illum dolores reiciendis', 'https://via.placeholder.com/600/1fe46f', 'https://via.placeholder.com/150/1fe46f'),
(19, 'perferendis nesciunt eveniet et optio a', 'https://via.placeholder.com/600/56acb2', 'https://via.placeholder.com/150/56acb2'),
(20, 'assumenda voluptatem laboriosam enim consequatur veniam placeat reiciendis error', 'https://via.placeholder.com/600/8985dc', 'https://via.placeholder.com/150/8985dc'),
(21, 'ad et natus qui', 'https://via.placeholder.com/600/5e12c6', 'https://via.placeholder.com/150/5e12c6'),
(22, 'et ea illo et sit voluptas animi blanditiis porro', 'https://via.placeholder.com/600/45601a', 'https://via.placeholder.com/150/45601a'),
(23, 'harum velit vero totam', 'https://via.placeholder.com/600/e924e6', 'https://via.placeholder.com/150/e924e6'),
(24, 'beatae officiis ut aut', 'https://via.placeholder.com/600/8f209a', 'https://via.placeholder.com/150/8f209a'),
(25, 'facere non quis fuga fugit vitae', 'https://via.placeholder.com/600/5e3a73', 'https://via.placeholder.com/150/5e3a73'),
(26, 'asperiores nobis voluptate qui', 'https://via.placeholder.com/600/474645', 'https://via.placeholder.com/150/474645'),
(27, 'sit asperiores est quos quis nisi veniam error', 'https://via.placeholder.com/600/c984bf', 'https://via.placeholder.com/150/c984bf'),
(28, 'non neque eligendi molestiae repudiandae illum voluptatem qui aut', 'https://via.placeholder.com/600/392537', 'https://via.placeholder.com/150/392537'),
(29, 'aut ipsam quos ab placeat omnis', 'https://via.placeholder.com/600/602b9e', 'https://via.placeholder.com/150/602b9e'),
(30, 'odio enim voluptatem quidem aut nihil illum', 'https://via.placeholder.com/600/372c93', 'https://via.placeholder.com/150/372c93'),
(31, 'voluptate voluptates sequi', 'https://via.placeholder.com/600/a7c272', 'https://via.placeholder.com/150/a7c272'),
(32, 'ad enim dignissimos voluptatem similique', 'https://via.placeholder.com/600/c70a4d', 'https://via.placeholder.com/150/c70a4d'),
(33, 'culpa ipsam nobis qui fuga magni et mollitia', 'https://via.placeholder.com/600/501fe1', 'https://via.placeholder.com/150/501fe1'),
(34, 'vitae est facere quia itaque adipisci perferendis id maiores', 'https://via.placeholder.com/600/35185e', 'https://via.placeholder.com/150/35185e'),
(35, 'tenetur minus voluptatum et', 'https://via.placeholder.com/600/c96cad', 'https://via.placeholder.com/150/c96cad'),
(36, 'expedita rerum eaque', 'https://via.placeholder.com/600/4d564d', 'https://via.placeholder.com/150/4d564d'),
(37, 'totam voluptas iusto deserunt dolores', 'https://via.placeholder.com/600/ea51da', 'https://via.placeholder.com/150/ea51da'),
(38, 'natus magnam iure rerum pariatur molestias dolore nisi', 'https://via.placeholder.com/600/4f5b8d', 'https://via.placeholder.com/150/4f5b8d'),
(39, 'molestiae nam ullam et rerum doloribus', 'https://via.placeholder.com/600/1e71a2', 'https://via.placeholder.com/150/1e71a2'),
(40, 'est quas voluptates dignissimos sint praesentium nisi recusandae', 'https://via.placeholder.com/600/3a0b95', 'https://via.placeholder.com/150/3a0b95'),
(41, 'in voluptatem doloremque cum atque architecto deleniti', 'https://via.placeholder.com/600/659403', 'https://via.placeholder.com/150/659403'),
(42, 'voluptatibus a autem molestias voluptas architecto culpa', 'https://via.placeholder.com/600/ca50ac', 'https://via.placeholder.com/150/ca50ac'),
(43, 'eius hic autem ad beatae voluptas', 'https://via.placeholder.com/600/6ad437', 'https://via.placeholder.com/150/6ad437'),
(44, 'neque eum provident et inventore sed ipsam dignissimos quo', 'https://via.placeholder.com/600/29fe9f', 'https://via.placeholder.com/150/29fe9f'),
(45, 'praesentium fugit quis aut voluptatum commodi dolore corrupti', 'https://via.placeholder.com/600/c4084a', 'https://via.placeholder.com/150/c4084a'),
(46, 'quidem maiores in quia fugit dolore explicabo occaecati', 'https://via.placeholder.com/600/e9b68', 'https://via.placeholder.com/150/e9b68'),
(47, 'et soluta est', 'https://via.placeholder.com/600/b4412f', 'https://via.placeholder.com/150/b4412f'),
(48, 'ut esse id', 'https://via.placeholder.com/600/68e0a8', 'https://via.placeholder.com/150/68e0a8'),
(49, 'quasi quae est modi quis quam in impedit', 'https://via.placeholder.com/600/2cd88b', 'https://via.placeholder.com/150/2cd88b'),
(50, 'et inventore quae ut tempore eius voluptatum', 'https://via.placeholder.com/600/9e59da', 'https://via.placeholder.com/150/9e59da'),
(51, 'non sunt voluptatem placeat consequuntur rem incidunt', 'https://via.placeholder.com/600/8e973b', 'https://via.placeholder.com/150/8e973b'),
(52, 'eveniet pariatur quia nobis reiciendis laboriosam ea', 'https://via.placeholder.com/600/121fa4', 'https://via.placeholder.com/150/121fa4'),
(53, 'soluta et harum aliquid officiis ab omnis consequatur', 'https://via.placeholder.com/600/6efc5f', 'https://via.placeholder.com/150/6efc5f'),
(54, 'ut ex quibusdam dolore mollitia', 'https://via.placeholder.com/600/aa8f2e', 'https://via.placeholder.com/150/aa8f2e'),
(55, 'voluptatem consequatur totam qui aut iure est vel', 'https://via.placeholder.com/600/5e04a4', 'https://via.placeholder.com/150/5e04a4'),
(56, 'vel voluptatem esse consequuntur est officia quo aut quisquam', 'https://via.placeholder.com/600/f9f067', 'https://via.placeholder.com/150/f9f067'),
(57, 'vero est optio expedita quis ut molestiae', 'https://via.placeholder.com/600/95acce', 'https://via.placeholder.com/150/95acce'),
(58, 'rem pariatur facere eaque', 'https://via.placeholder.com/600/cde4c1', 'https://via.placeholder.com/150/cde4c1'),
(59, 'modi totam dolor eaque et ipsum est cupiditate', 'https://via.placeholder.com/600/a46a91', 'https://via.placeholder.com/150/a46a91'),
(60, 'ea enim temporibus asperiores placeat consectetur commodi ullam', 'https://via.placeholder.com/600/323599', 'https://via.placeholder.com/150/323599'),
(61, 'quia minus sed eveniet accusantium incidunt beatae odio', 'https://via.placeholder.com/600/e403d1', 'https://via.placeholder.com/150/e403d1'),
(62, 'dolorem cumque quo nihil inventore enim', 'https://via.placeholder.com/600/65ad4f', 'https://via.placeholder.com/150/65ad4f'),
(63, 'facere animi autem quod dolor', 'https://via.placeholder.com/600/4e557c', 'https://via.placeholder.com/150/4e557c'),
(64, 'doloremque culpa quia', 'https://via.placeholder.com/600/cd5a92', 'https://via.placeholder.com/150/cd5a92'),
(65, 'sed voluptatum enim eaque cumque qui sunt', 'https://via.placeholder.com/600/149540', 'https://via.placeholder.com/150/149540'),
(66, 'provident rerum voluptatem illo asperiores qui maiores', 'https://via.placeholder.com/600/ee0a7e', 'https://via.placeholder.com/150/ee0a7e'),
(67, 'veritatis labore ipsum unde aut quam dolores', 'https://via.placeholder.com/600/1279e9', 'https://via.placeholder.com/150/1279e9'),
(68, 'architecto aut quod qui ullam vitae expedita delectus', 'https://via.placeholder.com/600/e9603b', 'https://via.placeholder.com/150/e9603b'),
(69, 'et autem dolores aut porro est qui', 'https://via.placeholder.com/600/46e3b1', 'https://via.placeholder.com/150/46e3b1'),
(70, 'quam quos dolor eum ea in', 'https://via.placeholder.com/600/7375af', 'https://via.placeholder.com/150/7375af'),
(71, 'illo qui vel laboriosam vel fugit deserunt', 'https://via.placeholder.com/600/363789', 'https://via.placeholder.com/150/363789'),
(72, 'iusto sint enim nesciunt facilis exercitationem', 'https://via.placeholder.com/600/45935c', 'https://via.placeholder.com/150/45935c'),
(73, 'rerum exercitationem libero dolor', 'https://via.placeholder.com/600/1224bd', 'https://via.placeholder.com/150/1224bd'),
(74, 'eligendi quas consequatur aut consequuntur', 'https://via.placeholder.com/600/65ac19', 'https://via.placeholder.com/150/65ac19'),
(75, 'aut magni quibusdam cupiditate ea', 'https://via.placeholder.com/600/a9ef52', 'https://via.placeholder.com/150/a9ef52'),
(76, 'magni nulla et dolores', 'https://via.placeholder.com/600/7644fe', 'https://via.placeholder.com/150/7644fe'),
(77, 'ipsum consequatur vel omnis mollitia repellat dolores quasi', 'https://via.placeholder.com/600/36d137', 'https://via.placeholder.com/150/36d137'),
(78, 'aperiam aut est amet tenetur et dolorem', 'https://via.placeholder.com/600/637984', 'https://via.placeholder.com/150/637984'),
(79, 'est vel et laboriosam quo aspernatur distinctio molestiae', 'https://via.placeholder.com/600/c611a9', 'https://via.placeholder.com/150/c611a9'),
(80, 'et corrupti nihil cumque', 'https://via.placeholder.com/600/a0c998', 'https://via.placeholder.com/150/a0c998');

-- --------------------------------------------------------

--
-- Table structure for table `tb_barang`
--

CREATE TABLE `tb_barang` (
  `id_brg` varchar(50) NOT NULL,
  `nama_brg` varchar(255) NOT NULL,
  `stock` int(25) NOT NULL,
  `harga` int(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_barang`
--

INSERT INTO `tb_barang` (`id_brg`, `nama_brg`, `stock`, `harga`) VALUES
('101', 'Canon 600D', 3, 2020),
('102', 'Sony Alpha 7 M4', 2, 2023),
('103', 'Lumix G85', 1, 2023),
('104', 'Speedlight', 4, 2020),
('105', 'Sony Battery', 4, 2023),
('106', 'Tripod', 3, 2020);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `created_at`, `updated_at`) VALUES
(125, 'Admin ', 'admin', 'admin', '2024-01-15 11:59:29', '2024-01-15 11:59:29'),
(126, 'Member', 'member', 'member', '2024-01-15 11:59:29', '2024-01-15 11:59:29'),
(129, 'a', 'a@mail.com', 'a', '2024-01-15 14:18:26', '2024-01-15 14:18:26'),
(130, 'hallo', 'hallo@mail.com', 'hallo', '2024-01-15 14:24:49', '2024-01-15 14:24:49'),
(131, 'adad', 'adad@mail.com', 'adad', '2024-01-15 16:14:49', '2024-01-15 16:14:49'),
(132, 'ok', 'ok@mail.com', 'okok', '2024-01-15 16:16:48', '2024-01-15 16:16:48'),
(133, 'admin123', 'admin123@mail.com', 'admin123', '2024-01-15 16:29:10', '2024-01-15 16:29:10');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `photos`
--
ALTER TABLE `photos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD PRIMARY KEY (`id_brg`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=134;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 21, 2024 at 05:24 PM
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
-- Database: `p3l-atmakitchenupdate`
--

-- --------------------------------------------------------

--
-- Table structure for table `alamat`
--

CREATE TABLE `alamat` (
  `id` int(11) NOT NULL,
  `id_customer` int(11) NOT NULL,
  `alamat` text NOT NULL,
  `jarak` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `alamat`
--

INSERT INTO `alamat` (`id`, `id_customer`, `alamat`, `jarak`) VALUES
(1, 5, 'Jl. GHI No. 654', 12),
(2, 6, 'Jl. MNO No. 987', 11),
(4, 25, '1', NULL),
(5, 26, 'jalan sesama', NULL),
(6, 29, 'Jl. Semeru L3', NULL),
(7, 33, 'Jalan Soragan no 14', 5),
(8, 35, 'jalan testing', NULL),
(9, 36, 'Jalan penanda 13', 5),
(10, 37, 'Jalan Pegangsaan no 12', NULL),
(11, 38, 'Jalanku bersamamu no.55', 5),
(12, 39, 'Jalan Merbabu no. 12', 5),
(13, 40, 'Jalan Parangtritis km.1', 10),
(14, 41, 'Jalan Gito-Gati no.17', 5),
(15, 42, 'Jalan Merbabu blok M-10', 5),
(16, 43, 'Jalan Texas no. 15', 5),
(17, 44, 'Jalan Kenari no. 22', 5),
(18, 45, 'Jalan Timur Raya Blok M-1', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bahan_baku`
--

CREATE TABLE `bahan_baku` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `satuan` varchar(255) NOT NULL,
  `stok` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bahan_baku`
--

INSERT INTO `bahan_baku` (`id`, `nama`, `satuan`, `stok`) VALUES
(1, 'Tepung Terigu', 'gr', 100),
(2, 'Butter', 'gr', 181),
(3, 'Gula Pasir', 'gr', 4000),
(4, 'Garam', 'gr', 125),
(5, 'Ragi', 'gr', 180),
(6, 'Susu Bubuk', 'gr', 190),
(7, 'Coklat Bubuk', 'gr', 160),
(8, 'Matcha Bubuk', 'gr', 112),
(9, 'Kacang Kenari', 'gr', 130),
(28, 'Baking Soda', 'liter', 14),
(30, '123', '123', 123),
(31, 'Babi Hutan', 'kg', 0),
(32, 'pepaya', 'kg', 0),
(35, 'Vanilla', 'gr', 5),
(36, 'Tepung Ragi', 'gr', 0);

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
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id_user` int(11) NOT NULL,
  `poin` int(11) NOT NULL,
  `saldo` int(11) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `no_telp` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id_user`, `poin`, `saldo`, `tanggal_lahir`, `no_telp`) VALUES
(5, 100, 500000, '1989-07-02', '08123123124'),
(6, 150, 750000, '1985-09-20', '081234567890'),
(18, 0, 0, '2024-02-23', '084567890123'),
(25, 0, 0, '2024-02-14', '082123321123'),
(26, 0, 0, '2024-05-02', '08123221323'),
(29, 0, 0, '2002-11-21', '087723119213'),
(33, 428, 950000, '2002-02-06', '087211822231'),
(35, 0, 0, '2012-02-06', '087723011123'),
(36, 65, 0, '2000-01-08', '087734102212'),
(37, 0, 0, '2005-02-07', '087734012271'),
(38, 720, 139900, '2002-05-21', '087838781129'),
(39, 110, 960000, '2003-05-25', '081200129921'),
(40, 100, 129000, '2002-05-27', '087731245571'),
(41, 80, 1250000, '2003-05-15', '081277238802'),
(42, 1819, 375000, '2002-06-02', '081328231092'),
(43, 190, 300000, '2001-06-06', '081273102234'),
(44, 230, 0, '2002-06-06', '087721112231'),
(45, 0, 0, '2002-06-12', '0812301231102');

-- --------------------------------------------------------

--
-- Table structure for table `detail_hampers`
--

CREATE TABLE `detail_hampers` (
  `id` int(11) NOT NULL,
  `id_hampers` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `detail_hampers`
--

INSERT INTO `detail_hampers` (`id`, `id_hampers`, `id_produk`, `qty`) VALUES
(26, 63, 5, 2),
(27, 63, 4, 3),
(28, 63, 6, 5),
(29, 64, 63, 1),
(30, 67, 3, 2),
(31, 67, 5, 1),
(32, 67, 6, 1),
(33, 67, 63, 1),
(34, 67, 64, 1),
(38, 75, 2, 1),
(39, 75, 62, 1);

-- --------------------------------------------------------

--
-- Table structure for table `detail_penjualan`
--

CREATE TABLE `detail_penjualan` (
  `id` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `id_trx_penjualan` int(11) NOT NULL,
  `qty` float NOT NULL,
  `subtotal` int(11) NOT NULL,
  `catatan` varchar(255) DEFAULT NULL COMMENT 'diisi dengan note (penting untuk hampers biar tau isi kartu ucapannya apa)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `detail_penjualan`
--

INSERT INTO `detail_penjualan` (`id`, `id_produk`, `id_trx_penjualan`, `qty`, `subtotal`, `catatan`) VALUES
(2, 2, 1, 1, 450000, NULL),
(3, 3, 1, 2, 500000, NULL),
(4, 4, 1, 1, 550000, NULL),
(5, 5, 1, 1, 10000, NULL),
(6, 6, 1, 1, 75000, NULL),
(7, 7, 1, 2, 500000, NULL),
(8, 8, 1, 3, 900000, NULL),
(9, 9, 1, 1, 120000, NULL),
(10, 9, 2, 5, 600000, NULL),
(11, 61, 3, 4, 80000, NULL),
(12, 2, 4, 1, 450000, NULL),
(13, 3, 4, 0.5, 0, NULL),
(14, 3, 5, 0.5, 0, NULL),
(21, 5, 6, 3, 300000, NULL),
(22, 2, 7, 1, 450000, NULL),
(23, 3, 8, 0.5, 0, NULL),
(24, 4, 9, 0.5, 0, NULL),
(25, 2, 10, 1, 450000, NULL),
(26, 4, 11, 0.5, 0, NULL),
(27, 4, 12, 0.5, 300000, NULL),
(28, 4, 13, 0.5, 300000, NULL),
(29, 75, 14, 1, 1500000, NULL),
(30, 2, 15, 1, 450000, NULL),
(31, 3, 15, 0.5, 150000, NULL),
(32, 3, 16, 0.5, 150000, NULL),
(33, 4, 17, 1, 550000, NULL),
(34, 4, 18, 1, 550000, NULL),
(35, 4, 19, 2, 1100000, NULL),
(36, 3, 20, 1.5, 650000, NULL),
(37, 3, 21, 1, 500000, NULL),
(38, 5, 22, 2, 200000, NULL),
(39, 4, 23, 2, 1100000, NULL),
(40, 4, 24, 1, 550000, NULL),
(41, 4, 25, 2, 1100000, NULL),
(42, 3, 26, 1, 500000, NULL),
(43, 3, 27, 0.5, 150000, NULL),
(44, 4, 28, 0.5, 300000, NULL),
(45, 3, 29, 0.5, 150000, NULL),
(46, 3, 30, 0.5, 150000, NULL),
(47, 4, 31, 2, 1100000, NULL),
(48, 5, 32, 2, 200000, NULL),
(49, 5, 33, 2, 200000, NULL),
(50, 2, 34, 1, 450000, NULL),
(51, 5, 34, 1, 100000, NULL),
(53, 6, 35, 2, 150000, NULL),
(54, 6, 36, 2, 150000, NULL),
(55, 62, 37, 2, 30000, NULL),
(56, 3, 38, 1, 500000, NULL),
(57, 3, 39, 0.5, 150000, NULL),
(58, 4, 40, 1, 550000, NULL),
(59, 4, 41, 2, 1100000, NULL),
(60, 5, 42, 2, 200000, NULL),
(61, 5, 43, 1, 100000, NULL),
(62, 3, 44, 1, 500000, NULL),
(63, 4, 45, 0.5, 300000, NULL),
(64, 78, 46, 1, 100000, NULL),
(65, 6, 47, 1, 75000, NULL),
(66, 2, 48, 1, 450000, NULL),
(67, 2, 49, 1, 450000, NULL),
(68, 2, 50, 1, 450000, NULL),
(69, 6, 50, 1, 75000, NULL),
(70, 8, 50, 1, 900000, NULL),
(71, 62, 50, 1, 15000, NULL),
(72, 74, 50, 1, 1000000, NULL),
(73, 77, 50, 1, 5000, NULL),
(74, 53, 51, 0.5, 35000, NULL),
(75, 78, 52, 2, 200000, NULL),
(76, 77, 53, 1, 5000, NULL),
(77, 3, 54, 1, 500000, NULL),
(78, 2, 55, 1, 450000, NULL),
(79, 3, 56, 1, 500000, NULL),
(80, 2, 57, 1, 450000, NULL),
(81, 5, 58, 1, 100000, NULL),
(82, 6, 59, 1, 75000, NULL),
(83, 6, 60, 1, 75000, NULL),
(84, 3, 61, 1, 500000, NULL),
(85, 4, 62, 1, 550000, NULL),
(86, 5, 63, 1, 100000, NULL),
(89, 75, 64, 1, 1500000, NULL),
(90, 5, 65, 1, 100000, NULL),
(91, 6, 66, 1, 75000, NULL),
(92, 72, 67, 1, 135000, NULL),
(93, 72, 68, 1, 135000, NULL),
(94, 76, 69, 0.5, 40000, NULL),
(95, 76, 70, 0.5, 40000, NULL),
(96, 77, 71, 1, 5000, NULL),
(97, 3, 72, 0.5, 150000, NULL),
(98, 4, 73, 0.5, 300000, NULL),
(99, 77, 74, 1, 5000, NULL),
(100, 3, 75, 0.5, 150000, NULL),
(101, 3, 76, 0.5, 150000, NULL),
(102, 3, 77, 0.5, 150000, NULL),
(103, 4, 78, 0.5, 300000, NULL),
(104, 3, 79, 0.5, 150000, NULL),
(105, 78, 80, 2, 200000, NULL),
(106, 3, 81, 0.5, 150000, NULL),
(107, 3, 82, 0.5, 150000, NULL),
(108, 4, 83, 0.5, 300000, NULL),
(109, 78, 84, 2, 200000, NULL),
(110, 3, 85, 0.5, 150000, NULL),
(111, 6, 86, 1, 75000, NULL),
(112, 61, 87, 0.5, 10000, NULL),
(113, 61, 88, 0.5, 10000, NULL),
(114, 77, 89, 1, 5000, NULL),
(115, 78, 90, 2, 200000, NULL),
(116, 76, 91, 0.5, 40000, NULL),
(117, 76, 92, 0.5, 40000, NULL),
(118, 72, 93, 0.5, 70000, NULL),
(119, 72, 94, 0.5, 70000, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `history_saldo`
--

CREATE TABLE `history_saldo` (
  `id` int(11) NOT NULL,
  `id_customer` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `nominal` int(11) NOT NULL,
  `saldo_akhir` int(11) NOT NULL,
  `catatan` varchar(255) NOT NULL,
  `diproses` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `history_saldo`
--

INSERT INTO `history_saldo` (`id`, `id_customer`, `timestamp`, `nominal`, `saldo_akhir`, `catatan`, `diproses`) VALUES
(1, 5, '2024-03-04 17:00:00', 75000, 65000, 'Pengembalian dari PT GOJEK ABADI INDONESIA', 1),
(2, 6, '2024-03-05 17:00:00', 120000, 120000, 'Pengembalian dari PT Surya Jaya Makmur', 1),
(3, 42, '2024-06-02 05:51:03', -100000, 300000, 'Penarikan saldo', 1),
(4, 42, '2024-06-02 17:42:12', -100000, 500000, 'Penarikan saldo: Tarik yes', 1),
(5, 42, '2024-06-02 19:34:37', -100000, 400000, 'Penarikan saldo', 1),
(6, 42, '2024-06-06 01:36:11', 75000, 475000, 'Pembatalan pesanan 24.06.66', 1),
(7, 42, '2024-06-06 01:59:57', -75000, 400000, 'Penarikan saldo', 1),
(8, 40, '2024-06-06 02:08:21', 100000, 129000, 'Pembatalan pesanan 24.05.43', 1),
(9, 43, '2024-06-06 02:17:40', 65000, 65000, 'Pembatalan pesanan 24.06.70', 1),
(10, 42, '2024-06-06 05:29:35', -25000, 375000, 'Penarikan saldo: OVO', 1),
(11, 43, '2024-06-06 05:55:31', 160000, 425000, 'Pembatalan pesanan 24.06.76', 1),
(12, 43, '2024-06-06 06:06:49', -125000, 300000, 'Penarikan saldo: OVO', 1),
(13, 33, '2024-06-06 06:37:59', -209000, 1000000, 'Penarikan saldo: Tarik OVO', 1),
(14, 33, '2024-06-12 08:37:39', -50000, 950000, 'Penarikan saldo: Transfer Bank', 0);

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kategori_produk`
--

CREATE TABLE `kategori_produk` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `satuan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kategori_produk`
--

INSERT INTO `kategori_produk` (`id`, `nama`, `satuan`) VALUES
(1, 'Cake', 'loyang'),
(2, 'Roti', 'box'),
(3, 'Minuman', 'liter'),
(4, 'Titipan', 'bungkus'),
(5, 'Hampers', 'paket');

-- --------------------------------------------------------

--
-- Table structure for table `ketidakhadiran`
--

CREATE TABLE `ketidakhadiran` (
  `id` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ketidakhadiran`
--

INSERT INTO `ketidakhadiran` (`id`, `id_pegawai`, `tanggal`) VALUES
(1, 4, '2024-03-01'),
(2, 4, '2024-03-05'),
(3, 3, '2024-03-09'),
(4, 4, '2024-05-03'),
(5, 20, '2024-05-03'),
(6, 22, '2024-05-03'),
(7, 21, '2024-05-03'),
(8, 4, '2024-05-02'),
(9, 20, '2024-05-02'),
(10, 21, '2024-05-02'),
(11, 20, '2024-04-18'),
(12, 4, '2024-05-04'),
(14, 30, '2024-05-05'),
(15, 30, '2024-05-06'),
(16, 30, '2024-05-01'),
(17, 34, '2024-05-08'),
(20, 30, '2024-02-01'),
(21, 4, '2024-06-04'),
(22, 4, '2024-06-03');

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
(1, '0001_01_01_000001_create_cache_table', 1),
(2, '0001_01_01_000002_create_jobs_table', 1),
(3, '2024_04_21_102738_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE `pegawai` (
  `id_user` int(11) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `bonus` int(11) DEFAULT NULL,
  `no_telp` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pegawai`
--

INSERT INTO `pegawai` (`id_user`, `alamat`, `bonus`, `no_telp`) VALUES
(1, 'Jl. KLM No. 357', 10000, '087712345678'),
(2, 'Jl. UVW No. 246', 125000, '081234567890'),
(3, 'Jl. XYZ No. 789', 120000, '085643215789'),
(4, 'Jl. Tono.anto No. 11', 10000, '082345678901'),
(20, 'ASDSA\"FPAND:AILKC', 10000, '082123123'),
(21, '1', 0, '1'),
(22, '122', 0, '122'),
(27, 'Jl menuju kegelapan dunia no 22', 0, '082567232311'),
(30, 'Jalan pertanahan no 11', 0, '087712345568'),
(34, 'jalan pelajar', 0, '0871123441231');

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran_gaji`
--

CREATE TABLE `pembayaran_gaji` (
  `id` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `honor_harian` int(11) NOT NULL,
  `reward` int(11) NOT NULL,
  `total_gaji` int(11) NOT NULL,
  `tanggal` varchar(7) NOT NULL COMMENT 'bulan dan tahun pembayaran gaji'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pembayaran_gaji`
--

INSERT INTO `pembayaran_gaji` (`id`, `id_pegawai`, `honor_harian`, `reward`, `total_gaji`, `tanggal`) VALUES
(1, 2, 3750000, 200000, 3950000, '0000-00'),
(2, 3, 3600000, 150000, 3750000, '0000-00'),
(3, 4, 3300000, 100000, 3400000, '0000-00');

-- --------------------------------------------------------

--
-- Table structure for table `pengeluaran_lain_lain`
--

CREATE TABLE `pengeluaran_lain_lain` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `nominal` int(11) NOT NULL,
  `flag_delete` tinyint(4) NOT NULL DEFAULT 0,
  `tanggal_pengeluaran` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pengeluaran_lain_lain`
--

INSERT INTO `pengeluaran_lain_lain` (`id`, `nama`, `nominal`, `flag_delete`, `tanggal_pengeluaran`) VALUES
(2, 'Gaji Karyawan', 20000000, 0, '2024-03-02'),
(3, 'Bahan Baku', 10000000, 0, '2024-03-03'),
(4, 'Iuran RT', 500000, 0, '2024-03-04'),
(5, 'Bahan Baku', 10000000, 0, '2024-04-05'),
(6, 'Bensin', 530000, 0, '2024-03-06'),
(7, 'Listrik', 4500000, 0, '2024-04-07'),
(8, 'Gas', 2500000, 0, '2024-03-08'),
(9, 'Gaji Karyawan', 22000000, 0, '2024-04-09'),
(10, 'Gas', 2500000, 0, '2024-04-10'),
(13, 'Bensin', 120000, 0, '2024-05-13'),
(15, 'Listrik', 5000000, 0, '2024-03-01'),
(16, 'Listrik Tambahan', 3000000, 1, '2024-05-08'),
(17, 'Listrik Kantor', 3000000, 0, '2024-05-08'),
(18, 'Listrik Bulanan', 500000, 1, '2024-05-08');

-- --------------------------------------------------------

--
-- Table structure for table `penitip`
--

CREATE TABLE `penitip` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `alamat` text NOT NULL,
  `no_telp` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `penitip`
--

INSERT INTO `penitip` (`id`, `nama`, `alamat`, `no_telp`) VALUES
(1, 'JUJU', 'Jl. Tomat No. 1232', '081234567890'),
(2, 'Jeje', 'Jl. ASDAOLISND No. 12312', '089666344211'),
(3, 'Dodo', 'Jl. ANSADAS No. 666', '083442566755'),
(4, 'Supriyanto', 'Jl. DEF No. 321', '084335634122'),
(5, 'Julianto', 'Jl. ASDASDASDASDASDASD No. 44A', '085766422322'),
(6, 'Jacky', 'Jl. MNC Jakarta No. 987', '081234567890'),
(7, 'Brian', 'Jl. Jakal No. 20B', '087654321098'),
(8, 'Daniel Ivan', 'Jl. Amsterdam No. 44', '083210987654'),
(9, 'Budiyanto', 'Jl kemerdekaan bangsawan No 30', '082644533822'),
(16, 'testing', 'jalan testing', 'aaa');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
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
(1, 'App\\Models\\User', 11, 'api_token', '8bc1653d589b8256c84e2a50f1e2ef786b29dffb0922891ec7627b500093d0b8', '[\"*\"]', NULL, NULL, '2024-04-21 03:56:30', '2024-04-21 03:56:30'),
(41, 'App\\Models\\User', 16, 'api_token', 'a1b039bddd3e631f441c8180fa897fc0d7d0f44c22d1aa929c8dcee2d1bccf33', '[\"*\"]', NULL, NULL, '2024-04-21 23:56:37', '2024-04-21 23:56:37'),
(44, 'App\\Models\\User', 16, 'api_token', '049aaf2ff11dc809d81ac29a72de83212d03e7c11d7bc6139a6969afe37a6c4c', '[\"*\"]', NULL, NULL, '2024-04-22 00:24:38', '2024-04-22 00:24:38'),
(45, 'App\\Models\\User', 12, 'reset_password', '5cefe8752fa0cb2378deeda419ef322f3cb5531f1fe4eb8ca817ad110bfe8428', '[\"reset_password\"]', NULL, NULL, '2024-04-22 01:49:37', '2024-04-22 01:49:37'),
(46, 'App\\Models\\User', 12, 'reset_password', 'ed628c18b96f7abe6a303371af1c6ee7eeaa71055d694aa84ab2a1f2ede877dc', '[\"reset_password\"]', NULL, NULL, '2024-04-22 01:52:18', '2024-04-22 01:52:18'),
(47, 'App\\Models\\User', 12, 'reset_password', '8988407b75516bbfef0f16d6e5878a1e3e87b5ca0a116330363daae0b123775c', '[\"reset_password\"]', NULL, NULL, '2024-04-22 02:22:22', '2024-04-22 02:22:22'),
(48, 'App\\Models\\User', 12, 'reset_password', 'ebc6c70b35b4666202e15129109022a26210a73f4cd671c9f845f6715fbe5c99', '[\"reset_password\"]', NULL, NULL, '2024-04-22 02:24:20', '2024-04-22 02:24:20'),
(51, 'App\\Models\\User', 18, 'api_token', '92b0ae2f92e504151d951a459712d3035de9304d9c185c7cbaaca5d19558a4af', '[\"c\"]', NULL, NULL, '2024-04-22 21:08:38', '2024-04-22 21:08:38'),
(52, 'App\\Models\\User', 18, 'api_token', '916a9c53f853bafc0c4cfe6479ed75501c6c612412fecfe4938c13aeaa93d710', '[\"c\"]', NULL, NULL, '2024-04-22 21:09:40', '2024-04-22 21:09:40'),
(53, 'App\\Models\\User', 18, 'api_token', '7d2e74b78a5dea569abe9963eded2dd796be56e645a0841dc5a6effd851fd128', '[\"c\"]', NULL, NULL, '2024-04-22 21:10:13', '2024-04-22 21:10:13'),
(54, 'App\\Models\\User', 18, 'api_token', 'aebc184aed90e05574210f051cb11f2929ccb85d8b6ab3748cf3b10d69f0b5aa', '[\"c\"]', NULL, NULL, '2024-04-22 21:12:26', '2024-04-22 21:12:26'),
(57, 'App\\Models\\User', 12, 'reset_password', '98df7f8a97662a43ba4ade47d9804c41ae9f0e5f1b81a71c04c2c1c7166ca055', '[\"reset_password\"]', NULL, '2024-04-23 06:37:20', '2024-04-23 06:22:20', '2024-04-23 06:22:20'),
(61, 'App\\Models\\User', 18, 'api_token', 'dddce3de49f13ee403acd131db614f672a62c804cb28ccab04dff568a684bdf0', '[\"c\"]', NULL, NULL, '2024-04-23 21:12:44', '2024-04-23 21:12:44'),
(62, 'App\\Models\\User', 19, 'reset_password', 'a04ff73f170551a9b4a1040ce111b8832e779f1ddff4800da6560e742d3d307c', '[\"reset_password\"]', NULL, '2024-04-23 21:29:18', '2024-04-23 21:14:18', '2024-04-23 21:14:18'),
(63, 'App\\Models\\User', 19, 'reset_password', '91b16697f29e37b2565d1813bfe6f1d533712e5c0972f9aca463527b7670bb62', '[\"reset_password\"]', NULL, '2024-04-23 21:30:04', '2024-04-23 21:15:04', '2024-04-23 21:15:04'),
(64, 'App\\Models\\User', 19, 'api_token', 'ef6203d059260836be361e2c558e61e50ff66caeb61b2bf35a5be648eb0c7c39', '[\"c\"]', NULL, NULL, '2024-04-23 22:22:59', '2024-04-23 22:22:59'),
(65, 'App\\Models\\User', 19, 'api_token', 'b51ef8613e1a08d5bf0fbcfff8fe47587d08941b897874f87022a6d6e860d2e3', '[\"c\"]', NULL, NULL, '2024-04-23 22:23:19', '2024-04-23 22:23:19'),
(66, 'App\\Models\\User', 19, 'reset_password', 'd6e82154fb2b733c1c6069117737fcd1c39f404ab0e18fb47194bd5921aa4c31', '[\"reset_password\"]', NULL, '2024-04-23 23:26:09', '2024-04-23 23:11:09', '2024-04-23 23:11:09'),
(113, 'App\\Models\\User', 14, 'api_token', 'c7ecc394366d235707cfcde4d053b2e66f7c210cd5898552d9c04fd81f6f2f0a', '[\"c\"]', NULL, NULL, '2024-04-30 23:18:22', '2024-04-30 23:18:22'),
(117, 'App\\Models\\User', 23, 'api_token', '074fab3cf107d813f4ffcbaa6c60fa3b26fc4fdec116e7119985cb1e4dd48572', '[\"c\"]', '2024-05-01 03:02:17', NULL, '2024-05-01 02:18:15', '2024-05-01 03:02:17'),
(118, 'App\\Models\\User', 23, 'api_token', 'b0847b5710ec4ea2a0f33df1fcecca07d0afddbdc40cd56b789071651ae979ae', '[\"c\"]', '2024-05-01 10:01:09', NULL, '2024-05-01 06:46:05', '2024-05-01 10:01:09'),
(164, 'App\\Models\\User', 12, 'api_token', 'fcf0ba4dc4ddf7b1293cc2557d76a54f441477eb56831e392439d7b2915018c1', '[\"c\"]', '2024-05-04 05:21:23', NULL, '2024-05-04 05:21:22', '2024-05-04 05:21:23'),
(234, 'App\\Models\\User', 35, 'api_token', '753a92f2214bc3b8f12c25286a3bba4687910ecbcd644834b3238e4741b30e56', '[\"c\"]', '2024-05-05 19:43:56', NULL, '2024-05-05 19:43:55', '2024-05-05 19:43:56'),
(253, 'App\\Models\\User', 36, 'api_token', 'dfdc4d8a2cc3da38b1b5985d10bcf21acf2481a746f9280a682b2c5f87de8527', '[\"c\"]', '2024-05-08 03:54:58', NULL, '2024-05-08 03:47:04', '2024-05-08 03:54:58'),
(262, 'App\\Models\\User', 37, 'api_token', '77c5c98502dfe21ac35a39bcd90dd8ec45768cfe661e6624b876c97854489364', '[\"c\"]', '2024-05-08 05:36:01', NULL, '2024-05-08 05:35:18', '2024-05-08 05:36:01'),
(269, 'App\\Models\\User', 36, 'api_token', '3af9f28035656d5a8ed11e14e2cfef4a422a428d073356da3f271ee72a950eb6', '[\"c\"]', '2024-05-21 05:47:49', NULL, '2024-05-21 05:37:24', '2024-05-21 05:47:49'),
(270, 'App\\Models\\User', 36, 'api_token', 'e777e3c356703b2d3eda89b812b40e215a8da2538aafc4ce46eab9927ff719c4', '[\"c\"]', '2024-05-21 07:03:19', NULL, '2024-05-21 05:48:19', '2024-05-21 07:03:19'),
(279, 'App\\Models\\User', 38, 'api_token', '22dad37f8c8c452f4b284ae4d4556852518442000c2669d638aa00a7ce0e4d36', '[\"c\"]', '2024-05-21 07:21:44', NULL, '2024-05-21 07:10:04', '2024-05-21 07:21:44'),
(280, 'App\\Models\\User', 38, 'api_token', 'dd3da484ebc17d88c1eec80678adc9fed36ca2c9a4610e5e0426aaca43440ac3', '[\"c\"]', '2024-05-21 08:52:25', NULL, '2024-05-21 08:01:36', '2024-05-21 08:52:25'),
(283, 'App\\Models\\User', 38, 'api_token', '89a58cd905034cc07e05f3f530f48af54d989a9bccfa9f8c4408fc8379458be0', '[\"c\"]', '2024-05-24 05:46:42', NULL, '2024-05-24 05:43:54', '2024-05-24 05:46:42'),
(290, 'App\\Models\\User', 39, 'api_token', '1f79540e10b0cfc379a47d58f1306c94e4a585cb72d775fe4a36f7514e578019', '[\"c\"]', '2024-05-24 23:46:18', NULL, '2024-05-24 23:39:09', '2024-05-24 23:46:18'),
(292, 'App\\Models\\User', 39, 'api_token', 'b737a3ce95060a30dedbf62d909f87877bc13400453c741dd7e6662304fadbc4', '[\"c\"]', '2024-05-25 03:52:47', NULL, '2024-05-25 00:01:59', '2024-05-25 03:52:47'),
(297, 'App\\Models\\User', 39, 'api_token', '3f1e1a641bfb107bfe8f2e390f89862af04371d1ccc382e6a05c06090d0292db', '[\"c\"]', '2024-05-26 00:08:06', NULL, '2024-05-25 23:33:24', '2024-05-26 00:08:06'),
(298, 'App\\Models\\User', 39, 'api_token', 'd20939b065d6559208cc8baa04852209c94604e5650e069edccc8313e16c5703', '[\"c\"]', '2024-05-26 00:33:31', NULL, '2024-05-26 00:17:31', '2024-05-26 00:33:31'),
(303, 'App\\Models\\User', 38, 'api_token', '4aacb3aaa6278d3088fa23f4780c878c6d45df9e0f742a1cb2dddbd1b6dfbd3a', '[\"c\"]', '2024-05-26 17:10:15', NULL, '2024-05-26 16:59:36', '2024-05-26 17:10:15'),
(306, 'App\\Models\\User', 40, 'api_token', 'd4e8005a8796ffbafe4594bc6aa1430b16419325239be4abfdfb08695ed0c026', '[\"c\"]', '2024-05-26 17:19:55', NULL, '2024-05-26 17:12:32', '2024-05-26 17:19:55'),
(307, 'App\\Models\\User', 36, 'api_token', '83b84cf44916c0f63b818cbf83c86bb3dcc8ddaab172e56a4d6759321349b6b2', '[\"c\"]', '2024-05-26 17:24:02', NULL, '2024-05-26 17:23:55', '2024-05-26 17:24:02'),
(308, 'App\\Models\\User', 41, 'api_token', 'e214877903175fe56f9563dfe9a69dcec4f6b47d0ab7d4b49145129b79ae9e9d', '[\"c\"]', '2024-05-26 17:32:10', NULL, '2024-05-26 17:30:15', '2024-05-26 17:32:10'),
(309, 'App\\Models\\User', 41, 'api_token', 'f8811a4d9162bdd3e4d05fe3ed307515c3cde204a8174a28933170bc58e596d8', '[\"c\"]', '2024-05-26 18:00:12', NULL, '2024-05-26 17:59:46', '2024-05-26 18:00:12'),
(310, 'App\\Models\\User', 41, 'api_token', '0d699924a546afd91af8c851c7c93aaa6e5c10a7ead95bf958f6966c717e2c45', '[\"c\"]', '2024-05-26 18:03:39', NULL, '2024-05-26 18:03:38', '2024-05-26 18:03:39'),
(311, 'App\\Models\\User', 41, 'api_token', '2d04de52e541f2bcf6e586cbbc45177e4f5b80a20d18cceea36d090a05332c08', '[\"c\"]', '2024-05-26 18:55:53', NULL, '2024-05-26 18:26:52', '2024-05-26 18:55:53'),
(312, 'App\\Models\\User', 41, 'api_token', 'dcfae87c904bfda1feb041859bfb4811d40de77a4e96b99b9a62d47eb1eb9217', '[\"c\"]', '2024-05-26 18:58:52', NULL, '2024-05-26 18:58:18', '2024-05-26 18:58:52'),
(313, 'App\\Models\\User', 40, 'api_token', '96f624ccf43f5e99812ac52ffe41edd1e97a231d79799a6fc1ca2b21d7e6874b', '[\"c\"]', '2024-05-26 19:14:16', NULL, '2024-05-26 19:00:12', '2024-05-26 19:14:16'),
(377, 'App\\Models\\User', 1, 'api_token', 'bff0c4c915ae73dda20a3aa72c4e01913bea45941cffe7c089a9bbae2122a54e', '[\"adm\"]', '2024-06-06 05:41:08', NULL, '2024-06-06 05:15:11', '2024-06-06 05:41:08'),
(383, 'App\\Models\\User', 1, 'api_token', '0beb5853f8461ad3210fd117f9f2188b11b13ba1b26d300113b5467217a91e8d', '[\"adm\"]', '2024-06-06 05:55:21', NULL, '2024-06-06 05:48:39', '2024-06-06 05:55:21'),
(387, 'App\\Models\\User', 1, 'api_token', '422798202efbd9c08b960b8ec21f554f9432a61dd8022774d2ebcfb1a0d59622', '[\"adm\"]', '2024-06-06 06:10:06', NULL, '2024-06-06 05:58:21', '2024-06-06 06:10:06'),
(390, 'App\\Models\\User', 1, 'api_token', '9a279dd095fc62c8f74f5854786346cad11cd6c8de5c29f7c21bada6a85c4b72', '[\"adm\"]', '2024-06-06 06:22:35', NULL, '2024-06-06 06:20:54', '2024-06-06 06:22:35'),
(392, 'App\\Models\\User', 1, 'api_token', '538ec2f2868e6068f9a0051df713d3413b66139954db9e7e4b18216c05b63ea2', '[\"adm\"]', '2024-06-06 06:26:24', NULL, '2024-06-06 06:24:03', '2024-06-06 06:26:24'),
(395, 'App\\Models\\User', 1, 'api_token', 'f8ef0f4406b397fd77c966c6a034b53d51c8d85bb34697b2cb1c3e3f8e556cb4', '[\"adm\"]', '2024-06-06 06:35:36', NULL, '2024-06-06 06:28:51', '2024-06-06 06:35:36'),
(400, 'App\\Models\\User', 1, 'api_token', '0391f2322f396dcc85d9fd6f36121a80b12acade2a3349c7ae70e7f16cb102dd', '[\"adm\"]', '2024-06-06 06:42:23', NULL, '2024-06-06 06:38:50', '2024-06-06 06:42:23'),
(401, 'App\\Models\\User', 44, 'api_token', '2b63c15d06fe64100d67414e9c620c8cd1f1f2a5befaffc15d0454ef57bc1788', '[\"c\"]', '2024-06-06 06:42:43', NULL, '2024-06-06 06:39:53', '2024-06-06 06:42:43'),
(402, 'App\\Models\\User', 42, 'api_token', 'c5558f1119b9c6b38ddea811171aa30f933b08f4392b6ca4263faf5d2014ba71', '[\"c\"]', '2024-06-12 08:17:25', NULL, '2024-06-12 08:17:23', '2024-06-12 08:17:25'),
(403, 'App\\Models\\User', 1, 'api_token', 'd928ef8f2ce4e1bd3600937981e3e41d8e74e70fc78cd1fb9cf59c3c21741d33', '[\"adm\"]', '2024-06-12 08:37:53', NULL, '2024-06-12 08:18:28', '2024-06-12 08:37:53'),
(406, 'App\\Models\\User', 45, 'api_token', '446ae60799f1bcb9e4fd782912f961e94272011b8389a35249c04a8647d9557f', '[\"c\"]', '2024-06-12 08:36:39', NULL, '2024-06-12 08:36:20', '2024-06-12 08:36:39'),
(409, 'App\\Models\\User', 45, 'api_token', '3b9c73098da30a654df1d7a50cbb6eb3f21f1337206b9fe69e520325522de758', '[\"c\"]', '2024-06-12 08:42:25', NULL, '2024-06-12 08:42:24', '2024-06-12 08:42:25'),
(410, 'App\\Models\\User', 45, 'api_token', '5642089ddfbd0b06128f28a21af059e6cd63c276b5fc690f1b2f792a8a6f3c4b', '[\"c\"]', '2024-06-12 08:43:12', NULL, '2024-06-12 08:43:10', '2024-06-12 08:43:12'),
(411, 'App\\Models\\User', 1, 'api_token', '5d0a2d1f5b9a68df1acbc22a7f11161ded5a879cf7e748fbd597183f78a0a7db', '[\"adm\"]', '2024-06-12 08:43:31', NULL, '2024-06-12 08:43:31', '2024-06-12 08:43:31'),
(412, 'App\\Models\\User', 1, 'api_token', 'bccb2dc5aa9358d84dc9a93a35e7ebc7043e0bd74f9722656b0e38004333e66b', '[\"adm\"]', '2024-06-12 08:47:19', NULL, '2024-06-12 08:44:42', '2024-06-12 08:47:19'),
(414, 'App\\Models\\User', 45, 'api_token', '10058b3026a52cc51ddf1b78e1b11827864f61c8df51166c5fc899e7a472dcfe', '[\"c\"]', '2024-06-12 08:50:54', NULL, '2024-06-12 08:50:18', '2024-06-12 08:50:54'),
(416, 'App\\Models\\User', 1, 'api_token', 'b368b1e425d205d5cd7e9699893146065914e412e90e25b7317660e61b50d7ac', '[\"adm\"]', '2024-06-12 08:56:34', NULL, '2024-06-12 08:54:44', '2024-06-12 08:56:34'),
(418, 'App\\Models\\User', 45, 'api_token', '98e72a4329860fbb8c3d6b519148cb87626317acea93f3cb634693a28cb8073a', '[\"c\"]', '2024-06-12 08:59:05', NULL, '2024-06-12 08:59:04', '2024-06-12 08:59:05'),
(420, 'App\\Models\\User', 1, 'api_token', 'a2cce606173ab81e4f0256de0ca83bdd0394f8f320eb9b1a6ce5f861f8d947bc', '[\"adm\"]', '2024-06-12 09:04:59', NULL, '2024-06-12 09:01:27', '2024-06-12 09:04:59'),
(424, 'App\\Models\\User', 1, 'api_token', '5e60401c6c71b2a3164209562ec92c76ca61e3917d67c8aeae2a3744a35c0e25', '[\"adm\"]', '2024-06-12 09:20:37', NULL, '2024-06-12 09:10:13', '2024-06-12 09:20:37'),
(432, 'App\\Models\\User', 1, 'api_token', '06226479a6d1474364b8b9f69a3b0b8ca3bd25ec52aa65e76386c99189b397a6', '[\"adm\"]', '2024-06-12 09:46:39', NULL, '2024-06-12 09:46:38', '2024-06-12 09:46:39'),
(433, 'App\\Models\\User', 33, 'api_token', '546e5600e1e5ffc3770ba3ebc1469ee90501353072328d88348aa39d4e2112c1', '[\"c\"]', '2024-06-12 09:46:54', NULL, '2024-06-12 09:46:53', '2024-06-12 09:46:54'),
(435, 'App\\Models\\User', 33, 'api_token', '23d89519101ff7b86f20b9ce35fc141749a8873e68bafb091034f1400cdfc4a9', '[\"c\"]', '2024-06-21 08:18:50', NULL, '2024-06-21 08:18:48', '2024-06-21 08:18:50');

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `id_penitip` int(11) DEFAULT NULL,
  `nama` varchar(255) NOT NULL,
  `deskripsi` varchar(255) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `harga` int(11) NOT NULL,
  `harga_setengah_loyang` int(11) DEFAULT NULL,
  `stok_ready` int(11) NOT NULL DEFAULT 0,
  `kuota_harian` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id`, `id_kategori`, `id_penitip`, `nama`, `deskripsi`, `foto`, `harga`, `harga_setengah_loyang`, `stok_ready`, `kuota_harian`) VALUES
(2, 4, 8, 'Mandarin titipan', NULL, NULL, 450000, NULL, 8, NULL),
(3, 1, NULL, 'Brownies', NULL, '1716304996.jpg', 500000, 150000, 0, 20),
(4, 1, NULL, 'Lapis Surabaya', NULL, NULL, 550000, 300000, 0, 20),
(5, 3, NULL, 'Matcha Creamy Latte', NULL, NULL, 100000, NULL, 0, 20),
(6, 4, 1, 'Keripik Kentang', NULL, NULL, 75000, NULL, 2, NULL),
(7, 4, 2, 'Kopi Luwak Bubuk', NULL, '1716305195.jpg', 500000, NULL, 0, NULL),
(8, 4, 3, 'Matcha Organik Bubuk', NULL, NULL, 900000, NULL, 14, NULL),
(9, 4, 4, 'Chocolate Bar', NULL, NULL, 120000, NULL, 0, NULL),
(37, 3, NULL, 'Matcha Latte', NULL, NULL, 50000, NULL, 0, 20),
(50, 1, NULL, 'Lapis Legit', NULL, NULL, 150000, 80000, 0, 20),
(53, 1, NULL, 'Kue Bulan', NULL, NULL, 70000, 35000, 0, 20),
(59, 1, NULL, 'Kue Tisu Kering', 'Kue yang terbuat dari tisu yang bisa dimakan', NULL, 20000, 5000, 0, 20),
(61, 1, NULL, 'kue ceria', 'Kue yang bikin kita ceria', '1716305340.jpg', 20000, 10000, 0, 20),
(62, 4, 6, 'Matcha Latte', 'Ya matcha cuy', NULL, 15000, NULL, 3, NULL),
(63, 5, NULL, 'Hamper Unik', 'Hampers unik', NULL, 3999999, NULL, 0, NULL),
(64, 5, NULL, 'Hampers cukup', NULL, NULL, 5000000, NULL, 0, NULL),
(67, 5, NULL, 'Hampers D', NULL, NULL, 1000000, NULL, 0, NULL),
(68, 1, NULL, 'Brownies Kukus', 'Brownies enak dikukus dengan meriah', '1716305536.jpg', 60000, 40000, 0, 20),
(69, 1, NULL, 'Kue Bolu lembut', 'Kue Bolu lembut di mulut', NULL, 140000, 70000, 0, 20),
(70, 1, NULL, 'Lapis Legit', 'Kue Lapis Legit enak disantap kapanpun', NULL, 90000, 65000, 0, 20),
(71, 1, NULL, 'Choco Chip', 'ChocoChip renyah', '1716306031.jpg', 120000, 70000, 0, 20),
(72, 1, NULL, 'Bolu Kukus', NULL, '1716306091.jpg', 135000, 70000, 0, 20),
(74, 4, 1, 'Hampers A', NULL, '1716306258.jpeg', 1000000, NULL, 0, NULL),
(75, 5, NULL, 'Hampers Ready', NULL, '1716306734.jpeg', 1500000, NULL, 0, NULL),
(76, 1, NULL, 'Brownies Pandan', 'Brownies Pandan enak', NULL, 60000, 40000, 0, 10),
(77, 4, 2, 'Es Teh Jumbo', NULL, '1717375095.png', 5000, NULL, 7, NULL),
(78, 2, NULL, 'Roti Babi Panggang', 'Roti Babi Panggang enak', NULL, 100000, NULL, 0, 5),
(79, 1, NULL, 'Kue Bagus', 'Kue Bagus Enak', NULL, 100000, 60000, 0, 10);

-- --------------------------------------------------------

--
-- Table structure for table `produk_bahan`
--

CREATE TABLE `produk_bahan` (
  `id` int(11) NOT NULL,
  `id_bahan_baku` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `produk_bahan`
--

INSERT INTO `produk_bahan` (`id`, `id_bahan_baku`, `id_produk`, `qty`) VALUES
(3, 3, 3, 200),
(5, 8, 5, 120),
(7, 6, 7, 50),
(8, 7, 8, 120),
(13, 4, 5, 12),
(23, 1, 50, 1),
(26, 2, 53, 1),
(34, 7, 61, 200),
(35, 6, 61, 200),
(36, 8, 61, 200),
(50, 3, 37, 1),
(51, 1, 68, 1),
(53, 6, 68, 1),
(54, 7, 68, 1),
(55, 3, 68, 2),
(56, 1, 69, 2),
(57, 3, 69, 1),
(58, 5, 69, 1),
(59, 9, 69, 1),
(62, 1, 70, 2),
(63, 2, 70, 1),
(64, 3, 70, 1),
(66, 1, 71, 1),
(67, 2, 71, 1),
(68, 3, 71, 1),
(69, 4, 71, 1),
(70, 5, 71, 1),
(71, 1, 72, 3),
(72, 2, 72, 1),
(76, 2, 3, 1),
(78, 1, 4, 100),
(79, 1, 76, 100),
(80, 2, 76, 30),
(81, 1, 3, 5),
(82, 31, 78, 2),
(83, 1, 79, 1),
(84, 2, 79, 1),
(86, 5, 79, 1);

-- --------------------------------------------------------

--
-- Table structure for table `promo_poin`
--

CREATE TABLE `promo_poin` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `tanggal_mulai` date NOT NULL,
  `tanggal_selesai` date NOT NULL,
  `kelipatan` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` char(10) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `gaji_dasar_harian` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `nama`, `gaji_dasar_harian`) VALUES
('adm', 'Admin', 800000),
('c', 'Customer', 0),
('kar', 'Employee', 750000),
('mo', 'Manager Operasional', 960000),
('own', 'Owner', 1920000);

-- --------------------------------------------------------

--
-- Table structure for table `tokens`
--

CREATE TABLE `tokens` (
  `token` char(64) NOT NULL DEFAULT 'uuid()',
  `id_user` int(11) NOT NULL,
  `revoked` tinyint(4) NOT NULL DEFAULT 0,
  `intent` enum('auth','verification','passreset') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_used_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `expires_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tokens`
--

INSERT INTO `tokens` (`token`, `id_user`, `revoked`, `intent`, `created_at`, `last_used_at`, `expires_at`) VALUES
('42902bbc-f4d7-4b3f-83e3-fbdfbd25e903', 5, 0, 'auth', '2024-04-20 17:39:30', '2024-04-20 17:39:30', '2024-04-27 17:39:30');

-- --------------------------------------------------------

--
-- Table structure for table `trx_pembelian_bb`
--

CREATE TABLE `trx_pembelian_bb` (
  `id` int(11) NOT NULL,
  `id_bahan_baku` int(11) NOT NULL,
  `tanggal_pembelian` date NOT NULL,
  `harga_satuan` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `total_harga` int(11) NOT NULL,
  `flag_delete` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `trx_pembelian_bb`
--

INSERT INTO `trx_pembelian_bb` (`id`, `id_bahan_baku`, `tanggal_pembelian`, `harga_satuan`, `qty`, `total_harga`, `flag_delete`) VALUES
(1, 3, '2024-03-01', 5000, 10, 50000, 0),
(2, 6, '2024-03-02', 6000, 10, 60000, 0),
(3, 9, '2024-03-03', 5500, 10, 55000, 0),
(4, 9, '2024-03-04', 4800, 10, 48000, 0),
(5, 6, '2024-03-05', 5200, 10, 52000, 0),
(6, 3, '2024-03-06', 5300, 10, 53000, 0),
(7, 3, '2024-03-07', 4900, 10, 49000, 0),
(8, 6, '2024-03-08', 4700, 10, 47000, 0),
(9, 9, '2024-03-09', 5800, 10, 58000, 0),
(10, 9, '2024-03-10', 5400, 10, 54000, 0),
(13, 1, '2024-05-03', 6000, 10, 60000, 0),
(14, 1, '2024-05-03', 4000, 11, 44000, 0),
(15, 8, '2024-05-01', 10000, 2, 20000, 0),
(18, 1, '2024-05-02', 10000, 5, 50000, 0),
(19, 4, '2024-05-03', 4000, 5, 20000, 0),
(20, 35, '2024-05-06', 20000, 5, 100000, 0),
(21, 3, '2024-05-08', 10, 5000, 50000, 0),
(22, 1, '2024-05-08', 10000, 3, 30000, 1),
(23, 1, '2024-05-08', 7000, 3, 21000, 1),
(24, 1, '2024-05-08', 10000, 3, 30000, 1),
(25, 1, '2024-06-02', 5000, 200, 1000000, 0),
(26, 1, '2024-06-05', 5000, 250, 1250000, 0),
(27, 1, '2024-06-05', 5000, 160, 800000, 0),
(28, 1, '2024-06-11', 5000, 105, 525000, 0),
(29, 2, '2024-06-11', 3000, 100, 300000, 0),
(30, 6, '2024-06-11', 700, 100, 70000, 0);

-- --------------------------------------------------------

--
-- Table structure for table `trx_penjualan`
--

CREATE TABLE `trx_penjualan` (
  `id` int(11) NOT NULL,
  `no_nota` varchar(10) DEFAULT NULL,
  `id_customer` int(11) NOT NULL,
  `id_alamat` int(11) DEFAULT NULL,
  `tanggal_pesan` datetime NOT NULL DEFAULT current_timestamp(),
  `tanggal_lunas` datetime DEFAULT NULL,
  `tanggal_siap` datetime NOT NULL DEFAULT current_timestamp(),
  `tanggal_ambil` datetime DEFAULT NULL,
  `harga_pesanan` int(11) NOT NULL,
  `metode_pembayaran` varchar(255) DEFAULT NULL,
  `bukti_pembayaran` varchar(255) DEFAULT NULL,
  `poin_didapat` int(11) DEFAULT NULL,
  `poin_dipakai` int(11) DEFAULT NULL,
  `tip` int(11) DEFAULT NULL,
  `ongkos_kirim` int(11) DEFAULT NULL,
  `grand_total` int(11) NOT NULL,
  `jenis_pengiriman` enum('Delivery','Pick-Up') NOT NULL,
  `status_pesanan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `trx_penjualan`
--

INSERT INTO `trx_penjualan` (`id`, `no_nota`, `id_customer`, `id_alamat`, `tanggal_pesan`, `tanggal_lunas`, `tanggal_siap`, `tanggal_ambil`, `harga_pesanan`, `metode_pembayaran`, `bukti_pembayaran`, `poin_didapat`, `poin_dipakai`, `tip`, `ongkos_kirim`, `grand_total`, `jenis_pengiriman`, `status_pesanan`) VALUES
(1, '24.05.1', 5, 1, '2024-03-01 00:00:00', '2024-03-02 00:00:00', '2024-04-18 00:00:00', NULL, 350000, 'Cash', NULL, NULL, NULL, 20000, 10000, 0, 'Delivery', 'Selesai'),
(2, '24.05.2', 5, 1, '2024-05-01 11:49:51', NULL, '2024-05-01 11:49:51', NULL, 0, 'Cash', NULL, NULL, NULL, 0, NULL, 0, 'Delivery', 'Pending Ongkir'),
(3, '24.05.3', 5, 2, '2024-05-01 11:49:51', NULL, '2024-05-01 11:49:51', NULL, 0, 'Debit', NULL, NULL, NULL, 0, NULL, 0, 'Delivery', 'Batal'),
(4, '24.05.4', 36, 9, '2024-05-21 12:44:44', NULL, '2024-05-23 00:00:00', NULL, 450000, 'Pick-Up', '1716296143.png', 65, 0, 10000, 10000, 460000, 'Delivery', 'Pesanan Dijadwalkan'),
(5, '24.05.5', 36, NULL, '2024-05-21 13:08:57', NULL, '2024-05-23 00:00:00', NULL, 0, 'Delivery', '1716297942.jpg', 0, 0, 10000, NULL, 0, 'Pick-Up', 'Pesanan Ditolak'),
(6, '24.05.6', 36, NULL, '2024-05-21 13:39:04', NULL, '2024-05-23 00:00:00', NULL, 300000, 'Delivery', '1716298782.jpg', 45, 0, 10000, NULL, 300000, 'Pick-Up', 'Pesanan Dijadwalkan'),
(7, '24.05.7', 36, 9, '2024-05-21 13:59:30', NULL, '2024-05-23 00:00:00', NULL, 450000, 'E-Money', '1716300132.jpg', 65, 110, 1000, 10000, 449000, 'Delivery', 'Pesanan Dijadwalkan'),
(8, '24.05.8', 38, 11, '2024-05-21 14:11:42', NULL, '2024-05-23 00:00:00', NULL, 0, 'Delivery', '1716300777.jpg', 0, 0, 1000, 10000, 10000, 'Delivery', 'Pesanan Dijadwalkan'),
(9, '24.05.9', 38, 11, '2024-05-21 14:14:59', NULL, '2024-05-23 00:00:00', NULL, 0, 'Delivery', '1716300940.jpg', 0, 0, 1000, 10000, 10000, 'Delivery', 'Pesanan Dijadwalkan'),
(10, '24.05.10', 38, NULL, '2024-05-21 14:19:10', NULL, '2024-05-23 00:00:00', NULL, 450000, 'E-Money', '1716301169.jpg', 130, 0, 0, NULL, 450000, 'Pick-Up', 'Pesanan Dijadwalkan'),
(11, '24.05.11', 38, NULL, '2024-05-21 14:21:44', NULL, '2024-05-23 00:00:00', NULL, 0, 'Delivery', '1716303894.jpg', 0, 0, 0, NULL, 0, 'Pick-Up', 'Pesanan Ditolak'),
(12, '24.05.12', 38, NULL, '2024-05-21 15:04:04', NULL, '2024-05-23 00:00:00', NULL, 300000, 'Pick-Up', '1716303902.png', 90, 0, 5000, NULL, 300000, 'Pick-Up', 'Pesanan Dijadwalkan'),
(13, '24.05.13', 38, 11, '2024-05-21 15:08:57', NULL, '2024-05-23 00:00:00', NULL, 300000, 'Pick-Up', '1716304192.png', 90, 220, 2000, 10000, 288000, 'Delivery', 'Pesanan Dijadwalkan'),
(14, '24.05.14', 38, NULL, '2024-05-21 15:46:58', NULL, '2024-05-23 00:00:00', NULL, 1500000, 'Delivery', '1716306436.jpg', 550, 0, 0, NULL, 1500000, 'Pick-Up', 'Pesanan Dijadwalkan'),
(15, '24.05.15', 33, 7, '2024-05-25 05:58:54', NULL, '2024-05-27 00:00:00', NULL, 600000, 'Delivery', '1716617157.jpg', 90, 0, 5000, 10000, 610000, 'Delivery', 'Pesanan Dijadwalkan'),
(16, '24.05.16', 33, NULL, '2024-05-25 06:12:00', NULL, '2024-05-27 00:00:00', NULL, 150000, 'Pick-Up', '1716617607.png', 20, 0, 0, NULL, 150000, 'Pick-Up', 'Pesanan Ditolak'),
(17, '24.05.17', 33, NULL, '2024-05-25 06:18:15', NULL, '2024-05-27 00:00:00', NULL, 550000, 'E-Money', '1716617909.jpg', 80, 0, 0, NULL, 550000, 'Pick-Up', 'Pesanan Dijadwalkan'),
(18, '24.05.18', 33, NULL, '2024-05-25 06:21:37', NULL, '2024-05-27 00:00:00', NULL, 550000, 'Delivery', '1716618110.jpg', 80, 0, 0, NULL, 550000, 'Pick-Up', 'Pesanan Ditolak'),
(19, '24.05.19', 33, NULL, '2024-05-25 06:24:29', NULL, '2024-05-27 00:00:00', NULL, 1100000, 'Pick-Up', '1716618285.png', 215, 0, 0, NULL, 1100000, 'Pick-Up', 'Pesanan Dijadwalkan'),
(20, '24.05.20', 33, NULL, '2024-05-25 06:33:11', NULL, '2024-05-27 00:00:00', NULL, 650000, 'Pick-Up', '1716618833.png', 95, 380, 0, NULL, 612000, 'Pick-Up', 'Pesanan Dijadwalkan'),
(21, '24.05.21', 33, NULL, '2024-05-25 06:36:01', NULL, '2024-05-27 00:00:00', NULL, 500000, 'Delivery', '1716618974.jpg', 75, 0, 1000, NULL, 500000, 'Pick-Up', 'Pesanan Dijadwalkan'),
(22, '24.05.22', 39, NULL, '2024-05-25 06:41:07', NULL, '2024-05-27 00:00:00', NULL, 200000, 'Delivery', '1716619300.jpg', 60, 0, 5000, NULL, 200000, 'Pick-Up', 'Pesanan Dijadwalkan'),
(23, '24.05.23', 33, NULL, '2024-05-25 06:54:08', NULL, '2024-05-27 00:00:00', NULL, 1100000, 'Delivery', '1716620066.jpg', 215, 0, 0, NULL, 1100000, 'Pick-Up', 'Pesanan Dijadwalkan'),
(24, '24.05.24', 39, NULL, '2024-05-25 07:03:38', NULL, '2024-05-27 00:00:00', NULL, 550000, 'Pick-Up', '1716620635.png', 160, 0, 0, NULL, 550000, 'Pick-Up', 'Pesanan Ditolak'),
(25, '24.05.25', 39, NULL, '2024-05-25 07:09:26', NULL, '2024-05-27 00:00:00', NULL, 1100000, 'Delivery', '1716620981.jpg', 430, 0, 0, NULL, 1100000, 'Pick-Up', 'Pesanan Dijadwalkan'),
(26, '24.05.26', 33, 7, '2024-05-26 06:28:34', NULL, '2024-05-28 00:00:00', NULL, 500000, 'Delivery', '1716705047.jpg', 75, 10, 1000, 10000, 509000, 'Delivery', 'Pesanan Ditolak'),
(27, '24.05.27', 39, 12, '2024-05-26 06:34:10', NULL, '2024-05-28 00:00:00', NULL, 150000, 'Pick-Up', '1716705441.png', 40, 100, 0, 10000, 150000, 'Delivery', 'Pesanan Ditolak'),
(28, '24.05.28', 39, 12, '2024-05-26 06:46:27', NULL, '2024-05-28 00:00:00', NULL, 300000, 'Delivery', '1716706018.jpg', 90, 0, 1000, 10000, 310000, 'Delivery', 'Pesanan Dijadwalkan'),
(29, '24.05.29', 39, 12, '2024-05-26 06:47:45', NULL, '2024-05-28 00:00:00', NULL, 150000, 'Delivery', '1716706090.jpg', 40, 0, 0, 10000, 160000, 'Delivery', 'Pesanan Ditolak'),
(30, '24.05.30', 39, NULL, '2024-05-26 06:48:55', NULL, '2024-05-28 00:00:00', NULL, 150000, 'Pick-Up', '1716706159.png', 40, 0, 5000, NULL, 150000, 'Pick-Up', 'Pesanan Dijadwalkan'),
(31, '24.05.31', 39, NULL, '2024-05-26 06:57:16', NULL, '2024-05-28 00:00:00', NULL, 1100000, 'E-Money', '1716706650.jpg', 430, 0, 0, NULL, 1100000, 'Pick-Up', 'Pesanan Dijadwalkan'),
(32, '24.05.32', 39, NULL, '2024-05-26 07:02:45', NULL, '2024-05-28 00:00:00', NULL, 200000, 'E-Money', '1716706985.jpg', 60, 1000, 0, NULL, 100000, 'Pick-Up', 'Pesanan Ditolak'),
(33, '24.05.33', 39, 12, '2024-05-26 07:18:53', NULL, '2024-05-28 00:00:00', NULL, 200000, 'Delivery', '1716707951.jpg', 60, 1000, 5000, 10000, 110000, 'Delivery', 'Pesanan Dijadwalkan'),
(34, '24.05.34', 38, 11, '2024-05-27 00:01:37', NULL, '2024-05-29 00:00:00', NULL, 550000, 'Delivery', '1716768242.jpg', 80, 0, 5000, 10000, 560000, 'Delivery', 'Pesanan Dijadwalkan'),
(35, '24.05.35', 38, NULL, '2024-05-27 00:07:51', NULL, '2024-05-29 00:00:00', NULL, 150000, 'Pick-Up', '1716768554.png', 20, 101, 100, NULL, 139900, 'Pick-Up', 'Pesanan Ditolak'),
(36, '24.05.36', 40, 13, '2024-05-27 00:13:10', NULL, '2024-05-29 00:00:00', NULL, 150000, 'E-Money', '1716768946.jpg', 40, 0, 0, 15000, 165000, 'Delivery', 'Pesanan Dijadwalkan'),
(37, '24.05.37', 40, NULL, '2024-05-27 00:17:56', NULL, '2024-05-29 00:00:00', NULL, 30000, 'Delivery', '1716769095.jpg', 6, 10, 1000, NULL, 29000, 'Pick-Up', 'Pesanan Ditolak'),
(38, '24.05.38', 41, 14, '2024-05-27 01:28:30', NULL, '2024-05-29 00:00:00', NULL, 500000, 'Pick-Up', '1716774118.png', 75, 0, 5000, 10000, 510000, 'Delivery', 'Pesanan Dijadwalkan'),
(39, '24.05.39', 41, NULL, '2024-05-27 01:38:05', NULL, '2024-05-29 00:00:00', NULL, 150000, 'Delivery', '1716774311.jpg', 20, 0, 0, NULL, 150000, 'Pick-Up', 'Pesanan Ditolak'),
(40, '24.05.40', 41, NULL, '2024-05-27 01:52:29', NULL, '2024-05-29 00:00:00', NULL, 550000, 'E-Money', '1716774802.jpg', 80, 75, 0, NULL, 542500, 'Pick-Up', 'Pesanan Dijadwalkan'),
(41, '24.05.41', 41, NULL, '2024-05-27 01:55:37', NULL, '2024-05-29 00:00:00', NULL, 1100000, 'Pick-Up', '1716774953.png', 215, 0, 0, NULL, 1100000, 'Pick-Up', 'Pesanan Ditolak'),
(42, '24.05.42', 40, NULL, '2024-05-27 02:00:35', NULL, '2024-05-29 00:00:00', NULL, 200000, 'Delivery', '1716775268.jpg', 60, 0, 0, NULL, 200000, 'Pick-Up', 'Pesanan Dijadwalkan'),
(43, '24.05.43', 40, NULL, '2024-05-27 02:02:35', NULL, '2024-05-29 00:00:00', NULL, 100000, 'Pick-Up', '1716775367.png', 30, 0, 0, NULL, 100000, 'Pick-Up', 'Pesanan Ditolak'),
(44, '24.06.44', 42, 15, '2024-06-02 10:37:24', NULL, '2024-06-03 00:00:00', NULL, 500000, 'Delivery', '1717324711.jpg', 150, 0, 0, 10000, 510000, 'Delivery', 'Selesai'),
(45, '24.06.45', 42, NULL, '2024-06-02 10:51:30', NULL, '2024-06-03 00:00:00', '2024-06-02 11:13:01', 300000, 'Pick-Up', '1717325505.png', 90, 0, 0, NULL, 300000, 'Pick-Up', 'Selesai'),
(46, '24.06.46', 42, NULL, '2024-06-02 10:58:03', NULL, '2024-06-03 00:00:00', '2024-06-03 00:27:24', 100000, 'E-Money', '1717325892.jpg', 30, 0, 0, NULL, 100000, 'Pick-Up', 'Sudah Di-Pick-Up'),
(47, '24.06.47', 42, NULL, '2024-06-02 11:16:11', NULL, '2024-06-03 00:00:00', '2024-06-02 11:20:32', 75000, 'E-Money', '1717326983.jpg', 14, 0, 0, NULL, 75000, 'Pick-Up', 'Selesai'),
(48, '24.06.48', 42, NULL, '2024-06-02 11:37:33', NULL, '2024-06-01 00:00:00', NULL, 450000, NULL, NULL, 130, 0, NULL, NULL, 450000, 'Pick-Up', 'Pesanan Dibatalkan'),
(49, '24.06.49', 42, NULL, '2024-06-02 12:28:19', NULL, '2024-06-04 00:00:00', NULL, 450000, 'Delivery', '1717331311.jpg', 130, 0, 0, NULL, 450000, 'Pick-Up', 'Pesanan Ditolak'),
(50, '24.06.50', 42, NULL, '2024-06-02 13:26:24', NULL, '2024-06-04 00:00:00', NULL, 2445000, 'Pick-Up', '1717334795.png', 928, 0, 5000, NULL, 2445000, 'Pick-Up', 'Pesanan Dijadwalkan'),
(51, '24.06.51', 42, 15, '2024-06-02 00:15:28', NULL, '2024-06-04 00:00:00', NULL, 35000, 'Delivery', '1717373759.jpg', 6, 0, 0, 10000, 45000, 'Delivery', 'Selesai'),
(52, '24.06.52', 42, NULL, '2024-06-02 00:15:48', NULL, '2024-06-04 00:00:00', NULL, 200000, 'Delivery', '1717373900.jpg', 60, 0, 0, NULL, 200000, 'Pick-Up', 'Pesanan Dijadwalkan'),
(53, '24.06.53', 42, NULL, '2024-06-03 00:30:17', NULL, '2024-06-02 00:00:00', NULL, 5000, NULL, NULL, 0, 0, NULL, NULL, 5000, 'Pick-Up', 'Pesanan Dibatalkan'),
(54, '24.06.54', 42, 15, '2024-06-03 02:26:02', NULL, '2024-06-04 00:00:00', NULL, 500000, 'Delivery', '1717381574.jpg', 150, 0, 0, 10000, 510000, 'Delivery', 'Sedang Dikirim'),
(55, '24.06.55', 42, 15, '2024-06-03 02:30:10', NULL, '2024-06-04 00:00:00', NULL, 450000, 'Pick-Up', '1717381821.png', 130, 0, 0, 10000, 460000, 'Delivery', 'Selesai'),
(56, '24.06.56', 42, NULL, '2024-06-03 02:36:05', NULL, '2024-06-02 00:00:00', NULL, 500000, NULL, NULL, 150, 0, NULL, NULL, 500000, 'Pick-Up', 'Pesanan Dibatalkan'),
(57, '24.06.57', 42, NULL, '2024-06-03 02:49:15', NULL, '2024-06-04 00:00:00', '2024-06-06 09:08:34', 450000, 'E-Money', '1717382984.jpg', 130, 0, 0, NULL, 450000, 'Pick-Up', 'Sudah Di-Pick-Up'),
(58, '24.06.58', 42, NULL, '2024-06-03 02:49:32', NULL, '2024-06-04 00:00:00', NULL, 100000, 'Pick-Up', '1717382992.png', 30, 0, 0, NULL, 100000, 'Pick-Up', 'Pesanan Dijadwalkan'),
(59, '24.06.59', 42, NULL, '2024-06-03 03:02:02', NULL, '2024-06-03 00:00:00', NULL, 75000, NULL, NULL, 14, 0, NULL, NULL, 75000, 'Pick-Up', 'Pesanan Dibatalkan'),
(60, '24.06.60', 42, NULL, '2024-06-03 03:06:43', NULL, '2024-06-03 00:00:00', NULL, 75000, NULL, NULL, 14, 0, NULL, NULL, 75000, 'Pick-Up', 'Pesanan Dibatalkan'),
(61, '24.06.61', 42, NULL, '2024-06-03 03:09:20', NULL, '2024-06-03 00:00:00', NULL, 500000, NULL, NULL, 150, 0, NULL, NULL, 500000, 'Pick-Up', 'Pesanan Dibatalkan'),
(62, '24.06.62', 42, NULL, '2024-06-03 03:10:24', NULL, '2024-06-03 00:00:00', NULL, 550000, NULL, NULL, 160, 0, NULL, NULL, 550000, 'Pick-Up', 'Pesanan Dibatalkan'),
(63, '24.06.63', 42, NULL, '2024-06-03 03:29:26', NULL, '2024-06-03 00:00:00', NULL, 100000, NULL, NULL, 30, 0, NULL, NULL, 100000, 'Pick-Up', 'Pesanan Dibatalkan'),
(64, '24.06.64', 42, NULL, '2024-06-03 03:31:18', NULL, '2024-06-03 00:00:00', NULL, 1500000, NULL, NULL, 550, 0, NULL, NULL, 1500000, 'Pick-Up', 'Pesanan Dibatalkan'),
(65, '24.06.65', 33, 7, '2024-06-05 07:04:20', NULL, '2024-06-07 00:00:00', NULL, 100000, 'Delivery', '1717571084.jpg', 15, 0, 0, 10000, 110000, 'Delivery', 'Pesanan Ditolak'),
(66, '24.06.66', 42, NULL, '2024-06-06 08:35:33', NULL, '2024-06-08 00:00:00', NULL, 75000, 'Pick-Up', '1717662948.png', 7, 0, 0, NULL, 75000, 'Pick-Up', 'Pesanan Ditolak'),
(67, '24.06.67', 42, 15, '2024-06-06 08:43:20', NULL, '2024-06-07 00:00:00', NULL, 135000, 'Pick-Up', '1717663457.png', 18, 0, 0, 10000, 145000, 'Delivery', 'Selesai'),
(68, '24.06.68', 42, NULL, '2024-06-06 08:53:28', NULL, '2024-06-07 00:00:00', '2024-06-06 08:58:53', 135000, 'Delivery', '1717664030.jpg', 18, 0, 0, NULL, 135000, 'Pick-Up', 'Selesai'),
(69, '24.06.69', 42, NULL, '2024-06-06 09:00:47', NULL, '2024-06-05 00:00:00', NULL, 40000, NULL, NULL, 4, 0, NULL, NULL, 40000, 'Pick-Up', 'Pesanan Dibatalkan'),
(70, '24.06.70', 43, 16, '2024-06-06 09:14:49', NULL, '2024-06-08 00:00:00', NULL, 40000, 'Delivery', '1717665425.jpg', 8, 0, 0, 25000, 65000, 'Delivery', 'Pesanan Ditolak'),
(71, '24.06.71', 43, 16, '2024-06-06 09:18:10', NULL, '2024-06-08 00:00:00', NULL, 5000, 'Delivery', '1717665524.jpg', 0, 0, 0, 10000, 15000, 'Delivery', 'Pesanan Dijadwalkan'),
(72, '24.06.72', 42, 15, '2024-06-06 12:13:58', NULL, '2024-06-07 00:00:00', NULL, 150000, 'Pick-Up', '1717676063.png', 20, 0, 0, 10000, 160000, 'Delivery', 'Selesai'),
(73, '24.06.73', 42, NULL, '2024-06-06 12:14:09', NULL, '2024-06-07 00:00:00', '2024-06-06 12:27:38', 300000, 'E-Money', '1717676072.jpg', 45, 0, 0, NULL, 300000, 'Pick-Up', 'Selesai'),
(74, '24.06.74', 42, NULL, '2024-06-06 12:30:20', NULL, '2024-06-05 00:00:00', NULL, 5000, NULL, NULL, 0, 0, NULL, NULL, 5000, 'Pick-Up', 'Pesanan Dibatalkan'),
(75, '24.06.75', 42, NULL, '2024-06-06 12:32:18', NULL, '2024-06-05 00:00:00', NULL, 150000, NULL, NULL, 20, 0, NULL, NULL, 150000, 'Pick-Up', 'Pesanan Dibatalkan'),
(76, '24.06.76', 43, 16, '2024-06-06 12:49:34', NULL, '2024-06-08 00:00:00', NULL, 150000, 'Delivery', '1717678510.jpg', 40, 0, 0, 10000, 160000, 'Delivery', 'Pesanan Ditolak'),
(77, '24.06.77', 43, 16, '2024-06-06 12:58:43', NULL, '2024-06-07 00:00:00', NULL, 150000, 'Pick-Up', '1717678748.png', 40, 0, 0, 10000, 160000, 'Delivery', 'Selesai'),
(78, '24.06.78', 43, NULL, '2024-06-06 12:58:58', NULL, '2024-06-07 00:00:00', '2024-06-06 13:04:32', 300000, 'E-Money', '1717678757.jpg', 90, 0, 0, NULL, 300000, 'Pick-Up', 'Selesai'),
(79, '24.06.79', 43, NULL, '2024-06-06 13:07:57', NULL, '2024-06-05 00:00:00', NULL, 150000, NULL, NULL, 40, 0, NULL, NULL, 150000, 'Pick-Up', 'Pesanan Dibatalkan'),
(80, '24.06.80', 43, NULL, '2024-06-06 13:09:41', NULL, '2024-06-07 00:00:00', NULL, 200000, 'E-Money', '1717679390.jpg', 60, 0, 0, NULL, 200000, 'Pick-Up', 'Pesanan Dijadwalkan'),
(81, '24.06.81', 44, 17, '2024-06-06 13:20:18', NULL, '2024-06-07 00:00:00', NULL, 150000, 'Delivery', '1717680073.jpg', 40, 0, 0, 10000, 160000, 'Delivery', 'Selesai'),
(82, '24.06.82', 44, 17, '2024-06-06 13:29:52', NULL, '2024-06-07 00:00:00', NULL, 150000, 'Pick-Up', '1717680615.png', 40, 0, 0, 10000, 160000, 'Delivery', 'Selesai'),
(83, '24.06.83', 44, NULL, '2024-06-06 13:30:04', NULL, '2024-06-07 00:00:00', '2024-06-06 13:35:34', 300000, 'E-Money', '1717680623.jpg', 90, 0, 0, NULL, 300000, 'Pick-Up', 'Selesai'),
(84, '24.06.84', 44, NULL, '2024-06-06 13:40:03', NULL, '2024-06-07 00:00:00', NULL, 200000, 'E-Money', '1717681213.jpg', 60, 0, 0, NULL, 200000, 'Pick-Up', 'Pesanan Dijadwalkan'),
(85, '24.06.85', 44, NULL, '2024-06-06 13:41:41', NULL, '2024-06-05 00:00:00', NULL, 150000, NULL, NULL, 40, 0, NULL, NULL, 150000, 'Pick-Up', 'Pesanan Dibatalkan'),
(86, '24.06.86', 33, 7, '2024-06-12 15:20:38', NULL, '2024-06-14 00:00:00', NULL, 75000, NULL, NULL, 7, 0, NULL, 10000, 85000, 'Delivery', 'Menunggu Pembayaran'),
(87, '24.06.87', 33, NULL, '2024-06-12 15:21:16', NULL, '2024-06-14 00:00:00', NULL, 10000, 'Delivery', '1718205728.jpg', 1, 0, NULL, NULL, 10000, 'Pick-Up', 'Menunggu Konfirmasi Pembayaran'),
(88, '24.06.88', 33, NULL, '2024-06-12 15:22:45', NULL, '2024-06-14 00:00:00', NULL, 10000, 'Pick-Up', '1718205774.png', 1, 0, 0, NULL, 10000, 'Pick-Up', 'Menunggu Konfirmasi Pembuatan'),
(89, '24.06.89', 33, 7, '2024-06-12 15:23:47', NULL, '2024-06-13 00:00:00', NULL, 5000, 'E-Money', '1718205840.jpg', 0, 0, 5000, 10000, 15000, 'Delivery', 'Pesanan Dijadwalkan'),
(90, '24.06.90', 33, NULL, '2024-06-12 15:25:36', NULL, '2024-06-13 00:00:00', NULL, 200000, 'E-Money', '1718205949.jpg', 30, 0, 0, NULL, 200000, 'Pick-Up', 'Pesanan Dijadwalkan'),
(91, '24.06.91', 33, 7, '2024-06-12 15:27:09', NULL, '2024-06-13 00:00:00', NULL, 40000, 'Pick-Up', '1718206042.png', 4, 0, 0, 10000, 50000, 'Delivery', 'Diproses'),
(92, '24.06.92', 33, NULL, '2024-06-12 15:29:22', NULL, '2024-06-13 00:00:00', NULL, 40000, 'Pick-Up', '1718206175.png', 4, 0, 0, NULL, 40000, 'Pick-Up', 'Siap Di-Pick-Up'),
(93, '24.06.93', 33, 7, '2024-06-12 15:33:53', NULL, '2024-06-11 00:00:00', NULL, 70000, NULL, NULL, 7, 0, NULL, 10000, 80000, 'Delivery', 'Menunggu Pembayaran'),
(94, '24.06.94', 45, 18, '2024-06-12 15:36:34', NULL, '2024-06-14 00:00:00', NULL, 70000, NULL, NULL, 14, 0, NULL, NULL, 70000, 'Delivery', 'Menunggu Ongkos Kirim');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `role` char(10) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_login_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `role`, `username`, `password`, `created_at`, `updated_at`, `last_login_at`) VALUES
(1, 'Tonoanto (password: supersecretpassword)', 'adm', 'tono.anto@gmail.com', '$2y$12$YYDxOS.7Lb.pEGgEdxh37OmXw7/cjDJ9/MpH1wZQ4f.4HizE2DoG.', '2024-04-20 13:16:10', '2024-05-05 16:41:23', '2024-04-20 13:16:10'),
(2, 'Elizabeth Cooper (password: supersecretpassword)', 'mo', 'elicooper@gmail.com', '$2y$12$xTnmbbdDJ0np2aMFhSTIc.2RpckJ4Qkeu2rDLdfjvaF1mFEe6OgNC', '2024-04-20 13:16:10', '2024-05-05 19:05:26', '2024-04-20 13:16:10'),
(3, 'JackyTrans', 'own', 'miniTrans@gmail.com', '$2y$12$KoN7mDHzdzv4vI7Ddf6v..TMbjW5effqh0gTzI3Yzlz8O23KCveXu', '2024-04-20 13:16:10', '2024-05-05 16:44:22', '2024-04-20 13:16:10'),
(4, 'Tono', 'kar', 'Tono@gmail.com', NULL, '2024-04-20 13:16:10', '2024-04-24 04:03:58', NULL),
(5, 'supersecretpassword1', 'c', 'john.doe@example.com', '$2y$12$Q41kiK2GL/ayqgrRhdzrbe/o4xWPeX.nYTQP28lPmF7Ea/VjEwmEC', '2024-04-20 13:18:07', '2024-05-08 04:09:06', '2024-04-20 17:39:30'),
(6, 'Jane Smith', 'c', 'jane.smith@example.com', '$2a$12$tPcvA5p2A0dkKbAFcPqxoOlus/VJBiHskaoWyRf5zPYFfjtwh0Wim', '2024-04-20 13:18:07', '2024-04-21 11:07:43', '2024-04-20 13:18:07'),
(18, '123', 'c', '123@gmail.com', '$2y$12$/6ZI47K6OA5usU49RMop8OkY4JYbQ7ZeE4gadqXqKQElG39vC/.LC', '2024-04-22 21:08:29', '2024-04-22 21:08:29', NULL),
(20, 'AndreV', 'kar', 'AndreV@gmail.com', NULL, '2024-04-24 01:57:51', '2024-04-24 01:57:51', NULL),
(21, '1', 'kar', '1@gmail.com', NULL, '2024-04-24 01:58:10', '2024-04-24 02:08:37', NULL),
(22, '122', 'kar', '122@gmail.com', NULL, '2024-04-24 02:04:34', '2024-04-24 02:04:34', NULL),
(25, '1', 'c', '123123@gmail.com', '$2y$12$IsHr2VPM6pzN2LqYcBuuDefbgYNfrUY6L1H7sgGHEO9xJIdgSR.VW', '2024-05-01 21:57:25', '2024-05-01 21:57:25', NULL),
(26, 'cus baru', 'c', 'cusbaru@gmail.com', '$2y$12$ESxr603mY.NKxEpQz68RFe71Tsw.HXdp4gYi2b4kCAQK3d4ZF4/Ly', '2024-05-03 03:27:42', '2024-05-03 03:27:42', NULL),
(27, 'Toni Toni', 'kar', 'Toni2.anto@gmail.com', NULL, '2024-05-04 06:15:06', '2024-05-04 06:15:53', NULL),
(29, 'Andre Victory', 'c', 'andrevictory752@gmail.com', '$2y$12$2djY6z73Hyxs93TyAfyOE.4b3yEBt3//AXNr656aaYLQtydHUN05m', '2024-05-05 01:05:36', '2024-06-12 08:51:51', NULL),
(30, 'Tori', 'kar', 'tori@gmail.com', NULL, '2024-05-05 06:18:36', '2024-05-05 06:19:03', NULL),
(33, 'Ivy', 'c', 'ivy@gmail.com', '$2y$12$lubnsBrzbFpsyztilKuuNuk7Kwsh1Lhvgn9c/G.8nmA0lwqiIpdOG', '2024-05-05 17:31:43', '2024-05-05 17:31:43', NULL),
(34, 'test1', 'kar', 'test1@gmail.com', NULL, '2024-05-05 19:26:23', '2024-05-05 19:26:35', NULL),
(35, 'testing', 'c', 'arkaatmaja1111@gmail.com', '$2y$12$xRDgVNk76oDowXqJXJa9uOKu7RSgV6y.uS0wnAtn7fv8f.0zFMgA6', '2024-05-05 19:43:19', '2024-05-05 19:43:19', NULL),
(36, 'David Johnson1', 'c', 'davidjohnson@gmail.com', '$2y$12$CPIFMKhADX5Cs0V21QWkDeElQlP5bUQ8FBiATwAQGQdyX28v5E682', '2024-05-08 03:46:45', '2024-05-08 03:47:12', NULL),
(37, 'Smith John', 'c', 'smithjohn@gmail.comm', '$2y$12$6dMXTGmia/AmjCzKZNE1eufW7oi/MmDjWVK6LS2QJdgoDWYpQBu8a', '2024-05-08 05:34:58', '2024-05-08 05:35:59', NULL),
(38, 'Mario Bros', 'c', 'mariobros@gmail.com', '$2y$12$1s/RYmcXHiY1Y5o6L.lXqOvKu2rxQAg7qLALJxYXWNWH0yUWcFfnu', '2024-05-21 07:09:52', '2024-05-21 07:09:52', NULL),
(39, 'Kanta', 'c', 'kanta@gmail.com', '$2y$12$1ruIWLcL9OzDLw0DAjIYMOoZiBImpsxaxjx42EB/6V7uhbg07JIIK', '2024-05-24 23:38:59', '2024-05-24 23:38:59', NULL),
(40, 'Adiputra', 'c', 'adiputra77@gmail.com', '$2y$12$lsKkdVrpH/oEWtOXGA4XEO0Jnl6OISH7CuinfZ9mS3UxLbLJKPc1G', '2024-05-26 17:12:18', '2024-05-26 17:12:18', NULL),
(41, 'Bagus Aldi', 'c', 'bagusaldi@gmail.com', '$2y$12$HIgiQ5.Ln9X.cEsVkmf7/uOqhFKlJFK/LVjkHLJB8Pgd8lZ0A.PP6', '2024-05-26 17:28:45', '2024-05-26 17:28:45', NULL),
(42, 'Arturo Maran', 'c', 'arturomaran@gmail.com', '$2y$12$W8JuKiy63gmEIkI8G1ouqO8i/2H2LkmRMu41lFcBitV1Ab2GhHSbW', '2024-06-02 03:22:55', '2024-06-02 03:22:55', NULL),
(43, 'Roger Roa', 'c', 'rogerroa@gmail.com', '$2y$12$hfcaccJus3ZEN8VsAaf1UOnGaS3jMEz7tj81ggIadTQP7ZDXRNKbC', '2024-06-06 02:14:05', '2024-06-06 02:14:05', NULL),
(44, 'Rafael Juan', 'c', 'rafaeljuan@gmail.com', '$2y$12$VHigTT8L3NPDTXybpdU3eO.sS6L84sHgpFqT8SvjvUcz0uyW4tZge', '2024-06-06 06:19:49', '2024-06-06 06:19:49', NULL),
(45, 'Bowo Mahendra', 'c', 'bowomahendra@gmail.com', '$2y$12$fgX0CbvHgNEhT5.KhsL9EuVl/TraUB9vcN1/XoTNtTHmTewwDuDdG', '2024-06-12 08:36:04', '2024-06-12 08:36:04', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alamat`
--
ALTER TABLE `alamat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_ibfk` (`id_customer`);

--
-- Indexes for table `bahan_baku`
--
ALTER TABLE `bahan_baku`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id_user`);

--
-- Indexes for table `detail_hampers`
--
ALTER TABLE `detail_hampers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_hampers` (`id_hampers`),
  ADD KEY `id_produk` (`id_produk`);

--
-- Indexes for table `detail_penjualan`
--
ALTER TABLE `detail_penjualan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produk_ibfk2` (`id_produk`),
  ADD KEY `id_trx_penjualan` (`id_trx_penjualan`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `history_saldo`
--
ALTER TABLE `history_saldo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_customer` (`id_customer`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategori_produk`
--
ALTER TABLE `kategori_produk`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ketidakhadiran`
--
ALTER TABLE `ketidakhadiran`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_pegawai` (`id_pegawai`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`id_user`);

--
-- Indexes for table `pembayaran_gaji`
--
ALTER TABLE `pembayaran_gaji`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_pegawai` (`id_pegawai`);

--
-- Indexes for table `pengeluaran_lain_lain`
--
ALTER TABLE `pengeluaran_lain_lain`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `penitip`
--
ALTER TABLE `penitip`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_kategori` (`id_kategori`),
  ADD KEY `id_penitip` (`id_penitip`);

--
-- Indexes for table `produk_bahan`
--
ALTER TABLE `produk_bahan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_bahan_baku` (`id_bahan_baku`),
  ADD KEY `id_produk` (`id_produk`);

--
-- Indexes for table `promo_poin`
--
ALTER TABLE `promo_poin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`token`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `trx_pembelian_bb`
--
ALTER TABLE `trx_pembelian_bb`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_bahan_baku` (`id_bahan_baku`);

--
-- Indexes for table `trx_penjualan`
--
ALTER TABLE `trx_penjualan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_alamat` (`id_alamat`),
  ADD KEY `id_customer` (`id_customer`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `role` (`role`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alamat`
--
ALTER TABLE `alamat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `bahan_baku`
--
ALTER TABLE `bahan_baku`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `detail_hampers`
--
ALTER TABLE `detail_hampers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `detail_penjualan`
--
ALTER TABLE `detail_penjualan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `history_saldo`
--
ALTER TABLE `history_saldo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kategori_produk`
--
ALTER TABLE `kategori_produk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ketidakhadiran`
--
ALTER TABLE `ketidakhadiran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pembayaran_gaji`
--
ALTER TABLE `pembayaran_gaji`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pengeluaran_lain_lain`
--
ALTER TABLE `pengeluaran_lain_lain`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `penitip`
--
ALTER TABLE `penitip`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=437;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `produk_bahan`
--
ALTER TABLE `produk_bahan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `promo_poin`
--
ALTER TABLE `promo_poin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trx_pembelian_bb`
--
ALTER TABLE `trx_pembelian_bb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `trx_penjualan`
--
ALTER TABLE `trx_penjualan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `alamat`
--
ALTER TABLE `alamat`
  ADD CONSTRAINT `alamat_ibfk_1` FOREIGN KEY (`id_customer`) REFERENCES `customer` (`id_user`);

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Constraints for table `detail_hampers`
--
ALTER TABLE `detail_hampers`
  ADD CONSTRAINT `detail_hampers_ibfk_1` FOREIGN KEY (`id_hampers`) REFERENCES `produk` (`id`),
  ADD CONSTRAINT `detail_hampers_ibfk_2` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id`);

--
-- Constraints for table `detail_penjualan`
--
ALTER TABLE `detail_penjualan`
  ADD CONSTRAINT `detail_penjualan_ibfk_1` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id`),
  ADD CONSTRAINT `detail_penjualan_ibfk_2` FOREIGN KEY (`id_trx_penjualan`) REFERENCES `trx_penjualan` (`id`);

--
-- Constraints for table `history_saldo`
--
ALTER TABLE `history_saldo`
  ADD CONSTRAINT `history_saldo_ibfk_1` FOREIGN KEY (`id_customer`) REFERENCES `customer` (`id_user`);

--
-- Constraints for table `ketidakhadiran`
--
ALTER TABLE `ketidakhadiran`
  ADD CONSTRAINT `ketidakhadiran_ibfk_1` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`id_user`);

--
-- Constraints for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD CONSTRAINT `pegawai_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Constraints for table `pembayaran_gaji`
--
ALTER TABLE `pembayaran_gaji`
  ADD CONSTRAINT `pembayaran_gaji_ibfk_1` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`id_user`);

--
-- Constraints for table `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `produk_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `kategori_produk` (`id`),
  ADD CONSTRAINT `produk_ibfk_2` FOREIGN KEY (`id_penitip`) REFERENCES `penitip` (`id`);

--
-- Constraints for table `produk_bahan`
--
ALTER TABLE `produk_bahan`
  ADD CONSTRAINT `produk_bahan_ibfk_2` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id`),
  ADD CONSTRAINT `produk_bahan_ibfk_3` FOREIGN KEY (`id_bahan_baku`) REFERENCES `bahan_baku` (`id`);

--
-- Constraints for table `tokens`
--
ALTER TABLE `tokens`
  ADD CONSTRAINT `tokens_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Constraints for table `trx_pembelian_bb`
--
ALTER TABLE `trx_pembelian_bb`
  ADD CONSTRAINT `trx_pembelian_bb_ibfk_1` FOREIGN KEY (`id_bahan_baku`) REFERENCES `bahan_baku` (`id`);

--
-- Constraints for table `trx_penjualan`
--
ALTER TABLE `trx_penjualan`
  ADD CONSTRAINT `trx_penjualan_ibfk_1` FOREIGN KEY (`id_alamat`) REFERENCES `alamat` (`id`),
  ADD CONSTRAINT `trx_penjualan_ibfk_2` FOREIGN KEY (`id_customer`) REFERENCES `customer` (`id_user`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

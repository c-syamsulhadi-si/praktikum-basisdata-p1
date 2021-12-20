-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 20 Des 2021 pada 12.05
-- Versi server: 8.0.26
-- Versi PHP: 7.4.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_praktikum_b`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `jabatan`
--

CREATE TABLE `jabatan` (
  `id` int NOT NULL,
  `nama_jabatan` varchar(255) NOT NULL,
  `gapok_jabatan` double NOT NULL,
  `tunjangan_jabatan` double NOT NULL,
  `uang_makan_perhari` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `jabatan`
--

INSERT INTO `jabatan` (`id`, `nama_jabatan`, `gapok_jabatan`, `tunjangan_jabatan`, `uang_makan_perhari`) VALUES
(1, 'System Analyst', 2400000, 500000, 40000),
(2, 'Project Manager', 2300000, 450000, 38000),
(4, 'Junior Programmer', 2100000, 350000, 34000),
(5, 'Magang', 1000000, 100000, 20000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `karyawan`
--

CREATE TABLE `karyawan` (
  `id` int NOT NULL,
  `nik` varchar(255) NOT NULL,
  `nama_lengkap` varchar(255) NOT NULL,
  `handphone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `tanggal_masuk` date NOT NULL,
  `pengguna_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `karyawan`
--

INSERT INTO `karyawan` (`id`, `nik`, `nama_lengkap`, `handphone`, `email`, `tanggal_masuk`, `pengguna_id`) VALUES
(1, '001', 'Admin', '08112011', 'admin@mail.com', '2011-01-01', 1),
(2, '004', 'Fulan Bin Fulan', '08112014', 'fulan@mail.com', '2014-04-04', 4),
(3, '005', 'Mawar Kurniani', '08112015', 'mawar@mail.com', '2015-05-05', 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `lokasi`
--

CREATE TABLE `lokasi` (
  `id` int NOT NULL,
  `nama_lokasi` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `lokasi`
--

INSERT INTO `lokasi` (`id`, `nama_lokasi`) VALUES
(1, 'Kota Banjarmasin'),
(2, 'Kota Banjarbaru'),
(3, 'Gambut');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penggajian`
--

CREATE TABLE `penggajian` (
  `id` int NOT NULL,
  `karyawan_id` int NOT NULL,
  `tahun` year DEFAULT NULL,
  `bulan` char(2) DEFAULT NULL,
  `gapok` double DEFAULT NULL,
  `tunjangan` double DEFAULT NULL,
  `uang_makan` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `penggajian`
--

INSERT INTO `penggajian` (`id`, `karyawan_id`, `tahun`, `bulan`, `gapok`, `tunjangan`, `uang_makan`) VALUES
(1, 3, 2020, '11', 2400000, 500000, 800000),
(2, 2, 2020, '11', 2300000, 450000, 684000),
(3, 2, 2020, '11', 2200000, 400000, 684000),
(4, 3, 2020, '11', 2100000, 350000, 640000),
(5, 3, 2020, '11', 2100000, 350000, 612000),
(6, 1, 2020, '11', 1000000, 100000, 380000),
(7, 1, 2020, '12', 2400000, 500000, 800000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengguna`
--

CREATE TABLE `pengguna` (
  `id` int NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `peran` enum('ADMIN','USER') DEFAULT NULL,
  `login_terakhir` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `pengguna`
--

INSERT INTO `pengguna` (`id`, `username`, `password`, `peran`, `login_terakhir`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'ADMIN', NULL),
(2, 'user', 'ee11cbb19052e40b07aac0ca060c23ee', 'USER', NULL),
(3, 'johndoe', '6579e96f76baa00787a28653876c6127', 'USER', NULL),
(4, 'lily', '89f288757f4d0693c99b007855fc075e', 'USER', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `presensi`
--

CREATE TABLE `presensi` (
  `id` int NOT NULL,
  `karyawan_id` int NOT NULL,
  `tanggal` date NOT NULL,
  `jam_masuk` time DEFAULT NULL,
  `jam_keluar` time DEFAULT NULL,
  `keterangan` enum('HADIR','SAKIT','IZIN','CUTI','AKHIR PEKAN','LIBUR NASIONAL','TANPA KETERANGAN') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `presensi`
--

INSERT INTO `presensi` (`id`, `karyawan_id`, `tanggal`, `jam_masuk`, `jam_keluar`, `keterangan`) VALUES
(1, 1, '2020-11-02', '08:00:00', '16:00:00', 'HADIR'),
(2, 1, '2020-11-03', '08:00:00', '16:00:00', 'HADIR'),
(3, 1, '2020-11-04', '08:00:00', '16:00:00', 'HADIR'),
(4, 1, '2020-11-05', '08:00:00', '16:00:00', 'HADIR'),
(5, 1, '2020-11-06', '08:35:00', '16:00:00', 'HADIR'),
(6, 1, '2020-11-07', NULL, NULL, 'AKHIR PEKAN'),
(7, 1, '2020-11-08', NULL, NULL, 'AKHIR PEKAN'),
(8, 1, '2020-11-09', '08:00:00', '16:00:00', 'HADIR'),
(9, 1, '2020-11-10', NULL, NULL, 'LIBUR NASIONAL'),
(10, 1, '2020-11-11', '08:00:00', '16:00:00', 'HADIR'),
(11, 1, '2020-11-12', '08:00:00', '16:00:00', 'HADIR'),
(12, 1, '2020-11-13', '08:00:00', '16:00:00', 'HADIR'),
(13, 1, '2020-11-14', NULL, NULL, 'AKHIR PEKAN'),
(14, 1, '2020-11-15', NULL, NULL, 'AKHIR PEKAN'),
(15, 1, '2020-11-16', '08:00:00', '16:00:00', 'HADIR'),
(16, 1, '2020-11-17', '08:00:00', '16:00:00', 'HADIR'),
(17, 1, '2020-11-18', '08:35:00', '16:00:00', 'HADIR'),
(18, 1, '2020-11-19', '08:00:00', '16:00:00', 'HADIR'),
(19, 1, '2020-11-20', '08:00:00', '16:00:00', 'HADIR'),
(20, 1, '2020-11-21', NULL, NULL, 'AKHIR PEKAN'),
(21, 1, '2020-11-22', NULL, NULL, 'AKHIR PEKAN'),
(22, 1, '2020-11-23', '08:00:00', '16:00:00', 'HADIR'),
(23, 1, '2020-11-24', '08:00:00', '16:00:00', 'HADIR'),
(24, 1, '2020-11-25', NULL, NULL, 'SAKIT'),
(25, 1, '2020-11-26', '08:00:00', '16:00:00', 'HADIR'),
(26, 1, '2020-11-27', '08:00:00', '16:00:00', 'HADIR'),
(27, 1, '2020-11-28', NULL, NULL, 'AKHIR PEKAN'),
(28, 1, '2020-11-29', NULL, NULL, 'AKHIR PEKAN'),
(29, 1, '2020-11-30', '08:00:00', '16:00:00', 'HADIR'),
(30, 1, '2020-12-01', '08:00:00', '16:00:00', 'HADIR'),
(31, 1, '2020-12-02', '08:00:00', '16:00:00', 'HADIR'),
(32, 1, '2020-12-03', '08:00:00', '16:00:00', 'HADIR'),
(33, 1, '2020-12-04', '08:00:00', '16:00:00', 'HADIR'),
(34, 1, '2020-12-05', NULL, NULL, 'AKHIR PEKAN'),
(35, 1, '2020-12-06', NULL, NULL, 'AKHIR PEKAN'),
(36, 1, '2020-12-07', '08:00:00', '16:00:00', 'HADIR'),
(37, 1, '2020-12-08', '08:00:00', '16:00:00', 'HADIR'),
(38, 1, '2020-12-09', NULL, NULL, 'LIBUR NASIONAL'),
(39, 1, '2020-12-10', '08:00:00', '16:00:00', 'HADIR'),
(40, 1, '2020-12-11', '08:00:00', '16:00:00', 'HADIR'),
(41, 1, '2020-12-12', NULL, NULL, 'AKHIR PEKAN'),
(42, 1, '2020-12-13', NULL, NULL, 'AKHIR PEKAN'),
(43, 1, '2020-12-14', '08:00:00', '16:00:00', 'HADIR'),
(44, 1, '2020-12-15', '08:00:00', '16:00:00', 'HADIR'),
(45, 1, '2020-12-16', '08:00:00', '16:00:00', 'HADIR'),
(46, 1, '2020-12-17', '08:00:00', '16:00:00', 'HADIR'),
(47, 1, '2020-12-18', '08:00:00', '16:00:00', 'HADIR'),
(48, 1, '2020-12-19', NULL, NULL, 'AKHIR PEKAN'),
(49, 1, '2020-12-20', NULL, NULL, 'AKHIR PEKAN'),
(50, 1, '2020-12-21', '08:00:00', '16:00:00', 'HADIR'),
(51, 1, '2020-12-22', '08:00:00', '16:00:00', 'HADIR'),
(52, 1, '2020-12-23', '08:00:00', '16:00:00', 'HADIR'),
(53, 1, '2020-12-24', NULL, NULL, 'LIBUR NASIONAL'),
(54, 1, '2020-12-25', NULL, NULL, 'LIBUR NASIONAL'),
(55, 1, '2020-12-26', NULL, NULL, 'AKHIR PEKAN'),
(56, 1, '2020-12-27', NULL, NULL, 'AKHIR PEKAN'),
(57, 1, '2020-12-28', '08:00:00', '16:00:00', 'HADIR'),
(58, 1, '2020-12-29', '08:00:00', '16:00:00', 'HADIR'),
(59, 1, '2020-12-30', '08:00:00', '16:00:00', 'HADIR'),
(60, 1, '2020-12-31', '08:00:00', '16:00:00', 'HADIR'),
(61, 1, '2021-01-01', NULL, NULL, 'LIBUR NASIONAL'),
(62, 1, '2021-01-02', NULL, NULL, 'AKHIR PEKAN'),
(63, 1, '2021-01-03', NULL, NULL, 'AKHIR PEKAN'),
(64, 1, '2021-01-04', '08:00:00', '16:00:00', 'HADIR'),
(65, 1, '2021-01-05', '08:00:00', '16:00:00', 'HADIR'),
(66, 1, '2021-01-06', NULL, NULL, 'IZIN'),
(67, 1, '2021-01-07', '08:00:00', '16:00:00', 'HADIR'),
(68, 1, '2021-01-08', '08:00:00', '16:00:00', 'HADIR'),
(69, 1, '2021-01-09', NULL, NULL, 'AKHIR PEKAN'),
(70, 1, '2021-01-10', NULL, NULL, 'AKHIR PEKAN'),
(71, 1, '2021-01-11', '08:00:00', '16:00:00', 'HADIR'),
(72, 1, '2021-01-12', '08:00:00', '16:00:00', 'HADIR'),
(73, 1, '2021-01-13', '08:00:00', '16:00:00', 'HADIR'),
(74, 1, '2021-01-14', '08:00:00', '16:00:00', 'HADIR'),
(75, 1, '2021-01-15', '08:00:00', '16:00:00', 'HADIR'),
(76, 1, '2021-01-16', NULL, NULL, 'AKHIR PEKAN'),
(77, 1, '2021-01-17', NULL, NULL, 'AKHIR PEKAN'),
(78, 1, '2021-01-18', '08:00:00', '16:00:00', 'HADIR'),
(79, 1, '2021-01-19', '08:00:00', '16:00:00', 'HADIR'),
(80, 1, '2021-01-20', '08:00:00', '16:00:00', 'HADIR'),
(81, 1, '2021-01-21', '08:00:00', '16:00:00', 'HADIR'),
(82, 1, '2021-01-22', '08:00:00', '16:00:00', 'HADIR'),
(83, 1, '2021-01-23', NULL, NULL, 'AKHIR PEKAN'),
(84, 1, '2021-01-24', NULL, NULL, 'AKHIR PEKAN'),
(85, 1, '2021-01-25', '08:00:00', '16:00:00', 'HADIR'),
(86, 1, '2021-01-26', NULL, NULL, 'SAKIT'),
(87, 1, '2021-01-27', NULL, NULL, 'SAKIT'),
(88, 1, '2021-01-28', '08:00:00', '16:00:00', 'HADIR'),
(89, 1, '2021-01-29', '08:00:00', '16:00:00', 'HADIR'),
(90, 1, '2021-01-30', NULL, NULL, 'AKHIR PEKAN'),
(91, 1, '2021-01-31', NULL, NULL, 'AKHIR PEKAN'),
(92, 2, '2020-11-01', NULL, NULL, 'AKHIR PEKAN'),
(93, 2, '2020-11-02', '08:00:00', '16:00:00', 'HADIR'),
(94, 2, '2020-11-03', '08:00:00', '16:00:00', 'HADIR'),
(95, 2, '2020-11-04', '08:00:00', '16:00:00', 'HADIR'),
(96, 2, '2020-11-05', '08:00:00', '16:00:00', 'HADIR'),
(97, 2, '2020-11-06', '08:00:00', '16:00:00', 'HADIR'),
(98, 2, '2020-11-07', NULL, NULL, 'AKHIR PEKAN'),
(99, 2, '2020-11-08', NULL, NULL, 'AKHIR PEKAN'),
(100, 2, '2020-11-09', '08:00:00', '16:00:00', 'HADIR'),
(101, 2, '2020-11-10', NULL, NULL, 'LIBUR NASIONAL'),
(102, 2, '2020-11-11', '08:00:00', '16:00:00', 'HADIR'),
(103, 2, '2020-11-12', '08:00:00', '16:00:00', 'HADIR'),
(104, 2, '2020-11-13', '08:00:00', '16:00:00', 'HADIR'),
(105, 2, '2020-11-14', NULL, NULL, 'AKHIR PEKAN'),
(106, 2, '2020-11-15', NULL, NULL, 'AKHIR PEKAN'),
(107, 2, '2020-11-16', '08:00:00', '16:00:00', 'HADIR'),
(108, 2, '2020-11-17', '08:00:00', '16:00:00', 'HADIR'),
(109, 2, '2020-11-18', '08:00:00', '16:00:00', 'HADIR'),
(110, 2, '2020-11-19', '08:00:00', '16:00:00', 'HADIR'),
(111, 2, '2020-11-20', '08:00:00', '16:00:00', 'HADIR'),
(112, 2, '2020-11-21', NULL, NULL, 'AKHIR PEKAN'),
(113, 2, '2020-11-22', NULL, NULL, 'AKHIR PEKAN'),
(114, 2, '2020-11-23', '08:00:00', '16:00:00', 'HADIR'),
(115, 2, '2020-11-24', '08:00:00', '16:00:00', 'HADIR'),
(116, 2, '2020-11-25', '08:00:00', '16:00:00', 'HADIR'),
(117, 2, '2020-11-26', '08:00:00', '16:00:00', 'HADIR'),
(118, 2, '2020-11-27', '08:00:00', '16:00:00', 'HADIR'),
(119, 2, '2020-11-28', NULL, NULL, 'AKHIR PEKAN'),
(120, 2, '2020-11-29', NULL, NULL, 'AKHIR PEKAN'),
(121, 2, '2020-11-30', '08:00:00', '16:00:00', 'HADIR'),
(122, 2, '2020-12-01', '08:00:00', '16:00:00', 'HADIR'),
(123, 2, '2020-12-02', '08:00:00', '16:00:00', 'HADIR'),
(124, 2, '2020-12-03', '08:00:00', '16:00:00', 'HADIR'),
(125, 2, '2020-12-04', '08:00:00', '16:00:00', 'HADIR'),
(126, 2, '2020-12-05', NULL, NULL, 'AKHIR PEKAN'),
(127, 2, '2020-12-06', NULL, NULL, 'AKHIR PEKAN'),
(128, 2, '2020-12-07', '08:00:00', '16:00:00', 'HADIR'),
(129, 2, '2020-12-08', '08:00:00', '16:00:00', 'HADIR'),
(130, 2, '2020-12-09', NULL, NULL, 'LIBUR NASIONAL'),
(131, 2, '2020-12-10', '08:00:00', '16:00:00', 'HADIR'),
(132, 2, '2020-12-11', '08:00:00', '16:00:00', 'HADIR'),
(133, 2, '2020-12-12', NULL, NULL, 'AKHIR PEKAN'),
(134, 2, '2020-12-13', NULL, NULL, 'AKHIR PEKAN'),
(135, 2, '2020-12-14', '08:00:00', '16:00:00', 'HADIR'),
(136, 2, '2020-12-15', '08:00:00', '16:00:00', 'HADIR'),
(137, 2, '2020-12-16', '08:00:00', '16:00:00', 'HADIR'),
(138, 2, '2020-12-17', '08:00:00', '16:00:00', 'HADIR'),
(139, 2, '2020-12-18', '08:00:00', '16:00:00', 'HADIR'),
(140, 2, '2020-12-19', NULL, NULL, 'AKHIR PEKAN'),
(141, 2, '2020-12-20', NULL, NULL, 'AKHIR PEKAN'),
(142, 2, '2020-12-21', '08:00:00', '16:00:00', 'HADIR'),
(143, 2, '2020-12-22', '08:00:00', '16:00:00', 'HADIR'),
(144, 2, '2020-12-23', '08:00:00', '16:00:00', 'HADIR'),
(145, 2, '2020-12-24', NULL, NULL, 'LIBUR NASIONAL'),
(146, 2, '2020-12-25', NULL, NULL, 'LIBUR NASIONAL'),
(147, 2, '2020-12-26', NULL, NULL, 'AKHIR PEKAN'),
(148, 2, '2020-12-27', NULL, NULL, 'AKHIR PEKAN'),
(149, 2, '2020-12-28', '08:00:00', '16:00:00', 'HADIR'),
(150, 2, '2020-12-29', '08:00:00', '16:00:00', 'HADIR'),
(151, 2, '2020-12-30', '08:00:00', '16:00:00', 'HADIR'),
(152, 2, '2020-12-31', '08:00:00', '16:00:00', 'HADIR'),
(153, 2, '2021-01-01', NULL, NULL, 'LIBUR NASIONAL'),
(154, 2, '2021-01-02', NULL, NULL, 'AKHIR PEKAN'),
(155, 2, '2021-01-03', NULL, NULL, 'AKHIR PEKAN'),
(156, 2, '2021-01-04', '08:00:00', '16:00:00', 'HADIR'),
(157, 2, '2021-01-05', '08:00:00', '16:00:00', 'HADIR'),
(158, 2, '2021-01-06', '08:00:00', '16:00:00', 'HADIR'),
(159, 2, '2021-01-07', '08:00:00', '16:00:00', 'HADIR'),
(160, 2, '2021-01-08', '08:00:00', '16:00:00', 'HADIR'),
(161, 2, '2021-01-09', NULL, NULL, 'AKHIR PEKAN'),
(162, 2, '2021-01-10', NULL, NULL, 'AKHIR PEKAN'),
(163, 2, '2021-01-11', '08:00:00', '16:00:00', 'HADIR'),
(164, 2, '2021-01-12', '08:00:00', '16:00:00', 'HADIR'),
(165, 2, '2021-01-13', '08:00:00', '16:00:00', 'HADIR'),
(166, 2, '2021-01-14', '08:00:00', '16:00:00', 'HADIR'),
(167, 2, '2021-01-15', '08:00:00', '16:00:00', 'HADIR'),
(168, 2, '2021-01-16', NULL, NULL, 'AKHIR PEKAN'),
(169, 2, '2021-01-17', NULL, NULL, 'AKHIR PEKAN'),
(170, 2, '2021-01-18', '08:00:00', '16:00:00', 'HADIR'),
(171, 2, '2021-01-19', '08:00:00', '16:00:00', 'HADIR'),
(172, 2, '2021-01-20', '08:00:00', '16:00:00', 'HADIR'),
(173, 2, '2021-01-21', '08:00:00', '16:00:00', 'HADIR'),
(174, 2, '2021-01-22', '08:00:00', '16:00:00', 'HADIR'),
(175, 2, '2021-01-23', NULL, NULL, 'AKHIR PEKAN'),
(176, 2, '2021-01-24', NULL, NULL, 'AKHIR PEKAN'),
(177, 2, '2021-01-25', '08:00:00', '16:00:00', 'HADIR'),
(178, 2, '2021-01-26', '08:00:00', '16:00:00', 'HADIR'),
(179, 2, '2021-01-27', '08:00:00', '16:00:00', 'HADIR'),
(180, 2, '2021-01-28', '08:00:00', '16:00:00', 'HADIR'),
(181, 2, '2021-01-29', '08:00:00', '16:00:00', 'HADIR'),
(182, 2, '2021-01-30', NULL, NULL, 'AKHIR PEKAN'),
(183, 2, '2021-01-31', NULL, NULL, 'AKHIR PEKAN'),
(184, 3, '2020-11-01', NULL, NULL, 'AKHIR PEKAN'),
(185, 3, '2020-11-02', '08:00:00', '16:00:00', 'HADIR'),
(186, 3, '2020-11-03', '08:35:00', '16:00:00', 'HADIR'),
(187, 3, '2020-11-04', NULL, NULL, 'SAKIT'),
(188, 3, '2020-11-05', '08:00:00', '16:00:00', 'HADIR'),
(189, 3, '2020-11-06', '08:00:00', '16:00:00', 'HADIR'),
(190, 3, '2020-11-07', NULL, NULL, 'AKHIR PEKAN'),
(191, 3, '2020-11-08', NULL, NULL, 'AKHIR PEKAN'),
(192, 3, '2020-11-09', '08:00:00', '16:00:00', 'HADIR'),
(193, 3, '2020-11-10', NULL, NULL, 'LIBUR NASIONAL'),
(194, 3, '2020-11-11', '08:00:00', '16:00:00', 'HADIR'),
(195, 3, '2020-11-12', '08:00:00', '16:00:00', 'HADIR'),
(196, 3, '2020-11-13', '08:00:00', '16:00:00', 'HADIR'),
(197, 3, '2020-11-14', NULL, NULL, 'AKHIR PEKAN'),
(198, 3, '2020-11-15', NULL, NULL, 'AKHIR PEKAN'),
(199, 3, '2020-11-16', '08:00:00', '16:00:00', 'HADIR'),
(200, 3, '2020-11-17', '08:00:00', '16:00:00', 'HADIR'),
(201, 3, '2020-11-18', '08:45:00', '16:00:00', 'HADIR'),
(202, 3, '2020-11-19', NULL, NULL, 'IZIN'),
(203, 3, '2020-11-20', '08:00:00', '16:00:00', 'HADIR'),
(204, 3, '2020-11-21', NULL, NULL, 'AKHIR PEKAN'),
(205, 3, '2020-11-22', NULL, NULL, 'AKHIR PEKAN'),
(206, 3, '2020-11-23', '08:00:00', '16:00:00', 'HADIR'),
(207, 3, '2020-11-24', '08:00:00', '16:00:00', 'HADIR'),
(208, 3, '2020-11-25', '08:00:00', '16:00:00', 'HADIR'),
(209, 3, '2020-11-26', '08:00:00', '16:00:00', 'HADIR'),
(210, 3, '2020-11-27', '08:00:00', '16:00:00', 'HADIR'),
(211, 3, '2020-11-28', NULL, NULL, 'AKHIR PEKAN'),
(212, 3, '2020-11-29', NULL, NULL, 'AKHIR PEKAN'),
(213, 3, '2020-11-30', '08:00:00', '16:00:00', 'HADIR'),
(214, 3, '2020-12-01', '08:00:00', '16:00:00', 'HADIR'),
(215, 3, '2020-12-02', '08:00:00', '16:00:00', 'HADIR'),
(216, 3, '2020-12-03', '08:00:00', '16:00:00', 'HADIR'),
(217, 3, '2020-12-04', '08:00:00', '16:00:00', 'HADIR'),
(218, 3, '2020-12-05', NULL, NULL, 'AKHIR PEKAN'),
(219, 3, '2020-12-06', NULL, NULL, 'AKHIR PEKAN'),
(220, 3, '2020-12-07', '08:00:00', '16:00:00', 'HADIR'),
(221, 3, '2020-12-08', '08:00:00', '16:00:00', 'HADIR'),
(222, 3, '2020-12-09', NULL, NULL, 'LIBUR NASIONAL'),
(223, 3, '2020-12-10', '08:00:00', '16:00:00', 'HADIR'),
(224, 3, '2020-12-11', '08:00:00', '16:00:00', 'HADIR'),
(225, 3, '2020-12-12', NULL, NULL, 'AKHIR PEKAN'),
(226, 3, '2020-12-13', NULL, NULL, 'AKHIR PEKAN'),
(227, 3, '2020-12-14', '08:00:00', '16:00:00', 'HADIR'),
(228, 3, '2020-12-15', '08:00:00', '16:00:00', 'HADIR'),
(229, 3, '2020-12-16', '08:00:00', '16:00:00', 'HADIR'),
(230, 3, '2020-12-17', NULL, NULL, 'SAKIT'),
(231, 3, '2020-12-18', '08:00:00', '16:00:00', 'HADIR'),
(232, 3, '2020-12-19', NULL, NULL, 'AKHIR PEKAN'),
(233, 3, '2020-12-20', NULL, NULL, 'AKHIR PEKAN'),
(234, 3, '2020-12-21', '08:00:00', '16:00:00', 'HADIR'),
(235, 3, '2020-12-22', '08:00:00', '16:00:00', 'HADIR'),
(236, 3, '2020-12-23', '08:00:00', '16:00:00', 'HADIR'),
(237, 3, '2020-12-24', NULL, NULL, 'LIBUR NASIONAL'),
(238, 3, '2020-12-25', NULL, NULL, 'LIBUR NASIONAL'),
(239, 3, '2020-12-26', NULL, NULL, 'AKHIR PEKAN'),
(240, 3, '2020-12-27', NULL, NULL, 'AKHIR PEKAN'),
(241, 3, '2020-12-28', '08:00:00', '16:00:00', 'HADIR'),
(242, 3, '2020-12-29', '08:50:00', '16:00:00', 'HADIR'),
(243, 3, '2020-12-30', '08:00:00', '16:00:00', 'HADIR'),
(244, 3, '2020-12-31', '08:00:00', '16:00:00', 'HADIR'),
(245, 3, '2021-01-01', NULL, NULL, 'LIBUR NASIONAL'),
(246, 3, '2021-01-02', NULL, NULL, 'AKHIR PEKAN'),
(247, 3, '2021-01-03', NULL, NULL, 'AKHIR PEKAN'),
(248, 3, '2021-01-04', '08:00:00', '16:00:00', 'HADIR'),
(249, 3, '2021-01-05', '08:00:00', '16:00:00', 'HADIR'),
(250, 3, '2021-01-06', '08:00:00', '16:00:00', 'HADIR'),
(251, 3, '2021-01-07', '08:00:00', '16:00:00', 'HADIR'),
(252, 3, '2021-01-08', '08:00:00', '16:00:00', 'HADIR'),
(253, 3, '2021-01-09', NULL, NULL, 'AKHIR PEKAN'),
(254, 3, '2021-01-10', NULL, NULL, 'AKHIR PEKAN'),
(255, 3, '2021-01-11', '08:00:00', '16:00:00', 'HADIR'),
(256, 3, '2021-01-12', '08:00:00', '16:00:00', 'HADIR'),
(257, 3, '2021-01-13', '08:00:00', '16:00:00', 'HADIR'),
(258, 3, '2021-01-14', '08:00:00', '16:00:00', 'HADIR'),
(259, 3, '2021-01-15', '08:00:00', '16:00:00', 'HADIR'),
(260, 3, '2021-01-16', NULL, NULL, 'AKHIR PEKAN'),
(261, 3, '2021-01-17', NULL, NULL, 'AKHIR PEKAN'),
(262, 3, '2021-01-18', '08:00:00', '16:00:00', 'HADIR'),
(263, 3, '2021-01-19', '08:00:00', '16:00:00', 'HADIR'),
(264, 3, '2021-01-20', '08:00:00', '16:00:00', 'HADIR'),
(265, 3, '2021-01-21', NULL, NULL, 'IZIN'),
(266, 3, '2021-01-22', '08:00:00', '16:00:00', 'HADIR'),
(267, 3, '2021-01-23', NULL, NULL, 'AKHIR PEKAN'),
(268, 3, '2021-01-24', NULL, NULL, 'AKHIR PEKAN'),
(269, 3, '2021-01-25', '08:00:00', '16:00:00', 'HADIR'),
(270, 3, '2021-01-26', '08:00:00', '16:00:00', 'HADIR'),
(271, 3, '2021-01-27', '08:40:00', '16:00:00', 'HADIR'),
(272, 3, '2021-01-28', '08:00:00', '16:00:00', 'HADIR'),
(273, 3, '2021-01-29', '08:00:00', '16:00:00', 'HADIR'),
(274, 3, '2021-01-30', NULL, NULL, 'AKHIR PEKAN'),
(275, 3, '2021-01-31', NULL, NULL, 'AKHIR PEKAN');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `jabatan`
--
ALTER TABLE `jabatan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `lokasi`
--
ALTER TABLE `lokasi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `penggajian`
--
ALTER TABLE `penggajian`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `presensi`
--
ALTER TABLE `presensi`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `jabatan`
--
ALTER TABLE `jabatan`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `karyawan`
--
ALTER TABLE `karyawan`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `lokasi`
--
ALTER TABLE `lokasi`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `penggajian`
--
ALTER TABLE `penggajian`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `pengguna`
--
ALTER TABLE `pengguna`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `presensi`
--
ALTER TABLE `presensi`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=276;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

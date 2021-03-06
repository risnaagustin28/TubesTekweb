-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 07, 2021 at 12:54 PM
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
-- Database: `abs`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `kd_barang` int(11) NOT NULL,
  `nama_barang` varchar(20) NOT NULL,
  `harga_beli` varchar(50) NOT NULL,
  `harga_jual` varchar(50) NOT NULL,
  `stok` int(11) NOT NULL,
  `diskon` varchar(10) NOT NULL,
  `keterangan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`kd_barang`, `nama_barang`, `harga_beli`, `harga_jual`, `stok`, `diskon`, `keterangan`) VALUES
(3, 'Komputer', '1.000.000', '1.500.000', 40, '20%', 'keterangan oke update'),
(4, 'laptop', '1.000.000', '15.000.000', 20, '20%', 'oke'),
(5, 'Komputer laptop baru', '1.200.000', '1.500.000', 20, '30%', 'barang sangat bagus'),
(6, 'Monitor', '1.000.000', '2.000.000', 50, '10%', 'New');

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `kode_pelanggan` int(11) NOT NULL,
  `nama_pelanggan` varchar(50) NOT NULL,
  `kelamin` varchar(25) NOT NULL,
  `alamat` text NOT NULL,
  `no_telpon` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`kode_pelanggan`, `nama_pelanggan`, `kelamin`, `alamat`, `no_telpon`) VALUES
(1, 'Alfian', 'LAKI LAKI', 'Padalarang', '0852212121'),
(3, 'Ujang ASEP imroh', 'LAKI-LAKI', 'Cimahi', '0888121343');

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `id_jual` int(11) NOT NULL,
  `kode_barang` int(11) NOT NULL,
  `kode_pelanggan` int(11) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `keterangan` text NOT NULL,
  `status` tinyint(1) DEFAULT 0,
  `tanggal` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penjualan`
--

INSERT INTO `penjualan` (`id_jual`, `kode_barang`, `kode_pelanggan`, `jumlah`, `keterangan`, `status`, `tanggal`) VALUES
(3, 3, 1, '2', 'oke', 1, '2018-12-02 15:20:38'),
(4, 3, 1, '3', 'oke', 1, '2018-12-02 15:20:38'),
(5, 4, 3, '2', 'oke banget', 1, '2018-12-02 15:20:38'),
(12, 3, 1, '3', 'oke', 1, '2018-12-04 13:05:52'),
(18, 5, 1, '1', '', 1, '2021-06-07 10:41:58'),
(19, 3, 1, '1', '', 1, '2021-06-07 10:53:08'),
(20, 4, 1, '1', '', 1, '2021-06-07 10:53:08'),
(21, 5, 1, '1', '', 1, '2021-06-07 10:53:08'),
(23, 6, 1, '1', '', 1, '2021-06-07 10:53:08');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`kd_barang`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`kode_pelanggan`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`id_jual`),
  ADD KEY `kode_barang` (`kode_barang`),
  ADD KEY `kode_pelanggan` (`kode_pelanggan`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `kd_barang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `kode_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `id_jual` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD CONSTRAINT `penjualan_ibfk_1` FOREIGN KEY (`kode_barang`) REFERENCES `barang` (`kd_barang`),
  ADD CONSTRAINT `penjualan_ibfk_2` FOREIGN KEY (`kode_pelanggan`) REFERENCES `pelanggan` (`kode_pelanggan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 08, 2019 at 09:33 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `farmasi`
--

-- --------------------------------------------------------

--
-- Table structure for table `detail_obat`
--

CREATE TABLE `detail_obat` (
  `id_detail_obat` varchar(8) NOT NULL,
  `id_obat` varchar(8) NOT NULL,
  `id_kategori` varchar(5) NOT NULL,
  `id_jenis` varchar(5) NOT NULL,
  `id_stok` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_obat`
--

INSERT INTO `detail_obat` (`id_detail_obat`, `id_obat`, `id_kategori`, `id_jenis`, `id_stok`) VALUES
('DO0001AB', 'OB0001AB', 'K01AN', 'J01BE', 'ST0001AB'),
('DO0002AC', 'OB0002AC', 'K01AN', 'J01BE', 'ST0002AC'),
('DO0003AC', 'OB0003AC', 'K02AG', 'J02BT', 'ST0003AC'),
('DO0004AC', 'OB0004AC', 'K03LA', 'J03KE', 'ST0004AC'),
('DO0005AI', 'OB0005AI', 'K01AN', 'J01BE', 'ST0005AI'),
('DO0006AC', 'OB0006AC', 'K01AN', 'J02BT', 'ST0006AC'),
('DO0007AD', 'OB0007AD', 'K01AN', 'J02BT', 'ST0007AD'),
('DO0008AF', 'OB0008AF', 'K02AG', 'J01BE', 'ST0008AF'),
('DO0009AI', 'OB0009AI', 'K02AG', 'J02BT', 'ST0009AI'),
('DO0010AF', 'OB0010AF', 'K01AN', 'J02BT', 'ST0010AF'),
('DO0011AK', 'OB0011AK', 'K01AN', 'J01BE', 'ST0011AK'),
('DO0012AL', 'OB0012AL', 'K01AN', 'J01BE', 'ST0012AL'),
('DO0013AL', 'OB0013AL', 'K04ST', 'J02BT', 'ST0013AL'),
('DO0014AL', 'OB0014AL', 'K01AN', 'J01BE', 'ST0014AL'),
('DO0015AL', 'OB0015AL', 'K01AN', 'J03KE', 'ST0015AL'),
('DO0016AM', 'OB0016AM', 'K01AN', 'J02BT', 'ST0016AM'),
('DO0017AM', 'OB0017AM', 'K04ST', 'J01BE', 'ST0017AM'),
('DO0018AM', 'OB0018AM', 'K01AN', 'J01BE', 'ST0018AM'),
('DO0019AM', 'OB0019AM', 'K01AN', 'J01BE', 'ST0019AM'),
('DO0020AL', 'OB0020AL', 'K04ST', 'J01BE', 'ST0020AL'),
('DO0021AL', 'OB0021AL', 'K01AN', 'J02BT', 'ST0021AL'),
('DO0022AM', 'OB0022AM', 'K02AG', 'J03KE', 'ST0022AM'),
('DO0023AM', 'OB0023AM', 'K01AN', 'J01BE', 'ST0023AM'),
('DO0024AN', 'OB0024AN', 'K05VA', 'J01BE', 'ST0024AN'),
('DO0025AF', 'OB0025AF', 'K05VA', 'J04JA', 'ST0025AF'),
('DO0026AL', 'OB0026AL', 'K04ST', 'J06FI', 'ST0026AL'),
('DO0027AC', 'OB0027AC', 'K01AN', 'J01BE', 'ST0027AC'),
('DO0028AM', 'OB0028AM', 'K01AN', 'J01BE', 'ST0028AM');

-- --------------------------------------------------------

--
-- Table structure for table `detail_pembelian`
--

CREATE TABLE `detail_pembelian` (
  `kode_transaksi` varchar(14) DEFAULT NULL,
  `jumlah` mediumint(9) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `no` varchar(5) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_pembelian`
--

INSERT INTO `detail_pembelian` (`kode_transaksi`, `jumlah`, `total`, `no`, `tanggal`) VALUES
('TB1DACTAN', 120, 1080000, '0001', '2019-12-06 17:41:35'),
('TB2DACTAN', 70, 560000, '0002', '2019-12-06 17:42:26'),
('TB3DACTAN', 80, 640000, '0003', '2019-12-06 17:42:37'),
('TB4DACTAN', 70, 623000, '0004', '2019-12-06 17:42:49'),
('TB5DACTAN', 4, 4932, '0005', '2019-12-08 20:30:44'),
('TB6DACTAN', 7, 63000, '0006', '2019-12-08 20:31:57');

-- --------------------------------------------------------

--
-- Table structure for table `detail_penjualan`
--

CREATE TABLE `detail_penjualan` (
  `kode_transaksi` varchar(12) DEFAULT NULL,
  `jumlah` mediumint(9) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `no` varchar(5) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_penjualan`
--

INSERT INTO `detail_penjualan` (`kode_transaksi`, `jumlah`, `total`, `no`, `tanggal`) VALUES
('TJ1PAP0AN', 90, 765000, '0001', '2019-12-06 18:00:57'),
('TJ2PAPOAN', 80, 680000, '0002', '2019-12-06 18:01:05'),
('TJ3PPT0AN', 70, 595000, '0003', '2019-12-06 18:01:47'),
('TJ4PAP0AN', 68, 639200, '0004', '2019-12-06 18:02:11'),
('TJ5PAP0AN', 89, 836600, '0005', '2019-12-06 18:02:47'),
('TJ6PAPOAN', 91, 855400, '0006', '2019-12-06 18:03:19'),
('TJ7PAPOAN', 10, 95000, '0007', '2019-12-08 20:32:43');

-- --------------------------------------------------------

--
-- Table structure for table `distributor`
--

CREATE TABLE `distributor` (
  `id_distributor` varchar(8) NOT NULL,
  `nama_distributor` varchar(60) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `no_hp` varchar(20) NOT NULL,
  `email` varchar(60) NOT NULL,
  `tanggal_input` timestamp NOT NULL DEFAULT current_timestamp(),
  `tanggal_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `distributor`
--

INSERT INTO `distributor` (`id_distributor`, `nama_distributor`, `alamat`, `no_hp`, `email`, `tanggal_input`, `tanggal_update`) VALUES
('DACT31AC', 'PT ACTAVIS', 'Jl. Raya Jakarta Bogor Km 28 PO Box 1044/JAT 13010 JAKARTA TIMUR 13710', '0218710311', 'actavis@gmail.com', '2019-12-04 18:04:58', '2019-12-04 18:04:58'),
('DBAY42BA', 'PT BAYER INDONESIA', 'Jl. Raya Jakarta Bogor Km 38 Cibubur JAKARTA TIMUR', '0218710421', 'bayerind@bayer.co.id', '2019-12-04 18:06:02', '2019-12-04 18:06:02'),
('DBIN53SU', 'PT BINTANG TOEDJOE', 'Jl. Rawa Sumur Barat II / K-9 Kawasan Industri Pulogadung JAKARTA TIMUR 13930', '0214605533', 'support@bintangtoedjo.co.id', '2019-12-04 18:06:53', '2019-12-04 18:06:53'),
('DBIS09BI', 'PT BISON', 'Jl. Raya Kapuk Kamal No. 67 Kel. Kapuk Muara Kec. Penjaringan JAKARTA UTARA 14460', 'O216194094', 'bison@gmail.com', '2019-12-04 18:07:35', '2019-12-04 18:07:35'),
('DBRO41BR', 'PT BROMO Pharmaceutical Industries', 'Jl. Kartini VIII/5 JAKARTA 10750', '0216390413', 'bromopharmaceuticalindustries@gmail.com', '2019-12-04 18:08:34', '2019-12-04 18:08:34'),
('DDUA53AC', 'PT DUA LIMA ', 'Jl. Raya Jakarta Bogor Km 28 PO Box 1044/JAT 13010 JAKARTA TIMUR ', '0214605533', 'dualima@gmail.com', '2019-12-04 18:18:28', '2019-12-04 18:45:36');

-- --------------------------------------------------------

--
-- Table structure for table `harga`
--

CREATE TABLE `harga` (
  `id_harga` varchar(8) NOT NULL,
  `id_obat` varchar(8) NOT NULL,
  `harga` int(11) NOT NULL,
  `kode_transaksi` varchar(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `harga`
--

INSERT INTO `harga` (`id_harga`, `id_obat`, `harga`, `kode_transaksi`) VALUES
('HB0001AB', 'OB0001AB', 9500, 'TB1DACTAN'),
('HB0002AC', 'OB0002AC', 8500, 'TB2DACTAN'),
('HB0003AB', 'OB0001AB', 8500, 'TB3DACTAN'),
('HB0004AC', 'OB0002AC', 9400, 'TB4DACTAN'),
('HB0005AB', 'OB0001AB', 1733, 'TB5DACTAN'),
('HB0006AM', 'OB0028AM', 9500, 'TB6DACTAN');

-- --------------------------------------------------------

--
-- Table structure for table `jenis`
--

CREATE TABLE `jenis` (
  `id_jenis` varchar(5) NOT NULL,
  `jenis` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jenis`
--

INSERT INTO `jenis` (`id_jenis`, `jenis`) VALUES
('J01BE', 'Obat bebas'),
('J02BT', 'Obat Bebas Terbatas'),
('J03KE', 'Obat Keras'),
('J04JA', 'Jamu (Empirical based herbal medicine) '),
('J05HE', 'Obat Herbal Terstandar (Scientific based herbal medicine)'),
('J06FI', 'Fitofarmaka (Clinical based herbal medicine)');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` varchar(5) NOT NULL,
  `kategori` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `kategori`) VALUES
('K01AN', 'Analgesik'),
('K02AG', 'Agen Imunosupresif'),
('K03LA', 'Laksatif'),
('K04ST', 'Statin'),
('K05VA', 'Vaksin');

-- --------------------------------------------------------

--
-- Table structure for table `obat`
--

CREATE TABLE `obat` (
  `id_obat` varchar(8) NOT NULL,
  `nama_obat` varchar(50) NOT NULL,
  `tanggal_input` timestamp NOT NULL DEFAULT current_timestamp(),
  `tanggal_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `obat`
--

INSERT INTO `obat` (`id_obat`, `nama_obat`, `tanggal_input`, `tanggal_update`) VALUES
('OB0001AB', 'ABBOCATH 18', '2019-12-06 05:35:47', '2019-12-06 05:47:21'),
('OB0002AC', 'ACIFAR CR 5 GR', '2019-12-06 17:29:47', '2019-12-06 17:29:47'),
('OB0003AC', 'ACTIFED H 60ML', '2019-12-06 17:30:00', '2019-12-06 17:30:00'),
('OB0004AC', 'ACETON 60ML', '2019-12-06 17:30:13', '2019-12-06 17:30:13'),
('OB0005AI', 'AILIN TM 5ML', '2019-12-06 17:30:37', '2019-12-06 17:30:37'),
('OB0006AC', 'ACYCLOVIR TAB 200MG', '2019-12-06 17:30:57', '2019-12-06 17:30:57'),
('OB0007AD', 'ADI CUP 240ML', '2019-12-06 17:31:21', '2019-12-06 17:31:21'),
('OB0008AF', 'AFIRHEUMA', '2019-12-06 17:31:40', '2019-12-06 17:31:40'),
('OB0009AI', 'AINIE SBN SIRIH 110 ML', '2019-12-06 17:31:55', '2019-12-06 17:31:55'),
('OB0010AF', 'AFITRACIN 10 ML', '2019-12-06 17:32:10', '2019-12-06 17:32:10'),
('OB0011AK', 'AKURAT COMPACT', '2019-12-06 17:32:35', '2019-12-06 17:32:35'),
('OB0012AL', 'ALBA PASTILES', '2019-12-06 17:32:48', '2019-12-06 17:32:48'),
('OB0013AL', 'ALERDEX TAB', '2019-12-06 17:33:04', '2019-12-06 17:33:04'),
('OB0014AL', 'ALLERGIL CR 2% 5GR', '2019-12-06 17:33:18', '2019-12-06 17:33:18'),
('OB0015AL', 'ALKOHOL 100ML ONEMED', '2019-12-06 17:33:45', '2019-12-06 17:33:45'),
('OB0016AM', 'AMBROXOL SYR 60 ML', '2019-12-06 17:34:01', '2019-12-06 17:34:01'),
('OB0017AM', 'AMLODIPIN TAB 10 MG HEX', '2019-12-06 17:34:18', '2019-12-06 17:34:18'),
('OB0018AM', 'AMOXYCILLIN TAB 500 MG KF', '2019-12-06 17:34:33', '2019-12-06 17:34:33'),
('OB0019AM', 'AMPICILLIN TAB 500 MG ERITA', '2019-12-06 17:34:47', '2019-12-06 17:34:47'),
('OB0020AL', 'ALBOTHYL 10 ML', '2019-12-06 17:35:06', '2019-12-06 17:35:06'),
('OB0021AL', 'ALLERIN EXP 60 ML', '2019-12-06 17:35:26', '2019-12-06 17:35:26'),
('OB0022AM', 'AMLODIPIN TAB 10 MG HEX', '2019-12-06 17:35:43', '2019-12-06 17:35:43'),
('OB0023AM', 'AMURATEN', '2019-12-06 17:36:01', '2019-12-06 17:36:01'),
('OB0024AN', 'ANABION 60 ML', '2019-12-06 17:36:24', '2019-12-06 17:36:24'),
('OB0025AF', 'AFITSON CENGKEH', '2019-12-06 17:36:45', '2019-12-06 17:36:45'),
('OB0026AL', 'ALLOPURINOL TAB 100MG FM,', '2019-12-06 17:37:03', '2019-12-06 17:37:03'),
('OB0027AC', 'ACTIFED H 60M', '2019-12-06 17:37:29', '2019-12-06 17:37:29'),
('OB0028AM', 'AMOX', '2019-12-08 19:54:41', '2019-12-08 19:54:41');

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE `pegawai` (
  `id_pegawai` varchar(8) NOT NULL,
  `nama_pegawai` varchar(60) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `no_hp` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `tanggal_input` timestamp NOT NULL DEFAULT current_timestamp(),
  `tanggal_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pegawai`
--

INSERT INTO `pegawai` (`id_pegawai`, `nama_pegawai`, `alamat`, `no_hp`, `email`, `tanggal_input`, `tanggal_update`) VALUES
('PGAND001', 'Andik Script', 'Jl. sidodadi 13 Ponorogo', '0895363688341', 'andikmindai@gmail.com', '2019-11-03 16:59:14', '2019-11-03 16:59:14'),
('PGIND002', 'Indah Sari ', 'Jl. Suramadu No. 10 Surakarta', '086578901265', 'sariindah@gmail.com', '2019-11-03 16:59:14', '2019-11-03 16:59:37');

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` varchar(8) NOT NULL,
  `nama_pelanggan` varchar(70) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `no_hp` varchar(20) NOT NULL,
  `email` varchar(40) NOT NULL,
  `tanggal_input` timestamp NOT NULL DEFAULT current_timestamp(),
  `tanggal_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `nama_pelanggan`, `alamat`, `no_hp`, `email`, `tanggal_input`, `tanggal_update`) VALUES
('PAP021BA', 'Apotek Barokah Jaya', 'Jl. Wachid Hasyim No. 30 Semarang', '0218710187', 'barkohjaya@gmail.com', '2019-12-04 18:54:43', '2019-12-04 18:54:43'),
('PAP021MU', 'Apotek Mugi Waras', 'Jl. K. Ahmad Dahlan No. 34 Surakarta', '021461121', 'mugiwaras@gmail.com', '2019-12-04 18:53:57', '2019-12-04 18:53:57'),
('PAPO21DA', 'Apotek Daya Guna', 'l. Raden Ajeng Kartini No. 45 Boyolali', 'O216194012', 'dayaguna@gmail.com', '2019-12-04 18:55:11', '2019-12-04 18:55:11'),
('PPT021AG', 'PT. Agunan Farma', 'Jl. Truntum No. 12 Surakarta', '0214121123', 'agunanfarmasi@gmail.com', '2019-12-04 18:55:44', '2019-12-04 18:55:44'),
('PPT021SI', 'PT. Sinar Jaya Farmasi', 'Jl. Agus Salim No.123 Sukoharjo', '0218710441', 'sinarjayafarmasi@gmail.com', '2019-12-04 18:53:05', '2019-12-04 19:06:30');

-- --------------------------------------------------------

--
-- Table structure for table `pembelian`
--

CREATE TABLE `pembelian` (
  `kode_transaksi` varchar(14) NOT NULL,
  `id_distributor` varchar(8) DEFAULT NULL,
  `id_pegawai` varchar(8) DEFAULT NULL,
  `id_obat` varchar(8) DEFAULT NULL,
  `no` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pembelian`
--

INSERT INTO `pembelian` (`kode_transaksi`, `id_distributor`, `id_pegawai`, `id_obat`, `no`) VALUES
('TB1DACTAN', 'DACT31AC', 'PGAND001', 'OB0001AB', '0001'),
('TB2DACTAN', 'DACT31AC', 'PGAND001', 'OB0002AC', '0002'),
('TB3DACTAN', 'DACT31AC', 'PGAND001', 'OB0001AB', '0003'),
('TB4DACTAN', 'DACT31AC', 'PGAND001', 'OB0002AC', '0004'),
('TB5DACTAN', 'DACT31AC', 'PGAND001', 'OB0001AB', '0005'),
('TB6DACTAN', 'DACT31AC', 'PGAND001', 'OB0028AM', '0006');

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `kode_transaksi` varchar(12) NOT NULL,
  `id_pelanggan` varchar(8) DEFAULT NULL,
  `id_pegawai` varchar(8) DEFAULT NULL,
  `id_obat` varchar(8) DEFAULT NULL,
  `no` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penjualan`
--

INSERT INTO `penjualan` (`kode_transaksi`, `id_pelanggan`, `id_pegawai`, `id_obat`, `no`) VALUES
('TJ1PAP0AN', 'PAP021MU', 'PGAND001', 'OB0001AB', '0001'),
('TJ2PAPOAN', 'PAPO21DA', 'PGAND001', 'OB0001AB', '0002'),
('TJ3PPT0AN', 'PPT021AG', 'PGAND001', 'OB0001AB', '0003'),
('TJ4PAP0AN', 'PAP021BA', 'PGAND001', 'OB0002AC', '0004'),
('TJ5PAP0AN', 'PAP021MU', 'PGAND001', 'OB0002AC', '0005'),
('TJ6PAPOAN', 'PAPO21DA', 'PGAND001', 'OB0002AC', '0006'),
('TJ7PAPOAN', 'PAPO21DA', 'PGAND001', 'OB0028AM', '0007');

-- --------------------------------------------------------

--
-- Table structure for table `stok`
--

CREATE TABLE `stok` (
  `id_stok` varchar(8) NOT NULL,
  `stok` int(11) NOT NULL,
  `stok_limit` mediumint(9) NOT NULL,
  `id_obat` varchar(8) NOT NULL,
  `tanggal_input` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stok`
--

INSERT INTO `stok` (`id_stok`, `stok`, `stok_limit`, `id_obat`, `tanggal_input`) VALUES
('ST0001AB', 354, 10, 'OB0001AB', '2019-12-06 05:35:47'),
('ST0002AC', 400, 19, 'OB0002AC', '2019-12-06 17:29:47'),
('ST0003AC', 189, 13, 'OB0003AC', '2019-12-06 17:30:00'),
('ST0004AC', 456, 12, 'OB0004AC', '2019-12-06 17:30:13'),
('ST0005AI', 423, 11, 'OB0005AI', '2019-12-06 17:30:37'),
('ST0006AC', 110, 8, 'OB0006AC', '2019-12-06 17:30:57'),
('ST0007AD', 543, 13, 'OB0007AD', '2019-12-06 17:31:21'),
('ST0008AF', 531, 11, 'OB0008AF', '2019-12-06 17:31:40'),
('ST0009AI', 431, 22, 'OB0009AI', '2019-12-06 17:31:55'),
('ST0010AF', 542, 12, 'OB0010AF', '2019-12-06 17:32:10'),
('ST0011AK', 554, 12, 'OB0011AK', '2019-12-06 17:32:35'),
('ST0012AL', 423, 32, 'OB0012AL', '2019-12-06 17:32:48'),
('ST0013AL', 451, 22, 'OB0013AL', '2019-12-06 17:33:04'),
('ST0014AL', 332, 11, 'OB0014AL', '2019-12-06 17:33:18'),
('ST0015AL', 778, 12, 'OB0015AL', '2019-12-06 17:33:45'),
('ST0016AM', 543, 43, 'OB0016AM', '2019-12-06 17:34:01'),
('ST0017AM', 533, 32, 'OB0017AM', '2019-12-06 17:34:18'),
('ST0018AM', 542, 12, 'OB0018AM', '2019-12-06 17:34:33'),
('ST0019AM', 232, 33, 'OB0019AM', '2019-12-06 17:34:47'),
('ST0020AL', 534, 12, 'OB0020AL', '2019-12-06 17:35:07'),
('ST0021AL', 645, 122, 'OB0021AL', '2019-12-06 17:35:26'),
('ST0022AM', 532, 12, 'OB0022AM', '2019-12-06 17:35:43'),
('ST0023AM', 344, 12, 'OB0023AM', '2019-12-06 17:36:01'),
('ST0024AN', 433, 11, 'OB0024AN', '2019-12-06 17:36:24'),
('ST0025AF', 343, 22, 'OB0025AF', '2019-12-06 17:36:45'),
('ST0026AL', 653, 12, 'OB0026AL', '2019-12-06 17:37:03'),
('ST0027AC', 556, 21, 'OB0027AC', '2019-12-06 17:37:29'),
('ST0028AM', 120, 12, 'OB0028AM', '2019-12-08 19:54:41');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` tinyint(4) NOT NULL,
  `username` varchar(15) NOT NULL,
  `password` varchar(15) NOT NULL,
  `id_pegawai` varchar(8) NOT NULL,
  `tanggal_input` timestamp NOT NULL DEFAULT current_timestamp(),
  `tanggal_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`, `id_pegawai`, `tanggal_input`, `tanggal_update`) VALUES
(1, 'andik', 'andik', 'PGAND001', '2019-11-13 14:03:07', '2019-11-13 14:03:07'),
(2, 'indah', 'indah', 'PGIND002', '2019-11-13 14:03:07', '2019-11-13 14:03:07');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detail_obat`
--
ALTER TABLE `detail_obat`
  ADD PRIMARY KEY (`id_detail_obat`),
  ADD KEY `id_detail_obat` (`id_detail_obat`,`id_obat`),
  ADD KEY `id_obat` (`id_obat`),
  ADD KEY `id_jenis` (`id_jenis`),
  ADD KEY `id_kategori` (`id_kategori`),
  ADD KEY `id_stok` (`id_stok`);

--
-- Indexes for table `detail_pembelian`
--
ALTER TABLE `detail_pembelian`
  ADD PRIMARY KEY (`no`),
  ADD KEY `kode_transaksi` (`kode_transaksi`),
  ADD KEY `no` (`no`);

--
-- Indexes for table `detail_penjualan`
--
ALTER TABLE `detail_penjualan`
  ADD PRIMARY KEY (`no`),
  ADD KEY `kode_transaksi` (`kode_transaksi`,`no`);

--
-- Indexes for table `distributor`
--
ALTER TABLE `distributor`
  ADD PRIMARY KEY (`id_distributor`),
  ADD KEY `id_produsen` (`id_distributor`);

--
-- Indexes for table `harga`
--
ALTER TABLE `harga`
  ADD PRIMARY KEY (`id_harga`),
  ADD KEY `id_harga` (`id_harga`,`id_obat`),
  ADD KEY `id_harga_2` (`id_harga`,`id_obat`),
  ADD KEY `id_obat` (`id_obat`),
  ADD KEY `kode_transaksi` (`kode_transaksi`);

--
-- Indexes for table `jenis`
--
ALTER TABLE `jenis`
  ADD PRIMARY KEY (`id_jenis`),
  ADD KEY `id_jenis` (`id_jenis`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`),
  ADD KEY `id_kategori` (`id_kategori`);

--
-- Indexes for table `obat`
--
ALTER TABLE `obat`
  ADD PRIMARY KEY (`id_obat`),
  ADD KEY `id_obat` (`id_obat`);

--
-- Indexes for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`id_pegawai`),
  ADD KEY `id_pegawai` (`id_pegawai`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`),
  ADD KEY `id_pelanggan` (`id_pelanggan`);

--
-- Indexes for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`kode_transaksi`),
  ADD KEY `kode_transaksi` (`kode_transaksi`,`id_distributor`,`id_pegawai`),
  ADD KEY `id_produsen` (`id_distributor`),
  ADD KEY `id_pegawai` (`id_pegawai`),
  ADD KEY `no` (`no`),
  ADD KEY `id_obat` (`id_obat`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`kode_transaksi`),
  ADD KEY `kode_transaksi` (`kode_transaksi`,`id_pelanggan`,`id_pegawai`),
  ADD KEY `id_pelanggan` (`id_pelanggan`),
  ADD KEY `id_pegawai` (`id_pegawai`),
  ADD KEY `id_obat` (`id_obat`,`no`),
  ADD KEY `no` (`no`);

--
-- Indexes for table `stok`
--
ALTER TABLE `stok`
  ADD PRIMARY KEY (`id_stok`),
  ADD KEY `id_stok` (`id_stok`),
  ADD KEY `id_obat` (`id_obat`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_pegawai` (`id_pegawai`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail_obat`
--
ALTER TABLE `detail_obat`
  ADD CONSTRAINT `detail_obat_ibfk_1` FOREIGN KEY (`id_obat`) REFERENCES `obat` (`id_obat`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_obat_ibfk_2` FOREIGN KEY (`id_jenis`) REFERENCES `jenis` (`id_jenis`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_obat_ibfk_3` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_obat_ibfk_4` FOREIGN KEY (`id_stok`) REFERENCES `stok` (`id_stok`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `detail_pembelian`
--
ALTER TABLE `detail_pembelian`
  ADD CONSTRAINT `detail_pembelian_ibfk_1` FOREIGN KEY (`kode_transaksi`) REFERENCES `pembelian` (`kode_transaksi`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `detail_penjualan`
--
ALTER TABLE `detail_penjualan`
  ADD CONSTRAINT `detail_penjualan_ibfk_1` FOREIGN KEY (`kode_transaksi`) REFERENCES `penjualan` (`kode_transaksi`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `harga`
--
ALTER TABLE `harga`
  ADD CONSTRAINT `harga_ibfk_1` FOREIGN KEY (`id_obat`) REFERENCES `obat` (`id_obat`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `harga_ibfk_2` FOREIGN KEY (`kode_transaksi`) REFERENCES `pembelian` (`kode_transaksi`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD CONSTRAINT `pembelian_ibfk_1` FOREIGN KEY (`id_distributor`) REFERENCES `distributor` (`id_distributor`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `pembelian_ibfk_2` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`id_pegawai`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `pembelian_ibfk_3` FOREIGN KEY (`id_obat`) REFERENCES `obat` (`id_obat`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `pembelian_ibfk_4` FOREIGN KEY (`no`) REFERENCES `detail_pembelian` (`no`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD CONSTRAINT `penjualan_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `penjualan_ibfk_2` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`id_pegawai`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `penjualan_ibfk_3` FOREIGN KEY (`id_obat`) REFERENCES `obat` (`id_obat`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `penjualan_ibfk_4` FOREIGN KEY (`no`) REFERENCES `detail_penjualan` (`no`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `stok`
--
ALTER TABLE `stok`
  ADD CONSTRAINT `stok_ibfk_1` FOREIGN KEY (`id_obat`) REFERENCES `obat` (`id_obat`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`id_pegawai`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

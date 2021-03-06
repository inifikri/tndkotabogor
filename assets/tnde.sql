-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 09, 2020 at 08:05 AM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 5.6.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tnde`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_data` (IN `tahun` INT, IN `opd_id` INT)  BEGIN
SELECT * FROM surat_intruksi
			LEFT JOIN opd
			ON opd.opd_id = surat_intruksi.opd_id
			LEFT JOIN aparatur
			ON aparatur.aparatur_id = surat_intruksi.penandatangan_id
			LEFT JOIN kode_surat
			ON kode_surat.kodesurat_id = surat_intruksi.kodesurat_id
			WHERE surat_intruksi.opd_id = opd_id
			AND LEFT(tanggal, 4) = tahun
			ORDER BY surat_intruksi.tanggal DESC, LENGTH(surat_intruksi.id) DESC, surat_intruksi.id DESC;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `tampil_intruksi` ()  BEGIN 
  SELECT  *
  FROM  surat_intruksi;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `aparatur`
--

CREATE TABLE `aparatur` (
  `aparatur_id` int(11) NOT NULL,
  `jabatan_id` int(11) NOT NULL,
  `opd_id` int(11) NOT NULL,
  `nip` varchar(60) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `eselon` varchar(20) NOT NULL,
  `pangkat` varchar(60) NOT NULL,
  `golongan` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aparatur`
--

INSERT INTO `aparatur` (`aparatur_id`, `jabatan_id`, `opd_id`, `nip`, `nama`, `eselon`, `pangkat`, `golongan`) VALUES
(1, 145, 33, '196212081992032004', 'Ir. Hj. Erna Hernawati, MM, MBA', '', '', ''),
(2, 146, 33, '196508041988121003', 'Asep Zaenal Rahmat, S.Pd., M.Pd', '', '', 'IV/b'),
(3, 158, 33, '197706191996121001', 'Oki Tri Fasiasta Nurmala Alam, S.STP', '', 'Penata Tk.I', 'III/d'),
(4, 161, 33, '197704132006041008', 'Rudi Laksamana Kusumah, S.Kom', '', 'Penata Tk.I', 'III/d'),
(5, 491, 33, '197410162008012006', 'Fitri Widianti', '', '', 'II/c'),
(74, 493, 14, '-', 'Admin Diskarpus', '-', '-', '-'),
(76, 495, 13, '-', 'Admin Tata Usaha Dinas Sosial Kota Bogor', '-', '-', '-'),
(8, 76, 14, '196310051988032013', 'Hj Reny Handayani Tresnarianti, S.H., M.H.', '', '', 'IV/b'),
(12, 82, 14, '196205201993122001', 'Nuraini, S.E,M.Si', '', '', 'IV/a'),
(9, 75, 14, '196705111986031001', 'Drs. Agung Prihanto ', '', '', 'IV/c'),
(10, 79, 14, '197105151995031003', 'Suhandi, S.E., M.Si. ', '', '', 'IV/a'),
(11, 80, 14, '196604171994032004', 'Dra. Anna Maffrina R., MAP', '', '', 'IV/a'),
(68, 154, 33, '197605141995011001', 'Hendres Deddy Nugroho, S.Sos., M.Si.', '', '', 'IV/a'),
(16, 454, 33, '196304212006041005', 'Suryana, SE.', '', 'Penata Muda Tingkat I', 'III/b'),
(17, 455, 33, '199103222019031005', 'Edward Bayu Saputra, ST', '', 'Penata Muda', 'III/a'),
(18, 456, 33, '199501052019031001', 'Yuridiar Dzikrulloh, A.Md.', '', 'Pengatur', 'II/c'),
(19, 457, 33, '-', 'Admin Kominfo', '-', '-', '-'),
(20, 160, 33, '197701272005012009', 'Yani Kurniasih, S.Kom, M.P. ', 'III/d', '-', '-'),
(22, 451, 0, '-', 'Super Admin', '-', '-', '-'),
(25, 472, 33, '197309252005012010', 'Asystasia Aromatica, S.E., M.A.', '', '', 'III/d'),
(26, 473, 33, '196806041996031004', 'Pandapotan Nasution, S.E', '', '', 'III/d'),
(27, 474, 33, '197702022009011003', 'Buceu Bakhtiar Ridlwan, S.H.', '', '', 'III/c'),
(28, 153, 33, '197509102006042010', 'Netty Herawati, S.Kom.', '', '', 'III/d'),
(29, 151, 33, '198706202011011002', 'Enditya Luhur Raharja, S.A.P.,M.Si', '', '', 'III/c'),
(30, 150, 33, '196606091993032005', 'Andi Aslamiah Achmad, S.E.,M.Si', '', '', 'IV/a'),
(31, 152, 33, '197306132006041001', 'E. Yun Sudrajat, S.Kom.', '', '', 'III/d'),
(32, 156, 33, '198411172009021002', 'Teja Santana, S.Kom', '', '', 'III/c'),
(33, 157, 33, '197106242006041011', 'Joni Nurjohan, S.Kom. MM', '', '', 'III/d'),
(34, 155, 33, '197107171994031004', 'Warsono, S.E., MM', '', '', 'IV/a'),
(35, 475, 33, '197805072006042018', 'Liah Lestari, A.Md', '', '', 'III/b'),
(36, 163, 33, '198112222006041013', 'Achmad Sandy Bukhari, S.Kom.', '', '', 'III/d'),
(37, 164, 33, '197101022006041011', 'Aa Ahyauddin, SE.,S.Kom.', '', '', 'III/d'),
(38, 165, 33, '197506072009021001', 'Mochamat Fattah, S.Kom. MM', '', '', 'III/c'),
(39, 462, 33, '197402162005011002', 'Saeful Hamdi A.Md.', '', '', 'III/b'),
(40, 462, 33, '198303262009011003', 'Giri Maya Yudistira S.Kom', '', '', 'III/b'),
(41, 77, 14, '197606142006042021', 'Nurjanah, S.Sos', '', '', 'III/c'),
(42, 476, 14, '196505201993012003', 'Mellova, SH', '', '', 'III/d'),
(43, 81, 14, '196208011989031009', 'Drs. Sudiyaman, MM', '', '', 'IV/a'),
(44, 477, 14, '198107072010011022', 'Ajid Kurniawan, S.E., M.Si', '', '', 'III/c'),
(45, 478, 14, '196408141992032008', 'Mursyida, S.E., M.Si.', '', '', 'IV/a'),
(46, 85, 14, '196702271991032003', 'Nurchasanah, S.S., M.M.', '', '', 'IV/a'),
(47, 479, 14, '196505071987032006', 'Erni Dartini, SE.', '', '', 'III/d'),
(48, 88, 14, '196208191993031004', 'Drs. Agus Ronaldi', '', '', 'III/d'),
(49, 480, 14, '196303141996012001', 'Silvia, BSc', '', 'Penata Tingkat I', 'III/d'),
(50, 481, 14, '196502012006041007', 'A. Suryana', '', 'Pengatur Tingkat I', 'II/d'),
(51, 405, 13, '196210021989012001', 'Hj. Anggraeny Iswara, S.H.', '', '', 'IV/c'),
(52, 482, 13, '196810091989031005', 'Drs. Moch. Gozali', '', '', 'IV/b'),
(53, 410, 13, '197312131994031005', 'Jimmy Ventius Parluhutan H., A.P.,M.P.', '', '', 'IV/a'),
(54, 413, 13, '197003212006041002', 'Rokib, S.E, M.Si', '', '', 'III/d'),
(55, 416, 13, '196305051991032006', 'Dra. Siti Nursarah, M.Si', '', '', 'IV/a'),
(56, 483, 13, '196908011989032004', 'Sumartini, S.Sos,MAP', '', '', 'IV/a'),
(57, 407, 13, '196411071992032002', 'Dra. Savitri Dhewi Widyapranata', '', '', 'III/d'),
(58, 488, 13, '196309181990102001', 'Hj. Wati Rahmawati, SE.,MM.', '', '', 'IV/a'),
(59, 409, 13, '197004151997122001', 'Elis Kartikasari, S.Sos.', '', '', 'III/d'),
(60, 411, 13, '197505151999011001', 'Erwin Subastian, S.E.', '', '', 'III/d'),
(61, 412, 13, '196306261983031004', 'Ujiani Supriatin, S. Pd', '', '', 'III/d'),
(62, 484, 13, '196211251993031003', 'Ketut Renawan, S.H.', '', '', 'III/d'),
(63, 415, 13, '196708021991031009', 'Karma, SE, M.M', '', '', 'III/d'),
(64, 417, 13, '196502111985031003', 'Bambang Heryanto, S.E.', '', '', 'III/d'),
(65, 485, 13, '196806241994012003', 'Dra. Lusi Rosella Lestari, M.H.', '', '', 'IV/a'),
(66, 420, 13, '198010252005011011', 'Ruly Hasanul Basri, S.Sos', '', '', 'III/b'),
(67, 486, 13, '196209301991032001', 'Hanny Rusmini, Sm. Hk', '', '', 'III/d'),
(69, 162, 33, '196912221996031001', 'Sugeng Rulyadi, S.Kom, M.Si', '', '', 'IV/a'),
(70, 86, 14, '196305201982031002', 'Drs. Hermen', '', '', 'IV/b'),
(72, 490, 33, '-', 'Admin Tata Usaha Dinas Komunikasi dan Informatika', '-', '-', '-'),
(73, 492, 14, '-', 'Admin Tata Usaha Dinas Kearsipan dan Perpustakaan Kota Bogor', '-', '-', '-'),
(75, 494, 13, '-', 'Admin Dinsos', '-', '-', '-');

-- --------------------------------------------------------

--
-- Table structure for table `disposisi_suratkeluar`
--

CREATE TABLE `disposisi_suratkeluar` (
  `dsuratkeluar_id` int(11) NOT NULL,
  `surat_id` varchar(15) NOT NULL,
  `users_id` varchar(100) NOT NULL,
  `status` enum('Belum Selesai','Selesai') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `disposisi_suratkeluar`
--

INSERT INTO `disposisi_suratkeluar` (`dsuratkeluar_id`, `surat_id`, `users_id`, `status`) VALUES
(52, 'SE-2', '492', 'Selesai'),
(67, 'SE-3', '492', 'Belum Selesai'),
(110, 'LAP-2', '492', 'Belum Selesai'),
(117, 'PNGMN-2', '492', 'Belum Selesai'),
(124, 'REK-2', '492', 'Belum Selesai'),
(131, 'INT-2', '492', 'Belum Selesai'),
(133, 'SB-1', '492', 'Belum Selesai'),
(134, 'SB-1', '450', 'Belum Selesai'),
(137, 'SU-1', '492', 'Belum Selesai'),
(138, 'SU-1', '450', 'Belum Selesai'),
(148, 'NODIN-1', '492', 'Belum Selesai'),
(149, 'NODIN-1', '450', 'Belum Selesai'),
(150, 'SE-4', '492', 'Selesai'),
(151, 'SE-4', 'EKS-3', 'Selesai'),
(152, 'PGL-1', '492', 'Belum Selesai'),
(153, 'PGL-1', 'EKS-1', 'Belum Selesai'),
(154, 'MMO-1', '492', 'Belum Selesai'),
(155, 'MMO-1', 'EKS-1', 'Belum Selesai'),
(156, 'SE-5', 'EKS-3', 'Belum Selesai');

-- --------------------------------------------------------

--
-- Table structure for table `disposisi_suratmasuk`
--

CREATE TABLE `disposisi_suratmasuk` (
  `dsuratmasuk_id` int(11) NOT NULL,
  `suratmasuk_id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `aparatur_id` int(11) NOT NULL,
  `harap` varchar(250) NOT NULL,
  `keterangan` varchar(250) NOT NULL,
  `status` enum('Belum Selesai','Selesai Disposisi','Selesai') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `draft`
--

CREATE TABLE `draft` (
  `id` int(11) NOT NULL,
  `surat_id` varchar(15) NOT NULL,
  `tanggal` date NOT NULL,
  `dibuat_id` int(11) NOT NULL,
  `penandatangan_id` int(11) NOT NULL,
  `verifikasi_id` int(11) NOT NULL,
  `nama_surat` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `draft`
--

INSERT INTO `draft` (`id`, `surat_id`, `tanggal`, `dibuat_id`, `penandatangan_id`, `verifikasi_id`, `nama_surat`) VALUES
(3, 'SE-1', '2019-12-18', 161, 0, 0, 'Surat Edaran'),
(6, 'SB-1', '2019-02-14', 161, 145, 0, 'Surat Biasa'),
(7, 'SU-1', '2019-08-15', 161, 145, 0, 'Surat Undangan'),
(9, 'NODIN-1', '2019-12-15', 161, 145, 0, 'Nota Dinas'),
(13, 'INT-1', '2019-12-27', 161, 145, 0, 'Surat Instruksi'),
(14, 'SK-1', '2019-12-27', 161, 145, 0, 'Surat Keterangan'),
(15, 'PNGMN-1', '2019-12-27', 161, 145, 0, 'Surat Pengumuman'),
(16, 'REK-1', '2019-12-27', 161, 145, 0, 'Surat Rekomendasi'),
(17, 'SPT-1', '2019-12-30', 161, 145, 0, 'Surat Perintah Tugas'),
(19, 'SP-1', '2019-12-30', 161, 145, -1, 'Surat Perintah'),
(32, 'SE-2', '2020-01-02', 161, 1, -1, 'Surat Edaran'),
(54, 'PNG-1', '2020-01-13', 456, 145, 0, 'Surat Pengantar'),
(57, 'SE-3', '2020-01-22', 161, 0, 0, 'Surat Edaran'),
(58, 'LAP-1', '2019-10-15', 161, 145, 0, 'Surat Laporan'),
(79, 'LAP-2', '2020-01-30', 161, 0, 0, 'Surat Laporan'),
(81, 'PNGMN-2', '2020-01-30', 161, 0, 0, 'Surat Pengumuman'),
(83, 'REK-2', '2020-01-30', 161, 0, 0, 'Surat Rekomendasi'),
(85, 'INT-2', '2020-01-31', 161, 0, 0, 'Surat Instruksi'),
(86, 'SE-4', '2020-02-27', 473, 2, 490, 'Surat Edaran'),
(88, 'PJL-1', '2020-04-04', 161, 0, 0, 'Surat Perjalanan Dinas'),
(89, 'KSA-1', '2020-04-08', 161, 0, 0, 'Surat Kuasa'),
(90, 'MKT-1', '2020-04-04', 161, 0, 0, 'Surat Melaksanakan Tugas'),
(91, 'PGL-1', '2020-04-04', 161, 0, 0, 'Surat Panggilan'),
(92, 'NTL-1', '2020-04-04', 161, 0, 0, 'Surat Notulen'),
(93, 'MMO-1', '2020-04-05', 161, 0, 0, 'Surat Memo'),
(94, 'IZN-1', '2020-04-07', 161, 0, 0, 'Surat Izin');

-- --------------------------------------------------------

--
-- Table structure for table `eksternal_keluar`
--

CREATE TABLE `eksternal_keluar` (
  `id` varchar(15) NOT NULL,
  `opd_id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `eksternal_keluar`
--

INSERT INTO `eksternal_keluar` (`id`, `opd_id`, `nama`, `email`) VALUES
('EKS-1', 33, 'Bank Jawa Barat', 'bjb@bank.co.id'),
('EKS-2', 33, 'Bukalapak', 'cs.mitra@bukalapak.com'),
('EKS-3', 33, 'Genta Haetami Putra', 'gentahaetamiputra@gmail.com'),
('EKS-4', 33, 'GentaHP', 'gentahp12@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `informasi`
--

CREATE TABLE `informasi` (
  `id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `deskripsi` text NOT NULL,
  `file` varchar(25) NOT NULL,
  `status` enum('Tidak Publish','Publish') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `informasi`
--

INSERT INTO `informasi` (`id`, `tanggal`, `deskripsi`, `file`, `status`) VALUES
(8, '2020-01-02', 'Seleksi Beasiswa Pusbindiklaten Bappenas', '', 'Publish');

-- --------------------------------------------------------

--
-- Table structure for table `jabatan`
--

CREATE TABLE `jabatan` (
  `jabatan_id` int(11) NOT NULL,
  `opd_id` int(11) NOT NULL DEFAULT '0',
  `nama_jabatan` varchar(300) NOT NULL,
  `atasan_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jabatan`
--

INSERT INTO `jabatan` (`jabatan_id`, `opd_id`, `nama_jabatan`, `atasan_id`) VALUES
(1, 2, 'Kepala Badan Kepegawaian dan Pengembangan Sumber Daya Aparatur Kota Bogor', 0),
(2, 2, 'Sekretaris Badan Kepegawaian dan Pengembangan Sumber Daya Aparatur Kota Bogor ', 1),
(3, 2, 'Kasubag Umum dan Kepegawaian', 2),
(4, 2, 'Kasubag Perencanaan', 2),
(5, 2, 'Kepala Bidang Formasi', 2),
(6, 2, 'Kasubid Informasi dan Data Kepegawaian ', 5),
(7, 2, 'Kasubid Penatausahaan Pegawai ', 5),
(8, 2, 'Kasubid Formasi dan Pengadaan Pegawai  ', 5),
(9, 2, 'Kepala Bidang Mutasi dan Pengembangan Karir', 2),
(10, 2, 'Kasubid Kepangkatan dan Pensiun', 9),
(11, 2, 'Kasubid Penempatan dalam Jabatan', 9),
(12, 2, 'Kasubid Disiplin dan Kinerja', 9),
(13, 2, 'Kepala Bidang Pengembangan Sumber Daya Aparatur ', 2),
(14, 2, 'Kasubid Pengembangan Kompetensi', 13),
(15, 2, 'Kasubid Pendidikan dan Pelatihan Kepemimpinan', 13),
(16, 2, 'Kasubid Pendidikan dan Pelatihan Teknis dan Fungsional', 13),
(17, 36, 'Kepala Pelaksana Badan Penanggulangan Bencana Daerah Kota Bogor ', 0),
(18, 36, 'Kepala Sekretariat', 17),
(19, 36, 'Kasi Pencegahan dan Kesiapsiagaan', 18),
(20, 36, 'Kasi Kedaruratan dan Logistik', 18),
(21, 36, 'Kasi Rehabilitasi dan Rekontruksi', 18),
(22, 9, 'Plt. Kepala Badan Pendapatan Daerah Kota Bogor', 0),
(23, 9, 'Sekretaris Badan Pendapatan Daerah Kota Bogor', 22),
(24, 9, 'Kasubag Umum dan Kepegawaian', 23),
(25, 9, 'Kasubag Perencanan', 23),
(26, 9, 'Kepala Bidang Pendataan dan Pelayanan', 23),
(27, 9, 'Kasubid Pendataan', 23),
(28, 9, 'Kasubid Pendataan Pajak Daerah Lainnya ', 26),
(29, 9, 'Kasubid Pelayanan dan Konsultasi', 26),
(30, 9, 'Kepala Bidang Penetapan dan Pengolahan Data ', 23),
(31, 9, 'Kasubid Penetapan dan Verifikasi ', 30),
(32, 9, 'Kasubid Analisa dan Pengembangan', 30),
(33, 9, 'Kasubid Pengolahan Data', 30),
(34, 9, 'Kepala Bidang Penagihan dan Pengendalian', 23),
(35, 9, 'Kasubid Penyuluhan dan Keberatan', 34),
(36, 9, 'Kasubid Pengawasan dan Pemeriksaan ', 34),
(37, 9, 'Kasubid Penagihan dan Penindakan ', 34),
(38, 31, 'Kepala Badan Pengelolaan Keuangan dan Aset Daerah', 0),
(39, 31, 'Sekretaris', 38),
(40, 31, 'Kasubag Umum dan Kepegawaian', 39),
(41, 31, 'Kasubag Keuangan', 39),
(42, 31, 'Kepala Bidang Anggaran', 39),
(43, 31, 'Kasubid Penyusunan Anggaran', 42),
(44, 31, 'Kasubid Administrasi Anggaran', 42),
(45, 31, 'Kasubid Kebijakan dan Perencanaan Anggaran', 42),
(46, 31, 'Kepala Bidang Perbendaharaan dan Akuntansi', 39),
(47, 31, 'Kasubid Akuntansi ', 46),
(48, 31, 'Kasubid Belanja Langsung dan Kas Daerah', 46),
(49, 31, 'Kasubid Belanja Tidak Langsung dan Pembiayaan', 46),
(50, 31, 'Kepala Bidang Aset ', 39),
(51, 31, 'Kasubid Penatausahaan Aset ', 50),
(52, 31, 'Kasubid Perencanaan dan Pemanfaatan Aset ', 50),
(53, 31, 'Kasubid Pemindahtanganan dan Pengamanan Aset', 50),
(54, 5, 'Kepala Badan Perencanaan Pembangunan Daerah Kota Bogor', 0),
(55, 5, 'Sekretaris Badan Perencanaan Pembangunan Daerah Kota Bogor', 54),
(56, 5, 'Kasubag Umum dan Kepegawaian', 55),
(57, 5, 'Kasubag Keuangan ', 55),
(58, 5, 'Kasubag Perencanan dan Pelaporan', 55),
(59, 5, 'Kepala Bidang Perencanaan', 55),
(60, 5, 'Kasubid Data dan Informasi', 59),
(61, 5, 'Kasubid Perencanaan Pendanaan', 59),
(62, 5, 'Kasubid Evaluasi Pengendalian dan Pelaporan', 59),
(63, 5, 'Kepala Bidang Perencanaan', 55),
(64, 5, 'Kasubid Perencanaan Pemerintahan ', 63),
(65, 5, 'Kasubid Perencanaan Sosial dan Budaya ', 63),
(66, 5, 'Kasubid Perencanaan Ekonomi dan Pemberdayaan Masyaraka', 63),
(67, 5, 'Kepala Bidang Perencanaan Pengembangan Wilayah ', 55),
(68, 5, 'Kasubid Perencanaan Tata Ruang dan Lingkungan Hidup ', 67),
(69, 5, 'Kasubid Perencanaan Perumahan dan Permukiman', 67),
(70, 5, 'Kasubid Perencanaan Sarana Prasarana dan Infrastruktur', 67),
(71, 5, 'Kepala Bidang Penelitian dan Pengembangan', 55),
(72, 5, 'Kasubid Penelitian dan Pengembangan Inovasi dan Teknologi ', 71),
(73, 5, 'Kasubid Penelitian dan Pengembangan Ekonomi dan Pembangunan', 71),
(74, 5, 'Kasubid Penelitian dan Pengembangan Sosial Budaya dan Pemerintahan', 71),
(75, 14, 'Kepala Dinas Kearsipan dan Perpustakaan Kota Bogor', 0),
(76, 14, 'Sekretaris Dinas Kearsipan dan Perpustakaan Kota Bogor', 75),
(77, 14, 'Kasubag Umum dan Kepegawaian Dinas Kearsipan dan Perpustakaan Kota Bogor', 76),
(78, 14, 'Plt. Kasubag Keuangan', 76),
(79, 14, 'Kepala Bidang Pengelolaan Kearsipan', 76),
(80, 14, 'Kasi Pengelolaan Arsip Dinamis', 79),
(81, 14, 'Kasi Pengelolaan Arsip Statis ', 79),
(82, 14, 'Kepala Bidang Perpustakaan', 76),
(83, 14, 'Kasi Pengadaan', 82),
(84, 14, 'Kasi Layanan', 82),
(85, 14, 'Kasi Pembinaan Perpustakaan dan Pengembangan Minat Baca', 82),
(86, 14, 'Kepala Bidang Pembinaan dan Layanan Kearsipan ', 76),
(87, 14, 'Kasi Otomasi', 86),
(88, 14, 'Kasi Pembinaan Kearsipan', 86),
(89, 7, 'Kepala Dinas Kependudukan dan Pencatatan Sipil Kota Bogor ', 0),
(90, 7, 'Sekretaris Dinas Kependudukan dan Pencatatan Sipil Kota Bogor', 89),
(91, 7, 'Kasubag Umum dan Kepegawaian', 90),
(92, 7, 'Kasubag Perencanaan dan Keuangan', 90),
(93, 7, 'Kepala Bidang Pelayanan Pendaftaran Penduduk ', 90),
(94, 7, 'Kasi Identitas Penduduk', 93),
(95, 7, 'Kasi Pindah Datang Penduduk', 93),
(96, 7, 'Kasi Pendataan Kependudukan', 93),
(97, 7, 'Kepala Bidang Pelayanan Pencatatan Sipil', 90),
(98, 7, 'Kasi Kelahiran', 97),
(99, 7, 'Kasi Perkawinan dan Perceraian', 97),
(100, 7, 'Kasi Perubahan Status Anak', 97),
(101, 7, 'Kepala Bidang Penyajian Informasi Administrasi Kependudukan dan Pemanfaatan Data ', 90),
(102, 7, 'Kasi Pengolahan dan Penyajian Data Kependudukan', 101),
(103, 7, 'Kasi Sistem Informasi Administrasi Kependudukan', 101),
(104, 7, 'Kasi Kerjasama dan Inovasi Pelayanan ', 101),
(105, 8, 'Kepala Dinas Kesehatan Kota Bogor ', 0),
(106, 8, 'Sekretaris Dinas Kesehatan Kota Bogor ', 105),
(107, 8, 'Kasubag Umum dan Kepegawaian', 106),
(108, 8, 'Kasubag Keuangan dan Aset ', 106),
(109, 8, 'Kasubag Perencanan dan Pelaporan ', 106),
(110, 8, 'Kepala Bidang Kesehatan Masyarakat ', 106),
(111, 8, 'Kasi Kesehatan Keluarga', 110),
(112, 8, 'Kasi Promosi dan Pemberdayaan Masyarakat', 110),
(113, 8, 'Kasi Pembinaan dan Pelayanan Gizi', 110),
(114, 8, 'Kepala Bidang Pencegahan dan Pengendalian Penyakit ', 106),
(115, 8, 'Kasi Pencegahan dan Pengendalian Penyakit Menular dan Surveilan ', 114),
(116, 8, 'Kasi Pencegahan dan Pengendalian Penyakit Tidak Menular', 114),
(117, 8, 'Kasi Penyehatan Lingkungan dan Kesehatan Kerja ', 114),
(118, 8, 'Kepala Bidang Sumber Daya Kesehatan ', 106),
(119, 8, 'Kasi Perbekalan Kesehatan', 118),
(120, 8, 'Kasi Informasi Kesehatan dan Humas ', 118),
(121, 8, 'Kasi Pengembangan Sumber Daya Manusia Kesehatan ', 118),
(122, 8, 'Kepala Bidang Pelayanan Kesehatan ', 106),
(123, 8, 'Kasi Pelayanan Kesehatan Primer dan Tradisional', 122),
(124, 8, 'Kasi Pelayanan Kesehatan Rujukan dan Jaminan Kesehatan ', 122),
(125, 8, 'Kasi Pembinaan', 122),
(126, 8, 'Kepala UPTD Laboratorium Kesehatan Daerah (LABKESDA)', 106),
(127, 8, 'Kasubag Tata Usaha Laboratorium Kesehatan Daerah (LABKESDA) ', 126),
(128, 16, 'Plt. Kepala Dinas Ketahanan Pangan Kota Bogor', 0),
(129, 16, 'Sekretaris Dinas Ketahanan Pangan Kota Bogor', 128),
(130, 16, 'Kasubag Umum dan Kepegawaian', 129),
(131, 16, 'Kasubag Keuangan ', 129),
(132, 16, 'Kasubag Perencanaan dan Pelaporan', 129),
(133, 16, 'Kepala Bidang Ketersediaan dan Kerawanan Pangan ', 129),
(134, 16, 'Kasi Ketersediaan Sumber Daya Pangan ', 133),
(135, 16, 'Kasi Kerawanan Pangan', 133),
(136, 16, 'Kepala Bidang Distribusi dan Cadangan Pangan ', 129),
(137, 16, 'Kasi Distribusi dan Harga Pangan', 136),
(138, 16, 'Kasi Cadangan Pangan', 136),
(139, 16, 'Kepala Bidang Konsumsi Pangan ', 129),
(140, 16, 'Kasi Pengembangan Pangan Lokal', 139),
(141, 16, 'Kasi Konsumsi dan Penganekaragaman Pangan', 139),
(142, 16, 'Kepala Bidang Keamanan Pangan ', 129),
(143, 16, 'Kasi Pengawasan Keamanan Pangan ', 142),
(144, 16, 'Kasi Kerjasama dan Informasi Keamanan Pangan ', 142),
(145, 33, 'Plt. Kepala Dinas Komunikasi dan Informatika Kota Bogor', 0),
(146, 33, 'Sekretaris Dinas Komunikasi dan Informatika Kota Bogor', 145),
(147, 33, 'Kasubbag Keuangan ', 146),
(148, 33, 'Kasubbag Perencanaan dan Pelaporan ', 146),
(149, 33, 'Kasubbag Umum dan Kepegawaian', 146),
(150, 33, 'Kepala Bidang Komunikasi dan Informasi Publik ', 146),
(151, 33, 'Kasi Pengelolaan Informasi Publik ', 150),
(152, 33, 'Kasi Kemitraan Media Publik', 150),
(153, 33, 'Kasi Pengelolaan Komunikasi Publik ', 150),
(154, 33, 'Kepala Bidang Teknologi Informasi ', 146),
(155, 33, 'Kasi Keamanan Informasi dan Persandian', 154),
(156, 33, 'Kasi Infrastruktur Jaringan', 154),
(157, 33, 'Kasi Infrastruktur Pusat Data', 154),
(158, 33, 'Kepala Bidang Layanan e-Government ', 146),
(160, 33, 'Kasi Tata Kelola e-Government', 158),
(161, 33, 'Kasi Pengembangan Aplikasi dan Sistem Integrasi ', 158),
(162, 33, 'Kepala Bidang Statistik Sektoral ', 146),
(163, 33, 'Kasi Kompilasi Data ', 162),
(164, 33, 'Kasi Pengolahan Data ', 162),
(165, 33, 'Kasi Penyajian Data ', 162),
(166, 32, 'Kepala Dinas Koperasi', 0),
(167, 32, 'Sekretaris Dinas Koperasi', 0),
(168, 32, 'Kasubag Umum dan Kepegawaian', 167),
(169, 32, 'Kasubag Perencanaan', 0),
(170, 32, 'Kasubag Perencanaan', 0),
(171, 32, 'Kepala Bidang Koperasi', 167),
(172, 32, 'Kasi Kelembagaan Koperasi', 171),
(173, 32, 'Kasi Usaha Koperasi ', 171),
(174, 32, 'Kepala Bidang Usaha Mikro', 0),
(175, 32, 'Plt. Kasi Produksi dan Pemasaran UMKM ', 174),
(176, 32, 'Kasi Kemitraan dan Pembiayaan', 0),
(177, 32, 'Kasi Pengembangan dan Penguatan Usaha Usaha Mikro Kecil dan Menengah ', 174),
(178, 32, 'Kepala Bidang Pedagang Kaki Lima ', 167),
(179, 32, 'Kasi Pemberdayaan Pedagang Kaki Lima ', 178),
(180, 32, 'Kasi Penataan Pedagang kaki Lima ', 178),
(181, 32, 'Kasi Pengawasan Pedagang Kaki Lima ', 178),
(182, 17, 'Kepala Dinas Lingkungan Hidup Kota Bogor', 0),
(183, 17, 'Sekretaris Dinas Lingkungan Hidup Kota Bogor', 182),
(184, 17, 'Kasubag Umum dan Kepegawaian', 183),
(185, 17, 'Kasubag Keuangan ', 183),
(186, 17, 'Kasubag Perencanan dan Pelaporan', 183),
(187, 17, 'Kepala Bidang Tata Lingkungan', 183),
(188, 17, 'Kasi Perencanaan Lingkungan ', 187),
(189, 17, 'Kasi Pencegahan Dampak Lingkungan ', 187),
(190, 17, 'Kasi Kemitraan dan Peningkatan Kapasitas', 187),
(191, 17, 'Kepala Bidang Pengendalian Pencemaran Lingkungan', 0),
(192, 17, 'Kasi Pengendalian Pencemaran Air', 0),
(193, 17, 'Kasi Pengendalian Pencemaran Limbah Bahan Berbahaya dan Racun (B3)', 191),
(194, 17, 'Kasi Konservasi Lingkungan dan Perubahan Iklim ', 191),
(195, 17, 'Kepala Bidang Persampahan', 187),
(196, 17, 'Kasi Penyapuan ', 195),
(197, 17, 'Kasi Pengangkutan ', 195),
(198, 17, 'Kasi Pengembangan Teknologi Penanggulangan Sampah', 195),
(199, 17, 'Kepala Bidang Pengawasan Dan Penegakan Hukum Lingkungan ', 183),
(200, 17, 'Kasi Pengawasan dan Penegakan Hukum Wilayah I ', 199),
(201, 17, 'Kasi Pengawasan dan Penegakan Hukum Wilayah II ', 199),
(202, 17, 'Kasi Pengawasan dan Penegakan Hukum Wilayah III', 199),
(203, 17, 'Kepala UPTD Tempat Pemrosesan Akhir Sampah', 183),
(204, 17, 'Kasubag Tata Usaha UPTD Tempat Pemrosesan Akhir Sampah', 203),
(205, 6, 'Kepala Dinas Pariwisata dan Kebudayaan Kota Bogor ', 0),
(206, 6, 'Sekretaris Dinas Pariwisata dan Kebudayaan Kota Bogor ', 205),
(207, 6, 'Kasubag Umum dan Kepegawaian ', 206),
(208, 6, 'Kasubag Keuangan ', 206),
(209, 6, 'Kasubag Perencanaan dan Pelaporan', 206),
(210, 6, 'Kepala Bidang Kebudayaan', 206),
(211, 6, 'Kasi Pemeliharaan dan Pengembangan Sastra', 210),
(212, 6, 'Kasi Pelestarian dan Pengembangan Sejarah Serta Nilai Tradisional', 210),
(213, 6, 'Kasi Cagar Budaya dan Permuseuman ', 210),
(214, 6, 'Kepala Bidang Kepariwisataan', 206),
(215, 6, 'Kasi Analisa Data', 214),
(216, 6, 'Kasi Promosi Pariwisata', 214),
(217, 6, 'Kasi Sarana', 214),
(218, 6, 'Kepala Bidang Ekonomi Kreatif ', 206),
(219, 6, 'Kasi Kemitraan dan Pengembangan Ekonomi Kreatif ', 218),
(220, 6, 'Kasi Sarana dan Prasarana Ekonomi Kreatif ', 218),
(221, 6, 'Kasi Pemasaran Ekonomi Kreatif ', 218),
(222, 6, 'Kepala Bidang Kesenian ', 206),
(223, 6, 'Kasi Seni Tradisi ', 222),
(224, 6, 'Kasi Pengembangan Seni dan Kelembagaan', 222),
(225, 6, 'Kasi Sarana dan Prasarana Seni ', 222),
(226, 30, 'Kepala Dinas Pekerjaan Umum dan Penataan Ruang Kota Bogor ', 0),
(227, 30, 'Sekretaris Dinas Pekerjaan Umum dan Penataan Ruang Kota Bogor ', 226),
(228, 30, 'Kasubag Umum dan Kepegawaian', 227),
(229, 30, 'Kasubag Keuangan', 0),
(230, 30, 'Plt. Kepala Bidang Pemeliharaan Kebinamargaan ', 227),
(231, 30, 'Kasi Pemeliharaan Kebinamargaan Wilayah II', 230),
(232, 30, 'Kasi Pemeliharaan Kebinamargaan Wilayah III', 230),
(233, 30, 'Kasi Pemeliharaan Kebinamargaan Wilayah I', 230),
(234, 30, 'Kepala Bidang Sumber Daya Air ', 227),
(235, 30, 'Kasi Sumber Daya Air Wilayah I', 234),
(236, 30, 'Kasi Air Minum dan Air Limbah ', 234),
(237, 30, 'Kasi Sumber Daya Air Wilayah II', 234),
(238, 30, 'Kepala Bidang Infrastruktur Pemukiman', 227),
(239, 30, 'Kasi Infrastruktur Pemukiman Wilayah I ', 238),
(240, 30, 'Kasi Infrastruktur Pemukiman Wilayah II ', 238),
(241, 30, 'Kasi Infrastruktur Pemukiman Wilayah III ', 238),
(242, 30, 'Kepala Bidang Pembangunan Kebinamargaan', 227),
(243, 30, 'Kasi Pembangunan Kebinamargaan Wilayah I', 242),
(244, 30, 'Kasi Pembangunan Kebinamargaan Wilayah II', 242),
(245, 30, 'Kasi Pembangunan Kebinamargaan Wilayah III', 242),
(246, 30, 'Kepala UPTD Pengelolaan Air Limbah', 227),
(247, 30, 'Kasubag Tata Usaha UPTD Pengelolaan Air Limbah ', 246),
(248, 30, 'Kepala Bidang Tata Ruang', 0),
(249, 30, 'Kasi Tata Ruang dan Jasa Konstruksi', 248),
(250, 30, 'Kasi Tata Bangunan', 0),
(251, 30, 'Kasi Perencanaan ', 248),
(252, 4, 'Kepala Dinas Pemberdayaan Masyarakat', 0),
(253, 4, 'Sekretaris Dinas Pemberdayaan Masyarakat', 252),
(254, 4, 'Kasubag Umum dan Kepegawaian', 253),
(255, 4, 'Kasubag Keuangan ', 253),
(256, 4, 'Kasubag Perencanaan dan Pelaporan', 253),
(257, 4, 'Kepala Bidang Penguatan Kelembagaan dan Peningkatan Partisipasi Masyarakat ', 253),
(258, 4, 'Kasi Peningkatan Partisipasi Masyarakat ', 257),
(259, 4, 'Kasi Penguatan Kelembagaan dan Pemberdayaan Masyarakat', 257),
(260, 4, 'Kepala Bidang Pemberdayaan Usaha Ekonomi Masyarakat dan Teknologi Tepat Guna', 253),
(261, 4, 'Kasi Pemberdayaan Usaha Ekonomi Masyarakat', 260),
(262, 4, 'Kasi Pendayagunaan Sumberdaya dan Teknologi Tepat Guna ', 260),
(263, 4, 'Kepala Bidang Peningkatan Kualitas Hidup Perempuan ', 253),
(264, 4, 'Kasi Pemberdayaan Perempuan', 263),
(265, 4, 'Kasi Pengarusutamaan Gender', 263),
(266, 4, 'Kepala Bidang Pemenuhan Hak Anak ', 253),
(267, 4, 'Kasi Kesejahteraan Anak', 266),
(268, 4, 'Kasi Pengembangan Kota Layak Anak ', 266),
(269, 21, 'Kepala Dinas Pemuda dan Olahraga Kota Bogor', 0),
(270, 21, 'Sekretaris Dinas Pemuda dan Olahraga Kota Bogor', 269),
(271, 21, 'Kasubag Perencanaan dan Pelaporan', 270),
(272, 21, 'Kasubag Keuangan ', 270),
(273, 21, 'Kasubag Umum dan Kepegawaian', 270),
(274, 21, 'Plt. Kepala Bidang Pemberdayaan dan Pengembangan Pemuda', 270),
(275, 21, 'Kasi Organisasi Kepemudaan', 0),
(276, 21, 'Kasi Peningkatan Wawasan', 0),
(277, 21, 'Kasi Kepemimpinan', 0),
(278, 21, 'Kepala Bidang Sarana Prasarana Olahraga dan Pemuda', 270),
(279, 21, 'Kasi Sarana dan Prasarana Kepemudaan', 278),
(280, 21, 'Kasi Sarana dan Prasarana Olahraga ', 278),
(281, 21, 'Kepala Bidang Pembudayaan Olahraga ', 270),
(282, 21, 'Kasi Olahraga Pendidikan dan Sentra Olahraga', 281),
(283, 21, 'Kasi Olahraga Rekreasi Masyarakat dan Layanan Khusus ', 281),
(284, 21, 'Kasi Kemitraan dan Penghargaan Olahraga', 281),
(285, 21, 'Kepala Bidang Peningkatan Prestasi Olahraga ', 270),
(286, 21, 'Kasi Pembibitan dan Tenaga Keolahragaan ', 285),
(287, 21, 'Kasi Promosi Olahraga dan Prestasi', 285),
(288, 3, 'Kepala Dinas Penanaman Modal dan Pelayanan Terpadu Satu Pintu Kota Bogor', 0),
(289, 3, 'Sekretaris Dinas Penanaman Modal dan Pelayanan Terpadu Satu Pintu Kota Bogor', 288),
(290, 3, 'Kasubag Umum dan Kepegawaian', 289),
(291, 3, 'Kasubag Keuangan ', 289),
(292, 3, 'Kasubag Perencanaan dan Pelaporan', 289),
(293, 3, 'Kepala Bidang Promosi Penanaman Modal dan Sistem Informasi', 289),
(294, 3, 'Kasi Data dan Teknologi Informasi ', 293),
(295, 3, 'Kasi Pengembangan Potensi Penanaman Modal', 293),
(296, 3, 'Kasi Promosi dan Sosialisasi ', 293),
(297, 3, 'Kepala Bidang Pelayanan Penanaman Modal ', 289),
(298, 3, 'Kasi Pelayanan Investasi ', 297),
(299, 3, 'Kasi Regulasi dan Pengaduan', 297),
(300, 3, 'Kasi Pengendalian dan Pelaksanaan ', 297),
(301, 3, 'Kepala Bidang Izin Operasional ', 289),
(302, 3, 'Kasi Verifikasi Izin Operasional ', 301),
(303, 3, 'Kasi Pengolah Izin Sosial dan Ekonomi ', 301),
(304, 3, 'Kasi Pengolah Izin kePUAan dan Lingkungan', 301),
(305, 3, 'Kepala Bidang Izin Pemanfaatan Ruang ', 289),
(306, 3, 'Kasi Verifikasi Izin Pemanfaatan Ruang ', 305),
(307, 3, 'Kasi Pengolah Izin Pemanfaatan Ruang ', 305),
(308, 3, 'Kasi Perencanaan Teknis', 305),
(309, 1, 'Kepala Dinas Pendidikan Kota Bogor', 0),
(310, 1, 'Sekretaris Dinas Pendidikan Kota Bogor ', 309),
(311, 1, 'Kasubag Umum dan Kepegawaian ', 310),
(312, 1, 'Kasubag Keuangan ', 310),
(313, 1, 'Kasubag Perencanaan dan Pelaporan ', 310),
(314, 1, 'Kepala Bidang Sekolah Dasar', 310),
(315, 1, 'Kasi Kurikulum Sekolah Dasar ', 314),
(316, 1, 'Kasi Kesiswaan Sekolah Dasar', 314),
(317, 1, 'Kasi Bina Profesi Sekolah Dasar', 314),
(318, 1, 'Kepala Bidang Sekolah Menengah Pertama', 310),
(319, 1, 'Kasi Kurikulum Sekolah Menengah Pertama', 318),
(320, 1, 'Kasi Kesiswaan Sekolah Menengah Pertama ', 318),
(321, 1, 'Kasi Bina Profesi Sekolah Menengah Pertama', 318),
(322, 1, 'Kepala Bidang Pendidikan Anak Usia Dini dan Pendidikan Masyarakat', 310),
(323, 1, 'Kasi Pendidikan Anak Usia Dini ', 322),
(324, 1, 'Kasi Pendidikan Kesetaraan ', 322),
(325, 1, 'Kasi Kursus dan Kelembagaan ', 322),
(326, 1, 'Kepala Bidang Sarana dan Prasarana', 310),
(327, 1, 'Kasi Sarana dan Prasarana Sekolah Dasar dan Taman Kanak-kanak', 326),
(328, 1, 'Kasi Sarana dan Prasarana Sekolah Menengah Pertama ', 326),
(329, 1, 'Kasi Pengelolaan Sarana dan Prasarana ', 326),
(330, 38, 'Kepala Dinas Pengendalian Penduduk dan Keluarga Berencana ', 0),
(331, 38, 'Kepala Bidang Pengendalian Penduduk', 0),
(332, 38, 'Kasi Pengendalian Penduduk dan Informasi Keluarga ', 331),
(333, 38, 'Kasi Advokasi', 0),
(334, 38, 'Kepala Bidang Keluarga Berencana ', 340),
(335, 38, 'Kasi Pembinaan Kesertaan Keluarga Berencana', 334),
(336, 38, 'Kasi Jaminan Pelayanan Keluarga Berencana ', 334),
(337, 38, 'Kepala Bidang Ketahanan dan Kesejahteraan Keluarga', 340),
(338, 38, 'Kasi Ketahanan Keluarga', 0),
(339, 38, 'Kasi Pemberdayaan Keluarga Sejahtera ', 337),
(340, 38, 'Sekretaris Dinas Pengendalian Penduduk dan Keluarga Berencana ', 330),
(341, 38, 'Kasubag Umum dan Kepegawaian', 340),
(342, 38, 'Kasubag Perencanan Keuangan dan Pelaporan', 340),
(343, 10, 'Kepala Dinas Perhubungan Kota Bogor', 0),
(344, 10, 'Sekretaris Dinas Perhubungan Kota Bogor', 343),
(345, 10, 'Kasubag Umum dan Kepegawaian', 344),
(346, 10, 'Kasubag Perencanaan', 344),
(347, 10, 'Kepala Bidang Lalu Lintas ', 346),
(348, 10, 'Kasi Manajemen Lalu Lintas', 347),
(349, 10, 'Kasi Rekayasa Lalu Lintas', 347),
(350, 10, 'Kasi Pengendalian dan Ketertiban ', 347),
(351, 10, 'Kepala Bidang Angkutan', 344),
(352, 10, 'Kasi Angkutan Dalam Trayek', 351),
(353, 10, 'Kasi Angkutan Tidak Dalam Trayek', 351),
(354, 10, 'Kasi Komunikasi', 351),
(355, 10, 'Kepala Bidang Sarana dan Prasarana', 344),
(356, 10, 'Kasi Teknik Prasarana ', 355),
(357, 10, 'Kasi Perparkiran ', 355),
(358, 10, 'Kasi Pengujian Kendaraan Bermotor ', 355),
(359, 10, 'Kepala UPTD Terminal dan Angkutan', 344),
(360, 10, 'Kasubag Tata Usaha UPTD Terminal dan Angkutan', 359),
(361, 11, 'Kepala Dinas Perindustrian dan Perdagangan Kota Bogor ', 0),
(362, 11, 'Sekretaris Dinas Perindustrian dan Perdagangan Kota Bogor', 361),
(363, 11, 'Kasubag Umum dan Kepegawaian', 362),
(454, 33, 'Pengolah Data pada Seksi Pengembangan Aplikasi dan Sistem Integrasi', 161),
(365, 11, 'Kasubag Perencanan dan Pelaporan', 362),
(366, 11, 'Kepala Bidang Perindustrian', 362),
(367, 11, 'Kasi Industri Makanan dan Minuman', 366),
(368, 11, 'Kasi Industri Logam Mesin', 366),
(369, 11, 'Kasi Industri Kimia', 366),
(370, 11, 'Kepala Bidang Sarana dan Komoditi Perdagangan ', 362),
(371, 11, 'Kasi Bina Usaha Pasar Rakyat dan Swalayan', 370),
(372, 11, 'Kasi Barang Pokok dan Barang Penting ', 370),
(373, 11, 'Kasi Distribusi dan Pergudangan', 370),
(374, 11, 'Kepala Bidang Promosi', 362),
(375, 11, 'Kasi Promosi dan Pengembangan Ekspor ', 374),
(376, 11, 'Kasi Kemitraan dan Peningkatan Penggunaan Produk Dalam Negeri ', 374),
(377, 11, 'Kasi Perdagangan Jasa', 374),
(378, 11, 'Kepala Bidang Tertib Niaga', 362),
(379, 11, 'Kasi Tertib Niaga ', 378),
(380, 11, 'Kasi Pengendalian ', 378),
(381, 11, 'Kepala UPTD Metrologi Legal', 362),
(382, 11, 'Kepala Sub Bagian Tata Usaha UPTD Metrologi Legal', 381),
(383, 12, 'Kepala Dinas Pertanian Kota Bogor ', 0),
(384, 12, 'Sekretaris Dinas Pertanian Kota Bogor ', 383),
(385, 12, 'Kasubag Umum dan Kepegawaian ', 384),
(386, 12, 'Kasubag Keuangan', 0),
(387, 12, 'Kepala Bidang Peternakan', 384),
(388, 12, 'Kasi Pembibitan dan Produksi Ternak ', 387),
(389, 12, 'Kasi Kesehatan Masyarakat Veteriner', 0),
(390, 12, 'Kasi Kesehatan Hewan', 387),
(391, 12, 'Kepala Bidang Perikanan', 384),
(392, 12, 'Kasi Produksi dan Kesehatan Ikan', 391),
(393, 12, 'Kasi Pengolahan dan Pemasaran Hasil Perikanan ', 391),
(394, 12, 'Kasi Sarana dan Prasaranan Perikanan ', 391),
(395, 12, 'Kepala Bidang Penyuluhan', 384),
(396, 12, 'Kasi Kelembagaan ', 395),
(397, 12, 'Kasi Pengembangan Sumber Daya Manusia Pertanian', 395),
(398, 12, 'Kasi Metode dan Informasi Pertanian ', 395),
(399, 12, 'Kepala Bidang Tanaman Pangan dan Hortikultura', 384),
(400, 12, 'Kasi Sarana dan Prasarana Tanaman Pangan dan Hortikultura ', 399),
(401, 12, 'Kasi Produksi dan Perlindungan Tanaman Pangan dan Hortikultura', 399),
(402, 12, 'Kasi Pengolahan dan Pemasaran Hasil Tanaman Pangan dan Hortikultura', 399),
(403, 12, 'Kepala UPTD Rumah Potong Hewan Terpadu', 384),
(404, 12, 'Kasubag Tata Usaha UPTD Rumah Potong Hewan Terpadu ', 403),
(405, 13, 'Kepala Dinas Sosial Kota Bogor ', 0),
(484, 13, 'Kasi Rehabilitasi Penyandang Disabilitas, Kesejahteraan Anak, Lanjut Usia, Perdagangan Orang dan Korban Tindak Kekerasan', 413),
(407, 13, 'Kasubag Umum dan Kepegawaian', 406),
(408, 13, 'Kasubag Keuangan ', 406),
(409, 13, 'Kasubag Perencanan dan Pelaporan ', 406),
(410, 13, 'Kepala Bidang Perlindungan Sosial Keluarga dan Penanganan Fakir Miskin ', 406),
(411, 13, 'Kasi Penanganan Fakir Miskin dan Jaminan Sosial Keluarga ', 410),
(412, 13, 'Kasi Perlindungan Orang Terlantar dan Korban Bencana ', 410),
(413, 13, 'Kepala Bidang Rehabilitasi Sosial ', 406),
(414, 13, 'Kasi Rehabilitasi Penyandang Disabilitas', 413),
(415, 13, 'Kasi Rehabilitasi Tuna Sosial dan Penyandang Masalah Kesejahteraan Sosial Lainnya ', 413),
(416, 13, 'Kepala Bidang Pemberdayaan Sosial ', 406),
(417, 13, 'Kasi Pemberdayaan Kelembagaan Sosial ', 416),
(418, 13, 'Kasi Kepahlawanan', 416),
(419, 13, 'Kepala Bidang Data', 416),
(420, 13, 'Kasi Data dan Informasi Penyelenggaraan Kesejahteraan Sosial ', 419),
(421, 13, 'Kasi Penyuluhan Sosial dan Pengumpulan', 419),
(422, 37, 'Kepala Dinas Tenaga Kerja dan Transmigrasi Kota Bogor', 0),
(423, 37, 'Sekretaris Dinas Tenaga Kerja dan Transmigrasi Kota Bogor', 422),
(424, 37, 'Kasubag Umum dan Kepegawaian ', 423),
(425, 37, 'Kasubag Keuangan', 0),
(426, 37, 'Plt. Kepala Bidang Pelatihan', 0),
(427, 37, 'Kasi Pelatihan dan Kelembagaan Pelatihan', 426),
(428, 37, 'Kasi Pemagangan dan Produktifitas ', 426),
(429, 37, 'Kepala Bidang Penempatan', 0),
(430, 37, 'Kasi Penempatan Tenaga Kerja dan Informasi Pasar Kerja ', 429),
(431, 37, 'Kasi Perluasan Kerja dan Transmigrasi ', 429),
(432, 37, 'Kepala Bidang Hubungan Industrial dan Kelembagaan ', 423),
(434, 37, 'Kasi Hubungan Industrial dan Syarat Kerja', 432),
(435, 37, 'Kepala UPTD Balai Latihan Kerja', 423),
(436, 34, 'Plt. Inspektur Kota Bogor', 0),
(437, 34, 'Sekretaris Inspektorat Kota Bogor ', 436),
(438, 34, 'Kasubag Administrasi Umum dan Keuangan', 437),
(439, 34, 'Kasubag Perencanaan', 0),
(440, 34, 'Inspektur Pembantu I ', 437),
(441, 34, 'Inspektur Pembantu II ', 437),
(442, 34, 'Inspektur Pembantu III', 437),
(443, 15, 'Kepala Kantor Kesatuan Bangsa dan Politik Kota Bogor ', 0),
(444, 15, 'Kasubag Tata Usaha', 443),
(445, 15, 'Kasi Pembauran ', 443),
(446, 15, 'Kasi Penanganan Masalah Strategis', 443),
(447, 15, 'Kasi Pembinaan Politik ', 443),
(493, 14, 'Admin Diskarpus', 0),
(494, 13, 'Admin Dinsos', 0),
(495, 13, 'Admin Tata Usaha Dinas Sosial Kota Bogor', 405),
(451, 0, 'Super Admin', 0),
(455, 33, 'Analis Sistem Informasi', 161),
(456, 33, 'Pengelola Situs/Web', 161),
(457, 33, 'Admin Kominfo', 0),
(458, 33, 'Analisis Berita', 151),
(459, 33, 'Pengelola Pemanfaatan Barang Milik Daerah', 149),
(460, 33, 'Analisis Perencanaan, Evaluasi dan Pelaporan', 148),
(461, 33, 'Pengelola Data', 153),
(462, 33, 'Pranata Komputer', 145),
(463, 33, 'Bendahara', 147),
(464, 33, 'Operator Sandi dan Telekomunikasi', 155),
(465, 33, 'Pengelolaan Pemanfaatan Barang Milik Daerah', 149),
(466, 33, 'Pengelola TV dan Radio', 152),
(467, 33, 'Pengolah Data pada Seksi Infrastruktur Pusat Data', 157),
(468, 33, 'Pengolah Data pada Seksi Kompilasi Data', 163),
(472, 33, 'Kasubag Umum dan Kepegawaian Dinas Komunikasi dan Informatika Kota Bogor', 146),
(473, 33, 'Kasubag Keuangan', 146),
(474, 33, 'Kasubag Perencanaan dan Pelaporan', 146),
(475, 33, 'Kasi Pengembangan Ekosistem E-government', 158),
(476, 14, 'Kasubag Keuangan, Perencanan dan Pelaporan', 76),
(477, 14, 'Kasi Pengadaan, Pengolahan dan Pelestarian Bahan Perpustakaan', 82),
(478, 14, 'Kasi Layanan, Otomasi dan Jaringan Informasi', 82),
(479, 14, 'Kasi Otomasi, Layanan dan Pemanfaatan Arsip', 86),
(480, 14, 'Arsiparis Penyelia', 75),
(481, 14, 'Pustakawan Pelaksana', 75),
(482, 13, 'Sekretaris Dinas Sosial Kota Bogor', 405),
(483, 13, 'Kepala Bidang Data, Informasi dan Penyuluhan Kesejahteraan Sosial', 482),
(485, 13, 'Kasi Kepahlawanan, Keperintisan dan Restorasi Sosial', 416),
(486, 13, 'Kasi Penyuluhan Sosial dan Pengumpulan, Pengawasan Undian dan Sumbangan Sosial', 483),
(487, 13, 'Penyuluh Sosial Pertama', 405),
(488, 13, 'Kasubag Keuangan', 482),
(490, 33, 'Admin Tata Usaha Dinas Komunikasi dan Informatika', 145),
(491, 33, 'Pengelola Rumah Tangga', 472),
(492, 14, 'Admin Tata Usaha Dinas Kearsipan dan Perpustakaan Kota Bogor', 75);

-- --------------------------------------------------------

--
-- Table structure for table `kode_surat`
--

CREATE TABLE `kode_surat` (
  `kodesurat_id` int(11) NOT NULL,
  `kode` varchar(50) DEFAULT NULL,
  `tentang` varchar(500) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kode_surat`
--

INSERT INTO `kode_surat` (`kodesurat_id`, `kode`, `tentang`) VALUES
(1, '000', 'UMUM '),
(2, '001', 'Lambang'),
(3, '001.1', 'Garuda'),
(4, '001.2', 'Bendera Kebangsaan'),
(5, '001.3', '-'),
(6, '001.4', 'Daerah'),
(7, '001.41', 'Daerah Tingkat I'),
(8, '001.42', 'Daerah Tingkat II'),
(9, '002', 'Tanda kehormatan/Penghargaan untuk Pegawai lihat 861.1'),
(10, '002.1', 'Bintang '),
(11, '002.2', 'Satyalencana'),
(12, '002.3', 'Samkarya Nugraha'),
(13, '002.4', 'Monumen'),
(14, '002.5', 'Penghargaan Secara adat'),
(15, '002.6', 'Penghargaan lain'),
(16, '003', 'Hari Raya/Besar'),
(17, '003.1', 'Nasional 17 Agustus,Hari pahlawan dsb'),
(18, '003.2', 'Keagaman Idul Fitri'),
(19, '003.3', 'Hari Ulang Tahun (HUT)'),
(20, '003.4', 'Hari jadi'),
(21, '004', 'Ucapan Terima Kasih/Selamat,Belasungkawa'),
(22, '005', 'Undangan'),
(23, '006', 'Tanda Jabatan'),
(24, '006.1', 'Pamong Praja'),
(25, '006.2', 'Pejabat lain'),
(26, '007', '-'),
(27, '008', '-'),
(28, '009', '-'),
(29, '010', 'URUSAN DALAM'),
(30, '011', 'Gedung Kantor Termasuk Instalansi,Prasarana fisik pamong Praja'),
(31, '012', 'Rumah Dinas '),
(32, '012.1', 'Tanah untuk Rumah Dinas '),
(33, '012.2', 'Perabotan'),
(34, '013', 'Mess/Guest House/Asrama'),
(35, '014', '-'),
(36, '015', 'Penerangan Listrik'),
(37, '016', 'Telepon'),
(38, '017', 'Keamanan/Keteriban Kantor'),
(39, '018', 'Kebersihan Kantor'),
(40, '019', 'Protokol'),
(41, '019.1', 'Upacara Bendera'),
(42, '019.2', 'Gelar senja'),
(43, '019.3', 'Tata tempat'),
(44, '019.31', 'Pemasangan gambar Presiden/Wakil Presiden'),
(45, '019.4', 'Audiensi'),
(46, '019.5', 'Alamat-alamat kantor dan pejabat'),
(47, '020', 'PERALATAN'),
(48, '020.1', 'Penawaran '),
(49, '021', 'Alat tulis '),
(50, '022', 'Mesin kantor'),
(51, '023', 'Perabot kantor '),
(52, '024', 'Alat angkutan /Kendaraan dinas'),
(53, '025', 'Pakaian Dinas/ID Card/Kartu Identitas'),
(54, '026', 'Senjata'),
(55, '027', 'Pegadaan termasuk RKBU,Standar Harga'),
(56, '028', 'Inventaris'),
(57, '029', '-'),
(58, '030', 'KEKAYAAN DAERAH'),
(59, '031', '-'),
(60, '032', '-'),
(61, '033', '-'),
(62, '034', '-'),
(63, '035', '-'),
(64, '036', '-'),
(65, '037', '-'),
(66, '038', '-'),
(67, '039', '-'),
(68, '040', 'PERPUSTAKAAN/DOKUMENTASI/KEARSIPAN/SANDI'),
(69, '041', 'Perpustakaan (Umum,khusus,perguruan tinggi,sekolah, keliling,dinas/instansi/kecamatan/desa dan sebagainya)'),
(70, '042', 'Dokumentasi '),
(71, '043', '-'),
(72, '044', '-'),
(73, '045', 'Kearsipan'),
(74, '045.1', 'Ekspedisi ke-2'),
(75, '045.2', 'Surat pengantar '),
(76, '045.3', 'Salah kirim'),
(77, '045.4', 'Pola klasifikasi'),
(78, '045.5', 'Penataan berkas'),
(79, '045.6', 'Penyusutan arsip'),
(80, '045.7', 'Pembinaan kearsipan'),
(81, '045.8', 'Pemeliharaan arsip/perawatan arsip'),
(82, '045.9', 'Pengawetan/konservasi'),
(83, '045.10', 'Pemasyarakatan arsip dsb'),
(84, '046', 'Sandi (Sarana sandi/pemeliharaan)'),
(85, '047', '-'),
(86, '048', '-'),
(87, '049', '-'),
(88, '050', 'PERENCANAAN (Meliputi rencana pemabangunaan lima tahun, dan perencanaan umum departemen Dalam Negri. Klasifikasikan disini proyek-proyek Pembangunan. DUK.DIK.DUP.DIP. Laporan fisik dan keuangan proyek pembangunan,SIAP, tender, pemborong dsb.)'),
(89, '050.1', 'REPELITA'),
(90, '050.11', 'Pelita Daerah. Tambahkan kode wilayah'),
(91, '050.12', 'Bantuan Pembangunan Daerah. Tambahkan kode wilayah'),
(92, '050.13', 'Bappeda'),
(93, '050.2', 'Perencanaan/proyek bidang peralatan'),
(94, '050.41', 'Bidang Perpustakaan'),
(95, '050.45', 'Bidang Kearsipan'),
(96, '050.46', 'Bidang Sandi'),
(97, '050.6', 'Organisasi/ketatalaksanaan'),
(98, '050.7', 'Penelitian.'),
(99, '051', 'Bidang pemerintahan'),
(100, '052', 'Bidang Politik'),
(101, '053', 'Bidang keamanan ketertiban'),
(102, '054', 'Bidang Kesejahteraan Rakyat'),
(103, '055', 'Bidang Perekonomian '),
(104, '056', 'Bidang pekerjaan umum '),
(105, '057', 'Bidang Pengawasan'),
(106, '058', 'Bidang Kepegawaian'),
(107, '059', 'Bidang Keuangan'),
(108, '060', 'ORGANISASI/ KETATALAKSANAAN'),
(109, '061', 'Organisasi intansi pemerintah'),
(110, '061.1', 'Susunan dan tata kerja'),
(111, '061.2', 'Tata tertib kantor.jam kerja'),
(112, '061.3', 'Struktur organisasi'),
(113, '061.4', 'Tugas pokok dan fungsi'),
(114, '061.5', 'Gerakan disiplin Nasional'),
(115, '061.6', 'Supporting organisasi'),
(116, '061.7', 'Program kerja'),
(117, '061.8', 'Standar pola minimal'),
(118, '061.9', 'Pelayanan umum/UPTSA'),
(119, '061.10', 'LAKIP dsb'),
(120, '062', 'Organisasi badan Non pemerintah'),
(121, '063', 'Organisasi badan internasional'),
(122, '064', 'Organisasi semni pemerintah. BKS-AKSI'),
(123, '065', 'Ketatalaksanaan'),
(124, '065.1', 'Tata naskah dinas'),
(125, '065.2', 'Stempel'),
(126, '065.3', 'Alamat kantor'),
(127, '065.4', 'Papan nama instansi dsb'),
(128, '066', '-'),
(129, '067', '-'),
(130, '068', '-'),
(131, '069', '-'),
(132, '070', 'PENELITIAN '),
(133, '071', 'Riset'),
(134, '072', 'Survey'),
(135, '073', '-'),
(136, '074', 'Kerjasama penelitian dengan perguruan tinggi'),
(137, '075', '-'),
(138, '076', '-'),
(139, '077', '-'),
(140, '078', '-'),
(141, '079', '-'),
(142, '080', 'KONPERENSI'),
(143, '081', 'Gubernur'),
(144, '082', 'Bupati/ wali kota'),
(145, '083', 'Komponen, eselon lainya'),
(146, '084', 'Intansi lainya'),
(147, '085', 'Internasional di dalam negri'),
(148, '086', 'Internasional di luar negri'),
(149, '087', '-'),
(150, '088', '-'),
(151, '089', '-'),
(152, '090', 'PERJALANAN DINAS'),
(153, '091', 'Perjalanan presiden/ Wakil Presiden ke daerah'),
(154, '092', 'Perjalanan Mentri ke daerah'),
(155, '093', 'Perjalanan Pejabat tinggi ( Pejabat Eselon 1)'),
(156, '094', 'Perjalanan Pegawai, termasuk pemangilan pegawai,kunjungan kerja dari daerah lain,kunjungan kerja ke luar daerah maupun dalam daerah dsb'),
(157, '095', 'Perjalanan Tamu asing ke daerah '),
(158, '096', 'Perjalanan Presiden/ Wakil presiden ke luar negri'),
(159, '097', 'Perjalanan Mentri ke luar negri'),
(160, '098', 'Perjalanan Pejabat tinggi ke luar negri'),
(161, '099', 'Perjalanan Pegawai ke luar negri'),
(162, '100', 'PEMERINTAHAN'),
(163, '101', '-'),
(164, '102', '-'),
(165, '103', '-'),
(166, '104', '-'),
(167, '105', '-'),
(168, '106', '-'),
(169, '107', '-'),
(170, '108', '-'),
(171, '109', '-'),
(172, '110', 'PEMERINTAH PUSAT'),
(173, '111', 'Presiden'),
(174, '111.1', 'Pertanggung jawaban MPR'),
(175, '111.2', 'Amanat Presiden/ Amanat Kenegaraan/ Pidato kenegaraan'),
(176, '112', 'Wakil Presiden'),
(177, '113', 'Susunan kabinet'),
(178, '113. 1', 'Reshufle'),
(179, '113.2', 'Penunjukan materi ad interim'),
(180, '113.3', 'Sidang kabinet. Sidang Dewan Stabilisasi Ekonomi lihat 500.1'),
(181, '114', 'Depertemen Dalam Negri '),
(182, '114.1', 'Amanat mentri Dalam Negri'),
(183, '114.2', 'Sekretariat Jendral'),
(184, '114.3', 'Direktorat Jendral'),
(185, '115', 'Depertemen lainnya'),
(186, '116', 'Lembaga Tinggi Negara (DPA, MA, BPK)'),
(187, '117', 'Lembaga Non Depertemen'),
(188, '118', 'Otonomi/ Desentralisasi'),
(189, '119', 'Kerjasama antara Depertemen/ Kementrian'),
(190, '120', 'PEMERINTAH DAERAH TINGKAT 1'),
(191, '120.04', 'Laporan daerah, Tambahkan kode wilayah'),
(193, '120.1', 'Koordinasi'),
(194, '120.2', 'Intansi tingkat Provinsi'),
(195, '120.21', 'Dinas Otonom'),
(196, '120.22', 'Instansi Vertikal '),
(197, '121', 'Kepala Daerah/ Gubernur .Tambahkan Kode Wilayah.'),
(198, '122', 'Wakil kepala Daerah/ Wakil Gubernur.Tambahkan kode wilayah.'),
(199, '123', 'Sekretaris Wilayah Daerah/ Sekertaris Daerah. Tambahkan kode wilayah.'),
(200, '124', 'Badan-badan pertimbangan daerah '),
(201, '125', 'Pembentukan/pemekaran wilayah '),
(202, '125.1', 'Pembentukan daerah Otonom, Perubahan batas wilayah ,Pemekaran wilayah ,Pemberian/perubahan nama kepada: daerah, kota, benda geografis, gunung, sungai, pulau, selat dsb. '),
(203, '126', 'Pembagian Wilayah'),
(204, '127', 'Penyerahan urusan '),
(205, '128', 'Swapraja'),
(206, '129', '-'),
(207, '130', 'PEMERINTAHAN DAERAH TINGKAT III'),
(208, '130.04', 'Laporan daerah tingkat II'),
(209, '130.1', 'Koordinasi'),
(210, '130.2', 'Instansi tingkat kabupaten/ kotamadya'),
(211, '130.3', 'Laporan daerah meliputi,Laporan kegiatan (Bulanan,triwulan ,tahunan),Laporan pertanggungjawaban Bupati, Laporan Peyelenggaraan Pemerintah,dsb'),
(212, '130.21', 'Dinas Otonom'),
(213, '130.22', 'Instansi Vertikal '),
(214, '131', 'Kepala Daerah/ Bupati. Tambahkan kode wilayah'),
(215, '131.1', 'Sambutan/pengarahan/Amanat Bupati'),
(216, '132', 'Wakil kepala Daerah/ Wakil Bupati.Tambahkan kode wilayah.'),
(217, '133', 'Sekretaris wakil/daerah. Tambahkan kode wilayah.'),
(218, '134', 'Badan-badan daerah meliputi badan pertimbangan daerah.'),
(219, '134.1', 'Forum koordinasi Pemerintah di derah'),
(220, '134.2', 'FORKOMPADA'),
(221, '134.3', 'Muspida'),
(222, '134.4', 'Forum PAN'),
(223, '134.5', 'Forum koordinasi lainnya'),
(224, '134.6', 'Termasuk LSM(P2TPD/prakarsa pembaharuan tata pemerintahan daerah)'),
(225, '134.7', 'Pemberdayaan masyarakat dsb'),
(226, '135', 'Pembentukan daerah /Pemekaran daerah/wilayah'),
(227, '136', 'Pembagian Wilayah'),
(228, '137', 'Penyerahan urusan '),
(229, '138', 'Pemerintah Wilayah Kecamatan'),
(230, '138.04', 'Laporan Kecamatan,Monografi kecamatan,Sambutan/Pengarahan/ Alamat,Pembentukan Kecamatan,Pemekaran Kecamatan,Perluasan/Perubahan batas wilayah kecamatan dsb'),
(231, '139', 'Perwakilan kabupaten di luar daerah'),
(232, '140', 'PEMERINTAH DESA/KELURAHAN'),
(233, '140.1', 'Monografi'),
(234, '140.2', 'Musbangdes'),
(235, '141', 'Pamong Desa '),
(236, '141.1', 'Kepala Desa/Lurah Meliputi Pencalonan,pemilihan,Pengangkatan/Pemilihan , Pemberhentian.Pemberhentian sementara, pelantikan,Serah terima dsb'),
(237, '141.2', 'Biaya pemilihan Kepala desa/Lurah'),
(238, '141.3', 'Lembaga musyawarah Desa/Badan Perwakilan desa meliputi pembentukan,Keanggotaan,kepengurusan dan kegiatannya'),
(239, '141.4', 'Perangkat desa:Sekertaris desa/Carik,Kepala Bagian,Kepala Dusun,Dukuh'),
(241, '142', 'Penghasilan Pamong Desa '),
(242, '142.1', 'APPKD(Anggaran Pendapatan Pengeluaran Keuangan Desa) dan APBD(Anggaran Pendapatan dan Belanja Desa)'),
(243, '142.2', 'Pendapatan Desa meliputi urusan desa, penerimaan dari pemerintah pusat/Propinsi/Kabupaten, Penerimaan dari pajak dan Retribusi desa yang di serahkan kepada desa, Penerimaan dari pemilik tanah yang berdomisili di luar desa, pendapatan asli desa, penerimaan lain -lain yang sah berdasarkan peraturan perundang -undangan yang berlaku, hasil dari swadaya masyarakat'),
(244, '143', 'Kekayaan desa'),
(245, '143.1', 'Tanah hak pakai desa meliputi tanah bengkok'),
(246, '143.2', 'Tanah Titisara'),
(247, '143.3', 'Tanah Pengangonan'),
(248, '143.4', 'Tanah desa lainya'),
(249, '143.5', 'Jalan desa'),
(250, '143.6', 'Bangunan Desa'),
(251, '143.7', 'Kekayaan des lainnya dsb'),
(252, '144', 'Lembaga- lembaga tingkat desa/Dewan tingkat desa. Dewan Marga, Rembug desa '),
(253, '144.1', 'LKMD (Lembaga Ketahanan Masyarakat Desa)'),
(254, '144.2', 'LPMD (Lembaga Perwakilan Masyarakat Desa)'),
(255, '145', 'Administrasi desa '),
(256, '146', 'Kewilayahan '),
(257, '146.1', 'Pemekaran desa/Kelurahan'),
(258, '146.2', 'Pembentukan desa/Kelurahan'),
(259, '146.3', 'Perubahan batas wilayah/Perluasan desa/Kelurahan'),
(260, '146.4', 'Perubahan nama desa /Kelurahan'),
(261, '146.5', 'Permasalahan batas desa'),
(262, '146.6', 'Penyatuan desa/Kelurahan'),
(263, '146.7', 'Penghapusan desa/Kelurahan dsb'),
(264, '147', 'Lembaga-lembaga tingkat desa. Jangan diklasifikasikan di sini. Lh: 410 dengan perinciannya.'),
(265, '148', 'RT-RW-RK.'),
(266, '149', '-'),
(267, '150', 'LEGISLATIF. MPR/DPR '),
(268, '151', 'Keanggotaan MPR '),
(269, '151.1', 'Pencalonan'),
(270, '151.2', 'Pengangkatan '),
(271, '151.3', 'Pemberhentian'),
(272, '151.31', 'Recall '),
(273, '151.32', 'Meninggal'),
(274, '151.4', 'Pelanggaran '),
(275, '152', 'Persidangan MPR'),
(276, '153', 'Kesejahteraan '),
(277, '153.1', 'Keuangan'),
(278, '153.2', 'Penghargaan '),
(279, '153.3', 'Pemberhentian'),
(280, '153.4', 'Recall '),
(281, '153.5', 'Meninggal'),
(282, '154', 'Hak'),
(283, '155', 'Keanggotaan DPR '),
(284, '155.1', 'Pencalonan '),
(285, '155.2', 'Pengangkatan '),
(286, '155.3', 'Pemberhentian'),
(287, '155.31', 'Recall '),
(288, '155.32', 'Meninggal'),
(289, '155.4', 'Pelanggaran '),
(290, '156', 'Persidangan '),
(291, '156.1', 'Sidang Pleno'),
(292, '156.2', 'Dengar Pendapat '),
(293, '156.3', 'Rapat Komisi '),
(294, '156.4', 'Reses'),
(295, '157', 'Kesejahteraan '),
(296, '157.1', 'Keuangan'),
(297, '157.2', 'Penghargaan'),
(298, '158', 'Jawaban Pemerintah'),
(299, '159', 'Hak'),
(300, '160', 'DPRD TINGKAT I'),
(301, '161', 'Keanggotaan '),
(302, '161.1', 'Pencalonan'),
(303, '161.2', 'Pengangkatan '),
(304, '161.3', 'Pemberhentian'),
(305, '161.31', 'Recall '),
(306, '161.32', 'Meninggal'),
(307, '161.4', 'Pelanggaran '),
(308, '162', 'Persidangan'),
(309, '162.1', 'Reses'),
(310, '163', 'Kesejahteraan '),
(311, '163.1', 'Keuangan'),
(312, '163.2', 'Penghargaan'),
(313, '164', 'Hak'),
(314, '165', 'Sekretaris DPRD Tingkat'),
(315, '166', '-'),
(316, '167', '-'),
(317, '168', '-'),
(318, '169', '-'),
(319, '170', 'DPRD TINGAT II'),
(320, '171', 'KEANGGOTAAN'),
(321, '171.1', 'Pecalonan'),
(322, '171.2', 'Pengangkatan '),
(323, '171.3', 'Pemberhentian'),
(324, '171.31', 'Recall '),
(325, '171.32', 'Meninggal'),
(326, '171.4', 'Pelanggaran '),
(327, '172', 'Persidangan'),
(328, '172.1', 'Reses'),
(329, '172.2', 'Tata tertib '),
(330, '172.3', 'Sidang Pleno'),
(331, '172.4', 'Sidang Paripurna'),
(332, '172.5', 'Dengar Pendapat '),
(333, '172.6', 'Peninjauan'),
(334, '172.7', 'Study Banding'),
(335, '172.8', 'Kunjungan Kerja'),
(336, '172.9', 'Rapat- rapat meliputi:Rapat panitia musyawarah, komisi, Fraksi, panitia khusus dsb'),
(337, '173', 'Kesejahteraan '),
(338, '173.1', 'Keuangan'),
(339, '173.2', 'Penghargaan'),
(340, '174', 'Hak'),
(341, '175', 'Sekretaria DPRD Tingkat II'),
(342, '176', '-'),
(343, '177', '-'),
(344, '178', '-'),
(345, '179', '-'),
(346, '180', 'HUKUM'),
(347, '180.1', 'Konstitusi'),
(348, '180.11', 'Dasar Negara'),
(349, '180.12', 'Undang-undang Dasar '),
(350, '180.2', 'GBHN '),
(351, '181', 'Perdata'),
(352, '181.1', 'Tanah'),
(353, '181.2', 'Rumah'),
(354, '181.3', 'Utang/piutang'),
(355, '181.31', 'Gadai'),
(356, '181.32', 'Hipotik'),
(357, '181.4', 'Notariat'),
(358, '182', 'Pidana'),
(359, '182.1', 'PPNS (Penyidik Pegawai Negeri Sipil )'),
(360, '183', 'Peradilan'),
(361, '183.1', 'Peradilan Agama Islam lh. 451.6'),
(362, '183.2', 'Peradilan perkara tanah lh 593.71'),
(363, '183.3', 'Bantuan Hukum '),
(364, '183.4', 'Peradilan Umum'),
(365, '183.5', 'Peradilan militer'),
(366, '183.6', 'Peradilan tata usaha negara'),
(367, '183.7', 'Upaya hukum'),
(368, '183.8', 'Ekskusi'),
(369, '183.9', 'Pembinaan hukum'),
(370, '184', 'Hukum Internasional'),
(371, '185', 'Imigrasi'),
(372, '185.1', 'Visa'),
(373, '185.2', 'Paspor'),
(374, '185.3', 'Exit'),
(375, '185.4', 'Reentry'),
(376, '185.5', 'Lintas batas'),
(377, '186', 'Kepenjaraan '),
(378, '186.1', 'Lembaga pemasyarakatan'),
(379, '186.2', 'Rumah tahanan'),
(380, '187', 'Kejaksaan'),
(381, '188', 'Peraturasn Perundang-undangan'),
(382, '188.1', 'TAP MPR'),
(383, '188.2', 'Undang-undang'),
(384, '188.3', 'Peraturan'),
(385, '188.31', 'Peraturan Pemerintah '),
(386, '188.32', 'Peraturan Mentri'),
(387, '188.33', 'Peraturan Lembaga non Departemen'),
(388, '188.34', 'Peraturan Daerah'),
(389, '188.34.1', 'Peraturan Daerah Tingkat I'),
(390, '188.34.2', 'Peraturan Daerah Tingkat II'),
(391, '188.4', 'Keputusan'),
(392, '188.41', 'Presiden'),
(393, '188.42', 'Mentri'),
(394, '188.43', 'Lembaga Non Depertemen'),
(395, '188.44', 'Gubernur'),
(396, '188.45', 'Bupati/ wali kota'),
(397, '188.5', 'Instruksi'),
(398, '188.51', 'Presiden'),
(399, '188.52', 'Mentri'),
(400, '188.53', 'Lembaga Non Depertemen'),
(401, '188.54', 'Gubernur'),
(402, '188.55', 'Bupati/ wali kota'),
(403, '189', 'Hukum adat '),
(404, '189.1', 'Tokoh adat/masyarakat'),
(405, '190', 'HUBUNGAN LUAR NEGRI'),
(406, '192', 'Perwakilan asing '),
(407, '193', 'Tamu Negara'),
(408, '193.1', 'Kerjasama dengan negara asing'),
(409, '193.2', 'Asean'),
(410, '193.3', 'Bantuan Luar negri'),
(411, '194', 'Perwakilan RI di luar Negri '),
(412, '195', 'PBB'),
(413, '196', 'Laporan luar negri'),
(414, '197', '-'),
(415, '198', '-'),
(416, '199', '-'),
(417, '200', 'POLITIK'),
(418, '201', 'Kebijaksanaan Umum, Santiaji, Wawasan kebangsaan'),
(419, '202', 'Orde Baru'),
(420, '203', 'Reformasi'),
(421, '204', '-'),
(422, '205', '-'),
(423, '206', '-'),
(424, '207', '-'),
(425, '208', '-'),
(426, '209', '-'),
(427, '210', 'KEPARTAIAN '),
(428, '211', 'Partai Demokrasi Indonesia'),
(429, '212', 'Golongan Karya'),
(430, '213', 'Partai Persatuan Pembangunan'),
(431, '214', '-'),
(432, '215', '-'),
(433, '216', '-'),
(434, '217', '-'),
(435, '218', '-'),
(436, '219', '-'),
(437, '220', 'ORGANISASI KEMASYARAKATAN '),
(438, '221', 'Berdasarkan Perjuangan'),
(439, '221.1', 'Perintis Kemerdekaan '),
(440, '221.2', 'Angkatan 45'),
(441, '221.3', 'Veteran '),
(442, '222', 'Berdasarkan Kekaryaan'),
(443, '222.1', 'PEPABRI'),
(444, '222.2', 'Wreda Tama'),
(445, '222.3', '-'),
(446, '223', 'Berdasarkan Kerohanian '),
(447, '223.1', 'Muhammadiyah'),
(448, '223.2', 'N.U'),
(449, '223.3', 'Persatuan Tarikat Islam '),
(450, '223.4', 'LDII'),
(451, '223.5', 'Ahlussunnah Wal Jama\'ah (ASWJ)'),
(452, '224', '-'),
(453, '225', '-'),
(454, '226', '-'),
(455, '227', '-'),
(456, '228', '-'),
(457, '229', '-'),
(458, '230', 'ORGANISASI PROFESI DAN FUNGSIONIL '),
(459, '231', 'Ikatan Dokter Indonesia'),
(460, '232', 'Persatuan Guru Republik Indonesia'),
(461, '233', 'Persatuan Sarjana Hukum Indonesia'),
(462, '234', 'Persatuan Advokat Indonesia'),
(463, '235', 'Lembaga Bantuan Hukum'),
(464, '236', 'Korps Pegawai Repulik Indonesia '),
(465, '237', 'Persatuan Wartawan Indonesia'),
(466, '238', 'Organisasi Profesi dan fungsional lainnya'),
(467, '239', '-'),
(468, '240', 'ORGANISASI PEMUDA'),
(469, '241', 'Komite Nasional Pemuda Indonesia '),
(470, '242', 'Organisasi Mahasiswa'),
(471, '243', 'Organisasi Pelajar'),
(472, '244', 'Gerakan Pemuda Ansor'),
(473, '245', 'Gerakan Pemuda Islam Indonesia '),
(474, '246', 'Gerakan Pemuda Marhaenis'),
(475, '247', '-'),
(476, '248', '-'),
(477, '249', '-'),
(478, '250', 'ORGANISASI BURUH,TANI DAN NELAYAN'),
(479, '251', 'FederasiBuruh Seluruh Indonesia'),
(480, '252', 'Organisasi Buruh Internasional '),
(481, '253', 'Himpunan Kerukunan Tani Indonesia'),
(482, '254', 'Himpunan Nelayan Seluruh Indonesia'),
(483, '255', '-'),
(484, '256', '-'),
(485, '257', '-'),
(486, '258', '-'),
(487, '259', '-'),
(488, '260', 'ORGANISASI WANITA'),
(489, '261', 'Drama Wanita '),
(490, '262', 'Kongres Wanita Indonesia'),
(491, '263', 'Persatuan Wanita Republik Indonesia'),
(492, '264', '-'),
(493, '265', '-'),
(494, '266', '-'),
(495, '267', '-'),
(496, '268', '-'),
(497, '269', '-'),
(498, '270', 'PEMILIHAN UMUM'),
(499, '271', 'Pencalonan'),
(500, '272', 'Tanda gambar'),
(501, '273', 'Kampanye'),
(502, '274', 'Komisi pemilihan umum (Sekretariat)'),
(503, '274.1', 'Sekretariat '),
(504, '274.2', 'Panitia pengawas pemilu'),
(505, '274.3', 'Petugas pemilu'),
(506, '275', 'Panitia pengawas pemilu'),
(507, '276', 'Petugas pemilu'),
(508, '277', 'Pemungutan suara/ penghitungan suara'),
(509, '278', 'Hasil pemilu'),
(510, '279', 'Keuangan'),
(511, '280', '-'),
(512, '281', '-'),
(513, '282', '-'),
(514, '283', '-'),
(515, '284', '-'),
(516, '285', '-'),
(517, '286', '-'),
(518, '287', '-'),
(519, '288', '-'),
(520, '289', '-'),
(521, '290', '-'),
(522, '291', '-'),
(523, '292', '-'),
(524, '293', '-'),
(525, '294', '-'),
(526, '295', '-'),
(527, '296', '-'),
(528, '297', '-'),
(529, '298', '-'),
(530, '299', '-'),
(531, '300', 'KEAMANAN /KETERTIBAN'),
(532, '301', 'Bangunan liar'),
(533, '302', '-'),
(534, '303', '-'),
(535, '304', '-'),
(536, '305', '-'),
(537, '306', '-'),
(538, '307', '-'),
(539, '308', '-'),
(540, '309', '-'),
(541, '310', 'PERTAHANAN'),
(542, '311', 'Darat'),
(543, '312', 'Laut'),
(544, '313', 'Udara'),
(545, '314', '-'),
(546, '315', '-'),
(547, '316', '-'),
(548, '317', '-'),
(549, '318', '-'),
(550, '319', '-'),
(551, '320', 'KEMILITERAN'),
(552, '321', 'Latihan Militer dan Bela Negara'),
(553, '322', 'Wajib Militer'),
(554, '323', 'Operasi Militer / Darurat militer'),
(555, '323.1', 'TMMD (Tentara Manunggal Masuk Desa)'),
(556, '324', 'Kekaryaan ABRI'),
(557, '325', '-'),
(558, '326', '-'),
(559, '327', '-'),
(560, '328', '-'),
(561, '329', '-'),
(562, '330', 'KEAMANAN'),
(563, '331', 'Kepolisian'),
(564, '331.1', 'Polisi Pamong Praja '),
(565, '331.2', 'Satuan pengamanan (SATPAM/ Security)'),
(566, '332', 'Huru-hara/Demokrasi'),
(567, '333', 'Senjata api/tajam '),
(568, '334', 'Bahan Peledak/ BOM'),
(569, '335', 'Perjudian ,TOGEL'),
(570, '336', 'Surat-surat kaleng'),
(571, '337', '-'),
(572, '338', '-'),
(573, '339', '-'),
(574, '340', 'PERTAHANAN SIPIL'),
(575, '341', '-'),
(576, '342', '-'),
(577, '343', '-'),
(578, '344', '-'),
(579, '345', '-'),
(580, '346', '-'),
(581, '347', '-'),
(582, '348', '-'),
(583, '349', '-'),
(584, '350', 'KEJAHATAN'),
(585, '351', 'Makar/pemberontakan '),
(586, '352', 'Pembunuhan'),
(587, '352.1', 'Bunuh diri'),
(588, '352.2', 'Keracunan'),
(589, '353', 'Penganiayaan, pencurian,/pemarasan'),
(590, '354', 'Subversi/penyelundupan/narkotika'),
(591, '355', 'Pemalsuan '),
(592, '355.1', 'Uang'),
(593, '355.2', 'Ijazah'),
(594, '355.3', 'Kejahatan pemalsuan lainya'),
(595, '356', 'Korupsi/penyelewengan/penyalahan jabatan'),
(596, '357', 'Perkosaan/perbuatan cabul'),
(597, '358', 'Kenakalan '),
(598, '359', 'Kejahata lainya'),
(599, '359.1', 'Kolusi, korupsi dan Nepotisme (KKN)'),
(600, '359.2', 'Money Loundry'),
(601, '359.3', '-'),
(602, '359.4', '-'),
(603, '360', 'BENCANA (Satuan Pelaksana Penanggulangan Bencana Alam /Satlak PBA)'),
(604, '361', 'Gunung berapi/gempa'),
(605, '362', 'Banjir/tanah longsor'),
(606, '363', 'Angin topan'),
(607, '364', 'Kebakaran'),
(608, '364.1', 'Pemadam Kebakaran'),
(609, '365', 'Kekeringan'),
(610, '366', '-'),
(611, '367', '-'),
(612, '368', '-'),
(613, '369', '-'),
(614, '370', 'KECELAKAAN'),
(615, '371', 'Klasifikasi disini : SAR'),
(616, '372', '-'),
(617, '373', '-'),
(618, '374', '-'),
(619, '375', '-'),
(620, '376', '-'),
(621, '377', '-'),
(622, '378', '-'),
(623, '379', '-'),
(624, '380', '-'),
(625, '381', '-'),
(626, '382', '-'),
(627, '383', '-'),
(628, '384', '-'),
(629, '385', '-'),
(630, '386', '-'),
(631, '387', '-'),
(632, '388', '-'),
(633, '389', '-'),
(634, '390', '-'),
(635, '391', '-'),
(636, '392', '-'),
(637, '393', '-'),
(638, '394', '-'),
(639, '395', '-'),
(640, '396', '-'),
(641, '397', '-'),
(642, '398', '-'),
(643, '399', '-'),
(644, '400', 'KESEJAHTEARAAN RAKYAT (SMD Berkualitas)'),
(645, '401', '-'),
(646, '402', '-'),
(647, '403', '-'),
(648, '404', '-'),
(649, '405', '-'),
(650, '406', '-'),
(651, '407', '-'),
(652, '408', '-'),
(653, '409', '-'),
(654, '410', 'PEMBANGUNAN DESA'),
(655, '411', 'Pembinaan Usaha Gotong Royong'),
(656, '411.1', 'Swadaya Gotong Royong'),
(657, '411.11', 'Penataan gotong royong'),
(658, '411.12', 'Gotong royong Dinamis'),
(659, '411.13', 'Gotong royong Statis'),
(660, '411.14', 'Pungutan'),
(661, '411.2', 'Lembaga Sosial Desa (LSD)'),
(662, '411.21', 'Pembinaan'),
(663, '411.22', 'Klasifikasi'),
(664, '411.23', 'Proyek'),
(665, '411.24', 'Musyawarah'),
(666, '411.3', 'Latihan Kerja Masyarakat '),
(667, '411.31', 'Kader Masyarakat'),
(668, '411.32', 'Kuliah Kerja Nyata (KKN)'),
(669, '411.33', 'Pusat Latihan '),
(670, '411.34', 'Kursus-kursus'),
(671, '411.35', 'Kurikulum/Sylabus'),
(672, '411.36', 'Keterampilan'),
(673, '411.37', 'Pramuka'),
(674, '411.4', 'Pembinaan Kesejahteraan Keluarga (PKK)'),
(675, '411.41', 'Progam'),
(676, '411.42', 'Pembinaan Organisasi'),
(677, '411.43', 'Kegiatan '),
(678, '411.44', 'Pengarusutamaan Gender (PUG)'),
(679, '411.45', 'Pemberdayaan Perempuan'),
(680, '411.5', 'Penyuluhan'),
(681, '411.51', 'Publikasi'),
(682, '411.52', 'Peragaan'),
(683, '411.53', 'Sosio Drama'),
(684, '411.54', 'Siaran Pedesaan '),
(685, '411.55', 'Penyuluhan lapangan '),
(686, '411.6', 'Kelembagaan Desa'),
(687, '411.61', 'Kelompok Tani '),
(688, '411.62', 'Rukun Tani '),
(689, '411.63', 'Subak '),
(690, '411.64', 'Dharma Tirta'),
(691, '411.65', 'Klompencapir'),
(692, '411.66', 'Kelompok Tani Ternak'),
(693, '412', 'Perekonomian Desa'),
(694, '412.1', 'Produksi Desa'),
(695, '412.12', 'Pengolahan '),
(696, '412.13', 'Pemasaran '),
(697, '412.2', 'Keuangan Desa'),
(698, '412.21', 'Perkreditan Desa'),
(699, '412.22', 'Innsventarisasi Desa '),
(700, '412.23', 'Perkembangan/pelaksanaan'),
(701, '412.24', 'Bantuan/ Stimulans'),
(702, '412.25', 'Petunjuk/pembinaan Pelaksanan '),
(703, '412.3', 'Koperasi Desa '),
(704, '412.31', 'Badan Usaha Unit Desa (BUUD)'),
(705, '412.32', 'Koperasi Usaha Desa (KUD)'),
(706, '412.33', 'Badan Usaha Kredit Pedesaan (BUKP)'),
(707, '412.4', 'Penataan Bantuan Pembangunan Desa'),
(708, '412.41', 'Jumlah Desa Yang diberi Bantuan'),
(709, '412.42', 'Pengarahan'),
(710, '412.43', 'Pusat '),
(711, '412.44', 'Daerah'),
(712, '412.5', 'Alokasi Bantuan Pembangunan Desa'),
(713, '412.51', 'Pusat'),
(714, '412.52', 'Daerah'),
(715, '412.6', 'Pelaksanaan Bantuan Pembangunan Desa'),
(716, '412.61', 'Bantuan Langsung'),
(717, '412.62', 'Bantuan Keserasian '),
(718, '412.63', 'Bantuan Juara Lomba Desa'),
(719, '413', 'Prasarana Desa'),
(720, '413.1', 'Prasarana Desa'),
(721, '413.11', 'Pembinaan'),
(722, '413.12', 'Bimbingan Tehnis'),
(723, '413.2', 'Pemukiman Kembali Penduduk'),
(724, '413.21', 'Lokasi'),
(725, '413.22', 'Dikusi'),
(726, '413.23', 'Pelaksanaan'),
(727, '413.3', 'Masyarakat Pradesa '),
(728, '413.31', 'Pembinaan '),
(729, '413.32', 'Penyuluhan'),
(730, '413.33', 'Kimpraswil'),
(731, '413.4', 'Pemugaran Perumahan dan Lingkungn Desa'),
(732, '413.41', 'Rumah Sehat '),
(733, '413.42', 'Proyek Perintis'),
(734, '413.43', 'Pelaksanaan'),
(735, '413.44', 'Pengembangan'),
(736, '413.45', 'Perbaikan Kampung'),
(737, '414', 'Pengembangan Desa'),
(738, '414.1', 'Tingkat Perkembangan Desa'),
(739, '414.12', 'Jumlah Desa '),
(740, '414.13', 'Pemekaran Desa'),
(741, '414.14', 'Pembentukan Desa Baru'),
(742, '414.15', 'Evaluasi'),
(743, '414.16', 'Bagan'),
(744, '414.17', 'RT berprestasi'),
(745, '414.2', 'Unit Daerah Kerja Pembangunan(UDKP)'),
(746, '414.21', 'Penyusunan Program'),
(747, '414.22', 'Lokasi UDKP'),
(748, '414.23', 'Pelaksanaan '),
(749, '414.24', 'Bimbingan /Pembinaan'),
(750, '414.25', 'Evaluasi'),
(751, '414.3', 'Tata Desa'),
(752, '414.31', 'Inventarisasi'),
(753, '414.32', 'Penyusunan Pola Tata Desa'),
(754, '414.33', 'Aplikasi Tata Desa'),
(755, '414.34', 'Pemetaan'),
(756, '414.35', 'Pedoman Pelaksanaan'),
(757, '414.36', 'Evaluasi'),
(758, '414.4', 'Pelombaan Desa /evaluasi pembangunan desa'),
(759, '414.41', 'Pedoman '),
(760, '414.42', 'Penilaian'),
(761, '414.43', 'Kejuaraan'),
(762, '414.44', 'Piagam'),
(763, '415', 'Koordinasi'),
(764, '415.1', 'Sektor Khusus(K)'),
(765, '415.2', 'Rapat Koordinasi Horisontal(RKH)'),
(766, '415.3', 'Team Koordinasi Pusat (TKP)'),
(767, '415.4', 'Kerjasama'),
(768, '415.41', 'Luar Negeri(UNICEF)'),
(769, '415.42', 'Perguruan Tinggi'),
(770, '415.43', 'Departemen/Lembaga Non Departemen'),
(771, '416', '-'),
(772, '417', '-'),
(773, '418', '-'),
(774, '419', '-'),
(775, '420', 'PENDIDIKAN'),
(776, '420.1', 'Pendidikan khusus.Klasifikasi di sini:Pendidikan Putra-2 Irian Jaya'),
(777, '421', 'Sekolah /Perguruan Tinggi'),
(778, '421.1', 'Pra Sekolah /play group'),
(779, '421.2', 'Sekolah Dasar'),
(780, '421.3', 'Sekolah Menengah'),
(781, '421.4', 'Sekolah Tinggi'),
(782, '421.5', 'Sekolah Kejuruan '),
(783, '421.6', 'Kegiatan Sekolahan,Dies Natalis,Lustrum'),
(784, '421.61', 'Perguruan tinggi (PT)'),
(785, '421.7', 'Kegiatan Pelajar'),
(786, '421.71', 'Reuni Darmawisata'),
(787, '421.72', 'Pelajar Teladan '),
(788, '421.73', 'Resimen Mahasiswa(MENWA)'),
(789, '421.74', 'Kunjungan Ilmiah'),
(790, '421.75', 'Class meeting'),
(791, '421.76', 'Ekstra kurikuler'),
(792, '421.77', 'Pendidikan luar sekolah '),
(793, '421.8', 'Sekolah Pendidikan Luar Biasa'),
(794, '421.9', 'Pendidikan Luar Sekolah/Pemberantasan Buta Huruf'),
(795, '422', 'Administrasi Sekolahan'),
(796, '422.1', 'Persyaratan Masuk Sekolah,testing,Ujian,Pendaftaran,mapram,perpeloncoan.'),
(797, '422.2', 'Tahun Pelajaran / Tahun Akademik '),
(798, '422.3', 'Hari Libur'),
(799, '422.4', 'Uang Sekolah-Klasifikasikan disini SPP'),
(800, '422.5', 'Beasiswa '),
(801, '422.6', 'SPMA,BOP'),
(802, '422.7', 'Biaya belajar mandiri (BBM)'),
(803, '422.8', 'Masa orientasi siswa'),
(804, '422.9', 'Orientasi kampus /OPSPEK'),
(805, '423', 'Metode Belajar'),
(806, '423.1', 'Kuliah '),
(807, '423.2', 'Ceramah,Simposium'),
(808, '423.3', 'Diskusi'),
(809, '423.4', 'Kuliah Lapangan,Widyawisata,KKN'),
(810, '423.5', 'Kurikulum '),
(811, '423.6', 'Karya Tulis'),
(812, '423.7', 'Ujian'),
(813, '423.8', 'PKL'),
(814, '423.9', 'Praktek Industri'),
(815, '423.10', 'Kurikulum berbasis kompetensi (KBK)'),
(816, '423.11', 'Sylabusi'),
(817, '423.12', 'Tes Hasil Belajar (THB)'),
(818, '424', 'Tenaga Pengajar,Guru,Dosen,Dekan,Rektor'),
(819, '424.1', 'Pengawas sekolah'),
(820, '424.2', 'Tenaga Administrasi'),
(821, '425', 'Sarana Pendidikan'),
(822, '425.1', 'Gedung'),
(823, '425.11', 'Gedumg Sekolah'),
(824, '425.12', 'Kampus'),
(825, '425.13', 'Pusat Kegiatan Mahasiswa'),
(826, '425.2', 'Buku'),
(827, '425.3', 'Perlengkapan Sekolah'),
(828, '426', 'Keolahragaan'),
(829, '426.1', 'Cabang Olahraga '),
(830, '426.2', 'Sarana '),
(831, '426.3', 'Perkumpulan olahraga (PSSI, PELTI )'),
(832, '426.31', 'Gedung olah raga'),
(833, '426.32', 'Stadion'),
(834, '426.33', 'Lapangan'),
(835, '426.34', 'Kolam renang'),
(836, '426.4', 'Pesta olah-raga klasifikasi disini::PON,Porsade,Olimpiade,dan sebagainya'),
(837, '426.5', 'Hobby'),
(838, '426.6', 'Instruktur pelatih'),
(839, '427', 'Kepemudaan Meliputi organisasi dan Kegiatan Remaja. Klasifikasikan disini: Gelanggang remaja, Karang Taruna'),
(840, '428', 'Kepramukaan klasifikasikan disini :Persami, Jambore, Lomba tingkat, Raimuna'),
(841, '429', 'Pendidikan kedinasan Untuk Departement Dalam Negri lihat 890'),
(842, '430', 'KEBUDAYAAN '),
(843, '430.1', 'Wiyosan Dalem'),
(844, '431', 'Kesenian '),
(845, '431.1', 'Cabang Kesenian '),
(846, '431.2', 'Sarana'),
(847, '431.21', 'Gedung Kesenian '),
(848, '432', 'Kepeurbakalaan'),
(849, '432.1', 'Museum'),
(850, '432.2', 'Peninggalan Kuno '),
(851, '432.21', 'Candi, termasuk pemugaran'),
(852, '432.22', 'Benda'),
(853, '432.23', 'Keraton'),
(854, '432.24', 'Pura'),
(855, '432.25', 'Situs'),
(856, '433', 'Sejarah '),
(857, '434', 'Bahasa'),
(858, '435', 'Usaha pertunjukan, hiburan, kesenangan '),
(859, '436', 'Kepercayaan'),
(860, '437', '-'),
(861, '438', '-'),
(862, '439', '-'),
(863, '440', 'KESEHATAN'),
(864, '441', 'Pembinaan Kesehatan '),
(865, '441.1', 'Gigi'),
(866, '441.2', 'Mata'),
(867, '441.3', 'Jiwa'),
(868, '441.4', 'Kanker '),
(869, '441.5', 'Usaha Kesehatan Sekolah (UKS)'),
(870, '441.6', 'Perawat '),
(871, '441.7', 'Penyuluhan Kesehatan Masyarakat (PKM)'),
(872, '441.8', 'Kesehatan Ibu dan Anak'),
(873, '442', 'Obat-obatan'),
(874, '442.1', 'Pengadaan '),
(875, '442.2', 'Penyimpanan'),
(876, '442.3', 'Obat Generic'),
(877, '442.4', 'Pemalsuan'),
(878, '442.5', 'Obat terlarang (NAPZA)'),
(879, '443', 'Penyakit Menular'),
(880, '443.1', 'Pencegahan '),
(881, '443.2', 'Pembrantasan & Pencegahan Penyakit Menular langsung (P.2 M .L.)'),
(882, '443.21', 'Kusta'),
(883, '443.22', 'Kelamin'),
(884, '443.23', 'Frambosia'),
(885, '443.24', 'T.B.C'),
(886, '443.25', 'SARS'),
(887, '443.26', 'HIV/AIDS'),
(888, '443.3', 'Epidemiologi &Karantina (Epidka) '),
(889, '443.31', 'Kholera'),
(890, '443.32', 'Imunisasi'),
(891, '443.33', 'Survailense'),
(892, '443.34', 'Rabies (Anjing Gila)'),
(893, '443.35', 'Hygiene Sanitasi'),
(894, '443.4', 'Pemberantasan &Pencegahan Penyakit Menular sumber menular (P.2 B.)'),
(895, '443.41', 'Malaria'),
(896, '443.42', 'Dengue Haemoraahagic Fever (Demam Berdarah DHF)'),
(897, '443.43', 'Filaria'),
(898, '443.44', 'Serangga'),
(899, '443.5', 'Hygiene Sanitasi'),
(900, '443.51', 'Tempat-tempat Pembuatan dan Penjualan Makanan & Minuman. (TPP MM)'),
(901, '443.52', 'Sarana air Minum & Jamban Keluarga (Samijaga)'),
(902, '443.53', 'Pestisida'),
(903, '444', 'Gizi'),
(904, '444.1', 'Kekurangan makanan Bahaya kelaparan ,Busung lapar'),
(905, '444.2', 'Keracunan makanan'),
(906, '444.3', 'Menu makanan rakyat'),
(907, '444.4', 'Bahaya kelaparan'),
(908, '444.5', 'Badan Perbaikan Gizi Daerah (BPGD)'),
(909, '444.6', 'Sistem kewaspadaan Pangan dan Gizi'),
(910, '445', 'Rumah sakit Balai kesehatan,PUSKESMAS,PUSKESMAS keliling,Poliklinik.'),
(911, '445.1', 'Rumah Sakit Jiwa'),
(912, '445.2', 'Rumah Sakit Mata'),
(913, '445.3', 'Balai Kesehatan Ibu dan Anak'),
(914, '445.4', 'Rumah Bersalin'),
(915, '445.5', 'POSYANDU (Balita dan Lansia )'),
(916, '445.6', 'Rumah sakit/Balai Kesehatan lainnya'),
(917, '446', 'Tenaga medis'),
(918, '447', 'Alat Medis'),
(919, '448', 'Pengobatan tradisional'),
(920, '448.1', 'Pijat'),
(921, '448.2', 'Tusuk Jarum'),
(922, '448.3', 'Jamu Tradisional'),
(923, '448.4', 'Dukun'),
(924, '449', '-'),
(925, '450', 'AGAMA'),
(926, '451', 'Islam'),
(927, '451.1', 'Peribadatan'),
(928, '451.11', 'Sholat'),
(929, '451.12', 'Zakat,Fitrah, termasuk BAZIS'),
(930, '451.13', 'Puasa Termasuk kegiatan bulan ramadhan'),
(931, '451.14', 'Haji.Jangan diklasifikasikan disini lihat:456'),
(932, '451.15', 'MTQ '),
(933, '451.2', 'Rumah Ibadat (Masjid,Mushola, Surau, Langgar )'),
(934, '451.3', 'Tokoh Agama (Kyai,Dai, Kaum Rois)'),
(935, '451.4', 'Pendidikan'),
(936, '451.41', 'Tinggi'),
(937, '451.42', 'Menengah'),
(938, '451.43', 'Dasar'),
(939, '451.44', 'Pondok Pesantren'),
(940, '451.45', 'Gedung sekolah'),
(941, '451.46', 'Tenaga Pengajar'),
(942, '451.47', 'Buku'),
(943, '451.48', 'Dakwah'),
(944, '451.49', 'Organisasi/lembaga pendidikan'),
(945, '451.50', 'Dasar termasuk SDIT'),
(946, '451.51', 'Play Group'),
(947, '451.5', 'Harta Agama'),
(949, '451.6', 'Peradilan'),
(950, '451.7', 'Organisasi Keagamaan bukan politik'),
(952, '451.8', 'Mazhab'),
(953, '452', 'Protestan'),
(954, '452.1', 'Peribadatan'),
(955, '452.2', 'Kebaktian Rumah Ibadat'),
(956, '452.3', 'Tokoh Agama'),
(958, '452.4', 'Mazhab'),
(959, '452.5', 'Organisasi gerejani'),
(960, '453', 'Katholik'),
(961, '453.1', 'Peribadatan'),
(962, '453.2', 'Rumah Ibadat'),
(963, '453.3', 'Misa'),
(964, '453.4', 'Tokoh Agama'),
(965, '453.5', 'Rokhaniawan,Pastur, frater'),
(966, '453.6', 'Mazhab'),
(967, '453.7', 'Organisasi gerejani'),
(968, '453.8', 'Kapel'),
(969, '453.9', 'Ortodok'),
(970, '453.10', 'Roma'),
(971, '454', 'Hindu'),
(972, '454.1', 'Peribadatan'),
(973, '454.2', 'Rumah Ibadat'),
(974, '454.3', 'Tokoh Agama'),
(976, '454.4', 'Mazhab'),
(977, '454.5', 'Organisasi Keagamaan '),
(978, '454.6', 'Pura'),
(979, '454.7', 'Bedanda'),
(980, '455', 'Budha'),
(981, '455.1', 'Peribadatan'),
(982, '455.2', 'Rumah Ibadat'),
(983, '455.3', 'Tokoh Agama,Rokhaniawan'),
(984, '455.4', 'Mazhab'),
(985, '455.5', 'Organisai Keagamaan'),
(986, '455.6', 'Vihara'),
(987, '455.7', 'WALUBI'),
(988, '456', 'Urusan Haji '),
(989, '456.1', 'ONH (Ongkos Naik Haji)'),
(990, '456.2', 'Manasik'),
(991, '457', '-'),
(992, '458', '-'),
(993, '459', '-'),
(994, '460', 'SOSIAL'),
(995, '461', 'Rehabilitasi penderita cacad'),
(996, '461.1', 'Cacad mata'),
(997, '461.2', 'Cacad tubuh'),
(998, '461.3', 'Cacad mental'),
(999, '461.4', 'Bisu/tuli'),
(1000, '462', 'Tuna sosial'),
(1001, '462.1', 'Gelandangan'),
(1002, '462.2', 'Pengemis'),
(1003, '462.3', 'Tuna susila'),
(1004, '462.4', 'Anak nakal (pengguna/pecandu Narkoba, Tunawisma )'),
(1005, '463', 'Kesejahteraan anak/keluarga'),
(1006, '463.1', 'Anak putus sekolah'),
(1007, '463.2', 'Ibu teladan'),
(1008, '463.3', 'DBKS'),
(1009, '463.4', 'Gerakan Masyarakat dampak kenaikan harga BBM'),
(1010, '463.5', 'TDL'),
(1011, '463.6', 'Tarif telpon'),
(1012, '463.7', 'Pengentasan kemiskinan'),
(1013, '463.8', 'AKP (Analisa Kemiskinan Partisipatif )'),
(1014, '464', 'Pembinaan Pahlawan'),
(1015, '464.1', 'Pahlawan meliputi:penghargaan kepada pahlawan,tunjangan kepada pahlawan dan jandanya'),
(1016, '464.2', 'Perintis Kemerdekaan meliputi:pembinaan,penghargaan dan tunjangan kepada perintis kemerdekaan dan jandanya'),
(1017, '464.3', 'Cacad veteran'),
(1018, '465', 'Kesejahteraan Sosial'),
(1019, '465.1', 'Lanjut Usia'),
(1020, '465.2', 'Korban kekacauan,pengungsi,repatriasi, KUBE, USEP'),
(1021, '466', 'Sumbangan Sosial'),
(1022, '466.1', 'Korban bencana'),
(1023, '466.2', 'Pencarian dana untuk sumbangan meliputi:Penyelenggaraan undian,ketangkasan,bazar dan sebagainya'),
(1024, '466.3', 'Panti asuhan'),
(1025, '467', 'Bimbingan Sosial'),
(1026, '467.1', 'Masyarakat suku terasing Meliputi:bimbingan pendidikan,kesehatan,pemukiman,operasi busana dan sebagainya'),
(1027, '468', 'PMI'),
(1028, '469', 'Makam'),
(1029, '469.1', 'Umum'),
(1030, '469.2', 'Pahlawan'),
(1031, '469.3', 'Khusus keluarga,Raja'),
(1032, '469.4', 'Krematolum'),
(1033, '469.5', 'Organisasi/ Perkumpulan :Yayasan bunga Selasih, PUKJ'),
(1034, '470', 'KEPENDUDUKAN'),
(1035, '471', 'Kewarganegaraan Indonesia'),
(1036, '471.1', 'W.N.I asli'),
(1037, '471.2', 'W.N.I Keturunan asing'),
(1038, '471.21', 'Permohonan kewarganegaraan'),
(1039, '471.22', 'Permohonan ganti nama'),
(1040, '471.3', 'Asimilasi'),
(1041, '472', 'Kewarganegaraan asing'),
(1042, '473', 'Tidak berkewarganegaraan(state less) '),
(1043, '474', 'Pendaftaran penduduk, termasuk Permohonan Akta '),
(1044, '474.1', 'Kelahiran'),
(1045, '474.11', 'Adopsi'),
(1046, '474.2', 'Perkawinan/perceraian/rujuk'),
(1047, '474.3', 'Kematian'),
(1048, '474.4', 'Kartu penduduk'),
(1049, '475', 'Perpindahan Penduduk'),
(1050, '475.1', 'Transmigrasi'),
(1051, '475.2', 'Urbanisasi'),
(1052, '476', 'Keluarga Berancana'),
(1053, '476.1', 'Alat kontrasepsi'),
(1054, '476.2', 'KB Lestari'),
(1055, '476.3', 'Penyuluhan lapangan KB(PLKB)'),
(1056, '476.4', 'Pos KB Desa'),
(1057, '476.5', 'Akseptor KB'),
(1058, '476.6', 'Sub PPKBD'),
(1059, '477', 'Cacatan Sipil'),
(1060, '478', '-'),
(1061, '479', '-'),
(1062, '480', 'MEDIA MASA'),
(1063, '481', 'Penerbitan'),
(1064, '481.1', 'Surat kabar'),
(1065, '481.2', 'Majalah'),
(1066, '481.3', 'Buku'),
(1067, '481.4', 'Penterjemahan'),
(1068, '481.5', 'Tabloid'),
(1069, '482', 'Radio'),
(1070, '482.1', 'RRI'),
(1071, '482.(11)', 'Siaran pedesaan,jangan klasifikasikan disini lihat:441.54'),
(1072, '482.2', 'Non RRI'),
(1073, '482.3', 'Luar Negeri'),
(1074, '482.4', 'PRRSSNI'),
(1075, '482.5', 'Radio swasta Niaga'),
(1076, '482.6', '-'),
(1077, '483', 'Televisi'),
(1078, '483.1', 'TPRI'),
(1079, '483.2', 'TV Swasta'),
(1080, '483.3', 'Acara Televisi'),
(1081, '484', 'Film'),
(1082, '484.1', 'Dokumenter'),
(1083, '484.2', 'Perjuangan/ EPOS'),
(1084, '484.3', 'Anak'),
(1085, '484.4', 'Remaja'),
(1086, '484.5', 'Dewasa'),
(1087, '485', 'Pers.'),
(1088, '485.1', 'Kewartawanan/ Reporter/ presenter'),
(1089, '485.11', 'Wawancara'),
(1090, '486', 'Grafika'),
(1091, '487', 'Penerangan'),
(1092, '487.1', 'Pameran Non Komersil'),
(1093, '488', 'Operation Room'),
(1094, '489', 'Hubungan Masyarakat'),
(1095, '489.1', 'Baliho'),
(1096, '489.2', 'Bill Board'),
(1097, '490', '-'),
(1098, '491', '-'),
(1099, '492', '-'),
(1100, '493', '-'),
(1101, '494', '-'),
(1102, '495', '-'),
(1103, '496', '-'),
(1104, '497', '-'),
(1105, '498', '-'),
(1106, '499', '-'),
(1107, '500', 'PEREKONOMIAN '),
(1108, '500.1', 'Dewan Stabilisasi'),
(1109, '501', 'Pengadaan Pangan'),
(1110, '502', 'Pengadaan Sandang '),
(1111, '503', 'Perizinan pada umumnya.Untuk perizinan sesuatu bidang,klasifikasikan pada masalahnya.'),
(1112, '504', '-'),
(1113, '505', '-'),
(1114, '506', '-'),
(1115, '507', '-'),
(1116, '508', '-'),
(1117, '509', '-'),
(1118, '510', 'PERDAGANGAN'),
(1120, '510.1', 'Promosi perdagangan'),
(1121, '510.11', 'Pekan Raya'),
(1122, '510.12', 'Iklan'),
(1123, '510.13', 'Pameran/ pameran Non komersial Lh.487.1'),
(1124, '510.14', 'Tataniaga'),
(1125, '510.15', 'EXPO'),
(1126, '510.16', 'Promosi Inventaris'),
(1127, '510.2', 'Pelelangan'),
(1128, '510.3', 'Tera'),
(1129, '511', 'Pemasaran '),
(1130, '511.1', 'Sembilan bahan pokok.Tambahan kode wilayah Beras,garam,minyak tanah,minyak goreng,sabun, Cabe, Bawang Merah dan sebagainya'),
(1131, '511.2', 'Pasar'),
(1132, '511.3', 'Pertokoan,kaki lima,kios, super market/Swalayan, Mall'),
(1133, '512', 'Ekspor'),
(1134, '513', 'Impor'),
(1135, '514', 'Perdagangan antar pulau, Dokumen Pembayaran (SKBDN/Surat Kredit Berdokumen Dalam Negri)'),
(1136, '515', 'Perdagangan Luar Negeri, Dokumen Pembayaran (L/C/Letter OF Credit),Dokumen Pengangkutan (Bill of Lading)'),
(1137, '516', 'Pergudangan Termasuk Tangki penyimpanan minyak goreng, Peti kemas/ Container'),
(1138, '517', 'Aneka Usaha perdagangan'),
(1139, '518', 'Koperasi( untuk BUUD,KUD lihat:412.31412.32)'),
(1140, '519', '-'),
(1141, '520', 'PERHATIAN'),
(1142, '521', 'Tanaman pangan'),
(1143, '521.1', 'Program'),
(1144, '521.11', 'Bimas/Inmas, termasuk Kredit UsahaTani (KUD), Penyuluhan'),
(1145, '521.2', 'Produksi '),
(1146, '521.21', 'Padi'),
(1147, '521.22', 'Palawija, Sawah, Gogo, Huma'),
(1148, '521.23', 'Horticultura.'),
(1149, '521.24', 'Sawah '),
(1150, '521.25', 'Gogo '),
(1151, '521.26', 'Huma'),
(1152, '521.231', 'Sayuran'),
(1153, '521.232', 'Buah-buahan'),
(1154, '521.233', 'Tanaman Hias'),
(1155, '521.234', 'Perlebahan'),
(1156, '521.24', 'Panen gagal(puso)'),
(1157, '521.3', 'Sarana Usaha pertanian'),
(1158, '521.31', 'Peralatan meliputi:Traktor dan sebagainya'),
(1159, '521.32', 'Pembibitan'),
(1160, '521.33', 'Pupuk'),
(1161, '521.4', 'Perlindungan tanaman'),
(1162, '521.41', 'Penyakit '),
(1163, '521.411', 'Penyakit Daun '),
(1164, '521.412', 'Penyakit Batang'),
(1165, '521.413', 'Hama'),
(1166, '521.42', 'Hama'),
(1167, '521.421', 'WERENG'),
(1168, '521.422', 'Walang Sangit'),
(1169, '521.423', 'Tungro'),
(1170, '521.424', 'Tikus'),
(1171, '521.425', 'Pemberantasan '),
(1172, '521.43', 'Pestisida'),
(1173, '521.5', 'Tanah pertanian pangan'),
(1174, '521.51', 'Persawahan '),
(1175, '521.52', 'Perladangan'),
(1176, '521.53', 'Kebun'),
(1177, '521.54', 'Tanah kritis'),
(1178, '521.6', 'Pengusaha,Petani'),
(1179, '521.61', 'Bina Usaha '),
(1180, '521.62', 'Pasca Panen'),
(1181, '522', 'Kehutanan'),
(1182, '522.1', 'Program'),
(1183, '522.11', 'Hak pengusahaan hutan'),
(1184, '522.12', 'Tata guna hutan'),
(1185, '522.13', 'Perpetaan hutan'),
(1186, '522.14', 'Tumpang sari'),
(1187, '522.15', 'Jatinasasi'),
(1188, '522.2', 'Produksi'),
(1189, '522.21', 'Kayu'),
(1190, '522.22', 'Non Kayu'),
(1191, '522.3', 'Sarana Usaha kehutanan'),
(1192, '522.4', 'Penghijauan, Reboisasi'),
(1193, '522.5', 'Kelestarian'),
(1194, '522.51', 'Cagar alam,marga satwa,suaka marga satwa.'),
(1195, '522.52', 'Berburu.Meliputi larangan dan ijin berburu'),
(1196, '522.53', 'Kebun Binatang'),
(1197, '523', 'Perikanan'),
(1198, '523.1', 'Program'),
(1199, '523.11', 'Penyuluhan'),
(1200, '523.12', 'Teknologi'),
(1201, '523.2', 'Produksi'),
(1202, '523.21', 'Pelelangan'),
(1203, '523.3', 'Usaha perikanan'),
(1204, '523.31', 'Pembibitan, peminjahan ikan, pembenihan ikan, budi daya ikan, Areal perikanan, Ikan Hias, Rumput laut, Imunisda'),
(1205, '523.32', 'Daerah penangkapan'),
(1206, '523.4', 'Sarana'),
(1207, '523.41', 'Peralatan '),
(1208, '523.411', 'Kapal'),
(1209, '523.412', 'Jaring'),
(1210, '523.413', 'Pelabuhan/Dermaga'),
(1211, '523.414', 'Tempat pelelangan Ikan (TPI)'),
(1212, '523.415', '-'),
(1213, '523.42', 'Pelabuhan'),
(1214, '523.5', 'Pengusaha,nelayan'),
(1215, '523.51', 'Kapal/ Motor Boat'),
(1216, '523.52', 'Jaring'),
(1217, '523.53', 'Cold Storage'),
(1218, '523.54', 'Tempat es'),
(1219, '523.6', 'Hama penyakit termasuk pemberantasanya'),
(1220, '523.7', 'Data perikanan'),
(1221, '523.8', 'Nelayan '),
(1222, '523.81', 'Perkampungan Nelayan'),
(1223, '523.82', 'Pelanggaran Kapal '),
(1224, '523.9', 'Pelestarian ikan'),
(1225, '524', 'Peternakan'),
(1226, '524.1', 'Produksi'),
(1227, '524.11', 'Susu ternak rakyat'),
(1228, '524.12', 'Telor'),
(1229, '524.13', 'Daging '),
(1230, '524.14', 'Kulit'),
(1231, '524.2', 'Sarana usaha peternakan'),
(1232, '524.21', 'Pembibitan'),
(1233, '524.22', 'Lahan kebun bibit'),
(1234, '524.23', 'Kandang'),
(1235, '524.3', 'Kesehatan Hewan'),
(1236, '524.31', 'Penyakit Hewan'),
(1237, '524.32', 'Pos Kesehatan Hewan (POSKESWAN)'),
(1238, '524.33', 'Tesi Pullorum '),
(1239, '524.34', 'Karantina'),
(1240, '524.4', 'Perunggasan'),
(1241, '524.41', 'Ayam ras'),
(1242, '524.42', 'Ayam Buras '),
(1243, '524.5', 'Pengembangan Ternak '),
(1244, '524.51', 'Inseminasi Buatan '),
(1245, '524.52', 'Pembibitan/Bibit Unggul'),
(1246, '524.53', 'Penyebaran ternak'),
(1247, '524.6', 'Makanan Ternak'),
(1248, '524.7', 'Tempat Pemotongan Hewan, Rumah potong Ayam (RPA)'),
(1249, '524.8', 'Data Pertenakan '),
(1250, '525', 'Perkebunan'),
(1251, '525.1', 'Program'),
(1252, '525.2', 'Produksi'),
(1253, '525.21', 'Karet'),
(1254, '525.22', 'The'),
(1255, '525.23', 'Tembakau'),
(1256, '525.24', 'Tebu'),
(1257, '525.25', 'Cengkeh'),
(1258, '525.26', 'Kelapa/Kopra/Kelapa sawit'),
(1259, '525.27', 'Kopi'),
(1260, '525.28', '-'),
(1261, '525.29', 'Aneka tanaman'),
(1262, '525.30', 'Pembibitan '),
(1263, '525.31', 'Hama/ Penyakit (Gulma,Badra, Termasuk Pemberantasannya '),
(1264, '525.32', 'Pengolahan Tanah '),
(1265, '526', '-'),
(1266, '527', '-'),
(1267, '528', '-'),
(1268, '529', '-'),
(1269, '530', 'PERINDUSTRIAN'),
(1270, '530.08', 'Undang-undang gangguan'),
(1271, '531', 'Industi logam'),
(1272, '532', 'Industri mesin/elektronik'),
(1273, '533', 'Industri kimia/farmasi'),
(1274, '534', 'Industri tekstil'),
(1275, '535', 'Industri makanan/minuman'),
(1276, '536', 'Aneka industri/perusahaan'),
(1277, '536.1', 'Home Industri'),
(1278, '537', 'Aneka kerajinan'),
(1279, '537.1', 'Kerajinan Rakyat '),
(1280, '537.2', 'Handy Craft'),
(1281, '538', 'Usaha Negara/ BUMN'),
(1282, '538.1', 'Perjan'),
(1283, '538.2', 'Perum'),
(1284, '538.3', 'Persero'),
(1285, '538.4', 'PT'),
(1286, '539', 'Perusahaan Daerah'),
(1287, '540', 'PERTAMBANGAN/KESAMUDRAAN'),
(1288, '541', 'Minyak bumi/bensin (Bahan Galian)'),
(1289, '541.1', 'Pengusahaan'),
(1290, '541.11', 'Eksploitasi'),
(1291, '541.12', 'Kontrak kerja'),
(1292, '541.13', 'Eksplorasi '),
(1293, '541.14', 'Pemurnian'),
(1294, '541.2', 'Pengolahan '),
(1295, '541.3', 'Penyaluran'),
(1296, '541.31', 'Tangki,pompa,tanker'),
(1297, '541.4', 'Bahan Galian Strategis '),
(1298, '541.41', 'Bitumen cair ,lilin bumi, gas alam'),
(1299, '541.42', 'Aspal '),
(1300, '541.43', 'Bitumen padat'),
(1301, '541.44', 'Batu bara'),
(1302, '541.45', 'Uranium, Radium, Thorium, Nikel, Kobalt'),
(1303, '541.5', 'Bahan Galian Vital'),
(1304, '541.51', 'Besi'),
(1305, '541.52', 'mangaan'),
(1306, '541.53', 'Molibden'),
(1307, '541.54', 'khrom'),
(1308, '541.55', 'wolfram'),
(1309, '541.56', 'vanadium'),
(1310, '541.57', 'titan,seng, Timah, tembaga,Emas, platina'),
(1311, '541.58', 'Perak, air raksa, intan, Arsin, antimony'),
(1312, '541.59', 'Yodium, belerang, korundum, klor, kriolot'),
(1313, '541.6', 'Bahan Galian yang tidak termasuk galian Strategis atau Vital'),
(1314, '541.61', 'Nitrat-nitrat,posphate-posphat, garam batu'),
(1315, '541.62', 'Asbes, talk, mika, grafit, magndesit'),
(1316, '541.63', 'Yarosit, kusit, towas (alum), oker'),
(1317, '541.64', 'Batu permata, batu setengah permata, pasir kwarsa, kaolin, felosfor, gips, bentanit'),
(1318, '541.65', 'Batu apung, tras, opsidian, perlit, tanah diatom, tanah serap'),
(1319, '541.66', 'Marmer, batu tulis, batu kapur, dolomite, kalsit'),
(1320, '541.67', 'Ganit, andesit, basal, tarakhit, tanah liat, pasir '),
(1321, '542', 'Gas bumi'),
(1322, '543', 'Logam mulya'),
(1323, '543.1', 'Intan,emas,perak'),
(1324, '544', 'Logam'),
(1325, '544.1', 'Timah'),
(1326, '544.2', 'Aluminium,boxit'),
(1327, '544.3', 'Besi.Termasuk besi tua'),
(1328, '544.4', 'Tembaga'),
(1329, '545', 'Aneka tambang/bahan galian'),
(1330, '546', 'Geologi'),
(1331, '546.1', 'Vulkanologi'),
(1332, '546.11', 'Pengawasan gunung berapi'),
(1333, '546.2', 'Sumur artetis'),
(1334, '547', 'Hidrologi'),
(1335, '548', 'Kesamudraan'),
(1336, '549', '-'),
(1337, '450', 'PERHUDUNGAN'),
(1338, '551', 'Perhubungan darat'),
(1339, '551.1', 'Lalu lintas jalan raya,sungai,danau'),
(1340, '551.11', 'Keamanan lalu lintas rambu-rambu'),
(1341, '551.2', 'Angkutan jalan raya'),
(1342, '551.21', 'Perizinan '),
(1343, '551.22', 'Terminal'),
(1344, '551.23', 'Alat angkutan'),
(1345, '551.24', 'Alat uji'),
(1346, '551.3', 'Angkutan sungai'),
(1347, '551.31', 'Perizinan'),
(1348, '551.32', 'Terminal'),
(1349, '551.33', 'Pelabuhan'),
(1350, '551.4', 'Angkutan danau'),
(1351, '551.41', 'Perizinan'),
(1352, '551.42', 'Terminal'),
(1353, '551.43', 'Pelabuhan'),
(1354, '551.5', 'Feri'),
(1355, '551.51', 'Perizinan'),
(1356, '551.52', 'Terminal'),
(1357, '551.53', 'Pelabuhan'),
(1358, '551.6', 'Perkereta-apian'),
(1359, '551.61', 'Pintu lintasan '),
(1360, '551.62', 'Signal'),
(1361, '551.63', 'Stasiun'),
(1362, '552', 'Perhubungan laut'),
(1363, '552.1', 'Lalu lintas angkutan laut'),
(1364, '522.11', 'Keamanan lalu lintas,rambu-rambu'),
(1365, '552.12', 'Pelayaran dalam Negeri'),
(1366, '552.121', 'Mercusuar'),
(1367, '552.13', 'Pelayaran luar negeri'),
(1368, '552.2', 'Perkapalan.Alat angkutan'),
(1369, '552.3', 'Pelabuhan/dermaga'),
(1370, '552.4', 'Pengerukan'),
(1371, '552.5', 'Penjagaan pantai'),
(1372, '553', 'Perhubungan Udara'),
(1373, '553.1', 'Lalulintas Udara '),
(1374, '553.2', 'Pelabuhan Udara/Bandara/Air port'),
(1375, '553.3', 'Alat angkutan'),
(1376, '554', 'Pos'),
(1377, '555', 'Telekomunikasi'),
(1378, '555.1', 'Telepon, wartel'),
(1379, '555.2', 'Telegrap'),
(1380, '555.3', 'Telex/SSB'),
(1381, '555.4', 'Satelit'),
(1382, '555.5', 'Stasiun bumi'),
(1383, '555.6', 'Internet/Warnet'),
(1384, '555.7', 'Faximale'),
(1385, '555.8', 'Satelit, Stasiun bumi'),
(1386, '556', 'Pariwisata dan rekreasi'),
(1387, '556.1', 'Obyek kepariwisataan'),
(1388, '556.11', 'Taman Mini Indonesia Indah'),
(1389, '556.2', 'Perhotelan'),
(1390, '556.3', 'Travel service'),
(1391, '556.4', 'Tempat rekreasi'),
(1392, '556.5', 'Promosi Kepariwisataan'),
(1393, '556.51', 'Mandala wisata '),
(1394, '556.52', 'Tourism Information Centre'),
(1395, '556.6', 'Perjalanan wisata'),
(1396, '556.61', 'Tour and Travel Agent'),
(1397, '556.62', 'Biro Perjalanan'),
(1398, '556.7', 'Pramuwisata'),
(1399, '556.71', 'Pramuwisata Madya'),
(1400, '556.72', 'Pramuwisata Muda'),
(1401, '556.73', 'Pramuwisata Khusus'),
(1402, '556.8', 'Fasilitas Wisatawan'),
(1403, '557', 'Meteorologi'),
(1404, '557.1', 'Curah Hujan '),
(1405, '557.2', 'Hujan Batuan'),
(1406, '557.3', 'Peneropongan Bintang'),
(1407, '558', '-'),
(1408, '559', '-'),
(1409, '560', 'TENAGA KERJA'),
(1410, '560.1', 'Pengangguran'),
(1411, '561', 'Upah'),
(1412, '562', 'Penempatan tenaga kerja'),
(1413, '563', 'Latihan Kerja '),
(1414, '564', 'Tenaga sukarela'),
(1415, '564.1', 'Butsi'),
(1416, '564.2', 'Padat karya'),
(1417, '565', 'Perselisihan perburuhan'),
(1418, '566', 'Keselamatan kerja'),
(1419, '566.1', 'ASTEK'),
(1420, '566.2', 'JAMSOSTEK'),
(1421, '567', 'Pemutusan hubungan kerja'),
(1422, '568', 'Kesejahteraan buruh'),
(1423, '569', 'Tenaga kerja orang asing'),
(1424, '570', 'PERMODALAN'),
(1425, '571', 'Modal domestik'),
(1426, '572', 'Modal asing'),
(1427, '573', 'Modal patungan (joint venture)/ penyertaan modal'),
(1428, '574', 'Pasar uang dan modal, Bursa efek'),
(1429, '575', 'Saham'),
(1430, '576', '-'),
(1431, '577', '-'),
(1432, '578', '-'),
(1433, '579', '-'),
(1434, '580', 'PERBANKAN/ MONETER'),
(1435, '581', 'Kredit'),
(1436, '582', 'Inventasi/IIRIF'),
(1437, '583', 'Deposito, Tabungan'),
(1438, '584', 'Bank Pembangunan Daerah'),
(1439, '584.1', 'Lembaga Perbankan'),
(1440, '584.11', 'Bank Sentral'),
(1441, '584.111', 'Bank Indonesia'),
(1442, '584.12', 'Bank Umum'),
(1443, '584.121', 'Bank Pemerintah '),
(1444, '584.122', 'Bank Swasta'),
(1445, '584.123', 'Bank Perkreditan Rakyat (BPR)'),
(1446, '584.13', 'Bank Syariah'),
(1447, '584.131', 'BMT ( Baitul Mal wal Tamwil)'),
(1448, '585', 'Asuransi'),
(1449, '586', 'Alat pembayaran. Chek, giro, wesel,trasfer'),
(1450, '587', 'Fiscal'),
(1451, '588', 'Hutang negara, obligasi'),
(1452, '589', 'Moneter/Transaksi/ Moneter lainya'),
(1453, '590', 'AGRARIA'),
(1454, '591', 'Tata guna tanah'),
(1455, '591.1', 'Pemetaan dan pengukuran '),
(1456, '591.2', 'Perpetaan '),
(1457, '591.3', 'Penyediaan data, peta dan publikasi'),
(1458, '591.4', 'Fatwa tataguna tanah'),
(1459, '591.5', 'Tanah kritis'),
(1460, '592', 'Landreform'),
(1461, '592.1', 'Redistribusi'),
(1462, '592.11', 'Pendaftaran pemilikan dan pengurusan tanah pertanian ');
INSERT INTO `kode_surat` (`kodesurat_id`, `kode`, `tentang`) VALUES
(1463, '592.12', 'Penentuan tanah obyek landreform'),
(1464, '592.13', 'Pembagian tanah obyek landreform'),
(1465, '592.14', 'Sengketa redistribusi tanah obyek landreform'),
(1466, '592.2', 'Ganti rugi'),
(1467, '592.21', 'Ganti rugi tanah kelebihan'),
(1468, '592.211', 'Sengketa ganti rugi tanah kelebihan'),
(1469, '592.22', 'Ganti rugi tanah absentee'),
(1470, '592.221', 'Sengketa ganti rugi tanah absentee'),
(1471, '592.23', 'Ganti rugi tanah pertikelir'),
(1472, '592.231', 'Sengketa ganti rugi tanah pertikelir'),
(1473, '592.3', 'Bagi hasil'),
(1474, '592.31', 'Penetapan imbangan bagi hasil'),
(1475, '592.32', 'Pelaksanaan perjanjian bagi hasil'),
(1476, '592.33', 'Sengketa perjanjian bagi hasil'),
(1477, '592.4', 'Gadai tanah'),
(1478, '592.41', 'Pendaftaran pelaksanaan gadai tanah'),
(1479, '592.42', 'Pelaksanaan gadai tanah'),
(1480, '592.43', 'Sengketa gadai tanah'),
(1481, '592.5', 'Bimbingan dan penyuluhan'),
(1482, '592.6', 'Pengembangan '),
(1483, '592.7', 'Yayasan dan landreform ( Y.D.L )'),
(1484, '592.8', '-'),
(1485, '593', 'Pengurusan hak-hak tanah'),
(1486, '593.01', 'Penyusunan program dan bimbingan tehnis'),
(1487, '593.1', 'Sewa tanah'),
(1488, '593.11', 'Sewa tanah untuk tanaman tertentu: tebu ,tembakau, rosela, corhourus'),
(1489, '593.2', 'Hak milik'),
(1490, '593.21', 'Perorangan'),
(1491, '593.22', 'Badan Hukum'),
(1492, '593.3', 'Hak pakai'),
(1493, '593.31', 'Perorangan'),
(1494, '593.311', 'Warga negara Indonesia'),
(1495, '593.312', 'Warga negara asing'),
(1496, '593.32', 'Badan Hukum'),
(1497, '593.321', 'Badan hukum Indinesia'),
(1498, '593.322', 'Badan hukum asing. Keduta, Konsulat Kantor dagang asing '),
(1499, '593.33', 'Tanah gedung-gedung negeri'),
(1500, '593.4', 'Guna Usaha'),
(1501, '593.41', 'Perkebunan besar'),
(1502, '593.42', 'Perkebuna rakyat'),
(1503, '593.43', 'perternakan '),
(1504, '593.44', 'Perikanan'),
(1505, '593.45', 'Kehutanan'),
(1506, '593.5', 'Hak guna bangunan '),
(1507, '593.51', 'Perorangan'),
(1508, '593.52', 'Badan hukum'),
(1509, '593.53', 'P3MB ( Panitia pelaksanaan penguasaan milik Belanda)'),
(1510, '593.54', 'Badan hukum asing Belanda- PRK No. 5/65'),
(1511, '593.55', 'Pemulihan hak ( PenPres 4/1060)'),
(1512, '593.6', 'Hak pengelolaan'),
(1513, '593.61', 'PN. Perumnas. Bonded ware house. Industrial estate. Real estate'),
(1514, '593.62', 'Perusahaan Daerah pembangunan perumahan'),
(1515, '593.63', 'HPH (Hak Pengolaha Hutan)'),
(1516, '593.64', 'HPHH (Hak Pengolan Hasil Hutan)'),
(1517, '593.7', 'Sengketa tanah'),
(1518, '593.71', 'Peradilan perkara tanah (lihat juga 183)'),
(1519, '593.8', 'Pencabutan dan pembebasan tanah'),
(1520, '593.81', 'Pencabutan hak'),
(1521, '593.82', 'Pembebasan tanah'),
(1522, '593.83', 'Ganti rugi tanah'),
(1523, '594', 'Pendaftaran tanah'),
(1524, '594.1', 'Pengukuran/pemetaan'),
(1525, '594.11', 'Fotogrametri'),
(1526, '594.12', 'Terristris'),
(1527, '594.13', 'Triangulasi'),
(1528, '594.14', 'Peralatan'),
(1529, '594.2', 'Dana pengukuran ( Permen agraria No. 6/1965)'),
(1530, '594.3', 'Sertifikat'),
(1531, '594.4', 'Pejabat pembuat akte tanah (PPAT)/ Pejabat Pembuat Akta Tanah Sementara (PPATS)'),
(1532, '595', 'Transmigrasi'),
(1533, '595.1', 'Tata guna tanah'),
(1534, '595.2', 'Landreform'),
(1535, '595.3', 'Pengurusan hak-hak tanah'),
(1536, '595.4', 'Pendaftaran tanah'),
(1537, '596', '-'),
(1538, '597', '-'),
(1539, '598', '-'),
(1540, '599', '-'),
(1541, '600', 'PEKERJAAN UMUM DAN KETENAGAAN'),
(1542, '601', 'tata banguna, kontruksi, industri kontruksi'),
(1543, '602', 'Kontraktor pembohong'),
(1544, '602.1', 'Tender'),
(1545, '603', 'arsitektur'),
(1546, '604', 'Bahan bangunan'),
(1547, '604.1', 'Tanah dan batu seperti: Batu belah, Steen slaag, split dan sebagainya. Pasir, koral, lempung,kapur, marmer'),
(1548, '604.2', 'Aspal (Aspal buatan,aspal alam (butas))'),
(1549, '604.3', 'Besi dan logam lainnya '),
(1550, '604.31', 'Besi beton'),
(1551, '604.32', 'Besi profil (Konstruksi)'),
(1552, '604.33', 'Paku'),
(1553, '604.34', 'alumunium profil'),
(1554, '604.4', 'Bahan-bahan pelindung dan pengawet(Cat,tech oil,pengawet kayu)'),
(1555, '604.5', 'Semen'),
(1556, '604.6', 'Kayu Sepert: balok, papan, dolken, plywood, gabus dsb.'),
(1557, '604.7', 'Bahan Penutup Atap ( Genteng, asbes gelombang)'),
(1558, '604.8', 'Alat-alat penggantung dan pengunci'),
(1559, '604.9', 'Bahan-bahan bangunan lainya'),
(1560, '605', 'Instalansi'),
(1561, '605.1', 'Instalansi Bangunan'),
(1562, '605.2', 'Instalansi Listrik'),
(1563, '605.3', 'Instalansi air/sanitasi'),
(1564, '605.4', 'Instalansi pengaturan udara'),
(1565, '605.5', 'Instalansi akustik'),
(1566, '605.6', 'Instalansi cahaya/penerangan'),
(1567, '606', 'Konstruksi pencegahan'),
(1568, '606.1', 'konstruksi pencegahan terhadap kebakaran'),
(1569, '606.2', 'Terhadap Gempa'),
(1570, '606.3', 'Terhadap Angin/udara/panas'),
(1571, '606.4', 'Terhadap Kegaduhan'),
(1572, '606.5', 'Terhadap gas/explosive'),
(1573, '606.6', 'Terhadap serangga'),
(1574, '606.7', 'Terhadap Radiasi atom'),
(1575, '607', '-'),
(1576, '608', '-'),
(1577, '609', '-'),
(1578, '610', 'PENGAIRAN'),
(1579, '611', 'Irigasi'),
(1580, '611.1', 'Bangunan Waduk '),
(1581, '611.11', 'Bendungan '),
(1582, '611.12', 'Tanggul'),
(1583, '611.13', 'Pelimpah banjir'),
(1584, '611.14', 'Menara pengambilan'),
(1585, '611.2', 'Bangunan Pengambilan'),
(1586, '611.21', 'Bendungan '),
(1587, '611.22', 'Bendungan dengan pintu bilas '),
(1588, '611.23', 'Bendungan dengan pompa'),
(1589, '611.24', 'Pengambilan bebas'),
(1590, '611.25', 'Pengambilan bebas dengan pompa'),
(1591, '611.26', 'Sumur dengan pompa'),
(1592, '611.27', 'Kantung lumpur '),
(1593, '611.28', 'Silt ekstraktor'),
(1594, '611.29', 'Escope chanel'),
(1595, '611.3', 'Bangunan pembawa'),
(1596, '611.31', 'Saluran'),
(1597, '611.311', 'Saluran Induk'),
(1598, '611.312', 'Saluran sekunder'),
(1599, '611.313', 'Suplesi'),
(1600, '611.314', 'Tersier'),
(1601, '611.315', 'Saluran kwarter'),
(1602, '611.316', 'Saluran pasangan'),
(1603, '611.317', 'Saluran tertutup/Terowongan'),
(1604, '611.32', 'Bangunan'),
(1605, '611.321', 'Bangunan bagi'),
(1606, '611.322', 'Bangunan bagi dan sadap'),
(1607, '611.323', 'Bangunan sadap'),
(1608, '611.324', 'Bangunan check'),
(1609, '611.325', 'Bangunan terjun'),
(1610, '611.33', 'Box Tersier '),
(1611, '611.34', 'Got miring'),
(1612, '611.35', 'Talang'),
(1613, '611.36', 'Syphon'),
(1614, '611.37', 'Gorong-gorong'),
(1615, '611.38', 'Pelimpah samping'),
(1616, '611.4', 'Bangunan Pembuang'),
(1617, '611.41', 'Saluran'),
(1618, '611.411', 'Saluran pembuang induk '),
(1619, '611.412', 'Saluran pembuang sekunder'),
(1620, '611.413', 'Saluran pembuang tersier'),
(1621, '611.42', 'Bangunan'),
(1622, '611.421', 'Bangunan out let '),
(1623, '611.422', 'Bangunan terjun'),
(1624, '611.423', 'Bangunan penambah banjir'),
(1625, '611.43', 'Gorong-gorong pembuang'),
(1626, '611.44', 'Taalang pembuang'),
(1627, '611.45', 'Syphon pembuang'),
(1628, '611.5', 'Bangunan lainya'),
(1629, '611.51', 'Jalan '),
(1630, '611.511', 'Jalan Inspeksi'),
(1631, '611.512', 'Jalan logistik'),
(1632, '611.52', 'Jembatan'),
(1633, '611.521', 'Jembatan Inspeksi'),
(1634, '611.522', 'Jembatan Hewan'),
(1635, '611.53', 'Tangga Cuci'),
(1636, '611.54', 'Kubangan Kerbau'),
(1637, '611.55', 'Waduk Lapangan'),
(1638, '611.56', 'Bangunan Penunjang'),
(1639, '611.57', 'Jaringan telepon '),
(1640, '611.58', 'Stasiun Argo'),
(1641, '612', 'Poider '),
(1642, '612.1', 'Tanggul Keliling'),
(1643, '612.11', 'Tanggul'),
(1644, '612.12', 'Bangunan Penutup Sungai'),
(1645, '612.13', 'Jembatan'),
(1646, '612.2', 'Bangunan pembawa'),
(1647, '612.21', 'Saluran'),
(1648, '612.211', 'Saluran muka'),
(1649, '612.212', 'Saluran pembawa induk'),
(1650, '612.213', 'Saluran pembawa sekunder'),
(1651, '612.22', 'Stasiun pompa pemasukan '),
(1652, '612.23', 'Bangunan bagi '),
(1653, '612.24', 'Gorong-gorong'),
(1654, '612.25', 'Syphon'),
(1655, '612.3', 'Bangunan pembuangan'),
(1656, '612.31', 'Stasiun pompa pembuang'),
(1657, '612.32', 'Saluran '),
(1658, '612.321', 'Saluran pembuangan induk '),
(1659, '612.322', 'Saluran pembuangan sekunder '),
(1660, '612.33', 'Pintu air pembuangan'),
(1661, '612.34', 'Gorong-gorong pembuangan'),
(1662, '612.35', 'Syphon pembuangan'),
(1663, '612.4', 'Bangunan lainya'),
(1664, '612.41', 'Bangunan'),
(1665, '612.411', 'Bangunan Pengukur air '),
(1666, '612.412', 'Bangunan pengukur curah hujan'),
(1667, '612.413', 'Bangunan gudang stasiun pompa'),
(1668, '612.414', 'Bangunan listrik pompa'),
(1669, '612.42', 'Rumah petugas eksploitasi'),
(1670, '613', 'Pasang Surut'),
(1671, '613.1', 'Bangunan pembawa'),
(1672, '613.11', 'Saluran '),
(1673, '613.111', 'Saluran pembawa induk'),
(1674, '613.112', 'Saluran pembawa sekunder'),
(1675, '613.113', 'Saluran pembawa tersier'),
(1676, '613.114', 'Saluran penyimpanan air'),
(1677, '613.12', 'Bangunan pintu pemasukan'),
(1678, '613.2', 'Bangunan pembuang'),
(1679, '613.21', 'Saluran '),
(1680, '613.211', 'Saluran pembuang induk '),
(1681, '613.212', 'Saluran pembuang sekunder '),
(1682, '613.213', 'Saluran pembuang tersier '),
(1683, '613.214', 'Saluran pengumpul air'),
(1684, '613.22', 'Bangunan pintu pembuangan'),
(1685, '613.3', 'Bangunan lainya'),
(1686, '613.31', 'Kolam pasang'),
(1687, '613.32', 'Saluran '),
(1688, '613.321', 'Saluran lalulintas'),
(1689, '613.322', 'Saluran muka'),
(1690, '613.33', 'Bangunan'),
(1691, '613.331', 'Bangunan penangkis kotoran'),
(1692, '613.332', 'Bangunan pengukur muka air '),
(1693, '613.333', 'Bangunan pengukur curah hujan'),
(1694, '613.34', 'Jalan'),
(1695, '613.35', 'Jembatan'),
(1696, '614', 'Pengendalian sungai'),
(1697, '614.1', 'Bangunan pengaman'),
(1698, '614.11', 'Tanggul banjir'),
(1699, '614.12', 'Pintu pengatur banjir'),
(1700, '614.13', 'Klep pengatur banjir'),
(1701, '614.14', 'Tembok pengaman talud'),
(1702, '614.15', 'Krib'),
(1703, '614.16', 'Kantung lummpur'),
(1704, '614.17', 'Check dam'),
(1705, '614.18', 'Syphon'),
(1706, '614.2', 'Saluran pengaman '),
(1707, '614.21', 'Saluran banjir'),
(1708, '614.22', 'Saluran drainage'),
(1709, '614.23', 'Corepure'),
(1710, '614.3', 'Bangunan lainya'),
(1711, '614.31', 'Warning System '),
(1712, '614.32', 'Stasiun'),
(1713, '614.321', 'Stasiun pengukur curah hujan '),
(1714, '614.322', 'Stasiun pengukur air'),
(1715, '614.323', 'Stasiun pengukur cuaca'),
(1716, '614.324', 'Stasiun pos penjagaan '),
(1717, '615', 'Pengaman pantai'),
(1718, '615.1', 'Tanggul '),
(1719, '615.2', 'Krib'),
(1720, '615.3', 'Bangunan lainya'),
(1721, '616', 'Air tanah '),
(1722, '616.1', 'Stasiun pompa'),
(1723, '616.2', 'Bangunan pembawa'),
(1724, '616.3', 'Bangunan pembuang'),
(1725, '616.4', 'Bangunan lainya'),
(1726, '617', '-'),
(1727, '618', '-'),
(1728, '619', '-'),
(1729, '620', 'JALAN '),
(1730, '621', 'Jalan Kota'),
(1731, '621.1', 'Daerah penguasaan '),
(1732, '621.11', 'Tanah '),
(1733, '621.12', 'Tanaman '),
(1734, '621.13', 'Bangunan'),
(1735, '621.2', 'Bangunan sementara'),
(1736, '621.21', 'Jalan sementara'),
(1737, '621.22', 'Jembatan sementara'),
(1738, '621.23', 'Kantor proyek'),
(1739, '621.24', 'Gudang proyek'),
(1740, '621.25', 'Barak kerja'),
(1741, '621.26', 'Laboratorium lapangan '),
(1742, '621.27', 'Rumah'),
(1743, '621.3', 'Badan jalan'),
(1744, '621.31', 'Pekerjaan tanah (earth work)'),
(1745, '621.32', 'Stabilisasi'),
(1746, '621.4', 'Perkerasan'),
(1747, '621.41', 'Lapisan pondasi bawah'),
(1748, '621.42', 'Lapisan pondasi '),
(1749, '621.43', 'Lapisan permukaan'),
(1750, '621.5', 'Drainage'),
(1751, '621.51', 'Parit sawah '),
(1752, '621.52', 'Gorong-gorong (culvert)'),
(1753, '621.6', 'Buku Trotir'),
(1754, '621.61', 'Tanah'),
(1755, '621.62', 'Perkerasan'),
(1756, '621.63', 'Pasangan'),
(1757, '621.7', 'Median'),
(1758, '621.71', 'Tanah'),
(1759, '621.72', 'Tanaman '),
(1760, '621.73', 'Perkerasan'),
(1761, '621.74', 'Pasangan'),
(1762, '621.8', 'Daerah Samping'),
(1763, '621.81', 'Tanaman '),
(1764, '621.82', 'Pagar'),
(1765, '621.9', 'Bangunan pelengkap dan pengaman'),
(1766, '621.91', 'Rambu-rambu/ tanda tanda lalu lintas'),
(1767, '621.92', 'Lampu penerangan'),
(1768, '621.93', 'Lampu pengatur lalulintas'),
(1769, '621.94', 'Patok-patok KM'),
(1770, '621.95', 'Patok-patok R.O.W.(Sempadan)'),
(1771, '621.96', 'Rel pengaman'),
(1772, '621.97', 'Pagar'),
(1773, '621.98', 'Turap penahan'),
(1774, '621.99', 'Bronjong'),
(1775, '622', 'JALAN LUAR KOTA'),
(1776, '622.1', 'Daerah penguasaan '),
(1777, '622.11', 'Tanah'),
(1778, '622.12', 'Tanaman '),
(1779, '622.13', 'Bangunan'),
(1780, '622.2', 'Bangunan sementara'),
(1781, '622.21', 'Jalan sementara'),
(1782, '622.22', 'Jembatan sementara'),
(1783, '622.23', 'Kantor proyek'),
(1784, '622.24', 'Gudang proyek'),
(1785, '622.25', 'Barak kerja'),
(1786, '622.26', 'Laboratorium lapangan '),
(1787, '622.27', 'Rumah'),
(1788, '622.3', 'Badan jalan'),
(1789, '622.31', 'Pekerjaan tanah (earth work)'),
(1790, '622.32', 'Stabilitas'),
(1791, '622.4', 'Perkerasan(pavement)'),
(1792, '622.41', 'Lapis pondasi bawah'),
(1793, '622.42', 'Lapis pondasi '),
(1794, '622.43', 'Lapis permukaan'),
(1795, '622.5', 'Drainage'),
(1796, '622.51', 'Parit '),
(1797, '622.52', 'Gorong-gorong(culvert)'),
(1798, '622.53', 'Sub drainage'),
(1799, '622.6', 'Trotoir'),
(1800, '622.61', 'Tanah'),
(1801, '622.62', 'Perkerasan'),
(1802, '622.71', 'Median'),
(1803, '622.72', 'Tanah'),
(1804, '622.73', 'Tanaman '),
(1805, '622.74', 'Perkerasan'),
(1806, '622.75', 'Pasangan'),
(1807, '622.8', 'Daerah samping'),
(1808, '622.81', 'Tanaman '),
(1809, '622.82', 'Pagar'),
(1810, '622.9', 'Bangunan pelengkap dan pengaman'),
(1811, '622.91', 'Rambu-rambu/ tanda tanda lalu lintas'),
(1812, '622.92', 'Lampu penerangan'),
(1813, '622.93', 'Lampu lalulintas'),
(1814, '622.94', 'Patok-patok KM'),
(1815, '622.95', 'Patok-patok R.O.W.(Sempadan)'),
(1816, '622.96', 'Rel-rel pengaman'),
(1817, '622.97', 'Pagar'),
(1818, '622.98', 'Turap pengaman'),
(1819, '622.99', 'Bronjong'),
(1820, '623', '-'),
(1821, '624', '-'),
(1822, '625', '-'),
(1823, '626', '-'),
(1824, '627', '-'),
(1825, '628', '-'),
(1826, '629', '-'),
(1827, '630', 'JEMBATAN'),
(1828, '631', 'Jembatan pada jalan kota'),
(1829, '631.1', 'Daerah penguasaan '),
(1830, '631.11', 'Tanah'),
(1831, '631.12', 'Tanaman '),
(1832, '631.13', 'Bangunan'),
(1833, '631.2', 'Bangunan sementara'),
(1834, '631.21', 'Jalan sementara'),
(1835, '631.22', 'Jembatan sementara'),
(1836, '631.23', 'Kantor proyek'),
(1837, '631.24', 'Gudang proyek'),
(1838, '631.25', 'Barak kerja'),
(1839, '631.26', 'Laboratorium lapangan '),
(1840, '631.27', 'Rumah'),
(1841, '631.3', 'Pekerjaan tanah (earth work)'),
(1842, '631.31', 'Galian tanah'),
(1843, '631.32', 'Timbunan tanah'),
(1844, '631.4', 'Pondasi'),
(1845, '631.41', 'Pondasi kepala jembatan'),
(1846, '631.42', 'Pondasi pijar'),
(1847, '631.43', 'Pondasi angker'),
(1848, '631.5', 'Bangunan bawah'),
(1849, '631.51', 'Kepala jembatan'),
(1850, '631.52', 'Pilar'),
(1851, '631.53', 'Piloon'),
(1852, '631.54', 'Landasan'),
(1853, '631.6', 'Bangunan'),
(1854, '631.61', 'Gelagar'),
(1855, '631.62', 'Lantai'),
(1856, '631.63', 'Perkerasan'),
(1857, '631.64', 'Jalan orang/Trotoir'),
(1858, '631.65', 'Sandaran'),
(1859, '631.66', 'Talang air'),
(1860, '631.7', 'Bangunan pengaman'),
(1861, '631.71', 'Turap/penahan'),
(1862, '631.72', 'Bronjong'),
(1863, '631.73', 'Strek dam'),
(1864, '631.74', 'Kist dam'),
(1865, '631.75', 'Coupure'),
(1866, '631.76', 'Krib'),
(1867, '631.8', 'Bangunan pelengkap '),
(1868, '631.81', 'Rambu-rambu/Tanda-tanda lalulintas'),
(1869, '631.82', 'Lampu penerangan'),
(1870, '631.83', 'Lampu pengatur lalulintas'),
(1871, '631.84', 'Patok pengaman'),
(1872, '631.85', 'Patok R.O.W.(Sempedan)'),
(1873, '631.86', 'Pagar'),
(1874, '631.9', 'Parit'),
(1875, '631.91', 'Badan '),
(1876, '631.92', 'Perkerasan'),
(1877, '631.93', 'Drainage'),
(1878, '631.94', 'Baku'),
(1879, '631.95', 'Median'),
(1880, '632', 'Jembatan pada jalan luar kota'),
(1881, '632.1', 'Daerah penguasaan '),
(1882, '632.11', 'Tanah'),
(1883, '632.12', 'Tanaman '),
(1884, '632.13', 'Bangunan'),
(1885, '632.2', 'Bangunan sementara'),
(1886, '632.21', 'Jalan sementara'),
(1887, '632.22', 'Jembatan sementara'),
(1888, '632.23', 'Kantor proyek'),
(1889, '632.24', 'Gudang proyek'),
(1890, '632.25', 'Barak kerja'),
(1891, '632.26', 'Laboratorium lapangan '),
(1892, '632.27', 'Rumah'),
(1893, '623.3', 'Pekerjaan tanah '),
(1894, '623.31', 'Galian tanah'),
(1895, '623.32', 'Timbunan tanah'),
(1896, '623.4', 'Pondasi'),
(1897, '623.41', 'Pondasi kepala jembatan'),
(1898, '623.42', 'Pondasi pijar'),
(1899, '623.43', 'Pondasi angker'),
(1900, '623.5', 'Bangunan bawah'),
(1901, '623.51', 'Kepala jembatan'),
(1902, '623.52', 'Pilar'),
(1903, '623.53', 'Piloon'),
(1904, '623.54', 'Landasan'),
(1905, '623.6', 'Bangunan atas'),
(1906, '623.61', 'Gelagar'),
(1907, '623.62', 'Lantai'),
(1908, '623.63', 'Perkerasan '),
(1909, '623.64', 'Jalan orang/Trotoir'),
(1910, '623.65', 'Sandaran'),
(1911, '623.66', 'Talang air'),
(1912, '623.7', 'Bangunan pengaman '),
(1913, '623.71', 'Turap/penahan'),
(1914, '623.72', 'Bronjong'),
(1915, '623.73', 'Strek dam'),
(1916, '623.74', 'Kist dam'),
(1917, '623.75', 'Coupure'),
(1918, '623.76', 'Krib'),
(1919, '623.8', 'Bangunan pelengkap'),
(1920, '623.81', 'Rambu-rambu/Tanda-tanda lalulintas'),
(1921, '623.82', 'Lampu penerangan'),
(1922, '623.83', 'Lampu pengatur lalulintas'),
(1923, '623.84', 'Patok pengaman'),
(1924, '623.85', 'Patok R.O.W.(Sempedan)'),
(1925, '623.86', 'Pagar'),
(1926, '623.9', 'Sprit'),
(1927, '623.91', 'Badan'),
(1928, '623.92', 'Perkerasan'),
(1929, '623.93', 'Drainage'),
(1930, '623.94', 'Baku'),
(1931, '623.95', 'Median'),
(1932, '633', '-'),
(1933, '634', '-'),
(1934, '635', '-'),
(1935, '636', '-'),
(1936, '637', '-'),
(1937, '638', '-'),
(1938, '639', '-'),
(1939, '640', 'BANGUNAN'),
(1940, '641', 'Bangunan pemerintah'),
(1941, '641.1', 'Gedung pengadilan'),
(1942, '641.2', 'Rumah pejabat negara'),
(1943, '641.3', 'Gedung DPR'),
(1944, '641.4', 'Gedung balai kota'),
(1945, '641.5', 'Penjara/Rumah Tahanan'),
(1946, '641.6', 'Perkantoran'),
(1947, '642', 'Bangunan pendidikan'),
(1948, '642.1', 'Taman kanak-kanak'),
(1949, '642.2', 'SD & Sekolah menengah'),
(1950, '642.3', 'Perguruan tinggi'),
(1951, '643', 'Bangunan Rekreasi'),
(1952, '643.1', 'Bangunan Olahraga'),
(1953, '643.2', 'Gedung Kesenian'),
(1954, '643.3', 'Gedung Pemancar'),
(1955, '644', 'Bangunan Perdagangan '),
(1956, '644.1', 'Pusat Perbelanjaan'),
(1957, '644.2', 'Gedung Perdagangan'),
(1958, '644.3', 'Bank'),
(1959, '644.4', 'Perkantoran'),
(1960, '645', 'Bangunan Pelayanan Umum'),
(1961, '645.1', 'Mandi, Cuci, Kakus (MCK) Umum'),
(1962, '645.2', 'Gedung Parkir '),
(1963, '645.3', 'Rumah Sakit'),
(1964, '645.4', 'Gedung Telkom'),
(1965, '645.5', 'Terminal Angkutan Udara'),
(1966, '645.6', 'Terminal Angkutan Air'),
(1967, '645.7', 'Terminal Angkutan Darat'),
(1968, '645.8', 'Bangunan Keagamaan'),
(1969, '646', 'Bangunan Peninggalan Sejarah'),
(1970, '646.1', 'Monumen'),
(1971, '646.2', 'Candi'),
(1972, '646.3', 'Kraton'),
(1973, '646.4', 'Rumah Tradisional'),
(1974, '647', 'Bangunan Indrustri'),
(1975, '648', 'Bangunan Tempat Tinggal'),
(1976, '648.1', 'Rumah Perkotaan'),
(1977, '648.11', 'Inti/ Sederhana '),
(1978, '648.12', 'Sedang/ Mewah'),
(1979, '648.2', 'Rumah Pedesaan'),
(1980, '648.21', 'Rumah Contoh'),
(1981, '648.3', 'Real Estate'),
(1982, '649', 'Elemen Bangunan '),
(1983, '649.1', 'Pondasi'),
(1984, '649.11', 'Diatas Tiang'),
(1985, '649.2', 'Dinding'),
(1986, '649.21', 'Penahan Beban'),
(1987, '649.22', 'Tidak Menahan Beban'),
(1988, '649.3', 'Atap'),
(1989, '649.31', 'Atap genting'),
(1990, '649.32', 'Atap asbes'),
(1991, '649.33', 'Atap seng'),
(1992, '649.4', 'Lantai/ Langit - langit'),
(1993, '649.41', 'Suspended'),
(1994, '649.42', 'Solit'),
(1995, '649.5', 'Pintu/ Jendela'),
(1996, '649.51', 'Pintu Harmonik'),
(1997, '649.52', 'Pintu Biasa'),
(1998, '649.53', 'Pintu Sorong'),
(1999, '649.54', 'Jendela Kayu'),
(2000, '649.55', 'Jendela Sorong'),
(2001, '649.56', 'Jendela Vertikal'),
(2002, '650', 'TATA KOTA'),
(2003, '650.1', 'UWSSP'),
(2004, '650.2', 'USDRP'),
(2005, '650.3', 'Rencana Detail Tata Ruang Kota (RDTRK)'),
(2006, '650.4', 'Master Plan '),
(2007, '650.5', 'BKM (Bantul Kota Mandiri)'),
(2008, '651', 'Daerah Perdagangan / Pelabuhan'),
(2009, '651.1', 'Daerah Pusat Perbelanjaan'),
(2010, '651.2', 'Daerah Perkotaan'),
(2011, '652', 'Daerah pemeritahan'),
(2012, '653', 'Daerah perumahan (site & service)'),
(2013, '653.1', 'Kepadatan rendah (low density)'),
(2014, '653.2', 'Kepadatan tinggi (high density)'),
(2015, '654', 'Daerah Indrustri'),
(2016, '654.1', 'Industri berat'),
(2017, '654.2', 'Industri ringan'),
(2018, '654.3', 'Industri rumah (home industri)'),
(2019, '655', 'Daerah rekreasi (open space )'),
(2020, '655.1', 'Public gardens'),
(2021, '655.2', 'Sport & playing fields'),
(2022, '655.3', 'Open space'),
(2023, '656', 'Tranportasi (tata letak )'),
(2024, '656.1', 'Jaringan jalan'),
(2025, '656.11', 'Penerangan jalan '),
(2026, '656.2', 'Jaringan kereta api'),
(2027, '656.3', 'Jaringan sungai'),
(2028, '657', 'Assaineering '),
(2029, '657.1', 'Saluran Pengumpulan'),
(2030, '657.2', 'Instalansi Pengolahan'),
(2031, '657.21', 'Bangunan '),
(2032, '657.211', 'Bangunan penyaring '),
(2033, '657.212', 'Bangunan penghancur kotoran/Sampah'),
(2034, '657.213', 'Banguanan pengendap '),
(2035, '657.214', 'Bangunan pengering lumpur'),
(2036, '657.22', 'Unit disinfektan '),
(2037, '657.23', 'Unit perpompaan '),
(2038, '658', 'Kesehatan Lingkungan '),
(2039, '658.1', 'Persampahan '),
(2040, '658.11', 'Bangunan pengumpul '),
(2041, '658.12', 'Bangunan Pemusnahan '),
(2042, '658.13', 'Teknologi Daur Ulang/Bioculture'),
(2043, '658.2', 'Pengotoran Udara '),
(2044, '658.3', 'Pengotoran air '),
(2045, '658.31', 'Air buangan Industri'),
(2046, '658.4', 'Kegaduhan '),
(2047, '658.5', 'Kebersihan kota'),
(2048, '659', '-'),
(2049, '660', 'TATA LINGKUNGAN '),
(2050, '660.1', 'Lingkungan '),
(2051, '660.2', 'Kebersihan lingkungan '),
(2052, '660.3', 'Pencemaran '),
(2053, '660.31', 'Pencemaran air'),
(2054, '660.32', 'Pencemaran udara'),
(2055, '661', 'Daerah hutan'),
(2056, '662', 'Daerah pertanian/Perkebunan '),
(2057, '663', 'Daerah pemukiman'),
(2058, '664', 'Pusat pertumbuhan'),
(2059, '665', 'Transportasi'),
(2060, '665.1', 'Jaringan jalan '),
(2061, '665.2', 'Jaringan kereta api'),
(2062, '665.3', 'Jaringan sungai'),
(2063, '666', '-'),
(2064, '667', '-'),
(2065, '668', '-'),
(2066, '669', '-'),
(2067, '670', 'KETERANGAN'),
(2068, '671', 'Listrik'),
(2069, '671.1', 'Kelistrikan'),
(2070, '671.11', 'Kelistrikan PLN '),
(2071, '671.12', 'Kelistrikan non PLN'),
(2072, '671.2', 'Pembangkitan tenaga listrik'),
(2073, '671.21', 'PLTA- Pembangkit listrik tenaga air'),
(2074, '671.22', 'PLTD- Pembangkit listrik tenaga diesel'),
(2075, '671.23', 'PLTG- Pembangkit listrik tenaga gas'),
(2076, '671.24', 'PLTM-Pembangkit listrik tenaga matahari'),
(2077, '671.25', 'PLTN-Pembangkit listrik tenaga nuklir'),
(2078, '671.26', 'PLTB-Pembangkit listrik tenaga panas bumi'),
(2079, '671.27', 'PLTU-Pembangkit listrik tenaga uap'),
(2080, '671.3', 'Transmisi tenaga listrik'),
(2081, '671.31', 'Gardu Induk/Gardu penghubung/Gardu trafo'),
(2082, '671.32', 'Saluran udara tegangan tinggi'),
(2083, '671.33', 'Kabel bawah tanah'),
(2084, '671.4', 'Distribusi tenaga listrik'),
(2085, '671.41', 'Gardu distribusi'),
(2086, '671.42', 'Tegangan menengah'),
(2087, '671.43', 'Tegangan rendah'),
(2088, '671.44', 'Jaringan bawah tanah'),
(2089, '761.5', 'Pengusahaan listrik'),
(2090, '671.51', 'Sambungan listrik'),
(2091, '671.52', 'Penjualan tenaga listrik'),
(2092, '671.53', 'Tarip listrik'),
(2093, '672', 'Tenaga Air'),
(2094, '673', 'Tenaga minyak'),
(2095, '674', 'Tenaga gas'),
(2096, '675', 'Tenaga matahari'),
(2097, '676', 'Tenaga nuklir'),
(2098, '677', 'Tenaga panas bumi'),
(2099, '678', 'Tenaga uap'),
(2100, '679', 'Tenaga lainnya'),
(2101, '680', 'PERALATAN'),
(2102, '681', '-'),
(2103, '682', '-'),
(2104, '683', '-'),
(2105, '684', '-'),
(2106, '685', '-'),
(2107, '686', '-'),
(2108, '687', '-'),
(2109, '688', '-'),
(2110, '689', '-'),
(2111, '690', 'AIR MINUM'),
(2112, '691', 'Intake'),
(2113, '691.1', 'Broncaptering'),
(2114, '691.2', 'Sumur'),
(2115, '691.21', 'Sumur Pompa'),
(2116, '691.22', 'Sumur Artesis'),
(2117, '691.3', 'Bendungan'),
(2118, '691.4', 'Saringan(Screen)'),
(2119, '691.5', 'Pintu air '),
(2120, '691.6', 'Saluran pembawa'),
(2121, '691.7', 'Alat ukur'),
(2122, '691.8', 'Perpompaan'),
(2123, '692', 'Transmisi air baku'),
(2124, '692.1', 'Perpipaan'),
(2125, '692.2', 'Katup udara(air relatif)'),
(2126, '692.3', 'Katup pelepasan(blow off)'),
(2127, '692.4', 'Bak pelepasan tenagan'),
(2128, '692.5', 'Jembatan pipa'),
(2129, '692.6', 'Syphon'),
(2130, '693', 'Instalasi pengelolaan'),
(2131, '693.1', 'Bangunan ukur'),
(2132, '693.2', 'Bangunan aerasi'),
(2133, '693.3', 'Bangunan pengendapan'),
(2134, '693.4', 'Bangunan pembubuh bahan kimia'),
(2135, '693.5', 'Bangunan pengaduk'),
(2136, '693.6', 'Bangunan saringan'),
(2137, '693.7', 'Perpompaan'),
(2138, '693.8', 'Clear hell'),
(2139, '694', 'Distribusi'),
(2140, '694.1', 'Reversior menara bawah tanah'),
(2141, '694.11', 'Menara'),
(2142, '694.12', 'Reversior dibawah tanah'),
(2143, '694.2', 'Perpipaan'),
(2144, '694.3', 'Perpompaan'),
(2145, '694.4', 'Jembatan Pipa'),
(2146, '694.5', 'Syphon'),
(2147, '694.6', 'Hydran'),
(2148, '694.61', 'Hydran umum'),
(2149, '694.62', 'Hydran kebakaran'),
(2150, '694.7', 'Katup'),
(2151, '694.71', 'Katup udara(air relatif)'),
(2152, '694.72', 'Katup pelepasan(blow off)'),
(2153, '694.8', 'Bak pelepasan tenagan (pressure reducing valve)'),
(2154, '695', '-'),
(2155, '696', '-'),
(2156, '697', '-'),
(2157, '698', '-'),
(2158, '699', '-'),
(2159, '700', 'PENGAWASAN'),
(2160, '701', 'Bidang urusan dalam'),
(2161, '702', 'Bidang peralatan'),
(2162, '703', '-'),
(2163, '704', '-'),
(2164, '705', '-'),
(2165, '706', 'Bidang Organisasi / Ketatajaksanaan'),
(2166, '707', '-'),
(2167, '708', '-'),
(2168, '709', '-'),
(2169, '710', 'BIDANG PEMERINTAHAN'),
(2170, '711', '-'),
(2171, '712', '-'),
(2172, '713', '-'),
(2173, '714', '-'),
(2174, '715', '-'),
(2175, '716', '-'),
(2176, '717', '-'),
(2177, '718', '-'),
(2178, '719', '-'),
(2179, '720', 'BIDANG POLITIK'),
(2180, '721', '-'),
(2181, '722', '-'),
(2182, '723', '-'),
(2183, '724', '-'),
(2184, '725', '-'),
(2185, '726', '-'),
(2186, '727', '-'),
(2187, '728', '-'),
(2188, '729', '-'),
(2189, '730', 'BIDANG KEAMANAN / KETERTIBAN'),
(2190, '731', '-'),
(2191, '732', '-'),
(2192, '733', '-'),
(2193, '734', '-'),
(2194, '735', '-'),
(2195, '736', '-'),
(2196, '737', '-'),
(2197, '738', '-'),
(2198, '739', '-'),
(2199, '740', 'BIDANG KESRA (Kesejahteraan Rakyat)'),
(2200, '741', '-'),
(2201, '742', '-'),
(2202, '743', '-'),
(2203, '744', '-'),
(2204, '745', '-'),
(2205, '746', '-'),
(2206, '747', '-'),
(2207, '748', '-'),
(2208, '749', '-'),
(2209, '750', 'BIDANG PEREKONOMIAN '),
(2210, '751', '-'),
(2211, '752', '-'),
(2212, '753', '-'),
(2213, '754', '-'),
(2214, '755', '-'),
(2215, '756', '-'),
(2216, '757', '-'),
(2217, '758', '-'),
(2218, '759', '-'),
(2219, '760', 'BIDANG PEKERJAAN UMUM'),
(2220, '761', '-'),
(2221, '762', '-'),
(2222, '763', '-'),
(2223, '764', '-'),
(2224, '765', '-'),
(2225, '766', '-'),
(2226, '767', '-'),
(2227, '768', '-'),
(2228, '769', '-'),
(2229, '770', '-'),
(2230, '771', '-'),
(2231, '772', '-'),
(2232, '773', '-'),
(2233, '774', '-'),
(2234, '775', '-'),
(2235, '776', '-'),
(2236, '777', '-'),
(2237, '778', '-'),
(2238, '779', '-'),
(2239, '780', 'BIDANG KEPEGAWAIAN '),
(2240, '781', '-'),
(2241, '782', '-'),
(2242, '783', '-'),
(2243, '784', '-'),
(2244, '785', '-'),
(2245, '786', '-'),
(2246, '787', '-'),
(2247, '788', '-'),
(2248, '789', '-'),
(2249, '790', 'BIDANG KEUANGAN'),
(2250, '791', '-'),
(2251, '792', '-'),
(2252, '793', '-'),
(2253, '794', '-'),
(2254, '795', '-'),
(2255, '796', '-'),
(2256, '797', '-'),
(2257, '798', '-'),
(2258, '799', '-'),
(2259, '800', 'KEPEGAWAIAN'),
(2260, '800.1', 'Perencanaan'),
(2261, '800.2', 'Penelitian '),
(2262, '800.3', 'Pendatan Ulang PNS'),
(2263, '800.045', 'Pengaduan'),
(2264, '800.05', 'Team'),
(2265, '800.07', 'Statistik'),
(2266, '800.08', 'Peraturan perundang - undangan'),
(2267, '810', 'PENGADAAN'),
(2596, '120.042', 'Menografi. Tambahkan kode wilayah'),
(2269, '811', 'Lamaran '),
(2270, '811.1', 'Testing'),
(2271, '811.2', 'Screening'),
(2272, '811.3', 'Panggilan'),
(2273, '812', 'Pengujian Kesehatan'),
(2274, '813', 'Pengangkatan calon pegawai'),
(2275, '813.1', 'Pengangkatan calon pegawai I'),
(2276, '813.2', 'Pengangkutan calon pegawai II'),
(2277, '813.3', 'Pengangkatan calon pegawai III'),
(2278, '813.4', 'Pengangkatan calon pegawai IV'),
(2279, '813.5', 'Pengngkatan calon guru INPRES'),
(2280, '814', 'Pengangkatan tenaga lepas'),
(2281, '814.1', 'Pengangkatan tenaga bulanan'),
(2282, '814.2', 'Pengangkatan tenaga harian'),
(2283, '814.3', 'Pengangkatan tenaga pensiuran'),
(2284, '815', 'Pengangkatan tenaga asing'),
(2285, '816', '-'),
(2286, '817', '-'),
(2287, '818', '-'),
(2288, '819', '-'),
(2289, '820', 'MUTASI'),
(2290, '821', 'Pengangkatan '),
(2291, '821.1', 'Pengangkatan menjadi pegawai negri (tetap)'),
(2292, '821.11', 'Pengangkatan menjadi pegawai negri golongan I'),
(2293, '821.12', 'Pengangkatan menjadi pegawai negri golongan II'),
(2294, '821.13', 'Pengangkatan menjadi pegawai negri golongan III'),
(2295, '821.14', 'Pengangkatan menjadi pegawai negri golongan IV'),
(2296, '821.2', 'Pengangkatan dalam jabatan, Pembebasan dari jabatan, berita acara serah terima jabatan.'),
(2297, '821.21', 'Sekjen/Dirijen/Irjen/Kaban'),
(2298, '821.22', 'Kepala Biro/Direktur/Inspektur/Kepala Pusat/Sekretaris/Kepala Dinas/Asisten Sekwilda'),
(2299, '821.23', 'Kepala Bagian/Kepala Sub Direktorat/Kepala Bidang/Inspektur Pembantu'),
(2300, '821.24', 'Kepala Sub Bagian/Kepala Seksi/Kepala Sub Bidang/Pemeriksa'),
(2301, '821.25', 'Residen/Pembantu Gubernur'),
(2302, '821.26', 'Wadana/Pembantu Bupati'),
(2303, '821.27', 'Camat'),
(2304, '821.28', 'Lurah administraf (lurah Desa lihat 141)'),
(2305, '821.29', 'Jabatan lainnya'),
(2306, '822', 'Kenaikan gaji berkala'),
(2307, '822.1', 'Pegawai golongan I'),
(2308, '822.2', 'Pegawai golongan II'),
(2309, '822.3', 'Pegawai golongan III'),
(2310, '822.4', 'Pegawai golongan IV'),
(2311, '823', 'Kenaikan perangkat/ pengangkatan '),
(2312, '823.1', 'Pegawai golongan I'),
(2313, '823.2', 'Pegawai golongan II'),
(2314, '823.3', 'Pegawai golongan III'),
(2315, '823.4', 'Pegawai golongan IV'),
(2316, '824', 'Pemindahan/pelimpahan/perbantuan'),
(2317, '824.1', 'Pegawai golongan I'),
(2318, '824.2', 'Pegawai golongan II'),
(2319, '824.3', 'Pegawai golongan III'),
(2320, '824.4', 'Pegawai golongan IV'),
(2321, '824.5', 'Lolos butuh'),
(2322, '825', 'Deta sering dan penempatan kembali'),
(2323, '826', 'Penunjukkan tugas belajar'),
(2324, '826.1', 'Dalam negri'),
(2325, '826.2', 'Luar negri'),
(2326, '826.3', 'Tunjangan belajar'),
(2327, '826.4', 'Penampatan kembali'),
(2328, '827', 'Wajib militer'),
(2329, '828', 'Mutasi pegawai instansi lain'),
(2330, '829', '-'),
(2331, '830', 'KEDUDUDKAN'),
(2332, '831', 'Penhitungan masa kerja '),
(2333, '832', 'Penyesuaian pangkat/gaji'),
(2334, '832.1', 'Pegawai golongan I'),
(2335, '832.2', 'Pegawai golongan II'),
(2336, '832.3', 'Pegawai golongan III'),
(2337, '832.4', 'Pegawai golongan IV'),
(2338, '833', 'Penghargaan ijazah '),
(2339, '834', 'Jenjang pangkat'),
(2340, '835', '-'),
(2341, '836', '-'),
(2342, '837', '-'),
(2343, '838', '-'),
(2344, '839', '-'),
(2345, '840', 'KESEJAHTERAAN PEGAWAI'),
(2346, '841', 'Tunjangan '),
(2347, '841.1', 'Jabatan lainnya'),
(2348, '841.2', 'Kehormatan'),
(2349, '841.3', 'Kematian '),
(2350, '841.4', 'Tunjangan hari raya '),
(2351, '841.5', 'Perjalanan dinas tetap/cuti/pindah'),
(2352, '841.6', 'Keluarga'),
(2353, '841.7', 'Pangan, uang makan'),
(2354, '842', 'Dana'),
(2355, '842.1', 'Taspen'),
(2356, '842.2', 'Kesehatan '),
(2357, '842.3', 'Asuransi'),
(2358, '843', 'Perawatan Kesehatan '),
(2359, '843.1', 'Poliklinik'),
(2360, '843.2', 'Perawatan dokter'),
(2361, '843.3', 'Obat-obatan '),
(2362, '843.4', 'Keluarga berencana'),
(2363, '844', 'Koperasi/Distribusi'),
(2364, '844.1', 'Distribusi pangan'),
(2365, '844.2', 'Distribusi sandang'),
(2366, '844.3', 'Distribusi lainya'),
(2367, '845', 'Perumahan/Tanah'),
(2368, '845.1', 'Perumahan pegawai'),
(2369, '845.2', 'Tanah kapling'),
(2370, '845.3', 'Losmen/hotel'),
(2371, '846', 'Bantuan sosial'),
(2372, '846.1', 'Bantuan Kebakaran '),
(2373, '846.2', 'Bantuan kebanjiran '),
(2374, '846.3', 'Bencana Gempa'),
(2375, '847', 'Rekreasi, wisata eksekutif'),
(2376, '848', 'Dispensasi'),
(2377, '849', '-'),
(2378, '850', 'CUTI'),
(2379, '851', 'Cuti tahanan '),
(2380, '852', 'Cuti besar'),
(2381, '853', 'Cuti sakit'),
(2382, '854', 'Cuti hamil'),
(2383, '855', 'Cuti naik haji'),
(2384, '856', 'Cuti di luar tanggungan negara'),
(2385, '857', 'Cuti alasan lain'),
(2386, '858', 'Cuti bersama'),
(2387, '859', '-'),
(2388, '860', 'PENILAIAN '),
(2389, '861', 'Penghargaan ijazah '),
(2390, '861.1', 'Bintang/Satyalencana'),
(2391, '861.2', 'Kenaikan pangkat anumerta'),
(2392, '861.3', 'Kenaikan gaji istimewa'),
(2393, '861.4', 'Hadiah berupa uang'),
(2394, '861.5', 'Pegawai teladan'),
(2395, '862', 'Hkuman'),
(2396, '862.1', 'Tegoran/peringatan '),
(2397, '862.2', 'Penundaan kenaikan gaji'),
(2398, '862.3', 'Penurunan pankat'),
(2399, '862.4', 'Pemindahan '),
(2400, '863', 'Konduite'),
(2401, '864', 'Ujian dinas'),
(2402, '864.1', 'Tingkat I'),
(2403, '864.2', 'Tingkat II'),
(2404, '864.3', 'Tingkat III'),
(2405, '865', 'Penilaian kehidupan pegawai negri. Meliputi : Petunjuk pelaksanan hidup sederhana, penilaian kekayaan pribadi (LP2P) '),
(2406, '866', 'Rehabilitasi'),
(2407, '867', 'Daftar Usul Penilaian Angka Kredit (DUPAK) dan Penilaian Angka Kredit (PAK)'),
(2408, '868', '-'),
(2409, '869', '-'),
(2410, '870', 'TATA USAHA KEPEGAWAIAN'),
(2411, '871', 'Formasi'),
(2412, '872', 'Bezetting'),
(2413, '873', 'Registrasi'),
(2414, '873.1', 'NIP'),
(2415, '873.2', 'KARPEG'),
(2416, '873.3', 'Legittimasi/tanda pengenal'),
(2417, '873.4', 'Daftar keluarga'),
(2418, '873.5', 'Laporan Perkawinan'),
(2419, '873.6', 'KARIS'),
(2420, '873.7', 'KARSU'),
(2421, '874', 'Daftar riwayat pekerjaan'),
(2422, '874.1', 'Tanggal lahir'),
(2423, '874.2', 'Penggantian nama'),
(2424, '874.3', 'Kepartaian/organisasi'),
(2425, '875', 'Kewenangan mutasi kepegawaiaan'),
(2426, '875.1', 'Pelimpahan wewenang'),
(2427, '875.2', 'Specimen tanda tangan'),
(2428, '876', 'Pengajian'),
(2429, '876.1', 'SKPP'),
(2430, '877', 'Sumpah/janji'),
(2431, '878', 'Koprs kepegawain'),
(2432, '879', '-'),
(2433, '880', 'PEMBERHENTIAN '),
(2434, '881', 'Permintaan sendiri'),
(2435, '882', 'Dengan hak pensiun'),
(2436, '882.1', 'Pemberhentian dengan hak pensiun pegawai negeri golongan I'),
(2437, '882.2', 'Pemberhentian dengan hak pensiun pegawai negeri golongan II'),
(2438, '882.3', 'Pemberhentian dengan hak pensiun pegawai negeri golongan III'),
(2439, '882.4', 'Pemberhentian dengan hak pensiun pegawai negeri golongan IV'),
(2440, '882.5', 'Pensiun janja/duda'),
(2441, '882.6', 'Pensiun yati m piatu'),
(2442, '882.7', 'Uang muka pensiun'),
(2443, '883', 'Karena meninggal'),
(2444, '883.1', 'Karena meninggal dalam tugas'),
(2445, '884', 'Alasan lain'),
(2446, '885', 'Uang pesangon'),
(2447, '886', 'Uang tunggu'),
(2448, '887', 'Untuk sementara waktu'),
(2449, '888', 'Tidak dengan hormat'),
(2450, '889', '-'),
(2451, '890', 'PENDIDIKAN PEGAWAI'),
(2452, '891', 'Perencanaan'),
(2453, '891.1', 'Ijin Belajar'),
(2454, '892', 'Pendidikan reguler'),
(2455, '892.1', 'IIP'),
(2456, '892.2', 'Agraria'),
(2457, '892.21', 'Pemerintahan Dalam Negeri'),
(2458, '892.22', 'Kursus-kursus/penataran'),
(2459, '892.3', 'Pendidikan keluar negeri'),
(2460, '892.4', 'Akademi'),
(2461, '893', 'Pendidikan non reguler'),
(2462, '893.1', 'SESPA'),
(2463, '893.2', 'SELAPUTDA'),
(2464, '893.3', 'Kursus-kursus/penataran'),
(2465, '893.4', 'Sepada/ADUM'),
(2466, '893.5', 'Sepala/ADUMLA'),
(2467, '894', 'Pendidikan keluar negeri'),
(2468, '895', 'Metode'),
(2469, '895.1', 'Kuliah'),
(2470, '895.2', 'Ceramah,sisposium'),
(2471, '895.3', 'Diskusi'),
(2472, '895.4', 'Kuliah lapangan,widya wisata,KKN'),
(2473, '895.5', 'Kurikulum'),
(2474, '895.6', 'Karya tulis'),
(2475, '896', 'Tenaga pengajar'),
(2476, '896.1', 'Widyiaswara'),
(2477, '897', 'Administrasi pendidikan'),
(2478, '897.1', 'Tahun pelajaran'),
(2479, '897.2', 'Persyaratan,meliputi pendaftaran,testing,ujian'),
(2480, '898', 'Fasilitas'),
(2481, '898.1', 'Tunjangan belajar'),
(2482, '898.2', 'Asrama'),
(2483, '898.3', 'Uang makan'),
(2484, '898.4', 'Uang transpot'),
(2485, '898.5', 'Uang buku'),
(2486, '899', 'Sarana'),
(2487, '899.1', 'Buku'),
(2488, '899.2', 'Gedung lihat 011;peralatan lihat 020'),
(2489, '900', 'KEUANGAN'),
(2490, '901', 'Nota keuangan'),
(2491, '902', 'APBN'),
(2492, '903', 'APBD'),
(2493, '904', '-'),
(2494, '905', '-'),
(2495, '906', '-'),
(2496, '907', '-'),
(2497, '908', '-'),
(2498, '909', '-'),
(2499, '910', 'ANGGARAN'),
(2500, '911', 'Rutin/Anggaran Satuan Kerja (ASK)'),
(2501, '912', 'Pembangunan'),
(2502, '913', 'Anggaran belanja tambahan/Perubahan APBD'),
(2503, '914', 'DIK'),
(2504, '914.1', 'Dafatar Usulan Kegiatan (DUK)'),
(2505, '914.2', 'Daftar Isian Kegiatan Daerah (DIKDA)/ DASK'),
(2506, '914.3', 'Daftar Usulan Kegiatan Daerah (DUKDA)/ RASK'),
(2507, '915', 'DIP'),
(2508, '915.1', 'Daftar Usulan Proyek (DUP)'),
(2509, '915.2', 'Daftar Isian Proyek Daerah (DIPDA)'),
(2510, '915.3', 'Daftar Usulan Proyek Daerah (DUPDA)'),
(2511, '916', 'Dana Alokasi Umum '),
(2512, '917', 'Dana Alokasi Khusus'),
(2513, '918', 'Dana-dana lainya'),
(2514, '919', '-'),
(2515, '920', 'OTORISASI'),
(2516, '921', 'Rutin'),
(2517, '922', 'Pembangunan'),
(2518, '923', 'SIAP'),
(2519, '923.1', 'SIAPDA'),
(2520, '924', 'Ralat SKO'),
(2521, '925', '-'),
(2522, '926', '-'),
(2523, '927', '-'),
(2524, '928', '-'),
(2525, '929', '-'),
(2526, '930', 'VERIFIKASI'),
(2527, '931', 'SPM rutin (Daftar P8)'),
(2528, '932', 'SPM pembangunan (Daftar P8)'),
(2529, '933', 'Penerimaan (Daftar P6-P7)'),
(2530, '934', 'SPJ rutin '),
(2531, '935', 'SPJ pembangunan '),
(2532, '936', 'Nota pemeriksaan'),
(2533, '937', 'SP pemindahan pembukuan (SPPP)'),
(2534, '938', '-'),
(2535, '939', '-'),
(2536, '940', 'PEMBUKUAN'),
(2537, '941', 'Penyusunan perhitungan anggaran '),
(2538, '942', 'Permintaan data anggaran'),
(2539, '943', 'Laporan fisik pembangunan'),
(2540, '944', '-'),
(2541, '945', '-'),
(2542, '946', '-'),
(2543, '947', '-'),
(2544, '948', '-'),
(2545, '949', '-'),
(2546, '950', '-'),
(2547, '951', 'PERBENDAHARAAN'),
(2548, '952', 'Tuntutan ganti rugi (ICW Pasal 74)'),
(2549, '953', 'Tuntutan perbendaharaan'),
(2550, '954', 'Penghapusan kekayaan negara'),
(2551, '955', 'Pengangkatan/Penggantian bendaharawan'),
(2552, '956', 'Specimen tanda tangan'),
(2553, '957', 'Surat tagihan piutang, ikhtiar bulanan'),
(2554, '958', '-'),
(2555, '959', '-'),
(2556, '960', '-'),
(2557, '961', 'PEMBINAAN KEBENDAHARAAN'),
(2558, '962', 'Pemeriksaan kas dan hasil penerimaan kas'),
(2559, '963', 'Pemeriksaan administrasi bendaharawan'),
(2560, '964', 'Laporan keuangan bendaharawan '),
(2561, '965', '-'),
(2562, '966', '-'),
(2563, '967', '-'),
(2564, '968', '-'),
(2565, '969', '-'),
(2566, '970', 'PENDAPATAN '),
(2567, '971', 'Perimbangan keuangan'),
(2568, '972', 'Subsidi'),
(2569, '973', 'Pajak, Ipeda, I.H.H., I.H.P.H.'),
(2570, '974', 'Retisbusi '),
(2571, '975', 'Bea'),
(2572, '976', 'Cukai'),
(2573, '977', 'Pungutan'),
(2574, '978', 'Bantuan Presiden, Mentri'),
(2575, '979', '-'),
(2576, '980', '-'),
(2577, '981', '-'),
(2578, '982', '-'),
(2579, '983', '-'),
(2580, '984', '-'),
(2581, '985', '-'),
(2582, '986', '-'),
(2583, '987', '-'),
(2584, '988', '-'),
(2585, '989', '-'),
(2586, '990', 'BENDAHARAWAN '),
(2587, '991', 'SKPP'),
(2588, '992', 'Tegoran SPJ'),
(2589, '993', '-'),
(2590, '994', '-'),
(2591, '995', '-'),
(2592, '996', '-'),
(2593, '997', '-'),
(2594, '998', '-'),
(2595, '999', '-');

-- --------------------------------------------------------

--
-- Table structure for table `kop_surat`
--

CREATE TABLE `kop_surat` (
  `kop_id` int(1) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `jenis` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kop_surat`
--

INSERT INTO `kop_surat` (`kop_id`, `nama`, `jenis`) VALUES
(1, 'Walikota', 'kop_walikota'),
(2, 'Perangkat Daerah', 'kop_pd');

-- --------------------------------------------------------

--
-- Table structure for table `level`
--

CREATE TABLE `level` (
  `level_id` int(11) NOT NULL,
  `level` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `level`
--

INSERT INTO `level` (`level_id`, `level`) VALUES
(1, 'Super Admin'),
(2, 'Admin Perangkat Daerah'),
(3, 'Operator Perangkat Daerah'),
(4, 'Pengelola Arsip'),
(5, 'Kepala Dinas'),
(6, 'Sekretaris Dinas'),
(7, 'Kepala bidang / Kepala Bagian'),
(8, 'Kepala Seksi / Kepala Sub Bagian'),
(9, 'Walikota'),
(10, 'Sekretaris Daerah'),
(11, 'Asisten'),
(12, 'Staff');

-- --------------------------------------------------------

--
-- Table structure for table `opd`
--

CREATE TABLE `opd` (
  `opd_id` int(11) NOT NULL,
  `nama_pd` varchar(100) NOT NULL,
  `kode_pd` varchar(20) NOT NULL,
  `alamat` text NOT NULL,
  `telp` varchar(60) NOT NULL,
  `email` varchar(60) DEFAULT NULL,
  `alamat_website` varchar(200) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `opd`
--

INSERT INTO `opd` (`opd_id`, `nama_pd`, `kode_pd`, `alamat`, `telp`, `email`, `alamat_website`) VALUES
(1, 'Dinas Pendidikan Kota Bogor', 'DISDIK', 'Jl. Padjadjaran No.125, Bantarjati, Bogor Utara, Kota Bogor, Jawa Barat 16153', '02518341101', '', 'http://simpeg.kotabogor.go.id/rest/unit_kerja/daftarPegawai/4785'),
(2, 'Badan Kepegawaian dan Pengembangan Sumber Daya Aparatur Kota Bogor', 'BKPSDA', 'Jl. Ir. Juanda, No. 10, Bogor Tengah, Kota Bogor, Jawa Barat 16122', '02518356170', 'simpeg.kotabogor@gmail.com', 'http://simpeg.kotabogor.go.id/rest/unit_kerja/daftarPegawai/4789'),
(3, 'Dinas Penanaman Modal dan Pelayanan Terpadu Satu Pintu Kota Bogor', 'DPMPTSP', 'Jl. Kapt. Muslihat No. 19, Bogor Tengah, Kota Bogor, Jawa Barat 16121', '02518356167', '', 'http://simpeg.kotabogor.go.id/rest/unit_kerja/daftarPegawai/4790'),
(4, 'Dinas Pemberdayaan Masyarakat, Perempuan, dan Perlindungan Anak Kota Bogor', 'DPMPPA', 'Jl. Ciwaringin No.99 Bogor, Bogor Tengah, Kota Bogor', '02518321558', '', 'http://simpeg.kotabogor.go.id/rest/unit_kerja/daftarPegawai/4791'),
(5, 'Badan Perencanaan Pembangunan Daerah Kota Bogor', 'BAPPEDA', 'Jl. Kapt. Muslihat No. 19, Bogor Tengah, Kota Bogor, Jawa Barat 16121', '02518338052', NULL, 'http://simpeg.kotabogor.go.id/rest/unit_kerja/daftarPegawai/4792'),
(6, 'Dinas Pariwisata dan Kebudayaan Kota Bogor', 'DISPARBUD', 'Jl. Pandu Raya No. 45, Tegal Gundil, Bogor Tengah, Kota Bogor, Jawa Barat 16121', '02518328827', '', 'http://simpeg.kotabogor.go.id/rest/unit_kerja/daftarPegawai/4803'),
(7, 'Dinas Kependudukan dan Pencatatan Sipil Kota Bogor', 'DISDUKCAPIL', 'Jl. Ahmad Adnawijaya (Pandu Raya) No. 45A, Jl. Achmad Adnawijaya, Tegal Gundil, Bogor Utara, Kota Bogor, Jawa Barat 16132', '02518328161', '', 'http://simpeg.kotabogor.go.id/rest/unit_kerja/daftarPegawai/4804'),
(8, 'Dinas Kesehatan Kota Bogor', 'DINKES', 'Jl. Kesehatan No. 3, Tanah Sareal, Tanah Sereal, Kota Bogor, Jawa Barat 16161', '02518331753', '', 'http://simpeg.kotabogor.go.id/rest/unit_kerja/daftarPegawai/4805'),
(9, 'Badan Pendapatan Daerah Kota Bogor', 'BAPENDA', 'Jl. Pemuda No. 31, Tanah Sereal, Kota Bogor, Jawa Barat 16162', '02518322871', '', 'http://simpeg.kotabogor.go.id/rest/unit_kerja/daftarPegawai/4806'),
(10, 'Dinas Perhubungan Kota Bogor', 'DISHUB', 'Jl. Raya Tajur No. 54, Pakuan, Bogor Selatan, Pakuan, Bogor Sel., Kota Bogor, Jawa Barat 16134', '02518333511', '', 'http://simpeg.kotabogor.go.id/rest/unit_kerja/daftarPegawai/4807'),
(11, 'Dinas Perindustrian dan Perdagangan Kota Bogor', 'DISPERINDAG', 'Jl. Dadali No.4, Tanah Sareal, Tanah Sereal, Kota Bogor, Jawa Barat 16161', '02518338788', '', 'http://simpeg.kotabogor.go.id/rest/unit_kerja/daftarPegawai/4808'),
(12, 'Dinas Pertanian Kota Bogor', 'DISTANI', 'Jl. Raya Cipaku No.5, Cipaku, Bogor Sel., Kota Bogor, Jawa Barat 16133', '02518318670', '', 'http://simpeg.kotabogor.go.id/rest/unit_kerja/daftarPegawai/4809'),
(13, 'Dinas Sosial Kota Bogor', 'DINSOS', 'Jl. Merdeka No. 142, Bogor Tengah, Ciwaringin, Bogor, Kota Bogor, Jawa Barat 16111', '02518332315', '', 'http://simpeg.kotabogor.go.id/rest/unit_kerja/daftarPegawai/4810'),
(14, 'Dinas Kearsipan dan Perpustakaan Kota Bogor', 'DISKARPUS', 'Jl. Medika 1A, No. 2, Perum Menteng Asri, Menteng, Bogor Bar., Kota Bogor, Jawa Barat 16111', '02518380247', NULL, 'http://simpeg.kotabogor.go.id/rest/unit_kerja/daftarPegawai/4811'),
(15, 'Kantor Kesatuan Bangsa Dan Politik Kota Bogor', 'KESBANGPOL', 'Jl. Kesehatan, No. 2, Tanah Sareal, Tanah Sereal, Kota Bogor, Jawa Barat 16117', '02518321075', NULL, 'http://simpeg.kotabogor.go.id/rest/unit_kerja/daftarPegawai/4812'),
(16, 'Dinas Ketahanan Pangan Kota Bogor', 'DKP', 'Jl. Raya Cipaku No.5, Cipaku, Bogor Sel., Kota Bogor, Jawa Barat 16133', '02518322787', '', 'http://simpeg.kotabogor.go.id/rest/unit_kerja/daftarPegawai/4813'),
(17, 'Dinas Lingkungan Hidup Kota Bogor', 'DLH', 'Jl. Paledang No.43, Paledang, Bogor Tengah, Kota Bogor, Jawa Barat 16122', '02518321577', '', 'http://simpeg.kotabogor.go.id/rest/unit_kerja/daftarPegawai/4814'),
(18, 'Sekretariat KPU Kota Bogor', 'KPU', 'Jl. Loader No.7, Baranangsiang, Bogor, Jawa Barat, 16000', '02518362669', '', 'http://simpeg.kotabogor.go.id/rest/unit_kerja/daftarPegawai/4815'),
(19, 'Satuan Polisi Pamong Praja Kota Bogor', 'SATPOLPP', 'Jl. Padjadjaran No.121, Bantarjati, Bogor Utara, Bantarjati, Bogor Utara, Kota Bogor, Jawa Barat 16153', '02518318191', '', 'http://simpeg.kotabogor.go.id/rest/unit_kerja/daftarPegawai/4818'),
(20, 'Sekretariat DPRD Kota Bogor', 'SETDPRD', 'Jl. Kapten Muslihat, No. 21, Pabaton, Bogor Tengah, Pabaton, Bogor Tengah, Kota Bogor, Jawa Barat 16121', '02518323472', '', 'http://simpeg.kotabogor.go.id/rest/unit_kerja/daftarPegawai/5045'),
(21, 'Dinas Pemuda dan Olahraga Kota Bogor', 'DISPORA', 'Jl. Pemuda, No. 4, Tanah Sareal, Tanah Sereal, Kota Bogor, Jawa Barat 16162', '02518332882', '', 'http://simpeg.kotabogor.go.id/rest/unit_kerja/daftarPegawai/5165'),
(22, 'Kecamatan Bogor Tengah Kota Bogor', 'KECBOTENG', 'Jl. Kantin No. 2, Pabaton, Bogor Tengah, Bogor, Jawa Barat', '02518323351', '', 'http://simpeg.kotabogor.go.id/rest/unit_kerja/daftarPegawai/5167'),
(23, 'Kecamatan Bogor Barat Kota Bogor', 'KECBOBAR', 'Jl. H.T. Sobari, Semplak, Bogor Bar., Kota Bogor, Jawa Barat 16114', '02517537866', '', 'http://simpeg.kotabogor.go.id/rest/unit_kerja/daftarPegawai/5168'),
(24, 'Kecamatan Bogor Timur Kota Bogor', 'KECBOTIM', 'Jl. Padjadjaran No.16, Baranangsiang, Bogor Tim., Kota Bogor, Jawa Barat 16143', '02518326773', '', 'http://simpeg.kotabogor.go.id/rest/unit_kerja/daftarPegawai/5169'),
(25, 'Kecamatan Bogor Selatan Kota Bogor', 'KECBOSEL', 'Jl. Layungsari III No. 41, Bondongan, Empang, Bogor Sel., Kota Bogor, Jawa Barat 16132', '02518322812', '', 'http://simpeg.kotabogor.go.id/rest/unit_kerja/daftarPegawai/5170'),
(26, 'Kecamatan Bogor Utara Kota Bogor', 'KECBOUT', 'Jl. Gagalur Raya No. 2, Tegal Gundil, Bogor Utara, Tegal Gundil, Bogor Utara, Kota Bogor, Jawa Barat 16152', '02518323444', '', 'http://simpeg.kotabogor.go.id/rest/unit_kerja/daftarPegawai/5171'),
(27, 'Kecamatan Tanah Sareal Kota Bogor', 'KECTANSAR', 'Jl. Raya Kebon Pedes No.20, Tanah Sereal, Tanah Sareal, Bogor, Kota Bogor, Jawa Barat 16161', '0251328547', '', 'http://simpeg.kotabogor.go.id/rest/unit_kerja/daftarPegawai/5172'),
(28, 'Sekretariat Daerah Kota Bogor', 'SETDA', 'Jl. Ir. Juanda, No. 10, Bogor Tengah, Kota Bogor, Jawa Barat 16122', '02518324473', 'setda@kotabogor.go.id', 'http://simpeg.kotabogor.go.id/rest/unit_kerja/daftarPegawai/5266'),
(29, 'Dinas Perumahan dan Permukiman Kota Bogor', 'DISPERUMKIM', 'Jl. Pengadilan No. 8A, Gadog, Megamendung, Pabaton, Bogor Tengah, Kota Bogor, Jawa Barat 16770', '02518322001', NULL, 'http://simpeg.kotabogor.go.id/rest/unit_kerja/daftarPegawai/5292'),
(30, 'Dinas Pekerjaan Umum dan Penataan Ruang  Kota Bogor', 'DPUPR', 'Jl. Pemuda No.30 A, Tanahsareal, Tanah Sereal, Tanah Sareal, Bogor, Kota Bogor, Jawa Barat 16161', '02518380180', '', 'http://simpeg.kotabogor.go.id/rest/unit_kerja/daftarPegawai/5293'),
(31, 'Badan Pengelolaan Keuangan dan Aset Daerah Kota Bogor', 'BPKAD', 'Jl. Ir. Juanda, No. 10, Bogor Tengah, Kota Bogor, Jawa Barat 16122', '02518321075 ', NULL, 'http://simpeg.kotabogor.go.id/rest/unit_kerja/daftarPegawai/5294'),
(32, 'Dinas Koperasi, Usaha Kecil dan Menengah Kota Bogor', 'DKUKM', 'Jl. Dadali No.2, Tanah Sereal, Tanah Sareal, Tanah Sereal, Kota Bogor, Jawa Barat 16161', '02518326661', NULL, 'http://simpeg.kotabogor.go.id/rest/unit_kerja/daftarPegawai/5295'),
(33, 'Dinas Komunikasi dan Informatika Kota Bogor', 'DISKOMINFO', 'Jl. Ir. Juanda, No. 10, Bogor Tengah, Kota Bogor, Jawa Barat 16122', '02518321075', 'kominfo@kotabogor.go.id', 'https://kominfo.kotabogor.go.id/'),
(34, 'Inspektorat Kota Bogor', 'INSPEKTORAT', 'Jl. Pahlawan Blk No.144, Bondongan, Bogor Sel., Kota Bogor, Jawa Barat 16131', '02518313274', '', 'http://simpeg.kotabogor.go.id/rest/unit_kerja/daftarPegawai/5298'),
(35, 'RSUD Kota Bogor', 'RSUD', 'Jl. Doktor Semeru No. 120, Bogor Barat, Menteng, Bogor Bar., Kota Bogor, Jawa Barat 16112', '02518312292', '', 'http://simpeg.kotabogor.go.id/rest/unit_kerja/daftarPegawai/5347'),
(36, 'Badan Penanggulangan Bencana Daerah Kota Bogor', 'BPBD', 'Jl. Pajajaran No. 1, Sukasari, Bogor Timur, Sukasari, Bogor Tim., Kota Bogor, Jawa Barat 16142', '02518322100', '-', 'http://simpeg.kotabogor.go.id/rest/unit_kerja/daftarPegawai/5350'),
(37, 'Dinas Tenaga Kerja dan Transmigrasi Kota Bogor', 'DISNAKERTRANS', 'Jl. Merdeka No. 142, Bogor Tengah, Ciwaringin, Bogor, Kota Bogor, Jawa Barat 16111', '02518332315', '', 'http://simpeg.kotabogor.go.id/rest/unit_kerja/daftarPegawai/5353'),
(38, 'Dinas Pengendalian Penduduk dan Keluarga Berencana Kota Bogor', 'DPPKB', 'Jl. Pemuda No.1A, Tanah Sareal, Tanah Sereal, Kota Bogor, Jawa Barat 16162', '02518353712', NULL, 'http://simpeg.kotabogor.go.id/rest/unit_kerja/daftarPegawai/5354'),
(40, 'Pemerintah Kota Bogor', 'BOGOR', 'Jl. Ir. Juanda, No. 10, Bogor Tengah, Kota Bogor, Jawa Barat 16122', '02518324473', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `penandatangan`
--

CREATE TABLE `penandatangan` (
  `penandatangan_id` int(11) NOT NULL,
  `surat_id` varchar(15) NOT NULL,
  `jabatan_id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `jabatan` varchar(300) NOT NULL,
  `status` enum('Belum Ditandatangani','Sudah Ditandatangani') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penandatangan`
--

INSERT INTO `penandatangan` (`penandatangan_id`, `surat_id`, `jabatan_id`, `nama`, `jabatan`, `status`) VALUES
(1, 'SE-2', 146, 'Asep Zaenal Rahmat, S.Pd., M.Pd', 'Sekretaris Dinas Komunikasi dan Informatika Kota Bogor', 'Sudah Ditandatangani'),
(2, 'SE-4', 146, 'Asep Zaenal Rahmat, S.Pd., M.Pd', 'Sekretaris Dinas Komunikasi dan Informatika Kota Bogor', 'Sudah Ditandatangani');

-- --------------------------------------------------------

--
-- Table structure for table `pengarsipan`
--

CREATE TABLE `pengarsipan` (
  `arsip_id` int(11) NOT NULL,
  `surat_id` varchar(15) NOT NULL,
  `no_rak` varchar(25) NOT NULL,
  `no_sampul` varchar(25) NOT NULL,
  `no_book` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pengarsipan`
--

INSERT INTO `pengarsipan` (`arsip_id`, `surat_id`, `no_rak`, `no_sampul`, `no_book`) VALUES
(1, 'SE-2', 'SE-2', 'SE-2', 'SE-2');

-- --------------------------------------------------------

--
-- Table structure for table `surat_biasa`
--

CREATE TABLE `surat_biasa` (
  `id` varchar(15) NOT NULL,
  `opd_id` int(11) NOT NULL,
  `kop_id` int(1) NOT NULL,
  `kodesurat_id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `nomor` varchar(50) NOT NULL,
  `sifat` varchar(25) NOT NULL,
  `lampiran` varchar(20) NOT NULL,
  `hal` varchar(50) NOT NULL,
  `tembusan` varchar(255) NOT NULL,
  `lampiran_lain` varchar(25) NOT NULL,
  `isi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `surat_biasa`
--

INSERT INTO `surat_biasa` (`id`, `opd_id`, `kop_id`, `kodesurat_id`, `tanggal`, `nomor`, `sifat`, `lampiran`, `hal`, `tembusan`, `lampiran_lain`, `isi`) VALUES
('SB-1', 33, 2, 22, '2019-02-14', '', 'Biasa', '1 (Satu) Lembar', 'Undangan', '', '', '  <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Sehubungan dengan akan diadakannya Kegiatan \"Penyelenggaraan Pelatihan bagi Sumber Data Manusia (SDM) TIK seluruh PD Tahun 2019 tentang Updating Web Kelurahan dan Kecamatan\", yang akan dilaksanakan pada :</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Hari : Kamis</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Tanggal : 14 Februari 2019</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Waktu : Pukul 08.00 WIB s/d Selesai</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Tempat : Paseban Sri Bima Balaikota Bogor</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Jl. Ir. H. Juanda No. 10 Bogor</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Untuk konfirmasi kehadiran agar mengisi lembar konfirmasi sebagaimana terlampir dan membawa laptop selama kegiatan pelatihan berlangsung.</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Berkaitan dengan hal tersebut diatas kami mohon agar Bapak/Ibu menugaskan 1 (satu) Orang Operator Komputer untuk mengikuti pelatihan termaksud.</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Demikian untuk menjadi maklum, atas kehadiran tepat pada waktunya kami ucapkan terima kasih.</p>  ');

-- --------------------------------------------------------

--
-- Table structure for table `surat_edaran`
--

CREATE TABLE `surat_edaran` (
  `id` varchar(15) NOT NULL,
  `opd_id` int(11) NOT NULL,
  `kop_id` int(1) NOT NULL,
  `kodesurat_id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `nomor` varchar(50) NOT NULL,
  `tentang` varchar(100) NOT NULL,
  `isi` text NOT NULL,
  `lampiran_lain` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `surat_edaran`
--

INSERT INTO `surat_edaran` (`id`, `opd_id`, `kop_id`, `kodesurat_id`, `tanggal`, `nomor`, `tentang`, `isi`, `lampiran_lain`) VALUES
('SE-1', 33, 2, 1092, '2019-12-18', '', 'Pameran Non Komersil', '      <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Berdasarkan Edaran Walikota Bogor nomor 13 Tahun 2009 tanggal 17 Maret 2009 tentang\r\nRangkaian Kegiatan Hari Jadi Bogor Tahun 2019, dengan ini diberitahukan kepada Seluruh\r\nPerangkat Daerah di LIngkungan Pemrintah Kota Bogor untuk mempersiapkan Pameran\r\nPembangunan berkaitan dengan Tugas dan Fungsi masing-masing pada dan menyampaikan Tema\r\nPameran ke Dinas kOminfostandi Kota Bogor. Pameran akan dilaksanakan hari Rabu 03 Juni 2019,\r\nberlokais di Plaza Balaikota Bogor</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Demikian disampaikan ,untuk dilaksanakan.&nbsp;</p>      ', ''),
('SE-2', 33, 2, 1, '2020-01-02', '000/002/2020-P02', 'Pameran Non Komersil', '      <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Berdasarkan Edaran Walikota Bogor nomor 13 Tahun 2009 tanggal 17 Maret 2009 tentang\r\nRangkaian Kegiatan Hari Jadi Bogor Tahun 2019, dengan ini diberitahukan kepada Seluruh\r\nPerangkat Daerah di LIngkungan Pemrintah Kota Bogor untuk mempersiapkan Pameran\r\nPembangunan berkaitan dengan Tugas dan Fungsi masing-masing pada dan menyampaikan Tema\r\nPameran ke Dinas kOminfostandi Kota Bogor. Pameran akan dilaksanakan hari Rabu 03 Juni 2019,\r\nberlokais di Plaza Balaikota Bogor</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Demikian disampaikan ,untuk dilaksanakan.&nbsp;</p>      ', ''),
('SE-3', 33, 2, 1, '2020-01-22', '', 'Hari Batik Nasional', '  \r\n                                    <p style=\"text-align: justify; \">\r\n                                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Berdasarkan Keputusan Presiden RI nomor 33 Tahun 2009 tanggal 17 November 2009 tentang Hari Batik Nasional, dengan ini diberitahukan kepada Aparatur Sipil Negara dilingkungan Pemerintah Kota Bogor agar mengenakan pakaian batik dengan bawahan berwarna hitam pada hari Rabu 02 Oktober 2019.\r\n                                    </p>\r\n                                    <p>\r\n                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Demikian disampaikan, untuk dilaksanakan.<br>\r\n                                    </p> \r\n                                ', ''),
('SE-4', 33, 2, 5, '2020-02-27', '001.3/104-EGOV', '-', '<p style=\"text-align: justify;\">-</p>', '');

-- --------------------------------------------------------

--
-- Table structure for table `surat_instruksi`
--

CREATE TABLE `surat_instruksi` (
  `id` varchar(15) NOT NULL,
  `opd_id` int(11) NOT NULL,
  `kodesurat_id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `nomor` varchar(50) NOT NULL,
  `tentang` varchar(100) NOT NULL,
  `sifat` varchar(25) NOT NULL,
  `lampiran` varchar(20) NOT NULL,
  `hal` varchar(50) NOT NULL,
  `tembusan` varchar(255) NOT NULL,
  `lampiran_lain` varchar(25) NOT NULL,
  `isi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `surat_instruksi`
--

INSERT INTO `surat_instruksi` (`id`, `opd_id`, `kodesurat_id`, `tanggal`, `nomor`, `tentang`, `sifat`, `lampiran`, `hal`, `tembusan`, `lampiran_lain`, `isi`) VALUES
('INT-1', 33, 1, '2019-12-27', '', '-', 'Biasa', '-', '', '', '', '                                    <p>Dalam rangka....................................................<br>\r\n                                    dengan ini menginstruksikan:<br></p>\r\n                                    <table border=\"0\">\r\n                                        <tbody><tr>\r\n                                            <td>Kepada</td> \r\n                                            <td>:</td>\r\n                                            <td>1.  ... ;</td>\r\n                                            <td></td>\r\n                                            <td></td>\r\n                                            <td></td>\r\n                                            <td></td>\r\n                                        </tr>\r\n                                        <tr>\r\n                                            <td></td>\r\n                                            <td></td>\r\n                                            <td>2.  ... ;</td>\r\n                                            <td></td>\r\n                                            <td></td>\r\n                                            <td></td>\r\n                                            <td></td>\r\n                                        </tr>\r\n                                        <tr>\r\n                                            <td></td>\r\n                                            <td></td>\r\n                                            <td>3.  ... .</td>\r\n                                            <td></td>\r\n                                            <td></td>\r\n                                            <td></td>\r\n                                            <td></td>\r\n                                        </tr>               \r\n                                        <tr>\r\n                                            <td>Untuk</td>\r\n                                            <td>:</td>\r\n                                        </tr>\r\n                                        <tr>\r\n                                            <td><b>KESATU</b></td>\r\n                                            <td>:</td>\r\n                                            <td>...</td>\r\n                                            <td></td>\r\n                                            <td></td>\r\n                                            <td></td>\r\n                                            <td></td>\r\n                                        </tr>\r\n                                        <tr>\r\n                                            <td><b>KEDUA</b></td>\r\n                                            <td>:</td>\r\n                                            <td>...</td>\r\n                                            <td></td>\r\n                                            <td></td>\r\n                                            <td></td>\r\n                                            <td></td>\r\n                                        </tr>\r\n                                            <tr><td><b>KETIGA</b></td>\r\n                                            <td>:</td>\r\n                                            <td>dan seterusnya</td>\r\n                                            <td></td>\r\n                                            <td></td>\r\n                                            <td></td>\r\n                                            <td></td>\r\n                                            <td></td>\r\n                                            <td></td>\r\n                                            <td></td>\r\n                                        </tr>\r\n                                    </tbody></table>\r\n                                    <br>\r\n                                    <p>Instruksi ini mulai berlaku pada tanggal ditetapkan<br></p>\r\n                                '),
('INT-2', 33, 397, '2020-01-31', '', 'Instruksi', 'Biasa', '', '', '', '', '                                    <p>Dalam rangka....................................................<br>\r\n                                    dengan ini menginstruksikan:<br></p>\r\n                                    <table border=\"0\">\r\n                                        <tbody><tr>\r\n                                            <td>Kepada</td> \r\n                                            <td>:</td>\r\n                                            <td>1.  ... ;</td>\r\n                                            <td></td>\r\n                                            <td></td>\r\n                                            <td></td>\r\n                                            <td></td>\r\n                                        </tr>\r\n                                        <tr>\r\n                                            <td></td>\r\n                                            <td></td>\r\n                                            <td>2.  ... ;</td>\r\n                                            <td></td>\r\n                                            <td></td>\r\n                                            <td></td>\r\n                                            <td></td>\r\n                                        </tr>\r\n                                        <tr>\r\n                                            <td></td>\r\n                                            <td></td>\r\n                                            <td>3.  ... .</td>\r\n                                            <td></td>\r\n                                            <td></td>\r\n                                            <td></td>\r\n                                            <td></td>\r\n                                        </tr>               \r\n                                        <tr>\r\n                                            <td>Untuk</td>\r\n                                            <td>:</td>\r\n                                        </tr>\r\n                                        <tr>\r\n                                            <td><b>KESATU</b></td>\r\n                                            <td>:</td>\r\n                                            <td>...</td>\r\n                                            <td></td>\r\n                                            <td></td>\r\n                                            <td></td>\r\n                                            <td></td>\r\n                                        </tr>\r\n                                        <tr>\r\n                                            <td><b>KEDUA</b></td>\r\n                                            <td>:</td>\r\n                                            <td>...</td>\r\n                                            <td></td>\r\n                                            <td></td>\r\n                                            <td></td>\r\n                                            <td></td>\r\n                                        </tr>\r\n                                            <tr><td><b>KETIGA</b></td>\r\n                                            <td>:</td>\r\n                                            <td>dan seterusnya</td>\r\n                                            <td></td>\r\n                                            <td></td>\r\n                                            <td></td>\r\n                                            <td></td>\r\n                                            <td></td>\r\n                                            <td></td>\r\n                                            <td></td>\r\n                                        </tr>\r\n                                    </tbody></table>\r\n                                    <br>\r\n                                    <p>Instruksi ini mulai berlaku pada tanggal ditetapkan<br></p>\r\n                                ');

-- --------------------------------------------------------

--
-- Table structure for table `surat_izin`
--

CREATE TABLE `surat_izin` (
  `id` varchar(15) NOT NULL,
  `opd_id` int(11) NOT NULL,
  `kop_id` int(1) NOT NULL,
  `kodesurat_id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `isi` text NOT NULL,
  `tentang` varchar(100) NOT NULL,
  `nomor` varchar(50) NOT NULL,
  `nip_id` varchar(60) NOT NULL,
  `almt` varchar(255) NOT NULL,
  `untuk` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `surat_izin`
--

INSERT INTO `surat_izin` (`id`, `opd_id`, `kop_id`, `kodesurat_id`, `tanggal`, `isi`, `tentang`, `nomor`, `nip_id`, `almt`, `untuk`) VALUES
('IZN-1', 33, 2, 1, '2020-04-07', '                                                                                        <table>\r\n                                                <tbody><tr>\r\n                                                    <td>Dasar</td>\r\n                                                    <td>:</td>\r\n                                                    <td>a. ...............................................................................<br>\r\n                                                </td></tr>\r\n                                                <tr>\r\n                                                    <td></td>\r\n                                                    <td></td>\r\n                                                    <td>b. ...............................................................................<br>\r\n                                                </td></tr>\r\n                                            </tbody></table>\r\n                                                                                ', '-', '', '196212081992032004', '-', '-');

-- --------------------------------------------------------

--
-- Table structure for table `surat_keterangan`
--

CREATE TABLE `surat_keterangan` (
  `id` varchar(15) NOT NULL,
  `opd_id` int(11) NOT NULL,
  `kop_id` int(1) NOT NULL,
  `kodesurat_id` int(11) NOT NULL,
  `nomor` varchar(50) NOT NULL,
  `isi` text NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `surat_keterangan`
--

INSERT INTO `surat_keterangan` (`id`, `opd_id`, `kop_id`, `kodesurat_id`, `nomor`, `isi`, `tanggal`) VALUES
('SK-1', 33, 2, 1, '', '  \r\n                                    <p style=\"text-align: justify; \">\r\n                                        Yang bertanda tangan di bawah ini :\r\n                                        </p><table width=\"100%\">\r\n                                            <tbody><tr>\r\n                                                <td width=\"30\">&nbsp;&nbsp;&nbsp;&nbsp;a.</td>\r\n                                                <td width=\"150\">Nama</td>\r\n                                                <td width=\"10\">:</td>\r\n                                                <td>...........................</td>\r\n                                            </tr>\r\n                                            <tr>\r\n                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;b.</td>\r\n                                                <td>Jabatan</td>\r\n                                                <td>:</td>\r\n                                                <td>...........................</td>\r\n                                            </tr>\r\n                                        </tbody></table>\r\n                                    <p></p>\r\n                                    <p style=\"text-align: justify; \">\r\n                                        dengan ini menerangkan bahwa :\r\n                                        &nbsp;&nbsp;&nbsp;&nbsp;</p><table width=\"100%\">\r\n                                            <tbody><tr>\r\n                                                <td width=\"30\">&nbsp;&nbsp;&nbsp;&nbsp;a.</td>\r\n                                                <td width=\"150\">Nama</td>\r\n                                                <td width=\"10\">:</td>\r\n                                                <td>...........................</td>\r\n                                            </tr>\r\n                                            <tr>\r\n                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;b.</td>\r\n                                                <td>NIP</td>\r\n                                                <td>:</td>\r\n                                                <td>...........................</td>\r\n                                            </tr>\r\n                                            <tr>\r\n                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;c.</td>\r\n                                                <td>Pangkat/Golongan</td>\r\n                                                <td>:</td>\r\n                                                <td>...........................</td>\r\n                                            </tr>\r\n                                            <tr>\r\n                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;d.</td>\r\n                                                <td>Jabatan</td>\r\n                                                <td>:</td>\r\n                                                <td>...........................</td>\r\n                                            </tr>\r\n                                            <tr>\r\n                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;e.</td>\r\n                                                <td>Maksud</td>\r\n                                                <td>:</td>\r\n                                                <td>...........................</td>\r\n                                            </tr>\r\n                                        </tbody></table>\r\n                                    <p></p>\r\n                                    <p>\r\n                                        Demikiran Surat Keterangan ini dibuat untuk dipergunakan seperlunya.\r\n                                    </p> \r\n                                ', '2019-12-27');

-- --------------------------------------------------------

--
-- Table structure for table `surat_kuasa`
--

CREATE TABLE `surat_kuasa` (
  `id` varchar(15) NOT NULL,
  `opd_id` int(11) NOT NULL,
  `kop_id` int(1) NOT NULL,
  `kodesurat_id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `nomor` varchar(50) NOT NULL,
  `nip_id` varchar(60) NOT NULL,
  `isi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `surat_kuasa`
--

INSERT INTO `surat_kuasa` (`id`, `opd_id`, `kop_id`, `kodesurat_id`, `tanggal`, `nomor`, `nip_id`, `isi`) VALUES
('KSA-1', 33, 1, 1, '2020-04-08', '', '196212081992032004', '                                            <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Demikian Surat Kuasa ini dibuat untuk dapat dipergunakan sebagaimana mestinya.<br></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Demikian Surat Kuasa ini dibuat untuk dapat dipergunakan sebagaimana mestinya.</p>\r\n                                        ');

-- --------------------------------------------------------

--
-- Table structure for table `surat_laporan`
--

CREATE TABLE `surat_laporan` (
  `id` varchar(15) NOT NULL,
  `opd_id` int(11) NOT NULL,
  `kodesurat_id` int(11) NOT NULL,
  `nomor` varchar(50) NOT NULL,
  `tentang` varchar(100) NOT NULL,
  `isi` text NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `surat_laporan`
--

INSERT INTO `surat_laporan` (`id`, `opd_id`, `kodesurat_id`, `nomor`, `tentang`, `isi`, `tanggal`) VALUES
('LAP-1', 33, 191, '', 'Laporan Daerah', '                                             <b>I. Pendahuluan</b><br>\r\n                                                <p>A. Umum/Latar Belakang</p>\r\n                                                <p>Latar Belakang...</p>\r\n                                                <p>B. Landasan Hukum</p>\r\n                                                <p>Adapun landasan hukum dari kegiatan ini adalah:</p>\r\n                                                <p>C. Maksud dan Tujuan</p>\r\n                                                <p>Maksud dan Tujuan kegiatan ini adalah:</p>\r\n                                                <b>II. Kegiatan yang Dilaksanakan</b><br>\r\n                                                <p>Kegiatan yang dilaksanakan meliputi...</p>\r\n                                                <b>III. Hasil yang Dicapai</b><br>\r\n                                                <p>Hasil yang dicapai adalah...</p>\r\n                                                <b>IV. Kesimpulan dan Saran</b><br>\r\n                                                <p>Kesimpulan</p>\r\n                                                <p>Saran</p>\r\n                                                <b>V. Penutup</b><br>\r\n                                                <p>Sebagai penutup...</p>\r\n\r\n                                        ', '2019-10-15'),
('LAP-2', 33, 2418, '', 'Laporan Perkawinan', '                                             <b>I. Pendahuluan</b><br>\r\n                                                <p>A. Umum/Latar Belakang</p>\r\n                                                <p>Latar Belakang...</p>\r\n                                                <p>B. Landasan Hukum</p>\r\n                                                <p>Adapun landasan hukum dari kegiatan ini adalah:</p>\r\n                                                <p>C. Maksud dan Tujuan</p>\r\n                                                <p>Maksud dan Tujuan kegiatan ini adalah:</p>\r\n                                                <b>II. Kegiatan yang Dilaksanakan</b><br>\r\n                                                <p>Kegiatan yang dilaksanakan meliputi...</p>\r\n                                                <b>III. Hasil yang Dicapai</b><br>\r\n                                                <p>Hasil yang dicapai adalah...</p>\r\n                                                <b>IV. Kesimpulan dan Saran</b><br>\r\n                                                <p>Kesimpulan</p>\r\n                                                <p>Saran</p>\r\n                                                <b>V. Penutup</b><br>\r\n                                                <p>Sebagai penutup...</p>\r\n\r\n                                        ', '2020-01-30');

-- --------------------------------------------------------

--
-- Table structure for table `surat_masuk`
--

CREATE TABLE `surat_masuk` (
  `suratmasuk_id` int(11) NOT NULL,
  `dari` varchar(75) NOT NULL,
  `nomor` varchar(15) NOT NULL,
  `tanggal` date NOT NULL,
  `lampiran` varchar(100) NOT NULL,
  `hal` varchar(70) NOT NULL,
  `diterima` date NOT NULL,
  `penerima` varchar(75) NOT NULL,
  `opd_id` int(11) NOT NULL,
  `indeks` varchar(70) NOT NULL,
  `kodesurat_id` int(11) NOT NULL,
  `sifat` varchar(25) NOT NULL,
  `lampiran_lain` varchar(25) NOT NULL,
  `telp` varchar(20) NOT NULL,
  `isi` varchar(100) NOT NULL,
  `catatan` varchar(75) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `surat_masuk`
--

INSERT INTO `surat_masuk` (`suratmasuk_id`, `dari`, `nomor`, `tanggal`, `lampiran`, `hal`, `diterima`, `penerima`, `opd_id`, `indeks`, `kodesurat_id`, `sifat`, `lampiran_lain`, `telp`, `isi`, `catatan`) VALUES
(10, 'tes', 'tes', '2020-04-08', '20200408115808.pdf', 'Edaran', '2020-04-08', 'Nur Dewi Jayanti', 14, 'tes', 1, 'Biasa', '', '088276546678', '<p>-</p>', '<p>-</p>');

-- --------------------------------------------------------

--
-- Table structure for table `surat_melaksanakantugas`
--

CREATE TABLE `surat_melaksanakantugas` (
  `id` varchar(15) NOT NULL,
  `opd_id` int(11) NOT NULL,
  `kop_id` int(1) NOT NULL,
  `kodesurat_id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `nomor` varchar(50) NOT NULL,
  `nip_id` varchar(60) NOT NULL,
  `isi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `surat_melaksanakantugas`
--

INSERT INTO `surat_melaksanakantugas` (`id`, `opd_id`, `kop_id`, `kodesurat_id`, `tanggal`, `nomor`, `nip_id`, `isi`) VALUES
('MKT-1', 33, 1, 1, '2020-04-04', '', '196212081992032004', '                                            <p>\r\n                                                Yang diangkat berdasarkan ............ Nomor ............ terhitung ............ telah nyata menjalankan tugas sebagai ................ di ...........\r\n                                            </p>\r\n                                            <p>\r\n                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Demikian surat keterangan melaksanakan tugas ini saya buat dengan sesungguhnya dengan mengingat sumpah jabatan dan apabila di kemudian hari isi surat pernyataan ini ternyata tidak benar yang berakibat kerugian bagi negara, maka saya bersedia menanggung kerugian tersebut.\r\n                                            </p>\r\n                                        ');

-- --------------------------------------------------------

--
-- Table structure for table `surat_memo`
--

CREATE TABLE `surat_memo` (
  `id` varchar(15) NOT NULL,
  `opd_id` int(11) NOT NULL,
  `kop_id` int(1) NOT NULL,
  `kodesurat_id` int(11) NOT NULL,
  `nomor` varchar(50) NOT NULL,
  `tanggal` date NOT NULL,
  `isi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `surat_memo`
--

INSERT INTO `surat_memo` (`id`, `opd_id`, `kop_id`, `kodesurat_id`, `nomor`, `tanggal`, `isi`) VALUES
('MMO-1', 33, 1, 1, '', '2020-04-05', '                                                                                                                                                                                                                                                                        isi memo                                                                                                                                                                                                                                                ');

-- --------------------------------------------------------

--
-- Table structure for table `surat_notadinas`
--

CREATE TABLE `surat_notadinas` (
  `id` varchar(15) NOT NULL,
  `opd_id` int(11) NOT NULL,
  `kodesurat_id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `nomor` varchar(50) NOT NULL,
  `sifat` varchar(25) NOT NULL,
  `lampiran` varchar(20) NOT NULL,
  `hal` varchar(50) NOT NULL,
  `tembusan` varchar(255) NOT NULL,
  `lampiran_lain` varchar(25) NOT NULL,
  `isi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `surat_notadinas`
--

INSERT INTO `surat_notadinas` (`id`, `opd_id`, `kodesurat_id`, `tanggal`, `nomor`, `sifat`, `lampiran`, `hal`, `tembusan`, `lampiran_lain`, `isi`) VALUES
('NODIN-1', 33, 357, '2019-12-15', '', 'Biasa', '1 Berkas', 'Rapat Pengembangan Aplikasi CSR', '-', '', '   <p>JUDUL</p><p>YANG MENGHADIRI</p><p><br></p><p>PERMASALAHAN</p><p><br></p><p>PEMBAHASAN</p><p><br></p><p>KESIMPULAN</p>   ');

-- --------------------------------------------------------

--
-- Table structure for table `surat_notulen`
--

CREATE TABLE `surat_notulen` (
  `id` varchar(15) NOT NULL,
  `opd_id` int(11) NOT NULL,
  `kodesurat_id` int(11) NOT NULL,
  `nomor` varchar(50) NOT NULL,
  `isi` text NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `surat_notulen`
--

INSERT INTO `surat_notulen` (`id`, `opd_id`, `kodesurat_id`, `nomor`, `isi`, `tanggal`) VALUES
('NTL-1', 33, 1, '', '                                    <table>\r\n                                        <tbody><tr>\r\n                                            <td width=\"50%\">Sidang/Rapat</td>\r\n                                            <td>:</td>\r\n                                            <td>...................................</td>\r\n                                        </tr>\r\n                                        <tr>\r\n                                            <td width=\"50%\">Hari/Tanggal</td>\r\n                                            <td>:</td>\r\n                                            <td>...................................</td>\r\n                                        </tr>\r\n                                        <tr>\r\n                                            <td width=\"50%\">Waktu Panggilan</td>\r\n                                            <td>:</td>\r\n                                            <td>...................................</td>\r\n                                        </tr>\r\n                                        <tr>\r\n                                            <td width=\"50%\">Waktu Sidang/Rapat</td>\r\n                                            <td>:</td>\r\n                                            <td>...................................</td>\r\n                                        </tr>\r\n                                        <tr>\r\n                                            <td width=\"50%\">Acara</td>\r\n                                            <td>:</td>\r\n                                            <td>1. ...................................</td>\r\n                                        </tr>\r\n                                        <tr>\r\n                                            <td width=\"50%\"></td>\r\n                                            <td></td>\r\n                                            <td>2. ...................................</td>\r\n                                        </tr>\r\n                                        <tr>\r\n                                            <td width=\"50%\"></td>\r\n                                            <td></td>\r\n                                            <td>3. ...................................</td>\r\n                                        </tr>\r\n                                        <tr>\r\n                                            <td colspan=\"3  \">Pimpinan Sidang/Rapat</td>\r\n                                        </tr>\r\n                                        <tr>\r\n                                            <td width=\"50%\">Ketua</td>\r\n                                            <td>:</td>\r\n                                            <td>...................................</td>\r\n                                        </tr>\r\n                                        <tr>\r\n                                            <td width=\"50%\">Sekertaris</td>\r\n                                            <td>:</td>\r\n                                            <td>...................................</td>\r\n                                        </tr>\r\n                                        <tr>\r\n                                            <td width=\"50%\">Pencatat</td>\r\n                                            <td>:</td>\r\n                                            <td>...................................</td>\r\n                                        </tr>\r\n                                        <tr>\r\n                                            <td width=\"50%\">Peserta Sidang/Rapat</td>\r\n                                            <td>:</td>\r\n                                            <td>1. ...................................</td>\r\n                                        </tr>\r\n                                        <tr>\r\n                                            <td width=\"50%\"></td>\r\n                                            <td></td>\r\n                                            <td>2. ...................................</td>\r\n                                        </tr>\r\n                                        <tr>\r\n                                            <td width=\"50%\"></td>\r\n                                            <td></td>\r\n                                            <td>3. ...................................</td>\r\n                                        </tr>\r\n                                        <tr>\r\n                                            <td width=\"50%\">Kegiatan Sidang/Rapat</td>\r\n                                            <td>:</td>\r\n                                            <td>1. ...................................</td>\r\n                                        </tr>\r\n                                        <tr>\r\n                                            <td width=\"50%\"></td>\r\n                                            <td></td>\r\n                                            <td>2. ...................................</td>\r\n                                        </tr>\r\n                                        <tr>\r\n                                            <td width=\"50%\">1. Kata Pembukaan</td>\r\n                                            <td>:</td>\r\n                                            <td>...................................</td>\r\n                                        </tr>\r\n                                        <tr>\r\n                                            <td width=\"50%\">2. Pembahasan</td>\r\n                                            <td>:</td>\r\n                                            <td>...................................</td>\r\n                                        </tr>\r\n                                        <tr>\r\n                                            <td width=\"50%\">3. Peraturan</td>\r\n                                            <td>:</td>\r\n                                            <td>...................................</td>\r\n                                        </tr>\r\n                                    </tbody></table>\r\n                                        ', '2020-04-04');

-- --------------------------------------------------------

--
-- Table structure for table `surat_panggilan`
--

CREATE TABLE `surat_panggilan` (
  `id` varchar(15) NOT NULL,
  `opd_id` int(11) NOT NULL,
  `kop_id` int(1) NOT NULL,
  `kodesurat_id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `nomor` varchar(50) NOT NULL,
  `sifat` varchar(25) NOT NULL,
  `lampiran` varchar(20) NOT NULL,
  `hal` varchar(50) NOT NULL,
  `lampiran_lain` varchar(25) NOT NULL,
  `isi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `surat_panggilan`
--

INSERT INTO `surat_panggilan` (`id`, `opd_id`, `kop_id`, `kodesurat_id`, `tanggal`, `nomor`, `sifat`, `lampiran`, `hal`, `lampiran_lain`, `isi`) VALUES
('PGL-1', 33, 2, 1, '2020-04-04', '', 'Biasa', '-', '-', '', '                                    <p>Dengan ini diminta kedatangan Saudara di Kantor ............. pada </p>\r\n                                    <p>\r\n                                        </p><table>\r\n                                            <tbody><tr><td width=\"50\">hari</td><td>: &nbsp;&nbsp;</td><td>.................................</td></tr>\r\n                                            <tr><td width=\"50\">tanggal</td><td>: &nbsp;&nbsp;</td><td>...............................</td></tr>\r\n                                            <tr><td width=\"50\">pukul</td><td>: &nbsp;&nbsp;</td><td>.................................</td></tr>\r\n                                            <tr><td width=\"50\">tempat</td><td>: &nbsp;&nbsp;</td><td>...............................</td></tr>\r\n                                            <tr><td width=\"50\">acara</td><td>: &nbsp;&nbsp;</td><td>.................................</td></tr>\r\n                                        </tbody></table>\r\n                                    <p></p>\r\n                                    <p>Demikian untuk dilaksanakan dan menjadi perhatian sepenuhnya.</p>\r\n                                ');

-- --------------------------------------------------------

--
-- Table structure for table `surat_pengantar`
--

CREATE TABLE `surat_pengantar` (
  `id` varchar(15) NOT NULL,
  `opd_id` int(11) NOT NULL,
  `kodesurat_id` int(11) NOT NULL,
  `nomor` varchar(50) NOT NULL,
  `tanggal` date NOT NULL,
  `isi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `surat_pengantar`
--

INSERT INTO `surat_pengantar` (`id`, `opd_id`, `kodesurat_id`, `nomor`, `tanggal`, `isi`) VALUES
('PNG-1', 33, 3, '', '2020-01-13', '                                            <table border=\"1\" width=\"100%\">\r\n                                                <tbody><tr>\r\n                                                    <td>&nbsp;No.</td>\r\n                                                    <td>&nbsp;Jenis yang dikirim</td>\r\n                                                    <td>&nbsp;Banyaknya</td>\r\n                                                    <td>&nbsp;Keterangan</td>\r\n                                                </tr>\r\n                                                <tr>\r\n                                                    <td>&nbsp;</td>\r\n                                                    <td>&nbsp;</td>\r\n                                                    <td>&nbsp;</td>\r\n                                                    <td>&nbsp;</td>\r\n                                                </tr>\r\n                                            </tbody></table>ok');

-- --------------------------------------------------------

--
-- Table structure for table `surat_pengumuman`
--

CREATE TABLE `surat_pengumuman` (
  `id` varchar(15) NOT NULL,
  `opd_id` int(11) NOT NULL,
  `kop_id` int(1) NOT NULL,
  `kodesurat_id` int(11) NOT NULL,
  `nomor` varchar(50) NOT NULL,
  `tentang` varchar(100) NOT NULL,
  `isi` text NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `surat_pengumuman`
--

INSERT INTO `surat_pengumuman` (`id`, `opd_id`, `kop_id`, `kodesurat_id`, `nomor`, `tentang`, `isi`, `tanggal`) VALUES
('PNGMN-1', 33, 2, 1, '', '-', '                                    <blockquote style=\"margin: 0 0 0 40px; border: none; padding: 0px;\">\r\n                                        <p style=\"text-align: justify; line-height: 1.5;\">\r\n                                            <span style=\"font-size: 12pt;\">\r\n                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Bahwa dalam rangka terwujudnya koordinasi dan singkronisasi dalam pelaksanaan Pemerintah daerah bersama ini kami sampaikan kewenangan penandatanganan dan pemanfaatan Naskah Dinas di Lingkungan Pemerintah Kota Bogor, sesuai dengan Peraturan WaliKota Bogor Nomor 33 Tahun 2016 tentang Tata Naskah Dinas di LingkunganPemerintah Kota Bogor sebagai berikut :<br>\r\n                                            </span>\r\n                                        </p>\r\n                                        <ol>\r\n                                            <li>\r\n                                                <p>\r\n                                                    <span style=\"font-size: 12pt;\">\r\n                                                    Dalam hal pemarafan berdasarkan ketentuan Peraturan Wali Kota Bogor Nomor 33 Tahun2016 Pasal 21 bahwa setiap Naskah Dinas (Naskah Dinas dalam bentuk Produk Hukum dan Naskah Dinas dalam bentuk Surat) dari Perangkat&nbsp; Daerah yang ditandatangani oleh Walikota, Wakil Walikota dan Sekretaris Daerah di paraf paling banyak oleh 3 orang pejabat secara berjenjang sebagai bentuk pertanggungjawabaan atas muatan materi, substansi, redaksi dan pengetikan Naskah Dinas.\r\n                                                    </span>\r\n                                                </p>\r\n                                            </li>\r\n                                            <li>\r\n                                                <p>\r\n                                                    <span style=\"font-size: 12pt;\">\r\n                                                        Dalam hal penandatanganan Naskah Dinas sesuai ketentuan Pasal 27 ayat (1) dan ayat (2) Peraturan Wali Kota Bogor Nomor 33 Tahun 2016 Asisten atas nama Sekretaris Daerah mempunyai kewenangan menandatangani Naskah Dinas yang terdiridari Surat Biasa, Surat Keterangan, Surat Undangan, Surat Panggilan, NotaDinas, Laporan, Surat Pengantar dan Daftar Hadir.\r\n                                                    </span>\r\n                                                </p>\r\n                                            </li>\r\n                                            <li>\r\n                                                <p>\r\n                                                    <span style=\"font-size: 12pt;\">\r\n                                                    Kewenangan penandatanganan dan pemarafan oleh Asisten dilaksanakan sesuai dengan jejaring koordinasi masing-masing Asisten sebagaimana terlampir.</span></p></li></ol></blockquote> \r\n                                ', '2019-12-27'),
('PNGMN-2', 33, 2, 124, '', 'Tata Naskah Dinas', '                                    <blockquote style=\"margin: 0 0 0 40px; border: none; padding: 0px;\">\r\n                                        <p style=\"text-align: justify; line-height: 1.5;\">\r\n                                            <span style=\"font-size: 12pt;\">\r\n                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Bahwa dalam rangka terwujudnya koordinasi dan singkronisasi dalam pelaksanaan Pemerintah daerah bersama ini kami sampaikan kewenangan penandatanganan dan pemanfaatan Naskah Dinas di Lingkungan Pemerintah Kota Bogor, sesuai dengan Peraturan WaliKota Bogor Nomor 33 Tahun 2016 tentang Tata Naskah Dinas di LingkunganPemerintah Kota Bogor sebagai berikut :<br>\r\n                                            </span>\r\n                                        </p>\r\n                                        <ol>\r\n                                            <li>\r\n                                                <p>\r\n                                                    <span style=\"font-size: 12pt;\">\r\n                                                    Dalam hal pemarafan berdasarkan ketentuan Peraturan Wali Kota Bogor Nomor 33 Tahun2016 Pasal 21 bahwa setiap Naskah Dinas (Naskah Dinas dalam bentuk Produk Hukum dan Naskah Dinas dalam bentuk Surat) dari Perangkat&nbsp; Daerah yang ditandatangani oleh Walikota, Wakil Walikota dan Sekretaris Daerah di paraf paling banyak oleh 3 orang pejabat secara berjenjang sebagai bentuk pertanggungjawabaan atas muatan materi, substansi, redaksi dan pengetikan Naskah Dinas.\r\n                                                    </span>\r\n                                                </p>\r\n                                            </li>\r\n                                            <li>\r\n                                                <p>\r\n                                                    <span style=\"font-size: 12pt;\">\r\n                                                        Dalam hal penandatanganan Naskah Dinas sesuai ketentuan Pasal 27 ayat (1) dan ayat (2) Peraturan Wali Kota Bogor Nomor 33 Tahun 2016 Asisten atas nama Sekretaris Daerah mempunyai kewenangan menandatangani Naskah Dinas yang terdiridari Surat Biasa, Surat Keterangan, Surat Undangan, Surat Panggilan, NotaDinas, Laporan, Surat Pengantar dan Daftar Hadir.\r\n                                                    </span>\r\n                                                </p>\r\n                                            </li>\r\n                                            <li>\r\n                                                <p>\r\n                                                    <span style=\"font-size: 12pt;\">\r\n                                                    Kewenangan penandatanganan dan pemarafan oleh Asisten dilaksanakan sesuai dengan jejaring koordinasi masing-masing Asisten sebagaimana terlampir.&nbsp;\r\n                                                    </span>\r\n                                                </p>\r\n                                            </li>\r\n                                        </ol>\r\n                                        <p class=\"MsoNormal\" style=\"text-align: justify; line-height: 1.5;\">&nbsp;</p>\r\n                                    </blockquote>\r\n                                    <p style=\"margin: 0cm 0cm 7.5pt 0cm;\">&nbsp;</p>\r\n                                    <p>&nbsp;</p> \r\n                                ', '2020-01-30');

-- --------------------------------------------------------

--
-- Table structure for table `surat_perintah`
--

CREATE TABLE `surat_perintah` (
  `id` varchar(15) NOT NULL,
  `opd_id` int(33) NOT NULL,
  `kop_id` int(1) NOT NULL,
  `kodesurat_id` int(11) NOT NULL,
  `nomor` varchar(50) NOT NULL,
  `nama_pejabat` varchar(100) NOT NULL,
  `jabatan` varchar(255) NOT NULL,
  `isi` text NOT NULL,
  `tanggal` date NOT NULL,
  `tembusan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `surat_perintah`
--

INSERT INTO `surat_perintah` (`id`, `opd_id`, `kop_id`, `kodesurat_id`, `nomor`, `nama_pejabat`, `jabatan`, `isi`, `tanggal`, `tembusan`) VALUES
('SP-1', 33, 2, 5, 'SuratPerintah-1', 'tes', 'tes', '    \r\n                                    <p style=\"text-align: justify; \">\r\n                                        </p><tdtd>\r\n                                            </tdtd><table width=\"100%\">\r\n                                            <tbody><tr>\r\n                                                <td width=\"50\">Kepada</td>\r\n                                                <td width=\"150\"></td>\r\n                                                <td width=\"10\">:</td>\r\n                                                </tr>\r\n                                            <tr>\r\n                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;1.</td>\r\n                                                <td>Nama</td>\r\n                                                <td>:</td>\r\n                                                <td>...........................</td>\r\n                                            </tr>\r\n                                            <tr>\r\n                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>\r\n                                                <td>NIP.</td>\r\n                                                <td>:</td>\r\n                                                <td>...........................</td>\r\n                                            </tr>\r\n                                            <tr>\r\n                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>\r\n                                                <td>Pangkat/Golongan</td>\r\n                                                <td>:</td>\r\n                                                <td>...........................</td>\r\n                                            </tr>\r\n                                            <tr>\r\n                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>\r\n                                                <td>Jabatan</td>\r\n                                                <td>:</td>\r\n                                                <td>...........................</td>\r\n                                            </tr>\r\n                                            <tr>\r\n                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;2.</td>\r\n                                                <td>Nama</td>\r\n                                                <td>:</td>\r\n                                                <td>...........................</td>\r\n                                            </tr>\r\n                                            <tr>\r\n                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>\r\n                                                <td>NIP.</td>\r\n                                                <td>:</td>\r\n                                                <td>...........................</td>\r\n                                            </tr>\r\n                                            <tr>\r\n                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>\r\n                                                <td>Pangkat/Golongan</td>\r\n                                                <td>:</td>\r\n                                                <td>...........................</td>\r\n                                            </tr>\r\n                                            <tr>\r\n                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>\r\n                                                <td>Jabatan</td>\r\n                                                <td>:</td>\r\n                                                <td>...........................</td>\r\n                                            </tr>\r\n                                        </tbody></table>\r\n                                    <p></p>\r\n                                    <p style=\"text-align: justify;\" border=\"\">\r\n                                        &nbsp;&nbsp;&nbsp;&nbsp;</p><table width=\"100%\">\r\n                                            <tbody><tr>\r\n                                                <td width=\"50\">Untuk</td>\r\n                                                <td width=\"10\">:</td>\r\n                                                <td></td>\r\n                                            </tr>\r\n                                            <tr>\r\n                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;a.</td>\r\n                                                <td width=\"10\"></td>\r\n                                                <td>......................................................</td>\r\n                                            </tr>\r\n                                            <tr>\r\n                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;b.</td>\r\n                                                <td width=\"10\"></td>\r\n                                                <td>......................................................</td>\r\n                                            </tr>\r\n                                            <tr>\r\n                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;c.</td>\r\n                                                <td width=\"10\"></td>\r\n                                                <td>......................................................</td>\r\n                                            </tr>\r\n                                        </tbody></table>\r\n                                    <p></p>\r\n                                  ', '2019-12-30', 'tes');

-- --------------------------------------------------------

--
-- Table structure for table `surat_perintahtugas`
--

CREATE TABLE `surat_perintahtugas` (
  `id` varchar(15) NOT NULL,
  `opd_id` int(33) NOT NULL,
  `kop_id` int(1) NOT NULL,
  `kodesurat_id` int(11) NOT NULL,
  `nomor` varchar(50) NOT NULL,
  `dasar` varchar(255) NOT NULL,
  `isi` text NOT NULL,
  `tanggal` date NOT NULL,
  `tembusan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `surat_perintahtugas`
--

INSERT INTO `surat_perintahtugas` (`id`, `opd_id`, `kop_id`, `kodesurat_id`, `nomor`, `dasar`, `isi`, `tanggal`, `tembusan`) VALUES
('SPT-1', 33, 2, 0, '', 'tes', '  \r\n                                    <p style=\"text-align: justify; \">\r\n                                        </p><tdtd>\r\n                                            </tdtd><table width=\"100%\">\r\n                                            <tbody><tr>\r\n                                                <td width=\"50\">Kepada</td>\r\n                                                <td width=\"150\"></td>\r\n                                                <td width=\"10\">:</td>\r\n                                                </tr>\r\n                                            <tr>\r\n                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;1.</td>\r\n                                                <td>Nama</td>\r\n                                                <td>:</td>\r\n                                                <td>...........................</td>\r\n                                            </tr>\r\n                                            <tr>\r\n                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>\r\n                                                <td>NIP.</td>\r\n                                                <td>:</td>\r\n                                                <td>...........................</td>\r\n                                            </tr>\r\n                                            <tr>\r\n                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>\r\n                                                <td>Pangkat/Golongan</td>\r\n                                                <td>:</td>\r\n                                                <td>...........................</td>\r\n                                            </tr>\r\n                                            <tr>\r\n                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>\r\n                                                <td>Jabatan</td>\r\n                                                <td>:</td>\r\n                                                <td>...........................</td>\r\n                                            </tr>\r\n                                            <tr>\r\n                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;2.</td>\r\n                                                <td>Nama</td>\r\n                                                <td>:</td>\r\n                                                <td>...........................</td>\r\n                                            </tr>\r\n                                            <tr>\r\n                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>\r\n                                                <td>NIP.</td>\r\n                                                <td>:</td>\r\n                                                <td>...........................</td>\r\n                                            </tr>\r\n                                            <tr>\r\n                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>\r\n                                                <td>Pangkat/Golongan</td>\r\n                                                <td>:</td>\r\n                                                <td>...........................</td>\r\n                                            </tr>\r\n                                            <tr>\r\n                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>\r\n                                                <td>Jabatan</td>\r\n                                                <td>:</td>\r\n                                                <td>...........................</td>\r\n                                            </tr>\r\n                                        </tbody></table>\r\n                                    <p></p>\r\n                                    <p style=\"text-align: justify;\" border=\"\">\r\n                                        &nbsp;&nbsp;&nbsp;&nbsp;</p><table width=\"100%\">\r\n                                            <tbody><tr>\r\n                                                <td width=\"50\">Untuk</td>\r\n                                                <td width=\"10\">:</td>\r\n                                                <td></td>\r\n                                            </tr>\r\n                                            <tr>\r\n                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;a.</td>\r\n                                                <td width=\"10\"></td>\r\n                                                <td>......................................................</td>\r\n                                            </tr>\r\n                                            <tr>\r\n                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;b.</td>\r\n                                                <td width=\"10\"></td>\r\n                                                <td>......................................................</td>\r\n                                            </tr>\r\n                                            <tr>\r\n                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;c.</td>\r\n                                                <td width=\"10\"></td>\r\n                                                <td>......................................................</td>\r\n                                            </tr>\r\n                                        </tbody></table>\r\n                                    <p></p>\r\n                                ', '2019-12-30', 'tes');

-- --------------------------------------------------------

--
-- Table structure for table `surat_perjalanan`
--

CREATE TABLE `surat_perjalanan` (
  `id` varchar(15) NOT NULL,
  `opd_id` int(11) NOT NULL,
  `kodesurat_id` int(11) NOT NULL,
  `nomor` varchar(50) NOT NULL,
  `tanggal` date NOT NULL,
  `nip_id` varchar(60) NOT NULL,
  `tingkat_biaya` varchar(50) NOT NULL,
  `maksud_perjalanan` text NOT NULL,
  `alat_angkutan` varchar(60) NOT NULL,
  `tmpt_berangkat` varchar(25) NOT NULL,
  `tmpt_tujuan` varchar(25) NOT NULL,
  `lama_perjalanan` varchar(10) NOT NULL,
  `tgl_berangkat` date NOT NULL,
  `tgl_pulang` date NOT NULL,
  `kegiatan` varchar(50) NOT NULL,
  `akun` varchar(30) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `surat_perjalanan`
--

INSERT INTO `surat_perjalanan` (`id`, `opd_id`, `kodesurat_id`, `nomor`, `tanggal`, `nip_id`, `tingkat_biaya`, `maksud_perjalanan`, `alat_angkutan`, `tmpt_berangkat`, `tmpt_tujuan`, `lama_perjalanan`, `tgl_berangkat`, `tgl_pulang`, `kegiatan`, `akun`, `keterangan`) VALUES
('PJL-1', 33, 1, '', '2020-04-04', '196212081992032004', '00', '-', '-', '-', '-', '-', '2020-04-04', '2020-04-04', '-', '-', '-');

-- --------------------------------------------------------

--
-- Table structure for table `surat_rekomendasi`
--

CREATE TABLE `surat_rekomendasi` (
  `id` varchar(15) NOT NULL,
  `opd_id` int(11) NOT NULL,
  `kop_id` int(1) NOT NULL,
  `kodesurat_id` int(11) NOT NULL,
  `nomor` varchar(50) NOT NULL,
  `tentang` varchar(100) NOT NULL,
  `isi` text NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `surat_rekomendasi`
--

INSERT INTO `surat_rekomendasi` (`id`, `opd_id`, `kop_id`, `kodesurat_id`, `nomor`, `tentang`, `isi`, `tanggal`) VALUES
('REK-1', 33, 2, 1, '', '-', ' \r\n                                    <blockquote style=\"margin: 0 0 0 40px; border: none; padding: 0px;\">\r\n                                        <p>Yang bertandatangan di bawah ini,</p>\r\n                                        <p>Nama&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;</p>\r\n                                        <p>NIP&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;:&nbsp;</p>\r\n                                        <p>Nama Lembaga&nbsp; &nbsp;: </p>\r\n                                        <p>Jabatan&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : </p>\r\n                                        <p>Alamat&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;:&nbsp;</p>\r\n                                        <p>Nomor Telepon&nbsp; &nbsp;:&nbsp;</p>\r\n                                        <p>Intensitas terkait di atas untuk memberitahu bahwa Dinas Komunikasi&nbsp; dan Informatika Pemerintah Kota Bogor ingin berpartisipasi dalam Pengembangan Program Apple dan telah terdaftar dengan nomor pendaftaran&nbsp;</p>\r\n                                    </blockquote>\r\n                                ', '2019-12-27'),
('REK-2', 33, 2, 5, '', '-', ' \r\n                                    <blockquote style=\"margin: 0 0 0 40px; border: none; padding: 0px;\">\r\n                                        <p>Yang bertandatangan di bawah ini,</p>\r\n                                        <p>Nama&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;</p>\r\n                                        <p>NIP&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;:&nbsp;</p>\r\n                                        <p>Nama Lembaga&nbsp; &nbsp;: </p>\r\n                                        <p>Jabatan&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : </p>\r\n                                        <p>Alamat&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;:&nbsp;</p>\r\n                                        <p>Nomor Telepon&nbsp; &nbsp;:&nbsp;</p>\r\n                                        <p>Intensitas terkait di atas untuk memberitahu bahwa Dinas Komunikasi&nbsp; dan Informatika Pemerintah Kota Bogor ingin berpartisipasi dalam Pengembangan Program Apple dan telah terdaftar dengan nomor pendaftaran&nbsp;</p>\r\n                                    </blockquote>\r\n                                ', '2020-01-30');

-- --------------------------------------------------------

--
-- Table structure for table `surat_undangan`
--

CREATE TABLE `surat_undangan` (
  `id` varchar(15) NOT NULL,
  `opd_id` int(11) NOT NULL,
  `kop_id` int(1) NOT NULL,
  `kodesurat_id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `nomor` varchar(50) NOT NULL,
  `sifat` varchar(25) NOT NULL,
  `lampiran` varchar(20) NOT NULL,
  `hal` varchar(50) NOT NULL,
  `tembusan` varchar(255) NOT NULL,
  `lampiran_lain` varchar(25) NOT NULL,
  `isi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `surat_undangan`
--

INSERT INTO `surat_undangan` (`id`, `opd_id`, `kop_id`, `kodesurat_id`, `tanggal`, `nomor`, `sifat`, `lampiran`, `hal`, `tembusan`, `lampiran_lain`, `isi`) VALUES
('SU-1', 33, 2, 22, '2019-08-15', '', 'Biasa', '-', 'Undangan', 'Walikota Bogor (sebagai laporan),Wakil Walikota (sebagai laporan)', '', '   <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Sehubungan akan dilaksanakannya kegiatan Sosialisasi Keputusan Walikota Tentang Standar Biaya Tahun 2020, bersama ini agar Saudara selaku Pengguna Anggaran untuk menugaskan Kepala Seksi Ekonomi dan Pembangunan (untuk kelurahan) dan Pejabat Pelaksana Teknis Kegiatan (PPTK) yang terdapat pada Perangkat Daerah Saudara, untuk hadir pada :</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; Hari/Tanggal&nbsp; &nbsp; :&nbsp; &nbsp; Kamis, 22 Agustus 2019</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; Jam&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; :&nbsp; &nbsp; 09.00 WIB</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; Tempat&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp; &nbsp; Ruang Paseban Sri Baduga Balaikota Bogor</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; Acara&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;:&nbsp; &nbsp; Sosialisasi Standar Biaya Tahun 2020</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; Narasumber&nbsp; &nbsp; :&nbsp; &nbsp; 1. Inspektorat Kota Bogor;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2. BPKAD Kota Bogor;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3. BKPSDA Kota Bogor; dan</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;4. Bagian Pengadaan Barang dan Jasa Kota Bogor</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Demikian, untuk menjadi perhatian.</p>   ');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `users_id` int(11) NOT NULL,
  `level_id` int(11) NOT NULL,
  `aparatur_id` int(11) NOT NULL,
  `username` varchar(80) NOT NULL COMMENT 'NIP dari perangkat',
  `password` varchar(120) NOT NULL COMMENT 'default dari NIP',
  `email` varchar(100) NOT NULL,
  `telp` varchar(20) NOT NULL,
  `foto` varchar(300) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`users_id`, `level_id`, `aparatur_id`, `username`, `password`, `email`, `telp`, `foto`) VALUES
(1, 5, 1, '196212081992032004', '5a5b555add442c9ec722c127f2d868bf155344fa', 'erna@kotabogor.go.id', '082212345678', '20200108075831.jpg'),
(2, 6, 2, '196508041988121003', '4251b6bb3f1281c8f98e94f666f26b55c58eece5', 'asep@gmail.com', '-', '20200102042305.jpg'),
(3, 7, 3, '197706191996121001', '476f8cf39a2d91eb4cf40d47b1d14c3a6c5f0f12', 'oki@gmail.com', '082212345610', '3765.jpg'),
(4, 8, 4, '197704132006041008', 'f36f5baebcb60bc960f623e2cbef601231a44e12', 'rudi@gmail.com', '082212345611', '3676.jpg'),
(5, 15, 5, '197410162008012006', '910ce9c98dae730f5c219b2c40e8cc1fbbaa23a5', 'fitri@kotabogor.go.id', '08568974467', '3320.JPG'),
(74, 2, 75, 'admindinsos', '8cf42d6e48886c313a502c008e09a62e293103f6', 'admindinsos@kotabogor.go.id', '', ''),
(73, 2, 74, 'admindiskarpus', 'b9369157f4f64374e461ec592beabe782b4d456c', 'admindiskarpus@kotabogor.go.id', '', ''),
(8, 7, 8, '196310051988032013', '812d48d76e695c28198c26fc2843a0e537bdb390', 'reny@gmail.com', '', '20200102043011.jpg'),
(9, 5, 9, '196705111986031001', '9804852d4a0c45d9e842752855f7dc12bb8a4ee6', 'agungprihanto@gmail.com', '082212345616', '2241.jpg'),
(10, 7, 10, '197105151995031003', 'cd8700a842b7fea569bdd5886cf2a2313b4a9c8d', 'suhandi@gmail.com', '082212345617', '2852.jpg'),
(11, 8, 11, '196604171994032004', '138421ddb3497d6f269549ff1484e209e5a238a9', 'anna@gmail.com', '-', '20200102042728.jpg'),
(16, 8, 16, '196304212006041005', '8e4f39cff210ee99638749687b3a059d3515bfbd', 'suryana@kotabogor.go.id', '-', ''),
(17, 8, 17, '199103222019031005', '3ab32fa6309963ecdd519b156330208df555d516', 'edward@kotabogor.go.id', '-', ''),
(18, 8, 18, '199501052019031001', '7af46964b4c625dbe6621d9316f4b3ba1ad60b7d', 'yuridiar@kotabogor.go.id', '08785437729', ''),
(19, 2, 19, 'adminkominfo', '80c38f5acadc83da273192757747f404257041b2', 'adminkominfo@kotabogor.go.id', '-', ''),
(20, 8, 20, '197701272005012009', 'e451fc2e6830873a539264c09ac2e20d03e721d4', 'yani@gmail.com', '021', ''),
(22, 1, 22, 'superadmin', 'f37a4102fe8aace1e54ff97c4a5b75182e27788b', 'superadmin@kotabogor.go.id', '', '20200102082145.jpg'),
(25, 7, 30, '196606091993032005', 'b39fcbd6e8cbed875fb20016753f2b91e391a903', 'andi@kotabogor.go.id', '', '20200115045316.jpg'),
(26, 7, 68, '197605141995011001', '937198ea6b7bc53f9f7122c37c448c3317852718', 'hendres@kotabogor.go.id', '', '20200115045626.jpg'),
(27, 7, 69, '196912221996031001', 'fa7c4d549233c3ac48b3c6d35f1fc06f9e0e4a68', 'sugeng@kotabogor.go.id', '', '20200115045702.jpg'),
(28, 8, 25, '197309252005012010', 'cb1b8a836ca229a74b44eb27b0e5e273270370e8', 'asystasia@kotabogor.go.id', '', '20200115045750.jpg'),
(29, 8, 26, '196806041996031004', 'e8b15879b4efcfeb0e0e563141caa13b42eb838c', 'pandapotan@kotabogor.go.id', '', '20200115045830.jpg'),
(30, 8, 27, '197702022009011003', '6e411404395a82e4fcc43415046c25bf5840878b', 'buceu@kotabogor.go.id', '', '20200115045902.jpg'),
(31, 8, 28, '197509102006042010', 'e3ed922ea3241beeb4079afc472b74fe6220a9fb', 'netty@kotabogor.go.id', '', '20200115045930.jpg'),
(32, 8, 29, '198706202011011002', '7a63c67766ac4a8c80e84f72df4f464fa2373809', 'enditya@kotabogor.go.id', '', '20200115050002.jpg'),
(33, 8, 31, '197306132006041001', 'be883d788b242f8af1e203096e0020d99b4b843a', 'yun@kotabogor.go.id', '', '20200115050104.jpg'),
(34, 8, 32, '198411172009021002', '13a38f3cbc4c68e7cbf817383874d3e7adfbb455', 'teja@kotabogor.go.id', '', '20200115050133.jpg'),
(35, 8, 33, '197106242006041011', '5144da97b43ed8b12a7500d91171dc089bbb2f38', 'joni@kotabogor.go.id', '', '20200115050208.jpg'),
(36, 8, 34, '197107171994031004', 'd9b6fd6a8db2dd15cf3d569f082504f4a2d2d064', 'warsono@kotabogor.go.id', '', '20200115050238.jpg'),
(37, 8, 35, '197805072006042018', '9f660646950423d8a86ceb05dc2f065429f78bf5', 'liah@kotabogor.go.id', '', '20200115050307.jpg'),
(38, 8, 36, '198112222006041013', '59c5d5945f268b4040dd0777159cf46f075a38d0', 'achmad@kotabogor.go.id', '', '20200115050340.jpg'),
(39, 8, 37, '197101022006041011', 'd06043b1d7e969cea2695405740d6d39ba754f11', 'ahyauddin@kotabogor.go.id', '', '20200115050422.jpg'),
(40, 8, 38, '197506072009021001', '1158654cb550775f510c83e4624d059459c680ba', 'fattah@kotabogor.go.id', '', '20200115050453.jpg'),
(42, 7, 12, '196205201993122001', '9709fe9759cde6d2b708dbe006777e83a7818de9', 'nuraini@kotabogor.go.id', '', '20200115050843.jpg'),
(43, 7, 70, '196305201982031002', '2c5120f807b18f486baf9f185f5d70d25a5e29c4', 'hermen@kotabogor.go.id', '', '20200115051021.jpg'),
(44, 8, 41, '197606142006042021', 'ff8a89bf58b593d970f75db2ff1c9e3ab39ffda2', 'nurjanah@kotabogor.go.id', '', '20200115051108.jpg'),
(45, 8, 42, '196505201993012003', 'f67b534088ce325087d214bc935ae827dcc108dc', 'mellova@kotabogor.go.id', '', '20200115051146.jpg'),
(46, 8, 43, '196208011989031009', '35b9d657e15f28f67ea1639c6ccb2d204e251ec0', 'sudiyaman@kotabogor.go.id', '', '20200115051237.jpg'),
(47, 8, 44, '198107072010011022', '650fd1ac071bd786883fd5019e05f41a09455c96', 'ajid@kotabogor.go.id', '', '20200115051305.jpg'),
(48, 8, 45, '196408141992032008', '2ac151276e0ae8f996e6d4507dac58bdc44fe2a6', 'mursyida@kotabogor.go.id', '', '20200115051331.jpg'),
(49, 8, 46, '196702271991032003', 'd49d59ae61f92dd90d8ab54584c3c2485c915eaa', 'nurchasanah@kotabogor.go.id', '', '20200115051400.jpg'),
(50, 8, 47, '196505071987032006', '9d9eee65a5c69b2acd83d6cd349cdcccd4d67f2b', 'erni@kotabogor.go.id', '', '20200115051426.jpg'),
(51, 8, 48, '196208191993031004', '7590d16f26d2e234e0ddf035f8dfacdc9116fbb9', 'agus@kotabogor.go.id', '', '20200115051455.jpg'),
(52, 5, 51, '196210021989012001', '7327588f2515bc4b271e38a05af9a4876b2c13e9', 'anggraeny@kotabogor.go.id', '', '20200115051612.jpg'),
(53, 6, 52, '196810091989031005', '5c03f03551f2789e6973fab8316399ecf05d5157', 'gozali@kotabogor.go.id', '', '20200115051645.jpg'),
(54, 7, 53, '197312131994031005', '193e6b68d01785e93d606ae7db9ce458a3d8de12', 'jimmy@kotabogor.go.id', '', '20200115051712.jpg'),
(55, 7, 54, '197003212006041002', '7e6215ba5220bdbb5527cb069f706907fc965d8c', 'rokib@kotabogor.go.id', '', '20200115051745.jpg'),
(56, 7, 55, '196305051991032006', '7cd54d1f312c122660510af42d42b8c5efb08d21', 'nursarah@kotabogor.go.id', '', '20200115051814.jpg'),
(57, 7, 56, '196908011989032004', '04984ba3ece40296f89f22e9d4544708abdc7ffc', 'sumartini@kotabogor.go.id', '', '20200115051844.jpg'),
(58, 8, 57, '196411071992032002', '93304367e715341b1b4e5602f301e832db62dcdb', 'savitri@kotabogor.go.id', '', '20200115051923.jpg'),
(59, 8, 58, '196309181990102001', '709071146fd1836b7144d2a0a2504308af340275', 'wati@kotabogor.go.id', '', '20200115051951.jpg'),
(60, 8, 59, '197004151997122001', '4b2eb8e6bfbfeb4b544009addde5f5e94faaa063', 'elis@kotabogor.go.id', '', '20200115052021.jpg'),
(61, 8, 60, '197505151999011001', 'c55874b920d70219a59a4942775f6e76df0bf408', 'erwin@kotabogor.go.id', '', '20200115052049.jpg'),
(62, 8, 61, '196306261983031004', '67e7e25fbc3153e189b6a133de480f36ae7cba0d', 'ujiani@kotabogor.go.id', '', '20200115052315.jpg'),
(63, 8, 62, '196211251993031003', '7cfcb7b34ee44e0b72586b8f36b225ed3f405407', 'ketut@kotabogor.go.id', '', '20200115052347.jpg'),
(64, 8, 63, '196708021991031009', 'a536d9c67e0d0e283b7691e8b936aec9fbafb3e7', 'karma@kotabogor.go.id', '', '20200115052418.jpg'),
(65, 8, 64, '196502111985031003', '0247871cdd8a985c1bbf8741bb4e528c335c754b', 'bambang@kotabogor.go.id', '', '20200115052450.jpg'),
(66, 8, 65, '196806241994012003', 'b84e32a277e65f6337c6c9327e24e5d8055af88c', 'lusi@kotabogor.go.id', '', '20200115052517.jpg'),
(67, 8, 66, '198010252005011011', 'b21d64059c6c559f0c260f0421a876ea69cadc7b', 'ruly@kotabogor.go.id', '', '20200115052610.jpg'),
(68, 8, 67, '196209301991032001', 'ede481f00230f65097b90f56221168b7ba137d34', 'hanny@kotabogor.go.id', '', '20200115052635.jpg'),
(72, 4, 73, 'admintudiskarpus', '62efc39c72806fb4a08458c5a8e5e7864b9e4be1', 'admintudiskarpus@kotabogor.go.id', '', ''),
(71, 4, 72, 'admintukominfo', 'fc7f5d9499429dccdf4e3eef5dcae825f7f65388', 'admintukominfo@kotabogor.go.id', '-', '20200130080810.jpg'),
(75, 4, 76, 'admintudinsos', '5cb45fadc11270d487379ebc24cab60a3bf843e7', 'admintudinsos@kotabogor.go.id', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `verifikasi`
--

CREATE TABLE `verifikasi` (
  `verifikasi_id` int(11) NOT NULL,
  `dari` varchar(255) NOT NULL,
  `untuk` varchar(255) NOT NULL,
  `surat_id` varchar(15) NOT NULL,
  `keterangan` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `verifikasi`
--

INSERT INTO `verifikasi` (`verifikasi_id`, `dari`, `untuk`, `surat_id`, `keterangan`) VALUES
(27, 'Rudi Laksamana Kusumah, S.Kom - Kasi Pengembangan Aplikasi dan Sistem Integrasi', 'Oki Tri Fasiasta Nurmala Alam, S.STP - Kasi Pengembangan Aplikasi dan Sistem Integrasi', 'SE-2', ''),
(28, 'Oki Tri Fasiasta Nurmala Alam, S.STP - Kasi Pengembangan Aplikasi dan Sistem Integrasi', 'Asep Zaenal Rahmat, S.Pd., M.Pd - Sekretaris Dinas Komunikasi dan Informatika Kota Bogor', 'SE-2', ''),
(29, 'Asep Zaenal Rahmat, S.Pd., M.Pd - Sekretaris Dinas Komunikasi dan Informatika Kota Bogor', 'Admin Tata Usaha Dinas Komunikasi dan Informatika - Pengadministrasi Umum Dinas Kominfostandi', 'SE-2', 'Surat telah diselesaikan'),
(30, 'Pandapotan Nasution, S.E - Kasubag Keuangan', 'Asep Zaenal Rahmat, S.Pd., M.Pd - Sekretaris Dinas Komunikasi dan Informatika Kota Bogor', 'SE-4', ''),
(31, 'Asep Zaenal Rahmat, S.Pd., M.Pd - Sekretaris Dinas Komunikasi dan Informatika Kota Bogor', 'Admin Tata Usaha Dinas Komunikasi dan Informatika - Admin Tata Usaha Dinas Komunikasi dan Informatika', 'SE-4', 'Surat telah diselesaikan'),
(32, 'Pandapotan Nasution, S.E - Kasubag Keuangan', 'Asep Zaenal Rahmat, S.Pd., M.Pd - Sekretaris Dinas Komunikasi dan Informatika Kota Bogor', 'SE-5', ''),
(33, 'Asep Zaenal Rahmat, S.Pd., M.Pd - Sekretaris Dinas Komunikasi dan Informatika Kota Bogor', 'Admin Tata Usaha Dinas Komunikasi dan Informatika - Admin Tata Usaha Dinas Komunikasi dan Informatika', 'SE-5', 'Surat telah diselesaikan');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aparatur`
--
ALTER TABLE `aparatur`
  ADD PRIMARY KEY (`aparatur_id`);

--
-- Indexes for table `disposisi_suratkeluar`
--
ALTER TABLE `disposisi_suratkeluar`
  ADD PRIMARY KEY (`dsuratkeluar_id`);

--
-- Indexes for table `disposisi_suratmasuk`
--
ALTER TABLE `disposisi_suratmasuk`
  ADD PRIMARY KEY (`dsuratmasuk_id`);

--
-- Indexes for table `draft`
--
ALTER TABLE `draft`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `eksternal_keluar`
--
ALTER TABLE `eksternal_keluar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `informasi`
--
ALTER TABLE `informasi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jabatan`
--
ALTER TABLE `jabatan`
  ADD PRIMARY KEY (`jabatan_id`);

--
-- Indexes for table `kode_surat`
--
ALTER TABLE `kode_surat`
  ADD PRIMARY KEY (`kodesurat_id`);

--
-- Indexes for table `kop_surat`
--
ALTER TABLE `kop_surat`
  ADD PRIMARY KEY (`kop_id`);

--
-- Indexes for table `level`
--
ALTER TABLE `level`
  ADD PRIMARY KEY (`level_id`);

--
-- Indexes for table `opd`
--
ALTER TABLE `opd`
  ADD PRIMARY KEY (`opd_id`);

--
-- Indexes for table `penandatangan`
--
ALTER TABLE `penandatangan`
  ADD PRIMARY KEY (`penandatangan_id`);

--
-- Indexes for table `pengarsipan`
--
ALTER TABLE `pengarsipan`
  ADD PRIMARY KEY (`arsip_id`);

--
-- Indexes for table `surat_biasa`
--
ALTER TABLE `surat_biasa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `surat_edaran`
--
ALTER TABLE `surat_edaran`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `surat_instruksi`
--
ALTER TABLE `surat_instruksi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `surat_izin`
--
ALTER TABLE `surat_izin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `surat_keterangan`
--
ALTER TABLE `surat_keterangan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `surat_kuasa`
--
ALTER TABLE `surat_kuasa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `surat_laporan`
--
ALTER TABLE `surat_laporan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `surat_masuk`
--
ALTER TABLE `surat_masuk`
  ADD PRIMARY KEY (`suratmasuk_id`);

--
-- Indexes for table `surat_melaksanakantugas`
--
ALTER TABLE `surat_melaksanakantugas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `surat_memo`
--
ALTER TABLE `surat_memo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `surat_notadinas`
--
ALTER TABLE `surat_notadinas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `surat_notulen`
--
ALTER TABLE `surat_notulen`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `surat_panggilan`
--
ALTER TABLE `surat_panggilan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `surat_pengantar`
--
ALTER TABLE `surat_pengantar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `surat_pengumuman`
--
ALTER TABLE `surat_pengumuman`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `surat_perintah`
--
ALTER TABLE `surat_perintah`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `surat_perintahtugas`
--
ALTER TABLE `surat_perintahtugas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `surat_perjalanan`
--
ALTER TABLE `surat_perjalanan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `surat_rekomendasi`
--
ALTER TABLE `surat_rekomendasi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `surat_undangan`
--
ALTER TABLE `surat_undangan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`users_id`);

--
-- Indexes for table `verifikasi`
--
ALTER TABLE `verifikasi`
  ADD PRIMARY KEY (`verifikasi_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aparatur`
--
ALTER TABLE `aparatur`
  MODIFY `aparatur_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `disposisi_suratkeluar`
--
ALTER TABLE `disposisi_suratkeluar`
  MODIFY `dsuratkeluar_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=157;

--
-- AUTO_INCREMENT for table `disposisi_suratmasuk`
--
ALTER TABLE `disposisi_suratmasuk`
  MODIFY `dsuratmasuk_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `draft`
--
ALTER TABLE `draft`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT for table `informasi`
--
ALTER TABLE `informasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `jabatan`
--
ALTER TABLE `jabatan`
  MODIFY `jabatan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=496;

--
-- AUTO_INCREMENT for table `kode_surat`
--
ALTER TABLE `kode_surat`
  MODIFY `kodesurat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2598;

--
-- AUTO_INCREMENT for table `kop_surat`
--
ALTER TABLE `kop_surat`
  MODIFY `kop_id` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `level`
--
ALTER TABLE `level`
  MODIFY `level_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `opd`
--
ALTER TABLE `opd`
  MODIFY `opd_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `pengarsipan`
--
ALTER TABLE `pengarsipan`
  MODIFY `arsip_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `surat_masuk`
--
ALTER TABLE `surat_masuk`
  MODIFY `suratmasuk_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `users_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `verifikasi`
--
ALTER TABLE `verifikasi`
  MODIFY `verifikasi_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

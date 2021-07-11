-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 11 Jul 2021 pada 08.30
-- Versi server: 10.4.18-MariaDB
-- Versi PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perpustakaan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `anggota`
--

CREATE TABLE `anggota` (
  `NomorAnggota` varchar(10) NOT NULL,
  `NamaAnggota` varchar(40) NOT NULL,
  `Alamat` text DEFAULT NULL,
  `TanggalDaftar` date DEFAULT NULL,
  `TanggalKedaluarsa` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pustaka`
--

CREATE TABLE `pustaka` (
  `KodePustaka` varchar(10) NOT NULL,
  `JudulPustaka` text NOT NULL,
  `Pengarang` varchar(100) NOT NULL,
  `Penerbit` varchar(100) NOT NULL,
  `TahunTerbit` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pustaka`
--

INSERT INTO `pustaka` (`KodePustaka`, `JudulPustaka`, `Pengarang`, `Penerbit`, `TahunTerbit`) VALUES
('PSKT1', 'judul', 'pengarang', 'penerbit', '7979'),
('PSKT2', 'judl', 'peng', 'pener', '1111');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pustakawan`
--

CREATE TABLE `pustakawan` (
  `KodePustakawan` varchar(10) NOT NULL,
  `NamaPustakawan` varchar(40) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `NomorTelepon` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pustakawan`
--

INSERT INTO `pustakawan` (`KodePustakawan`, `NamaPustakawan`, `Password`, `NomorTelepon`) VALUES
('PST1', 'rezki', '21232f297a57a5a743894a0e4a801fc3', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `IdTransaksi` int(10) NOT NULL,
  `KodePustaka` varchar(10) NOT NULL,
  `NomorAnggota` varchar(10) NOT NULL,
  `KodePustakawanPinjam` varchar(10) NOT NULL,
  `TanggalPinjam` date DEFAULT NULL,
  `KodePustakawanKembali` varchar(10) NOT NULL,
  `TanggalKembali` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`IdTransaksi`, `KodePustaka`, `NomorAnggota`, `KodePustakawanPinjam`, `TanggalPinjam`, `KodePustakawanKembali`, `TanggalKembali`) VALUES
(2, 'PSKT1', 'AGT1', 'PST1', '2021-07-10', 'PST1', '2021-07-11'),
(3, 'PSKT1', 'AGT1', 'PST1', '2021-07-10', 'PST1', '2021-07-10'),
(4, 'PSKT2', 'AGT2', 'PST1', '2021-07-10', 'PST1', '2021-07-10');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`NomorAnggota`);

--
-- Indeks untuk tabel `pustaka`
--
ALTER TABLE `pustaka`
  ADD PRIMARY KEY (`KodePustaka`);

--
-- Indeks untuk tabel `pustakawan`
--
ALTER TABLE `pustakawan`
  ADD PRIMARY KEY (`KodePustakawan`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`IdTransaksi`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `IdTransaksi` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

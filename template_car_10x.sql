-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 30. Jul 2024 um 10:58
-- Server-Version: 10.4.28-MariaDB
-- PHP-Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `angulartest2`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `car`
--

CREATE TABLE `car` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `brand` varchar(20) NOT NULL,
  `horsepower` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `description` varchar(255) NOT NULL,
  `isItalian` tinyint(1) NOT NULL,
  `photo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `car`
--

INSERT INTO `car` (`id`, `name`, `brand`, `horsepower`, `price`, `description`, `isItalian`, `photo`) VALUES
(1, 'F40', 'Ferrari', 478, 499.00, 'A legendary F40 - Italian turbo-powered beast of a V8.', 1, 'https://www.noppenstein.io/cdn/p/59632753a7d26bc058736d54c0dbe5c0.jpg'),
(2, 'Countach', 'Lamborghini', 446, 1000000.00, 'A true spaceship.', 1, 'https://m.media-amazon.com/images/S/aplus-media-library-service-media/f1112b77-a87b-43ea-a926-2abe5a3ab1bd.__CR0,0,970,600_PT0_SX970_V1___.jpg'),
(3, 'Sport Quattro S1', 'Audi', 470, 27.69, 'Walter Röhrl. Pikes Peek. Need more?', 0, 'https://cdn03.plentymarkets.com/3jhnoljv5wfx/item/images/76897/full/76897-LEGO-1985-Audi-Sport-Quattro-S1_4.jpg'),
(4, 'F40', 'Ferrari', 478, 499.00, 'A legendary F40 - Italian turbo-powered beast of a V8.', 1, 'https://www.noppenstein.io/cdn/p/59632753a7d26bc058736d54c0dbe5c0.jpg'),
(5, 'Countach', 'Lamborghini', 446, 1000000.00, 'A true spaceship.', 1, 'https://m.media-amazon.com/images/S/aplus-media-library-service-media/f1112b77-a87b-43ea-a926-2abe5a3ab1bd.__CR0,0,970,600_PT0_SX970_V1___.jpg'),
(6, 'Sport Quattro S1', 'Audi', 470, 27.69, 'Walter Röhrl. Pikes Peek. Need more?', 0, 'https://cdn03.plentymarkets.com/3jhnoljv5wfx/item/images/76897/full/76897-LEGO-1985-Audi-Sport-Quattro-S1_4.jpg'),
(7, 'F40', 'Ferrari', 478, 499.00, 'A legendary F40 - Italian turbo-powered beast of a V8.', 1, 'https://www.noppenstein.io/cdn/p/59632753a7d26bc058736d54c0dbe5c0.jpg'),
(8, 'Countach', 'Lamborghini', 446, 1000000.00, 'A true spaceship.', 1, 'https://m.media-amazon.com/images/S/aplus-media-library-service-media/f1112b77-a87b-43ea-a926-2abe5a3ab1bd.__CR0,0,970,600_PT0_SX970_V1___.jpg'),
(9, 'Sport Quattro S1', 'Audi', 470, 27.69, 'Walter Röhrl. Pikes Peek. Need more?', 0, 'https://cdn03.plentymarkets.com/3jhnoljv5wfx/item/images/76897/full/76897-LEGO-1985-Audi-Sport-Quattro-S1_4.jpg'),
(10, 'F40', 'Ferrari', 478, 499.00, 'A legendary F40 - Italian turbo-powered beast of a V8.', 1, 'https://www.noppenstein.io/cdn/p/59632753a7d26bc058736d54c0dbe5c0.jpg'),
(11, 'Countach', 'Lamborghini', 446, 1000000.00, 'A true spaceship.', 1, 'https://m.media-amazon.com/images/S/aplus-media-library-service-media/f1112b77-a87b-43ea-a926-2abe5a3ab1bd.__CR0,0,970,600_PT0_SX970_V1___.jpg'),
(12, 'Sport Quattro S1', 'Audi', 470, 27.69, 'Walter Röhrl. Pikes Peek. Need more?', 0, 'https://cdn03.plentymarkets.com/3jhnoljv5wfx/item/images/76897/full/76897-LEGO-1985-Audi-Sport-Quattro-S1_4.jpg'),
(13, 'F40', 'Ferrari', 478, 499.00, 'A legendary F40 - Italian turbo-powered beast of a V8.', 1, 'https://www.noppenstein.io/cdn/p/59632753a7d26bc058736d54c0dbe5c0.jpg'),
(14, 'Countach', 'Lamborghini', 446, 1000000.00, 'A true spaceship.', 1, 'https://m.media-amazon.com/images/S/aplus-media-library-service-media/f1112b77-a87b-43ea-a926-2abe5a3ab1bd.__CR0,0,970,600_PT0_SX970_V1___.jpg'),
(15, 'Sport Quattro S1', 'Audi', 470, 27.69, 'Walter Röhrl. Pikes Peek. Need more?', 0, 'https://cdn03.plentymarkets.com/3jhnoljv5wfx/item/images/76897/full/76897-LEGO-1985-Audi-Sport-Quattro-S1_4.jpg'),
(16, 'F40', 'Ferrari', 478, 499.00, 'A legendary F40 - Italian turbo-powered beast of a V8.', 1, 'https://www.noppenstein.io/cdn/p/59632753a7d26bc058736d54c0dbe5c0.jpg'),
(17, 'Countach', 'Lamborghini', 446, 1000000.00, 'A true spaceship.', 1, 'https://m.media-amazon.com/images/S/aplus-media-library-service-media/f1112b77-a87b-43ea-a926-2abe5a3ab1bd.__CR0,0,970,600_PT0_SX970_V1___.jpg'),
(18, 'Sport Quattro S1', 'Audi', 470, 27.69, 'Walter Röhrl. Pikes Peek. Need more?', 0, 'https://cdn03.plentymarkets.com/3jhnoljv5wfx/item/images/76897/full/76897-LEGO-1985-Audi-Sport-Quattro-S1_4.jpg'),
(19, 'F40', 'Ferrari', 478, 499.00, 'A legendary F40 - Italian turbo-powered beast of a V8.', 1, 'https://www.noppenstein.io/cdn/p/59632753a7d26bc058736d54c0dbe5c0.jpg'),
(20, 'Countach', 'Lamborghini', 446, 1000000.00, 'A true spaceship.', 1, 'https://m.media-amazon.com/images/S/aplus-media-library-service-media/f1112b77-a87b-43ea-a926-2abe5a3ab1bd.__CR0,0,970,600_PT0_SX970_V1___.jpg'),
(21, 'Sport Quattro S1', 'Audi', 470, 27.69, 'Walter Röhrl. Pikes Peek. Need more?', 0, 'https://cdn03.plentymarkets.com/3jhnoljv5wfx/item/images/76897/full/76897-LEGO-1985-Audi-Sport-Quattro-S1_4.jpg'),
(22, 'F40', 'Ferrari', 478, 499.00, 'A legendary F40 - Italian turbo-powered beast of a V8.', 1, 'https://www.noppenstein.io/cdn/p/59632753a7d26bc058736d54c0dbe5c0.jpg'),
(23, 'Countach', 'Lamborghini', 446, 1000000.00, 'A true spaceship.', 1, 'https://m.media-amazon.com/images/S/aplus-media-library-service-media/f1112b77-a87b-43ea-a926-2abe5a3ab1bd.__CR0,0,970,600_PT0_SX970_V1___.jpg'),
(24, 'Sport Quattro S1', 'Audi', 470, 27.69, 'Walter Röhrl. Pikes Peek. Need more?', 0, 'https://cdn03.plentymarkets.com/3jhnoljv5wfx/item/images/76897/full/76897-LEGO-1985-Audi-Sport-Quattro-S1_4.jpg'),
(25, 'F40', 'Ferrari', 478, 499.00, 'A legendary F40 - Italian turbo-powered beast of a V8.', 1, 'https://www.noppenstein.io/cdn/p/59632753a7d26bc058736d54c0dbe5c0.jpg'),
(26, 'Countach', 'Lamborghini', 446, 1000000.00, 'A true spaceship.', 1, 'https://m.media-amazon.com/images/S/aplus-media-library-service-media/f1112b77-a87b-43ea-a926-2abe5a3ab1bd.__CR0,0,970,600_PT0_SX970_V1___.jpg'),
(27, 'Sport Quattro S1', 'Audi', 470, 27.69, 'Walter Röhrl. Pikes Peek. Need more?', 0, 'https://cdn03.plentymarkets.com/3jhnoljv5wfx/item/images/76897/full/76897-LEGO-1985-Audi-Sport-Quattro-S1_4.jpg'),
(28, 'F40', 'Ferrari', 478, 499.00, 'A legendary F40 - Italian turbo-powered beast of a V8.', 1, 'https://www.noppenstein.io/cdn/p/59632753a7d26bc058736d54c0dbe5c0.jpg'),
(29, 'Countach', 'Lamborghini', 446, 1000000.00, 'A true spaceship.', 1, 'https://m.media-amazon.com/images/S/aplus-media-library-service-media/f1112b77-a87b-43ea-a926-2abe5a3ab1bd.__CR0,0,970,600_PT0_SX970_V1___.jpg'),
(30, 'Sport Quattro S1', 'Audi', 470, 27.69, 'Walter Röhrl. Pikes Peek. Need more?', 0, 'https://cdn03.plentymarkets.com/3jhnoljv5wfx/item/images/76897/full/76897-LEGO-1985-Audi-Sport-Quattro-S1_4.jpg');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `car`
--
ALTER TABLE `car`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

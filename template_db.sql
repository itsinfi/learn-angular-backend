-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 26. Aug 2024 um 12:49
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
  `origin` varchar(3) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `car`
--

INSERT INTO `car` (`id`, `name`, `brand`, `horsepower`, `price`, `description`, `origin`, `photo`) VALUES
(35, 'Lego Porsche 911 GT3 RS', 'Porsche', 500, 299.99, 'This LEGO beast mirrors the real deal with its rear-mounted flat-six engine. No cup holders included because, let\'s be honest, who needs a drink when you\'re building at warp speed?', 'GER', 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.lego.com%2Fcdn%2Fcs%2Faboutus%2Fassets%2Fblt92d6c482ce0aeced%2F720_LEGO_Technic_Porsche.jpg%3Fwidth%3D1200%26quality%3D50&f=1&nofb=1&ipt=5f27c407702c51cde3f644924a63b521c28976cd2d919e4443948b'),
(36, 'Lego Bugatti Chiron', 'Bugatti', 1500, 349.99, 'The LEGO Chiron: For when you want to say \"I have a Bugatti\", but your garage disagrees. Comes with a pretend key to a car you pretend you can afford.', 'FRA', 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fsh-s7-live-s.legocdn.com%2Fis%2Fimage%2FLEGO%2F42083%3Fscl%3D1.7%26op_sharpen%3D1&f=1&nofb=1&ipt=f9175ae6cd81619d960d55b2c9dde8e8885243a100e357da5d15d6228c1eadf2&ipo=images'),
(37, 'Lego McLaren Senna', 'McLaren', 789, 249.99, 'The LEGO Senna is so aerodynamic, it\'s rumored to have flown off shelves. Disclaimer: wings not included.', 'GBR', 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Frebrickable.com%2Fmedia%2Fusers%2Fphotos%2F160805%2F79956_Ke0XiQa.jpg&f=1&nofb=1&ipt=751896defd298a66668ce933ee1f809b59392d3652d909ccab1d1e5f86ebdfb0&ipo=images'),
(38, 'Lego Ferrari F40', 'Ferrari', 471, 299.99, 'The LEGO F40, where the only thing faster than the car is how quickly you\'ll lose those tiny pieces.', 'ITA', 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fd113irssqn2xyz.cloudfront.net%2Fhd%2F10248-1_used_000.JPG&f=1&nofb=1&ipt=116bba87dc50a24709a9ca1d522912214a42dd67a91b5376bf3b6c019a233d2f&ipo=images'),
(39, 'Lego Aston Martin DB5', 'Aston Martin', 282, 149.99, 'This LEGO car comes with an ejector seat, because sometimes you just need to pop out for a quick snack break.', 'GBR', 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.motorlegend.com%2Fmodules%2Fbreve%2Fphotos%2Fsrc%2Faston-martin-db5-18006-3.jpg&f=1&nofb=1&ipt=c49155e26bc2e8ce9b469c1f8257780cef6d7732ad737de54efe11a7c8d00248&ipo=images'),
(40, 'Lego Ford Mustang', 'Ford', 450, 149.99, 'The LEGO Mustang: It\'s got the horsepower, but you\'ll have to make the vroom-vroom sounds yourself.', 'USA', 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.hellobricks.com%2Fwp-content%2Fuploads%2F2019%2F12%2FLEGO-10265-OSM-Ford-Mustang-Shelby-GT500.jpg&f=1&nofb=1&ipt=050b2915a19485fc029c5589814e762e1d594290e66623d78424ac864b0c5cd4&ipo=images'),
(41, 'Lego Volkswagen Beetle', 'Volkswagen', 40, 99.99, 'The LEGO Beetle, so cute and round, it\'s the only bug you\'ll ever want in your house.', 'GER', 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2F1.bp.blogspot.com%2F-GeVlDtg69gQ%2FV5GeuWoz4TI%2FAAAAAAAANzs%2FIDytNqYp660RQ7ilTKRx9dAHpngQ6PRiACLcB%2Fw1200-h630-p-k-no-nu%2F160721b-lego-creator-volkswagen-beetle.jpg&f=1&nofb=1&ipt=3c1a80585dd'),
(42, 'Lego Chevrolet Corvette ZR1', 'Chevrolet', 755, 49.99, 'This LEGO Corvette may not do 0-60 in 2.9 seconds, but hey, at least it won\'t get speeding tickets.', 'USA', 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fcdn.hiconsumption.com%2Fwp-content%2Fuploads%2F2019%2F01%2FLEGO-Technic-Chevrolet-Corvette-ZR1-0-Hero.jpg&f=1&nofb=1&ipt=f09424744632cfe1b11b439dbc3054f1c31c7ef13800f070e7ef8f10e754a5d8&ipo=image'),
(43, 'Lego Porsche 911 RSR', 'Porsche', 510, 299.99, 'The LEGO 911 RSR, for when you want to race, but your living room is the track.', 'GER', 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fsh-s7-live-s.legocdn.com%2Fis%2Fimage%2FLEGO%2F42096%3Fscl%3D1.7%26op_sharpen%3D1&f=1&nofb=1&ipt=77618b4e3adb414f4c00cc1edb01cfd1339df03722a40f1062a58dacdf4b59b8&ipo=images'),
(44, 'Lego Mini Cooper', 'Mini', 134, 99.99, 'The LEGO Mini Cooper, small enough to park anywhere in your home, including the bookshelf.', 'GBR', 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fd113irssqn2xyz.cloudfront.net%2Fhd%2F10242-1_used_000.JPG&f=1&nofb=1&ipt=86b3ed9da60e9131821b9ed99512862160938fdb3393a19271623bbe28b96372&ipo=images'),
(45, 'Lego Audi Sport Quattro S1', 'Audi', 306, 129.99, 'The LEGO Quattro, with a turbo so big, it\'s a wonder it fits in the box.', 'GER', 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.lego.com%2Fcdn%2Fcs%2Fset%2Fassets%2Fblt7fb2b68a5657417d%2F76897.jpg%3Ffit%3Dbounds%26format%3Djpg%26quality%3D80%26width%3D1500%26height%3D1500%26dpr%3D1&f=1&nofb=1&ipt=56e28b1e8cd2497edfeec'),
(46, 'Lego Land Rover Defender', 'Land Rover', 398, 199.99, 'The LEGO Defender, rugged and ready for the great indoors.', 'GBR', 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fjaysbrickblog.com%2Fwp-content%2Fuploads%2F2023%2F03%2F10317-Land-Rover-Defender-90-Clean.jpg&f=1&nofb=1&ipt=083331444dc8dd31f589a65a570f26d6bc16fbdcaabfa8603034042c48ffd9cf&ipo=images'),
(47, 'Lego BMW M1 Procar', 'BMW', 470, 129.99, 'The LEGO M1 Procar, because who needs German engineering when you have Danish bricks?', 'GER', 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fbrickshelf.com%2Fgallery%2FImpreSariO%2Fbmwm1%2Frps20220423_221255.jpg&f=1&nofb=1&ipt=ea96df59274c21535de231468ff2918927520abc400b77fc3a3c45436911d0ad&ipo=images'),
(48, 'Lego Nissan GT-R NISMO', 'Nissan', 600, 99.99, 'The LEGO GT-R, it corners so well, it\'s practically square.', 'JPN', 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fcdn.autobild.es%2Fsites%2Fnavi.axelspringer.es%2Fpublic%2Fstyles%2F1200%2Fpublic%2Fmedia%2Fimage%2F2019%2F11%2Fnissan-gt-r-nismo-lego_0.jpg%3Fitok%3Dg3iS7BX1&f=1&nofb=1&ipt=19a6b3b5c38e22c44177dc'),
(49, 'Lego Fiat 500', 'Fiat', 13, 89.99, 'The LEGO Fiat 500, it\'s like the real thing, only it doesn\'t need a mechanic every other month.', 'ITA', 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.carscoops.com%2Fwp-content%2Fuploads%2F2020%2F02%2Flego-classic-fiat-500-15.jpg&f=1&nofb=1&ipt=a5289e20c92681fd1bda38b1855d9969e6bede7e126a7cb708f30ac50758dacd&ipo=images'),
(50, 'Lego Caterham Seven 620R', 'Caterham', 310, 79.99, 'The LEGO Caterham, so lightweight, it might just float away if you\'re not careful.', 'GBR', 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fzusammengebaut.com%2Fwp-content%2Fuploads%2F2016%2F09%2Flego-moc-caterham-seven-620r-rgb900.jpg&f=1&nofb=1&ipt=4f1efb3d33399e35048c63edda78351b078ab3c3f0173c366cf8754b4b4112d5&ipo=images');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `flag`
--

CREATE TABLE `flag` (
  `origin` varchar(3) NOT NULL,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `flag`
--

INSERT INTO `flag` (`origin`, `image`) VALUES
('FRA', 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b5/Flag_of_France_%282020%E2%80%93present%29.svg/1920px-Flag_of_France_%282020%E2%80%93present%29.svg.png'),
('GBR', 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/Flag_of_the_United_Kingdom_%283-5%29.svg/1920px-Flag_of_the_United_Kingdom_%283-5%29.svg.png'),
('GER', 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/ba/Flag_of_Germany.svg/1920px-Flag_of_Germany.svg.png'),
('ITA', 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/03/Flag_of_Italy.svg/1920px-Flag_of_Italy.svg.png'),
('JPN', 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Flag_of_Japan.svg/1920px-Flag_of_Japan.svg.png'),
('USA', 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Flag_of_the_United_States.svg/1920px-Flag_of_the_United_States.svg.png');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indizes für die Tabelle `flag`
--
ALTER TABLE `flag`
  ADD UNIQUE KEY `origin` (`origin`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `car`
--
ALTER TABLE `car`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

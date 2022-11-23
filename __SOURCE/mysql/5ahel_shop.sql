-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 26. Sep 2022 um 14:58
-- Server-Version: 10.4.24-MariaDB
-- PHP-Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `5ahel_shop`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `artikel`
--

CREATE TABLE `artikel` (
  `artnr` int(10) NOT NULL PRIMARY KEY,
  `artikel` varchar(40) NOT NULL,
  `preis` int(10) NOT NULL,
  `whrg` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `artikel`
--

INSERT INTO `artikel` (`artnr`, `artikel`, `preis`, `whrg`) VALUES
(1, 'Stift', 10, 'EUR'),
(2, 'Heft', 20, 'USD');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `kunden`
--

CREATE TABLE `kunden` (
  `knr` int(11) NOT NULL,
  `nname` varchar(40) NOT NULL,
  `vname` varchar(40) NOT NULL,
  `str` varchar(40) NOT NULL,
  `nr` varchar(40) NOT NULL,
  `plz` int(10) NOT NULL,
  `ort` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `rechnungen`
--

CREATE TABLE `rechnungen` (
  `rnr` int(10) NOT NULL,
  `datum` date NOT NULL,
  `knr` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `rechnungen`
--

INSERT INTO `rechnungen` (`rnr`, `datum`, `knr`) VALUES
(1, '2022-09-21', NULL),
(2, '2022-09-13', NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `rechnungspositionen`
--

CREATE TABLE `rechnungspositionen` (
  `rnr` int(10) NOT NULL,
  `rpnr` int(10) NOT NULL,
  `artnr` int(10) NOT NULL,
  `anz` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `rechnungspositionen`
--

INSERT INTO `rechnungspositionen` (`rnr`, `rpnr`, `artnr`, `anz`) VALUES
(1, 1, 1, 3),
(1, 2, 2, 20);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `artikel`
--
ALTER TABLE `artikel`
  ADD PRIMARY KEY (`artnr`);

--
-- Indizes für die Tabelle `kunden`
--
ALTER TABLE `kunden`
  ADD PRIMARY KEY (`knr`);

--
-- Indizes für die Tabelle `rechnungen`
--
ALTER TABLE `rechnungen`
  ADD PRIMARY KEY (`rnr`),
  ADD KEY `fk_rechungen_kunden` (`knr`);

--
-- Indizes für die Tabelle `rechnungspositionen`
--
ALTER TABLE `rechnungspositionen`
  ADD PRIMARY KEY (`rnr`,`rpnr`),
  ADD KEY `fk_rechnungspositionen_artikel` (`artnr`);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `rechnungen`
--
ALTER TABLE `rechnungen`
  ADD CONSTRAINT `fk_rechungen_kunden` FOREIGN KEY (`knr`) REFERENCES `kunden` (`knr`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints der Tabelle `rechnungspositionen`
--
ALTER TABLE `rechnungspositionen`
  ADD CONSTRAINT `fk_rechnungspositionen_artikel` FOREIGN KEY (`artnr`) REFERENCES `artikel` (`artnr`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_rechnungspositionen_rechnungen` FOREIGN KEY (`rnr`) REFERENCES `rechnungen` (`rnr`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

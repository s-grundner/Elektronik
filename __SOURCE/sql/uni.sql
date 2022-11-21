--
-- Tabellen loeschen
--
DROP TABLE IF EXISTS `cond`;
DROP TABLE IF EXISTS `exam`;
DROP TABLE IF EXISTS `visit`;
DROP TABLE IF EXISTS `lect`;
DROP TABLE IF EXISTS `ass`;
DROP TABLE IF EXISTS `prof`;
DROP TABLE IF EXISTS `stud`;
-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ass`
--
CREATE TABLE `ass` (
  `id` int(11) NOT NULL PRIMARY KEY,
  `name` varchar(45) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `expertise` varchar(45) DEFAULT NULL,
  `profid` int(11) NOT NULL,
  FOREIGN KEY (`profid`) REFERENCES `prof` (`id`) ON UPDATE CASCADE
);

--
-- Daten für Tabelle `ass`
--
INSERT INTO `ass` (`id`, `name`, `dob`, `expertise`, `profid`) VALUES
(3002, 'Platon', '1960-12-13', 'Ideenlehre', 2125),
(3003, 'Aristoteles', '1962-12-13', 'Syllogistik', 2125),
(3004, 'Wittgenstein', '1961-12-24', 'Sprachtheorie', 2126),
(3005, 'Rhetikus', '1960-06-13', 'Planetenbewegung', 2127),
(3006, 'Newton', '1963-12-13', 'Keplersche Gesetze', 2127),
(3007, 'Spinoza', '1964-12-11', 'Gott und Natur', 2134);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `cond`
--
CREATE TABLE `cond` (
  `lectcond` int(11) NOT NULL,
  `lectid` int(11) DEFAULT NULL,
  PRIMARY KEY (lectcond,lectid),
  FOREIGN KEY (`lectid`) REFERENCES `lect`(`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (`lectcond`) REFERENCES `lect`(`id`) ON DELETE CASCADE ON UPDATE CASCADE
);

--
-- Daten für Tabelle `cond`
--
INSERT INTO `cond` (`lectcond`, `lectid`) VALUES
(4001, 4002),
(4002, 4003),
(4003, 4004);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `exam`
--
CREATE TABLE `exam` (
  `studid` int(11) NOT NULL,
  `profid` int(11) NOT NULL,
  `lectid` int(11) NOT NULL,
  `date` date NOT NULL,
  `grade` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`studid`, `lectid`, `date`, `profid`),
  FOREIGN KEY (`studid`) REFERENCES `stud`(`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  FOREIGN KEY (`profid`) REFERENCES `prof`(`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  FOREIGN KEY (`lectid`) REFERENCES `lect`(`id`) ON DELETE NO ACTION ON UPDATE CASCADE
);

--
-- Daten für Tabelle `exam`
--
INSERT INTO `exam` (`studid`, `profid`, `lectid`, `date`, `grade`) VALUES
(25403, 2125, 5041, '2011-04-12', '2.0'),
(26120, 2138, 4001, '2011-04-11', '1.0'),
(26120, 2138, 4002, '2012-04-11', '2.0'),
(26120, 2138, 4003, '2013-04-11', '2.0'),
(27550, 2138, 4001, '2011-04-11', '1.0'),
(27550, 2138, 4002, '2012-04-11', '3.0'),
(27550, 2137, 4630, '2011-04-11', '2.0'),
(28106, 2126, 5001, '2010-03-17', '1.0'),
(29120, 2138, 4001, '2011-04-11', '4.0'),
(29120, 2138, 4003, '2011-04-11', '4.0');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `lect`
--
CREATE TABLE `lect` (
  `id` int(11) NOT NULL PRIMARY KEY,
  `name` varchar(45) DEFAULT NULL,
  `ects` int(11) DEFAULT NULL,
  `profid` int(11) DEFAULT NULL,
  FOREIGN KEY (`profid`) REFERENCES `prof`(`id`) ON DELETE CASCADE ON UPDATE CASCADE
);

--
-- Daten für Tabelle `lect`
--
INSERT INTO `lect` (`id`, `name`, `ects`, `profid`) VALUES
(4001, 'Mathematik I', 4, 2138),
(4002, 'Mathematik II', 4, 2138),
(4003, 'Mathematik III', 4, 2138),
(4004, 'Mathematik IIII', 4, 2138),
(4052, 'Logik', 4, 2125),
(4630, 'Die 3 Kritiken', 4, 2137),
(5001, 'Grundzüge', 4, 2137),
(5022, 'Glaube und Wissen', 2, 2134),
(5041, 'Ethik', 4, 2125),
(5043, 'Erkenntnistheorie', 3, 2126),
(5049, 'Mäeutik', 2, 2125),
(5052, 'Wissenschaftstheorie', 3, 2126),
(5216, 'Bioethik', 2, 2126),
(5259, 'Der Wiener Kreis', 2, 2133);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `prof`
--
CREATE TABLE `prof` (
  `id` int(11) NOT NULL PRIMARY KEY,
  `name` varchar(45) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `room` varchar(45) DEFAULT NULL,
  `degree` varchar(45) DEFAULT NULL
);

--
-- Daten für Tabelle `prof`
--
INSERT INTO `prof` (`id`, `name`, `dob`, `room`, `degree`) VALUES
(2125, 'Sokrates', '1940-12-13', '226', 'c4'),
(2126, 'Russel', '1942-12-13', '232', 'c4'),
(2127, 'Kopernikus', '1941-02-14', '310', 'c3'),
(2133, 'Popper', '1940-12-17', '52', 'c3'),
(2134, 'Augustinus', '1940-12-24', '309', 'c3'),
(2136, 'Curie', '1939-01-01', '36', 'c4'),
(2137, 'Kant', '1940-07-13', '7', 'c4'),
(2138, 'Berger', '1926-06-20', '214', 'c4');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `stud`
--
CREATE TABLE `stud` (
  `id` int(11) NOT NULL PRIMARY KEY,
  `name` varchar(45) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `sem` int(11) DEFAULT NULL
);

--
-- Daten für Tabelle `stud`
--
INSERT INTO `stud` (`id`, `name`, `dob`, `sem`) VALUES
(24002, 'Xenokrates', '1970-12-13', 18),
(25403, 'Jonas', '1969-05-10', 12),
(26120, 'Fichte', '1940-12-13', 10),
(26830, 'Aristoxenos', '1968-12-13', 8),
(27550, 'Schopenhauer', '1967-11-13', 6),
(28106, 'Carnap', '1969-06-13', 3),
(29120, 'Theophrastos', '1970-12-13', 2),
(29555, 'Feuerbach', '1971-11-13', 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `visit`
--
CREATE TABLE `visit` (
  `lectid` int(11) NOT NULL,
  `studid` int(11) NOT NULL,
  PRIMARY KEY (`lectid`,`studid`),
  FOREIGN KEY (`lectid`) REFERENCES `lect`(`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (`studid`) REFERENCES `stud`(`id`) ON DELETE CASCADE ON UPDATE CASCADE
);

--
-- Daten für Tabelle `visit`
--

INSERT INTO `visit` (`lectid`, `studid`) VALUES
(4003, 26120),
(4003, 27550),
(4003, 28106),
(4003, 29120),
(4003, 29555),
(4052, 26120),
(4052, 27550),
(4630, 26120),
(5001, 26120),
(5001, 27550),
(5001, 28106),
(5001, 29120),
(5001, 29555),
(5022, 25403),
(5022, 29555),
(5041, 26120),
(5041, 28106),
(5041, 29120),
(5049, 29120),
(5052, 28106),
(5216, 28106),
(5259, 28106);


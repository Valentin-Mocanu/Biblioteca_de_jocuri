-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 20, 2025 at 03:33 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `retro_games_site`
--
CREATE DATABASE IF NOT EXISTS `retro_games_site` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `retro_games_site`;

-- --------------------------------------------------------

--
-- Table structure for table `genuri`
--

DROP TABLE IF EXISTS `genuri`;
CREATE TABLE `genuri` (
  `id_gen` smallint(5) UNSIGNED NOT NULL,
  `nume_gen` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `genuri`
--

INSERT INTO `genuri` (`id_gen`, `nume_gen`) VALUES
(1, 'Platformer'),
(2, 'Action-Adventure'),
(3, 'Fighting'),
(4, 'Action'),
(5, 'Tactical Shooter'),
(6, 'First-Person Shooter'),
(7, 'Shooter'),
(8, 'Flight Combat'),
(9, 'Sports'),
(10, 'Racing'),
(11, 'RPG'),
(12, 'Strategy'),
(13, 'Simulation'),
(14, 'Arcade'),
(15, 'Puzzle'),
(16, 'Survival Horror');

-- --------------------------------------------------------

--
-- Table structure for table `jocuri`
--

DROP TABLE IF EXISTS `jocuri`;
CREATE TABLE `jocuri` (
  `id_joc` smallint(5) UNSIGNED NOT NULL,
  `nume_joc` varchar(255) DEFAULT NULL,
  `descriere` varchar(255) DEFAULT NULL,
  `an_lansare` year(4) NOT NULL,
  `id_gen` smallint(6) DEFAULT NULL,
  `id_platforma` smallint(6) DEFAULT NULL,
  `box_art` varchar(255) DEFAULT NULL,
  `data_adaugarii` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jocuri`
--

INSERT INTO `jocuri` (`id_joc`, `nume_joc`, `descriere`, `an_lansare`, `id_gen`, `id_platforma`, `box_art`, `data_adaugarii`) VALUES
(1, 'Sonic Adventure', 'Un joc de platforma 3D in care jucatorii controleaza mai multe personaje din universul Sonic pentru a salva lumea de amenintarea lui Dr. Eggman.', '1999', 1, 6, 'fisiere_proiect/box_art/Dreamcast/Sonic_Adventure.jpg', '2025-10-01 12:51:24'),
(2, 'Soulcalibur', 'Un joc de lupte 3D in care jucatorii folosesc diferite arme si stiluri de lupta pentru a invinge adversarii intr-un turneu epic.', '1999', 3, 6, 'fisiere_proiect/box_art/Dreamcast/Soul_Calibur.jpg', '2025-10-01 12:54:04'),
(3, 'Crazy Taxi', 'Un joc de actiune in care jucatorii preiau rolul unui sofer de taxi care trebuie sa transporte clienti cat mai rapid printr-un oras aglomerat, castigand puncte si timp bonus.', '2000', 10, 6, 'fisiere_proiect/box_art/Dreamcast/Crazy_Taxi.jpg', '2025-10-01 12:55:42'),
(4, 'Shenmue', 'Un joc de aventura si explorare open-world in care jucatorii urmaresc misterul mortii tatalui protagonistului, combinand lupte, interactiuni cu NPC-uri si mini-jocuri', '2000', 2, 6, 'fisiere_proiect/box_art/Dreamcast/Shenmue.jpg', '2025-10-01 12:57:30'),
(5, 'Resident Evil – Code: Veronica', 'Un joc de supravietuire horror in care jucatorii controleaza Claire si Steve Redfield pentru a scapa de umbrele corporatiei Umbrella, confruntandu-se cu zombie si monstri mutanti.', '2000', 16, 6, 'fisiere_proiect/box_art/Dreamcast/Resident_Evil-Code_Veronica.png', '2025-10-01 13:02:04'),
(6, 'NBA 2K1', 'Un joc de baschet realist care permite jucatorilor sa controleze echipe NBA, sa joace meciuri complete si sa foloseasca strategii si tactici autentice.', '2000', 9, 6, 'fisiere_proiect/box_art/Dreamcast/NBA_2K1.jpg', '2025-10-01 13:05:20'),
(7, 'Sakura Wars 3: Is Paris Burning?', 'Un joc de aventura si strategie cu elemente RPG, in care jucatorii conduc o echipa de actrite-luptatoare in Paris, combinand lupte tactice cu interactiuni narative si romantice.', '2001', 11, 6, 'fisiere_proiect/box_art/Dreamcast/Sakura_Wars_3.jpg', '2025-10-01 13:08:10'),
(8, 'World Series Baseball 2K1', 'Un joc de baseball care permite jucatorilor sa controleze echipe profesioniste, sa joace meciuri complete si sa experimenteze strategii realiste de joc.', '2000', 9, 6, 'fisiere_proiect/box_art/Dreamcast/World_Series_Baseball_2K1.jpg', '2025-10-01 13:09:27'),
(9, 'Virtua Fighter 3tb', 'Un joc de lupte 3D care continua seria Virtua Fighter, oferind noi personaje, miscari avansate si un sistem de combat profund si tehnic.', '2000', 3, 6, 'fisiere_proiect/box_art/Dreamcast/Virtua_Fighter_3tb.jpg', '2025-10-01 13:10:43'),
(10, 'Mario Kart: Double Dash', 'Un joc de curse arcade in care doi jucatori pot controla simultan o echipa de personaje Mario, fiecare cu propriile abilitati speciale, pe trasee pline de obstacole si puteri.', '2003', 10, 5, 'fisiere_proiect/box_art/GameCube/Mario_Kart_Double_Dash.jpg', '2025-10-01 13:14:09'),
(11, 'The Legend of Zelda: The Wind Waker', 'Un joc de actiune si aventura cu stil grafic cel-shaded, in care Link porneste intr-o calatorie maritima pentru a-si salva sora si a infrunta pe Ganondorf.', '2003', 2, 5, 'fisiere_proiect/box_art/GameCube/The_Legend_of_Zelda_The_Wind_Waker.jpg', '2025-10-01 13:15:42'),
(12, 'Luigi\'s Mansion', 'Un joc de aventura si actiune in care Luigi exploreaza o casa bantuita, captureaza fantome cu ajutorul aspiratorului special si rezolva puzzle-uri pentru a-si salva fratele, Mario.', '2001', 2, 5, 'fisiere_proiect/box_art/GameCube/Luigi_Mansion.jpg', '2025-10-01 13:17:12'),
(13, 'Animal Crossing', 'Un joc de simulare sociala in care jucatorii traiesc intr-un sat plin de animale antropomorfe, isi decoreaza casa, interactioneaza cu locuitorii si participa la activitati zilnice relaxante.', '2002', 13, 5, 'fisiere_proiect/box_art/GameCube/Animal_Crossing.jpg', '2025-10-01 13:18:42'),
(14, 'Pokémon Colosseum', 'Un joc RPG in care jucatorii captureaza si lupta cu Pokémon in meciuri 3D, concentrandu-se pe strategii de batalie intr-un mod mai matur si intunecat fata de jocurile clasice.', '2004', 11, 5, 'fisiere_proiect/box_art/GameCube/Pokemon_Colosseum.jpg', '2025-10-01 13:19:51'),
(15, 'Metroid Prime', 'Un joc de actiune si aventura in perspectiva first-person, in care jucatorii exploreaza planete extraterestre, descopera secrete si lupta cu inamici folosind armamentul avansat al lui Samus Aran.', '2002', 2, 5, 'fisiere_proiect/box_art/GameCube/Metroid_Prime.jpg', '2025-10-01 13:21:01'),
(16, 'Soulcalibur II', 'Un joc de lupte 3D cu arme, oferind o lista diversa de personaje si stiluri de lupta, inclusiv un personaj exclusiv pentru versiunea GameCube, intr-un turneu epic de batalie.', '2003', 3, 5, 'fisiere_proiect/box_art/GameCube/Soul_Calibur_2.jpg', '2025-10-01 13:22:16'),
(17, 'Pikmin', 'Un joc de strategie si aventura in care jucatorii controleaza Captain Olimar pentru a comanda mici creaturi numite Pikmin, rezolvand puzzle-uri si colectand resurse pentru a repara nava spatiala.', '2002', 12, 5, 'fisiere_proiect/box_art/GameCube/Pikmin.jpg', '2025-10-01 13:23:43'),
(18, 'Star Wars Rogue Squadron II: Rogue Leader', 'Un joc de actiune si simulare de zbor in universul Star Wars, in care jucatorii piloteaza diverse nave iconice pentru a participa la misiuni istorice din trilogia originala.', '2001', 8, 5, 'fisiere_proiect/box_art/GameCube/Star_Wars_Rogue_Squadron_2.jpg', '2025-10-01 13:44:52'),
(19, 'Super Mario Bros', 'Un joc clasic de platforma in care Mario trebuie sa parcurga niveluri pline de obstacole si inamici pentru a salva printesa Peach de maleficul Bowser.', '1985', 1, 1, 'fisiere_proiect/box_art/NES/Super_Mario_Bros.png', '2025-10-01 13:52:35'),
(20, 'Duck Hunt', 'Un joc clasic de actiune in care jucatorii folosesc un light gun sau controller pentru a trage rate care apar pe ecran, incercand sa acumuleze cat mai multe puncte.', '1985', 7, 1, 'fisiere_proiect/box_art/NES/Duck_Hunt.jpg', '2025-10-01 13:58:21'),
(21, 'Tetris', 'Un joc clasic de puzzle in care jucatorii trebuie sa aranjeze piese geometrice care cad pentru a completa linii si a preveni umplerea ecranului.', '1989', 15, 1, 'fisiere_proiect/box_art/NES/Tetris.jpg', '2025-10-01 13:59:26'),
(22, 'The Legend of Zelda', 'Un joc de aventura si explorare in care jucatorii il controleaza pe Link pentru a salva regatul Hyrule, colectand obiecte, rezolvand puzzle-uri si infruntand inamici.', '1987', 2, 1, 'fisiere_proiect/box_art/NES/The_Legend_of_Zelda.png', '2025-10-01 14:00:50'),
(23, 'Excitebike', 'Un joc de curse pe motociclete in care jucatorii concureaza pe piste pline de obstacole, sarituri si zone instabile, incercand sa termine pe primul loc fara sa se rasuceasca.', '1985', 10, 1, 'fisiere_proiect/box_art/NES/Excitebike.jpg', '2025-10-01 14:02:00'),
(24, 'Dragon Quest', 'Un joc RPG clasic in care jucatorii controleaza un erou care porneste intr-o calatorie pentru a salva regatul de fortele malefice, explorand dungeons si luptand cu monstri. Lansat in America de Nord sub numele de Dragon Warrior.', '1989', 11, 1, 'fisiere_proiect/box_art/NES/Dragon_Quest.jpg', '2025-10-01 14:05:00'),
(25, 'Mega Man 2', 'Un joc de actiune si platforma in care jucatorii controleaza pe Mega Man pentru a invinge robotii malefici ai lui Dr. Wily si a salva lumea, acumuland noi arme pe parcurs.', '1989', 1, 1, 'fisiere_proiect/box_art/NES/Megaman2.jpg', '2025-10-01 14:06:09'),
(26, 'Final Fantasy', 'Un joc RPG clasic in care jucatorii controleaza patru eroi ai luminii intr-o misiune de salvare a lumii, explorand dungeons, luptand cu monstri si dezvoltandu-si personajele.', '1990', 11, 1, 'fisiere_proiect/box_art/NES/Final_Fantasy.jpg', '2025-10-01 14:07:22'),
(27, 'Bomberman', 'Un joc de actiune si strategie in care jucatorii plaseaza bombe pentru a distruge obstacole si inamici, incercand sa supravietuiasca si sa castige fiecare nivel sau meci multiplayer.', '1987', 4, 1, 'fisiere_proiect/box_art/NES/Bomberman.jpg', '2025-10-01 14:08:40'),
(28, 'Super Mario 64', 'Un joc de platforma 3D revolutionar in care Mario exploreaza Castelul Peach si diferite lumi prin porti magice, colectand stele pentru a salva printesa Peach de Bowser.', '1996', 1, 4, 'fisiere_proiect/box_art/Nintendo64/Super_Mario_64.jpg', '2025-10-01 14:11:09'),
(29, 'The Legend of Zelda: Ocarina of Time', 'Un joc de aventura si actiune in care jucatorii il controleaza pe Link, calatorind prin timp pentru a salva regatul Hyrule si a-l infrunta pe Ganondorf, explorand dungeons si rezolvand puzzle-uri.', '1998', 2, 4, 'fisiere_proiect/box_art/Nintendo64/The_Legend_of_Zelda_Ocarina_of_Time.jpg', '2025-10-01 14:13:04'),
(30, 'GoldenEye 007', 'Un joc de actiune si shooter la persoana intai in care jucatorii preiau rolul lui James Bond, completand misiuni inspirate din filmul GoldenEye.', '1997', 6, 4, 'fisiere_proiect/box_art/Nintendo64/Golden_Eye_007.jpg', '2025-10-01 14:16:15'),
(31, 'Star Wars: Shadows of the Empire', 'Un joc de actiune si aventura in universul Star Wars, combinand lupte cu vehicule, misiuni third-person si elemente de shooter, plasat intre episoadele V si VI.', '1996', 2, 4, 'fisiere_proiect/box_art/Nintendo64/Star_Wars_Shadows_of_the_Empire.jpg', '2025-10-01 14:17:25'),
(32, 'Mission: Impossible', 'Un joc de actiune si stealth in care jucatorii preiau rolul agentului Ethan Hunt, infiltrandu-se in baze inamice, evitand securitatea si indeplinind misiuni periculoase.', '1998', 4, 4, 'fisiere_proiect/box_art/Nintendo64/Mission_Impossible.jpg', '2025-10-01 14:18:29'),
(33, 'Pilotwings 64', 'Un joc de simulare a zborului in care jucatorii piloteaza diferite aeronave, plane si parapante, completand misiuni de acrobatie si explorare in diverse medii.', '1996', 13, 4, 'fisiere_proiect/box_art/Nintendo64/Pilot_Wings_64.jpg', '2025-10-01 14:20:40'),
(34, 'Bomberman Hero', 'Un joc de actiune si platforma in care jucatorii il controleaza pe Bomberman, explorand niveluri pline de obstacole si inamici, folosind bombe pentru a avansa si a rezolva puzzle-uri.', '1998', 1, 4, 'fisiere_proiect/box_art/Nintendo64/Bomberman_Hero.jpg', '2025-10-01 14:22:38'),
(35, 'Jet Force Gemini', 'Un joc de actiune si aventura third-person in care jucatorii controleaza echipa Jet Force pentru a salva galaxia de fortele malefice, combinand lupte, explorare si colectarea de resurse.', '1999', 4, 4, 'fisiere_proiect/box_art/Nintendo64/Jet_Force_Gemini.jpg', '2025-10-01 14:25:08'),
(36, 'WWF No Mercy', 'Un joc de lupte profesioniste in care jucatorii controleaza luptatori WWF, participand la meciuri si turnee cu o varietate de miscari speciale si moduri de joc.', '2000', 3, 4, 'fisiere_proiect/box_art/Nintendo64/WWF_No_Mercy.jpg', '2025-10-01 14:26:33'),
(37, 'Gran Turismo', 'Un joc de simulare auto realist care ofera jucatorilor o varietate de masini si circuite, permitand personalizarea vehiculelor si participarea la curse competitive.', '1998', 10, 7, 'fisiere_proiect/box_art/PS1/Gran_Turismo.jpg', '2025-10-01 14:29:09'),
(38, 'Tekken 3', 'Un joc de lupte 3D cu o lista variata de personaje, fiecare cu stiluri de lupta unice, oferind un gameplay rapid si complex, inclusiv moduri single-player si multiplayer.', '1998', 3, 7, 'fisiere_proiect/box_art/PS1/Tekken_3.jpg', '2025-10-01 14:30:21'),
(39, 'Tomb Raider', 'Un joc de aventura si actiune in care jucatorii o controleaza pe Lara Croft explorand temple si ruine antice, rezolvand puzzle-uri si infruntand inamici pentru a descoperi artefacte.', '1996', 2, 7, 'fisiere_proiect/box_art/PS1/Tomb_Raider.jpg', '2025-10-01 14:31:38'),
(40, 'Crash Bandicoot', 'Un joc de platforma 3D in care jucatorii il controleaza pe Crash, trecand prin niveluri pline de obstacole, inamici si cutii de colectie, pentru a opri planurile malefice ale Dr. Neo Cortex.', '1996', 1, 7, 'fisiere_proiect/box_art/PS1/Crash_Banditcoot.jpg', '2025-10-01 14:33:09'),
(41, 'Resident Evil 2', 'Un joc de supravietuire horror in care jucatorii ii controleaza pe Leon Kennedy sau Claire Redfield, explorand Raccoon City infestata cu zombie si rezolvand puzzle-uri pentru a supravietui.', '1998', 16, 7, 'fisiere_proiect/box_art/PS1/Resident_Evil_2.jpg', '2025-10-01 14:34:33'),
(42, 'Tony Hawk\'s Pro Skater', 'Un joc de skateboarding in care jucatorii efectueaza trucuri, combo-uri si misiuni in diverse skatepark-uri pentru a obtine puncte si a debloca noi niveluri si personaje.', '1999', 9, 7, 'fisiere_proiect/box_art/PS1/Tony_Hawk_Pro_Skater.jpg', '2025-10-01 14:45:34'),
(43, 'Spider-Man', 'Un joc de actiune si aventura in care jucatorii il controleaza pe Spider-Man, luptand impotriva inamicilor iconici din universul Marvel si salvand orasul New York de diverse amenintari.', '2000', 2, 7, 'fisiere_proiect/box_art/PS1/Spiderman.jpg', '2025-10-01 14:46:41'),
(44, 'Spyro the Dragon', 'Un joc de platforma 3D in care jucatorii controleaza pe Spyro, un dragon mic si agil, explorand lumi colorate, colectand comori si salvand alti dragoni de antagonisti.', '1998', 1, 7, 'fisiere_proiect/box_art/PS1/Spyro_the_Dragon.jpg', '2025-10-01 14:47:50'),
(45, 'Silent Hill', 'Un joc de supraviețuire horror in care jucatorii il controleaza pe Harry Mason, explorand orasul Silent Hill pentru a-si gasi fiica disparuta, confruntandu-se cu creaturi inspaimantatoare si puzzle-uri psihologice.', '1999', 16, 7, 'fisiere_proiect/box_art/PS1/Silent_Hill.jpg', '2025-10-01 14:49:11'),
(46, 'Sonic the Hedgehog', 'Un joc clasic de platforma in care jucatorii il controleaza pe Sonic, alergand prin niveluri rapide pentru a opri planurile malefice ale lui Dr. Robotnik si a salva animalele captive.', '1991', 1, 3, 'fisiere_proiect/box_art/Sega_Genesis/Sonic_the_Hedgehog.jpg', '2025-10-01 14:51:25'),
(47, 'Mortal Kombat', 'Un joc de lupte 2D cunoscut pentru violenta sa si „fatality”-urile, in care jucatorii controleaza luptatori cu abilitati speciale pentru a invinge adversarii intr-un turneu mortal.', '1992', 3, 3, 'fisiere_proiect/box_art/Sega_Genesis/Mortal_Kombat.jpg', '2025-10-01 14:52:38'),
(48, 'Jurassic Park', 'Un joc de actiune si aventura in care jucatorii exploreaza insula Isla Nublar, evitand dinozauri periculosi si rezolvand misiuni pentru a supravietui si a salva oamenii.', '1993', 4, 3, 'fisiere_proiect/box_art/Sega_Genesis/Jurassic_Park.jpg', '2025-10-01 14:53:47'),
(49, 'X-men', 'Un joc de actiune si beat ’em up in care jucatorii controleaza membrii echipei X-Men, luptand impotriva mutantilor rai si a lui Magneto pentru a salva lumea.', '1993', 4, 3, 'fisiere_proiect/box_art/Sega_Genesis/X-Men.jpg', '2025-10-01 14:55:00'),
(50, 'NFL \'98', 'Un joc de fotbal american care permite jucatorilor sa controleze echipe NFL in meciuri complete, oferind statistici realiste si moduri de joc variate.', '1997', 9, 3, 'fisiere_proiect/box_art/Sega_Genesis/NFL_98.jpg', '2025-10-01 14:56:13'),
(51, 'Altered Beast', 'Un joc de actiune si beat ’em up in care jucatorii controleaza un erou resuscitat de zei, transformandu-se in diverse bestii pentru a lupta impotriva monstrilor si a salva fiica lui Zeus.', '1989', 4, 3, 'fisiere_proiect/box_art/Sega_Genesis/Altered_Beast.jpg', '2025-10-01 14:57:24'),
(52, 'NBA Jam', 'Un joc de baschet arcade cunoscut pentru stilul exagerat si spectaculos, in care jucatorii efectueaza slam dunk-uri impresionante si folosesc miscari speciale pentru a castiga meciuri rapide.', '1993', 9, 3, 'fisiere_proiect/box_art/Sega_Genesis/NBA_Jam.jpg', '2025-10-01 14:58:36'),
(53, 'Eternal Champions', 'Un joc de lupte 2D in care jucatorii controleaza luptatori adusi din diferite perioade istorice pentru a concura intr-un turneu mortal ce decide soarta lor si a lumii.', '1993', 3, 3, 'fisiere_proiect/box_art/Sega_Genesis/Eternal_Champions.jpg', '2025-10-01 14:59:39'),
(54, 'Ms. Pac Man', 'Un joc clasic de labirint in care jucatorii controleaza pe Ms. Pac-Man, colectand puncte si evitand fantomele in niveluri din ce in ce mai dificile.', '1991', 14, 3, 'fisiere_proiect/box_art/Sega_Genesis/Ms_Pac-Man.jpg', '2025-10-01 15:00:40'),
(55, 'Super Mario World', 'Un joc clasic de platforma in care jucatorii il controleaza pe Mario (si uneori pe Luigi) in aventuri prin regatul Dinosaur Land pentru a salva printesa Peach de Bowser.', '1991', 1, 2, 'fisiere_proiect/box_art/SNES/Super_Mario_World.png', '2025-10-01 15:03:23'),
(56, 'Donkey Kong Country', 'Un joc de platforma in care jucatorii ii controleaza pe Donkey Kong si Diddy Kong, parcurgand niveluri pline de obstacole, inamici si comori pentru a-si recupera banana furata.', '1994', 1, 2, 'fisiere_proiect/box_art/SNES/Donkey_Kong_Country.png', '2025-10-01 15:05:00'),
(57, 'SimCity', 'Un joc de simulare urbana in care jucatorii construiesc si gestioneaza un oras, gestionand resurse, infrastructura si bunastarea locuitorilor pentru a-l face prosper.', '1991', 13, 1, 'fisiere_proiect/box_art/SNES/SimCity.png', '2025-10-01 15:06:01'),
(58, 'Super Metroid', 'Un joc de actiune si aventura in care jucatorii il controleaza pe Samus Aran explorand planeta Zebes, lupand cu creaturi periculoase si salvand pe Metroidul rapit.', '1994', 2, 2, 'fisiere_proiect/box_art/SNES/Super_Metroid.jpg', '2025-10-01 15:07:13'),
(59, 'Space Invaders', 'Un joc clasic de actiune in care jucatorii controleaza o nava spatiala si trebuie sa distruga randuri de invadatori extraterestri inainte ca acestia sa ajunga la baza.', '1991', 7, 2, 'fisiere_proiect/box_art/SNES/Space_Invaders.jpg', '2025-10-01 15:08:11'),
(60, 'Tetris 2', 'Un joc de puzzle in care jucatorii trebuie sa aranjeze piese colorate pentru a le combina si elimina linii, oferind o varianta mai dinamica si colorata a clasicului Tetris.', '1993', 15, 2, 'fisiere_proiect/box_art/SNES/Tetris_2.jpg', '2025-10-01 15:09:11'),
(61, 'Dragon Quest 3', 'Un joc RPG clasic in care jucatorii creeaza un grup de aventurieri pentru a salva lumea de fortele malefice, explorand dungeons, rezolvand puzzle-uri si luptand cu monstri.', '1996', 11, 2, 'fisiere_proiect/box_art/SNES/Dragon_Quest_3.jpg', '2025-10-01 15:10:13'),
(62, 'Aladdin', 'Un joc de platforma in care jucatorii il controleaza pe Aladdin, sarind si evitand obstacole prin niveluri inspirate din filmul Disney, folosindu-si agilitatea si sabia pentru a invinge inamicii.', '1993', 1, 2, 'fisiere_proiect/box_art/SNES/Aladdin.jpg', '2025-10-01 15:11:32'),
(63, 'Final Fantasy IV', 'Un joc RPG clasic in care jucatorii urmeaza povestea lui Cecil, un cavaler al luminii, intr-o misiune epica de salvare a lumii, explorand dungeons, luptand cu monstri si dezvoltandu-si personajele. Lansat in America de Nord sub numele de Final Fant', '1991', 11, 2, 'fisiere_proiect/box_art/SNES/Final_Fantasy_4.jpg', '2025-10-01 15:13:30'),
(64, 'Halo: Combat Evolved', 'Un joc de actiune si shooter first-person in care jucatorii il controleaza pe Master Chief, luptand impotriva Covenant si Flood pe o planeta enigmatica numita Halo.', '2001', 6, 8, 'fisiere_proiect/box_art/Xbox/Halo_Combat_Evolved.jpg', '2025-10-01 15:17:28'),
(65, 'Grand Theft Auto III', 'Un joc de actiune si aventura open-world in care jucatorii controleaza un personaj fara nume in Liberty City, completand misiuni criminale si explorand liber orasul.', '2003', 2, 8, 'fisiere_proiect/box_art/Xbox/GTA_3.jpg', '2025-10-01 15:18:41'),
(66, 'Grand Theft Auto: Vice City', 'Un joc de actiune si aventura open-world plasat in anii \'80, in care jucatorii il controleaza pe Tommy Vercetti, construind un imperiu criminal in orasul Vice City prin misiuni si jafuri.', '2003', 2, 8, 'fisiere_proiect/box_art/Xbox/GTA_Vice_City.jpg', '2025-10-01 15:19:36'),
(67, 'Counter-Strike', 'Un joc shooter tactico-strategic in care jucatorii se alatura echipei de counter-teroristi sau teroristi, completand misiuni precum dezamorsarea bombelor sau salvarea ostaticilor in meciuri multiplayer.', '2003', 6, 8, 'fisiere_proiect/box_art/Xbox/Counter_Strike.jpg', '2025-10-01 15:20:47'),
(68, 'Need for Speed: Underground', 'Un joc de curse arcade si simulare auto in care jucatorii participa la curse stradale ilegale, personalizand masini si folosind viteza si abilitati pentru a invinge adversarii.', '2003', 10, 8, 'fisiere_proiect/box_art/Xbox/NFS_Underground.jpg', '2025-10-01 15:22:04'),
(69, 'Star Wars: Battlefront', 'Un joc de actiune si shooter third-person in care jucatorii participa la batalii epice intre fortele Rebel si Imperiu in diverse locatii iconice din universul Star Wars.', '2004', 4, 8, 'fisiere_proiect/box_art/Xbox/Star_Wars_Battlefront.jpg', '2025-10-01 15:23:22'),
(70, 'Call of Duty 2: Big Red One', 'Un joc shooter first-person bazat pe Al Doilea Razboi Mondial, in care jucatorii urmeaza echipa „Big Red One” in misiuni istorice din Europa si Africa de Nord.', '2005', 6, 8, 'fisiere_proiect/box_art/Xbox/Call_of_Duty_2_Big_Red_One.jpg', '2025-10-01 15:24:20'),
(71, 'Madden NFL 2005', 'Un joc de fotbal american care permite jucatorilor sa controleze echipe NFL reale, participand la meciuri si campionate cu statistici si strategii realiste.', '2004', 9, 8, 'fisiere_proiect/box_art/Xbox/Maden_NFL_2005.jpg', '2025-10-01 15:25:35'),
(72, 'Tom Clancy\'s Ghost Recon', 'Un joc tactico-strategic shooter third-person in care jucatorii conduc echipa de operatiuni speciale „Ghosts”, completand misiuni militare realiste in diverse medii de razboi.', '2002', 5, 8, 'fisiere_proiect/box_art/Xbox/Tom_Clancy_Ghost_Recon.jpg', '2025-10-01 15:30:29');

-- --------------------------------------------------------

--
-- Table structure for table `platforme`
--

DROP TABLE IF EXISTS `platforme`;
CREATE TABLE `platforme` (
  `id_platforma` smallint(5) UNSIGNED NOT NULL,
  `nume_platforma` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `platforme`
--

INSERT INTO `platforme` (`id_platforma`, `nume_platforma`) VALUES
(1, 'Nintendo Entertainment System'),
(2, 'Super Nintendo Entertainment System'),
(3, 'Sega Genesis'),
(4, 'Nintendo 64'),
(5, 'GameCube'),
(6, 'Dreamcast'),
(7, 'PlayStation 1'),
(8, 'Xbox');

-- --------------------------------------------------------

--
-- Table structure for table `utilizatori`
--

DROP TABLE IF EXISTS `utilizatori`;
CREATE TABLE `utilizatori` (
  `id_utilizator` smallint(5) UNSIGNED NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password_hash` varchar(255) DEFAULT NULL,
  `data_adaugarii` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `utilizatori`
--

INSERT INTO `utilizatori` (`id_utilizator`, `username`, `email`, `password_hash`, `data_adaugarii`) VALUES
(1, 'Admin', 'admin@gmail.com', '$2y$10$PfuCPIjhQMlOV9MiE3bCnuq8IN8aIDtea./YlYLa5elPiXjQeqyBS', '2025-10-02 12:58:12'),
(2, 'User', 'user@gmail.com', '$2y$10$X3IsLBkdmJgb.8Q5pcx1YOLTLBEajSVgGEfiOd8BfO1ipZIS9d.im', '2025-10-03 14:11:52'),
(4, 'Ana Popescu', 'ana_popescu@gmail.com', '$2y$10$GrCmuJz1HM4.cE6FzubdLeXXvCaV63BPYUB6taspCMjH512Otwm02', '2025-10-20 13:29:45'),
(5, 'Ion Vasile', 'ion_vasile@yahoo.com', '$2y$10$6HcjOIR6ANWr70G8GpaMxuwQUZLGuQYzC/t.sgTpRrPa3gD9DXFDm', '2025-10-20 13:30:27');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `genuri`
--
ALTER TABLE `genuri`
  ADD PRIMARY KEY (`id_gen`),
  ADD UNIQUE KEY `id_gen` (`id_gen`),
  ADD KEY `id_gen_2` (`id_gen`);

--
-- Indexes for table `jocuri`
--
ALTER TABLE `jocuri`
  ADD PRIMARY KEY (`id_joc`),
  ADD UNIQUE KEY `id_joc` (`id_joc`),
  ADD KEY `id_joc_2` (`id_joc`);

--
-- Indexes for table `platforme`
--
ALTER TABLE `platforme`
  ADD PRIMARY KEY (`id_platforma`),
  ADD UNIQUE KEY `id_platforma` (`id_platforma`),
  ADD KEY `id_platforma_2` (`id_platforma`);

--
-- Indexes for table `utilizatori`
--
ALTER TABLE `utilizatori`
  ADD PRIMARY KEY (`id_utilizator`),
  ADD UNIQUE KEY `id_utilizator` (`id_utilizator`),
  ADD KEY `id_utilizator_2` (`id_utilizator`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `genuri`
--
ALTER TABLE `genuri`
  MODIFY `id_gen` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `jocuri`
--
ALTER TABLE `jocuri`
  MODIFY `id_joc` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `platforme`
--
ALTER TABLE `platforme`
  MODIFY `id_platforma` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `utilizatori`
--
ALTER TABLE `utilizatori`
  MODIFY `id_utilizator` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

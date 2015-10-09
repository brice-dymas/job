-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Ven 09 Octobre 2015 à 13:43
-- Version du serveur :  5.6.21
-- Version de PHP :  5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `job`
--

--
-- Contenu de la table `Entreprise`
--

INSERT INTO `Entreprise` (`id`, `boitePostale`, `nom`, `telephone`, `adresse`, `contact`, `numeroPersonneAContacter`) VALUES
(1, '25 Montréal', 'Heaven Laundry S.A', '+151234578', '25 Rue des choux', 'Stanton Parish ', '+15112369875'),
(2, '53 Orfèvres ', 'BOREAMAR S.A', '+15112369874', '18 Orfèvres Nord', 'Michael Richardson Adams ', '+15147859632'),
(3, '25 Madrid', 'Hidrophorm PLC', '+13369857412', 'Calle de las novias', 'PAOLO Bernardo', '+15125968743');

--
-- Contenu de la table `JobSeeker`
--

INSERT INTO `JobSeeker` (`id`, `cheque`, `cni`, `cv`, `email`, `nom`, `numero`, `prenom`, `telephone`, `statut`) VALUES
(1, NULL, '5eme Rue Touristique Bafoussam', '', 'briceguemkam@gmail.com', 'GUEMKAM SANDO', 'GUEB4045', 'BRICE', '+237693552463', 'Déjà Placé'),
(2, 'CNIB.jpg', '1234566789', 'CV.pdf', 'gildasnzeukeng@hotmail.fr', 'NZEUKENG KAMGANG', 'BORB2423', 'Gildas', '+15112369874', 'Disponible'),
(3, 'Permis de conduire-2.jpg', '111258963', 'Permis de conduire-1.jpg', 'cabreltchindanembot@yahoo.fr', 'TCHINDA NEMBOT', 'TCHC2398', 'Cabrel', '694620946', 'Disponible');

--
-- Contenu de la table `JobSeeker_Secteur`
--

INSERT INTO `JobSeeker_Secteur` (`JobSeeker_id`, `secteursDemploi_id`) VALUES
(1, 1),
(1, 2),
(1, 4),
(2, 1),
(3, 2),
(3, 4);

--
-- Contenu de la table `Placement`
--

INSERT INTO `Placement` (`id`, `dateDebut`, `dateFin`, `nombreDheureParJour`, `observation`, `statut`, `tauxHoraire`, `entreprise_id`, `jobSeeker_id`) VALUES
(1, '2015-09-21', '2015-09-30', 10, 'En évaluation ', 'En Cours d''execution', 500, 3, 1),
(2, '2015-04-01', '2015-05-30', 12, 'Bon travail', 'Stage termine', 2000, 2, 2),
(3, '2015-09-13', '2015-09-20', 1, 'Vraiment chaleureux et travailleur mérite une bourse', 'Stage termine', 3000, 3, 3);

--
-- Contenu de la table `Secteur`
--

INSERT INTO `Secteur` (`id`, `libelle`) VALUES
(1, 'Education'),
(2, 'Commerce'),
(4, 'Litterature'),
(5, 'Hidrologie'),
(6, 'Sécurité Civile'),
(7, 'medecine'),
(8, 'sport');

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`username`, `enabled`, `nom`, `password`) VALUES
('Abo', 1, 'NZEUKENG KAMGANG Gildas', '$2a$10$DRo..pbm20asFdemxRUQc.ZXRTHImNomfY2go1xXdU2vv84331/3G'),
('admin', 1, 'Administrateur', '$2a$10$nhpQ4Gve.7wewnP4djxX9eV.RDaUtwtAcxX8XqNVzuG0q3sZhecl.'),
('kaporal', 1, 'GUEMKAM SANDO Brice', '$2a$10$VOgNsFeFLi7CQs0xZGZmxOmU3rnQTZ4Pp/x6zNfUb5d5hnPTUZvm2'),
('sando', 1, 'GUEMKAM Brice', '$2a$10$EX/7trS99m6Ebq7gtgfM2OjtX7Jc5Q5/.ZTTFhnzTyhS69j3YdkiK');

--
-- Contenu de la table `user_roles`
--

INSERT INTO `user_roles` (`user_role_id`, `role`, `user_username`) VALUES
(1, 'ROLE_ADMIN', 'admin'),
(2, 'ROLE_USER', 'sando'),
(3, 'ROLE_ADMIN', 'kaporal'),
(4, 'ros', 'Abo');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

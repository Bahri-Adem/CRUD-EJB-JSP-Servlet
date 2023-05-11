-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 11 mai 2023 à 23:37
-- Version du serveur : 10.4.24-MariaDB
-- Version de PHP : 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `mydb`
--

-- --------------------------------------------------------

--
-- Structure de la table `t_client`
--

CREATE TABLE `t_client` (
  `cin` varchar(255) NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `adresse` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `t_client`
--

INSERT INTO `t_client` (`cin`, `nom`, `prenom`, `adresse`) VALUES
('111', 'adem', 'bahri', 'jammel'),
('222', 'wadhah', 'mabrouk', 'ksiba'),
('333', 'firas', 'chakroun', 'sfax'),
('444', 'najeh', 'Mabrouk', 'ksiba'),
('555', 'Sara', 'Ben Arfa', 'Marsa'),
('666', 'Sara', 'Kanoun', 'Sfax');

-- --------------------------------------------------------

--
-- Structure de la table `t_compte`
--

CREATE TABLE `t_compte` (
  `rib` bigint(20) NOT NULL,
  `solde` float NOT NULL,
  `id_client` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `t_compte`
--

INSERT INTO `t_compte` (`rib`, `solde`, `id_client`) VALUES
(1, 200, '111'),
(2, 200, '222'),
(3, 300, '333'),
(4, 200, '222'),
(5, 300, '222'),
(6, 500, '444'),
(7, 300, '111'),
(13, 800, '111'),
(15, 500, '333'),
(18, 400, '444'),
(19, 250, '222'),
(21, 500, '111'),
(22, 660, '222'),
(23, 230, '111'),
(24, 230, '111'),
(25, 1600, '555'),
(26, 900, '555'),
(27, 450, '666');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `t_client`
--
ALTER TABLE `t_client`
  ADD PRIMARY KEY (`cin`);

--
-- Index pour la table `t_compte`
--
ALTER TABLE `t_compte`
  ADD PRIMARY KEY (`rib`),
  ADD KEY `FK9552b5xecw9tpbpg08fbkmwis` (`id_client`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `t_compte`
--
ALTER TABLE `t_compte`
  MODIFY `rib` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `t_compte`
--
ALTER TABLE `t_compte`
  ADD CONSTRAINT `FK9552b5xecw9tpbpg08fbkmwis` FOREIGN KEY (`id_client`) REFERENCES `t_client` (`cin`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

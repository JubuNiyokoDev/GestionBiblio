-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 02 juil. 2024 à 14:03
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
-- Base de données : `gestionbiblio`
--

-- --------------------------------------------------------

--
-- Structure de la table `amandes`
--

CREATE TABLE `amandes` (
  `idAmande` int(11) NOT NULL,
  `idUtilisateur` int(11) DEFAULT NULL,
  `montant` double DEFAULT NULL,
  `paye` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `employes`
--

CREATE TABLE `employes` (
  `idEmploye` int(11) NOT NULL,
  `idPersonne` int(11) DEFAULT NULL,
  `salaire` double DEFAULT NULL,
  `dateEmbauche` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `emprunts`
--

CREATE TABLE `emprunts` (
  `idEmprunt` int(11) NOT NULL,
  `idUtilisateur` int(11) DEFAULT NULL,
  `idLivre` int(11) DEFAULT NULL,
  `dateEmprunt` date DEFAULT NULL,
  `dateRetour` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `evenements`
--

CREATE TABLE `evenements` (
  `idEvenement` int(11) NOT NULL,
  `titreEvenement` varchar(30) DEFAULT NULL,
  `descriptionEvenement` varchar(100) DEFAULT NULL,
  `dateDebutEvenement` date DEFAULT NULL,
  `dateFinEvenement` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `fournisseurs`
--

CREATE TABLE `fournisseurs` (
  `idFournisseur` int(11) NOT NULL,
  `idPersonne` int(11) DEFAULT NULL,
  `dateLivraison` date DEFAULT NULL,
  `idLivre` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `lecteurs`
--

CREATE TABLE `lecteurs` (
  `idlecteur` int(11) NOT NULL,
  `idUtilisateur` int(11) DEFAULT NULL,
  `idLivre` int(11) DEFAULT NULL,
  `heureDebut` time DEFAULT NULL,
  `heureFin` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `livres`
--

CREATE TABLE `livres` (
  `idLivre` int(11) NOT NULL,
  `auteur` varchar(50) DEFAULT NULL,
  `datePublication` date DEFAULT NULL,
  `quantite` int(11) DEFAULT NULL,
  `genre` enum('SCIENCE','INFORMATIQUE','RELIGION','ROMAN','SANTE') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `partenaires`
--

CREATE TABLE `partenaires` (
  `idPartenaire` int(11) NOT NULL,
  `idPersonne` int(11) DEFAULT NULL,
  `dateDebut` date DEFAULT NULL,
  `dateFin` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `personnes`
--

CREATE TABLE `personnes` (
  `idPersonne` int(11) NOT NULL,
  `nom` varchar(100) DEFAULT NULL,
  `prenom` varchar(50) DEFAULT NULL,
  `adresse` varchar(100) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

CREATE TABLE `utilisateurs` (
  `idUtilisateur` int(11) NOT NULL,
  `idPersonne` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `amandes`
--
ALTER TABLE `amandes`
  ADD PRIMARY KEY (`idAmande`),
  ADD KEY `idUtilisateur` (`idUtilisateur`);

--
-- Index pour la table `employes`
--
ALTER TABLE `employes`
  ADD PRIMARY KEY (`idEmploye`),
  ADD KEY `idPersonne` (`idPersonne`);

--
-- Index pour la table `emprunts`
--
ALTER TABLE `emprunts`
  ADD PRIMARY KEY (`idEmprunt`),
  ADD KEY `idUtilisateur` (`idUtilisateur`),
  ADD KEY `idLivre` (`idLivre`);

--
-- Index pour la table `evenements`
--
ALTER TABLE `evenements`
  ADD PRIMARY KEY (`idEvenement`);

--
-- Index pour la table `fournisseurs`
--
ALTER TABLE `fournisseurs`
  ADD PRIMARY KEY (`idFournisseur`),
  ADD KEY `idPersonne` (`idPersonne`),
  ADD KEY `idLivre` (`idLivre`);

--
-- Index pour la table `lecteurs`
--
ALTER TABLE `lecteurs`
  ADD PRIMARY KEY (`idlecteur`),
  ADD KEY `idUtilisateur` (`idUtilisateur`),
  ADD KEY `idLivre` (`idLivre`);

--
-- Index pour la table `livres`
--
ALTER TABLE `livres`
  ADD PRIMARY KEY (`idLivre`);

--
-- Index pour la table `partenaires`
--
ALTER TABLE `partenaires`
  ADD PRIMARY KEY (`idPartenaire`),
  ADD KEY `idPersonne` (`idPersonne`);

--
-- Index pour la table `personnes`
--
ALTER TABLE `personnes`
  ADD PRIMARY KEY (`idPersonne`);

--
-- Index pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  ADD PRIMARY KEY (`idUtilisateur`),
  ADD KEY `idPersonne` (`idPersonne`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `amandes`
--
ALTER TABLE `amandes`
  MODIFY `idAmande` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `employes`
--
ALTER TABLE `employes`
  MODIFY `idEmploye` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `emprunts`
--
ALTER TABLE `emprunts`
  MODIFY `idEmprunt` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `evenements`
--
ALTER TABLE `evenements`
  MODIFY `idEvenement` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `fournisseurs`
--
ALTER TABLE `fournisseurs`
  MODIFY `idFournisseur` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `lecteurs`
--
ALTER TABLE `lecteurs`
  MODIFY `idlecteur` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `livres`
--
ALTER TABLE `livres`
  MODIFY `idLivre` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `partenaires`
--
ALTER TABLE `partenaires`
  MODIFY `idPartenaire` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `personnes`
--
ALTER TABLE `personnes`
  MODIFY `idPersonne` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  MODIFY `idUtilisateur` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `amandes`
--
ALTER TABLE `amandes`
  ADD CONSTRAINT `amandes_ibfk_1` FOREIGN KEY (`idUtilisateur`) REFERENCES `personnes` (`idPersonne`);

--
-- Contraintes pour la table `employes`
--
ALTER TABLE `employes`
  ADD CONSTRAINT `employes_ibfk_1` FOREIGN KEY (`idPersonne`) REFERENCES `personnes` (`idPersonne`);

--
-- Contraintes pour la table `emprunts`
--
ALTER TABLE `emprunts`
  ADD CONSTRAINT `emprunts_ibfk_1` FOREIGN KEY (`idUtilisateur`) REFERENCES `personnes` (`idPersonne`),
  ADD CONSTRAINT `emprunts_ibfk_2` FOREIGN KEY (`idUtilisateur`) REFERENCES `personnes` (`idPersonne`),
  ADD CONSTRAINT `emprunts_ibfk_3` FOREIGN KEY (`idLivre`) REFERENCES `livres` (`idLivre`);

--
-- Contraintes pour la table `fournisseurs`
--
ALTER TABLE `fournisseurs`
  ADD CONSTRAINT `fournisseurs_ibfk_1` FOREIGN KEY (`idPersonne`) REFERENCES `personnes` (`idPersonne`),
  ADD CONSTRAINT `fournisseurs_ibfk_2` FOREIGN KEY (`idLivre`) REFERENCES `livres` (`idLivre`);

--
-- Contraintes pour la table `lecteurs`
--
ALTER TABLE `lecteurs`
  ADD CONSTRAINT `lecteurs_ibfk_1` FOREIGN KEY (`idUtilisateur`) REFERENCES `personnes` (`idPersonne`),
  ADD CONSTRAINT `lecteurs_ibfk_2` FOREIGN KEY (`idLivre`) REFERENCES `livres` (`idLivre`);

--
-- Contraintes pour la table `partenaires`
--
ALTER TABLE `partenaires`
  ADD CONSTRAINT `partenaires_ibfk_1` FOREIGN KEY (`idPersonne`) REFERENCES `personnes` (`idPersonne`);

--
-- Contraintes pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  ADD CONSTRAINT `utilisateurs_ibfk_1` FOREIGN KEY (`idPersonne`) REFERENCES `personnes` (`idPersonne`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

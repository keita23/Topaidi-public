-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : ven. 19 mars 2021 à 14:06
-- Version du serveur :  5.7.24
-- Version de PHP : 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `produitjee`
--

-- --------------------------------------------------------


-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE `category` (
  `id` bigint(20) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `description`, `title`) VALUES
(1, 'Confinement', 'Confinement'),
(2, 'C\'est le covid', 'Covid'),
(3, 'Environement', 'Cop21'),
(4, 'Recherche de la vie extraterreste', 'Univers et vie');


-- --------------------------------------------------------

--
-- Structure de la table `comment`
--

CREATE TABLE `comment` (
  `id` bigint(20) NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  `subscribe` date DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `comment`
--

INSERT INTO `comment` (`id`, `note`, `subscribe`, `user_id`) VALUES
(1, 'C\'est bien', '2021-02-17', 1),
(2, 'Moyen', '2021-02-17', 1),
(3, 'J\'adore', '2021-02-17', 1);

-- --------------------------------------------------------


--
-- Structure de la table `idea`
--

CREATE TABLE `idea` (
  `id` bigint(20) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `subscribe` date DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `urlImage` varchar(255) DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `idea`
--

INSERT INTO `idea` (`id`, `description`, `subscribe`, `title`, `urlImage`, `category_id`, `user_id`) VALUES
(1, 'C\'est bien de protéger la planette. C\'est le devoir de tous.', '2021-02-17', 'Environnement', 'https://www.chu-besancon.fr/uploads/tx_dkactus/protection_environnement_web_2_01.jpg', 3, 1),
(2, 'Agir pour l\'eau pour tous', '2021-02-17', 'Eau', 'https://www.bethunebruay.fr/sites/default/files/styles/original/public/media/images/18224.jpg?itok=p582dXk8', 3, 1),
(3, 'Le covid à changer nos modes de vies', '2021-02-17', 'Covid', 'https://www.ebsco.com/e/files/assets-blogs/coka-project-covid19-blog-image-940.png', 2, 1),
(4, 'L\'eau sur la planete Mars', '2021-03-19', 'Eau sur Mars', 'https://www.vaisala.com/sites/default/files/styles/16_9_liftup_extra_large/public/images/LIFT-Mars%20the%20Red%20Planet-1600x900.jpg?itok=YXq-Cv1K', 4, 2);

-- --------------------------------------------------------

--
-- Structure de la table `idea_comment`
--

CREATE TABLE `idea_comment` (
  `Idea_id` bigint(20) NOT NULL,
  `commentes_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `idea_vote`
--

CREATE TABLE `idea_vote` (
  `Idea_id` bigint(20) NOT NULL,
  `votes_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `idea_vote`
--

INSERT INTO `idea_vote` (`Idea_id`, `votes_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 8),
(1, 29),
(1, 30),
(1, 31),
(1, 32),
(2, 5),
(2, 12),
(2, 23),
(2, 24),
(2, 25),
(2, 26),
(2, 27),
(2, 28),
(3, 6),
(3, 7),
(3, 11);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL,
  `activated` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `passw` varchar(255) DEFAULT NULL,
  `subscribe` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `activated`, `email`, `name`, `passw`, `subscribe`) VALUES
(1, 'yes', 'Keit@gm.com', 'Keita', 'dchjcr e', '2021-02-17'),
(2, 'yes', 'Alain@c.com', 'Alain', 'defgthh', '2021-03-19'),
(3, 'yes', 'Claire', 'Claire', 'cecrhujki', '2021-03-19');

-- --------------------------------------------------------

--
-- Structure de la table `vote`
--

CREATE TABLE `vote` (
  `id` bigint(20) NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  `subscribe` date DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `vote`
--

INSERT INTO `vote` (`id`, `note`, `subscribe`, `user_id`) VALUES
(1, 'Top', '2021-02-17', 1),
(2, 'Top', '2021-02-17', 1),
(3, 'Top', '2021-02-17', 1),
(4, 'Flop', '2021-02-17', 1),
(5, 'Top', '2021-02-17', 1),
(6, 'Top', '2021-02-17', 1),
(7, 'Flop', '2021-02-17', 1),
(8, 'Flop', '2021-02-17', 1),
(9, 'Top', '2021-02-17', 1),
(10, 'Flop', '2021-02-17', 1),
(11, 'Top', '2021-02-17', 1),
(12, 'Flop', '2021-02-17', 1),
(23, 'Flop', '2021-02-17', 1),
(24, 'Flop', '2021-02-17', 1),
(25, 'Flop', '2021-02-17', 1),
(26, 'Flop', '2021-02-17', 1),
(27, 'Top', '2021-02-17', NULL),
(28, 'Top', '2021-02-17', NULL),
(29, 'Top', '2021-02-17', NULL),
(30, 'Top', '2021-02-17', NULL),
(31, 'Top', '2021-02-17', NULL),
(32, 'Top', '2021-02-17', NULL);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);


--
-- Index pour la table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKhlbnnmiua9xpvfq8y1u1a15ie` (`user_id`);


--
-- Index pour la table `idea`
--
ALTER TABLE `idea`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKpjid846oua907yjb1ju4ngnyn` (`category_id`),
  ADD KEY `FKgc685xpgaqopr116aykqiun5v` (`user_id`);

--
-- Index pour la table `idea_comment`
--
ALTER TABLE `idea_comment`
  ADD UNIQUE KEY `UK_f7i23xd6evlynrncwhop3ylvq` (`commentes_id`),
  ADD KEY `FKkxqkiioiqc24v01elasq5yw6t` (`Idea_id`);

--
-- Index pour la table `idea_vote`
--
ALTER TABLE `idea_vote`
  ADD UNIQUE KEY `UK_2sv8d7pnimrr7a2hxto1ql37t` (`votes_id`),
  ADD KEY `FK29wdj8aelv7jd5oig6lrqb2fu` (`Idea_id`);



--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `vote`
--
ALTER TABLE `vote`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK78x2ik3lctm9na4o4c9fqmhdg` (`user_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--


--
-- AUTO_INCREMENT pour la table `category`
--
ALTER TABLE `category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;


--
-- AUTO_INCREMENT pour la table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;


--
-- AUTO_INCREMENT pour la table `idea`
--
ALTER TABLE `idea`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;



--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `vote`
--
ALTER TABLE `vote`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- Contraintes pour les tables déchargées
--


--
-- Contraintes pour la table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `FKhlbnnmiua9xpvfq8y1u1a15ie` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);


--
-- Contraintes pour la table `idea`
--
ALTER TABLE `idea`
  ADD CONSTRAINT `FKgc685xpgaqopr116aykqiun5v` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FKpjid846oua907yjb1ju4ngnyn` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

--
-- Contraintes pour la table `idea_comment`
--
ALTER TABLE `idea_comment`
  ADD CONSTRAINT `FKkxqkiioiqc24v01elasq5yw6t` FOREIGN KEY (`Idea_id`) REFERENCES `idea` (`id`),
  ADD CONSTRAINT `FKo5awkigeynfhnwcjyk8t8vyo1` FOREIGN KEY (`commentes_id`) REFERENCES `comment` (`id`);

--
-- Contraintes pour la table `idea_vote`
--
ALTER TABLE `idea_vote`
  ADD CONSTRAINT `FK29wdj8aelv7jd5oig6lrqb2fu` FOREIGN KEY (`Idea_id`) REFERENCES `idea` (`id`),
  ADD CONSTRAINT `FKbi9ftq59rjxk50jquqsi96qfo` FOREIGN KEY (`votes_id`) REFERENCES `vote` (`id`);


--
-- Contraintes pour la table `vote`
--
ALTER TABLE `vote`
  ADD CONSTRAINT `FK78x2ik3lctm9na4o4c9fqmhdg` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `username` varchar(255) NOT NULL,
  `passwd` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`username`, `passwd`) VALUES
('Alain', 'testPasswd2'),
('Claire', 'testPasswd3'),
('Keita', 'testPasswd');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`);



--
-- Structure de la table `userroles`
--

CREATE TABLE `userroles` (
  `username` varchar(255) NOT NULL,
  `role` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `userroles`
--

INSERT INTO `userroles` (`username`, `role`) VALUES
('Keita', 'ADMIN'),
('Alain', 'ADMIN'),
('Claire', 'ADMIN');



COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

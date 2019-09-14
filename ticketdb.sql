-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  sam. 07 sep. 2019 à 11:58
-- Version du serveur :  10.1.36-MariaDB
-- Version de PHP :  5.6.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `ticketdb`
--

-- --------------------------------------------------------

--
-- Structure de la table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can add permission', 2, 'add_permission'),
(5, 'Can change permission', 2, 'change_permission'),
(6, 'Can delete permission', 2, 'delete_permission'),
(7, 'Can add group', 3, 'add_group'),
(8, 'Can change group', 3, 'change_group'),
(9, 'Can delete group', 3, 'delete_group'),
(10, 'Can add content type', 4, 'add_contenttype'),
(11, 'Can change content type', 4, 'change_contenttype'),
(12, 'Can delete content type', 4, 'delete_contenttype'),
(13, 'Can add session', 5, 'add_session'),
(14, 'Can change session', 5, 'change_session'),
(15, 'Can delete session', 5, 'delete_session'),
(16, 'Can add user', 6, 'add_user'),
(17, 'Can change user', 6, 'change_user'),
(18, 'Can delete user', 6, 'delete_user'),
(19, 'Can add departement', 7, 'add_departement'),
(20, 'Can change departement', 7, 'change_departement'),
(21, 'Can delete departement', 7, 'delete_departement'),
(22, 'Can add materiel', 8, 'add_materiel'),
(23, 'Can change materiel', 8, 'change_materiel'),
(24, 'Can delete materiel', 8, 'delete_materiel'),
(25, 'Can add ticket', 9, 'add_ticket'),
(26, 'Can change ticket', 9, 'change_ticket'),
(27, 'Can delete ticket', 9, 'delete_ticket');

-- --------------------------------------------------------

--
-- Structure de la table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'contenttypes', 'contenttype'),
(7, 'mysite', 'departement'),
(8, 'mysite', 'materiel'),
(9, 'mysite', 'ticket'),
(6, 'mysite', 'user'),
(5, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Structure de la table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2019-03-27 10:11:01.797362'),
(2, 'contenttypes', '0002_remove_content_type_name', '2019-03-27 10:11:02.268154'),
(3, 'auth', '0001_initial', '2019-03-27 10:11:04.150608'),
(4, 'auth', '0002_alter_permission_name_max_length', '2019-03-27 10:11:04.466681'),
(5, 'auth', '0003_alter_user_email_max_length', '2019-03-27 10:11:04.502594'),
(6, 'auth', '0004_alter_user_username_opts', '2019-03-27 10:11:04.552791'),
(7, 'auth', '0005_alter_user_last_login_null', '2019-03-27 10:11:04.601564'),
(8, 'auth', '0006_require_contenttypes_0002', '2019-03-27 10:11:04.622494'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2019-03-27 10:11:04.642259'),
(10, 'auth', '0008_alter_user_username_max_length', '2019-03-27 10:11:04.661269'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2019-03-27 10:11:04.686842'),
(12, 'mysite', '0001_initial', '2019-03-27 10:11:10.259797'),
(13, 'admin', '0001_initial', '2019-03-27 10:11:11.657999'),
(14, 'admin', '0002_logentry_remove_auto_add', '2019-03-27 10:11:11.700001'),
(15, 'sessions', '0001_initial', '2019-03-27 10:11:11.985492'),
(16, 'mysite', '0002_auto_20190327_1139', '2019-03-27 10:39:18.469203'),
(17, 'mysite', '0003_auto_20190401_2150', '2019-04-01 20:50:54.029479'),
(18, 'mysite', '0004_auto_20190401_2152', '2019-04-01 20:52:05.456967');

-- --------------------------------------------------------

--
-- Structure de la table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('e47rllz82z1f6rcg59mp3z31588e1shh', 'NjNhOWZkYzNkN2I4YjI5MTU3ZTU0NTE3MmMxMDgxZGYwYTNiMjFlYjp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0Mzg4ZDg1NDZjMTVkYTM2NGFhMGQ4YmNhYjFhYjkwMDY1YTBmMTdlIn0=', '2019-04-15 21:05:58.309551'),
('ek7cyh3nfhz2hf4slhy0wfhzh0cei436', 'NjNhOWZkYzNkN2I4YjI5MTU3ZTU0NTE3MmMxMDgxZGYwYTNiMjFlYjp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0Mzg4ZDg1NDZjMTVkYTM2NGFhMGQ4YmNhYjFhYjkwMDY1YTBmMTdlIn0=', '2019-04-23 21:30:18.801699'),
('mk1y81xz4lis5mg9afte4xon348ddthz', 'OWU5MGU1ODA1ODI2NTg1Yzc1YWRlZTM3NTM2ZmUxMTk4NDAyZWQxMTp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiMTM0MWJlYjIxZjhiMmUxZDljNGU5ZWYzMmJkOTMwMDljMTYyNDU3In0=', '2019-04-11 20:46:19.716123'),
('qye2f565s9bc50rqscvh1z4jk6ocwr6e', 'OWU5MGU1ODA1ODI2NTg1Yzc1YWRlZTM3NTM2ZmUxMTk4NDAyZWQxMTp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiMTM0MWJlYjIxZjhiMmUxZDljNGU5ZWYzMmJkOTMwMDljMTYyNDU3In0=', '2019-05-14 22:37:53.402264'),
('t8mxunweoqv27t0l48jkuo368aois8xv', 'YjJkZTQxMzI0MGRjOTZiMjhiMTlkYzU4MTM5MzFiYTE3MTQ5NTg5YTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYWYzZTZlYjM4YmE1MzZiZjg3Yjg3NDdmMDNkYWQ4OTIzMjVkMjNhMCJ9', '2019-09-21 09:49:20.670447'),
('ttrumvkj6xckkkfuhqjcjhxlzb8xhmqh', 'OWU5MGU1ODA1ODI2NTg1Yzc1YWRlZTM3NTM2ZmUxMTk4NDAyZWQxMTp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiMTM0MWJlYjIxZjhiMmUxZDljNGU5ZWYzMmJkOTMwMDljMTYyNDU3In0=', '2019-04-12 23:31:51.938624'),
('x4kqik18w52iq55d1xxll5bei2gygwou', 'OWU5MGU1ODA1ODI2NTg1Yzc1YWRlZTM3NTM2ZmUxMTk4NDAyZWQxMTp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiMTM0MWJlYjIxZjhiMmUxZDljNGU5ZWYzMmJkOTMwMDljMTYyNDU3In0=', '2019-04-19 21:18:54.665508'),
('xakjruutmh1b95hsslko8we1ig6lc7ji', 'OWU5MGU1ODA1ODI2NTg1Yzc1YWRlZTM3NTM2ZmUxMTk4NDAyZWQxMTp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiMTM0MWJlYjIxZjhiMmUxZDljNGU5ZWYzMmJkOTMwMDljMTYyNDU3In0=', '2019-03-17 18:51:18.530941');

-- --------------------------------------------------------

--
-- Structure de la table `mysite_departement`
--

CREATE TABLE `mysite_departement` (
  `name` varchar(64) NOT NULL,
  `nbemp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `mysite_departement`
--

INSERT INTO `mysite_departement` (`name`, `nbemp`) VALUES
('Finance', 4),
('HR', 2),
('IT', 3);

-- --------------------------------------------------------

--
-- Structure de la table `mysite_materiel`
--

CREATE TABLE `mysite_materiel` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `type` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `mysite_materiel`
--

INSERT INTO `mysite_materiel` (`id`, `name`, `type`) VALUES
(1, 'Cisco Switch', 'Switch'),
(2, 'Keyboards TF52NX', 'None');

-- --------------------------------------------------------

--
-- Structure de la table `mysite_ticket`
--

CREATE TABLE `mysite_ticket` (
  `id` int(11) NOT NULL,
  `type` varchar(30) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `date_limit` int(11) NOT NULL,
  `title` varchar(128) NOT NULL,
  `content` longtext NOT NULL,
  `assigned_id` int(11) DEFAULT NULL,
  `creator_id` int(11) NOT NULL,
  `departement_id` varchar(64) NOT NULL,
  `materiel_id` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `mysite_ticket`
--

INSERT INTO `mysite_ticket` (`id`, `type`, `date_created`, `date_limit`, `title`, `content`, `assigned_id`, `creator_id`, `departement_id`, `materiel_id`, `status`) VALUES
(45, 'type', '2019-09-07 09:53:12.362016', 720, 'title', 'contents', NULL, 11, 'IT', NULL, 0);

-- --------------------------------------------------------

--
-- Structure de la table `mysite_user`
--

CREATE TABLE `mysite_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `departement_id` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `mysite_user`
--

INSERT INTO `mysite_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `departement_id`) VALUES
(11, 'pbkdf2_sha256$100000$7BlkJi9jIvWV$gfs/QElR40ZKa+iCuLr1tyN8ShhEbEzQVG7kSG3gBtA=', '2019-09-07 09:49:20.532439', 1, 'admin', 'admin', 'admin', 'admin@admin.admin', 0, 1, '2019-09-07 09:44:19.782405', 'IT');

-- --------------------------------------------------------

--
-- Structure de la table `mysite_user_groups`
--

CREATE TABLE `mysite_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `mysite_user_user_permissions`
--

CREATE TABLE `mysite_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Index pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Index pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Index pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_mysite_user_id` (`user_id`);

--
-- Index pour la table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Index pour la table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Index pour la table `mysite_departement`
--
ALTER TABLE `mysite_departement`
  ADD PRIMARY KEY (`name`);

--
-- Index pour la table `mysite_materiel`
--
ALTER TABLE `mysite_materiel`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `mysite_ticket`
--
ALTER TABLE `mysite_ticket`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mysite_ticket_assigned_id_ef766730_fk_mysite_user_id` (`assigned_id`),
  ADD KEY `mysite_ticket_creator_id_2e845456_fk_mysite_user_id` (`creator_id`),
  ADD KEY `mysite_ticket_departement_id_0a6e8523_fk_mysite_departement_name` (`departement_id`),
  ADD KEY `mysite_ticket_materiel_id_0aba948c_fk_mysite_materiel_id` (`materiel_id`);

--
-- Index pour la table `mysite_user`
--
ALTER TABLE `mysite_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `mysite_user_departement_id_2e52e5c2_fk_mysite_departement_name` (`departement_id`);

--
-- Index pour la table `mysite_user_groups`
--
ALTER TABLE `mysite_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mysite_user_groups_user_id_group_id_2a49184a_uniq` (`user_id`,`group_id`),
  ADD KEY `mysite_user_groups_group_id_c5f3fe1b_fk_auth_group_id` (`group_id`);

--
-- Index pour la table `mysite_user_user_permissions`
--
ALTER TABLE `mysite_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mysite_user_user_permissions_user_id_permission_id_435fa8b3_uniq` (`user_id`,`permission_id`),
  ADD KEY `mysite_user_user_per_permission_id_01361ee1_fk_auth_perm` (`permission_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT pour la table `mysite_materiel`
--
ALTER TABLE `mysite_materiel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `mysite_ticket`
--
ALTER TABLE `mysite_ticket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT pour la table `mysite_user`
--
ALTER TABLE `mysite_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `mysite_user_groups`
--
ALTER TABLE `mysite_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `mysite_user_user_permissions`
--
ALTER TABLE `mysite_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Contraintes pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Contraintes pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_mysite_user_id` FOREIGN KEY (`user_id`) REFERENCES `mysite_user` (`id`);

--
-- Contraintes pour la table `mysite_ticket`
--
ALTER TABLE `mysite_ticket`
  ADD CONSTRAINT `mysite_ticket_assigned_id_ef766730_fk_mysite_user_id` FOREIGN KEY (`assigned_id`) REFERENCES `mysite_user` (`id`),
  ADD CONSTRAINT `mysite_ticket_creator_id_2e845456_fk_mysite_user_id` FOREIGN KEY (`creator_id`) REFERENCES `mysite_user` (`id`),
  ADD CONSTRAINT `mysite_ticket_departement_id_0a6e8523_fk_mysite_departement_name` FOREIGN KEY (`departement_id`) REFERENCES `mysite_departement` (`name`),
  ADD CONSTRAINT `mysite_ticket_materiel_id_0aba948c_fk_mysite_materiel_id` FOREIGN KEY (`materiel_id`) REFERENCES `mysite_materiel` (`id`);

--
-- Contraintes pour la table `mysite_user`
--
ALTER TABLE `mysite_user`
  ADD CONSTRAINT `mysite_user_departement_id_2e52e5c2_fk_mysite_departement_name` FOREIGN KEY (`departement_id`) REFERENCES `mysite_departement` (`name`);

--
-- Contraintes pour la table `mysite_user_groups`
--
ALTER TABLE `mysite_user_groups`
  ADD CONSTRAINT `mysite_user_groups_group_id_c5f3fe1b_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `mysite_user_groups_user_id_284ec7f7_fk_mysite_user_id` FOREIGN KEY (`user_id`) REFERENCES `mysite_user` (`id`);

--
-- Contraintes pour la table `mysite_user_user_permissions`
--
ALTER TABLE `mysite_user_user_permissions`
  ADD CONSTRAINT `mysite_user_user_per_permission_id_01361ee1_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `mysite_user_user_permissions_user_id_6bc34d28_fk_mysite_user_id` FOREIGN KEY (`user_id`) REFERENCES `mysite_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

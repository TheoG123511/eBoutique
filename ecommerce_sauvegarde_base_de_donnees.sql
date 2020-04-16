-- phpMyAdmin SQL Dump
-- version 4.6.6deb4
-- https://www.phpmyadmin.net/
--
-- Client :  localhost:3306
-- Généré le :  Mer 25 Mars 2020 à 07:42
-- Version du serveur :  10.1.44-MariaDB-0+deb9u1
-- Version de PHP :  7.0.33-0+deb9u7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `ecommerce`
--

-- --------------------------------------------------------

--
-- Structure de la table `authtoken_token`
--

CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add contact', 7, 'add_contact'),
(26, 'Can change contact', 7, 'change_contact'),
(27, 'Can delete contact', 7, 'delete_contact'),
(28, 'Can view contact', 7, 'view_contact'),
(29, 'Can add Category', 8, 'add_category'),
(30, 'Can change Category', 8, 'change_category'),
(31, 'Can delete Category', 8, 'delete_category'),
(32, 'Can view Category', 8, 'view_category'),
(33, 'Can add Product', 9, 'add_product'),
(34, 'Can change Product', 9, 'change_product'),
(35, 'Can delete Product', 9, 'delete_product'),
(36, 'Can view Product', 9, 'view_product'),
(37, 'Can add SubCategory', 10, 'add_subcategory'),
(38, 'Can change SubCategory', 10, 'change_subcategory'),
(39, 'Can delete SubCategory', 10, 'delete_subcategory'),
(40, 'Can view SubCategory', 10, 'view_subcategory'),
(41, 'Can add ProductComment', 11, 'add_productcomment'),
(42, 'Can change ProductComment', 11, 'change_productcomment'),
(43, 'Can delete ProductComment', 11, 'delete_productcomment'),
(44, 'Can view ProductComment', 11, 'view_productcomment'),
(45, 'Can add Images', 12, 'add_images'),
(46, 'Can change Images', 12, 'change_images'),
(47, 'Can delete Images', 12, 'delete_images'),
(48, 'Can view Images', 12, 'view_images'),
(49, 'Can add NewsLetter', 13, 'add_newsletter'),
(50, 'Can change NewsLetter', 13, 'change_newsletter'),
(51, 'Can delete NewsLetter', 13, 'delete_newsletter'),
(52, 'Can view NewsLetter', 13, 'view_newsletter'),
(53, 'Can add customer', 14, 'add_customer'),
(54, 'Can change customer', 14, 'change_customer'),
(55, 'Can delete customer', 14, 'delete_customer'),
(56, 'Can view customer', 14, 'view_customer'),
(57, 'Can add Basket', 15, 'add_basket'),
(58, 'Can change Basket', 15, 'change_basket'),
(59, 'Can delete Basket', 15, 'delete_basket'),
(60, 'Can view Basket', 15, 'view_basket'),
(61, 'Can add Address Customer', 16, 'add_address'),
(62, 'Can change Address Customer', 16, 'change_address'),
(63, 'Can delete Address Customer', 16, 'delete_address'),
(64, 'Can view Address Customer', 16, 'view_address'),
(65, 'Can add Order Customer', 17, 'add_order'),
(66, 'Can change Order Customer', 17, 'change_order'),
(67, 'Can delete Order Customer', 17, 'delete_order'),
(68, 'Can view Order Customer', 17, 'view_order'),
(69, 'Can add Order Customer Product', 18, 'add_orderproduct'),
(70, 'Can change Order Customer Product', 18, 'change_orderproduct'),
(71, 'Can delete Order Customer Product', 18, 'delete_orderproduct'),
(72, 'Can view Order Customer Product', 18, 'view_orderproduct'),
(73, 'Can add shop images', 35, 'add_shopimages'),
(74, 'Can change shop images', 35, 'change_shopimages'),
(75, 'Can delete shop images', 35, 'delete_shopimages'),
(76, 'Can view shop images', 35, 'view_shopimages'),
(77, 'Can add profile customer', 30, 'add_profilecustomer'),
(78, 'Can change profile customer', 30, 'change_profilecustomer'),
(79, 'Can delete profile customer', 30, 'delete_profilecustomer'),
(80, 'Can view profile customer', 30, 'view_profilecustomer'),
(81, 'Can add contact contact', 26, 'add_contactcontact'),
(82, 'Can change contact contact', 26, 'change_contactcontact'),
(83, 'Can delete contact contact', 26, 'delete_contactcontact'),
(84, 'Can view contact contact', 26, 'view_contactcontact'),
(85, 'Can add profile order', 24, 'add_profileorder'),
(86, 'Can change profile order', 24, 'change_profileorder'),
(87, 'Can delete profile order', 24, 'delete_profileorder'),
(88, 'Can view profile order', 24, 'view_profileorder'),
(89, 'Can add shop category', 37, 'add_shopcategory'),
(90, 'Can change shop category', 37, 'change_shopcategory'),
(91, 'Can delete shop category', 37, 'delete_shopcategory'),
(92, 'Can view shop category', 37, 'view_shopcategory'),
(93, 'Can add django session', 21, 'add_djangosession'),
(94, 'Can change django session', 21, 'change_djangosession'),
(95, 'Can delete django session', 21, 'delete_djangosession'),
(96, 'Can view django session', 21, 'view_djangosession'),
(97, 'Can add auth group permissions', 36, 'add_authgrouppermissions'),
(98, 'Can change auth group permissions', 36, 'change_authgrouppermissions'),
(99, 'Can delete auth group permissions', 36, 'delete_authgrouppermissions'),
(100, 'Can view auth group permissions', 36, 'view_authgrouppermissions'),
(101, 'Can add shop newsletter', 31, 'add_shopnewsletter'),
(102, 'Can change shop newsletter', 31, 'change_shopnewsletter'),
(103, 'Can delete shop newsletter', 31, 'delete_shopnewsletter'),
(104, 'Can view shop newsletter', 31, 'view_shopnewsletter'),
(105, 'Can add django migrations', 22, 'add_djangomigrations'),
(106, 'Can change django migrations', 22, 'change_djangomigrations'),
(107, 'Can delete django migrations', 22, 'delete_djangomigrations'),
(108, 'Can view django migrations', 22, 'view_djangomigrations'),
(109, 'Can add django content type', 39, 'add_djangocontenttype'),
(110, 'Can change django content type', 39, 'change_djangocontenttype'),
(111, 'Can delete django content type', 39, 'delete_djangocontenttype'),
(112, 'Can view django content type', 39, 'view_djangocontenttype'),
(113, 'Can add profile orderproduct', 29, 'add_profileorderproduct'),
(114, 'Can change profile orderproduct', 29, 'change_profileorderproduct'),
(115, 'Can delete profile orderproduct', 29, 'delete_profileorderproduct'),
(116, 'Can view profile orderproduct', 29, 'view_profileorderproduct'),
(117, 'Can add auth group', 34, 'add_authgroup'),
(118, 'Can change auth group', 34, 'change_authgroup'),
(119, 'Can delete auth group', 34, 'delete_authgroup'),
(120, 'Can view auth group', 34, 'view_authgroup'),
(121, 'Can add auth permission', 40, 'add_authpermission'),
(122, 'Can change auth permission', 40, 'change_authpermission'),
(123, 'Can delete auth permission', 40, 'delete_authpermission'),
(124, 'Can view auth permission', 40, 'view_authpermission'),
(125, 'Can add auth user user permissions', 27, 'add_authuseruserpermissions'),
(126, 'Can change auth user user permissions', 27, 'change_authuseruserpermissions'),
(127, 'Can delete auth user user permissions', 27, 'delete_authuseruserpermissions'),
(128, 'Can view auth user user permissions', 27, 'view_authuseruserpermissions'),
(129, 'Can add auth user', 20, 'add_authuser'),
(130, 'Can change auth user', 20, 'change_authuser'),
(131, 'Can delete auth user', 20, 'delete_authuser'),
(132, 'Can view auth user', 20, 'view_authuser'),
(133, 'Can add django admin log', 33, 'add_djangoadminlog'),
(134, 'Can change django admin log', 33, 'change_djangoadminlog'),
(135, 'Can delete django admin log', 33, 'delete_djangoadminlog'),
(136, 'Can view django admin log', 33, 'view_djangoadminlog'),
(137, 'Can add profile address', 38, 'add_profileaddress'),
(138, 'Can change profile address', 38, 'change_profileaddress'),
(139, 'Can delete profile address', 38, 'delete_profileaddress'),
(140, 'Can view profile address', 38, 'view_profileaddress'),
(141, 'Can add profile basket', 25, 'add_profilebasket'),
(142, 'Can change profile basket', 25, 'change_profilebasket'),
(143, 'Can delete profile basket', 25, 'delete_profilebasket'),
(144, 'Can view profile basket', 25, 'view_profilebasket'),
(145, 'Can add shop product', 28, 'add_shopproduct'),
(146, 'Can change shop product', 28, 'change_shopproduct'),
(147, 'Can delete shop product', 28, 'delete_shopproduct'),
(148, 'Can view shop product', 28, 'view_shopproduct'),
(149, 'Can add auth user groups', 19, 'add_authusergroups'),
(150, 'Can change auth user groups', 19, 'change_authusergroups'),
(151, 'Can delete auth user groups', 19, 'delete_authusergroups'),
(152, 'Can view auth user groups', 19, 'view_authusergroups'),
(153, 'Can add shop subcategory', 23, 'add_shopsubcategory'),
(154, 'Can change shop subcategory', 23, 'change_shopsubcategory'),
(155, 'Can delete shop subcategory', 23, 'delete_shopsubcategory'),
(156, 'Can view shop subcategory', 23, 'view_shopsubcategory'),
(157, 'Can add shop productcomment', 32, 'add_shopproductcomment'),
(158, 'Can change shop productcomment', 32, 'change_shopproductcomment'),
(159, 'Can delete shop productcomment', 32, 'delete_shopproductcomment'),
(160, 'Can view shop productcomment', 32, 'view_shopproductcomment'),
(161, 'Can add Token', 41, 'add_token'),
(162, 'Can change Token', 41, 'change_token'),
(163, 'Can delete Token', 41, 'delete_token'),
(164, 'Can view Token', 41, 'view_token'),
(165, 'Can add IndexPub', 42, 'add_indexpub'),
(166, 'Can change IndexPub', 42, 'change_indexpub'),
(167, 'Can delete IndexPub', 42, 'delete_indexpub'),
(168, 'Can view IndexPub', 42, 'view_indexpub');

-- --------------------------------------------------------

--
-- Structure de la table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) COLLATE utf8_bin NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8_bin NOT NULL,
  `first_name` varchar(30) COLLATE utf8_bin NOT NULL,
  `last_name` varchar(150) COLLATE utf8_bin NOT NULL,
  `email` varchar(254) COLLATE utf8_bin NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$150000$akLsaat8TaPu$58Qj0TmK199FlV5RCsHCQFGyvmIDoaZ6vrHFI+sNq4o=', '2020-03-23 17:53:19.385259', 1, 'theo', '', '', 'theo.g.31@free.fr', 1, 1, '2020-03-10 16:17:18.508021'),
(2, 'pbkdf2_sha256$150000$dCYlmSuL97AN$ziY+lxJCgY7DIcSXwZxn2fDiR2QL+p75lhWxSW+ZdYc=', '2020-03-24 10:19:41.607678', 0, 'Jm31', 'Jean Marc', 'Dhraim', 'Jm.D.31@free.fr', 0, 1, '2020-03-24 10:19:41.201832');

-- --------------------------------------------------------

--
-- Structure de la table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `contact_contact`
--

CREATE TABLE `contact_contact` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) COLLATE utf8_bin NOT NULL,
  `email` varchar(254) COLLATE utf8_bin NOT NULL,
  `subject` varchar(200) COLLATE utf8_bin NOT NULL,
  `message` longtext COLLATE utf8_bin NOT NULL,
  `date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `contact_contact`
--

INSERT INTO `contact_contact` (`id`, `nom`, `email`, `subject`, `message`, `date`) VALUES
(1, 'Gaillard', 'Theo.g.31@free.fr', 'Super Site', 'Premier teste de contact a partir du serveur', '2020-03-19 13:14:39.777044');

-- --------------------------------------------------------

--
-- Structure de la table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8_bin,
  `object_repr` varchar(200) COLLATE utf8_bin NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext COLLATE utf8_bin NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2020-03-10 16:21:38.919444', '1', 'Militaire', 1, '[{\"added\": {}}]', 8, 1),
(2, '2020-03-10 16:22:26.674923', '1', 'Materiel', 1, '[{\"added\": {}}]', 10, 1),
(3, '2020-03-10 16:22:54.595920', '1', 'Masque a Gaz', 1, '[{\"added\": {}}]', 9, 1),
(4, '2020-03-10 16:23:07.639046', '1', 'Masque a Gaz', 2, '[]', 9, 1),
(5, '2020-03-10 16:24:08.311423', '2', 'Rapière d\'entrainement', 1, '[{\"added\": {}}]', 9, 1),
(6, '2020-03-10 16:24:34.581042', '1', 'Masque a Gaz', 1, '[{\"added\": {}}]', 12, 1),
(7, '2020-03-10 16:24:48.807524', '2', 'Masque a Gaz', 1, '[{\"added\": {}}]', 12, 1),
(8, '2020-03-10 16:25:18.147983', '3', 'Rapière d\'entrainement', 1, '[{\"added\": {}}]', 12, 1),
(9, '2020-03-10 16:25:51.605484', '1', 'Theo', 1, '[{\"added\": {}}]', 11, 1),
(10, '2020-03-19 11:35:41.203230', '3', 'Animal', 1, '[{\"added\": {}}]', 9, 1),
(11, '2020-03-19 13:16:47.437138', '4', 'Chat a vendre', 1, '[{\"added\": {}}]', 9, 1),
(12, '2020-03-19 15:14:18.756095', '1', 'Masque a Gaz', 2, '[{\"changed\": {\"fields\": [\"image\"]}}]', 9, 1),
(13, '2020-03-19 19:01:54.043398', '5', 'Chat a vendre', 2, '[{\"changed\": {\"fields\": [\"product\"]}}]', 12, 1),
(14, '2020-03-25 10:51:24.605659', '1', 'Animal', 1, '[{\"added\": {}}]', 42, 1),
(15, '2020-03-25 10:51:31.010112', '2', 'Masque a Gaz', 1, '[{\"added\": {}}]', 42, 1),
(16, '2020-03-25 10:51:38.139084', '3', 'Rapière d\'entrainement', 1, '[{\"added\": {}}]', 42, 1);

-- --------------------------------------------------------

--
-- Structure de la table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) COLLATE utf8_bin NOT NULL,
  `model` varchar(100) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(41, 'authtoken', 'token'),
(7, 'contact', 'contact'),
(5, 'contenttypes', 'contenttype'),
(34, 'gestion', 'authgroup'),
(36, 'gestion', 'authgrouppermissions'),
(40, 'gestion', 'authpermission'),
(20, 'gestion', 'authuser'),
(19, 'gestion', 'authusergroups'),
(27, 'gestion', 'authuseruserpermissions'),
(26, 'gestion', 'contactcontact'),
(33, 'gestion', 'djangoadminlog'),
(39, 'gestion', 'djangocontenttype'),
(22, 'gestion', 'djangomigrations'),
(21, 'gestion', 'djangosession'),
(38, 'gestion', 'profileaddress'),
(25, 'gestion', 'profilebasket'),
(30, 'gestion', 'profilecustomer'),
(24, 'gestion', 'profileorder'),
(29, 'gestion', 'profileorderproduct'),
(37, 'gestion', 'shopcategory'),
(35, 'gestion', 'shopimages'),
(31, 'gestion', 'shopnewsletter'),
(28, 'gestion', 'shopproduct'),
(32, 'gestion', 'shopproductcomment'),
(23, 'gestion', 'shopsubcategory'),
(16, 'profile', 'address'),
(15, 'profile', 'basket'),
(14, 'profile', 'customer'),
(17, 'profile', 'order'),
(18, 'profile', 'orderproduct'),
(6, 'sessions', 'session'),
(8, 'shop', 'category'),
(12, 'shop', 'images'),
(42, 'shop', 'indexpub'),
(13, 'shop', 'newsletter'),
(9, 'shop', 'product'),
(11, 'shop', 'productcomment'),
(10, 'shop', 'subcategory');

-- --------------------------------------------------------

--
-- Structure de la table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) COLLATE utf8_bin NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2020-03-10 16:15:34.249356'),
(2, 'auth', '0001_initial', '2020-03-10 16:15:34.409344'),
(3, 'admin', '0001_initial', '2020-03-10 16:15:35.008895'),
(4, 'admin', '0002_logentry_remove_auto_add', '2020-03-10 16:15:35.137470'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2020-03-10 16:15:35.161731'),
(6, 'contenttypes', '0002_remove_content_type_name', '2020-03-10 16:15:35.289134'),
(7, 'auth', '0002_alter_permission_name_max_length', '2020-03-10 16:15:35.430695'),
(8, 'auth', '0003_alter_user_email_max_length', '2020-03-10 16:15:35.535262'),
(9, 'auth', '0004_alter_user_username_opts', '2020-03-10 16:15:35.566475'),
(10, 'auth', '0005_alter_user_last_login_null', '2020-03-10 16:15:35.595735'),
(11, 'auth', '0006_require_contenttypes_0002', '2020-03-10 16:15:35.608415'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2020-03-10 16:15:35.619144'),
(13, 'auth', '0008_alter_user_username_max_length', '2020-03-10 16:15:35.662516'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2020-03-10 16:15:35.695132'),
(15, 'auth', '0010_alter_group_name_max_length', '2020-03-10 16:15:35.748414'),
(16, 'auth', '0011_update_proxy_permissions', '2020-03-10 16:15:35.760100'),
(17, 'contact', '0001_initial', '2020-03-10 16:15:35.831079'),
(18, 'contact', '0002_auto_20200229_1718', '2020-03-10 16:15:35.863463'),
(19, 'shop', '0001_initial', '2020-03-10 16:15:36.026585'),
(20, 'shop', '0002_auto_20200229_2044', '2020-03-10 16:15:36.155757'),
(21, 'shop', '0003_delete_imgproduct', '2020-03-10 16:15:36.176061'),
(22, 'shop', '0004_images', '2020-03-10 16:15:36.196543'),
(23, 'shop', '0005_auto_20200229_2128', '2020-03-10 16:15:36.237820'),
(24, 'shop', '0006_auto_20200229_2129', '2020-03-10 16:15:36.268306'),
(25, 'shop', '0007_auto_20200229_2135', '2020-03-10 16:15:36.277109'),
(26, 'shop', '0008_auto_20200229_2136', '2020-03-10 16:15:36.283929'),
(27, 'shop', '0009_auto_20200301_1658', '2020-03-10 16:15:36.361968'),
(28, 'shop', '0010_auto_20200301_1919', '2020-03-10 16:15:36.429183'),
(29, 'shop', '0011_auto_20200301_1929', '2020-03-10 16:15:36.458184'),
(30, 'shop', '0012_auto_20200301_1933', '2020-03-10 16:15:36.506327'),
(31, 'shop', '0013_auto_20200301_2303', '2020-03-10 16:15:36.547841'),
(32, 'profile', '0001_initial', '2020-03-10 16:15:36.612539'),
(33, 'profile', '0002_auto_20200303_1742', '2020-03-10 16:15:36.710090'),
(34, 'profile', '0003_basket', '2020-03-10 16:15:36.775423'),
(35, 'profile', '0004_auto_20200306_1756', '2020-03-10 16:15:37.295404'),
(36, 'profile', '0005_auto_20200306_1920', '2020-03-10 16:15:37.607721'),
(37, 'profile', '0006_auto_20200306_1923', '2020-03-10 16:15:37.660140'),
(38, 'profile', '0007_auto_20200306_1927', '2020-03-10 16:15:37.690976'),
(39, 'profile', '0008_auto_20200306_1930', '2020-03-10 16:15:37.772827'),
(40, 'profile', '0009_auto_20200306_1935', '2020-03-10 16:15:38.013224'),
(41, 'profile', '0010_auto_20200309_1428', '2020-03-10 16:15:38.506202'),
(42, 'profile', '0011_auto_20200309_1449', '2020-03-10 16:15:38.766846'),
(43, 'sessions', '0001_initial', '2020-03-10 16:15:38.818419'),
(44, 'shop', '0014_images_alt', '2020-03-10 16:15:38.877113'),
(45, 'shop', '0015_auto_20200306_1944', '2020-03-10 16:15:38.914191'),
(46, 'shop', '0016_newsletter', '2020-03-10 16:15:38.942733'),
(47, 'authtoken', '0001_initial', '2020-03-19 18:33:25.439772'),
(48, 'authtoken', '0002_auto_20160226_1747', '2020-03-19 18:33:25.507376'),
(49, 'gestion', '0001_initial', '2020-03-19 18:33:25.553329'),
(50, 'shop', '0017_indexpub', '2020-03-25 10:46:20.445206');

-- --------------------------------------------------------

--
-- Structure de la table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8_bin NOT NULL,
  `session_data` longtext COLLATE utf8_bin NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('020oudhf1kqwjwbak52pa3w6a5bvp8kw', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-03 19:43:43.790734'),
('02jh1nq9ggkpcltuse6kqbhescfudj3l', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-02 23:46:24.705626'),
('03o0klhvb3xth7f0sx0mijos5bg8wa0r', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-07 01:00:52.621276'),
('0697pgzqc3jt9fi5mq63fmcojsebq398', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-03 13:44:21.398976'),
('0husjzjfgtehgkv5we2ukrugnrjb7mix', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-07 02:55:03.323882'),
('0r0zd9jhs6fzxnq1bnzpouy9wpsf7gwn', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-07 10:39:58.547279'),
('0swzlb4xten4k6l7peyzq83sddmaqmy9', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-04 19:44:28.573482'),
('10v6keo11k716c61c72jyld780fo2erg', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-06 11:46:44.466585'),
('14ybijnjpxzfqfq0d5rw3g9pf9lsd8oj', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-02 20:41:32.619603'),
('1esq7gvr6ejkwt7xesy9d6bn1mkagbg9', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-03 06:23:50.376243'),
('1wt7gz7rqtrrcmvaqxj6tf35i42t4jaw', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-02 23:04:46.028951'),
('24q7wslkiox22q1qoljl899pjf1gfdz4', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-07 13:14:18.880507'),
('31xp3icaqa6nmclyhdb6beb2t4nvtw9u', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-06 15:36:24.569241'),
('33larbqg5hampq8t1zu4tg840f30fiuk', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-07 16:32:33.177068'),
('3qv7t8ben9r0ge5wc3v9mqinj9q13zkx', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-05 07:27:01.418434'),
('3yc8mand3slan13n92rp9nb8p5tpjra2', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-07 13:25:04.027754'),
('40liutm7u3u7ycullq6y5iqqizblfbqg', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-05 22:32:53.179605'),
('46b6h4qebtuwk2hxmx1xewki64ztyy3c', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-04 01:24:51.898738'),
('4mg3l0u8hhfag4pxn644bi4gcjbv0vuy', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-05 19:24:22.611191'),
('4mqr38lcwcduzojwy9bebd95hcb4htsr', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-02 18:11:50.367409'),
('4pgytv1z1ntyt7cfjbho9rzgb4xatr68', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-06 09:12:10.071792'),
('4rkejf11zecwo3hnljupx26jwwtr667s', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-08 02:31:22.672212'),
('4z7bjf779dqkye4y30gud3xh9cv4c4l6', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-07 20:24:03.256032'),
('646buacifytx6ndeukigc19pv4qrv7tc', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-06 00:43:47.196361'),
('6659zgkhmckli6gfdva6a6xzctqawirp', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-04 21:20:49.105511'),
('6yik3o0am3zb2guhzybfyt21vrup44ax', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-04 21:56:12.450285'),
('79yaummnl2yu29ktud8fafjuttda82vl', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-04 23:04:29.629046'),
('7dxjaecpcjdc0l9tpevakxmjpnhu29op', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-04 19:22:14.805329'),
('7fxc5w3huuve271nykobxmwlmy01wx3c', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-06 00:45:38.585121'),
('7mpkuqn7otah5h0cjkiiy3qdpxmn73d2', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-07 04:09:51.270905'),
('7oq4zrmhjlxv9vy9uco5f2ptzudswyp8', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-03 08:39:29.916718'),
('87vu0yvwf53e1okudxv2rk3unjrrec3c', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-07 20:24:03.313702'),
('8e3agf3gw203mqb4pey1wz47u6ok3pk8', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-05 14:33:38.651828'),
('8ehdi6kgc2pk1jztaootl2s2xmc5i8if', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-05 13:24:23.119116'),
('8gep9tiascury5vkczfoce6hg9b7aax9', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-05 20:10:02.992836'),
('8gwqhehqq3mfgnyc60cfa62tjcmdlc1d', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-04 23:04:30.514722'),
('8gxty2s9zuxdo4elcyab6w5cnhu2xjhk', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-07 03:06:21.616892'),
('8l85qfyy4p3ta7xz9dbewupqcf7vu6rd', 'OTAxYjU2MzY1ZTA5YjM0ZjdhZTEwNzU3NzhlNTkxYTUyYjM0ZGYyMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiZjliYTk4ZWJkMzNhMGViMDliODVjYWM0ZTc3ZDg5ODRmM2Q0ZGJjMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiZW1haWxOZXdzTGV0dGVyIjoiIn0=', '2020-04-08 11:40:01.860039'),
('8lc1i4ldriuiphdjk1f5eqh013ak0u3v', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-06 09:12:10.255467'),
('90v8gm4ktx8pvia6zq8e525ooalfxshk', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-04 05:54:47.890550'),
('9gfkpmkdldd4tmlyzs1yq3jobrjxqzvz', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-05 01:25:13.486233'),
('9id5rcjelbr15iaqr3o0zuw7kz6new6a', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-02 20:58:28.620044'),
('9lv20yuzj7a1cj0a09a078kgw1060pd3', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-07 02:28:05.883477'),
('9muumwgvr1ywdzwvwdaw4so4hiyth1dk', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-07 20:19:40.652586'),
('9tr1ea8enrz49i2usy07js2ffgarpk12', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-06 13:26:12.913051'),
('a4u3uqgoa026k34f1tn4hx0c8vt1tezl', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-07 03:40:04.584391'),
('ab8hhsapsxsgr0rseox5ghybtswrd128', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-08 06:02:27.564335'),
('auysdzgpgy480xy27nnoxglyofmg3m1l', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-03 02:51:58.989947'),
('b1tu1kfn5nfl8a9hs74m3w5xeqkxe24i', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-07 18:30:18.208960'),
('b81pe8jh50mwxxuothgu33oqu2akzdks', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-02 16:09:02.917331'),
('bc8spgzlf8ah3fpm3dmlyaq8fcn0de9p', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-03 02:15:17.329214'),
('bn4yroozpwx2om54q6qvhv4qtttj0fnd', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-03 18:18:12.007358'),
('cbm6d4knp7x16jf3bbyj20nx723ho7et', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-03 07:24:17.454980'),
('cocymfqll5xx8jluxpw0kvbdnwus2sca', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-02 16:36:24.468841'),
('cwndeiy2g8z29p57rmkxw959w1p0o5fi', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-07 19:50:59.606296'),
('d0irf2gdof5rdx1sbqgzd36bmkdz3ov5', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-03 00:03:27.863635'),
('d21e9h6rewnr8p8yzasri1fer9mfoni4', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-07 03:31:46.801863'),
('d5ww9o2x9p8mt3f3y7l72ttuoqdgfaa9', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-04 06:24:00.282665'),
('d7enxyp5yeqtqgw51rh710982jn22fc4', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-06 07:24:21.891798'),
('da4kofpuf3oql27hdflapm6x94m3xo0l', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-07 01:00:54.035826'),
('dyo2c8rsorpa97sv0fvox8hi1hdtx1gu', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-03 09:35:45.933517'),
('e1l22dn82uiiour8hnmrc6fyq5t057us', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-07 01:00:56.073577'),
('e8s03trrccczuwedy6np9v2uvdrd2udx', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-07 20:24:03.371388'),
('eeb7vx6rh5h219y6bqlyycqs16rl5jvo', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-08 04:00:59.836092'),
('ejoyqcjnefnaemydmrtixy03v64d5nf7', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-04 19:24:23.253961'),
('eq6n9v25h840i6jekrzdafmrrr5kguu7', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-03 16:05:08.796267'),
('evpnawk7em42yjj0j6cu7x8l7795o7g4', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-04 20:46:20.205053'),
('ezhoapmxuonn2g0ajc0uys294ne1s39n', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-07 04:46:49.987975'),
('f3ap5mo3k08t3bx6hwlt70u9v788z47x', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-02 13:18:12.282102'),
('f5qx5z5oqocyryfdf893i53o2dwqkhle', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-03 07:26:05.064787'),
('f6v5b1d0xw1zlrkwgtxncp3k23hs7ns0', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-06 01:22:00.526555'),
('f7ha1hdv16z476xzpvuww42ltmjtifyr', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-05 00:46:14.006213'),
('f8erx8se0grnupebtabxrosuuvjoqqru', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-05 05:39:56.076731'),
('fe91fr1rjesk7bwsh5gih2pg37u2x427', 'ZTliMzE5YjdhNDA5Y2Y5MTk3ODJkZmRhZGM0OTU1ZjVjZDlhMThiYzp7ImVtYWlsTmV3c0xldHRlciI6IiIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1M2Y1MDdkYjlmODE0ZDQxNjgwYTAwZTFiNGNmMTZmMmIyZDMzOTdmIn0=', '2020-04-02 11:36:11.037153'),
('fx5ro3b4rzdefkkrppc1wuvobl2etnxu', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-05 06:42:48.096602'),
('g3xf4asx8c08y64xwfzzdeya879kka6c', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-07 19:24:36.137362'),
('geg0v383qan7aa5u9uo6iqhnea432bxb', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-07 21:37:06.800017'),
('ghi2ppayo3cgh2t3vpeuyf8qq8xqrsuo', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-03 08:44:29.009399'),
('go94nbchyi191z3v0hg8ffy9qk21j628', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-07 16:49:49.621148'),
('goz26ksdns9d89t7wdykanwuvnk4j0ri', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-03 18:48:08.821590'),
('gqldy045qumxq3qyq88564e7qqksu4pc', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-02 16:05:01.913596'),
('gsgqj6zfvmht0l45e21pxynyd5aeyrgu', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-04 07:05:57.777319'),
('gvh3e5r9i0ib3wdiagvsan5jafv1tvxy', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-04 19:44:52.684914'),
('hdasfs1p2wfjb17t668vsqmt1qgiaigf', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-08 01:25:52.184985'),
('hv9qhj73d71gjwyuylbgzs2wfucftqnn', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-05 03:51:55.878063'),
('hvsboyi5wvzpp1o2u90wwkx68a08s5mv', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-02 16:08:59.633743'),
('hynhay0vvnk6mojzna90f4pnr5pvfamr', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-07 01:35:34.048669'),
('i1tx59y80uikwse4v0hnkwsvygkb31dc', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-07 06:25:40.913341'),
('i9s6qwxycrupcc7qxvt1cj79sq20cfku', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-03 03:19:00.534668'),
('iiqhmvthmhfn6gn8gxnfuhei676smrqg', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-04 04:41:55.633794'),
('iju9rmhx7s65zm00ekxgkp3f02c2rkgo', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-03 01:36:26.006581'),
('iqo9o0b8waqud5eru82koh44i8i1za4r', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-06 09:12:10.146587'),
('ix8hbty0fxi0bvtmknnsq65218m1uouw', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-07 04:20:05.145379'),
('ixzu94qean2styqoldinoyzmbfb07ybp', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-07 07:25:22.079692'),
('j7gyxbfeiqow0y4lg3gh3pqq81h01dql', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-03 23:34:50.781585'),
('j8h3f0n9ytbzdnp7n3rdmurbi0mwfp4y', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-07 00:17:18.526081'),
('jbq5epdjegmvui9ceatskwaavwdpclsr', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-04 07:51:30.523219'),
('jh13fu73o9by8nqreffbgv2i7plcig8x', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-04 19:44:25.856480'),
('jpr3m1nqtutiqb0xueq4bv6yj4pb5hbx', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-03 01:25:20.900310'),
('jrk6yvr6cbh5tuw1xtm0lrmtpsms6z73', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-02 22:32:55.685466'),
('jydjsxhaokvgew6uj5x6nivwcj24v5b6', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-06 00:34:03.474423'),
('jzxv5oc4ufhoy1dyinn7jj44iwe8eneb', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-03 09:19:01.629891'),
('k3mq1b8jkmo2ogj993zoktx8fkzxot7y', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-02 19:25:08.210102'),
('kjqwyoibrfujix8dpvcn7lc2kq1uc788', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-02 15:46:48.413764'),
('kr35wra3w3tbiwhjhpjdaq2o062vsklf', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-03 22:11:29.969714'),
('kya88k6hk60j5vrh69tqgwkm2g3n8x5n', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-06 00:34:03.090572'),
('lk4uxjne8p36vvtq7djj63fqc9wd9gxi', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-03 07:26:09.869049'),
('lq4arf43jff8hitsjjtq0a7ekaif6rw3', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-06 04:43:26.124938'),
('lrwsj8n4ju2268z4eqwv1yydtnb3582j', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-03 12:56:18.792524'),
('m5lhscrwpxglfd785uoq5ix4ckd4xu4z', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-03 01:03:37.616414'),
('mgq1vaqvi0gk9waukor66e7izg89b98c', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-05 05:46:29.795916'),
('mh53pakafubcn5345lgj0m6ik4a4tcm7', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-06 01:26:27.755084'),
('mzzsk7fk68e9h86rjnzjz0lv8dipb43w', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-08 02:48:45.023334'),
('n1yw0kmx5vyx8to4dsmxw5x0aiv61dm6', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-03 13:25:23.558877'),
('n8a0niohgok6nxyrskmie117m66mfupt', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-05 19:47:02.224413'),
('nco02tuulkn1c2csh6jetxcuo6ih6jjx', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-06 05:02:31.653016'),
('nehxf57ozuj6m2woevq98vvijc7yv6c0', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-04 22:20:26.358856'),
('nic2a8jb1gol5vqys8vz44txht5d867t', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-04 15:21:57.417241'),
('nom2mfsqmcpkb9y9p7s28w4qqeliyuxe', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-08 06:16:01.325056'),
('nq8d55noly3r77dkom6pya9r3z5uhmdp', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-07 22:35:40.450626'),
('nq8fouoo44ifxt6d4ip95vckbwx9qvoi', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-03-24 17:59:12.183621'),
('nw6qh3thkarnpx24gyeevxkgl2bsv7gb', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-06 00:51:42.592970'),
('o09a94ixz5bslbhuff2axsaymadzfekq', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-08 04:00:59.856599'),
('o2mill78hs2yq2q45z84rzar9rfzjiz1', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-02 16:36:24.784249'),
('obbn75n2micqhehqjzjx7m9jobjpkej6', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-04 15:13:45.375138'),
('obfnn2jpaotzd9pfuftzqkwwkt2qy87o', 'ZTliMzE5YjdhNDA5Y2Y5MTk3ODJkZmRhZGM0OTU1ZjVjZDlhMThiYzp7ImVtYWlsTmV3c0xldHRlciI6IiIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1M2Y1MDdkYjlmODE0ZDQxNjgwYTAwZTFiNGNmMTZmMmIyZDMzOTdmIn0=', '2020-03-24 16:26:48.180982'),
('odtfkh4iyt0987mk5x5mjs53sy1ec9v2', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-06 00:43:44.583952'),
('oh2im9dpfidjtk98mg6ndksy8leoi3yy', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-02 21:22:24.304700'),
('ohtspqb61z7jtig0lxyfl2t1qphr9drh', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-03 19:25:37.075454'),
('p5k7d0sag2ucno38lxotiihknxmzhjtp', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-04 10:19:46.365065'),
('pnvcdt88jgaj86yg643dt3oeormqd3sj', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-04 00:46:05.523204'),
('pts26q9g1bfk227nuqfgcl7pc06kvuix', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-05 06:42:48.097754'),
('pv096dnssk8c65vujejwciyi3fbp2o3e', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-06 10:44:34.285107'),
('pzz3zgc0u6rm622anpa4urozmwfqo3qk', 'MzcyZTE0MmRmNWY0MDhhYWIzYTMzMGIzMWVhZDZiYzQ2NjY0ZWEzNzp7ImVtYWlsTmV3c0xldHRlciI6IiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMjUwYmQ2MzI3ZTVjMDcyMDgxYmJlMzQzMGE4YTllZTliMDliYWU5MCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=', '2020-04-07 14:59:37.842048'),
('q1ta4hb2allyfij9jh72bdnnltbn262i', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-07 06:11:24.748856'),
('qb2yub8c3ab2brmfmc1lfahuu41iea6q', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-04 17:56:44.228600'),
('qhirlm6xx9v2bvwt62vcbvhd3tncgb47', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-04 07:25:17.812005'),
('qvnbmnjy4w3xx8415xpcopitt3022v2s', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-07 08:02:48.375414'),
('reavc3zt09m3fog8yo9o8kyaofpri2o6', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-05 14:22:21.780318'),
('rezons6ulp5m0ienwvi2bab55bgf9ov9', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-04 10:07:56.600868'),
('rgpai3uwxapgvxsd699ix0z0bsrrazic', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-03 08:32:30.647667'),
('rk9nwzeh40d4rziqrb6paief6jynpc2a', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-02 15:07:48.269589'),
('rpveg640bceqcdu1a2wddvmkg41c04q2', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-08 11:36:27.858121'),
('rz5618vk9rmwg8s46aklvg4o30epgsfa', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-03 13:27:47.423444'),
('s798ktopdovfrisu4prn3oq5fw2e37r6', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-04 14:30:43.045752'),
('s7mi18bd8jw6wbpgryrdxodshstoccbn', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-07 11:12:02.166647'),
('s9t6s62dljr7i2ybwz1zhgb7cuchdtob', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-03 22:49:55.924063'),
('skzrs7uctt49k9f54b4mwbifcl21c22u', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-03 21:06:10.018462'),
('taj3tvuzk0o2gy8h4krbk740hrkwzsuc', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-04 20:58:56.557364'),
('tm70bthg3gd4ei0pitgcdcyo3pvrywe0', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-07 01:35:43.210719'),
('u6pnj742jjvs85t6b2jvoo25irtfv7q4', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-07 20:18:21.057093'),
('u6yia1qy2bqfq5l8y2n3h4ynlv4lzx6u', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-03 22:17:20.222775'),
('uabeatf8bg2dzvnmdzwcpb71dmvhq40h', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-03 01:52:53.616784'),
('ujrrkd1arpefhhmyq5nsgkoxzul3baje', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-07 02:36:22.751572'),
('uvau5jcaalhpzc8t5qenob1501g1hmnb', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-05 22:12:27.751906'),
('v61bpdwpgnxyezynbnlwx7rpxjgp4ho3', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-06 00:34:07.169790'),
('v7ya88rnx1b9vdif4t4tb7br4ycmt3c9', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-07 09:42:22.284649'),
('va5gkr56pmcph6pi1cnbhlkyc56tkfde', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-03 21:06:10.506457'),
('viazt44cbfcal66rk6rtpwq4ib0v3cvp', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-06 17:16:00.331206'),
('vldw3b5d4iuu1mfiihe1r0rh9kcx7l25', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-04 13:24:36.540414'),
('w1j36qdxwjtpa80x8o1w2lbfzke85pfd', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-07 23:56:06.079029'),
('w2riknsi4m1ynwi33ewug51k7p03n23m', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-02 16:08:58.121278'),
('wbrr5xjbbbk1tbuw6ykun2cejwyw6ayt', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-05 08:10:11.124089'),
('wbvuy9w9bz756qw55y52dqr58ttyqlnt', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-08 09:47:02.789341'),
('wio45vyg1y3bj7t1nq8wbtfrzto5d9u3', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-08 07:24:57.932504'),
('wspfamiz1nfeyhkn0vzy500atoxdlgki', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-07 22:26:30.674272'),
('wtgb85eb9squl4eiicdrcqnypnywteie', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-03-24 17:59:05.741272'),
('wtuomgrz9fmfx6q9t895r3yhvfuduqlg', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-06 07:08:21.354207'),
('x5m8ekgnkxrwpnfwwjfq5oqaa6hx6zkc', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-04 23:04:29.175012'),
('x7ycc5p742a9f7rx4l5yg6r9mjncuz3d', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-05 03:31:41.902534'),
('xyd8clkwxsw9b6w35fjma8pzr7itm65u', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-03 07:23:47.494302'),
('y080rya0uv7n9f5x26eufnu03a3egax7', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-03 20:44:48.898538'),
('yv7vlckhocla679c4k5rzvqqxecs0635', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-07 10:16:14.808500'),
('z8bser4opdytu477p314tnwprwuqif6p', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-08 11:15:52.757526'),
('zl6cix6yrjehnyu01ruyhoknadxf5q5u', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-02 16:48:05.693038'),
('zt54o6vmgo4pyc1y7gwwgm4k6a3nsoiw', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-04 07:28:25.310347'),
('zv9111orkikviuzviz710t7go2xg4s1t', 'ZWJmMjEwNjI1NjI2OTA2ZmIzMTQ4OWQzOWY2NzA5YWJlNmIwYTIzNDp7ImVtYWlsTmV3c0xldHRlciI6IiJ9', '2020-04-08 01:25:55.536479');

-- --------------------------------------------------------

--
-- Structure de la table `profile_address`
--

CREATE TABLE `profile_address` (
  `id` int(11) NOT NULL,
  `firstName` varchar(50) COLLATE utf8_bin NOT NULL,
  `lastName` varchar(50) COLLATE utf8_bin NOT NULL,
  `address` longtext COLLATE utf8_bin NOT NULL,
  `city` varchar(50) COLLATE utf8_bin NOT NULL,
  `cp` varchar(5) COLLATE utf8_bin DEFAULT NULL,
  `country` varchar(30) COLLATE utf8_bin NOT NULL,
  `mobile` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `customer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `profile_basket`
--

CREATE TABLE `profile_basket` (
  `id` int(11) NOT NULL,
  `quantity` smallint(5) UNSIGNED NOT NULL,
  `date` datetime(6) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `profile_customer`
--

CREATE TABLE `profile_customer` (
  `id` int(11) NOT NULL,
  `mobile` varchar(128) COLLATE utf8_bin NOT NULL,
  `gender` varchar(1) COLLATE utf8_bin NOT NULL,
  `IsNewsletter` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `profile_customer`
--

INSERT INTO `profile_customer` (`id`, `mobile`, `gender`, `IsNewsletter`, `user_id`) VALUES
(1, '+33755645212', 'M', 0, 2);

-- --------------------------------------------------------

--
-- Structure de la table `profile_order`
--

CREATE TABLE `profile_order` (
  `id` int(11) NOT NULL,
  `status` varchar(50) COLLATE utf8_bin NOT NULL,
  `delivery` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `date` datetime(6) NOT NULL,
  `endDate` datetime(6) DEFAULT NULL,
  `methodPayment` varchar(15) COLLATE utf8_bin NOT NULL,
  `address_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `profile_orderproduct`
--

CREATE TABLE `profile_orderproduct` (
  `id` int(11) NOT NULL,
  `quantity` smallint(5) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `shop_category`
--

CREATE TABLE `shop_category` (
  `id` int(11) NOT NULL,
  `name` varchar(30) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `shop_category`
--

INSERT INTO `shop_category` (`id`, `name`) VALUES
(1, 'Militaire');

-- --------------------------------------------------------

--
-- Structure de la table `shop_images`
--

CREATE TABLE `shop_images` (
  `id` int(11) NOT NULL,
  `image` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `date` datetime(6) NOT NULL,
  `product_id` int(11) NOT NULL,
  `title` varchar(124) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `shop_images`
--

INSERT INTO `shop_images` (`id`, `image`, `date`, `product_id`, `title`) VALUES
(1, 'products/2020/03/10/IMG_20200229_210047.jpg', '2020-03-10 16:24:15.000000', 1, 'Masque a Gaz année 1940'),
(2, 'products/2020/03/10/IMG_20200229_210047_0ut2mI8.jpg', '2020-03-10 16:24:36.000000', 1, 'Masque a Gaz année 1940 avec boite'),
(3, 'products/2020/03/10/IMG_20200229_205905.jpg', '2020-03-10 16:24:55.000000', 2, 'Rapiere d\'entrainement ancienne pas cher en ligne'),
(5, 'products/2020/03/19/DSCN2217.JPG', '2020-03-19 19:57:00.000000', 4, 'teste'),
(6, 'products/2020/03/19/DSCN2222.JPG', '2020-03-19 21:09:00.000000', 4, 'Tête du chat 3');

-- --------------------------------------------------------

--
-- Structure de la table `shop_indexpub`
--

CREATE TABLE `shop_indexpub` (
  `id` int(11) NOT NULL,
  `date` datetime(6) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `shop_indexpub`
--

INSERT INTO `shop_indexpub` (`id`, `date`, `product_id`) VALUES
(1, '2020-03-25 10:51:20.000000', 3),
(2, '2020-03-25 10:51:27.000000', 1),
(3, '2020-03-25 10:51:32.000000', 2);

-- --------------------------------------------------------

--
-- Structure de la table `shop_newsletter`
--

CREATE TABLE `shop_newsletter` (
  `id` int(11) NOT NULL,
  `email` varchar(254) COLLATE utf8_bin NOT NULL,
  `date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `shop_product`
--

CREATE TABLE `shop_product` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_bin NOT NULL,
  `description` longtext COLLATE utf8_bin NOT NULL,
  `price` decimal(9,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `date` datetime(6) NOT NULL,
  `category_id` int(11) NOT NULL,
  `image` varchar(100) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `shop_product`
--

INSERT INTO `shop_product` (`id`, `name`, `description`, `price`, `quantity`, `date`, `category_id`, `image`) VALUES
(1, 'Masque a Gaz', 'Masque a Gaz\r\n\r\nAncien Masque a gaz ayant surment deja servit qui sait !\r\nMasque de type 1940-1945 environ\r\n\r\nCaractéristique technique\r\n\r\nPoids: 1kg\r\nTaille : 40cm * 15cm\r\nEtat: Moyen', '50.00', 10, '2020-03-10 16:22:32.000000', 1, 'products/2020/03/19/IMG_20200229_210036.jpg'),
(2, 'Rapière d\'entrainement', 'Rapière d\'entrainement\r\n\r\nAncien Rapière d\'entrainement en assez bonne etat\r\n\r\nCaractéristique technique\r\n\r\nPoids: 1kg\r\nTaille : 40cm * 15cm\r\nEtat: Moyen', '150.00', 1, '2020-03-10 16:23:19.000000', 1, 'products/2020/03/10/IMG_20200229_205842.jpg'),
(3, 'Animal', 'Super Serveur Web Tous Neuf', '50.00', 10, '2020-03-19 11:33:29.000000', 1, 'products/2020/03/19/DSCN2273.JPG'),
(4, 'Chat a vendre', 'Super animal de compagnie', '50.00', 1, '2020-03-19 13:15:52.000000', 1, 'products/2020/03/19/DSCN2273.JPG');

-- --------------------------------------------------------

--
-- Structure de la table `shop_productcomment`
--

CREATE TABLE `shop_productcomment` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_bin NOT NULL,
  `email` varchar(254) COLLATE utf8_bin NOT NULL,
  `comment` longtext COLLATE utf8_bin NOT NULL,
  `star` smallint(5) UNSIGNED NOT NULL,
  `date` datetime(6) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `shop_productcomment`
--

INSERT INTO `shop_productcomment` (`id`, `name`, `email`, `comment`, `star`, `date`, `product_id`) VALUES
(1, 'Theo', 'theo.g.31@free.fr', 'Super Masque, et super site !!', 5, '2020-03-10 16:25:27.000000', 1),
(2, 'Gaillard', 'theo.g.31@free.fr', 'Super animal', 4, '2020-03-19 13:17:43.472447', 4),
(3, 'Theo Gaillard', 'theo.h@free.fr', 'Super belle article', 4, '2020-03-19 15:44:00.265011', 2),
(4, 'Julien Tricard', 'Jul.Tricard@gmail.fr', 'J\'ai bien reçu ma commande, je recommande ce site !', 4, '2020-03-23 21:01:11.355866', 2);

-- --------------------------------------------------------

--
-- Structure de la table `shop_subcategory`
--

CREATE TABLE `shop_subcategory` (
  `id` int(11) NOT NULL,
  `name` varchar(30) COLLATE utf8_bin NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `shop_subcategory`
--

INSERT INTO `shop_subcategory` (`id`, `name`, `category_id`) VALUES
(1, 'Materiel', 1);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `authtoken_token`
--
ALTER TABLE `authtoken_token`
  ADD PRIMARY KEY (`key`),
  ADD UNIQUE KEY `user_id` (`user_id`);

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
-- Index pour la table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Index pour la table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Index pour la table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Index pour la table `contact_contact`
--
ALTER TABLE `contact_contact`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

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
-- Index pour la table `profile_address`
--
ALTER TABLE `profile_address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `profile_address_customer_id_7457e681` (`customer_id`);

--
-- Index pour la table `profile_basket`
--
ALTER TABLE `profile_basket`
  ADD PRIMARY KEY (`id`),
  ADD KEY `profile_basket_customer_id_45f87d08_fk_profile_customer_id` (`customer_id`),
  ADD KEY `profile_basket_product_id_a6dd460f_fk_shop_product_id` (`product_id`);

--
-- Index pour la table `profile_customer`
--
ALTER TABLE `profile_customer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Index pour la table `profile_order`
--
ALTER TABLE `profile_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `profile_order_address_id_ed0e18fe` (`address_id`),
  ADD KEY `profile_order_customer_id_fc5a6a85` (`customer_id`);

--
-- Index pour la table `profile_orderproduct`
--
ALTER TABLE `profile_orderproduct`
  ADD PRIMARY KEY (`id`),
  ADD KEY `profile_orderproduct_order_id_eb3b621f_fk_profile_order_id` (`order_id`),
  ADD KEY `profile_orderproduct_product_id_202ee2fb_fk_shop_product_id` (`product_id`);

--
-- Index pour la table `shop_category`
--
ALTER TABLE `shop_category`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `shop_images`
--
ALTER TABLE `shop_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_images_product_id_3d79a3d3_fk_shop_product_id` (`product_id`);

--
-- Index pour la table `shop_indexpub`
--
ALTER TABLE `shop_indexpub`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_indexpub_product_id_9437df3a_fk_shop_product_id` (`product_id`);

--
-- Index pour la table `shop_newsletter`
--
ALTER TABLE `shop_newsletter`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `shop_product`
--
ALTER TABLE `shop_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_product_category_id_14d7eea8_fk_shop_subcategory_id` (`category_id`);

--
-- Index pour la table `shop_productcomment`
--
ALTER TABLE `shop_productcomment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_productcomment_product_id_faa735af_fk_shop_product_id` (`product_id`);

--
-- Index pour la table `shop_subcategory`
--
ALTER TABLE `shop_subcategory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_subcategory_category_id_7a45c724_fk_shop_category_id` (`category_id`);

--
-- AUTO_INCREMENT pour les tables exportées
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=169;
--
-- AUTO_INCREMENT pour la table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `contact_contact`
--
ALTER TABLE `contact_contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT pour la table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT pour la table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT pour la table `profile_address`
--
ALTER TABLE `profile_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `profile_basket`
--
ALTER TABLE `profile_basket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `profile_customer`
--
ALTER TABLE `profile_customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `profile_order`
--
ALTER TABLE `profile_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `profile_orderproduct`
--
ALTER TABLE `profile_orderproduct`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `shop_category`
--
ALTER TABLE `shop_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `shop_images`
--
ALTER TABLE `shop_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT pour la table `shop_indexpub`
--
ALTER TABLE `shop_indexpub`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `shop_newsletter`
--
ALTER TABLE `shop_newsletter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `shop_product`
--
ALTER TABLE `shop_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `shop_productcomment`
--
ALTER TABLE `shop_productcomment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `shop_subcategory`
--
ALTER TABLE `shop_subcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `authtoken_token`
--
ALTER TABLE `authtoken_token`
  ADD CONSTRAINT `authtoken_token_user_id_35299eff_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

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
-- Contraintes pour la table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Contraintes pour la table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Contraintes pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Contraintes pour la table `profile_address`
--
ALTER TABLE `profile_address`
  ADD CONSTRAINT `profile_address_customer_id_7457e681_fk_profile_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `profile_customer` (`id`);

--
-- Contraintes pour la table `profile_basket`
--
ALTER TABLE `profile_basket`
  ADD CONSTRAINT `profile_basket_customer_id_45f87d08_fk_profile_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `profile_customer` (`id`),
  ADD CONSTRAINT `profile_basket_product_id_a6dd460f_fk_shop_product_id` FOREIGN KEY (`product_id`) REFERENCES `shop_product` (`id`);

--
-- Contraintes pour la table `profile_customer`
--
ALTER TABLE `profile_customer`
  ADD CONSTRAINT `profile_customer_user_id_c63ad141_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Contraintes pour la table `profile_order`
--
ALTER TABLE `profile_order`
  ADD CONSTRAINT `profile_order_address_id_ed0e18fe_fk_profile_address_id` FOREIGN KEY (`address_id`) REFERENCES `profile_address` (`id`),
  ADD CONSTRAINT `profile_order_customer_id_fc5a6a85_fk_profile_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `profile_customer` (`id`);

--
-- Contraintes pour la table `profile_orderproduct`
--
ALTER TABLE `profile_orderproduct`
  ADD CONSTRAINT `profile_orderproduct_order_id_eb3b621f_fk_profile_order_id` FOREIGN KEY (`order_id`) REFERENCES `profile_order` (`id`),
  ADD CONSTRAINT `profile_orderproduct_product_id_202ee2fb_fk_shop_product_id` FOREIGN KEY (`product_id`) REFERENCES `shop_product` (`id`);

--
-- Contraintes pour la table `shop_images`
--
ALTER TABLE `shop_images`
  ADD CONSTRAINT `shop_images_product_id_3d79a3d3_fk_shop_product_id` FOREIGN KEY (`product_id`) REFERENCES `shop_product` (`id`);

--
-- Contraintes pour la table `shop_indexpub`
--
ALTER TABLE `shop_indexpub`
  ADD CONSTRAINT `shop_indexpub_product_id_9437df3a_fk_shop_product_id` FOREIGN KEY (`product_id`) REFERENCES `shop_product` (`id`);

--
-- Contraintes pour la table `shop_product`
--
ALTER TABLE `shop_product`
  ADD CONSTRAINT `shop_product_category_id_14d7eea8_fk_shop_subcategory_id` FOREIGN KEY (`category_id`) REFERENCES `shop_subcategory` (`id`);

--
-- Contraintes pour la table `shop_productcomment`
--
ALTER TABLE `shop_productcomment`
  ADD CONSTRAINT `shop_productcomment_product_id_faa735af_fk_shop_product_id` FOREIGN KEY (`product_id`) REFERENCES `shop_product` (`id`);

--
-- Contraintes pour la table `shop_subcategory`
--
ALTER TABLE `shop_subcategory`
  ADD CONSTRAINT `shop_subcategory_category_id_7a45c724_fk_shop_category_id` FOREIGN KEY (`category_id`) REFERENCES `shop_category` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

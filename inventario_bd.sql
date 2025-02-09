-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-02-2025 a las 02:48:06
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `inventario_bd`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_group`
--

INSERT INTO `auth_group` (`id`, `name`) VALUES
(1, 'uriel');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_group_permissions`
--

INSERT INTO `auth_group_permissions` (`id`, `group_id`, `permission_id`) VALUES
(2, 1, 21),
(3, 1, 22),
(4, 1, 23),
(5, 1, 24),
(6, 1, 25),
(7, 1, 26),
(8, 1, 27),
(9, 1, 28),
(10, 1, 29),
(11, 1, 31),
(1, 1, 32);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_permission`
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
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add product', 6, 'add_product'),
(22, 'Can change product', 6, 'change_product'),
(23, 'Can delete product', 6, 'delete_product'),
(24, 'Can view product', 6, 'view_product'),
(25, 'Can add user', 7, 'add_userprofile'),
(26, 'Can change user', 7, 'change_userprofile'),
(27, 'Can delete user', 7, 'delete_userprofile'),
(28, 'Can view user', 7, 'view_userprofile'),
(29, 'Can add inventory movement', 8, 'add_inventorymovement'),
(30, 'Can change inventory movement', 8, 'change_inventorymovement'),
(31, 'Can delete inventory movement', 8, 'delete_inventorymovement'),
(32, 'Can view inventory movement', 8, 'view_inventorymovement');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2025-02-07 01:18:08.898509', '1', 'uriel', 1, '[{\"added\": {}}]', 3, 3),
(2, '2025-02-07 01:18:18.289422', '1', 'uriel', 2, '[]', 3, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'contenttypes', 'contenttype'),
(8, 'inventory', 'inventorymovement'),
(6, 'inventory', 'product'),
(7, 'inventory', 'userprofile'),
(5, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2025-02-06 22:46:56.502218'),
(2, 'contenttypes', '0002_remove_content_type_name', '2025-02-06 22:46:56.583863'),
(3, 'auth', '0001_initial', '2025-02-06 22:46:56.844675'),
(4, 'auth', '0002_alter_permission_name_max_length', '2025-02-06 22:46:56.898083'),
(5, 'auth', '0003_alter_user_email_max_length', '2025-02-06 22:46:56.914430'),
(6, 'auth', '0004_alter_user_username_opts', '2025-02-06 22:46:56.931311'),
(7, 'auth', '0005_alter_user_last_login_null', '2025-02-06 22:46:56.939546'),
(8, 'auth', '0006_require_contenttypes_0002', '2025-02-06 22:46:56.939546'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2025-02-06 22:46:56.955995'),
(10, 'auth', '0008_alter_user_username_max_length', '2025-02-06 22:46:56.969621'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2025-02-06 22:46:56.983268'),
(12, 'auth', '0010_alter_group_name_max_length', '2025-02-06 22:46:57.000788'),
(13, 'auth', '0011_update_proxy_permissions', '2025-02-06 22:46:57.013432'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2025-02-06 22:46:57.016990'),
(15, 'inventory', '0001_initial', '2025-02-06 22:46:57.478397'),
(16, 'admin', '0001_initial', '2025-02-06 22:46:57.625689'),
(17, 'admin', '0002_logentry_remove_auto_add', '2025-02-06 22:46:57.642550'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2025-02-06 22:46:57.666999'),
(19, 'sessions', '0001_initial', '2025-02-06 22:46:57.712413');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('j4jvhdy9zzunrumqxmksep62olxkx41p', '.eJxVjEsOAiEQBe_C2hCUT4NL956BdEMjowaSYWZlvLtOMgvdvqp6LxFxXWpcB89xyuIstDj8boTpwW0D-Y7t1mXqbZknkpsidzrktWd-Xnb376DiqN86aIvJBuNdMSdIxangQHkyBMQKtINgWQNrcuBRswvGmmOwChMDpSLeH770Nzw:1tgCzO:iFpCeu1-Ch7zElEaMh3_T8h7IIZqASkTKKAEsxvQ_yM', '2025-02-21 01:17:02.932360');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventory_inventorymovement`
--

CREATE TABLE `inventory_inventorymovement` (
  `id` bigint(20) NOT NULL,
  `movement_type` varchar(10) NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL CHECK (`quantity` >= 0),
  `created_at` datetime(6) NOT NULL,
  `product_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `inventory_inventorymovement`
--

INSERT INTO `inventory_inventorymovement` (`id`, `movement_type`, `quantity`, `created_at`, `product_id`) VALUES
(1, 'IN', 10, '2025-02-06 23:20:44.574926', 2),
(2, 'OUT', 5, '2025-02-06 23:20:44.581473', 2),
(3, 'OUT', 55, '2025-02-09 17:37:32.000000', 25),
(4, 'IN', 79, '2025-02-08 17:38:13.000000', 9),
(5, 'IN', 24, '2025-02-08 00:59:00.552704', 16),
(6, 'IN', 65, '2025-02-08 00:59:07.311925', 16);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventory_product`
--

CREATE TABLE `inventory_product` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `sku` varchar(100) NOT NULL,
  `stock` int(10) UNSIGNED NOT NULL CHECK (`stock` >= 0),
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `inventory_product`
--

INSERT INTO `inventory_product` (`id`, `name`, `sku`, `stock`, `price`) VALUES
(2, 'Laptop', 'LAP123', 50, 15000.00),
(3, 'Mouse', 'MOU456', 200, 300.00),
(4, 'Teclado', 'KEY789', 100, 500.00),
(5, 'Teclado mecánico', 'TEC123', 50, 89.99),
(9, 'Monitor 24 pulgadas', 'MON789', 20, 199.99),
(10, 'Laptop HP 15', 'LAP001', 10, 799.99),
(11, 'SSD 1TB', 'SSD002', 40, 129.99),
(12, 'Tarjeta Gráfica RTX 3060', 'GPU003', 15, 399.99),
(13, 'Memoria RAM 16GB', 'RAM004', 60, 89.99),
(14, 'Fuente de poder 750W', 'PSU005', 25, 119.99),
(15, 'Silla Gamer', 'CHAIR006', 12, 249.99),
(16, 'Auriculares Bluetooth', 'HEAD007', 35, 69.99),
(17, 'Micrófono USB', 'MIC008', 18, 79.99),
(18, 'Router Wi-Fi 6', 'ROUT009', 22, 129.99),
(19, 'Tablet Samsung', 'TAB010', 14, 299.99),
(20, 'Impresora Láser', 'PRINT011', 9, 199.99),
(21, 'Cámara Web 1080p', 'CAM012', 27, 89.99),
(22, 'Disco Duro Externo 2TB', 'HDD013', 33, 109.99),
(23, 'Mousepad XL', 'MOUSEPAD014', 50, 29.99),
(24, 'Cable HDMI 2m', 'HDMI015', 75, 15.99),
(25, 'Hub USB-C', 'HUB016', 40, 39.99),
(26, 'Smartwatch', 'WATCH017', 20, 149.99);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventory_userprofile`
--

CREATE TABLE `inventory_userprofile` (
  `id` bigint(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `role` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `inventory_userprofile`
--

INSERT INTO `inventory_userprofile` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `role`) VALUES
(1, 'pbkdf2_sha256$720000$wKEeD4fyuYmbFvVbgROdIE$gs7W9uX9I0Za4X4p1KDq3KPed1TGTtCIFahfrpdBrxM=', NULL, 0, 'admin', '', '', '', 0, 1, '2025-02-06 23:18:55.811620', 'admin'),
(2, 'pbkdf2_sha256$720000$CjrLN00XB0e2Ph6OSeDsMN$JLcE8p4r3kS1FiCRjkYkEyJd6MaEb4YiIZdSv456cnk=', NULL, 0, 'staff', '', '', '', 0, 1, '2025-02-06 23:18:56.604563', 'inventory_staff'),
(3, 'pbkdf2_sha256$720000$GWGHpyExhRF0zQcujP4Ll5$ucUg9gMw7CHdh6Kv+iXj35n27J6BNkC3X0qX+j1jd4c=', '2025-02-07 01:17:02.928050', 1, 'uriel', '', '', 'uriel@gmail.com', 1, 1, '2025-02-07 01:16:37.580497', ''),
(4, 'pbkdf2_sha256$720000$PbXC0e2DdwDuJpQ7Q9JOsJ$WvadL6QrYXF+fR6H1dbP2djc23cwlCJSunxFCiIk9jA=', NULL, 1, 'daniel', '', '', 'daniel@gmail.com', 1, 1, '2025-02-08 16:28:46.052294', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventory_userprofile_groups`
--

CREATE TABLE `inventory_userprofile_groups` (
  `id` bigint(20) NOT NULL,
  `userprofile_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventory_userprofile_user_permissions`
--

CREATE TABLE `inventory_userprofile_user_permissions` (
  `id` bigint(20) NOT NULL,
  `userprofile_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indices de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_inventory_userprofile_id` (`user_id`);

--
-- Indices de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indices de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indices de la tabla `inventory_inventorymovement`
--
ALTER TABLE `inventory_inventorymovement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inventory_inventorym_product_id_74123ceb_fk_inventory` (`product_id`);

--
-- Indices de la tabla `inventory_product`
--
ALTER TABLE `inventory_product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sku` (`sku`);

--
-- Indices de la tabla `inventory_userprofile`
--
ALTER TABLE `inventory_userprofile`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `inventory_userprofile_groups`
--
ALTER TABLE `inventory_userprofile_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `inventory_userprofile_gr_userprofile_id_group_id_a1eee8d5_uniq` (`userprofile_id`,`group_id`),
  ADD KEY `inventory_userprofile_groups_group_id_8878e4d9_fk_auth_group_id` (`group_id`);

--
-- Indices de la tabla `inventory_userprofile_user_permissions`
--
ALTER TABLE `inventory_userprofile_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `inventory_userprofile_us_userprofile_id_permissio_3c3aec55_uniq` (`userprofile_id`,`permission_id`),
  ADD KEY `inventory_userprofil_permission_id_5b42183d_fk_auth_perm` (`permission_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `inventory_inventorymovement`
--
ALTER TABLE `inventory_inventorymovement`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `inventory_product`
--
ALTER TABLE `inventory_product`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `inventory_userprofile`
--
ALTER TABLE `inventory_userprofile`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `inventory_userprofile_groups`
--
ALTER TABLE `inventory_userprofile_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `inventory_userprofile_user_permissions`
--
ALTER TABLE `inventory_userprofile_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_inventory_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `inventory_userprofile` (`id`);

--
-- Filtros para la tabla `inventory_inventorymovement`
--
ALTER TABLE `inventory_inventorymovement`
  ADD CONSTRAINT `inventory_inventorym_product_id_74123ceb_fk_inventory` FOREIGN KEY (`product_id`) REFERENCES `inventory_product` (`id`);

--
-- Filtros para la tabla `inventory_userprofile_groups`
--
ALTER TABLE `inventory_userprofile_groups`
  ADD CONSTRAINT `inventory_userprofil_userprofile_id_85392c69_fk_inventory` FOREIGN KEY (`userprofile_id`) REFERENCES `inventory_userprofile` (`id`),
  ADD CONSTRAINT `inventory_userprofile_groups_group_id_8878e4d9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `inventory_userprofile_user_permissions`
--
ALTER TABLE `inventory_userprofile_user_permissions`
  ADD CONSTRAINT `inventory_userprofil_permission_id_5b42183d_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `inventory_userprofil_userprofile_id_822acdd0_fk_inventory` FOREIGN KEY (`userprofile_id`) REFERENCES `inventory_userprofile` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

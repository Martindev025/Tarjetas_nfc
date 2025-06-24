-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-07-2024 a las 17:44:04
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cards`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `companies`
--

CREATE TABLE `companies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `companies`
--

INSERT INTO `companies` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Tecser', NULL, NULL),
(2, 'Aires y Tecnología', NULL, NULL),
(3, 'Hometic', NULL, NULL),
(4, 'Andina Obra Civil', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `events`
--

CREATE TABLE `events` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha` date NOT NULL DEFAULT current_timestamp(),
  `template` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `events`
--

INSERT INTO `events` (`id`, `name`, `fecha`, `template`, `created_at`, `updated_at`) VALUES
(1, 'Congreso Federación.', '2024-02-28', '', '2024-04-29 19:55:29', '2024-04-29 19:55:29'),
(3, 'CUSTOMER EXPERIENCE SUMMIT 2024', '2024-05-08', '', '2024-05-08 19:01:56', '2024-05-08 19:01:56'),
(4, 'Comerciales', '2024-05-27', 'tarjeta1', '2024-05-28 01:19:04', '2024-05-28 01:19:04'),
(5, 'Congreso Andesco 2024', '2024-06-26', 'tarjeta1', '2024-06-13 01:31:54', '2024-06-13 01:31:54');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `event_company`
--

CREATE TABLE `event_company` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `event_id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `event_company`
--

INSERT INTO `event_company` (`id`, `event_id`, `company_id`, `created_at`, `updated_at`) VALUES
(1, 4, 1, NULL, NULL),
(2, 4, 2, NULL, NULL),
(3, 4, 3, NULL, NULL),
(4, 4, 4, NULL, NULL),
(5, 5, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nfc_cards`
--

CREATE TABLE `nfc_cards` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ciudad` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `celular` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefono_opc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefono_opci` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cargo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `correo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `correo_opc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pagina` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pagina_opc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pagina_opcional` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `empresa` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `feature` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `event_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `nfc_cards`
--

INSERT INTO `nfc_cards` (`id`, `nombre`, `ciudad`, `celular`, `telefono_opc`, `telefono_opci`, `cargo`, `correo`, `correo_opc`, `pagina`, `pagina_opc`, `pagina_opcional`, `empresa`, `feature`, `created_at`, `updated_at`, `event_id`) VALUES
(2, 'HELVER GONZALES MORA', 'CHAPARRAL - TOLIMA', '3185956242', NULL, NULL, 'Alcalde', 'gonzales010@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-28 20:14:47', '2024-02-28 20:17:58', 1),
(3, 'HECTOR JOHANNY SANTANA MUÑOZ', 'RIONEGRO - SANTADER', '3046010050', NULL, NULL, 'ALCALDE', 'secretariaprivada@rionegro-santander.gov.co', NULL, NULL, NULL, NULL, '', NULL, '2024-02-28 20:17:29', '2024-02-28 20:17:29', 1),
(4, 'GABRIEL ALBERTO CALLE DEMOYA', 'MONTELIBANO CORDOBA', '3135321463', NULL, NULL, 'Alcalde', 'servicentromontelibano@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-28 20:19:33', '2024-02-28 20:42:05', 1),
(6, 'JHOANNY OSWALDO GARZON AGUAS_', 'UBAQUE - CUNDINAMARCA', '3112375441', NULL, NULL, 'ALCALDE', 'visinga67@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-28 20:25:20', '2024-02-28 20:25:20', 1),
(9, 'JHON JAIRO SANDOVAL SANDOVAL', 'SAN  MIGUEL - SANTANDER', '3183865509', NULL, NULL, 'ALCALDE', 'jhonsandoval18621@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-28 20:29:10', '2024-02-28 20:29:10', 1),
(10, 'SERGIO ANDRES PAEZ VASQUEZ', 'MACARAVITA - SANTANDER', '3147843451', NULL, NULL, 'ALCALDE', 'sergioandrespaez@icloud.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-28 20:31:24', '2024-02-28 20:31:24', 1),
(11, 'EDWIN AUGUSTO ALMANZA QUINTERO', 'CHIQUIZA -SAN PEDRO DE IGUA - BOYACA', '3202787500', NULL, NULL, 'ALCALDE', 'almanzaalcalde2024@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-28 20:38:51', '2024-02-28 20:38:51', 1),
(13, 'Jaime Diaz Noscue', 'Cauca', '3214314309', NULL, NULL, 'Alcalde', 'jaimediaz99@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-28 20:44:04', '2024-02-28 20:44:04', 1),
(16, 'Chisthian Alexander Guerra Torijano', 'Nariño', '3178192993', NULL, NULL, 'Secretario de planeación', 'crguerrat@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-28 20:46:43', '2024-02-28 20:46:43', 1),
(18, 'Juan Camilo Guerra Fajardo', 'Ñariño', '3157491970', NULL, NULL, 'Secretaria de Agricultura', 'camilo.530@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-28 20:51:21', '2024-02-28 20:51:21', 1),
(20, 'SANTIAGO ANDRES ROSERO CAJIGAS', 'SANDONA- NARIÑO', '3127950836', NULL, NULL, 'Funcional municipal', 'santiagoroseroc14@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-28 20:53:21', '2024-02-28 20:53:21', 1),
(21, 'Marco Daniel Borda Parra', 'Boyaca', '3125555672', NULL, NULL, 'Alcalde', 'marcosdaniel07@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-28 20:55:02', '2024-02-28 20:55:02', 1),
(22, 'Hernan Alonso Acosta Medina', 'Boyaca', '3115116848', NULL, NULL, 'Alcalde', 'hernanacostamedina@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-28 20:57:13', '2024-02-28 20:57:13', 1),
(23, 'Andres Felipe Muriel Sanchez', 'Cali', '3164200920', NULL, NULL, 'Abogado', 'andres-muriel@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-28 20:58:54', '2024-02-28 20:58:54', 1),
(24, 'GUSTAVO SILVA', 'ANTIOQUIA', '3207128156', NULL, NULL, 'ALCALDE', 'silvas327@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-28 20:59:38', '2024-02-28 20:59:38', 1),
(25, 'FREDY ALEXANDER FRANCO', 'SUCRE - SANTANDER', '3204740090', NULL, NULL, 'SECRETARIA DE PLANEACION', 's.planeacion@sucre-santander.gov.co', NULL, NULL, NULL, NULL, '', NULL, '2024-02-28 21:01:29', '2024-02-28 21:01:29', 1),
(26, 'Nelson de Jesus Henao Zapata_', 'Antioquia', '3117100947', NULL, NULL, 'Alcalde', 'nelsonsanvi@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-28 21:01:39', '2024-02-28 21:01:39', 1),
(27, 'Jaime Javier Montenegro Torres_', 'Nariño', '3113097221', NULL, NULL, 'Alcalde', 'jjmontenegrotorres@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-28 21:06:35', '2024-02-28 21:06:35', 1),
(28, 'LEITER SALGADO PACHECO_', 'ARACATACA- MAGDALENA', '3215557274', NULL, NULL, 'ALCALDE', 'Leitersalgado@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-28 21:07:51', '2024-02-28 21:10:41', 1),
(29, 'Mariluz Cristina Delgado Gaviria', 'Nariño', '3219166602', NULL, NULL, 'Alcaldesa', 'mariluz.delgado2019@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-28 21:08:18', '2024-02-28 21:08:18', 1),
(30, 'ALEXANDER MARTINEZ BALLESTEROS', 'HUILA', '3134940282', NULL, NULL, 'ALCALDE', 'alexandermartinezprivado@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-28 21:09:01', '2024-02-28 21:09:01', 1),
(31, 'PABLO SEGUNDO PEÑA CRUZ', 'ARACATACA- MAGDALENA', '3012753994', NULL, NULL, 'SECRETARIO PLANEACIÓN', 'impuestos@aracataca-magdalena.gov.co', NULL, NULL, NULL, NULL, '', NULL, '2024-02-28 21:09:22', '2024-02-28 21:09:22', 1),
(32, 'Carlos Javier Prada', 'Norte de Santander', '3133554227', NULL, NULL, 'Alcalde', 'carlosprada28@yahoo.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-28 21:13:13', '2024-02-28 21:13:13', 1),
(33, 'HECTOR RENGIFO_', 'CALI', '3176551013', NULL, NULL, 'GERENTE DE CONSULTORIA', 'Gerente.consultoria@bkf.com.co', NULL, NULL, NULL, NULL, '', NULL, '2024-02-28 21:13:28', '2024-02-28 21:51:31', 1),
(34, 'JAIME JAVIER MONTENEGRO TORRES', 'UNION - NARIÑO', '3113097221', NULL, NULL, 'ALCALDE', 'jjmontenegrotorres@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-28 21:15:16', '2024-02-28 21:15:16', 1),
(35, 'Elmis Alberto Olivares Almarales', 'Magdalena', '3016867462', NULL, NULL, 'Secretario de Hacienda', 'elmisalberto1@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-28 21:16:25', '2024-02-28 21:16:25', 1),
(36, 'Jose Jacinto Morales Sanabria', 'Pachavita - boyacá', '3202725864', NULL, NULL, 'Alcalde', 'alcaldia@pachavita-boyaca.gov.co', NULL, NULL, NULL, NULL, '', NULL, '2024-02-28 21:18:42', '2024-02-28 21:20:06', 1),
(37, 'CARLOS JAVIER PRADA MOGOLLON', 'TOLEDO- NORTE DE SANTANDER', '3133554227', NULL, NULL, 'ALCALDE', 'carlosprada28@yahoo.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-28 21:19:31', '2024-02-28 21:19:31', 1),
(38, 'MARI LUZ DELGADO_', 'ALBOLEDA NARIÑO', '3219166602', NULL, NULL, 'ALCALDE', 'mari.delgado2019@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-28 21:19:59', '2024-02-28 21:19:59', 1),
(39, 'Raul Antonio Cubides Ramirez_', 'Chinavita', '3103430577', NULL, NULL, 'Alcalde', 'raulcubides@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-28 21:20:36', '2024-02-28 21:20:36', 1),
(40, 'JAIME SEPULVEDA', 'CAPITANIA - SANTANDER', '3228160009', NULL, NULL, 'ALCALDE', 'jaimesepulveda2427@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-28 21:22:14', '2024-02-28 21:22:14', 1),
(41, 'Alejandro Abuchar Gonzalez', 'Turbo', '3243998126', NULL, NULL, 'Alcalde', 'alejandro.abuchar1@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-28 21:22:29', '2024-02-28 21:22:29', 1),
(42, 'Hector Rangel Palacio Rodriguez', 'Apartado', '3148409182', NULL, NULL, 'Alcalde', 'rangelpalaciosr@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-28 21:24:14', '2024-02-28 21:24:14', 1),
(43, 'RAUL ANTONIO CUBIDES RAMIREZ', 'CHINAVITA', '3103430577', NULL, NULL, 'ALCALDE', 'raulcubides@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-28 21:27:31', '2024-02-28 21:27:31', 1),
(44, 'RUBEN DARIO MORENO MENDEZ_', 'MALAGA- SANTANDER', '312397542', NULL, NULL, 'ALCALDE', 'Rudamome@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-28 21:30:29', '2024-02-28 21:30:29', 1),
(45, 'EDIER YAIR CAJIGAS NARVAEZ', 'SANDONA - NARIÑO', '3128675529', NULL, NULL, 'SECRETARIO DE HACIENDA', 'secretariadehacienda@xn--sandona-nario-tkb.gov.co', NULL, NULL, NULL, NULL, '', NULL, '2024-02-28 21:31:17', '2024-02-28 21:31:17', 1),
(46, 'Ramon Alberto Rubio Durango', 'P. Libertador', '3126171645', NULL, NULL, 'Alcalde', 'ramonalrudo@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-28 21:31:51', '2024-02-28 21:31:51', 1),
(47, 'OSCAR OCTAVIO CEDIEL VASQUEZ_', 'CHIMA - SANTANDER', '3152509191', NULL, NULL, 'ALCALDE', 'CEDIEL1782@GMAIL.COM', NULL, NULL, NULL, NULL, '', NULL, '2024-02-28 21:33:04', '2024-02-28 21:33:04', 1),
(48, 'JUAN CARLOS MENDOZA RENDON_', 'GRANADA', '3105690903', NULL, NULL, 'ALCALDE', 'juancarlosmendoza@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-28 21:33:07', '2024-02-28 21:33:07', 1),
(49, 'NELSON DE JESUS HENAO ZAPATA', 'SAN VICENTE DE ANTIOQUIA', '3117100947', NULL, NULL, 'ALCALDE', 'nelsonsanvi@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-28 21:35:09', '2024-02-28 21:35:09', 1),
(50, 'FREDY ANTONIO RAMIREZ ORTIZ_', 'SAN ANDRES - SANTANDER', '3143612990', NULL, NULL, 'Alcalde', 'Freddy874r@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-28 21:35:17', '2024-02-28 21:35:17', 1),
(51, 'Edilson Gomez Balanta', 'Mercaderes', '3122948631', NULL, NULL, 'Alcalde', 'edilson1628@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-28 21:36:11', '2024-02-28 21:36:11', 1),
(52, 'JAVIER ANDRES HERRERA HURTADO', 'ALCALA - VALLE DEL CAUCA', '3132353689', NULL, NULL, 'ALCALDE', 'tattoalcalde12-15@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-28 21:36:58', '2024-02-28 21:36:58', 1),
(53, 'JAIME ANTONIO SEPULVEDA GUTIERREZ', 'CAPITANEJO - SANTANDER', '3228160009', NULL, NULL, 'Alcalde', 'Jaimesepulveda2427@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-28 21:37:59', '2024-02-28 21:37:59', 1),
(54, 'JOHN ALEXANDER PINZON HERNANDEZ', 'LAS PIEDRAS - TOLIMA', '3182632384', NULL, NULL, 'ALCALDE', 'alcaldia@piedras-tolima.gov.co', NULL, NULL, NULL, NULL, '', NULL, '2024-02-28 21:38:41', '2024-02-28 21:38:41', 1),
(55, 'MARI LUZ DELGADO', 'ARBOLEDA - NARIÑO', '3219166602', NULL, NULL, 'ALCALDE', 'mari.delgado2019@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-28 21:39:38', '2024-02-28 21:39:38', 1),
(56, 'Valentina Bello Lobo', 'Margarita', '3145034539', NULL, NULL, 'Alcaldesa', 'alcaldia@margarita-bolivar.gov.co', NULL, NULL, NULL, NULL, '', NULL, '2024-02-28 21:40:13', '2024-02-28 21:40:13', 1),
(57, 'ISRAEL SANDOVAL MANRIQUE_', 'ENCISO- SANTANDER', '3115184225', NULL, NULL, 'ALCALDE', 'INGCIVIL1804@GMAIL.COM', NULL, NULL, NULL, NULL, '', NULL, '2024-02-28 21:40:40', '2024-02-28 21:40:40', 1),
(58, 'EMPERATRIZ MENA PALACIO_', 'MURINDO - ANTIOQUIA', '3128808207', NULL, NULL, 'ALCALDE', 'empemepa@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-28 21:42:32', '2024-02-28 21:42:32', 1),
(59, 'EMPERATRIZ MENA PALACIO', 'MURINDO - ANTIOQUIA', '3128808207', NULL, NULL, 'ALCALDE', 'empemepa@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-28 21:42:32', '2024-02-28 21:42:32', 1),
(60, 'Ivan David Nemocon Espinosa', 'Tenjo', '3105532903', NULL, NULL, 'Alcalde', 'nuestroturnotengo@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-28 21:45:36', '2024-02-28 21:45:36', 1),
(61, 'Mario Ediberto Siabato Rincon', 'Jerico Boyacá', '3202309949', NULL, NULL, 'Alcalde', 'marioes072@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-28 21:47:39', '2024-02-28 21:47:39', 1),
(62, 'DANIEL ANDRES MAHECHA ORDOÑEZ', 'PUERTO BOYACA', '3016995293', NULL, NULL, 'ALCALDE', 'planeacion@puertoboyaca-boyaca.gov.co', NULL, NULL, NULL, NULL, '', NULL, '2024-02-28 21:47:51', '2024-02-28 21:47:51', 1),
(63, 'TATIANA SUAREZ MOTA', 'VIANI - CUNDINAMARCA', '3118592730', NULL, NULL, 'ALCALDE', 'suarezmottatiana@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-28 21:50:01', '2024-02-28 21:50:01', 1),
(64, 'VALENTINA BELLO LOBO_', 'MARGARITA - BOLIVAR', '3114147749', NULL, NULL, 'ALCALDE', 'alcaldia@margarita-bolivar.gov.co', NULL, NULL, NULL, NULL, '', NULL, '2024-02-28 21:51:42', '2024-02-28 21:51:42', 1),
(65, 'JOSE JACINTO MORALES SANABIA', 'PACHAVITA - BOYACA', '3202725864', NULL, NULL, 'ALCALDE', 'alcaldia@pachavita-boyaca.gov.co', NULL, NULL, NULL, NULL, '', NULL, '2024-02-28 21:53:27', '2024-02-28 21:53:27', 1),
(66, 'Diana Milena Palacios Estupiñan', 'El Charco', '3216036150', NULL, NULL, 'Alcaldesa', 'dimipaes@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-28 21:55:59', '2024-02-28 21:55:59', 1),
(67, 'LEITER SALGADO PACHECO', 'ARACATACA - MAGDALENA', '3215557274', NULL, NULL, 'ALCALDE', 'impuestos@aracataca-magdalena.gov.co', 'elmisalberto1@gmail.com', NULL, NULL, NULL, '', NULL, '2024-02-28 21:56:04', '2024-02-28 21:56:04', 1),
(68, 'MARIO FERNANDO LOZANO DUARTE', 'TENZA - BOYACA', '3143253053', NULL, NULL, 'Alcalde', 'Mariolo50@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-28 21:59:03', '2024-02-28 21:59:03', 1),
(69, 'Ernesto Zuñiga Osorio_', 'Nariño-Leiva', '3127883005', NULL, NULL, 'Alcalde', 'enerstozuniga4099@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-28 21:59:46', '2024-02-28 21:59:46', 1),
(74, 'Luis Alarcon', 'Playon Santander', '3208083628', NULL, NULL, 'Alcalde', 'playonnosune@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-28 22:10:59', '2024-02-28 22:10:59', 1),
(75, 'Lida Paz Labio', 'Jambalo Cauca', '3117086819', NULL, NULL, 'Alcalde', 'liempala@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-28 22:13:12', '2024-02-28 22:13:12', 1),
(76, 'Eduard Alonso Murillo Murillo', 'Medio San Juan - Choco', '3145633060', NULL, NULL, 'Alcalde', 'alonso_m888@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-28 22:13:44', '2024-02-28 22:13:44', 1),
(77, 'Yesid Alexander Bernal Hernandez', 'Chivata - Boyacá', '3138045433', NULL, NULL, 'Alcalde', 'alcalde@chivata-boyaca.gov.co', NULL, NULL, NULL, NULL, '', NULL, '2024-02-28 22:18:55', '2024-02-28 22:18:55', 1),
(78, 'RUSMERY ANGULO ACEVEDO', 'BUENAVENTURA', '3135172202', NULL, NULL, 'ALCALDE', 'negrarmjc18@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-28 22:23:43', '2024-02-28 22:23:43', 1),
(79, 'CIELO CARYN DIAZ AMADO_', 'LA PAZ - SANTANDER', '3102012365', NULL, NULL, 'ALCALDE', 'alcaldia@lapaz-santander.gov.co', NULL, NULL, NULL, NULL, '', NULL, '2024-02-28 22:25:28', '2024-02-28 22:25:28', 1),
(80, 'Betilda Carrillo Torreglosa', 'Cartagena', '3205747768', NULL, NULL, 'Congreso de la Republica de Colombia', 'carrillotorreglosabetilda@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-28 22:27:55', '2024-02-28 22:27:55', 1),
(81, 'Camilo Morales Rincon', 'Tasco - Boyacá', '3104480876', NULL, NULL, 'Alcalde', 'ing.camilomorales@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-28 22:28:18', '2024-02-28 22:30:07', 1),
(82, 'German Ricardo Robayo Heredia', 'Somondoco - Boyacá', '3112237316', NULL, NULL, 'Alcalde', 'arqgrrh2224@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-28 22:31:06', '2024-02-28 22:31:06', 1),
(83, 'Edgar Gutierrez Sanchez', 'Bogotá', '3005550738', NULL, NULL, 'Gerente', 'gerencia@egssas.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-28 22:36:22', '2024-02-28 22:36:22', 1),
(84, 'Pahola Elena Ordoñez Ceron', 'San Sebastian - Cauca', '3136372677', NULL, NULL, 'Alcaldesa', 'proyectosfase1@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-28 22:40:34', '2024-02-28 22:40:34', 1),
(85, 'William Tomas Galindo', 'Tibaná - Boyacá', '3115891110', NULL, NULL, 'Alcalde', 'wigabo4@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-28 22:54:20', '2024-02-28 22:54:20', 1),
(86, 'Hugo Efrén Novoa', 'Arbeláez - Cundinamarca', '3104842741', NULL, NULL, 'Alcalde', 'alcaldia@arbelaez.gov.co', NULL, NULL, NULL, NULL, '', NULL, '2024-02-28 22:57:36', '2024-02-28 22:57:36', 1),
(87, 'Jose Ricardo Benavides Moran', 'Ricaurte - Nariño', '3188272424', NULL, NULL, 'Alcalde', 'alcaldiarte@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-28 23:04:13', '2024-02-28 23:04:13', 1),
(88, 'Tatiana Suarez Motta', 'Vianí - Cundinamarca', '3118592730', NULL, NULL, 'Alcaldesa', 'suarezmottatatiana@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-28 23:09:20', '2024-02-28 23:09:20', 1),
(89, 'Ignacio Santoya', 'Apulo - Cundinamarca', '3112148739', NULL, NULL, 'Alcalde', 'santoya01@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-28 23:13:33', '2024-02-28 23:13:33', 1),
(90, 'marcos borda', 'cucaita', '3125555672', NULL, NULL, 'alcaldia', 'marcosdaniel07@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 00:19:40', '2024-02-29 00:19:40', 1),
(91, 'victor collazo', 'la cumbre valle', '3174280700', NULL, NULL, 'ALCALDE', 'vicoeps1@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 00:24:55', '2024-02-29 00:24:55', 1),
(92, 'Edisson Arley Cortes Vallejo', 'Guapota - Santander', '3213698652', NULL, NULL, 'Alcalde', 'orion117023@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 00:43:00', '2024-02-29 00:43:00', 1),
(93, 'Elkin Alfonso Reyes Plata_', 'Oiba - Santander', '3138179195', NULL, NULL, 'Alcalde', 'reyesplataelkin@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 00:44:55', '2024-02-29 00:44:55', 1),
(94, 'Elkin Alfonso Reyes Plata', 'Oiba - Santander', '3138179195', NULL, NULL, 'Alcalde', 'reyesplataelkin@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 00:44:57', '2024-02-29 00:44:57', 1),
(95, 'Maria Argenis Ortega Correa', 'Apulo - Cundinamarca', '3105694438', NULL, NULL, 'Gestora Social', 'argenis.correa@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 00:47:39', '2024-02-29 00:47:39', 1),
(96, 'María Rincón', 'El agrado', '3222694303', NULL, NULL, 'Alcaldesa', 'alcalde@elagrado-huila.gov.co', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 00:49:10', '2024-02-29 00:49:10', 1),
(97, 'Victor Alfonso Collazos Cifuentes_', 'La cumbre - Valle del Cauca', '3174280700', NULL, NULL, 'Alcalde', 'vicogps@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 00:52:13', '2024-02-29 00:52:13', 1),
(98, 'Rodolfo Gomez Ballestero', 'La cumbre - Valle del Cauca', '3217677836', NULL, NULL, 'Prensa - Comunicación', 'oficinatic@cumbrevalle.gov.co', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 00:54:29', '2024-02-29 00:54:29', 1),
(99, 'Fredy Antonio Ramirez Ortiz', 'San Andres - Santander', '3143612990', NULL, NULL, 'Alcalde', 'freddy874r@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 01:02:51', '2024-02-29 01:02:51', 1),
(100, 'Edisson Arley Cortés', 'Guapota Santander', '3125841964', NULL, NULL, 'Alcalde', 'Orion117023@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 01:07:42', '2024-02-29 01:07:42', 1),
(101, 'Wilian Mercado Redondo', 'Mocoa - Putumayo', '3204368585', NULL, NULL, 'Alcalde', 'wmercadoredondo@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 01:11:27', '2024-02-29 01:11:27', 1),
(103, 'Diego Arley de Jesús Guerra Gutiérrez', 'Betania - Antioquia', '3205745832', NULL, NULL, 'Alcalde', 'diegobetania2021@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 01:14:18', '2024-02-29 01:14:18', 1),
(104, 'Elkin Reyes Plato', 'Orba Santander', '3138179195', NULL, NULL, 'Alcalde', 'reyesplataelkin@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 01:16:38', '2024-02-29 01:16:38', 1),
(105, 'Orlando Arturo Marín Atehortúa', 'Hispania - Antioquia', '3117498662', NULL, NULL, 'Alcalde', 'orlando.rector@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 01:19:15', '2024-02-29 01:19:15', 1),
(106, 'Javier Castro Jimenez', 'Galeras- Sucre', '3107191557', NULL, NULL, 'Alcalde', 'javier8428@yahoo.eso', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 01:19:53', '2024-02-29 01:19:53', 1),
(107, 'Mauricio Gamez Hernandez', 'Paramo Santander', '3012390839', NULL, NULL, 'Alcalde', 'contactenos@paramo-santander.gov.co', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 01:22:53', '2024-02-29 01:22:53', 1),
(108, 'Luisa Salazar Gonzales', 'Medellín - Antioquia', '3017163739', NULL, NULL, 'Coordinador gerencia negocios', 'lsalasarg@metrodemedellin.gov.co', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 01:23:54', '2024-02-29 01:23:54', 1),
(110, 'Nury Barragan Suarez', 'Beltran Cundinamarca', '3205786077', NULL, NULL, 'Alcalde', 'nurybarragan2001@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 01:27:13', '2024-02-29 01:27:13', 1),
(111, 'Víctor Alfonso Collazos Cifuentes', 'Cumbre - Valle del Cauca', '3174280700', NULL, NULL, 'Alcalde', 'vicogps1@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 01:29:29', '2024-02-29 01:29:29', 1),
(114, 'Herling Zuced', 'Yacopi Cundinamarca', '3115145971', NULL, NULL, 'Alcaldesa', 'samy2516@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 01:33:40', '2024-03-02 01:40:12', 1),
(115, 'Brando de Jesús Márquez Márquez', 'Pueblo Viejo - Magdalena', '3017253374', NULL, NULL, 'Alcalde', 'brandomarmar.12@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 01:35:04', '2024-02-29 01:35:04', 1),
(116, 'Esneider Artunduaga Daza_', 'Piamonte - Cauca', '3107813025', NULL, NULL, 'Alcalde', 'esneider881128@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 01:35:52', '2024-02-29 01:35:52', 1),
(117, 'José Luis Jaramillo', 'El Rosal - Cundinamarca', '3154004246', NULL, NULL, 'Alcalde', 'jolujara@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 01:39:20', '2024-02-29 01:39:20', 1),
(118, 'Wilmer Gonzalo Ruiz Reatiga', 'Barrancabermeja', '3163403473', NULL, NULL, 'Gerente de proyecto', 'wgruisr@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 01:40:21', '2024-02-29 01:40:21', 1),
(119, 'Héctor Giovanny Escobar Cabrera', 'Venecia - Cundinamarca', '3226859816', NULL, NULL, 'Alcalde', 'despachoalcaldia@venecia-cundinamarca.gov.co', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 01:42:00', '2024-02-29 01:42:00', 1),
(120, 'Eduar Javier Serrano Orjuela', 'Tibacuy - Cundinamarca', '3103265420', NULL, NULL, 'Alcalde', 'alcaldia@tibacuy-cundinamarca.gov.co', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 01:44:50', '2024-02-29 01:44:50', 1),
(121, 'Juan Carlos Romo Perez', 'Altos del Rosario - Bolívar', '3114011263', NULL, NULL, 'Alcalde', 'juanromo@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 01:45:14', '2024-02-29 01:45:14', 1),
(122, 'Enyer Camilo Sanchez Pastor', 'Cabrera - Cundinamarca', '3107851000', NULL, NULL, 'Alcalde', 'alcalde@cabrera-cundinamarca.gov.co', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 01:47:13', '2024-02-29 01:47:13', 1),
(124, 'Juan Carlos Mendoza Rendon', 'Granada Meta', '3105690903', NULL, NULL, 'Alcalde', 'juancarlosmendozarendon@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 01:47:40', '2024-02-29 01:47:40', 1),
(125, 'Miguel Aragon', 'Maicao', '3023422087', NULL, NULL, 'Alcalde', 'miguelf.aragon@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 01:49:03', '2024-02-29 01:49:03', 1),
(126, 'Manuel Fermin Giral Gutierrez_', 'Salamina - Caldas', '3137970429', NULL, NULL, 'Alcalde', 'alcaldia@salamina-caldas.gov.co', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 01:51:25', '2024-02-29 01:51:25', 1),
(127, 'Alba Merly Maranta Contreras', 'Nuevo Colon - Boyacá', '3112680090', NULL, NULL, 'Alcaldesa', 'merlimaranta@yahoo.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 01:52:36', '2024-02-29 01:52:36', 1),
(128, 'Carlos Riveros Lopez', 'Chinchina Caldas', '3116302433', NULL, NULL, 'Alcalde', 'alcalde@chinchina-caldas.gov.co', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 01:55:29', '2024-02-29 01:55:29', 1),
(129, 'Wilber Antonio Sanchez Mosquera_', 'Rio Iro - Chocó', '3114847414', NULL, NULL, 'Alcalde', 'wilbersanchezm@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 01:55:57', '2024-02-29 01:55:57', 1),
(130, 'Eligio Antonio Pestana', 'Tuchin', '3007979122', NULL, NULL, 'Alcalde', 'eligiopestana@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 01:58:24', '2024-02-29 01:58:24', 1),
(131, 'Wilber Antonio Sanchez Mosquera', 'Rio Río - Choco', '3114847414', NULL, NULL, 'Alcalde', 'wilbersanchezm@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 02:01:59', '2024-02-29 02:01:59', 1),
(132, 'Jesus Galindo', 'El reten- magdalena', '3155303137', NULL, NULL, 'Alcalde', 'jgavans@yahoo.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 02:03:00', '2024-02-29 02:03:00', 1),
(133, 'Brando Marquez Marquez', 'Pueblo viejo- Magdalena', '3017253374', NULL, NULL, 'Alcalde', 'brandomarmar.12@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 02:03:58', '2024-02-29 02:03:58', 1),
(134, 'Oscar Javier Avilez Oliva', 'Polonuevo - Atlántico', '3103621473', NULL, NULL, 'Alcalde', 'oscaroliva2496@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 02:04:36', '2024-02-29 02:04:36', 1),
(135, 'Jose Mendez Becerra', 'San Zenón- Magdalena', '3016828602', NULL, NULL, 'Alcalde', 'josemendez364@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 02:05:34', '2024-02-29 02:05:34', 1),
(136, 'Julio Calderón Padilla', 'Usiacurí- Atlántico', '3006468558', NULL, NULL, 'Alcalde', 'abogadocalderon@outlook.com.co', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 02:09:41', '2024-02-29 02:09:41', 1),
(137, 'Edwin Alirio Ceron', 'Cordoba Nariño', '3136958296', NULL, NULL, 'Alcalde', 'edwinceron@yahoo.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 02:11:27', '2024-02-29 02:11:27', 1),
(138, 'Ernesto Zúñiga Osorio', 'Leiva - Nariño', '3127883005', NULL, NULL, 'Alcalde', 'ernestozuniga4099@gmail.com', 'alcaldia@leiva-narino.gov.co', NULL, NULL, NULL, '', NULL, '2024-02-29 02:13:02', '2024-02-29 02:13:02', 1),
(140, 'Rubén Darío Moreno Méndez', 'Málaga - Santander', '3123975412', NULL, NULL, 'Alcalde', 'rudamome@gmail.com', 'despacho@malaga-santander.gov.co', NULL, NULL, NULL, '', NULL, '2024-02-29 02:17:10', '2024-02-29 02:17:10', 1),
(141, 'Robert Erminson Cruz Lasso_', 'Florencia - Cauca', '3145293049', NULL, NULL, 'Alcalde', 'emer2482@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 02:18:07', '2024-02-29 02:18:07', 1),
(142, 'Julio Alberto Romero Camacho', 'Guayata - Boyacá', '3208314297', NULL, NULL, 'Alcalde', 'julio.roca_68@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 02:20:00', '2024-02-29 02:20:00', 1),
(143, 'Miguel Ángel Muñoz Gomez_', 'Puerto Guzman - Putumayo', '3113392857', NULL, NULL, 'Alcalde', 'miangelmugoz@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 02:20:39', '2024-02-29 02:20:39', 1),
(144, 'Wilson Ferney Tello Portilla', 'Potosi Nariño', '3206475548', NULL, NULL, 'Alcalde', 'WilsonFerneyTelloPortilla@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 02:20:57', '2024-02-29 02:20:57', 1),
(145, 'Leidy Patricia Cano Avila', 'Macanal - Boyacá', '3143691791', NULL, NULL, 'Alcalde', 'alcaldia@macanal-boyaca.gov.co', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 02:22:31', '2024-02-29 02:22:31', 1),
(146, 'Miguel Angel Muñoz Gomez', 'Puerto Guzman - Putumayo', '3113392857', NULL, NULL, 'Alcalde', 'miangelmugoz@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 02:24:26', '2024-02-29 02:24:26', 1),
(147, 'Henrique  Ballesteros Peinado', 'Barranco de loba  - Bolívar', '3116007625', NULL, NULL, 'Alcalde', 'henriqueballesterospeinado@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 02:24:26', '2024-02-29 02:24:26', 1),
(148, 'Davis Francisco Morales Castillo', 'Guateque - Boyacá', '3214523000', NULL, NULL, 'Alcalde', 'ing.davidmorales@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 02:27:21', '2024-02-29 02:27:21', 1),
(149, 'Leydi Cano', 'Macana - Boyacá', '3143691791', NULL, NULL, 'Alcalde', 'Alcaldia@macana-boyaca.gov.co', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 02:27:24', '2024-02-29 02:27:24', 1),
(150, 'Julio Romero', 'Guayata - Boyacá', '3208314297', NULL, NULL, 'Alcalde', 'Julio.roca_68@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 02:29:20', '2024-02-29 02:29:20', 1),
(151, 'David Francisco  Morales Castillo', 'Guateque - Boyacá', '3214523000', NULL, NULL, 'Alcalde', 'Ing.davidmorales@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 02:31:55', '2024-02-29 02:31:55', 1),
(152, 'Gabriel Cinfuentes', 'Bogotá- Cundinamarca', '3507942379', NULL, NULL, 'Aliado estrategico', 'gcifuentes@dt-sa.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 02:32:58', '2024-02-29 02:32:58', 1),
(153, 'José Jairo Lopez', 'San Miguel - Putumayo', '3106891358', NULL, NULL, 'Alcalde', 'jairolopez101983@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 02:35:10', '2024-02-29 02:35:10', 1),
(154, 'Eduardo Grajales Gutierrez', 'Roncesvalles - Tolima', '3233926696', NULL, NULL, 'Alcalde', 'eegrajales@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 02:38:15', '2024-02-29 02:38:15', 1),
(155, 'José Jairo Lopez Melo', 'San Miguel (La Dorada) - Putumayo', '3106891358', NULL, NULL, 'Alcalde', 'jairolopez101983@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 02:40:44', '2024-02-29 02:40:44', 1),
(156, 'Jose Jairo Lopez Melo_', 'San Miguel la Dorada Putumayo', '3106891358', NULL, NULL, 'Alcalde', 'Jairolopez101983@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 02:42:04', '2024-02-29 02:42:04', 1),
(158, 'José Ernesto Miranda Márquez', 'Balboa - Risaralda', '3147889515', NULL, NULL, 'Alcalde', 'ernesmira4@gmail.com', NULL, NULL, 'PRIORIDAD', NULL, '', NULL, '2024-02-29 02:43:51', '2024-02-29 02:43:51', 1),
(159, 'Damis Acosta Atencio_', 'Puerto Carcedo Putumayp', '3006143985', NULL, NULL, 'Alcalde', 'putumayodamis@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 02:45:50', '2024-02-29 02:45:50', 1),
(160, 'Damis Acosta Atencio', 'Puerto Carcedo Putumayp', '3006143985', NULL, NULL, 'Alcalde', 'putumayodamis@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 02:45:53', '2024-02-29 02:45:53', 1),
(161, 'Robert Erminson Cruz Lasso', 'Florencia Cauca', '3145293048', NULL, NULL, 'Alcalde', 'emer2482@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 02:49:13', '2024-02-29 02:49:13', 1),
(162, 'Kleyver Oviedo Farfan', 'Palermo - Huila', '3212304127', NULL, NULL, 'Alcalde', 'farfa0509@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 02:52:18', '2024-02-29 02:52:18', 1),
(163, 'Victor Julio Roqueme Quiñonez', 'Aguachica Cesar', '3176594110', NULL, NULL, 'Alcalde', 'Victorjra1897@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 02:53:51', '2024-02-29 02:53:51', 1),
(164, 'Eduardo Andres Cardona Mejia', 'Medellín', '3243716500', NULL, NULL, 'Contador', 'andresca30@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 02:54:59', '2024-02-29 02:54:59', 1),
(165, 'Jorge Vega Rojas_', 'Charalá- San', '3214489923', NULL, NULL, 'Alcalde', 'Alcaldia@charala-santander.gov.co', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 02:55:28', '2024-02-29 02:55:28', 1),
(166, 'Edwin Alirio Cerón Hernández', 'Cordoba - Nariño', '3136958296', NULL, NULL, 'Alcalde', 'edwinceron@yahoo.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 02:59:17', '2024-02-29 02:59:17', 1),
(167, 'Adrian Gutierrez', 'Puerto Salgar Cundinamarca', '3105503378', NULL, NULL, 'Alcalde', 'alcaldia@puertosalgar.gov.co', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 02:59:56', '2024-02-29 02:59:56', 1),
(169, 'Wilson Ferney Tello Portillo', 'Potosí - Nariño', '3206475548', NULL, NULL, 'Alcalde', 'wilsonferneytelloportillo@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 03:01:33', '2024-02-29 03:01:33', 1),
(170, 'Manuel Fermin Giraldo Gutierrez__', 'Salamina Caldas', '3137970429', NULL, NULL, 'Alcalde', 'alcaldia@salamina-caldas.gov.co', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 03:04:50', '2024-02-29 03:04:50', 1),
(172, 'Nolberto Diaz Tobar_', 'Encino - Santander', '3202181830', NULL, NULL, 'Alcalde', 'abogadodiaz2017@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 03:06:19', '2024-02-29 03:06:19', 1),
(173, 'Jorge Andres Hernao Castaño', 'San José Caldas', '3113338116', NULL, NULL, 'Alcalde', 'alcalde@sanjose-caldas.gov.co', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 03:07:57', '2024-02-29 03:07:57', 1),
(175, 'Manuel Fermín Giraldo Gutiérrez', 'Salamina - Caldas', '3137970429', NULL, NULL, 'Alcalde', 'alcaldia@salamina-caldas.gov.co', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 03:08:13', '2024-02-29 03:08:13', 1),
(176, 'Néstor Ospina', 'Viterbo - Caldas', '3122971565', NULL, NULL, 'Alcalde', 'despacho@viterbo-caldas.gov.co', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 03:10:36', '2024-02-29 03:10:36', 1),
(177, 'Lida Ruiz Dominguez', 'Ginebra- Valle del cauca', '3116300250', NULL, NULL, 'Gestora social', 'lidab.rd@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 03:10:43', '2024-02-29 03:10:43', 1),
(178, 'Alberto Montero Molina_', 'Dibulla la Guajira', '3143012143', NULL, NULL, 'Alcalde', 'almonmo13@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 03:12:39', '2024-02-29 03:12:39', 1),
(179, 'Alberto Montero Molina', 'Dibulla la Guajira', '3143012143', NULL, NULL, 'Alcalde', 'almonmo13@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 03:12:41', '2024-02-29 03:12:41', 1),
(180, 'Jorge Herazo', 'San José - Caldas', '3113338116', NULL, NULL, 'Alcalde', 'alcalde@sanjose-caldas.gov.co', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 03:12:44', '2024-02-29 03:12:44', 1),
(182, 'Jeison Alexander Sosa Valencia', 'Puerto lleras - Meta', '3105640152', NULL, NULL, 'Alcalde', 'jeisonsosav@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 03:16:26', '2024-02-29 03:16:26', 1),
(183, 'Jorge Andres Henao Castaño', 'San José Caldas', '3113338116', NULL, NULL, 'Alcalde', 'alcalde@sanjose-caldas.gov.co', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 03:16:58', '2024-02-29 03:16:58', 1),
(185, 'Natalia Rodriguez', 'Bogotá', '3014701562', NULL, NULL, 'Dir. Administrativa EGS SAS', 'gerencia@egssas.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 03:22:36', '2024-02-29 03:22:36', 1),
(186, 'Aide Romero  Gonsalez', 'Padilla Cauca', '3205087335', NULL, NULL, 'Alcaldesa', 'aidesitaromero18@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 03:24:27', '2024-02-29 03:24:27', 1),
(187, 'angel zuñiga', 'puerto melu', '3217591821', NULL, NULL, 'Alcalde', 'anvizu17@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 03:25:32', '2024-02-29 03:25:32', 1),
(188, 'Lyda Beatriz Ruiz Dominguez', 'Ginebra - Valle del Cauca', '3116300250', NULL, NULL, 'Gestora Social', 'lidab.rd@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 03:26:01', '2024-02-29 03:26:01', 1),
(189, 'Miguel Ángel Serrano Cely', 'Mongua - Boyacá', '3114889139', NULL, NULL, 'Alcalde', 'miguelangelserrano3076@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 03:26:07', '2024-02-29 03:26:07', 1),
(190, 'Edinson Patiño Siabatto', 'Monguí - Boyacá', '3142990498', NULL, NULL, 'Alcalde', 'edisonmongui24@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 03:28:13', '2024-02-29 03:28:13', 1),
(191, 'Emmanuel Cañas Barrozo', 'Rio Viejo- Bolivar', '3207449877', NULL, NULL, 'Alcalde', 'emmanuelb1210@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 03:28:47', '2024-02-29 03:28:47', 1),
(192, 'Jesus Fernando Martínez Cardona_', 'Ginebra - Valle del Cauca', '3206969388', NULL, NULL, 'Alcalde', 'jesus_fernando_mc@hotmail.es', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 03:28:48', '2024-02-29 03:28:48', 1),
(194, 'Angel Victorio Zúñiga Ibarguen', 'Medio Baudó - Choco', '3217591821', NULL, NULL, 'Alcalde', 'anvizu17@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 03:31:38', '2024-02-29 03:31:38', 1),
(195, 'Felipe Alberto Cardona Correa_', 'Puerto Guzman - Putumayo', '3208230046', NULL, NULL, 'Asesor Técnico', 'f.cardona@sidingeneria.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 03:34:51', '2024-02-29 03:34:51', 1),
(196, 'Felipe Alberto Cardona Correa', 'Puerto Guzman - Putumayo', '3208230046', NULL, NULL, 'Asesor Tecnico', 'f.cardona@sidingeneria.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 03:35:51', '2024-02-29 03:35:51', 1),
(197, 'Luis Cardoso Tovar_', 'Baraya Huila', '3115991945', NULL, NULL, 'Alcalde', 'Luis.cardoso1489@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 03:36:33', '2024-02-29 03:36:33', 1),
(198, 'Luis Cardoso Tovar', 'Baraya Huila', '3115991945', NULL, NULL, 'Alcalde', 'Luis.cardoso1489@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 03:36:35', '2024-02-29 03:36:35', 1),
(199, 'Nestor Ospina Grajales', 'Viterbo Caldas', '3122971565', NULL, NULL, 'Alcalde', 'despacho@viterbo-caldas.gov.co', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 03:39:44', '2024-02-29 03:39:44', 1),
(200, 'Gabriel Alberto Murillo Argel', 'Zambrano - Bolívar', '3206264271', NULL, NULL, 'Alcalde', 'gamaso74@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 03:48:04', '2024-02-29 03:48:04', 1),
(201, 'Eduardo García', 'Proyecto Ciudades Inteligentes', '3046636967', NULL, NULL, 'Eduardo García', 'eduardo.garcia@hikvision.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 03:49:31', '2024-02-29 03:49:31', 1),
(202, 'Cristian David Barrios Morales', 'Zambrano - Bolívar', '3016995151', NULL, NULL, 'Abogado', 'crisbamar3@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 03:52:41', '2024-02-29 03:52:41', 1),
(203, 'Javier Villanueva Posso', 'Curillo Caquetá', '3125435739', NULL, NULL, 'Alcalde', 'jvillanuevaposso@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 03:54:05', '2024-02-29 03:54:05', 1),
(204, 'Miguel Felipe Aragón Gonzalez_', 'Maicao la Guajira', '3023422087', NULL, NULL, 'Alcalde', 'miguelf.aragon@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 03:57:59', '2024-02-29 03:57:59', 1),
(205, 'Miguel Felipe Aragón Gonzalez', 'Maicao la Guajira', '3023422087', NULL, NULL, 'Alcalde', 'miguelf.aragon@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 03:58:20', '2024-02-29 03:58:20', 1),
(206, 'Ximena Elizabeth Castañeda Molina', 'Muzo - Boyacá', '3154249661', NULL, NULL, 'Alcaldesa', 'alcaldesademuzo@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 03:59:20', '2024-02-29 03:59:20', 1),
(210, 'GUSTAVO VELEZ', 'TULUA VALLE', '3206823101', NULL, NULL, 'Alcalde', 'jundico@tulua.gov.ci', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 04:22:35', '2024-02-29 04:22:35', 1),
(211, 'JULIAN SANCHEZ PERICO', 'SOACHA', '3103230771', NULL, NULL, 'ALCALDE', 'contacteno@alcaldiasoacha.gov.co', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 04:25:14', '2024-02-29 04:25:14', 1),
(212, 'Maria Elena Lozano Martinez', 'Chaguaní - Cundinamarca', '3204470298', NULL, NULL, 'Alcalde', 'elenalozanomar@yahoo.es', 'alcaldia@chaguani-cundinamarca.gov.co', NULL, NULL, NULL, '', NULL, '2024-02-29 18:51:22', '2024-02-29 18:51:22', 1),
(213, 'Hernán Herrera Morales', 'Tocaima - Cundinamarca', '3213055988', NULL, NULL, 'Alcalde', 'hernanherreramorales@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 18:52:43', '2024-02-29 18:52:43', 1),
(214, 'Andrés Felipe Diaz Muñoz_', 'Florida - Nariño', '3156655556', NULL, NULL, 'Alcalde', 'andresfdm10@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 18:56:16', '2024-02-29 18:56:16', 1),
(215, 'Nixon Bayardo Lopez Villareal', 'Ospina - Nariño', '3166270630', NULL, NULL, 'Alcalde', 'nixonlopez.consultor@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 19:00:39', '2024-02-29 19:00:39', 1),
(216, 'Alberto Peláez Henao', 'Marsella - Risaralda', '3104594108', NULL, NULL, 'Alcalde', 'beto.henao28@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 19:07:28', '2024-02-29 19:07:28', 1),
(217, 'Osme Javier Segura Cabeza', 'Roberto Payán - Nariño', '3126694443', NULL, NULL, 'Alcalde', 'jazvier98@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 19:19:08', '2024-02-29 19:19:08', 1),
(218, 'Alfredo Barrios Ortega_', 'Astrea- Cesar', '3233624169', NULL, NULL, 'Alcalde', 'alfredobarrioso@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 19:19:14', '2024-02-29 19:19:14', 1),
(220, 'Diego Fernando Caicedo Angulo', 'Maguí - Nariño', '3206239574', NULL, NULL, 'Alcalde', 'elkaiser350@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 19:21:32', '2024-02-29 19:21:32', 1),
(221, 'Plinio Hernandez Gamba_', 'Siachoque- Boyacá', '3188382947', NULL, NULL, 'Alcalde', 'alcaldia@siachoque-boyaca.gov.co', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 19:22:28', '2024-02-29 19:22:28', 1),
(222, 'Pedro Pablo Carreño Quiñonez', 'Cepita- Santander', '3105601410', NULL, NULL, 'Alcalde', 'ppcq10@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 19:24:34', '2024-02-29 19:24:34', 1),
(223, 'Jorge Patiño Gomez', 'Bosconia - Cesar', '3205425450', NULL, NULL, 'Alcalde', 'jorge.patinog@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 19:24:44', '2024-02-29 19:24:44', 1),
(224, 'Anibal Lopez Lopez', 'Santa Ana- Magdalena', '3107537046', NULL, NULL, 'Alcalde', 'anibaljlopez@yahoo.es', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 19:27:06', '2024-02-29 19:27:06', 1),
(225, 'Helberd Gonzalez Mora', 'Chaparral - Tolima', '3185956242', NULL, NULL, 'Alcalde', 'gonzalez010@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 19:28:37', '2024-02-29 19:28:37', 1),
(226, 'Plinio Hernandez Gamba', 'Siachoque - Boyacá', '3188382947', NULL, NULL, 'Alcalde', 'alcaldia@siachoque-boyaca.gov.co', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 19:31:38', '2024-02-29 19:31:38', 1),
(227, 'Eduar Abril Borrero_', 'Concepción - Santander', '3147630179', NULL, NULL, 'Alcalde', 'eduarabrilborrero@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 19:32:59', '2024-02-29 19:32:59', 1),
(230, 'Pedro Pablo Carreño Quiñones', 'Cepita - Santander', '3105601410', NULL, NULL, 'Alcalde', 'ppcq10@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 19:39:55', '2024-02-29 19:39:55', 1),
(231, 'Darwin Andres Flórez Castañeda', 'Cartagena del Chairá - Caquetá', '3118269564', NULL, NULL, 'Alcalde', 'umatacartagena@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 19:40:05', '2024-02-29 19:40:05', 1),
(232, 'Luis Felipe Rivera Carvajal_', 'El cerrito- Valle del cauca', '3162502500', NULL, NULL, 'Alcalde', 'Luifercar26@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 19:40:16', '2024-02-29 19:40:16', 1),
(233, 'Hector Vizcaino', 'Villanueva - Casanare', '3118104335', NULL, NULL, 'Alacalde', 'hfvizcaino@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 19:46:54', '2024-02-29 19:46:54', 1),
(234, 'David Gomez', 'Cocorna- Antioquia', '3144047604', NULL, NULL, 'Alcalde', 'alcaldia@cocorna-antioquia.gov.co', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 19:50:09', '2024-02-29 19:50:09', 1),
(235, 'David Alejandro Gomez Hoyos_', 'Cocorná - Antioquia', '3105450054', NULL, NULL, 'Alcalde', 'alcaldia@cocorna-antioquia.gov.co', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 19:53:16', '2024-02-29 19:53:16', 1),
(236, 'David Alejandro Gomez Hoyos', 'Cocorná - Antioquia', '3105450054', NULL, NULL, 'Alcalde', 'alcaldia@cocorna-antioquia.gov.co', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 19:53:39', '2024-02-29 19:53:39', 1),
(237, 'José Feliz Martínez Bravo', 'Moñito- Cordoba', '3103886667', NULL, NULL, 'Alcalde', 'josefelixmartinezb@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 19:57:48', '2024-02-29 19:57:48', 1),
(238, 'Omar Pérez Rivera', 'Puerto Libertador- Cordoba', '3205316947', NULL, NULL, 'Funcional Municipal', 'Perez0977@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 19:59:12', '2024-02-29 19:59:12', 1),
(239, 'Wilber Jaime Salamanca Pineda', 'Tuta - Boyacá', '3112228842', NULL, NULL, 'Alcalde', 'wilbersalamanca@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 20:00:39', '2024-02-29 20:00:39', 1),
(240, 'Ramon Rubio Durango', 'Puerto Libertador- Cordoba', '3126171645', NULL, NULL, 'Alcalde', 'alcaldia@puertolibertador-cordoba.gov.co', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 20:01:09', '2024-02-29 20:01:09', 1),
(241, 'Jorge Alonso Arias Zuluaga', 'Tailagua nuevo- Bolivar', '3043835857', NULL, NULL, 'Alcalde', 'Jorgearias2009@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 20:03:45', '2024-02-29 20:03:45', 1),
(242, 'Orlando Ortiz Rangel', 'San Fernando- Bolívar', '3008238070', NULL, NULL, 'Alcalde', 'orlandoalcalde2024.2027@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 20:04:55', '2024-02-29 20:04:55', 1),
(243, 'Hector Fabio Muñoz Briñez', 'Ataco - Tolima', '3183798757', NULL, NULL, 'Alcalde', 'hectorfmb.17@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 20:08:39', '2024-02-29 20:08:39', 1),
(244, 'Salomón Buitrago Fonseca_', 'Sotaquira - Boyacá', '3112640319', NULL, NULL, 'Alcalde', 'buitragofonsecasalomon962@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 20:11:03', '2024-02-29 20:11:03', 1),
(245, 'Arturo Eliecer Toledo Joya', 'Fonseca', '3152162106', NULL, NULL, 'Asesor CTEI', 'estructuradoresasociados@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 20:13:20', '2024-02-29 20:13:20', 1),
(246, 'Gustavo Alfredo Silva Gutierrez', 'Anorí - Antioquia', '3207128156', NULL, NULL, 'Alcalde', 'silvas327@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 20:15:05', '2024-02-29 20:15:05', 1),
(247, 'Jose Manuel Moscote Pana', 'Fonseca', '3012162527', NULL, NULL, 'Asesor', 'estructuradoresasociados@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 20:16:07', '2024-02-29 20:16:07', 1),
(248, 'Jivanildo Bordeth Meriño', 'San Sebastián de Buenavista', '3004176754', NULL, NULL, 'Alcalde', 'alcaldia@sansebastiandebuenavista-magdalena.gov.co', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 20:17:52', '2024-02-29 20:17:52', 1),
(249, 'Federico Alviz Trujillo_', 'La Montañita - Caquetá', '3174312802', NULL, NULL, 'Alcalde', 'ferdericoalviz@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 20:18:20', '2024-02-29 20:18:20', 1),
(250, 'Federico Alviz Trujillo', 'La Montañita - Caquetá', '3174312802', NULL, NULL, 'Alcalde', 'ferdericoalviz@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 20:18:21', '2024-02-29 20:18:21', 1),
(251, 'Nendy Jose Fagua Caina', 'Oicata - Boyaca', '3125230646', NULL, NULL, 'Alcalde', 'nendyfagua050@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 20:25:57', '2024-02-29 20:25:57', 1),
(252, 'William Camilo Barreto Gonzales', 'Cienega - Boyacá', '3235873220', NULL, NULL, 'Alcalde', 'alcaldia@cienega-boyaca.gov.co', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 20:27:45', '2024-02-29 20:27:45', 1),
(259, 'Luis Carlos Chia Hernandez_', 'Cerinza - Boyaca', '3115144480', NULL, NULL, 'Alcalde', 'alcaldia@cerinza-boyaca.gov.co', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 20:54:23', '2024-02-29 20:54:23', 1),
(262, 'Agusto Velásquez Mendez', 'BOGOTA', '3002145715', NULL, NULL, 'SMARTCITY COLOMBIA', 'avelasquez@smartcitycolombia.org', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 21:02:31', '2024-02-29 21:02:31', 1),
(263, 'Hernando Andres vergara Ricardo', 'La Union - Sucre', '3046277182', NULL, NULL, 'Alcalde', 'hernandoandres3075@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 21:05:30', '2024-02-29 21:05:30', 1),
(264, 'Sadith Lascarro Gomez_', 'Piedamó- Cauca', '3102995152', NULL, NULL, 'Funcional municipal', 'sadithlascarro@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 21:06:49', '2024-02-29 21:06:49', 1),
(265, 'VANESSA PAJARO RETAMOZA', 'CARTAGENA', '3108904814', NULL, NULL, 'MODELO', 'vannepajaro@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 21:08:58', '2024-02-29 21:08:58', 1),
(266, 'Anggy Marcela Bastidas Rosales', 'Guaitarilla - Nariño', '3126053432', NULL, NULL, 'Secretaria de Infraestructura', 'inganggybastidas15@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 21:11:05', '2024-02-29 21:11:05', 1),
(267, 'ALVARO ANDRÉS OSORIO VALENCIA', 'PALESTINA CALDAS', '3136447443', NULL, NULL, 'ALCALDE', 'alcaldia@palestina-caldas.gov.co', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 21:13:10', '2024-02-29 21:13:10', 1),
(268, 'Ariel Salazar Sarco', 'Alto baudó - Chocó', '3104407777', NULL, NULL, 'Alcalde', 'asalazarnativo@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 21:13:38', '2024-02-29 21:13:38', 1),
(270, 'SADITH LASCARRO GOMEZ', 'PIENDAMÓ CAUCA', '3102995152', NULL, NULL, 'ALCALDE', 'sadithlascarrogomez@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 21:15:55', '2024-02-29 21:15:55', 1),
(271, 'Álvaro Efraín Rojas Bermúdez', 'La Capilla - Boyacá', '3107730420', NULL, NULL, 'Alcalde', 'contactenos@lacapilla-boyaca.gov.co', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 21:16:55', '2024-02-29 21:16:55', 1),
(272, 'Fabian Nelson Bermudez Correa', 'La Vega - Cundinamarca', '3125926598', NULL, NULL, 'Alcalde', 'bermudezcorrea9@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 21:18:32', '2024-02-29 21:18:32', 1),
(274, 'SEBASTIAN MERCHAN ZULUAGA', 'ARANZAZU CALDAS', '3122928713', NULL, NULL, 'ALCALDE', 'alcalde@aranzazu-caldas.gov.co', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 21:23:03', '2024-02-29 21:23:03', 1),
(275, 'Juvenal Pérez Vega_', 'Paya- Boyacá', '3114879143', NULL, NULL, 'Alcalde', 'juveperez@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 21:23:48', '2024-02-29 21:23:48', 1),
(276, 'Nelson Camacho', 'Agua Azul - Casanares', '3164465965', NULL, NULL, 'Alcalde', 'nelson_camacho12@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 21:25:01', '2024-02-29 21:25:01', 1),
(277, 'JUVENAL PEREZ VEGA', 'PAYA BOYACÁ', '3114879143', NULL, NULL, 'ALCALDE', 'juveperez@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 21:26:09', '2024-02-29 21:26:09', 1),
(278, 'JUAN CAMILO ISAZA GONSALEZ', 'PACORA CALDAS', '3192677819', NULL, NULL, 'ALCALDE', 'alcaldia@pccora-caldas.gov.co', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 21:28:33', '2024-02-29 21:28:33', 1),
(279, 'Esneider Artunduaga Daza', 'Piamonte - Cauca', '3107813025', NULL, NULL, 'Alcalde', 'esneider881128@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 21:29:43', '2024-02-29 21:29:43', 1),
(281, 'Joaquin Ariza Muñoz', 'Nueva Granada- Magdalena', '3117996429', NULL, NULL, 'Alcalde', 'joaquinariza@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 21:34:28', '2024-02-29 21:34:28', 1),
(282, 'Jhon Jairo Gutierrez Pretel', 'El Litoral del San Juan - Choco', '3128856877', NULL, NULL, 'Alcalde', 'litoral_1@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 21:35:22', '2024-02-29 21:35:22', 1),
(283, 'Maribel Acuña', 'Nueva Granada- Magdalena', '3117996429', NULL, NULL, 'Gestora municipal', 'joaquinariza@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 21:35:41', '2024-02-29 21:35:41', 1),
(285, 'Francisco Javier Guzman Figueroa', 'Pradera - Valle del Cauca', '3157970364', NULL, NULL, 'Alcalde', 'fguzman258@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 21:39:30', '2024-02-29 21:39:30', 1);
INSERT INTO `nfc_cards` (`id`, `nombre`, `ciudad`, `celular`, `telefono_opc`, `telefono_opci`, `cargo`, `correo`, `correo_opc`, `pagina`, `pagina_opc`, `pagina_opcional`, `empresa`, `feature`, `created_at`, `updated_at`, `event_id`) VALUES
(286, 'Yosimar Reyes Acevedo', 'Villeta - Cundinamarca', '3104813225', NULL, NULL, 'Alcalde', 'reyesacevedoyosimar@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 21:40:50', '2024-02-29 21:40:50', 1),
(287, 'Diego Ariel Jimenez', 'Guaduas -Cundinamarca', '3144489859', NULL, NULL, 'Alcalde', 'diego123jimenez@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 21:42:40', '2024-02-29 21:42:40', 1),
(288, 'Luis Carlos Chía Hernández', 'Cerinza - Boyacá', '3115144480', NULL, NULL, 'Alcalde', 'alcaldia@cerinza-boyaca.gov.co', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 21:42:45', '2024-02-29 21:42:45', 1),
(289, 'Diana Carolina Cabanillas Valencia', 'Cajibío - Cauca', '3103961853', NULL, NULL, 'Alcaldesa', 'carolina-cabanillas@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 21:48:08', '2024-02-29 21:48:08', 1),
(290, 'Hector Rengifo', 'Cali', '3176551013', NULL, NULL, 'Gte Consultoría BKF', 'gerente.consultoria@bkf.com.co', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 21:50:16', '2024-02-29 21:50:16', 1),
(292, 'William Alejandro Matiz Florez', 'Nocaima - Cundinamarca', '3107597520', NULL, NULL, 'Alcalde', 'alcaldia@nocaima-cundinamarca.gov.co', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 21:58:14', '2024-02-29 21:58:14', 1),
(294, 'Luis Fernando Panquera Torres', 'Arauquita - Arauca', '3202734252', NULL, NULL, 'Alcalde', 'luisfernandopanquera@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 22:04:07', '2024-02-29 22:04:07', 1),
(295, 'Richard Alexander Bernal', 'Ubate - Cundinamarca', '3107996645', NULL, NULL, 'Alcalde', 'arbglo@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 22:12:26', '2024-02-29 22:12:26', 1),
(296, 'David Alejandro Ortiz Garcia_', 'Tausa - Cundinamarca', '3104844805', NULL, NULL, 'Alcalde', 'alcaldia@tausa-cundinamarca.gov.co', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 22:14:56', '2024-02-29 22:14:56', 1),
(298, 'Javier Orlando Montilla Ortiz_', 'Villarrica - Tolima', '3125368181', NULL, NULL, 'Alcalde', 'ingmonti@yahoo.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 22:31:36', '2024-02-29 22:31:36', 1),
(299, 'Carlos Mardonio Tovar Quevedo', 'Pinillos - Bolívar', '3217636634', NULL, NULL, 'Alcalde', 'carlos_tovar_q@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 22:40:06', '2024-02-29 22:40:06', 1),
(300, 'Dainer José Guzman Care', 'Achí - Bolívar', '3126534951', NULL, NULL, 'Alcalde', 'dainergc@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 22:43:57', '2024-02-29 22:43:57', 1),
(301, 'José del Carmen Peña Hernández', 'Pamplona', '3229628612', NULL, NULL, 'Asociación de municipios', 'contacto@acmf.com.co', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 22:47:44', '2024-02-29 22:47:44', 1),
(302, 'Mauricio Hernández Zambrano', 'Coveñas', '3134193627', NULL, NULL, 'Asesor externo', 'mahzmf@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 22:52:23', '2024-02-29 22:52:23', 1),
(303, 'Gustavo Adulto Perez Giraldo', 'Arjona - Bolívar', '3145512444', NULL, NULL, 'Alcalde', 'gperezgiraldo3@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 23:07:06', '2024-02-29 23:07:06', 1),
(304, 'BYRON ANDRES ZAMBRANO ROSAS', 'SANDONA - NARIÑO', '3147937726', NULL, NULL, 'Alcalde', 'andreszambranorosas@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 23:34:13', '2024-02-29 23:34:13', 1),
(305, 'Francisco Cuellar Calderon_', 'Suaza - Huila', '3219884023', NULL, NULL, 'Alcalde', 'crsuaza7@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 23:37:54', '2024-02-29 23:37:54', 1),
(306, 'FRANCISCO CUELLAR CALDERON', 'SUAZA - HUILA', '3219884023', NULL, NULL, 'Alcalde', 'crsuaza@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 23:39:05', '2024-02-29 23:39:05', 1),
(309, 'Joaquin Ariza_', 'Nueva granada - Magdalena', '3116682103', NULL, NULL, 'Alcalde', 'alcaldia@nuevagranada-magdalena.gov.co', NULL, NULL, NULL, NULL, '', NULL, '2024-02-29 23:57:54', '2024-02-29 23:57:54', 1),
(310, 'ANA ARAGON MOTTA', 'BOGOTA - COLOMBIA', '3053557600', NULL, NULL, 'RELACIONISTA', 'ANADELPILARARAGON@GMAIL.COM', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 00:00:01', '2024-03-01 00:00:01', 1),
(311, 'HUGO FERNANDO ARDILA', 'BOGOTA - COLOMBIA', '3188371168', NULL, NULL, 'ASESOR EMBAJADA FINLANDIA', 'HUGO.ARDILA@GMX.COM', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 00:07:55', '2024-03-01 00:07:55', 1),
(312, 'NICK JEFREE MARTINEZ', 'LEJANIAS META', '3229034736', NULL, NULL, 'ALCALDE', 'jefreemartinez@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 00:09:22', '2024-03-01 00:09:22', 1),
(313, 'EDWIN AUGUSTO ALMANZA QUINTERO_', 'CHIQUIZA - BOYACA', '3202787500', NULL, NULL, 'ALCALDE', 'ALMANZAALCALDE2024@GMAIL.COM', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 00:10:01', '2024-03-01 00:10:01', 1),
(314, 'Javier Orlando Montilla Ortiz', 'Villarrica - Tolima', '3125368181', NULL, NULL, 'Alcalde', 'ingemonti@yahoo.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 00:10:22', '2024-03-01 00:10:22', 1),
(315, 'JOHN GERMAN RAMIREZ', 'SAN MARTIN-META', '3203647819', NULL, NULL, 'ALCALDE', 'johnramirez240878@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 00:15:32', '2024-03-01 00:15:32', 1),
(316, 'HUGO ALEXANDER REYES PARRA', 'JENESANO - BOYACA', '3118093257', NULL, NULL, 'ALCALDE', 'HUGO.REYESP@GMAIL.COM', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 00:32:52', '2024-03-01 00:32:52', 1),
(319, 'Wilmar Jamith Quitian Chila', 'Supata - Cundinamarca', '3124291011', NULL, NULL, 'Alcalde', 'wilmarquitian9@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 00:43:23', '2024-03-01 00:43:23', 1),
(320, 'Adrian Gutierrez Gomez', 'Puerto Salgar - Cundinamarca', '3105503378', NULL, NULL, 'Alcalde', 'alcaldia@puertosalgar-cundinamarca.gov.co', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 00:46:23', '2024-03-01 00:46:23', 1),
(321, 'Adriana del Pilar Martinez Ancizar', 'Tiquisio', '3234640726', NULL, NULL, 'Asesora en Política Publica', 'nanita.martinez@uotlook.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 00:53:43', '2024-03-01 00:53:43', 1),
(322, 'Henry Torres_', 'Henry Torres rp', '3178557270', NULL, NULL, 'Mayor', 'henrytorres03@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 00:54:54', '2024-03-01 00:54:54', 1),
(323, 'Stefany Ceron', 'Guaitari- Nariño', '3105903536', NULL, NULL, 'Secretaria agricultura', 'tefyceronp@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 00:56:11', '2024-03-01 00:56:11', 1),
(324, 'Ana Vannesa Navarro Sibaja', 'La Apartada - Cordoba', '3216050289', NULL, NULL, 'Secretaria de Educación', 'seducacion@laapartada.gov.co', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 01:01:58', '2024-03-01 01:01:58', 1),
(326, 'Angie Bastidas', 'Guaitarilla- Nariño', '3126053432', NULL, NULL, 'Secretaria infraesctructura', 'inganybastidas15@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 01:04:13', '2024-03-01 01:04:13', 1),
(327, 'Henry Torres', 'USG', '3178557270', NULL, NULL, 'Mayor Henry Torres', 'henrytorres03@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 01:05:38', '2024-03-01 01:05:38', 1),
(328, 'Cielo Caryn Diaz Amado', 'La Paz - Santander', '3102012365', NULL, NULL, 'Alcaldesa', 'cielojd1@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 01:17:36', '2024-03-01 01:17:36', 1),
(329, 'Nelson Henao', 'San Vicente Antioquia', '3117100994', NULL, NULL, 'Alcalde', 'nelsosanvi@hiotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 01:25:02', '2024-03-01 01:25:02', 1),
(330, 'Adriana Martínez', 'Tiquisio- Bolivar', '3234640726', NULL, NULL, 'Asesora de políticas publicas', 'nanita.martinez@outlook.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 01:26:18', '2024-03-01 01:26:18', 1),
(331, 'MAURICIO GRISALES_', 'Guarne Antioquia', '3007853998', NULL, NULL, 'Alcalde', 'mauricioalcalde2024@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 01:28:39', '2024-03-01 01:28:39', 1),
(332, 'Jhon Feiber Urrea Cifuentes', 'Puerto Boyaca', '3104954014', NULL, NULL, 'Alcalde', 'feiber.urrea@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 01:34:09', '2024-03-01 01:34:09', 1),
(333, 'Jesus Fernando Martinez Cardona', 'Ginebra - Valle del Cauca', '3206969388', NULL, NULL, 'Alcalde', 'jesus_fernando_mc@hotmail.es', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 01:39:47', '2024-03-01 01:39:47', 1),
(334, 'Nelson Jesus Henao Zapata', 'San Vicente - Antioquia', '3117100947', NULL, NULL, 'Alcalde', 'nelsonsanvi@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 01:47:58', '2024-03-01 01:47:58', 1),
(335, 'Joaquin Ariza', 'Nueva Granada - Magdalena', '3116682103', NULL, NULL, 'Alcalde', 'joaquinariza@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 01:48:54', '2024-03-01 01:48:54', 1),
(336, 'Hernando Fontecha Amado', 'Güepsa Santander', '3102662217', NULL, NULL, 'Alcalde', 'alvcalde@guesa-santander.gov.co', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 01:49:48', '2024-03-01 01:49:48', 1),
(337, 'Luis Eduardo Grijalba', 'Santander - Cauca', '3108962531', NULL, NULL, 'Alcalde', 'grijalba1@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 01:50:16', '2024-03-01 01:50:16', 1),
(338, 'Nelsa Iluminada Caro Martinez', 'Bolivar', '3014178145', NULL, NULL, 'Representante de Invias Bolivar', 'iluminadacaro@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 01:51:56', '2024-03-01 01:51:56', 1),
(339, 'Heber Nel Muñoz Yasno', 'San Agustin - Huila', '3204883387', NULL, NULL, 'Alcalde', 'hebernel9416@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 02:02:06', '2024-03-01 02:02:06', 1),
(340, 'Luz Posada Echeverry', 'Quindio', '3148302779', NULL, NULL, 'Asesora de municipios', 'luz.posada@edeq.com.co', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 02:08:39', '2024-03-01 02:08:39', 1),
(341, 'HEBER NEL MUÑOZ YASNO_', 'SAN AGUSTIN', '3204883387', NULL, NULL, 'ALCALDE', 'herbernel9416@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 02:09:26', '2024-03-01 02:09:26', 1),
(342, 'Jose Nicolás Arrieta Guzman_', 'Buenavista Sucre', '3015595195', NULL, NULL, 'Alcalde', 'josenicolas202427@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 02:13:55', '2024-03-01 02:13:55', 1),
(343, 'José Nicolas Arrieta Guzmán', 'Buenavista Sucre', '3015595195', NULL, NULL, 'Alcalde', 'josenicolas202427@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 02:16:07', '2024-03-01 02:16:07', 1),
(345, 'Yojana Andrea Goez Piedrahita', 'Puerto Berrio - Antioquia', '3214122259', NULL, NULL, 'Gestora Social', 'yojanagoez.arquitecta@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 02:21:06', '2024-03-01 02:21:06', 1),
(346, 'Gloria Quiceno Arango', 'Campo Alegre - Huila', '3222121416', NULL, NULL, 'Gestora Social', 'alcaldia@campoalegre-huila.gov.co', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 02:23:21', '2024-03-01 02:23:21', 1),
(347, 'Carlos Andres Carvajal Motta', 'Campo Alegre - Huila', '3167541792', NULL, NULL, 'Jefe de despacho', 'cancamot@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 02:25:47', '2024-03-01 02:25:47', 1),
(348, 'Fabian Alberto Bonett Berdugo', 'Galapa - Atlantico', '3012292876', NULL, NULL, 'Alcalde', 'fbonett1@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 02:27:32', '2024-03-01 02:27:32', 1),
(349, 'Henao Casanova', 'Tumaco - Nariño', '3113933615', NULL, NULL, 'Alcalde', 'felizhenao@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 02:28:31', '2024-03-01 02:28:31', 1),
(350, 'Lina Leon', 'Norte de santander', '3136878609', NULL, NULL, 'Asesora municipal', 'lina.katherine@cens.com.co', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 02:30:49', '2024-03-01 02:30:49', 1),
(351, 'Lenin Alberto Trujillo Gonzalez', 'Yaguará - Huila', '3156027300', NULL, NULL, 'Alcalde', 'lenisatrujillo@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 02:33:27', '2024-03-01 02:33:27', 1),
(352, 'Darwin Alexander Rosales Mora', 'Sabanagrande - Atlantico', '3122164642', NULL, NULL, 'Alcalde', 'rosaledarwin1981@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 02:34:27', '2024-03-01 02:34:27', 1),
(354, 'Carmelo Sanjuanes Medina', 'Neiva', '3229497574', NULL, NULL, 'Ingeniero', 'carmelo.sanjuanes@ingelecgroup.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 02:35:59', '2024-03-01 02:35:59', 1),
(356, 'Victor Alfonso Collazos Cifuentes__', 'La Cumbre - Valle del Cauca', '3174280700', NULL, NULL, 'Alcalde', 'vicogps1@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 02:56:01', '2024-03-01 02:56:01', 1),
(360, 'Cesar Cuervo', 'Caquetá', '3503752794', NULL, NULL, 'Ingeniero Civil - Cantante', 'augustocuervolm11@gmail.com', NULL, 'CUERVOOFICIAL', NULL, NULL, '', NULL, '2024-03-01 03:26:24', '2024-03-01 03:26:24', 1),
(362, 'Andres Felipe Diaz Muñoz', 'La Florida - Nariño', '3156655556', NULL, NULL, 'Alcalde', 'andresfdm10@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 03:35:08', '2024-03-01 03:35:08', 1),
(363, 'Oscar Javier Arias Montaña', 'Ibagué - Tolima', '3164749251', NULL, NULL, 'Empresario', 'oscararias1983@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 03:37:28', '2024-03-01 03:37:28', 1),
(364, 'Fabio Montoya', 'Medellín', '3104636364', NULL, NULL, 'Gerente', 'fabioa.montoya@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 03:45:31', '2024-03-01 03:45:31', 1),
(366, 'Luis Angel Gutierrez Ortiz', 'Carmen de Apicalá - Tolima', '3123277550', NULL, NULL, 'Alcalde', 'angelindustrial22@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 04:05:51', '2024-03-01 04:05:51', 1),
(367, 'Yessica Aragón', 'Carmen de Apicalá - Tolima', '3104923493', NULL, NULL, 'Gestora Social', 'yessiaragon28@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 04:09:06', '2024-03-01 04:09:06', 1),
(368, 'Wilson Gutierrez Montaña', 'Del Espinal - Tolima', '3163816029', NULL, NULL, 'Alcalde', 'wilgumon@yahoo.es', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 04:13:26', '2024-03-01 04:13:26', 1),
(373, 'Pedro Velandia Bejarano', 'Puerto Lopez Meta', '3112091288', NULL, NULL, 'Alcalde', 'pedrovelandiabejarano@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 19:41:08', '2024-03-01 19:41:08', 1),
(374, 'Alex David Restrepo Salazar', 'Titiribí - Antioquia', '3046357020', NULL, NULL, 'Alcalde', 'contactenos@titiribi-antioquia.gov.co', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 19:44:24', '2024-03-01 19:44:24', 1),
(375, 'Jose Fernando Peña_', 'Guamal Meta', '3212149576', NULL, NULL, 'Alcalde', 'fernandopena9@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 19:45:10', '2024-03-01 19:45:10', 1),
(376, 'Jose Fernando Peña', 'Guamal Meta', '3212149576', NULL, NULL, 'Alcalde', 'fernandopena9@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 19:45:13', '2024-03-01 19:45:13', 1),
(377, 'Rubén Darío Castro Andrade', 'Iquira - Huila', '3125233433', NULL, NULL, 'Alcalde', 'alcaldia@iquira-huila.gov.co', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 20:02:41', '2024-03-01 20:02:41', 1),
(378, 'Oscar Camilo Montañez Bohórquez', 'Ventaquemada - Boyacá', '3106085886', NULL, NULL, 'Alcalde', 'arquitectooscar21@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 20:07:44', '2024-03-01 20:07:44', 1),
(379, 'Alexander David Restrepo Salazar', 'Titiribí - Antioquia', '3046357020', NULL, NULL, 'Alcalde', 'contactenos@titiribi-antioquia.gov.co', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 20:07:55', '2024-03-01 20:07:55', 1),
(380, 'Jeisson Alexander Sosa Valencia', 'Puerto Lleras - Meta', '3105640152', NULL, NULL, 'Alcalde', 'jeisonsosav@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 20:14:05', '2024-03-01 20:14:05', 1),
(381, 'Leiner Manuel Cuello Torrecilla', 'Talaigua Nuevo - Bolívar', '3237884166', NULL, NULL, 'Asesor Jurídico', 'jorgearias2009@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 20:14:43', '2024-03-01 20:14:43', 1),
(382, 'Oscar Octavio Cediel Vásquez', 'Chima - Santander', '3152509191', NULL, NULL, 'Alcalde', 'cediel1782@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 20:26:06', '2024-03-01 20:26:06', 1),
(383, 'Catalina Lozano Ortega', 'Bogota', '3212831598', NULL, NULL, 'Líder contenido digital CLARO', 'catalina.lozanoo@claro.com.co', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 20:32:57', '2024-03-01 20:32:57', 1),
(384, 'Leiner Cuello Torrecilla', 'Talaigua nuevo- Bolívar', '3237884166', NULL, NULL, 'Asesor jurídico', 'Leinercuello11011@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 20:35:17', '2024-03-01 20:35:17', 1),
(385, 'Huber Sanchez', 'Abrego- Norte de santander', '3103341928', NULL, NULL, 'Alcalde', 'huberdariosanchez@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 20:45:19', '2024-03-01 20:45:19', 1),
(387, 'Juan Vargas', 'Victoria Caldas', '3143056798', NULL, NULL, 'Alcalde', 'juanvargasosorio64@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 20:49:43', '2024-03-01 20:49:43', 1),
(388, 'PAOLA HERNANDEZ', 'CARTAGENA - BOLIVAR', '3003274426', NULL, NULL, 'MINISTERIO DEL TRABAJO', 'PAOHM3@GMAIL.COM', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 20:49:53', '2024-03-01 20:49:53', 1),
(389, 'Eibys Rivero', 'Bogotá', '3011880420', NULL, NULL, 'Coordinadora Empleabilidad', 'riverolos@yahoo.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 20:53:14', '2024-03-01 20:53:14', 1),
(391, 'Alfredo Barrios Ortega', 'Astrea - Cesar', '3233624169', NULL, NULL, 'Alcalde', 'alfredobarrios@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 20:58:51', '2024-03-01 20:58:51', 1),
(392, 'Sergio Carrillo', 'San Alberto- Cesar', '3157218921', NULL, NULL, 'Asesor presidencial', 'ing.print@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 20:59:22', '2024-03-01 20:59:22', 1),
(393, 'Francisco Guzman', 'Pradera- Valle', '3157970364', NULL, NULL, 'Alcalde', 'fguzman258@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 21:00:14', '2024-03-01 21:00:14', 1),
(394, 'Jose Andres Castañeda', 'Cabuyaro Meta', '3208362514', NULL, NULL, 'Alcalde', 'contactenos@cabuyaro-meta.gov.co', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 21:01:05', '2024-03-01 21:01:05', 1),
(395, 'Fener Ivan Ordoñez Bolaños', 'El Tablon de Gomez - Nariño', '3103876930', NULL, NULL, 'Alcalde', 'fernerivan@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 21:03:28', '2024-03-01 21:03:28', 1),
(397, 'Jose Verner Contreras Yaruro', 'El Carmen Norte de Santander', '3212315103', NULL, NULL, 'Alcalde', 'josevernercontreras@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 21:10:09', '2024-03-01 21:10:09', 1),
(398, 'Huber Dario Sanchez Ortega_', 'Abrego Norte de Santander', '3103341928', NULL, NULL, 'Alcalde', 'huberdariosanchez@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 21:13:18', '2024-03-01 21:13:18', 1),
(399, 'Huber Darío Sanchez Ortega', 'Abrego - Norte de Santander', '3103341928', NULL, NULL, 'Alcalde', 'huberdariosanchez@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 21:17:59', '2024-03-01 21:17:59', 1),
(400, 'Nestor Armando Suarez Cetina_', 'Motavita Boyacá', '3138080845', NULL, NULL, 'Alcalde', 'Nestorsuarez@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 21:18:36', '2024-03-01 21:18:36', 1),
(403, 'Jose Reinel Contreras Yaruro_', 'El Carmen Norte de Santander', '3212315103', NULL, NULL, 'Alcalde', 'josereinelcontreras@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 21:21:39', '2024-03-01 21:21:39', 1),
(404, 'Jose Reinel Contreras Yaruro', 'El Carmen Norte de Santander', '3212315103', NULL, NULL, 'Alcalde', 'josereinelcontreras@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 21:21:39', '2024-03-01 21:21:39', 1),
(405, 'Darwin Rosales', 'Sabanagrande- Atlantico', '3122164642', NULL, NULL, 'Alcalde', 'rosaledarwin1981@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 21:23:49', '2024-03-01 21:23:49', 1),
(406, 'Eduar Abril Borrero', 'Concepción - Santander', '3147630179', NULL, NULL, 'Alcalde', 'eduarabrilborero@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 21:24:19', '2024-03-01 21:24:19', 1),
(407, 'Israel Sandoval Manrique', 'Enciso - Santander', '3115184225', NULL, NULL, 'Alcalde', 'ingcivil1804@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 21:26:26', '2024-03-01 21:26:26', 1),
(408, 'Yorman Suarez Hormaza_', 'Chitaga Norte de Santander', '3219273661', NULL, NULL, 'Alcalde', 'yormansh99@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 21:29:03', '2024-03-01 21:29:03', 1),
(409, 'Esteban Saldarriaga Serpa', 'Pasto - Nariño', '3106223684', NULL, NULL, 'Asesor', 'saldarriaga.esteban@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 21:29:08', '2024-03-01 21:29:08', 1),
(410, 'Yorman Suarez Hormaza', 'Chitaga Norte de Santander', '3219273661', NULL, NULL, 'Alcalde', 'yormansh99@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 21:29:32', '2024-03-01 21:29:32', 1),
(411, 'German Alonso Becerra Lopez', 'Toca - Boyacá', '3114822034', NULL, NULL, 'Alcalde', 'mvzgermanbecerra@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 21:37:02', '2024-03-01 21:37:02', 1),
(412, 'Luis Guillermo Berrio Hernández', 'La Uvita . Boyacá', '3123645411', NULL, NULL, 'Alcalde', 'guillermoberrio@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 21:39:02', '2024-03-01 21:39:02', 1),
(413, 'Diego Armando Mendoza Arenas', 'Santos - Santander', '3107597288', NULL, NULL, 'Alcalde', 'dimendez422@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 21:42:50', '2024-03-01 21:42:50', 1),
(414, 'Luis Alberto Centena Olivares', 'El Peñón - Bolívar', '3003450443', NULL, NULL, 'Alcalde', 'monica.p.martinez76@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 21:43:18', '2024-03-01 21:43:18', 1),
(415, 'Néstor Armando Suarez Cetina', 'Motavita - Boyacá', '3138080845', NULL, NULL, 'Alcalde', 'nestorarsuarez@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 21:45:36', '2024-03-01 21:45:36', 1),
(418, 'Juan Guerrero', 'Guayabal- Cundinamarca', '3103489065', NULL, NULL, 'Director comercial', 'alonso_talento@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 21:57:20', '2024-03-01 21:57:20', 1),
(419, 'Juan Alonzo Guerrero', 'Guayabal - Siquima', '3103489065', NULL, NULL, 'Alcalde', 'alonzoreyespisotalento@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 22:00:37', '2024-03-01 22:00:37', 1),
(420, 'Carlos Javier Julio Torres_', 'Tabio - Cundinamarca', '3118289827', NULL, NULL, 'Alcalde', 'cjtorel@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 22:11:55', '2024-03-01 22:11:55', 1),
(421, 'German Enrique Espitia Cruz_', 'Albán - Cundinamarca', '3108088428', NULL, NULL, 'Alcalde', 'germanespitia23@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 22:14:18', '2024-03-01 22:14:18', 1),
(422, 'Juan Eduardo Arcos', 'Arcops Consultores SAS', '3147855505', NULL, NULL, 'CEO', 'arcops.consultores@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 22:15:16', '2024-03-01 22:15:16', 1),
(423, 'Luis Felipe Rivera Carvajal', 'Cerrito - Santander', '3162502500', NULL, NULL, 'Alcalde', 'luifercar26@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 22:16:19', '2024-03-01 22:16:19', 1),
(424, 'Arbenz Pérez Quintero', 'Valparaiso - Caquetá', '3182804323', NULL, NULL, 'Alcalde', 'arbenzalcalde@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 22:17:46', '2024-03-01 22:17:46', 1),
(425, 'Luis Felipe Romero Diaz', 'Paime - Cundinamarca', '3142728807', NULL, NULL, 'Alcalde', 'paimeparatodos@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 22:17:48', '2024-03-01 22:17:48', 1),
(426, 'Erika Constanza Gonzales Rubio', 'San Juan de Rio seco - Cundinamarca', '3102332776', NULL, NULL, 'Alcalde', 'gonzalezerika61@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 22:20:06', '2024-03-01 22:20:06', 1),
(427, 'Erika Constanza Gonzalez Rubio', 'San Juan De Rio Seco', '3102332776', NULL, NULL, 'Alcaldesa', 'gonzalezerika61@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 22:20:16', '2024-03-01 22:20:16', 1),
(428, 'Carlos Javier Julio Torres', 'Tabio - Cundinamarca', '3118289827', NULL, NULL, 'Alcalde', 'cjtorel@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 22:22:04', '2024-03-01 22:22:04', 1),
(429, 'Leidy Yaqueline Rodriguez Meneses', 'Sapuyes - Nariño', '3108438681', NULL, NULL, 'Alcaldesa', 'yaqueliner.25@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 22:22:17', '2024-03-01 22:22:17', 1),
(430, 'Miguel Benito Granados', 'Topaipi', '3134994968', NULL, NULL, 'Alcalde', 'miguelbegra@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 22:24:12', '2024-03-01 22:24:12', 1),
(431, 'Miguel Horacio Benito Granados', 'Topaipi - Cundinamarca', '3134994968', NULL, NULL, 'Alcalde', 'miguelbejra@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 22:24:32', '2024-03-01 22:24:32', 1),
(432, 'German Enrique Espitia Cruz', 'Albán', '3108088428', NULL, NULL, 'Alcalde', 'germanespitia23@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 22:26:01', '2024-03-01 22:26:01', 1),
(433, 'Jhoanny Oswaldo Garzón Aguas', 'Ubaque - Cundinamarca', '3112375441', NULL, NULL, 'Alcalde', 'visinga67@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 22:26:59', '2024-03-01 22:26:59', 1),
(434, 'Carlos Javier Diaz Sanchez', 'Pacho - Cundinamarca', '3114566788', NULL, NULL, 'Alcalde', 'carlosdiazalcalde2024@gmail.com', NULL, 'TIERRA DE OPORTUNIDADES', NULL, NULL, '', NULL, '2024-03-01 22:28:45', '2024-03-01 22:29:48', 1),
(435, 'Elizabeth Sabogal Velázquez', 'Quetame - Cundinamarca', '3223064956', NULL, NULL, 'Alcalde', 'elizabethsv87@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 22:34:31', '2024-03-01 22:34:31', 1),
(436, 'Daisy Jhoana Moreno Mora', 'Chipaque - Cundinamarca', '3209029107', NULL, NULL, 'Alcaldesa', 'daisymorenom@gmail.com', 'contactenos@chipaque-cundinamarca.gov.co', NULL, NULL, NULL, '', NULL, '2024-03-01 22:37:57', '2024-03-01 22:38:25', 1),
(437, 'Diego Mauricio Grisales Gallego', 'Guarne - Antioquia', '3007853998', NULL, NULL, 'Alcalde', 'diegomauriciogrisalesg@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 22:55:28', '2024-03-01 22:55:28', 1),
(438, 'Pablo Enrique Quicazan Ballesteros', 'Guachetá - Cundinamarca', '3144458456', NULL, NULL, 'Alcalde', 'pabloalcaldia315@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 22:58:19', '2024-03-01 22:58:19', 1),
(439, 'Juan Carlos Robayo Ladino_', 'Lenguazaque - Cundinamarca', '3105571800', NULL, NULL, 'Alcalde', 'alcaldia@lenguazaque-cundinamarca.gov.co', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 23:00:12', '2024-03-01 23:00:12', 1),
(440, 'David Alejandro Ortiz Garcia', 'Tausa - Cundinamarca', '3104844805', NULL, NULL, 'Alcalde', 'alcaldia@tausa-cundinamarca.gov.co', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 23:02:01', '2024-03-01 23:02:01', 1),
(441, 'Gerardo Harvey Duran Cáceres', 'Carcasí - Santander', '3125076157', NULL, NULL, 'Alcalde', 'durancaceresgerardo@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 23:05:26', '2024-03-01 23:05:26', 1),
(442, 'Cesar Danilo Medina Manrique', 'Santivanorte - Boyacá', '3202214909', NULL, NULL, 'Alcalde', 'cerdam23@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 23:08:11', '2024-03-01 23:08:11', 1),
(443, 'Salomón Buitrago Fonseca', 'Sotaquira - Boyacá', '3112640319', NULL, NULL, 'Alcalde', 'buitragofonsecasalomon962@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 23:10:21', '2024-03-01 23:10:21', 1),
(444, 'Wolbert Vargas', 'Soatá - Boyacá', '3115219288', NULL, NULL, 'Alcalde', 'ingwolconst@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 23:15:42', '2024-03-01 23:15:42', 1),
(445, 'Yon Fredy Gonzalez Huertas', 'Úmbita - Boyacá', '3112789290', NULL, NULL, 'Alcalde', 'yfgonzalezh@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 23:18:13', '2024-03-01 23:18:13', 1),
(446, 'Jorge Mikan Salgado', 'El Rosal - Cundinamarca', '3118059284', NULL, NULL, 'Alcalde', 'jorgemikan@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 23:20:21', '2024-03-01 23:20:21', 1),
(447, 'Ana Judith Gamboa', 'Flandes - Tolima', '3204832824', NULL, NULL, 'Alcaldesa', 'contactenos@flandes-tolima.gov.co', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 23:22:19', '2024-03-01 23:22:19', 1),
(448, 'Astrid Pava Yara', 'Natagaima - Tolima', '3148515065', NULL, NULL, 'Alcaldesa', 'pavayaraastrid@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 23:25:20', '2024-03-01 23:25:20', 1),
(449, 'Oscar Hernán Cifuentes Cifuentes', 'Caloto - Cauca', '3183903891', NULL, NULL, 'Alcalde', 'despachoalalcalde@caloto-cauca.gov.co', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 23:27:29', '2024-03-01 23:27:29', 1),
(450, 'Aldemar Cortes Gonzalez', 'Guatavita - Cundinamarca', '3192296797', NULL, NULL, 'Alcalde', 'aldemarcg@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 23:29:34', '2024-03-01 23:29:34', 1),
(451, 'Fabiola Muñoz', 'Soco -  Cundinamarca', '3142940046', NULL, NULL, 'Alcalde', 'fabiolamr072@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 23:50:08', '2024-03-01 23:50:08', 1),
(452, 'Juan Carlos Robayo Ladino', 'Lenguazaque', '3105571800', NULL, NULL, 'Alcalde', 'alcaldia@lenguazaque-cundinamarca.gov.co', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 23:53:16', '2024-03-01 23:53:16', 1),
(453, 'Yon Fredy Gonzales', 'Umbita - Boyacá', '3112789290', NULL, NULL, 'Alcalde', 'yfgonzalezh@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 23:56:49', '2024-03-01 23:56:49', 1),
(454, 'Julio Ernesto Sanabria Guerra	Alcalde_', 'Garagoa - Boyacá', '3125841964', NULL, NULL, 'Alcalde', 'ingjuliosanabria@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-01 23:59:57', '2024-03-01 23:59:57', 1),
(455, 'Julio Ernesto Sanabria Guerra	Alcalde', 'Garagoa - Boyacá', '3125841964', NULL, NULL, 'Alcalde', 'ingjuliosanabria@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-02 00:00:19', '2024-03-02 00:00:19', 1),
(456, 'Marco Alirio Cortes_', 'Barbosa - Santander', '3214518870', NULL, NULL, 'Alcalde', 'marco.cortes@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-02 00:05:53', '2024-03-02 00:05:53', 1),
(457, 'Jorge Vega Rojas', 'Charala - Santander', '3214489923', NULL, NULL, 'Alcalde', 'alcaldia@charalasantander.gov.co', NULL, NULL, NULL, NULL, '', NULL, '2024-03-02 00:10:53', '2024-03-02 00:10:53', 1),
(458, 'Diego Armando Mendoza', 'Los Santos - Santander', '3107597288', NULL, NULL, 'Alcalde', 'dimendez422@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-02 00:12:42', '2024-03-02 00:12:42', 1),
(459, 'Marco Alirio Cortés', 'Barbosa - Santander', '3214518870', NULL, NULL, 'Alcalde', 'marco.cortes@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-02 00:16:09', '2024-03-02 00:16:09', 1),
(460, 'Elkin Alfonso Reyes', 'Oiba - Santander', '3138179195', NULL, NULL, 'Alcalde', 'reyesplataelkin@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-02 00:19:52', '2024-03-02 00:19:52', 1),
(461, 'Sergio Andrés Chacón', 'Ocamonte - Santander', '3004050747', NULL, NULL, 'Alcalde', 'alcaldia@ocamonte-santander.gov.co', NULL, NULL, NULL, NULL, '', NULL, '2024-03-02 00:25:09', '2024-03-02 00:25:09', 1),
(462, 'Cristina Matiz Buitrago', 'Güepsa - Santander', '3156850001', NULL, NULL, 'Gestora Social', 'cristinamatiz17@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-02 00:29:45', '2024-03-02 00:29:45', 1),
(463, 'Zuced Escobar Tovar', 'Yacopi - Cundinamarca', '3115145971', NULL, NULL, 'Alcalde', 'samy2516@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-02 00:31:49', '2024-03-02 00:31:49', 1),
(464, 'Cristian Chavez', 'Coqua - Cundinamarca', '3138061694', NULL, NULL, 'Alcalde', 'cristianchavez14@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-02 00:34:15', '2024-03-02 00:34:15', 1),
(465, 'Julissa Ospina', 'Coqua - Cundinamarca', '3112226500', NULL, NULL, 'Gestora municipal', 'julissa.ospina21@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-02 00:36:36', '2024-03-02 00:36:36', 1),
(466, 'Gina Chaparro', 'Albán', '3187056020', NULL, NULL, 'Gestora municipal', 'ginachaparro3@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-02 00:38:18', '2024-03-02 00:38:18', 1),
(467, 'Nolberto Diaz Tobar', 'Encino - Santander', '3202181830', NULL, NULL, 'Alcalde', 'abogadodiaz2017@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-02 00:39:19', '2024-03-02 00:39:19', 1),
(468, 'YINETH TELLEZ PEREZ', 'LA BELLEZA - SANTANDER', '3202746954', NULL, NULL, 'ALCALDESA', 'yinatepe@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-02 00:47:54', '2024-03-02 00:47:54', 1),
(469, 'SAMUEL JULIAN MARTINEZ PEÑA', 'LA BELLEZA - SANTANDER', '3159286199', NULL, NULL, 'GESTOR SOCIAL', 'julianmartin3@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-02 00:51:54', '2024-03-02 00:51:54', 1),
(470, 'Leonardo Fabio Hernández Cataño', 'La Jauga de Ibirico -Cesar', '3147472302', NULL, NULL, 'Alcalde', 'leonardohernandez4@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-02 00:55:51', '2024-03-02 00:55:51', 1),
(471, 'Willian Tello Sierra', 'El Carmen de Chucurí - Santander', '3208947198', NULL, NULL, 'Alcalde', 'alcalde@elcarmen-santander.gov.co', NULL, NULL, NULL, NULL, '', NULL, '2024-03-02 00:58:40', '2024-03-02 00:58:40', 1),
(472, 'CAMILA PEREZ REMOLINA', 'CARTAGENA', '3246048762', NULL, NULL, 'MODELO DE PROTOCOLO', 'scamipr23@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-02 00:58:50', '2024-03-02 00:58:50', 1),
(473, 'MARIA JOSE JOLY CABARCAS', 'CARTAGENA', '3001159615', NULL, NULL, 'MODELO', 'mariajoly05@gmail.com', NULL, 'https://www.instagram.com/majoly_01?igsh=cDFzMng1NDQ5dmRw', NULL, NULL, '', NULL, '2024-03-02 01:02:50', '2024-03-02 01:02:50', 1),
(474, 'Roberto Jiménez Naranjo', 'Dosquebradas - Risaralda', '3174047757', NULL, NULL, 'Alcalde', 'roberto-jn@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-02 01:10:04', '2024-03-02 01:10:04', 1),
(475, 'MIGUEL CAMPO NUÑEZ', 'CARTAGENA', '3178944075', NULL, NULL, 'MODELO', 'miguel_campo01@hitmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-02 01:14:34', '2024-03-02 01:14:34', 1),
(478, 'Dalianys Pérez García', 'Cartagena', '3116979542', NULL, NULL, 'Auxiliar Contable', 'perezgarciadalianys@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-02 01:25:34', '2024-03-02 01:25:34', 1),
(479, 'JESSICA SALAZAR', 'CARTAGENA', '3006277654', NULL, NULL, 'ASESORA COMERCIAL', 'jsalazard2095@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-02 01:30:04', '2024-03-02 01:30:04', 1),
(480, 'ANDREA VECINO', 'CARTAGENA', '3007835670', NULL, NULL, 'GERENTE', 'gerencia.hom@gmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-02 01:33:41', '2024-03-02 01:33:41', 1),
(481, 'ANGIE PASTRANA', 'CARTAGENA', '3008381159', NULL, NULL, 'MODELO DE PROTOCOLO', 'angie.pastrana23@outlook.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-02 01:37:18', '2024-03-02 01:37:18', 1),
(484, 'SEBASTIAN ARROYO', 'CARTAGENA', '3043694981', NULL, NULL, 'UBER DE CONFIANZA', 'seam2699@hotmail.com', NULL, NULL, NULL, NULL, '', NULL, '2024-03-02 01:52:21', '2024-03-02 01:52:21', 1),
(485, 'Karol Estefanía Henao Martínez', 'Cartagena', '3246614697', NULL, NULL, 'Modelo', 'karolhenao0243@outlook.es', NULL, NULL, NULL, NULL, '', NULL, '2024-03-02 01:59:00', '2024-03-02 01:59:00', 1),
(489, 'Rudbel Castaño', 'Montería – Córdoba', '32370001', NULL, NULL, 'Gerente de cuentas', 'rudbel.castano@tecsersas.com', NULL, 'airesytecnologia.com', 'tecsersas.com', 'hometicsa.com', '', 'storage/featuredsRudbel_Castaño.png', '2024-03-14 00:45:38', '2024-03-14 00:45:38', 4),
(490, 'Jairo Jr Rios Mercado', 'Barranquilla', '3106204640', NULL, NULL, 'Gerente de Cuenta', 'Jairo.rios@tecsersas.com', NULL, 'airesytecnologia.com', 'tecsersas.com', 'hometicsa.com', '', 'storage/featuredsJairo_Jr_Rios_Mercado.png', '2024-03-14 00:59:25', '2024-03-14 00:59:25', 4),
(491, 'Yoermary Hernández Jiménez', 'Cartagena', '323700014', NULL, NULL, 'Gerente de Cuenta', 'yoermary.hernandez@tecsersas.com', NULL, 'airesytecnologia.com', 'tecsersas.com', 'hometicsa.com', '', 'storage/featuredsYoermary_Hernández_Jiménez.png', '2024-03-14 01:03:39', '2024-03-14 01:03:39', 4),
(492, 'Henry Diaz', 'Cundinamarca - Tolima', '3155060028', NULL, NULL, 'Gerente de Cuenta', 'comercial2@airesytecnologia.com', NULL, 'airesytecnologia.com', 'tecsersas.com', 'hometicsa.com', '', 'storage/featuredsHenry_Diaz.png', '2024-03-14 02:18:26', '2024-03-14 02:18:26', 4),
(493, 'Edwin Gutierrez', 'Bogotá', '3142875607', NULL, NULL, 'Gerente de Cuenta', 'edwwin.gutierrez@hometicsa.com', NULL, 'airesytecnologia.com', 'tecsersas.com', 'hometicsa.com', '', 'storage/featuredsEdwin_Gutierrez.png', '2024-03-14 02:33:38', '2024-03-14 02:33:38', 4),
(495, 'Cesar Bagui', 'Bogota', '3118520003', NULL, NULL, 'Coordinador de Proyectos', 'coordinador.proyectos@airesytecnologia.com', NULL, 'tecsersas.com', 'andinainmoviliaria.com', 'hometicsa.com', '', 'storage/featuredsCesar_Bagui.png', '2024-05-01 01:39:14', '2024-05-01 01:39:14', 4),
(504, 'EVENTO CX A WAY OF BUILDING TRUST - PRUEBA', 'Cartagena', '3110000616', '3110000616', '3110000616', 'Pruebas', 'CX@SUMMITEXPERIENCE.COM', NULL, '3110000616', NULL, NULL, 'CUSTOMER EXPERIENCE SUMMIT 2024', NULL, '2024-05-08 19:08:19', '2024-05-08 19:08:19', 3),
(505, 'GIOVANA GASCA', 'BOGOTA', '3100000000', NULL, NULL, 'GERENCIAS', 'giovana.gasca@finanzauto.com.co', NULL, NULL, NULL, NULL, 'FINANZAUTO', NULL, '2024-05-08 20:38:15', '2024-05-08 20:38:15', 3),
(506, 'SUSANA GARCIA', 'BOGOTA', '3100000000', NULL, NULL, 'GERENCIAS', 'susana.garcia@finanzauto.com.co', NULL, NULL, NULL, NULL, 'FINANZAUTO', NULL, '2024-05-08 20:39:58', '2024-05-08 20:39:58', 3),
(507, 'ELIZABETH GERARDO', 'ARUBA', '3100000000', NULL, NULL, 'TEAM LEADER', 'elizabeth.gerardo@setar.aw', NULL, NULL, NULL, NULL, 'SETAR', NULL, '2024-05-08 21:18:25', '2024-05-08 21:18:25', 3),
(508, 'SANDRA MILENA PINTO VASQUEZ', 'BOGOTA', '3156113255', NULL, NULL, 'DIRECTORA DE NEGOCIOS', 'spinto@gomezpinedaabogados.com', NULL, NULL, NULL, NULL, 'GOMEZ PINEDA ABOGADOS', NULL, '2024-05-08 22:36:07', '2024-05-08 22:36:07', 3),
(509, 'ADRIANA CORREA', 'BOGOTA', '5731087532', NULL, NULL, 'GERENTE GENERAL', 'acorrea@meltec.com.co', NULL, NULL, NULL, NULL, 'MELTEC', NULL, '2024-05-08 22:37:12', '2024-05-08 22:37:12', 3),
(510, 'CARLOS ROJAS', 'BOGOTA', '3152613721', NULL, NULL, 'CEO', 'crojas@servicebots.ai', NULL, NULL, NULL, NULL, 'SERVICEBOTS', NULL, '2024-05-08 22:38:51', '2024-05-08 22:38:51', 3),
(511, 'VIRNA CAMPANELLA', 'BOGOTA', '3015490654', NULL, NULL, 'CEO', 'vcampanella@contacta.co', NULL, NULL, NULL, NULL, 'CONTACTA', NULL, '2024-05-08 22:40:39', '2024-05-08 22:40:39', 3),
(512, 'JAIME PEÑA_', 'BOGOTA', '5731230860', NULL, NULL, 'CHANNEL MANAGER LATAM', 'jaime@khomp.com', NULL, NULL, NULL, NULL, 'KHOMP', NULL, '2024-05-08 22:42:19', '2024-05-08 22:42:19', 3),
(513, 'JAIME PEÑA', 'BOGOTA', '5731230860', NULL, NULL, 'CHANNEL MANAGER LATAM', 'jaime@khomp.com', NULL, NULL, NULL, NULL, 'KHOMP', NULL, '2024-05-08 22:42:19', '2024-05-08 22:42:19', 3),
(514, 'JUAN SEBASTIAN DURAN PEÑA', 'BOGOTA', '3209626600', NULL, NULL, 'INGENIERO DE DATOS', 'cienciadedatos@crediservir.com', NULL, NULL, NULL, NULL, 'COOPERATIVA CREDISERVIR', NULL, '2024-05-08 22:44:55', '2024-05-08 22:44:55', 3),
(515, 'JUAN CARLOS PAEZ SANCHEZ', 'BOGOTA', '3187080289', NULL, NULL, 'DIRECTOR DE OFICINA', 'directorce@crediservir.com', NULL, NULL, NULL, NULL, 'CREDISERVIR', NULL, '2024-05-08 22:46:18', '2024-05-08 22:46:18', 3),
(516, 'DALVIER JULIAN DIAZ GONZALEZ', 'BOGOTA', '3185161614', NULL, NULL, 'GERENTE DE DESARROLLO DE NEGOCIO AWS ISV', 'dalvier.diaz@tdsynnex.com', NULL, NULL, NULL, NULL, 'TD SYNNEX', NULL, '2024-05-09 01:30:52', '2024-05-09 01:30:52', 3),
(517, 'MARCELA MONTOYA', 'BOGOTA', '3127510415', NULL, NULL, 'SALES EXECUTIVE', 'mmontoya@sagicc.co', NULL, NULL, NULL, NULL, 'SAGICC', NULL, '2024-05-09 01:33:21', '2024-05-09 01:33:21', 3),
(518, 'LUISA FERNANDA OLARTE', 'Cartagena', '32139288', NULL, NULL, 'EVENTOS', 'comercial@bpro.org', NULL, NULL, NULL, NULL, 'BPRO', NULL, '2024-05-09 01:36:07', '2024-05-09 01:36:07', 3),
(519, 'SILVIA HARTINGER', 'BOGOTA', '493518988', NULL, NULL, 'HEAD OF BUSINESS DEVELOPMENT', 's.hartinger@dialfire.com', NULL, NULL, NULL, NULL, 'DIALFIRE', NULL, '2024-05-09 01:37:33', '2024-05-09 01:37:33', 3),
(520, 'JAMES ALEXIS FRAILE ORTEGON', 'Chile', '3172535624', NULL, NULL, 'Gerente Comercial', 'james.fraile@geobpo.co', NULL, NULL, NULL, NULL, 'GEO BPO', NULL, '2024-05-09 01:39:03', '2024-05-09 01:39:03', 3),
(521, 'JAVIER CHIA', 'BOGOTA', '3002677930', NULL, NULL, 'DIRECTOR SENIOR DE OPERACION', 'javier.chia@foundever.com', NULL, NULL, NULL, NULL, 'FOUNDEVER', NULL, '2024-05-09 04:56:18', '2024-05-09 04:56:18', 3),
(522, 'ISABELA MEJIA', 'MIAMI', '7865740806', NULL, NULL, 'INTERNATIONAL AFFAIRS MANAGUER', 'imejia@mcc.com.co', NULL, NULL, NULL, NULL, 'VADATI', NULL, '2024-05-09 04:59:34', '2024-05-09 04:59:34', 3),
(523, 'XIMENA TAPIAS DELPORTE', 'BOGOTA', '3102365325', NULL, NULL, 'PRESIDENTA EJECUTIVA', 'xitapias@gmail.com', NULL, NULL, NULL, NULL, 'UCEP', NULL, '2024-05-09 05:01:33', '2024-05-09 05:01:33', 3),
(524, 'LINA BETANCUR', 'BOGOTA', '3016464737', NULL, NULL, 'GERENCIAS', 'lbentancur@nukke.co', NULL, NULL, NULL, NULL, 'NUKKE', NULL, '2024-05-09 05:04:42', '2024-05-09 05:04:42', 3),
(525, 'ANDRES MAYA', 'BOGOTA', '3217487854', NULL, NULL, 'DIRECCION DE PROYECTOS', 'andres.maya@konecta.com', NULL, NULL, NULL, NULL, 'KONECTA', NULL, '2024-05-09 05:06:07', '2024-05-09 05:06:07', 3),
(526, 'CAROLINA PADILLA ALVAREZ', 'CUCUTA', '3204149657', NULL, NULL, 'COORDINADORA DE ATENCION', 'carolina.padilla@cens.com.co', NULL, NULL, NULL, NULL, 'CENS', NULL, '2024-05-09 19:53:39', '2024-05-09 19:53:39', 3),
(527, 'WILLIAM AGUIRRE ESTUPIÑAN', 'CUCUTA', '3197242409', NULL, NULL, 'IT', 'william.aguirre@cens.com.co', NULL, NULL, NULL, NULL, 'CENTRALES ELÉCTRICAS CUCUTA', NULL, '2024-05-09 19:56:13', '2024-05-09 19:56:13', 3),
(528, 'PATRICIA HINCAPIE', 'BOGOTA', '3003897010', NULL, NULL, 'GERENCIAS', 'patricia.hincapie@emtelco.com.co', NULL, NULL, NULL, NULL, 'EMTELCO', NULL, '2024-05-09 19:59:13', '2024-05-09 19:59:13', 3),
(529, 'NATALIA GOMEZ', 'MIAMI', '3137659183', NULL, NULL, 'GERENCIAS', 'ngomez@usatruckbrokers.com', NULL, NULL, NULL, NULL, 'USA TRUCK BROKERS', NULL, '2024-05-09 20:01:38', '2024-05-09 20:01:38', 3),
(531, 'ISABEL LONDOÑO', 'BOGOTA', '3002424482', NULL, NULL, 'GERENCIAS', 'isabel.londono@emtelco.com.co', NULL, NULL, NULL, NULL, 'EMTELCO', NULL, '2024-05-09 23:00:36', '2024-05-09 23:00:36', 3),
(532, 'HUGO PATIÑO', 'BOGOTA', '3203185651', NULL, NULL, 'GERENCIAS', 'vivalavida0610@yahoo.es', NULL, NULL, NULL, NULL, 'MARKET MEDIO', NULL, '2024-05-09 23:02:17', '2024-05-09 23:02:17', 3),
(533, 'ANDRES VALDERRAMA', 'BOGOTA', '3042912924', NULL, NULL, 'TEAM LEADER', 'andres.valderrama@tigo.com.co', NULL, NULL, NULL, NULL, 'TIGO', NULL, '2024-05-09 23:09:28', '2024-05-09 23:09:28', 3),
(534, 'YUNERIS JIMENEZ PINEDA', 'BOGOTA', '3012066974', NULL, NULL, 'GERENCIAS', 'yuneris_jimenez@coomeva.com.co', NULL, NULL, NULL, NULL, 'COOMEVA COOPERATIVA', NULL, '2024-05-09 23:24:10', '2024-05-09 23:24:10', 3),
(535, 'NATALIA PINEDA', 'BOGOTA', '3122871250', NULL, NULL, 'TEAM LEADER', 'natalia.pineda@adelantatupago.com', NULL, NULL, NULL, NULL, 'ADVANCE', NULL, '2024-05-09 23:26:23', '2024-05-09 23:26:23', 3),
(536, 'KELLY TATIANA MARQUEZ', 'MEDELLIN', '3213244433', NULL, NULL, 'TEAM LEADER', 'kelly.marquez@infinivirt.com', NULL, NULL, NULL, NULL, 'INFINIVIRT TECHNOLOGIES', NULL, '2024-05-09 23:34:02', '2024-05-09 23:34:02', 3),
(537, 'JUAN DAVID MEJIA BALVIN', 'MEDELLIN', '3117269065', NULL, NULL, 'TEAM LEADER', 'juan.mejia@infinivirt.com', NULL, NULL, NULL, NULL, 'INFINIVIRT TECHNOLOGIES', NULL, '2024-05-09 23:36:08', '2024-05-09 23:36:08', 3),
(538, 'ERNESTO DOUDCHITZKY', 'BOGOTA', '5699238153', NULL, NULL, 'CEO', 'ernesto@chattigo.com', NULL, NULL, NULL, NULL, 'CHATTIGO', NULL, '2024-05-09 23:38:28', '2024-05-09 23:38:28', 3),
(539, 'VICTOR MANUEL TORO HOYOS', 'MEDELLIN', '3006740349', NULL, NULL, 'COMERCIAL', 'victor.toro@comercialcard.com.co', NULL, NULL, NULL, NULL, 'COMERCIAL CARD - PTM', NULL, '2024-05-09 23:40:24', '2024-05-09 23:40:24', 3),
(540, 'SONIA ZAVALA', 'BOGOTA', '962539905', NULL, NULL, 'CEO', 'soni@soniazavala.net', NULL, NULL, NULL, NULL, 'FIVE 9', NULL, '2024-05-09 23:42:02', '2024-05-09 23:42:02', 3),
(541, 'MACA FLOREZ', 'BOGOTA', '3153276301', NULL, NULL, 'GERENCIAS', 'mflorez@ibpla.com', NULL, NULL, NULL, NULL, 'IBP', NULL, '2024-05-09 23:43:44', '2024-05-09 23:43:44', 3),
(542, 'NYDIA VELOZA LOPEZ', 'BOGOTA', '3138541276', NULL, NULL, 'GERENCIAS', 'nydia.veloza@segurosdevidaalfa.com.co', NULL, NULL, NULL, NULL, 'BANCASEGUROS', NULL, '2024-05-09 23:45:53', '2024-05-09 23:45:53', 3),
(543, 'ANGELICA MARIA DE LEON ZABALETA', 'CARTAGENA', '3186901888', NULL, NULL, 'GERENCIAS', 'angelica.deleon@cccartagena.com', NULL, NULL, NULL, NULL, 'GRUPO HEROICA SAS', NULL, '2024-05-09 23:49:40', '2024-05-09 23:49:40', 3),
(544, 'JAZUNARY MARTINEZ', 'Cartagena', '3173647308', NULL, NULL, 'TEAM LEADER', 'jazunary.martinez@cccartagena.com', NULL, NULL, NULL, NULL, 'CENTRO DE CONVENCIONES', NULL, '2024-05-09 23:51:42', '2024-05-09 23:51:42', 3),
(545, 'JUAN CAMILO ESTRADA ZAPATA', 'BOGOTA', '3007042027', NULL, NULL, 'GERENCIAS', 'jcestrada@nethexa.com', NULL, NULL, NULL, NULL, 'NETHEXA', NULL, '2024-05-09 23:53:30', '2024-05-09 23:53:30', 3),
(546, 'MARIA JOSE TORRES', 'BOGOTA', '3205071433', NULL, NULL, 'TEAM LEADER', 'majotorr@bancolombia.com.co', NULL, NULL, NULL, NULL, 'BANCOLOMBIA', NULL, '2024-05-10 00:01:39', '2024-05-10 00:01:39', 3),
(547, 'MARIAM AJAMI PERALTA', 'BOGOTA', '3156251098', NULL, NULL, 'TEAM LEADER', 'majami@tools2power.com', NULL, NULL, NULL, NULL, 'TOOLS2 POWER', NULL, '2024-05-10 00:03:21', '2024-05-10 00:03:21', 3),
(548, 'CRISTIAN OLIVERA', 'BOGOTA', '3100000000', NULL, NULL, 'TEAM LEADER', 'cristian.olivera@gocontact.com', NULL, NULL, NULL, NULL, 'GOCONTACT', NULL, '2024-05-10 00:05:30', '2024-05-10 00:05:30', 3),
(549, 'ANGELICA PULIDO', 'BOGOTA', '3154498454', NULL, NULL, 'TEAM LEADER', 'angelica.pulido@avanzo.co', NULL, NULL, NULL, NULL, 'AVANZO', NULL, '2024-05-10 02:07:22', '2024-05-10 02:07:22', 3),
(550, 'MARCOS PALMA DE ZUBIRIA', 'BARRANQUILLA', '3138707830', NULL, NULL, 'CONSULTOR', 'mpalma@contacta.co', 'marcospalma.consultor@gmail.com', NULL, NULL, NULL, 'CONTACTA', NULL, '2024-05-10 02:10:16', '2024-05-10 02:10:16', 3),
(551, 'YURAI RESTREPO', 'BOGOTA', '3187895359', NULL, NULL, 'LIDER DE PROYECTO', 'yuray.restrepo@livecenter.com.co', NULL, NULL, NULL, NULL, 'LIVE CENTER', NULL, '2024-05-10 02:12:33', '2024-05-10 02:12:33', 3),
(552, 'LEIDY RODAS', 'BOGOTA', '3187895359', NULL, NULL, 'DIRECTORA', 'leidy.rodas@livecenter.com.co', NULL, NULL, NULL, NULL, 'LIVECENTER', NULL, '2024-05-10 02:14:09', '2024-05-10 02:14:09', 3),
(553, 'CARLOS HERNAN CARDOSO', 'BOGOTA', '3122457172', NULL, NULL, 'GERENCIAS', 'ccardoso@bpogs.com', NULL, NULL, NULL, NULL, 'BPO GLOBAL SERVICES', NULL, '2024-05-10 06:01:11', '2024-05-10 06:01:11', 3),
(554, 'JOHANN DAVID CASTRO', 'BOGOTA', '3155496706', NULL, NULL, 'GERENCIAS', 'jcastro@bpogs.com', NULL, NULL, NULL, NULL, 'BPO GLOBAL SERVICES', NULL, '2024-05-10 06:05:27', '2024-05-10 06:05:27', 3),
(555, 'CATHERIN FORERO', 'BOGOTA', '3135691608', NULL, NULL, 'GERENCIAS', 'catherin.forero@aldeamo.com', NULL, NULL, NULL, NULL, 'AXESNET', NULL, '2024-05-10 06:08:07', '2024-05-10 06:08:07', 3),
(556, 'YENITH LORENA CIFUENTES GUEVARA', 'BOGOTA', '3173818534', NULL, NULL, 'GERENCIAS', 'yelocigue_86@hotmail.com', NULL, NULL, NULL, NULL, 'CREDISERVIR', NULL, '2024-05-10 06:10:54', '2024-05-10 06:10:54', 3),
(557, 'MANUEL OBANDO MENDEZ', 'BOGOTA', '3103482383', NULL, NULL, 'GERENCIAS', 'manuelg_obando@coomeva.com.co', NULL, NULL, NULL, NULL, 'COOMEVA MEDICINA', NULL, '2024-05-11 21:11:33', '2024-05-11 21:11:33', 3),
(558, 'TATIANA GUERRERO', 'BOGOTA', '3005740821', NULL, NULL, 'GERENCIAS', 'tatianaguerrero@hotmail.com', NULL, NULL, NULL, NULL, 'SOMOS CONSULTORES', NULL, '2024-05-12 04:18:32', '2024-05-12 04:18:32', 3),
(559, 'BUDYS WONG', 'BOGOTA', '3167408849', NULL, NULL, 'GERENCIAS', 'bwong@uniban.com.co', NULL, NULL, NULL, NULL, 'UNIBAN', NULL, '2024-05-12 04:19:36', '2024-05-12 04:19:36', 3),
(560, 'ANGELA SANTANA', 'BOGOTA', '3007041014', NULL, NULL, 'GERENCIAS', 'angela.santa@talento.cluod', NULL, NULL, NULL, NULL, 'TALENTO CLOUD', NULL, '2024-05-12 04:20:30', '2024-05-12 04:20:30', 3),
(561, 'DIANA MARCELA CARDOZO', 'BOGOTA', '3007041014', NULL, NULL, 'GERENCIAS', 'diana_cardozo@ajg.com', NULL, NULL, NULL, NULL, 'ARTHUR J GALLAGUER', NULL, '2024-05-12 04:22:00', '2024-05-12 04:22:00', 3),
(562, 'RUBIELA URQUIJO', 'BOGOTA', '3102444873', NULL, NULL, 'TEAM LEADER', 'rubiela.urquijo@vitalis.com.co', NULL, NULL, NULL, NULL, 'VITALIS', NULL, '2024-05-12 04:22:51', '2024-05-12 04:22:51', 3),
(563, 'CRISTINA OTERO', 'BOGOTA', '3007041014', NULL, NULL, 'TEAM LEADER', 'cristinaisabeloteroacevedo@gmail.com', NULL, NULL, NULL, NULL, 'MISION ACADEMICA', NULL, '2024-05-12 04:25:48', '2024-05-12 04:25:48', 3),
(564, 'NATALY RAMIREZ', 'BOGOTA', '3202021899', NULL, NULL, 'GERENCIAS', 'cobaservices@gmail.com', NULL, NULL, NULL, NULL, 'COBA SERVICES', NULL, '2024-05-12 04:26:59', '2024-05-12 04:26:59', 3),
(565, 'MARIA GARCIA', 'BOGOTA', '3008139345', NULL, NULL, 'GERENCIAS', 'mgarcia@arquitecturadeltalento.com', NULL, NULL, NULL, NULL, 'ARQUITECTURA DEL TALENTO', NULL, '2024-05-12 04:28:13', '2024-05-12 04:28:13', 3),
(566, 'ALEJANDRA GANTIVA', 'MEDELLIN', '3206926371', NULL, NULL, 'GERENCIAS', 'alejandra.gantiva@gofluent.com', NULL, NULL, NULL, NULL, 'GO FLUENT', NULL, '2024-05-12 04:29:07', '2024-05-12 04:29:07', 3),
(567, 'MARTHA ELENA MACHADO MONCAYO', 'BOGOTA', '3182617515', NULL, NULL, 'GERENCIAS', 'gerencia@laboramos.net', NULL, NULL, NULL, NULL, 'LABORAMOS SAS', NULL, '2024-05-12 04:30:08', '2024-05-12 04:30:08', 3),
(568, 'MARCO AVILA', 'Cartagena', '3212416392', NULL, NULL, 'ABOGADO', 'yuliet.daza@visionymarketing.com.co', NULL, NULL, NULL, NULL, 'LISTOS SAS', NULL, '2024-05-12 04:31:20', '2024-05-12 04:31:20', 3);
INSERT INTO `nfc_cards` (`id`, `nombre`, `ciudad`, `celular`, `telefono_opc`, `telefono_opci`, `cargo`, `correo`, `correo_opc`, `pagina`, `pagina_opc`, `pagina_opcional`, `empresa`, `feature`, `created_at`, `updated_at`, `event_id`) VALUES
(569, 'JUAN CARLOS MORENO QUINTERO', 'BOGOTA', '3104034842', NULL, NULL, 'GERENCIAS', 'juancmoreno@contactamossas.com.co', NULL, NULL, NULL, NULL, 'CONTACTAMOS S.A.S', NULL, '2024-05-12 04:32:26', '2024-05-12 04:32:26', 3),
(570, 'DIANA MARYURI DIAZ', 'BARRANQUILLA', '3004449298', NULL, NULL, 'GERENCIAS', 'subgerenciaadministrativa@maxempleos.com', NULL, NULL, NULL, NULL, 'MAXEMPLEOS SAS', NULL, '2024-05-12 04:33:30', '2024-05-12 04:33:30', 3),
(573, 'Juan Pablo Rios Bernate', 'BOGOTA D.C', '3007911149', NULL, NULL, 'JEFE DE LICITACIONES', 'licitaciones@airesytecnologia.com', 'dep.licitaciones@tecsersas.com', NULL, NULL, NULL, 'aires y tecnología', 'storage/featuredsJuan_Pablo_Rios_Bernate.png', '2024-05-29 01:03:36', '2024-05-29 01:03:36', 4),
(574, 'Sandra Sanchez', 'Bogotá', '3239962032', NULL, NULL, 'Ejecutivo de Cuenta', 'marketing@rscautomotriz.co', NULL, 'tecsersas.com', NULL, NULL, 'Rsc Automotriz', NULL, '2024-05-29 18:22:36', '2024-05-29 18:22:36', 4),
(575, 'Luis Lorduy Hernandez', 'Bogotá', '3103194439', NULL, NULL, 'Gerente  Asuntos Publicos', 'gerente.asuntospublicos@admingroupsas.com', NULL, 'tecsersas.com', NULL, NULL, 'AdminGroup', 'storage/featuredsLuis_Lorduy_Hernandez.png', '2024-06-06 19:03:20', '2024-06-06 19:03:20', 4),
(577, 'Hasson Javier Gonzalez', 'Bogotá D.C.', '3213184404', NULL, NULL, 'Director Comercial', 'javier.gonzalez@airesytecnologia.com', NULL, 'tecsersas.com', NULL, NULL, 'AdmiGroup', NULL, '2024-06-07 19:36:33', '2024-06-07 19:36:33', 4),
(578, 'Juan Pablo Hurtado', 'Medellín / Antioquia', '3002057325', NULL, NULL, 'Comercial', 'juan.hurtado@admingroupsas.com', NULL, NULL, NULL, NULL, 'Admigroup', 'storage/featuredsJuan_Pablo_Hurtado.png', '2024-06-08 03:30:00', '2024-06-08 03:30:00', 4),
(580, 'Cathy Viatela Devia', 'Bogotá', '3158197274', NULL, NULL, 'Gerente Comercial', 'c.viatela@bkf.com.co', NULL, 'https://bkf.com.co', NULL, NULL, 'BKF', 'storage/featuredsCathy_Viatela_Devia.png', '2024-06-11 19:08:32', '2024-06-11 19:08:32', 4),
(581, 'Hector Fabio Rengifo Urbano', 'Cali', '3176551013', NULL, NULL, 'Gerente de Consultoria', 'gerente.consultoria@bkf.com.co', NULL, 'bkf.com.co', NULL, NULL, 'BKF', NULL, '2024-06-12 19:04:50', '2024-06-12 19:04:50', 4),
(582, 'YAMIL AMAYA', 'Guajira', '3126150484', NULL, NULL, 'VOCAL DE CONTROL SERVICIOS PUBLICOS', 'vocalalbania@gmail.com', NULL, NULL, NULL, NULL, 'VOCAL DE CONTROL SERVICIOS PUBLICOS ALBANIA', NULL, '2024-06-26 20:56:21', '2024-06-26 20:56:21', 5),
(583, 'JAIRO PINZON', 'CAJICA', '3118120491', NULL, NULL, 'GERENCIA', 'empresa_epc@epc.cajica.gov.co', NULL, NULL, NULL, NULL, 'EPS CAJICA', NULL, '2024-06-27 01:04:47', '2024-06-27 01:04:47', 5),
(584, 'YOANIS GONZALEZ', 'BOGOTA', '3138715152', NULL, NULL, 'GERENCIA', 'Yoanygonzaleztrigos06@gmail.com', NULL, NULL, NULL, NULL, 'ECOEQUIPOS SAS', NULL, '2024-06-27 01:49:01', '2024-06-27 01:49:01', 5),
(585, 'LIBARDO RAMON POLANIA', 'CAQUETA', '3186295663', NULL, NULL, 'Secretaria General', 'Libardo.ramon@electrocaqueta.com.co', NULL, NULL, NULL, NULL, 'ELECTRIFICADORA DE CAQUETA', NULL, '2024-06-27 02:21:31', '2024-06-27 02:21:31', 5),
(586, 'FABIO SABTIAGO', 'AGUACHICA', '3183901356', NULL, NULL, 'EMPRESAS PUBLICAS', 'sistemas@esp-aguachica-cesar.gov.co', NULL, NULL, NULL, NULL, 'EMPRESAS PUBLICAS', NULL, '2024-06-27 03:26:52', '2024-06-27 03:26:52', 5),
(587, 'LUIS HENRRY', 'BOGOTA', '3103110897', NULL, NULL, 'EMPRESAS PUBLICAS ACUEDUCTO Y ALCANTARILLADO', 'luishgonzalez1964@gmail.com', NULL, NULL, NULL, NULL, 'EMPRESAS PUBLICAS ACUEDUCTO Y ALCANTARILLADO', NULL, '2024-06-27 03:28:51', '2024-06-27 03:28:51', 5),
(588, 'JUAN F CASTEÑADA', 'BOGOTA', '3232181667', NULL, NULL, 'SINTRAEMDES', 'jhon.fer.castaneda@hotmail.com', NULL, NULL, NULL, NULL, 'SINTRAEMDES', NULL, '2024-06-27 03:30:29', '2024-06-27 03:30:29', 5),
(589, 'ALVARO ALVAREZ DIAZ', 'SAGHUN', '3126261619', NULL, NULL, 'EMPRESAS PUBLICAS', 'aa@empresaspublicas', NULL, NULL, NULL, NULL, 'EMPRESAS PUBLICAS', NULL, '2024-06-27 03:32:57', '2024-06-27 03:32:57', 5),
(590, 'HENRY JAVIER PALACIO', 'CUNDINAMARCA', '3124479944', NULL, NULL, 'C.A.R CUNDINAMARCA', 'hpalaciosc@car.gov.co', NULL, NULL, NULL, NULL, 'C.A.R CUNDINAMARCA', NULL, '2024-06-27 03:35:09', '2024-06-27 03:35:09', 5),
(591, 'GERMAN RODRIGUEZ', 'BUCARAMANGA', '3127055192', NULL, NULL, 'ACUEDUCTO METROPOLITANO', 'g.g@acueducto', NULL, NULL, NULL, NULL, 'ACUEDUCTO METROPOLITANO', NULL, '2024-06-27 03:45:12', '2024-06-27 03:45:12', 5),
(592, 'GIONANI GONZALES', 'BOGOTA', '3138715152', NULL, NULL, 'EQUIPO SAS', 'GIO@GMAIL.COM', NULL, NULL, NULL, NULL, 'EQUIPO SAS', NULL, '2024-06-27 03:48:25', '2024-06-27 03:48:25', 5),
(593, 'CATALINA P', 'BOGOTA', '3100000000', NULL, NULL, 'COBRE', 'catalinap@cobre.co', NULL, NULL, NULL, NULL, 'COBRE', NULL, '2024-06-27 03:49:17', '2024-06-27 03:49:17', 5),
(594, 'Edgar Castro', 'Mariquita', '3158709444', NULL, NULL, 'Gerente', 'hefar40@hotmail.com', NULL, NULL, NULL, NULL, 'Empresa de Servicios Publicos de Mariquita', NULL, '2024-06-27 03:51:38', '2024-06-27 03:51:38', 5),
(595, 'VICTOR GARZON', 'BOGOTA', '3132885302', NULL, NULL, 'EMPRESAS PUBLICAS CUNDINAMARCA', 'victor.garzon@epc.com.co', NULL, NULL, NULL, NULL, 'EMPRESAS PUBLICAS CUNDINAMARCA', NULL, '2024-06-27 04:08:31', '2024-06-27 04:08:31', 5),
(596, 'LILIANA GONZALEZ', 'Guajira', '3225267025', NULL, NULL, 'AIRES', 'lilianagonzalezipuana@gmail.com', NULL, NULL, NULL, NULL, 'AIRES', NULL, '2024-06-27 18:49:36', '2024-06-27 18:49:36', 5),
(597, 'WILSON GOMEZ', 'Zipaquira', '3100000000', NULL, NULL, 'EP ZIPAQUIRA', 'wgomez@epz.gov.co', NULL, NULL, NULL, NULL, 'EP ZIPAQUIRA', NULL, '2024-06-27 18:55:48', '2024-06-27 18:55:48', 5),
(598, 'ZULLY TORRES', 'BOGOTA', '3106801440', NULL, NULL, 'Camara Colombiana Energía', 'Comercial@ccenergia.org.co', NULL, NULL, NULL, NULL, 'Camara Colombiana Energía', NULL, '2024-06-27 19:39:11', '2024-06-27 19:39:11', 5),
(599, 'MARTIN ROJAS CONTRERAS', 'PIE DE CUESTA', '3114453968', NULL, NULL, 'VOCAL DE SERVICIO', 'marrocon59@hotmail.com', NULL, NULL, NULL, NULL, 'VOCAL DE SERVICIO', NULL, '2024-06-27 19:41:33', '2024-06-27 19:41:33', 5),
(600, 'ALFREDO BORJAS QUINTERO', 'PIE DE CUESTA', '3209113507', NULL, NULL, 'VOCAL DE CONTROL SERVICIOS PUBLICOS', 'albarajas01@hotmail.com', NULL, NULL, NULL, NULL, 'VOCAL DE CONTROL SERVICIOS PUBLICOS ALBANIA', NULL, '2024-06-27 19:42:53', '2024-06-27 19:42:53', 5),
(601, 'LISBETH MANJARREZ', 'TURBACO', '3205358320', NULL, NULL, 'SERVICIO PUBLICOS', 'Lismanvel@gmail.com', NULL, NULL, NULL, NULL, 'SERVICIO PUBLICOS', NULL, '2024-06-27 20:20:33', '2024-06-27 20:20:33', 5),
(602, 'SANDRA TOVAR', 'BOGOTA', '3128500845', NULL, NULL, 'S&E CIA', 'sandra.tovar@sye.com.co', NULL, NULL, NULL, NULL, 'S&E CIA', NULL, '2024-06-27 20:22:18', '2024-06-27 20:22:18', 5),
(603, 'manuel jose garcia pabon', 'santa marta', '3018110807', NULL, NULL, 'ejecutivo de cuentas', 'comercial@sinergialogistica.co', NULL, NULL, NULL, NULL, 'sinergia logistica sas', NULL, '2024-06-27 21:35:09', '2024-06-27 21:35:09', 5),
(604, 'wilmar alfonso chavarria gonzalez', 'bogota', '3232089107', NULL, NULL, 'mercado corporativo', 'wilmar.chavarria@4-72.com.co', NULL, NULL, NULL, NULL, '4 72', NULL, '2024-06-27 21:47:16', '2024-06-27 21:47:16', 5),
(606, 'JUAN A. GARCIA ESTRADA', 'BOGOTA', '3135091930', NULL, NULL, 'PRESIDENTE 4-72', 'juan.garcia@4-72.com.co', NULL, NULL, NULL, NULL, '4 72', NULL, '2024-06-27 22:02:32', '2024-06-27 22:02:32', 5),
(608, 'GUILLERMO PALACIO VEGA', 'BOGOTA', '314701570', NULL, NULL, 'VICEPRESINDENTE  4-72', 'guillermo.palacio@4-72.com.co', NULL, NULL, NULL, NULL, '4 72', NULL, '2024-06-27 22:08:35', '2024-06-27 22:08:35', 5),
(609, 'LUIS GOMEZ', 'BARRANQUILLA', '3184001715', NULL, NULL, 'GERENTE CYRRUS', 'luis@cyrruscs.com', NULL, NULL, NULL, NULL, 'CYRRUS', NULL, '2024-06-28 02:33:54', '2024-06-28 02:33:54', 5),
(610, 'MACARIO PEREA HURTADO', 'BOGOTA', '3103334912', NULL, NULL, 'ADMINISTRADOR PREDIAL', 'macario1964@yahoo.com', NULL, NULL, NULL, NULL, 'ACUEDUCTO DE BOGOTA', NULL, '2024-06-28 03:12:42', '2024-06-28 03:12:42', 5),
(611, 'LUIS ENRIQUE TRUJILLO LOPEZ', 'FLORENCIA CAQUETA', '3202718732', NULL, NULL, 'GERENTE ELECTROCAQUETA', 'luis.trujillo@electrocaqueta.com.co', NULL, NULL, NULL, NULL, 'ELECTROCAQUETA', NULL, '2024-06-28 03:19:36', '2024-06-28 03:19:36', 5),
(612, 'RONALD LEANDRO ROA AGUILLON', 'BOGOTA', '3206326672', NULL, NULL, 'KAM GOBIERNO ZONA CENTRO', 'rroa@navitrans.com.co', NULL, NULL, NULL, NULL, 'NAVITRANS', NULL, '2024-06-28 20:56:06', '2024-06-28 20:56:06', 5),
(613, 'MONICA ROBAYO', 'BOGOTA', '3212197592', NULL, NULL, 'GERENTE COMERCIAL', 'myrobayo@gmail.com', NULL, NULL, NULL, NULL, 'ALMACONTACT', NULL, '2024-06-28 21:09:19', '2024-06-28 21:09:19', 5),
(614, 'Dolcey Reales', 'Cartagena', '3008007023', NULL, NULL, 'Migración', 'Dorcho587@yahoo.com.mx', NULL, NULL, NULL, NULL, 'Migración', NULL, '2024-06-29 01:08:31', '2024-06-29 01:08:31', 5),
(615, 'Luz Marina Franco', 'BOGOTA', '3172666373', NULL, NULL, 'Revista Congreso', 'Luzmafranco2004@yahoo.com.ar', NULL, NULL, NULL, NULL, 'SINAGRES', NULL, '2024-06-29 01:10:39', '2024-06-29 01:10:39', 5),
(616, 'Vivian Mogollón', 'Cartagena', '3002576122', NULL, NULL, 'Fund. Funedic', 'Vivitaty1034@hotmail.com', NULL, NULL, NULL, NULL, 'Fund. Funedic', NULL, '2024-06-29 01:11:48', '2024-06-29 01:11:48', 5),
(617, 'Janneth Deodela San Clemente', 'BOGOTA', '3100000000', NULL, NULL, 'Qi Energía', 'Gerencia@qienergy.co', NULL, NULL, NULL, NULL, 'Qi Energía', NULL, '2024-06-29 01:12:50', '2024-06-29 01:12:50', 5),
(618, 'Helio Dávila', 'LETICIA', '3107927164', NULL, NULL, 'Empresa Publica Leticia ENAM', 'Helio.hernando@gmail.com', NULL, NULL, NULL, NULL, 'Empresa Publica Leticia ENAM', NULL, '2024-06-29 01:13:53', '2024-06-29 01:13:53', 5),
(619, 'Wilton Flórez', 'Santander', '3174305628', NULL, NULL, 'Electrifocadora Santander', 'Wilton.florez@essa.com.co', NULL, NULL, NULL, NULL, 'Electrifocadora Santander', NULL, '2024-06-29 01:15:00', '2024-06-29 01:15:00', 5),
(620, 'Cesar Adolfo Pérez Ramírez', 'BOGOTA', '79039606', NULL, NULL, 'consul bilorusia', 'Consulcp@consuldobelaruscol.com.co', NULL, NULL, NULL, NULL, 'Consul Honorarios Belarus', NULL, '2024-06-29 01:16:28', '2024-06-29 01:16:28', 5),
(621, 'Nicolás Klein', 'BOGOTA', '3100000000', NULL, NULL, 'Schrader Camargo', 'Nklein@shradercargo.com', NULL, NULL, NULL, NULL, 'Schrader Camargo', NULL, '2024-06-29 01:17:36', '2024-06-29 01:17:36', 5),
(622, 'Daniel Rico', 'Cartagena', '3004037264', NULL, NULL, 'Alcaldía de Cartagena', 'Danielricogarcia@yahoo.es', NULL, NULL, NULL, NULL, 'Alcaldía de Cartagena', NULL, '2024-06-29 01:23:16', '2024-06-29 01:23:16', 5),
(623, 'Víctor Peña', 'BOGOTA', '3153199852', NULL, NULL, 'GECOLSA', 'Victor_pena@gecolsa.com.co', NULL, NULL, NULL, NULL, 'GECOLSA', NULL, '2024-06-29 01:25:50', '2024-06-29 01:25:50', 5),
(624, 'Doris Bray', 'BARRANQUILLA', '3004367935', NULL, NULL, 'Infinitum SCI Tech', 'Dbray@infinitumscitch.com', NULL, NULL, NULL, NULL, 'Infinitum SCI Tech', NULL, '2024-06-29 19:57:20', '2024-06-29 19:57:20', 5),
(625, 'Jorge Leal', 'Ibague', '3015302322', NULL, NULL, 'Alcaldía Ibagué', 'Cambioclimatico@ibague.gov.co', NULL, NULL, NULL, NULL, 'Dirección Ambiental', NULL, '2024-06-29 19:58:30', '2024-06-29 19:58:30', 5),
(626, 'Edinson Valencia', 'Medellín', '3006405500', NULL, NULL, 'Excelec', 'E.valencia@excelec.com', NULL, NULL, NULL, NULL, 'Excelec', NULL, '2024-06-29 20:00:25', '2024-06-29 20:00:25', 5),
(627, 'Jhonatan Díaz López', 'CUCUTA', '3162726202', NULL, NULL, 'Presidente CTC Cucuta', 'Jonathandiaz09@hotmail.es', NULL, NULL, NULL, NULL, 'Presidente CTC Cucuta', NULL, '2024-06-29 20:01:29', '2024-06-29 20:01:29', 5),
(628, 'Luis Alejandro Contreras', 'CUCUTA', '3162730526', NULL, NULL, 'Aguas Kpital Cucuta', 'Lual0705@hotmail.com', NULL, NULL, NULL, NULL, 'Aguas Kpital Cucuta', NULL, '2024-06-29 20:03:13', '2024-06-29 20:03:13', 5),
(629, 'Jorge Pérez', 'CARTAGENA', '3107477095', NULL, NULL, 'ProColombia', 'Jeperez@procolombia.co', NULL, NULL, NULL, NULL, 'ProColombia', NULL, '2024-06-29 20:04:08', '2024-06-29 20:04:08', 5),
(630, 'Ricardo Mosquera', 'Buenaventura', '3154132360', NULL, NULL, 'Servicios Públicos Buenaventura', 'Ricardomosquerarojas913@gmail.com', NULL, NULL, NULL, NULL, 'Servicios Públicos Buenaventura', NULL, '2024-06-29 20:04:59', '2024-06-29 20:04:59', 5),
(631, 'Alvaro Alvarez', 'Medellin', '3126261619', NULL, NULL, 'Jefe de Campamento', 'alvaroalvarezdiaz22@gmail.com', NULL, NULL, NULL, NULL, 'Ecopetrol', NULL, '2024-07-03 22:12:40', '2024-07-03 22:12:40', 5),
(632, 'Jhonatan Ramirez', 'Riohacha Guajira', '3208579776', NULL, NULL, 'Director', 'director@ministeriodelmedioambiente.gov.co', NULL, NULL, NULL, NULL, 'ministerio del medio ambiente sostenibilidad Guajira', NULL, '2024-07-04 00:52:36', '2024-07-04 00:52:36', 5),
(633, 'ALFREDO BARAJAS QUINTERO', 'PIE DE CUESTA', '3209113507', NULL, NULL, 'VOCAL DE CONTROL', 'ALBARAJAS01@GMAIL.COM', NULL, NULL, NULL, NULL, 'VOCAL', NULL, '2024-07-04 03:28:53', '2024-07-04 03:28:53', 5),
(634, 'CLAUDIA MARCELA CABALLERO', 'BOGOTA', '3174374162', NULL, NULL, 'ACUEDUCTO', 'CLAMARCAMO@GMAIL.COM', NULL, NULL, NULL, NULL, 'ACUEDUCTO DE BOGOTA', NULL, '2024-07-04 03:30:31', '2024-07-04 03:30:31', 5),
(635, 'CAROLINA MARTINEZ', 'CARTAGENA', '3213581942', NULL, NULL, 'CORDINADORA', 'JOVENESDEAMBIENTENODOBOLIVAR@GMAIL.COM', NULL, NULL, NULL, NULL, 'RED NACIONAL DE JOVENES DE AMBIENTE', NULL, '2024-07-04 03:32:34', '2024-07-04 03:32:34', 5),
(636, 'MARTIN VILLADIEGO', 'CARTAGENA', '3015238689', NULL, NULL, 'CORDINADOR', 'JOVENESDEAMBIENTENODOBOLIVAR@GMAIL.COM', NULL, NULL, NULL, NULL, 'RED NACIONAL DE JOVENES DE AMBIENTE', NULL, '2024-07-04 03:33:39', '2024-07-04 03:33:39', 5),
(637, 'FREDDY ARANGO', 'MEDELLIN', '3168738665', NULL, NULL, 'CONTRALORIA', 'FREDDYARANGO2@GMAIL.COM', NULL, NULL, NULL, NULL, 'CONTRALORIA MEDELLIN', NULL, '2024-07-04 03:37:53', '2024-07-04 03:37:53', 5),
(638, 'FLORENTINO BORBUA OLASCUAGA', 'CARTAGENA', '3112603523', NULL, NULL, 'PRENSA', 'PRENSAFLORO@HOTMAIL.COM', NULL, NULL, NULL, NULL, 'PRENSA FLORO', NULL, '2024-07-04 03:39:15', '2024-07-04 03:39:15', 5),
(639, 'CIRO JOAQUIN VERA RODRIGUEZ', 'CHIA', '3124746823', NULL, NULL, 'EMSERCHIA', 'CIROJOCOL@GMAIL.COM', NULL, NULL, NULL, NULL, 'EMSERCHIA', NULL, '2024-07-04 03:41:03', '2024-07-04 03:41:03', 5),
(640, 'FRANCO MONCAYO HIDALGO', 'GUADUAS', '3219370442', NULL, NULL, 'GUADUAS EMPR', 'GUILLERMON58@HOTMAIL.COM', NULL, NULL, NULL, NULL, 'EMPRESAS PUBLICAS', NULL, '2024-07-04 03:42:35', '2024-07-04 03:42:35', 5),
(641, 'XIOMARA ROJA', 'BOGOTA', '3057635460', NULL, NULL, 'ACUEDUCTO', 'XROA@ACUEDUCTO.COM.CO', NULL, NULL, NULL, NULL, 'ACUEDUCTO DE BOGOTA', NULL, '2024-07-04 03:45:14', '2024-07-04 03:45:14', 5),
(642, 'CLAUDIA TORRES', 'BOGOTA', '3024656222', NULL, NULL, 'ACUEDUCTO', 'CLAUTC24@GMAIL.COM', NULL, NULL, NULL, NULL, 'ACUEDUCTO DE BOGOTA', NULL, '2024-07-04 03:46:30', '2024-07-04 03:46:30', 5),
(643, 'SANDRA VARGAS', 'BOGOTA', '3214187548', NULL, NULL, 'ACUEDUCTO', 'SVARON@ACUEDUCTO.COM.CO', NULL, NULL, NULL, NULL, 'ACUEDUCTO DE BOGOTA', NULL, '2024-07-04 03:47:27', '2024-07-04 03:47:27', 5),
(644, 'FREDDY SALOM', 'BOGOTA', '3003596955', NULL, NULL, 'GERENTE BANCA OFICIAL', 'FREDDY.SALOM@BANCOAGRARIO.GOV.CO', NULL, NULL, NULL, NULL, 'BANCO AGRARIO', NULL, '2024-07-04 03:52:52', '2024-07-04 03:52:52', 5),
(645, 'JEISSON CONTRERAS', 'ANAPOIMA', '3132023903', NULL, NULL, 'ALCALDIA', 'ANAPOIMA@GMAIL.COM', NULL, NULL, NULL, NULL, 'ALCALDIA DE ANAPOIMA', NULL, '2024-07-04 03:54:49', '2024-07-04 03:54:49', 5),
(646, 'DAVID GARZON', 'FLORENCIA', '3107580556', NULL, NULL, 'TELEMETRIA Y CONTROL', 'DVJDAVIDGAR@GMAIL.COM', NULL, NULL, NULL, NULL, 'SERVAF', NULL, '2024-07-04 03:57:38', '2024-07-04 03:57:38', 5),
(647, 'LUIS JAVIER FERNANDEZ', 'BOGOTA', '3004948456', NULL, NULL, 'INGENIERO', 'INGPROYECTOS@HELBERTYCIA.COM', NULL, NULL, NULL, NULL, 'HELBERT', NULL, '2024-07-04 03:59:00', '2024-07-04 03:59:00', 5),
(648, 'WILLY JOSE ROMERO CERVANTES', 'BARRANQUILLA', '3013155588', NULL, NULL, 'VOCAL DE CONTROL', 'WJROMCER1967@GMAIL.COM', NULL, NULL, NULL, NULL, 'VOCAL', NULL, '2024-07-04 04:01:13', '2024-07-04 04:01:13', 5),
(649, 'JOLY ANILLO', 'CARTAGENA', '3208075525', NULL, NULL, 'ESTELA', 'joly.anillo@estela.com', NULL, NULL, NULL, NULL, 'ESTELA', NULL, '2024-07-04 04:13:37', '2024-07-04 04:13:37', 5),
(651, 'Julio Cesar Alzate Arango', 'Bogota', '3105423837', NULL, NULL, 'Director Ejecutivo', 'direjecutivo@airesytecnologia.com', NULL, NULL, NULL, NULL, 'AdmiGroup', 'storage/featuredsJulio_Cesar_Alzate_Arango.png', '2024-07-04 20:33:46', '2024-07-04 20:33:46', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`) VALUES
('tecser1@tecsersas.com', '$2y$12$IoEOFSMq3XMHngxlKN5uwe29wqs5Oj1eeW7xqJ9MOaYk7fhE7ZXye', '2024-04-23 03:27:22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `name`, `company_id`, `created_at`, `updated_at`) VALUES
(1, 'Monitor Traker', 1, NULL, NULL),
(2, 'Tarjetas Digitales', 1, NULL, NULL),
(3, 'Provisionamiento de Personal Especializado', 1, NULL, NULL),
(4, 'Escritorios Virtuales', 1, NULL, NULL),
(5, 'Herramientas de IPSN', 1, NULL, NULL),
(6, 'Soporte y Mantenimiento de Equipos', 1, NULL, NULL),
(7, 'Servicio de Mesa de Ayuda', 1, NULL, NULL),
(8, 'Fábrica de Software', 1, NULL, NULL),
(9, 'Desarrollo de Software Bajo WEM', 1, NULL, NULL),
(10, 'Herramientas de Seguridad', 1, NULL, NULL),
(11, 'Costos ABC', 1, NULL, NULL),
(12, 'Backup en la Nube', 1, NULL, NULL),
(13, 'Máquinas Atmosféricas de Agua', 2, NULL, NULL),
(14, 'Desinfección de Ambientes', 2, NULL, NULL),
(15, 'Suministro de Aires', 2, NULL, NULL),
(16, 'Instalación de Aires', 2, NULL, NULL),
(17, 'Gestor documental', 3, NULL, NULL),
(18, 'Preservación documental', 3, NULL, NULL),
(19, 'Otro', 3, NULL, NULL),
(20, 'Silicondpox (pavimentación de vías).', 4, NULL, NULL),
(21, 'Construcción de edificaciones', 4, NULL, NULL),
(22, 'Refacción y reparación de fachadas', 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products_nfc_cards`
--

CREATE TABLE `products_nfc_cards` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `nfc_card_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `products_nfc_cards`
--

INSERT INTO `products_nfc_cards` (`id`, `product_id`, `nfc_card_id`, `created_at`, `updated_at`) VALUES
(1, 1, 505, '2024-05-27 20:00:18', '2024-05-27 20:00:18'),
(2, 1, 506, '2024-05-27 20:12:58', '2024-05-27 20:12:58'),
(3, 4, 507, '2024-05-27 20:12:58', '2024-05-27 20:12:58'),
(4, 1, 508, '2024-05-27 20:12:58', '2024-05-27 20:12:58'),
(5, 4, 509, '2024-05-27 20:12:58', '2024-05-27 20:12:58'),
(6, 1, 510, '2024-05-27 20:12:58', '2024-05-27 20:12:58'),
(7, 1, 511, '2024-05-27 20:12:58', '2024-05-27 20:12:58'),
(8, 4, 512, '2024-05-27 20:12:58', '2024-05-27 20:12:58'),
(9, 4, 513, '2024-05-27 20:12:58', '2024-05-27 20:12:58'),
(10, 4, 514, '2024-05-27 20:12:58', '2024-05-27 20:12:58'),
(11, 1, 515, '2024-05-27 20:12:58', '2024-05-27 20:12:58'),
(12, 1, 516, '2024-05-27 20:12:58', '2024-05-27 20:12:58'),
(13, 4, 517, '2024-05-27 20:12:58', '2024-05-27 20:12:58'),
(14, 7, 518, '2024-05-27 20:12:58', '2024-05-27 20:12:58'),
(15, 7, 519, '2024-05-27 20:12:58', '2024-05-27 20:12:58'),
(16, 1, 520, '2024-05-27 20:12:58', '2024-05-27 20:12:58'),
(17, 1, 521, '2024-05-27 20:12:58', '2024-05-27 20:12:58'),
(18, 1, 522, '2024-05-27 20:12:58', '2024-05-27 20:12:58'),
(19, 7, 523, '2024-05-27 20:12:58', '2024-05-27 20:12:58'),
(20, 1, 524, '2024-05-27 20:12:58', '2024-05-27 20:12:58'),
(21, 1, 525, '2024-05-27 20:12:58', '2024-05-27 20:12:58'),
(22, 1, 526, '2024-05-27 20:12:58', '2024-05-27 20:12:58'),
(23, 4, 527, '2024-05-27 20:12:58', '2024-05-27 20:12:58'),
(24, 1, 528, '2024-05-27 20:12:58', '2024-05-27 20:12:58'),
(25, 1, 529, '2024-05-27 20:12:58', '2024-05-27 20:12:58'),
(26, 1, 531, '2024-05-27 20:12:58', '2024-05-27 20:12:58'),
(27, 1, 532, '2024-05-27 20:12:58', '2024-05-27 20:12:58'),
(28, 1, 533, '2024-05-27 20:12:58', '2024-05-27 20:12:58'),
(29, 4, 534, '2024-05-27 20:12:58', '2024-05-27 20:12:58'),
(30, 7, 535, '2024-05-27 20:12:58', '2024-05-27 20:12:58'),
(31, 1, 536, '2024-05-27 20:12:58', '2024-05-27 20:12:58'),
(32, 1, 537, '2024-05-27 20:12:58', '2024-05-27 20:12:58'),
(33, 1, 538, '2024-05-27 20:12:58', '2024-05-27 20:12:58'),
(34, 1, 539, '2024-05-27 20:12:58', '2024-05-27 20:12:58'),
(35, 1, 540, '2024-05-27 20:12:58', '2024-05-27 20:12:58'),
(36, 4, 541, '2024-05-27 20:12:58', '2024-05-27 20:12:58'),
(37, 1, 542, '2024-05-27 20:12:58', '2024-05-27 20:12:58'),
(38, 1, 543, '2024-05-27 20:12:58', '2024-05-27 20:12:58'),
(39, 4, 544, '2024-05-27 20:12:58', '2024-05-27 20:12:58'),
(40, 1, 545, '2024-05-27 20:12:58', '2024-05-27 20:12:58'),
(41, 1, 546, '2024-05-27 20:12:58', '2024-05-27 20:12:58'),
(42, 1, 548, '2024-05-27 20:12:58', '2024-05-27 20:12:58'),
(43, 1, 549, '2024-05-27 20:12:58', '2024-05-27 20:12:58'),
(44, 1, 550, '2024-05-27 20:12:58', '2024-05-27 20:12:58'),
(45, 1, 551, '2024-05-27 20:12:58', '2024-05-27 20:12:58'),
(46, 1, 552, '2024-05-27 20:12:58', '2024-05-27 20:12:58'),
(47, 1, 553, '2024-05-27 20:12:58', '2024-05-27 20:12:58'),
(48, 4, 554, '2024-05-27 20:12:58', '2024-05-27 20:12:58'),
(49, 1, 555, '2024-05-27 20:12:58', '2024-05-27 20:12:58'),
(50, 1, 556, '2024-05-27 20:12:58', '2024-05-27 20:12:58'),
(51, 1, 557, '2024-05-27 20:12:58', '2024-05-27 20:12:58'),
(52, 4, 558, '2024-05-27 20:12:58', '2024-05-27 20:12:58'),
(53, 4, 559, '2024-05-27 20:12:58', '2024-05-27 20:12:58'),
(54, 1, 560, '2024-05-27 20:12:58', '2024-05-27 20:12:58'),
(55, 4, 561, '2024-05-27 20:12:58', '2024-05-27 20:12:58'),
(56, 1, 562, '2024-05-27 20:12:58', '2024-05-27 20:12:58'),
(57, 1, 563, '2024-05-27 20:12:58', '2024-05-27 20:12:58'),
(58, 1, 564, '2024-05-27 20:12:58', '2024-05-27 20:12:58'),
(59, 1, 565, '2024-05-27 20:12:58', '2024-05-27 20:12:58'),
(60, 4, 566, '2024-05-27 20:12:58', '2024-05-27 20:12:58'),
(61, 4, 567, '2024-05-27 20:12:58', '2024-05-27 20:12:58'),
(62, 7, 568, '2024-05-27 20:12:58', '2024-05-27 20:12:58'),
(63, 1, 569, '2024-05-27 20:12:58', '2024-05-27 20:12:58'),
(64, 1, 570, '2024-05-27 20:12:58', '2024-05-27 20:12:58'),
(89, 1, 573, '2024-05-28 20:03:36', '2024-05-28 20:03:36'),
(90, 2, 573, '2024-05-28 20:03:36', '2024-05-28 20:03:36'),
(91, 2, 574, '2024-05-29 13:22:36', '2024-05-29 13:22:36'),
(92, 1, 575, '2024-06-06 14:03:20', '2024-06-06 14:03:20'),
(94, 1, 577, '2024-06-07 14:36:33', '2024-06-07 14:36:33'),
(95, 19, 578, '2024-06-07 22:30:00', '2024-06-07 22:30:00'),
(97, 19, 580, '2024-06-11 14:08:32', '2024-06-11 14:08:32'),
(98, 19, 581, '2024-06-12 14:04:50', '2024-06-12 14:04:50'),
(99, 13, 582, '2024-06-26 15:56:21', '2024-06-26 15:56:21'),
(100, 14, 583, '2024-06-26 20:04:47', '2024-06-26 20:04:47'),
(101, 13, 584, '2024-06-26 20:49:01', '2024-06-26 20:49:01'),
(102, 14, 585, '2024-06-26 21:21:31', '2024-06-26 21:21:31'),
(103, 13, 586, '2024-06-26 22:26:52', '2024-06-26 22:26:52'),
(104, 13, 587, '2024-06-26 22:28:52', '2024-06-26 22:28:52'),
(105, 13, 588, '2024-06-26 22:30:29', '2024-06-26 22:30:29'),
(106, 13, 589, '2024-06-26 22:32:57', '2024-06-26 22:32:57'),
(107, 13, 590, '2024-06-26 22:35:09', '2024-06-26 22:35:09'),
(108, 13, 591, '2024-06-26 22:45:12', '2024-06-26 22:45:12'),
(109, 13, 592, '2024-06-26 22:48:25', '2024-06-26 22:48:25'),
(110, 13, 593, '2024-06-26 22:49:17', '2024-06-26 22:49:17'),
(111, 14, 594, '2024-06-26 22:51:38', '2024-06-26 22:51:38'),
(112, 13, 595, '2024-06-26 23:08:31', '2024-06-26 23:08:31'),
(113, 13, 596, '2024-06-27 13:49:36', '2024-06-27 13:49:36'),
(114, 13, 597, '2024-06-27 13:55:48', '2024-06-27 13:55:48'),
(115, 13, 598, '2024-06-27 14:39:11', '2024-06-27 14:39:11'),
(116, 13, 599, '2024-06-27 14:41:33', '2024-06-27 14:41:33'),
(117, 13, 600, '2024-06-27 14:42:53', '2024-06-27 14:42:53'),
(118, 13, 601, '2024-06-27 15:20:33', '2024-06-27 15:20:33'),
(119, 13, 602, '2024-06-27 15:22:18', '2024-06-27 15:22:18'),
(120, 13, 603, '2024-06-27 16:35:09', '2024-06-27 16:35:09'),
(121, 13, 604, '2024-06-27 16:47:16', '2024-06-27 16:47:16'),
(123, 13, 606, '2024-06-27 17:02:32', '2024-06-27 17:02:32'),
(125, 13, 608, '2024-06-27 17:08:35', '2024-06-27 17:08:35'),
(126, 15, 609, '2024-06-27 21:33:54', '2024-06-27 21:33:54'),
(127, 15, 610, '2024-06-27 22:12:42', '2024-06-27 22:12:42'),
(128, 15, 611, '2024-06-27 22:19:36', '2024-06-27 22:19:36'),
(129, 15, 612, '2024-06-28 15:56:06', '2024-06-28 15:56:06'),
(130, 15, 613, '2024-06-28 16:09:19', '2024-06-28 16:09:19'),
(131, 13, 614, '2024-06-28 20:08:31', '2024-06-28 20:08:31'),
(132, 13, 615, '2024-06-28 20:10:39', '2024-06-28 20:10:39'),
(133, 13, 616, '2024-06-28 20:11:48', '2024-06-28 20:11:48'),
(134, 13, 617, '2024-06-28 20:12:50', '2024-06-28 20:12:50'),
(135, 13, 618, '2024-06-28 20:13:53', '2024-06-28 20:13:53'),
(136, 13, 619, '2024-06-28 20:15:00', '2024-06-28 20:15:00'),
(137, 13, 620, '2024-06-28 20:16:28', '2024-06-28 20:16:28'),
(138, 13, 621, '2024-06-28 20:17:36', '2024-06-28 20:17:36'),
(139, 13, 622, '2024-06-28 20:23:16', '2024-06-28 20:23:16'),
(140, 13, 623, '2024-06-28 20:25:50', '2024-06-28 20:25:50'),
(141, 13, 624, '2024-06-29 14:57:21', '2024-06-29 14:57:21'),
(142, 13, 625, '2024-06-29 14:58:30', '2024-06-29 14:58:30'),
(143, 13, 626, '2024-06-29 15:00:25', '2024-06-29 15:00:25'),
(144, 13, 627, '2024-06-29 15:01:29', '2024-06-29 15:01:29'),
(145, 13, 628, '2024-06-29 15:03:13', '2024-06-29 15:03:13'),
(146, 13, 629, '2024-06-29 15:04:09', '2024-06-29 15:04:09'),
(147, 13, 630, '2024-06-29 15:04:59', '2024-06-29 15:04:59'),
(148, 13, 631, '2024-07-03 17:12:40', '2024-07-03 17:12:40'),
(149, 13, 632, '2024-07-03 19:52:36', '2024-07-03 19:52:36'),
(150, 13, 633, '2024-07-03 22:28:53', '2024-07-03 22:28:53'),
(151, 13, 634, '2024-07-03 22:30:31', '2024-07-03 22:30:31'),
(152, 13, 635, '2024-07-03 22:32:34', '2024-07-03 22:32:34'),
(153, 13, 636, '2024-07-03 22:33:39', '2024-07-03 22:33:39'),
(154, 13, 637, '2024-07-03 22:37:54', '2024-07-03 22:37:54'),
(155, 13, 638, '2024-07-03 22:39:15', '2024-07-03 22:39:15'),
(156, 13, 639, '2024-07-03 22:41:03', '2024-07-03 22:41:03'),
(157, 13, 640, '2024-07-03 22:42:35', '2024-07-03 22:42:35'),
(158, 13, 641, '2024-07-03 22:45:14', '2024-07-03 22:45:14'),
(159, 13, 642, '2024-07-03 22:46:30', '2024-07-03 22:46:30'),
(160, 13, 643, '2024-07-03 22:47:27', '2024-07-03 22:47:27'),
(161, 13, 644, '2024-07-03 22:52:52', '2024-07-03 22:52:52'),
(162, 13, 645, '2024-07-03 22:54:49', '2024-07-03 22:54:49'),
(163, 13, 646, '2024-07-03 22:57:38', '2024-07-03 22:57:38'),
(164, 13, 647, '2024-07-03 22:59:01', '2024-07-03 22:59:01'),
(165, 13, 648, '2024-07-03 23:01:13', '2024-07-03 23:01:13'),
(166, 13, 649, '2024-07-03 23:13:37', '2024-07-03 23:13:37'),
(168, 19, 651, '2024-07-04 15:33:46', '2024-07-04 15:33:46');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(4, 'tecser1', 'tecser1@tecsersas.com', NULL, '$2y$12$4ppNsYSoFIcNoSTf6BcaBOvLu1mL.Itzce4mhk7wf0uqzvhf2Cvk6', 'GftVWdvXfVADogoUgOmWlgY6gkma4wXhBD1sP62WbTKchBbOmqKcn1lFDGGU', '2024-02-28 02:17:35', '2024-02-28 02:17:35'),
(5, 'tecser2', 'tecser2@tecsersas.com', NULL, '$2y$12$HERwO4c3bF.BuiYPvbLasORQa0IaMZ/gFKHTujjjNHskY04pgG37q', '256K7Sy9dehSr4FRyeoIyxfgcOxrylw19AqtTntOSw41aB9e8njgFBnRKB6Z', '2024-02-28 02:18:07', '2024-02-28 02:18:07');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `event_company`
--
ALTER TABLE `event_company`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_company_event_id_foreign` (`event_id`),
  ADD KEY `event_company_company_id_foreign` (`company_id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `nfc_cards`
--
ALTER TABLE `nfc_cards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nfc_cards_event_id_foreign` (`event_id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_company_id_foreign` (`company_id`);

--
-- Indices de la tabla `products_nfc_cards`
--
ALTER TABLE `products_nfc_cards`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_product_nfc_card` (`product_id`,`nfc_card_id`),
  ADD KEY `nfc_card_id` (`nfc_card_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `companies`
--
ALTER TABLE `companies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `events`
--
ALTER TABLE `events`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `event_company`
--
ALTER TABLE `event_company`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `nfc_cards`
--
ALTER TABLE `nfc_cards`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=652;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `products_nfc_cards`
--
ALTER TABLE `products_nfc_cards`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=169;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `event_company`
--
ALTER TABLE `event_company`
  ADD CONSTRAINT `event_company_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `event_company_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `nfc_cards`
--
ALTER TABLE `nfc_cards`
  ADD CONSTRAINT `nfc_cards_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `products_nfc_cards`
--
ALTER TABLE `products_nfc_cards`
  ADD CONSTRAINT `products_nfc_cards_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_nfc_cards_ibfk_2` FOREIGN KEY (`nfc_card_id`) REFERENCES `nfc_cards` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

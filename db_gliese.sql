-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 08-10-2024 a las 20:39:38
-- Versión del servidor: 8.3.0
-- Versión de PHP: 8.1.28

CREATE DATABASE db_gliese;
USE db_gliese;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `gliese`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `billingpersale`
--

DROP TABLE IF EXISTS `billingpersale`;
CREATE TABLE IF NOT EXISTS `billingpersale` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `operation_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `person_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `voucher_type` int DEFAULT NULL,
  `series` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `correlative` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `issue_date` date DEFAULT NULL,
  `issue_time` time DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `currency` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `payment_method` int DEFAULT NULL,
  `installments` int DEFAULT NULL,
  `installment_amount` decimal(10,2) DEFAULT NULL,
  `payment_medium` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `taxable_operations` decimal(10,2) DEFAULT NULL,
  `free_operations` decimal(10,2) DEFAULT NULL,
  `exempt_operations` decimal(10,2) DEFAULT NULL,
  `unaffected_operations` decimal(10,2) DEFAULT NULL,
  `igv` decimal(10,2) DEFAULT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `leyend` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `retention` decimal(10,2) DEFAULT NULL,
  `retention_percentage` decimal(5,2) DEFAULT NULL,
  `retention_amount` decimal(10,2) DEFAULT NULL,
  `detraction` decimal(10,2) DEFAULT NULL,
  `detraction_percentage` decimal(5,2) DEFAULT NULL,
  `detraction_amount` decimal(10,2) DEFAULT NULL,
  `net_amount_pending_payment` decimal(10,2) DEFAULT NULL,
  `status` tinyint DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `billingpersale_detail`
--

DROP TABLE IF EXISTS `billingpersale_detail`;
CREATE TABLE IF NOT EXISTS `billingpersale_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sale_id` bigint DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `item` int DEFAULT NULL,
  `unit_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `serie` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tax_percentage` decimal(5,2) DEFAULT NULL,
  `Type_taxation` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tax_amount` decimal(10,2) DEFAULT NULL,
  `tax_affectation_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `unit_value` decimal(10,2) DEFAULT NULL,
  `free_unit_value` decimal(10,2) DEFAULT NULL,
  `item_unit_price` decimal(10,2) DEFAULT NULL,
  `sale_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sale_id` (`sale_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `campus`
--

DROP TABLE IF EXISTS `campus`;
CREATE TABLE IF NOT EXISTS `campus` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(45) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `telephone` varchar(15) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `campus`
--

INSERT INTO `campus` (`id`, `description`, `status`, `telephone`, `address`) VALUES
(2, 'CALLE 04', 1, NULL, NULL),
(4, 'CALLE 01', 1, NULL, NULL),
(5, 'CALLE 02', 1, NULL, NULL),
(6, 'CALLE 03', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_section` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `id_section` (`id_section`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`id`, `id_section`, `name`, `status`) VALUES
(1, 1, 'Negro', 1),
(2, 2, 'Gaming', 1),
(3, 2, 'Gaming', 1),
(4, 3, 'mecanico', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `change_value`
--

DROP TABLE IF EXISTS `change_value`;
CREATE TABLE IF NOT EXISTS `change_value` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_coins` int NOT NULL DEFAULT '0',
  `date` date NOT NULL,
  `purchase_value` decimal(4,3) NOT NULL DEFAULT (0),
  `sales_value` decimal(4,3) NOT NULL DEFAULT (0),
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `id_coins` (`id_coins`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `coin`
--

DROP TABLE IF EXISTS `coin`;
CREATE TABLE IF NOT EXISTS `coin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `coin`
--

INSERT INTO `coin` (`id`, `code`, `description`, `status`) VALUES
(1, 'PEN', 'Nuevo Sol', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `company`
--

DROP TABLE IF EXISTS `company`;
CREATE TABLE IF NOT EXISTS `company` (
  `id` int NOT NULL AUTO_INCREMENT,
  `business_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `company_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ruc` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `district` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `province` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `department` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `postal_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `web` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `logo` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `country` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `address2` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `industry` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ubigeo` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `company`
--

INSERT INTO `company` (`id`, `business_name`, `company_name`, `ruc`, `address`, `district`, `province`, `department`, `postal_code`, `phone`, `email`, `web`, `logo`, `country`, `start_date`, `address2`, `industry`, `ubigeo`) VALUES
(1, 'Wilder Florentino Julca Broncano', 'Soluciones Integrales JB SAC', '10410697551', 'Calle Lopez de Zuñiga Nº 547 Piso 2', 'Chancay', 'Huaral', 'Lima', '15131', '996 720 630', 'ventas@solucionesintegralesjb.com', 'www.solucionesintegralesjb.com', '1613382659.png', 'Perú', '2020-02-15', 'Calle Lopez de Zuñiga Nº 547 - Chancay', 'Ejecución, integración y desarrollo de proyectos. Instalación y mantenimiento de cámaras y equipos de tecnologías en seguridad. Instalación y mantenimiento eléctrico. Soporte técnico en general. sublimación en general. Venta de equipos informáticos, redes, accesorios y materiales eléctricos.', '150605');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `content_headers`
--

DROP TABLE IF EXISTS `content_headers`;
CREATE TABLE IF NOT EXISTS `content_headers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_product` int NOT NULL,
  `id_header` int NOT NULL,
  `content` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `position` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_product` (`id_product`),
  KEY `id_header` (`id_header`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `creditnote`
--

DROP TABLE IF EXISTS `creditnote`;
CREATE TABLE IF NOT EXISTS `creditnote` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL DEFAULT '0',
  `id_products` int NOT NULL DEFAULT '0',
  `id_sale` int NOT NULL DEFAULT '0',
  `amount` int NOT NULL DEFAULT '0',
  `price_sale` decimal(11,2) NOT NULL DEFAULT '0.00',
  `discount` decimal(11,2) NOT NULL DEFAULT (0),
  `correction_description` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0',
  `series` int DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `id_user` (`id_user`),
  KEY `id_products` (`id_products`),
  KEY `id_venta` (`id_sale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `development`
--

DROP TABLE IF EXISTS `development`;
CREATE TABLE IF NOT EXISTS `development` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_person` int NOT NULL,
  `id_user` int NOT NULL,
  `date_income` date NOT NULL,
  `id_status_service` int NOT NULL,
  `id_status_delivery` int NOT NULL,
  `id_status_payment` int NOT NULL,
  `name_project` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `development_cost` decimal(11,2) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `id_user` (`id_user`),
  KEY `id_clients` (`id_person`),
  KEY `id_status_service` (`id_status_service`),
  KEY `id_status_delivery` (`id_status_delivery`),
  KEY `id_status_payment` (`id_status_payment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `document_type`
--

DROP TABLE IF EXISTS `document_type`;
CREATE TABLE IF NOT EXISTS `document_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(45) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `document_type`
--

INSERT INTO `document_type` (`id`, `description`, `status`) VALUES
(1, 'DNI', 1),
(2, 'RUC', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `headers`
--

DROP TABLE IF EXISTS `headers`;
CREATE TABLE IF NOT EXISTS `headers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `headers`
--

INSERT INTO `headers` (`id`, `name`) VALUES
(1, 'Descripción'),
(2, 'Especificación'),
(3, 'Caracteristicas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `igv`
--

DROP TABLE IF EXISTS `igv`;
CREATE TABLE IF NOT EXISTS `igv` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` decimal(5,2) NOT NULL DEFAULT '0.00',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `igv`
--

INSERT INTO `igv` (`id`, `value`, `status`) VALUES
(1, 18.00, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `income`
--

DROP TABLE IF EXISTS `income`;
CREATE TABLE IF NOT EXISTS `income` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_person` int NOT NULL,
  `id_user` int NOT NULL,
  `id_voucher_type` int NOT NULL,
  `id_payment_type` int NOT NULL,
  `proof_series` varchar(7) DEFAULT NULL,
  `voucher_series` varchar(10) NOT NULL,
  `date_issue` datetime NOT NULL,
  `igv` decimal(5,2) NOT NULL DEFAULT '0.00',
  `number_installments` int DEFAULT NULL,
  `value_installment` decimal(11,2) DEFAULT NULL,
  `full_purchase` decimal(11,2) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `id_supplier` (`id_person`),
  KEY `id_user` (`id_user`),
  KEY `id_voucher_type` (`id_voucher_type`),
  KEY `id_payment_type` (`id_payment_type`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `income`
--

INSERT INTO `income` (`id`, `id_person`, `id_user`, `id_voucher_type`, `id_payment_type`, `proof_series`, `voucher_series`, `date_issue`, `igv`, `number_installments`, `value_installment`, `full_purchase`, `status`) VALUES
(1, 1, 13, 1, 1, 'B001', '00000001', '2023-03-30 21:43:58', 0.18, NULL, NULL, 100.50, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `income_detail`
--

DROP TABLE IF EXISTS `income_detail`;
CREATE TABLE IF NOT EXISTS `income_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_products` int NOT NULL,
  `id_income` int NOT NULL,
  `stock` int NOT NULL,
  `purchase_price` decimal(11,2) NOT NULL,
  `sale_price` decimal(11,2) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `id_income` (`id_income`),
  KEY `id_product` (`id_products`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `intent`
--

DROP TABLE IF EXISTS `intent`;
CREATE TABLE IF NOT EXISTS `intent` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` text NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `intent`
--

INSERT INTO `intent` (`id`, `token`, `status`) VALUES
(12, 'gjYSL8sm4porYSQSPo436rnlxTIqTpgfW9jgjnwtfze3caCPGAAZIHGF1n7mlWNvaA863E4TYam55/Pm+LwjiBGPnvSoTQ7QD88mYd5pM4cUpWQgJThJKHGRZL1EsNtsdpBAmg==', 1),
(13, 'gjYSL8sm4porYSQSPo436rnlxTIqTpgfW9jgjnwtfze3caCPGAAZIHGF1n7mlWNvaA863E4TYam55/Pm+LwjiBGPnvSoTQ7QD88mYd5pM4cUpWQgJThJKHGRZL1EsNtsdpBAmg==', 1),
(14, 'gjYSL8sm4porYSQSPo436rnlxTIqTpgfW9jgjnwtfze3caCPGAAZIHGF1n7mlWNvaA863E4TYam55/Pm+LwjiBGPnvSoTQ7QD88mYd5pM4cUpWQgJThJKHGRZL1EsNtsdpBAmg==', 1),
(15, 'gjYSL8sm4porYSQSPo436rnlxTIqTpgfW9jgjnwtfze3caCPGAAZIHGF1n7mlWNvaA863E4TYam55/Pm+LwjiBGPnvSoTQ7QD88mYd5pM4cUpWQgJThJKHGRZL1EsNtsdpBAmg==', 1),
(16, 'EFj4ncJXv2k7BoTw6rZUJ7Qto8w/U2stpqCNZY0boNeX8Q7/noplT8/at/4a55wyFySCmYyf5cN0rDX3c+p9u28OyYSJeeJsyvg7fgbo+3IihvmAWidiivGDJGYoJMywbhIZdA==', 1),
(17, 'RXy0/jSAd5JczrdApFzVgMPPoN9ZJ7RR1JdvuG5bKZ3443zRi8vjrEqYRwkikqQ2fU7BKe3H3A3IACnGLt97aVeRUDl9VL/3hqUx7HSR+EtlAj6HGCZ6TKjLL6bm3GiNuI8MIQ==', 1),
(18, 'RXy0/jSAd5JczrdApFzVgMPPoN9ZJ7RR1JdvuG5bKZ3443zRi8vjrEqYRwkikqQ2fU7BKe3H3A3IACnGLt97aVeRUDl9VL/3hqUx7HSR+EtlAj6HGCZ6TKjLL6bm3GiNuI8MIQ==', 1),
(19, 'VYtGUGue1OCp8/5QBhcIi3ShJbk85/YmVbk3iENr8rIseReWUKYmyZ9BPSmQJflxXaZlVIg62LFTcneW9aJBMVZT6srkr+wXoTGA0pzbPKXKZOPIF+U2dwTS6JX3RDysc12VjA==', 1),
(20, '3ckmMmMWPQfjL1f5lUk3P+kf38KcpJca/H8FExPCtPDZ6qvN/JaaZAMP/yevdj6Kglp/jhDZhTnnjOs88mh6FM8au67U+FLaEFtG5Jktwhs9e0rjGrfCbbLWnhojZWb53P1/Jg==', 1),
(21, 'ao4rLnLR32VGiEXTRJnRDvUa0/YeDi30TSIcPdbYLAdF8SS54edHQXF3yx6rCs3XBfuHr4C04kmqU9XJd5Ya5YlMZSdQDgCZTykvcHIrHGC+QrXzHtu8YLeshLb3W5pmQW5avw==', 1),
(22, '4M2cNr72yhLkmPpw+xXJt82moY7QeBgsAWNznGMkjnIbP3LrxA8OFdi3itOI9y38HC0rsQrgxKnE43AKUpVTTnRM/yUME4sFTUVKX/iWYvsYdkqcfh8P662f+Apoj0/chlz3Og==', 1),
(23, '4LDRDYaAaQu9fMJdJdpk43GN4uDk4tNzN6RZEhYdSJqSXlCSuDNPZA+wqVY5RVTw+qNyOVA+YbNjZrkXDMINumRg1st8sftzpcQvvp57tbDD3077aHoHnOP2CJ+78V8795lA1g==', 1),
(24, 'qQ82xrb5o3w/NUv8+4xU3QLIFSXYmLoFuXE4B8CQGn5vlKZRYBJaVRLyM6go8SAdHb0bSD6w/gARnwrZINKjOwYHjqpb5gTRDYxSsV1gxnzTknpZP2DT7G139Qbvi0uNpXY+6Q==', 1),
(25, 'wwDgSp8/w8HlzFp4ixnFeGaa3QjTF8WqFCDzMjLIMDyDinMVMTjDcmBK7WLGJ1fBtsBsQh4MFZs8YWD1w9IwpWYck99EKXOeHzyZaOqvWzaAvoNO6IiO/Exl5evaBVFqZr2uFw==', 1),
(26, '7pGMixYqPj2pu89F4Jw9niu8H6wSuLt8fX+v8BhTNjVeRWsS0EbZWiOkt1EoDnfktgAfQCUReS2Jmgdr50NTEdDeKzDAH4CYgVBFqxXcsbuzl+4OBBJo+EA/5vks8O2whObWkg==', 1),
(27, '7pGMixYqPj2pu89F4Jw9niu8H6wSuLt8fX+v8BhTNjVeRWsS0EbZWiOkt1EoDnfktgAfQCUReS2Jmgdr50NTEdDeKzDAH4CYgVBFqxXcsbuzl+4OBBJo+EA/5vks8O2whObWkg==', 1),
(28, 'g3zR52fdOK2AX8jrhrDTYt+Iv5z87155ocTCSTb/7xNjnB6nTGgTxhrlComsZ9+4tr3lSUIZhdMKRc+LQRenv8VWt1W0ADwJVzqBH1T6Tm85e2bRzc9JX5Z6EazdbI3w0WnnkA==', 1),
(29, 'g3zR52fdOK2AX8jrhrDTYt+Iv5z87155ocTCSTb/7xNjnB6nTGgTxhrlComsZ9+4tr3lSUIZhdMKRc+LQRenv8VWt1W0ADwJVzqBH1T6Tm85e2bRzc9JX5Z6EazdbI3w0WnnkA==', 1),
(30, 'g3zR52fdOK2AX8jrhrDTYt+Iv5z87155ocTCSTb/7xNjnB6nTGgTxhrlComsZ9+4tr3lSUIZhdMKRc+LQRenv8VWt1W0ADwJVzqBH1T6Tm85e2bRzc9JX5Z6EazdbI3w0WnnkA==', 1),
(31, 'g3zR52fdOK2AX8jrhrDTYt+Iv5z87155ocTCSTb/7xNjnB6nTGgTxhrlComsZ9+4tr3lSUIZhdMKRc+LQRenv8VWt1W0ADwJVzqBH1T6Tm85e2bRzc9JX5Z6EazdbI3w0WnnkA==', 1),
(32, 'g3zR52fdOK2AX8jrhrDTYt+Iv5z87155ocTCSTb/7xNjnB6nTGgTxhrlComsZ9+4tr3lSUIZhdMKRc+LQRenv8VWt1W0ADwJVzqBH1T6Tm85e2bRzc9JX5Z6EazdbI3w0WnnkA==', 1),
(33, 'g3zR52fdOK2AX8jrhrDTYt+Iv5z87155ocTCSTb/7xNjnB6nTGgTxhrlComsZ9+4tr3lSUIZhdMKRc+LQRenv8VWt1W0ADwJVzqBH1T6Tm85e2bRzc9JX5Z6EazdbI3w0WnnkA==', 1),
(34, 'g3zR52fdOK2AX8jrhrDTYt+Iv5z87155ocTCSTb/7xNjnB6nTGgTxhrlComsZ9+4tr3lSUIZhdMKRc+LQRenv8VWt1W0ADwJVzqBH1T6Tm85e2bRzc9JX5Z6EazdbI3w0WnnkA==', 1),
(35, 'hdYHI1wzU3BRu0aA9eft/XO9FewYYlYSJoy7xr3woraDbDYg3nbvuGuN1QdADhRQS9PL1etUycX4qJ9l3OygL/en2dmr+wglqiWjC/93rnx0tx9TH/sEqDb/jBE1v0dKBU92lg==', 1),
(36, 'PBb80w2VO/sHmbUcN017LyzB2WBvodBKdq2u6WlMzSwYUK+IAcnUnSy6R1eullwvGM3tmhFpGYFbyY7Wl22QdZ/uruQRnKbIKHnbsrkqlUSMhNxr78IwFNsw8b3d941IW8u7wA==', 1),
(37, 'PBb80w2VO/sHmbUcN017LyzB2WBvodBKdq2u6WlMzSwYUK+IAcnUnSy6R1eullwvGM3tmhFpGYFbyY7Wl22QdZ/uruQRnKbIKHnbsrkqlUSMhNxr78IwFNsw8b3d941IW8u7wA==', 1),
(38, 'jIqA1t1OztxPyBi+0m5SA5EeNLJqdbd0sTQL63C7qAZv12XCnbk+WV/pxW02XWDtuWTCcTvokUm+e4yTmZ8iSRptR125JgQmyrDUPrqNl0+Od19DUK6yOmKoComdE6nn9umdWw==', 1),
(39, 'hJSY8ZKR3KTqookviNjK3ggchDYuu/aBVJ4/0jbV29KvTCcY1RHPL9OOmRocPkHwe4SwUGwzij+x+mLDMJ4om1CLsqJSjBbyuM6SEAVaQcyIolIJ2VenC4c4VBklDbT6rcaBaA==', 1),
(40, 'au9eplr+9fhg6Tn0LO2lSKEcCI58MVBr78m0XVl8DtkefazbJRcn0qRLnicy6FNnlBCVHaWbzRkiE5JckofhwshsZqlJmv3qAjntsCNc/Z26LOzOW91g/NbP0C6dgef4CCj8kw==', 1),
(41, 'B1dOh6l46moZqheyMzG58h3Ef706I2bNWzzeJlubsLAjRmgGoodJMs9ek0si74Ffjzb+3hcd8Bfw7kVEASC49cseUzTN+bss79vvWK8Wkvj+k7s79S4pHFvvNz2RbT/cXOAYow==', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `labels`
--

DROP TABLE IF EXISTS `labels`;
CREATE TABLE IF NOT EXISTS `labels` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `color` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `measuring_unit`
--

DROP TABLE IF EXISTS `measuring_unit`;
CREATE TABLE IF NOT EXISTS `measuring_unit` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `measuring_unit`
--

INSERT INTO `measuring_unit` (`id`, `code`, `description`, `status`) VALUES
(1, 'NIU', 'Unidades(BIENES)', 1),
(2, 'ZZ', 'Unidades(SERVICIOS)', 1),
(3, 'KGM', 'Kilogramos', 1),
(4, 'LBR', 'Libras', 1),
(5, 'GRM', 'Gramos', 1),
(6, 'LTR', 'Litros', 1),
(7, 'MMQ', 'Metros Cubicos', 1),
(8, 'MTR', 'Metros', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu`
--

DROP TABLE IF EXISTS `menu`;
CREATE TABLE IF NOT EXISTS `menu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(80) NOT NULL,
  `icon` varchar(45) DEFAULT NULL,
  `order` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `menu`
--

INSERT INTO `menu` (`id`, `description`, `icon`, `order`) VALUES
(1, 'Home', 'home', 1),
(2, 'Productos', 'archive', 2),
(3, 'Almacén', 'box', 3),
(4, 'Ventas', 'shopping-cart', 4),
(5, 'Recepción', 'database', 5),
(6, 'Administración', 'sliders', 6),
(7, 'Servicios', 'settings', 7),
(8, 'Sucursal', 'map', 8),
(9, 'Consulta Compras', 'shopping-bag', 9),
(10, 'Consulta de Ventas', 'shopping-bag', 10),
(11, 'Soporte', 'shield', 11);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `motive_document`
--

DROP TABLE IF EXISTS `motive_document`;
CREATE TABLE IF NOT EXISTS `motive_document` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `motive_document`
--

INSERT INTO `motive_document` (`id`, `description`, `status`) VALUES
(1, 'Anulación de la operación', 1),
(2, 'Anulación por error en el RUC', 1),
(3, 'Correción por error en la descripción', 1),
(4, 'Descuento globlal', 1),
(5, 'Descuento por Item', 1),
(6, 'Devolución total', 1),
(7, 'Devolución parcial', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `motive_transfer`
--

DROP TABLE IF EXISTS `motive_transfer`;
CREATE TABLE IF NOT EXISTS `motive_transfer` (
  `id` int NOT NULL,
  `description` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `motive_transfer`
--

INSERT INTO `motive_transfer` (`id`, `description`, `status`) VALUES
(1, 'Compra', 1),
(2, 'Consignación', 1),
(3, 'Devolución', 1),
(4, 'Traslado entre almacenes', 1),
(5, 'Venta', 1),
(6, 'Venta con entrega a terceros', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pay`
--

DROP TABLE IF EXISTS `pay`;
CREATE TABLE IF NOT EXISTS `pay` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_income` int NOT NULL,
  `value_cuota` decimal(5,2) NOT NULL DEFAULT '0.00',
  `date_pay` date NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `id_income` (`id_income`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payment_shape`
--

DROP TABLE IF EXISTS `payment_shape`;
CREATE TABLE IF NOT EXISTS `payment_shape` (
  `id` int NOT NULL,
  `description` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `payment_shape`
--

INSERT INTO `payment_shape` (`id`, `description`, `status`) VALUES
(1, 'Contado', 1),
(2, 'Crédito', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payment_type`
--

DROP TABLE IF EXISTS `payment_type`;
CREATE TABLE IF NOT EXISTS `payment_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(50) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `payment_type`
--

INSERT INTO `payment_type` (`id`, `description`, `status`) VALUES
(1, 'Efectivo', 1),
(2, 'Depósito en cuenta', 1),
(3, 'Giro', 1),
(4, 'Transferencia', 1),
(5, 'Orden de pago', 1),
(6, 'Tarjeta de debito', 1),
(7, 'Tarjeta de crédito', 1),
(8, 'Yape', 1),
(9, 'Plin', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permission`
--

DROP TABLE IF EXISTS `permission`;
CREATE TABLE IF NOT EXISTS `permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_role` int NOT NULL,
  `id_sub_menu` int NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `FK_PERMISSION_ROLE` (`id_role`),
  KEY `FK_PERMISSION_SUB_MENU` (`id_sub_menu`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `permission`
--

INSERT INTO `permission` (`id`, `id_role`, `id_sub_menu`, `status`) VALUES
(1, 1, 1, 1),
(2, 1, 2, 1),
(3, 1, 3, 1),
(4, 1, 4, 1),
(5, 1, 5, 1),
(6, 1, 6, 1),
(7, 1, 7, 1),
(15, 1, 8, 1),
(16, 1, 9, 1),
(17, 1, 10, 1),
(19, 1, 11, 1),
(20, 1, 12, 1),
(21, 1, 13, 1),
(22, 1, 14, 1),
(23, 1, 15, 1),
(24, 1, 16, 1),
(25, 1, 17, 1),
(26, 1, 18, 1),
(27, 1, 19, 1),
(28, 1, 20, 1),
(29, 1, 21, 1),
(30, 1, 22, 1),
(31, 1, 23, 1),
(32, 1, 24, 1),
(33, 1, 25, 1),
(34, 1, 26, 1),
(35, 1, 27, 1),
(36, 1, 28, 1),
(37, 1, 29, 1),
(38, 1, 30, 1),
(39, 1, 31, 1),
(40, 1, 32, 1),
(41, 1, 33, 1),
(42, 1, 34, 1),
(43, 1, 35, 1),
(44, 1, 36, 1),
(45, 1, 37, 1),
(46, 1, 38, 1),
(47, 1, 39, 1),
(48, 1, 43, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `person`
--

DROP TABLE IF EXISTS `person`;
CREATE TABLE IF NOT EXISTS `person` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `document_type_id` int DEFAULT NULL,
  `document_number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `address` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phone` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `contact_person` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `brand` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `license_plate` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `driver_license` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `manager` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `reference` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  `role_person_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_person_id` (`role_person_id`),
  KEY `document_type_id` (`document_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_unit` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `id_label` int DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `id_label` (`id_label`),
  KEY `id_u_medida` (`id_unit`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product_images`
--

DROP TABLE IF EXISTS `product_images`;
CREATE TABLE IF NOT EXISTS `product_images` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_product` int NOT NULL,
  `image_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_product` (`id_product`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product_inventories`
--

DROP TABLE IF EXISTS `product_inventories`;
CREATE TABLE IF NOT EXISTS `product_inventories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_product` int NOT NULL,
  `id_section` int NOT NULL,
  `id_category` int NOT NULL,
  `id_subcategory` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_product` (`id_product`),
  KEY `id_section` (`id_section`),
  KEY `id_category` (`id_category`),
  KEY `id_subcategory` (`id_subcategory`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product_stock`
--

DROP TABLE IF EXISTS `product_stock`;
CREATE TABLE IF NOT EXISTS `product_stock` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_product` int NOT NULL,
  `stock` int NOT NULL,
  `id_campus` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_product` (`id_product`),
  KEY `id_campus` (`id_campus`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product_type_sale`
--

DROP TABLE IF EXISTS `product_type_sale`;
CREATE TABLE IF NOT EXISTS `product_type_sale` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proforma`
--

DROP TABLE IF EXISTS `proforma`;
CREATE TABLE IF NOT EXISTS `proforma` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_clients` int NOT NULL,
  `id_user` int NOT NULL,
  `id_voucher_type` int NOT NULL,
  `igv` decimal(5,2) NOT NULL DEFAULT '0.00',
  `igv_total` decimal(5,2) NOT NULL DEFAULT '0.00',
  `date_issue` date NOT NULL,
  `correlative` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `reference` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `total_sale` decimal(5,2) NOT NULL DEFAULT '0.00',
  `delivery_time` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `offer_validity` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `id_clients` (`id_clients`),
  KEY `id_user` (`id_user`),
  KEY `id_voucher_type` (`id_voucher_type`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `proforma`
--

INSERT INTO `proforma` (`id`, `id_clients`, `id_user`, `id_voucher_type`, `igv`, `igv_total`, `date_issue`, `correlative`, `reference`, `total_sale`, `delivery_time`, `offer_validity`, `status`) VALUES
(1, 1, 1, 9, 18.00, 5.50, '2013-11-13', '-00000001', 'Referencia', 100.00, '1 dia', 'Oferta', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proforma_detail`
--

DROP TABLE IF EXISTS `proforma_detail`;
CREATE TABLE IF NOT EXISTS `proforma_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_products` int NOT NULL,
  `id_proforma` int NOT NULL,
  `amount` int NOT NULL,
  `series` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `price_sale` decimal(5,2) NOT NULL DEFAULT '0.00',
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `id_products` (`id_products`),
  KEY `id_proforma` (`id_proforma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `referralguide`
--

DROP TABLE IF EXISTS `referralguide`;
CREATE TABLE IF NOT EXISTS `referralguide` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_clients` int NOT NULL,
  `id_sale` int NOT NULL,
  `id_carrier` int NOT NULL,
  `id_reason_transfer` int NOT NULL,
  `date_issue` date NOT NULL,
  `date_transfer` date NOT NULL,
  `modality_transport` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `transfer_type` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `gross_weight` int NOT NULL,
  `serie_correlative` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `serie_correlative_guide` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `address_start` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `address_arrival` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `id_clients` (`id_clients`),
  KEY `id_carrier` (`id_carrier`),
  KEY `id_sale` (`id_sale`),
  KEY `id_transfer_type` (`id_reason_transfer`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `referralguide_detail`
--

DROP TABLE IF EXISTS `referralguide_detail`;
CREATE TABLE IF NOT EXISTS `referralguide_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_products` int NOT NULL,
  `id_referralguide` int NOT NULL,
  `amount` int NOT NULL,
  `series` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `id_products` (`id_products`),
  KEY `id_referralguide` (`id_referralguide`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(45) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `role`
--

INSERT INTO `role` (`id`, `description`, `status`) VALUES
(1, 'ADMINISTRADOR', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roleperson`
--

DROP TABLE IF EXISTS `roleperson`;
CREATE TABLE IF NOT EXISTS `roleperson` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roleperson`
--

INSERT INTO `roleperson` (`id`, `description`) VALUES
(1, 'Cliente'),
(2, 'Proveedor'),
(3, 'Transportista');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sale`
--

DROP TABLE IF EXISTS `sale`;
CREATE TABLE IF NOT EXISTS `sale` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_clients` int NOT NULL,
  `id_user` int NOT NULL,
  `id_voucher_type` int NOT NULL,
  `id_coins` int NOT NULL,
  `id_document_reason` int NOT NULL,
  `id_payment_type` int NOT NULL,
  `doc_related` int NOT NULL,
  `series` int DEFAULT NULL,
  `correlative` int DEFAULT NULL,
  `date_issue` date DEFAULT NULL,
  `date_expiration` date DEFAULT NULL,
  `date_transfer` date DEFAULT NULL,
  `igv` decimal(5,2) NOT NULL DEFAULT '0.00',
  `igv_total` decimal(5,2) NOT NULL DEFAULT '0.00',
  `op_taxed` decimal(5,2) DEFAULT NULL,
  `op_unaffected` decimal(5,2) DEFAULT NULL,
  `op_exonerated` decimal(5,2) DEFAULT NULL,
  `op_free` decimal(5,2) DEFAULT NULL,
  `isc` decimal(5,2) DEFAULT NULL,
  `total_discount` decimal(5,2) DEFAULT NULL,
  `total_sale` decimal(5,2) NOT NULL DEFAULT '0.00',
  `legend` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `sustent` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `reference` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `validity` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `time_delivery` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `modality_transport` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `id_clients` (`id_clients`),
  KEY `id_user` (`id_user`),
  KEY `voucher_type` (`id_voucher_type`),
  KEY `id_coins` (`id_coins`),
  KEY `id_document_reason` (`id_document_reason`),
  KEY `id_payment_type` (`id_payment_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sale_detail`
--

DROP TABLE IF EXISTS `sale_detail`;
CREATE TABLE IF NOT EXISTS `sale_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_sale` int NOT NULL,
  `id_products` int NOT NULL,
  `amount` int NOT NULL,
  `price_sale` decimal(5,2) NOT NULL DEFAULT '0.00',
  `discount` decimal(5,2) NOT NULL DEFAULT '0.00',
  `bestselling_date` date NOT NULL,
  `item` int NOT NULL,
  `series` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `id_sale` (`id_sale`),
  KEY `id_products` (`id_products`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sections`
--

DROP TABLE IF EXISTS `sections`;
CREATE TABLE IF NOT EXISTS `sections` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `status_delivery`
--

DROP TABLE IF EXISTS `status_delivery`;
CREATE TABLE IF NOT EXISTS `status_delivery` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `status_delivery`
--

INSERT INTO `status_delivery` (`id`, `description`, `status`) VALUES
(1, 'Cancelado', 1),
(2, 'Pendiente entrega', 1),
(3, 'Sin servicio', 1),
(4, 'Por servicio', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `status_payment`
--

DROP TABLE IF EXISTS `status_payment`;
CREATE TABLE IF NOT EXISTS `status_payment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `status_payment`
--

INSERT INTO `status_payment` (`id`, `description`, `status`) VALUES
(1, 'Pendiente pago', 1),
(2, 'Pagado pago', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `status_service`
--

DROP TABLE IF EXISTS `status_service`;
CREATE TABLE IF NOT EXISTS `status_service` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `status_service`
--

INSERT INTO `status_service` (`id`, `description`, `status`) VALUES
(1, 'Pendiente', 1),
(2, 'Reparación', 1),
(3, 'Terminado', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subcategories`
--

DROP TABLE IF EXISTS `subcategories`;
CREATE TABLE IF NOT EXISTS `subcategories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_category` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `id_category` (`id_category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sub_menu`
--

DROP TABLE IF EXISTS `sub_menu`;
CREATE TABLE IF NOT EXISTS `sub_menu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_menu` int NOT NULL,
  `description` varchar(45) NOT NULL,
  `icon` varchar(45) DEFAULT NULL,
  `url` varchar(80) NOT NULL,
  `order` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `FK_SUB_MENU_MENU` (`id_menu`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `sub_menu`
--

INSERT INTO `sub_menu` (`id`, `id_menu`, `description`, `icon`, `url`, `order`) VALUES
(1, 1, 'Dashboards', 'circle', 'Dashboards', 1),
(2, 2, 'Lista productos', 'circle', 'Products', 1),
(3, 2, 'Ficha producto', 'circle', 'Productdetails', 2),
(4, 2, 'Etiquetas', 'circle', 'Labels', 3),
(5, 3, 'Secciones', 'circle', 'Sections', 1),
(6, 3, 'Categorias', 'circle', 'Categories', 2),
(7, 3, 'Subcategorias', 'circle', 'Subcategories', 3),
(8, 4, 'Clientes', 'circle', 'Clients', 1),
(9, 4, 'Transportista', 'circle', 'Carrier', 2),
(10, 4, 'Guía de Remisión', 'circle', 'Referralguide', 3),
(11, 4, 'Facturación por venta', 'circle', 'Billingpersale', 4),
(12, 4, 'Proforma', 'circle', 'Proforma', 5),
(13, 4, 'Nota de Crédito', 'circle', 'Creditnote', 6),
(14, 4, 'Nota de Venta', 'circle', 'Salenote', 7),
(15, 4, 'Venta a Crédito', 'circle', 'Creditsale', 8),
(16, 5, 'Ingresos', 'circle', 'Income', 1),
(17, 5, 'Proveedores', 'circle', 'Suppliers', 2),
(18, 6, 'Usuarios', 'circle', 'Users', 1),
(19, 6, 'Roles', 'circle', 'Roles', 2),
(20, 6, 'Sedes', 'circle', 'Campus', 3),
(21, 7, 'Facturación con IGV', 'circle', 'Igvinvoicing', 1),
(22, 7, 'Facturación sin IGV', 'circle', 'Igvbilling', 2),
(23, 7, 'Pagos de Servicios', 'circle', 'Payservices', 3),
(24, 7, 'Orden de Pago', 'circle', 'Payorder', 4),
(25, 7, 'Cotización', 'circle', 'Cotize', 5),
(26, 7, 'Servico Desarrollo', 'circle', 'Servicedevelopment', 6),
(27, 7, 'Soporte Técnico', 'circle', 'Supporttechnical', 7),
(28, 7, 'Soporte pago Mensual', 'circle', 'Supportmonthly', 8),
(29, 7, 'Técnicos', 'circle', 'Technicals', 9),
(30, 8, 'Préstamo Productos', 'circle', 'Loanproducts', 1),
(31, 8, 'Consulta de Préstamos', 'circle', 'Loaninquiry', 2),
(32, 9, 'Reporte Compras', 'circle', 'Purchasesreport', 1),
(33, 9, 'Reporte General Compras', 'circle', 'Purchasesreportgeneral', 2),
(34, 10, 'Ventas por Cliente', 'circle', 'Clientssale', 1),
(35, 10, 'Ventas por Usuario', 'circle', 'Usersale', 2),
(36, 10, 'Producto más Vendido', 'circle', 'Productsbestselling', 3),
(37, 10, 'Reporte General Ventas', 'circle', 'Salesgeneralreport', 4),
(38, 10, 'Reporte Venta Mensual', 'circle', 'Salesmonthlyreport', 5),
(39, 11, 'Descarga de TXT', 'circle', 'Downloadtxt', 1),
(43, 6, 'Datos de la Empresa', 'circle', 'Company', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sunat`
--

DROP TABLE IF EXISTS `sunat`;
CREATE TABLE IF NOT EXISTS `sunat` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sunat_endpoint` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cert_password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `certificate` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `password` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sunat`
--

INSERT INTO `sunat` (`id`, `sunat_endpoint`, `cert_password`, `certificate`, `user`, `password`) VALUES
(1, 'FE_BETA', 's01uci0n3sInt3gr1es', 'cert_66fd827091050.p12', 'admin', 'admin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `support`
--

DROP TABLE IF EXISTS `support`;
CREATE TABLE IF NOT EXISTS `support` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_clients` int NOT NULL,
  `id_technical` int NOT NULL,
  `service_code` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `service_area` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `phone` char(9) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `date_income` date NOT NULL,
  `date_departure` date NOT NULL,
  `brand` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `problem` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `solution` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `equipment_type` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `support_code` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `status_delivery` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `status_payment` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `status_service` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `total` int NOT NULL,
  `cuota` decimal(5,2) NOT NULL DEFAULT '0.00',
  `saldo` decimal(5,2) NOT NULL DEFAULT '0.00',
  `address` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `accessory` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `recommendation` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `warranty` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `service_type` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `id_clients` (`id_clients`),
  KEY `id_technical` (`id_technical`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `support_payment`
--

DROP TABLE IF EXISTS `support_payment`;
CREATE TABLE IF NOT EXISTS `support_payment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_clients` int NOT NULL,
  `id_user` int NOT NULL,
  `id_support` int NOT NULL,
  `id_payment_type` int NOT NULL,
  `date_pay` date NOT NULL,
  `cuota` decimal(5,2) NOT NULL DEFAULT '0.00',
  `saldo` decimal(5,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `id_clients` (`id_clients`),
  KEY `id_user` (`id_user`),
  KEY `id_support` (`id_support`),
  KEY `id_payment_type` (`id_payment_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `technicals`
--

DROP TABLE IF EXISTS `technicals`;
CREATE TABLE IF NOT EXISTS `technicals` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_document_type` int DEFAULT NULL,
  `document_number` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0',
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0',
  `phone` varchar(9) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0',
  `area` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0',
  `cargo` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0',
  `technical_type` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0',
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `id_document_type` (`id_document_type`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `technicals`
--

INSERT INTO `technicals` (`id`, `id_document_type`, `document_number`, `name`, `phone`, `area`, `cargo`, `technical_type`, `status`) VALUES
(1, 1, '71807058', 'WILDER FLORENTINO JULCA BRONCANO', '924367706', 'Soporte', 'Técnico', 'Tecnico Soporte', 1),
(3, 1, '71807058', 'GIANCARLOS CLAUDIO ORTIZ', '924367706', 'Soporte', 'Técnico', 'Técnico Soporte', 1),
(4, 1, '75232411', 'ALEXANDER DIAZ GRANADOS', '906979126', 'Facturación Electrónica', 'Técnico', 'Técnico Soporte', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_role` int NOT NULL,
  `id_document_type` int NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `document_number` varchar(45) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `telephone` varchar(45) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `user` varchar(45) NOT NULL,
  `password` text NOT NULL,
  `image_url` varchar(100) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_UNIQUE` (`user`),
  UNIQUE KEY `document_number_UNIQUE` (`document_number`),
  KEY `FK_USER_ROLE` (`id_role`),
  KEY `FK_USER_DOCUMENT_TYPE` (`id_document_type`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `id_role`, `id_document_type`, `first_name`, `last_name`, `document_number`, `address`, `telephone`, `email`, `user`, `password`, `image_url`, `status`, `active`) VALUES
(1, 1, 2, 'SolucionesJB', 'Jb', '10410697551', 'Calle López de Zúñiga Nº 547 Piso 2', '996720630', 'soluciones@gmail.com', 'SolucionesJB', '4d4755324d6a67324d6a4d784e5752684d474e695a6d457a5a546b314d546c684d544e6a596a6c6c5932593d', NULL, 1, 1),
(2, 1, 1, 'Diego', 'Uriarte', '74345432', 'Chancay', '996720631', 'grjere698@gmail.com', 'admin', '5a6d4d35597a41334e6a4a6a5a4459784d7a51355a6a457a596d593159324d7a597a566d4d5445784e7a633d', NULL, 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_campus`
--

DROP TABLE IF EXISTS `user_campus`;
CREATE TABLE IF NOT EXISTS `user_campus` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `id_campus` int NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `FK_USER_CAMPUS_CAMPUS` (`id_campus`),
  KEY `FK_USER_CAMPUS_USER` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `user_campus`
--

INSERT INTO `user_campus` (`id`, `id_user`, `id_campus`, `status`) VALUES
(1, 2, 4, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `voucher_type`
--

DROP TABLE IF EXISTS `voucher_type`;
CREATE TABLE IF NOT EXISTS `voucher_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `voucher_type`
--

INSERT INTO `voucher_type` (`id`, `code`, `description`, `status`) VALUES
(1, '01', 'Factura', 1),
(2, '03', 'Boleta de Venta', 1),
(3, '07', 'Nota de Credito', 1),
(4, '08', 'Nota de Debito', 1),
(5, '09', 'Guia de Remisión Remitente', 1),
(6, NULL, 'Cotización', 1),
(7, NULL, 'Orden de Pagos', 1),
(8, '12', 'Ticket', 1),
(9, NULL, 'Prestamo', 1);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `billingpersale_detail`
--
ALTER TABLE `billingpersale_detail`
  ADD CONSTRAINT `billingpersale_detail_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `billingpersale` (`id`);

--
-- Filtros para la tabla `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

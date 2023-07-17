-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 16-07-2023 a las 20:45:27
-- Versión del servidor: 8.0.31
-- Versión de PHP: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bellezabd`
--
CREATE DATABASE IF NOT EXISTS `bellezabd` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `bellezabd`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `colores_productos`
--

DROP TABLE IF EXISTS `colores_productos`;
CREATE TABLE IF NOT EXISTS `colores_productos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `color` varchar(250) NOT NULL,
  `producto_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `colores_productos_producto_id_31a53736` (`producto_id`)
) ENGINE=MyISAM AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `colores_productos`
--

INSERT INTO `colores_productos` (`id`, `color`, `producto_id`) VALUES
(1, '#E4E6EF', 1),
(2, '#E4E6EF', 2),
(3, '#E4E6EF', 3),
(4, '#E4E6EF', 4),
(5, '#E4E6EF', 5),
(6, '#E4E6EF', 6),
(7, '#E4E6EF', 7),
(8, '#181C32', 8),
(9, '#E4E6EF', 9),
(10, '#20c997', 10),
(11, '#F3F6F9', 11),
(12, '#F3F6F9', 12),
(13, '#F3F6F9', 13),
(14, '#FFA800', 14),
(15, '#F64E60', 15),
(16, '#F3F6F9', 16),
(17, '#F3F6F9', 17),
(18, '#FFC8B7', 18),
(19, '#FFAC92', 18),
(20, '#3F4254', 19),
(21, '#FFC8B7', 20),
(22, '#FFAC92', 20),
(23, '#FFAC92', 21),
(24, '#fd7e14', 21),
(25, '#F64E60', 21),
(26, '#181C32', 22),
(27, '#F3F6F9', 23),
(28, '#F3F6F9', 24),
(29, '#F3F6F9', 25),
(30, '#F3F6F9', 26),
(31, '#F3F6F9', 27),
(32, '#181C32', 28),
(33, '#FFAC92', 29),
(34, '#fd7e14', 30),
(35, '#fd7e14', 31),
(36, '#20c997', 32),
(37, '#FFAC92', 33),
(38, '#3F4254', 34),
(39, '#E5D3B0', 35),
(40, '#FEC2E1', 36),
(41, '#FFA800', 37),
(42, '#FA8938', 38),
(43, '#E4E6EF', 39),
(44, '#E4E6EF', 40),
(45, '#ffc107', 41),
(46, '#F3F6F9', 42),
(47, '#181C32', 43),
(48, '#ffffff', 44),
(49, '#ffffff', 45),
(50, '#181C32', 45),
(51, '#007bff', 45),
(52, '#007bff', 45),
(53, '#F64E60', 46),
(54, '#FA0905', 47),
(55, '#FFBBA0', 48),
(56, '#FFBBA0', 49),
(57, '#FFBBA0', 50),
(58, '#20c997', 51),
(59, '#FFBBA0', 52),
(60, '#E4E6EF', 53),
(61, '#E4E6EF', 54),
(62, '#F64E60', 55),
(63, '#F3F6F9', 56),
(64, '#F3F6F9', 57),
(65, '#FFA800', 58),
(66, '#F3F6F9', 58),
(67, '#ffffff', 59),
(68, '#FFBBA0', 59),
(69, '#FA73E7', 60),
(70, '#FFA800', 60),
(71, '#FA0905', 61),
(72, '#E6634C', 61),
(73, '#FFBBA0', 61),
(74, '#F3F6F9', 62),
(75, '#3F4254', 63),
(76, '#FA0905', 64),
(77, '#E6634C', 64),
(78, '#FFBBA0', 64);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamentos`
--

DROP TABLE IF EXISTS `departamentos`;
CREATE TABLE IF NOT EXISTS `departamentos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(250) NOT NULL,
  `descripcion` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `departamentos`
--

INSERT INTO `departamentos` (`id`, `nombre`, `descripcion`) VALUES
(1, 'Cuidado Facial', ''),
(2, 'Cuidado Personal', ''),
(3, 'Cabello', ''),
(4, 'Uñas', ''),
(5, 'Maquillaje', ''),
(6, 'Fragancias', ''),
(7, 'Cosmeticos Hombre', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `descuento_productos`
--

DROP TABLE IF EXISTS `descuento_productos`;
CREATE TABLE IF NOT EXISTS `descuento_productos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cantidad_minima` int NOT NULL,
  `cantidad_maxima` int NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `producto_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `descuento_productos_producto_id_70eb32f9` (`producto_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `descuento_productos`
--

INSERT INTO `descuento_productos` (`id`, `cantidad_minima`, `cantidad_maxima`, `valor`, `producto_id`) VALUES
(1, 1, 50, '10.00', 1),
(2, 2, 50, '10.00', 2),
(3, 2, 50, '5.00', 3),
(4, 2, 50, '10.00', 4),
(5, 2, 50, '15.00', 8),
(6, 2, 50, '5.00', 12),
(7, 2, 50, '5.00', 13),
(8, 2, 50, '10.00', 20),
(9, 2, 50, '5.00', 22),
(10, 2, 50, '10.00', 27),
(11, 2, 50, '20.00', 30),
(12, 2, 50, '10.00', 35),
(13, 2, 50, '10.00', 36),
(14, 2, 50, '10.00', 44),
(15, 2, 50, '10.00', 52);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedidos`
--

DROP TABLE IF EXISTS `detalle_pedidos`;
CREATE TABLE IF NOT EXISTS `detalle_pedidos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `valor_unitario` decimal(10,2) NOT NULL,
  `cantidad` int NOT NULL,
  `descuento` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `color_id` int NOT NULL,
  `pedido_id` int NOT NULL,
  `producto_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `detalle_pedidos_color_id_8f1d9252` (`color_id`),
  KEY `detalle_pedidos_pedido_id_fd3421a7` (`pedido_id`),
  KEY `detalle_pedidos_producto_id_d2b57948` (`producto_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'productos', '0001_initial', '2023-07-16 19:12:01.446166'),
(2, 'productos', '0002_coloresproductos_descuentoproductos_productos', '2023-07-16 19:12:01.813381'),
(3, 'pedidos', '0001_initial', '2023-07-16 19:12:06.848466');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
CREATE TABLE IF NOT EXISTS `pedidos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cedula` varchar(20) NOT NULL,
  `direccion` longtext NOT NULL,
  `fecha` date NOT NULL,
  `valor_total` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

DROP TABLE IF EXISTS `productos`;
CREATE TABLE IF NOT EXISTS `productos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(250) NOT NULL,
  `descripcion` longtext NOT NULL,
  `imagen` longtext NOT NULL,
  `cantidad` int NOT NULL,
  `valor_unitario` decimal(10,2) NOT NULL,
  `departamento_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `productos_departamento_id_dd44de1f` (`departamento_id`)
) ENGINE=MyISAM AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `imagen`, `cantidad`, `valor_unitario`, `departamento_id`) VALUES
(1, 'FRAGANCIA WHITE', '', '', 1500, '28000.00', 6),
(2, 'FRAGANCIA EU TOILETTE SWEET', '', '', 1500, '18000.00', 6),
(3, 'FRAGANCIAS EU TOILETTE', '', '', 1500, '20000.00', 6),
(4, 'FRAGANCIA PARADISE', '', '', 1500, '30000.00', 6),
(5, 'FRAGANCIA EXHUBERANT', '', '', 1500, '30000.00', 6),
(6, 'FRAGANCIA SPECIAL MOMENT', '', '', 1500, '30000.00', 6),
(7, 'FRAGANCIA SPECIAL MOMENT MEMORY', '', '', 1500, '24000.00', 6),
(8, 'PROTEINA CAPILAR', '', '', 1500, '52000.00', 3),
(9, 'SHAMPOO CEBOLLA', '', '', 1500, '23000.00', 3),
(10, 'TRATAMIENTO DE CEBOLLA', '', '', 1500, '27000.00', 3),
(11, 'SILICONA RESTAURADORA', '', '', 1500, '12000.00', 3),
(12, 'SHAMPOO', '', '', 1500, '12000.00', 3),
(13, 'ACONDICIONADOR', '', '', 1500, '12000.00', 3),
(14, 'DESMAQUILLADOR ROSAS', '', '', 1500, '17000.00', 5),
(15, 'BASE LÍQUIDA PERFECT COVER', '', '', 1500, '20000.00', 5),
(16, 'LAPIZ DE LABIOS PERFECT LIPLINER', '', '', 1500, '10000.00', 5),
(17, 'TÓNICO DE ROSAS + COLÁGENO', '', '', 1500, '13000.00', 5),
(18, 'CORRECTOR MATTE COVERAGE', '', '', 1500, '8000.00', 5),
(19, 'MASCARILLA PEEL OF', '', '', 1500, '12800.00', 5),
(20, 'POLVO FULL PROTECTION', '', '', 1500, '13600.00', 5),
(21, 'LABIAL BARRA STAY COLOR', '', '', 1500, '9600.00', 5),
(22, 'PESTAÑINA EXTRA VOLUME', '', '', 1500, '12800.00', 5),
(23, 'DESODORANTE HOME', '', '', 1500, '5600.00', 7),
(24, 'DESODORANTE AQUASPORT', '', '', 1500, '5600.00', 7),
(25, 'FRAGANCIA NAVIGARE', '', '', 1500, '26400.00', 7),
(26, 'FRAGANCIA AQUASPORT', '', '', 1500, '33000.00', 7),
(27, 'FRAGANCIA TOILETTE', '', '', 1500, '16000.00', 7),
(28, 'Mascarilla Puntos Negros', '', '', 1500, '1000.00', 1),
(29, 'Mascarilla Colageno Para Labios Pilaten', '', '', 1500, '2000.00', 1),
(30, 'Extractor De Puntos Negros Digital Holy', '', '', 1500, '70000.00', 1),
(31, 'Masajeador Beauty Bar Holy', '', '', 1500, '40000.00', 1),
(32, 'Mascarilla De Aloe', '', '', 1500, '4000.00', 1),
(33, 'Mascarilla De Caracol', '', '', 1500, '4000.00', 1),
(34, 'Mascarilla Control Grasa', '', '', 1500, '4000.00', 1),
(35, 'Lip Mask De Propoleo', '', '', 1500, '15000.00', 1),
(36, 'Gua Sha Facial De Cuarzo Rosa Holy', '', '', 1500, '30000.00', 1),
(37, 'Agua De Hamamelis Pili', '', '', 1500, '13000.00', 1),
(38, 'Rodillo Facial De Cuarzo Rosa Holy', '', '', 1500, '13000.00', 1),
(39, 'Jabón Facial Piel Mixta O Normal', '', '', 1500, '27000.00', 1),
(40, 'Crema Contorno De Ojos', '', '', 1500, '20000.00', 1),
(41, 'Serum Gold Hidratante Y Reparador', '', '', 1500, '20000.00', 1),
(42, 'Loción Azufrada', '', '', 1500, '20000.00', 1),
(43, 'Piedra Volcánica En Roll On - Quita Grasa', '', '', 1500, '16000.00', 1),
(44, 'Depiladora 2 En 1 Holy', '', '', 1500, '90000.00', 2),
(45, 'Aro Led Selfie', '', '', 1500, '6000.00', 2),
(46, 'Depiladora 4 En 1', '', '', 1500, '50000.00', 2),
(47, 'Aceite De Almendras', '', '', 1500, '17000.00', 2),
(48, 'Mascarilla Exfoliante Para Pies', '', '', 1500, '10000.00', 2),
(49, 'Mascarilla Hidratante Para Piess', '', '', 1500, '10000.00', 2),
(50, 'Mascarilla Hidratante Para Manos', '', '', 1500, '7000.00', 2),
(51, 'Exfoliante Corporal De Pepino', '', '', 1500, '22000.00', 2),
(52, 'Removedor Recargable De Callos Para Pies', '', '', 1500, '140000.00', 2),
(53, 'Depilador Para Cejas Recargable', '', '', 1500, '35000.00', 2),
(54, 'Aceite Para Uñas', '', '', 1500, '4000.00', 4),
(55, 'Guantes De Protección Uv-Led Holy', '', '', 1500, '4000.00', 4),
(56, 'Lampara Para Uñas 54W', '', '', 1500, '60000.00', 4),
(57, 'Lampara Para Uñas 48W', '', '', 1500, '50000.00', 4),
(58, 'Lápiz Con Efecto Espejo Para Uñas', '', '', 1500, '10000.00', 4),
(59, 'Anillo De Resina Para Uñas Aurora', '', '', 1500, '8000.00', 4),
(60, 'Extractor De Polvo Para Uñas', '', '', 1500, '80000.00', 4),
(61, 'Esmalte Semipermanente Tonos Nude 7.3Ml Holy', '', '', 1500, '15000.00', 4),
(62, 'Lima Para Uñas 100/180', '', '', 1500, '5000.00', 4),
(63, 'Ultrabond Primer 7.3Ml Holy', '', '', 1500, '15000.00', 4),
(64, 'Esmalte Semipermanente Tonos Rosas 15Ml', '', '', 1500, '25000.00', 4);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

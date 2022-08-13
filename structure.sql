-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-08-2022 a las 18:02:32
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
-- Base de datos: `mrcoffeedb`
--
CREATE DATABASE IF NOT EXISTS `mrcoffeedb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `mrcoffeedb`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cart_item`
--

DROP TABLE IF EXISTS `cart_item`;
CREATE TABLE IF NOT EXISTS `cart_item` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `precio_venta` decimal(8,2) NOT NULL,
  `cantidad` int(3) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `categoria` varchar(15) NOT NULL,
  `imagen` varchar(21) NOT NULL,
  `product_id` int(13) DEFAULT NULL,
  `ventas_id` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_item_product_id_foreign` (`product_id`),
  KEY `cart_item_ventas_id_foreign` (`ventas_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(13) NOT NULL,
  `name` varchar(40) NOT NULL,
  `image` varchar(30) DEFAULT 'default-image.png',
  `description` varchar(120) NOT NULL,
  `stock` int(5) DEFAULT 0,
  `price` decimal(6,2) NOT NULL,
  `offer` int(2) DEFAULT 0,
  `rating` decimal(2,1) DEFAULT 0.0,
  `id_categoryP` int(5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id_categoryP_foreign` (`id_categoryP`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `name`, `image`, `description`, `stock`, `price`, `offer`, `rating`, `id_categoryP`) VALUES
(1, 'Vainilla Latte', '1.png', 'Café espresso con leche al vapor y toques de vainilla.', 100, '753.00', 0, '5.0', 1),
(2, 'Latte', '2.png', 'Café espresso con leche vaporizada.', 100, '896.00', 0, '5.0', 1),
(3, 'Dulce de leche Latte', '3.png', 'Café espresso con dulce de leche, leche al vapor con crema batida y salsa de caramelo.', 100, '735.00', 0, '4.0', 1),
(4, 'Cappuccino', '4.png', 'Café espresso, leche vaporizada y abundante espuma de leche.', 23, '325.00', 0, '2.0', 1),
(5, 'Americano', '5.png', 'Café espresso combinado con agua al mejor estilo americano.', 0, '531.00', 0, '5.0', 1),
(6, 'Croissant Relleno con Crema de Avellanas', '6.png', 'Croissant con masa de hojaldre y cubierto con una salsa de cacao y avellanas.', 100, '300.00', 0, '2.5', 2),
(7, 'Croissant', '7.png', 'Elaborado con masa de hojaldre crujiente y salada, nuestro Croissant se hornea especialmente para vos.', 100, '400.00', 0, '4.0', 2),
(8, 'Chocolate Croissant', '8.png', 'Exquisita masa de hojaldre rellena de chocolate semiamargo y horneado especialmente para vos.', 100, '250.00', 0, '3.5', 2),
(9, 'Medialuna', '9.png', 'La clásica medialuna reversionada a la manera de MrCoffee: Crujiente, esponjosa, de mayor tamaño y ¡recién horneada!', 1, '48.00', 1, '3.0', 2),
(10, 'Medialuna rellena con jamón y queso', '10.png', 'Nuestra Mezzaluna recién horneada, rellena con queso tybo y jamón cocido.', 0, '433.00', 0, '5.0', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product_category`
--

DROP TABLE IF EXISTS `product_category`;
CREATE TABLE IF NOT EXISTS `product_category` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `product_category`
--

INSERT INTO `product_category` (`id`, `name`) VALUES
(1, 'coffee'),
(2, 'Food');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_category`
--

DROP TABLE IF EXISTS `user_category`;
CREATE TABLE IF NOT EXISTS `user_category` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `user_category`
--

INSERT INTO `user_category` (`id`, `name`) VALUES
(1, 'Admin'),
(2, 'User');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(40) NOT NULL,
  `last_name` varchar(40) NOT NULL,
  `image` varchar(30) DEFAULT 'defaultimg.jpg',
  `email` varchar(100) NOT NULL,
  `password` varchar(65) NOT NULL,
  `id_category_U` int(5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usuarios_id_category_U_foreign` (`id_category_U`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `first_name`, `last_name`, `image`, `email`, `password`, `id_category_U`) VALUES
(1, 'Santiago', 'boquita', 'img-1660161772572.jpg', 'boquita@santiago.com', '$2a$10$w8D4Oo/PKv.06amR7M54uuaMyGe8AEO.J..FUC5q6ijb57mLcONGK', 1),
(2, 'Jeremias', 'River', 'img-1660360317331.gif', 'river@jeremias.com', '$2a$10$GKqiBlH2rFKT0YrZEpEZPOT4jqGJ1MtmOsuA3N7yC4u4E74feCLd6', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

DROP TABLE IF EXISTS `ventas`;
CREATE TABLE IF NOT EXISTS `ventas` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `fecha` datetime NOT NULL,
  `estado` varchar(15) NOT NULL,
  `total` decimal(8,2) NOT NULL,
  `cobrado` datetime NOT NULL,
  `user_id` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ventas_user_id_foreign` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cart_item`
--
ALTER TABLE `cart_item`
  ADD CONSTRAINT `cart_item_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `cart_item_ibfk_2` FOREIGN KEY (`ventas_id`) REFERENCES `ventas` (`id`);

--
-- Filtros para la tabla `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`id_categoryP`) REFERENCES `product_category` (`id`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_category_U`) REFERENCES `user_category` (`id`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `usuario` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

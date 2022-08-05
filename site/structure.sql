-- MySQL Script generated by MySQL Workbench
-- Mon Aug  1 11:25:39 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mrcoffeedb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mrcoffeedb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mrcoffeedb` DEFAULT CHARACTER SET utf8 ;
USE `mrcoffeedb` ;

-- -----------------------------------------------------
-- Tabla `mrcoffeedb`.`userCategory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mrcoffeedb`.`userCategory` (
  `id` INT(5) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Tabla `mrcoffeedb`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mrcoffeedb`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(40) NOT NULL,
  `last_name` VARCHAR(40) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `password` VARCHAR(32) NOT NULL,
  `image` VARCHAR(45) NOT NULL,
  `id_categoryu` INT(5) NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`id_categoryu`)
    REFERENCES `mrcoffeedb`.`userCategory` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Tabla `mrcoffeedb`.`productCategory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mrcoffeedb`.`productCategory` (
  `id` INT(5) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Tabla `mrcoffeedb`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mrcoffeedb`.`product` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(40) NOT NULL,
  `image` VARCHAR(20) NOT NULL,
  `description` VARCHAR(120) NOT NULL,
  `stock` INT(5) NOT NULL,
  `price` FLOAT NOT NULL,
  `offer` INT(2) NOT NULL,
  `rating` FLOAT NOT NULL,
  `id_categoryp` INT(5) NOT NULL,
  PRIMARY KEY (`id`),
   FOREIGN KEY (`id_categoryp`)
    REFERENCES `mrcoffeedb`.`productCategory` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Tabla `mrcoffeedb`.`ventas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mrcoffeedb`.`ventas` (
  `id` INT(5) NOT NULL AUTO_INCREMENT,
  `fecha` DATETIME NOT NULL,
  `estado` VARCHAR(15) NOT NULL,
  `total` FLOAT NOT NULL,
  `cobrado` DATETIME NOT NULL,
  `user_id` INT(5) NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`user_id`)
    REFERENCES `mrcoffeedb`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Tabla `mrcoffeedb`.`cartItem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mrcoffeedb`.`cartItem` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(40) NOT NULL,
  `precio_venta` FLOAT NOT NULL,
  `cantidad` FLOAT NOT NULL,
  `categoria` VARCHAR(15) NOT NULL,
  `imagen` VARCHAR(21) NOT NULL,
  `product_id` INT NOT NULL,
  `ventas_id` INT(5) NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`product_id`)
    REFERENCES `mrcoffeedb`.`product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  FOREIGN KEY (`ventas_id`)
    REFERENCES `mrcoffeedb`.`ventas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
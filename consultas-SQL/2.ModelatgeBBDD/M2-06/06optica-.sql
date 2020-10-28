-- MySQL Script generated by MySQL Workbench
-- Sat Oct 24 16:28:49 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema 06optica
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema 06optica
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `06optica` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `06optica` ;

-- -----------------------------------------------------
-- Table `06optica`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `06optica`.`clientes` (
  `c_id` INT NOT NULL AUTO_INCREMENT,
  `c_nom` VARCHAR(45) NOT NULL,
  `c_tlf` VARCHAR(9) NOT NULL,
  `c_adresa` VARCHAR(250) NOT NULL,
  `c_alta` DATE NOT NULL,
  PRIMARY KEY (`c_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `06optica`.`empleats`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `06optica`.`empleats` (
  `em_id` INT NOT NULL AUTO_INCREMENT,
  `em_nom` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`em_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `06optica`.`proveidor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `06optica`.`proveidor` (
  `prov_marca_model` INT NOT NULL AUTO_INCREMENT,
  `prov_marca` VARCHAR(45) NOT NULL,
  `prov_NIF` VARCHAR(8) NOT NULL,
  `prov_nom` VARCHAR(30) NOT NULL,
  `prov_tlf` VARCHAR(9) NOT NULL,
  `prov_adresa` VARCHAR(250) NOT NULL,
  PRIMARY KEY (`prov_marca_model`),
  INDEX `prov_NIF` (`prov_NIF` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `06optica`.`ulleres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `06optica`.`ulleres` (
  `u_id` INT NOT NULL AUTO_INCREMENT,
  `prov_marca_model` INT NOT NULL,
  `u_graus-D` VARCHAR(9) NOT NULL,
  `u_graus-E` VARCHAR(9) NOT NULL,
  `u_montura` VARCHAR(20) NOT NULL,
  `u_monturaColor` VARCHAR(25) NOT NULL,
  `u_colorVidre` VARCHAR(25) NOT NULL,
  `u_preu` INT NOT NULL,
  PRIMARY KEY (`u_id`),
  INDEX `id_proveidor_idx` (`prov_marca_model` ASC) VISIBLE,
  CONSTRAINT `fk-ulleres`
    FOREIGN KEY (`prov_marca_model`)
    REFERENCES `06optica`.`proveidor` (`prov_marca_model`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `06optica`.`ventas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `06optica`.`ventas` (
  `v_id` INT NOT NULL AUTO_INCREMENT,
  `c_id` INT NOT NULL,
  `u_id` INT NOT NULL,
  `em_id` INT NOT NULL,
  `f_pedido` DATE NOT NULL,
  PRIMARY KEY (`v_id`),
  INDEX `id_cliente_idx` (`c_id` ASC) VISIBLE,
  INDEX `id_ulleres_idx` (`u_id` ASC) VISIBLE,
  INDEX `id_empleats_idx` (`em_id` ASC) VISIBLE,
  CONSTRAINT `fk-clientes`
    FOREIGN KEY (`c_id`)
    REFERENCES `06optica`.`clientes` (`c_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk-ulleres2`
    FOREIGN KEY (`u_id`)
    REFERENCES `06optica`.`ulleres` (`u_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk-empleats`
    FOREIGN KEY (`em_id`)
    REFERENCES `06optica`.`empleats` (`em_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
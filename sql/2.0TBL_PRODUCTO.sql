-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema TAREA1
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema TAREA1
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `TAREA1` DEFAULT CHARACTER SET utf8 ;
USE `TAREA1` ;

-- -----------------------------------------------------
-- Table `TAREA1`.`tbl_prov`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TAREA1`.`tbl_prov` (
  `id_CatProv` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`id_CatProv`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TAREA1`.`tbl_marca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TAREA1`.`tbl_marca` (
  `id_CatMarca` INT NOT NULL AUTO_INCREMENT,
  `marca` VARCHAR(45) NULL,
  PRIMARY KEY (`id_CatMarca`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TAREA1`.`tbl_Producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TAREA1`.`tbl_Producto` (
  `Id` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  `url` VARCHAR(200) NOT NULL,
  `precio` FLOAT NOT NULL,
  `costo` FLOAT NOT NULL,
  `tbl_prov_id_CatProv` INT NOT NULL,
  `tbl_marca_id_CatMarca` INT NOT NULL,
  PRIMARY KEY (`Id`),
  CONSTRAINT `fk_tbl_Producto_tbl_prov1`
    FOREIGN KEY (`tbl_prov_id_CatProv`)
    REFERENCES `TAREA1`.`tbl_prov` (`id_CatProv`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_Producto_tbl_marca1`
    FOREIGN KEY (`tbl_marca_id_CatMarca`)
    REFERENCES `TAREA1`.`tbl_marca` (`id_CatMarca`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_tbl_Producto_tbl_prov1_idx` ON `TAREA1`.`tbl_Producto` (`tbl_prov_id_CatProv` ASC) VISIBLE;

CREATE INDEX `fk_tbl_Producto_tbl_marca1_idx` ON `TAREA1`.`tbl_Producto` (`tbl_marca_id_CatMarca` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

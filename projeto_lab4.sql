-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`DimAtleta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`DimAtleta` (
  `id_atleta` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_atleta`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DimTempo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`DimTempo` (
  `id_tempo` INT NOT NULL,
  `ano` INT NOT NULL,
  `mes` INT NOT NULL,
  `dia` INT NOT NULL,
  `hora` INT NOT NULL,
  PRIMARY KEY (`id_tempo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DimLocal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`DimLocal` (
  `id_local` INT NOT NULL,
  `local` VARCHAR(45) NOT NULL,
  `estado` VARCHAR(45) NOT NULL,
  `arena` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_local`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DimClube`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`DimClube` (
  `id_clube` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `cidade` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_clube`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`FatCampeonato`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`FatCampeonato` (
  `gols` INT NOT NULL,
  `escanteio` INT NOT NULL,
  `impedimento` INT NOT NULL,
  `falta` INT NOT NULL,
  `passe` INT NOT NULL,
  `posse_de_bola` INT NOT NULL,
  `precisao_passe` INT NOT NULL,
  `chute` INT NOT NULL,
  `chute_no_alvo` INT NOT NULL,
  `id_atleta` INT NOT NULL,
  `id_tempo` INT NOT NULL,
  `id_local` INT NOT NULL,
  `id_clube` INT NOT NULL,
  PRIMARY KEY (`id_atleta`, `id_tempo`, `id_local`, `id_clube`),
  INDEX `fk_FatCampeonato_DimTempo1_idx` (`id_tempo` ASC) VISIBLE,
  INDEX `fk_FatCampeonato_DimLocal1_idx` (`id_local` ASC) VISIBLE,
  INDEX `fk_FatCampeonato_DimClube1_idx` (`id_clube` ASC) VISIBLE,
  CONSTRAINT `fk_FatCampeonato_DimAtleta`
    FOREIGN KEY (`id_atleta`)
    REFERENCES `mydb`.`DimAtleta` (`id_atleta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FatCampeonato_DimTempo1`
    FOREIGN KEY (`id_tempo`)
    REFERENCES `mydb`.`DimTempo` (`id_tempo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FatCampeonato_DimLocal1`
    FOREIGN KEY (`id_local`)
    REFERENCES `mydb`.`DimLocal` (`id_local`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FatCampeonato_DimClube1`
    FOREIGN KEY (`id_clube`)
    REFERENCES `mydb`.`DimClube` (`id_clube`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

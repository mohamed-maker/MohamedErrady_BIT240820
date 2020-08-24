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
-- Table `mydb`.`Gene`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Gene` (
  `ID` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Location` INT NULL,
  `Description` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Mutation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Mutation` (
  `Chromosomal location` INT NULL,
  `ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `Mut_Gene_idx` (`Chromosomal location` ASC) VISIBLE,
  CONSTRAINT `Mut_Gene`
    FOREIGN KEY (`Chromosomal location`)
    REFERENCES `mydb`.`Gene` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Patient` (
  `Name` VARCHAR(45) NULL,
  `Sex` ENUM("M", "F") NULL,
  `Age_diagnose` INT NULL,
  `ID` INT NOT NULL,
  `mut_id` INT NULL,
  PRIMARY KEY (`ID`),
  INDEX `Pat_mut_idx` (`mut_id` ASC) VISIBLE,
  CONSTRAINT `Pat_mut`
    FOREIGN KEY (`mut_id`)
    REFERENCES `mydb`.`Mutation` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- MySQL Script generated by MySQL Workbench
-- Sun Dec  3 05:18:02 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema books
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `books` ;

-- -----------------------------------------------------
-- Schema books
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `books` DEFAULT CHARACTER SET utf8 ;
USE `books` ;

-- -----------------------------------------------------
-- Table `books`.`authors`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `books`.`authors` ;

CREATE TABLE IF NOT EXISTS `books`.`authors` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `author_name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `books`.`books`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `books`.`books` ;

CREATE TABLE IF NOT EXISTS `books`.`books` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NULL,
  `author_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_books_authors1_idx` (`author_id` ASC) VISIBLE,
  CONSTRAINT `fk_books_authors1`
    FOREIGN KEY (`author_id`)
    REFERENCES `books`.`authors` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `books`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `books`.`users` ;

CREATE TABLE IF NOT EXISTS `books`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `books`.`favorites`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `books`.`favorites` ;

CREATE TABLE IF NOT EXISTS `books`.`favorites` (
  `user_id` INT NOT NULL,
  `books_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `books_id`),
  INDEX `fk_users_has_books_books1_idx` (`books_id` ASC) VISIBLE,
  INDEX `fk_users_has_books_users1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_users_has_books_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `books`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_has_books_books1`
    FOREIGN KEY (`books_id`)
    REFERENCES `books`.`books` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

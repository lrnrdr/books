-- MySQL Script generated by MySQL Workbench
-- Thu Nov 30 20:42:03 2023
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
  `author id` INT NOT NULL AUTO_INCREMENT,
  `author_name` VARCHAR(45) NULL,
  PRIMARY KEY (`author id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `books`.`books`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `books`.`books` ;

CREATE TABLE IF NOT EXISTS `books`.`books` (
  `book id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NULL,
  `authors_author id` INT NOT NULL,
  PRIMARY KEY (`book id`),
  INDEX `fk_books_authors1_idx` (`authors_author id` ASC) VISIBLE,
  CONSTRAINT `fk_books_authors1`
    FOREIGN KEY (`authors_author id`)
    REFERENCES `books`.`authors` (`author id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `books`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `books`.`users` ;

CREATE TABLE IF NOT EXISTS `books`.`users` (
  `user id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  PRIMARY KEY (`user id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `books`.`favorites`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `books`.`favorites` ;

CREATE TABLE IF NOT EXISTS `books`.`favorites` (
  `books_book id` INT NOT NULL,
  `users_user id` INT NOT NULL,
  PRIMARY KEY (`books_book id`, `users_user id`),
  INDEX `fk_books_has_users_users1_idx` (`users_user id` ASC) VISIBLE,
  INDEX `fk_books_has_users_books1_idx` (`books_book id` ASC) VISIBLE,
  CONSTRAINT `fk_books_has_users_books1`
    FOREIGN KEY (`books_book id`)
    REFERENCES `books`.`books` (`book id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_books_has_users_users1`
    FOREIGN KEY (`users_user id`)
    REFERENCES `books`.`users` (`user id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
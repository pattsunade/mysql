-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema twitter
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema twitter
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `twitter` DEFAULT CHARACTER SET utf8 ;
USE `twitter` ;

-- -----------------------------------------------------
-- Table `twitter`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `twitter`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `handle` VARCHAR(45) NULL,
  `age` INT NULL,
  `created_at` DATETIME NULL,
  `upadated_at` DATETIME NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `twitter`.`fallows`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `twitter`.`fallows` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `follower_id` INT NULL,
  `created_at` DATETIME NULL,
  `upadated` DATETIME NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_fallows_users1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_fallows_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `twitter`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `twitter`.`tweets`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `twitter`.`tweets` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `twitter` VARCHAR(45) NULL,
  `created_at` DATETIME NULL,
  `upadated_at` DATETIME NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_tweets_users1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_tweets_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `twitter`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `twitter`.`faves`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `twitter`.`faves` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tweet_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `created_at` DATETIME NULL,
  `upadated_at` DATETIME NULL,
  INDEX `fk_twitter_has_users_users1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_twitter_has_users_twitter_idx` (`tweet_id` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_twitter_has_users_twitter`
    FOREIGN KEY (`tweet_id`)
    REFERENCES `twitter`.`tweets` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_twitter_has_users_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `twitter`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

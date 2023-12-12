
CREATE DATABASE IF NOT EXISTS `sprint1`;
USE `sprint1`;

CREATE TABLE IF NOT EXISTS `user_list` (
  `id` varchar(20) NOT NULL,
  `password` varchar(64) NOT NULL,
  `name` varchar(20) NOT NULL,
  `phonenumber` varchar(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `cart` (
  `cart_seq` int NOT NULL AUTO_INCREMENT,
  `id` varchar(20) NOT NULL,
  `seq` int NOT NULL,
  `qty` int NOT NULL,
  PRIMARY KEY (`cart_seq`),
  KEY `fk_cart_id` (`id`),
  KEY `fk_cart_seq` (`seq`),
  CONSTRAINT `fk_cart_id` FOREIGN KEY (`id`) REFERENCES `user_list` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_cart_seq` FOREIGN KEY (`seq`) REFERENCES `tire_list` (`seq`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `purchase_history` (
  `purchase_seq` int NOT NULL AUTO_INCREMENT,
  `id` varchar(20) NOT NULL,
  `seq` int NOT NULL,
  `purchase_qty` int NOT NULL,
  `purchase_date` date NOT NULL,
  PRIMARY KEY (`purchase_seq`),
  KEY `fk_purchase_id` (`id`),
  KEY `fk_purchase_seq` (`seq`),
  CONSTRAINT `fk_purchase_id` FOREIGN KEY (`id`) REFERENCES `user_list` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_purchase_seq` FOREIGN KEY (`seq`) REFERENCES `tire_list` (`seq`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `review` (
  `review_seq` int NOT NULL AUTO_INCREMENT,
  `id` varchar(20) NOT NULL,
  `seq` int NOT NULL,
  `content` text NOT NULL,
  `date` DATE NOT NULL,
  PRIMARY KEY (`review_seq`),
  KEY `fk_review_id` (`id`),
  KEY `fk_review_seq` (`seq`),
  CONSTRAINT `fk_review_id` FOREIGN KEY (`id`) REFERENCES `user_list` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_review_seq` FOREIGN KEY (`seq`) REFERENCES `tire_list` (`seq`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `search_history` (
  `search_seq` int NOT NULL AUTO_INCREMENT,
  `id` varchar(20) NOT NULL,
  `seq` int NOT NULL,
  PRIMARY KEY (`search_seq`),
  KEY `fk_search_id` (`id`),
  KEY `fk_search_seq` (`seq`),
  CONSTRAINT `fk_search_id` FOREIGN KEY (`id`) REFERENCES `user_list` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_search_seq` FOREIGN KEY (`seq`) REFERENCES `tire_list` (`seq`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE DATABASE `worldnews` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

use`worldnews`;

CREATE TABLE `category` (
                            `id` int NOT NULL AUTO_INCREMENT,
                            `name` varchar(50) COLLATE utf8mb4_polish_ci NOT NULL,
                            `description` varchar(500) COLLATE utf8mb4_polish_ci DEFAULT NULL,
                            PRIMARY KEY (`id`),
                            UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

CREATE TABLE `user` (
                        `id` int NOT NULL AUTO_INCREMENT,
                        `username` varchar(50) COLLATE utf8mb4_polish_ci NOT NULL,
                        `email` varchar(100) COLLATE utf8mb4_polish_ci NOT NULL,
                        `registration_date` datetime NOT NULL,
                        `password` varchar(100) COLLATE utf8mb4_polish_ci NOT NULL,
                        PRIMARY KEY (`id`),
                        UNIQUE KEY `username` (`username`),
                        UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

CREATE TABLE `discovery` (
                             `id` int NOT NULL AUTO_INCREMENT,
                             `title` varchar(80) COLLATE utf8mb4_polish_ci NOT NULL,
                             `url` varchar(500) COLLATE utf8mb4_polish_ci NOT NULL,
                             `description` varchar(500) COLLATE utf8mb4_polish_ci NOT NULL,
                             `date_added` datetime NOT NULL,
                             `category_id` int NOT NULL,
                             `user_id` int NOT NULL,
                             PRIMARY KEY (`id`),
                             UNIQUE KEY `url` (`url`),
                             KEY `category_id` (`category_id`),
                             KEY `user_id` (`user_id`),
                             CONSTRAINT `discovery_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
                             CONSTRAINT `discovery_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

CREATE TABLE `user_role` (
                             `username` varchar(50) COLLATE utf8mb4_polish_ci NOT NULL,
                             `role_name` varchar(20) COLLATE utf8mb4_polish_ci NOT NULL DEFAULT 'USER',
                             PRIMARY KEY (`username`,`role_name`),
                             CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

CREATE TABLE `vote` (
                        `user_id` int NOT NULL,
                        `discovery_id` int NOT NULL,
                        `type` enum('UP','DOWN') COLLATE utf8mb4_polish_ci NOT NULL,
                        `date_added` datetime NOT NULL,
                        PRIMARY KEY (`user_id`,`discovery_id`),
                        KEY `discovery_id` (`discovery_id`),
                        CONSTRAINT `vote_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
                        CONSTRAINT `vote_ibfk_2` FOREIGN KEY (`discovery_id`) REFERENCES `discovery` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;
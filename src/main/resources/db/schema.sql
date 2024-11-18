CREATE DATABASE `worldnews` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

use`worldnews`;

CREATE TABLE `category` (
                            `id` int NOT NULL AUTO_INCREMENT,
                            `name` varchar(50) COLLATE utf8mb4_polish_ci NOT NULL,
                            `description` varchar(500) COLLATE utf8mb4_polish_ci DEFAULT NULL,
                            PRIMARY KEY (`id`),
                            UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

INSERT INTO `category` (name, description) VALUES ('Entertainment', 'This category is your space to share the latest news on movies, music, TV, celebrity updates, fashion, and pop culture. Post articles, reviews, and updates on popular events, celebrity news, new releases, and trends in the arts and media industry to keep everyone in the loop on what’s happening in entertainment around the world.');
INSERT INTO `category` (name, description) VALUES ('Politics', 'Here, you can share news and insights on political events, government policies, elections, and international relations. Post updates, analysis, and reports on political developments, leaders decisions, party activities, and key geopolitical issues shaping both local and global landscapes.');
INSERT INTO `category` (name, description) VALUES ('Business', 'This category keeps you informed on the latest in business, including market trends, economic policies, corporate developments, and financial news. Share articles on startup growth, investment insights, industry reports, and major shifts impacting businesses and consumers worldwide.');
INSERT INTO `category` (name, description) VALUES ('Sports', 'This category is all about keeping up with the action in the world of sports. Share the latest news on matches, tournaments, player transfers, team updates, and major sporting events. Whether it’s football, basketball, tennis, or any other sport, this is the place to keep everyone informed and engaged with the latest highlights and stories.');

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
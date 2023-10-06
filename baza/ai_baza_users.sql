-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: ai_baza
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `usr_id` int NOT NULL AUTO_INCREMENT,
  `sit_id` int unsigned DEFAULT NULL,
  `usr_ime` varchar(50) NOT NULL,
  `usr_prezime` varchar(50) NOT NULL,
  `usr_email` varchar(50) NOT NULL,
  `usr_password` varchar(50) NOT NULL,
  `usr_traininglevel` tinyint unsigned DEFAULT NULL,
  `usr_godiste` year NOT NULL,
  `usr_tezina` smallint NOT NULL,
  `usr_visina` tinyint unsigned NOT NULL,
  `usr_pol` varchar(6) NOT NULL,
  `usr_datumsistem` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usr_wsLevel` char(1) DEFAULT NULL,
  PRIMARY KEY (`usr_id`),
  UNIQUE KEY `usr_id_UNIQUE` (`usr_id`),
  KEY `fk_users_sistemtreninga` (`sit_id`),
  CONSTRAINT `fk_users_sistemtreninga` FOREIGN KEY (`sit_id`) REFERENCES `sistem_treninga` (`sit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (10,4,'Pera','Peric','pera@gmail.com','pera213',2,1992,92,192,'M','2023-06-24 19:09:54','1'),(11,1,'Jova','Jovic','jova@gmail.com','jova212',3,1993,85,180,'M','2023-06-24 19:09:54','1'),(12,2,'Mika','Mikanovic','mika@gmail.com','mika123',2,1998,96,190,'M','2023-06-24 19:10:36','1'),(13,5,'Stefan','Stefanovic','stefan@gmail.com','stef123',2,2001,75,183,'M','2023-06-24 20:03:34','1'),(14,NULL,'admin','admin','admin@gmail.com','admin123',0,1995,100,200,'M','2023-06-24 20:51:19','0');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-11 20:46:00

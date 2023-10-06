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
-- Table structure for table `sistem_treninga`
--

DROP TABLE IF EXISTS `sistem_treninga`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sistem_treninga` (
  `sit_id` int unsigned NOT NULL AUTO_INCREMENT,
  `usr_id` int DEFAULT NULL,
  `sit_naziv` varchar(200) DEFAULT NULL,
  `sit_opis` text,
  `sit_issytem` char(1) NOT NULL,
  PRIMARY KEY (`sit_id`),
  UNIQUE KEY `sit_id_UNIQUE` (`sit_id`),
  UNIQUE KEY `usr_id_UNIQUE` (`usr_id`),
  KEY `fk_sistemtreninga_users_idx` (`usr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sistem_treninga`
--

LOCK TABLES `sistem_treninga` WRITE;
/*!40000 ALTER TABLE `sistem_treninga` DISABLE KEYS */;
INSERT INTO `sistem_treninga` VALUES (1,NULL,'push and pull','push pull sistem treninga','0'),(2,NULL,'full body','full body sistem treninga','0'),(3,NULL,'upper and lower','upper and lower sistem treninga','0'),(4,10,NULL,NULL,'1'),(5,13,NULL,NULL,'1');
/*!40000 ALTER TABLE `sistem_treninga` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-11 20:46:01

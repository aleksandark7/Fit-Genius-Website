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
-- Table structure for table `vezbe_treninzi`
--

DROP TABLE IF EXISTS `vezbe_treninzi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vezbe_treninzi` (
  `vtr_id` int unsigned NOT NULL AUTO_INCREMENT,
  `tre_id` int unsigned NOT NULL,
  `vez_id` int unsigned NOT NULL,
  `vtr_order` tinyint DEFAULT NULL,
  PRIMARY KEY (`vtr_id`),
  UNIQUE KEY `vtr_id_UNIQUE` (`vtr_id`),
  UNIQUE KEY `tre_id_UNIQUE` (`tre_id`),
  KEY `fk_veztre_vezbe_idx` (`vez_id`),
  CONSTRAINT `fk_veztre_treninzi` FOREIGN KEY (`tre_id`) REFERENCES `treninzi` (`tre_id`),
  CONSTRAINT `fk_veztre_vezbe` FOREIGN KEY (`vez_id`) REFERENCES `vezbe` (`vez_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vezbe_treninzi`
--

LOCK TABLES `vezbe_treninzi` WRITE;
/*!40000 ALTER TABLE `vezbe_treninzi` DISABLE KEYS */;
/*!40000 ALTER TABLE `vezbe_treninzi` ENABLE KEYS */;
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

/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.8.4-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: recuperacion_db
-- ------------------------------------------------------
-- Server version	11.8.4-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `historial_consultas`
--

DROP TABLE IF EXISTS `historial_consultas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `historial_consultas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_consulta` datetime DEFAULT current_timestamp(),
  `fecha_tipo_cambio` date NOT NULL,
  `tipo_cambio` decimal(10,5) NOT NULL,
  `origen_api` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historial_consultas`
--

LOCK TABLES `historial_consultas` WRITE;
/*!40000 ALTER TABLE `historial_consultas` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `historial_consultas` VALUES
(1,'2025-11-19 21:21:29','2025-11-20',7.72341,'Banguat SOAP'),
(2,'2025-11-19 21:21:29','2025-11-19',7.71000,'Banguat SOAP'),
(3,'2025-11-19 21:21:29','2025-11-18',7.71500,'Banguat SOAP'),
(4,'2025-11-19 21:21:29','2025-11-17',7.72000,'Banguat SOAP'),
(5,'2025-11-19 21:21:29','2025-11-16',7.72100,'Banguat SOAP'),
(6,'2025-11-19 22:03:29','2025-11-19',7.65449,'Banco de Guatemala (SOAP)'),
(7,'2025-11-19 22:08:25','2025-11-19',7.65449,'Banco de Guatemala (SOAP)'),
(8,'2025-11-19 22:08:38','2025-11-19',7.65449,'Banco de Guatemala (SOAP)'),
(9,'2025-11-19 22:08:42','2025-11-19',7.65449,'Banco de Guatemala (SOAP)'),
(10,'2025-11-19 22:17:15','2025-11-19',7.65449,'Banco de Guatemala (SOAP)'),
(11,'2025-11-19 22:17:17','2025-11-19',7.65449,'Banco de Guatemala (SOAP)'),
(12,'2025-11-19 22:22:05','2025-11-19',7.65449,'Banco de Guatemala (SOAP)'),
(13,'2025-11-19 22:57:05','2025-11-19',7.65449,'Banco de Guatemala (SOAP)'),
(14,'2025-11-21 20:39:06','2025-11-21',7.65581,'Banco de Guatemala (SOAP)'),
(15,'2025-11-21 20:43:49','2025-11-21',7.65581,'Banco de Guatemala (SOAP)'),
(16,'2025-11-21 23:26:09','2025-11-21',7.65581,'Banco de Guatemala (SOAP)'),
(17,'2025-11-21 23:30:46','2025-11-21',7.65581,'Banco de Guatemala (SOAP)');
/*!40000 ALTER TABLE `historial_consultas` ENABLE KEYS */;
UNLOCK TABLES;
commit;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2025-11-21 23:41:37

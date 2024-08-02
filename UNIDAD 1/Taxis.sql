CREATE DATABASE  IF NOT EXISTS `taxis` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `taxis`;
-- MariaDB dump 10.17  Distrib 10.4.14-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: taxis
-- ------------------------------------------------------
-- Server version	10.4.14-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion_categoria` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Automovil'),(2,'Microbus'),(3,'Carga liviana'),(4,'Taxi'),(5,'Autobus'),(6,'Taxi ( transporte de discapacitados )'),(7,'Transporte colectivo interurbano'),(8,'Taxi Aeropuerto'),(9,'Taxi Alajuela'),(10,'Taxi Cartago'),(11,'Taxi Guanacaste'),(12,'Taxi Heredia'),(13,'Taxi Limón'),(14,'Taxi Puntarenas'),(15,'Taxi San José'),(16,'Taxi Aeropuerto'),(17,'Taxi Alajuela'),(18,'Taxi Cartago'),(19,'Taxi Guanacaste'),(20,'Taxi Heredia'),(21,'Taxi Limón'),(22,'Taxi Puntarenas'),(23,'Taxi San José'),(24,'Automovil'),(25,'Microbus'),(26,'Carga liviana'),(27,'Taxi'),(28,'Autobus'),(29,'Taxi ( transporte de discapacitados )'),(30,'Transporte colectivo interurbano'),(31,'Automovil'),(32,'Microbus'),(33,'Carga liviana'),(34,'Taxi'),(35,'Autobus'),(36,'Taxi ( transporte de discapacitados )'),(37,'Transporte colectivo interurbano'),(38,'Automovil'),(39,'Microbus'),(40,'Carga liviana'),(41,'Taxi'),(42,'Autobus'),(43,'Taxi ( transporte de discapacitados )'),(44,'Transporte colectivo interurbano');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clase`
--

DROP TABLE IF EXISTS `clase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clase` (
  `id_clase` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion_clase` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_clase`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clase`
--

LOCK TABLES `clase` WRITE;
/*!40000 ALTER TABLE `clase` DISABLE KEYS */;
/*!40000 ALTER TABLE `clase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marca`
--

DROP TABLE IF EXISTS `marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marca` (
  `id_marca` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion_marca` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_marca`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marca`
--

LOCK TABLES `marca` WRITE;
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxi`
--

DROP TABLE IF EXISTS `taxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxi` (
  `id_taxi` int(11) NOT NULL AUTO_INCREMENT,
  `placa` varchar(20) DEFAULT NULL,
  `id_clase` int(11) DEFAULT NULL,
  `id_marca` int(11) DEFAULT NULL,
  `ano_fabricacion` int(11) DEFAULT NULL,
  `id_categoria` int(11) DEFAULT NULL,
  `id_tipo_taxi` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_taxi`),
  KEY `FK_TaxiClase` (`id_clase`),
  KEY `FK_TaxiMarca` (`id_marca`),
  KEY `FK_TaxiTipoTaxi` (`id_tipo_taxi`),
  KEY `fk_categoria_idx` (`id_categoria`),
  CONSTRAINT `FK_TaxiClase` FOREIGN KEY (`id_clase`) REFERENCES `clase` (`id_clase`),
  CONSTRAINT `FK_TaxiMarca` FOREIGN KEY (`id_marca`) REFERENCES `marca` (`id_marca`),
  CONSTRAINT `FK_TaxiTipoTaxi` FOREIGN KEY (`id_tipo_taxi`) REFERENCES `tipo_taxi` (`id_tipo_taxi`),
  CONSTRAINT `fk_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxi`
--

LOCK TABLES `taxi` WRITE;
/*!40000 ALTER TABLE `taxi` DISABLE KEYS */;
/*!40000 ALTER TABLE `taxi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxi_stg`
--

DROP TABLE IF EXISTS `taxi_stg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxi_stg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `placa` varchar(20) DEFAULT NULL,
  `clase` varchar(50) DEFAULT NULL,
  `marca` varchar(100) DEFAULT NULL,
  `ano_fabricacion` int(11) DEFAULT NULL,
  `categoria` varchar(100) DEFAULT NULL,
  `tipo_taxi` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxi_stg`
--

LOCK TABLES `taxi_stg` WRITE;
/*!40000 ALTER TABLE `taxi_stg` DISABLE KEYS */;
/*!40000 ALTER TABLE `taxi_stg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_taxi`
--

DROP TABLE IF EXISTS `tipo_taxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_taxi` (
  `id_tipo_taxi` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion_tipo_taxi` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_tipo_taxi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_taxi`
--

LOCK TABLES `tipo_taxi` WRITE;
/*!40000 ALTER TABLE `tipo_taxi` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_taxi` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-09  7:54:54

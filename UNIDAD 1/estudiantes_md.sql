drop database estudiante;
CREATE DATABASE  IF NOT EXISTS `estudiante` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `estudiante`;


DROP TABLE IF EXISTS `estudiante`;
CREATE TABLE `estudiante` (
  `id_estudiante` int(11) NOT NULL AUTO_INCREMENT,
 `nombre` varchar(100) DEFAULT NULL,
 `edad` varchar(100) DEFAULT NULL,
 `Puntuacion` varchar(100) DEFAULT NULL,
 `Genero` varchar(100) DEFAULT NULL,
 `id_genero` int(11) NOT NULL,
  PRIMARY KEY (`id_estudiante`));

DROP TABLE IF EXISTS `genero`;
CREATE TABLE `genero` (
  `id_genero` int(11) NOT NULL AUTO_INCREMENT,
  `genero` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_genero`));

ALTER TABLE estudiante ADD CONSTRAINT fkid_genero
FOREIGN KEY(id_genero) REFERENCES genero(id_genero); 


DROP TABLE IF EXISTS `estudiante_stg`;
CREATE TABLE `estudiante_stg` (
  `id_estudiante_stg` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
   `edad` varchar(100) DEFAULT NULL,
  `Puntuacion` varchar(100) DEFAULT NULL,
   `Genero` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_estudiante_stg`)); 

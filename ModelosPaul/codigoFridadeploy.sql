-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: localhost    Database: codigoFrida
-- ------------------------------------------------------
-- Server version	5.7.24-0ubuntu0.18.04.1

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
-- Table structure for table `contenido_comentarios`
--

DROP TABLE IF EXISTS `contenido_comentarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contenido_comentarios` (
  `idUsuario` int(11) NOT NULL,
  `idContenido` int(11) NOT NULL,
  `comentario` varchar(100) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idUsuario`,`idContenido`),
  KEY `contenido_comentarios_modulo_contenidos_id_fk` (`idContenido`),
  CONSTRAINT `contenido_comentarios_modulo_contenidos_id_fk` FOREIGN KEY (`idContenido`) REFERENCES `modulo_contenidos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `contenido_comentarios_usuarios_id_fk` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contenido_comentarios`
--

LOCK TABLES `contenido_comentarios` WRITE;
/*!40000 ALTER TABLE `contenido_comentarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `contenido_comentarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contenidoadicional`
--

DROP TABLE IF EXISTS `contenidoadicional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contenidoadicional` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(300) NOT NULL,
  `nombreContenido` varchar(60) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contenidoadicional`
--

LOCK TABLES `contenidoadicional` WRITE;
/*!40000 ALTER TABLE `contenidoadicional` DISABLE KEYS */;
INSERT INTO `contenidoadicional` VALUES (1,'PEPEPECAS','MiguelOn','2018-11-14 12:03:56','2018-11-14 12:03:56'),(2,'paco esta cabron','paGod','2018-11-14 13:30:10','2018-11-14 13:30:10');
/*!40000 ALTER TABLE `contenidoadicional` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ejercicios`
--

DROP TABLE IF EXISTS `ejercicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ejercicios` (
  `idEquipo` int(11) NOT NULL,
  `idContenidoModulo` int(11) NOT NULL,
  `archivoSubido` varchar(35) NOT NULL,
  `calificacion` int(3) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`idEquipo`,`idContenidoModulo`),
  KEY `ejercicios_modulo_contenidos_id_fk` (`idContenidoModulo`),
  CONSTRAINT `ejercicios_equipos_id_fk` FOREIGN KEY (`idEquipo`) REFERENCES `equipos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ejercicios_modulo_contenidos_id_fk` FOREIGN KEY (`idContenidoModulo`) REFERENCES `modulo_contenidos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ejercicios`
--

LOCK TABLES `ejercicios` WRITE;
/*!40000 ALTER TABLE `ejercicios` DISABLE KEYS */;
/*!40000 ALTER TABLE `ejercicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipos`
--

DROP TABLE IF EXISTS `equipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipos` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Esta es la clave',
  `nombre` varchar(30) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipos`
--

LOCK TABLES `equipos` WRITE;
/*!40000 ALTER TABLE `equipos` DISABLE KEYS */;
INSERT INTO `equipos` VALUES (1,'Linces','2018-11-14 11:20:05','2018-11-14 11:20:05'),(2,'Papus','2018-11-15 10:28:16','2018-11-15 10:28:16');
/*!40000 ALTER TABLE `equipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipos_insignia`
--

DROP TABLE IF EXISTS `equipos_insignia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipos_insignia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idEquipo` int(11) NOT NULL,
  `idInsignia` int(11) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `equipos_insignia_equipos_id_fk` (`idEquipo`),
  KEY `equipos_insignia_insignia_id_fk` (`idInsignia`),
  CONSTRAINT `equipos_insignia_equipos_id_fk` FOREIGN KEY (`idEquipo`) REFERENCES `equipos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `equipos_insignia_insignia_id_fk` FOREIGN KEY (`idInsignia`) REFERENCES `insignia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipos_insignia`
--

LOCK TABLES `equipos_insignia` WRITE;
/*!40000 ALTER TABLE `equipos_insignia` DISABLE KEYS */;
INSERT INTO `equipos_insignia` VALUES (1,1,1,'2018-11-15 12:38:54','2018-11-15 12:38:54'),(2,1,3,'2018-11-15 12:39:00','2018-11-15 12:39:00'),(3,2,2,'2018-11-15 12:39:08','2018-11-15 12:39:08'),(4,1,1,'2018-11-15 12:44:44','2018-11-15 12:44:44');
/*!40000 ALTER TABLE `equipos_insignia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insignia`
--

DROP TABLE IF EXISTS `insignia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `insignia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  `descripcion` varchar(150) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insignia`
--

LOCK TABLES `insignia` WRITE;
/*!40000 ALTER TABLE `insignia` DISABLE KEYS */;
INSERT INTO `insignia` VALUES (1,'ORO','Para los que llegan primis','2018-11-15 12:31:42','2018-11-15 12:31:42'),(2,'PLATA','Mediocre, pudiste ser el primero','2018-11-15 12:31:57','2018-11-15 12:31:57'),(3,'BRONCE','Me das asco\r\n','2018-11-15 12:32:16','2018-11-15 12:32:16');
/*!40000 ALTER TABLE `insignia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materiales`
--

DROP TABLE IF EXISTS `materiales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `materiales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idContenido` int(11) NOT NULL,
  `idTipoArchivo` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `materiales_tiposarchivos_id_fk` (`idTipoArchivo`),
  KEY `materiales_contenidoadicional_id_fk` (`idContenido`),
  CONSTRAINT `materiales_contenidoadicional_id_fk` FOREIGN KEY (`idContenido`) REFERENCES `contenidoadicional` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `materiales_tiposarchivos_id_fk` FOREIGN KEY (`idTipoArchivo`) REFERENCES `tiposarchivos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materiales`
--

LOCK TABLES `materiales` WRITE;
/*!40000 ALTER TABLE `materiales` DISABLE KEYS */;
/*!40000 ALTER TABLE `materiales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materiales_contenidoadicional`
--

DROP TABLE IF EXISTS `materiales_contenidoadicional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `materiales_contenidoadicional` (
  `idMateriales` int(11) NOT NULL AUTO_INCREMENT,
  `idContenidoAdicional` int(11) NOT NULL,
  `idTipoArchivo` int(11) NOT NULL,
  `nombreArchivo` varchar(60) NOT NULL,
  `urlDescarga` varchar(100) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`idMateriales`),
  KEY `materiales_contenidoAdicional_contenidoadicional_id_fk` (`idContenidoAdicional`),
  KEY `materiales_contenidoAdicional_tiposarchivos_id_fk` (`idTipoArchivo`),
  CONSTRAINT `materiales_contenidoAdicional_contenidoadicional_id_fk` FOREIGN KEY (`idContenidoAdicional`) REFERENCES `contenidoadicional` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `materiales_contenidoAdicional_tiposarchivos_id_fk` FOREIGN KEY (`idTipoArchivo`) REFERENCES `tiposarchivos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materiales_contenidoadicional`
--

LOCK TABLES `materiales_contenidoadicional` WRITE;
/*!40000 ALTER TABLE `materiales_contenidoadicional` DISABLE KEYS */;
INSERT INTO `materiales_contenidoadicional` VALUES (1,1,1,'POTUQ','http://12345678901234567890.com.mx/api/contenidoadicional/materiales/12345678901','2018-11-14 12:20:37','2018-11-14 12:53:20'),(2,1,2,'IAHDGKL','http://12345678901234567890.com.mx/api/contenidoadicional/materiales/12345678901','2018-11-14 12:25:28','2018-11-14 13:31:25'),(3,1,1,'NXCBB','http://12345678901234567890.com.mx/api/contenidoadicional/materiales/12345678901','2018-11-14 12:25:41','2018-11-14 12:53:20'),(4,2,1,'KSHFS','http://12345678901234567890.com.mx/api/contenidoadicional/materiales/12345678901','2018-11-14 13:30:37','2018-11-14 13:30:37'),(5,2,2,'SDADO','http://12345678901234567890.com.mx/api/contenidoadicional/materiales/12345678901','2018-11-14 13:31:12','2018-11-14 13:31:12');
/*!40000 ALTER TABLE `materiales_contenidoadicional` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modulo_contenidos`
--

DROP TABLE IF EXISTS `modulo_contenidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modulo_contenidos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idModulo` int(11) NOT NULL,
  `numero` int(2) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `ejercicio` varchar(60) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `modulo_contenidos_modulos_id_fk` (`idModulo`),
  CONSTRAINT `modulo_contenidos_modulos_id_fk` FOREIGN KEY (`idModulo`) REFERENCES `modulos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modulo_contenidos`
--

LOCK TABLES `modulo_contenidos` WRITE;
/*!40000 ALTER TABLE `modulo_contenidos` DISABLE KEYS */;
INSERT INTO `modulo_contenidos` VALUES (1,1,1,'Contenido 1, Módulo 1','asdasd','2018-11-17 10:55:11','2018-11-17 10:55:11'),(2,1,2,'Contenido 2, Módulo 1','asdasd','2018-11-17 10:55:11','2018-11-17 10:55:11'),(3,1,3,'Contenido 3, Módulo 1','qweqwe','2018-11-17 10:55:11','2018-11-17 10:55:11'),(4,2,1,'Contenido 1, Módulo 2','asdasd','2018-11-17 10:55:45','2018-11-17 10:55:45'),(5,2,2,'Contenido 2, Módulo 2','asdasd','2018-11-17 10:55:45','2018-11-17 10:55:45'),(6,2,3,'Contenido 1, Módulo 2','asdasd','2018-11-17 10:55:45','2018-11-17 10:55:45'),(7,3,1,'Contenido 1, Módulo 3','asdasd','2018-11-17 10:55:45','2018-11-17 10:55:45'),(8,3,2,'Contenido 2, Módulo 3','asdasd','2018-11-17 10:55:45','2018-11-17 10:55:45'),(9,3,3,'Contenido 3, Módulo 3','qweqwe','2018-11-17 10:55:45','2018-11-17 10:55:45');
/*!40000 ALTER TABLE `modulo_contenidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modulos`
--

DROP TABLE IF EXISTS `modulos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modulos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero` int(11) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `fechaLimite` date NOT NULL,
  `descripcion` varchar(300) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modulos`
--

LOCK TABLES `modulos` WRITE;
/*!40000 ALTER TABLE `modulos` DISABLE KEYS */;
INSERT INTO `modulos` VALUES (1,1,'Modulo prron','2018-11-17','módulo todo chido','2018-11-17 10:53:55','2018-11-17 10:53:55'),(2,2,'Modulo prron2','2018-11-17','módulo mas chido que el 1','2018-11-17 10:54:29','2018-11-17 10:54:29'),(3,3,'Modulo prron3','2018-11-17','módulo todavía mas chido que el 1 y el 2 junto','2018-11-17 10:54:29','2018-11-17 10:54:29');
/*!40000 ALTER TABLE `modulos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notificaciones`
--

DROP TABLE IF EXISTS `notificaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notificaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(11) NOT NULL,
  `contenido` varchar(300) NOT NULL,
  `objetivo` varchar(200) NOT NULL,
  `icono` varchar(30) NOT NULL,
  `estadoVisto` varchar(30) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `notificaciones_usuarios_id_fk` (`idUsuario`),
  CONSTRAINT `notificaciones_usuarios_id_fk` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificaciones`
--

LOCK TABLES `notificaciones` WRITE;
/*!40000 ALTER TABLE `notificaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `notificaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(10) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Frida','2018-11-14 11:06:36','2018-11-14 11:06:36'),(2,'Mentor','2018-11-15 10:20:33','2018-11-15 10:20:33'),(3,'Líder F','2018-11-15 10:20:43','2018-11-15 10:20:43');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sesiones`
--

DROP TABLE IF EXISTS `sesiones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sesiones` (
  `token` varchar(36) NOT NULL,
  `usuarioId` int(11) NOT NULL,
  PRIMARY KEY (`token`),
  KEY `sesiones_usuarios_id_fk` (`usuarioId`),
  CONSTRAINT `sesiones_usuarios_id_fk` FOREIGN KEY (`usuarioId`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sesiones`
--

LOCK TABLES `sesiones` WRITE;
/*!40000 ALTER TABLE `sesiones` DISABLE KEYS */;
INSERT INTO `sesiones` VALUES ('468c181d-c363-4845-94b4-9006eefff8a1',1),('81400b44-7a5e-4186-9561-f59e37475254',1),('cd0d02e8-efdd-4e8a-b1e4-dd3271210848',1),('db49f7e7-e0d5-42c4-bb96-6039aca2081e',1);
/*!40000 ALTER TABLE `sesiones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tiposarchivos`
--

DROP TABLE IF EXISTS `tiposarchivos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tiposarchivos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(35) NOT NULL,
  `extension` varchar(10) NOT NULL,
  `icono` varchar(30) NOT NULL,
  `pesoLimite` int(10) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiposarchivos`
--

LOCK TABLES `tiposarchivos` WRITE;
/*!40000 ALTER TABLE `tiposarchivos` DISABLE KEYS */;
INSERT INTO `tiposarchivos` VALUES (1,'lawea','.exe','asd',10,'2018-11-12 12:37:07','2018-11-12 12:37:07'),(2,'lawea2','.pdf','qwe',100000,'2018-11-12 12:40:14','2018-11-12 12:40:14');
/*!40000 ALTER TABLE `tiposarchivos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `apPaterno` varchar(25) NOT NULL,
  `apMaterno` varchar(25) NOT NULL,
  `fechaNacimiento` date NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `correo` varchar(35) NOT NULL,
  `contrasena` varchar(64) NOT NULL,
  `sal` varchar(32) NOT NULL,
  `fotografia` varchar(36) NOT NULL,
  `rolId` varchar(10) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'asd','asd','asd','2018-11-01','3346351','pmoran0@ucol.mx','90f5d6ac74b1698fab998e1d3118ad2b9abb439d454c8e23427794bd9292ba96','123','sohklns','1','2018-11-14 11:07:07','2018-11-17 11:49:56'),(2,'jkl','jkl','jkl','2018-11-02','3349654','jkl@ucol.mx','jkl','lkjklsf','lksjdg','1','2018-11-14 11:19:47','2018-11-14 11:19:47'),(3,'María','owieht','pweotu','2018-11-15','3141234','iue@iue.mx','iue','iuty','poquet','2','2018-11-15 10:24:50','2018-11-15 10:24:50'),(4,'irh','petu','petu','2018-11-15','3141254','petu@ucol.mx','petu','irtp','pwouy','2','2018-11-15 10:26:25','2018-11-15 10:26:25'),(5,'Paula','sdf','chong','2018-11-08','3124567','ching@ucol.mx','fss','dfsfsg','sfssd','1','2018-11-15 11:54:55','2018-11-15 11:54:55');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios_equipos`
--

DROP TABLE IF EXISTS `usuarios_equipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios_equipos` (
  `idUsuario` int(11) NOT NULL,
  `idEquipo` int(11) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`idUsuario`,`idEquipo`),
  KEY `usuarios_equipos_equipos_id_fk` (`idEquipo`),
  CONSTRAINT `usuarios_equipos_equipos_id_fk` FOREIGN KEY (`idEquipo`) REFERENCES `equipos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `usuarios_equipos_usuarios_id_fk` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Relacion entre Usuarios y Equipos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios_equipos`
--

LOCK TABLES `usuarios_equipos` WRITE;
/*!40000 ALTER TABLE `usuarios_equipos` DISABLE KEYS */;
INSERT INTO `usuarios_equipos` VALUES (2,1,'2018-11-14 11:20:25','2018-11-14 11:20:25'),(3,1,'2018-11-15 10:25:14','2018-11-15 10:25:14'),(4,2,'2018-11-15 10:28:20','2018-11-15 10:28:20'),(5,2,'2018-11-15 11:55:06','2018-11-15 11:55:06');
/*!40000 ALTER TABLE `usuarios_equipos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-17 12:18:02

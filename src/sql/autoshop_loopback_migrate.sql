-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: autoshop
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `agendamento`
--

DROP TABLE IF EXISTS `agendamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agendamento` (
  `id` int NOT NULL AUTO_INCREMENT,
  `data` varchar(512) NOT NULL,
  `hora` varchar(512) NOT NULL,
  `status` varchar(512) NOT NULL,
  `veiculoId` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agendamento`
--

LOCK TABLES `agendamento` WRITE;
/*!40000 ALTER TABLE `agendamento` DISABLE KEYS */;
INSERT INTO `agendamento` VALUES (1,'2025-05-28','09:00:00','Cancelado',2),(2,'2025-05-29','10:00:00','Cancelado',3),(3,'2025-05-30','11:00:00','Cancelado',4),(4,'2025-05-31','12:00:00','Pendente',5),(5,'2025-06-01','13:00:00','Cancelado',6),(6,'2025-06-02','14:00:00','Confirmado',7),(7,'2025-06-03','15:00:00','Cancelado',8),(8,'2025-06-04','16:00:00','Pendente',9),(9,'2025-06-05','17:00:00','Pendente',10),(10,'2025-06-06','08:00:00','Pendente',11),(11,'2025-06-07','09:00:00','Pendente',12),(12,'2025-06-08','10:00:00','Confirmado',13),(13,'2025-06-09','11:00:00','Pendente',14),(14,'2025-06-10','12:00:00','Pendente',15),(15,'2025-06-11','13:00:00','Cancelado',16),(16,'2025-06-12','14:00:00','Cancelado',17),(17,'2025-06-13','15:00:00','Confirmado',18),(18,'2025-06-14','16:00:00','Cancelado',19),(19,'2025-06-15','17:00:00','Pendente',20),(20,'2025-06-16','08:00:00','Cancelado',21),(21,'2025-06-17','09:00:00','Pendente',22),(22,'2025-06-18','10:00:00','Cancelado',23),(23,'2025-06-19','11:00:00','Pendente',24),(24,'2025-06-20','12:00:00','Confirmado',25),(25,'2025-06-21','13:00:00','Confirmado',26),(26,'2025-06-22','14:00:00','Pendente',27),(27,'2025-06-23','15:00:00','Cancelado',28),(28,'2025-06-24','16:00:00','Pendente',29),(29,'2025-06-25','17:00:00','Confirmado',30),(30,'2025-06-26','08:00:00','Confirmado',1);
/*!40000 ALTER TABLE `agendamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(512) NOT NULL,
  `telefone` varchar(512) NOT NULL,
  `email` varchar(512) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Cliente 1','912345671','cliente1@email.com'),(2,'Cliente 2','912345672','cliente2@email.com'),(3,'Cliente 3','912345673','cliente3@email.com'),(4,'Cliente 4','912345674','cliente4@email.com'),(5,'Cliente 5','912345675','cliente5@email.com'),(6,'Cliente 6','912345676','cliente6@email.com'),(7,'Cliente 7','912345677','cliente7@email.com'),(8,'Cliente 8','912345678','cliente8@email.com'),(9,'Cliente 9','912345679','cliente9@email.com'),(10,'Cliente 10','912345670','cliente10@email.com'),(11,'Cliente 11','912345671','cliente11@email.com'),(12,'Cliente 12','912345672','cliente12@email.com'),(13,'Cliente 13','912345673','cliente13@email.com'),(14,'Cliente 14','912345674','cliente14@email.com'),(15,'Cliente 15','912345675','cliente15@email.com'),(16,'Cliente 16','912345676','cliente16@email.com'),(17,'Cliente 17','912345677','cliente17@email.com'),(18,'Cliente 18','912345678','cliente18@email.com'),(19,'Cliente 19','912345679','cliente19@email.com'),(20,'Cliente 20','912345670','cliente20@email.com'),(21,'Cliente 21','912345671','cliente21@email.com'),(22,'Cliente 22','912345672','cliente22@email.com'),(23,'Cliente 23','912345673','cliente23@email.com'),(24,'Cliente 24','912345674','cliente24@email.com'),(25,'Cliente 25','912345675','cliente25@email.com'),(26,'Cliente 26','912345676','cliente26@email.com'),(27,'Cliente 27','912345677','cliente27@email.com'),(28,'Cliente 28','912345678','cliente28@email.com'),(29,'Cliente 29','912345679','cliente29@email.com'),(30,'Cliente 30','912345670','cliente30@email.com');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historico`
--

DROP TABLE IF EXISTS `historico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historico` (
  `id` int NOT NULL AUTO_INCREMENT,
  `notas` varchar(512) DEFAULT NULL,
  `agendamentoId` int DEFAULT NULL,
  `veiculoId` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historico`
--

LOCK TABLES `historico` WRITE;
/*!40000 ALTER TABLE `historico` DISABLE KEYS */;
INSERT INTO `historico` VALUES (1,'Nota do histórico 1',2,2),(2,'Nota do histórico 2',3,3),(3,'Nota do histórico 3',4,4),(4,'Nota do histórico 4',5,5),(5,'Nota do histórico 5',6,6),(6,'Nota do histórico 6',7,7),(7,'Nota do histórico 7',8,8),(8,'Nota do histórico 8',9,9),(9,'Nota do histórico 9',10,10),(10,'Nota do histórico 10',11,11),(11,'Nota do histórico 11',12,12),(12,'Nota do histórico 12',13,13),(13,'Nota do histórico 13',14,14),(14,'Nota do histórico 14',15,15),(15,'Nota do histórico 15',16,16),(16,'Nota do histórico 16',17,17),(17,'Nota do histórico 17',18,18),(18,'Nota do histórico 18',19,19),(19,'Nota do histórico 19',20,20),(20,'Nota do histórico 20',21,21),(21,'Nota do histórico 21',22,22),(22,'Nota do histórico 22',23,23),(23,'Nota do histórico 23',24,24),(24,'Nota do histórico 24',25,25),(25,'Nota do histórico 25',26,26),(26,'Nota do histórico 26',27,27),(27,'Nota do histórico 27',28,28),(28,'Nota do histórico 28',29,29),(29,'Nota do histórico 29',30,30),(30,'Nota do histórico 30',1,1);
/*!40000 ALTER TABLE `historico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inclui`
--

DROP TABLE IF EXISTS `inclui`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inclui` (
  `id` int DEFAULT NULL,
  `agendamentoId` int NOT NULL,
  `servicoId` int NOT NULL,
  `recomendado` tinyint(1) DEFAULT '0',
  `executado` tinyint(1) DEFAULT '0',
  `pendente` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`agendamentoId`,`servicoId`),
  KEY `servicoId` (`servicoId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inclui`
--

LOCK TABLES `inclui` WRITE;
/*!40000 ALTER TABLE `inclui` DISABLE KEYS */;
INSERT INTO `inclui` VALUES (NULL,1,2,0,0,1),(NULL,2,3,1,0,1),(NULL,3,4,0,1,0),(NULL,4,1,1,0,1),(NULL,5,2,0,0,1),(NULL,6,3,1,1,0),(NULL,7,4,0,0,1),(NULL,8,1,1,0,1),(NULL,9,2,0,1,0),(NULL,10,3,1,0,1),(NULL,11,2,0,0,1),(NULL,12,3,1,0,1),(NULL,13,4,0,1,0),(NULL,14,1,1,0,1),(NULL,15,2,0,0,1),(NULL,16,3,1,1,0),(NULL,17,4,0,0,1),(NULL,18,1,1,0,1),(NULL,19,2,0,1,0),(NULL,20,3,1,0,1),(NULL,21,2,0,0,1),(NULL,22,3,1,0,1),(NULL,23,4,0,1,0),(NULL,24,1,1,0,1),(NULL,25,2,0,0,1),(NULL,26,3,1,1,0),(NULL,27,4,0,0,1),(NULL,28,1,1,0,1),(NULL,29,2,0,1,0),(NULL,30,3,1,1,0);
/*!40000 ALTER TABLE `inclui` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servico`
--

DROP TABLE IF EXISTS `servico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servico` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(512) NOT NULL,
  `preco` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servico`
--

LOCK TABLES `servico` WRITE;
/*!40000 ALTER TABLE `servico` DISABLE KEYS */;
INSERT INTO `servico` VALUES (1,'Revisão',60),(2,'Troca de Óleo',70),(3,'Inspeção',80),(4,'Outro',90);
/*!40000 ALTER TABLE `servico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veiculo`
--

DROP TABLE IF EXISTS `veiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `veiculo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `matricula` varchar(512) NOT NULL,
  `marca` varchar(512) NOT NULL,
  `modelo` varchar(512) NOT NULL,
  `ano` int NOT NULL,
  `km` int NOT NULL,
  `vin` varchar(512) NOT NULL,
  `clienteId` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veiculo`
--

LOCK TABLES `veiculo` WRITE;
/*!40000 ALTER TABLE `veiculo` DISABLE KEYS */;
INSERT INTO `veiculo` VALUES (1,'AA-01-ZZ','Marca1','Modelo1',2011,198269,'VIN00001',2),(2,'AA-02-ZZ','Marca2','Modelo2',2012,14095,'VIN00002',3),(3,'AA-03-ZZ','Marca3','Modelo3',2013,94323,'VIN00003',4),(4,'AA-04-ZZ','Marca4','Modelo4',2014,104052,'VIN00004',5),(5,'AA-05-ZZ','Marca0','Modelo5',2015,73230,'VIN00005',6),(6,'AA-06-ZZ','Marca1','Modelo6',2016,108981,'VIN00006',7),(7,'AA-07-ZZ','Marca2','Modelo7',2017,41786,'VIN00007',8),(8,'AA-08-ZZ','Marca3','Modelo8',2018,193023,'VIN00008',9),(9,'AA-09-ZZ','Marca4','Modelo9',2019,75199,'VIN00009',10),(10,'AA-10-ZZ','Marca0','Modelo0',2020,136384,'VIN00010',11),(11,'AA-11-ZZ','Marca1','Modelo1',2021,114140,'VIN00011',12),(12,'AA-12-ZZ','Marca2','Modelo2',2022,65440,'VIN00012',13),(13,'AA-13-ZZ','Marca3','Modelo3',2023,23638,'VIN00013',14),(14,'AA-14-ZZ','Marca4','Modelo4',2024,127595,'VIN00014',15),(15,'AA-15-ZZ','Marca0','Modelo5',2010,94070,'VIN00015',16),(16,'AA-16-ZZ','Marca1','Modelo6',2011,167940,'VIN00016',17),(17,'AA-17-ZZ','Marca2','Modelo7',2012,190794,'VIN00017',18),(18,'AA-18-ZZ','Marca3','Modelo8',2013,111258,'VIN00018',19),(19,'AA-19-ZZ','Marca4','Modelo9',2014,191955,'VIN00019',20),(20,'AA-20-ZZ','Marca0','Modelo0',2015,74025,'VIN00020',21),(21,'AA-21-ZZ','Marca1','Modelo1',2016,100603,'VIN00021',22),(22,'AA-22-ZZ','Marca2','Modelo2',2017,16037,'VIN00022',23),(23,'AA-23-ZZ','Marca3','Modelo3',2018,74409,'VIN00023',24),(24,'AA-24-ZZ','Marca4','Modelo4',2019,121682,'VIN00024',25),(25,'AA-25-ZZ','Marca0','Modelo5',2020,194621,'VIN00025',26),(26,'AA-26-ZZ','Marca1','Modelo6',2021,167297,'VIN00026',27),(27,'AA-27-ZZ','Marca2','Modelo7',2022,105135,'VIN00027',28),(28,'AA-28-ZZ','Marca3','Modelo8',2023,164678,'VIN00028',29),(29,'AA-29-ZZ','Marca4','Modelo9',2024,27608,'VIN00029',30),(30,'AA-30-ZZ','Marca0','Modelo0',2010,16589,'VIN00030',1);
/*!40000 ALTER TABLE `veiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `veiculos_com_agendamentos_pendentes`
--

DROP TABLE IF EXISTS `veiculos_com_agendamentos_pendentes`;
/*!50001 DROP VIEW IF EXISTS `veiculos_com_agendamentos_pendentes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `veiculos_com_agendamentos_pendentes` AS SELECT 
 1 AS `id`,
 1 AS `matricula`,
 1 AS `marca`,
 1 AS `modelo`,
 1 AS `data`,
 1 AS `status`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_historico_veiculo`
--

DROP TABLE IF EXISTS `vista_historico_veiculo`;
/*!50001 DROP VIEW IF EXISTS `vista_historico_veiculo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_historico_veiculo` AS SELECT 
 1 AS `matricula`,
 1 AS `status`,
 1 AS `notas`,
 1 AS `Id`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `veiculos_com_agendamentos_pendentes`
--

/*!50001 DROP VIEW IF EXISTS `veiculos_com_agendamentos_pendentes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `veiculos_com_agendamentos_pendentes` AS select `v`.`id` AS `id`,`v`.`matricula` AS `matricula`,`v`.`marca` AS `marca`,`v`.`modelo` AS `modelo`,`a`.`data` AS `data`,`a`.`status` AS `status` from (`veiculo` `v` join `agendamento` `a` on((`v`.`id` = `a`.`veiculoId`))) where (`a`.`status` = 'Pendente') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_historico_veiculo`
--

/*!50001 DROP VIEW IF EXISTS `vista_historico_veiculo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_historico_veiculo` AS select `v`.`matricula` AS `matricula`,`a`.`status` AS `status`,`h`.`notas` AS `notas`,`h`.`id` AS `Id` from ((`historico` `h` join `veiculo` `v` on((`h`.`veiculoId` = `v`.`id`))) join `agendamento` `a` on((`h`.`agendamentoId` = `a`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-15 19:26:11

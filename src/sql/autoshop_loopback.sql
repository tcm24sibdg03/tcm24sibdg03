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
  `servicoId` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `agendamentos_futuros`
--

DROP TABLE IF EXISTS `agendamentos_futuros`;
/*!50001 DROP VIEW IF EXISTS `agendamentos_futuros`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `agendamentos_futuros` AS SELECT 
 1 AS `id`,
 1 AS `data`,
 1 AS `hora`,
 1 AS `status`,
 1 AS `cliente`,
 1 AS `marca`,
 1 AS `modelo`,
 1 AS `tipo_servico`,
 1 AS `preco`*/;
SET character_set_client = @saved_cs_client;

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
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
-- Table structure for table `inclui`
--

DROP TABLE IF EXISTS `inclui`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inclui` (
  `agendamentoId` int NOT NULL,
  `servicoId` int NOT NULL,
  `recomendado` tinyint(1) DEFAULT '0',
  `executado` tinyint(1) DEFAULT '0',
  `pendente` tinyint(1) DEFAULT '1',
  `id` int DEFAULT NULL,
  `agendamentoIdNav` int DEFAULT NULL,
  `servicoIdNav` int DEFAULT NULL,
  PRIMARY KEY (`agendamentoId`,`servicoId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `veiculos_com_servicos`
--

DROP TABLE IF EXISTS `veiculos_com_servicos`;
/*!50001 DROP VIEW IF EXISTS `veiculos_com_servicos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `veiculos_com_servicos` AS SELECT 
 1 AS `Id`,
 1 AS `matricula`,
 1 AS `marca`,
 1 AS `modelo`,
 1 AS `servico`,
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
-- Final view structure for view `agendamentos_futuros`
--

/*!50001 DROP VIEW IF EXISTS `agendamentos_futuros`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `agendamentos_futuros` AS select `a`.`id` AS `id`,`a`.`data` AS `data`,`a`.`hora` AS `hora`,`a`.`status` AS `status`,`c`.`nome` AS `cliente`,`v`.`marca` AS `marca`,`v`.`modelo` AS `modelo`,`s`.`tipo` AS `tipo_servico`,`s`.`preco` AS `preco` from (((`agendamento` `a` join `veiculo` `v` on((`a`.`veiculoId` = `v`.`id`))) join `cliente` `c` on((`v`.`clienteId` = `c`.`id`))) join `servico` `s` on((`a`.`servicoId` = `s`.`id`))) where (`a`.`data` >= curdate()) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `veiculos_com_servicos`
--

/*!50001 DROP VIEW IF EXISTS `veiculos_com_servicos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `veiculos_com_servicos` AS select `v`.`id` AS `Id`,`v`.`matricula` AS `matricula`,`v`.`marca` AS `marca`,`v`.`modelo` AS `modelo`,`s`.`tipo` AS `servico`,`a`.`data` AS `data`,`a`.`status` AS `status` from ((`veiculo` `v` join `agendamento` `a` on((`v`.`id` = `a`.`veiculoId`))) join `servico` `s` on((`a`.`servicoId` = `s`.`id`))) */;
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

-- Dump completed on 2025-06-08 18:50:58

-- Dental Flow: banco dentalFlow com os dados da apresentação, exportado do MySQL local em 29/10/2026.
-- Carregado pela imagem docker/db na primeira subida (volume vazio). Para gerar de novo, veja o README.
-- Dados fictícios. Usuários de teste: ana (dentista) e carla (recepção).

-- MySQL dump 10.13  Distrib 8.4.13, for Linux (x86_64)
--
-- Host: localhost    Database: dentalFlow
-- ------------------------------------------------------
-- Server version	8.4.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `dentalFlow`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dentalFlow` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `dentalFlow`;

--
-- Table structure for table `agendamento`
--

DROP TABLE IF EXISTS `agendamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agendamento` (
  `id_agendamento` bigint NOT NULL AUTO_INCREMENT,
  `id_clinica` bigint NOT NULL,
  `id_paciente` bigint NOT NULL,
  `id_dentista` bigint NOT NULL,
  `id_procedimento` bigint NOT NULL,
  `id_usuario` bigint DEFAULT NULL,
  `data_hora` datetime NOT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'AGENDADO',
  `observacoes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_agendamento`),
  KEY `idx_agend_clinica` (`id_clinica`),
  KEY `idx_agend_paciente` (`id_paciente`),
  KEY `idx_agend_dentista_data` (`id_dentista`,`data_hora`),
  KEY `idx_agend_dashboard` (`id_clinica`,`data_hora`,`id_dentista`,`status`),
  KEY `idx_agend_procedimento` (`id_procedimento`),
  KEY `idx_agend_usuario` (`id_usuario`),
  CONSTRAINT `fk_agend_clinica` FOREIGN KEY (`id_clinica`) REFERENCES `clinica` (`id_clinica`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_agend_dentista` FOREIGN KEY (`id_dentista`) REFERENCES `dentista` (`id_dentista`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_agend_paciente` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id_paciente`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_agend_procedimento` FOREIGN KEY (`id_procedimento`) REFERENCES `procedimento` (`id_procedimento`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_agend_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agendamento`
--

LOCK TABLES `agendamento` WRITE;
/*!40000 ALTER TABLE `agendamento` DISABLE KEYS */;
INSERT INTO `agendamento` VALUES (1,1,8,1,4,1,'2026-10-26 08:00:00','CONCLUIDO',NULL),(2,1,11,2,2,1,'2026-10-26 09:00:00','CONCLUIDO',NULL),(3,1,2,3,5,1,'2026-10-26 10:00:00','CONCLUIDO',NULL),(4,1,17,1,1,1,'2026-10-26 14:00:00','CONCLUIDO',NULL),(5,1,15,2,3,1,'2026-10-27 08:30:00','CONCLUIDO',NULL),(6,1,16,1,4,1,'2026-10-27 09:00:00','CONCLUIDO',NULL),(7,1,3,3,6,1,'2026-10-27 11:00:00','CONCLUIDO',NULL),(8,1,18,2,7,1,'2026-10-27 15:00:00','CONCLUIDO',NULL),(9,1,8,1,1,1,'2026-10-28 08:00:00','CONCLUIDO',NULL),(10,1,6,2,1,1,'2026-10-28 08:30:00','CONCLUIDO',NULL),(11,1,4,1,4,1,'2026-10-28 09:00:00','FALTOU',NULL),(12,1,7,2,3,1,'2026-10-28 09:15:00','CONCLUIDO',NULL),(13,1,2,3,5,1,'2026-10-28 09:30:00','CONCLUIDO',NULL),(14,1,1,1,4,1,'2026-10-28 10:00:00','CONCLUIDO','Prefere atendimento pela manhã. Vem com a mãe.'),(15,1,11,2,2,1,'2026-10-28 10:15:00','CONCLUIDO',NULL),(16,1,5,1,1,1,'2026-10-28 10:30:00','CONCLUIDO',NULL),(17,1,9,3,6,1,'2026-10-28 11:15:00','CONCLUIDO',NULL),(18,1,14,2,3,1,'2026-10-28 11:30:00','CONCLUIDO',NULL),(19,1,12,2,3,1,'2026-10-28 14:00:00','CONCLUIDO',NULL),(20,1,13,1,1,1,'2026-10-28 14:00:00','CONFIRMADO',NULL),(21,1,3,3,5,1,'2026-10-28 14:30:00','AGENDADO',NULL),(22,1,10,1,2,1,'2026-10-28 15:00:00','FALTOU',NULL),(23,1,15,1,1,1,'2026-10-29 08:30:00','CONFIRMADO',NULL),(24,1,18,2,2,1,'2026-10-29 09:00:00','AGENDADO',NULL),(25,1,16,3,5,1,'2026-10-29 10:00:00','CONFIRMADO',NULL),(26,1,17,1,4,1,'2026-10-29 13:30:00','CONFIRMADO',NULL),(27,1,13,2,3,1,'2026-10-30 08:00:00','AGENDADO',NULL),(28,1,5,1,4,1,'2026-10-30 09:30:00','CONFIRMADO',NULL),(29,1,10,3,6,1,'2026-10-30 11:00:00','CONFIRMADO',NULL),(30,1,4,1,1,1,'2026-10-31 08:00:00','AGENDADO',NULL),(31,1,6,2,2,1,'2026-10-31 09:00:00','CONFIRMADO',NULL),(34,1,1,1,1,1,'2026-12-02 08:00:00','AGENDADO',NULL),(35,1,18,1,4,1,'2026-10-19 08:00:00','CONCLUIDO',NULL),(36,1,24,1,1,1,'2026-10-19 09:00:00','CONCLUIDO',NULL),(37,1,10,2,3,1,'2026-10-19 08:00:00','CONCLUIDO',NULL),(38,1,2,2,1,1,'2026-10-19 09:00:00','CONCLUIDO',NULL),(39,1,6,3,1,1,'2026-10-19 11:00:00','CONCLUIDO',NULL),(40,1,10,3,1,1,'2026-10-19 16:00:00','FALTOU',NULL),(41,1,18,1,1,1,'2026-11-02 10:00:00','AGENDADO',NULL),(42,1,14,1,1,1,'2026-11-02 14:00:00','CONFIRMADO',NULL),(43,1,16,2,1,1,'2026-11-02 14:00:00','CONFIRMADO',NULL),(44,1,4,2,3,1,'2026-11-02 16:00:00','AGENDADO',NULL),(45,1,3,3,6,1,'2026-11-02 10:00:00','AGENDADO',NULL),(46,1,17,3,6,1,'2026-11-02 15:00:00','AGENDADO',NULL),(47,1,16,1,4,1,'2026-10-20 08:00:00','CONCLUIDO',NULL),(48,1,17,1,1,1,'2026-10-20 09:00:00','CONCLUIDO',NULL),(49,1,1,2,3,1,'2026-10-20 10:00:00','CONCLUIDO',NULL),(50,1,28,2,1,1,'2026-10-20 15:00:00','CANCELADO',NULL),(51,1,5,3,5,1,'2026-10-20 08:00:00','CONCLUIDO',NULL),(52,1,9,3,1,1,'2026-10-20 09:00:00','CONCLUIDO',NULL),(53,1,2,1,4,1,'2026-11-03 09:00:00','AGENDADO',NULL),(54,1,10,1,4,1,'2026-11-03 10:00:00','CONFIRMADO',NULL),(55,1,24,2,7,1,'2026-11-03 08:00:00','CONFIRMADO',NULL),(56,1,30,2,3,1,'2026-11-03 11:00:00','AGENDADO',NULL),(57,1,28,3,6,1,'2026-11-03 08:00:00','CONFIRMADO',NULL),(58,1,8,3,5,1,'2026-11-03 16:00:00','AGENDADO',NULL),(59,1,9,1,1,1,'2026-10-21 10:00:00','FALTOU',NULL),(60,1,8,1,4,1,'2026-10-21 14:00:00','CONCLUIDO',NULL),(61,1,3,2,1,1,'2026-10-21 11:00:00','CONCLUIDO',NULL),(62,1,3,2,3,1,'2026-10-21 14:00:00','CONCLUIDO',NULL),(63,1,9,3,5,1,'2026-10-21 08:00:00','CONCLUIDO',NULL),(64,1,21,3,5,1,'2026-10-21 11:00:00','CONCLUIDO',NULL),(65,1,15,1,4,1,'2026-11-04 09:00:00','AGENDADO',NULL),(66,1,5,1,4,1,'2026-11-04 10:00:00','CONFIRMADO',NULL),(67,1,13,2,3,1,'2026-11-04 09:00:00','AGENDADO',NULL),(69,1,26,3,1,1,'2026-11-04 08:00:00','AGENDADO',NULL),(70,1,21,3,6,1,'2026-11-04 09:00:00','CONFIRMADO',NULL),(71,1,8,1,1,1,'2026-10-22 08:00:00','CONCLUIDO',NULL),(72,1,8,1,1,1,'2026-10-22 11:00:00','CONCLUIDO',NULL),(73,1,26,2,3,1,'2026-10-22 09:00:00','CONCLUIDO',NULL),(74,1,7,2,3,1,'2026-10-22 14:00:00','CONCLUIDO',NULL),(75,1,17,3,1,1,'2026-10-22 09:00:00','CONCLUIDO',NULL),(76,1,12,3,6,1,'2026-10-22 10:00:00','CONCLUIDO',NULL),(77,1,27,1,4,1,'2026-11-05 08:00:00','CONFIRMADO',NULL),(78,1,25,1,4,1,'2026-11-05 14:00:00','AGENDADO',NULL),(79,1,5,2,1,1,'2026-11-05 10:00:00','CONFIRMADO',NULL),(80,1,7,2,1,1,'2026-11-05 16:00:00','CONFIRMADO',NULL),(81,1,18,3,5,1,'2026-11-05 10:00:00','CONFIRMADO',NULL),(82,1,23,3,6,1,'2026-11-05 15:00:00','CONFIRMADO',NULL),(83,1,2,1,4,1,'2026-10-23 10:00:00','CONCLUIDO',NULL),(84,1,24,1,4,1,'2026-10-23 15:00:00','CONCLUIDO',NULL),(85,1,14,2,1,1,'2026-10-23 08:00:00','CONCLUIDO',NULL),(86,1,4,2,3,1,'2026-10-23 11:00:00','CONCLUIDO',NULL),(87,1,14,3,5,1,'2026-10-23 11:00:00','CONCLUIDO',NULL),(88,1,30,3,5,1,'2026-10-23 14:00:00','CONCLUIDO',NULL),(89,1,25,1,1,1,'2026-11-06 08:00:00','CONFIRMADO',NULL),(90,1,12,1,1,1,'2026-11-06 15:00:00','CONFIRMADO',NULL),(91,1,26,2,3,1,'2026-11-06 11:00:00','AGENDADO',NULL),(92,1,28,2,2,1,'2026-11-06 14:00:00','CONFIRMADO',NULL),(93,1,26,3,5,1,'2026-11-06 08:00:00','CONFIRMADO',NULL),(94,1,27,3,1,1,'2026-11-06 09:00:00','CONFIRMADO',NULL),(95,1,11,1,1,1,'2026-10-24 16:00:00','CONCLUIDO',NULL),(96,1,22,2,1,1,'2026-10-24 09:00:00','CONCLUIDO',NULL),(97,1,2,3,1,1,'2026-10-24 11:00:00','CONCLUIDO',NULL),(98,1,26,1,1,1,'2026-11-07 16:00:00','CONFIRMADO',NULL),(99,1,2,2,2,1,'2026-11-07 08:00:00','CONFIRMADO',NULL),(100,1,14,3,6,1,'2026-11-07 16:00:00','CONFIRMADO',NULL),(101,1,1,3,2,1,'2026-10-16 14:00:00','AGENDADO',NULL),(104,1,1,1,4,2,'2026-10-29 08:00:00','CONFIRMADO','Vem com a mãe.'),(105,1,5,1,4,2,'2026-10-29 09:00:00','CONFIRMADO',NULL),(106,1,27,1,1,2,'2026-10-29 10:00:00','AGENDADO','Primeira consulta.'),(107,1,29,1,1,2,'2026-10-29 14:30:00','AGENDADO',NULL),(108,1,4,1,4,2,'2026-10-29 16:00:00','CONFIRMADO',NULL),(109,1,11,2,3,2,'2026-10-29 08:00:00','CONFIRMADO',NULL),(110,1,23,2,1,2,'2026-10-29 10:30:00','CONFIRMADO',NULL),(111,1,12,2,7,2,'2026-10-29 14:00:00','CANCELADO','Pediu para remarcar na próxima semana.'),(112,1,28,2,2,2,'2026-10-29 15:00:00','CONFIRMADO',NULL),(113,1,2,3,5,2,'2026-10-29 08:00:00','CONFIRMADO','Segunda sessão do canal.'),(114,1,9,3,6,2,'2026-10-29 14:00:00','AGENDADO',NULL),(115,1,31,1,1,2,'2026-12-01 07:05:00','CONFIRMADO',NULL);
/*!40000 ALTER TABLE `agendamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `atendimento`
--

DROP TABLE IF EXISTS `atendimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `atendimento` (
  `id_atendimento` bigint NOT NULL AUTO_INCREMENT,
  `id_mapa_diario` bigint NOT NULL,
  `id_agendamento` bigint DEFAULT NULL,
  `id_paciente` bigint DEFAULT NULL,
  `id_dentista` bigint DEFAULT NULL,
  `id_procedimento` bigint DEFAULT NULL,
  `numero_linha` int NOT NULL,
  `numero_ficha` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nome_paciente` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hora_agendada` time DEFAULT NULL,
  `hora_entrada` time DEFAULT NULL,
  `hora_saida` time DEFAULT NULL,
  `hora_retorno` time DEFAULT NULL,
  `codigo_pagamento` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `valor` decimal(10,2) DEFAULT '0.00',
  `tipo_atendimento` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'CLINICO',
  `conferido` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id_atendimento`),
  UNIQUE KEY `uk_atendimento_mapa_linha` (`id_mapa_diario`,`numero_linha`),
  KEY `idx_atendimento_mapa` (`id_mapa_diario`),
  KEY `idx_atendimento_agendamento` (`id_agendamento`),
  KEY `idx_atendimento_paciente` (`id_paciente`),
  KEY `idx_atendimento_dentista` (`id_dentista`),
  KEY `idx_atendimento_procedimento` (`id_procedimento`),
  CONSTRAINT `fk_atendimento_agendamento` FOREIGN KEY (`id_agendamento`) REFERENCES `agendamento` (`id_agendamento`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_atendimento_dentista` FOREIGN KEY (`id_dentista`) REFERENCES `dentista` (`id_dentista`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_atendimento_mapa` FOREIGN KEY (`id_mapa_diario`) REFERENCES `mapa_diario` (`id_mapa_diario`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_atendimento_paciente` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id_paciente`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_atendimento_procedimento` FOREIGN KEY (`id_procedimento`) REFERENCES `procedimento` (`id_procedimento`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atendimento`
--

LOCK TABLES `atendimento` WRITE;
/*!40000 ALTER TABLE `atendimento` DISABLE KEYS */;
INSERT INTO `atendimento` VALUES (1,1,NULL,16,1,4,1,'F-101','Otávio Ramos','09:00:00','08:57:00','09:31:00',NULL,'PIX',150.00,'CLINICO',1),(2,1,NULL,17,1,1,2,'F-102','Lívia Castro','14:00:00','14:05:00','14:32:00',NULL,'CARTAO',120.00,'CLINICO',1),(3,2,NULL,4,1,4,1,'F-782','Fábio Nascimento','08:00:00','08:07:00','08:40:00',NULL,'CARTAO',150.00,'CLINICO',1),(4,2,NULL,10,1,4,2,'F-848','Renata Barros','09:00:00','09:07:00','09:43:00',NULL,'CARTAO',150.00,'CLINICO',1),(5,2,NULL,22,1,4,3,'F-549','Lívia Castro','10:00:00','10:07:00','10:48:00',NULL,'PIX',150.00,'CLINICO',1),(6,2,NULL,22,1,4,4,'F-761','Bruno Henrique Lopes','11:00:00','11:00:00','11:40:00',NULL,'CARTAO',135.00,'CLINICO',1),(7,2,NULL,7,1,4,5,'F-258','Gabriel Souza','12:00:00','12:06:00','12:47:00',NULL,'CONVENIO',135.00,'PROTESE',1),(8,3,NULL,21,1,1,1,'F-606','Otávio Ramos','08:00:00','08:03:00','08:47:00',NULL,'CARTAO',120.00,'CLINICO',1),(9,3,NULL,9,1,4,2,'F-348','Jonas Albuquerque','09:00:00','09:01:00','09:40:00',NULL,'PIX',150.00,'CLINICO',1),(10,4,NULL,5,1,4,1,'F-440','Heitor Cardoso','08:00:00','08:03:00','08:46:00',NULL,'DINHEIRO',150.00,'CLINICO',1),(11,4,NULL,30,1,4,2,'F-720','Roberto Nunes','09:00:00','09:00:00','09:42:00',NULL,'CONVENIO',150.00,'CLINICO',1),(12,4,NULL,1,1,4,3,'F-635','Lívia Castro','10:00:00','10:06:00','10:41:00',NULL,'CARTAO',150.00,'CLINICO',1),(13,4,NULL,17,1,1,4,'F-360','Bruno Henrique Lopes','11:00:00','11:05:00','11:44:00',NULL,'DINHEIRO',120.00,'CLINICO',1),(14,4,NULL,25,1,4,5,'F-771','Camila Duarte','12:00:00','12:08:00','12:45:00',NULL,'PIX',150.00,'CLINICO',1),(15,5,NULL,30,1,1,1,'F-876','Teste Integração 08818482','08:00:00','08:04:00','08:47:00',NULL,'PIX',120.00,'CLINICO',1),(16,5,NULL,8,1,4,2,'F-714','Sônia Martins','09:00:00','09:03:00','09:45:00',NULL,'PIX',135.00,'CLINICO',1),(17,5,NULL,1,1,1,3,'F-361','Fernanda Alves','10:00:00','10:03:00','10:47:00',NULL,'PIX',120.00,'CLINICO',1),(18,5,NULL,15,1,4,4,'F-695','Beatriz Rocha','11:00:00','11:08:00','11:47:00',NULL,'CONVENIO',150.00,'CLINICO',1),(19,5,NULL,29,1,4,5,'F-488','Helena Prado','12:00:00','12:02:00','12:46:00',NULL,'PIX',135.00,'CLINICO',1),(20,6,NULL,16,1,1,1,'F-733','Ana Clara Mendes','08:00:00','08:05:00','08:47:00',NULL,'PIX',120.00,'CLINICO',1),(21,6,NULL,13,1,1,2,'F-287','Jonas Albuquerque','09:00:00','09:08:00','09:41:00',NULL,'CARTAO',120.00,'CLINICO',1),(22,6,NULL,16,1,1,3,'F-876','Adriana Bezerra','10:00:00','10:03:00','10:45:00',NULL,'PIX',120.00,'PROTESE',1),(23,6,NULL,4,1,1,4,'F-576','Sônia Martins','11:00:00','11:08:00','11:45:00',NULL,'DINHEIRO',120.00,'CLINICO',1),(24,7,NULL,23,1,1,1,'F-806','Teste Integração 08818482','08:00:00','08:07:00','08:40:00',NULL,'CONVENIO',120.00,'CLINICO',1),(25,7,NULL,10,1,1,2,'F-287','Daniel Fonseca','09:00:00','09:05:00','09:48:00',NULL,'PIX',108.00,'CLINICO',1),(26,8,NULL,3,1,4,1,'F-343','Camila Duarte','08:00:00','08:04:00','08:48:00',NULL,'CONVENIO',135.00,'PROTESE',1),(27,8,NULL,9,1,1,2,'F-207','Renata Barros','09:00:00','09:05:00','09:40:00',NULL,'DINHEIRO',120.00,'CLINICO',1),(28,8,NULL,29,1,1,3,'F-580','Otávio Ramos','10:00:00','10:08:00','10:46:00',NULL,'CARTAO',120.00,'CLINICO',1),(29,8,NULL,11,1,4,4,'F-239','Isadora Monteiro','11:00:00','11:06:00','11:40:00',NULL,'PIX',135.00,'CLINICO',1),(30,9,NULL,24,1,4,1,'F-845','Vinícius Prado','08:00:00','08:05:00','08:43:00',NULL,'CONVENIO',150.00,'CLINICO',1),(31,9,NULL,16,1,4,2,'F-864','Marcos Teixeira','09:00:00','09:02:00','09:47:00',NULL,'DINHEIRO',150.00,'CLINICO',1),(32,9,NULL,23,1,1,3,'F-694','Teste Integração 08818482','10:00:00','10:01:00','10:45:00',NULL,'PIX',108.00,'PROTESE',1),(33,10,NULL,13,1,1,1,'F-737','Adriana Bezerra','08:00:00','08:06:00','08:45:00',NULL,'CARTAO',108.00,'CLINICO',1),(34,10,NULL,26,1,1,2,'F-405','Cecília Andrade','09:00:00','09:04:00','09:48:00',NULL,'CONVENIO',120.00,'CLINICO',1),(35,10,NULL,1,1,4,3,'F-757','Camila Duarte','10:00:00','10:06:00','10:48:00',NULL,'PIX',150.00,'CLINICO',1),(36,11,NULL,17,1,4,1,'F-719','Sônia Martins','08:00:00','08:06:00','08:40:00',NULL,'CARTAO',150.00,'CLINICO',1),(37,11,NULL,13,1,1,2,'F-678','Fábio Nascimento','09:00:00','09:07:00','09:46:00',NULL,'PIX',120.00,'CLINICO',1);
/*!40000 ALTER TABLE `atendimento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditoria`
--

DROP TABLE IF EXISTS `auditoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auditoria` (
  `id_auditoria` bigint NOT NULL AUTO_INCREMENT,
  `tabela` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_registro` bigint NOT NULL,
  `acao` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor_anterior` text COLLATE utf8mb4_unicode_ci,
  `valor_novo` text COLLATE utf8mb4_unicode_ci,
  `id_usuario` bigint NOT NULL,
  `data_hora` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_auditoria`),
  KEY `idx_auditoria_registro` (`tabela`,`id_registro`,`data_hora`),
  KEY `idx_auditoria_usuario` (`id_usuario`),
  CONSTRAINT `fk_auditoria_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditoria`
--

LOCK TABLES `auditoria` WRITE;
/*!40000 ALTER TABLE `auditoria` DISABLE KEYS */;
INSERT INTO `auditoria` VALUES (1,'insumo',1,'CRIAR',NULL,'nome=Luva de procedimento;custo=25.9;minimo=4;ativo=true',1,'2026-10-28 13:29:16'),(2,'insumo',2,'CRIAR',NULL,'nome=Máscara descartável;custo=18.5;minimo=3;ativo=true',1,'2026-10-28 13:29:16'),(3,'insumo',3,'CRIAR',NULL,'nome=Resina composta A2;custo=89.9;minimo=2;ativo=true',1,'2026-10-28 13:29:17'),(4,'insumo',4,'CRIAR',NULL,'nome=Anestésico lidocaína;custo=3.2;minimo=30;ativo=true',1,'2026-10-28 13:29:17'),(5,'insumo',5,'CRIAR',NULL,'nome=Sugador descartável;custo=12;minimo=2;ativo=true',1,'2026-10-28 13:29:17'),(6,'equipamento',1,'CRIAR',NULL,'nome=Raio X digital;aquisicao=30000;vidaUtil=15000;ativo=true',1,'2026-10-28 13:29:18'),(7,'equipamento',2,'CRIAR',NULL,'nome=Autoclave 21 L;aquisicao=8500;vidaUtil=6000;ativo=true',1,'2026-10-28 13:29:18'),(8,'equipamento',3,'CRIAR',NULL,'nome=Fotopolimerizador LED;aquisicao=1200;vidaUtil=4000;ativo=true',1,'2026-10-28 13:29:19'),(9,'mapa_diario',1,'CRIAR',NULL,'status=ABERTO;bruto=270;despesas=35;saldo=223',1,'2026-10-28 13:29:19'),(10,'mapa_diario',2,'CRIAR',NULL,'status=ABERTO;bruto=720;despesas=53;saldo=649',1,'2026-10-28 16:44:55'),(11,'mapa_diario',2,'FECHAR','status=ABERTO;bruto=720.00;despesas=53.00;saldo=649.00','status=FECHADO;bruto=720.00;despesas=53.00;saldo=649.00',1,'2026-10-28 16:44:55'),(12,'mapa_diario',3,'CRIAR',NULL,'status=ABERTO;bruto=270;despesas=0;saldo=249',1,'2026-10-28 16:44:56'),(13,'mapa_diario',3,'FECHAR','status=ABERTO;bruto=270.00;despesas=0.00;saldo=249.00','status=FECHADO;bruto=270.00;despesas=0.00;saldo=249.00',1,'2026-10-28 16:44:56'),(14,'mapa_diario',4,'CRIAR',NULL,'status=ABERTO;bruto=720;despesas=45;saldo=669',1,'2026-10-28 16:44:56'),(15,'mapa_diario',4,'FECHAR','status=ABERTO;bruto=720.00;despesas=45.00;saldo=669.00','status=FECHADO;bruto=720.00;despesas=45.00;saldo=669.00',1,'2026-10-28 16:44:56'),(16,'mapa_diario',5,'CRIAR',NULL,'status=ABERTO;bruto=660;despesas=0;saldo=640',1,'2026-10-28 16:44:56'),(17,'mapa_diario',5,'FECHAR','status=ABERTO;bruto=660.00;despesas=0.00;saldo=640.00','status=FECHADO;bruto=660.00;despesas=0.00;saldo=640.00',1,'2026-10-28 16:44:56'),(18,'mapa_diario',6,'CRIAR',NULL,'status=ABERTO;bruto=480;despesas=0;saldo=474',1,'2026-10-28 16:44:57'),(19,'mapa_diario',6,'FECHAR','status=ABERTO;bruto=480.00;despesas=0.00;saldo=474.00','status=FECHADO;bruto=480.00;despesas=0.00;saldo=474.00',1,'2026-10-28 16:44:57'),(20,'mapa_diario',7,'CRIAR',NULL,'status=ABERTO;bruto=228;despesas=0;saldo=228',1,'2026-10-28 16:44:57'),(21,'mapa_diario',7,'FECHAR','status=ABERTO;bruto=228.00;despesas=0.00;saldo=228.00','status=FECHADO;bruto=228.00;despesas=0.00;saldo=228.00',1,'2026-10-28 16:44:57'),(22,'mapa_diario',8,'CRIAR',NULL,'status=ABERTO;bruto=510;despesas=36;saldo=468',1,'2026-10-28 16:44:57'),(23,'mapa_diario',8,'FECHAR','status=ABERTO;bruto=510.00;despesas=36.00;saldo=468.00','status=FECHADO;bruto=510.00;despesas=36.00;saldo=468.00',1,'2026-10-28 16:44:57'),(24,'mapa_diario',9,'CRIAR',NULL,'status=ABERTO;bruto=408;despesas=0;saldo=388',1,'2026-10-28 16:44:58'),(25,'mapa_diario',9,'FECHAR','status=ABERTO;bruto=408.00;despesas=0.00;saldo=388.00','status=FECHADO;bruto=408.00;despesas=0.00;saldo=388.00',1,'2026-10-28 16:44:58'),(26,'mapa_diario',10,'CRIAR',NULL,'status=ABERTO;bruto=378;despesas=0;saldo=352',1,'2026-10-28 16:44:58'),(27,'mapa_diario',10,'FECHAR','status=ABERTO;bruto=378.00;despesas=0.00;saldo=352.00','status=FECHADO;bruto=378.00;despesas=0.00;saldo=352.00',1,'2026-10-28 16:44:58'),(28,'mapa_diario',11,'CRIAR',NULL,'status=ABERTO;bruto=270;despesas=49;saldo=215',1,'2026-10-28 16:44:58'),(29,'mapa_diario',11,'FECHAR','status=ABERTO;bruto=270.00;despesas=49.00;saldo=215.00','status=FECHADO;bruto=270.00;despesas=49.00;saldo=215.00',1,'2026-10-28 16:44:58');
/*!40000 ALTER TABLE `auditoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clinica`
--

DROP TABLE IF EXISTS `clinica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clinica` (
  `id_clinica` bigint NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cnpj` varchar(18) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `endereco` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_clinica`),
  UNIQUE KEY `uk_clinica_cnpj` (`cnpj`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clinica`
--

LOCK TABLES `clinica` WRITE;
/*!40000 ALTER TABLE `clinica` DISABLE KEYS */;
INSERT INTO `clinica` VALUES (1,'Clínica Sorriso Centro','12.345.678/0001-99','Rua das Flores, 100 - Centro','1133334444');
/*!40000 ALTER TABLE `clinica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dentista`
--

DROP TABLE IF EXISTS `dentista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dentista` (
  `id_dentista` bigint NOT NULL AUTO_INCREMENT,
  `id_clinica` bigint NOT NULL,
  `nome` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cro` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `especialidade` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_dentista`),
  UNIQUE KEY `uk_dentista_cro` (`cro`),
  KEY `idx_dentista_clinica` (`id_clinica`),
  CONSTRAINT `fk_dentista_clinica` FOREIGN KEY (`id_clinica`) REFERENCES `clinica` (`id_clinica`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dentista`
--

LOCK TABLES `dentista` WRITE;
/*!40000 ALTER TABLE `dentista` DISABLE KEYS */;
INSERT INTO `dentista` VALUES (1,1,'Dra. Ana Lima','CRO-SP-12345','Ortodontia','11999990001'),(2,1,'Dr. Bruno Reis','CRO-SP-23456','Clínico geral','11999990002'),(3,1,'Dra. Júlia Costa','CRO-SP-34567','Endodontia','11999990003');
/*!40000 ALTER TABLE `dentista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `despesa`
--

DROP TABLE IF EXISTS `despesa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `despesa` (
  `id_despesa` bigint NOT NULL AUTO_INCREMENT,
  `id_mapa_diario` bigint NOT NULL,
  `descricao` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`id_despesa`),
  KEY `idx_despesa_mapa` (`id_mapa_diario`),
  CONSTRAINT `fk_despesa_mapa` FOREIGN KEY (`id_mapa_diario`) REFERENCES `mapa_diario` (`id_mapa_diario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `despesa`
--

LOCK TABLES `despesa` WRITE;
/*!40000 ALTER TABLE `despesa` DISABLE KEYS */;
INSERT INTO `despesa` VALUES (1,1,'Material de limpeza',35.00),(2,2,'Material de limpeza',53.00),(3,4,'Café e copos',45.00),(4,8,'Café e copos',36.00),(5,11,'Manutenção do compressor',49.00);
/*!40000 ALTER TABLE `despesa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipamento`
--

DROP TABLE IF EXISTS `equipamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipamento` (
  `id_equipamento` bigint NOT NULL AUTO_INCREMENT,
  `id_clinica` bigint NOT NULL,
  `nome` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descricao` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `valor_aquisicao` decimal(12,2) NOT NULL DEFAULT '0.00',
  `vida_util_usos` int NOT NULL,
  `usos_realizados` int NOT NULL DEFAULT '0',
  `custo_por_uso` decimal(12,2) NOT NULL DEFAULT '0.00',
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_equipamento`),
  UNIQUE KEY `uk_equipamento_clinica_nome` (`id_clinica`,`nome`),
  KEY `idx_equipamento_clinica_ativo` (`id_clinica`,`ativo`),
  CONSTRAINT `fk_equipamento_clinica` FOREIGN KEY (`id_clinica`) REFERENCES `clinica` (`id_clinica`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `chk_equipamento_valores` CHECK (((`valor_aquisicao` >= 0) and (`vida_util_usos` > 0) and (`usos_realizados` >= 0) and (`custo_por_uso` >= 0)))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipamento`
--

LOCK TABLES `equipamento` WRITE;
/*!40000 ALTER TABLE `equipamento` DISABLE KEYS */;
INSERT INTO `equipamento` VALUES (1,1,'Raio X digital','Sala 2',30000.00,15000,1240,2.00,1),(2,1,'Autoclave 21 L','Esterilização',8500.00,6000,2310,1.42,1),(3,1,'Fotopolimerizador LED','Sala 1',1200.00,4000,950,0.30,1);
/*!40000 ALTER TABLE `equipamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `escala_equipe`
--

DROP TABLE IF EXISTS `escala_equipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `escala_equipe` (
  `id_escala_equipe` bigint NOT NULL AUTO_INCREMENT,
  `id_mapa_diario` bigint NOT NULL,
  `id_usuario` bigint DEFAULT NULL,
  `nome_funcionario` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `funcao` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hora_inicio` time DEFAULT NULL,
  `hora_saida_almoco` time DEFAULT NULL,
  `hora_volta_almoco` time DEFAULT NULL,
  `hora_final` time DEFAULT NULL,
  PRIMARY KEY (`id_escala_equipe`),
  KEY `idx_escala_equipe_mapa` (`id_mapa_diario`),
  KEY `idx_escala_equipe_usuario` (`id_usuario`),
  CONSTRAINT `fk_escala_equipe_mapa` FOREIGN KEY (`id_mapa_diario`) REFERENCES `mapa_diario` (`id_mapa_diario`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_escala_equipe_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `escala_equipe`
--

LOCK TABLES `escala_equipe` WRITE;
/*!40000 ALTER TABLE `escala_equipe` DISABLE KEYS */;
/*!40000 ALTER TABLE `escala_equipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insumo`
--

DROP TABLE IF EXISTS `insumo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insumo` (
  `id_insumo` bigint NOT NULL AUTO_INCREMENT,
  `id_clinica` bigint NOT NULL,
  `nome` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unidade` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `custo_unitario` decimal(12,2) NOT NULL DEFAULT '0.00',
  `estoque_atual` decimal(12,3) NOT NULL DEFAULT '0.000',
  `estoque_minimo` decimal(12,3) NOT NULL DEFAULT '0.000',
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_insumo`),
  UNIQUE KEY `uk_insumo_clinica_nome` (`id_clinica`,`nome`),
  KEY `idx_insumo_clinica_ativo` (`id_clinica`,`ativo`),
  CONSTRAINT `fk_insumo_clinica` FOREIGN KEY (`id_clinica`) REFERENCES `clinica` (`id_clinica`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `chk_insumo_valores` CHECK (((`custo_unitario` >= 0) and (`estoque_atual` >= 0) and (`estoque_minimo` >= 0)))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insumo`
--

LOCK TABLES `insumo` WRITE;
/*!40000 ALTER TABLE `insumo` DISABLE KEYS */;
INSERT INTO `insumo` VALUES (1,1,'Luva de procedimento','CAIXA',25.90,14.000,4.000,1),(2,1,'Máscara descartável','CAIXA',18.50,8.000,3.000,1),(3,1,'Resina composta A2','SERINGA',89.90,5.000,2.000,1),(4,1,'Anestésico lidocaína','TUBETE',3.20,62.000,30.000,1),(5,1,'Sugador descartável','PACOTE',12.00,1.000,2.000,1);
/*!40000 ALTER TABLE `insumo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mapa_diario`
--

DROP TABLE IF EXISTS `mapa_diario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mapa_diario` (
  `id_mapa_diario` bigint NOT NULL AUTO_INCREMENT,
  `id_clinica` bigint NOT NULL,
  `id_dentista` bigint NOT NULL,
  `id_usuario_atendente` bigint DEFAULT NULL,
  `id_usuario_conferente` bigint DEFAULT NULL,
  `id_usuario_escritorio` bigint DEFAULT NULL,
  `data_mapa` date NOT NULL,
  `dia_semana` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data_conferencia` date DEFAULT NULL,
  `total_clinico` decimal(10,2) DEFAULT '0.00',
  `total_protese` decimal(10,2) DEFAULT '0.00',
  `bruto_clinico` decimal(10,2) DEFAULT '0.00',
  `bruto_pediatria_cirurgia` decimal(10,2) DEFAULT '0.00',
  `bruto_geral` decimal(10,2) DEFAULT '0.00',
  `total_despesas` decimal(10,2) DEFAULT '0.00',
  `valor_liquido` decimal(10,2) DEFAULT '0.00',
  `desconto_cartoes` decimal(10,2) DEFAULT '0.00',
  `desconto_cheque_pre` decimal(10,2) DEFAULT '0.00',
  `desconto_cheque_vista` decimal(10,2) DEFAULT '0.00',
  `desconto_vales` decimal(10,2) DEFAULT '0.00',
  `desconto_outros` decimal(10,2) DEFAULT '0.00',
  `total_liquido` decimal(10,2) DEFAULT '0.00',
  `saldo_final` decimal(10,2) DEFAULT '0.00',
  `qtd_pacientes` int DEFAULT '0',
  `qtd_moldagens` int DEFAULT '0',
  `qtd_mordidas` int DEFAULT '0',
  `qtd_provas` int DEFAULT '0',
  `qtd_entregas` int DEFAULT '0',
  `qtd_repeticoes` int DEFAULT '0',
  `observacoes` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ABERTO',
  `data_fechamento` datetime DEFAULT NULL,
  PRIMARY KEY (`id_mapa_diario`),
  UNIQUE KEY `uk_mapa_diario_clinica_dentista_data` (`id_clinica`,`id_dentista`,`data_mapa`),
  KEY `idx_mapa_diario_clinica` (`id_clinica`),
  KEY `idx_mapa_diario_dentista` (`id_dentista`),
  KEY `idx_mapa_diario_data` (`data_mapa`),
  KEY `idx_mapa_dashboard` (`id_clinica`,`data_mapa`,`id_dentista`),
  KEY `idx_mapa_diario_atendente` (`id_usuario_atendente`),
  KEY `idx_mapa_diario_conferente` (`id_usuario_conferente`),
  KEY `idx_mapa_diario_escritorio` (`id_usuario_escritorio`),
  CONSTRAINT `fk_mapa_diario_atendente` FOREIGN KEY (`id_usuario_atendente`) REFERENCES `usuario` (`id_usuario`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_mapa_diario_clinica` FOREIGN KEY (`id_clinica`) REFERENCES `clinica` (`id_clinica`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_mapa_diario_conferente` FOREIGN KEY (`id_usuario_conferente`) REFERENCES `usuario` (`id_usuario`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_mapa_diario_dentista` FOREIGN KEY (`id_dentista`) REFERENCES `dentista` (`id_dentista`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_mapa_diario_escritorio` FOREIGN KEY (`id_usuario_escritorio`) REFERENCES `usuario` (`id_usuario`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mapa_diario`
--

LOCK TABLES `mapa_diario` WRITE;
/*!40000 ALTER TABLE `mapa_diario` DISABLE KEYS */;
INSERT INTO `mapa_diario` VALUES (1,1,1,1,NULL,NULL,'2026-10-27','TUESDAY',NULL,270.00,0.00,270.00,0.00,270.00,35.00,258.00,12.00,0.00,0.00,0.00,0.00,258.00,223.00,2,1,0,0,0,0,'Movimento normal','ABERTO',NULL),(2,1,1,1,1,NULL,'2026-10-01','THURSDAY','2026-10-28',585.00,135.00,720.00,0.00,720.00,53.00,702.00,18.00,0.00,0.00,0.00,0.00,702.00,649.00,5,1,0,1,1,0,NULL,'FECHADO','2026-10-28 16:44:55'),(3,1,1,1,1,NULL,'2026-10-03','SATURDAY','2026-10-28',270.00,0.00,270.00,0.00,270.00,0.00,249.00,6.00,0.00,0.00,0.00,15.00,249.00,249.00,2,0,0,1,0,0,'Dia tranquilo.','FECHADO','2026-10-28 16:44:56'),(4,1,1,1,1,NULL,'2026-10-05','MONDAY','2026-10-28',720.00,0.00,720.00,0.00,720.00,45.00,714.00,6.00,0.00,0.00,0.00,0.00,714.00,669.00,5,0,0,0,0,0,NULL,'FECHADO','2026-10-28 16:44:56'),(5,1,1,1,1,NULL,'2026-10-08','THURSDAY','2026-10-28',660.00,0.00,660.00,0.00,660.00,0.00,640.00,0.00,0.00,0.00,20.00,0.00,640.00,640.00,5,1,0,0,0,0,NULL,'FECHADO','2026-10-28 16:44:56'),(6,1,1,1,1,NULL,'2026-10-09','FRIDAY','2026-10-28',360.00,120.00,480.00,0.00,480.00,0.00,474.00,6.00,0.00,0.00,0.00,0.00,474.00,474.00,4,0,1,1,1,0,'Dia tranquilo.','FECHADO','2026-10-28 16:44:57'),(7,1,1,1,1,NULL,'2026-10-10','SATURDAY','2026-10-28',228.00,0.00,228.00,0.00,228.00,0.00,228.00,0.00,0.00,0.00,0.00,0.00,228.00,228.00,2,0,1,0,0,0,'Dia tranquilo.','FECHADO','2026-10-28 16:44:57'),(8,1,1,1,1,NULL,'2026-10-13','TUESDAY','2026-10-28',375.00,135.00,510.00,0.00,510.00,36.00,504.00,6.00,0.00,0.00,0.00,0.00,504.00,468.00,4,1,0,0,0,0,'Dia tranquilo.','FECHADO','2026-10-28 16:44:57'),(9,1,1,1,1,NULL,'2026-10-15','THURSDAY','2026-10-28',300.00,108.00,408.00,0.00,408.00,0.00,388.00,0.00,0.00,0.00,20.00,0.00,388.00,388.00,3,1,0,0,0,0,NULL,'FECHADO','2026-10-28 16:44:58'),(10,1,1,1,1,NULL,'2026-10-16','FRIDAY','2026-10-28',378.00,0.00,378.00,0.00,378.00,0.00,352.00,6.00,0.00,0.00,20.00,0.00,352.00,352.00,3,0,0,0,0,0,NULL,'FECHADO','2026-10-28 16:44:58'),(11,1,1,1,1,NULL,'2026-10-24','SATURDAY','2026-10-28',270.00,0.00,270.00,0.00,270.00,49.00,264.00,6.00,0.00,0.00,0.00,0.00,264.00,215.00,2,0,0,0,0,0,NULL,'FECHADO','2026-10-28 16:44:58');
/*!40000 ALTER TABLE `mapa_diario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimentacao_insumo`
--

DROP TABLE IF EXISTS `movimentacao_insumo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movimentacao_insumo` (
  `id_movimentacao` bigint NOT NULL AUTO_INCREMENT,
  `id_insumo` bigint NOT NULL,
  `id_usuario` bigint NOT NULL,
  `tipo` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantidade` decimal(12,3) NOT NULL,
  `custo_unitario_na_data` decimal(12,2) NOT NULL DEFAULT '0.00',
  `motivo` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data_movimentacao` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_movimentacao`),
  KEY `idx_mov_insumo_data` (`id_insumo`,`data_movimentacao`),
  KEY `fk_mov_usuario` (`id_usuario`),
  CONSTRAINT `fk_mov_insumo` FOREIGN KEY (`id_insumo`) REFERENCES `insumo` (`id_insumo`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_mov_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `chk_mov_quantidade` CHECK ((`quantidade` >= 0)),
  CONSTRAINT `chk_mov_tipo` CHECK ((`tipo` in (_latin1'ENTRADA',_latin1'SAIDA',_latin1'AJUSTE')))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimentacao_insumo`
--

LOCK TABLES `movimentacao_insumo` WRITE;
/*!40000 ALTER TABLE `movimentacao_insumo` DISABLE KEYS */;
INSERT INTO `movimentacao_insumo` VALUES (1,1,1,'AJUSTE',12.000,25.90,'Estoque inicial','2026-10-28 13:29:16'),(2,2,1,'AJUSTE',2.000,18.50,'Estoque inicial','2026-10-28 13:29:16'),(3,3,1,'AJUSTE',6.000,89.90,'Estoque inicial','2026-10-28 13:29:17'),(4,4,1,'AJUSTE',80.000,3.20,'Estoque inicial','2026-10-28 13:29:17'),(5,5,1,'AJUSTE',1.000,12.00,'Estoque inicial','2026-10-28 13:29:17'),(6,1,1,'SAIDA',2.000,25.90,'Uso nos atendimentos da semana','2026-10-28 16:44:59'),(7,4,1,'SAIDA',18.000,3.20,'Uso nos atendimentos da semana','2026-10-28 16:44:59'),(8,3,1,'SAIDA',1.000,89.90,'Restaurações','2026-10-28 16:44:59'),(9,2,1,'ENTRADA',6.000,18.50,'Compra do fornecedor','2026-10-28 16:44:59'),(10,1,1,'ENTRADA',4.000,25.90,'Compra do fornecedor','2026-10-28 16:44:59');
/*!40000 ALTER TABLE `movimentacao_insumo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paciente`
--

DROP TABLE IF EXISTS `paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paciente` (
  `id_paciente` bigint NOT NULL AUTO_INCREMENT,
  `id_clinica` bigint NOT NULL,
  `nome` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cpf` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `endereco` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bairro` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cep` varchar(9) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data_nascimento` date DEFAULT NULL,
  PRIMARY KEY (`id_paciente`),
  UNIQUE KEY `uk_paciente_clinica_cpf` (`id_clinica`,`cpf`),
  KEY `idx_paciente_clinica` (`id_clinica`),
  CONSTRAINT `fk_paciente_clinica` FOREIGN KEY (`id_clinica`) REFERENCES `clinica` (`id_clinica`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paciente`
--

LOCK TABLES `paciente` WRITE;
/*!40000 ALTER TABLE `paciente` DISABLE KEYS */;
INSERT INTO `paciente` VALUES (1,1,'Ana Clara Mendes','010.010.010-00','Rua das Acácias, 100','Centro','01000-000','11998000000','ana@email.com','2010-03-14'),(2,1,'Beatriz Rocha','011.011.011-01','Rua das Acácias, 101','Vila Mariana','01001-000','11998001371','beatriz@email.com','1985-07-02'),(3,1,'Camila Duarte','012.012.012-02','Rua das Acácias, 102','Pinheiros','01002-000','11998002742','camila@email.com','1997-11-21'),(4,1,'Fernanda Alves','013.013.013-03','Rua das Acácias, 103','Centro','01003-000','11998004113','fernanda@email.com','2003-01-09'),(5,1,'Gabriel Souza','014.014.014-04','Rua das Acácias, 104','Mooca','01004-000','11998005484','gabriel@email.com','1989-05-30'),(6,1,'João Pedro Santos','015.015.015-05','Rua das Acácias, 105','Tatuapé','01005-000','11998006855','joão@email.com','1974-09-12'),(7,1,'Lucas Ferreira','016.016.016-06','Rua das Acácias, 106','Centro','01006-000','11998008226','lucas@email.com','1995-02-17'),(8,1,'Maria Oliveira','017.017.017-07','Rua das Acácias, 107','Bela Vista','01007-000','11998009597','maria@email.com','1990-05-20'),(9,1,'Patrícia Gomes','018.018.018-08','Rua das Acácias, 108','Moema','01008-000','11998010968','patrícia@email.com','1981-12-03'),(10,1,'Renata Barros','019.019.019-09','Rua das Acácias, 109','Santana','01009-000','11998012339','renata@email.com','1993-08-25'),(11,1,'Roberto Nunes','020.020.020-10','Rua das Acácias, 110','Lapa','01010-000','11998013710','roberto@email.com','1968-04-11'),(12,1,'Sônia Martins','021.021.021-11','Rua das Acácias, 111','Perdizes','01011-000','11998015081','sônia@email.com','1959-10-06'),(13,1,'Thiago Lima','022.022.022-12','Rua das Acácias, 112','Centro','01012-000','11998016452','thiago@email.com','2001-06-15'),(14,1,'Vinícius Prado','023.023.023-13','Rua das Acácias, 113','Butantã','01013-000','11998017823','vinícius@email.com','1987-03-28'),(15,1,'Helena Prado','024.024.024-14','Rua das Acácias, 114','Moema','01014-000','11998019194','helena@email.com','1978-01-19'),(16,1,'Otávio Ramos','025.025.025-15','Rua das Acácias, 115','Ipiranga','01015-000','11998020565','otávio@email.com','1999-09-09'),(17,1,'Lívia Castro','026.026.026-16','Rua das Acácias, 116','Centro','01016-000','11998021936','lívia@email.com','2005-12-12'),(18,1,'Marcos Teixeira','027.027.027-17','Rua das Acácias, 117','Saúde','01017-000','11998023307','marcos@email.com','1972-07-07'),(21,1,'Adriana Bezerra','300.300.300-10','Avenida Paulista, 1000','Vila Mariana','01300-100','11971000000',NULL,'1983-02-11'),(22,1,'Bruno Henrique Lopes','301.301.301-11','Avenida Paulista, 1015','Centro','01301-100','11971007919',NULL,'1996-07-23'),(23,1,'Cecília Andrade','302.302.302-12','Avenida Paulista, 1030','Moema','01302-100','11971015838',NULL,'2012-04-30'),(24,1,'Daniel Fonseca','303.303.303-13','Avenida Paulista, 1045','Pinheiros','01303-100','11971023757',NULL,'1979-11-02'),(25,1,'Eduarda Vasconcelos','304.304.304-14','Avenida Paulista, 1060','Santana','01304-100','11971031676',NULL,'2001-09-14'),(26,1,'Fábio Nascimento','305.305.305-15','Avenida Paulista, 1075','Tatuapé','01305-100','11971039595',NULL,'1965-03-08'),(27,1,'Giovana Ribeiro','306.306.306-16','Avenida Paulista, 1090','Centro','01306-100','11971047514',NULL,'1992-12-19'),(28,1,'Heitor Cardoso','307.307.307-17','Avenida Paulista, 1105','Mooca','01307-100','11971055433',NULL,'2015-06-05'),(29,1,'Isadora Monteiro','308.308.308-18','Avenida Paulista, 1120','Perdizes','01308-100','11971063352',NULL,'1988-08-27'),(30,1,'Jonas Albuquerque','309.309.309-19','Avenida Paulista, 1135','Lapa','01309-100','11971071271',NULL,'1970-01-15'),(31,1,'Teste Integração 38456262','900.384.562-62','Rua do Teste, 1','Centro','01234-567',NULL,NULL,NULL);
/*!40000 ALTER TABLE `paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `procedimento`
--

DROP TABLE IF EXISTS `procedimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `procedimento` (
  `id_procedimento` bigint NOT NULL AUTO_INCREMENT,
  `id_clinica` bigint NOT NULL,
  `nome` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor` decimal(10,2) DEFAULT NULL,
  `duracao_minutos` int DEFAULT NULL,
  PRIMARY KEY (`id_procedimento`),
  KEY `idx_procedimento_clinica` (`id_clinica`),
  CONSTRAINT `fk_procedimento_clinica` FOREIGN KEY (`id_clinica`) REFERENCES `clinica` (`id_clinica`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `procedimento`
--

LOCK TABLES `procedimento` WRITE;
/*!40000 ALTER TABLE `procedimento` DISABLE KEYS */;
INSERT INTO `procedimento` VALUES (1,1,'Avaliação',120.00,30),(2,1,'Limpeza',180.00,60),(3,1,'Restauração',250.00,45),(4,1,'Manutenção do aparelho',150.00,30),(5,1,'Tratamento de canal',900.00,90),(6,1,'Clareamento',700.00,60),(7,1,'Extração',300.00,45);
/*!40000 ALTER TABLE `procedimento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` bigint NOT NULL AUTO_INCREMENT,
  `id_clinica` bigint NOT NULL,
  `id_dentista` bigint DEFAULT NULL,
  `nome` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `login` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `senha_hash` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nivel_acesso` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `uk_usuario_login` (`login`),
  UNIQUE KEY `uk_usuario_dentista` (`id_dentista`),
  KEY `idx_usuario_clinica` (`id_clinica`),
  CONSTRAINT `fk_usuario_clinica` FOREIGN KEY (`id_clinica`) REFERENCES `clinica` (`id_clinica`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_usuario_dentista` FOREIGN KEY (`id_dentista`) REFERENCES `dentista` (`id_dentista`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,1,1,'Dra. Ana Lima','ana','$2a$10$Wgmxjkw.gbOayoS2hHt3qeWz2vINvPrJnw0.e.e8yUghkimVtqYOm','DENTISTA',1),(2,1,NULL,'Carla Souza','carla','$2a$10$PsfY2rRn6vOkvrCKKnXPNu0NmfedxiDqIYZJuUkdYOQ2./c8eda8C','RECEPCIONISTA',1),(3,1,NULL,'Teste Cadastro Recepção','teste_990945','$2a$10$udCpNN3OqwtgSXPS8KHPOeF..YYxpnzcwgEo5OCCPT/oMax4Fe16.','RECEPCIONISTA',1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vale`
--

DROP TABLE IF EXISTS `vale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vale` (
  `id_vale` bigint NOT NULL AUTO_INCREMENT,
  `id_mapa_diario` bigint NOT NULL,
  `nome_responsavel` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numero_ficha` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `valor` decimal(10,2) DEFAULT '0.00',
  `descricao` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `conferido` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id_vale`),
  KEY `idx_vale_mapa` (`id_mapa_diario`),
  CONSTRAINT `fk_vale_mapa` FOREIGN KEY (`id_mapa_diario`) REFERENCES `mapa_diario` (`id_mapa_diario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vale`
--

LOCK TABLES `vale` WRITE;
/*!40000 ALTER TABLE `vale` DISABLE KEYS */;
INSERT INTO `vale` VALUES (1,5,'Carla Souza',NULL,20.00,'Vale transporte',1),(2,9,'Carla Souza',NULL,20.00,'Vale transporte',1),(3,10,'Carla Souza',NULL,20.00,'Vale transporte',1);
/*!40000 ALTER TABLE `vale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_dashboard_mensal`
--

DROP TABLE IF EXISTS `vw_dashboard_mensal`;
/*!50001 DROP VIEW IF EXISTS `vw_dashboard_mensal`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_dashboard_mensal` AS SELECT 
 1 AS `id_clinica`,
 1 AS `id_dentista`,
 1 AS `ano`,
 1 AS `mes`,
 1 AS `dias_registrados`,
 1 AS `total_clinico`,
 1 AS `total_protese`,
 1 AS `bruto_clinico`,
 1 AS `bruto_pediatria_cirurgia`,
 1 AS `bruto_geral`,
 1 AS `total_despesas`,
 1 AS `desconto_cartoes`,
 1 AS `desconto_cheque_pre`,
 1 AS `desconto_cheque_vista`,
 1 AS `desconto_vales`,
 1 AS `desconto_outros`,
 1 AS `total_liquido`,
 1 AS `saldo_final`,
 1 AS `qtd_pacientes`,
 1 AS `qtd_moldagens`,
 1 AS `qtd_mordidas`,
 1 AS `qtd_provas`,
 1 AS `qtd_entregas`,
 1 AS `qtd_repeticoes`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'dentalFlow'
--

--
-- Current Database: `dentalFlow`
--

USE `dentalFlow`;

--
-- Final view structure for view `vw_dashboard_mensal`
--

/*!50001 DROP VIEW IF EXISTS `vw_dashboard_mensal`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_dashboard_mensal` AS select `mapa_diario`.`id_clinica` AS `id_clinica`,`mapa_diario`.`id_dentista` AS `id_dentista`,year(`mapa_diario`.`data_mapa`) AS `ano`,month(`mapa_diario`.`data_mapa`) AS `mes`,count(0) AS `dias_registrados`,sum(`mapa_diario`.`total_clinico`) AS `total_clinico`,sum(`mapa_diario`.`total_protese`) AS `total_protese`,sum(`mapa_diario`.`bruto_clinico`) AS `bruto_clinico`,sum(`mapa_diario`.`bruto_pediatria_cirurgia`) AS `bruto_pediatria_cirurgia`,sum(`mapa_diario`.`bruto_geral`) AS `bruto_geral`,sum(`mapa_diario`.`total_despesas`) AS `total_despesas`,sum(`mapa_diario`.`desconto_cartoes`) AS `desconto_cartoes`,sum(`mapa_diario`.`desconto_cheque_pre`) AS `desconto_cheque_pre`,sum(`mapa_diario`.`desconto_cheque_vista`) AS `desconto_cheque_vista`,sum(`mapa_diario`.`desconto_vales`) AS `desconto_vales`,sum(`mapa_diario`.`desconto_outros`) AS `desconto_outros`,sum(`mapa_diario`.`total_liquido`) AS `total_liquido`,sum(`mapa_diario`.`saldo_final`) AS `saldo_final`,cast(sum(`mapa_diario`.`qtd_pacientes`) as signed) AS `qtd_pacientes`,cast(sum(`mapa_diario`.`qtd_moldagens`) as signed) AS `qtd_moldagens`,cast(sum(`mapa_diario`.`qtd_mordidas`) as signed) AS `qtd_mordidas`,cast(sum(`mapa_diario`.`qtd_provas`) as signed) AS `qtd_provas`,cast(sum(`mapa_diario`.`qtd_entregas`) as signed) AS `qtd_entregas`,cast(sum(`mapa_diario`.`qtd_repeticoes`) as signed) AS `qtd_repeticoes` from `mapa_diario` group by `mapa_diario`.`id_clinica`,`mapa_diario`.`id_dentista`,year(`mapa_diario`.`data_mapa`),month(`mapa_diario`.`data_mapa`) */;
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

-- Dump completed

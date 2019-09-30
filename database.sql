CREATE DATABASE  IF NOT EXISTS `reismarreiroslda2_dev` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `reismarreiroslda2_dev`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 192.168.2.22    Database: reismarreiroslda2_dev
-- ------------------------------------------------------
-- Server version	5.7.26-log

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
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articles` (
  `artId` int(11) NOT NULL AUTO_INCREMENT,
  `artName` varchar(150) NOT NULL,
  `artDesc` mediumtext NOT NULL,
  `creationDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `artType` tinyint(4) NOT NULL,
  `artStatus` tinyint(4) NOT NULL,
  `artIconClass` varchar(45) DEFAULT NULL,
  `artLink` varchar(256) DEFAULT NULL,
  `artLinkName` varchar(45) DEFAULT NULL,
  `artLocation` varchar(100) DEFAULT '0',
  PRIMARY KEY (`artId`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
INSERT INTO `articles` VALUES (10,'homepage_about','<p>Sediada em Lagos no Algarve, a <strong>Reis & Marreiros Lda</strong>, é uma empresa que tem como principal objetivo desenvolver <strong>software personalizado</strong>, mediante as necessidades de cada cliente.</p>\r\n\r\n<p>A nossa experiente, profissional e dedicada equipa tem como principal foco, responder às suas necessidades,garantindo uma <strong>experiência positiva e 100% satisfatória</strong> na aquisição do seu produto.</p>','2019-07-29 21:34:19',1,1,'','#contact','Contacte-nos!','1'),(12,'test','<p>test</p>','2019-07-29 21:34:42',3,1,'','','','0'),(13,'contacts','<p>Contacte-nos com a sua necessidade e nós <strong class=\"strcontact\">personalizamos a solução</strong> à sua medida. O limite é a sua imaginação!</p>','2019-08-07 11:50:28',1,1,'','','Contacte-nos!','1,2'),(14,'Desenvolvimento de Software','<p>Desenvolvemos e personalizamos soluções à medida de todas as suas necessidades.</p>','2019-08-07 11:52:37',2,1,'fa-laptop','','','1'),(15,'Desenvolvimento Web | Web Design','<p>Projetamos e desenvolvemos Web Sites personalizados e criativos que se adaptam a todas as necessidades.</p>','2019-08-07 11:52:55',2,1,'fa-building','','','1'),(16,'Consultoria','<p>Apoio personalizado ao cliente na selecção e implementação de soluções em software.</p>','2019-08-07 11:53:09',2,1,'fa-clipboard-check','','','1'),(17,'Outsourcing','<p>Colocamos ao seu dispor uma equipa de profissionais qualificados em PHP, Lucee e ColdFusion.</p>','2019-08-07 11:53:21',2,1,'fa-keyboard','','','1'),(18,'SEO','<p>Otimização de websites para melhor funcionamento com motores de busca, e tornar o seu site mais visivel.</p>','2019-08-07 11:53:31',2,1,'fa-binoculars','','','1'),(19,'Email Profissional','<p>Criação de email profissional para aumentar a credibilidade das suas comunicações, dando mais segurança a quem as recebe.</p>','2019-08-07 11:53:42',2,1,'fa-id-card','','','1'),(20,'Espaço Co-Work','<p>Trabalhe num ambiente descontraído e agradável com a harmonia perfeita para gerir o seu projeto ou negócio.</p>','2019-08-07 11:53:53',2,1,'fa-users','goTo(\'cowork.cfm\')','Saiba Mais','1'),(21,'Espaço WiFi 5G','<p>Conecte-se ao mundo usando a máxima velocidade e estabilidade através da nossa rede WiFi 5G.</p>','2019-08-07 11:54:01',2,1,'fa-wifi','','','1'),(23,'cowork_about','<p>Um espaço totalmente equipado para iniciar o seu trabalho logo desde o primeiro minuto. Encontrará um ambiente profissional e descontraído, uma zona de alimentação equipada e parque de estacionamento acessível. Estará também ao seu dispor internet de alta velocidade com WiFi 5G.</p>','2019-08-07 15:16:02',1,1,'','#contact','Agende a sua visita','2'),(24,'cowork_header','<h1><span>Co-Work</span></h1>\r\n<p>O <span class=\"cowork-color\">{<span class=\"cowork-our\">nosso</span>}</span> <span>seu</span> espaço! O seu projeto!</p>','2019-08-07 15:49:41',1,1,'','#about','Saiba Mais','2'),(25,'homepage_header','<h1>Desenvolvimento de software</h1><h2>Personalizado à medida da sua necessidade</h2>','2019-08-07 16:31:50',1,1,'','#about','Saiba mais','1'),(26,'teste','<p>teste</p>','2019-09-10 13:20:38',5,0,'','','','0'),(31,'Excelente Localização','<p>Localizado apenas a 5 minutos do centro de Lagos com parque de estacionamento público gratuito.</p>','2019-09-17 08:55:54',2,1,'fa-route','','','2'),(32,'Zona de Alimentação','<p>A zona de alimentação está equipada com microondas e frigorífico com congelador integrado.</p>','2019-09-17 09:23:34',2,1,'fa-utensils','','','2'),(33,'Máquina de Café','<p>Ao seu dispor está uma máquina de café para aqueles valiosos coffee-breaks que todos precisamos.</p>','2019-09-17 09:24:27',2,1,'fa-coffee','','','2'),(34,'Internet de Alta Velocidade','<p>Neste espaço pode conectar-se usando a máxima velocidade e estabilidade da nossa rede WiFi 5G.</p>','2019-09-17 09:25:43',2,1,'fa-wifi','','','2'),(35,'Posto de Trabalho','<p>Equipado com secretária, cadeira de escritório e possibilidade de computador com dois ecrãs.</p>','2019-09-17 09:26:20',2,1,'fa-desktop','','','2'),(36,'Acesso a Impressora','<p>Em caso de necessidade pode facilmente imprimir todos os trabalhos e documentos que precise.</p>','2019-09-17 09:27:02',2,1,'fa-print','','','2'),(38,'cowork_about_title','O <span class=\"cowork-color\">{<span class=\"cowork-our\">nosso</span>}</span> seu espaço!','2019-09-17 10:55:05',6,1,'','','','0'),(39,'homepage_about_title','Sobre Nós','2019-09-17 14:43:28',6,1,'','','','0'),(40,'cowork_ofertas_title','Ofertas do Espaço','2019-09-18 10:47:03',6,1,'','','','0'),(41,'homepage_services_title','Serviços','2019-09-18 11:17:57',6,1,'','','','0'),(42,'homepage_portfolio_title','Portefólio','2019-09-18 11:43:19',6,1,'','','','0'),(43,'homepage_team_title','A nossa equipa','2019-09-18 12:14:16',6,1,'','','','0'),(44,'contacts_title','Contactos','2019-09-18 12:15:47',6,1,'','','','0'),(45,'cowork_price_title','Preçário','2019-09-18 15:24:01',6,1,'','','','0'),(46,'cowork_price','<p>100€ / Mês</p>\r\n<p>Para mais informações não hesite em contactar-nos.</p>','2019-09-18 15:34:17',1,1,'','#contacts','Contacte-nos','2'),(47,'homepage_title','Web Design|Lojas Online|Software por Medida|Reis &amp; Marreiros, Lda.','2019-09-19 14:53:30',6,1,'','','','0'),(48,'cowork_page_title','Co-Work - Lagos - Algarve - Portugal - Reis &amp; Marreiros, Lda.','2019-09-19 14:54:02',6,1,'','','','0'),(49,'pea_page_title','Perdidos e Achados - Lagos - Algarve - Portugal - Reis & Marreiros, Lda.','2019-09-19 14:54:38',6,1,'','','','0'),(50,'peaPage_title','A gestão de perdidos e achados mais simples do mercado','2019-09-24 11:07:00',6,1,'','','','0');
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articlesimages`
--

DROP TABLE IF EXISTS `articlesimages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articlesimages` (
  `imgId` int(11) NOT NULL,
  `artId` int(11) NOT NULL,
  PRIMARY KEY (`imgId`,`artId`),
  KEY `FK_articles_articlesImages_imgId_idx` (`artId`),
  CONSTRAINT `FK_articles_articlesImages_imgId` FOREIGN KEY (`artId`) REFERENCES `articles` (`artId`) ON DELETE CASCADE,
  CONSTRAINT `FK_imagesCatalog_articlesImages_artId` FOREIGN KEY (`imgId`) REFERENCES `imagescatalog` (`imgId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articlesimages`
--

LOCK TABLES `articlesimages` WRITE;
/*!40000 ALTER TABLE `articlesimages` DISABLE KEYS */;
INSERT INTO `articlesimages` VALUES (34,24),(5,25);
/*!40000 ALTER TABLE `articlesimages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagescatalog`
--

DROP TABLE IF EXISTS `imagescatalog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagescatalog` (
  `imgId` int(11) NOT NULL AUTO_INCREMENT,
  `imgLabel` varchar(45) NOT NULL,
  `imgPath` varchar(45) NOT NULL,
  `imgDesc` varchar(45) NOT NULL,
  `imgCreationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `imgSlideShow` tinyint(2) NOT NULL DEFAULT '0',
  `imgBanner` tinyint(2) NOT NULL DEFAULT '0',
  `imgPortfolio` tinyint(2) NOT NULL DEFAULT '0',
  `imgTeam` tinyint(2) NOT NULL DEFAULT '0',
  `imgLocation` varchar(100) NOT NULL DEFAULT '0',
  PRIMARY KEY (`imgId`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagescatalog`
--

LOCK TABLES `imagescatalog` WRITE;
/*!40000 ALTER TABLE `imagescatalog` DISABLE KEYS */;
INSERT INTO `imagescatalog` VALUES (5,'Header','facebookPreview.png','Banner','2019-08-07 16:47:13',0,1,0,0,'1'),(6,'Baia da Luz','baiadaluz.jpeg','Consultoria','2019-09-09 15:28:58',0,0,1,0,'1'),(7,'Casas do Barlavento','casasdobarlavento.jpeg','Consultoria','2019-09-09 16:13:44',0,0,1,0,'1'),(8,'CDB Resorts','cdbresorts.jpeg','Consultoria','2019-09-09 16:46:20',0,0,1,0,'1'),(9,'EPL - Mecatrónica & Robótica','epl-si.jpeg','Consultoria','2019-09-09 16:47:04',0,0,1,0,'1'),(10,'Estrela da Luz','estreladaluz.jpeg','Consultoria','2019-09-09 16:47:48',0,0,1,0,'1'),(11,'Jardim da Meia Praia','jardimmeiapraia.jpeg','Consultoria','2019-09-09 16:48:28',0,0,1,0,'1'),(12,'CAT','gm-cat.jpeg','Web Design - Templates','2019-09-09 16:54:09',0,0,1,0,'1'),(13,'Monster Jam','gm-monsterjam.jpeg','Web Design - Templates','2019-09-09 16:55:19',0,0,1,0,'1'),(14,'NTS','gm-nts.jpeg','Web Design - Templates','2019-09-10 08:48:57',0,0,1,0,'1'),(15,'Total Sports','gm-totalsports.jpeg','Web Design - Templates','2019-09-10 08:50:40',0,0,1,0,'1'),(16,'Group Travel Tech','groupminder.jpeg','Web Design - Websites','2019-09-10 08:51:28',0,0,1,0,'1'),(17,'GroupMinder  - CMS','gm-cms.jpeg','Desenvolvimento Personalizado - Web App','2019-09-10 08:52:18',0,0,1,0,'1'),(18,'Group Xpress','groupexpress.jpeg','Web Design - Websites','2019-09-10 08:53:11',0,0,1,0,'1'),(19,'Group Xpress - CMS','gx-cms.jpeg','Desenvolvimento Personalizado - Web App','2019-09-10 08:54:02',0,0,1,0,'1'),(20,'Inn Lagos','innlagos.jpeg','Web Design - Websites','2019-09-10 08:54:45',0,0,1,0,'1'),(21,'Residence Lagos','residencelagos.jpeg','Web Design - Websites','2019-09-10 08:55:15',0,0,1,0,'1'),(22,'Suites Inn Lagos','suitesinnlagos.jpeg','Web Design - Websites','2019-09-10 08:55:33',0,0,1,0,'1'),(23,'RAM - CMS','ram-cms.jpeg','Desenvolvimento Personalizado - Web App','2019-09-10 08:56:41',0,0,1,0,'1'),(24,'CDB Resorts - CMS','owners-portal.jpeg','Desenvolvimento Personalizado - Web App','2019-09-10 08:58:53',0,0,1,0,'1'),(25,'António Marreiros','antonio.jpg','Fundador/Programador','2019-09-10 10:55:07',0,0,0,1,'1'),(26,'Tiago Reis','tiago.jpg','Fundador/Programador','2019-09-10 10:55:49',0,0,0,1,'1'),(27,'Noémia Reis','noemia.jpg','Gestora de Projetos','2019-09-10 10:56:54',0,0,0,1,'1'),(28,'Bruno Cunha','bruno.jpg','Administrador de Sistemas','2019-09-10 10:57:34',0,0,0,1,'1'),(29,'Richard Pacheco','richard.jpg','Programador','2019-09-10 10:58:07',0,0,0,1,'1'),(30,'Diogo Bentes','diogo.jpg','Programador','2019-09-10 10:58:33',0,0,0,1,'1'),(31,'João Cunha','fred.jpg','Programador','2019-09-10 10:58:51',0,0,0,1,'1'),(32,'Jorge Rocha','jorge.jpg','Programador','2019-09-10 10:59:09',0,0,0,1,'1'),(33,'Fábio Moreira','fabio.jpg','Programador','2019-09-10 10:59:29',0,0,0,1,'1'),(34,'cowork_header','hero1.jpg','Banner','2019-09-17 14:57:32',0,1,0,0,'2'),(35,'Cowork 1','gal1.jpg','cowork','2019-09-17 15:36:29',0,0,1,0,'2'),(36,'Cowork 2','gal2.jpg','Cowork','2019-09-17 16:20:07',0,0,1,0,'2'),(37,'Cowork 3','gal3.jpg','Cowork','2019-09-17 16:20:34',0,0,1,0,'2'),(38,'Cowork 4','gal4.jpg','Cowork','2019-09-17 16:20:55',0,0,1,0,'2'),(39,'Cowork 5','gal5.jpg','Cowork','2019-09-17 16:21:43',0,0,1,0,'2'),(40,'Cowork 6','gal6.jpg','Cowork','2019-09-17 16:22:07',0,0,1,0,'2');
/*!40000 ALTER TABLE `imagescatalog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metatags`
--

DROP TABLE IF EXISTS `metatags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metatags` (
  `mtId` int(11) NOT NULL AUTO_INCREMENT,
  `mtKeywords` varchar(1000) CHARACTER SET latin1 DEFAULT NULL,
  `mtDescription` varchar(1000) CHARACTER SET latin1 DEFAULT NULL,
  `mtAuthor` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `mtRevised` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `mtOgTitle` varchar(1000) CHARACTER SET latin1 DEFAULT NULL,
  `mtOgDesc` varchar(1000) CHARACTER SET latin1 DEFAULT NULL,
  `mtOgSitename` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `mtOgImage` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `mtOgImgType` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `mtOgImgWidth` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `mtOgImgHeight` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `mtOgType` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `mtOgUrl` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `mtCanonical` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `mtLocation` tinyint(2) DEFAULT '0',
  PRIMARY KEY (`mtId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=ucs2;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metatags`
--

LOCK TABLES `metatags` WRITE;
/*!40000 ALTER TABLE `metatags` DISABLE KEYS */;
INSERT INTO `metatags` VALUES (7,'teste','teste','teste','2018-12-31','teste','teste','teste','hk2js.jpg','img/jpg','600','400','teste','http://teste','http://teste',28);
/*!40000 ALTER TABLE `metatags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages` (
  `pageId` int(11) NOT NULL AUTO_INCREMENT,
  `pageName` varchar(255) CHARACTER SET latin1 NOT NULL,
  `pageStatus` tinyint(2) NOT NULL,
  PRIMARY KEY (`pageId`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,'Homepage',1),(2,'Cowork',1),(3,'PEA',0),(28,'Página de teste',0);
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `systeminfo`
--

DROP TABLE IF EXISTS `systeminfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `systeminfo` (
  `sysId` int(11) NOT NULL AUTO_INCREMENT,
  `sysAddress` varchar(500) NOT NULL,
  `sysCoordinates` varchar(1000) DEFAULT '',
  `sysMail` varchar(255) NOT NULL,
  `sysPhone` int(11) NOT NULL,
  `sysSchedule` varchar(255) NOT NULL,
  `sysCoordinatesApi` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`sysId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `systeminfo`
--

LOCK TABLES `systeminfo` WRITE;
/*!40000 ALTER TABLE `systeminfo` DISABLE KEYS */;
INSERT INTO `systeminfo` VALUES (1,'Rua Brito Camacho Lt 41 Cave frente 8600-534 Lagos','https://goo.gl/maps/LdCwxuPUuEL2','info@reismarreiroslda.com',932427033,'Seg - Sex, 9:00 - 18:00','https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3182.3535318121303!2d-8.67961468427636!3d37.0967011798885!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xd1b3190fc321ed5%3A0x2dd2e2ced1990fe1!2sReis+%26+Marreiros%2C+Lda!5e0!3m2!1spt-PT!2spt!4v1538562694975');
/*!40000 ALTER TABLE `systeminfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `usrId` int(11) NOT NULL AUTO_INCREMENT,
  `usrName` varchar(45) NOT NULL,
  `usrEmail` varchar(250) NOT NULL,
  `usrPassword` varchar(64) NOT NULL,
  `usrAdmin` tinyint(4) NOT NULL,
  `usrStatus` tinyint(4) NOT NULL,
  `usrSalt` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`usrId`),
  UNIQUE KEY `usrEmail_UNIQUE` (`usrEmail`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (3,'fabioluzm','fabiomoreira.ram@gmail.com','CB1583ECAF0F3D1ABC44B2F2039B70B4BB8990E4752A6D430E8346EF110C27B7',1,1,'17E896129E9CAACA8C52C943AB56F44C02D4A556F1641ACA61530A5C8AEDA10A'),(5,'RAM','reismarreiroslda@gmail.com','0A1675A407FA786D09B5E69016C2CEF8BA893B1C3C4DAADFAC2D5296D19ED252',0,1,'1AA22039A9CE2113E5A8FF654385967CAF09035A140713BA126F312643B82190'),(6,'Gonçalo','goncalogomes.ram@gmail.com','CE205B93104E4CBCFDE9E4150E8BE4B5934C2BE00B3F8ECFA1EF1B4F35875A78',1,0,'1DA9584F15B728D57430CC4008214A0C7098D57BD1C5EDA612FBD51329BAB46B'),(7,'Teste Secretario','secretario@teste.com','CB1583ECAF0F3D1ABC44B2F2039B70B4BB8990E4752A6D430E8346EF110C27B7',2,1,'17E896129E9CAACA8C52C943AB56F44C02D4A556F1641ACA61530A5C8AEDA10A'),(10,'Teste Autor','teste@teste.com','BBFD400DC218E0462BF3F20C673A6B81D0CED2C6BA35839C8D924D6FB9B7CE15',3,1,'62B68C8135B6215808229A00CFCB639E90569274CE9D2406269BA5608B63CF0D'),(11,'Noémia Reis','noemiareis.ram@gmail.com','75A9334B696040C36D545E792B0965C2FFFC156473ADE388B6ADA00A53156E59',3,1,'A573FE56A2F94282B475D0610DB8116FBF29548E8A34EDF8ABAA595E3F948105');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'reismarreiroslda2_dev'
--

--
-- Dumping routines for database 'reismarreiroslda2_dev'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-27 16:43:17

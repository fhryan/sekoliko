-- MySQL dump 10.13  Distrib 5.7.25, for Linux (x86_64)
--
-- Host: localhost    Database: sekoliko2.0
-- ------------------------------------------------------
-- Server version	5.7.25-0ubuntu0.18.04.2

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
-- Table structure for table `migration_versions`
--

DROP TABLE IF EXISTS `migration_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migration_versions` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migration_versions`
--

LOCK TABLES `migration_versions` WRITE;
/*!40000 ALTER TABLE `migration_versions` DISABLE KEYS */;
INSERT INTO `migration_versions` VALUES ('20190124205803'),('20190128053150'),('20190128102308'),('20190214103107'),('20190215100015'),('20190215101315'),('20190215102505'),('20190215133951'),('20190215134050'),('20190216125744'),('20190216191316'),('20190216201504'),('20190216220041'),('20190225081452'),('20190225084907'),('20190225093858'),('20190225122151'),('20190225122345'),('20190225140546'),('20190225191533'),('20190326223059'),('20190326224726'),('20190326225217'),('20190327111917'),('20190327143100'),('20190327153313'),('20190327154526'),('20190327185220'),('20190327191540'),('20190327195948'),('20190327204237'),('20190328103239'),('20190328145337'),('20190328210856'),('20190328230553'),('20190329073616'),('20190329073804'),('20190329082422');
/*!40000 ALTER TABLE `migration_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sk_abs`
--

DROP TABLE IF EXISTS `sk_abs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sk_abs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `abs_motif` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `abs_date_deb` datetime DEFAULT NULL,
  `abs_date_fin` datetime DEFAULT NULL,
  `ets_nom` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ets_adresse` longtext COLLATE utf8_unicode_ci,
  `ets_responsable` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ets_phone` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ets_email` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ets_logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_962A0FD08D93D649` (`user`),
  CONSTRAINT `FK_962A0FD08D93D649` FOREIGN KEY (`user`) REFERENCES `sk_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sk_abs`
--

LOCK TABLES `sk_abs` WRITE;
/*!40000 ALTER TABLE `sk_abs` DISABLE KEYS */;
/*!40000 ALTER TABLE `sk_abs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sk_bibliotheque`
--

DROP TABLE IF EXISTS `sk_bibliotheque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sk_bibliotheque` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `date_debut` datetime NOT NULL,
  `date_fin` datetime DEFAULT NULL,
  `ets_nom` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ets_adresse` longtext COLLATE utf8_unicode_ci,
  `ets_responsable` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ets_phone` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ets_email` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ets_logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_10A8F090A76ED395` (`user_id`),
  CONSTRAINT `FK_10A8F090A76ED395` FOREIGN KEY (`user_id`) REFERENCES `sk_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sk_bibliotheque`
--

LOCK TABLES `sk_bibliotheque` WRITE;
/*!40000 ALTER TABLE `sk_bibliotheque` DISABLE KEYS */;
/*!40000 ALTER TABLE `sk_bibliotheque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sk_bibliotheque_sk_book`
--

DROP TABLE IF EXISTS `sk_bibliotheque_sk_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sk_bibliotheque_sk_book` (
  `sk_bibliotheque_id` int(11) NOT NULL,
  `sk_book_id` int(11) NOT NULL,
  PRIMARY KEY (`sk_bibliotheque_id`,`sk_book_id`),
  KEY `IDX_D824A53257E3B7B7` (`sk_bibliotheque_id`),
  KEY `IDX_D824A532270AC401` (`sk_book_id`),
  CONSTRAINT `FK_D824A532270AC401` FOREIGN KEY (`sk_book_id`) REFERENCES `sk_book` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_D824A53257E3B7B7` FOREIGN KEY (`sk_bibliotheque_id`) REFERENCES `sk_bibliotheque` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sk_bibliotheque_sk_book`
--

LOCK TABLES `sk_bibliotheque_sk_book` WRITE;
/*!40000 ALTER TABLE `sk_bibliotheque_sk_book` DISABLE KEYS */;
/*!40000 ALTER TABLE `sk_bibliotheque_sk_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sk_book`
--

DROP TABLE IF EXISTS `sk_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sk_book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `is_reserved` tinyint(1) DEFAULT '0',
  `ets_nom` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ets_adresse` longtext COLLATE utf8_unicode_ci,
  `ets_responsable` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ets_phone` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ets_email` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ets_logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `date_debut` datetime DEFAULT NULL,
  `date_fin` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_723DCE66A76ED395` (`user_id`),
  CONSTRAINT `FK_723DCE66A76ED395` FOREIGN KEY (`user_id`) REFERENCES `sk_user` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sk_book`
--

LOCK TABLES `sk_book` WRITE;
/*!40000 ALTER TABLE `sk_book` DISABLE KEYS */;
INSERT INTO `sk_book` VALUES (2,'Boobaoooaaaaaaaaaa',1,'Techzara',NULL,NULL,NULL,NULL,NULL,1,'2019-03-29 11:52:00','2019-03-29 11:52:00'),(4,'Boobo',1,'Techzara',NULL,NULL,NULL,NULL,NULL,1,'2019-03-29 12:04:00','2019-03-29 12:04:00');
/*!40000 ALTER TABLE `sk_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sk_classe`
--

DROP TABLE IF EXISTS `sk_classe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sk_classe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `niveau` int(11) DEFAULT NULL,
  `classe_nom` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ets_nom` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ets_adresse` longtext COLLATE utf8_unicode_ci,
  `ets_responsable` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ets_phone` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ets_email` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ets_logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_497ED0384BDFF36B` (`niveau`),
  CONSTRAINT `FK_497ED0384BDFF36B` FOREIGN KEY (`niveau`) REFERENCES `sk_niveau` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sk_classe`
--

LOCK TABLES `sk_classe` WRITE;
/*!40000 ALTER TABLE `sk_classe` DISABLE KEYS */;
INSERT INTO `sk_classe` VALUES (1,NULL,'zaza',NULL,NULL,NULL,NULL,NULL,NULL),(11,6,'Seconde A','Techzara',NULL,NULL,NULL,NULL,NULL),(12,5,'TA3','Techzara',NULL,NULL,NULL,NULL,NULL),(13,5,'test1','Techzara',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sk_classe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sk_discipline`
--

DROP TABLE IF EXISTS `sk_discipline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sk_discipline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `ets_nom` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ets_adresse` longtext COLLATE utf8_unicode_ci,
  `ets_responsable` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ets_phone` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ets_email` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ets_logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sk_discipline`
--

LOCK TABLES `sk_discipline` WRITE;
/*!40000 ALTER TABLE `sk_discipline` DISABLE KEYS */;
INSERT INTO `sk_discipline` VALUES (2,'A','Techzara',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sk_discipline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sk_discipline_list`
--

DROP TABLE IF EXISTS `sk_discipline_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sk_discipline_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `discipline_id` int(11) NOT NULL,
  `name` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `ets_nom` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ets_adresse` longtext COLLATE utf8_unicode_ci,
  `ets_responsable` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ets_phone` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ets_email` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ets_logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_824EA63CA5522701` (`discipline_id`),
  CONSTRAINT `FK_824EA63CA5522701` FOREIGN KEY (`discipline_id`) REFERENCES `sk_discipline` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sk_discipline_list`
--

LOCK TABLES `sk_discipline_list` WRITE;
/*!40000 ALTER TABLE `sk_discipline_list` DISABLE KEYS */;
INSERT INTO `sk_discipline_list` VALUES (3,2,'Mamafa gabone','Techzara',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sk_discipline_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sk_edt`
--

DROP TABLE IF EXISTS `sk_edt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sk_edt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `etd_date_deb` datetime DEFAULT NULL,
  `etd_date_fin` datetime DEFAULT NULL,
  `matNom` int(11) DEFAULT NULL,
  `ets_nom` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ets_adresse` longtext COLLATE utf8_unicode_ci,
  `ets_responsable` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ets_phone` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ets_email` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ets_logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `edtClasse` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_591D9529EEC51E56` (`matNom`),
  KEY `IDX_591D95298592913F` (`edtClasse`),
  CONSTRAINT `FK_591D95298592913F` FOREIGN KEY (`edtClasse`) REFERENCES `sk_classe` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_591D9529EEC51E56` FOREIGN KEY (`matNom`) REFERENCES `sk_matiere` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sk_edt`
--

LOCK TABLES `sk_edt` WRITE;
/*!40000 ALTER TABLE `sk_edt` DISABLE KEYS */;
INSERT INTO `sk_edt` VALUES (7,'2019-03-29 00:30:00','2019-03-29 00:30:00',6,'Techzara',NULL,NULL,NULL,NULL,NULL,11);
/*!40000 ALTER TABLE `sk_edt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sk_email_newsletter`
--

DROP TABLE IF EXISTS `sk_email_newsletter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sk_email_newsletter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nws_email` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `nws_subscribed` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_A994A6D0D5D52DEC` (`nws_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sk_email_newsletter`
--

LOCK TABLES `sk_email_newsletter` WRITE;
/*!40000 ALTER TABLE `sk_email_newsletter` DISABLE KEYS */;
/*!40000 ALTER TABLE `sk_email_newsletter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sk_etudiant`
--

DROP TABLE IF EXISTS `sk_etudiant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sk_etudiant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `niveau` int(11) DEFAULT NULL,
  `etudiant` int(11) DEFAULT NULL,
  `ets_nom` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ets_adresse` longtext COLLATE utf8_unicode_ci,
  `ets_responsable` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ets_phone` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ets_email` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ets_logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_9CF709B4717E22E3` (`etudiant`),
  KEY `IDX_9CF709B44BDFF36B` (`niveau`),
  CONSTRAINT `FK_9CF709B44BDFF36B` FOREIGN KEY (`niveau`) REFERENCES `sk_classe` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_9CF709B4717E22E3` FOREIGN KEY (`etudiant`) REFERENCES `sk_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sk_etudiant`
--

LOCK TABLES `sk_etudiant` WRITE;
/*!40000 ALTER TABLE `sk_etudiant` DISABLE KEYS */;
INSERT INTO `sk_etudiant` VALUES (1,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL),(29,11,46,'Techzara',NULL,NULL,NULL,NULL,NULL),(30,11,47,'Techzara',NULL,NULL,NULL,NULL,NULL),(31,11,49,'Techzara',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sk_etudiant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sk_matiere`
--

DROP TABLE IF EXISTS `sk_matiere`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sk_matiere` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mat_nom` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mat_coeff` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `matProf` int(11) DEFAULT NULL,
  `ets_nom` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ets_adresse` longtext COLLATE utf8_unicode_ci,
  `ets_responsable` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ets_phone` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ets_email` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ets_logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `matClasse` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_A1BC20CA623B6832` (`matProf`),
  KEY `IDX_A1BC20CA76AA3D43` (`matClasse`),
  CONSTRAINT `FK_A1BC20CA623B6832` FOREIGN KEY (`matProf`) REFERENCES `sk_user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_A1BC20CA76AA3D43` FOREIGN KEY (`matClasse`) REFERENCES `sk_classe` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sk_matiere`
--

LOCK TABLES `sk_matiere` WRITE;
/*!40000 ALTER TABLE `sk_matiere` DISABLE KEYS */;
INSERT INTO `sk_matiere` VALUES (6,'Anglais','12',48,'Techzara',NULL,NULL,NULL,NULL,NULL,11);
/*!40000 ALTER TABLE `sk_matiere` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sk_message_newsletter`
--

DROP TABLE IF EXISTS `sk_message_newsletter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sk_message_newsletter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sk_message_newsletter`
--

LOCK TABLES `sk_message_newsletter` WRITE;
/*!40000 ALTER TABLE `sk_message_newsletter` DISABLE KEYS */;
/*!40000 ALTER TABLE `sk_message_newsletter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sk_message_newsletter_translation`
--

DROP TABLE IF EXISTS `sk_message_newsletter_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sk_message_newsletter_translation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `translatable_id` int(11) DEFAULT NULL,
  `message_newsletter_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `message_newsletter_content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sk_message_newsletter_translation_unique_translation` (`translatable_id`,`locale`),
  KEY `IDX_B29ADF0D2C2AC5D3` (`translatable_id`),
  CONSTRAINT `FK_B29ADF0D2C2AC5D3` FOREIGN KEY (`translatable_id`) REFERENCES `sk_message_newsletter` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sk_message_newsletter_translation`
--

LOCK TABLES `sk_message_newsletter_translation` WRITE;
/*!40000 ALTER TABLE `sk_message_newsletter_translation` DISABLE KEYS */;
/*!40000 ALTER TABLE `sk_message_newsletter_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sk_niveau`
--

DROP TABLE IF EXISTS `sk_niveau`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sk_niveau` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `niveau_nom` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ets_nom` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ets_adresse` longtext COLLATE utf8_unicode_ci,
  `ets_responsable` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ets_phone` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ets_email` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ets_logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sk_niveau`
--

LOCK TABLES `sk_niveau` WRITE;
/*!40000 ALTER TABLE `sk_niveau` DISABLE KEYS */;
INSERT INTO `sk_niveau` VALUES (4,'sssssss',NULL,NULL,NULL,NULL,NULL,NULL),(5,'Terminale','Techzara',NULL,NULL,NULL,NULL,NULL),(6,'Seconda','Techzara',NULL,NULL,NULL,NULL,NULL),(7,'Maternelle','Techzara',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sk_niveau` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sk_note`
--

DROP TABLE IF EXISTS `sk_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sk_note` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `note_val` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `matNom` int(11) DEFAULT NULL,
  `ets_nom` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ets_adresse` longtext COLLATE utf8_unicode_ci,
  `ets_responsable` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ets_phone` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ets_email` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ets_logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `etudiant` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_76659743EEC51E56` (`matNom`),
  KEY `IDX_76659743717E22E3` (`etudiant`),
  CONSTRAINT `FK_76659743717E22E3` FOREIGN KEY (`etudiant`) REFERENCES `sk_etudiant` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_76659743EEC51E56` FOREIGN KEY (`matNom`) REFERENCES `sk_matiere` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sk_note`
--

LOCK TABLES `sk_note` WRITE;
/*!40000 ALTER TABLE `sk_note` DISABLE KEYS */;
/*!40000 ALTER TABLE `sk_note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sk_profs`
--

DROP TABLE IF EXISTS `sk_profs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sk_profs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profs` int(11) DEFAULT NULL,
  `matiere` int(11) DEFAULT NULL,
  `ets_nom` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ets_adresse` longtext COLLATE utf8_unicode_ci,
  `ets_responsable` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ets_phone` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ets_email` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ets_logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_B250034547E61F7F` (`profs`),
  KEY `IDX_B25003459014574A` (`matiere`),
  CONSTRAINT `FK_B250034547E61F7F` FOREIGN KEY (`profs`) REFERENCES `sk_user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_B25003459014574A` FOREIGN KEY (`matiere`) REFERENCES `sk_matiere` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sk_profs`
--

LOCK TABLES `sk_profs` WRITE;
/*!40000 ALTER TABLE `sk_profs` DISABLE KEYS */;
/*!40000 ALTER TABLE `sk_profs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sk_retard`
--

DROP TABLE IF EXISTS `sk_retard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sk_retard` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) DEFAULT NULL,
  `abs_motif` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `heure_deb` datetime DEFAULT NULL,
  `heure_fin` datetime DEFAULT NULL,
  `ets_nom` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ets_adresse` longtext COLLATE utf8_unicode_ci,
  `ets_responsable` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ets_phone` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ets_email` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ets_logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_9A9DB2138D93D649` (`user`),
  CONSTRAINT `FK_9A9DB2138D93D649` FOREIGN KEY (`user`) REFERENCES `sk_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sk_retard`
--

LOCK TABLES `sk_retard` WRITE;
/*!40000 ALTER TABLE `sk_retard` DISABLE KEYS */;
/*!40000 ALTER TABLE `sk_retard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sk_role`
--

DROP TABLE IF EXISTS `sk_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sk_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rl_name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sk_role`
--

LOCK TABLES `sk_role` WRITE;
/*!40000 ALTER TABLE `sk_role` DISABLE KEYS */;
INSERT INTO `sk_role` VALUES (1,'Superadmin'),(2,'Etudiant'),(3,'Etudiant'),(4,'Profs'),(5,'Personel'),(6,'Parent');
/*!40000 ALTER TABLE `sk_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sk_salle`
--

DROP TABLE IF EXISTS `sk_salle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sk_salle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `salle_nom` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `salle_numero` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_reserve` tinyint(1) NOT NULL DEFAULT '0',
  `deb_reserve` datetime DEFAULT NULL,
  `fin_reserve` datetime DEFAULT NULL,
  `motifs` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ets_nom` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ets_adresse` longtext COLLATE utf8_unicode_ci,
  `ets_responsable` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ets_phone` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ets_email` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ets_logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sk_salle`
--

LOCK TABLES `sk_salle` WRITE;
/*!40000 ALTER TABLE `sk_salle` DISABLE KEYS */;
INSERT INTO `sk_salle` VALUES (3,'aza','za',0,'2019-03-27 13:05:00','2019-03-27 13:05:00',NULL,'Techzara',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sk_salle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sk_user`
--

DROP TABLE IF EXISTS `sk_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sk_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sk_role_id` int(11) DEFAULT NULL,
  `username` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `confirmation_token` varchar(180) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `usr_firstname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `usr_lastname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `usr_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `usr_date_create` datetime DEFAULT NULL,
  `usr_date_update` datetime DEFAULT NULL,
  `usr_phone` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `img_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `usr_is_valid` tinyint(1) NOT NULL,
  `ets_nom` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ets_adresse` longtext COLLATE utf8_unicode_ci,
  `ets_responsable` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ets_phone` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ets_email` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ets_logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_canonical_UNIQUE` (`username_canonical`),
  UNIQUE KEY `email_canonical_UNIQUE` (`email_canonical`),
  UNIQUE KEY `confirmation_token_UNIQUE` (`confirmation_token`),
  KEY `IDX_344BBB1EE7AB552C` (`sk_role_id`),
  CONSTRAINT `FK_344BBB1EE7AB552C` FOREIGN KEY (`sk_role_id`) REFERENCES `sk_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sk_user`
--

LOCK TABLES `sk_user` WRITE;
/*!40000 ALTER TABLE `sk_user` DISABLE KEYS */;
INSERT INTO `sk_user` VALUES (1,1,'julien','julien','julienrajerison5@gmail.com','julienrajerison5@gmail.com',1,NULL,'$2y$13$RownMDH4AZ.aEfcafgWLlelI7DmDNJY0zHBtxeKrk4PSEPeG5M.Uu','2019-03-29 00:33:30',NULL,NULL,'a:1:{i:0;s:15:\"ROLE_SUPERADMIN\";}','teste','teste','teste','2019-01-24 22:59:34','2019-03-28 21:08:40','0329473033',NULL,0,'Techzara',NULL,'',NULL,NULL,NULL),(46,2,'za','za','zaza@zaza.com','zaza@zaza.com',1,NULL,'$2y$13$CNWMTXzSglKQaz1E3kyX3egJC2TkhLs7chTM.UNBY7F9cdchxFwai','2019-03-29 11:18:50',NULL,NULL,'a:1:{i:0;s:13:\"ROLE_ETUDIANT\";}','za','za','za','2019-03-28 23:16:35',NULL,NULL,NULL,0,'Techzara',NULL,NULL,NULL,NULL,NULL),(47,2,'az','az','az@az.com','az@az.com',1,NULL,'$2y$13$X2nvspFG.1fh8J0PRRljV.Q7eubFNtGUjf5m4KLFNIoTYnJazLh7W',NULL,NULL,NULL,'a:1:{i:0;s:13:\"ROLE_ETUDIANT\";}','az','az','az','2019-03-28 23:17:10',NULL,'0329473033',NULL,0,'Techzara',NULL,NULL,NULL,NULL,NULL),(48,4,'prof','prof','prof@prof.gma','prof@prof.gma',1,NULL,'$2y$13$XrFzQnXUvtThXrKGH0Kp.umO92sb8yiLOqV70EJrmM2km/Us6IFEy',NULL,NULL,NULL,'a:1:{i:0;s:10:\"ROLE_PROFS\";}','prof','prof','prof','2019-03-28 23:29:20',NULL,'0329473033',NULL,0,'Techzara',NULL,NULL,NULL,NULL,NULL),(49,2,'bon','bon','bon@bon.com','bon@bon.com',1,NULL,'$2y$13$UEi37RJs4Z2A6yG9EnfQHeP/UhAE/zFTevXvI1PMap3Jo0M4P.a7q',NULL,NULL,NULL,'a:1:{i:0;s:13:\"ROLE_ETUDIANT\";}','bon','bon','bon','2019-03-29 00:25:08',NULL,'0329473033',NULL,0,'Techzara',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sk_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-29 12:24:58

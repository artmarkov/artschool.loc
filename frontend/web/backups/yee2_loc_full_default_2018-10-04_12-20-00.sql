-- MySQL dump 10.13  Distrib 5.7.20, for Win64 (x86_64)
--
-- Host: localhost    Database: yee2_loc
-- ------------------------------------------------------
-- Server version	5.7.20

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
-- Table structure for table `auditory`
--

DROP TABLE IF EXISTS `auditory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditory` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `building_id` mediumint(8) unsigned NOT NULL,
  `cat_id` mediumint(8) unsigned DEFAULT NULL,
  `study_flag` tinyint(1) NOT NULL DEFAULT '0',
  `num` int(3) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `floor` varchar(32) NOT NULL,
  `area` float NOT NULL,
  `capacity` mediumint(3) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `order` mediumint(8) unsigned NOT NULL,
  `status` int(8) NOT NULL DEFAULT '10',
  PRIMARY KEY (`id`),
  KEY `cat_id` (`cat_id`),
  KEY `building_id` (`building_id`),
  CONSTRAINT `auditory_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `auditory_cat` (`id`),
  CONSTRAINT `auditory_ibfk_2` FOREIGN KEY (`building_id`) REFERENCES `auditory_building` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8 COMMENT='Аудитории школы';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditory`
--

LOCK TABLES `auditory` WRITE;
/*!40000 ALTER TABLE `auditory` DISABLE KEYS */;
INSERT INTO `auditory` VALUES (1,1,9,1,0,'По классам','',0,0,'',43,10),(36,2,11,1,1,'Класс архитектуры','1',20.3,10,'',0,10),(37,2,11,1,10,'Класс скульптуры','1',20,10,'Художественная керамика',0,10),(38,2,11,1,11,'ИЗО','1',20.1,12,'',0,10),(39,2,11,1,12,'ИЗО','1',19.9,12,'',0,10),(40,2,11,1,2,'Класс развития','1',20.3,6,'Мандариновое детство',0,10),(41,2,11,1,3,'Класс развития','1',21.2,8,'Мандариновое детство',0,10),(42,2,11,1,4,'Класс развития','1',14.8,7,'Мандариновое детство',0,10),(43,2,11,0,5,'Администраторы','1',12.2,0,'',0,10),(44,2,11,0,6,'Учительская','1',12.3,0,'',0,10),(45,2,11,0,7,'Лаборатория','1',9.7,0,'Художественная керамика',0,10),(46,2,11,1,8,'ИЗО','1',21.1,12,'',0,10),(47,2,11,1,9,'ИЗО','1',14.8,8,'',0,10),(52,1,1,1,106,'Класс композиции','1',32.9,14,'',0,10),(53,1,1,1,107,'Класс скульптуры','1',31.9,14,'',0,10),(54,1,1,1,109,'Класс живописи','1',42,14,'',0,10),(55,1,1,1,110,'Класс живописи','1',35.8,14,'',0,10),(56,1,1,1,111,'Класс рисунка','1',40.9,14,'',0,10),(57,1,1,1,114,'Класс теоретических дисциплин','1',27.5,14,'',0,10),(58,1,1,1,115,'Класс теоретических дисциплин','1',39.6,14,'',0,10),(59,1,1,1,116,'Класс теоретических дисциплин','1',38.1,14,'',0,10),(60,1,1,1,117,'Хоровой класс','1',50.3,0,'Музыкальный фольклор',0,10),(61,1,1,0,119,'Художественный фонд','1',13.2,0,'',0,10),(62,1,1,1,120,'Класс теоретических дисциплин','1',25.5,14,'',0,10),(63,1,1,1,121,'Класс теоретических дисциплин','1',35.9,14,'',0,10),(64,1,2,1,103,'Малый зал','1',93.8,0,'',168,10),(65,1,3,1,201,'Кабинет директора','2',29,0,'',0,10),(66,1,1,1,205,'Класс индивидуальных занятий','2',29.6,0,'',0,10),(67,1,1,1,206,'Класс индивидуальных занятий','2',28.2,0,'Фортепиано',0,10),(68,1,1,1,207,'Класс индивидуальных занятий','2',26.7,0,'Фортепиано',0,10),(69,1,1,1,208,'Класс индивидуальных занятий','2',28,0,'Фортепиано',0,10),(70,1,1,1,209,'Класс индивидуальных занятий','2',27.9,0,'Фортепиано',0,10),(71,1,1,1,210,'Класс индивидуальных занятий','2',16.5,0,'Арфа',0,10),(72,1,1,1,211,'Класс индивидуальных занятий','2',21.2,0,'Фортепиано',0,10),(73,1,1,1,212,'Класс ансамбля','2',46.6,0,'Народные инструменты',0,10),(74,1,1,1,213,'Класс индивидуальных занятий','2',25.2,0,'Духовые инструменты',0,10),(75,1,1,1,214,'Класс индивидуальных занятий','2',25.7,0,'Духовые инструменты',0,10),(76,1,1,1,215,'Класс индивидуальных занятий','2',26.9,0,'Духовые инструменты',0,10),(77,1,1,1,216,'Класс ансамбля','2',30.2,0,'Струнные инструменты',0,10),(78,1,1,1,217,'Класс индивидуальных занятий','2',10.7,0,'',0,10),(79,1,1,1,220,'Класс индивидуальных занятий','2',15.3,0,'',0,10),(81,1,1,1,219,'Класс индивидуальных занятий','2',12,0,'',0,10),(82,1,1,1,218,'Класс индивидуальных занятий','2',29.2,0,'',0,10),(83,1,1,1,221,'Класс духового оркестра','2',64.9,0,'',0,10),(84,1,3,0,222,'Инженерная служба','2',19.3,0,'',0,10),(85,1,3,0,104,'Кабинет зам. директора по АХР','1',23,0,'',0,10),(86,1,3,0,105,'Кабинет зам. директора','1',36,0,'',0,10),(87,1,3,0,122,'Кабинет зам. директора по кадрам','1',16,0,'',0,10),(88,1,3,0,202,'Кабинет зам. директора по оргвопросам','2',12,0,'',0,10),(89,1,3,0,203,'Кабинет главного бухгалтера','2',16,0,'',0,10),(90,1,3,0,204,'Бухгалтерия','2',37,0,'',0,10),(91,1,2,1,302,'Большой Зал','3',362,283,'',105,10),(92,1,1,1,303,'Хоровой класс','3',85,0,'',0,10),(93,1,1,1,304,'Класс индивидуальных занятий','3',23.9,0,'Фортепиано',0,10),(94,1,1,1,305,'Класс индивидуальных занятий','3',23.8,0,'Фортепиано',0,10),(95,1,1,1,306,'Класс индивидуальных занятий','3',23.1,0,'Фортепиано',0,10),(96,1,3,1,312,'Компьютерный класс','3',37.3,14,'',0,10),(97,1,3,0,313,'Библиотека','3',19.6,0,'',0,10),(98,1,1,1,314,'Класс индивидуальных занятий','3',15.8,0,'Вокал',0,10),(99,1,1,1,317,'Класс хореографии','3',85,0,'',0,10),(100,1,1,1,333,'Класс индивидуальных занятий','3',20,0,'Фортепиано',0,10),(101,1,1,1,336,'Класс хореографии','3',77.9,0,'',0,10),(102,1,1,1,350,'Класс индивидуальных занятий','3',20,0,'',0,10),(103,1,1,1,351,'Класс индивидуальных занятий','3',15.9,0,'Народные инструменты',0,10),(104,1,1,1,358,'Класс индивидуальных занятий','3',11.3,0,'',0,10),(105,1,1,1,357,'Класс индивидуальных занятий','3',12.1,0,'',0,10),(106,1,1,1,356,'Класс индивидуальных занятий','3',15,0,'Фортепиано',0,10),(107,1,1,1,355,'Класс индивидуальных занятий','3',10,0,'',0,10),(108,1,1,1,347,'Класс эстрадно-джазового оркестра','3',37.7,0,'',0,10),(109,1,1,1,346,'Класс ударных инструментов','3',26.7,0,'',0,10),(110,1,4,0,401,'Помещение множительной техники','4',0,0,'',0,10),(111,1,4,0,232,'Серверная','2',0,0,'',0,10),(112,1,7,1,102,'Вестибюль 1-го этажа','1',0,0,'',0,10),(113,1,7,0,101,'Помещение охраны','1',0,0,'',0,10),(114,1,7,1,200,'Вестибюль 2-го этажа','2',0,0,'',0,10),(115,1,7,1,301,'Вестибюль 3-го этажа','3',0,0,'Музей',0,10),(116,1,10,0,515,'Мастерская','0',0,0,'',0,10),(117,1,8,0,112,'Буфет','1',0,0,'',0,10),(118,1,7,1,141,'Холл 1-го этажа','1',0,0,'Для выставок ИЗО',0,10),(119,1,7,1,241,'Холл 2-го этажа','2',0,0,'Для выставок ИЗО',0,10),(120,1,7,1,332,'Холл 3-го этажа','3',0,0,'Для высавок ИЗО',0,10),(121,1,3,0,503,'Массажный кабинет','0',0,0,'',0,10),(122,1,2,0,501,'Тренажерный зал','0',81.1,0,'',0,10),(123,1,3,0,502,'Тренерская','0',6.1,0,'',0,10),(124,1,3,0,513,'Кабинет','0',0,0,'',0,10),(125,1,4,0,511,'Тоновая студии звукозаписи','0',0,0,'',0,10),(126,1,4,0,512,'Студия звукозаписи','0',0,0,'',0,10),(127,1,10,0,514,'Мастерская','0',0,0,'',0,10),(128,1,5,0,516,'Складское помещение','0',0,0,'',0,10),(129,1,5,0,517,'Складское помещение','0',0,0,'',0,10),(130,1,7,0,0,'Лестничные марши и пролеты 1-3 эт','',0,0,'',0,10),(131,1,7,0,23,'ИЗО','1',0,20,'Холл',0,10),(132,1,4,0,401,'Помещение звукооператора','4',0,2,'',0,10);
/*!40000 ALTER TABLE `auditory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditory_building`
--

DROP TABLE IF EXISTS `auditory_building`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditory_building` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `slug` varchar(64) NOT NULL,
  `address` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Здания школы';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditory_building`
--

LOCK TABLES `auditory_building` WRITE;
/*!40000 ALTER TABLE `auditory_building` DISABLE KEYS */;
INSERT INTO `auditory_building` VALUES (1,'Основное здание','ОЗ','Митинская ул. д.47, кор.1'),(2,'Филиал','Ф','Пятницкое шоссе, д. 40');
/*!40000 ALTER TABLE `auditory_building` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditory_cat`
--

DROP TABLE IF EXISTS `auditory_cat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditory_cat` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `description` varchar(256) NOT NULL,
  `study_flag` tinyint(1) NOT NULL DEFAULT '0',
  `order` mediumint(8) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='false=условный';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditory_cat`
--

LOCK TABLES `auditory_cat` WRITE;
/*!40000 ALTER TABLE `auditory_cat` DISABLE KEYS */;
INSERT INTO `auditory_cat` VALUES (1,'Аудитории и классы','',1,0),(2,'Залы','',1,0),(3,'Кабинеты','',1,0),(4,'Служебные помещения','',0,0),(5,'Складские помещения','',0,0),(6,'Подсобные помещения','',0,0),(7,'Коридоры и холлы','',1,0),(8,'Другие помещения','',0,0),(9,'Условные классы','',1,0),(10,'Технические помещения','',0,0),(11,'Филиал школы','помещения Художественного отделения',1,0);
/*!40000 ALTER TABLE `auditory_cat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth`
--

DROP TABLE IF EXISTS `auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `source` varchar(255) NOT NULL,
  `source_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_auth_user` (`user_id`),
  CONSTRAINT `fk_auth_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth`
--

LOCK TABLES `auth` WRITE;
/*!40000 ALTER TABLE `auth` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_assignment`
--

DROP TABLE IF EXISTS `auth_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  KEY `fk_user_id_auth_assignment_table` (`user_id`),
  CONSTRAINT `fk_item_name_auth_assignment_table` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user_id_auth_assignment_table` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_assignment`
--

LOCK TABLES `auth_assignment` WRITE;
/*!40000 ALTER TABLE `auth_assignment` DISABLE KEYS */;
INSERT INTO `auth_assignment` VALUES ('author',1,1534834511),('author',3,1534834694),('author',4,1534863620),('backend_administrator',1,1534834511),('backend_administrator',4,1534863620),('moderator',1,1534834511),('moderator',2,1534834614),('moderator',4,1534863620),('user',1,1534834511),('user',2,1534863921),('user',4,1534863620);
/*!40000 ALTER TABLE `auth_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_item`
--

DROP TABLE IF EXISTS `auth_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_item` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text,
  `rule_name` varchar(64) DEFAULT NULL,
  `group_code` varchar(64) DEFAULT NULL,
  `data` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `auth_item_type` (`type`),
  KEY `fk_auth_item_table_rule_name` (`rule_name`),
  KEY `fk_auth_item_table_group_code` (`group_code`),
  CONSTRAINT `fk_auth_item_table_group_code` FOREIGN KEY (`group_code`) REFERENCES `auth_item_group` (`code`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_auth_item_table_rule_name` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_item`
--

LOCK TABLES `auth_item` WRITE;
/*!40000 ALTER TABLE `auth_item` DISABLE KEYS */;
INSERT INTO `auth_item` VALUES ('/admin',3,NULL,NULL,NULL,NULL,1530777695,1530777695),('/admin/#mediafile',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/*',3,NULL,NULL,NULL,NULL,1530777695,1530777695),('/admin/comment/*',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/comment/default/*',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/comment/default/bulk-activate',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/comment/default/bulk-deactivate',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/comment/default/bulk-delete',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/comment/default/bulk-spam',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/comment/default/bulk-trash',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/comment/default/create',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/comment/default/delete',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/comment/default/grid-page-size',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/comment/default/grid-sort',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/comment/default/index',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/comment/default/toggle-attribute',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/comment/default/update',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/comment/default/view',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/db-manager/default/index',3,NULL,NULL,NULL,NULL,NULL,NULL),('/admin/Db/*',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/Db/delete',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/Db/export',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/Db/import',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/Db/index',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/default/*',3,NULL,NULL,NULL,NULL,1530777695,1530777695),('/admin/eav/*',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/eav/attribute-option/*',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/eav/attribute-option/bulk-delete',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/eav/attribute-option/create',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/eav/attribute-option/delete',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/eav/attribute-option/grid-page-size',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/eav/attribute-option/grid-sort',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/eav/attribute-option/index',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/eav/attribute-option/toggle-attribute',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/eav/attribute-option/update',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/eav/attribute-type/*',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/eav/attribute-type/bulk-delete',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/eav/attribute-type/create',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/eav/attribute-type/delete',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/eav/attribute-type/grid-page-size',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/eav/attribute-type/grid-sort',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/eav/attribute-type/index',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/eav/attribute-type/toggle-attribute',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/eav/attribute-type/update',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/eav/attribute/*',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/eav/attribute/bulk-delete',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/eav/attribute/create',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/eav/attribute/delete',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/eav/attribute/grid-page-size',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/eav/attribute/grid-sort',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/eav/attribute/index',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/eav/attribute/toggle-attribute',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/eav/attribute/update',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/eav/default/*',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/eav/default/get-attributes',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/eav/default/get-categories',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/eav/default/index',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/eav/default/set-attributes',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/eav/entity-model/*',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/eav/entity-model/bulk-delete',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/eav/entity-model/create',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/eav/entity-model/delete',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/eav/entity-model/grid-page-size',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/eav/entity-model/grid-sort',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/eav/entity-model/index',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/eav/entity-model/toggle-attribute',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/eav/entity-model/update',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/measure/*',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/measure/bulk-delete',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/measure/create',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/measure/delete',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/measure/grid-page-size',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/measure/grid-sort',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/measure/index',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/measure/update',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/measure/view',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/media/*',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/media/album/*',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/media/album/bulk-delete',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/media/album/create',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/media/album/delete',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/media/album/grid-page-size',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/media/album/grid-sort',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/media/album/index',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/media/album/toggle-attribute',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/media/album/update',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/media/category/*',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/media/category/bulk-delete',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/media/category/create',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/media/category/delete',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/media/category/grid-page-size',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/media/category/grid-sort',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/media/category/index',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/media/category/toggle-attribute',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/media/category/update',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/media/default/*',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/media/default/index',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/media/default/settings',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/media/manage/delete',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/media/manage/index',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/media/manage/info',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/media/manage/resize',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/media/manage/update',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/media/manage/upload',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/media/manage/uploader',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/menu/*',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/menu/default/*',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/menu/default/bulk-delete',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/menu/default/create',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/menu/default/delete',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/menu/default/grid-page-size',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/menu/default/grid-sort',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/menu/default/index',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/menu/default/update',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/menu/default/view',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/menu/link/*',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/menu/link/bulk-delete',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/menu/link/create',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/menu/link/delete',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/menu/link/grid-page-size',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/menu/link/grid-sort',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/menu/link/index',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/menu/link/update',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/menu/link/view',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/page/*',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/page/default/*',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/page/default/bulk-activate',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/page/default/bulk-deactivate',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/page/default/bulk-delete',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/page/default/create',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/page/default/delete',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/page/default/grid-page-size',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/page/default/grid-sort',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/page/default/index',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/page/default/toggle-attribute',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/page/default/update',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/page/default/view',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/post/*',3,NULL,NULL,NULL,NULL,1530777695,1530777695),('/admin/post/category/*',3,NULL,NULL,NULL,NULL,1530777695,1530777695),('/admin/post/category/bulk-delete',3,NULL,NULL,NULL,NULL,1530777695,1530777695),('/admin/post/category/create',3,NULL,NULL,NULL,NULL,1530777695,1530777695),('/admin/post/category/delete',3,NULL,NULL,NULL,NULL,1530777695,1530777695),('/admin/post/category/grid-page-size',3,NULL,NULL,NULL,NULL,1530777695,1530777695),('/admin/post/category/grid-sort',3,NULL,NULL,NULL,NULL,1530777695,1530777695),('/admin/post/category/index',3,NULL,NULL,NULL,NULL,1530777695,1530777695),('/admin/post/category/toggle-attribute',3,NULL,NULL,NULL,NULL,1530777695,1530777695),('/admin/post/category/update',3,NULL,NULL,NULL,NULL,1530777695,1530777695),('/admin/post/default/*',3,NULL,NULL,NULL,NULL,1530777695,1530777695),('/admin/post/default/bulk-activate',3,NULL,NULL,NULL,NULL,1530777695,1530777695),('/admin/post/default/bulk-deactivate',3,NULL,NULL,NULL,NULL,1530777695,1530777695),('/admin/post/default/bulk-delete',3,NULL,NULL,NULL,NULL,1530777695,1530777695),('/admin/post/default/create',3,NULL,NULL,NULL,NULL,1530777695,1530777695),('/admin/post/default/delete',3,NULL,NULL,NULL,NULL,1530777695,1530777695),('/admin/post/default/grid-page-size',3,NULL,NULL,NULL,NULL,1530777695,1530777695),('/admin/post/default/grid-sort',3,NULL,NULL,NULL,NULL,1530777695,1530777695),('/admin/post/default/index',3,NULL,NULL,NULL,NULL,1530777695,1530777695),('/admin/post/default/toggle-attribute',3,NULL,NULL,NULL,NULL,1530777695,1530777695),('/admin/post/default/update',3,NULL,NULL,NULL,NULL,1530777695,1530777695),('/admin/post/default/view',3,NULL,NULL,NULL,NULL,1530777695,1530777695),('/admin/post/tag/bulk-delete',3,NULL,NULL,NULL,NULL,1530777695,1530777695),('/admin/post/tag/create',3,NULL,NULL,NULL,NULL,1530777695,1530777695),('/admin/post/tag/delete',3,NULL,NULL,NULL,NULL,1530777695,1530777695),('/admin/post/tag/grid-page-size',3,NULL,NULL,NULL,NULL,1530777695,1530777695),('/admin/post/tag/grid-sort',3,NULL,NULL,NULL,NULL,1530777695,1530777695),('/admin/post/tag/index',3,NULL,NULL,NULL,NULL,1530777695,1530777695),('/admin/post/tag/toggle-attribute',3,NULL,NULL,NULL,NULL,1530777695,1530777695),('/admin/post/tag/update',3,NULL,NULL,NULL,NULL,1530777695,1530777695),('/admin/seo/*',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/seo/default/*',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/seo/default/bulk-delete',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/seo/default/create',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/seo/default/delete',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/seo/default/grid-page-size',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/seo/default/grid-sort',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/seo/default/index',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/seo/default/update',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/settings/*',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/settings/cache/flush',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/settings/default/*',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/settings/default/index',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/settings/reading/index',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/site/index',3,NULL,NULL,NULL,NULL,1530777695,1530777695),('/admin/translation/*',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/translation/default/*',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/translation/default/index',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/translation/source/*',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/translation/source/create',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/translation/source/delete',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/translation/source/update',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/user/*',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/user/default/*',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/user/default/bulk-activate',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/user/default/bulk-deactivate',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/user/default/bulk-delete',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/user/default/change-password',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/user/default/create',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/user/default/delete',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/user/default/grid-page-size',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/user/default/grid-sort',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/user/default/index',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/user/default/toggle-attribute',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/user/default/update',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/user/permission-groups/*',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/user/permission-groups/bulk-delete',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/user/permission-groups/create',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/user/permission-groups/delete',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/user/permission-groups/grid-page-size',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/user/permission-groups/grid-sort',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/user/permission-groups/index',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/user/permission-groups/update',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/user/permission/*',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/user/permission/bulk-delete',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/user/permission/create',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/user/permission/delete',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/user/permission/grid-page-size',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/user/permission/grid-sort',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/user/permission/index',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/user/permission/refresh-routes',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/user/permission/set-child-permissions',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/user/permission/set-child-routes',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/user/permission/update',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/user/permission/view',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/user/role/*',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/user/role/bulk-delete',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/user/role/create',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/user/role/delete',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/user/role/grid-page-size',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/user/role/grid-sort',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/user/role/index',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/user/role/set-child-permissions',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/user/role/set-child-roles',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/user/role/update',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/user/role/view',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/user/user-permission/*',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/user/user-permission/set',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/user/user-permission/set-roles',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/user/visit-log/*',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/user/visit-log/grid-page-size',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/user/visit-log/grid-sort',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/user/visit-log/index',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/admin/user/visit-log/view',3,NULL,NULL,NULL,NULL,1530777696,1530777696),('/measure/*',3,NULL,NULL,NULL,NULL,NULL,NULL),('/measure/bulk-delete',3,NULL,NULL,NULL,NULL,NULL,NULL),('/measure/create',3,NULL,NULL,NULL,NULL,NULL,NULL),('/measure/delete',3,NULL,NULL,NULL,NULL,NULL,NULL),('/measure/grid-page-size',3,NULL,NULL,NULL,NULL,NULL,NULL),('/measure/grid-sort',3,NULL,NULL,NULL,NULL,NULL,NULL),('/measure/index',3,NULL,NULL,NULL,NULL,NULL,NULL),('/measure/update',3,NULL,NULL,NULL,NULL,NULL,NULL),('/measure/view',3,NULL,NULL,NULL,NULL,NULL,NULL),('/option/*',3,NULL,NULL,NULL,NULL,NULL,NULL),('/option/bulk-delete',3,NULL,NULL,NULL,NULL,NULL,NULL),('/option/create',3,NULL,NULL,NULL,NULL,NULL,NULL),('/option/delete',3,NULL,NULL,NULL,NULL,NULL,NULL),('/option/grid-page-size',3,NULL,NULL,NULL,NULL,NULL,NULL),('/option/grid-sort',3,NULL,NULL,NULL,NULL,NULL,NULL),('/option/index',3,NULL,NULL,NULL,NULL,NULL,NULL),('/option/update',3,NULL,NULL,NULL,NULL,NULL,NULL),('/option/view',3,NULL,NULL,NULL,NULL,NULL,NULL),('assignRolesToUsers',2,'Assign Roles To Users',NULL,'userManagement',NULL,1530777696,1530777696),('author',1,'Автор',NULL,NULL,NULL,1530777695,1530777695),('backend_administrator',1,'Администратор backend',NULL,NULL,NULL,1530777695,1538059174),('bindUserToIp',2,'Bind User To IP',NULL,'userManagement',NULL,1530777696,1530777696),('BulkDeleteMeasure',2,'Bulk Delete Measure',NULL,'system',NULL,1534937206,1534937269),('BulkDeleteOption',2,'Bulk Delete Option',NULL,'system',NULL,1534937206,1534937269),('changeGeneralSettings',2,'Change General Settings',NULL,'settings',NULL,1530777696,1530777696),('changeOwnPassword',2,'Change Own Password',NULL,'userCommonPermissions',NULL,1530777695,1530777695),('changeReadingSettings',2,'Change Reading Settings',NULL,'settings',NULL,1530777696,1530777696),('changeUserPassword',2,'Change User Password',NULL,'userManagement',NULL,1530777696,1530777696),('commonPermission',2,'Common Permission',NULL,'userCommonPermissions',NULL,1530777695,1530777695),('createComments',2,'Create Comments',NULL,'commentManagement',NULL,1530777696,1530777696),('createEavRecords',2,'Create EAV records',NULL,'eavManagement',NULL,1440180000,1440180000),('createMeasure',2,'Create Measure',NULL,'system',NULL,1534857665,1534857665),('createMediaAlbums',2,'Create Media Albums',NULL,'mediaManagement',NULL,1530777696,1530777696),('createMediaCategories',2,'Create Media Categories',NULL,'mediaManagement',NULL,1530777696,1530777696),('createMenuLinks',2,'Create Menu Links',NULL,'menuManagement',NULL,1530777696,1530777696),('createMenus',2,'Create Menus',NULL,'menuManagement',NULL,1530777696,1530777696),('createOption',2,'Create Option',NULL,'system',NULL,1534857665,1534857665),('createPages',2,'Create Pages',NULL,'pageManagement',NULL,1530777696,1530777696),('createPostCategories',2,'Create Post Categories',NULL,'postManagement',NULL,1530777695,1530777695),('createPosts',2,'Create Posts',NULL,'postManagement',NULL,1530777695,1530777695),('createPostTags',2,'Create Post Tags',NULL,'postManagement',NULL,1530777695,1530777695),('createSeo',2,'Create SEO Records',NULL,'seoManagement',NULL,1530777696,1530777696),('createSourceMessages',2,'Create Source Messages',NULL,'translations',NULL,1530777696,1530777696),('createUsers',2,'Create Users',NULL,'userManagement',NULL,1530777696,1530777696),('deleteComments',2,'Delete Comments',NULL,'commentManagement',NULL,1530777696,1530777696),('deleteDb',2,'Delete Db Records',NULL,'dbManagement',NULL,1530777696,1530777696),('deleteEavRecords',2,'Delete EAV records',NULL,'eavManagement',NULL,1440180000,1440180000),('deleteMeasure',2,'Delete Measure',NULL,'system',NULL,1534857716,1534857716),('deleteMedia',2,'Delete Media',NULL,'mediaManagement',NULL,1530777696,1530777696),('deleteMediaAlbums',2,'Delete Media Albums',NULL,'mediaManagement',NULL,1530777696,1530777696),('deleteMediaCategories',2,'Delete Media Categories',NULL,'mediaManagement',NULL,1530777696,1530777696),('deleteMenuLinks',2,'Delete Menu Links',NULL,'menuManagement',NULL,1530777696,1530777696),('deleteMenus',2,'Delete Menus',NULL,'menuManagement',NULL,1530777696,1530777696),('deleteOption',2,'Delete Option',NULL,'system',NULL,1534857716,1534857716),('deletePages',2,'Delete Pages',NULL,'pageManagement',NULL,1530777696,1530777696),('deletePostCategories',2,'Delete Post Categories',NULL,'postManagement',NULL,1530777695,1530777695),('deletePosts',2,'Delete Posts',NULL,'postManagement',NULL,1530777695,1530777695),('deletePostTags',2,'Delete Post Tags',NULL,'postManagement',NULL,1530777695,1530777695),('deleteSeo',2,'Delete SEO Records',NULL,'seoManagement',NULL,1530777696,1530777696),('deleteSourceMessages',2,'Delete Source Messages',NULL,'translations',NULL,1530777696,1530777696),('deleteUsers',2,'Delete Users',NULL,'userManagement',NULL,1530777696,1530777696),('department_head',1,'Руководитель отдела',NULL,NULL,NULL,1538053774,1538053774),('editComments',2,'Edit Comments',NULL,'commentManagement',NULL,1530777696,1530777696),('editEavRecords',2,'Edit EAV records',NULL,'eavManagement',NULL,1440180000,1440180000),('editMeasure',2,'Edit Measure',NULL,'system',NULL,1534759889,1534856833),('editMedia',2,'Edit Media',NULL,'mediaManagement',NULL,1530777696,1530777696),('editMediaAlbums',2,'Edit Media Albums',NULL,'mediaManagement',NULL,1530777696,1530777696),('editMediaCategories',2,'Edit Media Categories',NULL,'mediaManagement',NULL,1530777696,1530777696),('editMediaSettings',2,'Edit Media Settings',NULL,'mediaManagement',NULL,1530777696,1530777696),('editMenuLinks',2,'Edit Menu Links',NULL,'menuManagement',NULL,1530777696,1530777696),('editMenus',2,'Edit Menus',NULL,'menuManagement',NULL,1530777696,1530777696),('editOption',2,'Edit Option',NULL,'system',NULL,1534759889,1534856833),('editPages',2,'Edit Pages',NULL,'pageManagement',NULL,1530777696,1530777696),('editPostCategories',2,'Edit Post Categories',NULL,'postManagement',NULL,1530777695,1530777695),('editPosts',2,'Edit Posts',NULL,'postManagement',NULL,1530777695,1530777695),('editPostTags',2,'Edit Post Tags',NULL,'postManagement',NULL,1530777695,1530777695),('editSeo',2,'Edit SEO Records',NULL,'seoManagement',NULL,1530777696,1530777696),('editUserEmail',2,'Edit User Email',NULL,'userManagement',NULL,1530777696,1530777696),('editUsers',2,'Edit Users',NULL,'userManagement',NULL,1530777696,1530777696),('exportDb',2,'Export Db Records',NULL,'dbManagement',NULL,1530777696,1530777696),('flushCache',2,'Flush Cache',NULL,'settings',NULL,1530777696,1530777696),('frontend_administrator',1,'Администратор frontend',NULL,NULL,NULL,1538059203,1538059203),('fullMediaAccess',2,'Full Media Access',NULL,'mediaManagement',NULL,1530777696,1530777696),('fullMediaAlbumAccess',2,'Full Media Albums Access',NULL,'mediaManagement',NULL,1530777696,1530777696),('fullMediaCategoryAccess',2,'Full Media Categories Access',NULL,'mediaManagement',NULL,1530777696,1530777696),('fullMenuAccess',2,'Full Menu Access',NULL,'menuManagement',NULL,1530777696,1530777696),('fullMenuLinkAccess',2,'Full Menu Links Access',NULL,'menuManagement',NULL,1530777696,1530777696),('fullPageAccess',2,'Full Page Access',NULL,'pageManagement',NULL,1530777696,1530777696),('fullPostAccess',2,'Full Post Access',NULL,'postManagement',NULL,1530777695,1530777695),('fullPostCategoryAccess',2,'Full Post Categories Access',NULL,'postManagement',NULL,1530777695,1530777695),('fullPostTagAccess',2,'Full Post Tags Access',NULL,'postManagement',NULL,1530777696,1530777696),('fullSeoAccess',2,'Full SEO Records Access',NULL,'seoManagement',NULL,1530777696,1530777696),('importDb',2,'Import Db Records',NULL,'dbManagement',NULL,1530777696,1530777696),('main_administrator',1,'Главный администратор',NULL,NULL,NULL,1538059041,1538059041),('manageRolesAndPermissions',2,'Manage Roles And Permissions',NULL,'userManagement',NULL,1530777696,1530777696),('moderator',1,'Модератор',NULL,NULL,NULL,1530777695,1530777695),('parent',1,'Родитель',NULL,NULL,NULL,1538052472,1538052472),('staff',1,'Сотрудник',NULL,NULL,NULL,1538052397,1538052397),('student',1,'Ученик',NULL,NULL,NULL,1538052455,1538052455),('teacher',1,'Преподаватель',NULL,NULL,NULL,1538052436,1538052436),('updateImmutableSourceMessages',2,'Update Immutable Source Messages',NULL,'translations',NULL,1530777696,1530777696),('updateSourceMessages',2,'Update Source Messages',NULL,'translations',NULL,1530777696,1530777696),('updateTranslations',2,'Update Message Translations',NULL,'translations',NULL,1530777696,1530777696),('uploadMedia',2,'Upload Media',NULL,'mediaManagement',NULL,1530777696,1530777696),('user',1,'Пользователь',NULL,NULL,NULL,1530777695,1530777695),('viewComments',2,'View Comments',NULL,'commentManagement',NULL,1530777696,1530777696),('viewDashboard',2,'View Dashboard',NULL,'dashboard',NULL,1530777695,1530777695),('viewDb',2,'View Db Records',NULL,'dbManagement',NULL,1530777696,1530777696),('viewEavRecords',2,'View EAV records',NULL,'eavManagement',NULL,1440180000,1440180000),('viewMeasure',2,'View Measure',NULL,'system',NULL,1534856980,1534856980),('viewMedia',2,'View Media',NULL,'mediaManagement',NULL,1530777696,1530777696),('viewMediaAlbums',2,'View Media Albums',NULL,'mediaManagement',NULL,1530777696,1530777696),('viewMediaCategories',2,'View Media Categories',NULL,'mediaManagement',NULL,1530777696,1530777696),('viewMenuLinks',2,'View Menu Links',NULL,'menuManagement',NULL,1530777696,1530777696),('viewMenus',2,'View Menus',NULL,'menuManagement',NULL,1530777696,1530777696),('viewOption',2,'View Option',NULL,'system',NULL,1534856980,1534856980),('viewPages',2,'View Pages',NULL,'pageManagement',NULL,1530777696,1530777696),('viewPostCategories',2,'View Posts',NULL,'postManagement',NULL,1530777695,1530777695),('viewPosts',2,'View Posts',NULL,'postManagement',NULL,1530777695,1530777695),('viewPostTags',2,'View Tags',NULL,'postManagement',NULL,1530777695,1530777695),('viewRegistrationIp',2,'View Registration IP',NULL,'userManagement',NULL,1530777696,1530777696),('viewRolesAndPermissions',2,'View Roles And Permissions',NULL,'userManagement',NULL,1530777696,1530777696),('viewSeo',2,'View SEO Records',NULL,'seoManagement',NULL,1530777696,1530777696),('viewTranslations',2,'View Message Translations',NULL,'translations',NULL,1530777696,1530777696),('viewUserEmail',2,'View User Email',NULL,'userManagement',NULL,1530777696,1530777696),('viewUserRoles',2,'View User Roles',NULL,'userManagement',NULL,1530777696,1530777696),('viewUsers',2,'View Users',NULL,'userManagement',NULL,1530777696,1530777696),('viewVisitLog',2,'View Visit Logs',NULL,'userManagement',NULL,1530777696,1530777696);
/*!40000 ALTER TABLE `auth_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_item_child`
--

DROP TABLE IF EXISTS `auth_item_child`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_item_child` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `fk_child_auth_item_child_table` (`child`),
  CONSTRAINT `fk_child_auth_item_child_table` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_parent_auth_item_child_table` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_item_child`
--

LOCK TABLES `auth_item_child` WRITE;
/*!40000 ALTER TABLE `auth_item_child` DISABLE KEYS */;
INSERT INTO `auth_item_child` VALUES ('viewDashboard','/admin'),('viewMedia','/admin/#mediafile'),('editComments','/admin/comment/default/bulk-activate'),('editComments','/admin/comment/default/bulk-deactivate'),('deleteComments','/admin/comment/default/bulk-delete'),('editComments','/admin/comment/default/bulk-spam'),('editComments','/admin/comment/default/bulk-trash'),('createComments','/admin/comment/default/create'),('deleteComments','/admin/comment/default/delete'),('viewComments','/admin/comment/default/grid-page-size'),('viewComments','/admin/comment/default/grid-sort'),('viewComments','/admin/comment/default/index'),('editComments','/admin/comment/default/toggle-attribute'),('editComments','/admin/comment/default/update'),('viewComments','/admin/comment/default/view'),('deleteDb','/admin/Db/delete'),('exportDb','/admin/Db/export'),('importDb','/admin/Db/import'),('viewDb','/admin/Db/index'),('deleteEavRecords','/admin/eav/attribute-option/bulk-delete'),('createEavRecords','/admin/eav/attribute-option/create'),('deleteEavRecords','/admin/eav/attribute-option/delete'),('viewEavRecords','/admin/eav/attribute-option/grid-page-size'),('viewEavRecords','/admin/eav/attribute-option/grid-sort'),('viewEavRecords','/admin/eav/attribute-option/index'),('editEavRecords','/admin/eav/attribute-option/toggle-attribute'),('editEavRecords','/admin/eav/attribute-option/update'),('deleteEavRecords','/admin/eav/attribute-type/bulk-delete'),('createEavRecords','/admin/eav/attribute-type/create'),('deleteEavRecords','/admin/eav/attribute-type/delete'),('viewEavRecords','/admin/eav/attribute-type/grid-page-size'),('viewEavRecords','/admin/eav/attribute-type/grid-sort'),('viewEavRecords','/admin/eav/attribute-type/index'),('editEavRecords','/admin/eav/attribute-type/toggle-attribute'),('editEavRecords','/admin/eav/attribute-type/update'),('deleteEavRecords','/admin/eav/attribute/bulk-delete'),('createEavRecords','/admin/eav/attribute/create'),('deleteEavRecords','/admin/eav/attribute/delete'),('viewEavRecords','/admin/eav/attribute/grid-page-size'),('viewEavRecords','/admin/eav/attribute/grid-sort'),('viewEavRecords','/admin/eav/attribute/index'),('editEavRecords','/admin/eav/attribute/toggle-attribute'),('editEavRecords','/admin/eav/attribute/update'),('viewEavRecords','/admin/eav/default/get-attributes'),('viewEavRecords','/admin/eav/default/get-categories'),('viewEavRecords','/admin/eav/default/index'),('editEavRecords','/admin/eav/default/set-attributes'),('deleteEavRecords','/admin/eav/entity-model/bulk-delete'),('createEavRecords','/admin/eav/entity-model/create'),('deleteEavRecords','/admin/eav/entity-model/delete'),('viewEavRecords','/admin/eav/entity-model/grid-page-size'),('viewEavRecords','/admin/eav/entity-model/grid-sort'),('viewEavRecords','/admin/eav/entity-model/index'),('editEavRecords','/admin/eav/entity-model/toggle-attribute'),('editEavRecords','/admin/eav/entity-model/update'),('BulkDeleteMeasure','/admin/measure/bulk-delete'),('createMeasure','/admin/measure/create'),('deleteMeasure','/admin/measure/delete'),('viewMeasure','/admin/measure/grid-page-size'),('viewMeasure','/admin/measure/grid-sort'),('viewMeasure','/admin/measure/index'),('editMeasure','/admin/measure/update'),('viewMeasure','/admin/measure/view'),('deleteMediaAlbums','/admin/media/album/bulk-delete'),('createMediaAlbums','/admin/media/album/create'),('deleteMediaAlbums','/admin/media/album/delete'),('viewMediaAlbums','/admin/media/album/grid-page-size'),('viewMediaAlbums','/admin/media/album/grid-sort'),('viewMediaAlbums','/admin/media/album/index'),('editMediaAlbums','/admin/media/album/toggle-attribute'),('editMediaAlbums','/admin/media/album/update'),('deleteMediaCategories','/admin/media/category/bulk-delete'),('createMediaCategories','/admin/media/category/create'),('deleteMediaCategories','/admin/media/category/delete'),('viewMediaCategories','/admin/media/category/grid-page-size'),('viewMediaCategories','/admin/media/category/grid-sort'),('viewMediaCategories','/admin/media/category/index'),('editMediaCategories','/admin/media/category/toggle-attribute'),('editMediaCategories','/admin/media/category/update'),('viewMedia','/admin/media/default/index'),('editMediaSettings','/admin/media/default/settings'),('deleteMedia','/admin/media/manage/delete'),('viewMedia','/admin/media/manage/index'),('viewMedia','/admin/media/manage/info'),('editMediaSettings','/admin/media/manage/resize'),('editMedia','/admin/media/manage/update'),('uploadMedia','/admin/media/manage/upload'),('uploadMedia','/admin/media/manage/uploader'),('deleteMenus','/admin/menu/default/bulk-delete'),('createMenus','/admin/menu/default/create'),('deleteMenus','/admin/menu/default/delete'),('viewMenus','/admin/menu/default/grid-page-size'),('viewMenus','/admin/menu/default/grid-sort'),('viewMenus','/admin/menu/default/index'),('editMenus','/admin/menu/default/update'),('viewMenus','/admin/menu/default/view'),('deleteMenuLinks','/admin/menu/link/bulk-delete'),('createMenuLinks','/admin/menu/link/create'),('deleteMenuLinks','/admin/menu/link/delete'),('viewMenuLinks','/admin/menu/link/grid-page-size'),('viewMenuLinks','/admin/menu/link/grid-sort'),('viewMenuLinks','/admin/menu/link/index'),('editMenuLinks','/admin/menu/link/update'),('viewMenuLinks','/admin/menu/link/view'),('editPages','/admin/page/default/bulk-activate'),('editPages','/admin/page/default/bulk-deactivate'),('deletePages','/admin/page/default/bulk-delete'),('createPages','/admin/page/default/create'),('deletePages','/admin/page/default/delete'),('viewPages','/admin/page/default/grid-page-size'),('viewPages','/admin/page/default/grid-sort'),('viewPages','/admin/page/default/index'),('editPages','/admin/page/default/toggle-attribute'),('editPages','/admin/page/default/update'),('viewPages','/admin/page/default/view'),('deletePostCategories','/admin/post/category/bulk-delete'),('createPostCategories','/admin/post/category/create'),('deletePostCategories','/admin/post/category/delete'),('viewPostCategories','/admin/post/category/grid-page-size'),('viewPostCategories','/admin/post/category/grid-sort'),('viewPostCategories','/admin/post/category/index'),('editPostCategories','/admin/post/category/toggle-attribute'),('editPostCategories','/admin/post/category/update'),('editPosts','/admin/post/default/bulk-activate'),('editPosts','/admin/post/default/bulk-deactivate'),('deletePosts','/admin/post/default/bulk-delete'),('createPosts','/admin/post/default/create'),('deletePosts','/admin/post/default/delete'),('viewPosts','/admin/post/default/grid-page-size'),('viewPosts','/admin/post/default/grid-sort'),('viewPosts','/admin/post/default/index'),('editPosts','/admin/post/default/toggle-attribute'),('editPosts','/admin/post/default/update'),('viewPosts','/admin/post/default/view'),('deletePostTags','/admin/post/tag/bulk-delete'),('createPostTags','/admin/post/tag/create'),('deletePostTags','/admin/post/tag/delete'),('viewPostTags','/admin/post/tag/grid-page-size'),('viewPostTags','/admin/post/tag/grid-sort'),('viewPostTags','/admin/post/tag/index'),('editPostTags','/admin/post/tag/toggle-attribute'),('editPostTags','/admin/post/tag/update'),('fullSeoAccess','/admin/seo/*'),('deleteSeo','/admin/seo/default/bulk-delete'),('createSeo','/admin/seo/default/create'),('deleteSeo','/admin/seo/default/delete'),('viewSeo','/admin/seo/default/grid-page-size'),('viewSeo','/admin/seo/default/grid-sort'),('viewSeo','/admin/seo/default/index'),('editSeo','/admin/seo/default/update'),('flushCache','/admin/settings/cache/flush'),('changeGeneralSettings','/admin/settings/default/index'),('changeReadingSettings','/admin/settings/reading/index'),('viewDashboard','/admin/site/index'),('viewTranslations','/admin/translation/default/index'),('createSourceMessages','/admin/translation/source/create'),('deleteSourceMessages','/admin/translation/source/delete'),('updateSourceMessages','/admin/translation/source/update'),('editUsers','/admin/user/default/bulk-activate'),('editUsers','/admin/user/default/bulk-deactivate'),('deleteUsers','/admin/user/default/bulk-delete'),('changeUserPassword','/admin/user/default/change-password'),('createUsers','/admin/user/default/create'),('deleteUsers','/admin/user/default/delete'),('viewUsers','/admin/user/default/grid-page-size'),('viewUsers','/admin/user/default/grid-sort'),('viewUsers','/admin/user/default/index'),('editUsers','/admin/user/default/toggle-attribute'),('editUsers','/admin/user/default/update'),('manageRolesAndPermissions','/admin/user/permission-groups/bulk-delete'),('manageRolesAndPermissions','/admin/user/permission-groups/create'),('manageRolesAndPermissions','/admin/user/permission-groups/delete'),('viewRolesAndPermissions','/admin/user/permission-groups/grid-page-size'),('viewRolesAndPermissions','/admin/user/permission-groups/grid-sort'),('viewRolesAndPermissions','/admin/user/permission-groups/index'),('manageRolesAndPermissions','/admin/user/permission-groups/update'),('manageRolesAndPermissions','/admin/user/permission/bulk-delete'),('manageRolesAndPermissions','/admin/user/permission/create'),('manageRolesAndPermissions','/admin/user/permission/delete'),('viewRolesAndPermissions','/admin/user/permission/grid-page-size'),('viewRolesAndPermissions','/admin/user/permission/grid-sort'),('viewRolesAndPermissions','/admin/user/permission/index'),('manageRolesAndPermissions','/admin/user/permission/refresh-routes'),('manageRolesAndPermissions','/admin/user/permission/set-child-permissions'),('manageRolesAndPermissions','/admin/user/permission/set-child-routes'),('manageRolesAndPermissions','/admin/user/permission/update'),('manageRolesAndPermissions','/admin/user/permission/view'),('manageRolesAndPermissions','/admin/user/role/bulk-delete'),('manageRolesAndPermissions','/admin/user/role/create'),('manageRolesAndPermissions','/admin/user/role/delete'),('viewRolesAndPermissions','/admin/user/role/grid-page-size'),('viewRolesAndPermissions','/admin/user/role/grid-sort'),('viewRolesAndPermissions','/admin/user/role/index'),('manageRolesAndPermissions','/admin/user/role/set-child-permissions'),('manageRolesAndPermissions','/admin/user/role/set-child-roles'),('manageRolesAndPermissions','/admin/user/role/update'),('manageRolesAndPermissions','/admin/user/role/view'),('assignRolesToUsers','/admin/user/user-permission/set'),('assignRolesToUsers','/admin/user/user-permission/set-roles'),('viewVisitLog','/admin/user/visit-log/grid-page-size'),('viewVisitLog','/admin/user/visit-log/grid-sort'),('viewVisitLog','/admin/user/visit-log/index'),('viewVisitLog','/admin/user/visit-log/view'),('BulkDeleteMeasure','/measure/bulk-delete'),('createMeasure','/measure/create'),('deleteMeasure','/measure/delete'),('viewMeasure','/measure/grid-page-size'),('viewMeasure','/measure/grid-sort'),('viewMeasure','/measure/index'),('editMeasure','/measure/update'),('viewMeasure','/measure/view'),('BulkDeleteOption','/option/bulk-delete'),('createOption','/option/create'),('deleteOption','/option/delete'),('viewOption','/option/grid-page-size'),('viewOption','/option/grid-sort'),('viewOption','/option/index'),('viewOption','/option/view'),('backend_administrator','assignRolesToUsers'),('backend_administrator','author'),('moderator','author'),('backend_administrator','bindUserToIp'),('backend_administrator','changeGeneralSettings'),('user','changeOwnPassword'),('backend_administrator','changeReadingSettings'),('backend_administrator','changeUserPassword'),('moderator','createComments'),('backend_administrator','createEavRecords'),('author','createMediaAlbums'),('moderator','createMediaCategories'),('backend_administrator','createMenuLinks'),('backend_administrator','createMenus'),('backend_administrator','createPages'),('moderator','createPostCategories'),('author','createPosts'),('moderator','createPostTags'),('backend_administrator','createSeo'),('fullSeoAccess','createSeo'),('backend_administrator','createSourceMessages'),('backend_administrator','createUsers'),('moderator','deleteComments'),('backend_administrator','deleteDb'),('backend_administrator','deleteEavRecords'),('backend_administrator','deleteMedia'),('backend_administrator','deleteMediaAlbums'),('backend_administrator','deleteMediaCategories'),('backend_administrator','deleteMenuLinks'),('backend_administrator','deleteMenus'),('backend_administrator','deletePages'),('backend_administrator','deletePostCategories'),('moderator','deletePosts'),('backend_administrator','deletePostTags'),('backend_administrator','deleteSeo'),('fullSeoAccess','deleteSeo'),('backend_administrator','deleteSourceMessages'),('backend_administrator','deleteUsers'),('moderator','editComments'),('backend_administrator','editEavRecords'),('uploadMedia','editMedia'),('moderator','editMediaAlbums'),('moderator','editMediaCategories'),('backend_administrator','editMenuLinks'),('backend_administrator','editMenus'),('backend_administrator','editPages'),('moderator','editPostCategories'),('author','editPosts'),('moderator','editPostTags'),('backend_administrator','editSeo'),('fullSeoAccess','editSeo'),('backend_administrator','editUserEmail'),('backend_administrator','editUsers'),('manageRolesAndPermissions','editUsers'),('backend_administrator','exportDb'),('backend_administrator','flushCache'),('moderator','flushCache'),('moderator','fullMediaAccess'),('moderator','fullMediaAlbumAccess'),('moderator','fullMediaCategoryAccess'),('backend_administrator','fullMenuAccess'),('backend_administrator','fullMenuLinkAccess'),('backend_administrator','fullPageAccess'),('moderator','fullPostAccess'),('moderator','fullPostCategoryAccess'),('moderator','fullPostTagAccess'),('backend_administrator','fullSeoAccess'),('backend_administrator','importDb'),('backend_administrator','manageRolesAndPermissions'),('backend_administrator','moderator'),('backend_administrator','updateSourceMessages'),('createSourceMessages','updateSourceMessages'),('deleteSourceMessages','updateSourceMessages'),('updateImmutableSourceMessages','updateSourceMessages'),('backend_administrator','updateTranslations'),('updateSourceMessages','updateTranslations'),('author','uploadMedia'),('author','user'),('backend_administrator','user'),('moderator','user'),('createComments','viewComments'),('deleteComments','viewComments'),('editComments','viewComments'),('author','viewDashboard'),('deleteDb','viewDb'),('exportDb','viewDb'),('importDb','viewDb'),('backend_administrator','viewEavRecords'),('createEavRecords','viewEavRecords'),('deleteEavRecords','viewEavRecords'),('editEavRecords','viewEavRecords'),('createMeasure','viewMeasure'),('deleteMeasure','viewMeasure'),('editMeasure','viewMeasure'),('moderator','viewMeasure'),('deleteMedia','viewMedia'),('editMedia','viewMedia'),('editMediaSettings','viewMedia'),('fullMediaAccess','viewMedia'),('uploadMedia','viewMedia'),('createMediaAlbums','viewMediaAlbums'),('deleteMediaAlbums','viewMediaAlbums'),('editMediaAlbums','viewMediaAlbums'),('createMediaCategories','viewMediaCategories'),('deleteMediaCategories','viewMediaCategories'),('editMediaCategories','viewMediaCategories'),('backend_administrator','viewMenuLinks'),('createMenuLinks','viewMenuLinks'),('deleteMenuLinks','viewMenuLinks'),('editMenuLinks','viewMenuLinks'),('fullMenuLinkAccess','viewMenuLinks'),('backend_administrator','viewMenus'),('createMenus','viewMenus'),('deleteMenus','viewMenus'),('editMenus','viewMenus'),('fullMenuAccess','viewMenus'),('viewMenuLinks','viewMenus'),('backend_administrator','viewOption'),('BulkDeleteOption','viewOption'),('createOption','viewOption'),('deleteOption','viewOption'),('moderator','viewOption'),('backend_administrator','viewPages'),('createPages','viewPages'),('deletePages','viewPages'),('editPages','viewPages'),('author','viewPostCategories'),('author','viewPosts'),('createPostCategories','viewPosts'),('createPosts','viewPosts'),('deletePostCategories','viewPosts'),('deletePosts','viewPosts'),('editPostCategories','viewPosts'),('editPosts','viewPosts'),('viewPostCategories','viewPosts'),('viewPostTags','viewPosts'),('author','viewPostTags'),('createPostTags','viewPostTags'),('deletePostTags','viewPostTags'),('editPostTags','viewPostTags'),('backend_administrator','viewRegistrationIp'),('backend_administrator','viewRolesAndPermissions'),('manageRolesAndPermissions','viewRolesAndPermissions'),('backend_administrator','viewSeo'),('createSeo','viewSeo'),('deleteSeo','viewSeo'),('editSeo','viewSeo'),('fullSeoAccess','viewSeo'),('backend_administrator','viewTranslations'),('createSourceMessages','viewTranslations'),('deleteSourceMessages','viewTranslations'),('updateImmutableSourceMessages','viewTranslations'),('updateSourceMessages','viewTranslations'),('updateTranslations','viewTranslations'),('editUserEmail','viewUserEmail'),('moderator','viewUserEmail'),('assignRolesToUsers','viewUserRoles'),('backend_administrator','viewUserRoles'),('viewRolesAndPermissions','viewUserRoles'),('assignRolesToUsers','viewUsers'),('changeUserPassword','viewUsers'),('createUsers','viewUsers'),('deleteUsers','viewUsers'),('editUsers','viewUsers'),('manageRolesAndPermissions','viewUsers'),('moderator','viewUsers'),('viewRolesAndPermissions','viewUsers'),('viewVisitLog','viewUsers'),('backend_administrator','viewVisitLog');
/*!40000 ALTER TABLE `auth_item_child` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_item_group`
--

DROP TABLE IF EXISTS `auth_item_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_item_group` (
  `code` varchar(64) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_item_group`
--

LOCK TABLES `auth_item_group` WRITE;
/*!40000 ALTER TABLE `auth_item_group` DISABLE KEYS */;
INSERT INTO `auth_item_group` VALUES ('commentManagement','Comment Management',1530777696,1530777696),('dashboard','Dashboard',1530777695,1530777695),('dbManagement','DB Management',1538129653,1538129653),('eavManagement','EAV Management',1440180000,1440180000),('mediaManagement','Media Management',1530777696,1530777696),('menuManagement','Menu Management',1530777696,1530777696),('pageManagement','Page Management',1530777696,1530777696),('postManagement','Post Management',1530777695,1530777695),('seoManagement','SEO Management',1538126970,1538126970),('settings','Settings',1530777696,1530777696),('system','System',1534759530,1534759530),('translations','Translations',1530777696,1530777696),('userCommonPermissions','Common Permissions',1530777695,1530777695),('userManagement','User Management',1530777696,1530777696);
/*!40000 ALTER TABLE `auth_item_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_rule`
--

DROP TABLE IF EXISTS `auth_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_rule` (
  `name` varchar(64) NOT NULL,
  `data` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_rule`
--

LOCK TABLES `auth_rule` WRITE;
/*!40000 ALTER TABLE `auth_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changelogs`
--

DROP TABLE IF EXISTS `changelogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changelogs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `relatedObjectType` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `relatedObjectId` int(11) NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci,
  `createdAt` int(11) DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `hostname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IN_related_object_type` (`relatedObjectType`),
  KEY `IN_related_object_id` (`relatedObjectId`),
  KEY `IN_type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changelogs`
--

LOCK TABLES `changelogs` WRITE;
/*!40000 ALTER TABLE `changelogs` DISABLE KEYS */;
INSERT INTO `changelogs` VALUES (1,'Option',23,'{\"name\":[null,\"111111\"],\"id\":[null,23]}',1537269274,'update',4,'127.0.0.1'),(2,'Option',23,'{\"name\":[\"111111\",\"222\"]}',1537269329,'update',4,'127.0.0.1'),(3,'Option',23,'',1537269368,'deleted',4,'127.0.0.1'),(4,'Option',24,'{\"name\":[null,\"1\"],\"id\":[null,24]}',1537269434,'update',4,'127.0.0.1'),(5,'Option',24,'',1537270059,'deleted',4,'127.0.0.1'),(6,'Option',25,'{\"name\":[null,\"5555555555555555\"],\"id\":[null,25]}',1537270079,'update',4,'127.0.0.1'),(7,'Option',25,'{\"name\":[\"5555555555555555\",\"77777777777777\"]}',1537270091,'update',4,'127.0.0.1'),(8,'Option',25,'{\"name\":[\"77777777777777\",\"888888888888\"]}',1537270098,'update',4,'127.0.0.1'),(9,'Option',25,'{\"name\":[\"888888888888\",\"99999\"]}',1537270206,'update',4,'127.0.0.1'),(10,'Option',25,'{\"name\":[\"0000000000000000\",\"11111111111111111\"]}',1537270494,'update',4,'127.0.0.1'),(11,'Option',26,'{\"name\":[null,\"111111\"],\"id\":[null,26]}',1537270734,'update',4,'127.0.0.1'),(12,'Option',26,'[\"hello world!\"]',1537270734,'hello_type',4,'127.0.0.1'),(13,'Option',27,'{\"name\":[null,\"\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435 1\"],\"id\":[null,27]}',1537342424,'update',4,'127.0.0.1'),(14,'Option',27,'{\"name\":[\"\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435 1\",\"\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435 2\"]}',1537342436,'update',4,'127.0.0.1'),(15,'Option',27,'{\"name\":[\"\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435 2\",\"\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435 3\"]}',1537342443,'update',4,'127.0.0.1'),(16,'Option',27,'{\"name\":[\"\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435 3\",\"\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435 4\"]}',1537342451,'update',4,'127.0.0.1'),(17,'Option',27,'{\"name\":[\"\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435 4\",\"\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435 1\"]}',1537342457,'update',4,'127.0.0.1'),(18,'Option',27,'',1537342548,'deleted',4,'127.0.0.1'),(19,'Option',28,'{\"name\":[null,\"28\"],\"id\":[null,28]}',1537342715,'update',4,'127.0.0.1'),(20,'Option',27,'',1537342801,'deleted',4,'127.0.0.1'),(21,'Option',29,'{\"id\":[null,29]}',1537349779,'update',4,'127.0.0.1');
/*!40000 ALTER TABLE `changelogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(64) NOT NULL DEFAULT '',
  `model_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `username` varchar(128) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL COMMENT 'null-is not a reply, int-replied comment id',
  `content` text,
  `status` int(1) unsigned NOT NULL DEFAULT '1' COMMENT '0-pending,1-published,2-spam,3-deleted',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `user_ip` varchar(15) DEFAULT NULL,
  `super_parent_id` int(11) DEFAULT NULL COMMENT 'null-has no parent, int-1st level parent id',
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comment_model` (`model`),
  KEY `comment_model_id` (`model`,`model_id`),
  KEY `comment_status` (`status`),
  KEY `comment_reply` (`parent_id`),
  KEY `comment_super_parent_id` (`super_parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,'yeesoft\\page\\models\\Page',1,6,NULL,NULL,NULL,'12345',1,1536237176,1536237176,6,'127.0.0.1',NULL,'/test'),(2,'yeesoft\\page\\models\\Page',1,4,NULL,NULL,1,'11111111',1,1536237201,1536237201,4,'127.0.0.1',1,'/test');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_attribute`
--

DROP TABLE IF EXISTS `eav_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_attribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `default_value` varchar(255) DEFAULT NULL,
  `icon` varchar(64) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `required` int(1) DEFAULT NULL,
  `visible` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `eav_attribute_type_id` (`type_id`),
  KEY `eav_attribute_name` (`name`),
  CONSTRAINT `fk_eav_attribute_type` FOREIGN KEY (`type_id`) REFERENCES `eav_attribute_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_attribute`
--

LOCK TABLES `eav_attribute` WRITE;
/*!40000 ALTER TABLE `eav_attribute` DISABLE KEYS */;
INSERT INTO `eav_attribute` VALUES (1,1,'field_1','Поле 1','0','adjust','text',1,1),(2,1,'field_2','Field 2','0','adn','',1,1),(3,2,'drop','Drop','','','test',1,1);
/*!40000 ALTER TABLE `eav_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_attribute_option`
--

DROP TABLE IF EXISTS `eav_attribute_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_attribute_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_id` int(11) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `eav_attribute_option_attribute_id` (`attribute_id`),
  CONSTRAINT `fk_eav_option_attribute` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_attribute_option`
--

LOCK TABLES `eav_attribute_option` WRITE;
/*!40000 ALTER TABLE `eav_attribute_option` DISABLE KEYS */;
INSERT INTO `eav_attribute_option` VALUES (1,3,'drop1'),(2,3,'drop2');
/*!40000 ALTER TABLE `eav_attribute_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_attribute_type`
--

DROP TABLE IF EXISTS `eav_attribute_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_attribute_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `store_type` varchar(32) NOT NULL DEFAULT 'raw',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_attribute_type`
--

LOCK TABLES `eav_attribute_type` WRITE;
/*!40000 ALTER TABLE `eav_attribute_type` DISABLE KEYS */;
INSERT INTO `eav_attribute_type` VALUES (1,'text','raw'),(2,'select','option');
/*!40000 ALTER TABLE `eav_attribute_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_entity`
--

DROP TABLE IF EXISTS `eav_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_entity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `eav_entity_model_id` (`model_id`),
  KEY `eav_entity_category_id` (`category_id`),
  CONSTRAINT `fk_eav_entity_model` FOREIGN KEY (`model_id`) REFERENCES `eav_entity_model` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_entity`
--

LOCK TABLES `eav_entity` WRITE;
/*!40000 ALTER TABLE `eav_entity` DISABLE KEYS */;
INSERT INTO `eav_entity` VALUES (4,4,NULL),(7,5,NULL);
/*!40000 ALTER TABLE `eav_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_entity_attribute`
--

DROP TABLE IF EXISTS `eav_entity_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_entity_attribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_id` int(11) DEFAULT NULL,
  `attribute_id` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `eav_entity_attribute_entity_id` (`entity_id`),
  KEY `eav_entity_attribute_attribute_id` (`attribute_id`),
  CONSTRAINT `fk_eav_entity_attribute_attribute` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_eav_entity_attribute_entity` FOREIGN KEY (`entity_id`) REFERENCES `eav_entity` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_entity_attribute`
--

LOCK TABLES `eav_entity_attribute` WRITE;
/*!40000 ALTER TABLE `eav_entity_attribute` DISABLE KEYS */;
INSERT INTO `eav_entity_attribute` VALUES (17,7,3,0),(142,4,1,0),(143,4,2,1),(144,4,3,2);
/*!40000 ALTER TABLE `eav_entity_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_entity_model`
--

DROP TABLE IF EXISTS `eav_entity_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_entity_model` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_name` varchar(100) NOT NULL,
  `entity_model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `eav_entity_model_unique_model` (`entity_model`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_entity_model`
--

LOCK TABLES `eav_entity_model` WRITE;
/*!40000 ALTER TABLE `eav_entity_model` DISABLE KEYS */;
INSERT INTO `eav_entity_model` VALUES (4,'Measure','common\\models\\Measure'),(5,'Product','backend\\models\\Product');
/*!40000 ALTER TABLE `eav_entity_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_value`
--

DROP TABLE IF EXISTS `eav_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_id` int(11) DEFAULT NULL,
  `attribute_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `value` text,
  PRIMARY KEY (`id`),
  KEY `eav_value_entity_id` (`entity_id`),
  KEY `eav_value_attribute_id` (`attribute_id`),
  KEY `eav_value_item_id` (`item_id`),
  CONSTRAINT `fk_eav_value_attribute` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_eav_value_entity` FOREIGN KEY (`entity_id`) REFERENCES `eav_entity` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_value`
--

LOCK TABLES `eav_value` WRITE;
/*!40000 ALTER TABLE `eav_value` DISABLE KEYS */;
INSERT INTO `eav_value` VALUES (3,4,1,1,'1233'),(4,4,2,1,'11'),(5,4,2,2,'555'),(6,4,1,2,'5555'),(7,4,3,1,'1'),(8,4,3,2,'1'),(9,4,2,3,'111'),(10,4,3,3,'2'),(11,4,1,3,'111'),(12,4,1,4,'1233'),(13,4,2,4,'111'),(14,4,3,4,'2'),(15,4,1,9,'0'),(16,4,2,9,'0'),(17,4,3,9,'1'),(18,4,1,10,'0'),(19,4,2,10,'0'),(20,4,3,10,'1'),(21,4,1,11,'0'),(22,4,2,11,'0'),(23,4,3,11,'1'),(24,4,1,12,'0'),(25,4,2,12,'0'),(26,4,3,12,'1'),(27,4,1,13,'0'),(28,4,2,13,'0'),(29,4,3,13,'1'),(30,4,1,14,'0'),(31,4,2,14,'0'),(32,4,3,14,'1');
/*!40000 ALTER TABLE `eav_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `level` int(11) DEFAULT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_time` double DEFAULT NULL,
  `prefix` text COLLATE utf8_unicode_ci,
  `message` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_log_level` (`level`),
  KEY `idx_log_category` (`category`)
) ENGINE=InnoDB AUTO_INCREMENT=460 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` VALUES (1,4,'my_category',1537261669.7566,'[127.0.0.1][2][-]','info in index_site_controller.'),(2,1,'my_category',1537261669.7567,'[127.0.0.1][2][-]','error in index_site_controller.'),(3,2,'my_category',1537261669.7567,'[127.0.0.1][2][-]','warning in index_site_controller.'),(4,4,'my_category',1537264092.1935,'[127.0.0.1][-][-]','info in index_site_controller.'),(5,1,'my_category',1537264092.1935,'[127.0.0.1][-][-]','error in index_site_controller.'),(6,2,'my_category',1537264092.1935,'[127.0.0.1][-][-]','warning in index_site_controller.'),(7,4,'my_category',1537268446.1379,'[127.0.0.1][-][-]','info in index_site_controller.'),(8,1,'my_category',1537268446.1379,'[127.0.0.1][-][-]','error in index_site_controller.'),(9,2,'my_category',1537268446.1379,'[127.0.0.1][-][-]','warning in index_site_controller.'),(10,4,'my_category',1537269233.345,'[127.0.0.1][-][-]','info in index_site_controller.'),(11,1,'my_category',1537269233.345,'[127.0.0.1][-][-]','error in index_site_controller.'),(12,2,'my_category',1537269233.345,'[127.0.0.1][-][-]','warning in index_site_controller.'),(13,4,'my_category',1537269238.6376,'[127.0.0.1][2][-]','info in index_site_controller.'),(14,1,'my_category',1537269238.6376,'[127.0.0.1][2][-]','error in index_site_controller.'),(15,2,'my_category',1537269238.6376,'[127.0.0.1][2][-]','warning in index_site_controller.'),(16,4,'my_category',1537269239.9036,'[127.0.0.1][-][-]','info in index_site_controller.'),(17,1,'my_category',1537269239.9036,'[127.0.0.1][-][-]','error in index_site_controller.'),(18,2,'my_category',1537269239.9036,'[127.0.0.1][-][-]','warning in index_site_controller.'),(19,4,'my_category',1537269245.8284,'[127.0.0.1][4][-]','info in index_site_controller.'),(20,1,'my_category',1537269245.8284,'[127.0.0.1][4][-]','error in index_site_controller.'),(21,2,'my_category',1537269245.8284,'[127.0.0.1][4][-]','warning in index_site_controller.'),(22,4,'my_category',1537269426.448,'[127.0.0.1][4][-]','info in index_site_controller.'),(23,1,'my_category',1537269426.448,'[127.0.0.1][4][-]','error in index_site_controller.'),(24,2,'my_category',1537269426.448,'[127.0.0.1][4][-]','warning in index_site_controller.'),(25,4,'my_category',1537270727.7225,'[127.0.0.1][4][-]','info in index_site_controller.'),(26,1,'my_category',1537270727.7225,'[127.0.0.1][4][-]','error in index_site_controller.'),(27,2,'my_category',1537270727.7225,'[127.0.0.1][4][-]','warning in index_site_controller.'),(28,4,'my_category',1537343102.1255,'[127.0.0.1][-][-]','info in index_site_controller.'),(29,1,'my_category',1537343102.1255,'[127.0.0.1][-][-]','error in index_site_controller.'),(30,2,'my_category',1537343102.1255,'[127.0.0.1][-][-]','warning in index_site_controller.'),(31,4,'my_category',1537345202.4687,'[127.0.0.1][-][-]','info in index_site_controller.'),(32,1,'my_category',1537345202.4687,'[127.0.0.1][-][-]','error in index_site_controller.'),(33,2,'my_category',1537345202.4687,'[127.0.0.1][-][-]','warning in index_site_controller.'),(34,4,'my_category',1537346450.5791,'[127.0.0.1][4][-]','info in index_site_controller.'),(35,1,'my_category',1537346450.5791,'[127.0.0.1][4][-]','error in index_site_controller.'),(36,2,'my_category',1537346450.5791,'[127.0.0.1][4][-]','warning in index_site_controller.'),(37,4,'my_category',1537426724.7297,'[127.0.0.1][13][-]','info in index_site_controller.'),(38,1,'my_category',1537426724.7298,'[127.0.0.1][13][-]','error in index_site_controller.'),(39,2,'my_category',1537426724.7298,'[127.0.0.1][13][-]','warning in index_site_controller.'),(40,4,'my_category',1537450642.5501,'[127.0.0.1][4][srqdghiv7rvcqlphj2r3eh46ohkjfqe2]','info in index_site_controller.'),(41,1,'my_category',1537450642.5501,'[127.0.0.1][4][srqdghiv7rvcqlphj2r3eh46ohkjfqe2]','error in index_site_controller.'),(42,2,'my_category',1537450642.5501,'[127.0.0.1][4][srqdghiv7rvcqlphj2r3eh46ohkjfqe2]','warning in index_site_controller.'),(43,4,'my_category',1537450651.5011,'[127.0.0.1][4][srqdghiv7rvcqlphj2r3eh46ohkjfqe2]','info in index_site_controller.'),(44,1,'my_category',1537450651.5011,'[127.0.0.1][4][srqdghiv7rvcqlphj2r3eh46ohkjfqe2]','error in index_site_controller.'),(45,2,'my_category',1537450651.5011,'[127.0.0.1][4][srqdghiv7rvcqlphj2r3eh46ohkjfqe2]','warning in index_site_controller.'),(46,4,'my_category',1537451011.0824,'[127.0.0.1][4][-]','info in index_site_controller.'),(47,1,'my_category',1537451011.0824,'[127.0.0.1][4][-]','error in index_site_controller.'),(48,2,'my_category',1537451011.0824,'[127.0.0.1][4][-]','warning in index_site_controller.'),(49,4,'my_category',1537451064.9625,'[127.0.0.1][4][-]','info in index_site_controller.'),(50,1,'my_category',1537451064.9625,'[127.0.0.1][4][-]','error in index_site_controller.'),(51,2,'my_category',1537451064.9625,'[127.0.0.1][4][-]','warning in index_site_controller.'),(52,4,'my_category',1537451164.5874,'[127.0.0.1][4][-]','info in index_site_controller.'),(53,1,'my_category',1537451164.5874,'[127.0.0.1][4][-]','error in index_site_controller.'),(54,2,'my_category',1537451164.5874,'[127.0.0.1][4][-]','warning in index_site_controller.'),(55,4,'my_category',1537451184.3783,'[127.0.0.1][4][-]','info in index_site_controller.'),(56,1,'my_category',1537451184.3783,'[127.0.0.1][4][-]','error in index_site_controller.'),(57,2,'my_category',1537451184.3783,'[127.0.0.1][4][-]','warning in index_site_controller.'),(58,4,'my_category',1537452420.2252,'[127.0.0.1][4][-]','info in index_site_controller.'),(59,1,'my_category',1537452420.2252,'[127.0.0.1][4][-]','error in index_site_controller.'),(60,2,'my_category',1537452420.2252,'[127.0.0.1][4][-]','warning in index_site_controller.'),(61,4,'my_category',1537778987.6218,'[127.0.0.1][-][-]','info in index_site_controller.'),(62,1,'my_category',1537778987.6218,'[127.0.0.1][-][-]','error in index_site_controller.'),(63,2,'my_category',1537778987.6218,'[127.0.0.1][-][-]','warning in index_site_controller.'),(64,4,'my_category',1537778991.5239,'[127.0.0.1][-][-]','info in index_site_controller.'),(65,1,'my_category',1537778991.5239,'[127.0.0.1][-][-]','error in index_site_controller.'),(66,2,'my_category',1537778991.5239,'[127.0.0.1][-][-]','warning in index_site_controller.'),(67,4,'my_category',1537778992.4473,'[127.0.0.1][-][-]','info in index_site_controller.'),(68,1,'my_category',1537778992.4473,'[127.0.0.1][-][-]','error in index_site_controller.'),(69,2,'my_category',1537778992.4473,'[127.0.0.1][-][-]','warning in index_site_controller.'),(70,4,'my_category',1537778992.755,'[127.0.0.1][-][-]','info in index_site_controller.'),(71,1,'my_category',1537778992.755,'[127.0.0.1][-][-]','error in index_site_controller.'),(72,2,'my_category',1537778992.755,'[127.0.0.1][-][-]','warning in index_site_controller.'),(73,4,'my_category',1537778994.6278,'[127.0.0.1][-][-]','info in index_site_controller.'),(74,1,'my_category',1537778994.6278,'[127.0.0.1][-][-]','error in index_site_controller.'),(75,2,'my_category',1537778994.6278,'[127.0.0.1][-][-]','warning in index_site_controller.'),(76,4,'my_category',1537778995.1383,'[127.0.0.1][-][-]','info in index_site_controller.'),(77,1,'my_category',1537778995.1383,'[127.0.0.1][-][-]','error in index_site_controller.'),(78,2,'my_category',1537778995.1383,'[127.0.0.1][-][-]','warning in index_site_controller.'),(79,4,'my_category',1537779066.2434,'[127.0.0.1][-][-]','info in index_site_controller.'),(80,1,'my_category',1537779066.2434,'[127.0.0.1][-][-]','error in index_site_controller.'),(81,2,'my_category',1537779066.2434,'[127.0.0.1][-][-]','warning in index_site_controller.'),(82,4,'my_category',1537779066.3554,'[127.0.0.1][-][-]','info in index_site_controller.'),(83,1,'my_category',1537779066.3554,'[127.0.0.1][-][-]','error in index_site_controller.'),(84,2,'my_category',1537779066.3554,'[127.0.0.1][-][-]','warning in index_site_controller.'),(85,4,'my_category',1537779725.6487,'[127.0.0.1][-][-]','info in index_site_controller.'),(86,1,'my_category',1537779725.6487,'[127.0.0.1][-][-]','error in index_site_controller.'),(87,2,'my_category',1537779725.6488,'[127.0.0.1][-][-]','warning in index_site_controller.'),(88,4,'my_category',1537779725.8738,'[127.0.0.1][-][-]','info in index_site_controller.'),(89,1,'my_category',1537779725.8738,'[127.0.0.1][-][-]','error in index_site_controller.'),(90,2,'my_category',1537779725.8738,'[127.0.0.1][-][-]','warning in index_site_controller.'),(91,4,'my_category',1537781503.0349,'[127.0.0.1][-][-]','info in index_site_controller.'),(92,1,'my_category',1537781503.0349,'[127.0.0.1][-][-]','error in index_site_controller.'),(93,2,'my_category',1537781503.0349,'[127.0.0.1][-][-]','warning in index_site_controller.'),(94,4,'my_category',1537783237.9546,'[127.0.0.1][-][-]','info in index_site_controller.'),(95,1,'my_category',1537783237.9546,'[127.0.0.1][-][-]','error in index_site_controller.'),(96,2,'my_category',1537783237.9546,'[127.0.0.1][-][-]','warning in index_site_controller.'),(97,4,'my_category',1537795565.2911,'[127.0.0.1][4][-]','info in index_site_controller.'),(98,1,'my_category',1537795565.2911,'[127.0.0.1][4][-]','error in index_site_controller.'),(99,2,'my_category',1537795565.2911,'[127.0.0.1][4][-]','warning in index_site_controller.'),(100,4,'my_category',1537795575.4848,'[127.0.0.1][4][-]','info in index_site_controller.'),(101,1,'my_category',1537795575.4848,'[127.0.0.1][4][-]','error in index_site_controller.'),(102,2,'my_category',1537795575.4848,'[127.0.0.1][4][-]','warning in index_site_controller.'),(103,4,'my_category',1537795739.1008,'[127.0.0.1][4][-]','info in index_site_controller.'),(104,1,'my_category',1537795739.1008,'[127.0.0.1][4][-]','error in index_site_controller.'),(105,2,'my_category',1537795739.1008,'[127.0.0.1][4][-]','warning in index_site_controller.'),(106,4,'my_category',1537795830.5915,'[127.0.0.1][4][-]','info in index_site_controller.'),(107,1,'my_category',1537795830.5915,'[127.0.0.1][4][-]','error in index_site_controller.'),(108,2,'my_category',1537795830.5915,'[127.0.0.1][4][-]','warning in index_site_controller.'),(109,4,'my_category',1537795835.1495,'[127.0.0.1][4][-]','info in index_site_controller.'),(110,1,'my_category',1537795835.1495,'[127.0.0.1][4][-]','error in index_site_controller.'),(111,2,'my_category',1537795835.1495,'[127.0.0.1][4][-]','warning in index_site_controller.'),(112,4,'my_category',1537795836.8058,'[127.0.0.1][4][-]','info in index_site_controller.'),(113,1,'my_category',1537795836.8058,'[127.0.0.1][4][-]','error in index_site_controller.'),(114,2,'my_category',1537795836.8058,'[127.0.0.1][4][-]','warning in index_site_controller.'),(115,4,'my_category',1537795840.1673,'[127.0.0.1][4][-]','info in index_site_controller.'),(116,1,'my_category',1537795840.1673,'[127.0.0.1][4][-]','error in index_site_controller.'),(117,2,'my_category',1537795840.1673,'[127.0.0.1][4][-]','warning in index_site_controller.'),(118,4,'my_category',1537795841.27,'[127.0.0.1][4][-]','info in index_site_controller.'),(119,1,'my_category',1537795841.27,'[127.0.0.1][4][-]','error in index_site_controller.'),(120,2,'my_category',1537795841.27,'[127.0.0.1][4][-]','warning in index_site_controller.'),(121,4,'my_category',1537795841.4302,'[127.0.0.1][4][-]','info in index_site_controller.'),(122,1,'my_category',1537795841.4302,'[127.0.0.1][4][-]','error in index_site_controller.'),(123,2,'my_category',1537795841.4302,'[127.0.0.1][4][-]','warning in index_site_controller.'),(124,4,'my_category',1537795842.3716,'[127.0.0.1][4][-]','info in index_site_controller.'),(125,1,'my_category',1537795842.3716,'[127.0.0.1][4][-]','error in index_site_controller.'),(126,2,'my_category',1537795842.3716,'[127.0.0.1][4][-]','warning in index_site_controller.'),(127,4,'my_category',1537796055.8423,'[127.0.0.1][-][-]','info in index_site_controller.'),(128,1,'my_category',1537796055.8423,'[127.0.0.1][-][-]','error in index_site_controller.'),(129,2,'my_category',1537796055.8423,'[127.0.0.1][-][-]','warning in index_site_controller.'),(130,4,'my_category',1537796062.4262,'[127.0.0.1][4][-]','info in index_site_controller.'),(131,1,'my_category',1537796062.4262,'[127.0.0.1][4][-]','error in index_site_controller.'),(132,2,'my_category',1537796062.4262,'[127.0.0.1][4][-]','warning in index_site_controller.'),(133,4,'my_category',1537796858.2771,'[127.0.0.1][4][-]','info in index_site_controller.'),(134,1,'my_category',1537796858.2771,'[127.0.0.1][4][-]','error in index_site_controller.'),(135,2,'my_category',1537796858.2771,'[127.0.0.1][4][-]','warning in index_site_controller.'),(136,4,'my_category',1537796866.6852,'[127.0.0.1][4][-]','info in index_site_controller.'),(137,1,'my_category',1537796866.6853,'[127.0.0.1][4][-]','error in index_site_controller.'),(138,2,'my_category',1537796866.6853,'[127.0.0.1][4][-]','warning in index_site_controller.'),(139,4,'my_category',1537796957.4595,'[127.0.0.1][4][-]','info in index_site_controller.'),(140,1,'my_category',1537796957.4595,'[127.0.0.1][4][-]','error in index_site_controller.'),(141,2,'my_category',1537796957.4595,'[127.0.0.1][4][-]','warning in index_site_controller.'),(142,4,'my_category',1537798182.0951,'[127.0.0.1][-][-]','info in index_site_controller.'),(143,1,'my_category',1537798182.0952,'[127.0.0.1][-][-]','error in index_site_controller.'),(144,2,'my_category',1537798182.0952,'[127.0.0.1][-][-]','warning in index_site_controller.'),(145,4,'my_category',1537798421.3848,'[127.0.0.1][-][-]','info in index_site_controller.'),(146,1,'my_category',1537798421.3848,'[127.0.0.1][-][-]','error in index_site_controller.'),(147,2,'my_category',1537798421.3848,'[127.0.0.1][-][-]','warning in index_site_controller.'),(148,4,'my_category',1537799278.9063,'[127.0.0.1][4][-]','info in index_site_controller.'),(149,1,'my_category',1537799278.9063,'[127.0.0.1][4][-]','error in index_site_controller.'),(150,2,'my_category',1537799278.9063,'[127.0.0.1][4][-]','warning in index_site_controller.'),(151,4,'my_category',1537868102.862,'[127.0.0.1][-][-]','info in index_site_controller.'),(152,1,'my_category',1537868102.862,'[127.0.0.1][-][-]','error in index_site_controller.'),(153,2,'my_category',1537868102.862,'[127.0.0.1][-][-]','warning in index_site_controller.'),(154,4,'my_category',1537868390.852,'[127.0.0.1][4][-]','info in index_site_controller.'),(155,1,'my_category',1537868390.852,'[127.0.0.1][4][-]','error in index_site_controller.'),(156,2,'my_category',1537868390.852,'[127.0.0.1][4][-]','warning in index_site_controller.'),(157,4,'my_category',1537869223.9615,'[127.0.0.1][-][-]','info in index_site_controller.'),(158,1,'my_category',1537869223.9615,'[127.0.0.1][-][-]','error in index_site_controller.'),(159,2,'my_category',1537869223.9615,'[127.0.0.1][-][-]','warning in index_site_controller.'),(160,4,'my_category',1537869249.5579,'[127.0.0.1][4][-]','info in index_site_controller.'),(161,1,'my_category',1537869249.5579,'[127.0.0.1][4][-]','error in index_site_controller.'),(162,2,'my_category',1537869249.5579,'[127.0.0.1][4][-]','warning in index_site_controller.'),(163,4,'my_category',1537869881.243,'[127.0.0.1][4][-]','info in index_site_controller.'),(164,1,'my_category',1537869881.2431,'[127.0.0.1][4][-]','error in index_site_controller.'),(165,2,'my_category',1537869881.2431,'[127.0.0.1][4][-]','warning in index_site_controller.'),(166,4,'my_category',1537869886.8199,'[127.0.0.1][4][-]','info in index_site_controller.'),(167,1,'my_category',1537869886.8199,'[127.0.0.1][4][-]','error in index_site_controller.'),(168,2,'my_category',1537869886.8199,'[127.0.0.1][4][-]','warning in index_site_controller.'),(169,4,'my_category',1537869898.6331,'[127.0.0.1][4][-]','info in index_site_controller.'),(170,1,'my_category',1537869898.6331,'[127.0.0.1][4][-]','error in index_site_controller.'),(171,2,'my_category',1537869898.6331,'[127.0.0.1][4][-]','warning in index_site_controller.'),(172,4,'my_category',1537870553.0071,'[127.0.0.1][4][-]','info in index_site_controller.'),(173,1,'my_category',1537870553.0072,'[127.0.0.1][4][-]','error in index_site_controller.'),(174,2,'my_category',1537870553.0072,'[127.0.0.1][4][-]','warning in index_site_controller.'),(175,4,'my_category',1537870557.374,'[127.0.0.1][4][-]','info in index_site_controller.'),(176,1,'my_category',1537870557.374,'[127.0.0.1][4][-]','error in index_site_controller.'),(177,2,'my_category',1537870557.374,'[127.0.0.1][4][-]','warning in index_site_controller.'),(178,4,'my_category',1537870928.4223,'[127.0.0.1][4][-]','info in index_site_controller.'),(179,1,'my_category',1537870928.4223,'[127.0.0.1][4][-]','error in index_site_controller.'),(180,2,'my_category',1537870928.4223,'[127.0.0.1][4][-]','warning in index_site_controller.'),(181,4,'my_category',1537870930.8306,'[127.0.0.1][4][-]','info in index_site_controller.'),(182,1,'my_category',1537870930.8306,'[127.0.0.1][4][-]','error in index_site_controller.'),(183,2,'my_category',1537870930.8306,'[127.0.0.1][4][-]','warning in index_site_controller.'),(184,4,'my_category',1537870931.8264,'[127.0.0.1][4][-]','info in index_site_controller.'),(185,1,'my_category',1537870931.8264,'[127.0.0.1][4][-]','error in index_site_controller.'),(186,2,'my_category',1537870931.8264,'[127.0.0.1][4][-]','warning in index_site_controller.'),(187,4,'my_category',1537871050.4745,'[127.0.0.1][4][-]','info in index_site_controller.'),(188,1,'my_category',1537871050.4746,'[127.0.0.1][4][-]','error in index_site_controller.'),(189,2,'my_category',1537871050.4746,'[127.0.0.1][4][-]','warning in index_site_controller.'),(190,4,'my_category',1537871051.6717,'[127.0.0.1][4][-]','info in index_site_controller.'),(191,1,'my_category',1537871051.6717,'[127.0.0.1][4][-]','error in index_site_controller.'),(192,2,'my_category',1537871051.6717,'[127.0.0.1][4][-]','warning in index_site_controller.'),(193,4,'my_category',1537871052.8742,'[127.0.0.1][4][-]','info in index_site_controller.'),(194,1,'my_category',1537871052.8742,'[127.0.0.1][4][-]','error in index_site_controller.'),(195,2,'my_category',1537871052.8742,'[127.0.0.1][4][-]','warning in index_site_controller.'),(196,4,'my_category',1537871053.85,'[127.0.0.1][4][-]','info in index_site_controller.'),(197,1,'my_category',1537871053.85,'[127.0.0.1][4][-]','error in index_site_controller.'),(198,2,'my_category',1537871053.85,'[127.0.0.1][4][-]','warning in index_site_controller.'),(199,4,'my_category',1537871054.6914,'[127.0.0.1][4][-]','info in index_site_controller.'),(200,1,'my_category',1537871054.6914,'[127.0.0.1][4][-]','error in index_site_controller.'),(201,2,'my_category',1537871054.6914,'[127.0.0.1][4][-]','warning in index_site_controller.'),(202,4,'my_category',1537871090.914,'[127.0.0.1][4][-]','info in index_site_controller.'),(203,1,'my_category',1537871090.9141,'[127.0.0.1][4][-]','error in index_site_controller.'),(204,2,'my_category',1537871090.9141,'[127.0.0.1][4][-]','warning in index_site_controller.'),(205,4,'my_category',1537871276.3829,'[127.0.0.1][4][h272v96295sjho1d5rjv8npbmile5laq]','info in index_site_controller.'),(206,1,'my_category',1537871276.3829,'[127.0.0.1][4][h272v96295sjho1d5rjv8npbmile5laq]','error in index_site_controller.'),(207,2,'my_category',1537871276.383,'[127.0.0.1][4][h272v96295sjho1d5rjv8npbmile5laq]','warning in index_site_controller.'),(208,4,'my_category',1537871350.7729,'[127.0.0.1][4][h272v96295sjho1d5rjv8npbmile5laq]','info in index_site_controller.'),(209,1,'my_category',1537871350.7729,'[127.0.0.1][4][h272v96295sjho1d5rjv8npbmile5laq]','error in index_site_controller.'),(210,2,'my_category',1537871350.7729,'[127.0.0.1][4][h272v96295sjho1d5rjv8npbmile5laq]','warning in index_site_controller.'),(211,4,'my_category',1537871369.3066,'[127.0.0.1][4][h272v96295sjho1d5rjv8npbmile5laq]','info in index_site_controller.'),(212,1,'my_category',1537871369.3066,'[127.0.0.1][4][h272v96295sjho1d5rjv8npbmile5laq]','error in index_site_controller.'),(213,2,'my_category',1537871369.3066,'[127.0.0.1][4][h272v96295sjho1d5rjv8npbmile5laq]','warning in index_site_controller.'),(214,4,'my_category',1537871606.2819,'[127.0.0.1][4][h272v96295sjho1d5rjv8npbmile5laq]','info in index_site_controller.'),(215,1,'my_category',1537871606.2819,'[127.0.0.1][4][h272v96295sjho1d5rjv8npbmile5laq]','error in index_site_controller.'),(216,2,'my_category',1537871606.2819,'[127.0.0.1][4][h272v96295sjho1d5rjv8npbmile5laq]','warning in index_site_controller.'),(217,4,'my_category',1537871817.648,'[127.0.0.1][4][h272v96295sjho1d5rjv8npbmile5laq]','info in index_site_controller.'),(218,1,'my_category',1537871817.6481,'[127.0.0.1][4][h272v96295sjho1d5rjv8npbmile5laq]','error in index_site_controller.'),(219,2,'my_category',1537871817.6481,'[127.0.0.1][4][h272v96295sjho1d5rjv8npbmile5laq]','warning in index_site_controller.'),(220,4,'my_category',1537872031.7492,'[127.0.0.1][4][-]','info in index_site_controller.'),(221,1,'my_category',1537872031.7492,'[127.0.0.1][4][-]','error in index_site_controller.'),(222,2,'my_category',1537872031.7492,'[127.0.0.1][4][-]','warning in index_site_controller.'),(223,4,'my_category',1537872035.9372,'[127.0.0.1][4][h272v96295sjho1d5rjv8npbmile5laq]','info in index_site_controller.'),(224,1,'my_category',1537872035.9372,'[127.0.0.1][4][h272v96295sjho1d5rjv8npbmile5laq]','error in index_site_controller.'),(225,2,'my_category',1537872035.9372,'[127.0.0.1][4][h272v96295sjho1d5rjv8npbmile5laq]','warning in index_site_controller.'),(226,4,'my_category',1537872074.6789,'[127.0.0.1][4][h272v96295sjho1d5rjv8npbmile5laq]','info in index_site_controller.'),(227,1,'my_category',1537872074.6789,'[127.0.0.1][4][h272v96295sjho1d5rjv8npbmile5laq]','error in index_site_controller.'),(228,2,'my_category',1537872074.679,'[127.0.0.1][4][h272v96295sjho1d5rjv8npbmile5laq]','warning in index_site_controller.'),(229,4,'my_category',1537872161.8381,'[127.0.0.1][4][h272v96295sjho1d5rjv8npbmile5laq]','info in index_site_controller.'),(230,1,'my_category',1537872161.8381,'[127.0.0.1][4][h272v96295sjho1d5rjv8npbmile5laq]','error in index_site_controller.'),(231,2,'my_category',1537872161.8381,'[127.0.0.1][4][h272v96295sjho1d5rjv8npbmile5laq]','warning in index_site_controller.'),(232,4,'my_category',1537872272.082,'[127.0.0.1][4][h272v96295sjho1d5rjv8npbmile5laq]','info in index_site_controller.'),(233,1,'my_category',1537872272.082,'[127.0.0.1][4][h272v96295sjho1d5rjv8npbmile5laq]','error in index_site_controller.'),(234,2,'my_category',1537872272.082,'[127.0.0.1][4][h272v96295sjho1d5rjv8npbmile5laq]','warning in index_site_controller.'),(235,4,'my_category',1537872273.8064,'[127.0.0.1][4][h272v96295sjho1d5rjv8npbmile5laq]','info in index_site_controller.'),(236,1,'my_category',1537872273.8064,'[127.0.0.1][4][h272v96295sjho1d5rjv8npbmile5laq]','error in index_site_controller.'),(237,2,'my_category',1537872273.8064,'[127.0.0.1][4][h272v96295sjho1d5rjv8npbmile5laq]','warning in index_site_controller.'),(238,4,'my_category',1537872326.2875,'[127.0.0.1][4][h272v96295sjho1d5rjv8npbmile5laq]','info in index_site_controller.'),(239,1,'my_category',1537872326.2875,'[127.0.0.1][4][h272v96295sjho1d5rjv8npbmile5laq]','error in index_site_controller.'),(240,2,'my_category',1537872326.2875,'[127.0.0.1][4][h272v96295sjho1d5rjv8npbmile5laq]','warning in index_site_controller.'),(241,4,'my_category',1537872605.5748,'[127.0.0.1][4][h272v96295sjho1d5rjv8npbmile5laq]','info in index_site_controller.'),(242,1,'my_category',1537872605.5748,'[127.0.0.1][4][h272v96295sjho1d5rjv8npbmile5laq]','error in index_site_controller.'),(243,2,'my_category',1537872605.5748,'[127.0.0.1][4][h272v96295sjho1d5rjv8npbmile5laq]','warning in index_site_controller.'),(244,4,'my_category',1537872607.8043,'[127.0.0.1][4][h272v96295sjho1d5rjv8npbmile5laq]','info in index_site_controller.'),(245,1,'my_category',1537872607.8043,'[127.0.0.1][4][h272v96295sjho1d5rjv8npbmile5laq]','error in index_site_controller.'),(246,2,'my_category',1537872607.8043,'[127.0.0.1][4][h272v96295sjho1d5rjv8npbmile5laq]','warning in index_site_controller.'),(247,4,'my_category',1537872748.3143,'[127.0.0.1][4][h272v96295sjho1d5rjv8npbmile5laq]','info in index_site_controller.'),(248,1,'my_category',1537872748.3143,'[127.0.0.1][4][h272v96295sjho1d5rjv8npbmile5laq]','error in index_site_controller.'),(249,2,'my_category',1537872748.3143,'[127.0.0.1][4][h272v96295sjho1d5rjv8npbmile5laq]','warning in index_site_controller.'),(250,4,'my_category',1537872750.0105,'[127.0.0.1][4][h272v96295sjho1d5rjv8npbmile5laq]','info in index_site_controller.'),(251,1,'my_category',1537872750.0105,'[127.0.0.1][4][h272v96295sjho1d5rjv8npbmile5laq]','error in index_site_controller.'),(252,2,'my_category',1537872750.0105,'[127.0.0.1][4][h272v96295sjho1d5rjv8npbmile5laq]','warning in index_site_controller.'),(253,4,'my_category',1537873050.1651,'[127.0.0.1][4][-]','info in index_site_controller.'),(254,1,'my_category',1537873050.1651,'[127.0.0.1][4][-]','error in index_site_controller.'),(255,2,'my_category',1537873050.1651,'[127.0.0.1][4][-]','warning in index_site_controller.'),(256,4,'my_category',1537873054.1343,'[127.0.0.1][4][h272v96295sjho1d5rjv8npbmile5laq]','info in index_site_controller.'),(257,1,'my_category',1537873054.1343,'[127.0.0.1][4][h272v96295sjho1d5rjv8npbmile5laq]','error in index_site_controller.'),(258,2,'my_category',1537873054.1343,'[127.0.0.1][4][h272v96295sjho1d5rjv8npbmile5laq]','warning in index_site_controller.'),(259,4,'my_category',1537873082.1858,'[127.0.0.1][4][h272v96295sjho1d5rjv8npbmile5laq]','info in index_site_controller.'),(260,1,'my_category',1537873082.1858,'[127.0.0.1][4][h272v96295sjho1d5rjv8npbmile5laq]','error in index_site_controller.'),(261,2,'my_category',1537873082.1858,'[127.0.0.1][4][h272v96295sjho1d5rjv8npbmile5laq]','warning in index_site_controller.'),(262,4,'my_category',1537873468.762,'[127.0.0.1][4][h272v96295sjho1d5rjv8npbmile5laq]','info in index_site_controller.'),(263,1,'my_category',1537873468.762,'[127.0.0.1][4][h272v96295sjho1d5rjv8npbmile5laq]','error in index_site_controller.'),(264,2,'my_category',1537873468.762,'[127.0.0.1][4][h272v96295sjho1d5rjv8npbmile5laq]','warning in index_site_controller.'),(265,4,'my_category',1537883913.9944,'[127.0.0.1][4][-]','info in index_site_controller.'),(266,1,'my_category',1537883913.9944,'[127.0.0.1][4][-]','error in index_site_controller.'),(267,2,'my_category',1537883913.9944,'[127.0.0.1][4][-]','warning in index_site_controller.'),(268,4,'my_category',1537883930.0444,'[127.0.0.1][-][-]','info in index_site_controller.'),(269,1,'my_category',1537883930.0444,'[127.0.0.1][-][-]','error in index_site_controller.'),(270,2,'my_category',1537883930.0444,'[127.0.0.1][-][-]','warning in index_site_controller.'),(271,4,'my_category',1537884605.3696,'[127.0.0.1][4][-]','info in index_site_controller.'),(272,1,'my_category',1537884605.3696,'[127.0.0.1][4][-]','error in index_site_controller.'),(273,2,'my_category',1537884605.3696,'[127.0.0.1][4][-]','warning in index_site_controller.'),(274,4,'my_category',1537946679.5241,'[127.0.0.1][-][-]','info in index_site_controller.'),(275,1,'my_category',1537946679.5241,'[127.0.0.1][-][-]','error in index_site_controller.'),(276,2,'my_category',1537946679.5241,'[127.0.0.1][-][-]','warning in index_site_controller.'),(277,4,'my_category',1537946699.4089,'[127.0.0.1][1][-]','info in index_site_controller.'),(278,1,'my_category',1537946699.4089,'[127.0.0.1][1][-]','error in index_site_controller.'),(279,2,'my_category',1537946699.4089,'[127.0.0.1][1][-]','warning in index_site_controller.'),(280,4,'my_category',1537946753.4087,'[127.0.0.1][-][-]','info in index_site_controller.'),(281,1,'my_category',1537946753.4087,'[127.0.0.1][-][-]','error in index_site_controller.'),(282,2,'my_category',1537946753.4087,'[127.0.0.1][-][-]','warning in index_site_controller.'),(283,4,'my_category',1537946759.7579,'[127.0.0.1][4][-]','info in index_site_controller.'),(284,1,'my_category',1537946759.7579,'[127.0.0.1][4][-]','error in index_site_controller.'),(285,2,'my_category',1537946759.7579,'[127.0.0.1][4][-]','warning in index_site_controller.'),(286,4,'my_category',1537946786.0419,'[127.0.0.1][-][-]','info in index_site_controller.'),(287,1,'my_category',1537946786.0419,'[127.0.0.1][-][-]','error in index_site_controller.'),(288,2,'my_category',1537946786.0419,'[127.0.0.1][-][-]','warning in index_site_controller.'),(289,4,'my_category',1537946796.5683,'[127.0.0.1][1][-]','info in index_site_controller.'),(290,1,'my_category',1537946796.5683,'[127.0.0.1][1][-]','error in index_site_controller.'),(291,2,'my_category',1537946796.5683,'[127.0.0.1][1][-]','warning in index_site_controller.'),(292,4,'my_category',1537947266.1853,'[127.0.0.1][-][-]','info in index_site_controller.'),(293,1,'my_category',1537947266.1853,'[127.0.0.1][-][-]','error in index_site_controller.'),(294,2,'my_category',1537947266.1853,'[127.0.0.1][-][-]','warning in index_site_controller.'),(295,4,'my_category',1537947270.5157,'[127.0.0.1][4][-]','info in index_site_controller.'),(296,1,'my_category',1537947270.5157,'[127.0.0.1][4][-]','error in index_site_controller.'),(297,2,'my_category',1537947270.5157,'[127.0.0.1][4][-]','warning in index_site_controller.'),(298,4,'my_category',1538032499.6886,'[127.0.0.1][-][-]','info in index_site_controller.'),(299,1,'my_category',1538032499.6887,'[127.0.0.1][-][-]','error in index_site_controller.'),(300,2,'my_category',1538032499.6887,'[127.0.0.1][-][-]','warning in index_site_controller.'),(301,4,'my_category',1538118557.947,'[127.0.0.1][-][-]','info in index_site_controller.'),(302,1,'my_category',1538118557.947,'[127.0.0.1][-][-]','error in index_site_controller.'),(303,2,'my_category',1538118557.947,'[127.0.0.1][-][-]','warning in index_site_controller.'),(304,4,'my_category',1538118586.7642,'[127.0.0.1][4][-]','info in index_site_controller.'),(305,1,'my_category',1538118586.7642,'[127.0.0.1][4][-]','error in index_site_controller.'),(306,2,'my_category',1538118586.7642,'[127.0.0.1][4][-]','warning in index_site_controller.'),(307,4,'my_category',1538136721.4617,'[127.0.0.1][4][-]','info in index_site_controller.'),(308,1,'my_category',1538136721.4617,'[127.0.0.1][4][-]','error in index_site_controller.'),(309,2,'my_category',1538136721.4617,'[127.0.0.1][4][-]','warning in index_site_controller.'),(310,4,'my_category',1538136724.8067,'[127.0.0.1][4][-]','info in index_site_controller.'),(311,1,'my_category',1538136724.8067,'[127.0.0.1][4][-]','error in index_site_controller.'),(312,2,'my_category',1538136724.8067,'[127.0.0.1][4][-]','warning in index_site_controller.'),(313,4,'my_category',1538138135.533,'[127.0.0.1][-][-]','info in index_site_controller.'),(314,1,'my_category',1538138135.533,'[127.0.0.1][-][-]','error in index_site_controller.'),(315,2,'my_category',1538138135.533,'[127.0.0.1][-][-]','warning in index_site_controller.'),(316,4,'my_category',1538138387.5885,'[127.0.0.1][4][-]','info in index_site_controller.'),(317,1,'my_category',1538138387.5886,'[127.0.0.1][4][-]','error in index_site_controller.'),(318,2,'my_category',1538138387.5886,'[127.0.0.1][4][-]','warning in index_site_controller.'),(319,4,'my_category',1538140985.1034,'[127.0.0.1][-][-]','info in index_site_controller.'),(320,1,'my_category',1538140985.1034,'[127.0.0.1][-][-]','error in index_site_controller.'),(321,2,'my_category',1538140985.1034,'[127.0.0.1][-][-]','warning in index_site_controller.'),(322,4,'my_category',1538141201.9145,'[127.0.0.1][4][-]','info in index_site_controller.'),(323,1,'my_category',1538141201.9145,'[127.0.0.1][4][-]','error in index_site_controller.'),(324,2,'my_category',1538141201.9145,'[127.0.0.1][4][-]','warning in index_site_controller.'),(325,4,'my_category',1538141207.4623,'[127.0.0.1][-][-]','info in index_site_controller.'),(326,1,'my_category',1538141207.4623,'[127.0.0.1][-][-]','error in index_site_controller.'),(327,2,'my_category',1538141207.4623,'[127.0.0.1][-][-]','warning in index_site_controller.'),(328,4,'my_category',1538142375.767,'[127.0.0.1][-][-]','info in index_site_controller.'),(329,1,'my_category',1538142375.767,'[127.0.0.1][-][-]','error in index_site_controller.'),(330,2,'my_category',1538142375.767,'[127.0.0.1][-][-]','warning in index_site_controller.'),(331,4,'my_category',1538144587.5303,'[127.0.0.1][4][-]','info in index_site_controller.'),(332,1,'my_category',1538144587.5303,'[127.0.0.1][4][-]','error in index_site_controller.'),(333,2,'my_category',1538144587.5303,'[127.0.0.1][4][-]','warning in index_site_controller.'),(334,4,'my_category',1538144639.5168,'[127.0.0.1][4][-]','info in index_site_controller.'),(335,1,'my_category',1538144639.5168,'[127.0.0.1][4][-]','error in index_site_controller.'),(336,2,'my_category',1538144639.5168,'[127.0.0.1][4][-]','warning in index_site_controller.'),(337,4,'my_category',1538144639.9704,'[127.0.0.1][4][-]','info in index_site_controller.'),(338,1,'my_category',1538144639.9704,'[127.0.0.1][4][-]','error in index_site_controller.'),(339,2,'my_category',1538144639.9704,'[127.0.0.1][4][-]','warning in index_site_controller.'),(340,4,'my_category',1538145317.5751,'[127.0.0.1][-][-]','info in index_site_controller.'),(341,1,'my_category',1538145317.5751,'[127.0.0.1][-][-]','error in index_site_controller.'),(342,2,'my_category',1538145317.5751,'[127.0.0.1][-][-]','warning in index_site_controller.'),(343,4,'my_category',1538146666.6114,'[127.0.0.1][-][-]','info in index_site_controller.'),(344,1,'my_category',1538146666.6114,'[127.0.0.1][-][-]','error in index_site_controller.'),(345,2,'my_category',1538146666.6114,'[127.0.0.1][-][-]','warning in index_site_controller.'),(346,4,'my_category',1538147217.1706,'[127.0.0.1][4][-]','info in index_site_controller.'),(347,1,'my_category',1538147217.1706,'[127.0.0.1][4][-]','error in index_site_controller.'),(348,2,'my_category',1538147217.1706,'[127.0.0.1][4][-]','warning in index_site_controller.'),(349,4,'my_category',1538147439.5459,'[127.0.0.1][4][-]','info in index_site_controller.'),(350,1,'my_category',1538147439.5459,'[127.0.0.1][4][-]','error in index_site_controller.'),(351,2,'my_category',1538147439.5459,'[127.0.0.1][4][-]','warning in index_site_controller.'),(352,4,'my_category',1538148221.7567,'[127.0.0.1][-][-]','info in index_site_controller.'),(353,1,'my_category',1538148221.7567,'[127.0.0.1][-][-]','error in index_site_controller.'),(354,2,'my_category',1538148221.7567,'[127.0.0.1][-][-]','warning in index_site_controller.'),(355,4,'my_category',1538377418.5363,'[127.0.0.1][-][-]','info in index_site_controller.'),(356,1,'my_category',1538377418.5364,'[127.0.0.1][-][-]','error in index_site_controller.'),(357,2,'my_category',1538377418.5364,'[127.0.0.1][-][-]','warning in index_site_controller.'),(358,4,'my_category',1538377622.6139,'[127.0.0.1][-][-]','info in index_site_controller.'),(359,1,'my_category',1538377622.6139,'[127.0.0.1][-][-]','error in index_site_controller.'),(360,2,'my_category',1538377622.6139,'[127.0.0.1][-][-]','warning in index_site_controller.'),(361,4,'my_category',1538377622.7646,'[127.0.0.1][-][-]','info in index_site_controller.'),(362,1,'my_category',1538377622.7646,'[127.0.0.1][-][-]','error in index_site_controller.'),(363,2,'my_category',1538377622.7646,'[127.0.0.1][-][-]','warning in index_site_controller.'),(364,4,'my_category',1538403573.8834,'[127.0.0.1][4][-]','info in index_site_controller.'),(365,1,'my_category',1538403573.8834,'[127.0.0.1][4][-]','error in index_site_controller.'),(366,2,'my_category',1538403573.8834,'[127.0.0.1][4][-]','warning in index_site_controller.'),(367,4,'my_category',1538467453.971,'[127.0.0.1][-][-]','info in index_site_controller.'),(368,1,'my_category',1538467453.971,'[127.0.0.1][-][-]','error in index_site_controller.'),(369,2,'my_category',1538467453.971,'[127.0.0.1][-][-]','warning in index_site_controller.'),(370,4,'my_category',1538469340.2654,'[127.0.0.1][4][hu75pck35b5lj789m43rqmkv0034ok27]','info in index_site_controller.'),(371,1,'my_category',1538469340.2654,'[127.0.0.1][4][hu75pck35b5lj789m43rqmkv0034ok27]','error in index_site_controller.'),(372,2,'my_category',1538469340.2654,'[127.0.0.1][4][hu75pck35b5lj789m43rqmkv0034ok27]','warning in index_site_controller.'),(373,4,'my_category',1538481992.3128,'[127.0.0.1][4][-]','info in index_site_controller.'),(374,1,'my_category',1538481992.3128,'[127.0.0.1][4][-]','error in index_site_controller.'),(375,2,'my_category',1538481992.3128,'[127.0.0.1][4][-]','warning in index_site_controller.'),(376,4,'my_category',1538484472.3226,'[127.0.0.1][-][-]','info in index_site_controller.'),(377,1,'my_category',1538484472.3226,'[127.0.0.1][-][-]','error in index_site_controller.'),(378,2,'my_category',1538484472.3226,'[127.0.0.1][-][-]','warning in index_site_controller.'),(379,4,'my_category',1538484475.8974,'[127.0.0.1][-][-]','info in index_site_controller.'),(380,1,'my_category',1538484475.8974,'[127.0.0.1][-][-]','error in index_site_controller.'),(381,2,'my_category',1538484475.8974,'[127.0.0.1][-][-]','warning in index_site_controller.'),(382,4,'my_category',1538484486.019,'[127.0.0.1][4][-]','info in index_site_controller.'),(383,1,'my_category',1538484486.019,'[127.0.0.1][4][-]','error in index_site_controller.'),(384,2,'my_category',1538484486.019,'[127.0.0.1][4][-]','warning in index_site_controller.'),(385,4,'my_category',1538484499.3656,'[127.0.0.1][4][-]','info in index_site_controller.'),(386,1,'my_category',1538484499.3656,'[127.0.0.1][4][-]','error in index_site_controller.'),(387,2,'my_category',1538484499.3656,'[127.0.0.1][4][-]','warning in index_site_controller.'),(388,4,'my_category',1538484600.7983,'[127.0.0.1][4][-]','info in index_site_controller.'),(389,1,'my_category',1538484600.7983,'[127.0.0.1][4][-]','error in index_site_controller.'),(390,2,'my_category',1538484600.7983,'[127.0.0.1][4][-]','warning in index_site_controller.'),(391,4,'my_category',1538484602.3976,'[127.0.0.1][4][-]','info in index_site_controller.'),(392,1,'my_category',1538484602.3976,'[127.0.0.1][4][-]','error in index_site_controller.'),(393,2,'my_category',1538484602.3976,'[127.0.0.1][4][-]','warning in index_site_controller.'),(394,4,'my_category',1538484608.8253,'[127.0.0.1][-][-]','info in index_site_controller.'),(395,1,'my_category',1538484608.8253,'[127.0.0.1][-][-]','error in index_site_controller.'),(396,2,'my_category',1538484608.8253,'[127.0.0.1][-][-]','warning in index_site_controller.'),(397,4,'my_category',1538484613.3634,'[127.0.0.1][4][-]','info in index_site_controller.'),(398,1,'my_category',1538484613.3634,'[127.0.0.1][4][-]','error in index_site_controller.'),(399,2,'my_category',1538484613.3634,'[127.0.0.1][4][-]','warning in index_site_controller.'),(400,4,'my_category',1538484614.9525,'[127.0.0.1][-][-]','info in index_site_controller.'),(401,1,'my_category',1538484614.9525,'[127.0.0.1][-][-]','error in index_site_controller.'),(402,2,'my_category',1538484614.9525,'[127.0.0.1][-][-]','warning in index_site_controller.'),(403,4,'my_category',1538485209.7391,'[127.0.0.1][-][-]','info in index_site_controller.'),(404,1,'my_category',1538485209.7391,'[127.0.0.1][-][-]','error in index_site_controller.'),(405,2,'my_category',1538485209.7391,'[127.0.0.1][-][-]','warning in index_site_controller.'),(406,4,'my_category',1538488764.3632,'[127.0.0.1][4][-]','info in index_site_controller.'),(407,1,'my_category',1538488764.3632,'[127.0.0.1][4][-]','error in index_site_controller.'),(408,2,'my_category',1538488764.3632,'[127.0.0.1][4][-]','warning in index_site_controller.'),(409,4,'my_category',1538488797.5059,'[127.0.0.1][4][-]','info in index_site_controller.'),(410,1,'my_category',1538488797.5059,'[127.0.0.1][4][-]','error in index_site_controller.'),(411,2,'my_category',1538488797.5059,'[127.0.0.1][4][-]','warning in index_site_controller.'),(412,4,'my_category',1538552318.7523,'[127.0.0.1][4][-]','info in index_site_controller.'),(413,1,'my_category',1538552318.7523,'[127.0.0.1][4][-]','error in index_site_controller.'),(414,2,'my_category',1538552318.7523,'[127.0.0.1][4][-]','warning in index_site_controller.'),(415,4,'my_category',1538553122.2278,'[127.0.0.1][-][-]','info in index_site_controller.'),(416,1,'my_category',1538553122.2278,'[127.0.0.1][-][-]','error in index_site_controller.'),(417,2,'my_category',1538553122.2278,'[127.0.0.1][-][-]','warning in index_site_controller.'),(418,4,'my_category',1538554680.6644,'[127.0.0.1][-][-]','info in index_site_controller.'),(419,1,'my_category',1538554680.6645,'[127.0.0.1][-][-]','error in index_site_controller.'),(420,2,'my_category',1538554680.6645,'[127.0.0.1][-][-]','warning in index_site_controller.'),(421,4,'my_category',1538554695.9322,'[127.0.0.1][3][-]','info in index_site_controller.'),(422,1,'my_category',1538554695.9322,'[127.0.0.1][3][-]','error in index_site_controller.'),(423,2,'my_category',1538554695.9322,'[127.0.0.1][3][-]','warning in index_site_controller.'),(424,4,'my_category',1538555161.1863,'[127.0.0.1][-][-]','info in index_site_controller.'),(425,1,'my_category',1538555161.1863,'[127.0.0.1][-][-]','error in index_site_controller.'),(426,2,'my_category',1538555161.1863,'[127.0.0.1][-][-]','warning in index_site_controller.'),(427,4,'my_category',1538555181.6909,'[127.0.0.1][4][-]','info in index_site_controller.'),(428,1,'my_category',1538555181.6909,'[127.0.0.1][4][-]','error in index_site_controller.'),(429,2,'my_category',1538555181.6909,'[127.0.0.1][4][-]','warning in index_site_controller.'),(430,4,'my_category',1538559312.5884,'[127.0.0.1][-][-]','info in index_site_controller.'),(431,1,'my_category',1538559312.5884,'[127.0.0.1][-][-]','error in index_site_controller.'),(432,2,'my_category',1538559312.5884,'[127.0.0.1][-][-]','warning in index_site_controller.'),(433,4,'my_category',1538559315.5813,'[127.0.0.1][4][-]','info in index_site_controller.'),(434,1,'my_category',1538559315.5813,'[127.0.0.1][4][-]','error in index_site_controller.'),(435,2,'my_category',1538559315.5813,'[127.0.0.1][4][-]','warning in index_site_controller.'),(436,4,'my_category',1538559757.5977,'[127.0.0.1][-][-]','info in index_site_controller.'),(437,1,'my_category',1538559757.5977,'[127.0.0.1][-][-]','error in index_site_controller.'),(438,2,'my_category',1538559757.5977,'[127.0.0.1][-][-]','warning in index_site_controller.'),(439,4,'my_category',1538559846.8891,'[127.0.0.1][3][-]','info in index_site_controller.'),(440,1,'my_category',1538559846.8891,'[127.0.0.1][3][-]','error in index_site_controller.'),(441,2,'my_category',1538559846.8891,'[127.0.0.1][3][-]','warning in index_site_controller.'),(442,4,'my_category',1538560890.7434,'[127.0.0.1][-][-]','info in index_site_controller.'),(443,1,'my_category',1538560890.7434,'[127.0.0.1][-][-]','error in index_site_controller.'),(444,2,'my_category',1538560890.7434,'[127.0.0.1][-][-]','warning in index_site_controller.'),(445,4,'my_category',1538564933.6125,'[127.0.0.1][4][-]','info in index_site_controller.'),(446,1,'my_category',1538564933.6125,'[127.0.0.1][4][-]','error in index_site_controller.'),(447,2,'my_category',1538564933.6125,'[127.0.0.1][4][-]','warning in index_site_controller.'),(448,4,'my_category',1538571390.3983,'[127.0.0.1][-][-]','info in index_site_controller.'),(449,1,'my_category',1538571390.3983,'[127.0.0.1][-][-]','error in index_site_controller.'),(450,2,'my_category',1538571390.3983,'[127.0.0.1][-][-]','warning in index_site_controller.'),(451,4,'my_category',1538571407.2753,'[127.0.0.1][4][-]','info in index_site_controller.'),(452,1,'my_category',1538571407.2753,'[127.0.0.1][4][-]','error in index_site_controller.'),(453,2,'my_category',1538571407.2753,'[127.0.0.1][4][-]','warning in index_site_controller.'),(454,4,'my_category',1538571408.8558,'[127.0.0.1][-][-]','info in index_site_controller.'),(455,1,'my_category',1538571408.8558,'[127.0.0.1][-][-]','error in index_site_controller.'),(456,2,'my_category',1538571408.8558,'[127.0.0.1][-][-]','warning in index_site_controller.'),(457,4,'my_category',1538637310.4662,'[127.0.0.1][-][-]','info in index_site_controller.'),(458,1,'my_category',1538637310.4662,'[127.0.0.1][-][-]','error in index_site_controller.'),(459,2,'my_category',1538637310.4662,'[127.0.0.1][-][-]','warning in index_site_controller.');
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `measure`
--

DROP TABLE IF EXISTS `measure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `measure` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `abbr` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='Единицы измерения';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `measure`
--

LOCK TABLES `measure` WRITE;
/*!40000 ALTER TABLE `measure` DISABLE KEYS */;
INSERT INTO `measure` VALUES (2,'рубль','₽'),(3,'Доллар','$'),(5,'Процент','%'),(6,'Килограмм','кг'),(7,'1','1'),(8,'2','2'),(9,'3','3'),(10,'4','4'),(11,'5','5');
/*!40000 ALTER TABLE `measure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `album_id` int(11) DEFAULT NULL,
  `filename` varchar(255) NOT NULL,
  `type` varchar(127) DEFAULT NULL,
  `url` text,
  `size` varchar(127) DEFAULT NULL,
  `thumbs` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_media_album` (`album_id`),
  KEY `fk_media_created_by` (`created_by`),
  KEY `fk_media_updated_by` (`updated_by`),
  CONSTRAINT `fk_media_album` FOREIGN KEY (`album_id`) REFERENCES `media_album` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_media_created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_media_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,NULL,'202288223598127977687973265930006982861282n.jpg','image/jpeg','/uploads/2018/09/202288223598127977687973265930006982861282n.jpg','36416','a:3:{s:5:\"small\";s:71:\"/uploads/2018/09/202288223598127977687973265930006982861282n-120x80.jpg\";s:6:\"medium\";s:72:\"/uploads/2018/09/202288223598127977687973265930006982861282n-400x300.jpg\";s:5:\"large\";s:72:\"/uploads/2018/09/202288223598127977687973265930006982861282n-800x600.jpg\";}',1536228488,1536228488,4,4);
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_album`
--

DROP TABLE IF EXISTS `media_album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_album` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text,
  `visible` int(11) NOT NULL DEFAULT '1' COMMENT '0-hidden,1-visible',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `media_album_slug` (`slug`),
  KEY `media_album_visible` (`visible`),
  KEY `fk_album_category` (`category_id`),
  KEY `fk_media_album_created_by` (`created_by`),
  KEY `fk_media_album_updated_by` (`updated_by`),
  CONSTRAINT `fk_album_category` FOREIGN KEY (`category_id`) REFERENCES `media_category` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_media_album_created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_media_album_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_album`
--

LOCK TABLES `media_album` WRITE;
/*!40000 ALTER TABLE `media_album` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_album_lang`
--

DROP TABLE IF EXISTS `media_album_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_album_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `media_album_id` int(11) NOT NULL,
  `language` varchar(6) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  KEY `media_album_lang_language` (`language`),
  KEY `fk_media_album_lang` (`media_album_id`),
  CONSTRAINT `fk_media_album_lang` FOREIGN KEY (`media_album_id`) REFERENCES `media_album` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_album_lang`
--

LOCK TABLES `media_album_lang` WRITE;
/*!40000 ALTER TABLE `media_album_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_album_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_category`
--

DROP TABLE IF EXISTS `media_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text,
  `visible` int(11) NOT NULL DEFAULT '1' COMMENT '0-hidden,1-visible',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `media_category_slug` (`slug`),
  KEY `media_category_visible` (`visible`),
  KEY `fk_media_category_created_by` (`created_by`),
  KEY `fk_media_category_updated_by` (`updated_by`),
  CONSTRAINT `fk_media_category_created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_media_category_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_category`
--

LOCK TABLES `media_category` WRITE;
/*!40000 ALTER TABLE `media_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_category_lang`
--

DROP TABLE IF EXISTS `media_category_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_category_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `media_category_id` int(11) NOT NULL,
  `language` varchar(6) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  KEY `media_category_lang_language` (`language`),
  KEY `fk_media_category_lang` (`media_category_id`),
  CONSTRAINT `fk_media_category_lang` FOREIGN KEY (`media_category_id`) REFERENCES `media_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_category_lang`
--

LOCK TABLES `media_category_lang` WRITE;
/*!40000 ALTER TABLE `media_category_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_category_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_lang`
--

DROP TABLE IF EXISTS `media_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `media_id` int(11) DEFAULT NULL,
  `language` varchar(6) NOT NULL,
  `title` varchar(255) NOT NULL,
  `alt` varchar(255) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  KEY `media_lang_language` (`language`),
  KEY `fk_media_lang` (`media_id`),
  CONSTRAINT `fk_media_lang` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_lang`
--

LOCK TABLES `media_lang` WRITE;
/*!40000 ALTER TABLE `media_lang` DISABLE KEYS */;
INSERT INTO `media_lang` VALUES (1,1,'ru','202288223598127977687973265930006982861282n.jpg','202288223598127977687973265930006982861282n.jpg',NULL);
/*!40000 ALTER TABLE `media_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_upload`
--

DROP TABLE IF EXISTS `media_upload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_upload` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `media_id` int(11) NOT NULL,
  `owner_class` varchar(255) NOT NULL,
  `owner_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `media_upload_owner_class` (`owner_class`),
  KEY `media_upload_owner_id` (`owner_id`),
  KEY `fk_media_upload_media_id` (`media_id`),
  CONSTRAINT `fk_media_upload_media_id` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_upload`
--

LOCK TABLES `media_upload` WRITE;
/*!40000 ALTER TABLE `media_upload` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_upload` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `id` varchar(64) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_menu_created_by` (`created_by`),
  KEY `fk_menu_updated_by` (`updated_by`),
  CONSTRAINT `fk_menu_created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_menu_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES ('admin-menu',NULL,NULL,1,NULL),('guest-menu',1535629066,1535629066,4,4),('main-menu',NULL,NULL,1,NULL);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_lang`
--

DROP TABLE IF EXISTS `menu_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` varchar(64) NOT NULL,
  `language` varchar(6) NOT NULL,
  `title` text,
  PRIMARY KEY (`id`),
  KEY `menu_lang_post_id` (`menu_id`),
  KEY `menu_lang_language` (`language`),
  CONSTRAINT `fk_menu_lang` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_lang`
--

LOCK TABLES `menu_lang` WRITE;
/*!40000 ALTER TABLE `menu_lang` DISABLE KEYS */;
INSERT INTO `menu_lang` VALUES (1,'admin-menu','en-US','Control Panel Menu'),(2,'main-menu','en-US','Main Menu'),(3,'guest-menu','en-US','Guest menu'),(4,'main-menu','ru','Главное меню'),(5,'main-menu','ru','Главное Меню'),(6,'admin-menu','ru','Меню Панели Управления'),(7,'guest-menu','ru','Гостевое меню');
/*!40000 ALTER TABLE `menu_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_link`
--

DROP TABLE IF EXISTS `menu_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_link` (
  `id` varchar(64) NOT NULL,
  `menu_id` varchar(64) NOT NULL,
  `link` varchar(255) DEFAULT NULL,
  `parent_id` varchar(64) DEFAULT '',
  `image` varchar(24) DEFAULT NULL,
  `alwaysVisible` int(1) NOT NULL DEFAULT '0',
  `order` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `link_menu_id` (`menu_id`),
  KEY `link_parent_id` (`parent_id`),
  KEY `fk_menu_link_created_by` (`created_by`),
  KEY `fk_menu_link_updated_by` (`updated_by`),
  CONSTRAINT `fk_menu_link` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_menu_link_created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_menu_link_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_link`
--

LOCK TABLES `menu_link` WRITE;
/*!40000 ALTER TABLE `menu_link` DISABLE KEYS */;
INSERT INTO `menu_link` VALUES ('about','main-menu','/site/about','','',1,2,NULL,1535115523,1,1),('about-guest','guest-menu','/site/about','','info-circle',1,999,1535632863,1535708828,4,4),('adminsystem','admin-menu','','','adn',0,31,1534760250,1535709021,1,4),('auditory','admin-menu','/auditory/default/index','auditory_main','',0,40,1538330997,1538330997,4,4),('auditory_building','admin-menu','/auditory/building/index','auditory_main','',0,42,1538331128,1538331128,4,4),('auditory_cat','admin-menu','/auditory/cat/index','auditory_main','',0,41,1538331072,1538331072,4,4),('auditory_main','admin-menu','/auditory/default/index','guide','',0,39,1538331205,1538640705,4,4),('bd','admin-menu','/db','','database',0,43,1537187091,1537187166,4,4),('bd2','admin-menu','/db-manager/default/index','','database',0,44,1537192847,1537192847,4,4),('comment','admin-menu','/comment/default/index','','comment',0,10,NULL,NULL,1,NULL),('contact','main-menu','/site/contact','','',1,3,NULL,1535115528,1,1),('contact-guest','guest-menu','/site/contact','','paper-plane-o',1,999,1535632929,1535708845,4,4),('dashboard','admin-menu','/','','th',0,0,NULL,NULL,1,NULL),('eav','admin-menu','','','code',0,18,NULL,1535709062,1,4),('eav-attribute','admin-menu','/eav/attribute/index','eav','',0,20,NULL,1535709110,1,4),('eav-eav','admin-menu','/eav/default/index','eav','',0,19,NULL,1535709096,1,4),('eav-model','admin-menu','/eav/entity-model/index','eav','',0,22,NULL,1535709137,1,4),('eav-option','admin-menu','/eav/attribute-option/index','eav','',0,21,NULL,1535709126,1,4),('eav-type','admin-menu','/eav/attribute-type/index','eav','',0,23,NULL,1535709153,1,4),('guide','admin-menu','','','inbox',0,33,1538330899,1538330899,4,4),('home','main-menu','/site/index','','th',1,0,NULL,1535622585,1,4),('home-guest','guest-menu','/site/index','','th',1,999,1535629294,1535708816,4,4),('image-settings','admin-menu','/media/default/settings','settings',NULL,0,28,NULL,NULL,1,NULL),('measure1','main-menu','/measure/index','tables','',0,5,1534756048,1535708973,1,4),('measureAdmin','admin-menu','/measure/index','adminsystem','amazon',0,32,1531125317,1534927685,1,1),('media','admin-menu',NULL,'','image',0,6,NULL,NULL,1,NULL),('media-album','admin-menu','/media/album/index','media',NULL,0,8,NULL,NULL,1,NULL),('media-category','admin-menu','/media/category/index','media',NULL,0,9,NULL,NULL,1,NULL),('media-media','admin-menu','/media/default/index','media',NULL,0,7,NULL,NULL,1,NULL),('menu','admin-menu','/menu/default/index','','align-justify',0,11,NULL,NULL,1,NULL),('option','main-menu','/option/index','tables','',0,6,1535369181,1535708981,4,4),('page','admin-menu','/page/default/index','','file',0,1,NULL,NULL,1,NULL),('post','admin-menu',NULL,'','pencil',0,2,NULL,NULL,1,NULL),('post-category','admin-menu','/post/category/index','post',NULL,0,5,NULL,NULL,1,NULL),('post-post','admin-menu','/post/default/index','post',NULL,0,3,NULL,NULL,1,NULL),('post-tag','admin-menu','/post/tag/index','post','',0,4,NULL,1535709768,1,4),('seo','admin-menu','/seo/default/index','','line-chart',0,24,NULL,NULL,1,NULL),('settings','admin-menu',NULL,'','cog',0,25,NULL,NULL,1,NULL),('settings-cache','admin-menu','/settings/cache/flush','settings',NULL,0,30,NULL,NULL,1,NULL),('settings-general','admin-menu','/settings/default/index','settings',NULL,0,26,NULL,NULL,1,NULL),('settings-reading','admin-menu','/settings/reading/index','settings',NULL,0,27,NULL,NULL,1,NULL),('settings-translations','admin-menu','/translation/default/index','settings',NULL,0,29,NULL,NULL,1,NULL),('tables','main-menu','','','',0,4,1535443564,1535708959,4,4),('test-page','main-menu','/site/test','','',1,1,NULL,1535115517,1,1),('user','admin-menu',NULL,'','user',0,12,NULL,NULL,1,NULL),('user-groups','admin-menu','/user/permission-groups/index','user',NULL,0,16,NULL,NULL,1,NULL),('user-log','admin-menu','/user/visit-log/index','user',NULL,0,17,NULL,NULL,1,NULL),('user-permission','admin-menu','/user/permission/index','user',NULL,0,15,NULL,NULL,1,NULL),('user-role','admin-menu','/user/role/index','user',NULL,0,14,NULL,NULL,1,NULL),('user-user','admin-menu','/user/default/index','user',NULL,0,13,NULL,NULL,1,NULL),('venue','admin-menu','/venue/default/index','guide','',0,34,1538640393,1538640690,4,4),('venue_country','admin-menu','/venue/country/index','venue','',0,36,1538640228,1538640228,4,4),('venue_district','admin-menu','/venue/district/index','venue','',0,38,1538640332,1538640332,4,4),('venue_place','admin-menu','/venue/default/index','venue','',0,35,1538640139,1538640177,4,4),('venue_sity','admin-menu','/venue/sity/index','venue','',0,37,1538640257,1538640780,4,4);
/*!40000 ALTER TABLE `menu_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_link_lang`
--

DROP TABLE IF EXISTS `menu_link_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_link_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `link_id` varchar(64) NOT NULL,
  `language` varchar(6) NOT NULL,
  `label` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_link_lang_link_id` (`link_id`),
  KEY `menu_link_lang_language` (`language`),
  CONSTRAINT `fk_menu_link_lang` FOREIGN KEY (`link_id`) REFERENCES `menu_link` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_link_lang`
--

LOCK TABLES `menu_link_lang` WRITE;
/*!40000 ALTER TABLE `menu_link_lang` DISABLE KEYS */;
INSERT INTO `menu_link_lang` VALUES (1,'dashboard','en-US','Dashboard'),(2,'settings','en-US','Settings'),(3,'settings-general','en-US','General Settings'),(4,'settings-reading','en-US','Reading Settings'),(5,'settings-cache','en-US','Flush Cache'),(6,'menu','en-US','Menus'),(7,'comment','en-US','Comments'),(8,'user','en-US','Users'),(9,'user-groups','en-US','Permission groups'),(10,'user-log','en-US','Visit log'),(11,'user-permission','en-US','Permissions'),(12,'user-role','en-US','Roles'),(13,'user-user','en-US','Users'),(14,'post','en-US','Posts'),(15,'post-post','en-US','Posts'),(16,'post-category','en-US','Categories'),(17,'media','en-US','Media'),(18,'media-media','en-US','Media'),(19,'media-album','en-US','Albums'),(20,'media-category','en-US','Categories'),(21,'image-settings','en-US','Image Settings'),(22,'page','en-US','Pages'),(23,'settings-translations','en-US','Message Translation'),(24,'seo','en-US','SEO'),(25,'post-tag','en-US','Tags'),(26,'home','en-US','Home'),(27,'about','en-US','About'),(28,'test-page','en-US','Test Page'),(29,'contact','en-US','Contact'),(30,'measureAdmin','en-US','Measure'),(31,'eav','en-US','Custom Fields'),(32,'eav-eav','en-US','Fields'),(33,'eav-attribute','en-US','Attributes'),(34,'eav-option','en-US','Options'),(35,'eav-model','en-US','Models'),(36,'eav-type','en-US','Types'),(39,'measure1','en-US','Measure'),(41,'adminsystem','en-US','System'),(42,'option','en-US','Option'),(43,'tables','en-US','Tables'),(44,'home-guest','en-US','Home'),(45,'about-guest','en-US','About'),(46,'contact-guest','en-US','Contact'),(47,'home','ru','Главная'),(48,'about','ru','О Нас'),(49,'test-page','ru','Тестовая Страница'),(50,'contact','ru','Контакты'),(51,'comment','ru','Комментарии'),(52,'dashboard','ru','Главная'),(53,'media','ru','Медиа'),(54,'media-media','ru','Медиа'),(55,'media-album','ru','Альбомы'),(56,'media-category','ru','Категории'),(57,'image-settings','ru','Настройки Изображений'),(58,'menu','ru','Меню'),(59,'page','ru','Страницы'),(60,'post','ru','Записи'),(61,'post-post','ru','Записи'),(62,'post-category','ru','Категории'),(63,'settings','ru','Настройки'),(64,'settings-general','ru','Общие Настройки'),(65,'settings-reading','ru','Настройки Чтения'),(66,'settings-cache','ru','Очистить Кэш'),(67,'settings-translations','ru','Перевод Сообщений'),(68,'user','ru','Пользователи'),(69,'user-groups','ru','Группы Прав Доступа'),(70,'user-log','ru','Лог Посещений'),(71,'user-permission','ru','Права Доступа'),(72,'user-role','ru','Роли Пользователей'),(73,'user-user','ru','Пользователи'),(74,'seo','ru','SEO'),(75,'home-guest','ru','Главная'),(76,'about-guest','ru','О нас'),(77,'contact-guest','ru','Контакты'),(78,'tables','ru','Таблицы'),(79,'measure1','ru','Единицы'),(80,'option','ru','Опции'),(81,'adminsystem','ru','Таблицы'),(82,'eav','ru','Атрибуты'),(83,'eav-eav','ru','Поля'),(84,'eav-attribute','ru','Атрибуты'),(85,'eav-option','ru','Опции'),(86,'eav-model','ru','Модели'),(87,'eav-type','ru','Типы атрибутов'),(88,'measureAdmin','ru','Единицы'),(89,'post-tag','ru','Тэги'),(90,'bd','ru','База данных'),(91,'bd2','ru','База данных-2'),(92,'guide','ru','Справочники'),(93,'auditory','ru','Помещения'),(94,'auditory_cat','ru','Категории помещений'),(95,'auditory_building','ru','Здания'),(96,'auditory_main','ru','Помещения'),(97,'venue_place','ru','Организации и площадки'),(98,'venue_country','ru','Страны'),(99,'venue_sity','ru','Города'),(100,'venue_district','ru','Округа и районы'),(101,'venue','ru','Организации');
/*!40000 ALTER TABLE `menu_link_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source_id` int(11) DEFAULT NULL,
  `language` varchar(16) NOT NULL,
  `translation` text,
  PRIMARY KEY (`id`),
  KEY `message_index` (`source_id`,`language`),
  CONSTRAINT `fk_message_source_message` FOREIGN KEY (`source_id`) REFERENCES `message_source` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=592 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (130,253,'ru','Вы уверены, что желаете удалить изображение Вашего профиля?'),(131,254,'ru','Вы уверены, что хотите отключить эту авторизацию?'),(132,255,'ru','Ошибка авторизации.'),(133,256,'ru','Авторизация'),(134,257,'ru','Сервис авторизации.'),(135,258,'ru','Captcha'),(136,259,'ru','Изменить изображение профиля'),(137,260,'ru','Проверьте ваш e-mail для дальнейших инструкций'),(138,261,'ru','Проверьте ваш e-mail {email} для получения инструкций по активации аккаунта'),(139,262,'ru','Нажмите, чтобы подключиться к службе '),(140,263,'ru','Нажмите, чтобы отменить связь с сервисом '),(141,264,'ru','Подтвердить E-mail '),(142,265,'ru','Подтвердить '),(143,266,'ru','Не удалось отправить подтверждение по электронной почте '),(144,267,'ru','Текущий пароль'),(145,268,'ru','Подтверждение по электронной почте для'),(146,269,'ru','E-mail {email} подтвержден'),(147,270,'ru','Неверный адрес электронной почты '),(148,271,'ru','Письмо со ссылкой активации отправлено на {email}. Срок действия этой ссылки истекает через {минут} мин. '),(149,272,'ru','E-mail'),(150,273,'ru','Забыли пароль?'),(151,274,'ru','Неверное имя пользователя или пароль'),(152,275,'ru','Логин занят'),(153,276,'ru','Логин'),(154,277,'ru','Выход'),(155,278,'ru','Авторизация не доступна'),(156,279,'ru','Пароль обновлен'),(157,280,'ru','Восстановление пароля '),(158,281,'ru','Сброс пароля для'),(159,282,'ru','Пароль'),(160,283,'ru','Регистрация - подтвердите ваш e-mail'),(161,284,'ru','Регистрация'),(162,285,'ru','Запомнить меня'),(163,286,'ru','Удалить изображение профиля '),(164,287,'ru','Повторите пароль'),(165,288,'ru','Сбросить пароль'),(166,289,'ru','Сбросить'),(167,290,'ru','Сохранить профиль '),(168,291,'ru','Сохранить изображение профиля '),(169,292,'ru','Установить пароль '),(170,293,'ru','Задать Имя Пользователя'),(171,294,'ru','Регистрация'),(172,295,'ru','Этот адрес электронной почты уже существует '),(173,296,'ru','Токен не найден. Он может быть просрочен '),(174,297,'ru','Токен не найден. Он может быть просрочен. Попробуйте сбросить пароль еще раз'),(175,298,'ru','Слишком много попыток '),(176,299,'ru','Не удается отправить сообщение по электронной почте'),(177,300,'ru','Изменить пароль'),(178,301,'ru','Профиль'),(179,302,'ru','Пользователь с тем же адресом электронной почты, что и в учетной записи {client}, уже существует, но не связан с ним. Войдите, используя электронную почту, чтобы связать его.'),(180,303,'ru','Логин должен содержать только латинские буквы, цифры и следующие символы: \"-\" и \"_\". '),(181,304,'ru','Username содержит недопустимые символы или слова.'),(182,305,'ru','Неверный пароль '),(183,306,'ru','Вы не можете войти с этого IP'),(239,314,'ru',''),(240,315,'ru',''),(241,316,'ru',''),(242,317,'ru',''),(243,318,'ru',''),(244,319,'ru',''),(245,320,'ru',''),(246,321,'ru',''),(247,322,'ru',''),(248,323,'ru',''),(249,324,'ru',''),(250,325,'ru',''),(251,326,'ru',''),(252,327,'ru',''),(253,328,'ru',''),(254,329,'ru',''),(255,330,'ru',''),(287,172,'ru',''),(298,1,'ru','--- С выбранным ---'),(299,2,'ru','Активировать'),(300,3,'ru','Активные'),(301,4,'ru','Добавить'),(302,5,'ru','Все'),(303,6,'ru','Всегда Видимый'),(304,7,'ru','Произошла неизвестная ошибка.'),(305,8,'ru','Подтверждено'),(306,9,'ru','Автор'),(307,10,'ru','Заблокирован'),(308,11,'ru','Привязка к IP'),(309,12,'ru','Выбрать'),(310,13,'ru','Браузер'),(311,14,'ru','Отменить'),(312,15,'ru','Категория'),(313,16,'ru','Очистить Фильтры'),(314,17,'ru','Закрыто'),(315,18,'ru','Код'),(316,19,'ru','Статус Комментариев'),(317,20,'ru','Активность Комментариев'),(318,21,'ru','Подтвердить'),(319,22,'ru','Код Подтверждения'),(320,23,'ru','Содержание'),(321,24,'ru','Панель Управления'),(322,25,'ru','Создать {item}'),(323,26,'ru','Создать'),(324,27,'ru','Создал'),(325,28,'ru','Создан'),(326,29,'ru','Панель Управления'),(327,30,'ru','Данные'),(328,31,'ru','Деактивировать'),(329,32,'ru','Язык по умолчанию'),(330,33,'ru','Значение по умолчанию'),(331,34,'ru','Удалить'),(332,35,'ru','Описание'),(333,36,'ru','E-mail подтвержден'),(334,37,'ru','E-mail'),(335,38,'ru','Редактировать'),(336,39,'ru','Ошибка'),(337,40,'ru','Например'),(338,41,'ru','Группа'),(339,42,'ru','ID'),(340,43,'ru','IP'),(341,44,'ru','Иконка'),(342,45,'ru','Неактивные'),(343,46,'ru','Вставить'),(344,47,'ru','Неверные настройки для виджетов панели управления'),(345,48,'ru','Ключ'),(346,49,'ru','Надпись'),(347,50,'ru','Язык'),(348,51,'ru','ID ссылки может содержать только строчные буквы, цифры, подчеркивание и тире.'),(349,52,'ru','Ссылка'),(350,53,'ru','Логин'),(351,54,'ru','Выйти {username}'),(352,55,'ru','ID меню может содержать только строчные буквы, цифры, подчеркивание и тире.'),(353,56,'ru','Меню'),(354,57,'ru','Название'),(355,58,'ru','Нет Родительского Элемента'),(356,59,'ru','Комментарии не найдены.'),(357,60,'ru','Не Выбрано'),(358,61,'ru','OK'),(359,62,'ru','ОС'),(360,63,'ru','Открыто'),(361,64,'ru','Порядок'),(362,65,'ru','Версия PHP'),(363,66,'ru','Родительская Ссылка'),(364,67,'ru','Пароль'),(365,68,'ru','Не опубликовано'),(366,69,'ru','Обработка данных'),(367,70,'ru','Опубликовать'),(368,71,'ru','Опубликовано'),(369,72,'ru','Читать дальше'),(370,73,'ru','Записей на странице'),(371,74,'ru','IP Регистрации'),(372,75,'ru','Повторите пароль'),(373,76,'ru','Обязательный'),(374,77,'ru','Ревизия'),(375,78,'ru','Роль'),(376,79,'ru','Роли'),(377,80,'ru','Правило'),(378,81,'ru','Сохранить Все'),(379,82,'ru','Сохранить'),(380,83,'ru','Сохранено'),(381,84,'ru','Настройки'),(382,85,'ru','Размер'),(383,86,'ru','Ссылка'),(384,87,'ru','Спам'),(385,88,'ru','Старт'),(386,89,'ru','Статус'),(387,90,'ru','Суперадмин'),(388,91,'ru','Подробности Системы'),(389,92,'ru','Изменения были успешно сохранены.'),(390,93,'ru','Этот e-mail уже занят'),(391,94,'ru','Заголовок'),(392,95,'ru','Токен'),(393,96,'ru','Мусор'),(394,97,'ru','Тип'),(395,98,'ru','URL'),(396,99,'ru','Отменить Публикацию'),(397,100,'ru','Обновить \"{item}\"'),(398,101,'ru','Обновить'),(399,102,'ru','Обновил'),(400,103,'ru','Обновлен'),(401,104,'ru','Загружено'),(402,105,'ru','Данные Устройства'),(403,106,'ru','Пользователь'),(404,107,'ru','Имя пользователя'),(405,108,'ru','Значение'),(406,109,'ru','Просмотр'),(407,110,'ru','Видимый'),(408,111,'ru','Время Посещения'),(409,112,'ru','Неправильный формат. Введите действительные IP-адреса через запятую'),(410,113,'ru','Версия Yee CMS'),(411,114,'ru','Версия Ядра Yee'),(412,115,'ru','Версия Yii Framework'),(413,116,'ru','Запись успешно обновлена.'),(414,117,'ru','Запись успешно создана.'),(415,118,'ru','Запись успешно удалена.'),(416,119,'ru','Мужчина'),(417,120,'ru','Женщина'),(418,121,'ru','Имя'),(419,122,'ru','Фамилия'),(420,123,'ru','Skype'),(421,124,'ru','Телефон'),(422,125,'ru','Пол'),(423,126,'ru','День рождения'),(424,127,'ru','Месяц рождения'),(425,128,'ru','Год рождения'),(426,129,'ru','Краткая информация'),(427,130,'ru','Добавить Источник Сообщения'),(428,131,'ru','Категория'),(429,132,'ru','Создать Сообщение'),(430,133,'ru','Создать Новую Категори'),(431,134,'ru','Неизменный'),(432,135,'ru','Перевод Сообщений'),(433,136,'ru','Название Новой Категории'),(434,137,'ru','Выберите группу сообщений и язык для отображения переводов...'),(435,138,'ru','Сообщение'),(436,139,'ru','Обновить Сообщение'),(437,140,'ru','{n, plural, =1{1 запись} other{# записей}}'),(438,141,'ru','Добавить файлы'),(439,142,'ru','Альбом'),(440,143,'ru','Альбомы'),(441,144,'ru','Все Медиа Файлы'),(442,145,'ru','Alt Текст'),(443,146,'ru','Вернуться к файловому менеджеру'),(444,147,'ru','Отменить загрузку'),(445,148,'ru','Категории'),(446,149,'ru','Категория'),(447,150,'ru','Изменения были сохранены.'),(448,151,'ru','Изменения не были сохранены.'),(449,152,'ru','Создать Категорию'),(450,153,'ru','Текущие размеры миниатюр'),(451,154,'ru','Размер'),(452,155,'ru','Перестроить изображения'),(453,156,'ru','Размер файла'),(454,157,'ru','Название файла'),(455,158,'ru','Если вы измените размеры миниатюр, настоятельно рекомендуется перестроить их.'),(456,159,'ru','Настройка изображений'),(457,160,'ru','Большой размер'),(458,161,'ru','Управление альбомами'),(459,162,'ru','Управление Категориями'),(460,163,'ru','Активность Медиа'),(461,164,'ru','Детали'),(462,165,'ru','Медиа'),(463,166,'ru','Средний размер'),(464,167,'ru','Изображения не найдены.'),(465,168,'ru','Оригинал'),(466,169,'ru','Пожалуйста, выберите файл для просмотра деталей.'),(467,170,'ru','Выберите размер файла'),(468,171,'ru','Малый размер'),(469,173,'ru','Начать загрузку'),(470,174,'ru','Настройка миниатюр'),(471,175,'ru','Миниатюры успешно сохранены'),(472,176,'ru','Миниатюры'),(473,177,'ru','Обновить Категорию'),(474,178,'ru','Обновил'),(475,179,'ru','Загрузить файл'),(476,180,'ru','Загрузил'),(477,181,'ru','Меню'),(478,182,'ru','Меню'),(479,183,'ru','ID ссылки может содержать только строчные буквы, цифры, подчеркивание и тире.'),(480,184,'ru','Родительская Ссылка'),(481,185,'ru','Всегда Видимый'),(482,186,'ru','Нет Родительской Ссылка'),(483,187,'ru','Создать Ссылку'),(484,188,'ru','Обновить Ссылка'),(485,189,'ru','Ссылки'),(486,190,'ru','Добавить Меню'),(487,191,'ru','Добавить Ссылку'),(488,192,'ru','Ошибка при сохранении меню!'),(489,193,'ru','Изменения были успешно сохранены.'),(490,194,'ru','Пожалуйста, выберите меню для просмотра списка ссылок...'),(491,195,'ru','Выбранное меню не содержит ни одной ссылки. Нажмите кнопку \"Добавить Ссылку\", чтобы создать новую ссылку для этого меню.'),(492,196,'ru','Страница'),(493,197,'ru','Страницы'),(494,198,'ru','Cоздать Страницу'),(495,202,'ru','Запись'),(496,203,'ru','Опубликировано в категории'),(497,204,'ru','Активность Записей'),(498,205,'ru','Записи'),(499,208,'ru','Эскиз'),(500,307,'ru','Создать SEO запись'),(501,308,'ru','Следовать ссылке'),(502,309,'ru','Индексировать'),(503,310,'ru','Ключевые слова'),(504,311,'ru','SEO'),(505,312,'ru','Поисковая оптимизация'),(506,313,'ru','Обновить SEO запись'),(507,209,'ru','Общие Настройки'),(508,210,'ru','Настройки Чтения'),(509,211,'ru','Название Сайт'),(510,212,'ru','Описание Сайта'),(511,213,'ru','E-mail Администратора'),(512,214,'ru','Часовой Пояс'),(513,215,'ru','Формат Даты'),(514,216,'ru','Формат Времени'),(515,217,'ru','Записей на странице'),(516,218,'ru','Включенные права доступа'),(517,219,'ru','Включенные роли'),(518,220,'ru','Создать Группу Прав Доступа'),(519,221,'ru','Создать Право Доступа'),(520,222,'ru','Создать Роль'),(521,223,'ru','Создать Пользователя'),(522,224,'ru','Посещение №{id}'),(523,225,'ru','Пользователей не найдено.'),(524,226,'ru','Пароль'),(525,227,'ru','Группы Прав Доступа'),(526,228,'ru','Прав Доступа'),(527,229,'ru','Права доступа для роли \"{role}\"'),(528,230,'ru','Права доступа'),(529,231,'ru','Обновить пути'),(530,232,'ru','Дата регистрации'),(531,233,'ru','Роль'),(532,234,'ru','Роли и Права доступа для \"{user}\"'),(533,235,'ru','Роли'),(534,236,'ru','Маршруты'),(535,237,'ru','Поиск маршрутов'),(536,238,'ru','Показать все'),(537,239,'ru','Показать только избранные'),(538,240,'ru','Обновить Группу прав доступа'),(539,241,'ru','Обновить право доступа'),(540,242,'ru','Обновить Роль'),(541,243,'ru','Обновить Пароль пользователя'),(542,244,'ru','Обновить пользователя'),(543,245,'ru','Пользователь не найден'),(544,246,'ru','Пользователь'),(545,247,'ru','Пользователи'),(546,248,'ru','Лог Посещения'),(547,249,'ru','Вы не можете изменить собственные права доступа'),(548,250,'ru','Вы не можете изменить собственные права доступа!'),(549,251,'ru','Настройки прав доступа \"{permission}\"'),(550,252,'ru','Настройки роли \"{permission}\"'),(551,333,'ru','Главная'),(552,334,'ru','АИС'),(553,335,'ru','Отчество'),(554,336,'ru','СНИЛС'),(555,337,'ru','Дополнительный телефон'),(556,338,'ru','Связка Логин и E-mail не найдена.'),(558,340,'ru','Перейдите по ссылке, чтобы подтвердить свой email:'),(559,341,'ru','Для сброса пароля перейдите по ссылке ниже:'),(560,342,'ru','Здравствуйте:'),(561,343,'ru','Здравствуйте, вы зарегистрированы на'),(562,344,'ru','Следуйте этой ссылке, чтобы подтвердить свой email и активировать аккаунт:'),(563,345,'ru','Кэш был очищен.'),(564,346,'ru','Не удалось очистить кэш.'),(565,347,'ru','Настройки сохранены.'),(566,348,'ru','Вход'),(567,349,'ru','Пользователь в системе не найден или заблокирован.'),(568,350,'ru','Страница не найдена.'),(569,351,'ru','Регистрация - поиск пользователя'),(570,352,'ru','Нет такой даты {birth_date}'),(571,353,'ru','Формат ввода даты {birth_date} не верен'),(572,354,'ru','Дата рождения'),(573,355,'ru','Служащий'),(574,356,'ru','Преподаватель'),(575,357,'ru','Ученик'),(576,358,'ru','Родитель'),(577,359,'ru','Категория'),(578,360,'ru','Проверьте ваш e-mail {email} для дальнейших инструкций'),(579,361,'ru','После изменения E-mail потребуется подтверждение'),(580,362,'ru','Вводите только Русские буквы'),(581,363,'ru','Менеджер БД'),(582,364,'ru','Дамп'),(583,365,'ru','Размер'),(584,366,'ru','Создан'),(585,367,'ru','Импорт'),(586,368,'ru','Загрузить'),(587,369,'ru','Удалить'),(588,370,'ru','Дамп базы данных будут удален. Вы уверены?'),(589,371,'ru','Создать дамп'),(590,372,'ru','Все записи базы данных будут перезаписаны. Вы уверены?'),(591,373,'ru','Введите СНИЛС согласно маске');
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_source`
--

DROP TABLE IF EXISTS `message_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_source` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(32) NOT NULL,
  `message` text,
  `immutable` int(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=374 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_source`
--

LOCK TABLES `message_source` WRITE;
/*!40000 ALTER TABLE `message_source` DISABLE KEYS */;
INSERT INTO `message_source` VALUES (1,'yee','--- With selected ---',1),(2,'yee','Activate',1),(3,'yee','Active',1),(4,'yee','Add New',1),(5,'yee','All',1),(6,'yee','Always Visible',1),(7,'yee','An unknown error occurred.',1),(8,'yee','Approved',1),(9,'yee','Author',1),(10,'yee','Banned',1),(11,'yee','Bind to IP',1),(12,'yee','Browse',1),(13,'yee','Browser',1),(14,'yee','Cancel',1),(15,'yee','Category',1),(16,'yee','Clear filters',1),(17,'yee','Closed',1),(18,'yee','Code',1),(19,'yee','Comment Status',1),(20,'yee','Comments Activity',1),(21,'yee','Confirm',1),(22,'yee','Confirmation Token',1),(23,'yee','Content',1),(24,'yee','Control Panel',1),(25,'yee','Create {item}',1),(26,'yee','Create',1),(27,'yee','Created By',1),(28,'yee','Created',1),(29,'yee','Dashboard',1),(30,'yee','Data',1),(31,'yee','Deactivate',1),(32,'yee','Default Language',1),(33,'yee','Default Value',1),(34,'yee','Delete',1),(35,'yee','Description',1),(36,'yee','E-mail confirmed',1),(37,'yee','E-mail',1),(38,'yee','Edit',1),(39,'yee','Error',1),(40,'yee','For example',1),(41,'yee','Group',1),(42,'yee','ID',1),(43,'yee','IP',1),(44,'yee','Icon',1),(45,'yee','Inactive',1),(46,'yee','Insert',1),(47,'yee','Invalid settings for dashboard widgets',1),(48,'yee','Key',1),(49,'yee','Label',1),(50,'yee','Language',1),(51,'yee','Link ID can only contain lowercase alphanumeric characters, underscores and dashes.',1),(52,'yee','Link',1),(53,'yee','Login',1),(54,'yee','Logout {username}',1),(55,'yee','Menu ID can only contain lowercase alphanumeric characters, underscores and dashes.',1),(56,'yee','Menu',1),(57,'yee','Name',1),(58,'yee','No Parent',1),(59,'yee','No comments found.',1),(60,'yee','Not Selected',1),(61,'yee','OK',1),(62,'yee','OS',1),(63,'yee','Open',1),(64,'yee','Order',1),(65,'yee','PHP Version',1),(66,'yee','Parent Link',1),(67,'yee','Password',1),(68,'yee','Pending',1),(69,'yee','Processing',1),(70,'yee','Publish',1),(71,'yee','Published',1),(72,'yee','Read more',1),(73,'yee','Records per page',1),(74,'yee','Registration IP',1),(75,'yee','Repeat password',1),(76,'yee','Required',1),(77,'yee','Revision',1),(78,'yee','Role',1),(79,'yee','Roles',1),(80,'yee','Rule',1),(81,'yee','Save All',1),(82,'yee','Save',1),(83,'yee','Saved',1),(84,'yee','Settings',1),(85,'yee','Size',1),(86,'yee','Slug',1),(87,'yee','Spam',1),(88,'yee','Start',1),(89,'yee','Status',1),(90,'yee','Superadmin',1),(91,'yee','System Info',1),(92,'yee','The changes have been saved.',1),(93,'yee','This e-mail already exists',1),(94,'yee','Title',1),(95,'yee','Token',1),(96,'yee','Trash',1),(97,'yee','Type',1),(98,'yee','URL',1),(99,'yee','Unpublish',1),(100,'yee','Update \"{item}\"',1),(101,'yee','Update',1),(102,'yee','Updated By',1),(103,'yee','Updated',1),(104,'yee','Uploaded',1),(105,'yee','User agent',1),(106,'yee','User',1),(107,'yee','Username',1),(108,'yee','Value',1),(109,'yee','View',1),(110,'yee','Visible',1),(111,'yee','Visit Time',1),(112,'yee','Wrong format. Enter valid IPs separated by comma',1),(113,'yee','Yee CMS Version',1),(114,'yee','Yee Core Version',1),(115,'yee','Yii Framework Version',1),(116,'yee','Your item has been updated.',1),(117,'yee','Your item has been created.',1),(118,'yee','Your item has been deleted.',1),(119,'yee','Male',1),(120,'yee','Female',1),(121,'yee','First Name',1),(122,'yee','Last Name',1),(123,'yee','Skype',1),(124,'yee','Phone',1),(125,'yee','Gender',1),(126,'yee','Birth day',1),(127,'yee','Birth month',1),(128,'yee','Birth year',1),(129,'yee','Short Info',1),(130,'yee/translation','Add New Source Message',1),(131,'yee/translation','Category',1),(132,'yee/translation','Create Message Source',1),(133,'yee/translation','Create New Category',1),(134,'yee/translation','Immutable',1),(135,'yee/translation','Message Translation',1),(136,'yee/translation','New Category Name',1),(137,'yee/translation','Please, select message group and language to view translations...',1),(138,'yee/translation','Source Message',1),(139,'yee/translation','Update Message Source',1),(140,'yee/translation','{n, plural, =1{1 message} other{# messages}}',1),(141,'yee/media','Add files',1),(142,'yee/media','Album',1),(143,'yee/media','Albums',1),(144,'yee/media','All Media Items',1),(145,'yee/media','Alt Text',1),(146,'yee/media','Back to file manager',1),(147,'yee/media','Cancel upload',1),(148,'yee/media','Categories',1),(149,'yee/media','Category',1),(150,'yee/media','Changes have been saved.',1),(151,'yee/media','Changes haven\'t been saved.',1),(152,'yee/media','Create Category',1),(153,'yee/media','Current thumbnail sizes',1),(154,'yee/media','Dimensions',1),(155,'yee/media','Do resize thumbnails',1),(156,'yee/media','File Size',1),(157,'yee/media','Filename',1),(158,'yee/media','If you change the thumbnails sizes, it is strongly recommended resize image thumbnails.',1),(159,'yee/media','Image Settings',1),(160,'yee/media','Large size',1),(161,'yee/media','Manage Albums',1),(162,'yee/media','Manage Categories',1),(163,'yee/media','Media Activity',1),(164,'yee/media','Media Details',1),(165,'yee/media','Media',1),(166,'yee/media','Medium size',1),(167,'yee/media','No images found.',1),(168,'yee/media','Original',1),(169,'yee/media','Please, select file to view details.',1),(170,'yee/media','Select image size',1),(171,'yee/media','Small size',1),(172,'yee/media','Sorry, [{filetype}] file type is not permitted!',1),(173,'yee/media','Start upload',1),(174,'yee/media','Thumbnails settings',1),(175,'yee/media','Thumbnails sizes has been resized successfully!',1),(176,'yee/media','Thumbnails',1),(177,'yee/media','Update Category',1),(178,'yee/media','Updated By',1),(179,'yee/media','Upload New File',1),(180,'yee/media','Uploaded By',1),(181,'yee/menu','Menu',1),(182,'yee/menu','Menus',1),(183,'yee/menu','Link ID can only contain lowercase alphanumeric characters, underscores and dashes.',1),(184,'yee/menu','Parent Link',1),(185,'yee/menu','Always Visible',1),(186,'yee/menu','No Parent',1),(187,'yee/menu','Create Menu Link',1),(188,'yee/menu','Update Menu Link',1),(189,'yee/menu','Menu Links',1),(190,'yee/menu','Add New Menu',1),(191,'yee/menu','Add New Link',1),(192,'yee/menu','An error occurred during saving menu!',1),(193,'yee/menu','The changes have been saved.',1),(194,'yee/menu','Please, select menu to view menu links...',1),(195,'yee/menu','Selected menu doesn\'t contain any link. Click \"Add New Link\" to create a link for this menu.',1),(196,'yee/page','Page',1),(197,'yee/page','Pages',1),(198,'yee/page','Create Page',1),(199,'yee/post','Create Tag',1),(200,'yee/post','Update Tag',1),(201,'yee/post','No posts found.',1),(202,'yee/post','Post',1),(203,'yee/post','Posted in',1),(204,'yee/post','Posts Activity',1),(205,'yee/post','Posts',1),(206,'yee/post','Tag',1),(207,'yee/post','Tags',1),(208,'yee/post','Thumbnail',1),(209,'yee/settings','General Settings',1),(210,'yee/settings','Reading Settings',1),(211,'yee/settings','Site Title',1),(212,'yee/settings','Site Description',1),(213,'yee/settings','Admin Email',1),(214,'yee/settings','Timezone',1),(215,'yee/settings','Date Format',1),(216,'yee/settings','Time Format',1),(217,'yee/settings','Page Size',1),(218,'yee/user','Child permissions',1),(219,'yee/user','Child roles',1),(220,'yee/user','Create Permission Group',1),(221,'yee/user','Create Permission',1),(222,'yee/user','Create Role',1),(223,'yee/user','Create User',1),(224,'yee/user','Log №{id}',1),(225,'yee/user','No users found.',1),(226,'yee/user','Password',1),(227,'yee/user','Permission Groups',1),(228,'yee/user','Permission',1),(229,'yee/user','Permissions for \"{role}\" role',1),(230,'yee/user','Permissions',1),(231,'yee/user','Refresh routes',1),(232,'yee/user','Registration date',1),(233,'yee/user','Role',1),(234,'yee/user','Roles and Permissions for \"{user}\"',1),(235,'yee/user','Roles',1),(236,'yee/user','Routes',1),(237,'yee/user','Search route',1),(238,'yee/user','Show all',1),(239,'yee/user','Show only selected',1),(240,'yee/user','Update Permission Group',1),(241,'yee/user','Update Permission',1),(242,'yee/user','Update Role',1),(243,'yee/user','Update User Password',1),(244,'yee/user','Update User',1),(245,'yee/user','User not found',1),(246,'yee/user','User',1),(247,'yee/user','Users',1),(248,'yee/user','Visit Log',1),(249,'yee/user','You can not change own permissions',1),(250,'yee/user','You can\'t update own permissions!',1),(251,'yee/user','{permission} Permission Settings',1),(252,'yee/user','{permission} Role Settings',1),(253,'yee/auth','Are you sure you want to delete your profile picture?',1),(254,'yee/auth','Are you sure you want to unlink this authorization?',1),(255,'yee/auth','Authentication error occurred.',1),(256,'yee/auth','Authorization',1),(257,'yee/auth','Authorized Services',1),(258,'yee/auth','Captcha',1),(259,'yee/auth','Change profile picture',1),(260,'yee/auth','Check your E-mail for further instructions',1),(261,'yee/auth','Check your e-mail {email} for instructions to activate account',1),(262,'yee/auth','Click to connect with service',1),(263,'yee/auth','Click to unlink service',1),(264,'yee/auth','Confirm E-mail',1),(265,'yee/auth','Confirm',1),(266,'yee/auth','Could not send confirmation email',1),(267,'yee/auth','Current password',1),(268,'yee/auth','E-mail confirmation for',1),(269,'yee/auth','E-mail {email} confirmed',1),(270,'yee/auth','E-mail is invalid',1),(271,'yee/auth','E-mail with activation link has been sent to <b>{email}</b>. This link will expire in {minutes} min.',1),(272,'yee/auth','E-mail',1),(273,'yee/auth','Forgot password?',1),(274,'yee/auth','Incorrect username or password',1),(275,'yee/auth','Login has been taken',1),(276,'yee/auth','Login',1),(277,'yee/auth','Logout',1),(278,'yee/auth','Non Authorized Services',1),(279,'yee/auth','Password has been updated',1),(280,'yee/auth','Password recovery',1),(281,'yee/auth','Password reset for',1),(282,'yee/auth','Password',1),(283,'yee/auth','Registration - confirm your e-mail',1),(284,'yee/auth','Registration',1),(285,'yee/auth','Remember me',1),(286,'yee/auth','Remove profile picture',1),(287,'yee/auth','Repeat password',1),(288,'yee/auth','Reset Password',1),(289,'yee/auth','Reset',1),(290,'yee/auth','Save Profile',1),(291,'yee/auth','Save profile picture',1),(292,'yee/auth','Set Password',1),(293,'yee/auth','Set Username',1),(294,'yee/auth','Signup',1),(295,'yee/auth','This E-mail already exists',1),(296,'yee/auth','Token not found. It may be expired',1),(297,'yee/auth','Token not found. It may be expired. Try reset password once more',1),(298,'yee/auth','Too many attempts',1),(299,'yee/auth','Unable to send message for email provided',1),(300,'yee/auth','Update Password',1),(301,'yee/auth','User Profile',1),(302,'yee/auth','User with the same email as in {client} account already exists but isn\'t linked to it. Login using email first to link it.',1),(303,'yee/auth','The username should contain only Latin letters, numbers and the following characters: \"-\" and \"_\".',1),(304,'yee/auth','Username contains not allowed characters or words.',1),(305,'yee/auth','Wrong password',1),(306,'yee/auth','You could not login from this IP',1),(307,'yee/seo','Create SEO Record',1),(308,'yee/seo','Follow',1),(309,'yee/seo','Index',1),(310,'yee/seo','Keywords',1),(311,'yee/seo','SEO',1),(312,'yee/seo','Search Engine Optimization',1),(313,'yee/seo','Update SEO Record',1),(314,'yee/eav','An error occurred during creation of EavValue record.',1),(315,'yee/eav','An error occurred during saving EAV attributes!',1),(316,'yee/eav','Attribute Options',1),(317,'yee/eav','Attribute Types',1),(318,'yee/eav','Attribute',1),(319,'yee/eav','Attributes',1),(320,'yee/eav','Available Attributes',1),(321,'yee/eav','Custom Fields',1),(322,'yee/eav','EAV',1),(323,'yee/eav','Entity Models',1),(324,'yee/eav','Entity was not found.',1),(325,'yee/eav','Entity',1),(326,'yee/eav','Model was not found.',1),(327,'yee/eav','Model',1),(328,'yee/eav','Option',1),(329,'yee/eav','Raw',1),(330,'yee/eav','Selected Attributes',1),(333,'yee','Home',1),(334,'yee','AIS',1),(335,'yee','Middle Name',0),(336,'yee','Snils',0),(337,'yee','Phone Optional',0),(338,'yee/auth','A Login and E-mail not found.',0),(340,'yee/mail','Follow the link below to confirm your email:',0),(341,'yee/mail','Follow the link below to reset your password:',0),(342,'yee/mail','Hello:',0),(343,'yee/mail','Hello, you have been registered on:',0),(344,'yee/mail','Follow this link to confirm your E-mail and activate account:',0),(345,'yee','Cache has been flushed.',0),(346,'yee','Failed to flush cache.',0),(347,'yee','Your settings have been saved.',0),(348,'yee/auth','Enter',0),(349,'yee/auth','User not found or blocked in the system.',0),(350,'yee','Page not found.',0),(351,'yee/auth','Registration - user search',0),(352,'yee','There is no such date {birth_date}',0),(353,'yee','The format of the date input {birth_date} invalid',0),(354,'yee','Birth Date',0),(355,'yee','Staff',0),(356,'yee','Teacher',0),(357,'yee','Student',0),(358,'yee','Parent',0),(359,'yee','User Category',0),(360,'yee/auth','Check your e-mail {email} for further instructions',0),(361,'yee/auth','After changing the E-mail confirmation is required',0),(362,'yee','Only need to enter Russian letters',0),(363,'yee/db','DB manager',0),(364,'yee/db','Dump',0),(365,'yee/db','Size',0),(366,'yee/db','Create time',0),(367,'yee/db','Import',0),(368,'yee/db','Download',0),(369,'yee/db','Delete',0),(370,'yee/db','The database dump will be deleted. Are you sure?',0),(371,'yee/db','Create dump',0),(372,'yee/db','All database entries will be overwritten. Are you sure?',0),(373,'yee','Enter the social security number according to the mask',0);
/*!40000 ALTER TABLE `message_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migration`
--

DROP TABLE IF EXISTS `migration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `alias` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migration`
--

LOCK TABLES `migration` WRITE;
/*!40000 ALTER TABLE `migration` DISABLE KEYS */;
INSERT INTO `migration` VALUES ('m000000_000000_base','@app/migrations',1530777667),('m130524_201442_init','@app/migrations',1530777672),('m141106_185632_log_init','@yii/log/migrations/',1537257131),('m150319_150657_alter_user_table','@yeesoft/yii2-yee-core/migrations/',1530777673),('m150319_155941_init_yee_core','@yeesoft/yii2-yee-core/migrations/',1530777677),('m150319_184824_init_settings','@yeesoft/yii2-yee-core/migrations/',1530777677),('m150319_194321_init_menus','@yeesoft/yii2-yee-core/migrations/',1530777681),('m150320_102452_init_translations','@yeesoft/yii2-yee-translation/migrations/',1530777682),('m150628_124401_create_media_table','@yeesoft/yii2-yee-media/migrations/',1530777688),('m150630_121101_create_post_table','@yeesoft/yii2-yee-post/migrations/',1530777693),('m150703_182055_create_auth_table','@yeesoft/yii2-yee-auth/migrations/',1530777694),('m150706_175101_create_comment_table','@yeesoft/yii2-comments/migrations/',1530777694),('m150719_154955_add_setting_menu_links','@yeesoft/yii2-yee-settings/migrations/',1530777694),('m150719_182533_add_menu_and_links','@yeesoft/yii2-yee-menu/migrations/',1530777694),('m150727_175300_add_comments_menu_links','@yeesoft/yii2-yee-comment/migrations/',1530777694),('m150729_121634_add_user_menu_links','@yeesoft/yii2-yee-user/migrations/',1530777694),('m150729_122614_add_post_menu_links','@yeesoft/yii2-yee-post/migrations/',1530777694),('m150729_131014_add_media_menu_links','@yeesoft/yii2-yee-media/migrations/',1530777694),('m150731_150101_create_page_table','@yeesoft/yii2-yee-page/migrations/',1530777695),('m150731_150644_add_page_menu_links','@yeesoft/yii2-yee-page/migrations/',1530777695),('m150821_140141_add_core_permissions','@yeesoft/yii2-yee-core/migrations/',1530777695),('m150825_202231_add_post_permissions','@yeesoft/yii2-yee-post/migrations/',1530777696),('m150825_205531_add_user_permissions','@yeesoft/yii2-yee-user/migrations/',1530777696),('m150825_211322_add_menu_permissions','@yeesoft/yii2-yee-menu/migrations/',1530777696),('m150825_212310_add_settings_permissions','@yeesoft/yii2-yee-settings/migrations/',1530777696),('m150825_212941_add_comments_permissions','@yeesoft/yii2-yee-comment/migrations/',1530777696),('m150825_213610_add_media_permissions','@yeesoft/yii2-yee-media/migrations/',1530777696),('m150825_220620_add_page_permissions','@yeesoft/yii2-yee-page/migrations/',1530777696),('m151116_212614_add_translations_menu_links','@yeesoft/yii2-yee-translation/migrations/',1530777696),('m151121_091144_i18n_yee_source','@yeesoft/yii2-yee-core/migrations/',1530777696),('m151121_131210_add_translation_permissions','@yeesoft/yii2-yee-translation/migrations/',1530777696),('m151121_184634_i18n_yee_translation_source','@yeesoft/yii2-yee-translation/migrations/',1530777696),('m151121_225504_i18n_yee_media_source','@yeesoft/yii2-yee-media/migrations/',1530777696),('m151121_232115_i18n_yee_menu_source','@yeesoft/yii2-yee-menu/migrations/',1530777696),('m151121_233615_i18n_yee_page_source','@yeesoft/yii2-yee-page/migrations/',1530777696),('m151121_233715_i18n_yee_post_source','@yeesoft/yii2-yee-post/migrations/',1530777696),('m151121_235015_i18n_yee_settings_source','@yeesoft/yii2-yee-settings/migrations/',1530777696),('m151121_235512_i18n_yee_user_source','@yeesoft/yii2-yee-user/migrations/',1530777696),('m151126_061233_i18n_yee_auth_source','@yeesoft/yii2-yee-auth/migrations/',1530777696),('m151226_230101_create_seo_table','@yeesoft/yii2-yee-seo/migrations/',1530777697),('m151226_231101_add_seo_menu_links','@yeesoft/yii2-yee-seo/migrations/',1530777697),('m151226_233401_add_seo_permissions','@vendor/yeesoft/yii2-yee-seo/migrations/',1538126970),('m151226_234401_i18n_yee_seo_source','@yeesoft/yii2-yee-seo/migrations/',1530777697),('m160207_123123_add_super_parent_id','@yeesoft/yii2-comments/migrations/',1530777698),('m160325_140543_init_eav','@vendor/yeesoft/yii2-yee-eav/migrations/',1531131047),('m160325_142311_add_eav_menu_links','@vendor/yeesoft/yii2-yee-eav/migrations/',1531131047),('m160325_143610_add_eav_permissions','@vendor/yeesoft/yii2-yee-eav/migrations/',1531131047),('m160325_144849_i18n_yee_eav_source','@vendor/yeesoft/yii2-yee-eav/migrations/',1531131047),('m160414_212551_add_view_page','@yeesoft/yii2-yee-page/migrations/',1530777699),('m160414_212558_add_view_post','@yeesoft/yii2-yee-post/migrations/',1530777700),('m160419_092310_i18n_ru_yee','@vendor/yeesoft/yee-i18n/ru/',1535708684),('m160419_122314_i18n_ru_init_demo','@vendor/yeesoft/yee-i18n/ru/',1535708684),('m160419_143242_i18n_ru_menu_comments','@vendor/yeesoft/yee-i18n/ru/',1535708684),('m160419_143310_i18n_ru_menu_core','@vendor/yeesoft/yee-i18n/ru/',1535708684),('m160419_143742_i18n_ru_menu_media','@vendor/yeesoft/yee-i18n/ru/',1535708684),('m160419_143915_i18n_ru_menu_menu','@vendor/yeesoft/yee-i18n/ru/',1535708684),('m160419_144310_i18n_ru_menu_page','@vendor/yeesoft/yee-i18n/ru/',1535708684),('m160419_144654_i18n_ru_menu_post','@vendor/yeesoft/yee-i18n/ru/',1535708684),('m160419_144710_i18n_ru_menu_setting','@vendor/yeesoft/yee-i18n/ru/',1535708684),('m160419_145050_i18n_ru_menu_translations','@vendor/yeesoft/yee-i18n/ru/',1535708684),('m160419_145301_i18n_ru_menu_user','@vendor/yeesoft/yee-i18n/ru/',1535708684),('m160419_210059_i18n_ru_yee_translation','@vendor/yeesoft/yee-i18n/ru/',1535708684),('m160419_225904_i18n_ru_yee_media','@vendor/yeesoft/yee-i18n/ru/',1535708684),('m160419_232223_i18n_ru_yee_menu','@vendor/yeesoft/yee-i18n/ru/',1535708685),('m160419_233713_i18n_ru_yee_page','@vendor/yeesoft/yee-i18n/ru/',1535708685),('m160419_233813_i18n_ru_yee_post','@vendor/yeesoft/yee-i18n/ru/',1535708685),('m160419_234401_i18n_ru_yee_seo','@vendor/yeesoft/yee-i18n/ru/',1535708685),('m160419_235120_i18n_ru_yee_settings','@vendor/yeesoft/yee-i18n/ru/',1535708685),('m160419_235601_i18n_ru_menu_seo','@vendor/yeesoft/yee-i18n/ru/',1535708685),('m160419_235643_i18n_ru_yee_user','@vendor/yeesoft/yee-i18n/ru/',1535708685),('m160426_122854_create_uploader_images_table','@yeesoft/yii2-yee-media/migrations/',1530777701),('m160530_224510_add_url_field','@yeesoft/yii2-comments/migrations/',1530777701),('m160605_214907_create_tag_table','@yeesoft/yii2-yee-post/migrations/',1530777704),('m160605_215105_init_tag_settings','@yeesoft/yii2-yee-post/migrations/',1530777704),('m160610_120101_init_demo','@app/migrations',1530777704),('m160716_173208_changelogs','@vendor/cranky4/change-log-behavior/src/migrations',1537269028),('m160831_224932_alter_user_table','@yeesoft/yii2-yee-core/migrations/',1530777709),('m160903_113810_update_auth_foreign_key','@yeesoft/yii2-yee-auth/migrations/',1530777710),('m170306_083010_tests','@artmarkov/mytest/migrations',1537367447);
/*!40000 ALTER TABLE `migration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `option`
--

DROP TABLE IF EXISTS `option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `option` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `name` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `option`
--

LOCK TABLES `option` WRITE;
/*!40000 ALTER TABLE `option` DISABLE KEYS */;
INSERT INTO `option` VALUES (4,'Третья строка\r\n'),(5,'4 чтрока'),(6,'5 срока'),(7,'6 строка\r\n'),(8,'3 строка'),(9,'7 строка\r\n'),(10,'10 строка'),(11,'11 строка\r\n'),(12,'12 строка'),(13,'14 строка\r\n'),(14,'16'),(15,'17'),(16,'18'),(17,'20'),(18,''),(19,'22'),(20,'23'),(21,'24'),(22,'25'),(25,'11111111111111111'),(26,'111111'),(28,'28'),(29,'');
/*!40000 ALTER TABLE `option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page`
--

DROP TABLE IF EXISTS `page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '0-pending,1-published',
  `comment_status` int(1) NOT NULL DEFAULT '1' COMMENT '0-closed,1-open',
  `published_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `revision` int(1) NOT NULL DEFAULT '1',
  `view` varchar(255) NOT NULL DEFAULT 'page',
  `layout` varchar(255) NOT NULL DEFAULT 'main',
  PRIMARY KEY (`id`),
  KEY `page_slug` (`slug`),
  KEY `page_status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page`
--

LOCK TABLES `page` WRITE;
/*!40000 ALTER TABLE `page` DISABLE KEYS */;
INSERT INTO `page` VALUES (1,'test',1,1,1535932800,1535967573,1535967573,4,4,1,'page','main'),(2,'confidentiality-agreemen',1,1,1535932800,1535967607,1535967607,4,4,1,'page','main');
/*!40000 ALTER TABLE `page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_lang`
--

DROP TABLE IF EXISTS `page_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) NOT NULL,
  `language` varchar(6) NOT NULL,
  `title` text,
  `content` text,
  PRIMARY KEY (`id`),
  KEY `page_lang_post_id` (`page_id`),
  KEY `page_lang_language` (`language`),
  CONSTRAINT `fk_page_lang` FOREIGN KEY (`page_id`) REFERENCES `page` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_lang`
--

LOCK TABLES `page_lang` WRITE;
/*!40000 ALTER TABLE `page_lang` DISABLE KEYS */;
INSERT INTO `page_lang` VALUES (1,1,'ru','Правила входа в Личный кабинет','<p style=\"box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: \'Source Sans Pro\', \'Helvetica Neue\', Helvetica, Arial, sans-serif;\">Заходя в личный кабинет АИС \"Школа Искусств\" (в дальнейшем «мы», «наш», «АИС \"Школа Искусств\"», вы подтверждаете своё согласие со следующими условиями. Если вы не согласны с ними, пожалуйста, не заходите и не пользуйтесь личным кабинетом АИС \"Школа Искусств\". Мы оставляем за собой право изменять эти правила в любое время и сделаем всё возможное, чтобы уведомить вас об этом, однако с вашей стороны было бы разумным регулярно просматривать этот текст на предмет изменений, так как использование ресурса АИС \"Школа Искусств\" после обновления/исправления условий означает ваше согласие с ними.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: \'Source Sans Pro\', \'Helvetica Neue\', Helvetica, Arial, sans-serif;\">Вы соглашаетесь не размещать оскорбительных, угрожающих, клеветнических сообщений, порнографических сообщений, призывов к национальной розни и прочих сообщений, которые могут нарушить законы вашей страны, страны, которая предоставляет услуги хостинга для АИС \"Школа Искусств\" или международное право. Попытки размещения таких сообщений могут привести к вашему немедленному отключению от системы АИС \"Школа Искусств\".</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: \'Source Sans Pro\', \'Helvetica Neue\', Helvetica, Arial, sans-serif;\">Вы соглашаетесь с тем, что администраторы АИС \"Школа Искусств\" имеют право удалить, отредактировать, перенести или удалить любую информацию в любое время по своему усмотрению. Как пользователь вы согласны с тем, что введённая вами информация будет храниться в базе данных. Хотя эта информация не будет открыта третьим лицам без вашего разрешения, администрация АИС \"Школа Искусств\" не может быть ответственна за действия хакеров, которые могут привести к несанкционированному доступу к ней.</p>\r\n<p> </p>'),(2,2,'ru','Соглашение конфиденциальности','<p style=\"box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: \'Source Sans Pro\', \'Helvetica Neue\', Helvetica, Arial, sans-serif;\">Это соглашение подробно объясняет, как АИС \"Школа Искусств\" (в дальнейшем «мы», «наш», АИС \"Школа Искусств\" используют информацию, полученную во время любой из ваших пользовательских сессий (в дальнейшем «ваша информация»).</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: \'Source Sans Pro\', \'Helvetica Neue\', Helvetica, Arial, sans-serif;\">Ваша информация собирается двумя способами. Во-первых, просмотр информации АИС \"Школа Искусств\" приведёт к созданию программным обеспечением определённого числа cookies (небольшие текстовые файлы, загружаемые в папку временных файлов вашего браузера). Первые две cookie содержат только идентификатор пользователя (в дальнейшем «user-id») и идентификатор анонимной сессии (в дальнейшем «session-id»), автоматически присвоенные вам программным обеспечением.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: \'Source Sans Pro\', \'Helvetica Neue\', Helvetica, Arial, sans-serif;\">Также во время просмотра информации АИС \"Школа Искусств\" мы можем установить cookies, внешние по отношению к программному обеспечению, однако они выходят за рамки этого документа, целью которого является рассмотрение страниц, созданных исключительно программным обеспечением. Вторым источником получения вашей информации являются данные, которые вы отправляете на АИС \"Школа Искусств\". Этими данными могут быть, но не исчерпываются, следующие данные: данные, указанные при регистрации в АИС \"Школа Искусств\" (в дальнейшем «ваша учётная запись») и сообщения, оставленные вами после регистрации и авторизации (в дальнейшем «ваши сообщения»).</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: \'Source Sans Pro\', \'Helvetica Neue\', Helvetica, Arial, sans-serif;\">Ваша учётная запись будет содержать, как минимум, однозначно идентифицируемое имя (в дальнейшем «ваше имя пользователя»), индивидуальный пароль для входа под вашей учётной записью (далее «ваш пароль») и реальный адрес email (в дальнейшем «ваш адрес email»). Ваша информация из вашей учётной записи на АИС \"Школа Искусств\" охраняется законами о защите компьютерной информации, применяемыми в стране, предоставляющей нам услуги хостинга. Любая информация, запрашиваемая при регистрации в АИС \"Школа Искусств\", кроме вашего имени пользователя, вашего пароля и вашего адреса email, может быть как необходимой, так и необязательной ко вводу, на усмотрение администрации АИС \"Школа Искусств\". В любом случае у вас есть возможность выбрать, какая информация из вашей учётной записи будет общедоступна.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: \'Source Sans Pro\', \'Helvetica Neue\', Helvetica, Arial, sans-serif;\">Ваш пароль надёжно зашифрован (односторонним хэшированием). Однако не рекомендуется использовать этот же самый пароль, регистрируясь на других сайтах. Ваш пароль является средством доступа к вашей учётной записи на АИС \"Школа Искусств\", пожалуйста, храните его в тайне, ни при каких обстоятельствах ни представители АИС \"Школа Искусств\", ни другое третье лицо не вправе спрашивать ваш пароль. В случае, если вы забудете ваш пароль к вашей учётной записи, вы сможете воспользоваться функцией восстановления пароля «Забыли пароль?», предусмотренной программным обеспечением. Вам будет необходимо ввести ваше имя пользователя и ваш адрес email, после чего программное обеспечение сгенерирует вам новый пароль для вашей учётной записи.</p>');
/*!40000 ALTER TABLE `page_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '0-pending,1-published',
  `comment_status` int(1) NOT NULL DEFAULT '1' COMMENT '0-closed,1-open',
  `thumbnail` varchar(255) DEFAULT NULL,
  `published_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `revision` int(1) NOT NULL DEFAULT '1',
  `view` varchar(255) NOT NULL DEFAULT 'post',
  `layout` varchar(255) NOT NULL DEFAULT 'main',
  PRIMARY KEY (`id`),
  KEY `post_slug` (`slug`),
  KEY `post_category_id` (`category_id`),
  KEY `post_status` (`status`),
  KEY `fk_page_created_by` (`created_by`),
  KEY `fk_page_updated_by` (`updated_by`),
  CONSTRAINT `fk_page_created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_page_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_post_category_id` FOREIGN KEY (`category_id`) REFERENCES `post_category` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,'main',NULL,10,1,'',1535241600,1535967794,1536222529,4,4,10,'post','main');
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_category`
--

DROP TABLE IF EXISTS `post_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(200) NOT NULL,
  `visible` int(11) NOT NULL DEFAULT '1' COMMENT '0-hidden,1-visible',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `left_border` int(11) NOT NULL,
  `right_border` int(11) NOT NULL,
  `depth` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `post_category_slug` (`slug`),
  KEY `post_category_visible` (`visible`),
  KEY `left_border` (`left_border`,`right_border`),
  KEY `right_border` (`right_border`),
  KEY `fk_post_category_created_by` (`created_by`),
  KEY `fk_post_category_updated_by` (`updated_by`),
  CONSTRAINT `fk_post_category_created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_post_category_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_category`
--

LOCK TABLES `post_category` WRITE;
/*!40000 ALTER TABLE `post_category` DISABLE KEYS */;
INSERT INTO `post_category` VALUES (1,'root\r\n',0,1530173848,0,NULL,NULL,0,2147483647,0);
/*!40000 ALTER TABLE `post_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_category_lang`
--

DROP TABLE IF EXISTS `post_category_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post_category_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_category_id` int(11) DEFAULT NULL,
  `language` varchar(6) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  KEY `post_category_lang_id` (`post_category_id`),
  KEY `post_category_lang_language` (`language`),
  CONSTRAINT `fk_post_category_lang` FOREIGN KEY (`post_category_id`) REFERENCES `post_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_category_lang`
--

LOCK TABLES `post_category_lang` WRITE;
/*!40000 ALTER TABLE `post_category_lang` DISABLE KEYS */;
INSERT INTO `post_category_lang` VALUES (1,1,'ru','root',NULL);
/*!40000 ALTER TABLE `post_category_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_lang`
--

DROP TABLE IF EXISTS `post_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `language` varchar(6) NOT NULL,
  `title` text,
  `content` text,
  PRIMARY KEY (`id`),
  KEY `post_lang_post_id` (`post_id`),
  KEY `post_lang_language` (`language`),
  CONSTRAINT `fk_post_lang` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_lang`
--

LOCK TABLES `post_lang` WRITE;
/*!40000 ALTER TABLE `post_lang` DISABLE KEYS */;
INSERT INTO `post_lang` VALUES (1,1,'ru','Общая информация','<p>Услуги, предоставляемые школой Школа предоставляет образовательные услуги по видам искусства (музыка, изобразительное искусство, хореография): реализация дополнительных предпрофессиональных общеобразовательных программ в области искусств, реализация дополнительных общеразвивающих общеобразовательных программ в области искусств. Имеется дошкольное отделение и отделение раннего развития по всем направлениям Уровень образования дополнительное образование Формы обучения: бюджетная (музыкальное и изобразительное искусство) и платная по всем направлениям</p>');
/*!40000 ALTER TABLE `post_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_tag`
--

DROP TABLE IF EXISTS `post_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(200) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_tag_slug` (`slug`),
  KEY `fk_post_tag_created_by` (`created_by`),
  KEY `fk_post_tag_updated_by` (`updated_by`),
  CONSTRAINT `fk_post_tag_created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_post_tag_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_tag`
--

LOCK TABLES `post_tag` WRITE;
/*!40000 ALTER TABLE `post_tag` DISABLE KEYS */;
INSERT INTO `post_tag` VALUES (1,'scool-info',1535966927,1535966927,4,4);
/*!40000 ALTER TABLE `post_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_tag_lang`
--

DROP TABLE IF EXISTS `post_tag_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post_tag_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_tag_id` int(11) DEFAULT NULL,
  `language` varchar(6) NOT NULL,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `post_tag_lang_id` (`post_tag_id`),
  KEY `post_tag_lang_language` (`language`),
  CONSTRAINT `fk_post_tag_lang` FOREIGN KEY (`post_tag_id`) REFERENCES `post_tag` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_tag_lang`
--

LOCK TABLES `post_tag_lang` WRITE;
/*!40000 ALTER TABLE `post_tag_lang` DISABLE KEYS */;
INSERT INTO `post_tag_lang` VALUES (1,1,'ru','scool-info');
/*!40000 ALTER TABLE `post_tag_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_tag_post`
--

DROP TABLE IF EXISTS `post_tag_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post_tag_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) DEFAULT NULL,
  `tag_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_post_tag_post_id` (`post_id`),
  KEY `fk_post_tag_tag_id` (`tag_id`),
  CONSTRAINT `fk_post_tag_post_id` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_post_tag_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `post_tag` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_tag_post`
--

LOCK TABLES `post_tag_post` WRITE;
/*!40000 ALTER TABLE `post_tag_post` DISABLE KEYS */;
INSERT INTO `post_tag_post` VALUES (1,1,1);
/*!40000 ALTER TABLE `post_tag_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seo`
--

DROP TABLE IF EXISTS `seo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `author` varchar(127) NOT NULL DEFAULT '',
  `keywords` text,
  `description` text,
  `index` smallint(6) NOT NULL DEFAULT '1',
  `follow` smallint(6) NOT NULL DEFAULT '1',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `url` (`url`),
  UNIQUE KEY `seo_url` (`url`),
  KEY `seo_created_by` (`created_by`),
  KEY `seo_author` (`created_by`),
  KEY `fk_seo_updated_by` (`updated_by`),
  CONSTRAINT `fk_seo_created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_seo_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seo`
--

LOCK TABLES `seo` WRITE;
/*!40000 ALTER TABLE `seo` DISABLE KEYS */;
INSERT INTO `seo` VALUES (1,'/en','Homepage','Site Owner','yii2, cms, yeecms','Seo meta description',1,1,1452544164,1452545049,1,1);
/*!40000 ALTER TABLE `seo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setting`
--

DROP TABLE IF EXISTS `setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group` varchar(64) DEFAULT 'general',
  `key` varchar(64) NOT NULL,
  `language` varchar(6) DEFAULT NULL,
  `value` text,
  `description` text,
  PRIMARY KEY (`id`),
  KEY `setting_group_lang` (`group`,`key`,`language`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setting`
--

LOCK TABLES `setting` WRITE;
/*!40000 ALTER TABLE `setting` DISABLE KEYS */;
INSERT INTO `setting` VALUES (1,'general','title','ru','Школа Искусств',NULL),(2,'general','description','ru','АИС Школа Искусств',NULL),(3,'general','email',NULL,'artmarkov@mail.ru',NULL),(4,'general','timezone',NULL,'Europe/Moscow',NULL),(5,'general','dateformat',NULL,'long',NULL),(6,'general','timeformat',NULL,'HH:mm',NULL);
/*!40000 ALTER TABLE `setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tests`
--

DROP TABLE IF EXISTS `tests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(15) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tests`
--

LOCK TABLES `tests` WRITE;
/*!40000 ALTER TABLE `tests` DISABLE KEYS */;
INSERT INTO `tests` VALUES (1,'1','1'),(2,'2','2');
/*!40000 ALTER TABLE `tests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `user_category` smallint(6) NOT NULL DEFAULT '1',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `superadmin` int(6) DEFAULT '0',
  `registration_ip` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bind_to_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_confirmed` int(1) DEFAULT '0',
  `confirmation_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar` text COLLATE utf8_unicode_ci,
  `first_name` varchar(124) COLLATE utf8_unicode_ci DEFAULT NULL,
  `middle_name` varchar(124) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(124) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birth_timestamp` int(11) DEFAULT NULL,
  `gender` int(1) DEFAULT NULL,
  `phone` varchar(24) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_optional` varchar(24) COLLATE utf8_unicode_ci DEFAULT NULL,
  `skype` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `info` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `snils` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_key` (`auth_key`),
  UNIQUE KEY `password_reset_token` (`password_reset_token`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','','$2y$13$K3IKo3DnnP8XKe8/av4nFeonLUBj6dYbI3laoP/RNG5S3lR7Jkr2O',NULL,'artmarkov@mail.ru',10,1,0,1536666647,0,NULL,'',1,NULL,'','Артур','Владимирович','Марков',39301200,1,'+7 (905) 540 07 46','',NULL,'',''),(2,'moder','nQmLWUJSvnvbTd2rbnUMsI0FqNZ4FfXF','$2y$13$2EyTrZHZm3b.SW0q3bUZeephX96nJmFNGncElL.f.UdBm1ainSwoy',NULL,'moder@test.ru',10,1,1534834593,1537261770,0,'127.0.0.1','',0,NULL,NULL,'','','',NULL,0,'','',NULL,'',''),(3,'markov-av','a9mKxr9qlZBTqWe9UujFhBAJhUJdkUTB','$2y$13$0Wd5GfFhBBjS78neY7ClsuJ8Oh8rKqe/27mZdQhd0TiSMPqAlUZW6',NULL,'artmarkov@mail.ru',10,2,1534834683,1538560511,0,'127.0.0.1','',1,NULL,'','Артур','Владимирович','Марков',39301200,0,'+7 (111) 111 11 11','',NULL,'',''),(4,'superadmin','xpOc8O7EpWBTSBLQ27HtpTy41q73_Y_u','$2y$13$PbiA30sN63gCaq1O6SJdaO5SycW0AupC2cZKEiTDEhxiQr5rVHsdS',NULL,'artmarkov@mail.ru',10,1,1534863572,1538554175,1,'127.0.0.1','',0,NULL,'{\"small\":\"\\/uploads\\/avatar\\/avatar_4_1538144607-48x48.jpg\",\"medium \":\"\\/uploads\\/avatar\\/avatar_4_1538144607-96x96.jpg\",\"large\":\"\\/uploads\\/avatar\\/avatar_4_1538144607-144x144.jpg\"}','Артур','Владимирович','Марков',39301200,1,'+7 (905) 540 07 46','+7 (910) 772 45 37',NULL,'33','111-111-111 11'),(12,'markov-a','xnFGa6TdYUZGs-lu7p7qk_2CnTkmhQyt','$2y$13$0.nnMNjmaEVW7iIwoOtNHuS.kwXe9bfVegKKr0qwZgklwdqXnY6Fu',NULL,'artmarkov@mail.ru',10,3,1536650221,1537884439,0,'127.0.0.1','',1,NULL,NULL,'Артур','','Марков',39301200,1,'+7 (111) 111 11 11','',NULL,'','111-111-111 11'),(13,'','hfOZzZZP4KeSQhXklo0TQFaFeSLQ9JLE','',NULL,'',1,2,1536671495,1538122434,0,'127.0.0.1','',1,NULL,NULL,'Иван','Иванович','Иванов',34203600,0,'+7 (111) 111 11 11','',NULL,'','111-111-111 11');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_setting`
--

DROP TABLE IF EXISTS `user_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` text,
  PRIMARY KEY (`id`),
  KEY `user_setting_user_key` (`user_id`,`key`),
  CONSTRAINT `fk_user_id_user_setting_table` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_setting`
--

LOCK TABLES `user_setting` WRITE;
/*!40000 ALTER TABLE `user_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_visit_log`
--

DROP TABLE IF EXISTS `user_visit_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_visit_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `language` varchar(5) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `browser` varchar(30) NOT NULL,
  `os` varchar(20) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `visit_time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `visit_log_user_id` (`user_id`),
  CONSTRAINT `fk_user_id_user_visit_log_table` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=352 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_visit_log`
--

LOCK TABLES `user_visit_log` WRITE;
/*!40000 ALTER TABLE `user_visit_log` DISABLE KEYS */;
INSERT INTO `user_visit_log` VALUES (1,'5b3dd0d1438d2','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',1,1530777809),(2,'5b3e23c09fb95','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',1,1530799040),(3,'5b45b595d6265','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',1,1531295125),(4,'5b5ec0fd68a6b','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',1,1532936445),(5,'5b642d20b2cb8','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',1,1533291808),(6,'5b685306cdf77','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',1,1533563654),(7,'5b7577e00ea96','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',1,1534425056),(8,'5b7a632f2e6aa','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',1,1534747439),(9,'5b7a87cac20cb','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',1,1534756810),(10,'5b7a89d3da26b','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',1,1534757331),(11,'5b7a8a58b74cb','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',1,1534757464),(12,'5b7a8a92dd2a6','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',1,1534757522),(13,'5b7a8ce17a22d','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',1,1534758113),(14,'5b7a8d2f3e0af','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',1,1534758191),(15,'5b7a8d4c7493e','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',1,1534758220),(16,'5b7a8e2731bac','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',1,1534758439),(17,'5b7a8e9a6d485','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',1,1534758554),(18,'5b7a96e27ce98','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',1,1534760674),(19,'5b7a9745c8e9b','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',1,1534760773),(20,'5b7a9a9723731','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',1,1534761623),(21,'5b7ac14def52d','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',1,1534771533),(22,'5b7ac2fb8e7a4','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',1,1534771963),(23,'5b7acc532d80f','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',1,1534774355),(24,'5b7ad18e681c6','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',1,1534775694),(25,'5b7bb8530eba3','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',3,1534834771),(26,'5b7bb9a104f53','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',1,1534835105),(27,'5b7bbbeac6b63','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',1,1534835690),(28,'5b7bbc94c2979','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',1,1534835860),(29,'5b7bc1fe4f13a','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',1,1534837246),(30,'5b7bc21a73bfc','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',1,1534837274),(31,'5b7bcf590c238','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',1,1534840665),(32,'5b7bcf872f5cf','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',2,1534840711),(33,'5b7bcfb261178','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',1,1534840754),(34,'5b7bcff14b39f','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',2,1534840817),(35,'5b7bfda464213','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',1,1534852516),(36,'5b7c00208d354','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',2,1534853152),(37,'5b7c01191840f','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',1,1534853401),(38,'5b7c0240bb285','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',2,1534853696),(39,'5b7c02612ffed','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',1,1534853729),(40,'5b7c02ea85f82','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',2,1534853866),(41,'5b7c032590454','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',1,1534853925),(42,'5b7c0419d4712','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',2,1534854169),(43,'5b7c045d1ce3e','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0','Firefox','Windows',1,1534854237),(44,'5b7c110cb306a','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',2,1534857484),(45,'5b7c19d85a2ee','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',2,1534859736),(46,'5b7c1a3766892','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',2,1534859831),(47,'5b7c1a56726cb','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',2,1534859862),(48,'5b7c1ab9b9f7e','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',2,1534859961),(49,'5b7c1ad255b6a','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',2,1534859986),(50,'5b7c29ed0003c','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1534863853),(51,'5b7d0ef3e9bd0','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',1,1534922483),(52,'5b7d1f77233cf','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0','Firefox','Windows',4,1534926711),(53,'5b7e6c063f9d2','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',1,1535011846),(54,'5b7e6c7911029','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',1,1535011961),(55,'5b7ebfdbb1f17','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',1,1535033307),(56,'5b7fb231e9cd5','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',1,1535095345),(57,'5b7fbe7298527','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0','Firefox','Windows',4,1535098482),(58,'5b7fc1bb1c59c','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',1,1535099323),(59,'5b7fc438225e5','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',1,1535099960),(60,'5b7fc493a6892','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',1,1535100051),(61,'5b7fef0d4ebcb','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',1,1535110925),(62,'5b7ff61c09304','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0','Firefox','Windows',1,1535112732),(63,'5b7ffbe82ee85','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1535114216),(64,'5b7ffd0c9425f','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',1,1535114508),(65,'5b800006f0401','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1535115270),(66,'5b80019f805e8','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',1,1535115679),(67,'5b8001d3c6a8c','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',1,1535115731),(68,'5b83a3f16c85b','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',1,1535353841),(69,'5b83aac117fe7','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1535355585),(70,'5b83cfa0e74d6','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0','Firefox','Windows',4,1535365024),(71,'5b83e04e1e74a','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1535369294),(72,'5b83e7abf27bf','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',1,1535371179),(73,'5b83e8a779a51','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',1,1535371431),(74,'5b83f32b999d7','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1535374123),(75,'5b86ab93beeaf','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1535552403),(76,'5b86ad1e8c8dc','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1535552798),(77,'5b86af7151511','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1535553393),(78,'5b86afa518472','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1535553445),(79,'5b86b4feb679d','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1535554814),(80,'5b879fbdebaef','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1535614909),(81,'5b87a22c5300a','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1535615532),(82,'5b87aaad55bb9','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1535617709),(83,'5b87b67b63b42','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0','Firefox','Windows',1,1535620731),(84,'5b87b846e8320','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1535621190),(85,'5b87b9f56f5f2','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1535621621),(86,'5b87ba82e5d40','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1535621762),(87,'5b87c05f9b226','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1535623263),(88,'5b87d475d423f','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1535628405),(89,'5b87d48744467','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1535628423),(90,'5b87d6e7d1165','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1535629031),(91,'5b87e07e598e0','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1535631486),(92,'5b87e141053b3','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1535631681),(93,'5b87e1ea94bfe','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1535631850),(94,'5b87e2b634e6a','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1535632054),(95,'5b87e3c2e7be3','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1535632322),(96,'5b87e46460318','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1535632484),(97,'5b87e4b556562','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1535632565),(98,'5b87e5920f03e','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1535632786),(99,'5b87e5ea7dbfc','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1535632874),(100,'5b87e72c50531','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1535633196),(101,'5b87e7770b97e','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1535633271),(102,'5b87e8c5a63bf','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1535633605),(103,'5b87e9253f64e','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1535633701),(104,'5b87ea4475de9','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1535633988),(105,'5b87ee42c68e7','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1535635010),(106,'5b87f1a6d1b89','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1535635878),(107,'5b87f635a3db6','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1535637045),(108,'5b87fec0cf0ac','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1535639232),(109,'5b87fee5ea9d2','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1535639269),(110,'5b87ff3482df4','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1535639348),(111,'5b87ff4f16cbf','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1535639375),(112,'5b87fff905daf','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1535639545),(113,'5b8800843fcf1','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',3,1535639684),(114,'5b8800df752b5','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1535639775),(115,'5b8800f03bf7c','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',1,1535639792),(116,'5b8805a822bc1','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1535641000),(117,'5b88ef4558af7','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',1,1535700805),(118,'5b88f059be25c','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',1,1535701081),(119,'5b88f07450961','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1535701108),(120,'5b88f0a840914','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',1,1535701160),(121,'5b88f12fc1303','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1535701295),(122,'5b88f247a1500','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',1,1535701575),(123,'5b88f279aec3c','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',1,1535701625),(124,'5b88f2b57a252','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',1,1535701685),(125,'5b88f2ea818b9','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',1,1535701738),(126,'5b88f32925a52','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',1,1535701801),(127,'5b88f42fdc436','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1535702063),(128,'5b88f4b9f2671','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',2,1535702201),(129,'5b88f4d69cc07','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1535702230),(130,'5b88f517e659a','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',2,1535702295),(131,'5b88f9d2497a2','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',2,1535703506),(132,'5b88fa7da7ac0','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',2,1535703677),(133,'5b88fa9e9f697','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',2,1535703710),(134,'5b88fab4e9975','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1535703732),(135,'5b88fc0e5b43a','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',3,1535704078),(136,'5b88fc5c86c71','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1535704156),(137,'5b88fd3d64462','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',3,1535704381),(138,'5b88fd4c2465e','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1535704396),(139,'5b88fd6b924f1','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',3,1535704427),(140,'5b88fdccc4676','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1535704524),(141,'5b88fdefde8e5','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',3,1535704559),(142,'5b88fe2e9a2c8','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1535704622),(143,'5b88fe482ee38','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',3,1535704648),(144,'5b88fed80eb4c','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',3,1535704792),(145,'5b88fefad3646','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1535704826),(146,'5b8915f0288c1','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1535710704),(147,'5b8916494b73a','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1535710793),(148,'5b891672a6b02','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1535710834),(149,'5b89167f48a6d','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1535710847),(150,'5b8929a03a40c','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1535715744),(151,'5b8931b49a04f','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1535717812),(152,'5b893d243dd8c','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1535720740),(153,'5b893e70e66a3','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1535721072),(154,'5b893e8d53efc','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1535721101),(155,'5b894780bd9b9','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1535723392),(156,'5b894898348a7','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1535723672),(157,'5b894e3b96c01','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1535725115),(158,'5b894e408a226','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1535725120),(159,'5b8954a7849ee','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1535726759),(160,'5b8cde4d79d4f','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1535958605),(161,'5b8cf30c9314a','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1535963916),(162,'5b8cf31a10594','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',3,1535963930),(163,'5b8cf33e27624','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1535963966),(164,'5b8cf87521e7e','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1535965301),(165,'5b8d167c991cf','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1535972988),(166,'5b8e68d83d419','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1536059608),(167,'5b8f9f585703d','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1536139096),(168,'5b8fabf6833f2','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1536142326),(169,'5b8fe8e7571ac','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1536157927),(170,'5b8feafe2f87d','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1536158462),(171,'5b8ff5242dee9','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1536161060),(172,'5b911cec33355','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1536236780),(173,'5b911d31e53ef','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0','Firefox','Windows',NULL,1536236849),(174,'5b911d7689e3c','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',NULL,1536236918),(175,'5b911e81cd61f','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1536237185),(176,'5b912a90aee24','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1536240272),(177,'5b912c46d4552','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1536240710),(178,'5b91337592bfc','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1536242549),(179,'5b9135c8bc4bf','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1536243144),(180,'5b9137108a6de','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1536243472),(181,'5b91416fadab8','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1536246127),(182,'5b9224371b427','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1536304183),(183,'5b9234ef961d6','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.103 YaBrowser/18.7.0.2695 Yowser/2.5 Safari/537.36','Yandex Browser','Windows',NULL,1536308463),(184,'5b9237088f1a3','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1536309000),(185,'5b92411cd1aaa','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1536311580),(186,'5b92412983150','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1536311593),(187,'5b92413af1c46','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',3,1536311610),(188,'5b924146c4995','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1536311622),(189,'5b924631e27b2','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1536312881),(190,'5b92463d364be','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',3,1536312893),(191,'5b9248276d2e8','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',3,1536313383),(192,'5b924a4db3aab','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1536313933),(193,'5b924a5bec5d4','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',3,1536313947),(194,'5b924ba7cce4f','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1536314279),(195,'5b924bd6a8c06','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1536314326),(196,'5b92600b84411','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1536319499),(197,'5b926065f24e3','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1536319589),(198,'5b928f531d2bb','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',2,1536331603),(199,'5b928f651559a','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',3,1536331621),(200,'5b928f7e738c4','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',3,1536331646),(201,'5b9619643758f','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',3,1536563556),(202,'5b961978bbfd5','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',2,1536563576),(203,'5b96199b33d8f','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',2,1536563611),(204,'5b9619a126e56','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1536563617),(205,'5b961b8e88324','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1536564110),(206,'5b961bccd1210','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1536564172),(207,'5b961bf4ce854','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1536564212),(208,'5b961c51b23d3','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1536564305),(209,'5b961c5c7d706','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1536564316),(210,'5b961e1ee8c85','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1536564766),(211,'5b961f776fee1','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1536565111),(212,'5b962dac18062','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1536568748),(213,'5b963a9e67c6d','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0','Firefox','Windows',NULL,1536572062),(214,'5b96403298e91','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0','Firefox','Windows',NULL,1536573490),(215,'5b9652e487631','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1536578276),(216,'5b9657e77383c','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1536579559),(217,'5b965c399e7cc','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1536580665),(218,'5b965f13d6954','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1536581395),(219,'5b965f6af09b2','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0','Firefox','Windows',NULL,1536581482),(220,'5b9679736b43b','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0','Firefox','Windows',3,1536588147),(221,'5b967c719d975','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1536588913),(222,'5b968617e20ba','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1536591383),(223,'5b96864d757e4','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0','Firefox','Windows',3,1536591437),(224,'5b976b8f02417','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1536650127),(225,'5b97746663882','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0','Firefox','Windows',12,1536652390),(226,'5b977473b4385','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',12,1536652403),(227,'5b9777cc84231','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',12,1536653260),(228,'5b9782c08754c','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1536656064),(229,'5b978defed0fa','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1536658927),(230,'5b978f55a364d','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1536659285),(231,'5b97b63cde794','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1536669244),(232,'5b97b649e3ae5','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1536669257),(233,'5b97b8f80a40a','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',1,1536669944),(234,'5b97b9367c047','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',1,1536670006),(235,'5b97b94914950','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',1,1536670025),(236,'5b97ba1682dff','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1536670230),(237,'5b97be92bb9a4','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1536671378),(238,'5b97c00ee3ad4','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1536671758),(239,'5b97c630d2620','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0','Firefox','Windows',13,1536673328),(240,'5b97c7bde1e74','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0','Firefox','Windows',13,1536673725),(241,'5b97d175e0f11','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0','Firefox','Windows',13,1536676213),(242,'5b97d290b9351','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1536676496),(243,'5b97d2be387ef','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',13,1536676542),(244,'5b97d2f0bcf9f','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',13,1536676592),(245,'5b97d5ef43e15','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',13,1536677359),(246,'5b97d60eac487','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',13,1536677390),(247,'5b97d8ffa5a62','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1536678143),(248,'5b97da5173199','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0','Firefox','Windows',13,1536678481),(249,'5b97da69ddb19','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',13,1536678505),(250,'5b97da9ba109c','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',13,1536678555),(251,'5b97db228f280','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1536678690),(252,'5b98ec627344e','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1536748642),(253,'5b9a0ba6f10e8','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1536822182),(254,'5b9a1288c40e1','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1536823944),(255,'5b9a1cbb26b4e','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1536826555),(256,'5b9a1d8df2dcb','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1536826765),(257,'5b9a2771d7742','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0','Firefox','Windows',13,1536829297),(258,'5b9a2a406e4a9','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1536830016),(259,'5b9a2c8010386','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',13,1536830592),(260,'5b9a2ddcb810a','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1536830940),(261,'5b9a37952adbf','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1536833429),(262,'5b9a587757ef5','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',13,1536841847),(263,'5b9b5cfd992ff','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',13,1536908541),(264,'5b9b6528b0065','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',13,1536910632),(265,'5b9b796d6d4e4','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',13,1536915821),(266,'5b9b79ea61de8','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.103 YaBrowser/18.7.0.2695 Yowser/2.5 Safari/537.36','Yandex Browser','Windows',13,1536915946),(267,'5b9b7a71aebc0','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0','Firefox','Windows',13,1536916081),(268,'5b9b7ab668919','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0','Firefox','Windows',13,1536916150),(269,'5b9b7cea342ee','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0','Firefox','Windows',13,1536916714),(270,'5b9b7d117c1e6','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1536916753),(271,'5b9b8249d44be','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1536918089),(272,'5b9b846898d86','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1536918632),(273,'5b9b9899baa4b','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1536923801),(274,'5b9b9b56eb850','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1536924502),(275,'5b9b9c7c794a7','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1536924796),(276,'5b9b9f229be24','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1536925474),(277,'5b9b9f44e576a','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1536925508),(278,'5b9ba37983c2b','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1536926585),(279,'5b9ba723824bd','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',13,1536927523),(280,'5b9ba74ca5b95','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0','Firefox','Windows',13,1536927564),(281,'5b9ba7e679e79','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1536927718),(282,'5b9baa803aa65','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0','Firefox','Windows',13,1536928384),(283,'5b9bb0a22e708','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1536929954),(284,'5b9bbe4ee360e','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1536933454),(285,'5b9bc4e36ccac','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1536935139),(286,'5b9bc790658e3','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1536935824),(287,'5b9bc83f727ae','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1536935999),(288,'5b9bc984097a5','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0','Firefox','Windows',4,1536936324),(289,'5b9f5333c5b2e','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',13,1537168179),(290,'5b9f55a680ea6','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.103 YaBrowser/18.7.0.2695 Yowser/2.5 Safari/537.36','Yandex Browser','Windows',13,1537168806),(291,'5b9f5d430058a','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1537170755),(292,'5b9f5d5cf3cbd','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1537170780),(293,'5b9f5d77e3b9b','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1537170807),(294,'5b9f61f484200','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1537171956),(295,'5b9fc25500e95','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1537196629),(296,'5ba09f27e1ebe','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1537253159),(297,'5ba0a83e559fc','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1537255486),(298,'5ba0a8850d29b','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1537255557),(299,'5ba0a8f34f695','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1537255667),(300,'5ba0a8fb89873','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1537255675),(301,'5ba0b4281d6c8','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1537258536),(302,'5ba0b50097c86','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1537258752),(303,'5ba0ba816a5a8','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1537260161),(304,'5ba0bb2328862','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',2,1537260323),(305,'5ba0be7fa0f5c','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',2,1537261183),(306,'5ba0c065a53c4','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',2,1537261669),(307,'5ba0ddf68a21c','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',2,1537269238),(308,'5ba0ddfdb924e','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1537269245),(309,'5ba1ff701be42','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0','Firefox','Windows',13,1537343344),(310,'5ba2055f267eb','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1537344863),(311,'5ba20b9275578','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1537346450),(312,'5ba8b5dd6bff7','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1537783261),(313,'5ba8e7de4779c','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1537796062),(314,'5ba8f047bfa8e','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1537798215),(315,'5ba8f46ecaad1','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1537799278),(316,'5baa026694df5','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1537868390),(317,'5baa05c16d6b5','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1537869249),(318,'5baa41bd3431c','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1537884605),(319,'5bab344b3a24e','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',1,1537946699),(320,'5bab348769d9d','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1537946759),(321,'5bab34ac759e1','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',1,1537946796),(322,'5bab3686680d7','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1537947270),(323,'5bab86e8deeb6','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1537967848),(324,'5bab872b30503','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1537967915),(325,'5bae21136f514','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1538138387),(326,'5bae2c11ca472','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1538141201),(327,'5bae3097b6407','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1538142359),(328,'5bae394b60e24','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1538144587),(329,'5bae43911478e','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1538147217),(330,'5bb1c7ff19345','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1538377727),(331,'5bb328b1b1080','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1538468017),(332,'5bb36905dbd4e','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1538484485),(333,'5bb3698539391','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1538484613),(334,'5bb36bc5b6b17','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1538485189),(335,'5bb379bc41ccf','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1538488764),(336,'5bb379dd65f2d','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1538488797),(337,'5bb471fe7585c','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0','Firefox','Windows',4,1538552318),(338,'5bb47b47c5a9d','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',3,1538554695),(339,'5bb47d2d7e82b','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1538555181),(340,'5bb4895e9dd00','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0','Firefox','Windows',3,1538558302),(341,'5bb48ba609cd7','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 YaBrowser/18.9.0.3467 Yowser/2.5 Safari/537.36','Yandex Browser','Windows',3,1538558886),(342,'5bb48d16201ac','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0','Firefox','Windows',3,1538559254),(343,'5bb48d53781c6','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1538559315),(344,'5bb48f66c518b','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',3,1538559846),(345,'5bb491ff54d11','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0','Firefox','Windows',3,1538560511),(346,'5bb4a34429c88','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1538564932),(347,'5bb4bc8f1c8f8','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1538571407),(348,'5bb4bcc7b09b3','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1538571463),(349,'5bb4cf05a98b2','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1538576133),(350,'5bb5c3536bb43','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1538638675),(351,'5bb5ce94b0ba0','127.0.0.1','ru','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','Chrome','Windows',4,1538641556);
/*!40000 ALTER TABLE `user_visit_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venue_country`
--

DROP TABLE IF EXISTS `venue_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venue_country` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(127) NOT NULL,
  `fips` varchar(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Страны';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venue_country`
--

LOCK TABLES `venue_country` WRITE;
/*!40000 ALTER TABLE `venue_country` DISABLE KEYS */;
INSERT INTO `venue_country` VALUES (1,'Россия','RU');
/*!40000 ALTER TABLE `venue_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venue_district`
--

DROP TABLE IF EXISTS `venue_district`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venue_district` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `sity_id` mediumint(8) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(16) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sity_id` (`sity_id`),
  CONSTRAINT `venue_district_ibfk_1` FOREIGN KEY (`sity_id`) REFERENCES `venue_sity` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Городские округа и районы';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venue_district`
--

LOCK TABLES `venue_district` WRITE;
/*!40000 ALTER TABLE `venue_district` DISABLE KEYS */;
INSERT INTO `venue_district` VALUES (1,1,'Центральный административный округ','ЦАО'),(2,1,'Северозападный административный округ','СЗАО');
/*!40000 ALTER TABLE `venue_district` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venue_place`
--

DROP TABLE IF EXISTS `venue_place`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venue_place` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `country_id` mediumint(8) NOT NULL,
  `sity_id` mediumint(8) NOT NULL,
  `district_id` mediumint(8) NOT NULL,
  `name` varchar(127) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(24) NOT NULL,
  `phone_optional` varchar(24) NOT NULL,
  `email` varchar(255) NOT NULL,
  `сontact_person` varchar(127) NOT NULL,
  `latitude` float(10,6) DEFAULT NULL,
  `longitude` float(10,6) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `country_id` (`country_id`),
  KEY `sity_id` (`sity_id`),
  KEY `district_id` (`district_id`),
  KEY `latitude` (`latitude`),
  KEY `longitude` (`longitude`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  CONSTRAINT `venue_place_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `venue_country` (`id`),
  CONSTRAINT `venue_place_ibfk_2` FOREIGN KEY (`district_id`) REFERENCES `venue_district` (`id`),
  CONSTRAINT `venue_place_ibfk_3` FOREIGN KEY (`sity_id`) REFERENCES `venue_sity` (`id`),
  CONSTRAINT `venue_place_ibfk_4` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`),
  CONSTRAINT `venue_place_ibfk_5` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Место проведения';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venue_place`
--

LOCK TABLES `venue_place` WRITE;
/*!40000 ALTER TABLE `venue_place` DISABLE KEYS */;
INSERT INTO `venue_place` VALUES (1,1,1,1,'Департамент культуры г. Москвы','Неглинная улица, 8/10','(495) 539-55-55','(495) 539-55-55','','',55.753960,37.620392,'Открываются в 8 утра',0,0,4,4);
/*!40000 ALTER TABLE `venue_place` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venue_sity`
--

DROP TABLE IF EXISTS `venue_sity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venue_sity` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `country_id` mediumint(8) DEFAULT NULL,
  `name` varchar(64) NOT NULL,
  `latitude` float(10,6) DEFAULT NULL,
  `longitude` float(10,6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `latitude` (`latitude`),
  KEY `longitude` (`longitude`),
  KEY `country_id` (`country_id`),
  CONSTRAINT `venue_sity_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `venue_country` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Города';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venue_sity`
--

LOCK TABLES `venue_sity` WRITE;
/*!40000 ALTER TABLE `venue_sity` DISABLE KEYS */;
INSERT INTO `venue_sity` VALUES (1,1,'Москва',55.753960,37.620392);
/*!40000 ALTER TABLE `venue_sity` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-04 12:20:01
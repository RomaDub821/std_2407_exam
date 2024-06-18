-- MySQL dump 10.13  Distrib 8.0.33, for Linux (x86_64)
--
-- Host: std-mysql    Database: std_2407_exam
-- ------------------------------------------------------
-- Server version	5.7.26-0ubuntu0.16.04.1

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
-- Table structure for table `alembic_version`
--

DROP TABLE IF EXISTS `alembic_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alembic_version` (
  `version_num` varchar(32) NOT NULL,
  PRIMARY KEY (`version_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alembic_version`
--

LOCK TABLES `alembic_version` WRITE;
/*!40000 ALTER TABLE `alembic_version` DISABLE KEYS */;
INSERT INTO `alembic_version` VALUES ('4c1ab61216b5');
/*!40000 ALTER TABLE `alembic_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `year` int(11) NOT NULL,
  `publisher` varchar(100) NOT NULL,
  `author` varchar(100) NOT NULL,
  `pages` int(11) NOT NULL,
  `cover_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cover_id` (`cover_id`),
  CONSTRAINT `book_ibfk_1` FOREIGN KEY (`cover_id`) REFERENCES `cover` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (26,'пирожочек1','Самая лучшая собачка',1914,'ООО Пироги Тамбов','Марина Алексеевна',333,24),(34,'Книга 1','первая в своём роде',1000,'Мирса','Нар',191,31),(37,'Книга 2','Описание книги 2',2222,'Вторая книга','Второкнижник',222,34),(39,'Книга 3','Книга 3',3333,'Книга 3','Книжник ',333,35),(40,'Книга 4 ','Книга 4',4444,'четвертак','Книголюб',444,36),(41,'Книга 5','Пятая книга',5555,'Пятерка','пять семниц на неделе',55,37),(42,'Шесть Шесть Шесть','Шестая книга',1236,'Комедия','Данте',1111,38),(43,'Седьмая КНИГА','Книга 777',2024,'Победа','Сунь цзы',20,39),(44,'Восьмая книга ','книга книга',4835,'Бесконечность','Оз',6754,40),(45,'девятая книга','ооо',2341,'девятки','базз лайтер',10,41),(46,'10 книга','ооо',5646,'листик','ференц',54,42),(47,'последняя книга','Я очень надеюсь, что всё будет хорошо и я смогу спать больше двух часов в день...',2024,'Самиздат','Дубовской Роман Евгеньевич',987,43);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_genre`
--

DROP TABLE IF EXISTS `book_genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_genre` (
  `book_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL,
  PRIMARY KEY (`book_id`,`genre_id`),
  KEY `genre_id` (`genre_id`),
  CONSTRAINT `book_genre_ibfk_1` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`id`) ON DELETE CASCADE,
  CONSTRAINT `book_genre_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_genre`
--

LOCK TABLES `book_genre` WRITE;
/*!40000 ALTER TABLE `book_genre` DISABLE KEYS */;
INSERT INTO `book_genre` VALUES (41,1),(46,3),(47,4),(47,8),(46,9),(47,9),(46,10);
/*!40000 ALTER TABLE `book_genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cover`
--

DROP TABLE IF EXISTS `cover`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cover` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(100) NOT NULL,
  `mime_type` varchar(100) NOT NULL,
  `md5_hash` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cover`
--

LOCK TABLES `cover` WRITE;
/*!40000 ALTER TABLE `cover` DISABLE KEYS */;
INSERT INTO `cover` VALUES (12,'photo_2024-06-01_21-28-51.jpg','image/jpeg','0ec99190148410296050d9ce83ccdef4'),(13,'photo_2024-06-06_03-28-12_3.jpg','image/jpeg','f5754e0378429603058ac10faa896b91'),(14,'photo_2024-06-06_03-31-55.jpg','image/jpeg','b5b566135f5596c1637c6726159ae5c6'),(15,'photo_2024-06-01_21-28-51.jpg','image/jpeg','0ec99190148410296050d9ce83ccdef4'),(16,'photo_2024-06-01_21-28-51.jpg','image/jpeg','0ec99190148410296050d9ce83ccdef4'),(17,'photo_2024-06-01_21-28-51.jpg','image/jpeg','0ec99190148410296050d9ce83ccdef4'),(18,'YPlPhNPbZ0g.jpg','image/jpeg','d412332f63b3212e7b58123d924fc26c'),(19,'photo_2024-06-06_03-28-14.jpg','image/jpeg','51c610082c5510bb45c150b7d5436d45'),(20,'photo_2024-06-06_03-31-56_3.jpg','image/jpeg','6107bae37c2caf0d489bf11fad2cb28f'),(21,'photo_2024-06-06_03-31-58_2.jpg','image/jpeg','d38f6890c426b22b471a9e3ab9c90396'),(22,'photo_2024-06-06_03-31-57.jpg','image/jpeg','e2e1a8b86b9f693684bf3b17200b00e0'),(23,'photo_2024-06-06_03-28-12_3.jpg','image/jpeg','f5754e0378429603058ac10faa896b91'),(24,'photo_2024-06-01_21-28-51.jpg','image/jpeg','0ec99190148410296050d9ce83ccdef4'),(25,'photo_2024-06-06_03-31-55_3.jpg','image/jpeg','f37815daa0e681c16160e535ddb01cb1'),(26,'photo_2024-06-06_03-31-59_3.jpg','image/jpeg','b7e50e6f57d66776ccc9c993fbb0d609'),(27,'photo_2024-06-06_03-28-13.jpg','image/jpeg','5e587359c1ce7ecdefd523452578e92e'),(28,'2024-06-17_043803.png','image/png','04d64ae5f9d62ffb613e7dcb07da1c6b'),(29,'2024-05-01_202800.png','image/png','7868142ccfcbfa8ae13cfc1edf9eb5d0'),(30,'2024-03-22_131506.png','image/png','e5f194dcefa92d11d90740336415095e'),(31,'photo_2024-06-06_03-31-56_2.jpg','image/jpeg','8e8f334f566927a3afe7913131a4b2e3'),(32,'photo_2024-06-06_03-28-12_3.jpg','image/jpeg','2def6a96052e279a39f170ff0a3e249f'),(33,'photo_2024-06-06_03-28-13_2.jpg','image/jpeg','b8ca791a8f3086f0e2204a1882b3223a'),(34,'photo_2024-06-06_03-28-12_2.jpg','image/jpeg','16e1f5fd58bd1d996e9d5a29d42f8dfb'),(35,'photo_2024-06-06_03-31-59.jpg','image/jpeg','52dcbe03e39168ce2f752c802f3e7bb5'),(36,'photo_2024-06-06_03-28-13_3.jpg','image/jpeg','bff7bdf3c05fe2eaee26b36a852d1af1'),(37,'photo_2024-06-06_03-31-54_2.jpg','image/jpeg','07e70968ef3b6277e81bca5058593f47'),(38,'photo_2024-06-06_03-31-55_3.jpg','image/jpeg','da39c49c62194b4694c3a45407da3683'),(39,'photo_2024-06-06_03-28-14.jpg','image/jpeg','ee0ef0a8a1600ce961cdf26b711bc08d'),(40,'photo_2024-06-06_03-31-54.jpg','image/jpeg','0353dacc0b33bc97019231bc929f8c5a'),(41,'photo_2024-06-06_03-31-55.jpg','image/jpeg','3ad73718fb5e24582a9a0c148f80428f'),(42,'photo_2024-06-06_03-31-58_3.jpg','image/jpeg','b85d3fb098bdfcdefad40e24c12cabb0'),(43,'photo_2024-06-06_03-31-54_3.jpg','image/jpeg','2f4f0dfbc10e2a61ae59cd8813f6715c');
/*!40000 ALTER TABLE `cover` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre`
--

LOCK TABLES `genre` WRITE;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` VALUES (9,'Биография'),(3,'Детектив'),(10,'Детская литература'),(7,'История'),(5,'Научная литература'),(6,'Приключения'),(8,'Психология'),(4,'Роман'),(1,'Фантастика'),(2,'Фэнтези');
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `text` text NOT NULL,
  `date_added` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `book_id` (`book_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `review_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`),
  CONSTRAINT `review_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (8,26,5,3,'**ffff**','2024-06-17 01:27:47'),(11,26,7,4,'хорошо','2024-06-17 04:20:33'),(14,34,5,2,'УУУ','2024-06-17 22:36:28'),(16,44,1,5,'АААА','2024-06-18 00:18:43');
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'administrator','Суперпользователь, имеет полный доступ к системе, в том числе к созданию и удалению книг'),(2,'moderator','Может редактировать данные книг и производить модерацию рецензий'),(3,'user','Может оставлять рецензии');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `surname` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `patronymic` varchar(100) DEFAULT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'roma','b0c27fca74fa91934900c9ffcb3dcca5b807a3c059a3b516cdd0788807b5ff49','roma','roma','roma',1),(2,'duba','82aa7520f3cda66d54dac6623584002cc12201bdfd0185f1ee98db975dba09be','duba','duba','duba',2),(3,'821','af5422f824076084bed9b8a09086ac59f0ed8c74eea7b189d2809b198ba1f6ee','821','821','821',3),(4,'1234','fd0VMQ3GgRZEGHJix7c4Ew==','1234','1234','1234',1),(5,'12345','pbkdf2:sha256:600000$lI3u513mC20yBGKy$aa6cce2f1476293a90039ba1a6bd4fe4b96b39bd34175ed8888c5ef0730229a4','12345','12345','12345',1),(6,'dub','pbkdf2:sha256:600000$oiCywxQzeXJklvtG$30b6bc395e57ae56b0e70985ae25562acb0f800cb411fa7ee0b12fe9472f18ed','dub','dub','dub',3),(7,'123456','pbkdf2:sha256:600000$T7Q3yWE39EWAM4E4$6eaaebae958a4b9f5875f5745c356dbd8bb76d3c26eba36d5e00865c7278f444','123456','123456','123456',1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-18  2:36:00

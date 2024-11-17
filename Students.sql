-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: students
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `CourseId` int NOT NULL AUTO_INCREMENT,
  `CourseName` varchar(100) NOT NULL,
  `Credits` int DEFAULT NULL,
  `DepartmentId` int DEFAULT NULL,
  `ProfessorId` int DEFAULT NULL,
  PRIMARY KEY (`CourseId`),
  KEY `DepartmentId` (`DepartmentId`),
  KEY `ProfessorId` (`ProfessorId`),
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`DepartmentId`) REFERENCES `department` (`DepartmentId`),
  CONSTRAINT `course_ibfk_2` FOREIGN KEY (`ProfessorId`) REFERENCES `professor` (`ProfessorId`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,'Introduction Database Systems',3,1,1),(2,'Computer Science I',3,1,1),(3,'Web Application Development',3,1,1),(4,'Calculus I',4,2,2),(5,'Calculus II',4,2,2),(6,'Calculus III',4,2,2),(7,'Pre-Calc',3,2,2),(8,'World History',3,3,3),(9,'History of World War I',3,3,3),(10,'History of World War II',3,3,3),(11,'Operating Systems',3,1,4),(12,'Computer Architecture',3,1,4),(13,'Medical Ethics',3,5,5),(14,'Pharmacology',4,5,5),(15,'Creative Writing',3,6,6),(16,'Roman History',3,3,7),(17,'Greek History',3,3,7),(18,'Egyptian History',3,3,7),(19,'Philosophy of Mind',3,6,8),(20,'Ancient Philosophy',3,6,8),(21,'Philosophy of Science',3,6,8),(22,'Political Philosophy',3,6,8),(23,'Machine Design',4,4,9),(24,'Heat Transfer',3,4,9),(25,'Manufacturing',4,4,9),(26,'Global Health',4,5,10),(27,'Telemedicine',3,5,10),(28,'Introduction to Orthopedics',4,5,10),(29,'Biology I',4,7,11),(30,'Biology II',4,7,11),(31,'Introduction to Education',4,8,12),(32,'Control Systems',3,4,13),(33,'Power Systems',3,4,13),(34,'Statistics I',3,2,14),(35,'Statistics II',3,2,14),(36,'Classroom Management',4,8,15),(37,'Thermodynamics',4,4,16),(38,'Process Design',3,4,16),(39,'Chemical Reaction Engineering',4,4,16),(40,'Public Health',3,5,17),(41,'Discrete Math',3,2,18),(42,'Linear Algebra',3,2,18),(43,'Chemistry I',4,7,19),(44,'Chemistry II',4,7,19),(45,'Biochemistry',4,7,19),(46,'Cloud Computing',3,1,20),(47,'Mobile App Development',3,1,20),(48,'Art Studio',3,6,21),(49,'Genetics',4,7,22),(50,'Microbiology',4,7,22),(51,'Ecology',3,7,22),(52,'Botany',3,7,22),(53,'Educational Leadership',3,8,23),(54,'Instructional Strategies',3,8,24),(55,'Curriculum Development',3,8,24),(56,'Education Policy',3,8,24),(57,'Philosophy of Education',3,8,24),(58,'Computer Forensics',3,1,25),(59,'Introduction to Cybersecurity',3,1,25);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `DepartmentId` int NOT NULL AUTO_INCREMENT,
  `DepartmentName` varchar(100) NOT NULL,
  `DepartmentHead` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`DepartmentId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'Computer Science','Dr. Seikyung Jung'),(2,'Mathematics','Dr. Katherine Bramen'),(3,'History','Dr. George Lucas'),(4,'Engineering','Dr. Henry Ford'),(5,'Health and Medicine','Dr. Alexander Fleming'),(6,'Arts and Humanities','Dr. Socrates Aeschines'),(7,'Natural Sciences','Dr. Scarlett Howard'),(8,'Education','Dr. Hannah Rivera');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrollment`
--

DROP TABLE IF EXISTS `enrollment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enrollment` (
  `EnrollmentId` int NOT NULL AUTO_INCREMENT,
  `StudentId` int DEFAULT NULL,
  `CourseId` int DEFAULT NULL,
  `Grade` char(2) DEFAULT NULL,
  PRIMARY KEY (`EnrollmentId`),
  KEY `StudentId` (`StudentId`),
  KEY `CourseId` (`CourseId`),
  CONSTRAINT `enrollment_ibfk_1` FOREIGN KEY (`StudentId`) REFERENCES `student` (`StudentId`),
  CONSTRAINT `enrollment_ibfk_2` FOREIGN KEY (`CourseId`) REFERENCES `course` (`CourseId`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrollment`
--

LOCK TABLES `enrollment` WRITE;
/*!40000 ALTER TABLE `enrollment` DISABLE KEYS */;
INSERT INTO `enrollment` VALUES (1,1,1,'A'),(2,1,2,'B'),(3,1,3,'A'),(4,1,26,'B'),(5,2,1,'B'),(6,2,2,'A'),(7,2,4,'C'),(8,3,8,'A'),(9,3,9,'B'),(10,3,10,'A'),(11,4,32,'A'),(12,4,33,'B'),(13,4,34,'A'),(14,5,48,'A'),(15,5,49,'B'),(16,5,50,'A'),(17,6,16,'B'),(18,6,29,'A'),(19,6,37,'A'),(20,7,21,'A'),(21,7,55,'B'),(22,7,56,'A'),(23,8,13,'A'),(24,8,14,'B'),(25,8,15,'A'),(26,9,5,'A'),(27,9,6,'B'),(28,9,7,'A'),(29,10,1,'B'),(30,10,2,'A'),(31,10,4,'C'),(32,11,17,'A'),(33,11,18,'B'),(34,11,19,'A'),(35,12,41,'A'),(36,12,42,'B'),(37,12,45,'A'),(38,13,21,'A'),(39,13,22,'B'),(40,13,23,'A'),(41,14,17,'B'),(42,14,18,'A'),(43,14,19,'A'),(44,14,26,'A'),(45,15,8,'A'),(46,15,9,'B'),(47,15,10,'A'),(48,16,16,'A'),(49,16,29,'B'),(50,16,37,'A'),(51,17,30,'A'),(52,17,31,'B'),(53,17,32,'A'),(54,18,32,'A'),(55,18,33,'B'),(56,18,34,'A'),(57,19,46,'B'),(58,19,47,'A'),(59,19,48,'B'),(60,20,55,'A'),(61,20,56,'B'),(62,20,57,'A'),(63,21,48,'A'),(64,21,49,'B'),(65,21,50,'A'),(66,22,40,'A'),(67,22,41,'B'),(68,22,42,'A'),(69,23,52,'A'),(70,23,55,'B'),(71,23,56,'A'),(72,24,17,'B'),(73,24,18,'A'),(74,24,19,'A'),(75,25,45,'A'),(76,25,46,'B'),(77,25,47,'A'),(78,26,41,'B'),(79,26,46,'A'),(80,27,45,'A'),(81,27,46,'B'),(82,28,43,'A'),(83,28,44,'B'),(84,28,25,'A'),(85,29,38,'A'),(86,29,39,'B'),(87,29,40,'A'),(88,30,23,'A'),(89,30,27,'B'),(90,30,19,'A'),(91,31,30,'A'),(92,31,31,'B'),(93,31,32,'A'),(94,32,38,'A'),(95,32,39,'B'),(96,32,40,'A'),(97,33,22,'A'),(98,33,23,'B'),(99,33,34,'A'),(100,34,13,'A'),(101,34,14,'B'),(102,34,15,'A'),(103,35,21,'A'),(104,35,22,'B'),(105,35,23,'A'),(106,36,16,'A'),(107,36,29,'B'),(108,36,37,'A'),(109,37,38,'A'),(110,37,39,'B'),(111,37,40,'A'),(112,38,48,'A'),(113,38,49,'B'),(114,38,50,'A'),(115,39,1,'A'),(116,39,2,'B'),(117,39,3,'A'),(118,40,55,'A'),(119,40,56,'B'),(120,40,57,'A'),(121,41,12,'A'),(122,41,27,'B'),(123,41,15,'A'),(124,42,45,'A'),(125,42,46,'B'),(126,42,47,'A'),(127,43,43,'A'),(128,43,44,'B'),(129,43,25,'A'),(130,44,55,'A'),(131,44,56,'B'),(132,44,57,'A'),(133,45,30,'A'),(134,45,31,'B'),(135,45,32,'A'),(136,46,38,'A'),(137,46,39,'B'),(138,46,40,'A'),(139,47,17,'A'),(140,47,18,'B'),(141,47,19,'A'),(142,48,13,'A'),(143,48,14,'B'),(144,48,15,'A'),(145,49,19,'A'),(146,49,22,'B'),(147,49,34,'A'),(148,50,32,'A'),(149,50,33,'B'),(150,50,34,'A');
/*!40000 ALTER TABLE `enrollment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professor`
--

DROP TABLE IF EXISTS `professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professor` (
  `ProfessorId` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(100) NOT NULL,
  `LastName` varchar(100) NOT NULL,
  PRIMARY KEY (`ProfessorId`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor`
--

LOCK TABLES `professor` WRITE;
/*!40000 ALTER TABLE `professor` DISABLE KEYS */;
INSERT INTO `professor` VALUES (1,'Seikyung','Jung'),(2,'Katherine','Bramen'),(3,'George','Lucas'),(4,'Linus','TechTips'),(5,'Jake','Paul'),(6,'Mike','Tyson'),(7,'Julius','Caesar'),(8,'Socrates','Aeschines'),(9,'Henry','Ford'),(10,'Alexander','Fleming'),(11,'Ava','White'),(12,'Mason','Clark'),(13,'Hazel','Allen'),(14,'Wyatt','Baker'),(15,'Edward','Edwards'),(16,'John','Johnstone'),(17,'Stella','Peterson'),(18,'Nathan','Myers'),(19,'Levi','Cook'),(20,'Caleb','Turner'),(21,'Nora','Henderson'),(22,'Scarlett','Howard'),(23,'Ryan','Flores'),(24,'Hannah','Rivera'),(25,'Evelyn','Ross');
/*!40000 ALTER TABLE `professor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `StudentId` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(100) NOT NULL,
  `LastName` varchar(100) NOT NULL,
  `Age` int DEFAULT NULL,
  `Major` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`StudentId`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'Chase','Simao',21,'Computer Science'),(2,'Kush','Patel',21,'Computer Science'),(3,'Robert','Robertson',25,'History'),(4,'John','Smith',20,'Biology'),(5,'Jane','Doe',22,'Biochemistry'),(6,'Sarah','Connor',23,'Physics'),(7,'James','Cameron',21,'Art'),(8,'Laura','Croft',22,'History'),(9,'Peter','Mason',20,'Mathematics'),(10,'Mary','Davis',21,'Computer Science'),(11,'Bruce','Adams',22,'Engineering'),(12,'Clark','Johnson',24,'Health and Medicine'),(13,'Diana','Peters',23,'Philosophy'),(14,'Tony','Harris',25,'Engineering'),(15,'Steve','Rogers',20,'History'),(16,'Natasha','Romanoff',22,'Physics'),(17,'Wanda','Maxwell',21,'Psychology'),(18,'Bruce','Bannister',24,'Biology'),(19,'David','Thompson',23,'Health and Medicine'),(20,'Lisa','Clark',22,'Arts and Humanities'),(21,'Peter','Quinn',21,'Natural Sciences'),(22,'Anna','Green',20,'Biochemistry'),(23,'Jack','Brown',23,'Botany'),(24,'Eric','Miller',24,'Engineering'),(25,'Stephen','Stone',25,'Health and Medicine'),(26,'Wade','Wilson',22,'Marketing'),(27,'Matt','Murphy',24,'Law'),(28,'Jessica','Jones',23,'Criminal Justice'),(29,'Luke','Parker',20,'Education'),(30,'Danny','Rand',21,'Business Administration'),(31,'Jean','Grey',22,'Psychology'),(32,'Scott','Summers',23,'Education'),(33,'Ororo','Munroe',21,'Natural Sciences'),(34,'Logan','Howlett',25,'History'),(35,'Charles','Xavier',24,'Philosophy'),(36,'Erik','Lehnsherr',22,'Physics'),(37,'Raven','Smith',23,'Sociology'),(38,'Hank','McCoy',21,'Biochemistry'),(39,'Kitty','Pryde',22,'Computer Science'),(40,'Kurt','Wagner',20,'Arts and Humanities'),(41,'Warren','Worthington',23,'Business Administration'),(42,'Anna','Marie',21,'Nursing'),(43,'Remy','LeBeau',24,'Criminal Justice'),(44,'Piotr','Rasputin',22,'Arts and Humanities'),(45,'Betsy','Braddock',23,'Psychology'),(46,'Emma','Frost',21,'Education'),(47,'Sam','Guthrie',24,'Engineering'),(48,'Roberto','da Costa',22,'International Relations'),(49,'Amara','Aquilla',21,'Geology'),(50,'Danielle','Moonstar',23,'Anthropology');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-17 18:29:50

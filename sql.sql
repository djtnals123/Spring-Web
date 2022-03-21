-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: spring_web
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `attachment`
--

DROP TABLE IF EXISTS `attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attachment` (
  `file_name` varchar(87) NOT NULL,
  `board_id` int NOT NULL,
  PRIMARY KEY (`file_name`),
  KEY `board_id_idx` (`board_id`),
  CONSTRAINT `board_id` FOREIGN KEY (`board_id`) REFERENCES `board` (`board_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=euckr;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachment`
--

LOCK TABLES `attachment` WRITE;
/*!40000 ALTER TABLE `attachment` DISABLE KEYS */;
INSERT INTO `attachment` VALUES ('8739ab00-78d5-4175-b16f-3c75370c0829_서울대학교병원.pdf',13),('11d5a587-054f-49d7-9d4b-c18ea6047b3f_서울대학교병원.pdf',16),('59468ead-fe64-4aa6-bbd2-f45aaa2f4cd2_서울대학교병원.pdf',23);
/*!40000 ALTER TABLE `attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authority`
--

DROP TABLE IF EXISTS `authority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authority` (
  `username` varchar(20) DEFAULT NULL,
  `authority_name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authority`
--

LOCK TABLES `authority` WRITE;
/*!40000 ALTER TABLE `authority` DISABLE KEYS */;
INSERT INTO `authority` VALUES ('TEST','ROLE_ADMIN'),('TEST','ROLE_MEMBER');
/*!40000 ALTER TABLE `authority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board` (
  `board_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `writer` varchar(30) NOT NULL,
  `content` varchar(1000) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`board_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=euckr;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (12,'fr','c','r','2021-11-16 10:09:05'),(13,'ced','c','d','2021-11-16 10:09:34'),(16,'123122','c','13','2021-11-17 15:59:40'),(17,'343','c','123122','2021-11-17 16:00:09'),(18,'2w2','c','2','2021-11-17 16:04:51'),(19,'frfrf','c','r','2021-11-17 16:05:05'),(21,'frfrffrfrfrfrfr','c','rfrfrfrfrf','2021-11-17 16:05:13'),(23,'ccwe','c','e','2021-11-17 17:02:17'),(30,'wqeq','c','qweqqq','2021-11-18 21:05:52'),(31,'adad','c','aada','2021-11-18 21:11:02');
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` varchar(30) NOT NULL,
  `password` varchar(60) NOT NULL,
  `email` varchar(50) NOT NULL,
  `name` varchar(30) NOT NULL,
  `hospital` varchar(1) NOT NULL,
  `auth` varchar(25) NOT NULL DEFAULT 'ROLE_USER',
  `enabled` bit(1) NOT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ID_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('@gdgdgd','$2a$10$fr7DQly7ENov3/TvIx4tD.JM7QXK9lq2Xq4lCgs8QITcqqH1nIFbG','1','1','K','ROLE_PATIENT,ROLE_DOCTOR',_binary '','2021-11-18 17:19:06'),('1','1','1','1','S','R',_binary '','2021-11-15 03:59:54'),('12','$2a$10$moUmSrW6NZsreQT7QQqXxezIqiF9KcERkdM0aN6SaQ1/JZ.S8i3mi','1','12','S','ROLE_USER',_binary '','2021-11-15 03:59:54'),('1212121','$2a$10$E5qT5Uj7ty2nZQh2ZT75JexH2zAczbxs8CRyUpiGJJHW4rmbU.4yW','1','1','S','3,2',_binary '','2021-11-17 09:17:52'),('121212q','$2a$10$bSS80fH2JnNXVyRAt9Qvs.goDSrORDaE9VBT9vizwB9QvVdZYV5AK','12','1','S','2',_binary '','2021-11-17 09:27:27'),('123123','$2a$10$f4BsYhl6AwGPW0Jn1nT/C.XAX1XCyWHFP0hrCjFJ4s0gHWGTI1up6','1','1','S','ROLE_PATIENT,ROLE_DOCTOR',_binary '','2021-11-15 03:59:54'),('1231231','$2a$10$f4BsYhl6AwGPW0Jn1nT/C.XAX1XCyWHFP0hrCjFJ4s0gHWGTI1up6','112w1w2w1','1','S','ROLE_ADMIN',_binary '','2021-11-15 06:42:54'),('123123123','$2a$10$wYHDOTkUVqofjzjrAhJIb.A0AHhmk6jKHAdALH6kSdK3lSxz/yt9K','aw1212@co.kr','1','S','ROLE_PATIENT,ROLE_DOCTOR',_binary '','2021-11-18 19:30:21'),('12312323','$2a$10$eGxmwsLM6cqK4GGonMwhleI22Yyf7674D0m3AWT0f.F1G4emT4cJu','1','1','S','3',_binary '','2021-11-15 13:16:16'),('123123qwe','$2a$10$rgeNRf1S20jEEbgzysNQBO8Zw1ANBLrDc/x974SgCa6WbbbrcOk4K','wdqw@ww.ww','1','K','ROLE_DOCTOR',_binary '','2021-11-18 21:34:06'),('13','$2a$10$B.kzRxuiuNO5edcHNezb6esp.7io/P3JzKTDBhPmBFmH0dga5cvfS','1','13','S','ROLE_USER',_binary '','2021-11-15 03:59:54'),('2','$2a$10$ksQeiljWr/uNYQjDz1wckurv7NLYkbdl14ueFShTzSKkUF5ZUNeI.','1','3','S','',_binary '','2021-11-15 03:59:54'),('3','3','1','2','S','ROLE_ADMIN,ROLE_DOCTOR',_binary '','2021-11-15 03:59:54'),('c','$2a$10$dDUxEIOI1U6QI5fRckInIOJHRA77om3GDDREOPpQ6WtvCILoiV1ha','ccccc@ew.cc','c1','K','ROLE_PATIENT,ROLE_DOCTOR',_binary '','2021-11-15 03:59:54'),('d','$2a$10$5qiGtottYUXi/D.e784tleSZ/nf3hkxBLTa2t8MTOlGBSN9KudCuy','1','','S','ROLE_USER',_binary '','2021-11-15 03:59:54'),('gddgdd','$2a$10$W32zTa9.5B56HNmWBq/N9ul2nGVw8SfY9BT.WN/moCqS1PLhV.yaq','1','1','S','ROLE_PATIENT,ROLE_DOCTOR',_binary '','2021-11-18 17:14:48'),('m','$2a$10$9nrnWayicSi6e0q5vZULHeJTAGZEZc796LZI6QkidtUW6e/pJlENm','1','m','S','ROLE_MEMBER',_binary '','2021-11-15 03:59:54'),('qwqw','$2a$10$QM0tl514KBoBad7p9z9SBuhEKQOOyN2jJV1XW3d/YVr8BXtFxiENe','qw','qw','K','3,2',_binary '','2021-11-15 04:34:44'),('ㅎㅇㅇㅇ11','$2a$10$v21Kwocqm6qbYRSlqxoloeaAhH18CG24JIjuH2sBVV6JHlne.bnXu','1','1','S','ROLE_DOCTOR',_binary '','2021-11-18 17:15:53'),('ㅎㅇㅇㅎㅇㅇ','$2a$10$rtoGlGFDP0pAghN3tluwaeVB6700UbaP1u2pvBeC3HK1zGVSNq9.O','1','1','S','ROLE_PATIENT,ROLE_DOCTOR',_binary '','2021-11-18 17:14:12'),('ㅎㅇㅎㅇㅎㅇ','$2a$10$A4vah2YA/w1ZOdoyvuVbAOVQYG0k4Fmp87w42fZDkLAzbAqYL62hC','123','1','K','ROLE_PATIENT,ROLE_DOCTOR',_binary '','2021-11-18 17:10:00'),('韓123123','$2a$10$0um4QlVCzHt/i2BODO.9o.KCUXLvh6VcAcJ4Z0DVOFkN0VYWU.pP6','1','1','S','ROLE_PATIENT,ROLE_DOCTOR',_binary '','2021-11-18 17:19:47');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_info`
--

DROP TABLE IF EXISTS `user_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_info` (
  `id` varchar(15) DEFAULT NULL,
  `password` varchar(500) DEFAULT NULL,
  `isAccountNonexpired` int DEFAULT NULL,
  `isAccountNonLocked` int DEFAULT NULL,
  `isCredentialsNonExpired` int DEFAULT NULL,
  `isEnabled` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_info`
--

LOCK TABLES `user_info` WRITE;
/*!40000 ALTER TABLE `user_info` DISABLE KEYS */;
INSERT INTO `user_info` VALUES ('TEST','1234',1,1,1,1);
/*!40000 ALTER TABLE `user_info` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-21  9:42:04

-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: javawebdb
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `car`
--

DROP TABLE IF EXISTS `car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `car` (
  `id` int NOT NULL AUTO_INCREMENT,
  `time` float DEFAULT NULL,
  `front_distance` float DEFAULT NULL,
  `left_distance` float DEFAULT NULL,
  `right_distance` float DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=242 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car`
--

LOCK TABLES `car` WRITE;
/*!40000 ALTER TABLE `car` DISABLE KEYS */;
INSERT INTO `car` VALUES (1,0,25.45,61.4,32.22,NULL),(2,1.06,25.55,71.4,32.22,NULL),(3,2.242,25.45,303.12,32.34,NULL),(4,3.191,25.43,303.02,34.29,NULL),(5,4.262,17.72,302.6,32.22,NULL),(6,5.422,42.59,303.12,32.22,NULL),(7,6.431,19.57,303.12,32.22,NULL),(8,7.552,19.88,303.12,32.22,NULL),(9,8.559,19.84,303.12,32.22,NULL),(10,9.628,35.83,302.72,32.22,NULL),(11,10.793,54.09,302.71,32.22,NULL),(12,11.765,54.12,303.12,32.22,NULL),(13,12.867,53.31,302.71,32.24,NULL),(14,13.957,54.53,303.12,32.22,NULL),(15,15.014,54.95,303.12,34.29,NULL),(16,16.087,54.55,303.12,34.31,NULL),(17,17.167,54.45,303.12,34.29,NULL),(18,18.245,54.5,303.12,32.22,NULL),(19,19.32,54.91,303.12,32.22,NULL),(20,20.398,19.4,303.14,32.22,NULL),(21,21.481,19.4,303.12,32.22,NULL),(22,22.503,19.02,303.12,32.22,NULL),(23,23.619,19.47,303.03,32.22,NULL),(24,24.696,19.45,303.02,32.22,NULL),(25,25.767,19.43,303.03,32.24,NULL),(26,26.827,19.43,303.03,34.29,NULL),(27,27.915,19.4,303.12,34.29,NULL),(28,28.935,19.81,303.12,34.29,NULL),(29,30.071,19.83,303.1,34.29,NULL),(30,31.154,19.81,303.14,32.22,NULL),(31,32.204,19.79,303.12,32.22,NULL),(32,33.282,19.41,302.74,32.22,NULL),(33,34.307,19.4,303.1,32.22,NULL),(34,35.394,19.4,302.72,32.22,NULL),(35,36.512,19,303.14,32.22,NULL),(36,37.568,18.98,303.09,32.22,NULL),(37,38.653,18.95,303.02,32.22,NULL),(38,39.732,18.95,303.02,34.29,NULL),(39,40.804,18.93,303.02,34.29,NULL),(40,41.828,18.95,303.02,34.29,NULL),(41,42.908,18.93,303.12,32.24,NULL),(42,44.024,18.93,303.1,32.22,NULL),(43,45.082,18.91,303.1,32.22,NULL),(44,46.172,18.9,302.72,32.22,NULL),(45,47.224,18.88,303.1,32.22,NULL),(46,48.265,18.88,303.1,32.22,NULL),(47,49.398,18.88,302.71,32.22,NULL),(48,50.469,18.88,303.12,34.29,NULL),(49,51.521,18.88,303.14,34.29,NULL),(50,52.701,18.88,303.12,34.29,NULL),(51,53.68,18.76,303.12,34.29,NULL),(52,54.732,18.86,303.12,32.22,NULL),(53,55.853,18.93,303.14,32.22,NULL),(54,56.992,40.1,71.74,32.22,NULL),(55,57.996,40.12,302.6,32.22,NULL),(56,59.125,40.12,303.02,32.22,NULL),(57,60.142,39.64,303.12,32.22,NULL),(58,61.159,42.52,303.12,32.22,NULL),(59,62.262,40.12,303.12,34.29,NULL),(60,63.384,42.52,302.71,34.29,NULL),(61,64.514,42.4,303.12,34.29,NULL),(62,65.499,42.5,302.72,34.31,NULL),(63,66.611,42.41,302.72,34.29,NULL),(64,67.681,42.52,302.6,32.22,NULL),(65,68.714,42.52,303.12,32.22,NULL),(66,69.834,17.33,303.12,32.22,NULL),(67,70.954,19.02,302.72,34.29,NULL),(68,71.995,19.07,303.12,34.29,NULL),(69,72.995,36.67,303.12,34.29,NULL),(70,74.079,19.17,303.12,34.31,NULL),(71,75.242,19.16,303.12,34.29,NULL),(72,76.242,19.57,303,34.29,NULL),(73,77.354,18.67,64.91,34.31,NULL),(74,78.464,41.98,303,34.29,NULL),(75,79.434,42.52,303.12,34.29,NULL),(76,80.475,41.97,303.12,32.22,NULL),(77,81.601,42.5,303.12,32.22,NULL),(78,82.68,42.47,302.72,32.31,NULL),(79,83.737,42.36,303.12,32.22,NULL),(80,84.814,42.47,303.03,32.22,NULL),(81,85.893,42.48,303.12,32.33,NULL),(82,86.929,41.98,302.71,34.29,NULL),(83,88.024,42.09,303.12,34.29,NULL),(84,89.114,41.97,303.12,34.29,NULL),(85,90.19,42.5,303.14,34.29,NULL),(86,91.292,42.38,303.14,32.34,NULL),(87,92.323,42.5,64.28,34.29,NULL),(88,93.346,25.43,303.12,32.22,NULL),(89,94.434,55.78,303,32.24,NULL),(90,95.548,55.78,303,32.24,NULL),(91,96.614,54.52,303,34.31,NULL),(92,97.792,42.72,303.1,34.29,NULL),(93,98.816,41.33,303.02,34.31,NULL),(94,99.834,42.53,303.12,34.29,NULL),(95,101.015,26.28,303.02,34.29,NULL),(96,102.069,54.12,303.02,34.29,NULL),(97,103.164,54.98,303.1,32.24,NULL),(98,104.147,25.62,302.69,32.34,NULL),(99,105.266,19.97,302.71,32.34,NULL),(100,106.256,53.78,303.12,32.33,NULL),(101,107.407,21.81,303.1,34.29,NULL),(102,108.486,52.48,303.1,34.29,NULL),(103,109.6,20.24,303.1,34.29,NULL),(104,110.585,20.22,303,34.29,NULL),(105,111.654,55.36,303.12,34.29,NULL),(106,112.725,55.81,303.1,32.24,NULL),(107,113.891,55.81,303.12,32.34,NULL),(108,114.907,55.26,303.1,32.33,NULL),(109,116.003,40.03,303.12,32.22,NULL),(110,117.053,18.83,303.1,32.22,NULL),(111,118.107,20.79,303.1,32.22,NULL),(112,119.203,20.78,303.02,34.29,NULL),(113,120.253,21.16,303.1,34.29,NULL),(114,121.355,21.14,303.1,34.4,NULL),(115,122.505,20.14,303.1,34.29,NULL),(116,123.534,19.83,303.07,34.29,NULL),(117,124.674,42.52,303.14,34.29,NULL),(118,125.653,25.43,303.12,34.29,NULL),(119,126.656,44.22,303.12,34.29,NULL),(120,127.787,22.1,303.14,32.34,NULL),(121,128.851,21.6,303.12,34.29,NULL),(122,129.939,21.21,303.02,34.31,NULL),(123,130.995,22.59,303.12,34.29,NULL),(124,132.046,21.14,303.12,34.31,NULL),(125,133.142,21.22,303.14,34.31,NULL),(126,134.22,22.47,303.12,34.31,NULL),(127,135.292,21.17,303.12,34.29,NULL),(128,136.364,20.66,303.14,34.31,NULL),(129,137.448,21.12,303.02,32.24,NULL),(130,138.487,20.74,303,32.22,NULL),(131,139.589,21.17,303.02,34.29,NULL),(132,140.674,21.62,303.12,34.29,NULL),(133,141.74,21.21,303.1,34.29,NULL),(134,142.842,25.55,302.71,34.29,NULL),(135,143.876,25.78,303.12,34.29,NULL),(136,144.917,42.52,303.02,34.29,NULL),(137,146.025,42.72,303.14,34.29,NULL),(138,147.114,42.83,303.02,34.29,NULL),(139,148.193,42.52,303.14,32.34,NULL),(140,149.25,20.12,302.74,34.29,NULL),(141,150.343,19.45,303.12,34.29,NULL),(142,151.425,20.64,303.02,34.31,NULL),(143,152.484,19,303,34.29,NULL),(144,153.559,21.03,303.12,34.31,NULL),(145,154.599,21.53,303.12,34.31,NULL),(146,155.692,19.47,303.1,34.31,NULL),(147,156.783,19.43,302.72,34.31,NULL),(148,157.8,19.81,302.59,32.24,NULL),(149,158.926,21.05,303.02,34.29,NULL),(150,160.003,20.6,303.1,34.29,NULL),(151,161.081,21,302.72,34.29,NULL),(152,162.148,35.33,303.1,34.29,NULL),(153,163.22,20.62,302.71,34.29,NULL),(154,164.261,20.62,302.59,34.29,NULL),(155,165.363,20.98,302.71,34.29,NULL),(156,166.433,19.81,302.71,34.29,NULL),(157,167.526,19.78,303.1,34.4,NULL),(158,168.578,19.36,303.14,32.24,NULL),(159,169.66,19.34,303.14,34.29,NULL),(160,170.69,19.29,303.12,34.29,NULL),(161,171.783,42.86,65.57,34.29,NULL),(162,172.86,42.52,302.72,34.29,NULL),(163,173.951,42.41,302.71,34.29,NULL),(164,175.089,42.53,303.02,34.29,NULL),(165,176.15,42.43,302.72,34.31,NULL),(166,177.234,42.53,303,34.29,NULL),(167,178.266,42.55,65.47,34.29,NULL),(168,179.375,35.36,302.6,34.29,NULL),(169,180.497,35.38,303.03,32.22,NULL),(170,181.521,42.52,303.12,34.29,NULL),(171,182.543,34.95,303.12,34.29,NULL),(172,183.575,42.43,303.12,34.29,NULL),(173,184.786,42.84,303.12,34.29,NULL),(174,185.866,34.1,302.71,34.29,NULL),(175,186.874,42.74,303.1,34.31,NULL),(176,187.966,34.52,303.1,34.29,NULL),(177,189.075,43.72,303.12,34.29,NULL),(178,190.104,34.5,302.71,32.24,NULL),(179,191.126,43.21,302.71,32.34,NULL),(180,192.214,43.1,302.71,34.31,NULL),(181,193.325,34.52,302.72,34.29,NULL),(182,194.433,42.62,302.71,34.29,NULL),(183,195.525,35.38,303.12,34.31,NULL),(184,196.464,42.48,303.12,34.29,NULL),(185,197.626,42.67,302.72,34.29,NULL),(186,198.742,42.86,302.72,34.29,NULL),(187,199.727,42.59,302.6,32.22,NULL),(188,200.861,42.59,303.12,32.22,NULL),(189,201.965,42.52,303.12,34.29,NULL),(190,202.985,43,303.12,34.29,NULL),(191,204.034,40.02,303.12,34.29,NULL),(192,205.06,42.62,302.62,34.29,NULL),(193,206.176,34.16,303.02,34.29,NULL),(194,207.255,42.57,302.72,34.29,NULL),(195,208.331,42.47,303.02,34.29,NULL),(196,209.362,40.14,302.72,34.29,NULL),(197,210.461,35.31,302.74,34.29,NULL),(198,211.553,34.21,302.71,34.28,NULL),(199,212.611,43.66,302.71,34.28,NULL),(200,213.697,42.57,302.72,34.28,NULL),(201,214.735,42.48,303.12,34.29,NULL),(202,215.847,42.59,303.05,34.29,NULL),(203,216.911,40.14,303.12,34.29,NULL),(204,218.008,42.5,302.72,34.29,NULL),(205,219.076,42.55,303.14,34.29,NULL),(206,220.156,43.26,303.14,34.29,NULL),(207,221.223,42.55,303.14,34.29,NULL),(208,222.258,42.47,303.12,34.29,NULL),(209,223.367,34.17,303.12,34.29,NULL),(210,224.452,46.48,302.72,34.29,NULL),(211,225.517,42.48,302.72,34.29,NULL),(212,226.592,42.6,302.72,34.29,NULL),(213,227.675,39.62,303.12,34.29,NULL),(214,228.712,42.55,303.02,34.29,NULL),(215,229.82,44.02,303.12,34.29,NULL),(216,230.889,19.14,302.72,34.29,NULL),(217,231.972,51.12,303.14,34.29,NULL),(218,233.058,42.53,302.67,34.29,NULL),(219,234.109,52.03,303.03,34.29,NULL),(220,235.144,42.47,303.14,34.29,NULL),(221,236.281,34.22,303.14,34.4,NULL),(222,237.341,42.48,303.03,34.29,NULL),(223,238.417,40.12,303.14,34.29,NULL),(224,239.504,42.47,303.14,34.29,NULL),(225,240.586,53.14,303.12,34.29,NULL),(226,241.615,42.97,303.14,34.29,NULL),(227,242.686,42.48,302.72,34.29,NULL),(228,243.801,42.62,302.74,34.29,NULL),(229,244.878,42.88,302.71,34.29,NULL),(230,245.97,43,302.72,34.29,NULL),(231,247.013,42.48,302.72,34.29,NULL),(232,248.055,42.59,303.02,34.29,NULL),(233,249.171,42.57,302.72,34.4,NULL),(234,250.24,42.59,303.02,34.29,NULL),(235,251.328,42.59,302.74,34.29,NULL),(236,252.401,42.47,302.72,34.29,NULL),(237,253.464,42.57,303.14,34.29,NULL),(238,254.525,35.4,303.14,34.29,NULL),(239,255.629,40.43,303.12,34.29,NULL),(240,256.709,42.62,303.12,34.29,NULL),(241,257.775,39.71,303.12,34.29,NULL);
/*!40000 ALTER TABLE `car` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `robot`
--

DROP TABLE IF EXISTS `robot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `robot` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `imgpath` varchar(200) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `color` varchar(20) DEFAULT NULL,
  `size` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `robot`
--

LOCK TABLES `robot` WRITE;
/*!40000 ALTER TABLE `robot` DISABLE KEYS */;
INSERT INTO `robot` VALUES (1,'robot1','/robotimg/1_1697544839520_微信图片_20231017201328.jpg','Z1','blue','Large');
/*!40000 ALTER TABLE `robot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `robotphoto`
--

DROP TABLE IF EXISTS `robotphoto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `robotphoto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `robotid` int NOT NULL,
  `photopath` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `robotid` (`robotid`),
  CONSTRAINT `robotphoto_ibfk_1` FOREIGN KEY (`robotid`) REFERENCES `robot` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `robotphoto`
--

LOCK TABLES `robotphoto` WRITE;
/*!40000 ALTER TABLE `robotphoto` DISABLE KEYS */;
/*!40000 ALTER TABLE `robotphoto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `robotrecord`
--

DROP TABLE IF EXISTS `robotrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `robotrecord` (
  `id` int NOT NULL,
  `avgtime` float DEFAULT NULL,
  `score` float DEFAULT NULL,
  `path` varchar(200) DEFAULT NULL,
  `speed` float DEFAULT NULL,
  KEY `id` (`id`),
  CONSTRAINT `robotrecord_ibfk_1` FOREIGN KEY (`id`) REFERENCES `robot` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `robotrecord`
--

LOCK TABLES `robotrecord` WRITE;
/*!40000 ALTER TABLE `robotrecord` DISABLE KEYS */;
INSERT INTO `robotrecord` VALUES (1,125.1,100,NULL,20);
/*!40000 ALTER TABLE `robotrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_robot`
--

DROP TABLE IF EXISTS `user_robot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_robot` (
  `userid` int DEFAULT NULL,
  `robotid` int DEFAULT NULL,
  KEY `userid` (`userid`),
  KEY `robotid` (`robotid`),
  CONSTRAINT `user_robot_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `userinfo` (`id`),
  CONSTRAINT `user_robot_ibfk_2` FOREIGN KEY (`robotid`) REFERENCES `robot` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_robot`
--

LOCK TABLES `user_robot` WRITE;
/*!40000 ALTER TABLE `user_robot` DISABLE KEYS */;
INSERT INTO `user_robot` VALUES (1,1);
/*!40000 ALTER TABLE `user_robot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userinfo`
--

DROP TABLE IF EXISTS `userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userinfo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userinfo`
--

LOCK TABLES `userinfo` WRITE;
/*!40000 ALTER TABLE `userinfo` DISABLE KEYS */;
INSERT INTO `userinfo` VALUES (1,'user','pass'),(2,'zhi','123'),(3,'user2','pass2');
/*!40000 ALTER TABLE `userinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userprofile`
--

DROP TABLE IF EXISTS `userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userprofile` (
  `id` int NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `imgpath` varchar(200) DEFAULT NULL,
  KEY `id` (`id`),
  CONSTRAINT `userprofile_ibfk_1` FOREIGN KEY (`id`) REFERENCES `userinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userprofile`
--

LOCK TABLES `userprofile` WRITE;
/*!40000 ALTER TABLE `userprofile` DISABLE KEYS */;
INSERT INTO `userprofile` VALUES (1,'test@example.com','1111111111',NULL),(2,'zhiqinglin@bupt.edu.cn','111',NULL),(3,'user2\'s email','11111111',NULL);
/*!40000 ALTER TABLE `userprofile` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-18 21:50:57
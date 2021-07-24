-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: lab4
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
-- Table structure for table `batdongsan`
--

DROP TABLE IF EXISTS `batdongsan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `batdongsan` (
  `MaBDS` int NOT NULL,
  `DiaChiBDS` varchar(50) DEFAULT NULL,
  `MaKN3` int DEFAULT NULL,
  PRIMARY KEY (`MaBDS`),
  KEY `MaKN3` (`MaKN3`),
  CONSTRAINT `MaKN3` FOREIGN KEY (`MaKN3`) REFERENCES `chusohuu` (`MaCSH`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batdongsan`
--

LOCK TABLES `batdongsan` WRITE;
/*!40000 ALTER TABLE `batdongsan` DISABLE KEYS */;
INSERT INTO `batdongsan` VALUES (4,'Hà Nội',1),(5,'HCM',2),(6,'Nha Trang',3),(7,'Đà Nẵng',4),(8,'Hạ Long',5);
/*!40000 ALTER TABLE `batdongsan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chusohuu`
--

DROP TABLE IF EXISTS `chusohuu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chusohuu` (
  `MaCSH` int NOT NULL,
  `TenCSH` varchar(45) DEFAULT NULL,
  `DiaChiCSH` varchar(50) DEFAULT NULL,
  `SdtCSH` varchar(13) DEFAULT NULL,
  PRIMARY KEY (`MaCSH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chusohuu`
--

LOCK TABLES `chusohuu` WRITE;
/*!40000 ALTER TABLE `chusohuu` DISABLE KEYS */;
INSERT INTO `chusohuu` VALUES (1,'Kiên','HCM','123456789'),(2,'Trinh','Hà Nội','534534563'),(3,'Kiệt','Phan Thiết','942345623'),(4,'Hoà','Vũng Tàu','336443559'),(5,'Quyên','Nha Trang','643494218');
/*!40000 ALTER TABLE `chusohuu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nhanvien`
--

DROP TABLE IF EXISTS `nhanvien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nhanvien` (
  `MaNV` int NOT NULL,
  `TenNV` varchar(45) DEFAULT NULL,
  `ChucVu` varchar(30) DEFAULT NULL,
  `MaKN1` int DEFAULT NULL,
  PRIMARY KEY (`MaNV`),
  KEY `MaKN1` (`MaKN1`),
  CONSTRAINT `MaKN1` FOREIGN KEY (`MaKN1`) REFERENCES `vanphong` (`MaVP`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nhanvien`
--

LOCK TABLES `nhanvien` WRITE;
/*!40000 ALTER TABLE `nhanvien` DISABLE KEYS */;
INSERT INTO `nhanvien` VALUES (14,'Duy','Trưởng phòng',9),(15,'Dũng','Nhân viên',10),(16,'Hà','Trưởng phòng',11),(17,'Đạt','Trưởng phòng',12),(18,'Bình','Nhân viên',13);
/*!40000 ALTER TABLE `nhanvien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thannhan`
--

DROP TABLE IF EXISTS `thannhan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thannhan` (
  `MaTN` int NOT NULL,
  `TenTN` varchar(45) DEFAULT NULL,
  `NgaySinh` date DEFAULT NULL,
  `MoiQH` varchar(40) DEFAULT NULL,
  `MaKN` int DEFAULT NULL,
  PRIMARY KEY (`MaTN`),
  KEY `MaKN` (`MaKN`),
  CONSTRAINT `MaKN` FOREIGN KEY (`MaKN`) REFERENCES `nhanvien` (`MaNV`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thannhan`
--

LOCK TABLES `thannhan` WRITE;
/*!40000 ALTER TABLE `thannhan` DISABLE KEYS */;
INSERT INTO `thannhan` VALUES (19,'Đầm','1976-08-22','Mẹ',14),(20,'Loan','1976-08-22','Cha',15),(21,'Huệ','1976-08-22','Bà nội',16),(22,'Phong','1976-08-22','Anh trai',17),(23,'Ngọc','1976-08-22','Chị dâu',18);
/*!40000 ALTER TABLE `thannhan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vanphong`
--

DROP TABLE IF EXISTS `vanphong`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vanphong` (
  `MaVP` int NOT NULL,
  `DiaChi` varchar(50) DEFAULT NULL,
  `MaKN2` int DEFAULT NULL,
  PRIMARY KEY (`MaVP`),
  KEY `MaKN2` (`MaKN2`),
  CONSTRAINT `MaKN2` FOREIGN KEY (`MaKN2`) REFERENCES `batdongsan` (`MaBDS`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vanphong`
--

LOCK TABLES `vanphong` WRITE;
/*!40000 ALTER TABLE `vanphong` DISABLE KEYS */;
INSERT INTO `vanphong` VALUES (9,'Hà Nội',4),(10,'HCM',5),(11,'Hà Nội',6),(12,'Phan Thiết',7),(13,'Bình Dương',8);
/*!40000 ALTER TABLE `vanphong` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-13  8:37:10

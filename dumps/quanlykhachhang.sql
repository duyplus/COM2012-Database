-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: quanlykhachhang
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
-- Table structure for table `hoadon`
--

DROP TABLE IF EXISTS `hoadon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hoadon` (
  `MaHD` int NOT NULL,
  `NgayMH` date DEFAULT NULL,
  `MaKH` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TrangThai` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`MaHD`),
  KEY `fkhoadonkhachhang` (`MaKH`),
  CONSTRAINT `fkhoadonkhachhang` FOREIGN KEY (`MaKH`) REFERENCES `khachhang` (`MaKH`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hoadon`
--

LOCK TABLES `hoadon` WRITE;
/*!40000 ALTER TABLE `hoadon` DISABLE KEYS */;
INSERT INTO `hoadon` VALUES (1,'2016-12-22','5','Đã thanh toán'),(2,'2016-02-16','3','Chưa thanh toán'),(3,'2016-11-05','2','Chưa thanh toán'),(4,'2016-12-09','4','Đã thanh toán'),(5,'2016-12-11','1','Chưa thanh toán'),(6,'2019-02-28','KH001','Đã thanh toán'),(7,'2020-07-15','KH003','Đã thanh toán'),(8,'2016-12-05','KH006','Chưa thanh toán');
/*!40000 ALTER TABLE `hoadon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hoadonchitiet`
--

DROP TABLE IF EXISTS `hoadonchitiet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hoadonchitiet` (
  `MaHD` int NOT NULL,
  `MaSP` int NOT NULL,
  `SLMua` int DEFAULT NULL,
  `MaHDCT` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`MaHDCT`),
  KEY `fkchitiethoadon_idx` (`MaHD`),
  KEY `fkchitietsanpham_idx` (`MaSP`),
  CONSTRAINT `fkchitiethoadon` FOREIGN KEY (`MaHD`) REFERENCES `hoadon` (`MaHD`),
  CONSTRAINT `fkchitietsanpham` FOREIGN KEY (`MaSP`) REFERENCES `sanpham` (`MaSP`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hoadonchitiet`
--

LOCK TABLES `hoadonchitiet` WRITE;
/*!40000 ALTER TABLE `hoadonchitiet` DISABLE KEYS */;
INSERT INTO `hoadonchitiet` VALUES (1,3,22,1),(2,5,8,2),(3,1,57,3),(4,2,84,4),(5,4,54,5),(6,7,83,6),(7,8,59,7),(8,6,12,8);
/*!40000 ALTER TABLE `hoadonchitiet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `khachhang`
--

DROP TABLE IF EXISTS `khachhang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `khachhang` (
  `MaKH` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `HoVaTenLot` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Ten` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DiaChi` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DienThoai` varchar(13) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`MaKH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khachhang`
--

LOCK TABLES `khachhang` WRITE;
/*!40000 ALTER TABLE `khachhang` DISABLE KEYS */;
INSERT INTO `khachhang` VALUES ('1','Nguyen Hoang','Duy','Phan Thiết','duynguyen@gmail.com','0123456789'),('2','Nguyen Hoang','Dung','Đà Nẵng','hoangdung@gmail.com','0123456788'),('3','Nguyen Thi','Thu','Hà Nội','nguyenthu@gmail.com','0123456787'),('4','Tran Thuy','Ha','Gia Lai','hathuytran@gmail.com','0123456786'),('5','Nguyen Thanh','Thuy','Đà Nẵng','thuynguyen@gmail.com','0123456785'),('6','Tran Thi','Dam','An Giang','damtranthi@gmail.com','0123456784'),('7','Hoang Thuy','Hanh','Hồ Chí Minh','hanhthuyh@gmail.com','0123456783'),('KH001','Duong Quy','Anh','Vũng Tàu','duongcam@gmail.com','0123456782'),('KH003','Nguyen Xuan','Dao','Phan Thiết','daonguyen@gmail.com','0123456781'),('KH006','Huynh Ba','Loc','Hà Nội','lochuynh@gmail.com','0123456780');
/*!40000 ALTER TABLE `khachhang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sanpham`
--

DROP TABLE IF EXISTS `sanpham`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sanpham` (
  `MaSP` int NOT NULL AUTO_INCREMENT,
  `MoTa` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SoLuong` int unsigned DEFAULT NULL,
  `DonGia` double unsigned DEFAULT NULL,
  `TenSP` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`MaSP`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sanpham`
--

LOCK TABLES `sanpham` WRITE;
/*!40000 ALTER TABLE `sanpham` DISABLE KEYS */;
INSERT INTO `sanpham` VALUES (1,'Iphone',199,700,'Iphone 7 32GB'),(2,'Mouse',246,750,'Chuột máy tính'),(3,'Mainboard',834,2100,'Bo mạch chủ'),(4,'Touchpad',518,1380,'Bàn di chuột cảm ứng'),(5,'RAM',325,1700,'Bộ nhớ'),(6,'Keyboard',500,930,'Bàn phim cơ'),(7,'Keywin',745,1020,'Key windows 10'),(8,'Headphone',257,475,'Tai nghe');
/*!40000 ALTER TABLE `sanpham` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-13  8:37:21

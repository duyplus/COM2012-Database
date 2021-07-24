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
  `maHoaDon` int NOT NULL,
  `ngayMuaHang` date DEFAULT NULL,
  `maKhachHang` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `trangThai` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`maHoaDon`),
  KEY `fkhoadonkhachhang` (`maKhachHang`),
  CONSTRAINT `fkhoadonkhachhang` FOREIGN KEY (`maKhachHang`) REFERENCES `khachhang` (`maKhachHang`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hoadon`
--

LOCK TABLES `hoadon` WRITE;
/*!40000 ALTER TABLE `hoadon` DISABLE KEYS */;
INSERT INTO `hoadon` VALUES (1,'2021-08-22','5','Da thanh toan'),(2,'2020-02-16','3','Chua thanh toan'),(3,'2019-11-05','2','Chua thanh toan'),(4,'2020-01-28','4','Da thanh toan'),(5,'2021-03-11','1','Da thanh toan');
/*!40000 ALTER TABLE `hoadon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hoadonchitiet`
--

DROP TABLE IF EXISTS `hoadonchitiet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hoadonchitiet` (
  `maHoaDon` int NOT NULL,
  `maSanPham` int NOT NULL,
  `soLuong` int DEFAULT NULL,
  `maHoaDonChiTiet` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`maHoaDonChiTiet`),
  KEY `fkchitiethoadon_idx` (`maHoaDon`),
  KEY `fkchitietsanpham_idx` (`maSanPham`),
  CONSTRAINT `fkchitiethoadon` FOREIGN KEY (`maHoaDon`) REFERENCES `hoadon` (`maHoaDon`),
  CONSTRAINT `fkchitietsanpham` FOREIGN KEY (`maSanPham`) REFERENCES `sanpham` (`maSanPham`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hoadonchitiet`
--

LOCK TABLES `hoadonchitiet` WRITE;
/*!40000 ALTER TABLE `hoadonchitiet` DISABLE KEYS */;
INSERT INTO `hoadonchitiet` VALUES (4,3,3,1),(2,5,5,2),(3,2,7,3),(5,1,9,4),(1,4,10,5);
/*!40000 ALTER TABLE `hoadonchitiet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `khachhang`
--

DROP TABLE IF EXISTS `khachhang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `khachhang` (
  `maKhachHang` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `hoVaTenLot` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Ten` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `diaChi` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dienThoai` varchar(13) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`maKhachHang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khachhang`
--

LOCK TABLES `khachhang` WRITE;
/*!40000 ALTER TABLE `khachhang` DISABLE KEYS */;
INSERT INTO `khachhang` VALUES ('1','Nguyen Hoang','Duy','Phan Thiet','a@gmail.com','0123456789'),('2','Nguyen Hoang','Dung','Ho Chi Minh','b@gmail.com','0123456788'),('3','Nguyen Thi','Thu','Ha Noi','c@gmail.com','0123456787'),('4','Tran Thuy','Linh','Gia Lai','d@gmail.com','0123456786'),('5','Nguyen Thanh','Thuy','Phan Thiet','e@gmail.com','0123456785');
/*!40000 ALTER TABLE `khachhang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sanpham`
--

DROP TABLE IF EXISTS `sanpham`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sanpham` (
  `maSanPham` int NOT NULL AUTO_INCREMENT,
  `moTa` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `soLuong` int unsigned DEFAULT NULL,
  `donGia` double unsigned DEFAULT NULL,
  `tenSP` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`maSanPham`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sanpham`
--

LOCK TABLES `sanpham` WRITE;
/*!40000 ALTER TABLE `sanpham` DISABLE KEYS */;
INSERT INTO `sanpham` VALUES (1,'Ban phim may tinh',10,123,'Keyboard'),(2,'Chuot ban phim',5,300,'Mouse'),(3,'Bo mach chu',7,450,'MainBoard'),(4,'Ban di chuot cam ung',3,200,'TouchPad'),(5,'Bo nho',9,100,'RAM');
/*!40000 ALTER TABLE `sanpham` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'quanlykhachhang'
--

--
-- Dumping routines for database 'quanlykhachhang'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-23 15:46:48

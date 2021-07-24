-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mssv
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
  `MaHD` varchar(10) NOT NULL,
  `NgayLapHD` date NOT NULL,
  `TongTien` float NOT NULL,
  `TrangThai` varchar(20) NOT NULL,
  `MaNV` varchar(10) NOT NULL,
  `MaKH` varchar(10) NOT NULL,
  PRIMARY KEY (`MaHD`),
  KEY `FK_HD1` (`MaNV`),
  KEY `FK_HD2` (`MaKH`),
  CONSTRAINT `FK_HD1` FOREIGN KEY (`MaNV`) REFERENCES `nhanvien` (`MaNV`),
  CONSTRAINT `FK_HD2` FOREIGN KEY (`MaKH`) REFERENCES `khachhang` (`MaKH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hoadon`
--

LOCK TABLES `hoadon` WRITE;
/*!40000 ALTER TABLE `hoadon` DISABLE KEYS */;
INSERT INTO `hoadon` VALUES ('HD001','2019-01-20',20000000,'Đã thanh toán','NV004','KH003'),('HD002','2019-02-09',27000000,'Chưa thanh toán','NV002','KH001'),('HD003','2019-01-22',50000000,'Thanh toán qua thẻ','NV005','KH004'),('HD004','2019-02-03',60000000,'Đã thanh toán','NV003','KH003'),('HD005','2019-01-29',80000000,'Chưa thanh toán','NV003','KH005'),('HD006','2018-01-29',30000000,'Chưa thanh toán','NV003','KH007'),('HD007','2018-01-29',80000000,'Đã Thanh Toán','NV002','KH010'),('HD008','2018-01-29',20000000,'Chưa thanh toán','NV003','KH001'),('HD009','2018-01-29',10000000,'Đã Thanh Toán','NV003','KH006'),('HD010','2018-01-29',10000000,'Chưa thanh toán','NV001','KH008'),('HD011','2018-01-29',40000000,'Chưa thanh toán','NV002','KH009'),('HD012','2018-01-29',50000000,'Đã Thanh Toán','NV005','KH002'),('HD013','2018-01-29',20000000,'Đã thanh toán','NV001','KH003'),('HD014','2018-01-29',30000000,'Đã thanh toán','NV003','KH011'),('HD015','2018-01-29',70000000,'Đã thanh toán','NV002','KH015'),('HD016','2018-01-29',80000000,'Chưa thanh toán','NV004','KH020'),('HD017','2018-01-29',60000000,'Chưa thanh toán','NV004','KH021'),('HD018','2018-01-29',90000000,'Chưa thanh toán','NV005','KH020'),('HD019','2018-01-29',50000000,'Chưa thanh toán','NV001','KH003'),('HD020','2018-01-29',40000000,'Chưa thanh toán','NV002','KH004'),('HD021','2018-01-29',24000000,'Chưa thanh toán','NV003','KH009'),('HD022','2018-01-29',12000000,'Chưa thanh toán','NV002','KH008'),('HD023','2018-01-29',21000000,'Chưa thanh toán','NV003','KH016'),('HD024','2018-01-29',22000000,'Chưa thanh toán','NV005','KH013'),('HD025','2018-01-29',32000000,'Chưa thanh toán','NV004','KH011'),('HD026','2018-01-29',19000000,'Chưa thanh toán','NV003','KH010'),('HD027','2018-01-29',17500000,'Chưa thanh toán','NV001','KH001'),('HD028','2018-01-29',12550000,'Chưa thanh toán','NV002','KH001'),('HD029','2018-01-29',7000000,'Chưa thanh toán','NV001','KH002');
/*!40000 ALTER TABLE `hoadon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hoadonchitiet`
--

DROP TABLE IF EXISTS `hoadonchitiet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hoadonchitiet` (
  `MaHD` varchar(10) NOT NULL,
  `MaSP` varchar(10) NOT NULL,
  `SoLuongMua` int NOT NULL,
  PRIMARY KEY (`MaHD`,`MaSP`),
  KEY `FK_HDCT2` (`MaSP`),
  CONSTRAINT `FK_HDCT1` FOREIGN KEY (`MaHD`) REFERENCES `hoadon` (`MaHD`),
  CONSTRAINT `FK_HDCT2` FOREIGN KEY (`MaSP`) REFERENCES `sanpham` (`MaSP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hoadonchitiet`
--

LOCK TABLES `hoadonchitiet` WRITE;
/*!40000 ALTER TABLE `hoadonchitiet` DISABLE KEYS */;
INSERT INTO `hoadonchitiet` VALUES ('HD001','SP001',1),('HD002','SP003',1),('HD002','SP004',1),('HD003','SP002',1),('HD003','SP003',1),('HD004','SP001',3),('HD005','SP002',2),('HD005','SP003',1);
/*!40000 ALTER TABLE `hoadonchitiet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `khachhang`
--

DROP TABLE IF EXISTS `khachhang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `khachhang` (
  `MaKH` varchar(10) NOT NULL,
  `HoVaTenLot` varchar(50) DEFAULT NULL,
  `Ten` varchar(50) NOT NULL,
  `DiaChi` varchar(255) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `DienThoai` varchar(20) NOT NULL,
  PRIMARY KEY (`MaKH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khachhang`
--

LOCK TABLES `khachhang` WRITE;
/*!40000 ALTER TABLE `khachhang` DISABLE KEYS */;
INSERT INTO `khachhang` VALUES ('KH001','Trần Trọng','Trí','Gò Vấp','','0983456654'),('KH002','Đàm Vĩnh','Hưng','Quận 3','','0988123567'),('KH003','Châu Đăng','Khoa','Quận 1','','0977874300'),('KH004','Phạm','Hương','Quận 2','','0903090932'),('KH005','Trường','Giang','Bình Thạnh','','0933411154'),('KH006','Hoài','Linh','Phú Nhuận','','0888012381'),('KH007','Mỹ','Tâm','Quận 1','','0977456654'),('KH008','Ưng Hoàng','Phúc','Quận 5','','091950064'),('KH009','Châu Tinh','Trì','Quận 1','','0888456098'),('KH010','Thành','Long','Quận 2','','0903090908'),('KH011','Lý Liên','Kiệt','Tân Bình','','0933410054'),('KH012','Châu Khải','Phong','Quận 1','','0888022411'),('KH013','Vân Quang','Long','Quận 12','','0983456633'),('KH014','Châu Việt','Cường','Quận 8','','0988903664'),('KH015','Ngọc','Sơn','Quận 10','','0977766098'),('KH016','Nguyễn Phi','Hùng','Quận 12','','0903098032'),('KH017','Trịnh Thăng','Bình','Bình Thạnh','','0933477754'),('KH018','Sơn','Tùng M-TP','Tân Phú','','0888029999'),('KH019','Ngô Thanh','Vân','Tân Bình','','0983456890'),('KH020','Trương Quỳnh','Anh','Quận 3','','0888053664'),('KH021','Hoàng Thùy','Linh','Quận 1','','0977000098'),('KH022','Tóc','Tiên','Quận 2','','0903090888'),('KH023','Bích','Phương','Quận 1','','0933411010'),('KH024','Thu','Minh','Quận 9','','0888022223');
/*!40000 ALTER TABLE `khachhang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nhanvien`
--

DROP TABLE IF EXISTS `nhanvien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nhanvien` (
  `MaNV` varchar(10) NOT NULL,
  `HoVaTenLot` varchar(50) DEFAULT NULL,
  `Ten` varchar(50) NOT NULL,
  `DiaChi` varchar(255) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `DienThoai` varchar(20) NOT NULL,
  PRIMARY KEY (`MaNV`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nhanvien`
--

LOCK TABLES `nhanvien` WRITE;
/*!40000 ALTER TABLE `nhanvien` DISABLE KEYS */;
INSERT INTO `nhanvien` VALUES ('NV001','Võ Đình','Hải','Gò Vấp','','0983769320'),('NV002','Lý Minh','Khoa','Quận 3','','0933999100'),('NV003','Vũ Phạm Minh','Châu','Quận 1','','0977333902'),('NV004','Nguyễn Văn','Tuấn','Quận 2','','0903000021'),('NV005','Lê Hoài','Bảo','Bình Thạnh','','0933488854'),('NV006','Trần Duy Bảo','Long','Phú Nhuận','','0888022422');
/*!40000 ALTER TABLE `nhanvien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sanpham`
--

DROP TABLE IF EXISTS `sanpham`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sanpham` (
  `MaSP` varchar(10) NOT NULL,
  `TenSP` varchar(50) DEFAULT NULL,
  `GiaSP` float NOT NULL,
  `SoLuong` int NOT NULL,
  `MoTa` varchar(255) NOT NULL,
  PRIMARY KEY (`MaSP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sanpham`
--

LOCK TABLES `sanpham` WRITE;
/*!40000 ALTER TABLE `sanpham` DISABLE KEYS */;
INSERT INTO `sanpham` VALUES ('SP001','Samsung Galaxy Note 9',20000000,30,'Hàng chính hãng'),('SP002','IPHONE XS MAX',30000000,15,'Hàng chính hãng'),('SP003','IPHONE X',20000000,40,'Hàng xách tay'),('SP004','BPhone 3',70000000,300,'Hàng chính hãng'),('SP005','Oppo F9',7000000,50,'Hàng chính hãng'),('SP006','Samsung Galaxy S9 Plus',18000000,30,'Hàng xách tay');
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

-- Dump completed on 2021-04-13  8:37:17

-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: asm_thuvien
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
-- Table structure for table `chitietpm`
--

DROP TABLE IF EXISTS `chitietpm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chitietpm` (
  `MaPhieu` varchar(10) NOT NULL,
  `MaSach` varchar(10) NOT NULL,
  `GhiChu` varchar(255) NOT NULL,
  PRIMARY KEY (`MaPhieu`,`MaSach`),
  KEY `MaSach` (`MaSach`),
  CONSTRAINT `chitietpm_ibfk_1` FOREIGN KEY (`MaPhieu`) REFERENCES `phieumuon` (`MaPhieu`),
  CONSTRAINT `chitietpm_ibfk_2` FOREIGN KEY (`MaSach`) REFERENCES `sach` (`MaSach`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chitietpm`
--

LOCK TABLES `chitietpm` WRITE;
/*!40000 ALTER TABLE `chitietpm` DISABLE KEYS */;
INSERT INTO `chitietpm` VALUES ('D1','1A','Chưa trả sách'),('D2','3C','Đã trả sách'),('D3','1A','Đã trả sách'),('H1','2B','Đã trả sách'),('K1','4D','Chưa trả sách'),('K2','3C','Đã trả sách'),('L1','4D','Chưa trả sách'),('L2','2B','Đã trả sách'),('T1','4D','Chưa trả sách'),('V1','5E','Chưa trả sách');
/*!40000 ALTER TABLE `chitietpm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loaisach`
--

DROP TABLE IF EXISTS `loaisach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loaisach` (
  `MaLoai` varchar(10) NOT NULL,
  `TenLoai` varchar(50) NOT NULL,
  PRIMARY KEY (`MaLoai`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loaisach`
--

LOCK TABLES `loaisach` WRITE;
/*!40000 ALTER TABLE `loaisach` DISABLE KEYS */;
INSERT INTO `loaisach` VALUES ('DL','Du lịch'),('IT','Công nghệ thông tin'),('KT','Kinh tế'),('NN','Ngoại ngữ'),('VH','Văn học');
/*!40000 ALTER TABLE `loaisach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phieumuon`
--

DROP TABLE IF EXISTS `phieumuon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phieumuon` (
  `MaPhieu` varchar(10) NOT NULL,
  `NgayMuon` date DEFAULT NULL,
  `NgayTra` date DEFAULT NULL,
  `TrangThai` varchar(10) NOT NULL,
  `MaSV` varchar(10) NOT NULL,
  PRIMARY KEY (`MaPhieu`),
  KEY `MaSV` (`MaSV`),
  CONSTRAINT `phieumuon_ibfk_1` FOREIGN KEY (`MaSV`) REFERENCES `sinhvien` (`MaSV`),
  CONSTRAINT `TenRB` CHECK ((`NgayTra` >= `NgayMuon`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phieumuon`
--

LOCK TABLES `phieumuon` WRITE;
/*!40000 ALTER TABLE `phieumuon` DISABLE KEYS */;
INSERT INTO `phieumuon` VALUES ('D1','2017-05-04','2017-05-11','Chưa trả','PS18293'),('D2','2017-03-25','2017-04-02','Đã trả','PS34854'),('D3','2017-04-10','2017-04-17','Đã trả','PS18329'),('H1','2017-07-12','2017-07-19','Chưa trả','PS19432'),('K1','2017-06-22','2017-06-29','Chưa trả','PS63335'),('K2','2017-01-11','2017-01-18','Đã trả','PS30393'),('L1','2017-10-01','2017-10-07','Chưa trả','PS91892'),('L2','2017-05-05','2017-05-12','Chưa trả','PS12941'),('T1','2017-11-08','2017-11-15','Chưa trả','PS12395'),('V1','2017-01-18','2017-01-25','Đã trả','PS24712');
/*!40000 ALTER TABLE `phieumuon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sach`
--

DROP TABLE IF EXISTS `sach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sach` (
  `MaSach` varchar(10) NOT NULL,
  `TenSach` varchar(50) NOT NULL,
  `NhaXuatBan` varchar(50) NOT NULL,
  `TacGia` varchar(50) DEFAULT NULL,
  `SoTrang` int NOT NULL,
  `SoLuongBS` int NOT NULL,
  `GiaTien` float NOT NULL,
  `NgayNhap` date DEFAULT NULL,
  `ViTri` varchar(50) NOT NULL,
  `MaLoai` varchar(50) NOT NULL,
  PRIMARY KEY (`MaSach`),
  KEY `MaLoai` (`MaLoai`),
  CONSTRAINT `sach_ibfk_1` FOREIGN KEY (`MaLoai`) REFERENCES `loaisach` (`MaLoai`),
  CONSTRAINT `sach_chk_1` CHECK ((`SoTrang` > 5)),
  CONSTRAINT `sach_chk_2` CHECK ((`SoLuongBS` > 1)),
  CONSTRAINT `sach_chk_3` CHECK ((`GiaTien` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sach`
--

LOCK TABLES `sach` WRITE;
/*!40000 ALTER TABLE `sach` DISABLE KEYS */;
INSERT INTO `sach` VALUES ('1A','SQL','FPT','Bảo Ninh',156,92,150000,'2014-01-01','a1','KT'),('2B','Javascript','TDT','Stephen Hawking',756,25,210000,'2014-01-02','b2','VH'),('3C','Photoshop','UEF','Dương Thuỵ',456,74,470000,'2015-01-01','c3','IT'),('4D','HTML','NTT','Sơn Nam',656,54,220000,'2015-01-02','d4','DL'),('5E','English','UPT','J.K.Rowling',256,78,180000,'2015-01-03','e5','NN'),('6F','Javascript','FPT','Bảo Ninh',424,63,580000,'2014-01-03','f6','VH'),('7H','English','UEF','Sơn Nam',646,24,880000,'2013-01-01','h7','NN'),('8I','Photoshop','FPT','Dương Thuỵ',735,16,179000,'2013-01-02','i8','IT'),('9U','HTML','TDT','Stephen Hawking',811,21,275000,'2017-01-01','u9','DL'),('Z10','SQL','NTT','J.K.Rowling',429,33,654000,'2017-01-02','z10','KT');
/*!40000 ALTER TABLE `sach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sinhvien`
--

DROP TABLE IF EXISTS `sinhvien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sinhvien` (
  `MaSV` varchar(10) NOT NULL,
  `TenSV` varchar(50) NOT NULL,
  `NgayHetHan` date NOT NULL,
  `ChuyenNganh` varchar(50) DEFAULT NULL,
  `Email` varchar(50) NOT NULL,
  `SDT` varchar(13) NOT NULL,
  PRIMARY KEY (`MaSV`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sinhvien`
--

LOCK TABLES `sinhvien` WRITE;
/*!40000 ALTER TABLE `sinhvien` DISABLE KEYS */;
INSERT INTO `sinhvien` VALUES ('PS12395','Thạch Nhật Tiến','2020-12-02','QTKD','tientnps12395@fpt.edu.vn','0832732442'),('PS12941','Đinh Văn Long','2022-09-18','TĐH','longdvps12395@fpt.edu.vn','0239934356'),('PS18293','Nguyễn Hoàng Duy','2022-09-18','CNTT','duynhps18293@fpt.edu.vn','0919993715'),('PS18329','Nguyễn Xuân Đào','2022-09-18','QTKD','daonxps12395@fpt.edu.vn','0424231234'),('PS19432','Nguyễn Đăng Hưng','2022-09-18','TĐH','hungnvps19432@fpt.edu.vn','0943247731'),('PS24712','Trần Thị Thuý Vân','2024-01-17','K-Beauty','vanntbps29765@fpt.edu.vn','0412738534'),('PS30393','Trần Thị Mỹ Linh','2021-04-12','K-Beauty','linhttmps12395@fpt.edu.vn','0812838313'),('PS34854','Trần Quốc Dũng','2021-04-12','TKĐH','dungnhps34854@fpt.edu.vn','0732524424'),('PS63335','Trần Nam Kiệt','2020-12-02','TKĐH','kiettnps12395@fpt.edu.vn','0823823952'),('PS91892','Ngô Minh Kiên','2021-04-12','DDT','kiennmps12395@fpt.edu.vn','0582313145');
/*!40000 ALTER TABLE `sinhvien` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-22 15:47:35

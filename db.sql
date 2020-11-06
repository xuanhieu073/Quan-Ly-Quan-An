-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: qlbh
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `banan`
--

DROP TABLE IF EXISTS `banan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `banan` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `chinhanhid` int DEFAULT NULL,
  `stt` int DEFAULT NULL,
  `trangthai` int DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `stt_UNIQUE` (`stt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banan`
--

LOCK TABLES `banan` WRITE;
/*!40000 ALTER TABLE `banan` DISABLE KEYS */;
/*!40000 ALTER TABLE `banan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `CatID` int unsigned NOT NULL AUTO_INCREMENT,
  `CatName` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`CatID`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (11,'Thức uống'),(10,'Món lẩu'),(9,'Mì phở'),(8,'Cơm');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chinhanh`
--

DROP TABLE IF EXISTS `chinhanh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chinhanh` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `TenChiNhanh` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DiaChi` varchar(145) DEFAULT NULL,
  `SDT` varchar(13) DEFAULT NULL,
  `IdTinhThanh` int DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chinhanh`
--

LOCK TABLES `chinhanh` WRITE;
/*!40000 ALTER TABLE `chinhanh` DISABLE KEYS */;
INSERT INTO `chinhanh` VALUES (9,'Nguyễn Đình Chiểu','123 Nguyển Đình Chiểu','01234',1),(10,'Đinh Tiên Hoàng','123 Đinh Tiên Hoàng','01234',1);
/*!40000 ALTER TABLE `chinhanh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chitietdonhang`
--

DROP TABLE IF EXISTS `chitietdonhang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chitietdonhang` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `donhangid` int NOT NULL,
  `foodid` int DEFAULT NULL,
  `chinhanhid` int DEFAULT NULL,
  `soluong` int DEFAULT NULL,
  `Price` int DEFAULT NULL,
  `ProName` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=215 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chitietdonhang`
--

LOCK TABLES `chitietdonhang` WRITE;
/*!40000 ALTER TABLE `chitietdonhang` DISABLE KEYS */;
INSERT INTO `chitietdonhang` VALUES (209,97,31,9,1,40000,'Cơm gà hàn quốc'),(210,97,33,9,1,50000,'Cơm bò hầm'),(211,98,31,9,1,40000,'Cơm gà hàn quốc'),(212,98,33,9,2,50000,'Cơm bò hầm'),(213,98,31,9,1,40000,'Cơm gà hàn quốc'),(214,98,33,9,2,50000,'Cơm bò hầm');
/*!40000 ALTER TABLE `chitietdonhang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donhang`
--

DROP TABLE IF EXISTS `donhang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donhang` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `createdate` datetime DEFAULT NULL,
  `userid` int DEFAULT NULL,
  `bananid` int DEFAULT NULL,
  `chinhanhid` int DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donhang`
--

LOCK TABLES `donhang` WRITE;
/*!40000 ALTER TABLE `donhang` DISABLE KEYS */;
INSERT INTO `donhang` VALUES (98,'2020-04-28 22:00:25',14,NULL,NULL);
/*!40000 ALTER TABLE `donhang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menuchinhanh`
--

DROP TABLE IF EXISTS `menuchinhanh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menuchinhanh` (
  `FoodId` int DEFAULT NULL,
  `ChiNhanhId` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menuchinhanh`
--

LOCK TABLES `menuchinhanh` WRITE;
/*!40000 ALTER TABLE `menuchinhanh` DISABLE KEYS */;
INSERT INTO `menuchinhanh` VALUES (31,8),(33,8),(34,8),(35,8),(36,8),(37,8),(38,8),(39,8),(40,8),(41,8),(42,8),(43,8),(31,9),(33,9),(35,9),(38,9),(41,9),(31,10),(33,10),(34,10),(35,10),(36,10),(37,10),(38,10),(39,10),(40,10),(41,10),(42,10),(43,10),(36,9),(44,10),(44,9);
/*!40000 ALTER TABLE `menuchinhanh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `ProID` int unsigned NOT NULL AUTO_INCREMENT,
  `ProName` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `TinyDes` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `FullDes` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Price` int DEFAULT NULL,
  `CatID` int NOT NULL,
  `Quantity` int DEFAULT NULL,
  PRIMARY KEY (`ProID`)
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (31,'Cơm gà hàn quốc','Cơm gà hàn quốc',NULL,40000,8,NULL),(33,'Cơm bò hầm','Cơm bò hầm',NULL,50000,8,NULL),(34,'Cơm niêu','Cơm niêu',NULL,40000,8,NULL),(35,'Mì ý Double B','Mì ý Double B',NULL,50000,9,NULL),(36,'Bún bò gánh','Bún bò gánh',NULL,60000,9,NULL),(37,'Bún bò Huế xưa','Bún bò Huế xưa',NULL,70000,9,NULL),(38,'Lẩu hanuri','Lẩu hanuri',NULL,150000,10,NULL),(39,'Lẩu bò','Lẩu bò',NULL,200000,10,NULL),(40,'Lẩu nấm','Lẩu nấm',NULL,250000,10,NULL),(41,'Trà Hạnh Nhân Đá Xay','Trà Hạnh Nhân Đá Xay',NULL,40000,11,NULL),(42,'Hồng Trà Đác Cam','Hồng Trà Đác Cam',NULL,40000,11,NULL),(43,'Trà Ô Long Sữa','Trà Ô Long Sữa',NULL,40000,11,NULL),(44,'Cà phê đá','Cà phê đá',NULL,10000,12,NULL);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quanhuyen`
--

DROP TABLE IF EXISTS `quanhuyen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quanhuyen` (
  `Id` int NOT NULL,
  `Name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ProvinceId` int DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quanhuyen`
--

LOCK TABLES `quanhuyen` WRITE;
/*!40000 ALTER TABLE `quanhuyen` DISABLE KEYS */;
INSERT INTO `quanhuyen` VALUES (1,'Huyện An Phú',7),(2,'Huyện Châu Phú',7),(3,'Huyện Châu Thành',7),(4,'Huyện Chợ Mới',7),(5,'Huyện Phú Tân',7),(6,'Huyện Thoại Sơn',7),(7,'Huyện Tịnh Biên',7),(8,'Huyện Tri Tôn',7),(9,'Thành phố Long Xuyên',7),(10,'Thị xã Châu Đốc',7),(11,'Thị xã Tân Châu',7),(12,'Huyện Châu Đức',8),(13,'Huyện Côn Đảo',8),(14,'Huyện Đất Đỏ',8),(15,'Huyện Long Điền',8),(16,'Huyện Tân Thành',8),(17,'Huyện Xuyên Mộc',8),(18,'Thành phố Bà Rịa',8),(19,'Thành phố Vũng Tàu',8),(20,'Huyện Hiệp Hòa',9),(21,'Huyện Lạng Giang',9),(22,'Huyện Lục Nam',9),(23,'Huyện Lục Ngạn',9),(24,'Huyện Sơn Động',9),(25,'Huyện Tân Yên',9),(26,'Huyện Việt Yên',9),(27,'Huyện Yên Dũng',9),(28,'Huyện Yên Thế',9),(29,'Thành phố Bắc Giang',9),(30,'Huyện Ba Bể',10),(31,'Huyện Bạch Thông',10),(32,'Huyện Chợ Đồn',10),(33,'Huyện Chợ Mới',10),(34,'Huyện Na Rì',10),(35,'Huyện Ngân Sơn',10),(36,'Huyện Pác Nặm',10),(37,'Thành phố Bắc Kạn',10),(38,'Huyện Đông Hải',11),(39,'Huyện Giá Rai',11),(40,'Huyện Hòa Bình',11),(41,'Huyện Hồng Dân',11),(42,'Huyện Phước Long',11),(43,'Huyện Vĩnh Lợi',11),(44,'Thành phố Bạc Liêu',11),(45,'Huyện Gia Bình',12),(46,'Huyện Lương Tài',12),(47,'Huyện Quế Võ',12),(48,'Huyện Thuận Thành',12),(49,'Huyện Tiên Du',12),(50,'Huyện Yên Phong',12),(51,'Thành phố Bắc Ninh',12),(52,'Thị xã Từ Sơn',12),(53,'Huyện Ba Tri',13),(54,'Huyện Bình Đại',13),(55,'Huyện Châu Thành',13),(56,'Huyện Chợ Lách',13),(57,'Huyện Giồng Trôm',13),(58,'Huyện Mỏ Cày Bắc',13),(59,'Huyện Mỏ Cày Nam',13),(60,'Huyện Thạnh Phú',13),(61,'Thành phố Bến Tre',13),(62,'Huyện An Lão',14),(63,'Huyện Hoài Ân',14),(64,'Huyện Hoài Nhơn',14),(65,'Huyện Phù Cát',14),(66,'Huyện Phù Mỹ',14),(67,'Huyện Tây Sơn',14),(68,'Huyện Tuy Phước',14),(69,'Huyện Vân Canh',14),(70,'Huyện Vĩnh Thạnh',14),(71,'Thành phố Quy Nhơn',14),(72,'Thị xã An Nhơn',14),(73,'Huyện Bến Cát',6),(74,'Huyện Dầu Tiếng',6),(75,'Huyện Phú Giáo',6),(76,'Huyện Tân Uyên',6),(77,'Thành phố Thủ Dầu Một',6),(78,'Thị xã Dĩ An',6),(79,'Thị xã Thuận An',6),(80,'Huyện Bù Đăng',15),(81,'Huyện Bù Đốp',15),(82,'Huyện Bù Gia Mập',15),(83,'Huyện Chơn Thành',15),(84,'Huyện Đồng Phú',15),(85,'Huyện Hớn Quản',15),(86,'Huyện Lộc Ninh',15),(87,'Thị xã Bình Long',15),(88,'Thị xã Đồng Xoài',15),(89,'Thị xã Phước Long',15),(90,'Huyện Bắc Bình',16),(91,'Huyện đảo Phú Quý',16),(92,'Huyện Đức Linh',16),(93,'Huyện Hàm Tân',16),(94,'Huyện Hàm Thuận Bắc',16),(95,'Huyện Hàm Thuận Nam',16),(96,'Huyện Tánh Linh',16),(97,'Huyện Tuy Phong',16),(98,'Thành phố Phan Thiết',16),(99,'Thị xã La Gi',16),(100,'Huyện Cái Nước',17),(101,'Huyện Đầm Dơi',17),(102,'Huyện Năm Căn',17),(103,'Huyện Ngọc Hiển',17),(104,'Huyện Phú Tân',17),(105,'Huyện Thới Bình',17),(106,'Huyện Trần Văn Thời',17),(107,'Huyện U Minh',17),(108,'Thành phố Cà Mau',17),(109,'Huyện Cờ Đỏ',5),(110,'Huyện Phong Điền',5),(111,'Huyện Thới Lai',5),(112,'Huyện Vĩnh Thạnh',5),(113,'Quận Bình Thủy',5),(114,'Quận Cái Răng',5),(115,'Quận Ninh Kiều',5),(116,'Quận Ô Môn',5),(117,'Quận Thốt Nốt',5),(118,'Huyện Bảo Lạc',18),(119,'Huyện Bảo Lâm',18),(120,'Huyện Hạ Lang',18),(121,'Huyện Hà Quảng',18),(122,'Huyện Hòa An',18),(123,'Huyện Nguyên Bình',18),(124,'Huyện Phục Hòa',18),(125,'Huyện Quảng Uyên',18),(126,'Huyện Thạch An',18),(127,'Huyện Thông Nông',18),(128,'Huyện Trà Lĩnh',18),(129,'Huyện Trùng Khánh',18),(130,'Thị xã Cao Bằng',18),(131,'Huyện đảo Hoàng Sa',4),(132,'Huyện Hòa Vang',4),(133,'Quận Cẩm Lệ',4),(134,'Quận Hải Châu',4),(135,'Quận Liên Chiểu',4),(136,'Quận Ngũ Hành Sơn',4),(137,'Quận Sơn Trà',4),(138,'Quận Thanh Khê',4),(139,'Huyện Buôn Đôn',19),(140,'Huyện Cư Kuin',19),(141,'Huyện Cư Mgar',19),(142,'Huyện Ea Hleo',19),(143,'Huyện Ea Kar',19),(144,'Huyện Ea Súp',19),(145,'Huyện Krông Ana',19),(146,'Huyện Krông Bông',19),(147,'Huyện Krông Buk',19),(148,'Huyện Krông Năng',19),(149,'Huyện Krông Pak',19),(150,'Huyện Lắk',19),(151,'Huyện Mdrăk',19),(152,'Thành phố Buôn Ma Thuột',19),(153,'Thị xã Buôn Hồ',19),(154,'Huyện Cư Jút',20),(155,'Huyện Đắk Glong',20),(156,'Huyện Đắk Mil',20),(157,'Huyện Đắk Rlấp',20),(158,'Huyện Đắk Song',20),(159,'Huyện Krông Nô',20),(160,'Huyện Tuy Đức',20),(161,'Thị xã Gia Nghĩa',20),(162,'Huyện Điện Biên',21),(163,'Huyện Điện Biên Đông',21),(164,'Huyện Mường Ảng',21),(165,'Huyện Mường Chà',21),(166,'Huyện Mường Nhé',21),(167,'Huyện Tủa Chùa',21),(168,'Huyện Tuần Giáo',21),(169,'Thành phố Điện Biên Phủ',21),(170,'Thị xã Mường Lay',21),(171,'Huyện Cẩm Mỹ',22),(172,'Huyện Định Quán',22),(173,'Huyện Long Thành',22),(174,'Huyện Nhơn Trạch',22),(175,'Huyện Tân Phú',22),(176,'Huyện Thống Nhất',22),(177,'Huyện Trảng Bom',22),(178,'Huyện Vĩnh Cửu',22),(179,'Huyện Xuân Lộc',22),(180,'Thành phố Biên Hòa',22),(181,'Thị xã Long Khánh',22),(182,'Huyện Cao Lãnh',23),(183,'Huyện Châu Thành',23),(184,'Huyện Hồng Ngự',23),(185,'Huyện Lai Vung',23),(186,'Huyện Lấp Vò',23),(187,'Huyện Tam Nông',23),(188,'Huyện Tân Hồng',23),(189,'Huyện Thanh Bình',23),(190,'Huyện Tháp Mười',23),(191,'Thành phố Cao Lãnh',23),(192,'Thị xã Hồng Ngự',23),(193,'Thị xã Sa Đéc',23),(194,'Huyện Chư Păh',24),(195,'Huyện Chư Prông',24),(196,'Huyện Chư Pưh',24),(197,'Huyện Chư Sê',24),(198,'Huyện Đắk Đoa',24),(199,'Huyện Đak Pơ',24),(200,'Huyện Đức Cơ',24),(201,'Huyện Ia Grai',24),(202,'Huyện Ia Pa',24),(203,'Huyện Kbang',24),(204,'Huyện Kông Chro',24),(205,'Huyện Krông Pa',24),(206,'Huyện Mang Yang',24),(207,'Huyện Phú Thiện',24),(208,'Thành phố Pleiku',24),(209,'Thị xã An Khê',24),(210,'Thị xã Ayun Pa',24),(211,'Huyện Bắc Mê',25),(212,'Huyện Bắc Quang',25),(213,'Huyện Đồng Văn',25),(214,'Huyện Hoàng Su Phì',25),(215,'Huyện Mèo Vạc',25),(216,'Huyện Quản Bạ',25),(217,'Huyện Quang Bình',25),(218,'Huyện Vị Xuyên',25),(219,'Huyện Xín Mần',25),(220,'Huyện Yên Minh',25),(221,'Thành phố Hà Giang',25),(222,'Huyện Bình Lục',26),(223,'Huyện Duy Tiên',26),(224,'Huyện Kim Bảng',26),(225,'Huyện Lý Nhân',26),(226,'Huyện Thanh Liêm',26),(227,'Thành phố Phủ Lý',26),(228,'Huyện Ba Vì',2),(229,'Huyện Chương Mỹ',2),(230,'Huyện Đan Phượng',2),(231,'Huyện Đông Anh',2),(232,'Huyện Gia Lâm',2),(233,'Huyện Hoài Đức',2),(234,'Huyện Mê Linh',2),(235,'Huyện Mỹ Đức',2),(236,'Huyện Phú Xuyên',2),(237,'Huyện Phúc Thọ',2),(238,'Huyện Quốc Oai',2),(239,'Huyện Sóc Sơn',2),(240,'Huyện Thạch Thất',2),(241,'Huyện Thanh Oai',2),(242,'Huyện Thanh Trì',2),(243,'Huyện Thường Tín',2),(244,'Huyện Từ Liêm',2),(245,'Huyện Ứng Hòa',2),(246,'Quận Ba Đình',2),(247,'Quận Cầu Giấy',2),(248,'Quận Đống Đa',2),(249,'Quận Hà Đông',2),(250,'Quận Hai Bà Trưng',2),(251,'Quận Hoàn Kiếm',2),(252,'Quận Hoàng Mai',2),(253,'Quận Long Biên',2),(254,'Quận Tây Hồ',2),(255,'Quận Thanh Xuân',2),(256,'Thị xã Sơn Tây',2),(257,'Huyện Cẩm Xuyên',27),(258,'Huyện Can Lộc',27),(259,'Huyện Đức Thọ',27),(260,'Huyện Hương Khê',27),(261,'Huyện Hương Sơn',27),(262,'Huyện Kỳ Anh',27),(263,'Huyện Lộc Hà',27),(264,'Huyện Nghi Xuân',27),(265,'Huyện Thạch Hà',27),(266,'Huyện Vũ Quang',27),(267,'Thành phố Hà Tĩnh',27),(268,'Thị xã Hồng Lĩnh',27),(269,'Huyện Bình Giang',28),(270,'Huyện Cẩm Giàng',28),(271,'Huyện Gia Lộc',28),(272,'Huyện Kim Thành',28),(273,'Huyện Kinh Môn',28),(274,'Huyện Nam Sách',28),(275,'Huyện Ninh Giang',28),(276,'Huyện Thanh Hà',28),(277,'Huyện Thanh Miện',28),(278,'Huyện Tứ Kỳ',28),(279,'Thành phố Hải Dương',28),(280,'Thị xã Chí Linh',28),(281,'Huyện An Dương',3),(282,'Huyện An Lão',3),(283,'Huyện Bạch Long Vĩ',3),(284,'Huyện Cát Hải',3),(285,'Huyện Kiến Thụy',3),(286,'Huyện Thủy Nguyên',3),(287,'Huyện Tiên Lãng',3),(288,'Huyện Vĩnh Bảo',3),(289,'Quận Đồ Sơn',3),(290,'Quận Dương Kinh',3),(291,'Quận Hải An',3),(292,'Quận Hồng Bàng',3),(293,'Quận Kiến An',3),(294,'Quận Lê Chân',3),(295,'Quận Ngô Quyền',3),(296,'Huyện Châu Thành',29),(297,'Huyện Châu Thành A',29),(298,'Huyện Long Mỹ',29),(299,'Huyện Phụng Hiệp',29),(300,'Huyện Vị Thủy',29),(301,'Thành phố Vị Thanh',29),(302,'Thị xã Ngã Bảy',29),(303,'Huyện Bình Chánh',1),(304,'Huyện Cần Giờ',1),(305,'Huyện Củ Chi',1),(306,'Huyện Hóc Môn',1),(307,'Huyện Nhà Bè',1),(308,'Quận 1',1),(309,'Quận 10',1),(310,'Quận 11',1),(311,'Quận 12',1),(312,'Quận 2',1),(313,'Quận 3',1),(314,'Quận 4',1),(315,'Quận 5',1),(316,'Quận 6',1),(317,'Quận 7',1),(318,'Quận 8',1),(319,'Quận 9',1),(320,'Quận Bình Tân',1),(321,'Quận Bình Thạnh',1),(322,'Quận Gò Vấp',1),(323,'Quận Phú Nhuận',1),(324,'Quận Tân Bình',1),(325,'Quận Tân Phú',1),(326,'Quận Thủ Đức',1),(327,'Huyện Cao Phong',30),(328,'Huyện Đà Bắc',30),(329,'Huyện Kim Bôi',30),(330,'Huyện Kỳ Sơn',30),(331,'Huyện Lạc Sơn',30),(332,'Huyện Lạc Thủy',30),(333,'Huyện Lương Sơn',30),(334,'Huyện Mai Châu',30),(335,'Huyện Tân Lạc',30),(336,'Huyện Yên Thủy',30),(337,'Thành phố Hòa Bình',30),(338,'Huyện Ân Thi',31),(339,'Huyện Khoái Châu',31),(340,'Huyện Kim Động',31),(341,'Huyện Mỹ Hào',31),(342,'Huyện Phù Cừ',31),(343,'Huyện Tiên Lữ',31),(344,'Huyện Văn Giang',31),(345,'Huyện Văn Lâm',31),(346,'Huyện Yên Mỹ',31),(347,'Thành phố Hưng Yên',31),(348,'Huyện Cam Lâm',32),(349,'Huyện đảo Trường Sa',32),(350,'Huyện Diên Khánh',32),(351,'Huyện Khánh Sơn',32),(352,'Huyện Khánh Vĩnh',32),(353,'Huyện Vạn Ninh',32),(354,'Thành phố Cam Ranh',32),(355,'Thành phố Nha Trang',32),(356,'Thị xã Ninh Hòa',32),(357,'Huyện An Biên',33),(358,'Huyện An Minh',33),(359,'Huyện Châu Thành',33),(360,'Huyện Giang Thành',33),(361,'Huyện Giồng Riềng',33),(362,'Huyện Gò Quao',33),(363,'Huyện Hòn Đất',33),(364,'Huyện Kiên Hải',33),(365,'Huyện Kiên Lương',33),(366,'Huyện Phú Quốc',33),(367,'Huyện Tân Hiệp',33),(368,'Huyện U Minh Thượng',33),(369,'Huyện Vĩnh Thuận',33),(370,'Thành phố Rạch Giá',33),(371,'Thị xã Hà Tiên',33),(372,'Huyện Đăk Glei',34),(373,'Huyện Đăk Hà',34),(374,'Huyện Đăk Tô',34),(375,'Huyện Kon Plông',34),(376,'Huyện Kon Rẫy',34),(377,'Huyện Ngọc Hồi',34),(378,'Huyện Sa Thầy',34),(379,'Huyện Tu Mơ Rông',34),(380,'Thành phố Kon Tum',34),(381,'Huyện Mường Tè',35),(382,'Huyện Phong Thổ',35),(383,'Huyện Sìn Hồ',35),(384,'Huyện Tam Đường',35),(385,'Huyện Tân Uyên',35),(386,'Huyện Than Uyên',35),(387,'Thị xã Lai Châu',35),(388,'Huyện Nậm Nhùn',35),(389,'Huyện Bảo Lâm',36),(390,'Huyện Cát Tiên',36),(391,'Huyện Đạ Huoai',36),(392,'Huyện Đạ Tẻh',36),(393,'Huyện Đam Rông',36),(394,'Huyện Di Linh',36),(395,'Huyện Đơn Dương',36),(396,'Huyện Đức Trọng',36),(397,'Huyện Lạc Dương',36),(398,'Huyện Lâm Hà',36),(399,'Thành phố Bảo Lộc',36),(400,'Thành phố Đà Lạt',36),(401,'Huyện Bắc Sơn',37),(402,'Huyện Bình Gia',37),(403,'Huyện Cao Lộc',37),(404,'Huyện Chi Lăng',37),(405,'Huyện Đình Lập',37),(406,'Huyện Hữu Lũng',37),(407,'Huyện Lộc Bình',37),(408,'Huyện Tràng Định',37),(409,'Huyện Văn Lãng',37),(410,'Huyện Văn Quan',37),(411,'Thành phố Lạng Sơn',37),(412,'Huyện Bắc Hà',38),(413,'Huyện Bảo Thắng',38),(414,'Huyện Bảo Yên',38),(415,'Huyện Bát Xát',38),(416,'Huyện Mường Khương',38),(417,'Huyện Sa Pa',38),(418,'Huyện Si Ma Cai',38),(419,'Huyện Văn Bàn',38),(420,'Thành phố Lào Cai',38),(421,'Huyện Bến Lức',39),(422,'Huyện Cần Đước',39),(423,'Huyện Cần Giuộc',39),(424,'Huyện Châu Thành',39),(425,'Huyện Đức Hòa',39),(426,'Huyện Đức Huệ',39),(427,'Huyện Mộc Hóa',39),(428,'Huyện Tân Hưng',39),(429,'Huyện Tân Thạnh',39),(430,'Huyện Tân Trụ',39),(431,'Huyện Thạnh Hóa',39),(432,'Huyện Thủ Thừa',39),(433,'Huyện Vĩnh Hưng',39),(434,'Thành phố Tân An',39),(435,'Thị xã Kiến Tường',39),(436,'Huyện Giao Thủy',40),(437,'Huyện Hải Hậu',40),(438,'Huyện Mỹ Lộc',40),(439,'Huyện Nam Trực',40),(440,'Huyện Nghĩa Hưng',40),(441,'Huyện Trực Ninh',40),(442,'Huyện Vụ Bản',40),(443,'Huyện Xuân Trường',40),(444,'Huyện Ý Yên',40),(445,'Thành phố Nam Định',40),(446,'Huyện Anh Sơn',41),(447,'Huyện Con Cuông',41),(448,'Huyện Diễn Châu',41),(449,'Huyện Đô Lương',41),(450,'Huyện Hưng Nguyên',41),(451,'Huyện Kỳ Sơn',41),(452,'Huyện Nam Đàn',41),(453,'Huyện Nghi Lộc',41),(454,'Huyện Nghĩa Đàn',41),(455,'Huyện Quế Phong',41),(456,'Huyện Quỳ Châu',41),(457,'Huyện Quỳ Hợp',41),(458,'Huyện Quỳnh Lưu',41),(459,'Huyện Tân Kỳ',41),(460,'Huyện Thanh Chương',41),(461,'Huyện Tương Dương',41),(462,'Huyện Yên Thành',41),(463,'Thành phố Vinh',41),(464,'Thị xã Cửa Lò',41),(465,'Thị xã Thái Hòa',41),(466,'Huyện Gia Viễn',42),(467,'Huyện Hoa Lư',42),(468,'Huyện Kim Sơn',42),(469,'Huyện Nho Quan',42),(470,'Huyện Yên Khánh',42),(471,'Huyện Yên Mô',42),(472,'Thành phố Ninh Bình',42),(473,'Thị xã Tam Điệp',42),(474,'Huyện Bác Ái',43),(475,'Huyện Ninh Hải',43),(476,'Huyện Ninh Phước',43),(477,'Huyện Ninh Sơn',43),(478,'Huyện Thuận Bắc',43),(479,'Huyện Thuận Nam',43),(480,'Thành phố Phan Rang - Tháp Chàm',43),(481,'Huyện Cẩm Khê',44),(482,'Huyện Đoan Hùng',44),(483,'Huyện Hạ Hòa',44),(484,'Huyện Lâm Thao',44),(485,'Huyện Phù Ninh',44),(486,'Huyện Tam Nông',44),(487,'Huyện Tân Sơn',44),(488,'Huyện Thanh Ba',44),(489,'Huyện Thanh Sơn',44),(490,'Huyện Thanh Thủy',44),(491,'Huyện Yên Lập',44),(492,'Thành phố Việt Trì',44),(493,'Thị xã Phú Thọ',44),(494,'Huyện Đông Hòa',45),(495,'Huyện Đồng Xuân',45),(496,'Huyện Phú Hòa',45),(497,'Huyện Sơn Hòa',45),(498,'Huyện Sông Hinh',45),(499,'Huyện Tây Hòa',45),(500,'Huyện Tuy An',45),(501,'Thành phố Tuy Hòa',45),(502,'Thị xã Sông Cầu',45),(503,'Huyện Bố Trạch',46),(504,'Huyện Lệ Thủy',46),(505,'Huyện Minh Hóa',46),(506,'Huyện Quảng Ninh',46),(507,'Huyện Quảng Trạch',46),(508,'Huyện Tuyên Hóa',46),(509,'Thành phố Đồng Hới',46),(510,'Thi xã Ba Đồn',46),(511,'Huyện Hoàn Lão',46),(512,'Huyện Bắc Trà My',47),(513,'Huyện Đại Lộc',47),(514,'Huyện Điện Bàn',47),(515,'Huyện Đông Giang',47),(516,'Huyện Duy Xuyên',47),(517,'Huyện Hiệp Đức',47),(518,'Huyện Nam Giang',47),(519,'Huyện Nam Trà My',47),(520,'Huyện Nông Sơn',47),(521,'Huyện Núi Thành',47),(522,'Huyện Phú Ninh',47),(523,'Huyện Phước Sơn',47),(524,'Huyện Quế Sơn',47),(525,'Huyện Tây Giang',47),(526,'Huyện Thăng Bình',47),(527,'Huyện Tiên Phước',47),(528,'Thành phố Hội An',47),(529,'Thành phố Tam Kỳ',47),(530,'Huyện Ba Tơ',48),(531,'Huyện Bình Sơn',48),(532,'Huyện đảo Lý Sơn',48),(533,'Huyện Đức Phổ',48),(534,'Huyện Minh Long',48),(535,'Huyện Mộ Đức',48),(536,'Huyện Nghĩa Hành',48),(537,'Huyện Sơn Hà',48),(538,'Huyện Sơn Tây',48),(539,'Huyện Sơn Tịnh',48),(540,'Huyện Tây Trà',48),(541,'Huyện Trà Bồng',48),(542,'Huyện Tư Nghĩa',48),(543,'Thành phố Quảng Ngãi',48),(544,'Huyện Ba Chẽ',49),(545,'Huyện Bình Liêu',49),(546,'Huyện Đầm Hà',49),(547,'Huyện đảo Cô Tô',49),(548,'Huyện Đông Triều',49),(549,'Huyện Hải Hà',49),(550,'Huyện Hoành Bồ',49),(551,'Huyện Tiên Yên',49),(552,'Huyện Vân Đồn',49),(553,'Thành phố Cẩm Phả',49),(554,'Thành phố Hạ Long',49),(555,'Thành phố Móng Cái',49),(556,'Thành phố Uông Bí',49),(557,'Thị xã Quảng Yên',49),(558,'Huyện Cam Lộ',50),(559,'Huyện Đa Krông',50),(560,'Huyện đảo Cồn Cỏ',50),(561,'Huyện Gio Linh',50),(562,'Huyện Hải Lăng',50),(563,'Huyện Hướng Hóa',50),(564,'Huyện Triệu Phong',50),(565,'Huyện Vĩnh Linh',50),(566,'Thành phố Đông Hà',50),(567,'Thị xã Quảng Trị',50),(568,'Huyện Châu Thành',51),(569,'Huyện Cù Lao Dung',51),(570,'Huyện Kế Sách',51),(571,'Huyện Long Phú',51),(572,'Huyện Mỹ Tú',51),(573,'Huyện Mỹ Xuyên',51),(574,'Huyện Ngã Năm',51),(575,'Huyện Thạnh Trị',51),(576,'Huyện Trần Đề',51),(577,'Thành phố Sóc Trăng',51),(578,'Thị xã Vĩnh Châu',51),(579,'Huyện Bắc Yên',52),(580,'Huyện Mai Sơn',52),(581,'Huyện Mộc Châu',52),(582,'Huyện Mường La',52),(583,'Huyện Phù Yên',52),(584,'Huyện Quỳnh Nhai',52),(585,'Huyện Sông Mã',52),(586,'Huyện Sốp Cộp',52),(587,'Huyện Thuận Châu',52),(588,'Huyện Yên Châu',52),(589,'Thành phố Sơn La',52),(590,'Huyện Bến Cầu',53),(591,'Huyện Châu Thành',53),(592,'Huyện Dương Minh Châu',53),(593,'Huyện Gò Dầu',53),(594,'Huyện Hòa Thành',53),(595,'Huyện Tân Biên',53),(596,'Huyện Tân Châu',53),(597,'Huyện Trảng Bàng',53),(598,'Thị xã Tây Ninh',53),(599,'Huyện Đông Hưng',54),(600,'Huyện Hưng Hà',54),(601,'Huyện Kiến Xương',54),(602,'Huyện Quỳnh Phụ',54),(603,'Huyện Thái Thụy',54),(604,'Huyện Tiền Hải',54),(605,'Huyện Vũ Thư',54),(606,'Thành phố Thái Bình',54),(607,'Huyện Đại Từ',55),(608,'Huyện Định Hóa',55),(609,'Huyện Đồng Hỷ',55),(610,'Huyện Phổ Yên',55),(611,'Huyện Phú Bình',55),(612,'Huyện Phú Lương',55),(613,'Huyện Võ Nhai',55),(614,'Thành phố Thái Nguyên',55),(615,'Thị xã Sông Công',55),(616,'Huyện Bá Thước',56),(617,'Huyện Cẩm Thủy',56),(618,'Huyện Đông Sơn',56),(619,'Huyện Hà Trung',56),(620,'Huyện Hậu Lộc',56),(621,'Huyện Hoằng Hóa',56),(622,'Huyện Lang Chánh',56),(623,'Huyện Mường Lát',56),(624,'Huyện Nga Sơn',56),(625,'Huyện Ngọc Lặc',56),(626,'Huyện Như Thanh',56),(627,'Huyện Như Xuân',56),(628,'Huyện Nông Cống',56),(629,'Huyện Quan Hóa',56),(630,'Huyện Quan Sơn',56),(631,'Huyện Quảng Xương',56),(632,'Huyện Thạch Thành',56),(633,'Huyện Thiệu Hóa',56),(634,'Huyện Thọ Xuân',56),(635,'Huyện Thường Xuân',56),(636,'Huyện Tĩnh Gia',56),(637,'Huyện Triệu Sơn',56),(638,'Huyện Vĩnh Lộc',56),(639,'Huyện Yên Định',56),(640,'Thành phố Thanh Hóa',56),(641,'Thị xã Bỉm Sơn',56),(642,'Thị xã Sầm Sơn',56),(643,'Huyện A Lưới',57),(644,'Huyện Nam Đông',57),(645,'Huyện Phong Điền',57),(646,'Huyện Phú Lộc',57),(647,'Huyện Phú Vang',57),(648,'Huyện Quảng Điền',57),(649,'Thành phố Huế',57),(650,'Thị xã Hương Thủy',57),(651,'Thị xã Hương Trà',57),(652,'Huyện Cái Bè',58),(653,'Huyện Cai Lậy',58),(654,'Huyện Châu Thành',58),(655,'Huyện Chợ Gạo',58),(656,'Huyện Gò Công Đông',58),(657,'Huyện Gò Công Tây',58),(658,'Huyện Tân Phú Đông',58),(659,'Huyện Tân Phước',58),(660,'Thành phố Mỹ Tho',58),(661,'Thị xã Gò Công',58),(662,'Huyện Càng Long',59),(663,'Huyện Cầu Kè',59),(664,'Huyện Cầu Ngang',59),(665,'Huyện Châu Thành',59),(666,'Huyện Duyên Hải',59),(667,'Huyện Tiểu Cần',59),(668,'Huyện Trà Cú',59),(669,'Thành phố Trà Vinh',59),(670,'Huyện Chiêm Hóa',60),(671,'Huyện Hàm Yên',60),(672,'Huyện Lâm Bình',60),(673,'Huyện Na Hang',60),(674,'Huyện Sơn Dương',60),(675,'Huyện Yên Sơn',60),(676,'Thành phố Tuyên Quang',60),(677,'Huyện Bình Minh',61),(678,'Huyện Bình Tân',61),(679,'Huyện Long Hồ',61),(680,'Huyện Mang Thít',61),(681,'Huyện Tam Bình',61),(682,'Huyện Trà Ôn',61),(683,'Huyện Vũng Liêm',61),(684,'Thành phố Vĩnh Long',61),(685,'Huyện Bình Xuyên',62),(686,'Huyện Lập Thạch',62),(687,'Huyện Sông Lô',62),(688,'Huyện Tam Đảo',62),(689,'Huyện Tam Dương',62),(690,'Huyện Vĩnh Tường',62),(691,'Huyện Yên Lạc',62),(692,'Thành phố Vĩnh Yên',62),(693,'Thị xã Phúc Yên',62),(694,'Huyện Lục Yên',63),(695,'Huyện Mù Cang Chải',63),(696,'Huyện Trạm Tấu',63),(697,'Huyện Trấn Yên',63),(698,'Huyện Văn Chấn',63),(699,'Huyện Văn Yên',63),(700,'Huyện Yên Bình',63),(701,'Thành phố Yên Bái',63),(702,'Thị xã Nghĩa Lộ',63);
/*!40000 ALTER TABLE `quanhuyen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tinhthanh`
--

DROP TABLE IF EXISTS `tinhthanh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tinhthanh` (
  `Id` int NOT NULL,
  `NameVN` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tinhthanh`
--

LOCK TABLES `tinhthanh` WRITE;
/*!40000 ALTER TABLE `tinhthanh` DISABLE KEYS */;
INSERT INTO `tinhthanh` VALUES (1,'Hồ Chí Minh'),(2,'Hà Nội'),(3,'Hải Phòng'),(4,'Đà Nẵng'),(5,'Cần Thơ'),(6,'Bình Dương'),(7,'An Giang'),(8,'Bà Rịa - Vũng Tàu'),(9,'Bắc Giang'),(10,'Bắc Kạn'),(11,'Bạc Liêu'),(12,'Bắc Ninh'),(13,'Bến Tre'),(14,'Bình Định'),(15,'Bình Phước'),(16,'Bình Thuận'),(17,'Cà Mau'),(18,'Cao Bằng'),(19,'Đắk Lắk'),(20,'Đắk Nông'),(21,'Điện Biên'),(22,'Đồng Nai'),(23,'Đồng Tháp'),(24,'Gia Lai'),(25,'Hà Giang'),(26,'Hà Nam'),(27,'Hà Tĩnh'),(28,'Hải Dương'),(29,'Hậu Giang'),(30,'Hòa Bình'),(31,'Hưng Yên'),(32,'Khánh Hòa'),(33,'Kiên Giang'),(34,'Kon Tum'),(35,'Lai Châu'),(36,'Lâm Đồng'),(37,'Lạng Sơn'),(38,'Lào Cai'),(39,'Long An'),(40,'Nam Định'),(41,'Nghệ An'),(42,'Ninh Bình'),(43,'Ninh Thuận'),(44,'Phú Thọ'),(45,'Phú Yên'),(46,'Quảng Bình'),(47,'Quảng Nam'),(48,'Quảng Ngãi'),(49,'Quảng Ninh'),(50,'Quảng Trị'),(51,'Sóc Trăng'),(52,'Sơn La'),(53,'Tây Ninh'),(54,'Thái Bình'),(55,'Thái Nguyên'),(56,'Thanh Hóa'),(57,'Thừa Thiên Huế'),(58,'Tiền Giang'),(59,'Trà Vinh'),(60,'Tuyên Quang'),(61,'Vĩnh Long'),(62,'Vĩnh Phúc'),(63,'Yên Bái');
/*!40000 ALTER TABLE `tinhthanh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `f_ID` int NOT NULL AUTO_INCREMENT,
  `f_Username` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `f_Password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `f_Name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `f_Email` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `f_DOB` date DEFAULT NULL,
  `f_Permission` int DEFAULT NULL,
  `f_Mobile` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `f_Address` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `f_ChiNhanhId` int DEFAULT NULL,
  PRIMARY KEY (`f_ID`),
  UNIQUE KEY `f_Username_UNIQUE` (`f_Username`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (21,'admin1','$2a$08$3VoyIUnZGBGpoLsJ3hguLubqjHX/8d8KRPR88pwMLmkAd8PCEgzcC','','','2020-10-27',NULL,'','',NULL),(20,'kh2','$2a$08$D0TKWHAjeT6zPY8QU6TIJ.A0JK74XZ.Pp099HEMfnRXIJHaKD4poW','Khach hang 2','kh2@mail.com','2000-01-01',NULL,'023473937','123',NULL),(8,'admin','$2a$08$wBXEBLqSsA4MYTIjvB2yLeUg9GCVpvV4iXDNqvmpcXefttnsbEvVq','admin','','2000-01-01',1,'admin','admin',NULL),(17,'9','$2a$08$Cx8QMqhzZ98aY0uKj/M8Y.AzLAf7yp/vsEIA.r2bRRSVbbfIE0J/W',NULL,NULL,NULL,2,NULL,NULL,9),(18,'10','$2a$08$5rfMBQD7/VFa19IH2BIkwOLxr.ie1AqrKgXuYdI0iZH.qfgTKZlgO','Đinh Tiên Hoàng',NULL,NULL,2,NULL,NULL,10),(19,'11','$2a$08$X4lkJV2yxAIfabY.o8/rkeTl0KHrqk6Z3Mj7lXevOwIJS.5jsdX7G','test',NULL,NULL,2,NULL,NULL,11),(14,'kh1','$2a$08$.PAuT8C8TBLTwSQaqgPjcuI9Jv4kP8tvkyDwjC1tGech2qsmSdlBW','kh1','kh1@mail.com','2000-01-01',NULL,'0123456789','123 Đinh Tiên Hoàng, Q1, HCM',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-04 23:26:36

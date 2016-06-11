-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: sportshop
-- ------------------------------------------------------
-- Server version	5.7.11-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `id_parent` int(11) DEFAULT NULL,
  `is_active` int(11) NOT NULL,
  `date_create` datetime NOT NULL,
  `slug` text COLLATE utf8_unicode_ci NOT NULL,
  `image` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Áo khoác','Áo khoác từ đẹp đến siêu đẹp, chỉ thế thôi ',NULL,1,'2016-06-01 11:48:30','aa','1.png');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fullname` text COLLATE utf8_unicode_ci NOT NULL,
  `address` text COLLATE utf8_unicode_ci NOT NULL,
  `email` text COLLATE utf8_unicode_ci NOT NULL,
  `phone` text COLLATE utf8_unicode_ci NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `detail` text COLLATE utf8_unicode_ci NOT NULL,
  `is_active` int(11) NOT NULL,
  `date_create` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `short_detail` text COLLATE utf8_unicode_ci NOT NULL,
  `long_detail` text COLLATE utf8_unicode_ci NOT NULL,
  `image` text COLLATE utf8_unicode_ci NOT NULL,
  `is_active` int(11) NOT NULL,
  `date_create` datetime NOT NULL COMMENT 'Thời gian khởi tạo',
  `date_update` datetime NOT NULL COMMENT 'Thời gian cập nhật gần đây nhất',
  `is_savedraft` int(11) NOT NULL,
  `views` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (1,1,'Thời trang thể thao gắn liền với cuộc sống','Với dây chuyên sản xuất hiện đại bậc asdassasd asdasasd','Với dây chuyên sản xuất hiện đại bậc nhất được nhập khẩu từ CHLB Đức, quy trình sản xuất tuân thủ nghiêm ngặt theo tiêu chuẩn Quốc tế ISO 9001 : 2008. DONEX luôn cam kết sẽ mang đến cho Quý khách hàng những sản phẩm tốt nhất, chất lượng tốt nhất, và luôn cố gắng nỗ lực hết mình vì sứ mệnh phục vụ khách hàng.','1.png',1,'2016-06-02 11:49:12','2016-06-01 11:49:11',0,1200),(2,1,'Thời trang thể thao gắn liền với cuộc sống','Với dây chuyên sản xuất hiện đại bậc asdassasd asdasasd','Với dây chuyên sản xuất hiện đại bậc nhất được nhập khẩu từ CHLB Đức, quy trình sản xuất tuân thủ nghiêm ngặt theo tiêu chuẩn Quốc tế ISO 9001 : 2008. DONEX luôn cam kết sẽ mang đến cho Quý khách hàng những sản phẩm tốt nhất, chất lượng tốt nhất, và luôn cố gắng nỗ lực hết mình vì sứ mệnh phục vụ khách hàng.','2.png',1,'2016-06-01 11:49:14','2016-06-01 11:49:11',0,1200),(3,1,'Thời trang thể thao gắn liền với cuộc sống','Với dây chuyên sản xuất hiện đại bậc asdassasd asdasasd','Với dây chuyên sản xuất hiện đại bậc nhất được nhập khẩu từ CHLB Đức, quy trình sản xuất tuân thủ nghiêm ngặt theo tiêu chuẩn Quốc tế ISO 9001 : 2008. DONEX luôn cam kết sẽ mang đến cho Quý khách hàng những sản phẩm tốt nhất, chất lượng tốt nhất, và luôn cố gắng nỗ lực hết mình vì sứ mệnh phục vụ khách hàng.','3.png',1,'2016-06-03 11:49:11','2016-06-01 11:49:11',0,1200),(4,1,'Thời trang thể thao gắn liền với cuộc sống','Với dây chuyên sản xuất hiện đại bậc asdassasd asdasasd','Với dây chuyên sản xuất hiện đại bậc nhất được nhập khẩu từ CHLB Đức, quy trình sản xuất tuân thủ nghiêm ngặt theo tiêu chuẩn Quốc tế ISO 9001 : 2008. DONEX luôn cam kết sẽ mang đến cho Quý khách hàng những sản phẩm tốt nhất, chất lượng tốt nhất, và luôn cố gắng nỗ lực hết mình vì sứ mệnh phục vụ khách hàng.','4.png',1,'2016-06-05 11:49:15','2016-06-01 11:49:11',0,1100),(5,1,'Thời trang thể thao gắn liền với cuộc sống','Với dây chuyên sản xuất hiện đại bậc asdassasd asdasasd','Với dây chuyên sản xuất hiện đại bậc nhất được nhập khẩu từ CHLB Đức, quy trình sản xuất tuân thủ nghiêm ngặt theo tiêu chuẩn Quốc tế ISO 9001 : 2008. DONEX luôn cam kết sẽ mang đến cho Quý khách hàng những sản phẩm tốt nhất, chất lượng tốt nhất, và luôn cố gắng nỗ lực hết mình vì sứ mệnh phục vụ khách hàng.','5.png',1,'2016-06-08 11:49:09','2016-06-01 11:49:11',0,500),(6,1,'Thời trang thể thao gắn liền với cuộc sống','Với dây chuyên sản xuất hiện đại bậc asdassasd asdasasd','Với dây chuyên sản xuất hiện đại bậc nhất được nhập khẩu từ CHLB Đức, quy trình sản xuất tuân thủ nghiêm ngặt theo tiêu chuẩn Quốc tế ISO 9001 : 2008. DONEX luôn cam kết sẽ mang đến cho Quý khách hàng những sản phẩm tốt nhất, chất lượng tốt nhất, và luôn cố gắng nỗ lực hết mình vì sứ mệnh phục vụ khách hàng.','6.png',1,'2016-06-10 11:49:11','2016-06-01 11:49:11',0,12000),(7,1,'Thời trang thể thao gắn liền với cuộc sống','Với dây chuyên sản xuất hiện đại bậc asdassasd asdasasd','Với dây chuyên sản xuất hiện đại bậc nhất được nhập khẩu từ CHLB Đức, quy trình sản xuất tuân thủ nghiêm ngặt theo tiêu chuẩn Quốc tế ISO 9001 : 2008. DONEX luôn cam kết sẽ mang đến cho Quý khách hàng những sản phẩm tốt nhất, chất lượng tốt nhất, và luôn cố gắng nỗ lực hết mình vì sứ mệnh phục vụ khách hàng.','7.png',1,'2016-06-11 11:49:11','2016-06-01 11:49:11',0,500);
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fullname` text COLLATE utf8_unicode_ci NOT NULL,
  `address` text COLLATE utf8_unicode_ci NOT NULL,
  `phone` text COLLATE utf8_unicode_ci NOT NULL,
  `email` text COLLATE utf8_unicode_ci NOT NULL,
  `ship_address` text COLLATE utf8_unicode_ci NOT NULL,
  `ship_name` text COLLATE utf8_unicode_ci NOT NULL,
  `ship_phone` text COLLATE utf8_unicode_ci NOT NULL,
  `date_create` datetime NOT NULL,
  `date_delivery` datetime DEFAULT NULL,
  `note` int(11) DEFAULT NULL,
  `total_amount` double NOT NULL,
  `total_amount_real` double NOT NULL,
  `is_active` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,'Cao Cau','ádadd adsdasda ádasd ádasd','0351213843','132463513213','ádadd adsdasda ádasd ádasd','Cao Cau','0351213843','2016-06-04 20:15:06',NULL,NULL,8052000,8857200,0),(2,'Lam Xung','adasdasd adad asdasda asdsd','036132468','asdsd2@sdasd','adasdasd adad asdasda asdsd','Lam Xung','036132468','2016-06-04 20:27:02',NULL,NULL,2444000,2688400,0),(3,'Duong Chi','32463513463 131384321. 3.431324313.46 .43234532.5','46137651','3432134632','32463513463 131384321. 3.431324313.46 .43234532.5','Duong Chi','46137651','2016-06-04 20:33:59',NULL,NULL,1536000,1689600,0),(4,'asdasd','asds sadsd asasd asdas','asdasd','asdas','asds sadsd asasd asdas','asdasd','asdasd','2016-06-04 20:36:10',NULL,NULL,82000,90200,0),(5,'dadasd','asd asdasd asdas asdasd','asdasd','asdas','asd asdasd asdas asdasd','dadasd','asdasd','2016-06-04 20:38:56',NULL,NULL,232000,255200,0),(6,'ádasd','sấd ádasd ádas ádasd','ádasd','ádasd','sấd ádasd ádas ádasd','ádasd','ádasd','2016-06-04 20:47:05',NULL,NULL,0,0,0),(7,'Ga','435468132 351303513 3.431.513.13.5 354131384631.35','13.21351.2163','321.21035413','435468132 351303513 3.431.513.13.5 354131384631.35','Ga','13.21351.2163','2016-06-04 20:50:59',NULL,NULL,4552000,5007200,0),(8,'sdasd','sds sadsa ádas ádas','ádsa','ádas','sds sadsa ádas ádas','sdasd','ádsa','2016-06-04 20:56:26',NULL,NULL,3636000,3999600,0),(9,'ádasd','âsd ádasd asd áddas','áddas','sád','âsd ádasd asd áddas','ádasd','áddas','2016-06-04 21:04:08',NULL,NULL,3598000,3957800,0),(10,'ádas','ádas sad áds âsd','sấd','âsd','ádas sad áds âsd','ádas','sấd','2016-06-04 21:09:08',NULL,NULL,205000,225500,0);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_order` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` double NOT NULL,
  `price_promotion` datetime DEFAULT NULL,
  `total` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
INSERT INTO `order_detail` VALUES (1,1,6,2000,4000,NULL,8000000),(2,1,4,13,4000,NULL,52000),(3,2,3,600,4000,NULL,2400000),(4,2,4,5,4000,NULL,20000),(5,2,6,6,4000,NULL,24000),(6,3,4,3,4000,NULL,12000),(7,3,7,300,5000,NULL,1500000),(8,3,3,6,4000,NULL,24000),(9,4,3,8,4000,NULL,32000),(10,4,4,5,4000,NULL,20000),(11,4,7,6,5000,NULL,30000),(12,5,3,8,4000,NULL,32000),(13,5,9,50,4000,NULL,200000),(14,7,2,8,4000,NULL,32000),(15,7,7,900,5000,NULL,4500000),(16,7,6,5,4000,NULL,20000),(17,8,9,900,4000,NULL,3600000),(18,8,3,6,4000,NULL,24000),(19,8,4,3,4000,NULL,12000),(20,9,4,90,4000,NULL,360000),(21,9,6,800,4000,NULL,3200000),(22,9,1,6,5000,NULL,30000),(23,9,11,2,4000,NULL,8000),(24,10,5,40,4000,NULL,160000),(25,10,4,5,4000,NULL,20000),(26,10,7,5,5000,NULL,25000);
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `id_category` int(11) NOT NULL,
  `id_account` int(11) NOT NULL,
  `price` double NOT NULL,
  `price_promotion` double DEFAULT NULL,
  `images` text COLLATE utf8_unicode_ci NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `alias` text COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `quantity` double DEFAULT NULL,
  `date_create` datetime NOT NULL,
  `date_update` datetime NOT NULL,
  `is_active` int(11) NOT NULL,
  `is_savedraft` int(11) DEFAULT NULL,
  `views` int(11) NOT NULL,
  `purchase` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'aaa',1,2,5000,6000,'1.png-2.png-3.png-4.png-5.png','fucking beep','','Nâng niu sành điệu đến từng bước chân ',300,'2016-06-01 11:48:30','2016-06-01 11:48:30',0,0,120,200),(2,'bbb',1,2,5000,4000,'2.png','fucking beep b','','Nâng niu sành điệu đến từng bước chân ',300,'2016-06-01 11:49:11','2016-06-01 11:49:11',0,0,120,200),(3,'ccc',1,2,5000,4000,'3.png','fucking beep c','','Nâng niu sành điệu đến từng bước chân ',300,'2016-06-01 11:49:11','2016-06-01 11:49:11',0,0,120,200),(4,'dddd',1,2,5000,4000,'4.png','fucking beep d','','Nâng niu sành điệu đến từng bước chân ',300,'2016-06-01 11:49:11','2016-06-01 11:49:11',0,0,120,200),(5,'eee',1,2,5000,4000,'5.png','fucking beep e',' ','Nâng niu sành điệu đến từng bước chân ',800,'2016-06-01 11:49:11','2016-06-01 11:49:11',0,0,5000,300),(6,'fff',1,2,5000,4000,'6.png','fucking beep e',' ','Nâng niu sành điệu đến từng bước chân ',800,'2016-06-01 11:49:11','2016-06-01 11:49:11',0,0,5000,300),(7,'ggg',1,2,5000,5000,'7.png','fucking beep e',' ','Nâng niu sành điệu đến từng bước chân ',800,'2016-06-01 11:49:11','2016-06-01 11:49:11',0,0,5000,300),(8,'hhh',1,2,5000,4000,'8.png','fucking beep e',' ','Nâng niu sành điệu đến từng bước chân ',800,'2016-06-01 11:49:11','2016-06-01 11:49:11',0,0,5000,300),(9,'iii',1,2,5000,4000,'9.png','fucking beep e',' ','Nâng niu sành điệu đến từng bước chân ',800,'2016-06-01 11:49:11','2016-06-01 11:49:11',0,0,5000,300),(11,'lll',1,2,5000,4000,'11.png','fucking beep e',' ','Nâng niu sành điệu đến từng bước chân ',800,'2016-06-01 11:49:11','2016-06-01 11:49:11',0,0,5000,300),(12,'jjj',1,2,5000,4000,'1.png-1.jpg','fucking beep','','Nâng niu sành điệu đến từng bước chân ',300,'2016-06-01 11:48:30','2016-06-01 11:48:30',0,0,120,200),(13,'qqq',1,2,5000,4000,'1.png-1.jpg','fucking beep','','Nâng niu sành điệu đến từng bước chân ',300,'2016-06-01 11:48:30','2016-06-01 11:48:30',0,0,120,200),(14,'mmm',1,2,5000,4000,'1.png-1.jpg','fucking beep','','Nâng niu sành điệu đến từng bước chân ',300,'2016-06-01 11:48:30','2016-06-01 11:48:30',0,0,120,200),(15,'nnn',1,2,5000,4000,'1.png-1.jpg','fucking beep','','Nâng niu sành điệu đến từng bước chân ',300,'2016-06-01 11:48:30','2016-06-01 11:48:30',0,0,120,200),(16,'oo',1,2,5000,4000,'1.png-1.jpg','fucking beep','','Nâng niu sành điệu đến từng bước chân ',300,'2016-06-01 11:48:30','2016-06-01 11:48:30',0,0,120,200);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request_contact`
--

DROP TABLE IF EXISTS `request_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `request_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fullname` text COLLATE utf8_unicode_ci NOT NULL,
  `email` text COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `is_repsonse` bit(1) NOT NULL,
  `date_create` datetime NOT NULL COMMENT 'Thời gian khởi tạo',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request_contact`
--

LOCK TABLES `request_contact` WRITE;
/*!40000 ALTER TABLE `request_contact` DISABLE KEYS */;
INSERT INTO `request_contact` VALUES (1,'sadas','ádasd','âsđ','\0','2016-06-04 22:12:01'),(2,'ádasd','sadasasd','ádasdasd','\0','2016-06-04 22:14:29');
/*!40000 ALTER TABLE `request_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` text COLLATE utf8_unicode_ci NOT NULL,
  `password` text COLLATE utf8_unicode_ci NOT NULL,
  `fullname` text COLLATE utf8_unicode_ci NOT NULL,
  `email` text COLLATE utf8_unicode_ci NOT NULL,
  `id_role` bit(1) NOT NULL,
  `is_active` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'luong','1','test','luong@abc.com','',1),(3,'gacon','aaa','tao','aaa','',0);
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

-- Dump completed on 2016-06-06 16:46:26

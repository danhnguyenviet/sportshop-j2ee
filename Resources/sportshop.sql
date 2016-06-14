-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 12, 2016 at 03:55 AM
-- Server version: 5.6.16
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sportshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `id_parent` int(11) DEFAULT NULL,
  `is_active` int(11) NOT NULL,
  `date_create` datetime NOT NULL,
  `slug` text COLLATE utf8_unicode_ci NOT NULL,
  `image` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `title`, `description`, `id_parent`, `is_active`, `date_create`, `slug`, `image`) VALUES
(1, 'Áo khoác', 'Áo khoác từ đẹp đến siêu đẹp, chỉ thế thôi ', NULL, 1, '2016-06-01 11:48:30', 'aa', '1.png'),
(2, 'Áo thể thao', 'Áo thể thao', NULL, 1, '2016-06-01 00:00:00', 'ao-the-thao', ''),
(3, 'Giày thể thao', 'Giày thể thao', NULL, 1, '2016-06-01 00:00:00', 'giay-the-thao', ''),
(4, 'Dụng cụ thể thao', 'Dụng cụ thể thao', NULL, 1, '2016-06-01 00:00:00', 'dung-cu-the-thao', ''),
(5, 'Áo câu lạc bộ', 'Áo câu lạc bộ', 2, 1, '2016-06-01 00:00:00', 'ao-cau-lac-bo', ''),
(6, 'Áo đội tuyển', 'Áo đội tuyển', 2, 1, '2016-06-01 00:00:00', 'ao-doi-tuyen', ''),
(7, 'Áo tay dài', 'Áo tay dài', 2, 1, '2016-06-01 00:00:00', 'ao-tay-dai', ''),
(8, 'Giày bóng đá', 'Giày bóng đá', 3, 1, '2016-06-01 00:00:00', 'giay-bong-da', ''),
(9, 'Giày quần vợt', 'Giày quần vợt', 3, 1, '2016-06-01 00:00:00', 'giay-quan-vot', ''),
(10, 'Giày Nike', 'Giày Nike', 3, 1, '2016-06-01 00:00:00', 'giay-nike', ''),
(11, 'Bóng đá', 'Bóng đá', 4, 1, '2016-06-01 00:00:00', 'bong-da', ''),
(12, 'Bóng rổ', 'Bóng rổ', 4, 1, '2016-06-01 00:00:00', 'bong-ro', ''),
(13, 'Bóng ném', 'Bóng ném', 4, 1, '2016-06-01 00:00:00', 'bong-nem', '');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `fullname` text COLLATE utf8_unicode_ci NOT NULL,
  `address` text COLLATE utf8_unicode_ci NOT NULL,
  `email` text COLLATE utf8_unicode_ci NOT NULL,
  `phone` text COLLATE utf8_unicode_ci NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `detail` text COLLATE utf8_unicode_ci NOT NULL,
  `is_active` int(11) NOT NULL,
  `date_create` datetime NOT NULL,
  `state` text COLLATE utf8_unicode_ci,
  `response` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `fullname`, `address`, `email`, `phone`, `title`, `detail`, `is_active`, `date_create`, `state`, `response`) VALUES
(1, 'Phạm Ngọc Linh', 'Thành phồ Hồ Chí Minh', 'pnlinh93@mgail.com', '0909999999', 'Yêu cầu hỗ trợ', 'Vui lòng liên hệ lại...', 0, '2016-06-22 00:00:00', 'nonereply', 'Chúng tôi r?t hân h?nh ???c ph?c v? quý kháchChúng tôi r?t hân h?nh ???c ph?c v? quý khách'),
(2, 'Huỳnh Đức Đăng Khoa', 'Thành phồ Hồ Chí Minh', 'dangkhoahuynh@mgail.com', '0909999999', 'Yêu cầu hỗ trợ', 'Vui lòng liên hệ lại...', 0, '2016-06-22 00:00:00', 'reply', 'Chúng tôi r?t hân h?nh ???c ph?c v? quý kháchChúng tôi r?t hân h?nh ???c ph?c v? quý khách'),
(3, 'Văn Tuấn', 'Thành phồ Hồ Chí Minh', 'pnlinh93@mgail.com', '0909999999', 'Yêu cầu hỗ trợ', 'Vui lòng liên hệ lại...', 0, '2016-06-22 00:00:00', 'new', 'Pháº¡m Ngá»?c Linh Ä?Ã£ response vÃ o ngÃ y 25 thÃ¡ng 10'),
(4, 'Duy Lương', 'Thành phồ Hồ Chí Minh', 'dangkhoahuynh@mgail.com', '0909999999', 'Yêu cầu hỗ trợ', 'Vui lòng liên hệ lại...', 0, '2016-06-22 00:00:00', 'deleted', NULL),
(5, 'Quốc Bảo', 'Thành phồ Hồ Chí Minh', 'dangkhoahuynh@mgail.com', '0909999999', 'Yêu cầu hỗ trợ', 'Vui lòng liên hệ lại...', 0, '2016-06-22 00:00:00', 'new', NULL),
(6, 'Thị Nỡ', 'Thành phồ Hồ Chí Minh', 'dangkhoahuynh@mgail.com', '0909999999', 'Yêu cầu hỗ trợ', 'Vui lòng liên hệ lại...', 0, '2016-06-22 00:00:00', 'reply', NULL),
(7, 'Tuấn Tú', 'Thành phồ Hồ Chí Minh', 'pnlinh93@mgail.com', '0909999999', 'Yêu cầu hỗ trợ', 'Vui lòng liên hệ lại...', 0, '2016-06-22 00:00:00', 'new', NULL),
(8, 'Duy Lương', 'Thành phồ Hồ Chí Minh', 'dangkhoahuynh@mgail.com', '0909999999', 'Yêu cầu hỗ trợ', 'Vui lòng liên hệ lại...', 0, '2016-06-22 00:00:00', 'reply', NULL),
(9, 'Duy Lương', 'Thành phồ Hồ Chí Minh', 'dangkhoahuynh@mgail.com', '0909999999', 'Yêu cầu hỗ trợ', 'Vui lòng liên hệ lại...', 0, '2016-06-22 00:00:00', 'deleted', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `short_detail` text COLLATE utf8_unicode_ci NOT NULL,
  `long_detail` text COLLATE utf8_unicode_ci NOT NULL,
  `image` text COLLATE utf8_unicode_ci NOT NULL,
  `is_active` int(11) NOT NULL,
  `date_create` datetime NOT NULL COMMENT 'Thời gian khởi tạo',
  `date_update` datetime NOT NULL COMMENT 'Thời gian cập nhật gần đây nhất',
  `is_savedraft` int(11) NOT NULL,
  `views` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `id_user`, `title`, `short_detail`, `long_detail`, `image`, `is_active`, `date_create`, `date_update`, `is_savedraft`, `views`) VALUES
(1, 1, 'Thời trang thể thao gắn liền với cuộc sống', 'Với dây chuyên sản xuất hiện đại bậc asdassasd asdasasd', 'Với dây chuyên sản xuất hiện đại bậc nhất được nhập khẩu từ CHLB Đức, quy trình sản xuất tuân thủ nghiêm ngặt theo tiêu chuẩn Quốc tế ISO 9001 : 2008. DONEX luôn cam kết sẽ mang đến cho Quý khách hàng những sản phẩm tốt nhất, chất lượng tốt nhất, và luôn cố gắng nỗ lực hết mình vì sứ mệnh phục vụ khách hàng.', '1.png', 1, '2016-06-02 11:49:12', '2016-06-01 11:49:11', 0, 1200),
(2, 1, 'Thời trang thể thao gắn liền với cuộc sống', 'Với dây chuyên sản xuất hiện đại bậc asdassasd asdasasd', 'Với dây chuyên sản xuất hiện đại bậc nhất được nhập khẩu từ CHLB Đức, quy trình sản xuất tuân thủ nghiêm ngặt theo tiêu chuẩn Quốc tế ISO 9001 : 2008. DONEX luôn cam kết sẽ mang đến cho Quý khách hàng những sản phẩm tốt nhất, chất lượng tốt nhất, và luôn cố gắng nỗ lực hết mình vì sứ mệnh phục vụ khách hàng.', '2.png', 1, '2016-06-01 11:49:14', '2016-06-01 11:49:11', 0, 1200),
(3, 1, 'Thời trang thể thao gắn liền với cuộc sống', 'Với dây chuyên sản xuất hiện đại bậc asdassasd asdasasd', 'Với dây chuyên sản xuất hiện đại bậc nhất được nhập khẩu từ CHLB Đức, quy trình sản xuất tuân thủ nghiêm ngặt theo tiêu chuẩn Quốc tế ISO 9001 : 2008. DONEX luôn cam kết sẽ mang đến cho Quý khách hàng những sản phẩm tốt nhất, chất lượng tốt nhất, và luôn cố gắng nỗ lực hết mình vì sứ mệnh phục vụ khách hàng.', '3.png', 1, '2016-06-03 11:49:11', '2016-06-01 11:49:11', 0, 1200),
(4, 1, 'Thời trang thể thao gắn liền với cuộc sống', 'Với dây chuyên sản xuất hiện đại bậc asdassasd asdasasd', 'Với dây chuyên sản xuất hiện đại bậc nhất được nhập khẩu từ CHLB Đức, quy trình sản xuất tuân thủ nghiêm ngặt theo tiêu chuẩn Quốc tế ISO 9001 : 2008. DONEX luôn cam kết sẽ mang đến cho Quý khách hàng những sản phẩm tốt nhất, chất lượng tốt nhất, và luôn cố gắng nỗ lực hết mình vì sứ mệnh phục vụ khách hàng.', '4.png', 1, '2016-06-05 11:49:15', '2016-06-01 11:49:11', 0, 1100),
(5, 1, 'Thời trang thể thao gắn liền với cuộc sống', 'Với dây chuyên sản xuất hiện đại bậc asdassasd asdasasd', 'Với dây chuyên sản xuất hiện đại bậc nhất được nhập khẩu từ CHLB Đức, quy trình sản xuất tuân thủ nghiêm ngặt theo tiêu chuẩn Quốc tế ISO 9001 : 2008. DONEX luôn cam kết sẽ mang đến cho Quý khách hàng những sản phẩm tốt nhất, chất lượng tốt nhất, và luôn cố gắng nỗ lực hết mình vì sứ mệnh phục vụ khách hàng.', '5.png', 1, '2016-06-08 11:49:09', '2016-06-01 11:49:11', 0, 500),
(6, 1, 'Thời trang thể thao gắn liền với cuộc sống', 'Với dây chuyên sản xuất hiện đại bậc asdassasd asdasasd', 'Với dây chuyên sản xuất hiện đại bậc nhất được nhập khẩu từ CHLB Đức, quy trình sản xuất tuân thủ nghiêm ngặt theo tiêu chuẩn Quốc tế ISO 9001 : 2008. DONEX luôn cam kết sẽ mang đến cho Quý khách hàng những sản phẩm tốt nhất, chất lượng tốt nhất, và luôn cố gắng nỗ lực hết mình vì sứ mệnh phục vụ khách hàng.', '6.png', 1, '2016-06-10 11:49:11', '2016-06-01 11:49:11', 0, 12000),
(7, 1, 'Thời trang thể thao gắn liền với cuộc sống', 'Với dây chuyên sản xuất hiện đại bậc asdassasd asdasasd', 'Với dây chuyên sản xuất hiện đại bậc nhất được nhập khẩu từ CHLB Đức, quy trình sản xuất tuân thủ nghiêm ngặt theo tiêu chuẩn Quốc tế ISO 9001 : 2008. DONEX luôn cam kết sẽ mang đến cho Quý khách hàng những sản phẩm tốt nhất, chất lượng tốt nhất, và luôn cố gắng nỗ lực hết mình vì sứ mệnh phục vụ khách hàng.', '7.png', 1, '2016-06-11 11:49:11', '2016-06-01 11:49:11', 0, 500);

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
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
  `is_active` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `fullname`, `address`, `phone`, `email`, `ship_address`, `ship_name`, `ship_phone`, `date_create`, `date_delivery`, `note`, `total_amount`, `total_amount_real`, `is_active`) VALUES
(1, 'Cao Cau', 'ádadd adsdasda ádasd ádasd', '0351213843', '132463513213', 'ádadd adsdasda ádasd ádasd', 'Cao Cau', '0351213843', '2016-06-04 20:15:06', NULL, NULL, 8052000, 8857200, 0),
(2, 'Lam Xung', 'adasdasd adad asdasda asdsd', '036132468', 'asdsd2@sdasd', 'adasdasd adad asdasda asdsd', 'Lam Xung', '036132468', '2016-06-04 20:27:02', NULL, NULL, 2444000, 2688400, 0),
(3, 'Duong Chi', '32463513463 131384321. 3.431324313.46 .43234532.5', '46137651', '3432134632', '32463513463 131384321. 3.431324313.46 .43234532.5', 'Duong Chi', '46137651', '2016-06-04 20:33:59', NULL, NULL, 1536000, 1689600, 0),
(4, 'asdasd', 'asds sadsd asasd asdas', 'asdasd', 'asdas', 'asds sadsd asasd asdas', 'asdasd', 'asdasd', '2016-06-04 20:36:10', NULL, NULL, 82000, 90200, 0),
(5, 'dadasd', 'asd asdasd asdas asdasd', 'asdasd', 'asdas', 'asd asdasd asdas asdasd', 'dadasd', 'asdasd', '2016-06-04 20:38:56', NULL, NULL, 232000, 255200, 0),
(6, 'ádasd', 'sấd ádasd ádas ádasd', 'ádasd', 'ádasd', 'sấd ádasd ádas ádasd', 'ádasd', 'ádasd', '2016-06-04 20:47:05', NULL, NULL, 0, 0, 0),
(7, 'Ga', '435468132 351303513 3.431.513.13.5 354131384631.35', '13.21351.2163', '321.21035413', '435468132 351303513 3.431.513.13.5 354131384631.35', 'Ga', '13.21351.2163', '2016-06-04 20:50:59', NULL, NULL, 4552000, 5007200, 0),
(8, 'sdasd', 'sds sadsa ádas ádas', 'ádsa', 'ádas', 'sds sadsa ádas ádas', 'sdasd', 'ádsa', '2016-06-04 20:56:26', NULL, NULL, 3636000, 3999600, 0),
(9, 'ádasd', 'âsd ádasd asd áddas', 'áddas', 'sád', 'âsd ádasd asd áddas', 'ádasd', 'áddas', '2016-06-04 21:04:08', NULL, NULL, 3598000, 3957800, 0),
(10, 'ádas', 'ádas sad áds âsd', 'sấd', 'âsd', 'ádas sad áds âsd', 'ádas', 'sấd', '2016-06-04 21:09:08', NULL, NULL, 205000, 225500, 0),
(11, 'Danh Nguyen', '113 CSC? Nh?n H?nh An Nh?n Bình ??nh', '0123456789', 'abc@gmail.com', '113 CSC? Nh?n H?nh An Nh?n Bình ??nh', 'Danh Nguyen', '0123456789', '2016-06-07 14:18:32', NULL, NULL, 24000, 26400, 0),
(12, 'Danh Nguyen', '132 ?ông Hòa T? HCM', '0123456789', 'acb@gmail.com', '132 ?ông Hòa T? HCM', 'Danh Nguyen', '0123456789', '2016-06-09 10:54:47', NULL, NULL, 20000, 22000, 0);

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL,
  `id_order` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` double NOT NULL,
  `price_promotion` datetime DEFAULT NULL,
  `total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`id`, `id_order`, `id_product`, `quantity`, `price`, `price_promotion`, `total`) VALUES
(1, 1, 6, 2000, 4000, NULL, 8000000),
(2, 1, 4, 13, 4000, NULL, 52000),
(3, 2, 3, 600, 4000, NULL, 2400000),
(4, 2, 4, 5, 4000, NULL, 20000),
(5, 2, 6, 6, 4000, NULL, 24000),
(6, 3, 4, 3, 4000, NULL, 12000),
(7, 3, 7, 300, 5000, NULL, 1500000),
(8, 3, 3, 6, 4000, NULL, 24000),
(9, 4, 3, 8, 4000, NULL, 32000),
(10, 4, 4, 5, 4000, NULL, 20000),
(11, 4, 7, 6, 5000, NULL, 30000),
(12, 5, 3, 8, 4000, NULL, 32000),
(13, 5, 9, 50, 4000, NULL, 200000),
(14, 7, 2, 8, 4000, NULL, 32000),
(15, 7, 7, 900, 5000, NULL, 4500000),
(16, 7, 6, 5, 4000, NULL, 20000),
(17, 8, 9, 900, 4000, NULL, 3600000),
(18, 8, 3, 6, 4000, NULL, 24000),
(19, 8, 4, 3, 4000, NULL, 12000),
(20, 9, 4, 90, 4000, NULL, 360000),
(21, 9, 6, 800, 4000, NULL, 3200000),
(22, 9, 1, 6, 5000, NULL, 30000),
(23, 9, 11, 2, 4000, NULL, 8000),
(24, 10, 5, 40, 4000, NULL, 160000),
(25, 10, 4, 5, 4000, NULL, 20000),
(26, 10, 7, 5, 5000, NULL, 25000),
(27, 11, 2, 6, 4000, NULL, 24000),
(28, 12, 11, 1, 4000, NULL, 4000),
(29, 12, 3, 4, 4000, NULL, 16000);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
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
  `purchase` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `code`, `id_category`, `id_account`, `price`, `price_promotion`, `images`, `title`, `alias`, `description`, `quantity`, `date_create`, `date_update`, `is_active`, `is_savedraft`, `views`, `purchase`) VALUES
(1, 'aaa', 1, 2, 5000, 6000, '1.png-2.png-3.png-4.png-5.png', 'fucking beep', 'Nhãn', 'Nâng niu sành điệu đến từng bước chân ', 300, '2016-06-01 11:48:30', '2016-06-01 11:48:30', 0, 0, 120, 200),
(2, 'bbb', 1, 2, 5000, 4000, '2.png', 'fucking beep b', '', 'Nâng niu sành điệu đến từng bước chân ', 300, '2016-06-01 11:49:11', '2016-06-01 11:49:11', 0, 0, 120, 200),
(3, 'ccc', 1, 2, 5000, 4000, '3.png', 'fucking beep c', '', 'Nâng niu sành điệu đến từng bước chân ', 300, '2016-06-01 11:49:11', '2016-06-01 11:49:11', 0, 0, 120, 200),
(4, 'dddd', 1, 2, 5000, 4000, '4.png', 'fucking beep d', '', 'Nâng niu sành điệu đến từng bước chân ', 300, '2016-06-01 11:49:11', '2016-06-01 11:49:11', 0, 0, 120, 200),
(5, 'eee', 1, 2, 5000, 4000, '5.png', 'fucking beep e', ' ', 'Nâng niu sành điệu đến từng bước chân ', 800, '2016-06-01 11:49:11', '2016-06-01 11:49:11', 0, 0, 5000, 300),
(6, 'fff', 1, 2, 5000, 4000, '6.png', 'fucking beep e', ' ', 'Nâng niu sành điệu đến từng bước chân ', 800, '2016-06-01 11:49:11', '2016-06-01 11:49:11', 0, 0, 5000, 300),
(7, 'ggg', 1, 2, 5000, 5000, '7.png', 'fucking beep e', ' ', 'Nâng niu sành điệu đến từng bước chân ', 800, '2016-06-01 11:49:11', '2016-06-01 11:49:11', 0, 0, 5000, 300),
(8, 'hhh', 1, 2, 5000, 4000, '8.png', 'fucking beep e', ' ', 'Nâng niu sành điệu đến từng bước chân ', 800, '2016-06-01 11:49:11', '2016-06-01 11:49:11', 0, 0, 5000, 300),
(9, 'iii', 1, 2, 5000, 4000, '9.png', 'fucking beep e', ' ', 'Nâng niu sành điệu đến từng bước chân ', 800, '2016-06-01 11:49:11', '2016-06-01 11:49:11', 0, 0, 5000, 300),
(11, 'lll', 1, 2, 5000, 4000, '11.png', 'fucking beep e', ' ', 'Nâng niu sành điệu đến từng bước chân ', 800, '2016-06-01 11:49:11', '2016-06-01 11:49:11', 0, 0, 5000, 300),
(12, 'jjj', 1, 2, 5000, 4000, '1.png-1.jpg', 'fucking beep', '', 'Nâng niu sành điệu đến từng bước chân ', 300, '2016-06-01 11:48:30', '2016-06-01 11:48:30', 0, 0, 120, 200),
(13, 'qqq', 1, 2, 5000, 4000, '1.png-1.jpg', 'fucking beep', '', 'Nâng niu sành điệu đến từng bước chân ', 300, '2016-06-01 11:48:30', '2016-06-01 11:48:30', 0, 0, 120, 200),
(14, 'mmm', 1, 2, 5000, 4000, '1.png-1.jpg', 'fucking beep', '', 'Nâng niu sành điệu đến từng bước chân ', 300, '2016-06-01 11:48:30', '2016-06-01 11:48:30', 0, 0, 120, 200),
(15, 'nnn', 1, 2, 5000, 4000, '1.png-1.jpg', 'fucking beep', '', 'Nâng niu sành điệu đến từng bước chân ', 300, '2016-06-01 11:48:30', '2016-06-01 11:48:30', 0, 0, 120, 200),
(16, 'oo', 1, 2, 5000, 4000, '1.png-1.jpg', 'fucking beep', '', 'Nâng niu sành điệu đến từng bước chân ', 300, '2016-06-01 11:48:30', '2016-06-01 11:48:30', 0, 0, 120, 200),
(17, 'S045', 9, 2, 123000, 0, 'C:\\fakepath\\tieng-anh-24.jpg', 'Giày Danh Nguyen', 'Giày Danh Nguyen', 'Danh Nguyen', 0, '2016-06-11 14:33:44', '2016-06-11 14:33:44', 1, 0, 0, 0),
(18, 'S023', 9, 2, 123000, 123000, 'C:\\fakepath\\tieng-anh-24.jpg', 'Giày Danh Nguyen', 'Giày Danh Nguyen', 'Giày Danh Nguyen', 0, '2016-06-11 14:50:07', '2016-06-11 14:50:07', 1, 0, 0, 0),
(19, 'S034', 9, 2, 123000, 0, 'C:\\fakepath\\tieng-anh-24.jpg', 'Giày Danh Nguyen', 'Giày Danh Nguyen', 'Giày Danh Nguyen', 0, '2016-06-11 15:13:42', '2016-06-11 15:13:42', 1, 0, 0, 0),
(20, 'S012', 9, 2, 123000, 0, 'C:\\fakepath\\tieng-anh-24.jpg', 'Giày Danh Nguyen', 'Giày Danh Nguyen', 'Giày Danh Nguyen', 0, '2016-06-11 15:15:17', '2016-06-11 15:15:17', 1, 0, 0, 0),
(34, 'gggg', 13, 2, 123, 12, 'C:\\fakepath\\tieng-anh-24.jpg', 'adhhhhhhhhhhhhhhhhhhhhhhhhhhhhh', 'hhhhhhhhhhhhhhhhhhhhhhhhh', 'hhhhhhhhhhhhhhhhhhhhhhh', 0, '2016-06-11 23:37:39', '2016-06-11 23:37:39', 1, 0, 0, 0),
(35, 'kkk1', 13, 2, 123, 12, 'C:\\fakepath\\tieng-anh-24.jpg', 'adhhhhhhhhhhhhhhhhhhhhhhhhhhhhh', 'hhhhhhhhhhhhhhhhhhhhhhhhh', 'hhhhhhhhhhhhhhhhhhhhhhh', 0, '2016-06-11 23:45:24', '2016-06-11 23:45:24', 1, 0, 0, 0),
(36, 'hk01', 5, 2, 123, 1, 'C:\\fakepath\\light_bulb.png', 'adasdasasdasd', 'ádas?', 'ádasdsasdas', 0, '2016-06-11 23:47:20', '2016-06-11 23:47:20', 1, 0, 0, 0),
(37, 'e123', 9, 2, 456, 4, 'C:\\fakepath\\tieng-anh-24.jpg', 'Danh Nguyen', 'Danh Nguyen', 'Danh Nguyen', 0, '2016-06-11 23:59:59', '2016-06-11 23:59:59', 1, 0, 0, 0),
(39, 'e245', 9, 2, 478, 2, 'C:\\fakepath\\LogoChuan111.jpg', 'Danh Nguyen', 'Danh Nguyen', 'Danh Nguyen', 0, '2016-06-12 00:01:35', '2016-06-12 00:01:35', 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `request_contact`
--

CREATE TABLE `request_contact` (
  `id` int(11) NOT NULL,
  `fullname` text COLLATE utf8_unicode_ci NOT NULL,
  `email` text COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `is_repsonse` bit(1) NOT NULL,
  `date_create` datetime NOT NULL COMMENT 'Thời gian khởi tạo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `request_contact`
--

INSERT INTO `request_contact` (`id`, `fullname`, `email`, `content`, `is_repsonse`, `date_create`) VALUES
(1, 'sadas', 'ádasd', 'âsđ', b'0', '2016-06-04 22:12:01'),
(2, 'ádasd', 'sadasasd', 'ádasdasd', b'0', '2016-06-04 22:14:29');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` text COLLATE utf8_unicode_ci NOT NULL,
  `password` text COLLATE utf8_unicode_ci NOT NULL,
  `fullname` text COLLATE utf8_unicode_ci NOT NULL,
  `email` text COLLATE utf8_unicode_ci NOT NULL,
  `id_role` bit(1) NOT NULL,
  `is_active` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `fullname`, `email`, `id_role`, `is_active`) VALUES
(1, 'luong', '1', 'test', 'luong@abc.com', b'1', 1),
(3, 'gacon', 'aaa', 'tao', 'aaa', b'1', 0),
(4, 'danhnguyen', '123456', 'Nguyễn Viết Danh', 'danhnvuit@gmail.com', b'1', 1),
(5, 'duyluong', '123456', 'Phùng Duy Lương', 'luong@gmail.com', b'1', 1),
(6, 'ngoclinh', '123456', 'Phạm Ngọc Linh', 'linh@gmail.com', b'1', 1),
(7, 'dangkhoa', '123456', 'Huỳnh Đức Đăng Khoa', 'dangkhoa@gmail.com', b'1', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `request_contact`
--
ALTER TABLE `request_contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
--
-- AUTO_INCREMENT for table `request_contact`
--
ALTER TABLE `request_contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

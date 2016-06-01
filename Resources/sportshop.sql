-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 01, 2016 at 11:54 AM
-- Server version: 5.6.16
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `id_parent` int(11) DEFAULT NULL,
  `is_active` int(11) NOT NULL,
  `date_create` datetime NOT NULL,
  `slug` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=13 ;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `title`, `description`, `id_parent`, `is_active`, `date_create`, `slug`) VALUES
(1, 'Áo thể thao', 'Áo thể thao', NULL, 1, '2016-06-01 00:00:00', 'ao-the-thao'),
(2, 'Giày thể thao', 'Giày thể thao', NULL, 1, '2016-06-01 00:00:00', 'giay-the-thao'),
(3, 'Dụng cụ thể thao', 'Dụng cụ thể thao', NULL, 1, '2016-06-01 00:00:00', 'dung-cu-the-thao'),
(4, 'Áo câu lạc bộ', 'Áo câu lạc bộ', 1, 1, '2016-06-01 00:00:00', 'ao-cau-lac-bo'),
(5, 'Áo đội tuyển', 'Áo đội tuyển', 1, 1, '2016-06-01 00:00:00', 'ao-doi-tuyen'),
(6, 'Áo tay dài', 'Áo tay dài', 1, 1, '2016-06-01 00:00:00', 'ao-tay-dai'),
(7, 'Giày bóng đá', 'Giày bóng đá', 2, 1, '2016-06-01 00:00:00', 'giay-bong-da'),
(8, 'Giày quần vợt', 'Giày quần vợt', 2, 1, '2016-06-01 00:00:00', 'giay-quan-vot'),
(9, 'Giày Nike', 'Giày Nike', 2, 1, '2016-06-01 00:00:00', 'giay-nike'),
(10, 'Bóng đá', 'Bóng đá', 3, 1, '2016-06-01 00:00:00', 'bong-da'),
(11, 'Bóng rổ', 'Bóng rổ', 3, 1, '2016-06-01 00:00:00', 'bong-ro'),
(12, 'Bóng ném', 'Bóng ném', 3, 1, '2016-06-01 00:00:00', 'bong-nem');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE IF NOT EXISTS `contact` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE IF NOT EXISTS `news` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE IF NOT EXISTS `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fullname` text COLLATE utf8_unicode_ci NOT NULL,
  `address` text COLLATE utf8_unicode_ci NOT NULL,
  `phone` text COLLATE utf8_unicode_ci NOT NULL,
  `email` text COLLATE utf8_unicode_ci NOT NULL,
  `ship_address` text COLLATE utf8_unicode_ci NOT NULL,
  `ship_name` text COLLATE utf8_unicode_ci NOT NULL,
  `ship_phone` text COLLATE utf8_unicode_ci NOT NULL,
  `date_create` datetime NOT NULL,
  `date_delivery` datetime NOT NULL,
  `note` text COLLATE utf8_unicode_ci NOT NULL,
  `total_amount` double NOT NULL,
  `total_amount_real` double NOT NULL,
  `is_active` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE IF NOT EXISTS `order_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_order` int(11) NOT NULL,
  `id_product` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` double NOT NULL,
  `price_promotion` double NOT NULL,
  `total` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE IF NOT EXISTS `product` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `code`, `id_category`, `id_account`, `price`, `price_promotion`, `images`, `title`, `alias`, `description`, `quantity`, `date_create`, `date_update`, `is_active`, `is_savedraft`, `views`, `purchase`) VALUES
(1, 'S001', 4, 1, 700000, 699000, '', 'Áo Thun Thể Thao Nam A018', 'Áo Thun A018', 'Bạn đang quan tâm tới: Áo Thun Thể Thao Nam A018. Với mức giá là 700.000 VND SportShop cung cấp cho bạn thông tin: chi tiết sản phẩm, hình ảnh, video,thắc mắc liên quan cũng như thông tin chi tiết liên hệ chủ shop để bạn lựa chọn mua Áo Thun Thể Thao Nam A018 ưng ý nhất.', 100, '2016-06-01 00:00:00', '2016-06-01 00:00:00', 1, 0, 1, 0),
(2, 'S002', 7, 1, 2000000, 1999000, '', 'Nike Mercurial Vapor X Green', 'Nike Mercurial', 'Lộ diện giày bóng đá Nike Mercurial Vapor X green cho mùa giải mới\r\nCùng với sự kiện ra mắt giày bóng đá Nike Mercurial Superfly IV Cristiano Ronaldo, Nike cũng trình làng mẫu giày Nike Mercurial Vapor thế hệ thứ 10, chúng có tên chính thức là Nike Mercurial Vapor X Electric Green/ Volt/Hyper Punch/ Black vào ngày 21/08 vừa qua. 2  mẫu giày mới này có màu gần như giống nhau.', 100, '2016-06-01 00:00:00', '2016-06-01 00:00:00', 1, 0, 1, 0),
(3, 'S003', 10, 1, 209000, 0, '', 'Bóng Đá Gerustar Futsal', 'Bóng Gerustar Futsal', 'Quả Bóng Đá GERUSTAR Futsal 2030 được sản xuất với những đặc điểm khác biệt, dành riêng để sử dụng cho sân thi đấu Futsal trong nhà và sân cỏ mini nhân tạo. GERUSTAR Futsal 2030 còn được sử dụng trong giải FI League ( Football Indoor – bóng đá trong nhà) và đạt chứng nhận tiêu chuẩn FIFA. Bóng GERUSTAR Futsal 2030 sẽ mang đến cho bạn những giờ phút tập luyện thể thao khỏe mạnh trong dịp hè năm nay.', 100, '2016-06-01 00:00:00', '2016-06-01 00:00:00', 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` text COLLATE utf8_unicode_ci NOT NULL,
  `password` text COLLATE utf8_unicode_ci NOT NULL,
  `fullname` text COLLATE utf8_unicode_ci NOT NULL,
  `email` text COLLATE utf8_unicode_ci NOT NULL,
  `id_role` bit(1) NOT NULL,
  `is_active` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `fullname`, `email`, `id_role`, `is_active`) VALUES
(1, 'danhnguyen', '123456', 'Nguyễn Viết Danh', 'danhnvuit@gmail.com', b'0', 0),
(2, 'duyluong', '123456', 'Phùng Duy Lương', 'luong@gmail.com', b'1', 1),
(3, 'ngoclinh', '123456', 'Phạm Ngọc Linh', 'linh@gmail.com', b'1', 1),
(4, 'dangkhoa', '123456', 'Huỳnh Đức Đăng Khoa', 'dangkhoa@gmail.com', b'1', 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

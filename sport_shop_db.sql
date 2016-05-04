
-- Project: Sport shop 
-- Writed: 28-03-2016
-- Author: Team 01


--
-- Database name: 'sport_shop_db'
--
-- CREATE SCHEMA `sport_shop_db` ;

----------------------------------------------------------

--
-- Table structure for table `article`
--

CREATE TABLE IF NOT EXISTS `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_category` text COLLATE utf8_unicode_ci NOT NULL,
  `id_categorys` text COLLATE utf8_unicode_ci NOT NULL,
  `id_user` int(11) NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `en_title` text COLLATE utf8_unicode_ci NOT NULL,
  `short_detail` text COLLATE utf8_unicode_ci NOT NULL,
  `en_short_detail` text COLLATE utf8_unicode_ci NOT NULL,
  `long_detail` text COLLATE utf8_unicode_ci NOT NULL,
  `en_long_detail` text COLLATE utf8_unicode_ci NOT NULL,
  `alias` text COLLATE utf8_unicode_ci NOT NULL,
  `en_alias` text COLLATE utf8_unicode_ci NOT NULL,
  `image` text COLLATE utf8_unicode_ci NOT NULL,
  `images` text COLLATE utf8_unicode_ci,
  `title_seo` text COLLATE utf8_unicode_ci NOT NULL,
  `en_title_seo` text COLLATE utf8_unicode_ci NOT NULL,
  `desc_seo` text COLLATE utf8_unicode_ci NOT NULL,
  `en_desc_seo` text COLLATE utf8_unicode_ci NOT NULL,
  `keyword_seo` text COLLATE utf8_unicode_ci NOT NULL,
  `en_keyword_seo` text COLLATE utf8_unicode_ci NOT NULL,
  `is_active` int(11) NOT NULL,
  `is_special` int(11) NOT NULL,
  `time` int(11) NOT NULL COMMENT 'Thời gian khởi tạo',
  `time_update` int(11) NOT NULL COMMENT 'Thời gian cập nhật gần đây nhất',
  `time_sentmail` int(11) NOT NULL COMMENT 'Thời gian gửi bản tin',
  `is_sentmail` int(11) NOT NULL COMMENT 'Trạng thái gửi bản tin',
  `is_savedraft` int(11) NOT NULL,
  `views` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=39 ;

--
-- Dumping data for table `article`
--

INSERT INTO `article` (`id`, `id_category`, `id_categorys`, `id_user`, `title`, `en_title`, `short_detail`, `en_short_detail`, `long_detail`, `en_long_detail`, `alias`, `en_alias`, `image`, `images`, `title_seo`, `en_title_seo`, `desc_seo`, `en_desc_seo`, `keyword_seo`, `en_keyword_seo`, `is_active`, `is_special`, `time`, `time_update`, `time_sentmail`, `is_sentmail`, `is_savedraft`, `views`) VALUES
(8, '3', '', 1, 'Article #1', 'Article #1', 'Article #1', 'Article #1', '<p>Article #1</p>\n', '<p>Article #1</p>\n', 'article-1', 'article-1', 'http://localhost/hoadatset/public/uploads/images/Jellyfish.jpg', 'http://localhost/hoadatset/public/uploads/images/Jellyfish.jpg', 'Article #1', 'Article #1', 'Article #1', 'Article #1', 'Article #1', 'Article #1', 1, 0, 1427112242, 1427113540, 1432544128, 1, 0, 0),
(9, '3', '', 1, 'Article #1', 'Article #1', 'Article #1', 'Article #1', '<p>Article #1</p>\n', '<p>Article #1</p>\n', 'article-1', 'article-1', 'http://localhost/hoadatset/public/uploads/images/Jellyfish.jpg', 'http://localhost/hoadatset/public/uploads/images/Jellyfish.jpg', 'Article #1', 'Article #1', 'Article #1', 'Article #1', 'Article #1', 'Article #1', 1, 0, 1427112245, 1427113540, 0, 0, 0, 0),
(10, '3', '', 1, 'Article #1', 'Article #1', 'Article #1', 'Article #1', '<p>Article #1</p>\n', '<p>Article #1</p>\n', 'article-1', 'article-1', 'http://localhost/hoadatset/public/uploads/images/Jellyfish.jpg', 'http://localhost/hoadatset/public/uploads/images/Jellyfish.jpg', 'Article #1', 'Article #1', 'Article #1', 'Article #1', 'Article #1', 'Article #1', 1, 0, 1427112245, 1427113540, 0, 0, 0, 0),
(11, '3', '', 1, 'Article #1', 'Article #1', 'Article #1', 'Article #1', '<p>Article #1</p>\n', '<p>Article #1</p>\n', 'article-1', 'article-1', 'http://localhost/hoadatset/public/uploads/images/Jellyfish.jpg', 'http://localhost/hoadatset/public/uploads/images/Jellyfish.jpg', 'Article #1', 'Article #1', 'Article #1', 'Article #1', 'Article #1', 'Article #1', 1, 0, 1427112245, 1427113540, 0, 0, 0, 0),
(17, '3', '', 1, 'Article #1', 'Article #1', 'Article #1', 'Article #1', '<p>Article #1</p>\n', '<p>Article #1</p>\n', 'article-1', 'article-1', 'http://localhost/hoadatset/public/uploads/images/Jellyfish.jpg', 'http://localhost/hoadatset/public/uploads/images/Jellyfish.jpg', 'Article #1', 'Article #1', 'Article #1', 'Article #1', 'Article #1', 'Article #1', 1, 0, 1427116154, 1427116154, 0, 0, 0, 0),
(18, '3', '', 1, 'Article #1', 'Article #1', 'Article #1', 'Article #1', '<p>Article #1</p>\n', '<p>Article #1</p>\n', 'article-1', 'article-1', 'http://localhost/hoadatset/public/uploads/images/Jellyfish.jpg', 'http://localhost/hoadatset/public/uploads/images/Jellyfish.jpg', 'Article #1', 'Article #1', 'Article #1', 'Article #1', 'Article #1', 'Article #1', 1, 0, 1427116154, 1427116154, 0, 0, 0, 0),
(19, '3', '', 1, 'Article #1', 'Article #1', 'Article #1', 'Article #1', '<p>Article #1</p>\n', '<p>Article #1</p>\n', 'article-1', 'article-1', 'http://localhost/hoadatset/public/uploads/images/Jellyfish.jpg', 'http://localhost/hoadatset/public/uploads/images/Jellyfish.jpg', 'Article #1', 'Article #1', 'Article #1', 'Article #1', 'Article #1', 'Article #1', 1, 0, 1427116154, 1427116154, 0, 0, 0, 0),
(22, '3', '', 1, 'Article #1', 'Article #1', 'Article #1', 'Article #1', '<p>Article #1</p>\n', '<p>Article #1</p>\n', 'article-1', 'article-1', 'http://localhost/hoadatset/public/uploads/images/Jellyfish.jpg', 'http://localhost/hoadatset/public/uploads/images/Jellyfish.jpg', 'Article #1', 'Article #1', 'Article #1', 'Article #1', 'Article #1', 'Article #1', 1, 0, 1427116159, 1427116159, 0, 0, 0, 0),
(23, '3', '', 1, 'Article #1', 'Article #1', 'Article #1', 'Article #1', '<p>Article #1</p>\n', '<p>Article #1</p>\n', 'article-1', 'article-1', 'http://localhost/hoadatset/public/uploads/images/Jellyfish.jpg', 'http://localhost/hoadatset/public/uploads/images/Jellyfish.jpg', 'Article #1', 'Article #1', 'Article #1', 'Article #1', 'Article #1', 'Article #1', 1, 0, 1427116159, 1427116159, 0, 0, 0, 0),
(24, '3', '', 1, 'Article #1', 'Article #1', 'Article #1', 'Article #1', '<p>Article #1</p>\n', '<p>Article #1</p>\n', 'article-1', 'article-1', 'http://localhost/hoadatset/public/uploads/images/Jellyfish.jpg', 'http://localhost/hoadatset/public/uploads/images/Jellyfish.jpg', 'Article #1', 'Article #1', 'Article #1', 'Article #1', 'Article #1', 'Article #1', 1, 0, 1427116159, 1427116159, 0, 0, 0, 0),
(25, '3', '', 1, 'Article #1', 'Article #1', 'Article #1', 'Article #1', '<p>Article #1</p>\n', '<p>Article #1</p>\n', 'article-1', 'article-1', 'http://localhost/hoadatset/public/uploads/images/Jellyfish.jpg', 'http://localhost/hoadatset/public/uploads/images/Jellyfish.jpg', 'Article #1', 'Article #1', 'Article #1', 'Article #1', 'Article #1', 'Article #1', 1, 0, 1427116159, 1427116159, 0, 0, 0, 0),
(26, '3', '', 1, 'Article #1', 'Article #1', 'Article #1', 'Article #1', '<p>Article #1</p>\n', '<p>Article #1</p>\n', 'article-1', 'article-1', 'http://localhost/hoadatset/public/uploads/images/Jellyfish.jpg', 'http://localhost/hoadatset/public/uploads/images/Jellyfish.jpg', 'Article #1', 'Article #1', 'Article #1', 'Article #1', 'Article #1', 'Article #1', 1, 0, 1427116159, 1427116159, 0, 0, 0, 0),
(27, '3', '', 1, 'Article #1', 'Article #1', 'Article #1', 'Article #1', '<p>Article #1</p>\n', '<p>Article #1</p>\n', 'article-1', 'article-1', 'http://localhost/hoadatset/public/uploads/images/Jellyfish.jpg', 'http://localhost/hoadatset/public/uploads/images/Jellyfish.jpg', 'Article #1', 'Article #1', 'Article #1', 'Article #1', 'Article #1', 'Article #1', 1, 0, 1427116159, 1427116159, 0, 0, 0, 0),
(28, '3', '', 1, 'Article #1', 'Article #1', 'Article #1', 'Article #1', '<p>Article #1</p>\n', '<p>Article #1</p>\n', 'article-1', 'article-1', 'http://localhost/hoadatset/public/uploads/images/Jellyfish.jpg', 'http://localhost/hoadatset/public/uploads/images/Jellyfish.jpg', 'Article #1', 'Article #1', 'Article #1', 'Article #1', 'Article #1', 'Article #1', 1, 0, 1427116159, 1427362078, 0, 0, 0, 0),
(29, '3', '', 1, 'Article #1', 'Article #1', 'Article #1', 'Article #1', '<p>Article #1</p>\n', '<p>Article #1</p>\n', 'article-1', 'article-1', 'http://localhost/hoadatset/public/uploads/images/Jellyfish.jpg', 'http://localhost/hoadatset/public/uploads/images/Jellyfish.jpg', 'Article #1', 'Article #1', 'Article #1', 'Article #1', 'Article #1', 'Article #1', 1, 1, 1427116159, 1427362021, 0, 0, 0, 0),
(30, '2', '', 1, '123', '321', '123', '123', '<p>123</p>\n', '<p>123</p>\n', '123', '321', 'http://localhost/hoadatset/public/uploads/images/Hydrangeas.jpg', 'http://localhost/hoadatset/public/uploads/images/Hydrangeas.jpg||http://localhost/hoadatset/public/uploads/images/Jellyfish.jpg', '123', '321', '123', '321', '123', '321', 1, 0, 1429017386, 1429017386, 0, 0, 0, 0),
(31, '2', '', 1, '123', '321', '123', '123', '<p>123</p>\n', '<p>123</p>\n', '123', '321', 'http://localhost/hoadatset/public/uploads/images/Hydrangeas.jpg', 'http://localhost/hoadatset/public/uploads/images/Hydrangeas.jpg||http://localhost/hoadatset/public/uploads/images/Jellyfish.jpg', '123', '321', '123', '321', '123', '321', 1, 0, 1429450935, 1429450935, 0, 0, 0, 0),
(32, '3', '', 1, 'Article #1', 'Article #1', 'Article #1', 'Article #1', '<p>Article #1</p>\n', '<p>Article #1</p>\n', 'article-1', 'article-1', 'http://localhost/hoadatset/public/uploads/images/Jellyfish.jpg', 'http://localhost/hoadatset/public/uploads/images/Jellyfish.jpg', 'Article #1', 'Article #1', 'Article #1', 'Article #1', 'Article #1', 'Article #1', 1, 1, 1429450935, 1429450935, 0, 0, 0, 0),
(33, '3', '', 1, 'Article #1', 'Article #1', 'Article #1', 'Article #1', '<p>Article #1</p>\n', '<p>Article #1</p>\n', 'article-1', 'article-1', 'http://localhost/hoadatset/public/uploads/images/Jellyfish.jpg', 'http://localhost/hoadatset/public/uploads/images/Jellyfish.jpg', 'Article #1', 'Article #1', 'Article #1', 'Article #1', 'Article #1', 'Article #1', 1, 0, 1429450935, 1429450935, 0, 0, 0, 0),
(34, '3', '', 1, 'Article #1', 'Article #1', 'Article #1', 'Article #1', '<p>Article #1</p>\n', '<p>Article #1</p>\n', 'article-1', 'article-1', 'http://localhost/hoadatset/public/uploads/images/Jellyfish.jpg', 'http://localhost/hoadatset/public/uploads/images/Jellyfish.jpg', 'Article #1', 'Article #1', 'Article #1', 'Article #1', 'Article #1', 'Article #1', 1, 0, 1429450935, 1429450935, 0, 0, 0, 0),
(35, '3', '', 1, 'Article #1', 'Article #1', 'Article #1', 'Article #1', '<p>Article #1</p>\n', '<p>Article #1</p>\n', 'article-1', 'article-1', 'http://localhost/hoadatset/public/uploads/images/Jellyfish.jpg', 'http://localhost/hoadatset/public/uploads/images/Jellyfish.jpg', 'Article #1', 'Article #1', 'Article #1', 'Article #1', 'Article #1', 'Article #1', 1, 0, 1429450935, 1429450935, 0, 0, 0, 0),
(36, '3', '', 1, 'Article #1', 'Article #1', 'Article #1', 'Article #1', '<p>Article #1</p>\n', '<p>Article #1</p>\n', 'article-1', 'article-1', 'http://localhost/hoadatset/public/uploads/images/Jellyfish.jpg', 'http://localhost/hoadatset/public/uploads/images/Jellyfish.jpg', 'Article #1', 'Article #1', 'Article #1', 'Article #1', 'Article #1', 'Article #1', 1, 0, 1429450935, 1429450935, 0, 0, 0, 0),
(37, '3', '', 1, 'Article #1', 'Article #1', 'Article #1', 'Article #1', '<p>Article #1</p>\n', '<p>Article #1</p>\n', 'article-1', 'article-1', 'http://localhost/hoadatset/public/uploads/images/Jellyfish.jpg', 'http://localhost/hoadatset/public/uploads/images/Jellyfish.jpg', 'Article #1', 'Article #1', 'Article #1', 'Article #1', 'Article #1', 'Article #1', 0, 1, 1432544131, 1432544131, 1432544128, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `article_one`
--

CREATE TABLE IF NOT EXISTS `article_one` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `en_title` text COLLATE utf8_unicode_ci NOT NULL,
  `short_detail` text COLLATE utf8_unicode_ci NOT NULL,
  `en_short_detail` text COLLATE utf8_unicode_ci NOT NULL,
  `long_detail` text COLLATE utf8_unicode_ci NOT NULL,
  `en_long_detail` text COLLATE utf8_unicode_ci NOT NULL,
  `is_active` int(11) NOT NULL,
  `title_seo` text COLLATE utf8_unicode_ci NOT NULL,
  `desc_seo` text COLLATE utf8_unicode_ci NOT NULL,
  `keyword_seo` text COLLATE utf8_unicode_ci NOT NULL,
  `en_title_seo` text COLLATE utf8_unicode_ci NOT NULL,
  `en_desc_seo` text COLLATE utf8_unicode_ci NOT NULL,
  `en_keyword_seo` text COLLATE utf8_unicode_ci NOT NULL,
  `alias` text COLLATE utf8_unicode_ci NOT NULL,
  `en_alias` text COLLATE utf8_unicode_ci NOT NULL,
  `time` int(11) NOT NULL,
  `time_update` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `image` text COLLATE utf8_unicode_ci NOT NULL,
  `views` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `article_one`
--

INSERT INTO `article_one` (`id`, `title`, `en_title`, `short_detail`, `en_short_detail`, `long_detail`, `en_long_detail`, `is_active`, `title_seo`, `desc_seo`, `keyword_seo`, `en_title_seo`, `en_desc_seo`, `en_keyword_seo`, `alias`, `en_alias`, `time`, `time_update`, `id_user`, `image`, `views`) VALUES
(1, 'test', 'test', 'test', 'test', '<p>test</p>\n', '<p>test</p>\n', 1, 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 1432218830, 1432218830, 1, 'http://localhost/hoadatset/public/uploads/files/DUC_0615.JPG', 0),
(3, '1', '3', '2', '4', '<p>5</p>\n', '<p>5</p>\n', 1, '1', '1', '1', '3', '3', '3', '1', '3', 1432547937, 1432547937, 1, 'http://localhost/hoadatset/public/uploads/images/Hydrangeas.jpg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `article_sentmail`
--

CREATE TABLE IF NOT EXISTS `article_sentmail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_article` int(11) NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `time` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `article_tags`
--

CREATE TABLE IF NOT EXISTS `article_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_article` int(11) NOT NULL,
  `id_tag` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=104 ;

--
-- Dumping data for table `article_tags`
--

INSERT INTO `article_tags` (`id`, `id_article`, `id_tag`) VALUES
(10, 64, 9),
(11, 64, 5),
(12, 64, 3),
(13, 65, 15),
(14, 65, 4),
(15, 65, 2),
(16, 65, 9),
(17, 65, 5),
(18, 65, 3),
(19, 66, 5),
(20, 66, 4),
(21, 66, 2),
(22, 67, 5),
(23, 67, 4),
(24, 67, 2),
(25, 68, 5),
(26, 68, 4),
(27, 68, 2),
(28, 69, 5),
(29, 69, 4),
(30, 69, 2),
(31, 70, 5),
(32, 70, 4),
(33, 70, 2),
(34, 77, 3),
(35, 78, 3),
(36, 79, 3),
(37, 80, 3),
(38, 84, 4),
(39, 84, 2),
(84, 16, 6),
(85, 16, 9),
(86, 16, 5),
(87, 16, 4),
(88, 16, 3),
(89, 16, 2),
(90, 16, 1),
(96, 29, 9),
(97, 29, 8),
(98, 29, 5),
(99, 28, 9),
(103, 41, 3);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `en_title` text COLLATE utf8_unicode_ci NOT NULL,
  `image` text COLLATE utf8_unicode_ci NOT NULL,
  `short_detail` text COLLATE utf8_unicode_ci NOT NULL,
  `en_short_detail` text COLLATE utf8_unicode_ci NOT NULL,
  `long_detail` text COLLATE utf8_unicode_ci NOT NULL,
  `en_long_detail` text COLLATE utf8_unicode_ci NOT NULL,
  `title_seo` text COLLATE utf8_unicode_ci NOT NULL,
  `desc_seo` text COLLATE utf8_unicode_ci NOT NULL,
  `keyword_seo` text COLLATE utf8_unicode_ci NOT NULL,
  `en_title_seo` text COLLATE utf8_unicode_ci NOT NULL,
  `en_desc_seo` text COLLATE utf8_unicode_ci NOT NULL,
  `en_keyword_seo` text COLLATE utf8_unicode_ci NOT NULL,
  `alias` text COLLATE utf8_unicode_ci NOT NULL,
  `en_alias` text COLLATE utf8_unicode_ci NOT NULL,
  `id_parent` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `is_active` int(11) NOT NULL,
  `date` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=22 ;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `title`, `en_title`, `image`, `short_detail`, `en_short_detail`, `long_detail`, `en_long_detail`, `title_seo`, `desc_seo`, `keyword_seo`, `en_title_seo`, `en_desc_seo`, `en_keyword_seo`, `alias`, `en_alias`, `id_parent`, `type`, `position`, `level`, `is_active`, `date`) VALUES
(1, 'Trang chủ', 'Home', 'http://localhost/hoadatset/public/uploads/images/no-image.gif', '', '', '', '', 'Trang chủ', 'Trang chủ', 'Trang chủ', 'Home', 'Home', 'Home', 'trang-chu', 'home', 0, 0, 1, 0, 1, 1432479714),
(2, 'Giới thiệu', 'About us', 'http://localhost/hoadatset/public/uploads/images/no-image.gif', '', '', '', '', 'Giới thiệu', 'Giới thiệu', 'Giới thiệu', 'About us', 'About us', 'About us', 'gioi-thieu', 'about-us', 0, 0, 2, 0, 1, 1432479729),
(3, 'Sản phẩm', 'Sản phẩm', 'http://localhost/hoadatset/public/uploads/images/no-image.gif', '', '', '', '', 'Sản phẩm', 'Sản phẩm', 'Sản phẩm', 'Products', 'Products', 'Products', 'san-pham', 'products', 0, 1, 3, 0, 1, 1432480020),
(4, 'Tin tức', 'News', 'http://localhost/hoadatset/public/uploads/images/no-image.gif', '', '', '', '', 'Tin tức', 'Tin tức', 'Tin tức', 'News', 'News', 'News', 'tin-tuc', 'news', 0, 2, 4, 0, 1, 1432480066),
(5, 'Liên hệ', 'Liên hệ', 'http://localhost/hoadatset/public/uploads/images/no-image.gif', '', '', '', '', 'Liên hệ', 'Liên hệ', 'Liên hệ', 'Contact', 'Contact', 'Contact', 'lien-he', 'contact', 0, 0, 5, 0, 1, 1432539885),
(6, 'Tuyển dụng', 'Recruitment', 'http://localhost/hoadatset/public/uploads/images/no-image.gif', '', '', '', '', 'Tuyển dụng', 'Tuyển dụng', 'Tuyển dụng', 'Recruitment', 'Recruitment', 'Recruitment', 'tuyen-dung', 'recruitment', 0, 0, 6, 0, 0, 1432480183),
(7, 'Sản phẩm #1', 'Products #1', 'http://localhost/hoadatset/public/uploads/images/no-image.gif', '', '', '', '', 'Sản phẩm #1', 'Sản phẩm #1', 'Sản phẩm #1', 'Products #1', 'Products #1', 'Products #1', 'san-pham-1', 'products-1', 3, 1, 1, 1, 1, 1432480219),
(8, 'Sản phẩm #2', 'Products #2', 'http://localhost/hoadatset/public/uploads/images/no-image.gif', '', '', '', '', 'Sản phẩm #2', 'Sản phẩm #2', 'Sản phẩm #2', 'Products #2', 'Products #2', 'Products #2', 'san-pham-2', 'products-2', 3, 1, 2, 1, 1, 1432480236),
(9, 'Sản phẩm #3', 'Products #3', 'http://localhost/hoadatset/public/uploads/images/no-image.gif', '', '', '', '', 'Sản phẩm #3', 'Sản phẩm #3', 'Sản phẩm #3', 'Products #3', 'Products #3', 'Products #3', 'san-pham-3', 'products-3', 3, 1, 3, 1, 1, 1432480272),
(10, 'Sản phẩm #4', 'Products #4', 'http://localhost/hoadatset/public/uploads/images/no-image.gif', '', '', '', '', 'Sản phẩm #4', 'Sản phẩm #4', 'Sản phẩm #4', 'Products #4', 'Products #4', 'Products #4', 'san-pham-4', 'products-4', 3, 1, 4, 1, 1, 1432480294),
(11, 'Sản phẩm #1.1', 'Products #1.1', 'http://localhost/hoadatset/public/uploads/images/no-image.gif', '', '', '', '', 'Sản phẩm #1.1', 'Sản phẩm #1.1', 'Sản phẩm #1.1', 'Products #1.1', 'Products #1.1', 'Products #1.1', 'san-pham-11', 'products-11', 7, 1, 1, 2, 1, 1432480312),
(12, 'Sản phẩm #1.2', 'Products #1.2', 'http://localhost/hoadatset/public/uploads/images/no-image.gif', '', '', '', '', 'Sản phẩm #1.2', 'Sản phẩm #1.2', 'Sản phẩm #1.2', 'Products #1.2', 'Products #1.2', 'Products #1.2', 'san-pham-12', 'products-12', 7, 1, 2, 2, 1, 1432480330),
(13, 'Sản phẩm #1.3', 'Products #1.3', 'http://localhost/hoadatset/public/uploads/images/no-image.gif', '', '', '', '', 'Sản phẩm #1.3', 'Sản phẩm #1.3', 'Sản phẩm #1.3', 'Products #1.3', 'Products #1.3', 'Products #1.3', 'san-pham-13', 'products-13', 7, 1, 3, 2, 1, 1432480346),
(14, 'Sản phẩm #1.4', 'Products #1.4', 'http://localhost/hoadatset/public/uploads/images/no-image.gif', '', '', '', '', 'Sản phẩm #1.4', 'Sản phẩm #1.4', 'Sản phẩm #1.4', 'Products #1.4', 'Products #1.4', 'Products #1.4', 'san-pham-14', 'products-14', 7, 1, 4, 2, 1, 1432480379),
(15, 'Sản phẩm 2.1', 'Product #2.1', 'http://localhost/hoadatset/public/uploads/images/no-image.gif', '', '', '', '', 'Sản phẩm 2.1', 'Sản phẩm 2.1', 'Sản phẩm 2.1', 'Product #2.1', 'Product #2.1', 'Product #2.1', 'san-pham-21', 'product-21', 8, 1, 1, 2, 1, 1432480399),
(16, 'Sản phẩm #2.2', 'Products #2.2', 'http://localhost/hoadatset/public/uploads/images/no-image.gif', '', '', '', '', 'Sản phẩm #2.2', 'Sản phẩm #2.2', 'Sản phẩm #2.2', 'Products #2.2', 'Products #2.2', 'Products #2.2', 'san-pham-22', 'products-22', 8, 1, 2, 2, 1, 1432480413),
(17, 'Sản phẩm #3.1', 'Products #3.1', 'http://localhost/hoadatset/public/uploads/images/no-image.gif', '', '', '', '', 'Sản phẩm #3.1', 'Sản phẩm #3.1', 'Sản phẩm #3.1', 'Products #3.1', 'Products #3.1', 'Products #3.1', 'san-pham-31', 'products-31', 9, 1, 1, 2, 1, 1432480431),
(18, 'Tức tức #1', 'News #1', 'http://localhost/hoadatset/public/uploads/images/no-image.gif', '', '', '', '', 'Tức tức #1', 'Tức tức #1', 'Tức tức #1', 'News #1', 'News #1', 'News #1', 'tuc-tuc-1', 'news-1', 4, 2, 1, 1, 1, 1432480456),
(19, 'Tin tức #2', 'News #2', 'http://localhost/hoadatset/public/uploads/images/no-image.gif', '', '', '', '', 'Tin tức #2', 'Tin tức #2', 'Tin tức #2', 'News #2', 'News #2', 'News #2', 'tin-tuc-2', 'news-2', 4, 2, 2, 1, 1, 1432480470),
(20, 'Tin tức #3', 'News #3', 'http://localhost/hoadatset/public/uploads/images/no-image.gif', '', '', '', '', 'Tin tức #3', 'Tin tức #3', 'Tin tức #3', 'News #3', 'News #3', 'News #3', 'tin-tuc-3', 'news-3', 4, 2, 3, 1, 1, 1432480498);

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE IF NOT EXISTS `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `id_user_profile` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `id_data` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `info` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Table structure for table `config_website`
--

CREATE TABLE IF NOT EXISTS `config_website` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `googlemap` text COLLATE utf8_unicode_ci NOT NULL,
  `googlemap_address` text COLLATE utf8_unicode_ci NOT NULL,
  `logo` text COLLATE utf8_unicode_ci NOT NULL,
  `icon_logo` text COLLATE utf8_unicode_ci NOT NULL,
  `title_email_sent_news_product` text COLLATE utf8_unicode_ci NOT NULL,
  `content_email_sent_news_product` text COLLATE utf8_unicode_ci NOT NULL,
  `title_email_sent_news_article` text COLLATE utf8_unicode_ci NOT NULL,
  `content_email_sent_news_article` text COLLATE utf8_unicode_ci NOT NULL,
  `number_perpage` int(11) NOT NULL,
  `number_product` int(11) NOT NULL,
  `number_reproduct` int(11) NOT NULL,
  `number_article` int(11) NOT NULL,
  `number_rearticle` int(11) NOT NULL,
  `title_seo` text COLLATE utf8_unicode_ci  NULL,
  `desc_seo` text COLLATE utf8_unicode_ci  NULL ,
  `keyword_seo` text COLLATE utf8_unicode_ci  NULL,
  `en_title_seo` text COLLATE utf8_unicode_ci  NULL,
  `en_desc_seo` text COLLATE utf8_unicode_ci  NULL ,
  `en_keyword_seo` text COLLATE utf8_unicode_ci  NULL ,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `config_website`
--

INSERT INTO `config_website` (`id`, `googlemap`, `googlemap_address`, `logo`, `icon_logo`, `title_email_sent_news_product`, `content_email_sent_news_product`, `title_email_sent_news_article`, `content_email_sent_news_article`, `number_perpage`, `number_product`, `number_reproduct`, `number_article`, `number_rearticle`) VALUES
(1, '10.764767, 106.645612', '181 Bình Thới, 9, Quận 11, Hồ Chí Minh, Việt Nam', 'http://4cdecor.vn/public/uploads/images/hinh-chung/logo.png', 'http://4cdecor.vn/public/uploads/images/hinh-chung/logo.png', 'Tiêu đề sản phẩm', '<p><strong>Sản phẩm gửi mail</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n', 'Tiêu đề tin tức', '<p><strong>Tin tức gửi mail</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n', 1, 2, 3, 4, 5);

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
  `company` text COLLATE utf8_unicode_ci NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `detail` text COLLATE utf8_unicode_ci NOT NULL,
  `detail_reply` text COLLATE utf8_unicode_ci NOT NULL,
  `is_active` int(11) NOT NULL,
  `is_type` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `fullname`, `address`, `email`, `phone`, `company`, `title`, `detail`, `detail_reply`, `is_active`, `is_type`, `time`, `id_user`) VALUES
(1, '', '', 'luonguit@gmail.com', '', '', '', '', '<p>test</p>\r\n', 1, 0, 1432287346, 1);

-- --------------------------------------------------------

--
-- Table structure for table `email_marketing`
--

CREATE TABLE IF NOT EXISTS `email_marketing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fullname` text COLLATE utf8_unicode_ci NOT NULL,
  `email` text COLLATE utf8_unicode_ci NOT NULL,
  `time` int(11) NOT NULL,
  `is_active` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=10 ;

--
-- Dumping data for table `email_marketing`
--

INSERT INTO `email_marketing` (`id`, `fullname`, `email`, `time`, `is_active`, `id_user`) VALUES
(2, 'Phùng Duy Lương', 'luonguit@gmail.com', 1432289039, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `faq`
--

CREATE TABLE IF NOT EXISTS `faq` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file` text COLLATE utf8_unicode_ci,
  `title` text COLLATE utf8_unicode_ci,
  `en_title` text COLLATE utf8_unicode_ci,
  `short_detail` text COLLATE utf8_unicode_ci,
  `en_short_detail` text COLLATE utf8_unicode_ci,
  `long_detail` text COLLATE utf8_unicode_ci,
  `en_long_detail` text COLLATE utf8_unicode_ci,
  `date` int(11) NOT NULL,
  `position` double DEFAULT NULL,
  `is_active` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `time_update` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=39 ;

--
-- Dumping data for table `faq`
--

INSERT INTO `faq` (`id`, `file`, `title`, `en_title`, `short_detail`, `en_short_detail`, `long_detail`, `en_long_detail`, `date`, `position`, `is_active`, `id_user`, `time`, `time_update`) VALUES
(23, 'http://localhost/hoadatset/public/uploads/files/DUC_0615.JPG', '2', '5', '3', '6', '<p>4</p>\n', '<p>7</p>\n', 0, 1, 0, 1, 1429103212, 1429103212),
(38, NULL, '1', '4', '2', '5', '<p>3</p>\n', '<p>6</p>\n', 0, 1, 1, 1, 1432547680, 1432547680);

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE IF NOT EXISTS `gallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `en_title` text COLLATE utf8_unicode_ci NOT NULL,
  `short_detail` text COLLATE utf8_unicode_ci NOT NULL,
  `en_short_detail` text COLLATE utf8_unicode_ci NOT NULL,
  `image` text COLLATE utf8_unicode_ci NOT NULL,
  `images` text COLLATE utf8_unicode_ci,
  `alias` text COLLATE utf8_unicode_ci NOT NULL,
  `en_alias` text COLLATE utf8_unicode_ci NOT NULL,
  `is_active` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `time_update` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `title_seo` text COLLATE utf8_unicode_ci NOT NULL,
  `desc_seo` text COLLATE utf8_unicode_ci NOT NULL,
  `keyword_seo` text COLLATE utf8_unicode_ci NOT NULL,
  `en_title_seo` text COLLATE utf8_unicode_ci NOT NULL,
  `en_desc_seo` text COLLATE utf8_unicode_ci NOT NULL,
  `en_keyword_seo` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `gallery`
--

INSERT INTO `gallery` (`id`, `title`, `en_title`, `short_detail`, `en_short_detail`, `image`, `images`, `alias`, `en_alias`, `is_active`, `time`, `time_update`, `id_user`, `title_seo`, `desc_seo`, `keyword_seo`, `en_title_seo`, `en_desc_seo`, `en_keyword_seo`) VALUES
(3, '1', '2', '3', '4', 'http://localhost/hoadatset/public/uploads/files/DUC_0615.JPG', 'http://localhost/hoadatset/public/uploads/files/DUC_0615.JPG||http://localhost/hoadatset/public/uploads/images/Hydrangeas.jpg', '1', '2', 1, 1432545778, 1432545778, 2, '1', '1', '1', '2', '2', '2');

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE IF NOT EXISTS `history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `table` text COLLATE utf8_unicode_ci NOT NULL,
  `id_excute` int(11) NOT NULL,
  `action` text COLLATE utf8_unicode_ci NOT NULL,
  `id_user` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=159 ;

--
-- Dumping data for table `history`
--

INSERT INTO `history` (`id`, `table`, `id_excute`, `action`, `id_user`, `time`) VALUES
(1, 'article', 40, ' <b><a target="_blank" href="admin/article/update/40">Article #1</a></b>', 1, 1432463783),
(2, 'article', 40, ' <b><a target="_blank" href="admin/article/update/40">Article #1</a></b>', 1, 1432463833),
(3, 'article', 40, 'Chỉnh sửa thành công: <b><a target="_blank" href="admin/article/update/40">Article #1</a></b>', 1, 1432463872),
(4, 'article', 40, 'Chỉnh sửa thành công: <b><a target="_blank" href="admin/article/update/40">Article #1</a></b>', 1, 1432463878),
(5, 'article', 40, 'Chỉnh sửa thành công Bài Viết: <b><a target="_blank" href="admin/article/update/40">Article #1</a></b>', 1, 1432463941),
(6, 'article', 40, 'Chỉnh sửa thành công Bài Viết: <b><a target="_blank" href="admin/article/update/40">Article #1</a></b>', 1, 1432463946),
(7, 'article', 40, 'Xóa thành công Bài Viết: <b>Article #1</b>', 1, 1432463958),
(8, 'article', 39, 'Xóa thành công Bài Viết: <b>Article #1</b>', 1, 1432475912),
(9, 'article', 38, 'Xóa thành công Bài Viết: <b>Article #1</b>', 1, 1432475915),
(10, 'article', 37, 'Xóa thành công Bài Viết: <b>Article #1</b>', 1, 1432475928),
(11, 'category', 1, 'Thêm mới thành công Danh Mục: <b><a target="_blank" href="admin/category/update/1">Trang chủ</a></b>', 1, 1432479714),
(12, 'category', 2, 'Thêm mới thành công Danh Mục: <b><a target="_blank" href="admin/category/update/2">Giới thiệu</a></b>', 1, 1432479729),
(13, 'category', 3, 'Thêm mới thành công Danh Mục: <b><a target="_blank" href="admin/category/update/3">Sản phẩm</a></b>', 1, 1432479749),
(14, 'category', 3, 'Chỉnh sửa thành công Danh Mục: <b><a target="_blank" href="admin/category/update/3">Sản phẩm</a></b>', 1, 1432479754),
(15, 'category', 3, 'Chỉnh sửa thành công Danh Mục: <b><a target="_blank" href="admin/category/update/3">Sản phẩm</a></b>', 1, 1432479960),
(16, 'category', 3, 'Chỉnh sửa thành công Danh Mục: <b><a target="_blank" href="admin/category/update/3">Sản phẩm</a></b>', 1, 1432480020),
(17, 'category', 4, 'Thêm mới thành công Danh Mục: <b><a target="_blank" href="admin/category/update/4">Tin tức</a></b>', 1, 1432480066),
(18, 'category', 5, 'Thêm mới thành công Danh Mục: <b><a target="_blank" href="admin/category/update/5">Liên hệ</a></b>', 1, 1432480117),
(19, 'category', 6, 'Thêm mới thành công Danh Mục: <b><a target="_blank" href="admin/category/update/6">Tuyển dụng</a></b>', 1, 1432480183),
(20, 'category', 7, 'Thêm mới thành công Danh Mục: <b><a target="_blank" href="admin/category/update/7">Sản phẩm #1</a></b>', 1, 1432480219),
(21, 'category', 8, 'Thêm mới thành công Danh Mục: <b><a target="_blank" href="admin/category/update/8">Sản phẩm #2</a></b>', 1, 1432480236),
(22, 'category', 9, 'Thêm mới thành công Danh Mục: <b><a target="_blank" href="admin/category/update/9">Sản phẩm #3</a></b>', 1, 1432480272),
(23, 'category', 10, 'Thêm mới thành công Danh Mục: <b><a target="_blank" href="admin/category/update/10">Sản phẩm #4</a></b>', 1, 1432480295),
(24, 'category', 11, 'Thêm mới thành công Danh Mục: <b><a target="_blank" href="admin/category/update/11">Sản phẩm #1.1</a></b>', 1, 1432480312),
(25, 'category', 12, 'Thêm mới thành công Danh Mục: <b><a target="_blank" href="admin/category/update/12">Sản phẩm #1.2</a></b>', 1, 1432480330),
(26, 'category', 13, 'Thêm mới thành công Danh Mục: <b><a target="_blank" href="admin/category/update/13">Sản phẩm #1.3</a></b>', 1, 1432480346),
(27, 'category', 14, 'Thêm mới thành công Danh Mục: <b><a target="_blank" href="admin/category/update/14">Sản phẩm #1.4</a></b>', 1, 1432480379),
(28, 'category', 15, 'Thêm mới thành công Danh Mục: <b><a target="_blank" href="admin/category/update/15">Sản phẩm 2.1</a></b>', 1, 1432480399),
(29, 'category', 16, 'Thêm mới thành công Danh Mục: <b><a target="_blank" href="admin/category/update/16">Sản phẩm #2.2</a></b>', 1, 1432480413),
(30, 'category', 17, 'Thêm mới thành công Danh Mục: <b><a target="_blank" href="admin/category/update/17">Sản phẩm #3.1</a></b>', 1, 1432480431),
(31, 'category', 18, 'Thêm mới thành công Danh Mục: <b><a target="_blank" href="admin/category/update/18">Tức tức #1</a></b>', 1, 1432480456),
(32, 'category', 19, 'Thêm mới thành công Danh Mục: <b><a target="_blank" href="admin/category/update/19">Tin tức #2</a></b>', 1, 1432480470),
(33, 'category', 20, 'Thêm mới thành công Danh Mục: <b><a target="_blank" href="admin/category/update/20">Tin tức #3</a></b>', 1, 1432480498),
(34, 'product', 1, 'Thêm mới thành công Sản Phẩm: <b><a target="_blank" href="admin/product/update/1">Tên sản phẩm</a></b>', 1, 1432484304),
(35, 'tags', 1, 'Thêm mới thành công tags: <b><a target="_blank" href="admin/tags/update/1">Tag #1</a></b>', 1, 1432484389),
(36, 'tags', 2, 'Thêm mới thành công tags: <b><a target="_blank" href="admin/tags/update/2">Tag #2</a></b>', 1, 1432484402),
(37, 'tags', 3, 'Thêm mới thành công tags: <b><a target="_blank" href="admin/tags/update/3">Tag #3</a></b>', 1, 1432484511),
(38, 'tags', 4, 'Thêm mới thành công tags: <b><a target="_blank" href="admin/tags/update/4">Tag #4</a></b>', 1, 1432484521),
(39, 'tags', 5, 'Thêm mới thành công tags: <b><a target="_blank" href="admin/tags/update/5">Tag #5</a></b>', 1, 1432484532),
(40, 'tags', 6, 'Thêm mới thành công tags: <b><a target="_blank" href="admin/tags/update/6">Tag #6</a></b>', 1, 1432484544),
(41, 'tags', 7, 'Thêm mới thành công tags: <b><a target="_blank" href="admin/tags/update/7">Tag #7</a></b>', 1, 1432484568),
(42, 'product', 2, 'Thêm mới thành công Sản Phẩm: <b><a target="_blank" href="admin/product/update/2">Tên sản phẩm</a></b>', 1, 1432485576),
(43, 'product', 2, 'Chỉnh sửa thành công Sản Phẩm: <b><a target="_blank" href="admin/product/update/2">Tên sản phẩm</a></b>', 1, 1432486642),
(44, 'product', 3, 'Chỉnh sửa thành công Sản Phẩm: <b><a target="_blank" href="admin/product/update/3">Tên sản phẩm</a></b>', 1, 1432486981),
(45, 'slide', 2, 'Chỉnh sửa thành công Trình Chiếu: <b><a target="_blank" href="admin/slide/update/2">test</a></b>', 1, 1432490848),
(46, 'slide', 2, 'Chỉnh sửa thành công Trình Chiếu: <b><a target="_blank" href="admin/slide/update/2">test</a></b>', 1, 1432490862),
(47, 'contact', 1, 'Chỉnh sửa thành công Liên Hệ: <b><a target="_blank" href="admin/contact/update/1"></a></b>', 1, 1432492090),
(48, 'contact', 1, 'Chỉnh sửa thành công Liên Hệ: <b><a target="_blank" href="admin/contact/update/1"></a></b>', 1, 1432492098),
(49, 'contact', 1, 'Chỉnh sửa thành công Liên Hệ: <b><a target="_blank" href="admin/contact/update/1"></a></b>', 1, 1432492166),
(50, 'contact', 1, 'Chỉnh sửa thành công Liên Hệ: <b><a target="_blank" href="admin/contact/update/1"></a></b>', 1, 1432492170),
(51, 'contact', 1, 'Chỉnh sửa thành công Liên Hệ: <b><a target="_blank" href="admin/contact/update/1"></a></b>', 1, 1432492212),
(52, 'contact', 1, 'Chỉnh sửa thành công Liên Hệ: <b><a target="_blank" href="admin/contact/update/1"></a></b>', 1, 1432492253),
(53, 'contact', 1, 'Chỉnh sửa thành công Liên Hệ: <b><a target="_blank" href="admin/contact/update/1"></a></b>', 1, 1432492261),
(54, 'contact', 1, 'Chỉnh sửa thành công Liên Hệ: <b><a target="_blank" href="admin/contact/update/1"></a></b>', 1, 1432492274),
(55, 'contact', 1, 'Chỉnh sửa thành công Liên Hệ: <b><a target="_blank" href="admin/contact/update/1"></a></b>', 1, 1432492292),
(56, 'contact', 1, 'Chỉnh sửa thành công Liên Hệ: <b><a target="_blank" href="admin/contact/update/1"></a></b>', 1, 1432492295),
(57, 'contact', 1, 'Chỉnh sửa thành công Liên Hệ: <b><a target="_blank" href="admin/contact/update/1"></a></b>', 1, 1432492299),
(58, 'contact', 1, 'Chỉnh sửa thành công Liên Hệ: <b><a target="_blank" href="admin/contact/update/1"></a></b>', 1, 1432492398),
(59, 'contact', 1, 'Chỉnh sửa thành công Liên Hệ: <b><a target="_blank" href="admin/contact/update/1"></a></b>', 1, 1432492401),
(60, 'contact', 1, 'Chỉnh sửa thành công Liên Hệ: <b><a target="_blank" href="admin/contact/update/1"></a></b>', 1, 1432492427),
(61, 'contact', 1, 'Chỉnh sửa thành công Liên Hệ: <b><a target="_blank" href="admin/contact/update/1"></a></b>', 1, 1432492464),
(62, 'contact', 1, 'Chỉnh sửa thành công Liên Hệ: <b><a target="_blank" href="admin/contact/update/1"></a></b>', 1, 1432492491),
(63, 'contact', 1, 'Chỉnh sửa thành công Liên Hệ: <b><a target="_blank" href="admin/contact/update/1"></a></b>', 1, 1432492507),
(64, 'contact', 1, 'Chỉnh sửa thành công Liên Hệ: <b><a target="_blank" href="admin/contact/update/1"></a></b>', 1, 1432492578),
(65, 'contact', 1, 'Chỉnh sửa thành công Liên Hệ: <b><a target="_blank" href="admin/contact/update/1"></a></b>', 1, 1432492599),
(66, 'contact', 1, 'Chỉnh sửa thành công Liên Hệ: <b><a target="_blank" href="admin/contact/update/1"></a></b>', 1, 1432492605),
(67, 'contact', 1, 'Chỉnh sửa thành công Liên Hệ: <b><a target="_blank" href="admin/contact/update/1"></a></b>', 1, 1432492608),
(68, 'contact', 1, 'Chỉnh sửa thành công Liên Hệ: <b><a target="_blank" href="admin/contact/update/1"></a></b>', 1, 1432492610),
(69, 'contact', 1, 'Chỉnh sửa thành công Liên Hệ: <b><a target="_blank" href="admin/contact/update/1"></a></b>', 1, 1432492685),
(70, 'contact', 1, 'Chỉnh sửa thành công Liên Hệ: <b><a target="_blank" href="admin/contact/update/1"></a></b>', 1, 1432492706),
(71, 'contact', 1, 'Chỉnh sửa thành công Liên Hệ: <b><a target="_blank" href="admin/contact/update/1"></a></b>', 1, 1432492713),
(72, 'contact', 1, 'Chỉnh sửa thành công Liên Hệ: <b><a target="_blank" href="admin/contact/update/1"></a></b>', 1, 1432492745),
(73, 'contact', 1, 'Chỉnh sửa thành công Liên Hệ: <b><a target="_blank" href="admin/contact/update/1"></a></b>', 1, 1432492752),
(74, 'contact', 1, 'Chỉnh sửa thành công Liên Hệ: <b><a target="_blank" href="admin/contact/update/1"></a></b>', 1, 1432492763),
(75, 'contact', 1, 'Chỉnh sửa thành công Liên Hệ: <b><a target="_blank" href="admin/contact/update/1"></a></b>', 1, 1432492765),
(76, 'contact', 1, 'Chỉnh sửa thành công Liên Hệ: <b><a target="_blank" href="admin/contact/update/1"></a></b>', 1, 1432492770),
(77, 'contact', 1, 'Chỉnh sửa thành công Liên Hệ: <b><a target="_blank" href="admin/contact/update/1"></a></b>', 1, 1432492817),
(78, 'contact', 1, 'Chỉnh sửa thành công Liên Hệ: <b><a target="_blank" href="admin/contact/update/1"></a></b>', 1, 1432492819),
(79, 'faq', 35, 'Chỉnh sửa thành công Câu hỏi thường gặp: <b><a target="_blank" href="admin/faq/update/35">123</a></b>', 1, 1432531687),
(80, 'contact', 1, 'Chỉnh sửa thành công Liên Hệ: <b><a target="_blank" href="admin/contact/update/1"></a></b>', 1, 1432535226),
(81, 'contact', 1, 'Chỉnh sửa thành công Liên Hệ: <b><a target="_blank" href="admin/contact/update/1"></a></b>', 1, 1432535233),
(82, 'contact', 1, 'Chỉnh sửa thành công Liên Hệ: <b><a target="_blank" href="admin/contact/update/1"></a></b>', 1, 1432535258),
(83, 'contact', 1, 'Chỉnh sửa thành công Liên Hệ: <b><a target="_blank" href="admin/contact/update/1"></a></b>', 1, 1432535266),
(84, 'contact', 1, 'Chỉnh sửa thành công Liên Hệ: <b><a target="_blank" href="admin/contact/update/1"></a></b>', 1, 1432535285),
(85, 'category', 21, 'Thêm mới thành công Danh Mục: <b><a target="_blank" href="admin/category/update/21">ád</a></b>', 2, 1432539737),
(86, 'category', 21, 'Xóa thành công Danh Mục: <b>ád</b>', 1, 1432539846),
(87, 'category', 6, 'Chỉnh sửa thành công Danh Mục: <b><a target="_blank" href="admin/category/update/6">Tuyển dụng</a></b>', 2, 1432539874),
(88, 'category', 5, 'Chỉnh sửa thành công Danh Mục: <b><a target="_blank" href="admin/category/update/5">Liên hệ</a></b>', 2, 1432539877),
(89, 'category', 5, 'Chỉnh sửa thành công Danh Mục: <b><a target="_blank" href="admin/category/update/5">Liên hệ</a></b>', 2, 1432539880),
(90, 'category', 5, 'Chỉnh sửa thành công Danh Mục: <b><a target="_blank" href="admin/category/update/5">Liên hệ</a></b>', 2, 1432539885),
(91, 'product', 4, 'Thêm mới thành công Sản Phẩm: <b><a target="_blank" href="admin/product/update/4">123</a></b>', 2, 1432540627),
(92, 'product', 4, 'Chỉnh sửa thành công Sản Phẩm: <b><a target="_blank" href="admin/product/update/4">123</a></b>', 2, 1432540630),
(93, 'product', 4, 'Chỉnh sửa thành công Sản Phẩm: <b><a target="_blank" href="admin/product/update/4">123</a></b>', 2, 1432540634),
(94, 'product', 4, 'Chỉnh sửa thành công Sản Phẩm: <b><a target="_blank" href="admin/product/update/4">123</a></b>', 2, 1432540777),
(95, 'product', 4, 'Chỉnh sửa thành công Sản Phẩm: <b><a target="_blank" href="admin/product/update/4">123</a></b>', 2, 1432540781),
(96, 'product', 4, 'Chỉnh sửa thành công Sản Phẩm: <b><a target="_blank" href="admin/product/update/4">123</a></b>', 2, 1432540859),
(97, 'product', 4, 'Chỉnh sửa thành công Sản Phẩm: <b><a target="_blank" href="admin/product/update/4">123</a></b>', 2, 1432540862),
(98, 'product', 4, 'Chỉnh sửa thành công Sản Phẩm: <b><a target="_blank" href="admin/product/update/4">123</a></b>', 2, 1432540867),
(99, 'product', 4, 'Chỉnh sửa thành công Sản Phẩm: <b><a target="_blank" href="admin/product/update/4">123</a></b>', 2, 1432540869),
(100, 'product', 2, 'Gửi bản tin Sản Phẩm:', 2, 1432542365),
(101, 'product', 3, 'Gửi bản tin Sản Phẩm:', 2, 1432542468),
(102, 'unit', 10, 'Chỉnh sửa thành công Đơn Vị Tính: <b><a target="_blank" href="admin/unit/update/10">Kg</a></b>', 2, 1432543929),
(103, 'unit', 10, 'Chỉnh sửa thành công Đơn Vị Tính: <b><a target="_blank" href="admin/unit/update/10">Kg</a></b>', 2, 1432543945),
(104, 'unit', 11, 'Thêm mới thành công Đơn Vị Tính: <b><a target="_blank" href="admin/unit/update/11">Test</a></b>', 2, 1432543978),
(105, 'unit', 11, 'Chỉnh sửa thành công Đơn Vị Tính: <b><a target="_blank" href="admin/unit/update/11">Test</a></b>', 2, 1432543980),
(106, 'article', 7, 'Chỉnh sửa thành công Bài Viết: <b><a target="_blank" href="admin/article/update/7">Article #1</a></b>', 2, 1432544113),
(107, 'article', 7, 'Chỉnh sửa thành công Bài Viết: <b><a target="_blank" href="admin/article/update/7">Article #1</a></b>', 2, 1432544115),
(108, 'article', 7, 'Xóa thành công Bài Viết: <b>Article #1</b>', 2, 1432544117),
(109, 'article', 8, 'Gửi bản tin Bài Viết:', 2, 1432544128),
(110, 'article', 37, 'Chỉnh sửa thành công Bài Viết: <b><a target="_blank" href="admin/article/update/37">Article #1</a></b>', 2, 1432544226),
(111, 'article', 37, 'Chỉnh sửa thành công Bài Viết: <b><a target="_blank" href="admin/article/update/37">Article #1</a></b>', 2, 1432544227),
(112, 'article', 38, 'Xóa thành công Bài Viết: <b>Article #1</b>', 2, 1432544232),
(113, 'tags', 8, 'Thêm mới thành công tags: <b><a target="_blank" href="admin/tags/update/8">test</a></b>', 2, 1432544511),
(114, 'tags', 8, 'Chỉnh sửa thành công tags: <b><a target="_blank" href="admin/tags/update/8">test</a></b>', 2, 1432544529),
(115, 'tags', 8, 'Chỉnh sửa thành công tags: <b><a target="_blank" href="admin/tags/update/8">test</a></b>', 2, 1432544529),
(116, 'tags', 8, 'Chỉnh sửa thành công tags: <b><a target="_blank" href="admin/tags/update/8">test</a></b>', 2, 1432544533),
(117, 'tags', 8, 'Chỉnh sửa thành công tags: <b><a target="_blank" href="admin/tags/update/8">test</a></b>', 2, 1432544534),
(118, 'location', 4614, 'Thêm mới thành công location: <b><a target="_blank" href="admin/location/update/4614">Giới thiệu</a></b>', 1, 1432544661),
(119, 'location', 4614, 'Xóa thành công location: <b>Giới thiệu</b>', 1, 1432544670),
(120, 'location', 4615, 'Thêm mới thành công location: <b><a target="_blank" href="admin/location/update/4615">test</a></b>', 2, 1432544747),
(121, 'location', 4615, 'Xóa thành công location: <b>test</b>', 2, 1432544752),
(122, 'user_profile', 1, 'Chỉnh sửa thành công Tài Khoản Người dùng: <b><a target="_blank" href="admin/user_profile/update/1">link</a></b>', 2, 1432545132),
(123, 'user_profile', 1, 'Chỉnh sửa thành công Tài Khoản Người dùng: <b><a target="_blank" href="admin/user_profile/update/1">link</a></b>', 2, 1432545134),
(124, 'tags', 6, 'Chỉnh sửa thành công tags: <b><a target="_blank" href="admin/tags/update/6">Tag #6</a></b>', 1, 1432545146),
(125, 'tags', 6, 'Chỉnh sửa thành công tags: <b><a target="_blank" href="admin/tags/update/6">Tag #6</a></b>', 1, 1432545148),
(126, 'slide', 2, 'Chỉnh sửa thành công Trình Chiếu: <b><a target="_blank" href="admin/slide/update/2">test</a></b>', 2, 1432545529),
(127, 'slide', 3, 'Thêm mới thành công Trình Chiếu: <b><a target="_blank" href="admin/slide/update/3">test</a></b>', 2, 1432545596),
(128, 'slide', 3, 'Chỉnh sửa thành công Trình Chiếu: <b><a target="_blank" href="admin/slide/update/3">test</a></b>', 2, 1432545643),
(129, 'slide', 4, 'Thêm mới thành công Trình Chiếu: <b><a target="_blank" href="admin/slide/update/4">1</a></b>', 2, 1432545657),
(130, 'gallery', 1, 'Chỉnh sửa thành công Bộ sưu tập: <b><a target="_blank" href="admin/gallery/update/1">1</a></b>', 2, 1432545711),
(131, 'gallery', 2, 'Chỉnh sửa thành công Bộ sưu tập: <b><a target="_blank" href="admin/gallery/update/2">1</a></b>', 2, 1432545712),
(132, 'gallery', 1, 'Xóa thành công Bộ sưu tập: <b>1</b>', 2, 1432545723),
(133, 'gallery', 3, 'Thêm mới thành công Bộ sưu tập: <b><a target="_blank" href="admin/gallery/update/3">1</a></b>', 2, 1432545778),
(134, 'office', 1, 'Chỉnh sửa thành công Văn Phòng/Chi Nhánh: <b><a target="_blank" href="admin/office/update/1">123</a></b>', 2, 1432546385),
(135, 'office', 2, 'Xóa thành công Văn Phòng/Chi Nhánh: <b>123</b>', 2, 1432546474),
(136, 'office', 3, 'Xóa thành công Văn Phòng/Chi Nhánh: <b>123</b>', 2, 1432546483),
(137, 'office', 4, 'Thêm mới thành công Văn Phòng/Chi Nhánh: <b><a target="_blank" href="admin/office/update/4">1</a></b>', 2, 1432546637),
(138, 'partner', 1, 'Chỉnh sửa thành công Đối tác: <b><a target="_blank" href="admin/partner/update/1">test</a></b>', 2, 1432546771),
(139, 'partner', 1, 'Chỉnh sửa thành công Đối tác: <b><a target="_blank" href="admin/partner/update/1">test</a></b>', 2, 1432546802),
(140, 'partner', 3, 'Thêm mới thành công Đối tác: <b><a target="_blank" href="admin/partner/update/3">2</a></b>', 2, 1432546906),
(141, 'email_marketing', 1, 'Xóa thành công Email Marketing: <b>link</b>', 2, 1432547021),
(142, 'email_marketing', 9, 'Thêm mới thành công Email Marketing: <b><a target="_blank" href="admin/email_marketing/update/9">link</a></b>', 2, 1432547056),
(143, 'email_marketing', 9, 'Xóa thành công Email Marketing: <b>link</b>', 2, 1432547069),
(144, 'email_marketing', 8, 'Chỉnh sửa thành công Email Marketing: <b><a target="_blank" href="admin/email_marketing/update/8">link</a></b>', 2, 1432547072),
(145, 'email_marketing', 8, 'Xóa thành công Email Marketing: <b>link</b>', 2, 1432547077),
(146, 'comment', 3, 'Xóa thành công Bình Luận/Nhận Xét: <b>link</b>', 2, 1432547197),
(147, 'contact', 1, 'Chỉnh sửa thành công Liên Hệ: <b><a target="_blank" href="admin/contact/update/1"></a></b>', 2, 1432547239),
(148, 'contact', 1, 'Chỉnh sửa thành công Liên Hệ: <b><a target="_blank" href="admin/contact/update/1"></a></b>', 2, 1432547280),
(149, 'contact', 1, 'Chỉnh sửa thành công Liên Hệ: <b><a target="_blank" href="admin/contact/update/1"></a></b>', 2, 1432547426),
(150, 'contact', 1, 'Chỉnh sửa thành công Liên Hệ: <b><a target="_blank" href="admin/contact/update/1"></a></b>', 2, 1432547430),
(151, 'faq', 35, 'Xóa thành công Câu hỏi thường gặp: <b>123</b>', 1, 1432547582),
(152, 'faq', 34, 'Xóa thành công Câu hỏi thường gặp: <b>2</b>', 1, 1432547582),
(153, 'faq', 36, 'Xóa thành công Câu hỏi thường gặp: <b>2</b>', 1, 1432547624),
(154, 'faq', 37, 'Xóa thành công Câu hỏi thường gặp: <b>2</b>', 1, 1432547629),
(155, 'faq', 23, 'Chỉnh sửa thành công Câu hỏi thường gặp: <b><a target="_blank" href="admin/faq/update/23">2</a></b>', 1, 1432547635),
(156, 'faq', 38, 'Thêm mới thành công Câu hỏi thường gặp: <b><a target="_blank" href="admin/faq/update/38">1</a></b>', 1, 1432547680),
(157, 'article_one', 2, 'Xóa thành công article_one: <b>test</b>', 1, 1432547765),
(158, 'article_one', 3, 'Thêm mới thành công article_one: <b><a target="_blank" href="admin/article_one/update/3">1</a></b>', 1, 1432547937);

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE IF NOT EXISTS `location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `en_title` text COLLATE utf8_unicode_ci NOT NULL,
  `id_parent` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `is_active` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4616 ;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`id`, `title`, `en_title`, `id_parent`, `position`, `level`, `is_active`) VALUES
(1, 'Thành phố Cần Thơ', '', 0, 3, 0, 1),
(2, 'Thành phố Đà Nẵng', '', 0, 2, 0, 1),
(3, 'Thành phố Hà Nội', '', 0, 5, 0, 1),
(4, 'Thành phố Hải Phòng', '', 0, 4, 0, 1),
(5, 'Thành phố Hồ Chí Minh', '', 0, 6, 0, 1),
(6, 'Tỉnh An Giang', '', 0, 7, 0, 1),
(7, 'Tỉnh Bà Rịa-Vũng Tàu', '', 0, 8, 0, 1),
(8, 'Tỉnh Bắc Giang', '', 0, 9, 0, 1),
(9, 'Tỉnh Bắc Kạn', '', 0, 10, 0, 1),
(10, 'Tỉnh Bạc Liêu', '', 0, 11, 0, 1),
(11, 'Tỉnh Bắc Ninh', '', 0, 12, 0, 1),
(12, 'Tỉnh Bến Tre', '', 0, 13, 0, 1),
(13, 'Tỉnh Bình Định', '', 0, 14, 0, 1),
(14, 'Tỉnh Bình Dương', '', 0, 15, 0, 1),
(15, 'Tỉnh Bình Phước', '', 0, 16, 0, 1),
(16, 'Tỉnh Bình Thuận', '', 0, 17, 0, 1),
(17, 'Tỉnh Cà Mau', '', 0, 18, 0, 1),
(18, 'Tỉnh Cao Bằng', '', 0, 19, 0, 1),
(19, 'Tỉnh Đắk Lắk', '', 0, 20, 0, 1),
(20, 'Tỉnh Đắk Nông', '', 0, 21, 0, 1),
(21, 'Tỉnh Điện Biên', '', 0, 22, 0, 1),
(22, 'Tỉnh Đồng Nai', '', 0, 23, 0, 1),
(23, 'Tỉnh Đồng Tháp', '', 0, 24, 0, 1),
(24, 'Tỉnh Gia Lai', '', 0, 25, 0, 1),
(25, 'Tỉnh Hà Giang', '', 0, 26, 0, 1),
(26, 'Tỉnh Hà Nam', '', 0, 27, 0, 1),
(27, 'Tỉnh Hà Tĩnh', '', 0, 28, 0, 1),
(28, 'Tỉnh Hải Dương', '', 0, 29, 0, 1),
(29, 'Tỉnh Hậu Giang', '', 0, 30, 0, 1),
(30, 'Tỉnh Hòa Bình', '', 0, 31, 0, 1),
(31, 'Tỉnh Hưng Yên', '', 0, 32, 0, 1),
(32, 'Tỉnh Khánh Hòa', '', 0, 33, 0, 1),
(33, 'Tỉnh Kiên Giang', '', 0, 34, 0, 1),
(34, 'Tỉnh Kon Tum', '', 0, 35, 0, 1),
(35, 'Tỉnh Lai Châu', '', 0, 36, 0, 1),
(36, 'Tỉnh Lâm Đồng', '', 0, 37, 0, 1),
(37, 'Tỉnh Lạng Sơn', '', 0, 38, 0, 1),
(38, 'Tỉnh Lào Cai', '', 0, 39, 0, 1),
(39, 'Tỉnh Long An', '', 0, 40, 0, 1),
(40, 'Tỉnh Nam Định', '', 0, 41, 0, 1),
(41, 'Tỉnh Nghệ An', '', 0, 42, 0, 1),
(42, 'Tỉnh Ninh Bình', '', 0, 43, 0, 1),
(43, 'Tỉnh Ninh Thuận', '', 0, 44, 0, 1),
(44, 'Tỉnh Phú Thọ', '', 0, 45, 0, 1),
(45, 'Tỉnh Phú Yên', '', 0, 46, 0, 1),
(46, 'Tỉnh Quảng Bình', '', 0, 47, 0, 1),
(47, 'Tỉnh Quảng Nam', '', 0, 48, 0, 1),
(48, 'Tỉnh Quảng Ngãi', '', 0, 49, 0, 1),
(49, 'Tỉnh Quảng Ninh', '', 0, 50, 0, 1),
(50, 'Tỉnh Quảng Trị', '', 0, 51, 0, 1),
(51, 'Tỉnh Sóc Trăng', '', 0, 52, 0, 1),
(52, 'Tỉnh Sơn La', '', 0, 53, 0, 1),
(53, 'Tỉnh Tây Ninh', '', 0, 54, 0, 1),
(54, 'Tỉnh Thái Bình', '', 0, 55, 0, 1),
(55, 'Tỉnh Thái Nguyên', '', 0, 56, 0, 1),
(56, 'Tỉnh Thanh Hóa', '', 0, 57, 0, 1),
(57, 'Tỉnh Thừa Thiên Huế', '', 0, 58, 0, 1),
(58, 'Tỉnh Tiền Giang', '', 0, 59, 0, 1),
(59, 'Tỉnh Trà Vinh', '', 0, 60, 0, 1),
(60, 'Tỉnh Tuyên Quang', '', 0, 61, 0, 1),
(61, 'Tỉnh Vĩnh Long', '', 0, 62, 0, 1),
(62, 'Tỉnh Vĩnh Phúc', '', 0, 63, 0, 1),
(63, 'Tỉnh Yên Bái', '', 0, 64, 0, 1),
(3912, 'Huyện Cờ Đỏ', '', 1, 67, 1, 1),
(3913, 'Huyện Phong Điền', '', 1, 66, 1, 1),
(3914, 'Huyện Thới Lai', '', 1, 68, 1, 1),
(3915, 'Huyện Vĩnh Thạnh', '', 1, 69, 1, 1),
(3916, 'Quận Bình Thủy', '', 1, 70, 1, 1),
(3917, 'Quận Cái Răng', '', 1, 71, 1, 1),
(3918, 'Quận Ninh Kiều', '', 1, 72, 1, 1),
(3919, 'Quận Ô Môn', '', 1, 73, 1, 1),
(3920, 'Quận Thốt Nốt', '', 1, 74, 1, 1),
(3922, 'Huyện Hòa Vang', '', 2, 76, 1, 1),
(3923, 'Huyện Hoàng Sa', '', 2, 77, 1, 1),
(3924, 'Quận Cẩm Lệ', '', 2, 78, 1, 1),
(3925, 'Quận Hải Châu', '', 2, 79, 1, 1),
(3926, 'Quận Liên Chiểu', '', 2, 80, 1, 1),
(3927, 'Quận Ngũ Hành Sơn', '', 2, 81, 1, 1),
(3928, 'Quận Sơn Trà', '', 2, 82, 1, 1),
(3929, 'Quận Thanh Khê', '', 2, 84, 1, 1),
(3931, 'Huyện Ba Vì', '', 3, 85, 1, 1),
(3932, 'Huyện Chương Mỹ', '', 3, 86, 1, 1),
(3933, 'Huyện Đan Phượng', '', 3, 87, 1, 1),
(3934, 'Huyện Đông Anh', '', 3, 88, 1, 1),
(3935, 'Huyện Gia Lâm', '', 3, 89, 1, 1),
(3936, 'Huyện Hoài Đức', '', 3, 90, 1, 1),
(3937, 'Huyện Mê Linh', '', 3, 91, 1, 1),
(3938, 'Huyện Mỹ Đức', '', 3, 92, 1, 1),
(3939, 'Huyện Phú Xuyên', '', 3, 93, 1, 1),
(3940, 'Huyện Phúc Thọ', '', 3, 94, 1, 1),
(3941, 'Huyện Quốc Oai', '', 3, 95, 1, 1),
(3942, 'Huyện Sóc Sơn', '', 3, 96, 1, 1),
(3943, 'Huyện Thạch Thất', '', 3, 97, 1, 1),
(3944, 'Huyện Thanh Oai', '', 3, 98, 1, 1),
(3945, 'Huyện Thanh Trì', '', 3, 99, 1, 1),
(3946, 'Huyện Thường Tín', '', 3, 100, 1, 1),
(3947, 'Huyện Từ Liêm', '', 3, 101, 1, 1),
(3948, 'Huyện ứng Hòa', '', 3, 102, 1, 1),
(3949, 'Quận Ba Đình', '', 3, 103, 1, 1),
(3950, 'Quận Cầu Giấy', '', 3, 104, 1, 1),
(3951, 'Quận Đống Đa', '', 3, 105, 1, 1),
(3952, 'Quận Hà Đông', '', 3, 106, 1, 1),
(3953, 'Quận Hai Bà Trưng', '', 3, 107, 1, 1),
(3954, 'Quận Hoàn Kiếm', '', 3, 108, 1, 1),
(3955, 'Quận Hoàng Mai', '', 3, 109, 1, 1),
(3956, 'Quận Long Biên', '', 3, 110, 1, 1),
(3957, 'Quận Tây Hồ', '', 3, 111, 1, 1),
(3958, 'Quận Thanh Xuân', '', 3, 112, 1, 1),
(3959, 'Thị xã Sơn Tây', '', 3, 113, 1, 1),
(3961, 'Huyện An Dương', '', 4, 115, 1, 1),
(3962, 'Huyện An Lão', '', 4, 116, 1, 1),
(3963, 'Huyện Bạch Long Vĩ', '', 4, 117, 1, 1),
(3964, 'Huyện Cát Hải', '', 4, 118, 1, 1),
(3965, 'Huyện Kiến Thụy', '', 4, 119, 1, 1),
(3966, 'Huyện Thủy Nguyên', '', 4, 120, 1, 1),
(3967, 'Huyện Tiên Lãng', '', 4, 121, 1, 1),
(3968, 'Huyện Vĩnh Bảo', '', 4, 122, 1, 1),
(3969, 'Quận Đồ Sơn', '', 4, 123, 1, 1),
(3970, 'Quận Dương Kinh', '', 4, 124, 1, 1),
(3971, 'Quận Hải An', '', 4, 125, 1, 1),
(3972, 'Quận Hồng Bàng', '', 4, 126, 1, 1),
(3973, 'Quận Kiến An', '', 4, 127, 1, 1),
(3974, 'Quận Lê Chân', '', 4, 128, 1, 1),
(3975, 'Quận Ngô Quyền', '', 4, 129, 1, 1),
(3977, 'Huyện Bình Chánh', '', 5, 131, 1, 1),
(3978, 'Huyện Cần Giờ', '', 5, 132, 1, 1),
(3979, 'Huyện Củ Chi', '', 5, 133, 1, 1),
(3980, 'Huyện Hóc Môn', '', 5, 134, 1, 1),
(3981, 'Huyện Nhà Bè', '', 5, 135, 1, 1),
(3982, 'Quận 1', '', 5, 136, 1, 1),
(3983, 'Quận 10', '', 5, 137, 1, 1),
(3984, 'Quận 11', '', 5, 138, 1, 1),
(3985, 'Quận 12', '', 5, 139, 1, 1),
(3986, 'Quận 2', '', 5, 140, 1, 1),
(3987, 'Quận 3', '', 5, 141, 1, 1),
(3988, 'Quận 4', '', 5, 142, 1, 1),
(3989, 'Quận 5', '', 5, 143, 1, 1),
(3990, 'Quận 6', '', 5, 144, 1, 1),
(3991, 'Quận 7', '', 5, 145, 1, 1),
(3992, 'Quận 8', '', 5, 146, 1, 1),
(3993, 'Quận 9', '', 5, 147, 1, 1),
(3994, 'Quận Bình Tân', '', 5, 148, 1, 1),
(3995, 'Quận Bình Thạnh', '', 5, 149, 1, 1),
(3996, 'Quận Gò Vấp', '', 5, 150, 1, 1),
(3997, 'Quận Phú Nhuận', '', 5, 151, 1, 1),
(3998, 'Quận Tân Bình', '', 5, 152, 1, 1),
(3999, 'Quận Tân Phú', '', 5, 154, 1, 1),
(4000, 'Quận Thủ Đức', '', 5, 153, 1, 1),
(4001, 'Huyện An Phú', '', 6, 155, 1, 1),
(4002, 'Huyện Châu Phú', '', 6, 156, 1, 1),
(4003, 'Huyện Châu Thành', '', 6, 157, 1, 1),
(4004, 'Huyện Chợ Mới', '', 6, 158, 1, 1),
(4005, 'Huyện Phú Tân', '', 6, 159, 1, 1),
(4006, 'Huyện Thoại Sơn', '', 6, 160, 1, 1),
(4007, 'Huyện Tịnh Biên', '', 6, 161, 1, 1),
(4008, 'Huyện Tri Tôn', '', 6, 162, 1, 1),
(4009, 'Thành phố Long Xuyên', '', 6, 163, 1, 1),
(4010, 'Thị xã Châu Đốc', '', 6, 164, 1, 1),
(4011, 'Thị xã Tân Châu', '', 6, 165, 1, 1),
(4012, 'Huyện Châu Đức', '', 7, 166, 1, 1),
(4013, 'Huyện Côn Đảo', '', 7, 167, 1, 1),
(4014, 'Huyện Đất Đỏ', '', 7, 168, 1, 1),
(4015, 'Huyện Long Điền', '', 7, 169, 1, 1),
(4016, 'Huyện Tân Thành', '', 7, 170, 1, 1),
(4017, 'Huyện Xuyên Mộc', '', 7, 171, 1, 1),
(4018, 'Thành phố Vũng Tàu', '', 7, 172, 1, 1),
(4019, 'Thị xã Bà Rịa', '', 7, 173, 1, 1),
(4020, 'Huyện Hiệp Hòa', '', 8, 174, 1, 1),
(4021, 'Huyện Lạng Giang', '', 8, 175, 1, 1),
(4022, 'Huyện Lục Nam', '', 8, 176, 1, 1),
(4023, 'Huyện Lục Ngạn', '', 8, 177, 1, 1),
(4024, 'Huyện Sơn Động', '', 8, 178, 1, 1),
(4025, 'Huyện Tân Yên', '', 8, 179, 1, 1),
(4026, 'Huyện Việt Yên', '', 8, 180, 1, 1),
(4027, 'Huyện Yên Dũng', '', 8, 181, 1, 1),
(4028, 'Huyện Yên Thế', '', 8, 182, 1, 1),
(4029, 'Thành phố Bắc Giang', '', 8, 183, 1, 1),
(4030, 'Huyện Ba Bể', '', 9, 184, 1, 1),
(4031, 'Huyện Bạch Thông', '', 9, 185, 1, 1),
(4032, 'Huyện Chợ Đồn', '', 9, 186, 1, 1),
(4033, 'Huyện Chợ Mới', '', 9, 187, 1, 1),
(4034, 'Huyện Na Rì', '', 9, 188, 1, 1),
(4035, 'Huyện Ngân Sơn', '', 9, 189, 1, 1),
(4036, 'Huyện Pác Nặm', '', 9, 190, 1, 1),
(4037, 'Thị xã Bắc Kạn', '', 9, 191, 1, 1),
(4038, 'Huyện Đông Hải', '', 10, 192, 1, 1),
(4039, 'Huyện Giá Rai', '', 10, 193, 1, 1),
(4040, 'Huyện Hòa Bình', '', 10, 194, 1, 1),
(4041, 'Huyện Hồng Dân', '', 10, 195, 1, 1),
(4042, 'Huyện Phước Long', '', 10, 196, 1, 1),
(4043, 'Huyện Vĩnh Lợi', '', 10, 197, 1, 1),
(4044, 'Huyện Gia Bình', '', 11, 199, 1, 1),
(4045, 'Huyện Lương Tài', '', 11, 200, 1, 1),
(4046, 'Huyện Quế Võ', '', 11, 201, 1, 1),
(4047, 'Huyện Thuận Thành', '', 11, 202, 1, 1),
(4048, 'Huyện Tiên Du', '', 11, 203, 1, 1),
(4049, 'Huyện Yên Phong', '', 11, 204, 1, 1),
(4050, 'Thành phố Bắc Ninh', '', 11, 205, 1, 1),
(4051, 'Thị xã Từ Sơn', '', 11, 206, 1, 1),
(4052, 'Huyện Ba Tri', '', 12, 207, 1, 1),
(4053, 'Huyện Bình Đại', '', 12, 208, 1, 1),
(4054, 'Huyện Châu Thành', '', 12, 209, 1, 1),
(4055, 'Huyện Chợ Lách', '', 12, 210, 1, 1),
(4056, 'Huyện Giồng Trôm', '', 12, 211, 1, 1),
(4057, 'Huyện Mỏ Cày Bắc', '', 12, 212, 1, 1),
(4058, 'Huyện Mỏ Cày Nam', '', 12, 213, 1, 1),
(4059, 'Huyện Thạnh Phú', '', 12, 214, 1, 1),
(4060, 'Thành phố Bến Tre', '', 12, 215, 1, 1),
(4061, 'Huyện An Lão', '', 13, 216, 1, 1),
(4062, 'Huyện An Nhơn', '', 13, 217, 1, 1),
(4063, 'Huyện Hoài Ân', '', 13, 218, 1, 1),
(4064, 'Huyện Hoài Nhơn', '', 13, 219, 1, 1),
(4065, 'Huyện Phù Mỹ', '', 13, 220, 1, 1),
(4066, 'Huyện Phù cát', '', 13, 221, 1, 1),
(4067, 'Huyện Tây Sơn', '', 13, 222, 1, 1),
(4068, 'Huyện Tuy Phước', '', 13, 223, 1, 1),
(4069, 'Huyện Vân Canh', '', 13, 224, 1, 1),
(4070, 'Huyện Vĩnh Thạnh', '', 13, 225, 1, 1),
(4071, 'Thành phố Quy Nhơn', '', 13, 226, 1, 1),
(4072, 'Huyện Bến Cát', '', 14, 227, 1, 1),
(4073, 'Huyện Dầu Tiếng', '', 14, 228, 1, 1),
(4074, 'Huyện Dĩ An', '', 14, 229, 1, 1),
(4075, 'Huyện Phú Giáo', '', 14, 230, 1, 1),
(4076, 'Huyện Tân Uyên', '', 14, 231, 1, 1),
(4077, 'Huyện Thuận An', '', 14, 232, 1, 1),
(4078, 'Thị xã Thủ Dầu Một', '', 14, 233, 1, 1),
(4079, 'Huyện Bù Đăng', '', 15, 234, 1, 1),
(4080, 'Huyện Bù Đốp', '', 15, 235, 1, 1),
(4081, 'Huyện Bù Gia Mập', '', 15, 236, 1, 1),
(4082, 'Huyện Chơn Thành', '', 15, 237, 1, 1),
(4083, 'Huyện Đồng Phú', '', 15, 238, 1, 1),
(4084, 'Huyện Hớn Quản', '', 15, 239, 1, 1),
(4085, 'Huyện Lộc Ninh', '', 15, 240, 1, 1),
(4086, 'Thị xã Bình Long', '', 15, 241, 1, 1),
(4087, 'Thị xã Đồng Xoài', '', 15, 242, 1, 1),
(4088, 'Thị xã Phước Long', '', 15, 243, 1, 1),
(4089, 'Huyện Đức Linh', '', 16, 244, 1, 1),
(4090, 'Huyện Bắc Bình', '', 16, 245, 1, 1),
(4091, 'Huyện Hàm Tân', '', 16, 246, 1, 1),
(4092, 'Huyện Hàm Thuận Bắc', '', 16, 247, 1, 1),
(4093, 'Huyện Hàm Thuận Nam', '', 16, 248, 1, 1),
(4094, 'Huyện Phú Qúi', '', 16, 249, 1, 1),
(4095, 'Huyện Tánh Linh', '', 16, 250, 1, 1),
(4096, 'Huyện Tuy Phong', '', 16, 251, 1, 1),
(4097, 'Thành phố Phan Thiết', '', 16, 252, 1, 1),
(4098, 'Thị xã La Gi', '', 16, 253, 1, 1),
(4099, 'Huyện Cái Nước', '', 17, 254, 1, 1),
(4100, 'Huyện Đầm Dơi', '', 17, 255, 1, 1),
(4101, 'Huyện Năm Căn', '', 17, 256, 1, 1),
(4102, 'Huyện Ngọc Hiển', '', 17, 257, 1, 1),
(4103, 'Huyện Phú Tân', '', 17, 258, 1, 1),
(4104, 'Huyện Thới Bình', '', 17, 259, 1, 1),
(4105, 'Huyện Trần Văn Thời', '', 17, 260, 1, 1),
(4106, 'Huyện U Minh', '', 17, 261, 1, 1),
(4107, 'Thành phố Cà Mau', '', 17, 262, 1, 1),
(4108, 'Huyện Bảo Lạc', '', 18, 263, 1, 1),
(4109, 'Huyện Bảo Lâm', '', 18, 264, 1, 1),
(4110, 'Huyện Hạ Lang', '', 18, 265, 1, 1),
(4111, 'Huyện Hà Quảng', '', 18, 266, 1, 1),
(4112, 'Huyện Hòa An', '', 18, 267, 1, 1),
(4113, 'Huyện Nguyên Bình', '', 18, 268, 1, 1),
(4114, 'Huyện Phục Hòa', '', 18, 269, 1, 1),
(4115, 'Huyện Quảng Uyên', '', 18, 270, 1, 1),
(4116, 'Huyện Thạch An', '', 18, 271, 1, 1),
(4117, 'Huyện Thông Nông', '', 18, 272, 1, 1),
(4118, 'Huyện Trà Lĩnh', '', 18, 273, 1, 1),
(4119, 'Huyện Trùng Khánh', '', 18, 274, 1, 1),
(4120, 'Thị xã Cao Bằng', '', 18, 275, 1, 1),
(4121, 'Huyện Buôn Đôn', '', 19, 276, 1, 1),
(4122, 'Huyện Cư Kuin', '', 19, 277, 1, 1),
(4123, 'Huyện Cư MGar', '', 19, 278, 1, 1),
(4124, 'Huyện Ea Kar', '', 19, 279, 1, 1),
(4125, 'Huyện Ea Súp', '', 19, 280, 1, 1),
(4126, 'Huyện EaHLeo', '', 19, 281, 1, 1),
(4127, 'Huyện Krông Ana', '', 19, 282, 1, 1),
(4128, 'Huyện Krông Bông', '', 19, 283, 1, 1),
(4129, 'Huyện Krông Búk', '', 19, 284, 1, 1),
(4130, 'Huyện Krông Năng', '', 19, 285, 1, 1),
(4131, 'Huyện Krông Pắc', '', 19, 286, 1, 1),
(4132, 'Huyện Lắk', '', 19, 287, 1, 1),
(4133, 'Huyện MDrắk', '', 19, 288, 1, 1),
(4134, 'Thành phố Buôn Ma Thuột', '', 19, 289, 1, 1),
(4135, 'Thị xã Buôn Hồ', '', 19, 290, 1, 1),
(4136, 'Huyện Cư Jút', '', 20, 291, 1, 1),
(4137, 'Huyện Đắk GLong', '', 20, 292, 1, 1),
(4138, 'Huyện Đắk Mil', '', 20, 293, 1, 1),
(4139, 'Huyện Đắk RLấp', '', 20, 294, 1, 1),
(4140, 'Huyện Đắk Song', '', 20, 295, 1, 1),
(4141, 'Huyện KRông Nô', '', 20, 296, 1, 1),
(4142, 'Huyện Tuy Đức', '', 20, 297, 1, 1),
(4143, 'Thị xã Gia Nghĩa', '', 20, 298, 1, 1),
(4144, 'Huyện Điện Biên', '', 21, 299, 1, 1),
(4145, 'Huyện Điện Biên Đông', '', 21, 300, 1, 1),
(4146, 'Huyện Mường Chà', '', 21, 301, 1, 1),
(4147, 'Huyện Mương Nhé', '', 21, 302, 1, 1),
(4148, 'Huyện Mường ảng', '', 21, 303, 1, 1),
(4149, 'Huyện Tủa Chùa', '', 21, 304, 1, 1),
(4150, 'Huyện Tuần Giáo', '', 21, 305, 1, 1),
(4151, 'Thành phố Điện Biên phủ', '', 21, 306, 1, 1),
(4152, 'Thị xã Mường Lay', '', 21, 307, 1, 1),
(4153, 'Huyện Cẩm Mỹ', '', 22, 308, 1, 1),
(4154, 'Huyện Định Quán', '', 22, 309, 1, 1),
(4155, 'Huyện Long Thành', '', 22, 310, 1, 1),
(4156, 'Huyện Nhơn Trạch', '', 22, 311, 1, 1),
(4157, 'Huyện Tân Phú', '', 22, 312, 1, 1),
(4158, 'Huyện Thống Nhất', '', 22, 313, 1, 1),
(4159, 'Huyện Trảng Bom', '', 22, 314, 1, 1),
(4160, 'Huyện Vĩnh Cửu', '', 22, 315, 1, 1),
(4161, 'Huyện Xuân Lộc', '', 22, 316, 1, 1),
(4162, 'Thành phố Biên Hòa', '', 22, 317, 1, 1),
(4163, 'Thị xã Long Khánh', '', 22, 318, 1, 1),
(4164, 'Huyện Cao Lãnh', '', 23, 319, 1, 1),
(4165, 'Huyện Châu Thành', '', 23, 320, 1, 1),
(4166, 'Huyện Hồng Ngự', '', 23, 321, 1, 1),
(4167, 'Huyện Lai Vung', '', 23, 322, 1, 1),
(4168, 'Huyện Lấp Vò', '', 23, 323, 1, 1),
(4169, 'Huyện Tam Nông', '', 23, 324, 1, 1),
(4170, 'Huyện Tân Hồng', '', 23, 325, 1, 1),
(4171, 'Huyện Thanh Bình', '', 23, 326, 1, 1),
(4172, 'Huyện Tháp Mười', '', 23, 327, 1, 1),
(4173, 'Thành phố Cao Lãnh', '', 23, 328, 1, 1),
(4174, 'Thị xã Hồng Ngự', '', 23, 329, 1, 1),
(4175, 'Thị xã Sa Đéc', '', 23, 330, 1, 1),
(4176, 'Huyện Chư Păh', '', 24, 331, 1, 1),
(4177, 'Huyện Chư Pưh', '', 24, 332, 1, 1),
(4178, 'Huyện Chư Sê', '', 24, 333, 1, 1),
(4179, 'Huyện ChưPRông', '', 24, 334, 1, 1),
(4180, 'Huyện Đăk Đoa', '', 24, 335, 1, 1),
(4181, 'Huyện Đăk Pơ', '', 24, 336, 1, 1),
(4182, 'Huyện Đức Cơ', '', 24, 337, 1, 1),
(4183, 'Huyện Ia Grai', '', 24, 338, 1, 1),
(4184, 'Huyện Ia Pa', '', 24, 339, 1, 1),
(4185, 'Huyện KBang', '', 24, 340, 1, 1),
(4186, 'Huyện KBang', '', 24, 341, 1, 1),
(4187, 'Huyện Kông Chro', '', 24, 342, 1, 1),
(4188, 'Huyện Krông Pa', '', 24, 343, 1, 1),
(4189, 'Huyện Mang Yang', '', 24, 344, 1, 1),
(4190, 'Huyện Phú Thiện', '', 24, 345, 1, 1),
(4191, 'Thành phố Plei Ku', '', 24, 346, 1, 1),
(4192, 'Thị xã AYun Pa', '', 24, 347, 1, 1),
(4193, 'Thị xã An Khê', '', 24, 348, 1, 1),
(4194, 'Huyện Bắc Mê', '', 25, 349, 1, 1),
(4195, 'Huyện Bắc Quang', '', 25, 350, 1, 1),
(4196, 'Huyện Đồng Văn', '', 25, 351, 1, 1),
(4197, 'Huyện Hoàng Su Phì', '', 25, 352, 1, 1),
(4198, 'Huyện Mèo Vạc', '', 25, 353, 1, 1),
(4199, 'Huyện Quản Bạ', '', 25, 354, 1, 1),
(4200, 'Huyện Quang Bình', '', 25, 355, 1, 1),
(4201, 'Huyện Vị Xuyên', '', 25, 356, 1, 1),
(4202, 'Huyện Xín Mần', '', 25, 357, 1, 1),
(4203, 'Huyện Yên Minh', '', 25, 358, 1, 1),
(4204, 'Thành Phố Hà Giang', '', 25, 359, 1, 1),
(4205, 'Huyện Bình Lục', '', 26, 360, 1, 1),
(4206, 'Huyện Duy Tiên', '', 26, 361, 1, 1),
(4207, 'Huyện Kim Bảng', '', 26, 362, 1, 1),
(4208, 'Huyện Lý Nhân', '', 26, 363, 1, 1),
(4209, 'Huyện Thanh Liêm', '', 26, 364, 1, 1),
(4210, 'Thành phố Phủ Lý', '', 26, 365, 1, 1),
(4211, 'Huyện Cẩm Xuyên', '', 27, 366, 1, 1),
(4212, 'Huyện Can Lộc', '', 27, 367, 1, 1),
(4213, 'Huyện Đức Thọ', '', 27, 368, 1, 1),
(4214, 'Huyện Hương Khê', '', 27, 369, 1, 1),
(4215, 'Huyện Hương Sơn', '', 27, 370, 1, 1),
(4216, 'Huyện Kỳ Anh', '', 27, 371, 1, 1),
(4217, 'Huyện Lộc Hà', '', 27, 372, 1, 1),
(4218, 'Huyện Nghi Xuân', '', 27, 373, 1, 1),
(4219, 'Huyện Thạch Hà', '', 27, 374, 1, 1),
(4220, 'Huyện Vũ Quang', '', 27, 375, 1, 1),
(4221, 'Thành phố Hà Tĩnh', '', 27, 376, 1, 1),
(4222, 'Thị xã Hồng Lĩnh', '', 27, 377, 1, 1),
(4223, 'Huyện Bình Giang', '', 28, 378, 1, 1),
(4224, 'Huyện Cẩm Giàng', '', 28, 379, 1, 1),
(4225, 'Huyện Gia Lộc', '', 28, 380, 1, 1),
(4226, 'Huyện Kim Thành', '', 28, 381, 1, 1),
(4227, 'Huyện Kinh Môn', '', 28, 382, 1, 1),
(4228, 'Huyện Nam Sách', '', 28, 383, 1, 1),
(4229, 'Huyện Ninh Giang', '', 28, 384, 1, 1),
(4230, 'Huyện Thanh Hà', '', 28, 385, 1, 1),
(4231, 'Huyện Thanh Miện', '', 28, 386, 1, 1),
(4232, 'Huyện Tứ Kỳ', '', 28, 387, 1, 1),
(4233, 'Thành phố Hải Dương', '', 28, 388, 1, 1),
(4234, 'Thị xã Chí Linh', '', 28, 389, 1, 1),
(4235, 'Huyện Châu Thành', '', 29, 390, 1, 1),
(4236, 'Huyện Châu Thành A', '', 29, 391, 1, 1),
(4237, 'Huyện Long Mỹ', '', 29, 392, 1, 1),
(4238, 'Huyện Phụng Hiệp', '', 29, 393, 1, 1),
(4239, 'Huyện Vị Thủy', '', 29, 394, 1, 1),
(4240, 'Thành Phố Vị Thanh', '', 29, 395, 1, 1),
(4241, 'Thị xã Ngã Bảy', '', 29, 396, 1, 1),
(4242, 'Huyện Cao Phong', '', 30, 397, 1, 1),
(4243, 'Huyện Đà Bắc', '', 30, 398, 1, 1),
(4244, 'Huyện Kim Bôi', '', 30, 399, 1, 1),
(4245, 'Huyện Kỳ Sơn', '', 30, 400, 1, 1),
(4246, 'Huyện Lạc Sơn', '', 30, 401, 1, 1),
(4247, 'Huyện Lạc Thủy', '', 30, 402, 1, 1),
(4248, 'Huyện Lương Sơn', '', 30, 403, 1, 1),
(4249, 'Huyện Mai Châu', '', 30, 404, 1, 1),
(4250, 'Huyện Tân Lạc', '', 30, 405, 1, 1),
(4251, 'Huyện Yên Thủy', '', 30, 406, 1, 1),
(4252, 'Thành phố Hòa Bình', '', 30, 407, 1, 1),
(4253, 'Huyện Ân Thi', '', 31, 408, 1, 1),
(4254, 'Huyện Khoái Châu', '', 31, 409, 1, 1),
(4255, 'Huyện Kim Động', '', 31, 410, 1, 1),
(4256, 'Huyện Mỹ Hào', '', 31, 411, 1, 1),
(4257, 'Huyện Phù Cừ', '', 31, 412, 1, 1),
(4258, 'Huyện Tiên Lữ', '', 31, 413, 1, 1),
(4259, 'Huyện Văn Giang', '', 31, 414, 1, 1),
(4260, 'Huyện Văn Lâm', '', 31, 415, 1, 1),
(4261, 'Huyện Yên Mỹ', '', 31, 416, 1, 1),
(4262, 'Thành phố Hưng Yên', '', 31, 417, 1, 1),
(4263, 'Huyện Cam Lâm', '', 32, 418, 1, 1),
(4264, 'Huyện Diên Khánh', '', 32, 419, 1, 1),
(4265, 'Huyện Khánh Sơn', '', 32, 420, 1, 1),
(4266, 'Huyện Khánh Vĩnh', '', 32, 421, 1, 1),
(4267, 'Huyện Ninh Hòa', '', 32, 422, 1, 1),
(4268, 'Huyện Trường Sa', '', 32, 423, 1, 1),
(4269, 'Huyện Vạn Ninh', '', 32, 424, 1, 1),
(4270, 'Thành phố Nha Trang', '', 32, 425, 1, 1),
(4271, 'Thị xã Cam Ranh', '', 32, 426, 1, 1),
(4272, 'Huyện An Biên', '', 33, 427, 1, 1),
(4273, 'Huyện An Minh', '', 33, 428, 1, 1),
(4274, 'Huyện Châu Thành', '', 33, 429, 1, 1),
(4275, 'Huyện Giang Thành', '', 33, 430, 1, 1),
(4276, 'Huyện Giồng Riềng', '', 33, 431, 1, 1),
(4277, 'Huyện Gò Quao', '', 33, 432, 1, 1),
(4278, 'Huyện Hòn Đất', '', 33, 433, 1, 1),
(4279, 'Huyện Kiên Hải', '', 33, 434, 1, 1),
(4280, 'Huyện Kiên Lương', '', 33, 435, 1, 1),
(4281, 'Huyện Phú Quốc', '', 33, 436, 1, 1),
(4282, 'Huyện Tân Hiệp', '', 33, 437, 1, 1),
(4283, 'Huyện U Minh Thượng', '', 33, 438, 1, 1),
(4284, 'Huyện Vĩnh Thuận', '', 33, 439, 1, 1),
(4285, 'Thành phố Rạch Giá', '', 33, 440, 1, 1),
(4286, 'Thị xã Hà Tiên', '', 33, 441, 1, 1),
(4287, 'Huyện Đắk Glei', '', 34, 442, 1, 1),
(4288, 'Huyện Đắk Hà', '', 34, 443, 1, 1),
(4289, 'Huyện Đắk Tô', '', 34, 444, 1, 1),
(4290, 'Huyện Kon Plông', '', 34, 445, 1, 1),
(4291, 'Huyện Kon Rẫy', '', 34, 446, 1, 1),
(4292, 'Huyện Ngọc Hồi', '', 34, 447, 1, 1),
(4293, 'Huyện Sa Thầy', '', 34, 448, 1, 1),
(4294, 'Huyện Tu Mơ Rông', '', 34, 449, 1, 1),
(4295, 'Thành phố Kon Tum', '', 34, 450, 1, 1),
(4296, 'Huyện Mường Tè', '', 35, 451, 1, 1),
(4297, 'Huyện Phong Thổ', '', 35, 452, 1, 1),
(4298, 'Huyện Sìn Hồ', '', 35, 453, 1, 1),
(4299, 'Huyện Tam Đường', '', 35, 454, 1, 1),
(4300, 'Huyện Tân Uyên', '', 35, 455, 1, 1),
(4301, 'Huyện Than Uyên', '', 35, 456, 1, 1),
(4302, 'Thị xã Lai Châu', '', 35, 457, 1, 1),
(4303, 'Huyện Bảo Lâm', '', 36, 458, 1, 1),
(4304, 'Huyện Cát Tiên', '', 36, 459, 1, 1),
(4305, 'Huyện Đạ Huoai', '', 36, 460, 1, 1),
(4306, 'Huyện Đạ Tẻh', '', 36, 461, 1, 1),
(4307, 'Huyện Đam Rông', '', 36, 462, 1, 1),
(4308, 'Huyện Di Linh', '', 36, 463, 1, 1),
(4309, 'Huyện Đơn Dương', '', 36, 464, 1, 1),
(4310, 'Huyện Đức Trọng', '', 36, 465, 1, 1),
(4311, 'Huyện Lạc Dương', '', 36, 466, 1, 1),
(4312, 'Huyện Lâm Hà', '', 36, 467, 1, 1),
(4313, 'Thành phố Bảo Lộc', '', 36, 468, 1, 1),
(4314, 'Thành phố Đà Lạt', '', 36, 469, 1, 1),
(4315, 'Huyện Bắc Sơn', '', 37, 470, 1, 1),
(4316, 'Huyện Bình Gia', '', 37, 471, 1, 1),
(4317, 'Huyện Cao Lộc', '', 37, 472, 1, 1),
(4318, 'Huyện Chi Lăng', '', 37, 473, 1, 1),
(4319, 'Huyện Đình Lập', '', 37, 474, 1, 1),
(4320, 'Huyện Hữu Lũng', '', 37, 475, 1, 1),
(4321, 'Huyện Lộc Bình', '', 37, 476, 1, 1),
(4322, 'Huyện Tràng Định', '', 37, 477, 1, 1),
(4323, 'Huyện Văn Lãng', '', 37, 478, 1, 1),
(4324, 'Huyện Văn Quan', '', 37, 479, 1, 1),
(4325, 'Thành phố Lạng Sơn', '', 37, 480, 1, 1),
(4326, 'Huyện Bắc Hà', '', 38, 481, 1, 1),
(4327, 'Huyện Bảo Thắng', '', 38, 482, 1, 1),
(4328, 'Huyện Bảo Yên', '', 38, 483, 1, 1),
(4329, 'Huyện Bát Xát', '', 38, 484, 1, 1),
(4330, 'Huyện Mường Khương', '', 38, 485, 1, 1),
(4331, 'Huyện Sa Pa', '', 38, 486, 1, 1),
(4332, 'Huyện Si Ma Cai', '', 38, 487, 1, 1),
(4333, 'Huyện Văn Bàn', '', 38, 488, 1, 1),
(4334, 'Thành phố Lào Cai', '', 38, 489, 1, 1),
(4335, 'Huyện Bến Lức', '', 39, 490, 1, 1),
(4336, 'Huyện Cần Đước', '', 39, 491, 1, 1),
(4337, 'Huyện Cần Giuộc', '', 39, 492, 1, 1),
(4338, 'Huyện Châu Thành', '', 39, 493, 1, 1),
(4339, 'Huyện Đức Hòa', '', 39, 494, 1, 1),
(4340, 'Huyện Đức Huệ', '', 39, 495, 1, 1),
(4341, 'Huyện Mộc Hóa', '', 39, 496, 1, 1),
(4342, 'Huyện Tân Hưng', '', 39, 497, 1, 1),
(4343, 'Huyện Tân Thạnh', '', 39, 498, 1, 1),
(4344, 'Huyện Tân Trụ', '', 39, 499, 1, 1),
(4345, 'Huyện Thạnh Hóa', '', 39, 500, 1, 1),
(4346, 'Huyện Thủ Thừa', '', 39, 501, 1, 1),
(4347, 'Huyện Vĩnh Hưng', '', 39, 502, 1, 1),
(4348, 'Thành phố Tân An', '', 39, 503, 1, 1),
(4349, 'Huyện Giao Thủy', '', 40, 504, 1, 1),
(4350, 'Huyện Hải Hậu', '', 40, 505, 1, 1),
(4351, 'Huyện Mỹ Lộc', '', 40, 506, 1, 1),
(4352, 'Huyện Nam Trực', '', 40, 507, 1, 1),
(4353, 'Huyện Nghĩa Hưng', '', 40, 508, 1, 1),
(4354, 'Huyện Trực Ninh', '', 40, 509, 1, 1),
(4355, 'Huyện Vụ Bản', '', 40, 510, 1, 1),
(4356, 'Huyện Xuân Trường', '', 40, 511, 1, 1),
(4357, 'Huyện ý Yên', '', 40, 512, 1, 1),
(4358, 'Thành phố Nam Định', '', 40, 513, 1, 1),
(4359, 'Huyện Anh Sơn', '', 41, 514, 1, 1),
(4360, 'Huyện Con Cuông', '', 41, 515, 1, 1),
(4361, 'Huyện Diễn Châu', '', 41, 516, 1, 1),
(4362, 'Huyện Đô Lương', '', 41, 517, 1, 1),
(4363, 'Huyện Hưng Nguyên', '', 41, 518, 1, 1),
(4364, 'Huyện Kỳ Sơn', '', 41, 519, 1, 1),
(4365, 'Huyện Nam Đàn', '', 41, 520, 1, 1),
(4366, 'Huyện Nghi Lộc', '', 41, 521, 1, 1),
(4367, 'Huyện Nghĩa Đàn', '', 41, 522, 1, 1),
(4368, 'Huyện Quế Phong', '', 41, 523, 1, 1),
(4369, 'Huyện Quỳ Châu', '', 41, 524, 1, 1),
(4370, 'Huyện Quỳ Hợp', '', 41, 525, 1, 1),
(4371, 'Huyện Quỳnh Lưu', '', 41, 526, 1, 1),
(4372, 'Huyện Tân Kỳ', '', 41, 527, 1, 1),
(4373, 'Huyện Thanh Chương', '', 41, 528, 1, 1),
(4374, 'Huyện Tương Dương', '', 41, 529, 1, 1),
(4375, 'Huyện Yên Thành', '', 41, 530, 1, 1),
(4376, 'Thành phố Vinh', '', 41, 531, 1, 1),
(4377, 'Thị xã Cửa Lò', '', 41, 532, 1, 1),
(4378, 'Thị xã Thái Hòa', '', 41, 533, 1, 1),
(4379, 'Huyện Gia Viễn', '', 42, 534, 1, 1),
(4380, 'Huyện Hoa Lư', '', 42, 535, 1, 1),
(4381, 'Huyện Kim Sơn', '', 42, 536, 1, 1),
(4382, 'Huyện Nho Quan', '', 42, 537, 1, 1),
(4383, 'Huyện Yên Khánh', '', 42, 538, 1, 1),
(4384, 'Huyện Yên Mô', '', 42, 539, 1, 1),
(4385, 'Thành phố Ninh Bình', '', 42, 540, 1, 1),
(4386, 'Thị xã Tam Điệp', '', 42, 541, 1, 1),
(4387, 'Huyên Bác ái', '', 43, 542, 1, 1),
(4388, 'Huyện Ninh Hải', '', 43, 543, 1, 1),
(4389, 'Huyện Ninh Phước', '', 43, 544, 1, 1),
(4390, 'Huyện Ninh Sơn', '', 43, 545, 1, 1),
(4391, 'Huyện Thuận Bắc', '', 43, 546, 1, 1),
(4392, 'Huyện Thuận Nam', '', 43, 547, 1, 1),
(4393, 'Thành phố Phan Rang-Tháp Chàm', '', 43, 548, 1, 1),
(4394, 'Huyện Cẩm Khê', '', 44, 549, 1, 1),
(4395, 'Huyện Đoan Hùng', '', 44, 550, 1, 1),
(4396, 'Huyện Hạ Hòa', '', 44, 551, 1, 1),
(4397, 'Huyện Lâm Thao', '', 44, 552, 1, 1),
(4398, 'Huyện Phù Ninh', '', 44, 553, 1, 1),
(4399, 'Huyện Tam Nông', '', 44, 554, 1, 1),
(4400, 'Huyện Tân Sơn', '', 44, 555, 1, 1),
(4401, 'Huyện Thanh Ba', '', 44, 556, 1, 1),
(4402, 'Huyện Thanh Sơn', '', 44, 557, 1, 1),
(4403, 'Huyện Thanh Thủy', '', 44, 558, 1, 1),
(4404, 'Huyện Yên Lập', '', 44, 559, 1, 1),
(4405, 'Thành phố Việt Trì', '', 44, 560, 1, 1),
(4406, 'Thị xã Phú Thọ', '', 44, 561, 1, 1),
(4407, 'Huyện Đông Hòa', '', 45, 562, 1, 1),
(4408, 'Huyện Đồng Xuân', '', 45, 563, 1, 1),
(4409, 'Huyện Phú Hòa', '', 45, 564, 1, 1),
(4410, 'Huyện Sơn Hòa', '', 45, 565, 1, 1),
(4411, 'Huyện Sông Hinh', '', 45, 566, 1, 1),
(4412, 'Huyện Tây Hòa', '', 45, 567, 1, 1),
(4413, 'Huyện Tuy An', '', 45, 568, 1, 1),
(4414, 'Thành phố Tuy Hòa', '', 45, 569, 1, 1),
(4415, 'Thị xã Sông Cầu', '', 45, 570, 1, 1),
(4416, 'Huyện Bố Trạch', '', 46, 571, 1, 1),
(4417, 'Huyện Lệ Thủy', '', 46, 572, 1, 1),
(4418, 'Huyện MinhHoá', '', 46, 573, 1, 1),
(4419, 'Huyện Quảng Ninh', '', 46, 574, 1, 1),
(4420, 'Huyện Quảng Trạch', '', 46, 575, 1, 1),
(4421, 'Huyện Tuyên Hoá', '', 46, 576, 1, 1),
(4422, 'Thành phố Đồng Hới', '', 46, 577, 1, 1),
(4423, 'Huyện Bắc Trà My', '', 47, 578, 1, 1),
(4424, 'Huyện Đại Lộc', '', 47, 579, 1, 1),
(4425, 'Huyện Điện Bàn', '', 47, 580, 1, 1),
(4426, 'Huyện Đông Giang', '', 47, 581, 1, 1),
(4427, 'Huyện Duy Xuyên', '', 47, 582, 1, 1),
(4428, 'Huyện Hiệp Đức', '', 47, 583, 1, 1),
(4429, 'Huyện Nam Giang', '', 47, 584, 1, 1),
(4430, 'Huyện Nam Trà My', '', 47, 585, 1, 1),
(4431, 'Huyện Nông Sơn', '', 47, 586, 1, 1),
(4432, 'Huyện Núi Thành', '', 47, 587, 1, 1),
(4433, 'Huyện Phú Ninh', '', 47, 588, 1, 1),
(4434, 'Huyện Phước Sơn', '', 47, 589, 1, 1),
(4435, 'Huyện Quế Sơn', '', 47, 590, 1, 1),
(4436, 'Huyện Tây Giang', '', 47, 591, 1, 1),
(4437, 'Huyện Thăng Bình', '', 47, 592, 1, 1),
(4438, 'Huyện Tiên Phước', '', 47, 593, 1, 1),
(4439, 'Thành phố Hội An', '', 47, 594, 1, 1),
(4440, 'Thành phố Tam Kỳ', '', 47, 595, 1, 1),
(4441, 'Huyện Ba Tơ', '', 48, 596, 1, 1),
(4442, 'Huyện Bình Sơn', '', 48, 597, 1, 1),
(4443, 'Huyện Đức Phổ', '', 48, 598, 1, 1),
(4444, 'Huyện Lý sơn', '', 48, 599, 1, 1),
(4445, 'Huyện Minh Long', '', 48, 600, 1, 1),
(4446, 'Huyện Mộ Đức', '', 48, 601, 1, 1),
(4447, 'Huyện Nghĩa Hành', '', 48, 602, 1, 1),
(4448, 'Huyện Sơn Hà', '', 48, 603, 1, 1),
(4449, 'Huyện Sơn Tây', '', 48, 604, 1, 1),
(4450, 'Huyện Sơn Tịnh', '', 48, 605, 1, 1),
(4451, 'Huyện Tây Trà', '', 48, 606, 1, 1),
(4452, 'Huyện Trà Bồng', '', 48, 607, 1, 1),
(4453, 'Huyện Tư Nghĩa', '', 48, 608, 1, 1),
(4454, 'Thành phố Quảng Ngãi', '', 48, 609, 1, 1),
(4455, 'Huyện Ba Chẽ', '', 49, 610, 1, 1),
(4456, 'Huyện Bình Liêu', '', 49, 611, 1, 1),
(4457, 'Huyện Cô Tô', '', 49, 612, 1, 1),
(4458, 'Huyện Đầm Hà', '', 49, 613, 1, 1),
(4459, 'Huyện Đông Triều', '', 49, 614, 1, 1),
(4460, 'Huyện Hải Hà', '', 49, 615, 1, 1),
(4461, 'Huyện Hoành Bồ', '', 49, 616, 1, 1),
(4462, 'Huyện Tiên Yên', '', 49, 617, 1, 1),
(4463, 'Huyện Vân Đồn', '', 49, 618, 1, 1),
(4464, 'Huyện Yên Hưng', '', 49, 619, 1, 1),
(4465, 'Thành phố Hạ Long', '', 49, 620, 1, 1),
(4466, 'Thành phố Móng Cái', '', 49, 621, 1, 1),
(4467, 'Thị xã Cẩm Phả', '', 49, 622, 1, 1),
(4468, 'Thị xã Uông Bí', '', 49, 623, 1, 1),
(4469, 'Huyện Cam Lộ', '', 50, 624, 1, 1),
(4470, 'Huyện Cồn Cỏ', '', 50, 625, 1, 1),
(4471, 'Huyện Đa Krông', '', 50, 626, 1, 1),
(4472, 'Huyện Gio Linh', '', 50, 627, 1, 1),
(4473, 'Huyện Hải Lăng', '', 50, 628, 1, 1),
(4474, 'Huyện Hướng Hóa', '', 50, 629, 1, 1),
(4475, 'Huyện Triệu Phong', '', 50, 630, 1, 1),
(4476, 'Huyện Vính Linh', '', 50, 631, 1, 1),
(4477, 'Thành phố Đông Hà', '', 50, 632, 1, 1),
(4478, 'Thị xã Quảng Trị', '', 50, 633, 1, 1),
(4479, 'Huyện Châu Thành', '', 51, 634, 1, 1),
(4480, 'Huyện Cù Lao Dung', '', 51, 635, 1, 1),
(4481, 'Huyện Kế Sách', '', 51, 636, 1, 1),
(4482, 'Huyện Long Phú', '', 51, 637, 1, 1),
(4483, 'Huyện Mỹ Tú', '', 51, 638, 1, 1),
(4484, 'Huyện Mỹ Xuyên', '', 51, 639, 1, 1),
(4485, 'Huyện Ngã Năm', '', 51, 640, 1, 1),
(4486, 'Huyện Thạnh Trị', '', 51, 641, 1, 1),
(4487, 'Huyện Trần Đề', '', 51, 642, 1, 1),
(4488, 'Huyện Vĩnh Châu', '', 51, 643, 1, 1),
(4489, 'Thành phố Sóc Trăng', '', 51, 644, 1, 1),
(4490, 'Huyện Bắc Yên', '', 52, 645, 1, 1),
(4491, 'Huyện Mai Sơn', '', 52, 646, 1, 1),
(4492, 'Huyện Mộc Châu', '', 52, 647, 1, 1),
(4493, 'Huyện Mường La', '', 52, 648, 1, 1),
(4494, 'Huyện Phù Yên', '', 52, 649, 1, 1),
(4495, 'Huyện Quỳnh Nhai', '', 52, 650, 1, 1),
(4496, 'Huyện Sông Mã', '', 52, 651, 1, 1),
(4497, 'Huyện Sốp Cộp', '', 52, 652, 1, 1),
(4498, 'Huyện Thuận Châu', '', 52, 653, 1, 1),
(4499, 'Huyện Yên Châu', '', 52, 654, 1, 1),
(4500, 'Thành phố Sơn La', '', 52, 655, 1, 1),
(4501, 'Huyện Bến Cầu', '', 53, 656, 1, 1),
(4502, 'Huyện Châu Thành', '', 53, 657, 1, 1),
(4503, 'Huyện Dương Minh Châu', '', 53, 658, 1, 1),
(4504, 'Huyện Gò Dầu', '', 53, 659, 1, 1),
(4505, 'Huyện Hòa Thành', '', 53, 660, 1, 1),
(4506, 'Huyện Tân Biên', '', 53, 661, 1, 1),
(4507, 'Huyện Tân Châu', '', 53, 662, 1, 1),
(4508, 'Huyện Trảng Bàng', '', 53, 663, 1, 1),
(4509, 'Thị xã Tây Ninh', '', 53, 664, 1, 1),
(4510, 'Huyện Đông Hưng', '', 54, 665, 1, 1),
(4511, 'Huyện Hưng Hà', '', 54, 666, 1, 1),
(4512, 'Huyện Kiến Xương', '', 54, 667, 1, 1),
(4513, 'Huyện Quỳnh Phụ', '', 54, 668, 1, 1),
(4514, 'Huyện Thái Thụy', '', 54, 669, 1, 1),
(4515, 'Huyện Tiền Hải', '', 54, 670, 1, 1),
(4516, 'Huyện Vũ Thư', '', 54, 671, 1, 1),
(4517, 'Thành phố Thái Bình', '', 54, 672, 1, 1),
(4518, 'Huyện Đại Từ', '', 55, 673, 1, 1),
(4519, 'Huyện Định Hóa', '', 55, 674, 1, 1),
(4520, 'Huyện Đồng Hỷ', '', 55, 675, 1, 1),
(4521, 'Huyện Phổ Yên', '', 55, 676, 1, 1),
(4522, 'Huyện Phú Bình', '', 55, 677, 1, 1),
(4523, 'Huyện Phú Lương', '', 55, 678, 1, 1),
(4524, 'Huyện Võ Nhai', '', 55, 679, 1, 1),
(4525, 'Thành phố Thái Nguyên', '', 55, 680, 1, 1),
(4526, 'Thị xã Sông Công', '', 55, 681, 1, 1),
(4527, 'Huyện Bá Thước', '', 56, 682, 1, 1),
(4528, 'Huyện Cẩm Thủy', '', 56, 683, 1, 1),
(4529, 'Huyện Đông Sơn', '', 56, 684, 1, 1),
(4530, 'Huyện Hà Trung', '', 56, 685, 1, 1),
(4531, 'Huyện Hậu Lộc', '', 56, 686, 1, 1),
(4532, 'Huyện Hoằng Hóa', '', 56, 687, 1, 1),
(4533, 'Huyện Lang Chánh', '', 56, 688, 1, 1),
(4534, 'Huyện Mường Lát', '', 56, 689, 1, 1),
(4535, 'Huyện Nga Sơn', '', 56, 690, 1, 1),
(4536, 'Huyện Ngọc Lặc', '', 56, 691, 1, 1),
(4537, 'Huyện Như Thanh', '', 56, 692, 1, 1),
(4538, 'Huyện Như Xuân', '', 56, 693, 1, 1),
(4539, 'Huyện Nông Cống', '', 56, 694, 1, 1),
(4540, 'Huyện Quan Hóa', '', 56, 695, 1, 1),
(4541, 'Huyện Quan Sơn', '', 56, 696, 1, 1),
(4542, 'Huyện Quảng Xương', '', 56, 697, 1, 1),
(4543, 'Huyện Thạch Thành', '', 56, 698, 1, 1),
(4544, 'Huyện Thiệu Hóa', '', 56, 699, 1, 1),
(4545, 'Huyện Thọ Xuân', '', 56, 700, 1, 1),
(4546, 'Huyện Thường Xuân', '', 56, 701, 1, 1),
(4547, 'Huyện Tĩnh Gia', '', 56, 702, 1, 1),
(4548, 'Huyện Triệu Sơn', '', 56, 703, 1, 1),
(4549, 'Huyện Vĩnh Lộc', '', 56, 704, 1, 1),
(4550, 'Huyện Yên Định', '', 56, 705, 1, 1),
(4551, 'Thành phố Thanh Hóa', '', 56, 706, 1, 1),
(4552, 'Thị xã Bỉm Sơn', '', 56, 707, 1, 1),
(4553, 'Thị xã Sầm Sơn', '', 56, 708, 1, 1),
(4554, 'Huyện A Lưới', '', 57, 709, 1, 1),
(4555, 'Huyện Hương Trà', '', 57, 710, 1, 1),
(4556, 'Huyện Nam Dông', '', 57, 711, 1, 1),
(4557, 'Huyện Phong Điền', '', 57, 712, 1, 1),
(4558, 'Huyện Phú Lộc', '', 57, 713, 1, 1),
(4559, 'Huyện Phú Vang', '', 57, 714, 1, 1),
(4560, 'Huyện Quảng Điền', '', 57, 715, 1, 1),
(4561, 'Thành phố Huế', '', 57, 716, 1, 1),
(4562, 'thị xã Hương Thủy', '', 57, 717, 1, 1),
(4563, 'Huyện Cái Bè', '', 58, 718, 1, 1),
(4564, 'Huyện Cai Lậy', '', 58, 719, 1, 1),
(4565, 'Huyện Châu Thành', '', 58, 720, 1, 1),
(4566, 'Huyện Chợ Gạo', '', 58, 721, 1, 1),
(4567, 'Huyện Gò Công Đông', '', 58, 722, 1, 1),
(4568, 'Huyện Gò Công Tây', '', 58, 723, 1, 1),
(4569, 'Huyện Tân Phú Đông', '', 58, 724, 1, 1),
(4570, 'Huyện Tân Phước', '', 58, 725, 1, 1),
(4571, 'Thành phố Mỹ Tho', '', 58, 726, 1, 1),
(4572, 'Thị xã Gò Công', '', 58, 727, 1, 1),
(4573, 'Huyện Càng Long', '', 59, 728, 1, 1),
(4574, 'Huyện Cầu Kè', '', 59, 729, 1, 1),
(4575, 'Huyện Cầu Ngang', '', 59, 730, 1, 1),
(4576, 'Huyện Châu Thành', '', 59, 731, 1, 1),
(4577, 'Huyện Duyên Hải', '', 59, 732, 1, 1),
(4578, 'Huyện Tiểu Cần', '', 59, 733, 1, 1),
(4579, 'Huyện Trà Cú', '', 59, 734, 1, 1),
(4580, 'Thành phố Trà Vinh', '', 59, 735, 1, 1),
(4581, 'Huyện Chiêm Hóa', '', 60, 736, 1, 1),
(4582, 'Huyện Hàm Yên', '', 60, 737, 1, 1),
(4583, 'Huyện Na hang', '', 60, 738, 1, 1),
(4584, 'Huyện Sơn Dương', '', 60, 739, 1, 1),
(4585, 'Huyện Yên Sơn', '', 60, 740, 1, 1),
(4586, 'Thành phố Tuyên Quang', '', 60, 741, 1, 1),
(4587, 'Huyện Bình Minh', '', 61, 742, 1, 1),
(4588, 'Huyện Bình Tân', '', 61, 743, 1, 1),
(4589, 'Huyện Long Hồ', '', 61, 744, 1, 1),
(4590, 'Huyện Mang Thít', '', 61, 745, 1, 1),
(4591, 'Huyện Tam Bình', '', 61, 746, 1, 1),
(4592, 'Huyện Trà Ôn', '', 61, 747, 1, 1),
(4593, 'Huyện Vũng Liêm', '', 61, 748, 1, 1),
(4594, 'Thành phố Vĩnh Long', '', 61, 749, 1, 1),
(4595, 'Huyện Bình Xuyên', '', 62, 750, 1, 1),
(4596, 'Huyện Lập Thạch', '', 62, 751, 1, 1),
(4597, 'Huyện Sông Lô', '', 62, 752, 1, 1),
(4598, 'Huyện Tam Đảo', '', 62, 753, 1, 1),
(4599, 'Huyện Tam Dương', '', 62, 754, 1, 1),
(4600, 'Huyện Vĩnh Tường', '', 62, 755, 1, 1),
(4601, 'Huyện Yên Lạc', '', 62, 756, 1, 1),
(4602, 'Thành phố Vĩnh Yên', '', 62, 757, 1, 1),
(4603, 'Thị xã Phúc Yên', '', 62, 758, 1, 1),
(4604, 'Huyện Lục Yên', '', 63, 759, 1, 1),
(4605, 'Huyện Mù Cang Chải', '', 63, 760, 1, 1),
(4606, 'Huyện Trạm Tấu', '', 63, 761, 1, 1),
(4607, 'Huyện Trấn Yên', '', 63, 762, 1, 1),
(4608, 'Huyện Văn Chấn', '', 63, 763, 1, 1),
(4609, 'Huyện Văn Yên', '', 63, 764, 1, 1),
(4610, 'Huyện Yên Bình', '', 63, 765, 1, 1),
(4611, 'Thành phố Yên Bái', '', 63, 766, 1, 1),
(4612, 'Thị xã Nghĩa Lộ', '', 63, 767, 1, 1),
(4613, 'Thành Phố Bạc Liêu', '', 10, 198, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `office`
--

CREATE TABLE IF NOT EXISTS `office` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `en_title` text COLLATE utf8_unicode_ci NOT NULL,
  `short_detail` text COLLATE utf8_unicode_ci NOT NULL,
  `en_short_detail` text COLLATE utf8_unicode_ci NOT NULL,
  `image` text COLLATE utf8_unicode_ci NOT NULL,
  `googlemap_address` text COLLATE utf8_unicode_ci NOT NULL,
  `googlemap` text COLLATE utf8_unicode_ci NOT NULL,
  `phone` text COLLATE utf8_unicode_ci NOT NULL,
  `email` text COLLATE utf8_unicode_ci NOT NULL,
  `is_active` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `time_update` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `office`
--

INSERT INTO `office` (`id`, `title`, `en_title`, `short_detail`, `en_short_detail`, `image`, `googlemap_address`, `googlemap`, `phone`, `email`, `is_active`, `id_user`, `time`, `time_update`) VALUES
(1, '123', '123', '123', '123', 'http://localhost/hoadatset/public/uploads/files/DUC_0615.JPG', '181, Serbia', '43.724855, 20.326563', '123', '123', 0, 1, 1432359430, 1432359430),
(4, '1', '2', '4', '3', 'http://localhost/hoadatset/public/uploads/images/Hydrangeas.jpg', '109 Avenida Luis Llorens Torres, Arecibo, Arecibo 00612, Puerto Rico', '18.468198, -66.719535', '5', '6', 1, 2, 1432546637, 1432546637);

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE IF NOT EXISTS `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fullname` text COLLATE utf8_unicode_ci NOT NULL,
  `id_user_profile` int(11) NOT NULL,
  `address` text COLLATE utf8_unicode_ci NOT NULL,
  `phone` text COLLATE utf8_unicode_ci NOT NULL,
  `email` text COLLATE utf8_unicode_ci NOT NULL,
  `ship_address` text COLLATE utf8_unicode_ci NOT NULL,
  `ship_name` text COLLATE utf8_unicode_ci NOT NULL,
  `ship_phone` text COLLATE utf8_unicode_ci NOT NULL,
  `time` int(11) NOT NULL,
  `time_delivery` int(11) NOT NULL,
  `note` text COLLATE utf8_unicode_ci NOT NULL,
  `total_amount` double NOT NULL,
  `total_amount_real` double NOT NULL,
  `is_active` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE IF NOT EXISTS `order_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_order` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` double NOT NULL,
  `price_promotion` double NOT NULL,
  `total` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `partner`
--

CREATE TABLE IF NOT EXISTS `partner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `en_title` text COLLATE utf8_unicode_ci NOT NULL,
  `short_detail` text COLLATE utf8_unicode_ci NOT NULL,
  `en_short_detail` text COLLATE utf8_unicode_ci NOT NULL,
  `image` text COLLATE utf8_unicode_ci NOT NULL,
  `link` text COLLATE utf8_unicode_ci NOT NULL,
  `is_active` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `time_update` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `partner`
--

INSERT INTO `partner` (`id`, `title`, `en_title`, `short_detail`, `en_short_detail`, `image`, `link`, `is_active`, `time`, `time_update`, `id_user`) VALUES
(2, 'test', 'test', 'test', 'test', 'http://localhost/hoadatset/public/uploads/files/DUC_0615.JPG', 'http://lozi.vn', 1, 1432546806, 1432546806, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_category` int(11) NOT NULL,
  `id_categorys` text COLLATE utf8_unicode_ci,
  `id_user` int(11) NOT NULL,
  `id_product` text COLLATE utf8_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `price_promotion` double DEFAULT NULL,
  `promotion` double DEFAULT NULL,
  `image` text COLLATE utf8_unicode_ci NOT NULL,
  `images` text COLLATE utf8_unicode_ci,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `en_title` text COLLATE utf8_unicode_ci NOT NULL,
  `alias` text COLLATE utf8_unicode_ci NOT NULL,
  `en_alias` text COLLATE utf8_unicode_ci NOT NULL,
  `short_detail` text COLLATE utf8_unicode_ci NOT NULL,
  `en_short_detail` text COLLATE utf8_unicode_ci NOT NULL,
  `long_detail` text COLLATE utf8_unicode_ci NOT NULL,
  `en_long_detail` text COLLATE utf8_unicode_ci NOT NULL,
  `title_seo` text COLLATE utf8_unicode_ci,
  `en_title_seo` text COLLATE utf8_unicode_ci,
  `desc_seo` text COLLATE utf8_unicode_ci,
  `en_desc_seo` text COLLATE utf8_unicode_ci,
  `keyword_seo` text COLLATE utf8_unicode_ci,
  `en_keyword_seo` text COLLATE utf8_unicode_ci,
  `quantity` double DEFAULT NULL,
  `time` int(11) NOT NULL,
  `time_update` int(11) NOT NULL,
  `time_sentmail` int(11) DEFAULT NULL,
  `is_active` int(11) NOT NULL,
  `is_special` int(11) NOT NULL,
  `is_stock` int(11) DEFAULT NULL,
  `id_unit` int(11) DEFAULT NULL,
  `is_sentmail` int(11) DEFAULT NULL,
  `is_savedraft` int(11) DEFAULT NULL,
  `views` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `id_category`, `id_categorys`, `id_user`, `id_product`, `price`, `price_promotion`, `promotion`, `image`, `images`, `title`, `en_title`, `alias`, `en_alias`, `short_detail`, `en_short_detail`, `long_detail`, `en_long_detail`, `title_seo`, `en_title_seo`, `desc_seo`, `en_desc_seo`, `keyword_seo`, `en_keyword_seo`, `quantity`, `time`, `time_update`, `time_sentmail`, `is_active`, `is_special`, `is_stock`, `id_unit`, `is_sentmail`, `is_savedraft`, `views`) VALUES
(2, 11, NULL, 1, 'SP-001', 100000, 50000, 50, 'http://localhost/hoadatset/public/uploads/images/no-image.gif', 'http://localhost/hoadatset/public/uploads/images/Hydrangeas.jpg||http://localhost/hoadatset/public/uploads/images/Jellyfish.jpg||http://localhost/hoadatset/public/uploads/images/Koala.jpg', 'Tên sản phẩm', 'Product name ', 'ten-san-pham', 'product-name', 'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.</p>\n', '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.</p>\n', 'Tên sản phẩm', 'Product name ', 'Tên sản phẩm', 'Product name ', 'Tên sản phẩm', 'Product name ', 1, 1432485576, 1432486642, 1432542365, 1, 0, 0, 8, 1, 0, 0),
(3, 11, NULL, 1, 'SP-001', 100000, 50000, 50, 'http://localhost/hoadatset/public/uploads/images/no-image.gif', 'http://localhost/hoadatset/public/uploads/images/Hydrangeas.jpg||http://localhost/hoadatset/public/uploads/images/Jellyfish.jpg||http://localhost/hoadatset/public/uploads/images/Koala.jpg', 'Tên sản phẩm', 'Product name ', 'ten-san-pham', 'product-name', 'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.</p>\n', '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.</p>\n', 'Tên sản phẩm', 'Product name ', 'Tên sản phẩm', 'Product name ', 'Tên sản phẩm', 'Product name ', 1, 1432486951, 1432486981, 1432542468, 1, 0, 0, 8, 1, 0, 0),
(6, 11, NULL, 1, 'SP-001', 100000, 50000, 50, 'http://localhost/hoadatset/public/uploads/images/no-image.gif', 'http://localhost/hoadatset/public/uploads/images/Hydrangeas.jpg||http://localhost/hoadatset/public/uploads/images/Jellyfish.jpg||http://localhost/hoadatset/public/uploads/images/Koala.jpg', 'Tên sản phẩm', 'Product name ', 'ten-san-pham', 'product-name', 'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.</p>\n', '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.</p>\n', 'Tên sản phẩm', 'Product name ', 'Tên sản phẩm', 'Product name ', 'Tên sản phẩm', 'Product name ', 1, 1432543851, 1432543851, 1432542468, 1, 0, 0, 8, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `product_tags`
--

CREATE TABLE IF NOT EXISTS `product_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_product` int(11) NOT NULL,
  `id_tag` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=24 ;

--
-- Dumping data for table `product_tags`
--

INSERT INTO `product_tags` (`id`, `id_product`, `id_tag`) VALUES
(1, 1, 9),
(2, 1, 5),
(3, 1, 4),
(4, 1, 2),
(20, 2, 4),
(21, 2, 5),
(22, 3, 7),
(23, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `r_group_action`
--

CREATE TABLE IF NOT EXISTS `r_group_action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `actions` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `r_group_action`
--

INSERT INTO `r_group_action` (`id`, `title`, `actions`) VALUES
(1, 'Lập Trình Viên', ''),
(2, 'Khách Hàng', ''),
(5, 'Giám Đốc', 'home/sent_news,category/index'),
(6, 'Điều Hành Viên', '');

-- --------------------------------------------------------

--
-- Table structure for table `r_user_action`
--

CREATE TABLE IF NOT EXISTS `r_user_action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_group_action` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Dumping data for table `r_user_action`
--

INSERT INTO `r_user_action` (`id`, `id_group_action`, `id_user`) VALUES
(1, 1, 1),
(5, 5, 16),
(6, 5, 2),
(7, 6, 3),
(8, 5, 4);

-- --------------------------------------------------------

--
-- Table structure for table `slide`
--

CREATE TABLE IF NOT EXISTS `slide` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `en_title` text COLLATE utf8_unicode_ci NOT NULL,
  `short_detail` text COLLATE utf8_unicode_ci NOT NULL,
  `en_short_detail` text COLLATE utf8_unicode_ci NOT NULL,
  `link` text COLLATE utf8_unicode_ci NOT NULL,
  `en_link` text COLLATE utf8_unicode_ci NOT NULL,
  `image` text COLLATE utf8_unicode_ci NOT NULL,
  `is_active` int(11) NOT NULL,
  `position` double NOT NULL,
  `time` int(11) NOT NULL,
  `time_update` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE IF NOT EXISTS `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `en_title` text COLLATE utf8_unicode_ci NOT NULL,
  `is_active` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `time_update` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `title`, `en_title`, `is_active`, `time`, `time_update`, `id_user`) VALUES
(1, 'Tag #1', 'Tag #1', 1, 1432484389, 1432484389, 1),
(2, 'Tag #2', 'Tag #2', 1, 1432484402, 1432484402, 1),
(3, 'Tag #3', 'Tag #3', 1, 1432484511, 1432484511, 1),
(4, 'Tag #4', 'Tag #4', 1, 1432484521, 1432484521, 1),
(5, 'Tag #5', 'Tag #5', 1, 1432484532, 1432484532, 1),
(6, 'Tag #6', 'Tag #6', 1, 1432484544, 1432484544, 1);

-- --------------------------------------------------------

--
-- Table structure for table `unit`
--

CREATE TABLE IF NOT EXISTS `unit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `is_number` int(11) NOT NULL COMMENT '#1 số thực #0 số nguyên',
  `is_active` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=12 ;

--
-- Dumping data for table `unit`
--

INSERT INTO `unit` (`id`, `title`, `is_number`, `is_active`) VALUES
(8, 'Cái', 0, 1),
(9, 'Kg', 0, 1),
(11, 'Test', 0, 0);

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
  `id_role` int(11) NOT NULL,
  `actions` text COLLATE utf8_unicode_ci NOT NULL,
  `is_active` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `fullname`, `email`, `id_role`, `actions`, `is_active`) VALUES
(1, 'luong', '098f6bcd4621d373cade4e832627b4f6', 'Phùng Duy Lương', 'luonguit@gmail.com', 1, '', 1), -- password: test
(2, 'linh', '098f6bcd4621d373cade4e832627b4f6', 'Phạm Ngọc Linh', 'pnlinh93@gmail.com', 1, '', 1), -- password: test
(3, 'danh', '098f6bcd4621d373cade4e832627b4f6', 'Nguyễn Viết Danh', 'danhnvuit@gmail.com', 1, '', 1), -- password: test
(4, 'khoa', '098f6bcd4621d373cade4e832627b4f6', 'Huỳnh Đức Đăng Khoa', 'huynhducdangkhoa@gmail.com', 1, '', 1), -- password: test
(5, 'admin', '098f6bcd4621d373cade4e832627b4f6', 'Administration', 'luonguit@gmail.com', 5, '', 1);  -- password: test

-- --------------------------------------------------------

--
-- Table structure for table `user_profile`
--

CREATE TABLE IF NOT EXISTS `user_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(100) CHARACTER SET utf8 NOT NULL,
  `fbid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `birthday` int(11) NOT NULL,
  `desc` varchar(255) CHARACTER SET utf8 NOT NULL,
  `info` text COLLATE utf8_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `generated_date` int(11) NOT NULL,
  `last_logged_in` int(11) NOT NULL,
  `is_active` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `user_profile`
--

INSERT INTO `user_profile` (`id`, `full_name`, `fbid`, `birthday`, `desc`, `info`, `avatar`, `email`, `generated_date`, `last_logged_in`, `is_active`) VALUES
(1, 'Phùng Duy Lương', 'Quảng Bình', 0, '', '', '', 'luonguit@gmail.com', 0, 0, 1),
(2, 'Phạm Ngọc Linh', 'Tây Ninh', 0, '', '', '', 'pnlinh93@gmail.com',  0, 0, 1),
(3, 'Nguyễn Viết Danh', 'Bình Định', 0, '', '', '', 'danhnvuit@gmail.com',  0, 0, 1),
(4, 'Huỳnh Đức Đăng Khoa', 'Bình Định', 0, '', '', '', 'huynhducdangkhoa@gmail.com',  0, 0, 1);



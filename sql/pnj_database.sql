-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 30, 2024 at 11:27 AM
-- Server version: 8.0.17
-- PHP Version: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pnj_database`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `productName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `productPrice` decimal(10,0) NOT NULL,
  `productImage` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `userId`, `productId`, `qty`, `productName`, `productPrice`, `productImage`) VALUES
(130, 1, 94, 1, 'Kiềng bạc Ý PNJSilver kiểu lượn sóng 0000W060017', '859000', 'kieng_7.png');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `status`) VALUES
(6, 'Nhẫn', 1),
(7, 'Dây chuyền', 1),
(8, 'Mặt dây chuyền', 1),
(9, 'Bông tai', 1),
(10, 'Lắc', 1),
(11, 'Kiềng', 1),
(12, 'Charm', 1),
(13, 'Vòng', 1);

-- --------------------------------------------------------

--
-- Table structure for table `chatbot`
--

CREATE TABLE `chatbot` (
  `id` int(11) NOT NULL,
  `queries` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `replies` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `chatbot`
--

INSERT INTO `chatbot` (`id`, `queries`, `replies`) VALUES
(1, 'hi|hello|hey|hy', 'Hello');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `createdDate` date NOT NULL,
  `receivedDate` date DEFAULT NULL,
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `fullname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `phoneNumber` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `address` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `userId`, `createdDate`, `receivedDate`, `status`, `fullname`, `phoneNumber`, `address`) VALUES
(1, 1, '2023-06-09', '2023-06-09', 'Complete', 'Nguyễn Thị B', '0987654321', 'Hồ Chí Minh'),
(2, 1, '2023-06-09', '2023-06-09', 'Complete', 'Trần Văn C', '0909090909', 'Đà Nẵng'),
(3, 1, '2023-06-09', '2023-06-09', 'Complete', 'Lê Thị D', '0912345678', 'Hải Phòng'),
(4, 1, '2023-06-09', '2023-06-09', 'Complete', 'Phạm Văn E', '0977123456', 'Cần Thơ'),
(6, 42, '2023-06-12', NULL, 'Cancel', 'Nguyễn Văn F', '0987654321', 'Hà Nội'),
(19, 11, '2024-05-25', '2024-05-25', 'Complete', 'phuong le', '0123456789', ' đường xuân phương, phương canh, nam từ liêm, hà nội'),
(20, 35, '2024-05-25', '2024-05-25', 'Complete', 'mai', '0126547525', ' cầu diễn, bắc từ liêm, hà nội'),
(21, 78, '2024-05-25', '2024-05-28', 'Cancel', 'nguyen van a', '0978654321', ' Hương Quất ,Khoái Châu, Hưng yên'),
(22, 78, '2024-05-25', '2024-05-28', 'Delivering', 'nguyen van a', '0978654321', ' Hương Quất ,Khoái Châu, Hưng yên'),
(23, 42, '2024-05-25', '2024-05-28', 'Processed', 'Lê Thu Phương', '0978654321', ' Hương Quất ,Khoái Châu, Hưng yên'),
(24, 2, '2024-05-25', '2024-05-28', 'Delivered', 'tran thi b', '0845632971', ' cầu giấy, hà nội');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `orderId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `productPrice` decimal(10,0) NOT NULL,
  `productName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `productImage` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `orderId`, `productId`, `qty`, `productPrice`, `productName`, `productImage`) VALUES
(1, 1, 19, 5, '8200000', 'Hạt Charm Vàng 14K đính đá Synthetic PNJ ❤️ HELLO KITTY ZT00X000002', 'charm_1.jpg'),
(22, 19, 31, 1, '795000', 'Lắc tay trẻ em Bạc đính đá PNJSilver XMXMW060168', 'lac_2.png'),
(23, 19, 39, 1, '895000', 'Lắc tay Bạc đính đá Disney|PNJ Aristocats ZTXMW060001', 'lac_10.png'),
(24, 20, 46, 1, '47700000', 'Kiềng Vàng Ý 18K PNJ 0000Z060180', 'kieng_10.png'),
(25, 21, 31, 1, '795000', 'Lắc tay trẻ em Bạc đính đá PNJSilver XMXMW060168', 'lac_2.png'),
(26, 21, 48, 1, '65990000', 'Kiềng Vàng trắng Ý 18K PNJ 0000W060282', 'kieng_11.png'),
(27, 22, 88, 1, '362000000', 'Kiềng Kim cương Vàng Trắng 18K PNJ DDDDW060004', 'kieng_8.png'),
(28, 23, 58, 1, '16900000', 'Vòng tay Vàng Trắng 10K đính đá ECZ PNJ Audax Rosa XMXMW001179', 'vong_7.png'),
(29, 24, 22, 1, '5456000', 'Hạt Charm Vàng 14K đính đá Synthetic PNJ ❤️ HELLO KITTY ZT00H000001', 'charm_4.jpg'),
(30, 24, 21, 1, '3198000', 'Hạt Charm Vàng 14K đính đá ECZ PNJ ❤️ HELLO KITTY XM00X000006', 'charm_3.jpg'),
(31, 24, 41, 1, '26990000', 'Vòng tay Vàng Trắng 10K đính đá ECZ PNJ XMXMW001107', 'vong_4.png'),
(32, 24, 114, 1, '1', 'test', '2bf8f8b706.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `originalPrice` decimal(10,0) NOT NULL,
  `promotionPrice` decimal(10,0) NOT NULL,
  `image` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `createdBy` int(11) NOT NULL,
  `createdDate` date NOT NULL,
  `cateId` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `des` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `soldCount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `originalPrice`, `promotionPrice`, `image`, `createdBy`, `createdDate`, `cateId`, `qty`, `des`, `status`, `soldCount`) VALUES
(19, 'Hạt Charm Vàng 14K đính đá Synthetic PNJ ❤️ HELLO KITTY ZT00X000002', '8850000', '8200000', 'charm_1.jpg', 1, '2023-05-18', 12, 9, '', 1, 0),
(20, 'Hạt Charm Vàng 14K đính đá Synthetic PNJ ❤️ HELLO KITTY ZT00H000002', '5000000', '4475000', 'charm_2.jpg', 1, '2023-05-18', 12, 15, '', 1, 0),
(21, 'Hạt Charm Vàng 14K đính đá ECZ PNJ ❤️ HELLO KITTY XM00X000006', '3500000', '3198000', 'charm_3.jpg', 1, '2023-05-18', 12, 15, '', 1, 5),
(22, 'Hạt Charm Vàng 14K đính đá Synthetic PNJ ❤️ HELLO KITTY ZT00H000001', '5800000', '5456000', 'charm_4.jpg', 1, '2023-05-18', 12, 0, '', 1, 12),
(23, 'Hạt Charm Vàng 14K đính đá Synthetic PNJ ❤️ HELLO KITTY ZTXMH000002', '6525000', '6300000', 'charm_5.jpg', 1, '2023-05-18', 12, 8, '', 1, 0),
(24, 'Hạt Charm Bạc đính đá STYLE By PNJ Lucky Me ZTXMH000002', '900000', '855000', 'charm_6.jpg', 1, '2023-05-18', 12, 20, '', 1, 0),
(25, 'Hạt Charm Bạc đính đá STYLE By PNJ Lucky Me ZT00W000022', '810000', '795000', 'charm_7.jpg', 1, '2023-05-18', 12, 22, '', 1, 0),
(26, 'Hạt Charm Bạc đính đá STYLE By PNJ XM00W060022', '410000', '395000', 'charm_8.jpg', 1, '2023-05-18', 12, 10, '', 1, 0),
(27, 'Hạt charm Bạc đính đá STYLE by PNJ General XMXMW060414', '410000', '395000', 'charm_9.jpg', 1, '2023-05-19', 12, 8, '', 1, 0),
(28, 'Hạt charm Bạc đính đá STYLE By PNJ General XMXMC060013', '480000', '455000', 'charm_10.jpg', 1, '2023-05-19', 12, 3, '', 1, 64),
(29, 'Mặt dây chuyền Kim cương Vàng Trắng 14K PNJ chữ P DD00W000645', '8500000', '7690000', 'matdaychuyen_1.png', 1, '2024-05-26', 8, 15, '', 1, 2),
(30, 'Lắc tay nam Bạc PNJSilver 0000W060212', '1890000', '1795000', 'lac_1.png', 1, '2023-05-19', 10, 20, '', 1, 2),
(31, 'Lắc tay trẻ em Bạc đính đá PNJSilver XMXMW060168', '810000', '795000', 'lac_2.png', 1, '2023-05-20', 10, 36, '', 1, 2),
(32, 'Lắc tay Bạc PNJSilver 0000W060211', '1300000', '1195000', 'lac_3.png', 1, '2023-05-20', 10, 19, '', 1, 2),
(33, 'Lắc tay nam bạc PNJSilver 0000W060210', '2050000', '1915000', 'lac_4.png', 1, '2023-05-25', 10, 15, '', 1, 0),
(34, 'Lắc tay bạc trẻ em đính đá PNJSilver XMXMW060169', '890000', '795000', 'lac_5.png', 1, '2023-05-25', 10, 14, '', 1, 1),
(35, 'Lắc tay trẻ em Bạc Disney|PNJ Dumbo 0000X060015', '1100000', '995000', 'lac_6.png', 1, '2023-05-25', 10, 25, '', 1, 0),
(36, 'Lắc tay trẻ em Bạc đính đá Disney|PNJ Dumbo ZT00W060000', '920000', '895000', 'lac_7.png', 1, '2023-05-25', 10, 30, '', 1, 0),
(37, 'Lắc tay trẻ em Bạc đính đá Disney|PNJ 101 Dalmatians XM00C060004', '1200000', '1095000', 'lac_8.png', 1, '2023-05-25', 10, 28, '', 1, 0),
(38, 'Lắc tay trẻ em Bạc đính đá Disney|PNJ 101 Dalmatians ZTXMW060002', '1050000', '1195000', 'lac_9.png', 1, '2023-05-25', 10, 10, '', 1, 0),
(39, 'Lắc tay Bạc đính đá Disney|PNJ Aristocats ZTXMW060001', '920000', '895000', 'lac_10.png', 1, '2023-05-25', 10, 29, '', 1, 1),
(40, 'Vòng tay Bạc đính đá PNJSilver XM00W060003', '1800000', '1650000', 'vong_3.png', 1, '2023-05-25', 13, 46, '', 1, 0),
(41, 'Vòng tay Vàng Trắng 10K đính đá ECZ PNJ XMXMW001107', '28000000', '26990000', 'vong_4.png', 1, '2023-05-25', 13, 97, '', 1, 3),
(42, 'Vòng tay Vàng 18K đính đá Citrine PNJ Audax Rosa CTXMC000004', '68550000', '66999000', 'vong_5.png', 1, '2023-05-25', 13, 88, '', 1, 0),
(43, 'Vòng tay Kim cương Vàng 14K PNJ Audax Rosa DDDDH000037', '58999999', '57860000', 'vong_6.png', 1, '2023-05-25', 13, 65, '', 1, 0),
(44, 'Vòng tay Vàng 10K đính đá ECZ PNJ Audax Rosa XMXMC000285', '22950000', '21485000', 'vong_11.png', 1, '2023-05-25', 13, 50, '', 1, 0),
(45, 'Kiềng Vàng trắng Ý 18K PNJ 0000W060281', '48999000', '47999000', 'kieng_12.png', 1, '2023-05-25', 11, 100, '', 1, 0),
(46, 'Kiềng Vàng Ý 18K PNJ 0000Z060180', '48000000', '47700000', 'kieng_10.png', 1, '2023-05-25', 11, 99, '', 1, 1),
(47, 'Bông tai Kim cương Vàng trắng 14K PNJ DDDDW060388', '14500000', '14030000', 'bongtai_1.png', 1, '2023-05-25', 9, 25, '', 1, 5),
(48, 'Kiềng Vàng trắng Ý 18K PNJ 0000W060282', '67000000', '65990000', 'kieng_11.png', 1, '2023-05-25', 11, 99, '', 1, 0),
(49, '\r\nBông tai Bạc đính đá Disney|PNJ Bambi XM00W060019', '700000', '595000', 'bongtai_2.png', 1, '2024-04-25', 9, 15, '', 1, 7),
(50, 'Bông tai Vàng 14K đính đá Synthetic PNJ ❤️ HELLO KITTY ZTXMH000017', '6000000', '5130000', 'bongtai_3.png', 1, '2024-05-26', 9, 20, '', 1, 2),
(51, 'Bông tai bạc trẻ em đính đá PNJSilver XMXMW060212', '800000', '695000', 'bongtai_4.png', 1, '2023-05-26', 9, 30, '', 1, 3),
(52, 'Bông tai trẻ em Bạc Disney|PNJ Aristocats 0000W060055', '800000', '595000', 'bongtai_5.png', 1, '2028-05-26', 9, 20, '', 1, 6),
(53, 'Bông tai Vàng 14K đính đá Synthetic PNJ ❤️ HELLO KITTY ZT00X000017', '4000000', '3409000', 'bongtai_6.png', 1, '2024-05-26', 9, 35, '', 1, 5),
(54, 'Vòng tay Vàng Trắng 14K đính đá Topaz PNJ Audax Rosa TPMXW000007', '110000000', '109800000', 'vong_10.png', 1, '2023-05-26', 13, 56, '', 1, 0),
(55, 'Bông tai trẻ em Bạc đính đá PNJSilver XMXMW060211', '500000', '375000', 'bongtai_7.png', 1, '2024-05-26', 9, 50, '', 1, 15),
(56, 'Vòng tay Vàng 10K đính đá ECZ PNJ Niềm tin XMXMH000111', '15000000', '14600000', 'vong_9.png', 1, '2023-05-26', 13, 41, '', 1, 0),
(57, 'Vòng tay Kim cương Vàng Trắng 14K Disney|PNJ Cinderella DD00W000313', '24000000', '23280000', 'vong_8.png', 1, '2023-05-26', 13, 32, '', 1, 0),
(58, 'Vòng tay Vàng Trắng 10K đính đá ECZ PNJ Audax Rosa XMXMW001179', '18550000', '16900000', 'vong_7.png', 1, '2023-05-26', 13, 42, '', 1, 0),
(59, 'Bông tai Bạc đính đá STYLE By PNJ Lucky Me ZT00W000019', '800000', '625000', 'bongtai_8.png', 1, '2024-05-26', 9, 40, '', 1, 17),
(60, 'Bông tai Vàng Trắng 10K Đính đá synthetic STYLE By PNJ Love Potion ZTZTW000009', '3000000', '2667000', 'bongtai_9.png', 1, '2024-05-26', 9, 15, '', 1, 1),
(61, 'Bông tai Bạc đính đá STYLE by PNJ Feminine XM00W060020', '500000', '350000', 'bongtai_10.png', 1, '2024-05-26', 9, 20, '', 1, 3),
(62, 'Vòng tay Vàng trắng Ý 18K PNJ 0000W060428', '26320000', '25890000', 'vong_14.png', 1, '2023-05-26', 13, 38, '', 1, 0),
(63, 'Vòng tay trẻ em Vàng 10K PNJ 0000Y001293', '4700000', '4320000', 'vong_13.png', 1, '2023-05-26', 13, 14, '', 1, 1),
(64, 'Vòng tay Vàng 10K đính đá Synthetic PNJ Sunnyva ZTXMY000620', '21000000', '20700000', 'vong_12.png', 1, '2023-05-26', 13, 55, '', 1, 0),
(65, '\r\nMặt dây chuyền Vàng 14K đính đá Sapphire PNJ SP00X000002', '8000000', '7190000', 'matdaychuyen_2.png', 1, '2024-05-26', 8, 10, '', 1, 2),
(66, 'Mặt dây chuyền Bạc đính đá PNJSilver QTXMW060004', '600000', '455000', 'matdaychuyen_3.png', 1, '2024-05-26', 8, 10, '', 1, 3),
(67, 'Mặt dây chuyền Vàng Trắng 14K đính Ngọc trai Freshwater PNJ PFXMW000285', '6500000', '5275000', 'matdaychuyen_4.png', 1, '2024-05-26', 8, 5, '', 1, 0),
(68, 'Mặt dây chuyền Vàng 10K đính đá ECZ PNJ Niềm tin XMXMH000222', '7000000', '4676000', 'matdaychuyen_5.png', 1, '2024-05-27', 8, 20, '', 1, 6),
(69, 'Mặt dây chuyền trẻ em Vàng trắng 10K Disney|PNJ Mickey & Minnie 0000W001070', '3000000', '1975000', 'matdaychuyen_6.png', 1, '2024-05-27', 8, 15, '', 1, 6),
(70, 'Mặt dây chuyền Vàng 10K đính đá ECZ STYLE by PNJ XMXMX000024', '2500000', '2135600', 'matdaychuyen_7.png', 1, '2024-05-27', 8, 10, '', 1, 3),
(71, 'Mặt dây chuyền Vàng trắng 14K đính ngọc trai Freshwater PNJ PFXMW000261', '5200000', '4849000', 'matdaychuyen_8.png', 1, '2024-05-27', 8, 12, '', 1, 5),
(72, 'Mặt dây chuyền bạc đính đá PNJSilver Euphoria XMXMC000020', '70000', '595000', 'matdaychuyen_9.png', 1, '2024-05-27', 8, 20, '', 1, 10),
(73, 'Mặt dây chuyền Vàng 14K đính đá Đá Moon PNJ MOXMX000023', '6000000', '5243000', 'matdaychuyen_10.png', 1, '2024-05-26', 8, 10, '', 1, 1),
(75, 'Nhẫn trẻ em Bạc đính đá PNJSilver XMXMW060163', '420000', '375000', 'nhan_1.png', 1, '2024-05-27', 6, 30, '', 1, 12),
(76, 'Nhẫn trẻ em bạc đính đá PNJSilver XMXMW060164', '550000', '445000', 'nhan_2.png', 1, '2024-05-27', 6, 20, '', 1, 6),
(77, 'Nhẫn Vàng 14K đính đá Synthetic PNJ ❤️ HELLO KITTY ZTXMX000013', '5200000', '4904000', 'nhan_3.png', 1, '2024-05-27', 6, 15, '', 1, 1),
(78, 'Nhẫn Bạc đính đá PNJSilver XMXMW060161', '540000', '495000', 'nhan_4.png', 1, '2024-05-27', 6, 20, '', 1, 5),
(79, '\r\nNhẫn Kim cương Vàng trắng 14K PNJ DDDDW060595', '13200000', '12950000', 'nhan_5.png', 1, '2024-05-27', 6, 12, '', 1, 7),
(80, 'Nhẫn Bạc đính đá STYLE By PNJ Lucky Me ZTXMW000023', '670000', '575000', 'nhan_7.png', 1, '2024-05-28', 6, 20, '', 1, 5),
(81, '\r\nNhẫn Vàng 18K đính đá ECZ PNJ XMXMY010578', '7200000', '6356000', 'nhan_6.png', 1, '2024-05-27', 6, 20, '', 1, 3),
(82, 'Nhẫn Vàng 14K Đính đá Peridot Disney|PNJ The Princess and the Frog NP00Y000019', '6450000', '5965000', 'nhan_8.png', 1, '2024-05-27', 6, 5, '', 1, 1),
(83, '\r\nNhẫn Vàng Trắng 14K đính Ngọc trai Freshwater PNJ PFXMW000273', '5500000', '5250000', 'nhan_9.png', 1, '2024-05-27', 6, 7, '', 1, 2),
(84, 'Nhẫn Vàng 14K Đính đá synthetic Disney|PNJ Beauty & The Beast ZTXMX000010', '5200000', '4475000', 'nhan10.png', 1, '2024-05-27', 6, 10, '', 1, 6),
(85, '\r\nNhẫn Vàng Trắng 10K Đính đá synthetic STYLE By PNJ Active ZTMXW000025', '2550000', '2234000', 'nhan_11.png', 1, '2024-05-27', 6, 20, '', 1, 12),
(86, 'Dây chuyền Vàng trắng 10K PNJ 0000W001067', '2700000', '2250000', 'daychuyen_1.png', 1, '2024-05-27', 7, 10, '', 1, 5),
(87, 'Dây chuyền nam Vàng trắng Ý 18K PNJ 0000W061242', '12350000', '11750000', 'day.png', 1, '2024-05-27', 7, 15, '', 1, 2),
(88, 'Kiềng Kim cương Vàng Trắng 18K PNJ DDDDW060004', '365000000', '362000000', 'kieng_8.png', 1, '2023-05-26', 11, 99, '  ', 1, 0),
(89, 'Dây chuyền Vàng Ý 18K PNJ 0000C060130', '9500000', '8000000', 'daychuyen_4.png', 1, '2024-05-27', 7, 10, '', 1, 4),
(90, 'Dây chuyền Vàng trắng Ý 18K PNJ 0000W000535', '7700000', '7294000', 'daychuyen_3.png', 1, '2024-05-27', 7, 20, '', 1, 3),
(91, 'Kiềng Vàng Ý 18K PNJ 0000Z060181', '48200000', '47500000', 'kieng_9.png', 1, '2023-05-26', 11, 52, '  ', 1, 0),
(92, 'Kiềng cưới Vàng 18K đính đá ECZ PNJ Trầu Cau XMXMY000036', '62000000', '60500000', 'kieng_1.png', 1, '2023-05-26', 11, 50, ' ', 1, 2),
(93, 'Kiềng cưới Vàng 18K PNJ Trầu Cau 0000Y000229', '51000000', '50500000', 'kieng_2.png', 1, '2023-05-26', 11, 46, '  ', 1, 0),
(94, 'Kiềng bạc Ý PNJSilver kiểu lượn sóng 0000W060017', '999000', '859000', 'kieng_7.png', 1, '2023-05-26', 11, 123, '  ', 1, 0),
(95, 'Kiềng Vàng trắng Ý 18K PNJ 0000W060260', '28000000', '27300000', 'kieng_3.png', 1, '2023-05-26', 11, 123, '  ', 1, 0),
(96, 'Kiềng cưới Vàng 24K PNJ 0000Y060008', '26000000', '24990000', 'kieng_4.png', 1, '2023-05-26', 11, 78, '  ', 1, 0),
(97, 'Kiềng cưới Vàng 24K PNJ 0000Y060105', '16500000', '15900000', 'kieng_5.png', 1, '2023-05-26', 11, 83, '  ', 1, 0),
(98, 'Kiềng cưới vàng 24K PNJ 0000Y060104', '23900000', '23000000', 'kieng_6.png', 1, '2023-05-26', 11, 122, '  ', 1, 1),
(99, 'Dây chuyền Vàng trắng Ý 18K PNJ 0000W000807', '8000000', '7200000', 'daychuyen_5.png', 1, '2024-05-27', 7, 10, '', 1, 4),
(100, 'Dây chuyền Nam Vàng 18K PNJ 0000Y060481', '15000000', '13200000', 'daychuyen_6.png', 1, '2024-05-27', 7, 15, '', 1, 0),
(101, 'Hạt Charm Bạc đính đá STYLE By PNJ Love Potion ZT00W000025', '450000', '420000', 'charm_11.jpg', 1, '2023-05-26', 12, 14, '', 1, 1),
(102, 'Dây chuyền Vàng 14K PNJ 0000Y060530', '10900000', '9500000', 'daychuyen_8.png', 1, '2024-05-27', 7, 10, '', 1, 6),
(103, 'Dây chuyền Vàng Ý 18K PNJ 0000Y060507', '12000000', '11600000', 'daychuyen_9.png', 1, '2024-05-27', 7, 15, '', 1, 2),
(104, 'Nhẫn Vàng trắng 14K đính đá Topaz PNJ TPXMW000659', '7600000', '6800000', 'nhan_13.png', 1, '2024-05-27', 6, 10, '', 1, 3),
(109, 'Vòng tay Bạc đính đá PNJSilver XM00W060004', '2200000', '2095000', 'vong_2.png', 1, '2023-05-26', 13, 90, '', 1, 0),
(110, 'Vòng tay Vàng Trắng 10K đính đá ECZ PNJ Kim Bảo Như Ý XMXMW001199', '14500000', '13990000', 'vong_1.png', 1, '2023-05-26', 13, 100, '', 1, 0),
(114, 'Lắc tay nam Bạc đính đá PNJSilver XM00W000015', '3560000', '3490000', 'lac_11.png', 1, '2024-05-25', 10, 10, '', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(1, 'Admin'),
(2, 'Normal'),
(3, 'Staff');

-- --------------------------------------------------------

--
-- Table structure for table `statistical`
--

CREATE TABLE `statistical` (
  `id` int(11) NOT NULL,
  `order_date` varchar(100) NOT NULL,
  `sales` varchar(200) NOT NULL,
  `profit` varchar(200) NOT NULL,
  `quantity` int(11) NOT NULL,
  `total_order` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `statistical`
--

INSERT INTO `statistical` (`id`, `order_date`, `sales`, `profit`, `quantity`, `total_order`) VALUES
(1, '2023-06-08', '16000000', '5600000', 90, 10),
(2, '2023-06-07', '54400000', '7200000', 60, 8),
(3, '2023-06-06', '24000000', '2400000', 45, 7),
(4, '2023-06-05', '36000000', '3040000', 30, 9),
(5, '2023-06-04', '24000000', '1200000', 15, 12),
(6, '2023-06-03', '6400000', '560000', 65, 30),
(7, '2023-06-02', '22400000', '18400000', 32, 20),
(8, '2023-06-01', '20000000', '16000000', 7, 6),
(9, '2023-05-31', '28800000', '22400000', 40, 15),
(10, '2023-05-30', '40000000', '10400000', 89, 19),
(11, '2023-05-29', '16000000', '12000000', 63, 11),
(12, '2023-05-28', '20000000', '12800000', 94, 14),
(13, '2023-05-27', '25600000', '13600000', 16, 10),
(14, '2023-05-26', '26400000', '15200000', 14, 5),
(15, '2023-05-25', '28800000', '14400000', 22, 12),
(16, '2023-05-24', '27200000', '16000000', 33, 20),
(17, '2023-05-23', '20000000', '12800000', 94, 14),
(18, '2023-05-22', '9600000', '5600000', 16, 10),
(19, '2023-05-21', '50400000', '15200000', 14, 5),
(20, '2023-05-20', '52800000', '14400000', 22, 12),
(21, '2023-05-19', '59200000', '16000000', 33, 20),
(22, '2023-05-18', '50400000', '15200000', 14, 5),
(23, '2023-05-17', '52800000', '14400000', 23, 12),
(24, '2023-05-16', '59200000', '16000000', 32, 20),
(25, '2023-05-15', '50400000', '15200000', 14, 5),
(26, '2023-05-14', '52800000', '14400000', 23, 12),
(27, '2023-05-13', '59200000', '16000000', 33, 20),
(28, '2023-05-12', '52800000', '14400000', 23, 12),
(29, '2023-05-11', '59200000', '16000000', 10, 20),
(30, '2023-05-10', '50400000', '15200000', 14, 5),
(31, '2023-05-09', '52800000', '14400000', 23, 12),
(32, '2023-05-08', '59200000', '16000000', 15, 20),
(33, '2023-05-07', '52800000', '14400000', 23, 12),
(34, '2023-05-06', '59200000', '16000000', 30, 22),
(35, '2023-05-05', '52800000', '14400000', 23, 12),
(36, '2023-05-04', '59200000', '16000000', 32, 20),
(37, '2023-05-03', '50400000', '15200000', 14, 5),
(38, '2023-05-02', '52800000', '14400000', 23, 12),
(39, '2023-05-01', '59200000', '16000000', 32, 20),
(40, '2023-04-30', '50400000', '15200000', 14, 5),
(41, '2023-04-29', '52800000', '14400000', 23, 12),
(42, '2023-04-28', '59200000', '16000000', 15, 20),
(43, '2023-04-27', '52800000', '14400000', 23, 12),
(44, '2023-04-26', '59200000', '16000000', 30, 22),
(45, '2023-04-25', '52800000', '14400000', 23, 12),
(46, '2023-04-24', '59200000', '16000000', 32, 20),
(47, '2023-04-23', '50400000', '15200000', 14, 5),
(48, '2023-04-22', '52800000', '14400000', 23, 12),
(49, '2023-04-21', '59200000', '16000000', 32, 20),
(50, '2023-04-20', '50400000', '15200000', 14, 5),
(51, '2023-04-19', '52800000', '14400000', 23, 12),
(52, '2023-04-18', '59200000', '16000000', 15, 20),
(53, '2023-04-17', '52800000', '14400000', 23, 12),
(54, '2023-04-16', '59200000', '16000000', 30, 22),
(55, '2023-04-15', '52800000', '14400000', 23, 12),
(56, '2023-04-14', '59200000', '16000000', 32, 20),
(57, '2023-04-13', '50400000', '15200000', 14, 5),
(58, '2023-04-12', '52800000', '14400000', 23, 12),
(59, '2023-04-11', '59200000', '16000000', 32, 20),
(60, '2023-04-10', '50400000', '15200000', 14, 5),
(61, '2023-04-09', '52800000', '14400000', 23, 12),
(62, '2023-04-08', '59200000', '16000000', 15, 20),
(63, '2023-04-07', '52800000', '14400000', 23, 12),
(64, '2023-04-06', '59200000', '16000000', 30, 22),
(65, '2023-04-05', '52800000', '14400000', 23, 12),
(66, '2023-04-04', '59200000', '16000000', 32, 20),
(67, '2023-04-03', '50400000', '15200000', 14, 5),
(68, '2023-04-02', '52800000', '14400000', 23, 12),
(69, '2023-06-10', '14400000', '5600000', 90, 10),
(70, '2023-06-11', '12000000', '7200000', 60, 8),
(71, '2023-06-12', '16800000', '2400000', 45, 7),
(72, '2023-06-13', '30400000', '3040000', 30, 9),
(73, '2023-06-14', '22800000', '1200000', 15, 12),
(74, '2023-06-15', '5840000', '560000', 65, 30),
(75, '2023-06-16', '400000', '18400000', 32, 20),
(76, '2023-06-17', '4000000', '16000000', 7, 6),
(77, '2023-06-18', '6400000', '22400000', 40, 15),
(78, '2023-06-19', '1200000', '10400000', 89, 19),
(79, '2023-06-20', '4000000', '12000000', 63, 11),
(80, '2023-06-21', '7200000', '12800000', 94, 14),
(81, '2023-06-22', '12000000', '13600000', 16, 10),
(82, '2023-06-23', '11200000', '15200000', 14, 5),
(83, '2023-06-24', '14400000', '14400000', 22, 12),
(84, '2024-05-28', '47700000', '47700000', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `fullname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `dob` date NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `role_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `address` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `isConfirmed` tinyint(4) NOT NULL DEFAULT '0',
  `captcha` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `fullname`, `dob`, `password`, `role_id`, `status`, `address`, `isConfirmed`, `captcha`) VALUES
(1, 'admin@gmail.com', 'Admin', '0000-00-00', '1', 1, 1, '', 1, ''),
(2, 'staff@gmail.com', 'Staff', '2003-11-07', '1', 3, 1, 'Quảng Ninh', 1, '56666'),
(11, 'lethuphuong07072003@gmail.com', 'Lê Thu Phương', '2003-05-01', '1', 3, 1, '', 1, ''),
(35, 'user11@gmail.com', 'User le', '2002-09-22', '11', 2, 1, 'Minh Khai, Bắc Từ Liêm, Hà Nội', 1, '87909'),
(42, 'admin2@gmail.com', 'Admin 2', '2003-09-18', '1', 1, 1, 'Văn Trì, Bắc Từ Liêm, Hà Nội', 1, '59682'),
(78, 'hocanhcta123@gmail.com', 'nguyen van a', '1994-01-05', 'a', 2, 1, 'Hưng yên', 1, '20249');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`userId`),
  ADD KEY `product_id` (`productId`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chatbot`
--
ALTER TABLE `chatbot`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`userId`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`orderId`),
  ADD KEY `product_id` (`productId`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cate_id` (`cateId`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `statistical`
--
ALTER TABLE `statistical`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `chatbot`
--
ALTER TABLE `chatbot`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `statistical`
--
ALTER TABLE `statistical`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`cateId`) REFERENCES `categories` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

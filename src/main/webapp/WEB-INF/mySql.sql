create database jewelap;
--
-- Cấu trúc bảng cho bảng `account`
--

CREATE TABLE `account` (
  `account_id` int(11) NOT NULL,
  `gmail` varchar(40) NOT NULL,
  `password` text NOT NULL,
  `full_name` varchar(50) NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `phone` int(11) NOT NULL,
  `dob` date NOT NULL,
  `date_create` date NOT NULL,
  `date_modify` date DEFAULT NULL,
  `create_by` varchar(50) NOT NULL,
  `modify_by` varchar(50) DEFAULT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `account_notification`
--

CREATE TABLE `account_notification` (
  `id` int(11) NOT NULL,
  `date_create` date NOT NULL,
  `date_modify` date DEFAULT NULL,
  `create_by` varchar(50) NOT NULL,
  `modify_by` varchar(50) DEFAULT NULL,
  `account_name` varchar(40) NOT NULL,
  `notification_id` int(11) NOT NULL,
  `viewed` tinyint(1) NOT NULL,
  `removed` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `account_role`
--

CREATE TABLE `account_role` (
  `id` int(11) NOT NULL,
  `account_name` varchar(40) NOT NULL,
  `role_name` varchar(50) NOT NULL,
  `date_create` date NOT NULL,
  `date_modify` date DEFAULT NULL,
  `create_by` varchar(50) NOT NULL,
  `modify_by` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `address`
--

CREATE TABLE `address` (
  `id` int(11) NOT NULL,
  `date_create` date NOT NULL,
  `date_modify` date DEFAULT NULL,
  `create_by` varchar(50) NOT NULL,
  `modify_by` varchar(50) DEFAULT NULL,
  `account_name` varchar(50) NOT NULL,
  `address` varchar(200) NOT NULL,
  `type` varchar(50) NOT NULL,
  `instruction` text DEFAULT NULL,
  `zip_code` char(6) NOT NULL,
  `state_province` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `blog`
--

CREATE TABLE `blog` (
  `id` int(11) NOT NULL,
  `dateCreated` date DEFAULT NULL,
  `createdby` varchar(50) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `title` varchar(50) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `imageUrl` varchar(50) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `date_create` date NOT NULL,
  `date_modify` date DEFAULT NULL,
  `create_by` varchar(50) NOT NULL,
  `modify_by` varchar(50) DEFAULT NULL,
  `category_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`id`, `date_create`, `date_modify`, `create_by`, `modify_by`, `category_name`) VALUES
(1, '2019-10-09', NULL, 'test', NULL, 'Ring');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `title` varchar(50) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `question` text COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `answer` text COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `createdby` varchar(50) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `dateCreated` date DEFAULT NULL,
  `dateModify` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `diamond`
--

CREATE TABLE `diamond` (
  `id` int(11) NOT NULL,
  `date_create` date NOT NULL,
  `date_modify` date DEFAULT NULL,
  `create_by` varchar(50) NOT NULL,
  `modify_by` varchar(50) DEFAULT NULL,
  `product_name` varchar(50) NOT NULL,
  `carat` float(5,3) NOT NULL,
  `total_number` int(11) NOT NULL,
  `total_weight` float(5,3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `diamond`
--

INSERT INTO `diamond` (`id`, `date_create`, `date_modify`, `create_by`, `modify_by`, `product_name`, `carat`, `total_number`, `total_weight`) VALUES
(5, '2019-10-13', NULL, 'test', NULL, 'Halo Diamond Band', 0.030, 45, 0.320),
(8, '2019-10-13', NULL, 'test', NULL, 'Haze Elegance Ring', 0.050, 10, 0.020),
(9, '2019-10-13', NULL, 'test', NULL, 'Marvel Solitaire Ring', 0.008, 8, 0.012),
(10, '2019-10-13', NULL, 'test', NULL, 'Marvel Solitaire Ring', 0.210, 1, 0.042),
(11, '2019-10-13', NULL, 'test', NULL, 'Azure Royal Ring', 0.004, 12, 0.010),
(12, '2019-10-13', NULL, 'test', NULL, 'Linear Diamond Band', 0.007, 60, 0.088);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `diamond_option`
--

CREATE TABLE `diamond_option` (
  `id` int(11) NOT NULL,
  `date_create` date NOT NULL,
  `date_modify` date DEFAULT NULL,
  `create_by` varchar(50) NOT NULL,
  `modify_by` varchar(50) DEFAULT NULL,
  `rate` decimal(10,2) NOT NULL,
  `diamond_type` varchar(50) NOT NULL,
  `product_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `diamond_option`
--

INSERT INTO `diamond_option` (`id`, `date_create`, `date_modify`, `create_by`, `modify_by`, `rate`, `diamond_type`, `product_name`) VALUES
(13, '2019-10-13', NULL, 'test', NULL, '2370.50', 'IJ-SI Round', 'Halo Diamond Band'),
(14, '2019-10-13', NULL, 'test', NULL, '1393.43', 'GH-VS Round', 'Halo Diamond Band'),
(15, '2019-10-13', NULL, 'test', NULL, '1470.84', 'GH-VSS Round', 'Halo Diamond Band'),
(16, '2019-10-13', NULL, 'test', NULL, '1618.63', 'EF-VVS Round', 'Halo Diamond Band'),
(17, '2019-10-13', NULL, 'test', NULL, '1013.40', 'IJ-SI Round', 'Haze Elegance Ring'),
(18, '2019-10-13', NULL, 'test', NULL, '1393.43', 'GH-VS Round', 'Haze Elegance Ring'),
(19, '2019-10-13', NULL, 'test', NULL, '1470.84', 'GH-VVS', 'Haze Elegance Ring'),
(20, '2019-10-13', NULL, 'test', NULL, '1618.63', 'EF-VVS Round', 'Haze Elegance Ring'),
(21, '2019-10-13', NULL, 'test', NULL, '1013.40', 'IJ-SI Round', 'Azure Royal Ring'),
(22, '2019-10-13', NULL, 'test', NULL, '1393.43', 'GH-VS Round', 'Azure Royal Ring'),
(23, '2019-10-13', NULL, 'test', NULL, '1470.84', 'GH-VVS', 'Azure Royal Ring'),
(24, '2019-10-13', NULL, 'test', NULL, '1618.63', 'EF-VVS Round', 'Azure Royal Ring'),
(25, '2019-10-13', NULL, 'test', NULL, '1013.40', 'IJ-SI Round', 'Linear Diamond Band'),
(26, '2019-10-13', NULL, 'test', NULL, '1393.43', 'GH-VS Round', 'Linear Diamond Band'),
(27, '2019-10-13', NULL, 'test', NULL, '1470.84', 'GH-VVS', 'Linear Diamond Band'),
(28, '2019-10-13', NULL, 'test', NULL, '1618.63', 'EF-VVS Round', 'Linear Diamond Band'),
(29, '2019-10-13', NULL, 'test', NULL, '1013.40', 'IJ-SI', 'Marvel Solitaire Ring');

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `diamond_view`
-- (See below for the actual view)
--
CREATE TABLE `diamond_view` (
`product_name` varchar(50)
,`rate` decimal(10,2)
,`diamond_type` varchar(50)
,`total_weight` double(20,3)
,`price` double(19,2)
);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `discount`
--

CREATE TABLE `discount` (
  `id` int(11) NOT NULL,
  `productID` int(11) DEFAULT NULL,
  `discountValue` int(11) DEFAULT 0,
  `discountStartDate` date DEFAULT NULL,
  `discountEndDate` date DEFAULT NULL,
  `dateCreated` date DEFAULT NULL,
  `dateModify` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `discount`
--

INSERT INTO `discount` (`id`, `productID`, `discountValue`, `discountStartDate`, `discountEndDate`, `dateCreated`, `dateModify`) VALUES
(1, 1, 10, '2018-05-14', '2018-05-14', '2017-01-28', '2018-05-14');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `gemstone`
--

CREATE TABLE `gemstone` (
  `id` int(11) NOT NULL,
  `date_create` date NOT NULL,
  `date_modify` date DEFAULT NULL,
  `create_by` varchar(50) NOT NULL,
  `modify_by` varchar(50) DEFAULT NULL,
  `width` float(5,2) NOT NULL,
  `lenght` float(5,2) NOT NULL,
  `total_number` int(11) NOT NULL,
  `total_weight` float(5,2) NOT NULL,
  `carat` float(5,2) NOT NULL,
  `product_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `gemstone`
--

INSERT INTO `gemstone` (`id`, `date_create`, `date_modify`, `create_by`, `modify_by`, `width`, `lenght`, `total_number`, `total_weight`, `carat`, `product_name`) VALUES
(1, '2019-10-13', NULL, 'test', NULL, 7.00, 5.00, 1, 0.21, 1.07, 'Azure Royal Ring'),
(2, '2019-10-13', NULL, 'test', NULL, 5.00, 7.00, 1, 0.30, 1.48, 'Haze Elegance Ring'),
(3, '2019-10-13', NULL, 'test', NULL, 7.14, 3.00, 10, 0.40, 0.20, 'Azure Royal Ring');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `gemstone_option`
--

CREATE TABLE `gemstone_option` (
  `id` int(11) NOT NULL,
  `date_create` date NOT NULL,
  `date_modify` date DEFAULT NULL,
  `create_by` varchar(50) NOT NULL,
  `modify_by` varchar(50) DEFAULT NULL,
  `rate` decimal(10,2) NOT NULL,
  `gemstone_type` varchar(50) NOT NULL,
  `product_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `gemstone_option`
--

INSERT INTO `gemstone_option` (`id`, `date_create`, `date_modify`, `create_by`, `modify_by`, `rate`, `gemstone_type`, `product_name`) VALUES
(1, '2019-10-13', NULL, 'test', NULL, '86.23', 'Blue Synthetic Sapphire ', 'Azure Royal Ring'),
(2, '2019-10-13', NULL, 'test', NULL, '147.79', 'Blue Synthetic Sapphire', 'Haze Elegance Ring'),
(3, '2019-10-13', NULL, 'test', NULL, '98.50', 'Blue Synthetic Ruby', 'Azure Royal Ring');

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `gemstone_view`
-- (See below for the actual view)
--
CREATE TABLE `gemstone_view` (
`id` int(11)
,`product_name` varchar(50)
,`gemstone_type` varchar(50)
,`rate` decimal(10,2)
,`price` double(19,2)
,`total_weight` double(19,2)
);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `image`
--

CREATE TABLE `image` (
  `id` int(11) NOT NULL,
  `date_create` date NOT NULL,
  `date_modify` date DEFAULT NULL,
  `create_by` varchar(50) NOT NULL,
  `modify_by` varchar(50) DEFAULT NULL,
  `product_name` varchar(50) NOT NULL,
  `main_image` text NOT NULL,
  `sub_image` text NOT NULL,
  `image_1` text NOT NULL,
  `image_2` text NOT NULL,
  `image_3` text NOT NULL,
  `image_4` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `image`
--

INSERT INTO `image` (`id`, `date_create`, `date_modify`, `create_by`, `modify_by`, `product_name`, `main_image`, `sub_image`, `image_1`, `image_2`, `image_3`, `image_4`) VALUES
(1, '2019-10-13', NULL, 'test', NULL, 'Halo Diamond Band', 'JR04688-YGP900_1_lar.jpg', 'JR04688-YGP900_2_lar.jpg', 'JR04688-YGP900_3_lar.jpg', 'JR04688-YGP900_4_lar.jpg', 'JR04688-YGP900_5_lar.jpg', 'JR04688-YGP900_6_lar.jpg'),
(2, '2019-10-13', NULL, 'test', NULL, 'Haze Elegance Ring', 'JR03449-WGP9XB_1_lar.jpg', 'JR03449-WGP9XB_2_lar.jpg', 'JR03449-WGP9XB_3_lar.jpg', 'JR03449-WGP9XB_4_lar.jpg', 'JR03449-WGP9XB_5_lar.jpg', 'JR03449-WGP9XB_6_lar.jpg'),
(3, '2019-10-13', NULL, 'test', NULL, 'Haze Elegance Ring', 'JR03449-YGP9XB_1_lar.jpg', 'JR03449-YGP9XB_2_lar.jpg', 'JR03449-YGP9XB_3_lar.jpg', 'JR03449-YGP9XB_4_lar.jpg', 'JR03449-YGP9XB_5_lar.jpg', 'JR03449-YGP9XB_6_lar.jpg'),
(4, '2019-10-13', NULL, 'test', NULL, 'Marvel Solitaire Ring', 'SR00188-WGP900_1_lar.jpg', 'SR00188-WGP900_2_lar.jpg', 'SR00188-WGP900_3_lar.jpg', 'SR00188-WGP900_4_lar.jpg', 'SR00188-WGP900_5_lar.jpg', 'SR00188-WGP900_6_lar.jpg'),
(5, '2019-10-13', NULL, 'test', NULL, 'Marvel Solitaire Ring', 'SR00188-YGP900_1_lar.jpg', 'SR00188-YGP900_2_lar.jpg', 'SR00188-YGP900_3_lar.jpg', 'SR00188-YGP900_4_lar.jpg', 'SR00188-YGP900_5_lar.jpg', 'SR00188-YGP900_6_lar.jpg'),
(6, '2019-10-13', NULL, 'test', NULL, 'Azure Royal Ring', 'JR03451-WGP9XB_1_lar.jpg', 'JR03451-WGP9XB_2_lar.jpg', 'JR03451-WGP9XB_3_lar.jpg', 'JR03451-WGP9XB_4_lar.jpg', 'JR03451-WGP9XB_5_lar.jpg', 'JR03451-WGP9XB_6_lar.jpg'),
(7, '2019-10-13', NULL, 'test', NULL, 'Azure Royal Ring', 'JR03451-YGP9XB_1_lar.jpg', 'JR03451-YGP9XB_2_lar.jpg', 'JR03451-YGP9XB_3_lar.jpg', 'JR03451-YGP9XB_4_lar.jpg', 'JR03451-YGP9XB_5_lar.jpg', 'JR03451-YGP9XB_6_lar.jpg'),
(8, '2019-10-13', NULL, 'test', NULL, 'Linear Diamond Band', 'JR04560-RGP900_1_lar.jpg', 'JR04560-RGP900_2_lar.jpg', 'JR04560-RGP900_3_lar.jpg', 'JR04560-RGP900_4_lar.jpg', 'JR04560-RGP900_5_lar.jpg', 'JR04560-RGP900_6_lar.jpg'),
(9, '2019-10-13', NULL, 'test', NULL, 'Linear Diamond Band', 'JR04560-WGP900_1_lar.jpg', 'JR04560-WGP900_2_lar.jpg', 'JR04560-WGP900_3_lar.jpg', 'JR04560-WGP900_4_lar.jpg', 'JR04560-WGP900_5_lar.jpg', 'JR04560-WGP900_6_lar.jpg'),
(10, '2019-10-13', NULL, 'test', NULL, 'Linear Diamond Band', 'JR04560-YGP900_1_lar.jpg', 'JR04560-YGP900_2_lar.jpg', 'JR04560-YGP900_3_lar.jpg', 'JR04560-YGP900_4_lar.jpg', 'JR04560-YGP900_5_lar.jpg', 'JR04560-YGP900_6_lar.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `locations`
--

CREATE TABLE `locations` (
  `id` int(11) NOT NULL,
  `date_create` date NOT NULL,
  `date_modify` date DEFAULT NULL,
  `create_by` varchar(50) NOT NULL,
  `modify_by` varchar(50) DEFAULT NULL,
  `name_store` varchar(50) NOT NULL,
  `image` text NOT NULL,
  `address` varchar(200) NOT NULL,
  `hot_line` varchar(10) NOT NULL,
  `time_open` varchar(10) NOT NULL,
  `time_close` varchar(10) NOT NULL,
  `longitude` varchar(50) NOT NULL,
  `latitude` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `metal`
--

CREATE TABLE `metal` (
  `id` int(11) NOT NULL,
  `date_create` date NOT NULL,
  `date_modify` date DEFAULT NULL,
  `create_by` varchar(50) NOT NULL,
  `modify_by` varchar(50) DEFAULT NULL,
  `weight` float NOT NULL,
  `product_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `metal`
--

INSERT INTO `metal` (`id`, `date_create`, `date_modify`, `create_by`, `modify_by`, `weight`, `product_name`) VALUES
(1, '2019-10-13', NULL, 'test', NULL, 2, 'Halo Diamond Band'),
(2, '2019-10-13', NULL, 'test', NULL, 2.52, 'Haze Elegance Ring'),
(3, '2019-10-13', NULL, 'test', NULL, 2.4, 'Marvel Solitaire Ring'),
(4, '2019-10-13', NULL, 'test', NULL, 3.07, 'Azure Royal Ring'),
(5, '2019-10-13', NULL, 'test', NULL, 2.42, 'Linear Diamond Band');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `metal_option`
--

CREATE TABLE `metal_option` (
  `id` int(11) NOT NULL,
  `date_create` date NOT NULL,
  `date_modify` date DEFAULT NULL,
  `create_by` varchar(50) NOT NULL,
  `modify_by` varchar(50) DEFAULT NULL,
  `metal_type` varchar(50) NOT NULL,
  `default_option` tinyint(1) NOT NULL DEFAULT 0,
  `product_name` varchar(50) NOT NULL,
  `image_display` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `metal_option`
--

INSERT INTO `metal_option` (`id`, `date_create`, `date_modify`, `create_by`, `modify_by`, `metal_type`, `default_option`, `product_name`, `image_display`) VALUES
(1, '2019-10-13', NULL, 'test', NULL, '18 KT Yellow Gold', 1, 'Halo Diamond Band', 1),
(2, '2019-10-13', NULL, 'test', NULL, '14 KT White Gold', 1, 'Haze Elegance Ring', 2),
(3, '2019-10-13', NULL, 'test', NULL, '14 KT Yellow Gold', 0, 'Haze Elegance Ring', 3),
(4, '2019-10-13', NULL, 'test', NULL, '18 KT White Gold', 0, 'Haze Elegance Ring', 2),
(5, '2019-10-13', NULL, 'test', NULL, '18 KT Yellow Gold', 0, 'Haze Elegance Ring', 3),
(6, '2019-10-13', NULL, 'test', NULL, '14 KT White Gold', 1, 'Marvel Solitaire Ring', 4),
(7, '2019-10-13', NULL, 'test', NULL, '14 KT Yellow Gold', 0, 'Marvel Solitaire Ring', 5),
(8, '2019-10-13', NULL, 'test', NULL, '18 KT Yellow Gold', 0, 'Marvel Solitaire Ring', 5),
(9, '2019-10-13', NULL, 'test', NULL, '18 KT White Gold', 0, 'Marvel Solitaire Ring', 4),
(10, '2019-10-13', NULL, 'test', NULL, '14 KT White Gold', 1, 'Azure Royal Ring', 6),
(11, '2019-10-13', NULL, 'test', NULL, '14 KT Yellow Gold', 0, 'Azure Royal Ring', 7),
(12, '2019-10-13', NULL, 'test', NULL, '18 KT Yellow Gold', 0, 'Azure Royal Ring', 7),
(13, '2019-10-13', NULL, 'test', NULL, '18 KT White Gold', 0, 'Azure Royal Ring', 6),
(14, '2019-10-13', NULL, 'test', NULL, '14 KT Rose Gold', 1, 'Linear Diamond Band', 8),
(15, '2019-10-13', NULL, 'test', NULL, '14 KT White Gold', 0, 'Linear Diamond Band', 9),
(16, '2019-10-13', NULL, 'test', NULL, '14 KT Yellow Gold', 0, 'Linear Diamond Band', 10),
(17, '2019-10-13', NULL, 'test', NULL, '18 KT Rose Gold', 0, 'Linear Diamond Band', 8),
(18, '2019-10-13', NULL, 'test', NULL, '18 KT White Gold', 0, 'Linear Diamond Band', 9),
(19, '2019-10-13', NULL, 'test', NULL, '18 KT Yellow Gold', 0, 'Linear Diamond Band', 10);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `metal_type`
--

CREATE TABLE `metal_type` (
  `id` int(11) NOT NULL,
  `date_create` date NOT NULL,
  `date_modify` date DEFAULT NULL,
  `create_by` varchar(50) NOT NULL,
  `modify_by` varchar(50) DEFAULT NULL,
  `metal_type_name` varchar(50) NOT NULL,
  `rate` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `metal_type`
--

INSERT INTO `metal_type` (`id`, `date_create`, `date_modify`, `create_by`, `modify_by`, `metal_type_name`, `rate`) VALUES
(1, '2019-10-13', NULL, 'test', NULL, '18 KT Yellow Gold', '44.17'),
(2, '2019-10-13', NULL, 'test', NULL, '14 KT White Gold', '34.36'),
(5, '2019-10-13', NULL, 'test', NULL, '14 KT Yellow Gold', '34.36'),
(6, '2019-10-13', NULL, 'test', NULL, '18 KT White Gold', '44.17'),
(7, '2019-10-13', NULL, 'test', NULL, '14 KT Rose Gold', '34.36'),
(8, '2019-10-13', NULL, 'test', NULL, '18 KT Rose Gold', '44.17');

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `metal_view`
-- (See below for the actual view)
--
CREATE TABLE `metal_view` (
`product_name` varchar(50)
,`price` double(19,2)
,`weight` float
,`rate` decimal(10,2)
,`default_option` tinyint(1)
,`metal_type` varchar(50)
,`sub_image` text
,`main_image` text
,`image_1` text
,`image_2` text
,`image_3` text
,`image_4` text
);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `notification`
--

CREATE TABLE `notification` (
  `id` int(11) NOT NULL,
  `date_create` date NOT NULL,
  `date_modify` date DEFAULT NULL,
  `create_by` varchar(50) NOT NULL,
  `modify_by` varchar(50) DEFAULT NULL,
  `title` varchar(200) NOT NULL,
  `content` text NOT NULL,
  `type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `date_create` date NOT NULL,
  `date_modify` date DEFAULT NULL,
  `create_by` varchar(50) NOT NULL,
  `modify_by` varchar(50) DEFAULT NULL,
  `product_name` varchar(50) NOT NULL,
  `making_charges` decimal(10,2) NOT NULL,
  `product_type_name` varchar(50) NOT NULL,
  `lenght` float(5,2) NOT NULL,
  `height` float(5,2) NOT NULL,
  `display` tinyint(1) NOT NULL DEFAULT 0,
  `width` float(5,2) NOT NULL,
  `view_number` bigint(20) NOT NULL DEFAULT 0,
  `tag` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`id`, `date_create`, `date_modify`, `create_by`, `modify_by`, `product_name`, `making_charges`, `product_type_name`, `lenght`, `height`, `display`, `width`, `view_number`, `tag`) VALUES
(1, '2019-10-09', NULL, 'test', NULL, 'test Product', '12.06', 'Casual', 12.00, 12.00, 0, 5.00, 0, NULL),
(4, '2019-10-12', NULL, 'test', NULL, 'Halo Diamond Band', '3000.00', 'Casual', 0.00, 3.11, 0, 7.14, 0, NULL),
(5, '2019-10-12', NULL, 'test', NULL, 'Haze Elegance Ring', '3780.00', 'Casual', 0.00, 3.17, 0, 4.18, 0, NULL),
(6, '2019-10-12', NULL, 'test', NULL, 'Marvel Solitaire Ring', '3600.00', 'Casual', 0.00, 12.00, 0, 7.14, 0, NULL),
(7, '2019-10-13', NULL, 'test', NULL, 'Azure Royal Ring', '4500.00', 'Casual', 3.00, 3.00, 0, 3.00, 0, NULL),
(11, '2019-10-13', NULL, 'test', NULL, 'Linear Diamond Band', '3146.00', 'Casual', 3.00, 12.00, 0, 5.00, 0, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `product_detail_view`
-- (See below for the actual view)
--
CREATE TABLE `product_detail_view` (
`product_name` varchar(50)
,`category_name` varchar(50)
,`product_type_name` varchar(50)
,`weight_product` double(19,2)
,`width` float(5,2)
,`height` float(5,2)
,`lenght` float(5,2)
,`grand_total` double(19,2)
,`making_charges` decimal(10,2)
,`default_option` tinyint(1)
,`main_image` text
,`sub_image` text
,`image_1` text
,`image_2` text
,`image_3` text
,`image_4` text
);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_type`
--

CREATE TABLE `product_type` (
  `id` int(11) NOT NULL,
  `date_create` date NOT NULL,
  `date_modify` date DEFAULT NULL,
  `create_by` varchar(50) NOT NULL,
  `modify_by` varchar(50) DEFAULT NULL,
  `category_name` varchar(50) NOT NULL,
  `product_type_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `product_type`
--

INSERT INTO `product_type` (`id`, `date_create`, `date_modify`, `create_by`, `modify_by`, `category_name`, `product_type_name`) VALUES
(1, '2019-10-09', NULL, 'test', NULL, 'Ring', 'Casual');

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `product_view`
-- (See below for the actual view)
--
CREATE TABLE `product_view` (
`product_name` varchar(50)
,`date_create` date
,`making_charges` decimal(10,2)
,`product_type_name` varchar(50)
,`display` tinyint(1)
,`view_number` bigint(20)
,`tag` text
,`diamond` double(20,3)
,`diamond_price` double(19,2)
,`gemstone` double(19,2)
,`gemstone_price` double(19,2)
,`metal` float
,`metal_price` double(19,2)
,`main_image` text
,`sub_image` text
,`weight_product` double(19,2)
,`grand_total` double(19,2)
);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `review`
--

CREATE TABLE `review` (
  `id` int(11) NOT NULL,
  `productID` int(11) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `Title` varchar(100) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `Content` text COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `Rating` float DEFAULT NULL,
  `Response` text COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `DateCreated` date DEFAULT NULL,
  `DateModify` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `role`
--

CREATE TABLE `role` (
  `role_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `date_create` date NOT NULL,
  `date_modify` date DEFAULT NULL,
  `create_by` varchar(50) NOT NULL,
  `modify_by` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `slide`
--

CREATE TABLE `slide` (
  `id` int(11) NOT NULL,
  `slide_url` varchar(50) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `is_show` tinyint(1) DEFAULT 0,
  `title` text COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `ordinal` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `stock`
--

CREATE TABLE `stock` (
  `id` int(11) NOT NULL,
  `date_create` date NOT NULL,
  `date_modify` date DEFAULT NULL,
  `create_by` varchar(50) NOT NULL,
  `modify_by` varchar(50) DEFAULT NULL,
  `metal_option_id` int(11) NOT NULL,
  `diamond_option_id` int(11) NOT NULL,
  `gemstone_option_id` int(11) NOT NULL,
  `product_name` varchar(50) NOT NULL,
  `number` int(11) NOT NULL,
  `size` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc cho view `diamond_view`
--
DROP TABLE IF EXISTS `diamond_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `diamond_view`  AS  select `pro`.`product_name` AS `product_name`,`dia_op`.`rate` AS `rate`,`dia_op`.`diamond_type` AS `diamond_type`,`pro_dia`.`total_weight` AS `total_weight`,round(`dia_op`.`rate` / round(0.2 / `pro_dia`.`total_weight`,2),2) AS `price` from ((select `pro`.`product_name` AS `product_name`,sum(`dia`.`total_weight`) AS `total_weight` from (`diamond` `dia` left join `product` `pro` on(`pro`.`product_name` = `dia`.`product_name`)) group by `pro`.`product_name`) `pro_dia` left join (`diamond_option` `dia_op` left join `product` `pro` on(`pro`.`product_name` = `dia_op`.`product_name`)) on(`pro_dia`.`product_name` = `pro`.`product_name`)) order by round(`dia_op`.`rate` / round(0.2 / `pro_dia`.`total_weight`,2),2) ;

-- --------------------------------------------------------

--
-- Cấu trúc cho view `gemstone_view`
--
DROP TABLE IF EXISTS `gemstone_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `gemstone_view`  AS  select `product`.`id` AS `id`,`product`.`product_name` AS `product_name`,`gemstone_option`.`gemstone_type` AS `gemstone_type`,`gemstone_option`.`rate` AS `rate`,round(`gemstone_option`.`rate` / round(0.2 / `pro_gem`.`total_weight`,2),2) AS `price`,`pro_gem`.`total_weight` AS `total_weight` from ((select `product`.`product_name` AS `product_name`,sum(`gemstone`.`total_weight`) AS `total_weight` from (`gemstone` left join `product` on(`product`.`product_name` = `gemstone`.`product_name`)) group by `product`.`product_name`) `pro_gem` left join (`gemstone_option` left join `product` on(`product`.`product_name` = `gemstone_option`.`product_name`)) on(`product`.`product_name` = `pro_gem`.`product_name`)) ;

-- --------------------------------------------------------

--
-- Cấu trúc cho view `metal_view`
--
DROP TABLE IF EXISTS `metal_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `metal_view`  AS  select `pro`.`product_name` AS `product_name`,round(`m_type`.`rate` * `met`.`weight`,2) AS `price`,`met`.`weight` AS `weight`,`m_type`.`rate` AS `rate`,`m_option`.`default_option` AS `default_option`,`m_option`.`metal_type` AS `metal_type`,`img`.`sub_image` AS `sub_image`,`img`.`main_image` AS `main_image`,`img`.`image_1` AS `image_1`,`img`.`image_2` AS `image_2`,`img`.`image_3` AS `image_3`,`img`.`image_4` AS `image_4` from (`image` `img` left join (`metal_type` `m_type` left join (`metal_option` `m_option` left join (`metal` `met` left join `product` `pro` on(`pro`.`product_name` = `met`.`product_name`)) on(`pro`.`product_name` = `m_option`.`product_name`)) on(`m_option`.`metal_type` = `m_type`.`metal_type_name`)) on(`m_option`.`image_display` = `img`.`id`)) ;

-- --------------------------------------------------------

--
-- Cấu trúc cho view `product_detail_view`
--
DROP TABLE IF EXISTS `product_detail_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `product_detail_view`  AS  select `product`.`product_name` AS `product_name`,`product_type`.`category_name` AS `category_name`,`product_view`.`product_type_name` AS `product_type_name`,`product_view`.`weight_product` AS `weight_product`,`product`.`width` AS `width`,`product`.`height` AS `height`,`product`.`lenght` AS `lenght`,`product_view`.`grand_total` AS `grand_total`,`product_view`.`making_charges` AS `making_charges`,`metal_view`.`default_option` AS `default_option`,`metal_view`.`main_image` AS `main_image`,`metal_view`.`sub_image` AS `sub_image`,`metal_view`.`image_1` AS `image_1`,`metal_view`.`image_2` AS `image_2`,`metal_view`.`image_3` AS `image_3`,`metal_view`.`image_4` AS `image_4` from (((`product_view` left join `product` on(`product`.`product_name` = `product_view`.`product_name`)) left join `product_type` on(`product_type`.`product_type_name` = `product_view`.`product_type_name`)) left join `metal_view` on(`product`.`product_name` = `metal_view`.`product_name` and `metal_view`.`default_option` = 1)) ;

-- --------------------------------------------------------

--
-- Cấu trúc cho view `product_view`
--
DROP TABLE IF EXISTS `product_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `product_view`  AS  select `product`.`product_name` AS `product_name`,`product`.`date_create` AS `date_create`,`product`.`making_charges` AS `making_charges`,`product`.`product_type_name` AS `product_type_name`,`product`.`display` AS `display`,`product`.`view_number` AS `view_number`,`product`.`tag` AS `tag`,`dia`.`total_weight` AS `diamond`,`dia`.`min_price` AS `diamond_price`,`gem`.`total_weight` AS `gemstone`,`gem`.`min_price` AS `gemstone_price`,`metal`.`weight` AS `metal`,`metal`.`price` AS `metal_price`,`metal`.`main_image` AS `main_image`,`metal`.`sub_image` AS `sub_image`,round(ifnull(`dia`.`total_weight`,0) + ifnull(`gem`.`total_weight`,0) + `metal`.`weight`,2) AS `weight_product`,round(ifnull(`dia`.`min_price`,0) + ifnull(`gem`.`min_price`,0) + `metal`.`price` + `product`.`making_charges`,2) AS `grand_total` from ((select `metal_view`.`product_name` AS `product_name`,`metal_view`.`price` AS `price`,`metal_view`.`weight` AS `weight`,`metal_view`.`rate` AS `rate`,`metal_view`.`default_option` AS `default_option`,`metal_view`.`metal_type` AS `metal_type`,`metal_view`.`sub_image` AS `sub_image`,`metal_view`.`main_image` AS `main_image`,`metal_view`.`image_1` AS `image_1`,`metal_view`.`image_2` AS `image_2`,`metal_view`.`image_3` AS `image_3`,`metal_view`.`image_4` AS `image_4` from `metal_view` where `metal_view`.`default_option` = 1) `metal` left join (((select `diamond_view`.`product_name` AS `product_name`,min(`diamond_view`.`price`) AS `min_price`,`diamond_view`.`total_weight` AS `total_weight` from `diamond_view` group by `diamond_view`.`product_name`) `dia` left join `product` on(`product`.`product_name` = `dia`.`product_name`)) left join (select `gemstone_view`.`product_name` AS `product_name`,min(`gemstone_view`.`price`) AS `min_price`,`gemstone_view`.`total_weight` AS `total_weight` from `gemstone_view` group by `gemstone_view`.`product_name`) `gem` on(`product`.`product_name` = `gem`.`product_name`)) on(`product`.`product_name` = `metal`.`product_name`)) order by `product`.`date_create` desc ;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`account_id`),
  ADD UNIQUE KEY `gmail` (`gmail`);

--
-- Chỉ mục cho bảng `account_notification`
--
ALTER TABLE `account_notification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_notification_account` (`account_name`),
  ADD KEY `account_notification_notification` (`notification_id`);

--
-- Chỉ mục cho bảng `account_role`
--
ALTER TABLE `account_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_role_account` (`account_name`),
  ADD KEY `account_role_role` (`role_name`);

--
-- Chỉ mục cho bảng `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `address_account` (`account_name`);

--
-- Chỉ mục cho bảng `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category_name` (`category_name`);

--
-- Chỉ mục cho bảng `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `diamond`
--
ALTER TABLE `diamond`
  ADD PRIMARY KEY (`id`),
  ADD KEY `diamond_product` (`product_name`);

--
-- Chỉ mục cho bảng `diamond_option`
--
ALTER TABLE `diamond_option`
  ADD PRIMARY KEY (`id`),
  ADD KEY `diamond_option_product` (`product_name`);

--
-- Chỉ mục cho bảng `discount`
--
ALTER TABLE `discount`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pk_discount_pro` (`productID`);

--
-- Chỉ mục cho bảng `gemstone`
--
ALTER TABLE `gemstone`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gemstone_product` (`product_name`);

--
-- Chỉ mục cho bảng `gemstone_option`
--
ALTER TABLE `gemstone_option`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gemstone_option_product` (`product_name`);

--
-- Chỉ mục cho bảng `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `image_product` (`product_name`);

--
-- Chỉ mục cho bảng `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `metal`
--
ALTER TABLE `metal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `metal_product` (`product_name`);

--
-- Chỉ mục cho bảng `metal_option`
--
ALTER TABLE `metal_option`
  ADD PRIMARY KEY (`id`),
  ADD KEY `metal_option_image` (`image_display`),
  ADD KEY `metal_option_metal_type` (`metal_type`),
  ADD KEY `metal_option_product` (`product_name`);

--
-- Chỉ mục cho bảng `metal_type`
--
ALTER TABLE `metal_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `metal_type_name` (`metal_type_name`);

--
-- Chỉ mục cho bảng `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_name` (`product_name`),
  ADD KEY `product_product_type` (`product_type_name`);

--
-- Chỉ mục cho bảng `product_type`
--
ALTER TABLE `product_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_type_name` (`product_type_name`),
  ADD KEY `product_type_category` (`category_name`);

--
-- Chỉ mục cho bảng `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`role_id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Chỉ mục cho bảng `slide`
--
ALTER TABLE `slide`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_diamond_option` (`diamond_option_id`),
  ADD KEY `stock_gemstone_option` (`gemstone_option_id`),
  ADD KEY `stock_metal_option` (`metal_option_id`),
  ADD KEY `stock_product` (`product_name`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `account`
--
ALTER TABLE `account`
  MODIFY `account_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `account_notification`
--
ALTER TABLE `account_notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `account_role`
--
ALTER TABLE `account_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `address`
--
ALTER TABLE `address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `blog`
--
ALTER TABLE `blog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `diamond`
--
ALTER TABLE `diamond`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `diamond_option`
--
ALTER TABLE `diamond_option`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT cho bảng `discount`
--
ALTER TABLE `discount`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `gemstone`
--
ALTER TABLE `gemstone`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `gemstone_option`
--
ALTER TABLE `gemstone_option`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `image`
--
ALTER TABLE `image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `metal`
--
ALTER TABLE `metal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `metal_option`
--
ALTER TABLE `metal_option`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT cho bảng `metal_type`
--
ALTER TABLE `metal_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `notification`
--
ALTER TABLE `notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `product_type`
--
ALTER TABLE `product_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `review`
--
ALTER TABLE `review`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `role`
--
ALTER TABLE `role`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `slide`
--
ALTER TABLE `slide`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `stock`
--
ALTER TABLE `stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `account_notification`
--
ALTER TABLE `account_notification`
  ADD CONSTRAINT `account_notification_account` FOREIGN KEY (`account_name`) REFERENCES `account` (`gmail`) ON UPDATE CASCADE,
  ADD CONSTRAINT `account_notification_notification` FOREIGN KEY (`notification_id`) REFERENCES `notification` (`id`) ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `account_role`
--
ALTER TABLE `account_role`
  ADD CONSTRAINT `account_role_account` FOREIGN KEY (`account_name`) REFERENCES `account` (`gmail`) ON UPDATE CASCADE,
  ADD CONSTRAINT `account_role_role` FOREIGN KEY (`role_name`) REFERENCES `role` (`name`) ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_account` FOREIGN KEY (`account_name`) REFERENCES `account` (`gmail`);

--
-- Các ràng buộc cho bảng `diamond`
--
ALTER TABLE `diamond`
  ADD CONSTRAINT `diamond_product` FOREIGN KEY (`product_name`) REFERENCES `product` (`product_name`) ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `diamond_option`
--
ALTER TABLE `diamond_option`
  ADD CONSTRAINT `diamond_option_product` FOREIGN KEY (`product_name`) REFERENCES `product` (`product_name`) ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `discount`
--
ALTER TABLE `discount`
  ADD CONSTRAINT `pk_discount_pro` FOREIGN KEY (`productID`) REFERENCES `product` (`id`);

--
-- Các ràng buộc cho bảng `gemstone`
--
ALTER TABLE `gemstone`
  ADD CONSTRAINT `gemstone_product` FOREIGN KEY (`product_name`) REFERENCES `product` (`product_name`) ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `gemstone_option`
--
ALTER TABLE `gemstone_option`
  ADD CONSTRAINT `gemstone_option_product` FOREIGN KEY (`product_name`) REFERENCES `product` (`product_name`) ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `image`
--
ALTER TABLE `image`
  ADD CONSTRAINT `image_product` FOREIGN KEY (`product_name`) REFERENCES `product` (`product_name`) ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `metal`
--
ALTER TABLE `metal`
  ADD CONSTRAINT `metal_product` FOREIGN KEY (`product_name`) REFERENCES `product` (`product_name`) ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `metal_option`
--
ALTER TABLE `metal_option`
  ADD CONSTRAINT `metal_option_image` FOREIGN KEY (`image_display`) REFERENCES `image` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `metal_option_metal_type` FOREIGN KEY (`metal_type`) REFERENCES `metal_type` (`metal_type_name`) ON UPDATE CASCADE,
  ADD CONSTRAINT `metal_option_product` FOREIGN KEY (`product_name`) REFERENCES `product` (`product_name`) ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_product_type` FOREIGN KEY (`product_type_name`) REFERENCES `product_type` (`product_type_name`) ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `product_type`
--
ALTER TABLE `product_type`
  ADD CONSTRAINT `product_type_category` FOREIGN KEY (`category_name`) REFERENCES `category` (`category_name`) ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `stock`
--
ALTER TABLE `stock`
  ADD CONSTRAINT `stock_diamond_option` FOREIGN KEY (`diamond_option_id`) REFERENCES `diamond_option` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `stock_gemstone_option` FOREIGN KEY (`gemstone_option_id`) REFERENCES `gemstone_option` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `stock_metal_option` FOREIGN KEY (`metal_option_id`) REFERENCES `metal_option` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `stock_product` FOREIGN KEY (`product_name`) REFERENCES `product` (`product_name`) ON UPDATE CASCADE;

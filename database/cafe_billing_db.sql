-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 02, 2020 at 09:22 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cafe_billing_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

-- Reset the current tables
DROP TABLE IF EXISTS `categories`;
DROP TABLE IF EXISTS `products`;
DROP TABLE IF EXISTS `products_Ar`;
DROP TABLE IF EXISTS `orders`;
DROP TABLE IF EXISTS `order_items`;
DROP TABLE IF EXISTS `system_settings`;
DROP TABLE IF EXISTS `users`;

-- Recreate the `categories` table
CREATE TABLE `categories` (
  `id` int(30) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `name_ar` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Insert new categories
INSERT INTO `categories` (`id`, `name`, `description`, `name_ar`) VALUES
(1, 'Milkshakes', '', 'ميلك شيك'),
(2, 'Hot Drinks', '', 'مشروبات ساخنة'),
(3, 'Soft Drinks', '', 'مشروبات غازية'),
(4, 'Fresh Juices', '', 'عصائر طازجة'),
(5, 'Smoothies', '', 'عصائر سموزي'),
(6, 'Macchiato', '', 'ماكياتو'),
(7, 'Espresso', '', 'إسبريسو'),
(8, 'Coffee', '', 'قهوة'),
(9, 'RedBull Mix', '', 'ميكس ريد بُل'),
(10, 'Iced Coffee', '', 'قهوة مثلجة'),
(11, 'Classics', '', 'كلاسيكيات'),
(12, 'Cold Brew', '', 'قهوة مبردة'),
(13, 'Mojitos', '', 'موهيتو'),
(14, 'Frappe', '', 'فرابيه'),
(15, 'Frappuccino', '', 'فرابتشينو'),
(16, 'Croissant', '', 'كرواسان'),
(17, 'Dessert', '', 'حلويات'),
(18, 'Waffles', '', 'وافل'),
(19, 'Extra', '', 'إضافات');



-- Recreate the `products` table
CREATE TABLE `products` (
  `id` int(30) NOT NULL,
  `category_id` int(30) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `price` float NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0=Unavailable,1=Available',
  `name_ar` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Insert new products
INSERT INTO `products` (`id`, `category_id`, `name`, `description`, `price`, `status`, `name_ar`) VALUES

-- Milkshakes
(1, 1, 'Fruits Milkshake', 'Mango - Strawberry - blueberry', 60, 1, 'ميلك شيك فواكه'),
(2, 1, 'Vanilla Milkshake', '', 60, 1, 'ميلك شيك فانيليا'),
(3, 1, 'Chocolate Milkshake', '', 60, 1, 'ميلك شيك شوكولاتة'),
(4, 1, 'Oreo Milkshake', '', 65, 1, 'ميلك شيك أوريو'),
(5, 1, 'Hazelnut Milkshake', '', 60, 1, 'ميلك شيك بندق'),
(6, 1, 'Snickers Milkshake', '', 70, 1, 'ميلك شيك سنيكرز'),
(7, 1, 'Lotus Milkshake', '', 70, 1, 'ميلك شيك لوتس'),
(8, 1, 'Nutella Milkshake', '', 70, 1, 'ميلك شيك نوتيلا'),
(9, 1, 'Caramel Milkshake', '', 60, 1, 'ميلك شيك كراميل'),
(10, 1, 'Pistachio Milkshake', '', 70, 1, 'ميلك شيك فستق'),
(11, 1, 'KitKat Milkshake', '', 70, 1, 'ميلك شيك كيت كات'),

-- Hot Drinks
(12, 2, 'Hot Sedar S', '', 25, 1, 'سيدر ساخن صغير'),
(13, 2, 'Hot Sedar L', '', 35, 1, 'سيدر ساخن كبير'),
(14, 2, 'Hot Oreo S', '', 35, 1, 'أوريو ساخن صغير'),
(15, 2, 'Hot Oreo L', '', 45, 1, 'أوريو ساخن كبير'),
(16, 2, 'Hot Chocolate S', '', 35, 1, 'شوكولاتة ساخنة صغير'),
(17, 2, 'Hot Chocolate L', '', 45, 1, 'شوكولاتة ساخنة كبير'),
(18, 2, 'Hot Chocolate KitKat S', '', 55, 1, 'شوكولاتة ساخنة بكيت كات صغير'),
(19, 2, 'Hot Chocolate KitKat L', '', 65, 1, 'شوكولاتة ساخنة بكيت كات كبير'),
(20, 2, 'Hot Chocolate Snickers S', '', 55, 1, 'شوكولاتة ساخنة بسنيكرز صغير'),
(21, 2, 'Hot Chocolate Snickers L', '', 65, 1, 'شوكولاتة ساخنة بسنيكرز كبير'),
(22, 2, 'Tea S', '', 10, 1, 'شاي صغير'),
(23, 2, 'Tea L', '', 20, 1, 'شاي كبير'),
(24, 2, 'Mint S', '', 10, 1, 'نعناع صغير'),
(25, 2, 'Mint L', '', 20, 1, 'نعناع كبير'),
(26, 2, 'Anise S', '', 10, 1, 'ينسون صغير'),
(27, 2, 'Anise L', '', 20, 1, 'ينسون كبير'),
(28, 2, 'Hibiscus S', '', 15, 1, 'كركديه صغير'),
(29, 2, 'Hibiscus L', '', 25, 1, 'كركديه كبير'),
(30, 2, 'Cinnamon S', '', 20, 1, 'قرفة صغير'),
(31, 2, 'Cinnamon L', '', 30, 1, 'قرفة كبير'),
(32, 2, 'Cinnamon Milk S', '', 35, 1, 'حليب بالقرفة صغير'),
(33, 2, 'Cinnamon Milk L', '', 45, 1, 'حليب بالقرفة كبير'),
(34, 2, 'Ginger S', '', 10, 1, 'زنجبيل صغير'),
(35, 2, 'Ginger L', '', 20, 1, 'زنجبيل كبير'),
(36, 2, 'Mix Herbs S', '', 25, 1, 'أعشاب مشكلة صغير'),
(37, 2, 'Mix Herbs L', '', 35, 1, 'أعشاب مشكلة كبير'),
(38, 2, 'Green Tea S', '', 15, 1, 'شاي أخضر صغير'),
(39, 2, 'Green Tea L', '', 25, 1, 'شاي أخضر كبير'),
(40, 2, 'Lemon S', '', 15, 1, 'ليمون صغير'),
(41, 2, 'Lemon L', '', 25, 1, 'ليمون كبير'),
(42, 2, 'Karak Tea S', '', 35, 1, 'شاي كرك صغير'),
(43, 2, 'Karak Tea L', '', 45, 1, 'شاي كرك كبير'),
-- Soft Drinks
(44, 3, 'Red Bull', '', 60, 1, 'ريد بُل'),
(45, 3, 'Pepsi', '', 25, 1, 'بيبسي'),
(46, 3, '7 Up', '', 25, 1, 'سڤن أب'),
(47, 3, 'Mirinda', '', 25, 1, 'ميرندا'),
(48, 3, 'Twist', '', 30, 1, 'تويست'),
(49, 3, 'Spiro Spats', '', 30, 1, 'سبيرو سباتس'),
(50, 3, 'Amstel', '', 30, 1, 'أمستل'),
(51, 3, 'Brill', '', 30, 1, 'بريل'),
(52, 3, 'Fayrouz', '', 30, 1, 'فيروز'),
(53, 3, 'Schweppes', '', 30, 1, 'شويبس'),
(54, 3, 'Sting', '', 25, 1, 'ستينج'),
(55, 3, 'Water', '', 15, 1, 'ماء'),

-- Fresh Juices
(56, 4, 'Watermelon', '', 45, 1, 'عصير بطيخ'),
(57, 4, 'Cantaloupe', '', 45, 1, 'عصير شمام'),
(58, 4, 'Mango', '', 50, 1, 'عصير مانجو'),
(59, 4, 'Kiwi', '', 55, 1, 'عصير كيوي'),
(60, 4, 'Avocado-Honey', '', 55, 1, 'عصير أفوكادو بالعسل'),
(61, 4, 'Guava', '', 45, 1, 'عصير جوافة'),
(62, 4, 'Strawberry', '', 45, 1, 'عصير فراولة'),
(63, 4, 'Lemon', '', 30, 1, 'عصير ليمون'),
(64, 4, 'Lemon-Mint', '', 35, 1, 'عصير ليمون بالنعناع'),
(65, 4, 'Orange', '', 35, 1, 'عصير برتقال'),
(66, 4, 'Peach', '', 35, 1, 'عصير خوخ'),
(67, 4, 'Banana Milk', '', 50, 1, 'ميلك شيك موز'),
(68, 4, 'Pineapple', '', 45, 1, 'عصير أناناس'),
(69, 4, 'Honey Yogurt', '', 50, 1, 'زبادي بالعسل'),
(70, 4, 'Fruits Yogurt', '', 50, 1, 'زبادي بالفواكه'),
(71, 4, 'Power Avocado', '', 50, 1, 'عصير أفوكادو باور'),
(72, 4, 'Hammer Avocado', '', 60, 1, 'عصير أفوكادو هامر'),
(73, 4, 'Avocado-Kiwi', '', 60, 1, 'عصير أفوكادو وكيوي'),
(74, 4, 'Paradise Avocado', '', 60, 1, 'عصير أفوكادو بارادايس'),
(75, 4, 'Mango-Peach', '', 55, 1, 'عصير مانجو وخوخ'),
(76, 4, 'Angry Mix', '', 55, 1, 'ميكس غاضب'),
(77, 4, 'Crown Cocktail', '', 55, 1, 'كوكتيل تاج'),
(78, 4, 'Angry Apple', '', 55, 1, 'عصير تفاح غاضب'),
(79, 4, 'Banana Berry', '', 50, 1, 'عصير موز وتوت'),
(80, 4, 'Tropical', '', 50, 1, 'عصير تروبيكال'),
(81, 4, 'Florida', '', 55, 1, 'عصير فلوريدا'),
(82, 4, 'Kiwana', '', 60, 1, 'كيوانا'),

-- Smoothies
(83, 5, 'Mango Smoothie', '', 55, 1, 'سموذي مانجو'),
(84, 5, 'Strawberry Smoothie', '', 50, 1, 'سموذي فراولة'),
(85, 5, 'Watermelon Smoothie', '', 50, 1, 'سموذي بطيخ'),
(86, 5, 'Kiwi Smoothie', '', 55, 1, 'سموذي كيوي'),
(87, 5, 'Lemon Smoothie', '', 35, 1, 'سموذي ليمون'),
(88, 5, 'Pineapple Smoothie', '', 50, 1, 'سموذي أناناس'),
(89, 5, 'Peach Smoothie', '', 50, 1, 'سموذي خوخ'),
(90, 5, 'Blueberry Smoothie', '', 45, 1, 'سموذي توت أزرق'),
(91, 5, 'Mix Berry Smoothie', '', 45, 1, 'سموذي توت مشكل'),
(92, 5, 'Watermelon-Peach Smoothie', '', 55, 1, 'سموذي بطيخ وخوخ'),
(93, 5, 'Mango-Kiwi Smoothie', '', 55, 1, 'سموذي مانجو وكيوي'),
(94, 5, 'Lemon-Mint Smoothie', '', 40, 1, 'سموذي ليمون بالنعناع'),
(95, 5, 'Mix Smoothie', '', 55, 1, 'سموذي مشكل'),

-- Macchiato
(96, 6, 'Macchiato Caramel', '', 40, 1, 'ماكياتو كراميل'),
(97, 6, 'Macchiato Pistachio', '', 50, 1, 'ماكياتو فستق'),
(98, 6, 'Macchiato Caramel L', '', 50, 1, 'ماكياتو كراميل كبير'),
(99, 6, 'Macchiato Pistachio L', '', 60, 1, 'ماكياتو فستق كبير'),

-- Espresso
(100, 7, 'Espresso-S', '', 30, 1, 'اسبريسو صغير'),
(101, 7, 'Espresso-D', '', 40, 1, 'اسبريسو مزدوج'),
(102, 7, 'Espresso Macchiato', '', 40, 1, 'اسبريسو ماكياتو'),
(103, 7, 'Espresso Avocado', '', 45, 1, 'اسبريسو أفوكادو'),

-- Coffee
(104, 8, 'Latte S', '', 45, 1, 'لاتيه صغير'),
(105, 8, 'Latte L', '', 55, 1, 'لاتيه كبير'),
(106, 8, 'Cortado S', '', 45, 1, 'كورتادو صغير'),
(107, 8, 'Cortado L', '', 55, 1, 'كورتادو كبير'),
(108, 8, 'Americano S', '', 40, 1, 'أمريكانو صغير'),
(109, 8, 'Americano L', '', 50, 1, 'أمريكانو كبير'),
(110, 8, 'Cappuccino S', '', 45, 1, 'كابتشينو صغير'),
(111, 8, 'Cappuccino L', '', 55, 1, 'كابتشينو كبير'),
(112, 8, 'Cappuccino Flavor S', '', 55, 1, 'كابتشينو بنكهة صغير'),
(113, 8, 'Cappuccino Flavor L', '', 60, 1, 'كابتشينو بنكهة كبير'),
(114, 8, 'Dark Mocha S', '', 55, 1, 'موكا غامق صغير'),
(115, 8, 'Dark Mocha L', '', 65, 1, 'موكا غامق كبير'),

-- RedBull Mix
(116, 9, 'Virginity Redbull', 'Blue croissant + Pineapple Juice + Redbull', 70, 1, 'ريدبول فرجنتي'),
(117, 9, 'Blue Red Bull', 'Blueberry + Lemon Slices + Redbull', 70, 1, 'ريدبول أزرق'),
(118, 9, 'Energy Red Bull', 'Espresso + Redbull', 80, 1, 'ريدبول إنرجي'),

-- Iced Coffee
(119, 10, 'Ice Mocha S', '', 55, 1, 'موكا مثلج صغير'),
(120, 10, 'Ice Mocha L', '', 65, 1, 'موكا مثلج كبير'),
(121, 10, 'Ice Latte S', '', 50, 1, 'لاتيه مثلج صغير'),
(122, 10, 'Ice Latte L', '', 60, 1, 'لاتيه مثلج كبير'),
(123, 10, 'Ice Chocolate S', '', 50, 1, 'شوكولاتة مثلجة صغير'),
(124, 10, 'Ice Chocolate L', '', 60, 1, 'شوكولاتة مثلجة كبير'),
(125, 10, 'Pistachio Ice Latte S', '', 60, 1, 'لاتيه مثلج بالفستق صغير'),
(126, 10, 'Pistachio Ice Latte L', '', 70, 1, 'لاتيه مثلج بالفستق كبير'),
(127, 10, 'Ice Caramel Macchiato S', '', 55, 1, 'ماكياتو كراميل مثلج صغير'),
(128, 10, 'Ice Caramel Macchiato L', '', 65, 1, 'ماكياتو كراميل مثلج كبير'),
(129, 10, 'Ice Coffee Lotus S', '', 60, 1, 'قهوة لوتس مثلجة صغير'),
(130, 10, 'Ice Coffee Lotus L', '', 70, 1, 'قهوة لوتس مثلجة كبير'),
(131, 10, 'Spanish Latte S', '', 55, 1, 'لاتيه إسباني مثلج صغير'),
(132, 10, 'Spanish Latte L', '', 65, 1, 'لاتيه إسباني مثلج كبير'),
(133, 10, 'Ice Coffee Oreo S', '', 60, 1, 'قهوة أوريو مثلجة صغير'),
(134, 10, 'Ice Coffee Oreo L', '', 70, 1, 'قهوة أوريو مثلجة كبير'),
(135, 10, 'White Mocha S', '', 55, 1, 'موكا بيضاء مثلجة صغير'),
(136, 10, 'White Mocha L', '', 65, 1, 'موكا بيضاء مثلجة كبير'),

-- Classics
(137, 11, 'Turkish Coffee-S', '', 30, 1, 'قهوة تركي صغير'),
(138, 11, 'Turkish Coffee-D', '', 35, 1, 'قهوة تركي مزدوج'),
(139, 11, 'Turkish Coffee Flavor', '', 45, 1, 'قهوة تركي بنكهات'),
(140, 11, 'قهوة محوج S', '', 40, 1, 'قهوة محوج صغير'),
(141, 11, 'قهوة محوج L', '', 45, 1, 'قهوة محوج كبير'),
(142, 11, 'Dark Roast S', '', 40, 1, 'روست غامق صغير'),
(143, 11, 'Dark Roast L', '', 45, 1, 'روست غامق كبير'),
(144, 11, 'French Coffee', '', 40, 1, 'قهوة فرنسية'),
(145, 11, 'French Coffee Flavored', '', 45, 1, 'قهوة فرنسية بنكهات'),
(146, 11, 'Nutella Coffee', '', 60, 1, 'قهوة نوتيلا'),
(147, 11, 'Flat White', '', 50, 1, 'فلات وايت'),
(148, 11, 'Nescafé Classic S', '', 40, 1, 'نسكافيه كلاسيك صغير'),
(149, 11, 'Nescafé Classic L', '', 45, 1, 'نسكافيه كلاسيك كبير'),

-- Cold Brew
(150, 12, 'Classic Cold Brew', '', 65, 1, 'كولد برو كلاسيك'),
(151, 12, 'Cold Brew Flavour', '', 70, 1, 'كولد برو بنكهات'),
(152, 12, 'Pistachio Cold Brew', '', 80, 1, 'كولد برو فستق'),
(153, 12, 'Spanish Cold Brew', '', 75, 1, 'كولد برو إسباني'),

-- Mojitos
(154, 13, 'Classic Mojito', '', 40, 1, 'موهيتو كلاسيك'),
(155, 13, 'Fruits Mojito', 'Blueberry - Strawberry - Kiwi - Mango', 45, 1, 'موهيتو فواكه'),
(156, 13, 'Sun Shine', '', 50, 1, 'سن شاين'),
(157, 13, 'Hawaii', '', 50, 1, 'هاواي'),
(158, 13, 'Blue Electric', '', 50, 1, 'بلو إلكتريك'),
(159, 13, 'Cherry Cola', '', 40, 1, 'كولا بالكرز'),

-- Frappe
(160, 14, 'Frappe Vanilla', '', 60, 1, 'فرابيه فانيليا'),
(161, 14, 'Frappe Chocolate', '', 60, 1, 'فرابيه شوكولاتة'),
(162, 14, 'Frappe Caramel', '', 60, 1, 'فرابيه كراميل'),
(163, 14, 'Frappe Strawberry', '', 60, 1, 'فرابيه فراولة'),
(164, 14, 'Frappe Blueberry', '', 60, 1, 'فرابيه توت أزرق'),

-- Frappuccino
(165, 15, 'Frappuccino Vanilla S', '', 45, 1, 'فرابتشينو فانيليا صغير'),
(166, 15, 'Frappuccino Vanilla L', '', 55, 1, 'فرابتشينو فانيليا كبير'),
(167, 15, 'Frappuccino Chocolate S', '', 45, 1, 'فرابتشينو شوكولاتة صغير'),
(168, 15, 'Frappuccino Chocolate L', '', 55, 1, 'فرابتشينو شوكولاتة كبير'),
(169, 15, 'Frappuccino Caramel S', '', 45, 1, 'فرابتشينو كراميل صغير'),
(170, 15, 'Frappuccino Caramel L', '', 55, 1, 'فرابتشينو كراميل كبير'),
(171, 15, 'Frappuccino Mix S', '', 45, 1, 'فرابتشينو مشكل صغير'),
(172, 15, 'Frappuccino Mix L', '', 55, 1, 'فرابتشينو مشكل كبير'),
(173, 15, 'Frappuccino KitKat S', '', 60, 1, 'فرابتشينو كيت كات صغير'),
(174, 15, 'Frappuccino KitKat L', '', 70, 1, 'فرابتشينو كيت كات كبير'),
(175, 15, 'Frappuccino Oreo S', '', 60, 1, 'فرابتشينو أوريو صغير'),
(176, 15, 'Frappuccino Oreo L', '', 70, 1, 'فرابتشينو أوريو كبير'),
(177, 15, 'Frappuccino Snickers S', '', 60, 1, 'فرابتشينو سنيكرز صغير'),
(178, 15, 'Frappuccino Snickers L', '', 70, 1, 'فرابتشينو سنيكرز كبير'),

-- Croissant
(179, 16, 'Croissant Turkey Salami', '', 65, 1, 'كرواسون تركي بالسلامي'),
(180, 16, 'Croissant Turkey', '', 60, 1, 'كرواسون تركي'),
(181, 16, 'Croissant Salami', '', 60, 1, 'كرواسون بالسلامي'),
(182, 16, 'Croissant Turkey Cheddar', '', 70, 1, 'كرواسون تركي بالشيدر'),
(183, 16, 'Croissant Mix Cheese', '', 65, 1, 'كرواسون بمزيج الأجبان'),
(184, 16, 'Croissant Classic', '', 25, 1, 'كرواسون كلاسيكي'),
(185, 16, 'Croissant Nutella', '', 55, 1, 'كرواسون نوتيلا'),
(186, 16, 'Croissant Lotus', '', 55, 1, 'كرواسون لوتس'),
(187, 16, 'Croissant Pistachio', '', 60, 1, 'كرواسون فستق'),
(188, 16, 'Croissant White Chocolate', '', 50, 1, 'كرواسون شوكولاتة بيضاء'),
(189, 16, 'Croissant Dark Chocolate', '', 50, 1, 'كرواسون شوكولاتة داكنة'),
(190, 16, 'Croissant Mix Chocolate', '', 65, 1, 'كرواسون شوكولاتة مشكل'),
(191, 16, 'Sicily Croissant', 'Ice cream - Mix Chocolate - Oreo Biscuits - Lotus Biscuits', 65, 1, 'كرواسون صقلية'),

-- Desserts
(192, 17, 'Donuts', '', 35, 1, 'دوناتس'),
(193, 17, 'Bomboloni', '', 45, 1, 'بومبولوني'),
(194, 17, 'Cinnabon', '', 50, 1, 'سينابون'),
(195, 17, 'Honey Cake', '', 50, 1, 'كيكة العسل'),
(196, 17, 'Tiramisu Cup', '', 45, 1, 'كوب تيراميسو'),
(197, 17, 'Molten Cake', '', 60, 1, 'كيكة المولتن'),

-- Waffles
(198, 18, 'Waffles Nutella', '', 60, 1, 'وافل نوتيلا'),
(199, 18, 'Waffles White Chocolate', '', 60, 1, 'وافل شوكولاتة بيضاء'),
(200, 18, 'Waffles Caramel', '', 60, 1, 'وافل كراميل'),
(201, 18, 'Waffles Pistachio', '', 65, 1, 'وافل فستق'),
(202, 18, 'Waffles Lotus', '', 65, 1, 'وافل لوتس'),
(203, 18, 'Sicily Waffles', 'Nutella - Lotus Biscuits - Oreo Biscuits - Ice cream', 70, 1, 'وافل صقلية'),

-- Extra
(204, 19, 'Extra shot', '', 15, 1, 'شوت إضافي'),
(205, 19, 'Extra sauce', '', 15, 1, 'صوص إضافي'),
(206, 19, 'Extra milk', '', 15, 1, 'حليب إضافي'),
(207, 19, 'Extra Flavour', '', 10, 1, 'نكهة إضافية'),
(208, 19, 'Extra Nuts', '', 15, 1, 'مكسرات إضافية'),
(209, 19, 'Extra Ice cream', '', 10, 1, 'آيس كريم إضافي');


-- Recreate the `orders` table
CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `ref_no` varchar(50) NOT NULL,
  `phone_no` varchar(50) NOT NULL,
  `BirthDate` varchar(50) NOT NULL,
  `Comment` varchar(200) NOT NULL,
  `name` varchar(50) NOT NULL,
  `total_amount` float NOT NULL,
  `amount_tendered` float NOT NULL,
  `order_number` int(30) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Recreate the `order_items` table
CREATE TABLE `order_items` (
  `id` int(30) NOT NULL,
  `order_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `qty` int(30) NOT NULL,
  `price` float NOT NULL,
  `amount` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Recreate the `system_settings` table
CREATE TABLE `system_settings` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `cover_img` text NOT NULL,
  `about_content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
--
-- Dumping data for table `system_settings`
--

INSERT INTO `system_settings` (`id`, `name`, `email`, `contact`, `cover_img`, `about_content`) VALUES
(1, 'Sicily', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 3 COMMENT '1=Admin,2=Staff'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `type`) VALUES
(1, 'admin', 'admin', '0192023a7bbd73250516f069df18b500', 1),
(2, 'staff', 'staff', 'de9bf5643eabf80f4a56fda3bbb84483', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

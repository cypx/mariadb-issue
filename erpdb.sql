SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `erpdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `A_WMS_PRODUCTS_ATTRIBUTES`
--

CREATE TABLE `A_WMS_PRODUCTS_ATTRIBUTES` (
  `product_id` bigint(10) NOT NULL,
  `sku` varchar(48) DEFAULT NULL,
  `attribute_id` int(5) DEFAULT NULL,
  `attribute_code` varchar(191) DEFAULT NULL,
  `frontend_label` varchar(191) DEFAULT NULL,
  `value` mediumtext DEFAULT NULL,
  `is_required` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table des attributs produits';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `A_WMS_PRODUCTS_ATTRIBUTES`
--
ALTER TABLE `A_WMS_PRODUCTS_ATTRIBUTES`
  ADD KEY `product_id` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

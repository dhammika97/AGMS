-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 16, 2014 at 07:11 PM
-- Server version: 5.6.14
-- PHP Version: 5.5.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `gms`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE IF NOT EXISTS `account` (
  `account_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_code` varchar(100) NOT NULL,
  `account_openingBalance` float NOT NULL,
  `account_balance` float NOT NULL,
  `account_type` int(11) NOT NULL,
  `portal_id` int(11) NOT NULL,
  PRIMARY KEY (`account_id`),
  KEY `account_id` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `audit_log`
--

CREATE TABLE IF NOT EXISTS `audit_log` (
  `audit_id` int(11) NOT NULL AUTO_INCREMENT,
  `audit_tblName` varchar(255) NOT NULL,
  `audit_transactionType` int(11) NOT NULL,
  `audit_rowId` int(11) NOT NULL,
  `audit_oldValues` longtext NOT NULL,
  `audit_newValues` longtext NOT NULL,
  `audit_dateTime` datetime NOT NULL,
  `portal_id` int(11) NOT NULL,
  `audit_loggedBy` int(11) NOT NULL,
  PRIMARY KEY (`audit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE IF NOT EXISTS `customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_firstName` varchar(255) DEFAULT NULL,
  `customer_lastName` varchar(255) DEFAULT NULL,
  `customer_address` varchar(255) DEFAULT NULL,
  `customer_contactNo` varchar(50) DEFAULT NULL,
  `customer_email` varchar(255) DEFAULT NULL,
  `customer_password` varchar(255) DEFAULT NULL,
  `customer_status` int(11) DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE IF NOT EXISTS `employee` (
  `employee_id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_firstName` varchar(255) DEFAULT NULL,
  `employee_lastName` varchar(255) DEFAULT NULL,
  `employee_address` varchar(255) DEFAULT NULL,
  `employee_contactNo` varchar(50) DEFAULT NULL,
  `employee_email` varchar(255) DEFAULT NULL,
  `employee_status` int(11) DEFAULT NULL,
  `portal_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`employee_id`),
  KEY `Employee_fk1` (`portal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `estimate`
--

CREATE TABLE IF NOT EXISTS `estimate` (
  `estimate_id` int(11) NOT NULL AUTO_INCREMENT,
  `estimate_vehicleId` int(11) DEFAULT NULL,
  `estimate_code` int(11) DEFAULT NULL,
  `estimate_note` varchar(255) DEFAULT NULL,
  `estimate_status` int(11) DEFAULT NULL,
  `estimate_date` datetime NOT NULL,
  `estimate_subTotal` float NOT NULL,
  `estimate_taxes` float NOT NULL,
  `estimate_grandTotal` float NOT NULL,
  `portal_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`estimate_id`),
  KEY `Estimate_fk1` (`estimate_vehicleId`),
  KEY `Estimate_fk2` (`portal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `estimate_item`
--

CREATE TABLE IF NOT EXISTS `estimate_item` (
  `estimate_itemsId` int(11) NOT NULL AUTO_INCREMENT,
  `estimate_itemsCardId` int(11) DEFAULT NULL,
  `estimate_itemId` int(11) DEFAULT NULL,
  `estimate_itemUnitPrice` float DEFAULT NULL,
  `estimate_itemQty` int(11) DEFAULT NULL,
  `estimate_subTotal` float DEFAULT NULL,
  PRIMARY KEY (`estimate_itemsId`),
  KEY `Estimate_Item_fk1` (`estimate_itemsCardId`),
  KEY `Estimate_Item_fk2` (`estimate_itemId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `estimate_labor`
--

CREATE TABLE IF NOT EXISTS `estimate_labor` (
  `estimate_laborsID` int(11) NOT NULL AUTO_INCREMENT,
  `estimate_laborsCardId` int(11) DEFAULT NULL,
  `estimate_laborId` int(11) DEFAULT NULL,
  `estimate_laborUnitPrice` float DEFAULT NULL,
  `estimate_laborSubTotal` float NOT NULL,
  PRIMARY KEY (`estimate_laborsID`),
  KEY `Estimate_Labor_fk1` (`estimate_laborsCardId`),
  KEY `Estimate_Labor_fk2` (`estimate_laborId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE IF NOT EXISTS `inventory` (
  `inventory_id` int(11) NOT NULL AUTO_INCREMENT,
  `inventory_itemId` int(11) DEFAULT NULL,
  `invenory_qty` int(11) DEFAULT NULL,
  `inventory_date` date DEFAULT NULL,
  `inventory_remarks` varchar(255) DEFAULT NULL,
  `inventory_loggedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`inventory_id`),
  KEY `Inventory_Log_fk1` (`inventory_itemId`),
  KEY `Inventory_Log_fk2` (`inventory_remarks`),
  KEY `Inventory_Log_fk3` (`inventory_loggedBy`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE IF NOT EXISTS `invoice` (
  `invoice_id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_date` date DEFAULT NULL,
  `invoice_code` int(11) DEFAULT NULL,
  `invoice_subTotal` float DEFAULT NULL,
  `invoice_taxes` float DEFAULT NULL,
  `invoice_grandTotal` float DEFAULT NULL,
  `invoice_notes` int(11) DEFAULT NULL,
  `invoice_type` int(11) DEFAULT NULL,
  `invoice_referenceId` int(11) DEFAULT NULL,
  `invoice_payments` float NOT NULL,
  `invoice_balance` float NOT NULL,
  `invoice_status` int(11) DEFAULT NULL,
  `portal_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`invoice_id`),
  KEY `Invoice_fk1` (`invoice_status`),
  KEY `Invoice_fk2` (`portal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE IF NOT EXISTS `items` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_code` varchar(255) DEFAULT NULL,
  `item_description` varchar(255) DEFAULT NULL,
  `item_reorderLevel` int(11) DEFAULT NULL,
  `item_stock` int(11) DEFAULT NULL,
  `item_price` float DEFAULT NULL,
  `item_status` int(11) DEFAULT NULL,
  `portal_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `Items_fk1` (`portal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `job_card`
--

CREATE TABLE IF NOT EXISTS `job_card` (
  `job_Id` int(11) NOT NULL AUTO_INCREMENT,
  `job_vehicleId` int(11) DEFAULT NULL,
  `job_code` int(11) DEFAULT NULL,
  `job_notes` varchar(255) DEFAULT NULL,
  `job_status` int(11) DEFAULT NULL,
  `job_date` datetime NOT NULL,
  `job_subTotal` float NOT NULL,
  `job_taxes` float NOT NULL,
  `job_grandTotal` float NOT NULL,
  `portal_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`job_Id`),
  KEY `Job_Card_fk1` (`job_vehicleId`),
  KEY `Job_Card_fk2` (`portal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `job_items`
--

CREATE TABLE IF NOT EXISTS `job_items` (
  `job_itemsId` int(11) NOT NULL AUTO_INCREMENT,
  `job_itemsCardId` int(11) DEFAULT NULL,
  `job_itemId` int(11) DEFAULT NULL,
  `job_itemUnitPrice` float DEFAULT NULL,
  `job_itemDiscount` float DEFAULT NULL,
  `job_itemQty` int(11) DEFAULT NULL,
  `job_itemSubTotal` float DEFAULT NULL,
  PRIMARY KEY (`job_itemsId`),
  KEY `Job_Items_fk1` (`job_itemsCardId`),
  KEY `Job_Items_fk2` (`job_itemId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `job_labor`
--

CREATE TABLE IF NOT EXISTS `job_labor` (
  `job_laborsId` int(11) NOT NULL AUTO_INCREMENT,
  `job_laborsCardId` int(11) DEFAULT NULL,
  `job_laborId` int(11) DEFAULT NULL,
  `job_laborUnitPrice` float DEFAULT NULL,
  `job_laborDiscount` float DEFAULT NULL,
  `job_laborSubTotal` float DEFAULT NULL,
  PRIMARY KEY (`job_laborsId`),
  KEY `Job_Labor_fk1` (`job_laborsCardId`),
  KEY `Job_Labor_fk2` (`job_laborId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `labor`
--

CREATE TABLE IF NOT EXISTS `labor` (
  `labor_id` int(11) NOT NULL AUTO_INCREMENT,
  `labor_code` varchar(255) DEFAULT NULL,
  `labor_description` varchar(255) DEFAULT NULL,
  `labor_price` float DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `portal_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`labor_id`),
  KEY `Labor_fk1` (`portal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE IF NOT EXISTS `payments` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_date` datetime NOT NULL,
  `payment_code` varchar(255) NOT NULL,
  `payment_method` int(11) NOT NULL,
  `payment_amount` float NOT NULL,
  `payment_invoiceId` int(11) NOT NULL,
  `payment_by` varchar(255) NOT NULL,
  `payment_notes` varchar(255) NOT NULL,
  `payment_references` varchar(255) NOT NULL,
  `portal_id` int(11) NOT NULL,
  PRIMARY KEY (`payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `portal`
--

CREATE TABLE IF NOT EXISTS `portal` (
  `portal_id` int(11) NOT NULL AUTO_INCREMENT,
  `portal_name` varchar(255) DEFAULT NULL,
  `portal_address` varchar(255) DEFAULT NULL,
  `portal_contactPerson` varchar(255) DEFAULT NULL,
  `portal_contactNo` varchar(50) DEFAULT NULL,
  `portal_vatRegistrationNo` varchar(50) DEFAULT NULL,
  `portal_logo` varchar(255) DEFAULT NULL,
  `portal_disclimer` longtext,
  `portal_status` int(11) DEFAULT NULL,
  PRIMARY KEY (`portal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pos`
--

CREATE TABLE IF NOT EXISTS `pos` (
  `pos_id` int(11) NOT NULL AUTO_INCREMENT,
  `pos_customer` varchar(255) DEFAULT NULL,
  `pos_code` int(11) NOT NULL,
  `pos_notes` varchar(255) DEFAULT NULL,
  `pos_status` int(11) DEFAULT NULL,
  `pos_date` datetime NOT NULL,
  `pos_subTotal` float NOT NULL,
  `pos_taxes` float NOT NULL,
  `pos_grandTotal` float NOT NULL,
  `portal_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`pos_id`),
  KEY `POS_fk1` (`portal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pos_items`
--

CREATE TABLE IF NOT EXISTS `pos_items` (
  `pos_itemsId` int(11) NOT NULL AUTO_INCREMENT,
  `pos_itemsCardId` int(11) DEFAULT NULL,
  `pos_itemId` int(11) DEFAULT NULL,
  `pos_itemUnitPrice` float DEFAULT NULL,
  `pos_itemDiscount` float DEFAULT NULL,
  `pos_itemQty` float DEFAULT NULL,
  `pos_itemSubTotal` float DEFAULT NULL,
  PRIMARY KEY (`pos_itemsId`),
  KEY `pos_items_fk1` (`pos_itemsCardId`),
  KEY `pos_items_fk2` (`pos_itemId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `receivings`
--

CREATE TABLE IF NOT EXISTS `receivings` (
  `receiving_id` int(11) NOT NULL AUTO_INCREMENT,
  `receiving_itemId` int(11) NOT NULL,
  `receiving_qty` int(11) NOT NULL,
  `receiving_date` datetime NOT NULL,
  `receiving_price` float NOT NULL,
  `receiving_supplierId` int(11) NOT NULL,
  `receiving_loggedBy` int(11) NOT NULL,
  PRIMARY KEY (`receiving_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE IF NOT EXISTS `supplier` (
  `supplier_id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_name` varchar(255) DEFAULT NULL,
  `supplier_contactNo` varchar(50) DEFAULT NULL,
  `supplier_email` varchar(255) DEFAULT NULL,
  `supplier_address` varchar(255) DEFAULT NULL,
  `supplier_accountNo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

CREATE TABLE IF NOT EXISTS `taxes` (
  `tax_id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_name` varchar(255) DEFAULT NULL,
  `tax_rate` float DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `portal_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`tax_id`),
  KEY `Taxes_fk1` (`portal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE IF NOT EXISTS `transaction` (
  `transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_date` datetime NOT NULL,
  `transaction_referenceCode` varchar(100) NOT NULL,
  `transaction_notes` varchar(255) NOT NULL,
  `transaction_accountId` varchar(20) NOT NULL,
  `transaction_amount` float NOT NULL,
  `transaction_type` int(11) NOT NULL,
  `transaction_initialBalance` float NOT NULL,
  `transaction_balance` float NOT NULL,
  `transaction_referenceId` int(11) NOT NULL,
  `portal_id` int(11) NOT NULL,
  PRIMARY KEY (`transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `api_key` varchar(100) NOT NULL,
  `user_type` int(11) DEFAULT NULL,
  `user_status` int(11) DEFAULT NULL,
  `portal_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `Users_fk1` (`portal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vehicle`
--

CREATE TABLE IF NOT EXISTS `vehicle` (
  `vehicle_id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle_customerId` int(11) DEFAULT NULL,
  `vehicle_registrationNo` varchar(50) DEFAULT NULL,
  `vehicle_make` varchar(255) DEFAULT NULL,
  `vehicle_modle` varchar(255) DEFAULT NULL,
  `vehicle_engineNo` varchar(255) DEFAULT NULL,
  `vehicle_chasisNo` varchar(255) DEFAULT NULL,
  `vehicle_milage` varchar(50) NOT NULL,
  PRIMARY KEY (`vehicle_id`),
  KEY `Vehicle_fk1` (`vehicle_customerId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- --------------------------------------------------------
-- Host:                         192.168.1.7
-- Server version:               10.4.8-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             10.3.0.5771
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for monster_taeratto
CREATE DATABASE IF NOT EXISTS `monster_taeratto` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;
USE `monster_taeratto`;

-- Dumping structure for table monster_taeratto.addon_account
CREATE TABLE IF NOT EXISTS `addon_account` (
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table monster_taeratto.addon_account: ~2 rows (approximately)
/*!40000 ALTER TABLE `addon_account` DISABLE KEYS */;
INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
	('society_ambulance', 'EMS', 1),
	('society_cardealer', 'Cardealer', 1),
	('society_police', 'Police', 1);
/*!40000 ALTER TABLE `addon_account` ENABLE KEYS */;

-- Dumping structure for table monster_taeratto.addon_account_data
CREATE TABLE IF NOT EXISTS `addon_account_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_name` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `money` int(11) NOT NULL,
  `owner` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_addon_account_data_account_name_owner` (`account_name`,`owner`),
  KEY `index_addon_account_data_account_name` (`account_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table monster_taeratto.addon_account_data: ~2 rows (approximately)
/*!40000 ALTER TABLE `addon_account_data` DISABLE KEYS */;
INSERT INTO `addon_account_data` (`id`, `account_name`, `money`, `owner`) VALUES
	(1, 'society_ambulance', 0, NULL),
	(2, 'society_police', 0, NULL),
	(3, 'society_cardealer', 0, NULL);
/*!40000 ALTER TABLE `addon_account_data` ENABLE KEYS */;

-- Dumping structure for table monster_taeratto.addon_inventory
CREATE TABLE IF NOT EXISTS `addon_inventory` (
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table monster_taeratto.addon_inventory: ~2 rows (approximately)
/*!40000 ALTER TABLE `addon_inventory` DISABLE KEYS */;
INSERT INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
	('society_ambulance', 'EMS', 1),
	('society_cardealer', 'Cardealer', 1),
	('society_police', 'Police', 1);
/*!40000 ALTER TABLE `addon_inventory` ENABLE KEYS */;

-- Dumping structure for table monster_taeratto.addon_inventory_items
CREATE TABLE IF NOT EXISTS `addon_inventory_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inventory_name` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `count` int(11) NOT NULL,
  `owner` varchar(60) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_addon_inventory_items_inventory_name_name` (`inventory_name`,`name`),
  KEY `index_addon_inventory_items_inventory_name_name_owner` (`inventory_name`,`name`,`owner`),
  KEY `index_addon_inventory_inventory_name` (`inventory_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table monster_taeratto.addon_inventory_items: ~0 rows (approximately)
/*!40000 ALTER TABLE `addon_inventory_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `addon_inventory_items` ENABLE KEYS */;

-- Dumping structure for table monster_taeratto.armory
CREATE TABLE IF NOT EXISTS `armory` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `weapon` text COLLATE utf8mb4_bin NOT NULL,
  `count` int(11) NOT NULL DEFAULT 0,
  `armory_job` text COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table monster_taeratto.armory: ~0 rows (approximately)
/*!40000 ALTER TABLE `armory` DISABLE KEYS */;
/*!40000 ALTER TABLE `armory` ENABLE KEYS */;

-- Dumping structure for table monster_taeratto.billing
CREATE TABLE IF NOT EXISTS `billing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `sender` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `target_type` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table monster_taeratto.billing: ~0 rows (approximately)
/*!40000 ALTER TABLE `billing` DISABLE KEYS */;
/*!40000 ALTER TABLE `billing` ENABLE KEYS */;

-- Dumping structure for table monster_taeratto.cardealer_vehicles
CREATE TABLE IF NOT EXISTS `cardealer_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table monster_taeratto.cardealer_vehicles: ~0 rows (approximately)
/*!40000 ALTER TABLE `cardealer_vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `cardealer_vehicles` ENABLE KEYS */;

-- Dumping structure for table monster_taeratto.characters
CREATE TABLE IF NOT EXISTS `characters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `dateofbirth` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `sex` varchar(1) COLLATE utf8mb4_bin NOT NULL DEFAULT 'M',
  `height` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table monster_taeratto.characters: ~0 rows (approximately)
/*!40000 ALTER TABLE `characters` DISABLE KEYS */;
INSERT INTO `characters` (`id`, `identifier`, `firstname`, `lastname`, `dateofbirth`, `sex`, `height`) VALUES
	(1, 'steam:110000136d7e33f', 'Monster', 'Energy', '1992-06-17', 'm', '180');
/*!40000 ALTER TABLE `characters` ENABLE KEYS */;

-- Dumping structure for table monster_taeratto.datastore
CREATE TABLE IF NOT EXISTS `datastore` (
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table monster_taeratto.datastore: ~2 rows (approximately)
/*!40000 ALTER TABLE `datastore` DISABLE KEYS */;
INSERT INTO `datastore` (`name`, `label`, `shared`) VALUES
	('society_ambulance', 'EMS', 1),
	('society_police', 'Police', 1);
/*!40000 ALTER TABLE `datastore` ENABLE KEYS */;

-- Dumping structure for table monster_taeratto.datastore_data
CREATE TABLE IF NOT EXISTS `datastore_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `owner` varchar(60) COLLATE utf8mb4_bin DEFAULT NULL,
  `data` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_datastore_data_name_owner` (`name`,`owner`),
  KEY `index_datastore_data_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table monster_taeratto.datastore_data: ~2 rows (approximately)
/*!40000 ALTER TABLE `datastore_data` DISABLE KEYS */;
INSERT INTO `datastore_data` (`id`, `name`, `owner`, `data`) VALUES
	(1, 'society_ambulance', NULL, '{}'),
	(2, 'society_police', NULL, '{}');
/*!40000 ALTER TABLE `datastore_data` ENABLE KEYS */;

-- Dumping structure for table monster_taeratto.disc_ammo
CREATE TABLE IF NOT EXISTS `disc_ammo` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `owner` text COLLATE utf8mb4_bin NOT NULL,
  `hash` text COLLATE utf8mb4_bin NOT NULL,
  `count` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table monster_taeratto.disc_ammo: ~0 rows (approximately)
/*!40000 ALTER TABLE `disc_ammo` DISABLE KEYS */;
INSERT INTO `disc_ammo` (`id`, `owner`, `hash`, `count`) VALUES
	(1, 'steam:110000136d7e33f', '-1786099057', 0);
/*!40000 ALTER TABLE `disc_ammo` ENABLE KEYS */;

-- Dumping structure for table monster_taeratto.disc_inventory
CREATE TABLE IF NOT EXISTS `disc_inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` text COLLATE utf8mb4_bin NOT NULL,
  `type` text COLLATE utf8mb4_bin DEFAULT NULL,
  `data` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table monster_taeratto.disc_inventory: ~0 rows (approximately)
/*!40000 ALTER TABLE `disc_inventory` DISABLE KEYS */;
INSERT INTO `disc_inventory` (`id`, `owner`, `type`, `data`) VALUES
	(1, 'steam:110000136d7e33f', 'player', '{"20":{"name":"WEAPON_BAT","count":2},"10":{"count":3,"name":"WEAPON_BAT"},"5":{"name":"WEAPON_BAT","count":2},"4":{"name":"WEAPON_BAT","count":2},"14":{"name":"WEAPON_BAT","count":2},"13":{"name":"WEAPON_BAT","count":2},"12":{"name":"WEAPON_BAT","count":2},"8":{"name":"WEAPON_BAT","count":2},"9":{"name":"WEAPON_BAT","count":2},"15":{"name":"WEAPON_BAT","count":2},"7":{"name":"WEAPON_BAT","count":2},"18":{"name":"WEAPON_BAT","count":2},"19":{"name":"WEAPON_BAT","count":2},"16":{"name":"WEAPON_BAT","count":2},"17":{"name":"WEAPON_BAT","count":2}}');
/*!40000 ALTER TABLE `disc_inventory` ENABLE KEYS */;

-- Dumping structure for table monster_taeratto.disc_inventory_itemdata
CREATE TABLE IF NOT EXISTS `disc_inventory_itemdata` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8mb4_bin NOT NULL,
  `description` text COLLATE utf8mb4_bin DEFAULT NULL,
  `weight` int(11) NOT NULL DEFAULT 0,
  `closeonuse` tinyint(1) NOT NULL DEFAULT 0,
  `max` int(11) NOT NULL DEFAULT 100,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table monster_taeratto.disc_inventory_itemdata: ~0 rows (approximately)
/*!40000 ALTER TABLE `disc_inventory_itemdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `disc_inventory_itemdata` ENABLE KEYS */;

-- Dumping structure for table monster_taeratto.fine_types
CREATE TABLE IF NOT EXISTS `fine_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table monster_taeratto.fine_types: ~52 rows (approximately)
/*!40000 ALTER TABLE `fine_types` DISABLE KEYS */;
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(1, 'Misuse of a horn', 30, 0),
	(2, 'Illegally Crossing a continuous Line', 40, 0),
	(3, 'Driving on the wrong side of the road', 250, 0),
	(4, 'Illegal U-Turn', 250, 0),
	(5, 'Illegally Driving Off-road', 170, 0),
	(6, 'Refusing a Lawful Command', 30, 0),
	(7, 'Illegally Stopping a Vehicle', 150, 0),
	(8, 'Illegal Parking', 70, 0),
	(9, 'Failing to Yield to the right', 70, 0),
	(10, 'Failure to comply with Vehicle Information', 90, 0),
	(11, 'Failing to stop at a Stop Sign ', 105, 0),
	(12, 'Failing to stop at a Red Light', 130, 0),
	(13, 'Illegal Passing', 100, 0),
	(14, 'Driving an illegal Vehicle', 100, 0),
	(15, 'Driving without a License', 1500, 0),
	(16, 'Hit and Run', 800, 0),
	(17, 'Exceeding Speeds Over < 5 mph', 90, 0),
	(18, 'Exceeding Speeds Over 5-15 mph', 120, 0),
	(19, 'Exceeding Speeds Over 15-30 mph', 180, 0),
	(20, 'Exceeding Speeds Over > 30 mph', 300, 0),
	(21, 'Impeding traffic flow', 110, 1),
	(22, 'Public Intoxication', 90, 1),
	(23, 'Disorderly conduct', 90, 1),
	(24, 'Obstruction of Justice', 130, 1),
	(25, 'Insults towards Civilans', 75, 1),
	(26, 'Disrespecting of an LEO', 110, 1),
	(27, 'Verbal Threat towards a Civilan', 90, 1),
	(28, 'Verbal Threat towards an LEO', 150, 1),
	(29, 'Providing False Information', 250, 1),
	(30, 'Attempt of Corruption', 1500, 1),
	(31, 'Brandishing a weapon in city Limits', 120, 2),
	(32, 'Brandishing a Lethal Weapon in city Limits', 300, 2),
	(33, 'No Firearms License', 600, 2),
	(34, 'Possession of an Illegal Weapon', 700, 2),
	(35, 'Possession of Burglary Tools', 300, 2),
	(36, 'Grand Theft Auto', 1800, 2),
	(37, 'Intent to Sell/Distrube of an illegal Substance', 1500, 2),
	(38, 'Frabrication of an Illegal Substance', 1500, 2),
	(39, 'Possession of an Illegal Substance ', 650, 2),
	(40, 'Kidnapping of a Civilan', 1500, 2),
	(41, 'Kidnapping of an LEO', 2000, 2),
	(42, 'Robbery', 650, 2),
	(43, 'Armed Robbery of a Store', 650, 2),
	(44, 'Armed Robbery of a Bank', 1500, 2),
	(45, 'Assault on a Civilian', 2000, 3),
	(46, 'Assault of an LEO', 2500, 3),
	(47, 'Attempt of Murder of a Civilian', 3000, 3),
	(48, 'Attempt of Murder of an LEO', 5000, 3),
	(49, 'Murder of a Civilian', 10000, 3),
	(50, 'Murder of an LEO', 30000, 3),
	(51, 'Involuntary manslaughter', 1800, 3),
	(52, 'Fraud', 2000, 2);
/*!40000 ALTER TABLE `fine_types` ENABLE KEYS */;

-- Dumping structure for table monster_taeratto.items
CREATE TABLE IF NOT EXISTS `items` (
  `name` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `weight` int(11) NOT NULL DEFAULT 1,
  `rare` tinyint(1) NOT NULL DEFAULT 0,
  `can_remove` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table monster_taeratto.items: ~84 rows (approximately)
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
	('WEAPON_ADVANCEDRIFLE', 'Advanced Rifle', 1000, 0, 1),
	('WEAPON_APPISTOL', 'AP Pistol', 1000, 0, 1),
	('WEAPON_ASSAULTRIFLE', 'Assault Rifle', 1000, 0, 1),
	('WEAPON_ASSAULTSHOTGUN', 'Assault Shotgun', 1000, 0, 1),
	('WEAPON_ASSAULTSMG', 'Assault SMG', 1000, 0, 1),
	('WEAPON_AUTOSHOTGUN', 'Auto Shotgun', 1000, 0, 1),
	('WEAPON_BALL', 'Ball', 1000, 0, 1),
	('WEAPON_BAT', 'Bat', 1000, 0, 1),
	('WEAPON_BATTLEAXE', 'Battle Axe', 1000, 0, 1),
	('WEAPON_BOTTLE', 'Bottle', 1000, 0, 1),
	('WEAPON_BULLPUPRIFLE', 'Bullpup Rifle', 1000, 0, 1),
	('WEAPON_BULLPUPSHOTGUN', 'Bullpup Shotgun', 1000, 0, 1),
	('WEAPON_BZGAS', 'BZ Gas', 1000, 0, 1),
	('WEAPON_CARBINERIFLE', 'Carbine Rifle', 1000, 0, 1),
	('WEAPON_COMBATMG', 'Combat MG', 1000, 0, 1),
	('WEAPON_COMBATPDW', 'Combat PDW', 1000, 0, 1),
	('WEAPON_COMBATPISTOL', 'Combat Pistol', 1000, 0, 1),
	('WEAPON_COMPACTLAUNCHER', 'Compact Launcher', 1000, 0, 1),
	('WEAPON_COMPACTRIFLE', 'Compact Rifle', 1000, 0, 1),
	('WEAPON_CROWBAR', 'Crowbar', 1000, 0, 1),
	('WEAPON_DAGGER', 'Dagger', 1000, 0, 1),
	('WEAPON_DBSHOTGUN', 'Double Barrel Shotgun', 1000, 0, 1),
	('WEAPON_DIGISCANNER', 'Digiscanner', 1000, 0, 1),
	('WEAPON_DOUBLEACTION', 'Double Action Revolver', 1000, 0, 1),
	('WEAPON_FIREEXTINGUISHER', 'Fire Extinguisher', 1000, 0, 1),
	('WEAPON_FIREWORK', 'Firework Launcher', 1000, 0, 1),
	('WEAPON_FLARE', 'Flare', 1000, 0, 1),
	('WEAPON_FLAREGUN', 'Flare Gun', 1000, 0, 1),
	('WEAPON_FLASHLIGHT', 'Flashlight', 1000, 0, 1),
	('WEAPON_GARBAGEBAG', 'Garbage Bag', 1000, 0, 1),
	('WEAPON_GOLFCLUB', 'Golf Club', 1000, 0, 1),
	('WEAPON_GRENADE', 'Grenade', 1000, 0, 1),
	('WEAPON_GRENADELAUNCHER', 'Gernade Launcher', 1000, 0, 1),
	('WEAPON_GUSENBERG', 'Gusenberg', 1000, 0, 1),
	('WEAPON_HAMMER', 'Hammer', 1000, 0, 1),
	('WEAPON_HANDCUFFS', 'Handcuffs', 1000, 0, 1),
	('WEAPON_HATCHET', 'Hatchet', 1000, 0, 1),
	('WEAPON_HEAVYPISTOL', 'Heavy Pistol', 1000, 0, 1),
	('WEAPON_HEAVYSHOTGUN', 'Heavy Shotgun', 1000, 0, 1),
	('WEAPON_HEAVYSNIPER', 'Heavy Sniper', 1000, 0, 1),
	('WEAPON_HOMINGLAUNCHER', 'Homing Launcher', 1000, 0, 1),
	('WEAPON_KNIFE', 'Knife', 1000, 0, 1),
	('WEAPON_KNUCKLE', 'Knuckle Dusters ', 1000, 0, 1),
	('WEAPON_MACHETE', 'Machete', 1000, 0, 1),
	('WEAPON_MACHINEPISTOL', 'Machine Pistol', 1000, 0, 1),
	('WEAPON_MARKSMANPISTOL', 'Marksman Pistol', 1000, 0, 1),
	('WEAPON_MARKSMANRIFLE', 'Marksman Rifle', 1000, 0, 1),
	('WEAPON_MG', 'MG', 1000, 0, 1),
	('WEAPON_MICROSMG', 'Micro SMG', 1000, 0, 1),
	('WEAPON_MINIGUN', 'Minigun', 1000, 0, 1),
	('WEAPON_MINISMG', 'Mini SMG', 1000, 0, 1),
	('WEAPON_MOLOTOV', 'Molotov', 1000, 0, 1),
	('WEAPON_MUSKET', 'Musket', 1000, 0, 1),
	('WEAPON_NIGHTSTICK', 'Police Baton', 1000, 0, 1),
	('WEAPON_PETROLCAN', 'Petrol Can', 1000, 0, 1),
	('WEAPON_PIPEBOMB', 'Pipe Bomb', 1000, 0, 1),
	('WEAPON_PISTOL', 'Pistol', 1000, 0, 1),
	('WEAPON_PISTOL50', 'Police .50', 1000, 0, 1),
	('WEAPON_POOLCUE', 'Pool Cue', 1000, 0, 1),
	('WEAPON_PROXMINE', 'Proximity Mine', 1000, 0, 1),
	('WEAPON_PUMPSHOTGUN', 'Pump Shotgun', 1000, 0, 1),
	('WEAPON_RAILGUN', 'Rail Gun', 1000, 0, 1),
	('WEAPON_REVOLVER', 'Revolver', 1000, 0, 1),
	('WEAPON_RPG', 'RPG', 1000, 0, 1),
	('WEAPON_SAWNOFFSHOTGUN', 'Sawn Off Shotgun', 1000, 0, 1),
	('WEAPON_SMG', 'SMG', 1000, 0, 1),
	('WEAPON_SMOKEGRENADE', 'Smoke Gernade', 1000, 0, 1),
	('WEAPON_SNIPERRIFLE', 'Sniper Rifle', 1000, 0, 1),
	('WEAPON_SNOWBALL', 'Snow Ball', 1000, 0, 1),
	('WEAPON_SNSPISTOL', 'SNS Pistol', 1000, 0, 1),
	('WEAPON_SPECIALCARBINE', 'Special Rifle', 1000, 0, 1),
	('WEAPON_STICKYBOMB', 'Sticky Bombs', 1000, 0, 1),
	('WEAPON_STINGER', 'Stinger', 1000, 0, 1),
	('WEAPON_STUNGUN', 'Police Taser', 1000, 0, 1),
	('WEAPON_SWITCHBLADE', 'Switch Blade', 1000, 0, 1),
	('WEAPON_VINTAGEPISTOL', 'Vintage Pistol', 1000, 0, 1),
	('WEAPON_WRENCH', 'Wrench', 1000, 0, 1),
	('bandage', 'Bandage', 200, 0, 1),
	('bread', 'Bread', 200, 0, 1),
	('cannabis', 'Cannabis', 300, 0, 1),
	('disc_ammo_pistol', 'Pistol Ammo', 10, 0, 1),
	('disc_ammo_pistol_large', 'Pistol Ammo Large', 10, 0, 1),
	('disc_ammo_rifle', 'Rifle Ammo', 10, 0, 1),
	('disc_ammo_rifle_large', 'Rifle Ammo Large', 10, 0, 1),
	('disc_ammo_shotgun', 'Shotgun Shells', 10, 0, 1),
	('disc_ammo_shotgun_large', 'Shotgun Shells Large', 10, 0, 1),
	('disc_ammo_smg', 'SMG Ammo', 10, 0, 1),
	('disc_ammo_smg_large', 'SMG Ammo Large', 10, 0, 1),
	('disc_ammo_snp', 'Sniper Ammo', 10, 0, 1),
	('disc_ammo_snp_large', 'Sniper Ammo Large', 10, 0, 1),
	('marijuana', 'Marijuana', 200, 0, 1),
	('medikit', 'Medikit', 200, 0, 1),
	('water', 'Water', 200, 0, 1);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;

-- Dumping structure for table monster_taeratto.jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `name` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table monster_taeratto.jobs: ~4 rows (approximately)
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` (`name`, `label`) VALUES
	('ambulance', 'EMS'),
	('cardealer', 'Cardealer'),
	('police', 'LSPD'),
	('unemployed', 'Unemployed');
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;

-- Dumping structure for table monster_taeratto.job_grades
CREATE TABLE IF NOT EXISTS `job_grades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `salary` int(11) NOT NULL,
  `skin_male` longtext COLLATE utf8mb4_bin NOT NULL,
  `skin_female` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table monster_taeratto.job_grades: ~14 rows (approximately)
/*!40000 ALTER TABLE `job_grades` DISABLE KEYS */;
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(1, 'unemployed', 0, 'unemployed', 'Unemployed', 200, '{}', '{}'),
	(2, 'police', 0, 'recruit', 'Recrue', 20, '{}', '{}'),
	(3, 'police', 1, 'officer', 'Officier', 40, '{}', '{}'),
	(4, 'police', 2, 'sergeant', 'Sergent', 60, '{}', '{}'),
	(5, 'police', 3, 'lieutenant', 'Lieutenant', 85, '{}', '{}'),
	(6, 'police', 4, 'boss', 'Chief', 100, '{}', '{}'),
	(7, 'ambulance', 0, 'ambulance', 'Jr. EMT', 20, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(8, 'ambulance', 1, 'doctor', 'EMT', 40, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(9, 'ambulance', 2, 'chief_doctor', 'Sr. EMT', 60, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(10, 'ambulance', 3, 'boss', 'EMT Supervisor', 80, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(11, 'cardealer', 0, 'recruit', 'Recruit', 10, '{}', '{}'),
	(12, 'cardealer', 1, 'novice', 'Novice', 25, '{}', '{}'),
	(13, 'cardealer', 2, 'experienced', 'Experienced', 40, '{}', '{}'),
	(14, 'cardealer', 3, 'boss', 'Boss', 0, '{}', '{}');
/*!40000 ALTER TABLE `job_grades` ENABLE KEYS */;

-- Dumping structure for table monster_taeratto.licenses
CREATE TABLE IF NOT EXISTS `licenses` (
  `type` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table monster_taeratto.licenses: ~0 rows (approximately)
/*!40000 ALTER TABLE `licenses` DISABLE KEYS */;
INSERT INTO `licenses` (`type`, `label`) VALUES
	('weed_processing', 'Weed Processing License');
/*!40000 ALTER TABLE `licenses` ENABLE KEYS */;

-- Dumping structure for table monster_taeratto.owned_vehicles
CREATE TABLE IF NOT EXISTS `owned_vehicles` (
  `owner` varchar(22) COLLATE utf8mb4_bin NOT NULL,
  `plate` varchar(12) COLLATE utf8mb4_bin NOT NULL,
  `vehicle` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `type` varchar(20) COLLATE utf8mb4_bin NOT NULL DEFAULT 'car',
  `job` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `stored` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table monster_taeratto.owned_vehicles: ~0 rows (approximately)
/*!40000 ALTER TABLE `owned_vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `owned_vehicles` ENABLE KEYS */;

-- Dumping structure for table monster_taeratto.rented_vehicles
CREATE TABLE IF NOT EXISTS `rented_vehicles` (
  `vehicle` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `plate` varchar(12) COLLATE utf8mb4_bin NOT NULL,
  `player_name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `base_price` int(11) NOT NULL,
  `rent_price` int(11) NOT NULL,
  `owner` varchar(22) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table monster_taeratto.rented_vehicles: ~0 rows (approximately)
/*!40000 ALTER TABLE `rented_vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `rented_vehicles` ENABLE KEYS */;

-- Dumping structure for table monster_taeratto.society_moneywash
CREATE TABLE IF NOT EXISTS `society_moneywash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `society` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table monster_taeratto.society_moneywash: ~0 rows (approximately)
/*!40000 ALTER TABLE `society_moneywash` DISABLE KEYS */;
/*!40000 ALTER TABLE `society_moneywash` ENABLE KEYS */;

-- Dumping structure for table monster_taeratto.users
CREATE TABLE IF NOT EXISTS `users` (
  `identifier` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `license` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `money` int(11) DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb4_bin DEFAULT '',
  `skin` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `job` varchar(50) COLLATE utf8mb4_bin DEFAULT 'unemployed',
  `job_grade` int(11) DEFAULT 0,
  `loadout` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `position` varchar(36) COLLATE utf8mb4_bin DEFAULT NULL,
  `bank` int(11) DEFAULT NULL,
  `permission_level` int(11) DEFAULT NULL,
  `group` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `firstname` varchar(50) COLLATE utf8mb4_bin DEFAULT '',
  `lastname` varchar(50) COLLATE utf8mb4_bin DEFAULT '',
  `dateofbirth` varchar(25) COLLATE utf8mb4_bin DEFAULT '',
  `sex` varchar(10) COLLATE utf8mb4_bin DEFAULT '',
  `height` varchar(5) COLLATE utf8mb4_bin DEFAULT '',
  `is_dead` tinyint(1) DEFAULT 0,
  `status` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table monster_taeratto.users: ~0 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`identifier`, `license`, `money`, `name`, `skin`, `job`, `job_grade`, `loadout`, `position`, `bank`, `permission_level`, `group`, `firstname`, `lastname`, `dateofbirth`, `sex`, `height`, `is_dead`, `status`) VALUES
	('steam:110000136d7e33f', 'license:b062c22a1088f5c0526a44c9cb865d67da13b12e', 8022, 'TaerAttO', '{"arms":0,"decals_1":0,"lipstick_2":0,"shoes_2":0,"torso_1":0,"helmet_2":0,"skin":0,"helmet_1":-1,"sun_2":0,"eye_color":0,"makeup_1":0,"hair_color_1":1,"makeup_3":0,"moles_2":0,"blush_1":0,"ears_1":-1,"shoes_1":0,"beard_2":0,"watches_1":-1,"bracelets_2":0,"torso_2":0,"blush_2":0,"moles_1":0,"bproof_1":0,"makeup_2":0,"age_2":0,"makeup_4":0,"eyebrows_1":0,"pants_2":0,"glasses_1":0,"decals_2":0,"arms_2":0,"lipstick_3":0,"bags_2":0,"bags_1":0,"ears_2":0,"chain_2":0,"sun_1":0,"pants_1":0,"chest_1":0,"eyebrows_2":0,"complexion_2":0,"bproof_2":0,"sex":0,"glasses_2":0,"hair_color_2":0,"eyebrows_3":0,"beard_1":0,"watches_2":0,"chest_3":0,"chain_1":0,"tshirt_1":0,"bracelets_1":-1,"hair_1":1,"face":0,"lipstick_1":0,"bodyb_1":0,"chest_2":0,"lipstick_4":0,"tshirt_2":0,"blemishes_2":0,"mask_2":0,"complexion_1":0,"age_1":0,"mask_1":0,"blemishes_1":0,"blush_3":0,"hair_2":0,"bodyb_2":0,"beard_4":0,"eyebrows_4":0,"beard_3":0}', 'unemployed', 0, '[]', '{"x":242.1,"y":-809.1,"z":30.2}', 33600, 0, 'user', 'Monster', 'Energy', '1992-06-17', 'm', '180', 0, '[{"val":770500,"percent":77.05,"name":"hunger"},{"val":827875,"percent":82.7875,"name":"thirst"}]');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table monster_taeratto.user_accounts
CREATE TABLE IF NOT EXISTS `user_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(22) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `money` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table monster_taeratto.user_accounts: ~0 rows (approximately)
/*!40000 ALTER TABLE `user_accounts` DISABLE KEYS */;
INSERT INTO `user_accounts` (`id`, `identifier`, `name`, `money`) VALUES
	(1, 'steam:110000136d7e33f', 'black_money', 0);
/*!40000 ALTER TABLE `user_accounts` ENABLE KEYS */;

-- Dumping structure for table monster_taeratto.user_inventory
CREATE TABLE IF NOT EXISTS `user_inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(22) COLLATE utf8mb4_bin NOT NULL,
  `item` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `count` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table monster_taeratto.user_inventory: ~93 rows (approximately)
/*!40000 ALTER TABLE `user_inventory` DISABLE KEYS */;
INSERT INTO `user_inventory` (`id`, `identifier`, `item`, `count`) VALUES
	(1, 'steam:110000136d7e33f', 'bandage', 0),
	(2, 'steam:110000136d7e33f', 'marijuana', 0),
	(3, 'steam:110000136d7e33f', 'medikit', 0),
	(4, 'steam:110000136d7e33f', 'cannabis', 0),
	(5, 'steam:110000136d7e33f', 'water', 0),
	(6, 'steam:110000136d7e33f', 'bread', 0),
	(7, 'steam:110000136d7e33f', 'WEAPON_VINTAGEPISTOL', 0),
	(8, 'steam:110000136d7e33f', 'WEAPON_MINIGUN', 0),
	(9, 'steam:110000136d7e33f', 'WEAPON_MINISMG', 0),
	(10, 'steam:110000136d7e33f', 'WEAPON_SNOWBALL', 0),
	(11, 'steam:110000136d7e33f', 'WEAPON_FIREWORK', 0),
	(12, 'steam:110000136d7e33f', 'WEAPON_HEAVYPISTOL', 0),
	(13, 'steam:110000136d7e33f', 'WEAPON_KNUCKLE', 0),
	(14, 'steam:110000136d7e33f', 'WEAPON_MARKSMANPISTOL', 0),
	(15, 'steam:110000136d7e33f', 'disc_ammo_snp_large', 0),
	(16, 'steam:110000136d7e33f', 'WEAPON_GRENADE', 0),
	(17, 'steam:110000136d7e33f', 'WEAPON_SAWNOFFSHOTGUN', 0),
	(18, 'steam:110000136d7e33f', 'WEAPON_WRENCH', 0),
	(19, 'steam:110000136d7e33f', 'WEAPON_APPISTOL', 0),
	(20, 'steam:110000136d7e33f', 'WEAPON_BOTTLE', 0),
	(21, 'steam:110000136d7e33f', 'WEAPON_PROXMINE', 0),
	(22, 'steam:110000136d7e33f', 'WEAPON_BATTLEAXE', 0),
	(23, 'steam:110000136d7e33f', 'WEAPON_MUSKET', 0),
	(24, 'steam:110000136d7e33f', 'WEAPON_BULLPUPRIFLE', 0),
	(25, 'steam:110000136d7e33f', 'WEAPON_PETROLCAN', 0),
	(26, 'steam:110000136d7e33f', 'WEAPON_FLARE', 0),
	(27, 'steam:110000136d7e33f', 'WEAPON_GARBAGEBAG', 0),
	(28, 'steam:110000136d7e33f', 'disc_ammo_snp', 0),
	(29, 'steam:110000136d7e33f', 'WEAPON_AUTOSHOTGUN', 0),
	(30, 'steam:110000136d7e33f', 'WEAPON_SNIPERRIFLE', 0),
	(31, 'steam:110000136d7e33f', 'WEAPON_RPG', 0),
	(32, 'steam:110000136d7e33f', 'WEAPON_HEAVYSNIPER', 0),
	(33, 'steam:110000136d7e33f', 'WEAPON_GUSENBERG', 0),
	(34, 'steam:110000136d7e33f', 'WEAPON_CROWBAR', 0),
	(35, 'steam:110000136d7e33f', 'WEAPON_FLASHLIGHT', 0),
	(36, 'steam:110000136d7e33f', 'WEAPON_ASSAULTRIFLE', 0),
	(37, 'steam:110000136d7e33f', 'WEAPON_COMBATPDW', 0),
	(38, 'steam:110000136d7e33f', 'WEAPON_STINGER', 0),
	(39, 'steam:110000136d7e33f', 'WEAPON_REVOLVER', 0),
	(40, 'steam:110000136d7e33f', 'disc_ammo_shotgun_large', 0),
	(41, 'steam:110000136d7e33f', 'WEAPON_SMG', 0),
	(42, 'steam:110000136d7e33f', 'WEAPON_HATCHET', 0),
	(43, 'steam:110000136d7e33f', 'WEAPON_HEAVYSHOTGUN', 0),
	(44, 'steam:110000136d7e33f', 'disc_ammo_shotgun', 0),
	(45, 'steam:110000136d7e33f', 'WEAPON_CARBINERIFLE', 0),
	(46, 'steam:110000136d7e33f', 'WEAPON_KNIFE', 0),
	(47, 'steam:110000136d7e33f', 'WEAPON_GOLFCLUB', 0),
	(48, 'steam:110000136d7e33f', 'WEAPON_HOMINGLAUNCHER', 0),
	(49, 'steam:110000136d7e33f', 'WEAPON_DAGGER', 0),
	(50, 'steam:110000136d7e33f', 'WEAPON_MACHETE', 0),
	(51, 'steam:110000136d7e33f', 'WEAPON_BZGAS', 0),
	(52, 'steam:110000136d7e33f', 'WEAPON_MG', 0),
	(53, 'steam:110000136d7e33f', 'WEAPON_PIPEBOMB', 0),
	(54, 'steam:110000136d7e33f', 'WEAPON_MOLOTOV', 0),
	(55, 'steam:110000136d7e33f', 'WEAPON_COMPACTRIFLE', 0),
	(56, 'steam:110000136d7e33f', 'WEAPON_HANDCUFFS', 0),
	(57, 'steam:110000136d7e33f', 'disc_ammo_smg', 0),
	(58, 'steam:110000136d7e33f', 'disc_ammo_smg_large', 0),
	(59, 'steam:110000136d7e33f', 'disc_ammo_rifle_large', 0),
	(60, 'steam:110000136d7e33f', 'WEAPON_GRENADELAUNCHER', 0),
	(61, 'steam:110000136d7e33f', 'WEAPON_NIGHTSTICK', 0),
	(62, 'steam:110000136d7e33f', 'WEAPON_HAMMER', 0),
	(63, 'steam:110000136d7e33f', 'disc_ammo_pistol_large', 0),
	(64, 'steam:110000136d7e33f', 'WEAPON_RAILGUN', 0),
	(65, 'steam:110000136d7e33f', 'disc_ammo_pistol', 0),
	(66, 'steam:110000136d7e33f', 'WEAPON_DBSHOTGUN', 0),
	(67, 'steam:110000136d7e33f', 'WEAPON_ASSAULTSHOTGUN', 0),
	(68, 'steam:110000136d7e33f', 'WEAPON_BALL', 0),
	(69, 'steam:110000136d7e33f', 'WEAPON_FIREEXTINGUISHER', 0),
	(70, 'steam:110000136d7e33f', 'WEAPON_MARKSMANRIFLE', 0),
	(71, 'steam:110000136d7e33f', 'WEAPON_DOUBLEACTION', 0),
	(72, 'steam:110000136d7e33f', 'WEAPON_STICKYBOMB', 0),
	(73, 'steam:110000136d7e33f', 'WEAPON_ASSAULTSMG', 0),
	(74, 'steam:110000136d7e33f', 'WEAPON_SPECIALCARBINE', 0),
	(75, 'steam:110000136d7e33f', 'WEAPON_SNSPISTOL', 0),
	(76, 'steam:110000136d7e33f', 'WEAPON_SMOKEGRENADE', 0),
	(77, 'steam:110000136d7e33f', 'WEAPON_MACHINEPISTOL', 0),
	(78, 'steam:110000136d7e33f', 'WEAPON_DIGISCANNER', 0),
	(79, 'steam:110000136d7e33f', 'WEAPON_SWITCHBLADE', 0),
	(80, 'steam:110000136d7e33f', 'WEAPON_STUNGUN', 0),
	(81, 'steam:110000136d7e33f', 'WEAPON_POOLCUE', 0),
	(82, 'steam:110000136d7e33f', 'WEAPON_COMPACTLAUNCHER', 0),
	(83, 'steam:110000136d7e33f', 'WEAPON_PISTOL50', 0),
	(84, 'steam:110000136d7e33f', 'WEAPON_COMBATMG', 0),
	(85, 'steam:110000136d7e33f', 'WEAPON_BAT', 31),
	(86, 'steam:110000136d7e33f', 'WEAPON_PISTOL', 0),
	(87, 'steam:110000136d7e33f', 'WEAPON_BULLPUPSHOTGUN', 0),
	(88, 'steam:110000136d7e33f', 'disc_ammo_rifle', 0),
	(89, 'steam:110000136d7e33f', 'WEAPON_MICROSMG', 0),
	(90, 'steam:110000136d7e33f', 'WEAPON_FLAREGUN', 0),
	(91, 'steam:110000136d7e33f', 'WEAPON_PUMPSHOTGUN', 0),
	(92, 'steam:110000136d7e33f', 'WEAPON_COMBATPISTOL', 0),
	(93, 'steam:110000136d7e33f', 'WEAPON_ADVANCEDRIFLE', 0);
/*!40000 ALTER TABLE `user_inventory` ENABLE KEYS */;

-- Dumping structure for table monster_taeratto.user_licenses
CREATE TABLE IF NOT EXISTS `user_licenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `owner` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table monster_taeratto.user_licenses: ~0 rows (approximately)
/*!40000 ALTER TABLE `user_licenses` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_licenses` ENABLE KEYS */;

-- Dumping structure for table monster_taeratto.vehicles
CREATE TABLE IF NOT EXISTS `vehicles` (
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `model` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table monster_taeratto.vehicles: ~240 rows (approximately)
/*!40000 ALTER TABLE `vehicles` DISABLE KEYS */;
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Akuma', 'AKUMA', 7500, 'motorcycles'),
	('Adder', 'adder', 900000, 'super'),
	('Alpha', 'alpha', 60000, 'sports'),
	('Ardent', 'ardent', 1150000, 'sportsclassics'),
	('Asea', 'asea', 5500, 'sedans'),
	('Autarch', 'autarch', 1955000, 'super'),
	('Avarus', 'avarus', 18000, 'motorcycles'),
	('Bagger', 'bagger', 13500, 'motorcycles'),
	('Baller', 'baller2', 40000, 'suvs'),
	('Baller Sport', 'baller3', 60000, 'suvs'),
	('Banshee', 'banshee', 70000, 'sports'),
	('Banshee 900R', 'banshee2', 255000, 'super'),
	('Bati 801', 'bati', 12000, 'motorcycles'),
	('Bati 801RR', 'bati2', 19000, 'motorcycles'),
	('Bestia GTS', 'bestiagts', 55000, 'sports'),
	('BF400', 'bf400', 6500, 'motorcycles'),
	('Bf Injection', 'bfinjection', 16000, 'offroad'),
	('Bifta', 'bifta', 12000, 'offroad'),
	('Bison', 'bison', 45000, 'vans'),
	('Blade', 'blade', 15000, 'muscle'),
	('Blazer', 'blazer', 6500, 'offroad'),
	('Blazer Sport', 'blazer4', 8500, 'offroad'),
	('blazer5', 'blazer5', 1755600, 'offroad'),
	('Blista', 'blista', 8000, 'compacts'),
	('BMX (velo)', 'bmx', 160, 'motorcycles'),
	('Bobcat XL', 'bobcatxl', 32000, 'vans'),
	('Brawler', 'brawler', 45000, 'offroad'),
	('Brioso R/A', 'brioso', 18000, 'compacts'),
	('Btype', 'btype', 62000, 'sportsclassics'),
	('Btype Hotroad', 'btype2', 155000, 'sportsclassics'),
	('Btype Luxe', 'btype3', 85000, 'sportsclassics'),
	('Buccaneer', 'buccaneer', 18000, 'muscle'),
	('Buccaneer Rider', 'buccaneer2', 24000, 'muscle'),
	('Buffalo', 'buffalo', 12000, 'sports'),
	('Buffalo S', 'buffalo2', 20000, 'sports'),
	('Bullet', 'bullet', 90000, 'super'),
	('Burrito', 'burrito3', 19000, 'vans'),
	('Camper', 'camper', 42000, 'vans'),
	('Carbonizzare', 'carbonizzare', 75000, 'sports'),
	('Carbon RS', 'carbonrs', 18000, 'motorcycles'),
	('Casco', 'casco', 30000, 'sportsclassics'),
	('Cavalcade', 'cavalcade2', 55000, 'suvs'),
	('Cheetah', 'cheetah', 375000, 'super'),
	('Chimera', 'chimera', 38000, 'motorcycles'),
	('Chino', 'chino', 15000, 'muscle'),
	('Chino Luxe', 'chino2', 19000, 'muscle'),
	('Cliffhanger', 'cliffhanger', 9500, 'motorcycles'),
	('Cognoscenti Cabrio', 'cogcabrio', 55000, 'coupes'),
	('Cognoscenti', 'cognoscenti', 55000, 'sedans'),
	('Comet', 'comet2', 65000, 'sports'),
	('Comet 5', 'comet5', 1145000, 'sports'),
	('Contender', 'contender', 70000, 'suvs'),
	('Coquette', 'coquette', 65000, 'sports'),
	('Coquette Classic', 'coquette2', 40000, 'sportsclassics'),
	('Coquette BlackFin', 'coquette3', 55000, 'muscle'),
	('Cruiser (velo)', 'cruiser', 510, 'motorcycles'),
	('Cyclone', 'cyclone', 1890000, 'super'),
	('Daemon', 'daemon', 11500, 'motorcycles'),
	('Daemon High', 'daemon2', 13500, 'motorcycles'),
	('Defiler', 'defiler', 9800, 'motorcycles'),
	('Deluxo', 'deluxo', 4721500, 'sportsclassics'),
	('Dominator', 'dominator', 35000, 'muscle'),
	('Double T', 'double', 28000, 'motorcycles'),
	('Dubsta', 'dubsta', 45000, 'suvs'),
	('Dubsta Luxuary', 'dubsta2', 60000, 'suvs'),
	('Bubsta 6x6', 'dubsta3', 120000, 'offroad'),
	('Dukes', 'dukes', 28000, 'muscle'),
	('Dune Buggy', 'dune', 8000, 'offroad'),
	('Elegy', 'elegy2', 38500, 'sports'),
	('Emperor', 'emperor', 8500, 'sedans'),
	('Enduro', 'enduro', 5500, 'motorcycles'),
	('Entity XF', 'entityxf', 425000, 'super'),
	('Esskey', 'esskey', 4200, 'motorcycles'),
	('Exemplar', 'exemplar', 32000, 'coupes'),
	('F620', 'f620', 40000, 'coupes'),
	('Faction', 'faction', 20000, 'muscle'),
	('Faction Rider', 'faction2', 30000, 'muscle'),
	('Faction XL', 'faction3', 40000, 'muscle'),
	('Faggio', 'faggio', 1900, 'motorcycles'),
	('Vespa', 'faggio2', 2800, 'motorcycles'),
	('Felon', 'felon', 42000, 'coupes'),
	('Felon GT', 'felon2', 55000, 'coupes'),
	('Feltzer', 'feltzer2', 55000, 'sports'),
	('Stirling GT', 'feltzer3', 65000, 'sportsclassics'),
	('Fixter (velo)', 'fixter', 225, 'motorcycles'),
	('FMJ', 'fmj', 185000, 'super'),
	('Fhantom', 'fq2', 17000, 'suvs'),
	('Fugitive', 'fugitive', 12000, 'sedans'),
	('Furore GT', 'furoregt', 45000, 'sports'),
	('Fusilade', 'fusilade', 40000, 'sports'),
	('Gargoyle', 'gargoyle', 16500, 'motorcycles'),
	('Gauntlet', 'gauntlet', 30000, 'muscle'),
	('Gang Burrito', 'gburrito', 45000, 'vans'),
	('Burrito', 'gburrito2', 29000, 'vans'),
	('Glendale', 'glendale', 6500, 'sedans'),
	('Grabger', 'granger', 50000, 'suvs'),
	('Gresley', 'gresley', 47500, 'suvs'),
	('GT 500', 'gt500', 785000, 'sportsclassics'),
	('Guardian', 'guardian', 45000, 'offroad'),
	('Hakuchou', 'hakuchou', 31000, 'motorcycles'),
	('Hakuchou Sport', 'hakuchou2', 55000, 'motorcycles'),
	('Hermes', 'hermes', 535000, 'muscle'),
	('Hexer', 'hexer', 12000, 'motorcycles'),
	('Hotknife', 'hotknife', 125000, 'muscle'),
	('Huntley S', 'huntley', 40000, 'suvs'),
	('Hustler', 'hustler', 625000, 'muscle'),
	('Infernus', 'infernus', 180000, 'super'),
	('Innovation', 'innovation', 23500, 'motorcycles'),
	('Intruder', 'intruder', 7500, 'sedans'),
	('Issi', 'issi2', 10000, 'compacts'),
	('Jackal', 'jackal', 38000, 'coupes'),
	('Jester', 'jester', 65000, 'sports'),
	('Jester(Racecar)', 'jester2', 135000, 'sports'),
	('Journey', 'journey', 6500, 'vans'),
	('Kamacho', 'kamacho', 345000, 'offroad'),
	('Khamelion', 'khamelion', 38000, 'sports'),
	('Kuruma', 'kuruma', 30000, 'sports'),
	('Landstalker', 'landstalker', 35000, 'suvs'),
	('RE-7B', 'le7b', 325000, 'super'),
	('Lynx', 'lynx', 40000, 'sports'),
	('Mamba', 'mamba', 70000, 'sports'),
	('Manana', 'manana', 12800, 'sportsclassics'),
	('Manchez', 'manchez', 5300, 'motorcycles'),
	('Massacro', 'massacro', 65000, 'sports'),
	('Massacro(Racecar)', 'massacro2', 130000, 'sports'),
	('Mesa', 'mesa', 16000, 'suvs'),
	('Mesa Trail', 'mesa3', 40000, 'suvs'),
	('Minivan', 'minivan', 13000, 'vans'),
	('Monroe', 'monroe', 55000, 'sportsclassics'),
	('The Liberator', 'monster', 210000, 'offroad'),
	('Moonbeam', 'moonbeam', 18000, 'vans'),
	('Moonbeam Rider', 'moonbeam2', 35000, 'vans'),
	('Nemesis', 'nemesis', 5800, 'motorcycles'),
	('Neon', 'neon', 1500000, 'sports'),
	('Nightblade', 'nightblade', 35000, 'motorcycles'),
	('Nightshade', 'nightshade', 65000, 'muscle'),
	('9F', 'ninef', 65000, 'sports'),
	('9F Cabrio', 'ninef2', 80000, 'sports'),
	('Omnis', 'omnis', 35000, 'sports'),
	('Oppressor', 'oppressor', 3524500, 'super'),
	('Oracle XS', 'oracle2', 35000, 'coupes'),
	('Osiris', 'osiris', 160000, 'super'),
	('Panto', 'panto', 10000, 'compacts'),
	('Paradise', 'paradise', 19000, 'vans'),
	('Pariah', 'pariah', 1420000, 'sports'),
	('Patriot', 'patriot', 55000, 'suvs'),
	('PCJ-600', 'pcj', 6200, 'motorcycles'),
	('Penumbra', 'penumbra', 28000, 'sports'),
	('Pfister', 'pfister811', 85000, 'super'),
	('Phoenix', 'phoenix', 12500, 'muscle'),
	('Picador', 'picador', 18000, 'muscle'),
	('Pigalle', 'pigalle', 20000, 'sportsclassics'),
	('Prairie', 'prairie', 12000, 'compacts'),
	('Premier', 'premier', 8000, 'sedans'),
	('Primo Custom', 'primo2', 14000, 'sedans'),
	('X80 Proto', 'prototipo', 2500000, 'super'),
	('Radius', 'radi', 29000, 'suvs'),
	('raiden', 'raiden', 1375000, 'sports'),
	('Rapid GT', 'rapidgt', 35000, 'sports'),
	('Rapid GT Convertible', 'rapidgt2', 45000, 'sports'),
	('Rapid GT3', 'rapidgt3', 885000, 'sportsclassics'),
	('Reaper', 'reaper', 150000, 'super'),
	('Rebel', 'rebel2', 35000, 'offroad'),
	('Regina', 'regina', 5000, 'sedans'),
	('Retinue', 'retinue', 615000, 'sportsclassics'),
	('Revolter', 'revolter', 1610000, 'sports'),
	('riata', 'riata', 380000, 'offroad'),
	('Rocoto', 'rocoto', 45000, 'suvs'),
	('Ruffian', 'ruffian', 6800, 'motorcycles'),
	('Ruiner 2', 'ruiner2', 5745600, 'muscle'),
	('Rumpo', 'rumpo', 15000, 'vans'),
	('Rumpo Trail', 'rumpo3', 19500, 'vans'),
	('Sabre Turbo', 'sabregt', 20000, 'muscle'),
	('Sabre GT', 'sabregt2', 25000, 'muscle'),
	('Sanchez', 'sanchez', 5300, 'motorcycles'),
	('Sanchez Sport', 'sanchez2', 5300, 'motorcycles'),
	('Sanctus', 'sanctus', 25000, 'motorcycles'),
	('Sandking', 'sandking', 55000, 'offroad'),
	('Savestra', 'savestra', 990000, 'sportsclassics'),
	('SC 1', 'sc1', 1603000, 'super'),
	('Schafter', 'schafter2', 25000, 'sedans'),
	('Schafter V12', 'schafter3', 50000, 'sports'),
	('Scorcher (velo)', 'scorcher', 280, 'motorcycles'),
	('Seminole', 'seminole', 25000, 'suvs'),
	('Sentinel', 'sentinel', 32000, 'coupes'),
	('Sentinel XS', 'sentinel2', 40000, 'coupes'),
	('Sentinel3', 'sentinel3', 650000, 'sports'),
	('Seven 70', 'seven70', 39500, 'sports'),
	('ETR1', 'sheava', 220000, 'super'),
	('Shotaro Concept', 'shotaro', 320000, 'motorcycles'),
	('Slam Van', 'slamvan3', 11500, 'muscle'),
	('Sovereign', 'sovereign', 22000, 'motorcycles'),
	('Stinger', 'stinger', 80000, 'sportsclassics'),
	('Stinger GT', 'stingergt', 75000, 'sportsclassics'),
	('Streiter', 'streiter', 500000, 'sports'),
	('Stretch', 'stretch', 90000, 'sedans'),
	('Stromberg', 'stromberg', 3185350, 'sports'),
	('Sultan', 'sultan', 15000, 'sports'),
	('Sultan RS', 'sultanrs', 65000, 'super'),
	('Super Diamond', 'superd', 130000, 'sedans'),
	('Surano', 'surano', 50000, 'sports'),
	('Surfer', 'surfer', 12000, 'vans'),
	('T20', 't20', 300000, 'super'),
	('Tailgater', 'tailgater', 30000, 'sedans'),
	('Tampa', 'tampa', 16000, 'muscle'),
	('Drift Tampa', 'tampa2', 80000, 'sports'),
	('Thrust', 'thrust', 24000, 'motorcycles'),
	('Tri bike (velo)', 'tribike3', 520, 'motorcycles'),
	('Trophy Truck', 'trophytruck', 60000, 'offroad'),
	('Trophy Truck Limited', 'trophytruck2', 80000, 'offroad'),
	('Tropos', 'tropos', 40000, 'sports'),
	('Turismo R', 'turismor', 350000, 'super'),
	('Tyrus', 'tyrus', 600000, 'super'),
	('Vacca', 'vacca', 120000, 'super'),
	('Vader', 'vader', 7200, 'motorcycles'),
	('Verlierer', 'verlierer2', 70000, 'sports'),
	('Vigero', 'vigero', 12500, 'muscle'),
	('Virgo', 'virgo', 14000, 'muscle'),
	('Viseris', 'viseris', 875000, 'sportsclassics'),
	('Visione', 'visione', 2250000, 'super'),
	('Voltic', 'voltic', 90000, 'super'),
	('Voltic 2', 'voltic2', 3830400, 'super'),
	('Voodoo', 'voodoo', 7200, 'muscle'),
	('Vortex', 'vortex', 9800, 'motorcycles'),
	('Warrener', 'warrener', 4000, 'sedans'),
	('Washington', 'washington', 9000, 'sedans'),
	('Windsor', 'windsor', 95000, 'coupes'),
	('Windsor Drop', 'windsor2', 125000, 'coupes'),
	('Woflsbane', 'wolfsbane', 9000, 'motorcycles'),
	('XLS', 'xls', 32000, 'suvs'),
	('Yosemite', 'yosemite', 485000, 'muscle'),
	('Youga', 'youga', 10800, 'vans'),
	('Youga Luxuary', 'youga2', 14500, 'vans'),
	('Z190', 'z190', 900000, 'sportsclassics'),
	('Zentorno', 'zentorno', 1500000, 'super'),
	('Zion', 'zion', 36000, 'coupes'),
	('Zion Cabrio', 'zion2', 45000, 'coupes'),
	('Zombie', 'zombiea', 9500, 'motorcycles'),
	('Zombie Luxuary', 'zombieb', 12000, 'motorcycles'),
	('Z-Type', 'ztype', 220000, 'sportsclassics');
/*!40000 ALTER TABLE `vehicles` ENABLE KEYS */;

-- Dumping structure for table monster_taeratto.vehicle_categories
CREATE TABLE IF NOT EXISTS `vehicle_categories` (
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table monster_taeratto.vehicle_categories: ~11 rows (approximately)
/*!40000 ALTER TABLE `vehicle_categories` DISABLE KEYS */;
INSERT INTO `vehicle_categories` (`name`, `label`) VALUES
	('compacts', 'Compacts'),
	('coupes', 'Coupes'),
	('motorcycles', 'Motos'),
	('muscle', 'Muscle'),
	('offroad', 'Off Road'),
	('sedans', 'Sedans'),
	('sports', 'Sports'),
	('sportsclassics', 'Sports Classics'),
	('super', 'Super'),
	('suvs', 'SUVs'),
	('vans', 'Vans');
/*!40000 ALTER TABLE `vehicle_categories` ENABLE KEYS */;

-- Dumping structure for table monster_taeratto.vehicle_sold
CREATE TABLE IF NOT EXISTS `vehicle_sold` (
  `client` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `model` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `plate` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `soldby` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `date` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table monster_taeratto.vehicle_sold: ~0 rows (approximately)
/*!40000 ALTER TABLE `vehicle_sold` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehicle_sold` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

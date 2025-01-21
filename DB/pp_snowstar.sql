/*
Navicat MySQL Data Transfer

Source Server         : smash
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : psbodb2

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2025-01-21 05:47:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `accepted_gifts`
-- ----------------------------
DROP TABLE IF EXISTS `accepted_gifts`;
CREATE TABLE `accepted_gifts` (
  `GiftID` bigint(20) unsigned DEFAULT NULL,
  `PlayerID` int(10) unsigned NOT NULL,
  `ItemID` int(10) unsigned NOT NULL,
  `send_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `message` text NOT NULL,
  `sender` tinytext NOT NULL,
  `DayCount` int(11) NOT NULL DEFAULT 0,
  `ShopID` bigint(20) NOT NULL DEFAULT -1,
  `GiftState` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- ----------------------------
-- Records of accepted_gifts
-- ----------------------------

-- ----------------------------
-- Table structure for `accounts`
-- ----------------------------
DROP TABLE IF EXISTS `accounts`;
CREATE TABLE `accounts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(21) NOT NULL,
  `passwd` varchar(74) NOT NULL,
  `banned` bigint(20) unsigned NOT NULL DEFAULT 0,
  `character_name` varchar(21) NOT NULL,
  `salt` varchar(10) NOT NULL DEFAULT '',
  `email` text DEFAULT NULL,
  `reg_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `ban_reason` text DEFAULT NULL,
  `launcherPasswordHash` text NOT NULL,
  `passwordResetToken` text NOT NULL,
  `activateToken` text NOT NULL,
  `last_login` timestamp NOT NULL DEFAULT current_timestamp(),
  `login_ip` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_accounts_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- ----------------------------
-- Records of accounts
-- ----------------------------

-- ----------------------------
-- Table structure for `backup_season_records`
-- ----------------------------
DROP TABLE IF EXISTS `backup_season_records`;
CREATE TABLE `backup_season_records` (
  `season_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `char_id` int(10) unsigned NOT NULL DEFAULT 0,
  `mapid` int(10) unsigned NOT NULL DEFAULT 0,
  `laptime_best` float DEFAULT NULL,
  `run_count` int(10) unsigned DEFAULT NULL,
  `laptime_avarage` float DEFAULT NULL,
  `score_best` int(11) DEFAULT NULL,
  `score_avarage` int(11) DEFAULT NULL,
  `combo_best` int(11) DEFAULT NULL,
  `combo_avarage` int(11) DEFAULT NULL,
  PRIMARY KEY (`season_id`,`char_id`,`mapid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- ----------------------------
-- Records of backup_season_records
-- ----------------------------

-- ----------------------------
-- Table structure for `backup_season_skillpoints`
-- ----------------------------
DROP TABLE IF EXISTS `backup_season_skillpoints`;
CREATE TABLE `backup_season_skillpoints` (
  `season_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `char_id` int(11) unsigned NOT NULL DEFAULT 0,
  `skill_points` bigint(20) NOT NULL,
  PRIMARY KEY (`season_id`,`char_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- ----------------------------
-- Records of backup_season_skillpoints
-- ----------------------------

-- ----------------------------
-- Table structure for `bulletin`
-- ----------------------------
DROP TABLE IF EXISTS `bulletin`;
CREATE TABLE `bulletin` (
  `id` int(11) unsigned NOT NULL,
  `guild_id` int(11) unsigned NOT NULL DEFAULT 0,
  `name` tinytext NOT NULL,
  `msg` text NOT NULL,
  `is_deleted` int(11) unsigned NOT NULL DEFAULT 0,
  `postedAt` int(11) NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `index1` (`guild_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- ----------------------------
-- Records of bulletin
-- ----------------------------

-- ----------------------------
-- Table structure for `characters`
-- ----------------------------
DROP TABLE IF EXISTS `characters`;
CREATE TABLE `characters` (
  `id` int(11) unsigned NOT NULL,
  `name` varchar(21) NOT NULL,
  `level` int(11) unsigned NOT NULL DEFAULT 0,
  `experience` bigint(20) unsigned NOT NULL DEFAULT 0,
  `popularity` int(11) NOT NULL DEFAULT 0,
  `guildid` int(11) unsigned NOT NULL DEFAULT 0,
  `guild_points` int(11) unsigned NOT NULL DEFAULT 0,
  `guild_rank` int(11) unsigned NOT NULL DEFAULT 1,
  `pro` int(11) unsigned NOT NULL DEFAULT 0,
  `cash` int(11) unsigned NOT NULL DEFAULT 0,
  `avatar` tinyint(3) unsigned NOT NULL DEFAULT 2,
  `race_point` int(11) NOT NULL DEFAULT 0,
  `battle_point` int(11) NOT NULL DEFAULT 0,
  `player_rank` tinyint(4) NOT NULL DEFAULT 0,
  `race_rank` int(11) unsigned NOT NULL DEFAULT 0,
  `hair2` int(11) NOT NULL DEFAULT 16777215,
  `hair3` int(11) NOT NULL DEFAULT 0,
  `hair4` int(11) NOT NULL DEFAULT 16777215,
  `hair5` int(11) NOT NULL DEFAULT 16777215,
  `gems` blob DEFAULT NULL,
  `cubes` blob DEFAULT NULL,
  `equips` blob DEFAULT NULL,
  `userdata` blob DEFAULT NULL,
  `is_online` int(11) NOT NULL DEFAULT 0,
  `last_daily_cash` bigint(20) unsigned NOT NULL DEFAULT 0,
  `skill_points` bigint(20) NOT NULL DEFAULT 0,
  `skill_season_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `voted` timestamp NULL DEFAULT NULL,
  `spruns` int(11) unsigned NOT NULL DEFAULT 0,
  `inactive_days` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`) USING BTREE,
  KEY `index1` (`guildid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- ----------------------------
-- Records of characters
-- ----------------------------

-- ----------------------------
-- Table structure for `current_season_records`
-- ----------------------------
DROP TABLE IF EXISTS `current_season_records`;
CREATE TABLE `current_season_records` (
  `season_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `char_id` int(10) unsigned NOT NULL DEFAULT 0,
  `mapid` int(10) unsigned NOT NULL DEFAULT 0,
  `laptime_best` float DEFAULT NULL,
  `run_count` int(10) unsigned DEFAULT NULL,
  `laptime_avarage` float DEFAULT NULL,
  `score_best` int(11) DEFAULT NULL,
  `score_avarage` int(11) DEFAULT NULL,
  `combo_best` int(11) DEFAULT NULL,
  `combo_avarage` int(11) DEFAULT NULL,
  PRIMARY KEY (`season_id`,`char_id`,`mapid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- ----------------------------
-- Records of current_season_records
-- ----------------------------

-- ----------------------------
-- Table structure for `deleted_fashion`
-- ----------------------------
DROP TABLE IF EXISTS `deleted_fashion`;
CREATE TABLE `deleted_fashion` (
  `id` bigint(20) DEFAULT NULL,
  `character_id` int(10) unsigned NOT NULL,
  `itemid` int(10) unsigned NOT NULL,
  `itemslot` int(11) NOT NULL,
  `expiration` bigint(20) unsigned DEFAULT NULL,
  `gem1` mediumint(9) NOT NULL DEFAULT 0,
  `gem2` mediumint(9) NOT NULL DEFAULT 0,
  `gem3` mediumint(9) NOT NULL DEFAULT 0,
  `gem4` mediumint(9) NOT NULL DEFAULT 0,
  `gem5` mediumint(9) NOT NULL DEFAULT 0,
  `gem6` mediumint(9) NOT NULL DEFAULT 0,
  `gem7` mediumint(9) NOT NULL DEFAULT 0,
  `gem8` mediumint(9) NOT NULL DEFAULT 0,
  `ShopID` bigint(20) NOT NULL DEFAULT -1,
  `color` int(11) unsigned DEFAULT 16777215
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- ----------------------------
-- Records of deleted_fashion
-- ----------------------------

-- ----------------------------
-- Table structure for `exp_list`
-- ----------------------------
DROP TABLE IF EXISTS `exp_list`;
CREATE TABLE `exp_list` (
  `level` int(11) NOT NULL,
  `value` bigint(20) NOT NULL,
  PRIMARY KEY (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- ----------------------------
-- Records of exp_list
-- ----------------------------
INSERT INTO `exp_list` VALUES ('-1', '0');
INSERT INTO `exp_list` VALUES ('0', '0');
INSERT INTO `exp_list` VALUES ('1', '800');
INSERT INTO `exp_list` VALUES ('2', '2000');
INSERT INTO `exp_list` VALUES ('3', '4000');
INSERT INTO `exp_list` VALUES ('4', '6800');
INSERT INTO `exp_list` VALUES ('5', '10400');
INSERT INTO `exp_list` VALUES ('6', '16400');
INSERT INTO `exp_list` VALUES ('7', '24400');
INSERT INTO `exp_list` VALUES ('8', '31900');
INSERT INTO `exp_list` VALUES ('9', '36400');
INSERT INTO `exp_list` VALUES ('10', '39900');
INSERT INTO `exp_list` VALUES ('11', '42400');
INSERT INTO `exp_list` VALUES ('12', '44900');
INSERT INTO `exp_list` VALUES ('13', '48400');
INSERT INTO `exp_list` VALUES ('14', '53900');
INSERT INTO `exp_list` VALUES ('15', '62400');
INSERT INTO `exp_list` VALUES ('16', '73400');
INSERT INTO `exp_list` VALUES ('17', '85400');
INSERT INTO `exp_list` VALUES ('18', '100400');
INSERT INTO `exp_list` VALUES ('19', '119400');
INSERT INTO `exp_list` VALUES ('20', '139400');
INSERT INTO `exp_list` VALUES ('21', '161400');
INSERT INTO `exp_list` VALUES ('22', '188400');
INSERT INTO `exp_list` VALUES ('23', '222400');
INSERT INTO `exp_list` VALUES ('24', '265400');
INSERT INTO `exp_list` VALUES ('25', '316400');
INSERT INTO `exp_list` VALUES ('26', '377400');
INSERT INTO `exp_list` VALUES ('27', '447400');
INSERT INTO `exp_list` VALUES ('28', '528400');
INSERT INTO `exp_list` VALUES ('29', '619400');
INSERT INTO `exp_list` VALUES ('30', '727400');
INSERT INTO `exp_list` VALUES ('31', '845400');
INSERT INTO `exp_list` VALUES ('32', '1000400');
INSERT INTO `exp_list` VALUES ('33', '1210775');
INSERT INTO `exp_list` VALUES ('34', '1537400');
INSERT INTO `exp_list` VALUES ('35', '2019900');
INSERT INTO `exp_list` VALUES ('36', '2832900');
INSERT INTO `exp_list` VALUES ('37', '4147400');
INSERT INTO `exp_list` VALUES ('38', '6302900');
INSERT INTO `exp_list` VALUES ('39', '8957400');
INSERT INTO `exp_list` VALUES ('40', '12225400');
INSERT INTO `exp_list` VALUES ('41', '16251400');
INSERT INTO `exp_list` VALUES ('42', '21201400');
INSERT INTO `exp_list` VALUES ('43', '27173400');
INSERT INTO `exp_list` VALUES ('44', '34319400');
INSERT INTO `exp_list` VALUES ('45', '42487400');
INSERT INTO `exp_list` VALUES ('46', '51852400');
INSERT INTO `exp_list` VALUES ('47', '62491400');
INSERT INTO `exp_list` VALUES ('48', '74479400');
INSERT INTO `exp_list` VALUES ('49', '87889400');
INSERT INTO `exp_list` VALUES ('50', '102804400');
INSERT INTO `exp_list` VALUES ('51', '119599400');
INSERT INTO `exp_list` VALUES ('52', '138749400');
INSERT INTO `exp_list` VALUES ('53', '160479400');
INSERT INTO `exp_list` VALUES ('54', '199999999');

-- ----------------------------
-- Table structure for `fashion`
-- ----------------------------
DROP TABLE IF EXISTS `fashion`;
CREATE TABLE `fashion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `character_id` int(10) unsigned NOT NULL,
  `itemid` int(10) unsigned NOT NULL,
  `itemslot` int(11) NOT NULL,
  `expiration` bigint(20) unsigned DEFAULT NULL,
  `gem1` mediumint(9) NOT NULL DEFAULT 0,
  `gem2` mediumint(9) NOT NULL DEFAULT 0,
  `gem3` mediumint(9) NOT NULL DEFAULT 0,
  `gem4` mediumint(9) NOT NULL DEFAULT 0,
  `gem5` mediumint(9) NOT NULL DEFAULT 0,
  `gem6` mediumint(9) NOT NULL DEFAULT 0,
  `gem7` mediumint(9) NOT NULL DEFAULT 0,
  `gem8` mediumint(9) NOT NULL DEFAULT 0,
  `ShopID` bigint(20) NOT NULL DEFAULT -1,
  `color` int(11) unsigned NOT NULL DEFAULT 16777215,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- ----------------------------
-- Records of fashion
-- ----------------------------

-- ----------------------------
-- Table structure for `friends`
-- ----------------------------
DROP TABLE IF EXISTS `friends`;
CREATE TABLE `friends` (
  `id1` int(11) unsigned NOT NULL,
  `id2` int(11) unsigned NOT NULL,
  KEY `friends_index` (`id1`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- ----------------------------
-- Records of friends
-- ----------------------------

-- ----------------------------
-- Table structure for `gifts`
-- ----------------------------
DROP TABLE IF EXISTS `gifts`;
CREATE TABLE `gifts` (
  `GiftID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `PlayerID` int(10) unsigned NOT NULL,
  `ItemID` int(10) unsigned NOT NULL,
  `send_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `message` text NOT NULL,
  `sender` tinytext NOT NULL,
  `DayCount` int(11) NOT NULL DEFAULT 0,
  `ShopID` bigint(20) NOT NULL DEFAULT -1,
  `GiftState` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`GiftID`),
  KEY `PlayerID` (`PlayerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- ----------------------------
-- Records of gifts
-- ----------------------------

-- ----------------------------
-- Table structure for `gifts_archive`
-- ----------------------------
DROP TABLE IF EXISTS `gifts_archive`;
CREATE TABLE `gifts_archive` (
  `ShopID` bigint(20) NOT NULL DEFAULT -1,
  `GiftID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `PlayerID` int(10) unsigned NOT NULL,
  `ItemID` int(10) unsigned NOT NULL,
  `send_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `message` text NOT NULL,
  `sender` tinytext NOT NULL,
  `DayCount` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`GiftID`),
  KEY `PlayerID` (`PlayerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- ----------------------------
-- Records of gifts_archive
-- ----------------------------

-- ----------------------------
-- Table structure for `global_ranking`
-- ----------------------------
DROP TABLE IF EXISTS `global_ranking`;
CREATE TABLE `global_ranking` (
  `id` int(10) unsigned NOT NULL,
  `runtime` float NOT NULL DEFAULT 600,
  `rank` int(11) NOT NULL DEFAULT -1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of global_ranking
-- ----------------------------

-- ----------------------------
-- Table structure for `global_ranking2`
-- ----------------------------
DROP TABLE IF EXISTS `global_ranking2`;
CREATE TABLE `global_ranking2` (
  `id` int(10) unsigned DEFAULT NULL,
  `runtime` float NOT NULL DEFAULT 600
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of global_ranking2
-- ----------------------------

-- ----------------------------
-- Table structure for `guilds`
-- ----------------------------
DROP TABLE IF EXISTS `guilds`;
CREATE TABLE `guilds` (
  `id` int(11) unsigned NOT NULL,
  `name` tinytext NOT NULL,
  `msg` text DEFAULT NULL,
  `rule` text DEFAULT NULL,
  `master_name` tinytext NOT NULL,
  `focus` int(11) unsigned NOT NULL DEFAULT 0,
  `points` int(11) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- ----------------------------
-- Records of guilds
-- ----------------------------

-- ----------------------------
-- Table structure for `licenses`
-- ----------------------------
DROP TABLE IF EXISTS `licenses`;
CREATE TABLE `licenses` (
  `char_id` int(11) unsigned NOT NULL,
  `trick_id` int(11) unsigned NOT NULL,
  `is_enabled` int(11) unsigned NOT NULL DEFAULT 1,
  `runtime` float NOT NULL,
  `score` int(11) unsigned NOT NULL DEFAULT 0,
  `collision_count` int(11) unsigned NOT NULL DEFAULT 0,
  `unk` int(11) DEFAULT NULL,
  PRIMARY KEY (`char_id`,`trick_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- ----------------------------
-- Records of licenses
-- ----------------------------

-- ----------------------------
-- Table structure for `login_log`
-- ----------------------------
DROP TABLE IF EXISTS `login_log`;
CREATE TABLE `login_log` (
  `acc_id` int(10) unsigned NOT NULL,
  `ip` varchar(64) NOT NULL,
  `login_time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- ----------------------------
-- Records of login_log
-- ----------------------------

-- ----------------------------
-- Table structure for `maps`
-- ----------------------------
DROP TABLE IF EXISTS `maps`;
CREATE TABLE `maps` (
  `mapid` smallint(6) NOT NULL,
  `mapname` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`mapid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of maps
-- ----------------------------
INSERT INTO `maps` VALUES ('0', 'Oblivion 1');
INSERT INTO `maps` VALUES ('1', 'Eisen Watercourse 1');
INSERT INTO `maps` VALUES ('2', 'Eisen Watercourse 2');
INSERT INTO `maps` VALUES ('3', 'Oblivion 2');
INSERT INTO `maps` VALUES ('4', 'Chachapoyas 1');
INSERT INTO `maps` VALUES ('5', 'Santa Claus 1');
INSERT INTO `maps` VALUES ('6', 'Jansen\'s Forest 1');
INSERT INTO `maps` VALUES ('7', 'Smallpox 1');
INSERT INTO `maps` VALUES ('8', 'Smallpox 2');
INSERT INTO `maps` VALUES ('9', 'Equilibrium 1');
INSERT INTO `maps` VALUES ('10', 'Chachapoyas 2');
INSERT INTO `maps` VALUES ('11', 'Smallpox 3');
INSERT INTO `maps` VALUES ('12', 'Jansen\'s Forest 2');
INSERT INTO `maps` VALUES ('13', 'Eisen Watercourse 3');
INSERT INTO `maps` VALUES ('14', 'Oblivion 3');
INSERT INTO `maps` VALUES ('15', 'Chagall 1');
INSERT INTO `maps` VALUES ('16', 'Chagall 2');
INSERT INTO `maps` VALUES ('17', 'Smallpox 1 Mirror');
INSERT INTO `maps` VALUES ('18', 'Santa Claus 1 Mirror');
INSERT INTO `maps` VALUES ('19', 'Chagall 1 Mirror');
INSERT INTO `maps` VALUES ('20', 'Chachapoyas 1 Mirror');
INSERT INTO `maps` VALUES ('21', 'Oblivion 2 Mirror');
INSERT INTO `maps` VALUES ('22', 'Smallpox 3 Mirror');
INSERT INTO `maps` VALUES ('23', 'Smallpox 2 Mirror');
INSERT INTO `maps` VALUES ('24', 'Chachapoyas 2 Mirror');
INSERT INTO `maps` VALUES ('25', 'Chagall 2 Mirror');
INSERT INTO `maps` VALUES ('26', 'Equilibrium 1 Mirror');
INSERT INTO `maps` VALUES ('27', 'Jansen\'s Forest 1 Mirror');
INSERT INTO `maps` VALUES ('28', 'Jansen\'s Forest 2 Mirror');
INSERT INTO `maps` VALUES ('29', 'Eisen Watercourse 1 Mirror');
INSERT INTO `maps` VALUES ('30', 'Eisen Watercourse 2 Mirror');
INSERT INTO `maps` VALUES ('32', 'Chachapoyas 3');
INSERT INTO `maps` VALUES ('33', 'Sand Madness');
INSERT INTO `maps` VALUES ('34', 'Shangri-La');
INSERT INTO `maps` VALUES ('35', 'Giant Ruin');
INSERT INTO `maps` VALUES ('36', 'Smallpox Mountain');

-- ----------------------------
-- Table structure for `messages`
-- ----------------------------
DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages` (
  `char_id` int(11) unsigned NOT NULL,
  `seq_id` int(11) unsigned NOT NULL,
  `msg_id` int(11) unsigned NOT NULL,
  `str1` text DEFAULT NULL,
  `str2` text DEFAULT NULL,
  `str3` text DEFAULT NULL,
  `str4` text DEFAULT NULL,
  `msg_time` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`char_id`,`seq_id`),
  KEY `index1` (`seq_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- ----------------------------
-- Records of messages
-- ----------------------------

-- ----------------------------
-- Table structure for `online_player_count`
-- ----------------------------
DROP TABLE IF EXISTS `online_player_count`;
CREATE TABLE `online_player_count` (
  `id` int(11) NOT NULL,
  `player_count` int(11) NOT NULL,
  `update_time` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- ----------------------------
-- Records of online_player_count
-- ----------------------------
INSERT INTO `online_player_count` VALUES ('0', '0', '2025-01-21 05:45:24');

-- ----------------------------
-- Table structure for `online_time`
-- ----------------------------
DROP TABLE IF EXISTS `online_time`;
CREATE TABLE `online_time` (
  `id` int(10) unsigned NOT NULL,
  `otime` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- ----------------------------
-- Records of online_time
-- ----------------------------

-- ----------------------------
-- Table structure for `previous_seasonal_ranking`
-- ----------------------------
DROP TABLE IF EXISTS `previous_seasonal_ranking`;
CREATE TABLE `previous_seasonal_ranking` (
  `season_id` bigint(20) NOT NULL,
  `id` int(10) unsigned NOT NULL,
  `skill_points` bigint(20) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  PRIMARY KEY (`season_id`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- ----------------------------
-- Records of previous_seasonal_ranking
-- ----------------------------

-- ----------------------------
-- Table structure for `psbo_schedule`
-- ----------------------------
DROP TABLE IF EXISTS `psbo_schedule`;
CREATE TABLE `psbo_schedule` (
  `id` int(11) NOT NULL,
  `last_inactivity_check` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- ----------------------------
-- Records of psbo_schedule
-- ----------------------------
INSERT INTO `psbo_schedule` VALUES ('0', '2025-01-20 23:00:01');

-- ----------------------------
-- Table structure for `records`
-- ----------------------------
DROP TABLE IF EXISTS `records`;
CREATE TABLE `records` (
  `char_id` int(11) unsigned NOT NULL,
  `mapid` int(11) unsigned NOT NULL,
  `laptime_best` float DEFAULT NULL,
  `run_count` int(11) unsigned DEFAULT NULL,
  `laptime_avarage` float DEFAULT NULL,
  `score_best` int(11) DEFAULT NULL,
  `score_avarage` int(11) DEFAULT NULL,
  `combo_best` int(11) DEFAULT NULL,
  `combo_avarage` int(11) DEFAULT NULL,
  PRIMARY KEY (`char_id`,`mapid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- ----------------------------
-- Records of records
-- ----------------------------

-- ----------------------------
-- Table structure for `reports`
-- ----------------------------
DROP TABLE IF EXISTS `reports`;
CREATE TABLE `reports` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reporter` text DEFAULT NULL,
  `target_player` text DEFAULT NULL,
  `type` tinytext DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `report_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `client_time` tinytext DEFAULT NULL,
  `playerid` int(10) unsigned DEFAULT NULL,
  `mapid` int(11) DEFAULT -1,
  `handled` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- ----------------------------
-- Records of reports
-- ----------------------------

-- ----------------------------
-- Table structure for `run`
-- ----------------------------
DROP TABLE IF EXISTS `run`;
CREATE TABLE `run` (
  `id` bigint(20) NOT NULL,
  `datetime` datetime DEFAULT NULL,
  `mode` varchar(255) DEFAULT NULL,
  `room_nr` varchar(255) DEFAULT NULL,
  `player_count` smallint(6) DEFAULT NULL,
  `map` varchar(255) DEFAULT NULL,
  `season_id` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `room_pw` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of run
-- ----------------------------

-- ----------------------------
-- Table structure for `runresults`
-- ----------------------------
DROP TABLE IF EXISTS `runresults`;
CREATE TABLE `runresults` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `player_name` varchar(255) DEFAULT NULL,
  `player_time_client` float DEFAULT NULL,
  `player_time_server` float DEFAULT NULL,
  `used_time` int(11) DEFAULT NULL,
  `player_skillpoints` smallint(6) DEFAULT NULL,
  `player_skillpoints_change` smallint(6) DEFAULT NULL,
  `gemid` tinyint(4) unsigned DEFAULT NULL,
  `gem_name` tinytext DEFAULT NULL,
  `fk_run_id` bigint(20) DEFAULT NULL,
  `speedhack` smallint(6) DEFAULT NULL,
  `avatar` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of runresults
-- ----------------------------

-- ----------------------------
-- Table structure for `seasonal_ranking`
-- ----------------------------
DROP TABLE IF EXISTS `seasonal_ranking`;
CREATE TABLE `seasonal_ranking` (
  `id` int(10) unsigned NOT NULL,
  `skill_points` bigint(20) DEFAULT NULL,
  `rank` int(11) NOT NULL DEFAULT -1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of seasonal_ranking
-- ----------------------------

-- ----------------------------
-- Table structure for `seasonal_ranking2`
-- ----------------------------
DROP TABLE IF EXISTS `seasonal_ranking2`;
CREATE TABLE `seasonal_ranking2` (
  `id` int(10) unsigned DEFAULT NULL,
  `skill_points` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of seasonal_ranking2
-- ----------------------------

-- ----------------------------
-- Table structure for `seasons`
-- ----------------------------
DROP TABLE IF EXISTS `seasons`;
CREATE TABLE `seasons` (
  `season_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`season_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- ----------------------------
-- Records of seasons
-- ----------------------------
INSERT INTO `seasons` VALUES ('1609023600');

-- ----------------------------
-- Table structure for `sumtax`
-- ----------------------------
DROP TABLE IF EXISTS `sumtax`;
CREATE TABLE `sumtax` (
  `cash` int(11) NOT NULL,
  `pro` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- ----------------------------
-- Records of sumtax
-- ----------------------------
INSERT INTO `sumtax` VALUES ('0', '0');

-- ----------------------------
-- Procedure structure for `calc_skillpoints`
-- ----------------------------
DROP PROCEDURE IF EXISTS `calc_skillpoints`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `calc_skillpoints`()
BEGIN
DECLARE _last_season_id BIGINT UNSIGNED DEFAULT NULL;
    
SELECT max(season_id) 
    FROM seasons 
    INTO _last_season_id;
    
UPDATE `characters` 
    SET `skill_points` = `skill_points`*(1-GREATEST(((LEAST(103, `inactive_days`) -3)/100),0)) 
    WHERE `skill_season_id` = _last_season_id;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `get_global_records`
-- ----------------------------
DROP PROCEDURE IF EXISTS `get_global_records`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_global_records`()
BEGIN

DROP TEMPORARY TABLE IF EXISTS temp_distinct_mapids;
CREATE TEMPORARY TABLE IF NOT EXISTS temp_distinct_mapids AS 
(SELECT DISTINCT mapid FROM records);

SELECT *, (SELECT min(laptime_best) FROM records r2 WHERE r2.mapid = r1.mapid) 
FROM temp_distinct_mapids r1;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `get_seasonal_records`
-- ----------------------------
DROP PROCEDURE IF EXISTS `get_seasonal_records`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_seasonal_records`()
BEGIN

DROP TEMPORARY TABLE IF EXISTS temp_distinct_season_mapids;
CREATE TEMPORARY TABLE IF NOT EXISTS temp_distinct_season_mapids AS 
(SELECT DISTINCT mapid FROM current_season_records);

SELECT *, (SELECT min(laptime_best) FROM current_season_records r2 WHERE r2.mapid = r1.mapid) 
FROM temp_distinct_season_mapids r1;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `remove_gems_from_all_players`
-- ----------------------------
DROP PROCEDURE IF EXISTS `remove_gems_from_all_players`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `remove_gems_from_all_players`()
BEGIN
    DECLARE ch1 int;
    declare v_id int unsigned;
    declare v_name text;
    DECLARE curs CURSOR FOR select id, name from characters;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET ch1 = 1;
 
 
    OPEN curs;
    SET ch1 = 0;
   
    main_loop: WHILE TRUE DO
        FETCH curs into v_id, v_name;
       
        IF ch1 != 0 THEN
            LEAVE main_loop;
        END IF;
 
        CALL unequip_gems(v_name);
 
    END WHILE;
   
    CLOSE curs;
 
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `unequip_gems`
-- ----------------------------
DROP PROCEDURE IF EXISTS `unequip_gems`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `unequip_gems`(`_player_name` TEXT)
BEGIN
    DECLARE ch1 int default 0;
    DECLARE player_id int unsigned;
    DECLARE gem_inv_count int unsigned default 0;
    DECLARE in_gem_data BLOB;
    DECLARE i int unsigned default 0;
    declare v_id int unsigned;
    DECLARE v_gem1 mediumint;
    DECLARE v_gem2 mediumint;
    DECLARE v_gem3 mediumint;
    DECLARE v_gem4 mediumint;
    DECLARE is_found BOOLEAN;
    DECLARE t1 int;
    DECLARE gem_id mediumint;
    declare gem_count mediumint;
    DECLARE found_slot boolean;
    DECLARE curs CURSOR FOR select id, gem1, gem2, gem3, gem4 from fashion where character_id = player_id;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET ch1 = 1;
 
 
    SELECT id, gems
    INTO player_id, in_gem_data
    FROM characters
    WHERE name = _player_name;
   
       
    SET gem_inv_count = CONV(HEX(REVERSE(SUBSTR(in_gem_data, 1, 4))), 16, 10);
   
    OPEN curs;
    SET ch1 = 0;
   
    main_loop: WHILE TRUE DO
        FETCH curs into v_id, v_gem1, v_gem2, v_gem3, v_gem4;
       
        IF ch1 != 0 THEN
            LEAVE main_loop;
        END IF;
   
               
        IF v_gem1 > 0 AND v_gem1 <= 0x7fff THEN
            SET i = 0;
            SET found_slot = false;
            WHILE i < gem_inv_count DO
                SET gem_id = CONV(HEX(REVERSE(SUBSTR(in_gem_data, 5 + i * 4, 2))), 16, 10);
                SET gem_count = CONV(HEX(REVERSE(SUBSTR(in_gem_data, 5 + i * 4 + 2, 2))), 16, 10);
                SET t1 = gem_count;
 
                IF gem_id = v_gem1 then
                    SET gem_count = LEAST(gem_count + 1, 9999);
                    SET in_gem_data = CONCAT(SUBSTR(in_gem_data, 1, 4 + i * 4 + 2), REVERSE(UNHEX(LPAD(HEX(gem_count), 4, '0'))), SUBSTR(in_gem_data, 5 + i * 4 + 4));
                                        SET found_slot = true;
                    SET i = gem_inv_count;
                END IF;
               
                SET i = i + 1;
            END WHILE;
 
            IF found_slot = false THEN
                SET in_gem_data = CONCAT(in_gem_data, REVERSE(UNHEX(LPAD(HEX(v_gem1), 4, '0'))), UNHEX('0100'));
                SET gem_inv_count = gem_inv_count + 1;
                            END IF;
           
        END IF;
 
        IF v_gem2 > 0 AND v_gem2 <= 0x7fff THEN
            SET i = 0;
            SET found_slot = false;
            WHILE i < gem_inv_count DO
 
                SET gem_id = CONV(HEX(REVERSE(SUBSTR(in_gem_data, 5 + i * 4, 2))), 16, 10);
                SET gem_count = CONV(HEX(REVERSE(SUBSTR(in_gem_data, 5 + i * 4 + 2, 2))), 16, 10);
 
                IF gem_id = v_gem2 then
                    SET gem_count = LEAST(gem_count + 1, 9999);
                    SET in_gem_data = CONCAT(SUBSTR(in_gem_data, 1, 4 + i * 4 + 2), REVERSE(UNHEX(LPAD(HEX(gem_count), 4, '0'))), SUBSTR(in_gem_data, 5 + i * 4 + 4));
                    SET found_slot = true;
                    SET i = gem_inv_count;
                END IF;
               
                SET i = i + 1;
            END WHILE;
           
            IF found_slot = false THEN
                SET in_gem_data = CONCAT(in_gem_data, REVERSE(UNHEX(LPAD(HEX(v_gem2), 4, '0'))), UNHEX('0100'));
                SET gem_inv_count = gem_inv_count + 1;
            END IF;
           
        END IF;
 
        IF v_gem3 > 0 AND v_gem3 <= 0x7fff THEN
            SET i = 0;
            SET found_slot = false;
            WHILE i < gem_inv_count DO
 
                SET gem_id = CONV(HEX(REVERSE(SUBSTR(in_gem_data, 5 + i * 4, 2))), 16, 10);
                SET gem_count = CONV(HEX(REVERSE(SUBSTR(in_gem_data, 5 + i * 4 + 2, 2))), 16, 10);
 
                IF gem_id = v_gem3 then
                    SET gem_count = LEAST(gem_count + 1, 9999);
                    SET in_gem_data = CONCAT(SUBSTR(in_gem_data, 1, 4 + i * 4 + 2), REVERSE(UNHEX(LPAD(HEX(gem_count), 4, '0'))), SUBSTR(in_gem_data, 5 + i * 4 + 4));
                    SET found_slot = true;
                    SET i = gem_inv_count;
                END IF;
               
                SET i = i + 1;
            END WHILE;
           
            IF found_slot = false THEN
                SET in_gem_data = CONCAT(in_gem_data, REVERSE(UNHEX(LPAD(HEX(v_gem3), 4, '0'))), UNHEX('0100'));
                SET gem_inv_count = gem_inv_count + 1;
            END IF;
           
        END IF;
 
        IF v_gem4 > 0 AND v_gem4 <= 0x7fff THEN
            SET i = 0;
            SET found_slot = false;
            WHILE i < gem_inv_count DO
 
                SET gem_id = CONV(HEX(REVERSE(SUBSTR(in_gem_data, 5 + i * 4, 2))), 16, 10);
                SET gem_count = CONV(HEX(REVERSE(SUBSTR(in_gem_data, 5 + i * 4 + 2, 2))), 16, 10);
 
                IF gem_id = v_gem4 then
                    SET gem_count = LEAST(gem_count + 1, 9999);
                    SET in_gem_data = CONCAT(SUBSTR(in_gem_data, 1, 4 + i * 4 + 2), REVERSE(UNHEX(LPAD(HEX(gem_count), 4, '0'))), SUBSTR(in_gem_data, 5 + i * 4 + 4));
                    SET found_slot = true;
                    SET i = gem_inv_count;
                END IF;
               
                SET i = i + 1;
            END WHILE;
           
            IF found_slot = false THEN
                SET in_gem_data = CONCAT(in_gem_data, REVERSE(UNHEX(LPAD(HEX(v_gem4), 4, '0'))), UNHEX('0100'));
                SET gem_inv_count = gem_inv_count + 1;
            END IF;
           
        END IF;
       
    END WHILE;
   
    CLOSE curs;
 
    SET in_gem_data = CONCAT(REVERSE(UNHEX(LPAD(HEX(gem_inv_count), 8, '0'))), SUBSTR(in_gem_data, 5));
 
     
    UPDATE characters
    SET gems = in_gem_data
    WHERE name = _player_name;
 
    UPDATE fashion
    SET gem1 = 0, gem2 = 0, gem3 = 0, gem4 = 0
    WHERE character_id = player_id;
 
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `update_inactivity`
-- ----------------------------
DROP PROCEDURE IF EXISTS `update_inactivity`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_inactivity`()
BEGIN
  UPDATE characters
  SET inactive_days = inactive_days + 1
  WHERE spruns < 5;

  UPDATE characters
  SET inactive_days = 0
  WHERE spruns >= 5;
  
  UPDATE characters
  SET spruns = 0;
  
  CALL calc_skillpoints();
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `update_rankings`
-- ----------------------------
DROP PROCEDURE IF EXISTS `update_rankings`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_rankings`()
BEGIN

declare _last_inactivity_check datetime default now();
DECLARE _last_season_id bigint unsigned default null;

SELECT max(season_id) FROM seasons
INTO _last_season_id;

select @rowid:=0;
drop table if exists global_ranking;
drop table if exists global_ranking2;
create table global_ranking2(id int unsigned, runtime float not null default 600) 
	select id, get_sum_runtimes(id) as runtime
	from characters
    order by runtime asc;

create table global_ranking (id int unsigned key, runtime float not null default 600, rank int not null default -1) select *, @rowid:=@rowid+1 as rank
from global_ranking2;


select @rowid2:=0;
drop table if exists seasonal_ranking;
drop table if exists seasonal_ranking2;

create table seasonal_ranking2(id int unsigned, skill_points bigint) 
	select id, skill_points
	from characters
    where skill_season_id = _last_season_id
    order by skill_points desc;

create table seasonal_ranking (id int unsigned key, skill_points bigint, rank int not null default -1) 
	select *, @rowid2:=@rowid2+1 as rank
	from seasonal_ranking2;


SELECT last_inactivity_check
INTO _last_inactivity_check
FROM psbo_schedule
WHERE id = 0;

if _last_inactivity_check is null then
	set _last_inactivity_check = now();
end if;

while(unix_timestamp(now()) - unix_timestamp(_last_inactivity_check) > 24*60*60) DO
	  SET _last_inactivity_check = from_unixtime(unix_timestamp(_last_inactivity_check) + 24*60*60);
      update psbo_schedule 
      set last_inactivity_check = _last_inactivity_check;

      call update_inactivity();
end while;

END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for `accept_gift`
-- ----------------------------
DROP FUNCTION IF EXISTS `accept_gift`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `accept_gift`(`_playerid` INT UNSIGNED, `_giftid` BIGINT UNSIGNED, `_inventory_slot` INT UNSIGNED) RETURNS bigint(20)
BEGIN

declare _itemid int default 0;
declare _daycount int default 0;
declare _shopid int default 0;
declare _expiration bigint unsigned default 0;
declare _insert_id bigint default -1;
declare _shopid_count int default 0;


SELECT ItemID, DayCount, ShopID
INTO _itemid, _daycount, _shopid
FROM gifts
WHERE GiftID = _giftid AND PlayerID = _playerid AND GiftState < 2;

if _itemid > 10000 then
	UPDATE gifts
    SET GiftState = 1
	WHERE GiftID = _giftid AND PlayerID = _playerid;
    
    if _shopid != -1 THEN
		SELECT count(*)
		INTO _shopid_count
		FROM fashion
		WHERE character_id = _playerid AND ShopID = _shopid AND itemid = _itemid;
    END IF;
    
    if _shopid_count = 0 THEN
    
		IF _daycount > 0 THEN
			SET _expiration = UNIX_TIMESTAMP(NOW()) + _daycount * (60 * 60 * 24);
		END IF;
    
		INSERT INTO fashion
		SET character_id = _playerid, itemid = _itemid, itemslot = _inventory_slot, expiration = _expiration;

		SET _insert_id = LAST_INSERT_ID();

	ELSE
		SELECT id
        INTO _insert_id
        FROM fashion
		WHERE character_id = _playerid AND ShopID = _shopid AND itemid = _itemid;
    END IF;

	UPDATE gifts
    SET GiftState = 2
	WHERE GiftID = _giftid AND PlayerID = _playerid;

	INSERT INTO accepted_gifts
    SELECT *
    FROM gifts
	WHERE GiftID = _giftid AND PlayerID = _playerid;
    
    DELETE FROM gifts
	WHERE GiftID = _giftid AND PlayerID = _playerid;
    
    return _insert_id;
END IF;

RETURN -1;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for `buy_item`
-- ----------------------------
DROP FUNCTION IF EXISTS `buy_item`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `buy_item`(`_player_id` INT UNSIGNED, `_itemid` INT UNSIGNED, `_slot` INT, `_expiration` BIGINT UNSIGNED, `_price` INT UNSIGNED) RETURNS bigint(20)
BEGIN
	declare r bigint default -1;
    
    UPDATE characters
    SET cash = cash - _price
    WHERE id = _player_id AND cash > _price;
    
    if ROW_COUNT() > 0 THEN
		SELECT create_item(_player_id, _itemid, _slot, _expiration)
        INTO r;
        
        IF r < 0 then
			UPDATE characters
            SET cash = cash + _price
            WHERE id = _player_id;
        END IF;
    END IF;
    
	RETURN r;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for `change_password`
-- ----------------------------
DROP FUNCTION IF EXISTS `change_password`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `change_password`(`_accname` TINYTEXT, `oldpass` TINYTEXT, `newpass` TINYTEXT) RETURNS int(11)
BEGIN
	DECLARE old_saltstr tinytext;
	DECLARE new_saltstr tinytext;
	DECLARE accname tinytext;

	SET new_saltstr = SUBSTRING(MD5(RAND()), -10);
	SET accname = LOWER(_accname);

	UPDATE accounts
	SET passwd = sha2(concat(new_saltstr, sha2(newpass, 256)), 256), salt = new_saltstr
	WHERE lower(name) = accname AND passwd = sha2(concat(salt, sha2(oldpass, 256)), 256);
    
	RETURN ROW_COUNT();
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for `create_item`
-- ----------------------------
DROP FUNCTION IF EXISTS `create_item`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `create_item`(`_playerid` INT UNSIGNED, `_itemid` INT UNSIGNED, `_inventory_slot` INT, `_expiration` BIGINT UNSIGNED) RETURNS bigint(20)
BEGIN
    DECLARE _c1 int unsigned default 0;
    






    
    if _c1 = 0 AND _itemid > 10000 THEN
		INSERT INTO fashion
		SET character_id = _playerid, itemid = _itemid, itemslot = _inventory_slot, expiration = _expiration;
		RETURN LAST_INSERT_ID();
    ELSE
		RETURN -1;
    END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for `get_global_rank`
-- ----------------------------
DROP FUNCTION IF EXISTS `get_global_rank`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_global_rank`(`_playerid` INT UNSIGNED) RETURNS int(10) unsigned
BEGIN
	declare r int unsigned default 0;
    select rank into r
    from global_ranking
    where id = _playerid;
	RETURN r;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for `get_runtime`
-- ----------------------------
DROP FUNCTION IF EXISTS `get_runtime`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_runtime`(`_char_id` INT UNSIGNED, `_mapid` INT UNSIGNED) RETURNS float
BEGIN
DECLARE rt FLOAT default 600;
SELECT laptime_best
INTO rt
FROM records
WHERE char_id = _char_id AND mapid = _mapid;
if rt = null then
    set rt = 600;
end if;
RETURN rt;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for `get_seasonal_rank`
-- ----------------------------
DROP FUNCTION IF EXISTS `get_seasonal_rank`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_seasonal_rank`(`_playerid` INT UNSIGNED) RETURNS int(11)
BEGIN
	declare r int default null;
    select rank
    into r
    from seasonal_ranking
    where id = _playerid;
    
    IF r is null then
		set r = -1;
	end if;
    
	RETURN r;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for `get_sum_runtimes`
-- ----------------------------
DROP FUNCTION IF EXISTS `get_sum_runtimes`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_sum_runtimes`(`char_id` INT UNSIGNED) RETURNS float
BEGIN

declare s float default 0;
declare i int default 0;

WHILE i < 36 DO
  IF i != 31 THEN
		SET s = s + get_runtime(char_id, i);
	END IF;
	SET i = i + 1;
END WHILE;

RETURN s;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for `item_expired`
-- ----------------------------
DROP FUNCTION IF EXISTS `item_expired`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `item_expired`(`_id` BIGINT) RETURNS int(11)
BEGIN
	DECLARE e bigint default NOW();
    SET e = e - 1;

	SELECT expiration
    INTO e
    FROM fashion
    WHERE id = _id;
    
    if e < NOW() AND e != 0 THEN
		RETURN 1;
	ELSE
		RETURN 0;
	END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for `login`
-- ----------------------------
DROP FUNCTION IF EXISTS `login`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `login`(`_username2` TINYTEXT, `_password` TINYTEXT) RETURNS bigint(20)
BEGIN
    DECLARE nCount INT;
    DECLARE res INT;
    DECLARE saltstr tinytext;
    DECLARE pswd tinytext;
    DECLARE _username tinytext;

    SET _username = lower(_username2);

    SELECT count(*) 
    INTO nCount
    FROM accounts
    WHERE lower(name) = _username;
    
    IF nCount != 1 THEN 
	RETURN -1;
    END IF;
    

    SELECT passwd, id
    INTO pswd, res
    FROM accounts
    WHERE lower(name) = _username;
    
    SET saltstr = substr(pswd, 65);
    SET pswd = substr(pswd, 1, 64);
    
    IF sha2(concat(saltstr, sha2(_password, 256)), 256) = pswd THEN
	return res;
    ELSE
	return -1;
    END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for `register`
-- ----------------------------
DROP FUNCTION IF EXISTS `register`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `register`(`_accname` TINYTEXT, `accpass` TINYTEXT, `charname` TINYTEXT, `email` TINYTEXT) RETURNS int(11)
BEGIN
    DECLARE nCount INT;
    DECLARE accname tinytext;
    DECLARE saltstr tinytext;
    DECLARE _password tinytext;

    SET accname = LOWER(_accname);

    IF (SELECT accname NOT REGEXP '[^a-zA-Z0-9_\-]') < 1 THEN
	return -3;
    END IF;
    IF (SELECT charname NOT REGEXP '[^a-zA-Z0-9_\-]') < 1 THEN
	return -3;
    END IF;

    SELECT count(*) 
    INTO nCount
    FROM accounts
    WHERE lower(name) = accname OR character_name = charname;
    
    
    IF nCount > 0 THEN 
	RETURN -1;
    END IF;
    IF LENGTH(accname) < 4 OR LENGTH(charname) < 4 OR LENGTH(accpass) < 4 THEN
	RETURN -2;
    END IF;

    IF LENGTH(accname) > 20 OR LENGTH(charname) > 20 OR LENGTH(accpass) > 200 then
	RETURN -6;
    END IF;

    SET saltstr = SUBSTRING(MD5(RAND()), -10);
    SET _password = SUBSTRING(MD5(RAND()), -10);
    
    INSERT INTO accounts (name, passwd, character_name, email, salt)
    VALUES (accname, concat(sha2(concat(_password, sha2(accpass, 256)), 256), _password), charname, email, saltstr);


    IF ROW_COUNT() > 0 THEN

	INSERT INTO characters
	SET id = LAST_INSERT_ID(), name = charname;

	RETURN 1;
    END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for `start_season`
-- ----------------------------
DROP FUNCTION IF EXISTS `start_season`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `start_season`(`current_season_id` BIGINT UNSIGNED) RETURNS bigint(20) unsigned
BEGIN

DECLARE _last_season_id bigint unsigned default null;

SELECT max(season_id) FROM seasons
INTO _last_season_id;

IF _last_season_id IS NOT NULL THEN
	IF _last_season_id < current_season_id THEN
		REPLACE INTO backup_season_skillpoints
		SELECT skill_season_id, skill_points, id 
		FROM characters
		WHERE skill_season_id = _last_season_id;
    
		replace into previous_seasonal_ranking
		select _last_season_id, id, skill_points, rank from seasonal_ranking;

		UPDATE characters 
		SET skill_points = 0, skill_season_id = current_season_id;
	
		REPLACE INTO backup_season_records
		SELECT * 
		FROM current_season_records;

		DELETE FROM current_season_records;

		INSERT INTO seasons values (current_season_id);
	ELSE
		return 0;
  END IF;
ELSE
	INSERT INTO seasons values (current_season_id);
END IF;

RETURN current_season_id;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for `update_password`
-- ----------------------------
DROP FUNCTION IF EXISTS `update_password`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `update_password`(`_new_pw_hash` TINYTEXT, `_ticket` TINYTEXT, `_ticket2` TINYTEXT) RETURNS tinytext CHARSET utf8mb4 COLLATE utf8mb4_general_ci
BEGIN
    DECLARE saltstr tinytext;
    DECLARE _password tinytext;
    DECLARE _email tinytext;
    
    SET saltstr = SUBSTRING(MD5(RAND()), -10);
    SET _password = SUBSTRING(MD5(RAND()), -10);

    select email 
    into _email
    from accounts
    where pw_reset_ticket = _ticket;

    UPDATE accounts
    SET passwd = concat(sha2(concat(_password, _new_pw_hash), 256), _password), salt = saltstr, pw_reset_enabled = 0
    WHERE pw_reset_ticket = _ticket
	AND unix_timestamp(NOW()) - pw_reset_time <= 3600
        AND pw_reset_enabled = 1
        AND md5(concat(id, name)) = _ticket2;
        
        
    RETURN concat(ROW_COUNT(), '?', _email);
END
;;
DELIMITER ;

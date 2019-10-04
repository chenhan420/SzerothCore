/*
Navicat MariaDB Data Transfer

Source Server         : 3306
Source Server Version : 100406
Source Host           : localhost:3306
Source Database       : custom

Target Server Type    : MariaDB
Target Server Version : 100406
File Encoding         : 65001

Date: 2019-09-29 13:09:38
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for global
-- ----------------------------
DROP TABLE IF EXISTS `global`;
CREATE TABLE `global` (
  `key` int(10) unsigned NOT NULL,
  `value` text DEFAULT NULL,
  `type` enum('1','2','3') DEFAULT NULL,
  `comment` text DEFAULT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of global
-- ----------------------------
INSERT INTO `global` VALUES ('1', 'test string', '2', 'you can use a type to deal with custom data.');
INSERT INTO `global` VALUES ('2', '222', '1', null);
INSERT INTO `global` VALUES ('3', '1 2 3', '3', null);

-- ----------------------------
-- Table structure for item_affix
-- ----------------------------
DROP TABLE IF EXISTS `item_affix`;
CREATE TABLE `item_affix` (
  `id` mediumint(8) NOT NULL DEFAULT 0,
  `affix` text NOT NULL,
  PRIMARY KEY (`id`,`affix`(4))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_affix
-- ----------------------------
INSERT INTO `item_affix` VALUES ('1', '前缀之');
INSERT INTO `item_affix` VALUES ('2', '之后缀');

-- ----------------------------
-- Table structure for item_instance
-- ----------------------------
DROP TABLE IF EXISTS `item_instance`;
CREATE TABLE `item_instance` (
  `guid` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `prefix` text DEFAULT NULL,
  `suffix` text DEFAULT NULL,
  `quality` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `dmg` float unsigned NOT NULL DEFAULT 0,
  `arm` int(10) unsigned NOT NULL DEFAULT 0,
  `stat` text DEFAULT NULL,
  `statType` text DEFAULT NULL,
  `spell` text DEFAULT NULL,
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_instance
-- ----------------------------
INSERT INTO `item_instance` VALUES ('1000009', '前缀之', '之后缀', '1', '0.528325', '0', '2 2 2 ', '16 19 33 ', '50197 50416 50197 0 0 ');
INSERT INTO `item_instance` VALUES ('1000020', '前缀之', '之后缀', '1', '2027.71', '0', '', '', '0 0 0 0 0 ');
INSERT INTO `item_instance` VALUES ('1000022', '前缀之', '之后缀', '1', '101.781', '0', '5 8 72 58 74 19 79 45 72 43 ', '3 7 45 32 44 40 30 16 35 14 ', '0 50416 50248 0 0 ');
INSERT INTO `item_instance` VALUES ('1000030', '前缀之', '之后缀', '1', '2.53716', '0', '1 0 0 ', '45 18 6 ', '50248 50416 50197 0 0 ');
INSERT INTO `item_instance` VALUES ('1000031', '前缀之', '之后缀', '1', '2.60025', '0', '2 2 2 ', '15 20 20 ', '50248 40733 50248 0 0 ');
INSERT INTO `item_instance` VALUES ('1000032', '前缀之', '之后缀', '1', '2.57645', '0', '2 1 0 ', '7 47 3 ', '50416 50248 50248 0 0 ');
INSERT INTO `item_instance` VALUES ('1000033', '前缀之', '之后缀', '1', '2.47096', '0', '2 1 0 ', '4 11 29 ', '50197 50197 50416 0 0 ');
INSERT INTO `item_instance` VALUES ('1000039', '前缀之', '之后缀', '1', '98.3486', '0', '5 8 82 17 69 28 77 18 9 56 ', '3 7 15 43 17 33 34 46 30 19 ', '0 50416 40733 0 0 ');
INSERT INTO `item_instance` VALUES ('1110045', '前缀之', '之后缀', '1', '101.921', '0', '5 8 72 35 56 42 41 31 80 84 ', '3 7 27 29 11 6 15 28 12 19 ', '0 50197 50248 0 0 ');
INSERT INTO `item_instance` VALUES ('1110047', '前缀之', '之后缀', '1', '101.801', '0', '5 8 24 74 54 15 88 84 44 12 ', '3 7 38 26 15 49 29 13 25 9 ', '0 50197 40733 0 0 ');
INSERT INTO `item_instance` VALUES ('1110049', '前缀之', '之后缀', '1', '104.122', '0', '5 8 19 61 16 46 11 27 41 34 ', '3 7 12 18 4 23 3 36 37 14 ', '0 50416 50416 0 0 ');
INSERT INTO `item_instance` VALUES ('1110063', '前缀之', '之后缀', '1', '101.712', '0', '5 8 80 12 64 9 73 19 37 55 ', '3 7 45 34 12 8 7 47 26 10 ', '0 50416 50197 0 0 ');
INSERT INTO `item_instance` VALUES ('1110065', '前缀之', '之后缀', '1', '97.9517', '0', '5 8 69 25 79 67 30 18 68 40 ', '3 7 34 6 12 10 7 23 11 39 ', '0 50197 50248 0 0 ');
INSERT INTO `item_instance` VALUES ('1110069', '前缀之', '之后缀', '1', '105.263', '0', '5 8 31 58 32 33 34 45 76 28 ', '3 7 43 18 19 48 49 16 30 7 ', '0 50416 50248 0 0 ');
INSERT INTO `item_instance` VALUES ('1110075', '前缀之', '之后缀', '1', '96.7289', '0', '5 8 72 85 48 22 74 26 46 13 ', '3 7 26 28 4 45 45 6 14 26 ', '0 50197 50416 0 0 ');
INSERT INTO `item_instance` VALUES ('1110085', '前缀之', '之后缀', '1', '2.461', '0', '1 2 2 ', '2 49 30 ', '40733 50248 50248 0 0 ');
INSERT INTO `item_instance` VALUES ('1110087', '前缀之', '之后缀', '1', '2.61232', '0', '0 0 2 ', '38 47 5 ', '50248 50248 40733 0 0 ');
INSERT INTO `item_instance` VALUES ('1110098', '前缀之', '之后缀', '1', '100.49', '0', '5 8 44 64 63 64 90 18 51 48 ', '3 7 15 8 5 35 45 21 3 6 ', '0 50248 40733 0 0 ');
INSERT INTO `item_instance` VALUES ('1110111', '前缀之', '之后缀', '1', '98.9231', '0', '5 8 67 72 87 45 89 51 30 46 ', '3 7 17 5 27 29 27 35 42 21 ', '0 40733 40733 0 0 ');
INSERT INTO `item_instance` VALUES ('1110115', '前缀之', '之后缀', '1', '102.575', '0', '5 8 55 70 42 57 23 33 27 29 ', '3 7 3 3 43 32 26 26 7 32 ', '0 50248 40733 0 0 ');
INSERT INTO `item_instance` VALUES ('1110119', '前缀之', '之后缀', '1', '100.795', '0', '5 8 16 48 26 46 33 24 63 33 ', '3 7 8 46 11 42 25 34 41 19 ', '0 50248 40733 0 0 ');
INSERT INTO `item_instance` VALUES ('1110125', '前缀之', '之后缀', '1', '2.43531', '0', '1 0 1 ', '30 13 37 ', '40733 50197 50248 0 0 ');
INSERT INTO `item_instance` VALUES ('1110126', '前缀之', '之后缀', '1', '2.46373', '0', '0 2 2 ', '42 29 10 ', '40733 40733 50197 0 0 ');
INSERT INTO `item_instance` VALUES ('1110127', '前缀之', '之后缀', '1', '2.61733', '0', '0 0 0 ', '14 49 2 ', '50416 40733 50416 0 0 ');
INSERT INTO `item_instance` VALUES ('1110128', '前缀之', '之后缀', '1', '2.56762', '0', '1 0 2 ', '33 35 1 ', '50248 50248 50416 0 0 ');
INSERT INTO `item_instance` VALUES ('1110130', '前缀之', '之后缀', '1', '2.54269', '0', '0 0 1 ', '43 40 30 ', '40733 40733 50416 0 0 ');
INSERT INTO `item_instance` VALUES ('1110131', '前缀之', '之后缀', '1', '2.58478', '0', '2 1 1 ', '16 44 22 ', '40733 50197 50416 0 0 ');
INSERT INTO `item_instance` VALUES ('1110138', '前缀之', '之后缀', '1', '97.9526', '0', '5 8 76 58 23 37 36 36 42 86 ', '3 7 45 31 26 2 37 6 14 47 ', '0 50197 40733 0 0 ');
INSERT INTO `item_instance` VALUES ('1110193', '前缀之', '之后缀', '1', '102.414', '0', '5 8 36 26 35 49 29 40 66 77 ', '3 7 43 7 36 36 11 16 18 3 ', '0 50416 40733 0 0 ');
INSERT INTO `item_instance` VALUES ('1110210', '前缀之', '之后缀', '1', '99.2492', '0', '5 8 32 49 55 87 35 43 71 14 ', '3 7 19 34 18 23 13 46 17 15 ', '0 40733 50416 0 0 ');
INSERT INTO `item_instance` VALUES ('1110243', '前缀之', '之后缀', '1', '95.4551', '0', '5 8 29 58 54 38 44 58 67 72 ', '3 7 46 44 1 33 27 46 10 3 ', '0 50197 50416 0 0 ');

-- ----------------------------
-- Table structure for item_random
-- ----------------------------
DROP TABLE IF EXISTS `item_random`;
CREATE TABLE `item_random` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `prefix` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `suffix` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `quality` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `minStat` float DEFAULT 0,
  `maxStat` float DEFAULT 0,
  `statsCount` tinyint(3) NOT NULL DEFAULT 0,
  `minDmgArm` float DEFAULT 0,
  `maxDmgArm` float DEFAULT 0,
  `spellGroup1` mediumint(8) NOT NULL DEFAULT 0,
  `spellRate1` float DEFAULT 0,
  `spellGroup2` mediumint(8) NOT NULL DEFAULT 0,
  `spellRate2` float DEFAULT 0,
  `spellGroup3` mediumint(8) NOT NULL DEFAULT 0,
  `spellRate3` float DEFAULT 0,
  `spellGroup4` mediumint(8) NOT NULL DEFAULT 0,
  `spellRate4` float DEFAULT 0,
  `spellGroup5` mediumint(8) NOT NULL DEFAULT 0,
  `spellRate5` float DEFAULT 0,
  PRIMARY KEY (`entry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_random
-- ----------------------------
INSERT INTO `item_random` VALUES ('25', '1', '2', '1', '0.1', '0.6', '3', '0.2', '0.33', '1', '100', '1', '100', '1', '100', '0', '0', '0', '0');
INSERT INTO `item_random` VALUES ('19019', '1', '2', '1', '0.1', '0.6', '-8', '0.2', '0.33', '1', '100', '1', '100', '1', '100', '0', '0', '0', '0');
INSERT INTO `item_random` VALUES ('100000', '1', '2', '1', '0', '0', '0', '1', '1.2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for map_extra
-- ----------------------------
DROP TABLE IF EXISTS `map_extra`;
CREATE TABLE `map_extra` (
  `mapid` smallint(5) NOT NULL DEFAULT 0,
  `difficulty` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `dmgDone` float unsigned NOT NULL DEFAULT 1,
  `dmgTaken` float unsigned NOT NULL DEFAULT 1,
  `hpRate` float unsigned NOT NULL DEFAULT 1,
  `manaRate` float unsigned NOT NULL DEFAULT 1,
  `rankLoot` text DEFAULT NULL COMMENT '0 1 2 3 4',
  `rankAura` text DEFAULT NULL COMMENT '0 1 2 3 4',
  `itemEnchant` text DEFAULT NULL COMMENT '0 1 2 3 4 5 6 7',
  `playerAura` mediumint(8) unsigned DEFAULT 0,
  PRIMARY KEY (`mapid`,`difficulty`),
  KEY `difficulty` (`difficulty`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of map_extra
-- ----------------------------
INSERT INTO `map_extra` VALUES ('-1', '0', '1', '1', '1', '1', '0普通 1精英 2稀有精英 3首领 4稀有 5未知', '同左', '0灰 1白 2绿 3蓝 4紫 5橙 6红 7金', '0');
INSERT INTO `map_extra` VALUES ('0', '0', '11.1', '22.2', '33.3', '44.4', '190011 0 0 0 0 0', '2 0 0 0 0 0', '0 4 0 0 0 4 0 0', '5');
INSERT INTO `map_extra` VALUES ('1', '0', '11.1', '22.2', '33.3', '44.4', '190011 0 0 0 0 0', '3 0 0 0 0 0', '0 4 0 0 0 4 0 0', '5');

-- ----------------------------
-- Table structure for spell_group
-- ----------------------------
DROP TABLE IF EXISTS `spell_group`;
CREATE TABLE `spell_group` (
  `comment` text DEFAULT NULL,
  `id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `spell` mediumint(8) NOT NULL DEFAULT 0,
  `chance` float unsigned NOT NULL DEFAULT 100,
  PRIMARY KEY (`id`,`spell`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of spell_group
-- ----------------------------
INSERT INTO `spell_group` VALUES ('{', '1', '40733', '100');
INSERT INTO `spell_group` VALUES ('测试 风剑鉴定组', '1', '50197', '100');
INSERT INTO `spell_group` VALUES ('测试 风剑鉴定组', '1', '50248', '100');
INSERT INTO `spell_group` VALUES ('}', '1', '50416', '100');
INSERT INTO `spell_group` VALUES ('测试 图0怪物光环', '2', '40999', '100');
INSERT INTO `spell_group` VALUES ('测试 图0怪物光环', '2', '71110', '100');
INSERT INTO `spell_group` VALUES ('测试 图1怪物光环', '3', '40999', '100');
INSERT INTO `spell_group` VALUES ('测试 图1怪物光环', '3', '71110', '100');
INSERT INTO `spell_group` VALUES ('测试 附魔组', '4', '2164', '50');
INSERT INTO `spell_group` VALUES ('测试 附魔组', '4', '3879', '49.9');
INSERT INTO `spell_group` VALUES ('测试 玩家光环', '5', '40999', '100');

/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50525
Source Host           : localhost:3306
Source Database       : db_bs_carrental

Target Server Type    : MYSQL
Target Server Version : 50525
File Encoding         : 65001

Date: 2022-05-06 20:11:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_brand
-- ----------------------------
DROP TABLE IF EXISTS `t_brand`;
CREATE TABLE `t_brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `brand` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_brand
-- ----------------------------
INSERT INTO `t_brand` VALUES ('1', 'Audi', 'A4L');
INSERT INTO `t_brand` VALUES ('2', 'Audi', 'Q3');
INSERT INTO `t_brand` VALUES ('3', 'Audi', 'A7');
INSERT INTO `t_brand` VALUES ('4', 'Audi', 'A8');
INSERT INTO `t_brand` VALUES ('5', 'Audi', 'S5');
INSERT INTO `t_brand` VALUES ('7', 'Bent', 'B50');
INSERT INTO `t_brand` VALUES ('8', 'Bent', 'B70');
INSERT INTO `t_brand` VALUES ('9', 'Bent', 'X80');
INSERT INTO `t_brand` VALUES ('10', 'Honda', 'Civic');
INSERT INTO `t_brand` VALUES ('11', 'Honda', 'Fit');
INSERT INTO `t_brand` VALUES ('12', 'Honda', 'Fengf');
INSERT INTO `t_brand` VALUES ('13', 'Honda', 'Accord');
INSERT INTO `t_brand` VALUES ('14', 'Honda', 'Lingp');
INSERT INTO `t_brand` VALUES ('15', 'BYD', 'F0');
INSERT INTO `t_brand` VALUES ('16', 'BYD', 'F3');
INSERT INTO `t_brand` VALUES ('17', 'BYD', 'Sirui');
INSERT INTO `t_brand` VALUES ('18', 'BYD', 'Surui');
INSERT INTO `t_brand` VALUES ('19', 'Peugeot', '301');
INSERT INTO `t_brand` VALUES ('20', 'Peugeot', '308');
INSERT INTO `t_brand` VALUES ('21', 'Peugeot', '408');
INSERT INTO `t_brand` VALUES ('22', 'Peugeot', '508');
INSERT INTO `t_brand` VALUES ('23', 'Buick', 'Junwei');
INSERT INTO `t_brand` VALUES ('24', 'Buick', 'Junyue');
INSERT INTO `t_brand` VALUES ('25', 'Buick', 'Kaiyue');
INSERT INTO `t_brand` VALUES ('26', 'Buick', 'Ankera');
INSERT INTO `t_brand` VALUES ('27', 'Changan', 'Ruic');
INSERT INTO `t_brand` VALUES ('28', 'Changan', 'CX20');
INSERT INTO `t_brand` VALUES ('29', 'Changan', 'CX30');
INSERT INTO `t_brand` VALUES ('30', 'Changan', 'Yido');
INSERT INTO `t_brand` VALUES ('31', 'Changan', 'Yuex');
INSERT INTO `t_brand` VALUES ('32', 'Volkswagen', 'Langx');
INSERT INTO `t_brand` VALUES ('33', 'Volkswagen', 'Langy');
INSERT INTO `t_brand` VALUES ('34', 'Volkswagen', 'Passte');
INSERT INTO `t_brand` VALUES ('35', 'Volkswagen', 'Sangtana');
INSERT INTO `t_brand` VALUES ('36', 'Volkswagen', 'Tuguan');
INSERT INTO `t_brand` VALUES ('37', 'Volkswagen', 'Bora');
INSERT INTO `t_brand` VALUES ('38', 'Volkswagen', 'Jetta');
INSERT INTO `t_brand` VALUES ('39', 'Volkswagen', 'Magonten');
INSERT INTO `t_brand` VALUES ('40', 'Volkswagen', 'Sugten');
INSERT INTO `t_brand` VALUES ('41', 'Toyota', 'Huaguan');
INSERT INTO `t_brand` VALUES ('42', 'Toyota', 'Crown');
INSERT INTO `t_brand` VALUES ('43', 'Toyota', 'Carorra');
INSERT INTO `t_brand` VALUES ('44', 'Toyota', 'Puraduo');
INSERT INTO `t_brand` VALUES ('45', 'Toyota', 'Reiz');
INSERT INTO `t_brand` VALUES ('46', 'Ford', 'Zhis');
INSERT INTO `t_brand` VALUES ('47', 'Ford', 'Focus');
INSERT INTO `t_brand` VALUES ('48', 'Havel', 'H5');
INSERT INTO `t_brand` VALUES ('49', 'Havel', 'H6');
INSERT INTO `t_brand` VALUES ('50', 'Lexus', 'CT');
INSERT INTO `t_brand` VALUES ('51', 'Lexus', 'ES');
INSERT INTO `t_brand` VALUES ('52', 'Lexus', 'GS');
INSERT INTO `t_brand` VALUES ('53', 'Lexus', 'GX');
INSERT INTO `t_brand` VALUES ('54', 'Renault', 'Fengl');
INSERT INTO `t_brand` VALUES ('55', 'Renault', 'Meigann');
INSERT INTO `t_brand` VALUES ('56', ' Land-Rover', 'Discov');
INSERT INTO `t_brand` VALUES ('57', ' Land-Rover', 'Lans');
INSERT INTO `t_brand` VALUES ('58', ' Land-Rover', 'Shenxingz');
INSERT INTO `t_brand` VALUES ('59', ' Land-Rover', 'Aurora');
INSERT INTO `t_brand` VALUES ('60', 'Mazda', '2');
INSERT INTO `t_brand` VALUES ('61', 'Mazda', '3');
INSERT INTO `t_brand` VALUES ('62', 'Mazda', 'CX-6');
INSERT INTO `t_brand` VALUES ('63', 'Cherry', 'A1');
INSERT INTO `t_brand` VALUES ('64', 'Cherry', 'A3');
INSERT INTO `t_brand` VALUES ('65', 'Cherry', 'E3');
INSERT INTO `t_brand` VALUES ('66', 'Cherry', 'E5');
INSERT INTO `t_brand` VALUES ('67', 'Cherry', 'Ruihu5');
INSERT INTO `t_brand` VALUES ('68', 'Nissan', 'Atenza');
INSERT INTO `t_brand` VALUES ('69', 'Nissan', 'Xuanyi');
INSERT INTO `t_brand` VALUES ('70', 'Nissan', 'Rolan');
INSERT INTO `t_brand` VALUES ('71', 'Nissan', 'NV200');
INSERT INTO `t_brand` VALUES ('72', 'Mitsubishi', 'Junge');
INSERT INTO `t_brand` VALUES ('73', 'Mitsubishi', 'JingxuanASX');
INSERT INTO `t_brand` VALUES ('74', 'Volvo', 'S80L');
INSERT INTO `t_brand` VALUES ('75', 'Volvo', 'c30');
INSERT INTO `t_brand` VALUES ('76', 'Volvo', 'S60');
INSERT INTO `t_brand` VALUES ('77', 'HYUNDAI', 'i30');
INSERT INTO `t_brand` VALUES ('78', 'HYUNDAI', 'Randong');
INSERT INTO `t_brand` VALUES ('79', 'HYUNDAI', 'Yuedong');
INSERT INTO `t_brand` VALUES ('80', 'HYUNDAI', 'Roency');
INSERT INTO `t_brand` VALUES ('81', 'Chevrolet', 'Cruze');
INSERT INTO `t_brand` VALUES ('82', 'Chevrolet', 'C5');
INSERT INTO `t_brand` VALUES ('83', 'Chevrolet', 'Fukang');
INSERT INTO `t_brand` VALUES ('84', 'Chevrolet', 'Shijia');
INSERT INTO `t_brand` VALUES ('85', 'Yiqi', 'Weizhi');
INSERT INTO `t_brand` VALUES ('86', 'Yiqi', 'XialiN5');

-- ----------------------------
-- Table structure for t_businessstore
-- ----------------------------
DROP TABLE IF EXISTS `t_businessstore`;
CREATE TABLE `t_businessstore` (
  `storeId` int(11) NOT NULL AUTO_INCREMENT,
  `storeNo` varchar(40) NOT NULL,
  `storePassword` varchar(40) NOT NULL,
  `storeName` varchar(50) NOT NULL,
  `storeImage` varchar(200) DEFAULT NULL,
  `storePhone` varchar(30) NOT NULL,
  `storeProvince` varchar(20) NOT NULL,
  `storeCity` varchar(20) NOT NULL,
  `storeDistrict` varchar(20) NOT NULL,
  `storeAddress` varchar(100) NOT NULL,
  `state` int(11) DEFAULT '1',
  PRIMARY KEY (`storeId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_businessstore
-- ----------------------------
INSERT INTO `t_businessstore` VALUES ('1', 'fjsfdxxmd', '111', 'Ximen', 'fzcswdd.jpg', '15060338989', 'FuJian', 'FuZhou', 'MInHou', 'University Town West Gate of Fujian Normal University', '1');
INSERT INTO `t_businessstore` VALUES ('2', 'fzcswdd', '111', 'Cangshan Wanda', 'fzcswdd.jpg', '15060338989', 'FuJian', 'FuZhou', 'CangShan', '\r\nWalmart bus free waiting area next to Jinjiang Capital Hotel, ', '1');
INSERT INTO `t_businessstore` VALUES ('3', 'ptxyhsd', '111', 'Xiuyu Hushi', 'xyhsd.jpg', '15060338989', 'FuJian', 'FuZhou', 'XiuYu', 'West Tianwei, Beipu, Ligang Avenue, Hushi town', '1');
INSERT INTO `t_businessstore` VALUES ('4', 'ptftd', '111', 'Fengting', 'ptftd.png', '15060338989', 'FuJian', 'FuZhou', 'YouXian', '20 South fengjiang street, Fengting town', '1');
INSERT INTO `t_businessstore` VALUES ('5', 'fzcswdd', '111111111', 'xiamen2', '20220423230747004.jpg', '13445677678', 'Anhui province', 'Anqing city', 'Yixiu district', '1313131', '0');

-- ----------------------------
-- Table structure for t_car
-- ----------------------------
DROP TABLE IF EXISTS `t_car`;
CREATE TABLE `t_car` (
  `carId` int(11) NOT NULL AUTO_INCREMENT,
  `storeId` int(11) NOT NULL,
  `carNumber` varchar(10) NOT NULL,
  `carBrand` varchar(20) NOT NULL,
  `carType` varchar(20) NOT NULL,
  `carForm` varchar(20) DEFAULT NULL,
  `carMoney` float NOT NULL,
  `carGear` varchar(20) NOT NULL,
  `carDisplacement` varchar(20) NOT NULL,
  `carBufyData` varchar(50) NOT NULL DEFAULT '2016-11-07',
  `compartment` varchar(20) NOT NULL DEFAULT '两厢',
  `seat` varchar(20) NOT NULL DEFAULT '5',
  `engineNum` varchar(20) NOT NULL DEFAULT '123456789',
  `carframeNum` varchar(20) NOT NULL DEFAULT '987654321',
  `carImage` varchar(100) DEFAULT NULL,
  `state` int(11) DEFAULT '1',
  PRIMARY KEY (`carId`),
  KEY `Relationship_1_FK` (`storeId`),
  CONSTRAINT `FK_Reference_3` FOREIGN KEY (`storeId`) REFERENCES `t_businessstore` (`storeId`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_car
-- ----------------------------
INSERT INTO `t_car` VALUES ('1', '1', 'A11111', 'Volkswagen', 'Polo', 'EconomicType', '260', 'Auto', '1.6T', '2016-05-02', '2carriage', '5', '1234567890', '9876543210', 'cchfh6.jpg', '0');
INSERT INTO `t_car` VALUES ('2', '1', 'A11112', 'Volkswagen', '0', 'EconomicType', '150', 'Auto', '1.5L', '2016-05-01', '3carriage', '5', '123456789', '987654321', 'dzlx.jpg', '1');
INSERT INTO `t_car` VALUES ('3', '1', 'A11112', 'Buick', 'Kaiyue', 'ComfortableType', '110', 'Manual', '1.5L', '2016-04-01', '3carriage', '5', '123456789', '987654321', 'bkky.jpg', '1');
INSERT INTO `t_car` VALUES ('4', '2', 'A22221', 'HYUNDAI', 'IX35', 'SUV', '200', 'Auto', '2.0L', '2016-04-01', 'SUV', '5', '123456789', '987654321', 'xdix.jpg', '1');
INSERT INTO `t_car` VALUES ('5', '2', 'A22222', 'BMW', '2Series', 'ComfortableType', '195', 'Auto', '1.5T', '2016-04-01', '2carriage', '5', '123456789', '987654321', 'bm2xydlxb.jpg', '0');
INSERT INTO `t_car` VALUES ('6', '3', 'B33331', 'Peugeot', '301', 'ComfortableType', '110', 'Manual', '1.6L', '2016-03-01', '3carriage', '5', '123456789', '987654321', 'bz301.jpg', '1');
INSERT INTO `t_car` VALUES ('7', '3', 'B33332', 'Peugeot', '2008', 'ElectricType', '173', 'Auto', '1.8L', '2016-03-01', 'SUV', '5', '123456789', '987654321', 'bz2008.jpg', '1');
INSERT INTO `t_car` VALUES ('8', '3', 'B33333', 'Land Rover', 'Discovery', 'SUV', '200', 'Auto', '2.0L', '2016-03-01', 'SUV', '7', '123456789', '987654321', 'lufxsx.jpg', '1');
INSERT INTO `t_car` VALUES ('9', '3', 'B33334', 'Honda', 'Accord', 'ComfortableType', '130', 'Manual', '1.8L', '2016-03-01', '3carriage', '5', '123456789', '987654321', 'btyg.jpg', '1');
INSERT INTO `t_car` VALUES ('10', '4', 'B44431', 'Havel', '0', 'EconomicType', '195', 'Manual', '1.5T', '2016-03-01', 'SUV', '7', '123456789', '987654321', 'cchfh6.jpg', '1');
INSERT INTO `t_car` VALUES ('11', '1', 'B44641', 'Audi', 'A7', 'ComfortableType', '100', 'Auto', '1.6T', '2016-05-01', '2carriage', '5', '123456789', '987654321', 'cchfh6.jpg', '1');
INSERT INTO `t_car` VALUES ('12', '1', 'B42441', 'Audi', 'A4L', 'EconomicType', '130', 'Auto', '1.1T', '2016-11-02', '2carriage', '2', '123456', '123123', 'dzlx.jpg', '1');
INSERT INTO `t_car` VALUES ('13', '1', 'B42441', 'Honda', 'Fengf', 'EconomicType', '360', 'Auto', '1.0L', '2016-11-02', '2carriage', '2', '123456789', '11', 'bz301.jpg', '1');
INSERT INTO `t_car` VALUES ('14', '4', 'B23441', 'Audi', 'A6L', 'ComfortableType', '490', 'Auto', '1.0L', '2016-11-07', '2carriage', '2', '111123456789', '123', 'btyg.jpg', '1');
INSERT INTO `t_car` VALUES ('15', '1', 'A11114', 'KIA', 'K4', 'EconomicType', '358', 'Auto', '1.5T', '2016-11-07', '2carriage', '5', '123456789', '987654321', '1.jpg', '1');
INSERT INTO `t_car` VALUES ('16', '2', 'A11115', 'KIA', 'K5', 'EconomicType', '450', 'Auto', '2.0L', '2016-11-07', '2carriage', '5', '123456789', '987654321', '2.jpg', '1');
INSERT INTO `t_car` VALUES ('17', '1', 'A11116', 'KIA', 'K3', 'ComfortableType', '260', 'Manual', '1.6L', '2016-11-07', '2carriage', '5', '123456789', '987654321', '3.jpg', '1');
INSERT INTO `t_car` VALUES ('18', '1', 'A11117', 'Volkswagen', 'Lamandoo', 'EconomicType', '525', 'Auto', '1.8L', '2016-11-07', '2carriage', '5', '123456789', '987654321', '4.jpg', '1');
INSERT INTO `t_car` VALUES ('19', '2', 'A11118', 'Volkswagen', 'Tiguan', 'ComfortableType', '360', 'Auto', '1.6T', '2016-11-07', '2carriage', '5', '123456789', '987654321', '5.jpg', '1');
INSERT INTO `t_car` VALUES ('20', '3', 'A11119', 'Volkswagen', 'Tuan', 'EconomicType', '345', 'Auto', '1.5L', '2016-11-07', '2carriage', '5', '123456789', '987654321', '6.jpg', '1');
INSERT INTO `t_car` VALUES ('21', '1', 'A11120', 'Volkswagen', 'Magoton', 'SUV', '650', 'Auto', '2.0T', '2016-11-07', '2carriage', '5', '123456789', '987654321', '7.jpg', '1');
INSERT INTO `t_car` VALUES ('22', '4', 'A11121', 'Volkswagen', 'Suget', 'EconomicType', '350', 'Manual', '1.5T', '2016-11-07', '2carriage', '5', '123456789', '987654321', '8.jpg', '1');
INSERT INTO `t_car` VALUES ('23', '1', 'A11122', 'Volkswagen', 'Xial', 'ComfortableType', '268', 'Auto', '1.6T', '2016-11-07', '2carriage', '5', '123456789', '987654321', '9.jpg', '1');
INSERT INTO `t_car` VALUES ('24', '2', 'A11123', 'Volkswagen', 'Santana', 'EconomicType', '258', 'Auto', '1.1T', '2016-11-07', '2carriage', '5', '123456789', '987654321', '10.jpg', '1');
INSERT INTO `t_car` VALUES ('25', '3', 'A11124', 'Volkswagen', 'Lanmo', 'ComfortableType', '450', 'Auto', '1.8L', '2016-11-07', '2carriage', '5', '123456789', '987654321', '11.jpg', '1');
INSERT INTO `t_car` VALUES ('26', '1', 'A11125', 'Volkswagen', 'Polo', 'EconomicType', '180', 'Auto', '1.6L', '2016-11-07', '2carriage', '5', '123456789', '987654321', '12.jpg', '1');
INSERT INTO `t_car` VALUES ('27', '1', 'A11126', 'Volkswagen', 'Passte', 'ComfortableType', '100', 'Auto', '1.8T', '2016-11-07', '2carriage', '5', '123456789', '987654321', '13.jpg', '1');
INSERT INTO `t_car` VALUES ('28', '1', 'A11127', 'Audi', 'A8L', 'ComfortableType', '600', 'Auto', '2.0T', '2016-11-07', '2carriage', '5', '123456789', '987654321', '14.jpg', '1');
INSERT INTO `t_car` VALUES ('29', '2', 'A11128', 'Audi', 'Q3', 'EconomicType', '450', 'Manual', '1.5T', '2016-11-07', '2carriage', '5', '123456789', '987654321', '15.jpg', '1');
INSERT INTO `t_car` VALUES ('30', '1', 'A11129', 'Audi', 'A5', 'SUV', '199', 'Auto', '1.1T', '2016-11-07', '2carriage', '5', '123456789', '987654321', '16.jpg', '1');
INSERT INTO `t_car` VALUES ('31', '3', 'A11130', 'Audi', 'A3', 'ComfortableType', '356', 'Auto', '1.8L', '2016-11-07', '2carriage', '5', '123456789', '987654321', '17.jpg', '1');
INSERT INTO `t_car` VALUES ('32', '1', 'A11131', 'Audi', 'Q5', 'ComfortableType', '410', 'Auto', '2.0T', '2016-11-07', '2carriage', '5', '123456789', '987654321', '18.jpg', '1');
INSERT INTO `t_car` VALUES ('33', '1', 'A11132', 'BMW', 'X1', 'EconomicType', '321', 'Auto', '1.6L', '2016-11-07', '2carriage', '5', '123456789', '987654321', '19.jpg', '1');
INSERT INTO `t_car` VALUES ('34', '2', 'A11133', 'BMW', '5S', 'ComfortableType', '395', 'Auto', '1.6L', '2016-11-07', '2carriage', '5', '123456789', '987654321', '20.jpg', '1');
INSERT INTO `t_car` VALUES ('35', '1', 'A11134', 'BMW', 'M5', 'ComfortableType', '550', 'Auto', '2.0T', '2016-11-07', '2carriage', '5', '123456789', '987654321', '21.jpg', '1');
INSERT INTO `t_car` VALUES ('36', '3', 'A11135', 'BMW', 'X6', 'ComfortableType', '560', 'Auto', '2.0T', '2016-11-07', '2carriage', '5', '123456789', '987654321', '22.jpg', '1');
INSERT INTO `t_car` VALUES ('37', '1', 'A11136', 'BMW', 'M4 ', 'ComfortableType', '450', 'Manual', '1.8L', '2016-11-07', '2carriage', '5', '123456789', '987654321', '23.jpg', '1');
INSERT INTO `t_car` VALUES ('38', '4', 'A11137', 'BMW', 'M3 coupe', 'EconomicType', '350', 'Manual', '1.6T', '2016-11-07', '2carriage', '5', '123456789', '987654321', '24.jpg', '1');
INSERT INTO `t_car` VALUES ('39', '1', 'A11138', 'Ford', 'Yihu', 'ComfortableType', '325', 'Auto', '1.5L', '2016-11-07', '2carriage', '5', '123456789', '987654321', '25.jpg', '1');
INSERT INTO `t_car` VALUES ('40', '4', 'A11139', 'Ford', 'RUijie', 'EconomicType', '256', 'Auto', '1.1T', '2016-11-07', '2carriage', '5', '123456789', '987654321', '26.jpg', '1');
INSERT INTO `t_car` VALUES ('41', '1', 'A11140', 'Ford', 'New Mengdio', 'ComfortableType', '360', 'Auto', '1.6L', '2016-11-07', '2carriage', '5', '123456789', '987654321', '27.jpg', '1');
INSERT INTO `t_car` VALUES ('42', '2', 'A11141', 'Ford', 'Hangluz', 'ComfortableType', '185', 'Auto', '1.8T', '2016-11-07', '2carriage', '5', '123456789', '987654321', '28.jpg', '1');
INSERT INTO `t_car` VALUES ('43', '1', 'A11142', 'Ford', 'Mustang', 'ComfortableType', '450', 'Auto', '2.0L', '2016-11-07', '2carriage', '5', '123456789', '987654321', '29.jpg', '1');
INSERT INTO `t_car` VALUES ('44', '3', 'A11143', 'Ford', 'Zhis', 'EconomicType', '235', 'Manual', '1.8L', '2016-11-07', '2carriage', '5', '123456789', '987654321', '30.jpg', '1');
INSERT INTO `t_car` VALUES ('45', '1', 'A11144', 'Ford', 'Yib', 'ComfortableType', '368', 'Auto', '1.8T', '2016-11-07', '2carriage', '5', '123456789', '987654321', '31.jpg', '1');
INSERT INTO `t_car` VALUES ('46', '1', 'A11145', 'Ford', 'New Quans', 'EconomicType', '450', 'Auto', '1.6L', '2016-11-07', '2carriage', '5', '123456789', '987654321', '1.jpg', '1');
INSERT INTO `t_car` VALUES ('47', '2', 'A11146', 'Ford', 'C-MAX', 'SUV', '500', 'Auto', '1.8T', '2016-11-07', '2carriage', '5', '123456789', '987654321', '2.jpg', '1');
INSERT INTO `t_car` VALUES ('48', '1', 'A11147', 'HYUNDAI', 'Mingt', 'EconomicType', '145', 'Auto', '1.6L', '2016-11-07', '2carriage', '5', '123456789', '987654321', '3.jpg', '1');
INSERT INTO `t_car` VALUES ('49', '1', 'A11148', 'HYUNDAI', 'Yuen', 'ComfortableType', '250', 'Auto', '1.6T', '2016-11-07', '2carriage', '5', '123456789', '987654321', '4.jpg', '1');
INSERT INTO `t_car` VALUES ('50', '1', 'A11149', 'HYUNDAI', 'Sonata9', 'ComfortableType', '330', 'Manual', '1.5T', '2016-11-07', '2carriage', '5', '123456789', '987654321', '5.jpg', '1');
INSERT INTO `t_car` VALUES ('51', '3', 'A11150', 'HYUNDAI', 'Gray', 'EconomicType', '450', 'Auto', '1.5L', '2016-11-07', '2carriage', '5', '123456789', '987654321', '6.jpg', '1');
INSERT INTO `t_car` VALUES ('52', '1', 'A11151', 'HYUNDAI', 'Laoency', 'ComfortableType', '550', 'Auto', '1.8T', '2016-11-07', '2carriage', '5', '123456789', '987654321', '7.jpg', '1');
INSERT INTO `t_car` VALUES ('53', '1', 'A11152', 'HYUNDAI', 'Jensi', 'EconomicType', '650', 'Auto', '2.0L', '2016-11-07', '2carriage', '5', '123456789', '987654321', '8.jpg', '1');
INSERT INTO `t_car` VALUES ('54', '2', 'A11153', 'HYUNDAI', 'Huiy', 'ComfortableType', '99', 'Auto', '1.8L', '2016-11-07', '2carriage', '5', '123456789', '987654321', '9.jpg', '1');
INSERT INTO `t_car` VALUES ('55', '1', 'A11154', 'HYUNDAI', '3008', 'EconomicType', '150', 'Auto', '1.8T', '2016-11-07', '2carriage', '5', '123456789', '987654321', '10.jpg', '1');
INSERT INTO `t_car` VALUES ('56', '2', 'A11155', 'HYUNDAI', '408', 'ComfortableType', '350', 'Auto', '1.1T', '2016-11-07', '2carriage', '5', '123456789', '987654321', '11.jpg', '1');
INSERT INTO `t_car` VALUES ('57', '1', 'A11156', 'HYUNDAI', 'RCZ', 'ComfortableType', '245', 'Auto', '1.1L', '2016-11-07', '2carriage', '5', '123456789', '987654321', '12.jpg', '1');
INSERT INTO `t_car` VALUES ('58', '3', 'A11157', 'Buick', 'Juny', 'EconomicType', '250', 'Manual', '1.5L', '2016-11-07', '2carriage', '5', '123456789', '987654321', '13.jpg', '1');
INSERT INTO `t_car` VALUES ('59', '1', 'A11158', 'Buick', 'Yingl', 'ComfortableType', '290', 'Auto', '1.8L', '2016-11-07', '2carriage', '5', '123456789', '987654321', '14.jpg', '1');
INSERT INTO `t_car` VALUES ('60', '1', 'A11159', 'Buick', 'Weil', 'EconomicType', '300', 'Auto', '1.6L', '2016-11-07', '2carriage', '5', '123456789', '987654321', '15.jpg', '1');
INSERT INTO `t_car` VALUES ('61', '2', 'A11160', 'Buick', 'Angkel', 'ComfortableType', '305', 'Auto', '1.6L', '2016-11-07', '2carriage', '5', '123456789', '987654321', '16.jpg', '1');
INSERT INTO `t_car` VALUES ('62', '1', 'A11161', 'Buick', 'Ankew', 'ComfortableType', '350', 'Auto', '1.6T', '2016-11-07', '2carriage', '5', '123456789', '987654321', '17.jpg', '1');
INSERT INTO `t_car` VALUES ('63', '1', 'A11162', 'CA', 'Yido', 'EconomicType', '195', 'Manual', '1.5T', '2016-11-07', '2carriage', '5', '123456789', '987654321', '18.jpg', '1');
INSERT INTO `t_car` VALUES ('64', '2', 'A11163', 'CA', 'Benb', 'EconomicType', '99', 'Manual', '1.0T', '2016-11-07', '2carriage', '5', '123456789', '987654321', '19.jpg', '1');
INSERT INTO `t_car` VALUES ('65', '1', 'A11164', 'CA', 'YuexV7', 'ComfortableType', '268', 'Auto', '1.5L', '2016-11-07', '2carriage', '5', '123456789', '987654321', '20.jpg', '1');
INSERT INTO `t_car` VALUES ('66', '3', 'A11165', 'CA ', 'Ruic', 'ComfortableType', '360', 'Auto', '1.5T', '2016-11-07', '2carriage', '5', '123456789', '987654321', '21.jpg', '1');
INSERT INTO `t_car` VALUES ('67', '1', 'A11166', 'CA ', 'CS35', 'EconomicType', '360', 'Manual', '1.6L', '2016-11-07', '2carriage', '5', '123456789', '987654321', '22.jpg', '1');
INSERT INTO `t_car` VALUES ('68', '1', 'A11167', 'CA', 'YidoEV', 'ComfortableType', '450', 'Auto', '2.0T', '2016-11-07', '2carriage', '5', '123456789', '987654321', '23.jpg', '1');
INSERT INTO `t_car` VALUES ('69', '2', 'A11168', 'BYD', 'Tang', 'ComfortableType', '220', 'Auto', '2.0T', '2016-11-07', '2carriage', '5', '123456789', '987654321', '24.jpg', '1');
INSERT INTO `t_car` VALUES ('70', '1', 'A11169', 'BYD', 'Song', 'ComfortableType', '260', 'Auto', '1.8L', '2016-11-07', '2carriage', '5', '123456789', '987654321', '25.jpg', '1');
INSERT INTO `t_car` VALUES ('71', '1', 'A11170', 'BYD', 'Yuan', 'EconomicType', '360', 'Manual', '1.3L', '2016-11-07', '2carriage', '5', '123456789', '987654321', '26.jpg', '1');
INSERT INTO `t_car` VALUES ('72', '3', 'A11171', 'BYD', 'S7', 'ComfortableType', '260', 'Auto', '1.6T', '2016-11-07', '2carriage', '5', '123456789', '987654321', '27.jpg', '1');
INSERT INTO `t_car` VALUES ('73', '1', 'A1117', 'BYD', 'Qin', 'EconomicType', '280', 'Auto', '1.6L', '2016-11-07', '2carriage', '5', '123456789', '987654321', '28.jpg', '1');
INSERT INTO `t_car` VALUES ('74', '2', 'A11173', 'BYD', 'Surui', 'ComfortableType', '330', 'Auto', '1.6T', '2016-11-07', '2carriage', '5', '123456789', '987654321', '29.jpg', '1');
INSERT INTO `t_car` VALUES ('75', '1', 'A11174', 'BYD', 'G3', 'ComfortableType', '450', 'Manual', '1.8T', '2016-11-07', '2carriage', '5', '123456789', '987654321', '30.jpg', '1');
INSERT INTO `t_car` VALUES ('76', '1', 'A11175', 'Toyota', '0', 'SUV', '250', 'Auto', '1.3L', '2016-11-07', '2carriage', '7', '123456789', '987654321', '31.jpg', '1');
INSERT INTO `t_car` VALUES ('77', '2', 'A11176', 'Mazda', 'Atenz', 'ComfortableType', '360', 'Auto', '1.3T', '2016-11-07', '2carriage', '5', '123456789', '987654321', '2.jpg', '1');
INSERT INTO `t_car` VALUES ('78', '1', 'A11177', 'Mazda', '6', 'ComfortableType', '260', 'Auto', '1.6L', '2016-11-07', '2carriage', '5', '123456789', '987654321', '3.jpg', '1');
INSERT INTO `t_car` VALUES ('79', '1', 'A11178', 'Mazda', 'Ruiyi', 'EconomicType', '450', 'Manual', '2.0T', '2016-11-07', '2carriage', '5', '123456789', '987654321', '4.jpg', '1');
INSERT INTO `t_car` VALUES ('80', '4', 'A11179', 'Chevrolet', 'Kopaqi', 'ComfortableType', '365', 'Auto', '2.0T', '2016-11-07', '2carriage', '5', '123456789', '987654321', '5.jpg', '1');
INSERT INTO `t_car` VALUES ('81', '1', 'A11180', 'Chevrolet', 'Camero', 'ComfortableType', '350', 'Auto', '1.8L', '2016-11-07', '2carriage', '5', '123456789', '987654321', '6.jpg', '1');
INSERT INTO `t_car` VALUES ('82', '2', 'A11181', 'Chevrolet', 'ChK', 'ComfortableType', '330', 'Auto', '1.5T', '2016-11-07', '2carriage', '5', '123456789', '987654321', '7.jpg', '1');
INSERT INTO `t_car` VALUES ('83', '1', 'A11182', 'Chevrolet', 'Malibu', 'ComfortableType', '250', 'Auto', '1.3L', '2016-11-07', '2carriage', '5', '123456789', '987654321', '8.jpg', '1');
INSERT INTO `t_car` VALUES ('84', '1', 'A11183', 'Chevrolet', 'MalibuXL', 'EconomicType', '260', 'Manual', '1.6T', '2016-11-07', '2carriage', '5', '123456789', '987654321', '9.jpg', '1');

-- ----------------------------
-- Table structure for t_daycarrental
-- ----------------------------
DROP TABLE IF EXISTS `t_daycarrental`;
CREATE TABLE `t_daycarrental` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `carId` int(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `day` int(11) DEFAULT NULL,
  `rentalNum` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `carId` (`carId`),
  CONSTRAINT `t_daycarrental_ibfk_1` FOREIGN KEY (`carId`) REFERENCES `t_car` (`carId`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_daycarrental
-- ----------------------------
INSERT INTO `t_daycarrental` VALUES ('29', '1', '2016', '5', '1', '2');
INSERT INTO `t_daycarrental` VALUES ('30', '2', '2016', '5', '1', '1');
INSERT INTO `t_daycarrental` VALUES ('31', '14', '2016', '5', '1', '0');
INSERT INTO `t_daycarrental` VALUES ('32', '3', '2016', '5', '1', '0');
INSERT INTO `t_daycarrental` VALUES ('33', '4', '2016', '5', '1', '0');
INSERT INTO `t_daycarrental` VALUES ('34', '5', '2016', '5', '1', '0');
INSERT INTO `t_daycarrental` VALUES ('35', '6', '2016', '5', '1', '0');
INSERT INTO `t_daycarrental` VALUES ('36', '7', '2016', '5', '1', '0');
INSERT INTO `t_daycarrental` VALUES ('37', '8', '2016', '5', '1', '0');
INSERT INTO `t_daycarrental` VALUES ('38', '9', '2016', '5', '1', '0');
INSERT INTO `t_daycarrental` VALUES ('39', '10', '2016', '5', '1', '0');
INSERT INTO `t_daycarrental` VALUES ('40', '11', '2016', '5', '1', '0');
INSERT INTO `t_daycarrental` VALUES ('41', '12', '2016', '5', '1', '0');
INSERT INTO `t_daycarrental` VALUES ('42', '13', '2016', '5', '1', '0');
INSERT INTO `t_daycarrental` VALUES ('43', '1', '2016', '5', '2', '5');
INSERT INTO `t_daycarrental` VALUES ('44', '2', '2016', '5', '2', '3');
INSERT INTO `t_daycarrental` VALUES ('45', '1', '2016', '6', '1', '10');

-- ----------------------------
-- Table structure for t_dayregister
-- ----------------------------
DROP TABLE IF EXISTS `t_dayregister`;
CREATE TABLE `t_dayregister` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year` int(11) NOT NULL,
  `month` int(11) NOT NULL,
  `day` int(11) NOT NULL,
  `regCount` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=253 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_dayregister
-- ----------------------------
INSERT INTO `t_dayregister` VALUES ('101', '2016', '8', '1', '70');
INSERT INTO `t_dayregister` VALUES ('102', '2016', '8', '2', '45');
INSERT INTO `t_dayregister` VALUES ('103', '2016', '8', '3', '69');
INSERT INTO `t_dayregister` VALUES ('104', '2016', '8', '4', '82');
INSERT INTO `t_dayregister` VALUES ('105', '2016', '8', '5', '73');
INSERT INTO `t_dayregister` VALUES ('106', '2016', '8', '6', '59');
INSERT INTO `t_dayregister` VALUES ('107', '2016', '8', '7', '53');
INSERT INTO `t_dayregister` VALUES ('108', '2016', '8', '8', '67');
INSERT INTO `t_dayregister` VALUES ('109', '2016', '8', '9', '54');
INSERT INTO `t_dayregister` VALUES ('110', '2016', '8', '10', '63');
INSERT INTO `t_dayregister` VALUES ('111', '2016', '8', '11', '67');
INSERT INTO `t_dayregister` VALUES ('112', '2016', '8', '12', '64');
INSERT INTO `t_dayregister` VALUES ('113', '2016', '8', '13', '72');
INSERT INTO `t_dayregister` VALUES ('114', '2016', '8', '14', '64');
INSERT INTO `t_dayregister` VALUES ('115', '2016', '8', '15', '67');
INSERT INTO `t_dayregister` VALUES ('116', '2016', '8', '16', '71');
INSERT INTO `t_dayregister` VALUES ('117', '2016', '8', '17', '59');
INSERT INTO `t_dayregister` VALUES ('118', '2016', '8', '18', '79');
INSERT INTO `t_dayregister` VALUES ('119', '2016', '8', '19', '55');
INSERT INTO `t_dayregister` VALUES ('120', '2016', '8', '20', '56');
INSERT INTO `t_dayregister` VALUES ('121', '2016', '8', '21', '59');
INSERT INTO `t_dayregister` VALUES ('122', '2016', '8', '22', '60');
INSERT INTO `t_dayregister` VALUES ('123', '2016', '8', '23', '80');
INSERT INTO `t_dayregister` VALUES ('124', '2016', '8', '24', '72');
INSERT INTO `t_dayregister` VALUES ('125', '2016', '8', '25', '51');
INSERT INTO `t_dayregister` VALUES ('126', '2016', '8', '26', '66');
INSERT INTO `t_dayregister` VALUES ('127', '2016', '8', '27', '59');
INSERT INTO `t_dayregister` VALUES ('128', '2016', '8', '28', '58');
INSERT INTO `t_dayregister` VALUES ('129', '2016', '8', '29', '82');
INSERT INTO `t_dayregister` VALUES ('130', '2016', '8', '30', '65');
INSERT INTO `t_dayregister` VALUES ('131', '2016', '8', '31', '60');
INSERT INTO `t_dayregister` VALUES ('132', '2016', '9', '1', '59');
INSERT INTO `t_dayregister` VALUES ('133', '2016', '9', '2', '67');
INSERT INTO `t_dayregister` VALUES ('134', '2016', '9', '3', '60');
INSERT INTO `t_dayregister` VALUES ('135', '2016', '9', '4', '60');
INSERT INTO `t_dayregister` VALUES ('136', '2016', '9', '5', '57');
INSERT INTO `t_dayregister` VALUES ('137', '2016', '9', '6', '65');
INSERT INTO `t_dayregister` VALUES ('138', '2016', '9', '7', '81');
INSERT INTO `t_dayregister` VALUES ('139', '2016', '9', '8', '68');
INSERT INTO `t_dayregister` VALUES ('140', '2016', '9', '9', '65');
INSERT INTO `t_dayregister` VALUES ('141', '2016', '9', '10', '68');
INSERT INTO `t_dayregister` VALUES ('142', '2016', '9', '11', '69');
INSERT INTO `t_dayregister` VALUES ('143', '2016', '9', '12', '65');
INSERT INTO `t_dayregister` VALUES ('144', '2016', '9', '13', '70');
INSERT INTO `t_dayregister` VALUES ('145', '2016', '9', '14', '62');
INSERT INTO `t_dayregister` VALUES ('146', '2016', '9', '15', '67');
INSERT INTO `t_dayregister` VALUES ('147', '2016', '9', '16', '57');
INSERT INTO `t_dayregister` VALUES ('148', '2016', '9', '17', '71');
INSERT INTO `t_dayregister` VALUES ('149', '2016', '9', '18', '76');
INSERT INTO `t_dayregister` VALUES ('150', '2016', '9', '19', '76');
INSERT INTO `t_dayregister` VALUES ('151', '2016', '9', '20', '68');
INSERT INTO `t_dayregister` VALUES ('152', '2016', '9', '21', '67');
INSERT INTO `t_dayregister` VALUES ('153', '2016', '9', '22', '67');
INSERT INTO `t_dayregister` VALUES ('154', '2016', '9', '23', '66');
INSERT INTO `t_dayregister` VALUES ('155', '2016', '9', '24', '62');
INSERT INTO `t_dayregister` VALUES ('156', '2016', '9', '25', '44');
INSERT INTO `t_dayregister` VALUES ('157', '2016', '9', '26', '61');
INSERT INTO `t_dayregister` VALUES ('158', '2016', '9', '27', '64');
INSERT INTO `t_dayregister` VALUES ('159', '2016', '9', '28', '82');
INSERT INTO `t_dayregister` VALUES ('160', '2016', '9', '29', '70');
INSERT INTO `t_dayregister` VALUES ('161', '2016', '9', '30', '70');
INSERT INTO `t_dayregister` VALUES ('162', '2016', '10', '1', '63');
INSERT INTO `t_dayregister` VALUES ('163', '2016', '10', '2', '60');
INSERT INTO `t_dayregister` VALUES ('164', '2016', '10', '3', '72');
INSERT INTO `t_dayregister` VALUES ('165', '2016', '10', '4', '69');
INSERT INTO `t_dayregister` VALUES ('166', '2016', '10', '5', '58');
INSERT INTO `t_dayregister` VALUES ('167', '2016', '10', '6', '45');
INSERT INTO `t_dayregister` VALUES ('168', '2016', '10', '7', '79');
INSERT INTO `t_dayregister` VALUES ('169', '2016', '10', '8', '64');
INSERT INTO `t_dayregister` VALUES ('170', '2016', '10', '9', '74');
INSERT INTO `t_dayregister` VALUES ('171', '2016', '10', '10', '69');
INSERT INTO `t_dayregister` VALUES ('172', '2016', '10', '11', '66');
INSERT INTO `t_dayregister` VALUES ('173', '2016', '10', '12', '66');
INSERT INTO `t_dayregister` VALUES ('174', '2016', '10', '13', '59');
INSERT INTO `t_dayregister` VALUES ('175', '2016', '10', '14', '63');
INSERT INTO `t_dayregister` VALUES ('176', '2016', '10', '15', '63');
INSERT INTO `t_dayregister` VALUES ('177', '2016', '10', '16', '58');
INSERT INTO `t_dayregister` VALUES ('178', '2016', '10', '17', '66');
INSERT INTO `t_dayregister` VALUES ('179', '2016', '10', '18', '71');
INSERT INTO `t_dayregister` VALUES ('180', '2016', '10', '19', '57');
INSERT INTO `t_dayregister` VALUES ('181', '2016', '10', '20', '68');
INSERT INTO `t_dayregister` VALUES ('182', '2016', '10', '21', '73');
INSERT INTO `t_dayregister` VALUES ('183', '2016', '10', '22', '72');
INSERT INTO `t_dayregister` VALUES ('184', '2016', '10', '23', '63');
INSERT INTO `t_dayregister` VALUES ('185', '2016', '10', '24', '79');
INSERT INTO `t_dayregister` VALUES ('186', '2016', '10', '25', '52');
INSERT INTO `t_dayregister` VALUES ('187', '2016', '10', '26', '60');
INSERT INTO `t_dayregister` VALUES ('188', '2016', '10', '27', '71');
INSERT INTO `t_dayregister` VALUES ('189', '2016', '10', '28', '66');
INSERT INTO `t_dayregister` VALUES ('190', '2016', '10', '29', '58');
INSERT INTO `t_dayregister` VALUES ('191', '2016', '10', '30', '57');
INSERT INTO `t_dayregister` VALUES ('192', '2016', '10', '31', '75');
INSERT INTO `t_dayregister` VALUES ('193', '2016', '11', '1', '72');
INSERT INTO `t_dayregister` VALUES ('194', '2016', '11', '2', '78');
INSERT INTO `t_dayregister` VALUES ('195', '2016', '11', '3', '68');
INSERT INTO `t_dayregister` VALUES ('196', '2016', '11', '4', '56');
INSERT INTO `t_dayregister` VALUES ('197', '2016', '11', '5', '71');
INSERT INTO `t_dayregister` VALUES ('198', '2016', '11', '6', '46');
INSERT INTO `t_dayregister` VALUES ('199', '2016', '11', '7', '60');
INSERT INTO `t_dayregister` VALUES ('200', '2016', '11', '8', '75');
INSERT INTO `t_dayregister` VALUES ('201', '2016', '11', '9', '58');
INSERT INTO `t_dayregister` VALUES ('202', '2016', '11', '10', '78');
INSERT INTO `t_dayregister` VALUES ('203', '2016', '11', '11', '75');
INSERT INTO `t_dayregister` VALUES ('204', '2016', '11', '12', '65');
INSERT INTO `t_dayregister` VALUES ('205', '2016', '11', '13', '79');
INSERT INTO `t_dayregister` VALUES ('206', '2016', '11', '14', '70');
INSERT INTO `t_dayregister` VALUES ('207', '2016', '11', '15', '59');
INSERT INTO `t_dayregister` VALUES ('208', '2016', '11', '16', '68');
INSERT INTO `t_dayregister` VALUES ('209', '2016', '11', '17', '72');
INSERT INTO `t_dayregister` VALUES ('210', '2016', '11', '18', '66');
INSERT INTO `t_dayregister` VALUES ('211', '2016', '11', '19', '66');
INSERT INTO `t_dayregister` VALUES ('212', '2016', '11', '20', '77');
INSERT INTO `t_dayregister` VALUES ('213', '2016', '11', '21', '59');
INSERT INTO `t_dayregister` VALUES ('214', '2016', '11', '22', '62');
INSERT INTO `t_dayregister` VALUES ('215', '2016', '11', '23', '68');
INSERT INTO `t_dayregister` VALUES ('216', '2016', '11', '24', '63');
INSERT INTO `t_dayregister` VALUES ('217', '2016', '11', '25', '61');
INSERT INTO `t_dayregister` VALUES ('218', '2016', '11', '26', '72');
INSERT INTO `t_dayregister` VALUES ('219', '2016', '11', '27', '74');
INSERT INTO `t_dayregister` VALUES ('220', '2016', '11', '28', '68');
INSERT INTO `t_dayregister` VALUES ('221', '2016', '11', '29', '69');
INSERT INTO `t_dayregister` VALUES ('222', '2016', '11', '30', '65');
INSERT INTO `t_dayregister` VALUES ('223', '2016', '12', '1', '58');
INSERT INTO `t_dayregister` VALUES ('224', '2016', '12', '2', '60');
INSERT INTO `t_dayregister` VALUES ('225', '2016', '12', '3', '69');
INSERT INTO `t_dayregister` VALUES ('226', '2016', '12', '4', '75');
INSERT INTO `t_dayregister` VALUES ('227', '2016', '12', '5', '51');
INSERT INTO `t_dayregister` VALUES ('228', '2016', '12', '6', '73');
INSERT INTO `t_dayregister` VALUES ('229', '2016', '12', '7', '45');
INSERT INTO `t_dayregister` VALUES ('230', '2016', '12', '8', '57');
INSERT INTO `t_dayregister` VALUES ('231', '2016', '12', '9', '70');
INSERT INTO `t_dayregister` VALUES ('232', '2016', '12', '10', '80');
INSERT INTO `t_dayregister` VALUES ('233', '2016', '12', '11', '70');
INSERT INTO `t_dayregister` VALUES ('234', '2016', '12', '12', '64');
INSERT INTO `t_dayregister` VALUES ('235', '2016', '12', '13', '54');
INSERT INTO `t_dayregister` VALUES ('236', '2016', '12', '14', '56');
INSERT INTO `t_dayregister` VALUES ('237', '2016', '12', '15', '72');
INSERT INTO `t_dayregister` VALUES ('238', '2016', '12', '16', '89');
INSERT INTO `t_dayregister` VALUES ('239', '2016', '12', '17', '71');
INSERT INTO `t_dayregister` VALUES ('240', '2016', '12', '18', '63');
INSERT INTO `t_dayregister` VALUES ('241', '2016', '12', '19', '62');
INSERT INTO `t_dayregister` VALUES ('242', '2016', '12', '20', '72');
INSERT INTO `t_dayregister` VALUES ('243', '2016', '12', '21', '56');
INSERT INTO `t_dayregister` VALUES ('244', '2016', '12', '22', '67');
INSERT INTO `t_dayregister` VALUES ('245', '2016', '12', '23', '58');
INSERT INTO `t_dayregister` VALUES ('246', '2016', '12', '24', '74');
INSERT INTO `t_dayregister` VALUES ('247', '2016', '12', '25', '65');
INSERT INTO `t_dayregister` VALUES ('248', '2016', '12', '26', '72');
INSERT INTO `t_dayregister` VALUES ('249', '2016', '12', '27', '73');
INSERT INTO `t_dayregister` VALUES ('250', '2016', '12', '28', '78');
INSERT INTO `t_dayregister` VALUES ('251', '2016', '12', '29', '75');
INSERT INTO `t_dayregister` VALUES ('252', '2016', '12', '30', '64');

-- ----------------------------
-- Table structure for t_daystoreprofit
-- ----------------------------
DROP TABLE IF EXISTS `t_daystoreprofit`;
CREATE TABLE `t_daystoreprofit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `storeId` int(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `day` int(11) DEFAULT NULL,
  `sumMoney` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `storeId` (`storeId`),
  CONSTRAINT `t_daystoreprofit_ibfk_1` FOREIGN KEY (`storeId`) REFERENCES `t_businessstore` (`storeId`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_daystoreprofit
-- ----------------------------
INSERT INTO `t_daystoreprofit` VALUES ('1', '1', '2016', '11', '14', '1000');
INSERT INTO `t_daystoreprofit` VALUES ('2', '2', '2016', '11', '14', '200');
INSERT INTO `t_daystoreprofit` VALUES ('3', '3', '2016', '11', '14', '0');
INSERT INTO `t_daystoreprofit` VALUES ('4', '4', '2016', '11', '14', '0');
INSERT INTO `t_daystoreprofit` VALUES ('6', '1', '2016', '11', '13', '500');
INSERT INTO `t_daystoreprofit` VALUES ('7', '2', '2016', '11', '13', '500');
INSERT INTO `t_daystoreprofit` VALUES ('8', '3', '2016', '11', '13', '300');
INSERT INTO `t_daystoreprofit` VALUES ('9', '4', '2016', '11', '13', '200');
INSERT INTO `t_daystoreprofit` VALUES ('10', '1', '2016', '10', '31', '100');
INSERT INTO `t_daystoreprofit` VALUES ('11', '2', '2016', '10', '31', '500');
INSERT INTO `t_daystoreprofit` VALUES ('12', '3', '2016', '10', '31', '300');
INSERT INTO `t_daystoreprofit` VALUES ('13', '4', '2016', '10', '31', '300');

-- ----------------------------
-- Table structure for t_frequentcontacts
-- ----------------------------
DROP TABLE IF EXISTS `t_frequentcontacts`;
CREATE TABLE `t_frequentcontacts` (
  `frequentId` int(11) NOT NULL AUTO_INCREMENT,
  `memberId` int(11) NOT NULL,
  `frequentName` varchar(20) NOT NULL,
  `frequentPhone` varchar(30) NOT NULL,
  `idType` varchar(20) NOT NULL,
  `Identity` varchar(20) NOT NULL,
  `frequentProvince` varchar(20) DEFAULT NULL,
  `frequentCity` varchar(20) DEFAULT NULL,
  `frequentAddresss` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`frequentId`),
  KEY `Relationship_3_FK` (`memberId`),
  CONSTRAINT `FK_Reference_1` FOREIGN KEY (`memberId`) REFERENCES `t_member` (`memberId`)
) ENGINE=InnoDB AUTO_INCREMENT=40069 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_frequentcontacts
-- ----------------------------
INSERT INTO `t_frequentcontacts` VALUES ('10017', '10017', '10017', '13789898989', 'idcard', '350301199411011101', 'FuJian', 'XiaMen', 'FuJian XiaMen xxx');
INSERT INTO `t_frequentcontacts` VALUES ('40067', '10017', 'john', '12445677890', 'idcard', '122364788989767890', 'Hainan province', 'Wanning city', 'xxxxx');
INSERT INTO `t_frequentcontacts` VALUES ('40068', '10017', 'Tom', '21313889876', 'idcard', '132131231231443', 'province', 'city', 'xxxxx');

-- ----------------------------
-- Table structure for t_insurance
-- ----------------------------
DROP TABLE IF EXISTS `t_insurance`;
CREATE TABLE `t_insurance` (
  `insuranceId` int(11) NOT NULL AUTO_INCREMENT,
  `insuranceName` varchar(50) NOT NULL,
  `insurancePrice` float NOT NULL,
  `insuranceContent` varchar(1000) NOT NULL,
  `state` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`insuranceId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_insurance
-- ----------------------------
INSERT INTO `t_insurance` VALUES ('1', 'No deductible service', '50', 'If the vehicle is in danger during the lease period, the customer shall not be liable for any loss within the scope of insurance claim, as well as tire loss.\r\n\r\nThis service is charged by day. If the time-out is more than 4 hours, it will be charged by one day. If the time-out is less than 4 hours, there is no additional charge', '1');
INSERT INTO `t_insurance` VALUES ('2', 'Service Charge', '30', 'Service Charge', '1');
INSERT INTO `t_insurance` VALUES ('3', 'Supplementary third party liability insurance', '125', 'The coverage of the insured vehicle is 100% of the claim approved by the insurance company within 500000 yuan.', '1');
INSERT INTO `t_insurance` VALUES ('4', 'I\'ll refuel you', '287', 'If you choose this service, you will get a box of oil for the rental model at a discount of 10% of the market price. When you pick up the car with full oil, you can return the car with any amount of oil. When you return the car, you will not change or return the remaining oil tank.', '1');
INSERT INTO `t_insurance` VALUES ('5', 'Passenger seat support', '178', 'The compensation standard shall be subject to the approval of the insurance company and the upper limit of compensation shall not exceed 50000 yuan / person / seat.\r\n\r\n', '1');
INSERT INTO `t_insurance` VALUES ('6', 'Service Charge', '30', 'Service Charge', '1');

-- ----------------------------
-- Table structure for t_member
-- ----------------------------
DROP TABLE IF EXISTS `t_member`;
CREATE TABLE `t_member` (
  `memberId` int(11) NOT NULL AUTO_INCREMENT,
  `memberNo` varchar(40) NOT NULL,
  `memberPassword` varchar(40) NOT NULL,
  `memberName` varchar(200) NOT NULL,
  `memberSex` varchar(10) DEFAULT NULL,
  `memberPhone` varchar(200) NOT NULL,
  `memberImage` varchar(200) DEFAULT NULL,
  `registerTime` datetime DEFAULT NULL,
  PRIMARY KEY (`memberId`)
) ENGINE=InnoDB AUTO_INCREMENT=10019 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_member
-- ----------------------------
INSERT INTO `t_member` VALUES ('10017', '123456', '111', 'RJ ', null, '13767890987', null, '2022-03-29 01:24:16');
INSERT INTO `t_member` VALUES ('10018', 'fzcswdd111', 'fzcswdd111', 'John', null, '1213213123312', null, '2022-04-23 22:47:10');

-- ----------------------------
-- Table structure for t_message
-- ----------------------------
DROP TABLE IF EXISTS `t_message`;
CREATE TABLE `t_message` (
  `messageId` int(11) NOT NULL AUTO_INCREMENT,
  `memberId` int(11) NOT NULL,
  `messageContent` varchar(1000) NOT NULL,
  `messageDate` datetime NOT NULL,
  `messageImage` varchar(100) NOT NULL DEFAULT '',
  `state` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`messageId`),
  KEY `Relationship_2_FK` (`memberId`),
  CONSTRAINT `FK_Reference_2` FOREIGN KEY (`memberId`) REFERENCES `t_member` (`memberId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_message
-- ----------------------------

-- ----------------------------
-- Table structure for t_monthcarrental
-- ----------------------------
DROP TABLE IF EXISTS `t_monthcarrental`;
CREATE TABLE `t_monthcarrental` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `carId` int(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `rentalNum` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `carId` (`carId`),
  CONSTRAINT `t_monthcarrental_ibfk_1` FOREIGN KEY (`carId`) REFERENCES `t_car` (`carId`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_monthcarrental
-- ----------------------------
INSERT INTO `t_monthcarrental` VALUES ('29', '1', '2022', '5', '7');
INSERT INTO `t_monthcarrental` VALUES ('30', '2', '2022', '5', '4');
INSERT INTO `t_monthcarrental` VALUES ('31', '3', '2022', '5', '0');
INSERT INTO `t_monthcarrental` VALUES ('32', '4', '2022', '5', '0');
INSERT INTO `t_monthcarrental` VALUES ('33', '5', '2022', '5', '0');
INSERT INTO `t_monthcarrental` VALUES ('34', '6', '2022', '5', '0');
INSERT INTO `t_monthcarrental` VALUES ('35', '7', '2022', '5', '0');
INSERT INTO `t_monthcarrental` VALUES ('36', '8', '2022', '5', '0');
INSERT INTO `t_monthcarrental` VALUES ('37', '9', '2022', '5', '0');
INSERT INTO `t_monthcarrental` VALUES ('38', '10', '2022', '5', '0');
INSERT INTO `t_monthcarrental` VALUES ('39', '11', '2022', '5', '0');
INSERT INTO `t_monthcarrental` VALUES ('40', '12', '2022', '5', '0');
INSERT INTO `t_monthcarrental` VALUES ('41', '13', '2022', '5', '0');
INSERT INTO `t_monthcarrental` VALUES ('42', '14', '2016', '5', '0');

-- ----------------------------
-- Table structure for t_monthregister
-- ----------------------------
DROP TABLE IF EXISTS `t_monthregister`;
CREATE TABLE `t_monthregister` (
  `int` int(11) NOT NULL AUTO_INCREMENT,
  `year` int(11) NOT NULL,
  `month` int(11) NOT NULL,
  `regcount` int(11) DEFAULT NULL,
  PRIMARY KEY (`int`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_monthregister
-- ----------------------------
INSERT INTO `t_monthregister` VALUES ('5', '2016', '8', '2001');
INSERT INTO `t_monthregister` VALUES ('6', '2016', '9', '1984');
INSERT INTO `t_monthregister` VALUES ('7', '2016', '10', '2016');
INSERT INTO `t_monthregister` VALUES ('8', '2016', '11', '2020');
INSERT INTO `t_monthregister` VALUES ('9', '2016', '12', '1993');

-- ----------------------------
-- Table structure for t_monthstoreprofit
-- ----------------------------
DROP TABLE IF EXISTS `t_monthstoreprofit`;
CREATE TABLE `t_monthstoreprofit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `storeId` int(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `sumMoney` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `storeId` (`storeId`),
  CONSTRAINT `t_monthstoreprofit_ibfk_1` FOREIGN KEY (`storeId`) REFERENCES `t_businessstore` (`storeId`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_monthstoreprofit
-- ----------------------------
INSERT INTO `t_monthstoreprofit` VALUES ('13', '1', '2022', '11', '1500');
INSERT INTO `t_monthstoreprofit` VALUES ('14', '2', '2022', '11', '700');
INSERT INTO `t_monthstoreprofit` VALUES ('15', '3', '2022', '11', '300');
INSERT INTO `t_monthstoreprofit` VALUES ('16', '4', '2022', '11', '200');
INSERT INTO `t_monthstoreprofit` VALUES ('17', '1', '2022', '10', '3000');
INSERT INTO `t_monthstoreprofit` VALUES ('18', '2', '2022', '10', '1000');
INSERT INTO `t_monthstoreprofit` VALUES ('19', '3', '2022', '10', '3000');
INSERT INTO `t_monthstoreprofit` VALUES ('20', '4', '2016', '10', '4000');

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `orderId` int(11) NOT NULL AUTO_INCREMENT,
  `fromStoreId` int(11) NOT NULL,
  `toStoreId` int(11) NOT NULL,
  `frequentId` int(11) NOT NULL,
  `carId` int(11) NOT NULL,
  `orderTime` datetime NOT NULL,
  `collectionTime` datetime NOT NULL,
  `returnTime` datetime NOT NULL,
  `price` float NOT NULL,
  `totalMoney` float DEFAULT NULL,
  `orderState` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `isCancelByDaiChuCheTimeOut` int(11) DEFAULT '0',
  `songCheShangMenAddress` varchar(200) DEFAULT NULL,
  `shangMenQuCheAddress` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`orderId`),
  KEY `FK_Reference_5` (`carId`),
  KEY `frequentId` (`frequentId`),
  KEY `fromStoreId` (`fromStoreId`),
  KEY `toStoreId` (`toStoreId`),
  CONSTRAINT `t_order_ibfk_1` FOREIGN KEY (`frequentId`) REFERENCES `t_frequentcontacts` (`frequentId`),
  CONSTRAINT `t_order_ibfk_2` FOREIGN KEY (`fromStoreId`) REFERENCES `t_businessstore` (`storeId`),
  CONSTRAINT `t_order_ibfk_3` FOREIGN KEY (`toStoreId`) REFERENCES `t_businessstore` (`storeId`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES ('41', '1', '1', '10017', '13', '2022-03-29 01:40:00', '2022-03-30 08:30:00', '2022-03-31 08:30:00', '360', '822', 'Waiting for departure', '', '0', '', '');
INSERT INTO `t_order` VALUES ('42', '1', '1', '40067', '2', '2022-03-29 01:44:59', '2022-03-30 18:00:00', '2022-03-31 15:00:00', '150', '325', 'Waiting for departure', '', '0', '', '');
INSERT INTO `t_order` VALUES ('43', '1', '1', '10017', '11', '2022-03-29 01:49:58', '2022-03-30 08:30:00', '2022-03-31 08:30:00', '100', '150', 'Waiting for departure', '', '0', '', '');
INSERT INTO `t_order` VALUES ('44', '1', '1', '40067', '21', '2022-03-29 18:03:34', '2022-03-31 08:30:00', '2022-04-29 08:30:00', '650', '19025', 'Waiting for departure', '', '0', '', '');
INSERT INTO `t_order` VALUES ('45', '1', '1', '40067', '11', '2022-03-31 23:17:17', '2022-05-04 08:30:00', '2022-05-06 08:30:00', '100', '425', 'Waiting for departure', '', '0', '', '');
INSERT INTO `t_order` VALUES ('46', '1', '1', '40068', '2', '2022-04-01 20:14:51', '2022-04-07 08:30:00', '2022-04-13 08:30:00', '150', '950', 'To be paid', '', '0', '', '');
INSERT INTO `t_order` VALUES ('47', '1', '1', '40068', '2', '2022-04-01 20:15:16', '2022-04-07 08:30:00', '2022-04-13 08:30:00', '150', '950', 'To be paid', '', '0', '', '');
INSERT INTO `t_order` VALUES ('48', '1', '1', '40068', '2', '2022-04-01 20:15:45', '2022-04-07 08:30:00', '2022-04-13 08:30:00', '150', '950', 'Waiting for departure', '', '0', '', '');
INSERT INTO `t_order` VALUES ('49', '1', '1', '40068', '3', '2022-04-23 17:13:39', '2022-04-27 08:30:00', '2022-04-29 08:30:00', '110', '345', 'Cancel', '', '0', '', '');
INSERT INTO `t_order` VALUES ('50', '1', '1', '40068', '2', '2022-05-05 04:50:11', '2022-05-20 08:30:00', '2022-05-25 08:30:00', '150', '925', 'Waiting for departure', '', '0', '', '');
INSERT INTO `t_order` VALUES ('51', '1', '1', '40067', '12', '2022-05-06 04:02:20', '2022-05-19 08:30:00', '2022-05-24 08:30:00', '130', '700', 'Waiting for departure', '', '0', '', '');
INSERT INTO `t_order` VALUES ('52', '1', '1', '40067', '3', '2022-05-06 19:51:18', '2022-05-12 08:30:00', '2022-05-18 08:30:00', '110', '710', 'Waiting for departure', '', '0', '', '');
INSERT INTO `t_order` VALUES ('53', '1', '1', '40068', '28', '2022-05-06 19:56:26', '2022-05-08 08:30:00', '2022-05-13 08:30:00', '600', '3050', 'To be paid', '', '0', '', '');

-- ----------------------------
-- Table structure for t_orderininsurance
-- ----------------------------
DROP TABLE IF EXISTS `t_orderininsurance`;
CREATE TABLE `t_orderininsurance` (
  `oId` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` int(11) DEFAULT NULL,
  `insuranceId` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  PRIMARY KEY (`oId`),
  KEY `FK_Reference_6` (`orderId`),
  KEY `FK_Reference_7` (`insuranceId`),
  CONSTRAINT `FK_Reference_6` FOREIGN KEY (`orderId`) REFERENCES `t_order` (`orderId`),
  CONSTRAINT `FK_Reference_7` FOREIGN KEY (`insuranceId`) REFERENCES `t_insurance` (`insuranceId`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_orderininsurance
-- ----------------------------
INSERT INTO `t_orderininsurance` VALUES ('88', '41', '1', '50');
INSERT INTO `t_orderininsurance` VALUES ('89', '41', '3', '125');
INSERT INTO `t_orderininsurance` VALUES ('90', '41', '4', '287');
INSERT INTO `t_orderininsurance` VALUES ('91', '42', '1', '50');
INSERT INTO `t_orderininsurance` VALUES ('92', '42', '3', '125');
INSERT INTO `t_orderininsurance` VALUES ('93', '43', '1', '50');
INSERT INTO `t_orderininsurance` VALUES ('94', '44', '1', '50');
INSERT INTO `t_orderininsurance` VALUES ('95', '44', '3', '125');
INSERT INTO `t_orderininsurance` VALUES ('96', '45', '1', '50');
INSERT INTO `t_orderininsurance` VALUES ('97', '45', '5', '175');
INSERT INTO `t_orderininsurance` VALUES ('98', '46', '1', '50');
INSERT INTO `t_orderininsurance` VALUES ('99', '47', '1', '50');
INSERT INTO `t_orderininsurance` VALUES ('100', '48', '1', '50');
INSERT INTO `t_orderininsurance` VALUES ('101', '49', '3', '125');
INSERT INTO `t_orderininsurance` VALUES ('102', '50', '1', '50');
INSERT INTO `t_orderininsurance` VALUES ('103', '50', '3', '125');
INSERT INTO `t_orderininsurance` VALUES ('104', '51', '1', '50');
INSERT INTO `t_orderininsurance` VALUES ('105', '52', '1', '50');
INSERT INTO `t_orderininsurance` VALUES ('106', '53', '1', '50');

-- ----------------------------
-- Table structure for t_sysadmin
-- ----------------------------
DROP TABLE IF EXISTS `t_sysadmin`;
CREATE TABLE `t_sysadmin` (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `sno` varchar(30) NOT NULL,
  `spassword` varchar(30) NOT NULL,
  `sname` varchar(30) NOT NULL,
  `sphone` varchar(30) DEFAULT NULL,
  `saddress` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sysadmin
-- ----------------------------
INSERT INTO `t_sysadmin` VALUES ('1', 'fzcswdd', '111', 'John', '15060338989', 'Mobile 4G business hall, opposite the business bank, Hushi Town, Xiuyu District, Putian City, Fujian Province');
INSERT INTO `t_sysadmin` VALUES ('2', 'admin1', '111', 'WangLi', '13596487952', 'Cangshan District, Fuzhou City, Fujian Province');

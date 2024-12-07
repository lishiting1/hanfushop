
SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
                         `admin_id` int(11) NOT NULL AUTO_INCREMENT,
                         `account` varchar(20) NOT NULL,
                         `password` varchar(30) NOT NULL,
                         PRIMARY KEY (`admin_id`),
                         UNIQUE KEY `aacount_unique` (`account`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', '123456');

-- ----------------------------
-- Table structure for item
-- ----------------------------
DROP TABLE IF EXISTS `item`;
CREATE TABLE `item` (
                        `item_id` int(11) NOT NULL AUTO_INCREMENT,
                        `name` varchar(30) NOT NULL,
                        `type` varchar(20) NOT NULL,
                        `stock` int(11) NOT NULL,
                        `price` decimal(10,2) NOT NULL,
                        `description` varchar(255) DEFAULT NULL,
                        `image_url` varchar(255) DEFAULT NULL,
                        PRIMARY KEY (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item
-- ----------------------------
INSERT INTO `item` VALUES ('1', '青黛','宋制汉服','36','243.00','原创汉服 宋制褶裙 吊带刺绣褙子 春夏款','/images/item/1-1.jpg');
INSERT INTO `item` VALUES('2','长干寺齐腰','宋制汉服','7','299.00','新款宋制 原创 改良长褙子 长干寺齐腰 古装日常','/images/item/1-2.jpg');
INSERT INTO `item` VALUES ('3','长褙子齐腰','宋制汉服','23','350.00','中国风改良版 长褙子齐腰 日常古装','/images/item/1-3.jpg');
INSERT INTO `item` VALUES('4','交襟襦裙','宋制汉服','6','136.00','宋制交襟襦裙 明星同款 新中式穿搭','/images/item/1-4.jpg');
INSERT INTO `item` VALUES('5','齐腰百褶裙','宋制汉服','9','199.00','原创宋制汉服 长干寺齐腰百褶裙 日常薄款' ,'/images/item/1-5.jpg');
INSERT INTO `item` VALUES('6','大袖衫','唐制汉服','15','368.00','重工刺绣 唐制诃子裙 日常春夏','/images/item/2-1.jpg');
INSERT INTO `item` VALUES('7','齐胸大袖衫','唐制汉服','16','168.00','唐制刺绣复原款 齐胸大袖衫','/images/item/2-2.jpg');
INSERT INTO `item` VALUES('8','齐胸襦裙','唐制汉服','29','298.00','原创唐制汉服 齐胸襦裙 2024女装新款古风','/images/item/2-3.jpg');
INSERT INTO `item` VALUES('9','马王堆复原款','秦汉制汉服','46','126.00','马王堆复原版 印花曲裾袍 正版国潮秋冬款','/images/item/3-1.jpg');
INSERT INTO `item` VALUES('10','战国袍','秦汉制汉服','8','426.00','战国袍汉服 夏季红色 大乔小乔服装','/images/item/3-2.jpg');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
                         `order_id` int(11) NOT NULL AUTO_INCREMENT,
                         `user_id` int(11) NOT NULL,
                         `order_total` decimal(10,2) DEFAULT NULL,
                         `created_time` datetime DEFAULT NULL,
                         PRIMARY KEY (`order_id`),
                         KEY `fk_order_user_auth_1` (`user_id`),
                         CONSTRAINT `fk_order_user_auth_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail` (
                                `order_id` int(11) NOT NULL,
                                `item_id` int(11) NOT NULL,
                                `number` int(11) NOT NULL,
                                PRIMARY KEY (`order_id`,`item_id`),
                                KEY `fk_order_detail_item_1` (`item_id`),
                                CONSTRAINT `fk_order_detail_item_1` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
                                CONSTRAINT `fk_order_detail_order_1` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- ----------------------------
-- Table structure for shoppingcart_item
-- ----------------------------
DROP TABLE IF EXISTS `shoppingcart_item`;
CREATE TABLE `shoppingcart_item` (
                                     `user_id` int(11) NOT NULL,
                                     `item_id` int(11) NOT NULL,
                                     `number` int(11) NOT NULL,
                                     PRIMARY KEY (`user_id`,`item_id`),
                                     KEY `fk_shoppingcart_item_1` (`item_id`),
                                     CONSTRAINT `fk_shoppingcart_item_1` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
                                     CONSTRAINT `fk_shoppingcart_user_auth_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shoppingcart_item
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
                        `user_id` int(11) NOT NULL AUTO_INCREMENT,
                        `account` varchar(20) NOT NULL,
                        `password` varchar(30) NOT NULL,
                        `tel` varchar(20) DEFAULT NULL,
                        `email` varchar(50) DEFAULT NULL,
                        `address` varchar(50) DEFAULT NULL,
                        PRIMARY KEY (`user_id`),
                        UNIQUE KEY `account_unique` (`account`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'aaaaa', 'aaa123456', '12345678910', 'aaa@qq.com','scut');
INSERT INTO `user` VALUES ('2', 'bbbbb', 'bbb123456', '12345678911', 'bbb@qq.com','china');

/*
 Navicat Premium Data Transfer

 Source Server         : test
 Source Server Type    : MySQL
 Source Server Version : 50729
 Source Host           : localhost:3306
 Source Schema         : library-management

 Target Server Type    : MySQL
 Target Server Version : 50729
 File Encoding         : 65001

 Date: 15/03/2023 15:46:48
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户名',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '联系方式',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  `createtime` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetime` datetime NULL DEFAULT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `status` tinyint(1) NULL DEFAULT 1 COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username_key`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (3, 'yyy', '14596854231', NULL, '2023-03-14 20:13:00', NULL, '77e3b13fb300c6f66e1e2568313c812a', 1);
INSERT INTO `admin` VALUES (5, 'admin11', '15986574236', NULL, '2023-03-15 14:09:26', '2023-03-15 14:12:08', 'ead08e95e9c867a2ee833c232bf55dbc', 0);
INSERT INTO `admin` VALUES (6, 'admin', '16589457563', 'admin@qq.com', '2023-03-15 14:10:56', NULL, 'ead08e95e9c867a2ee833c232bf55dbc', 1);

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '描述',
  `publish_date` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '出版日期',
  `author` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '作者',
  `publisher` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '出版社',
  `category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '分类',
  `book_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '标准码',
  `cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '封面',
  `createtime` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updatetime` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `score` int(10) NULL DEFAULT NULL COMMENT '积分',
  `nums` int(10) NULL DEFAULT 0 COMMENT '数量',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `book_no_index`(`book_no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES (11, '你也走了很远的路吧', '畅销5年增订本。你想要看到的那片风景和想要遇到的人，终将会与你相遇，在你成为自己的路上。随书附赠卢思浩致读者信+封面同款海报+明信片+文笔挑战卡+书签。', '2022-10-13', '卢思浩', '湖南文艺出版社', '小说 > 悬疑小说', 'ISBN：9787572608377', 'https://weread-1258476243.file.myqcloud.com/weread/cover/77/cpPlatform_dxft6QPJSm3ZvLVYWfPmAj/t6_cpPlatform_dxft6QPJSm3ZvLVYWfPmAj.jpg', '2023-03-14 20:19:19', '2023-03-15 00:00:00', 10, 8);
INSERT INTO `book` VALUES (19, '带壳的牡蛎是大人的心脏', '有时候，上一秒还是小孩，下一秒就已经是大人了。超人气漫画家拟泥nini首部作品集，给所有脆弱的大人们。柔软又温暖得发烫的拥抱，满满快要溢出来的爱！全网点赞2000万+，阅读量5亿+！豆瓣8.7分高赞', '2022-09-14', '拟泥nini', '北京联合出版有限公司', '动漫/幽默', 'ISBN：9787559662170', 'http://img3m7.ddimg.cn/47/4/29463437-8_u_10.jpg', '2023-03-15 14:47:24', NULL, 20, 99);
INSERT INTO `book` VALUES (20, '我与地坛（纪念版）', NULL, '2011-06-07', '史铁生', '人民文学出版社', '文学 > 中国现当代随笔', 'ISBN：9787020084357', 'http://img3m1.ddimg.cn/6/9/21055821-5_u_4.jpg', '2023-03-15 14:49:54', NULL, 10, 199);
INSERT INTO `book` VALUES (21, '第七天', '余华长篇小说经典。获华语文学传媒大奖、意大利格林扎纳文学奖等。“宽广的沉默里暗暗涌动千言万语，那是很多的卑微人生在自我诉说。”', '2022-10-18', '余华', '新星出版社', '小说 > 中国当代小说', 'ISBN：9787513348744', 'http://img3m6.ddimg.cn/87/11/29490306-1_u_8.jpg', '2023-03-15 14:52:15', NULL, 32, 50);
INSERT INTO `book` VALUES (22, '真希望你也喜欢自己', '房琪shou部作品重磅上市！写给所有年轻人的成长通关秘籍！杨天真、大冰、鲁豫、张含韵诚挚作序推荐。', '2022-10-18', '房琪kiki', '北京联合出版有限公司', '', 'ISBN：9787559664464', 'http://img3m3.ddimg.cn/91/10/29474173-1_u_12.jpg', '2023-03-15 14:53:52', NULL, 34, 1);
INSERT INTO `book` VALUES (23, '万物有灵：诗经里的草木鸟兽鱼虫', '196幅日本江户学者细井徇手绘唯美插图，130余首传唱千年耳熟能详的《诗经》名篇 ，215条简要注释讲述草木鸟兽鱼虫。著名学者傅国涌作序推荐，喜马拉雅FM超人气主播白云出岫310分钟超长吟诵讲解，视听', '2022-05-02', '【日】细井徇；朗诵：白云出岫', '北京时代华文书局', '文学 > 中国古诗词', 'ISBN：9787569919127', 'http://img3m4.ddimg.cn/6/26/29405184-1_u_6.jpg', '2023-03-15 14:56:22', NULL, 20, 30);
INSERT INTO `book` VALUES (24, '蛤蟆先生去看心理医生', '2021年当当网销量No.1！将心理学知识巧妙融入故事情节，带你亲临心理咨询现场，认识自我，体验疗愈和改变的发生。果麦出品', '2022-07-07', '罗伯特·戴博德', '天津人民出版社', '心理学', 'ISBN：9787201161693', 'http://img3m9.ddimg.cn/71/33/28992419-1_u_63.jpg', '2023-03-15 14:58:13', NULL, 15, 49);
INSERT INTO `book` VALUES (25, '法治的细节', '罗翔解读热点案件，思辨法治要义，破解道德困境，从N号房事件到张玉环案，我们如何在现实中追求正义，在时事中保持理性思考。果麦出品', '2021-11-05', '罗翔', '云南人民出版社', '法律', 'ISBN：9787222204331', 'http://img3m4.ddimg.cn/21/25/29323524-1_u_20.jpg', '2023-03-15 15:17:32', NULL, 40, 10);
INSERT INTO `book` VALUES (26, '雪国', '50周年纪念，川端家人惟一正式授權，亲自审定！止庵领衔选编，中国人民大学、北京外国语大学专家学者联袂翻译！含《雪国》《伊豆的舞女》《千羽鹤》等6篇经典。余华莫言推荐，入选北大清华书单、人教语文读本', '2022-12-24', '（日）川端康成', '南海出版公司', '小说 > 外国小说', 'ISBN：9787573503510', 'http://img3m9.ddimg.cn/41/9/29492339-1_u_12.jpg', '2023-03-15 15:19:04', NULL, 24, 59);
INSERT INTO `book` VALUES (27, ' 钝感力', '文学大师渡边淳一75载人生智慧，世界狂销600万册。写给易因小事而动摇、敏感、什么都往心里去的人。帮你玩转人际关系，缓解焦虑情绪，排遣工作压力。当当励志榜、人民日报/光明网，多位跨界名人书单。', '2018-01-01', '渡边淳一', '青岛出版社', '心理学', 'ISBN：9787555262800', 'http://img3m9.ddimg.cn/23/12/25201859-2_u_31.jpg', '2023-03-15 15:21:21', NULL, 10, 19);
INSERT INTO `book` VALUES (28, '被讨厌的勇气', '“自我启发之父”阿德勒的哲学课,蔡康永、张德芬、大张伟、陈文茜、曾宝仪、勇气推荐！腰封各个印次印刷内容可能有所不同，以实物为准，内文一致 随书附赠干货版小册子', '2020-03-05', '岸見一郎, 古賀史健', '机械工业出版社', '', 'ISBN：9787111495482', 'http://img3m2.ddimg.cn/33/26/28518072-1_w_9.jpg', '2023-03-15 15:23:53', NULL, 10, 9);
INSERT INTO `book` VALUES (29, '长安的荔枝', '马伯庸“见微”系列 历史短小说口碑代表作。一骑红尘妃子笑，“有”人知是荔枝来。“就算失败，我也想知道，自己倒在距离终点多远的地方。”随书附赠“荔枝鲜转运舆图”。', '2022-10-18', '马伯庸', '湖南文艺出版社', '小说 > 历史小说', 'ISBN：9787572608582', 'http://img3m5.ddimg.cn/54/34/29470275-1_u_1.jpg', '2023-03-15 15:25:15', '2023-03-15 00:00:00', 27, 49);

-- ----------------------------
-- Table structure for borrow
-- ----------------------------
DROP TABLE IF EXISTS `borrow`;
CREATE TABLE `borrow`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '图书名称',
  `book_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '图书标准码',
  `user_no` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户会员码',
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户名称',
  `user_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户联系方式',
  `createtime` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updatetime` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `score` int(10) NULL DEFAULT NULL COMMENT '借书积分',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '已借出' COMMENT '借书状态',
  `days` int(11) NULL DEFAULT 1 COMMENT '借书天数',
  `return_date` datetime NULL DEFAULT NULL COMMENT '归还日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of borrow
-- ----------------------------
INSERT INTO `borrow` VALUES (23, '钢铁是怎样炼成的', 'GT-121313213', '202303141768108754', '默默', '14568595472', '2023-03-15 06:07:56', NULL, 60, '已借出', 3, '2023-03-18 00:00:00');
INSERT INTO `borrow` VALUES (25, '带壳的牡蛎是大人的心脏', 'ISBN：9787559662170', '202303151296431361', '略略略', '15555654555', '2023-03-15 15:29:10', NULL, 40, '已借出', 2, '2023-03-17 00:00:00');
INSERT INTO `borrow` VALUES (26, '万物有灵：诗经里的草木鸟兽鱼虫', 'ISBN：9787569919127', '20230315399183014', '王二博', '16598457232', '2023-03-15 15:29:27', NULL, 20, '已归还', 1, '2023-03-16 00:00:00');
INSERT INTO `borrow` VALUES (27, '真希望你也喜欢自己', 'ISBN：9787559664464', '20230315725336087', '春华', '13256842563', '2023-03-15 15:29:45', NULL, 340, '已归还', 10, '2023-03-25 00:00:00');
INSERT INTO `borrow` VALUES (28, '被讨厌的勇气', 'ISBN：9787111495482', '20230315200703888', '凯凯', '16589475632', '2023-03-15 15:30:10', NULL, 30, '已借出', 3, '2023-03-18 00:00:00');
INSERT INTO `borrow` VALUES (29, '蛤蟆先生去看心理医生', 'ISBN：9787201161693', '20230315384648883', '秋实', '16532895475', '2023-03-15 15:30:19', NULL, 75, '已借出', 5, '2023-03-20 00:00:00');
INSERT INTO `borrow` VALUES (30, '我与地坛（纪念版）', 'ISBN：9787020084357', '20230315497568011', '积分测试', '13256984572', '2023-03-15 15:30:30', NULL, 10, '已借出', 1, '2023-03-16 00:00:00');
INSERT INTO `borrow` VALUES (31, ' 钝感力', 'ISBN：9787555262800', '202303141768108754', '默默', '14568595472', '2023-03-15 15:35:33', NULL, 10, '已借出', 1, '2023-03-16 00:00:00');
INSERT INTO `borrow` VALUES (32, '法治的细节', 'ISBN：9787222204331', '202303141768108754', '默默', '14568595472', '2023-03-15 15:35:38', NULL, 40, '已归还', 1, '2023-03-16 00:00:00');
INSERT INTO `borrow` VALUES (33, '雪国', 'ISBN：9787573503510', '20230315399183014', '王二博', '16598457232', '2023-03-15 15:36:27', NULL, 240, '已借出', 10, '2023-03-25 00:00:00');
INSERT INTO `borrow` VALUES (34, '长安的荔枝', 'ISBN：9787572608582', '20230315200703888', '凯凯', '16589475632', '2023-03-15 15:38:33', NULL, 54, '已借出', 2, '2023-03-17 00:00:00');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `pid` int(11) NULL DEFAULT NULL COMMENT '父级id',
  `createtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (4, '唐朝文化', '唐朝文化', 3, '2022-10-12 20:43:21', NULL);
INSERT INTO `category` VALUES (5, '宋朝文化', NULL, 3, '2022-10-12 20:46:29', NULL);
INSERT INTO `category` VALUES (9, '现代文化', '现代文化', 3, '2022-10-12 21:00:41', NULL);
INSERT INTO `category` VALUES (11, '高新科技', NULL, 10, '2022-10-12 21:50:16', NULL);
INSERT INTO `category` VALUES (12, '生物科技', '生物科技', 10, '2022-10-12 21:50:22', NULL);
INSERT INTO `category` VALUES (13, '微分子科技', NULL, 11, '2022-10-17 22:11:44', NULL);
INSERT INTO `category` VALUES (14, '小说', '人气作家：东野圭吾|村上春树', NULL, '2023-03-14 20:14:07', '2023-03-15 00:00:00');
INSERT INTO `category` VALUES (15, '中国当代小说', NULL, 14, '2023-03-14 20:14:44', '2023-03-15 00:00:00');
INSERT INTO `category` VALUES (16, '文学', '文艺', NULL, '2023-03-15 14:14:52', '2023-03-15 00:00:00');
INSERT INTO `category` VALUES (17, '历史', '人文社科', NULL, '2023-03-15 14:15:38', '2023-03-15 00:00:00');
INSERT INTO `category` VALUES (18, '文化', '人文社科', NULL, '2023-03-15 14:15:46', '2023-03-15 00:00:00');
INSERT INTO `category` VALUES (20, '心理学', '人文社科', NULL, '2023-03-15 14:16:05', '2023-03-15 00:00:00');
INSERT INTO `category` VALUES (21, '动漫/幽默', NULL, NULL, '2023-03-15 14:16:13', NULL);
INSERT INTO `category` VALUES (22, '艺术', '文艺', NULL, '2023-03-15 14:16:18', '2023-03-15 00:00:00');
INSERT INTO `category` VALUES (24, '教材', '教育', NULL, '2023-03-15 14:16:29', '2023-03-15 00:00:00');
INSERT INTO `category` VALUES (26, '法律', '人文社科', NULL, '2023-03-15 14:16:36', '2023-03-15 00:00:00');
INSERT INTO `category` VALUES (27, '传记', '文艺', NULL, '2023-03-15 14:16:43', '2023-03-15 00:00:00');
INSERT INTO `category` VALUES (28, '中国近现代小说', NULL, 14, '2023-03-15 14:23:38', NULL);
INSERT INTO `category` VALUES (29, '中国古典小说', NULL, 14, '2023-03-15 14:26:21', NULL);
INSERT INTO `category` VALUES (30, '外国小说', NULL, 14, '2023-03-15 14:26:31', NULL);
INSERT INTO `category` VALUES (31, '侦探/悬疑/推理小说', NULL, 14, '2023-03-15 14:26:55', NULL);
INSERT INTO `category` VALUES (32, '中国古诗词', NULL, 16, '2023-03-15 14:28:12', NULL);
INSERT INTO `category` VALUES (33, '中国现当代随笔', NULL, 16, '2023-03-15 14:28:27', NULL);
INSERT INTO `category` VALUES (34, '外国随笔', NULL, 16, '2023-03-15 14:28:36', NULL);
INSERT INTO `category` VALUES (35, '民间文学', NULL, 16, '2023-03-15 14:28:43', NULL);
INSERT INTO `category` VALUES (36, '名家作品', NULL, 16, '2023-03-15 14:28:52', NULL);
INSERT INTO `category` VALUES (37, '书法/篆刻', NULL, 22, '2023-03-15 14:31:21', NULL);
INSERT INTO `category` VALUES (38, '音乐', NULL, 22, '2023-03-15 14:31:36', NULL);
INSERT INTO `category` VALUES (39, '小人书/连环画', NULL, 22, '2023-03-15 14:31:53', NULL);
INSERT INTO `category` VALUES (40, '历史小说', NULL, 14, '2023-03-15 15:25:31', NULL);

-- ----------------------------
-- Table structure for retur
-- ----------------------------
DROP TABLE IF EXISTS `retur`;
CREATE TABLE `retur`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '图书名称',
  `book_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '图书标准码',
  `user_no` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户会员码',
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户名称',
  `user_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户联系方式',
  `createtime` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updatetime` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `score` int(10) NULL DEFAULT NULL COMMENT '借书积分',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '已借出' COMMENT '借书状态',
  `days` int(11) NULL DEFAULT 1 COMMENT '借书天数',
  `return_date` datetime NULL DEFAULT NULL COMMENT '归还日期',
  `real_date` datetime NULL DEFAULT NULL COMMENT '实际归还日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of retur
-- ----------------------------
INSERT INTO `retur` VALUES (14, '真希望你也喜欢自己', 'ISBN：9787559664464', '20230315725336087', '春华', '13256842563', '2023-03-15 15:30:41', NULL, 340, '已归还', 10, '2023-03-25 00:00:00', '2023-03-15 00:00:00');
INSERT INTO `retur` VALUES (17, '法治的细节', 'ISBN：9787222204331', '202303141768108754', '默默', '14568595472', '2023-03-15 15:35:46', NULL, 40, '已归还', 1, '2023-03-16 00:00:00', '2023-03-15 00:00:00');
INSERT INTO `retur` VALUES (18, '万物有灵：诗经里的草木鸟兽鱼虫', 'ISBN：9787569919127', '20230315399183014', '王二博', '16598457232', '2023-03-15 15:35:57', NULL, 20, '已归还', 1, '2023-03-16 00:00:00', '2023-03-15 00:00:00');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '姓名',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '会员码',
  `age` int(11) NULL DEFAULT NULL COMMENT '年龄',
  `sex` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '性别',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '联系方式',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '地址',
  `createtime` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetime` datetime NULL DEFAULT NULL,
  `account` int(10) NULL DEFAULT 0 COMMENT '账户余额',
  `status` tinyint(1) NULL DEFAULT 1 COMMENT '禁用状态 1不禁用',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username_index`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (24, '默默', '202303141768108754', 18, '女', '14568595472', '杭州', '2023-03-14 20:11:53', '2023-03-14 20:12:11', 330, 1);
INSERT INTO `user` VALUES (31, '积分测试', '20230315497568011', 11, '男', '13256984572', NULL, '2023-03-15 04:10:04', '2023-03-15 15:32:18', -40, 0);
INSERT INTO `user` VALUES (32, '春华', '20230315725336087', 18, '女', '13256842563', NULL, '2023-03-15 14:00:10', NULL, 500, 1);
INSERT INTO `user` VALUES (33, '秋实', '20230315384648883', 25, '男', '16532895475', '上海', '2023-03-15 14:01:05', NULL, 370, 1);
INSERT INTO `user` VALUES (34, '略略略', '202303151296431361', 55, '男', '15555654555', '哈哈王国', '2023-03-15 14:02:03', NULL, 25, 1);
INSERT INTO `user` VALUES (35, '王二博', '20230315399183014', 25, '男', '16598457232', '洛阳', '2023-03-15 14:03:17', '2023-03-15 14:05:11', 759, 1);
INSERT INTO `user` VALUES (36, '凯凯', '20230315200703888', 23, '男', '16589475632', '重庆', '2023-03-15 14:03:58', '2023-03-15 14:05:24', 104, 1);
INSERT INTO `user` VALUES (37, '热娜', '20230315545808237', 27, '女', '16895472365', '新疆', '2023-03-15 14:04:38', '2023-03-15 14:05:49', 0, 1);

SET FOREIGN_KEY_CHECKS = 1;

-- ----------------------------
-- Table structure for `exam`
-- ----------------------------
DROP TABLE IF EXISTS `exam`;
CREATE TABLE `exam` (
  `exam_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) NOT NULL,
  `question_id` int(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `spend_time` varchar(255) DEFAULT NULL,
  `updatetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` varchar(10) NOT NULL COMMENT '0,未开始 1,开始 2,结束',
  PRIMARY KEY (`exam_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of exam
-- ----------------------------
INSERT INTO `exam` VALUES ('1', '1', '1', 'first_exam', '80', '2015-11-09 22:16:58', 'finished');
INSERT INTO `exam` VALUES ('2', '1', '3', 'second_exam', '90', '2015-11-09 22:17:01', 'finished');
INSERT INTO `exam` VALUES ('3', '1', '2', 'third_exam', '180', '2015-11-12 13:27:36', 'processing');
INSERT INTO `exam` VALUES ('13', '1', '1', 'fourth_exam', '180', '2015-11-18 20:03:56', 'processing');
INSERT INTO `exam` VALUES ('16', '1', '1', 'fifth_exam', '120', '2015-11-18 20:03:38', 'finished');
INSERT INTO `exam` VALUES ('17', '1', '1', 'test1', '200', '2015-11-18 20:04:17', 'finished');
INSERT INTO `exam` VALUES ('18', '1', '2', 'test2', '100', '2015-11-18 20:04:18', 'processing');
INSERT INTO `exam` VALUES ('19', '1', '2', 'test3', '100', '2015-11-18 20:04:18', 'processing');
INSERT INTO `exam` VALUES ('20', '1', '2', 'test4', '100', '2015-11-18 20:04:20', 'processing');
INSERT INTO `exam` VALUES ('21', '1', '3', 'test5', '3', '2015-11-18 20:04:50', 'finished');
INSERT INTO `exam` VALUES ('22', '1', '14', 'sixth_exam', '10', '2015-11-18 20:12:21', 'processing');
INSERT INTO `exam` VALUES ('23', '1', '14', 'test6', '20', '2015-11-18 20:13:42', 'processing');

-- ----------------------------
-- Table structure for `letter`
-- ----------------------------
DROP TABLE IF EXISTS `letter`;
CREATE TABLE `letter` (
  `letter_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT '0' COMMENT '0--未读|1--已读|',
  `createtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`letter_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of letter
-- ----------------------------
INSERT INTO `letter` VALUES ('1', '1', '1', '好好学习，天天向上', '0', '2015-11-09 21:33:24');
INSERT INTO `letter` VALUES ('2', '1', '1', '不好好学习', '0', '2015-11-09 21:48:04');
INSERT INTO `letter` VALUES ('5', '2', '1', '你好啊', '1', '2015-11-09 22:47:39');
INSERT INTO `letter` VALUES ('6', '2', '1', '撒大声地', '0', '2015-11-09 22:47:58');
INSERT INTO `letter` VALUES ('9', '11', '1', '为什么不做作业', '0', '2015-11-11 20:20:58');
INSERT INTO `letter` VALUES ('10', '1', '1', '现代软件工程认真听讲！', '0', '2015-11-18 20:11:30');

-- ----------------------------
-- Table structure for `question`
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question` (
  `question_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `teacher_id` int(10) NOT NULL,
  `name` varchar(500) NOT NULL,
  `question_content` varchar(5000) NOT NULL,
  `public` varchar(10) NOT NULL,
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES ('1', '1', 'exercise1', '[{ \"text\":\"2+4*(4+6)\"   , \"answer\":42 },\n{ \"text\":\"45+23-64\"    , \"answer\":4 },\n{ \"text\":\"56+12+23-2\"  , \"answer\":89 },\n{ \"text\":\"12*5-12+6\"   , \"answer\":54 },\n{ \"text\":\"24/2+11+3-5\" , \"answer\":21 },\n{ \"text\":\"25*2-48+7\"   , \"answer\":9 },\n{ \"text\":\"36/6*7+12\"   , \"answer\":54 },\n{ \"text\":\"78-23+4-6\"   , \"answer\":53 },\n{ \"text\":\"23*(2+3)-4\"  , \"answer\":111 },\n{ \"text\":\"35/7+66/11\"  , \"answer\":11 }]', 'true');
INSERT INTO `question` VALUES ('2', '1', 'exercise2', '[{ \"text\":\"12+3*(5+6)\"   , \"answer\":45 },\n{ \"text\":\"5+123-67\"    , \"answer\":61 },\n{ \"text\":\"5*12+23-2\"  , \"answer\":81 },\n{ \"text\":\"12*4-2+6\"   , \"answer\":52 },\n{ \"text\":\"26/2*3-5\" , \"answer\":34 },\n{ \"text\":\"5*2+(48+7)\"   , \"answer\":65 },\n{ \"text\":\"84/12*7+11\"   , \"answer\":60 },\n{ \"text\":\"78-23+4-6\"   , \"answer\":53 },\n{ \"text\":\"2*(21+3)-43\"  , \"answer\":5 },\n{ \"text\":\"35/5+6*11\"  , \"answer\":73 }]', 'false');
INSERT INTO `question` VALUES ('3', '1', 'exercise3', '[{ \"text\":\"12+3*(5+6)\"   , \"answer\":45 },\n{ \"text\":\"5+123-67\"    , \"answer\":61 },\n{ \"text\":\"5*12+23-2\"  , \"answer\":81 },\n{ \"text\":\"12*4-2+6\"   , \"answer\":52 },\n{ \"text\":\"26/2*3-5\" , \"answer\":34 },\n{ \"text\":\"5*2+(48+7)\"   , \"answer\":65 },\n{ \"text\":\"84/12*7+11\"   , \"answer\":60 },\n{ \"text\":\"78-23+4-6\"   , \"answer\":53 },\n{ \"text\":\"2*(21+3)-43\"  , \"answer\":5 },\n{ \"text\":\"35/5+6*11\"  , \"answer\":73 }]', 'true');
INSERT INTO `question` VALUES ('6', '1', 'exercise5', '[{\"text\":\"4+32-4\",\"answer\":32},{\"text\":\"74+62-38-31\",\"answer\":67},{\"text\":\"54-50+39\",\"answer\":43},{\"text\":\"65-11-38\",\"answer\":16},{\"text\":\"30*70\\/1\\/10\\/3\",\"answer\":70},{\"text\":\"0*19*65*90*6\",\"answer\":0},{\"text\":\"38*0\\/1*78\",\"answer\":0},{\"text\":\"46-85+76+43\",\"answer\":80},{\"text\":\"0*92\\/6*8*100\",\"answer\":0},{\"text\":\"45*0*75\",\"answer\":0}]', 'true');
INSERT INTO `question` VALUES ('21', '1', 'exercise7', '[{\"text\":\"1+1\",\"answer\":2},{\"text\":\"2*2\",\"answer\":4},{\"text\":\"3+4\",\"answer\":7},{\"text\":\"2*3*(3+2)\",\"answer\":30},{\"text\":\"3+4*5\",\"answer\":23},{\"text\":\"6+7*2+12\",\"answer\":32},{\"text\":\"4*(3+6)+3\",\"answer\":39}]', 'public');

-- ----------------------------
-- Table structure for `stu_exam`
-- ----------------------------
DROP TABLE IF EXISTS `stu_exam`;
CREATE TABLE `stu_exam` (
  `stu_exam_id` int(10) NOT NULL AUTO_INCREMENT,
  `student_id` int(10) NOT NULL,
  `student_name` varchar(100) NOT NULL,
  `exam_id` int(10) NOT NULL,
  `score` int(10) NOT NULL,
  `time_spent` int(10) NOT NULL,
  PRIMARY KEY (`stu_exam_id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stu_exam
-- ----------------------------
INSERT INTO `stu_exam` VALUES ('1', '1', 'studentA', '1', '85', '5');
INSERT INTO `stu_exam` VALUES ('2', '2', 'studentB', '1', '92', '7');
INSERT INTO `stu_exam` VALUES ('3', '3', 'studentC', '1', '69', '4');
INSERT INTO `stu_exam` VALUES ('4', '4', 'studentD', '1', '74', '8');
INSERT INTO `stu_exam` VALUES ('5', '5', 'studentE', '2', '73', '12');
INSERT INTO `stu_exam` VALUES ('6', '6', 'studentF', '2', '85', '15');
INSERT INTO `stu_exam` VALUES ('7', '7', 'studentG', '2', '82', '19');
INSERT INTO `stu_exam` VALUES ('8', '8', 'studentH', '2', '71', '16');
INSERT INTO `stu_exam` VALUES ('9', '1', 'studentA', '2', '77', '17');
INSERT INTO `stu_exam` VALUES ('10', '1', 'studentA', '3', '30', '49');
INSERT INTO `stu_exam` VALUES ('11', '1', 'studentA', '16', '0', '0');
INSERT INTO `stu_exam` VALUES ('12', '2', 'studentB', '16', '0', '0');
INSERT INTO `stu_exam` VALUES ('13', '3', 'studentC', '16', '0', '0');
INSERT INTO `stu_exam` VALUES ('14', '4', 'studentD', '16', '0', '0');
INSERT INTO `stu_exam` VALUES ('15', '5', 'studentE', '16', '0', '0');
INSERT INTO `stu_exam` VALUES ('16', '6', 'studentF', '16', '0', '0');
INSERT INTO `stu_exam` VALUES ('17', '1', 'studentA', '17', '0', '0');
INSERT INTO `stu_exam` VALUES ('18', '2', 'studentB', '17', '0', '0');
INSERT INTO `stu_exam` VALUES ('19', '3', 'studentC', '17', '0', '0');
INSERT INTO `stu_exam` VALUES ('20', '4', 'studentD', '17', '0', '0');
INSERT INTO `stu_exam` VALUES ('21', '5', 'studentE', '17', '0', '0');
INSERT INTO `stu_exam` VALUES ('22', '6', 'studentF', '17', '0', '0');
INSERT INTO `stu_exam` VALUES ('23', '1', 'studentA', '18', '60', '29');
INSERT INTO `stu_exam` VALUES ('24', '2', 'studentB', '18', '0', '0');
INSERT INTO `stu_exam` VALUES ('25', '3', 'studentC', '18', '0', '0');
INSERT INTO `stu_exam` VALUES ('26', '4', 'studentD', '18', '0', '0');
INSERT INTO `stu_exam` VALUES ('27', '5', 'studentE', '18', '0', '0');
INSERT INTO `stu_exam` VALUES ('28', '6', 'studentF', '18', '0', '0');
INSERT INTO `stu_exam` VALUES ('29', '11', 'studentI', '18', '0', '0');
INSERT INTO `stu_exam` VALUES ('30', '1', 'studentA', '19', '0', '0');
INSERT INTO `stu_exam` VALUES ('31', '2', 'studentB', '19', '0', '0');
INSERT INTO `stu_exam` VALUES ('32', '3', 'studentC', '19', '0', '0');
INSERT INTO `stu_exam` VALUES ('33', '4', 'studentD', '19', '0', '0');
INSERT INTO `stu_exam` VALUES ('34', '5', 'studentE', '19', '0', '0');
INSERT INTO `stu_exam` VALUES ('35', '6', 'studentF', '19', '0', '0');
INSERT INTO `stu_exam` VALUES ('36', '11', 'studentI', '19', '0', '0');
INSERT INTO `stu_exam` VALUES ('37', '1', 'studentA', '20', '20', '10');
INSERT INTO `stu_exam` VALUES ('38', '2', 'studentB', '20', '0', '0');
INSERT INTO `stu_exam` VALUES ('39', '3', 'studentC', '20', '0', '0');
INSERT INTO `stu_exam` VALUES ('40', '4', 'studentD', '20', '0', '0');
INSERT INTO `stu_exam` VALUES ('41', '5', 'studentE', '20', '0', '0');
INSERT INTO `stu_exam` VALUES ('42', '6', 'studentF', '20', '0', '0');
INSERT INTO `stu_exam` VALUES ('43', '11', 'studentI', '20', '0', '0');
INSERT INTO `stu_exam` VALUES ('44', '1', 'studentA', '21', '20', '5');
INSERT INTO `stu_exam` VALUES ('45', '2', 'studentB', '21', '0', '0');
INSERT INTO `stu_exam` VALUES ('46', '3', 'studentC', '21', '0', '0');
INSERT INTO `stu_exam` VALUES ('47', '4', 'studentD', '21', '0', '0');
INSERT INTO `stu_exam` VALUES ('48', '5', 'studentE', '21', '0', '0');
INSERT INTO `stu_exam` VALUES ('49', '6', 'studentF', '21', '0', '0');
INSERT INTO `stu_exam` VALUES ('50', '11', 'studentI', '21', '0', '0');
INSERT INTO `stu_exam` VALUES ('51', '1', 'studentA', '22', '50', '0');
INSERT INTO `stu_exam` VALUES ('52', '2', 'studentB', '22', '0', '0');
INSERT INTO `stu_exam` VALUES ('53', '3', 'studentC', '22', '0', '0');
INSERT INTO `stu_exam` VALUES ('54', '4', 'studentD', '22', '0', '0');
INSERT INTO `stu_exam` VALUES ('55', '5', 'studentE', '22', '0', '0');
INSERT INTO `stu_exam` VALUES ('56', '6', 'studentF', '22', '0', '0');
INSERT INTO `stu_exam` VALUES ('57', '11', 'studentI', '22', '0', '0');
INSERT INTO `stu_exam` VALUES ('58', '1', 'studentA', '23', '30', '0');
INSERT INTO `stu_exam` VALUES ('59', '2', 'studentB', '23', '0', '0');
INSERT INTO `stu_exam` VALUES ('60', '3', 'studentC', '23', '0', '0');
INSERT INTO `stu_exam` VALUES ('61', '4', 'studentD', '23', '0', '0');
INSERT INTO `stu_exam` VALUES ('62', '5', 'studentE', '23', '0', '0');
INSERT INTO `stu_exam` VALUES ('63', '6', 'studentF', '23', '0', '0');
INSERT INTO `stu_exam` VALUES ('64', '11', 'studentI', '23', '0', '0');

-- ----------------------------
-- Table structure for `stu_ques`
-- ----------------------------
DROP TABLE IF EXISTS `stu_ques`;
CREATE TABLE `stu_ques` (
  `stu_ques_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `score` int(11) DEFAULT NULL COMMENT 'null 0: true 1:false',
  PRIMARY KEY (`stu_ques_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stu_ques
-- ----------------------------
INSERT INTO `stu_ques` VALUES ('1', '1', '1', '85');
INSERT INTO `stu_ques` VALUES ('2', '1', '2', '76');
INSERT INTO `stu_ques` VALUES ('3', '1', '3', '68');
INSERT INTO `stu_ques` VALUES ('4', '1', '4', '93');
INSERT INTO `stu_ques` VALUES ('5', '2', '1', '83');
INSERT INTO `stu_ques` VALUES ('6', '2', '2', '59');
INSERT INTO `stu_ques` VALUES ('7', '2', '4', '81');

-- ----------------------------
-- Table structure for `student`
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `student_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `teacher_id` int(10) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `pwd` varchar(255) NOT NULL,
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('1', '1', 'stuA', 'studentA', '12345678');
INSERT INTO `student` VALUES ('2', '1', 'stuB', 'studentB', '22345678');
INSERT INTO `student` VALUES ('3', '1', 'stuC', 'studentC', '32345678');
INSERT INTO `student` VALUES ('4', '1', 'stuD', 'studentD', '42345678');
INSERT INTO `student` VALUES ('5', '1', 'stuE', 'studentE', '52345678');
INSERT INTO `student` VALUES ('6', '1', 'stuF', 'studentF', '62345678');
INSERT INTO `student` VALUES ('7', '2', 'stuG', 'studentG', '72345678');
INSERT INTO `student` VALUES ('8', '2', 'stuH', 'studentH', '82345678');
INSERT INTO `student` VALUES ('11', '1', 'stuI', 'studentI', '92345678');

-- ----------------------------
-- Table structure for `teacher`
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `teacher_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `pwd` varchar(255) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`teacher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('1', 'teacher1', 'Bill', '12345678');
INSERT INTO `teacher` VALUES ('4', 'teacher2', 'Alien', '12121212');
INSERT INTO `teacher` VALUES ('5', 'teacher3', 'Bob', '13131313');

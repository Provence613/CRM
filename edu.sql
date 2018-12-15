-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: 2018-12-15 07:45:15
-- 服务器版本： 5.7.21
-- PHP Version: 5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `edu`
--

-- --------------------------------------------------------

--
-- 表的结构 `brand`
--

DROP TABLE IF EXISTS `brand`;
CREATE TABLE IF NOT EXISTS `brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `brand`
--

INSERT INTO `brand` (`id`, `name`) VALUES
(1, 'Hisense'),
(2, 'SONY'),
(3, 'MI'),
(4, 'Haier'),
(5, 'LittleSwan'),
(6, 'GREE'),
(7, 'Midea'),
(8, 'AUX');

-- --------------------------------------------------------

--
-- 表的结构 `cate`
--

DROP TABLE IF EXISTS `cate`;
CREATE TABLE IF NOT EXISTS `cate` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `catename` varchar(30) NOT NULL,
  `pid` smallint(6) NOT NULL,
  `unit` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cate`
--

INSERT INTO `cate` (`id`, `catename`, `pid`, `unit`) VALUES
(1, '电视', 0, '台'),
(2, '曲面电视', 1, '台'),
(3, '超薄电视', 1, '台'),
(4, '4k超清电视', 1, '台'),
(5, 'OLED电视', 1, '台'),
(6, '空调', 0, '台'),
(7, '壁挂式空调', 6, '台'),
(8, '柜式空调', 6, '台'),
(9, '中央空调', 6, '台'),
(10, '洗衣机', 0, '台'),
(11, '滚筒洗衣机', 10, '台'),
(12, '洗烘一体机', 10, '台'),
(13, '迷你洗衣机', 10, '台');

-- --------------------------------------------------------

--
-- 表的结构 `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clientid` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `tel1` varchar(50) NOT NULL,
  `tel2` varchar(50) DEFAULT NULL,
  `tel3` varchar(50) DEFAULT NULL,
  `address` varchar(50) NOT NULL,
  `level` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `client`
--

INSERT INTO `client` (`id`, `clientid`, `name`, `tel1`, `tel2`, `tel3`, `address`, `level`) VALUES
(1, 'CT0100001', '海信集团', '销售部05322348674', '王先生17864321239', '林女士13298765533', '青岛市海信广场', 1),
(2, 'CT0200002', '林某某', '17866543312', NULL, NULL, '青岛市麦岛路125号', 2),
(4, 'CT02000003', '青岛大学', '后勤部05328798542', '李老师13209876643', '刘老师13567890043', '青岛大学', 1);

-- --------------------------------------------------------

--
-- 表的结构 `grade`
--

DROP TABLE IF EXISTS `grade`;
CREATE TABLE IF NOT EXISTS `grade` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '班级主键',
  `name` varchar(100) DEFAULT NULL COMMENT '班级名称',
  `length` varchar(20) DEFAULT NULL COMMENT '学制',
  `price` int(11) DEFAULT NULL COMMENT '学费',
  `status` int(11) DEFAULT NULL COMMENT '是否启用',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
  `is_delete` int(11) DEFAULT NULL COMMENT '允许删除',
  `student_id` int(11) DEFAULT NULL COMMENT '关联外键',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `grade`
--

INSERT INTO `grade` (`id`, `name`, `length`, `price`, `status`, `create_time`, `update_time`, `delete_time`, `is_delete`, `student_id`) VALUES
(1, '高等数学', '2个学期', 1200, 1, 1502242191, 1502335837, NULL, 1, NULL),
(2, '大学英语', '4个学期', 1200, 1, 1502242191, 1502335837, NULL, 1, NULL),
(3, 'C语言', '1个学期', 350, 1, 1502242191, 1502336083, NULL, 1, NULL),
(4, 'Java开发', '1个学期', 350, 1, 1502257693, 1502335837, NULL, 1, NULL),
(5, 'Android开发', '1个学期', 350, 1, 1502334559, 1502335837, NULL, 1, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proid` varchar(20) NOT NULL,
  `name` varchar(30) NOT NULL,
  `cate_id` smallint(6) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `original` varchar(100) NOT NULL DEFAULT '../../../../public/static/static/pic/user1.png',
  `cost` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `product`
--

INSERT INTO `product` (`id`, `proid`, `name`, `cate_id`, `brand_id`, `original`, `cost`, `price`, `stock`) VALUES
(30, 'PD201800009', '海尔洗烘一体机', 12, 4, '../../../../public/static/static/pic/user1.png', 8000, 9000, 6),
(16, 'PD201800006', '美的中央空调', 9, 7, '../../../../public/static/static/pic/user1.png', 10000, 13000, 9),
(12, 'PD201800001', '海信超薄电视', 10, 1, '../../../../public/static/static/pic/user1.png', 4800, 5600, 11),
(14, 'PD201800002', 'MI曲面电视', 2, 3, '../../../../public/static/static/pic/user1.png', 5000, 5700, 6),
(9, 'PD201800003', 'Haier滚筒洗衣机', 10, 4, '../../../../public/static/static/pic/user1.png', 5000, 5800, 6),
(10, 'PD201800004', '格力中央空调', 9, 6, '../../../../public/static/static/pic/user1.png', 8000, 9000, 4),
(25, 'PD201800006', '美的中央空调', 9, 7, '../../../../public/static/static/pic/user1.png', 10000, 13000, 9),
(21, 'PD201800008', '美的迷你洗衣机', 13, 7, '../../../../public/static/static/pic/user1.png', 1500, 2000, 5);

-- --------------------------------------------------------

--
-- 表的结构 `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `sex` tinyint(4) DEFAULT NULL COMMENT '性别',
  `age` tinyint(4) UNSIGNED DEFAULT NULL COMMENT '年龄',
  `mobile` varchar(20) DEFAULT NULL COMMENT '手机号',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `status` int(11) DEFAULT NULL COMMENT '当前状态',
  `start_time` int(11) DEFAULT NULL COMMENT '入学时间',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
  `is_delete` int(11) DEFAULT NULL COMMENT '允许删除',
  `grade_id` int(11) DEFAULT NULL COMMENT '关联外键',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `student`
--

INSERT INTO `student` (`id`, `name`, `sex`, `age`, `mobile`, `email`, `status`, `start_time`, `create_time`, `update_time`, `delete_time`, `is_delete`, `grade_id`) VALUES
(1, '杨过', 0, 67, '18966557788', 'yangguo@php.cn', 1, 1494345600, 1502326725, 1502343973, NULL, 1, 3),
(2, '小龙女', 0, 33, '13509897765', 'xiaolongnv@php.cn', 1, 1502326725, 1502326725, 1502343973, NULL, 1, 1),
(3, '尹志平', 1, 38, '17765336278', 'yizhiping@php.cn', 1, 1502326725, 1502326725, 1502343973, NULL, 1, 3),
(4, '老顽童', 1, 89, '15677281923', 'laowantong@php.cn', 1, 1502326725, 1502326725, 1502343973, NULL, 1, 2),
(5, '洪七公', 1, 78, '13389776234', 'hongqigong@php.cn', 1, 1502326725, 1502326725, 1502343973, NULL, 1, 2),
(6, '郭靖', 0, 26, '15766338726', 'guojin@php.cn', 1, 1502294400, 1502326725, 1502343973, NULL, 1, 1),
(7, '黄蓉', 0, 46, '18976227182', 'huangrong@php.cn', 0, 1502326725, 1502326725, 1502343973, NULL, 1, 1),
(8, '杨康', 1, 45, '13287009834', 'yangkang@php.cn', 0, 1502326725, 1502326725, 1502343973, NULL, 1, 3),
(9, '欧阳克', 1, 37, '13908772343', 'ouyangke@php.cn', 0, 1502326725, 1502326725, 1502343973, NULL, 1, 2),
(10, '张无忌', 1, 28, '15387298273', 'zhangwuji@php.cn', 1, 1502326725, 1502326725, 1502343973, NULL, 1, 2),
(11, '赵敏', 0, 26, '13987372937', 'zhaoming@php.cn', 1, 1502326725, 1502326725, 1502343973, NULL, 1, 3),
(12, '宋青书', 0, 22, '15806554328', 'songqinshu@php.cn', 1, 1494864000, 1502327784, 1502343973, NULL, 1, 2),
(13, '周芷若', 1, 20, '18977665544', 'zhouzhiruo@php.cn', 1, 1501948800, 1502343910, 1502343931, NULL, NULL, 5);

-- --------------------------------------------------------

--
-- 表的结构 `teacher`
--

DROP TABLE IF EXISTS `teacher`;
CREATE TABLE IF NOT EXISTS `teacher` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `degree` varchar(30) DEFAULT NULL COMMENT '学历',
  `mobile` varchar(20) DEFAULT NULL COMMENT '手机号',
  `school` varchar(50) DEFAULT NULL COMMENT '毕业学校',
  `hiredate` int(11) DEFAULT NULL COMMENT '入职时间',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) DEFAULT NULL COMMENT '删除标志',
  `is_delete` int(11) DEFAULT '1' COMMENT '允许删除',
  `status` int(11) DEFAULT NULL COMMENT '1启用0禁用',
  `grade_id` int(11) DEFAULT NULL COMMENT '外键',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `teacher`
--

INSERT INTO `teacher` (`id`, `name`, `degree`, `mobile`, `school`, `hiredate`, `create_time`, `update_time`, `delete_time`, `is_delete`, `status`, `grade_id`) VALUES
(1, '朱老师', '2', '15705517878', '数学学院', 1420041600, 1970, 1502342345, NULL, 1, 1, 5),
(2, '李老师', '1', '13988995566', '计算机学院', 1466006400, 2017, 1502342345, NULL, 1, 1, 2),
(3, '洪老师', '1', '18955139988', '英语学院', 1486310400, 2017, 1502342345, NULL, 1, 1, 1),
(5, '张老师', '1', '15805512377', '旅游学院', 1461254400, 2017, 1502342345, NULL, 1, 1, 5),
(6, '范老师', '1', '18976765533', '软件学院', 1501948800, 1502272302, 1502342345, NULL, 1, 1, 4),
(7, '王老师', '3', '13567890987', '青岛大学', 1479052800, 1542514607, 1542514607, NULL, 1, 1, 3),
(8, '王老师', '3', '13567899876', '青岛大学', 1478102400, 1542514648, 1542514661, 1542514661, 1, 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `uid` varchar(20) NOT NULL,
  `name` varchar(50) DEFAULT NULL COMMENT '用户名',
  `password` varchar(32) DEFAULT NULL COMMENT '用户密码',
  `email` varchar(255) DEFAULT NULL COMMENT '用户邮箱',
  `role` tinyint(2) UNSIGNED DEFAULT '1' COMMENT '角色',
  `status` int(2) UNSIGNED DEFAULT '1' COMMENT '状态:1启用0禁用',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
  `login_time` int(11) UNSIGNED DEFAULT NULL COMMENT '登录时间',
  `login_count` int(11) UNSIGNED DEFAULT '0' COMMENT '登录次数',
  `is_delete` int(2) UNSIGNED DEFAULT '0' COMMENT '是否删除1是0否',
  `department` int(11) NOT NULL DEFAULT '1',
  `ip` varchar(20) NOT NULL DEFAULT '127.0.0.1',
  `useragent` varchar(20) NOT NULL DEFAULT 'chrome',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`id`, `uid`, `name`, `password`, `email`, `role`, `status`, `create_time`, `update_time`, `delete_time`, `login_time`, `login_count`, `is_delete`, `department`, `ip`, `useragent`) VALUES
(1, 'EM00001', 'admin', '14e1b600b1fd579f47433b88e8d85291', 'admin@php.cn', 1, 1, 1501493848, 1544580683, NULL, 1544580683, 23, 1, 1, '127.0.0.1', 'chrome'),
(2, 'EM00002', 'peter', 'e10adc3949ba59abbe56e057f20f883e', 'peter888@php.cn', 1, 1, 1501582576, 1544581034, NULL, 1544581034, 20, 1, 1, '127.0.0.1', 'chrome'),
(3, 'EM00003', 'jack', 'e10adc3949ba59abbe56e057f20f883e', 'jack123@php.cn', 2, 1, 1502064844, 1544176879, 1544176879, 1502082773, 1, 1, 2, '127.0.0.1', 'chrome'),
(4, 'EM00004', 'zhu', 'e10adc3949ba59abbe56e057f20f883e', 'zhu@php.cn', 3, 1, NULL, 1502260457, NULL, NULL, 0, 1, 2, '127.0.0.1', 'chrome'),
(5, 'EM00005', 'tom', 'f4cc399f0effd13c888e310ea2cf5399', 'tom@php.cn', 3, 1, 1502091384, 1544580607, NULL, NULL, 0, 1, 2, '127.0.0.1', 'chrome'),
(6, 'EM00006', 'html', 'e10adc3949ba59abbe56e057f20f883e', 'html@php.cn', 4, 1, 1502091961, 1502260457, NULL, NULL, 0, 1, 2, '127.0.0.1', 'chrome'),
(7, 'EM00007', 'css', 'e10adc3949ba59abbe56e057f20f883e', 'css@php.cn', 2, 1, 1502092407, 1502260457, NULL, NULL, 0, 1, 2, '127.0.0.1', 'chrome'),
(8, 'EM00008', 'yangtao', 'e10adc3949ba59abbe56e057f20f883e', 'yangtao@php.cn', 2, 1, 1502171809, 1502260457, NULL, NULL, 0, 1, 3, '127.0.0.1', 'chrome'),
(9, 'EM00009', 'sam', 'f4cc399f0effd13c888e310ea2cf5399', 'sam@qq.com', 3, 1, 1544174939, 1544581442, NULL, 1544580998, 3, 1, 3, '127.0.0.1', 'chrome'),
(13, 'EM00010', 'Mary', 'c56d0e9a7ccec67b4ea131655038d604', 'Mary@qq.com', 3, 1, 1544177320, 1544579766, NULL, NULL, 0, 1, 4, '127.0.0.1', 'chrome'),
(14, 'EM00011', 'Sonia', '14e1b600b1fd579f47433b88e8d85291', 'sonia@qq.com', 2, 1, 1544579017, 1544579799, NULL, NULL, 0, 1, 4, '127.0.0.1', 'chrome'),
(15, 'EM00012', 'Lucy', 'e10adc3949ba59abbe56e057f20f883e', 'lucy@qq.com', 4, 1, 1544579552, 1544579552, NULL, NULL, 0, 1, 4, '127.0.0.1', 'chrome');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

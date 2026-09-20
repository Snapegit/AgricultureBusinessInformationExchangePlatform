-- MySQL dump 10.13  Distrib 5.7.31, for Linux (x86_64)
--
-- Host: localhost    Database: cl15067209
-- ------------------------------------------------------
-- Server version	5.7.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `cl15067209`
--

/*!40000 DROP DATABASE IF EXISTS `cl15067209`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `cl15067209` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `cl15067209`;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `address` varchar(200) NOT NULL COMMENT '地址',
  `name` varchar(200) DEFAULT NULL COMMENT '收货人',
  `phone` varchar(200) DEFAULT NULL COMMENT '电话',
  `isdefault` varchar(200) DEFAULT NULL COMMENT '是否默认地址',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='地址';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'2024-04-13 08:31:25','地址1','张三','19819881111','是',11),(2,'2024-04-13 08:31:25','地址2','李四','19819882222','是',12),(3,'2024-04-13 08:31:25','地址3','王五','19819883333','是',13),(4,'2024-04-13 08:31:25','地址4','赵六','19819884444','是',14),(5,'2024-04-13 08:31:25','地址5','孙七','19819885555','是',15),(6,'2024-04-13 08:31:25','地址6','周八','19819886666','是',16),(7,'2024-04-13 08:43:04','北京','11','15021023622','是',47),(8,'2024-04-13 08:46:45','北京','111','15201203201','是',48);
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `tablename` varchar(200) DEFAULT NULL COMMENT '商品表名',
  `goodid` bigint(20) NOT NULL COMMENT '商品id',
  `goodname` varchar(200) DEFAULT NULL COMMENT '商品名称',
  `picture` longtext NOT NULL COMMENT '图片',
  `buynumber` int(11) DEFAULT NULL COMMENT '购买数量',
  `price` double DEFAULT NULL COMMENT '单价',
  `discountprice` double DEFAULT NULL COMMENT '折扣价',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `nongminzhanghao` varchar(200) DEFAULT NULL COMMENT '商户名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='购物车';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,'2024-04-13 08:42:47','nongchanpinxinxi',81,'产品名称1','file/nongchanpinxinxiTupian1.jpg',1,99.9,0,47,'农民账号1'),(2,'2024-04-13 08:46:24','nongchanpinxinxi',81,'产品名称1','file/nongchanpinxinxiTupian1.jpg',1,99.9,0,48,'农民账号1');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chanpinfenlei`
--

DROP TABLE IF EXISTS `chanpinfenlei`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chanpinfenlei` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `chanpinfenlei` varchar(200) DEFAULT NULL COMMENT '产品分类',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8 COMMENT='产品分类';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chanpinfenlei`
--

LOCK TABLES `chanpinfenlei` WRITE;
/*!40000 ALTER TABLE `chanpinfenlei` DISABLE KEYS */;
INSERT INTO `chanpinfenlei` VALUES (71,'2024-04-13 08:31:25','产品分类1'),(72,'2024-04-13 08:31:25','产品分类2'),(73,'2024-04-13 08:31:25','产品分类3'),(74,'2024-04-13 08:31:25','产品分类4'),(75,'2024-04-13 08:31:25','产品分类5'),(76,'2024-04-13 08:31:25','产品分类6');
/*!40000 ALTER TABLE `chanpinfenlei` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='配置文件';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES (1,'swiper1','file/swiperPicture1.jpg'),(2,'swiper2','file/swiperPicture2.jpg'),(3,'swiper3','file/swiperPicture3.jpg');
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dianpuxinxi`
--

DROP TABLE IF EXISTS `dianpuxinxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dianpuxinxi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `dianpumingcheng` varchar(200) DEFAULT NULL COMMENT '店铺名称',
  `dianputupian` longtext COMMENT '店铺图片',
  `shoumaichanpin` longtext COMMENT '售卖产品',
  `dianpuxiangqing` longtext COMMENT '店铺详情',
  `nongminzhanghao` varchar(200) DEFAULT NULL COMMENT '农民账号',
  `nongminxingming` varchar(200) DEFAULT NULL COMMENT '农民姓名',
  `lianxidianhua` varchar(200) DEFAULT NULL COMMENT '联系电话',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 COMMENT='店铺信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dianpuxinxi`
--

LOCK TABLES `dianpuxinxi` WRITE;
/*!40000 ALTER TABLE `dianpuxinxi` DISABLE KEYS */;
INSERT INTO `dianpuxinxi` VALUES (61,'2024-04-13 08:31:25','店铺名称1','file/dianpuxinxiDianputupian1.jpg,file/dianpuxinxiDianputupian2.jpg,file/dianpuxinxiDianputupian3.jpg','售卖产品1','店铺详情1','农民账号1','农民姓名1','联系电话1'),(62,'2024-04-13 08:31:25','店铺名称2','file/dianpuxinxiDianputupian2.jpg,file/dianpuxinxiDianputupian3.jpg,file/dianpuxinxiDianputupian4.jpg','售卖产品2','店铺详情2','农民账号2','农民姓名2','联系电话2'),(63,'2024-04-13 08:31:25','店铺名称3','file/dianpuxinxiDianputupian3.jpg,file/dianpuxinxiDianputupian4.jpg,file/dianpuxinxiDianputupian5.jpg','售卖产品3','店铺详情3','农民账号3','农民姓名3','联系电话3'),(64,'2024-04-13 08:31:25','店铺名称4','file/dianpuxinxiDianputupian4.jpg,file/dianpuxinxiDianputupian5.jpg,file/dianpuxinxiDianputupian6.jpg','售卖产品4','店铺详情4','农民账号4','农民姓名4','联系电话4'),(65,'2024-04-13 08:31:25','店铺名称5','file/dianpuxinxiDianputupian5.jpg,file/dianpuxinxiDianputupian6.jpg,file/dianpuxinxiDianputupian7.jpg','售卖产品5','店铺详情5','农民账号5','农民姓名5','联系电话5'),(66,'2024-04-13 08:31:25','店铺名称6','file/dianpuxinxiDianputupian6.jpg,file/dianpuxinxiDianputupian7.jpg,file/dianpuxinxiDianputupian8.jpg','售卖产品6','店铺详情6','农民账号6','农民姓名6','联系电话6');
/*!40000 ALTER TABLE `dianpuxinxi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discussdianpuxinxi`
--

DROP TABLE IF EXISTS `discussdianpuxinxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discussdianpuxinxi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `refid` bigint(20) NOT NULL COMMENT '关联表id',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `avatarurl` longtext COMMENT '头像',
  `nickname` varchar(200) DEFAULT NULL COMMENT '用户名',
  `content` longtext NOT NULL COMMENT '评论内容',
  `reply` longtext COMMENT '回复内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='店铺信息评论表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discussdianpuxinxi`
--

LOCK TABLES `discussdianpuxinxi` WRITE;
/*!40000 ALTER TABLE `discussdianpuxinxi` DISABLE KEYS */;
INSERT INTO `discussdianpuxinxi` VALUES (1,'2024-04-13 08:42:26',61,47,'','11','11111111',''),(2,'2024-04-13 08:46:13',61,48,'file/微信截图_20240222155126-1712997952764.png','111','sddwdfwefd','');
/*!40000 ALTER TABLE `discussdianpuxinxi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discussnongchanpinxinxi`
--

DROP TABLE IF EXISTS `discussnongchanpinxinxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discussnongchanpinxinxi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `refid` bigint(20) NOT NULL COMMENT '关联表id',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `avatarurl` longtext COMMENT '头像',
  `nickname` varchar(200) DEFAULT NULL COMMENT '用户名',
  `content` longtext NOT NULL COMMENT '评论内容',
  `reply` longtext COMMENT '回复内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='农产品信息评论表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discussnongchanpinxinxi`
--

LOCK TABLES `discussnongchanpinxinxi` WRITE;
/*!40000 ALTER TABLE `discussnongchanpinxinxi` DISABLE KEYS */;
INSERT INTO `discussnongchanpinxinxi` VALUES (1,'2024-04-13 08:49:53',81,51,'file/微信截图_20240222155126-1712997952764.png','111','dewfrrewfw','');
/*!40000 ALTER TABLE `discussnongchanpinxinxi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forum`
--

DROP TABLE IF EXISTS `forum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forum` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `title` varchar(200) DEFAULT NULL COMMENT '帖子标题',
  `content` longtext NOT NULL COMMENT '帖子内容',
  `parentid` bigint(20) DEFAULT NULL COMMENT '父节点id',
  `username` varchar(200) DEFAULT NULL COMMENT '用户名',
  `avatarurl` longtext COMMENT '头像',
  `isdone` varchar(200) DEFAULT NULL COMMENT '状态',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8 COMMENT='论坛交流';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forum`
--

LOCK TABLES `forum` WRITE;
/*!40000 ALTER TABLE `forum` DISABLE KEYS */;
INSERT INTO `forum` VALUES (121,'2024-04-13 08:31:25','帖子标题1','帖子内容1',0,'用户名1','file/forumAvatarurl1.jpg,file/forumAvatarurl2.jpg,file/forumAvatarurl3.jpg','开放',1),(122,'2024-04-13 08:31:25','帖子标题2','帖子内容2',0,'用户名2','file/forumAvatarurl2.jpg,file/forumAvatarurl3.jpg,file/forumAvatarurl4.jpg','开放',2),(123,'2024-04-13 08:31:25','帖子标题3','帖子内容3',0,'用户名3','file/forumAvatarurl3.jpg,file/forumAvatarurl4.jpg,file/forumAvatarurl5.jpg','开放',3),(124,'2024-04-13 08:31:25','帖子标题4','帖子内容4',0,'用户名4','file/forumAvatarurl4.jpg,file/forumAvatarurl5.jpg,file/forumAvatarurl6.jpg','开放',4),(125,'2024-04-13 08:31:25','帖子标题5','帖子内容5',0,'用户名5','file/forumAvatarurl5.jpg,file/forumAvatarurl6.jpg,file/forumAvatarurl7.jpg','开放',5),(126,'2024-04-13 08:31:25','帖子标题6','帖子内容6',0,'用户名6','file/forumAvatarurl6.jpg,file/forumAvatarurl7.jpg,file/forumAvatarurl8.jpg','开放',6),(127,'2024-04-13 08:44:10','','<p>1111111111111111111</p>',121,'','','',47),(128,'2024-04-13 08:50:10','','<p>fesferwgerger</p>',127,'','file/微信截图_20240222155126-1712997952764.png','',51);
/*!40000 ALTER TABLE `forum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `menujson` longtext COMMENT '菜单',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='菜单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'2024-04-13 08:31:25','[{\"backMenu\":[{\"child\":[{\"appFrontIcon\":\"cuIcon-clothes\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"管理员\",\"menuJump\":\"列表\",\"tableName\":\"users\"},{\"appFrontIcon\":\"cuIcon-full\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"用户\",\"menuJump\":\"列表\",\"tableName\":\"yonghu\"},{\"appFrontIcon\":\"cuIcon-explore\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"农民\",\"menuJump\":\"列表\",\"tableName\":\"nongmin\"}],\"fontClass\":\"icon-common10\",\"menu\":\"用户管理\",\"unicode\":\"&#xedd1;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-shop\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"产品分类\",\"menuJump\":\"列表\",\"tableName\":\"chanpinfenlei\"},{\"appFrontIcon\":\"cuIcon-skin\",\"buttons\":[\"查看\",\"修改\",\"删除\",\"查看评论\"],\"menu\":\"农产品信息\",\"menuJump\":\"列表\",\"tableName\":\"nongchanpinxinxi\"}],\"fontClass\":\"icon-common37\",\"menu\":\"农产品管理\",\"unicode\":\"&#xeea4;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-pay\",\"buttons\":[\"查看\",\"修改\",\"删除\",\"查看评论\"],\"menu\":\"店铺信息\",\"menuJump\":\"列表\",\"tableName\":\"dianpuxinxi\"}],\"fontClass\":\"icon-common44\",\"menu\":\"店铺信息管理\",\"unicode\":\"&#xef28;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-similar\",\"buttons\":[\"删除\",\"查看\"],\"menu\":\"用户反馈\",\"menuJump\":\"列表\",\"tableName\":\"yonghufankui\"}],\"fontClass\":\"icon-common14\",\"menu\":\"用户反馈管理\",\"unicode\":\"&#xedfb;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-attentionfavor\",\"buttons\":[\"查看\",\"删除\",\"导出\"],\"menu\":\"全部订单\",\"tableName\":\"orders\"},{\"appFrontIcon\":\"cuIcon-attentionfavor\",\"buttons\":[\"查看\",\"删除\"],\"menu\":\"未支付订单\",\"menuJump\":\"未支付\",\"tableName\":\"orders\"},{\"appFrontIcon\":\"cuIcon-attentionfavor\",\"buttons\":[\"查看\",\"删除\"],\"menu\":\"已支付订单\",\"menuJump\":\"已支付\",\"tableName\":\"orders\"},{\"appFrontIcon\":\"cuIcon-attentionfavor\",\"buttons\":[\"查看\",\"删除\"],\"menu\":\"已完成订单\",\"menuJump\":\"已完成\",\"tableName\":\"orders\"},{\"appFrontIcon\":\"cuIcon-attentionfavor\",\"buttons\":[\"查看\",\"删除\"],\"menu\":\"已取消订单\",\"menuJump\":\"已取消\",\"tableName\":\"orders\"},{\"appFrontIcon\":\"cuIcon-attentionfavor\",\"buttons\":[\"查看\",\"删除\"],\"menu\":\"已退款订单\",\"menuJump\":\"已退款\",\"tableName\":\"orders\"},{\"appFrontIcon\":\"cuIcon-attentionfavor\",\"buttons\":[\"查看\",\"删除\"],\"menu\":\"已发货订单\",\"menuJump\":\"已发货\",\"tableName\":\"orders\"}],\"fontClass\":\"icon-common39\",\"menu\":\"订单管理\",\"unicode\":\"&#xeeba;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-circle\",\"buttons\":[\"查看\",\"查看评论\",\"删除\"],\"menu\":\"论坛交流\",\"tableName\":\"forum\"}],\"fontClass\":\"icon-common26\",\"menu\":\"论坛管理\",\"unicode\":\"&#xee2b;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-paint\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"公告资讯\",\"menuJump\":\"列表\",\"tableName\":\"news\"},{\"appFrontIcon\":\"cuIcon-paint\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"轮播图\",\"menuJump\":\"列表\",\"tableName\":\"config\"}],\"fontClass\":\"icon-common29\",\"menu\":\"系统管理\",\"unicode\":\"&#xee2e;\"}],\"frontMenu\":[{\"child\":[{\"appFrontIcon\":\"cuIcon-copy\",\"buttons\":[\"查看\",\"查看评论\"],\"fontClass\":\"icon-common3\",\"menu\":\"店铺信息\",\"menuJump\":\"列表\",\"tableName\":\"dianpuxinxi\",\"unicode\":\"&#xeda5;\"}],\"fontClass\":\"icon-common3\",\"menu\":\"店铺信息\",\"unicode\":\"&#xeda5;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-full\",\"buttons\":[\"查看\",\"查看评论\"],\"fontClass\":\"icon-common43\",\"menu\":\"农产品信息\",\"menuJump\":\"列表\",\"tableName\":\"nongchanpinxinxi\",\"unicode\":\"&#xef27;\"}],\"fontClass\":\"icon-common43\",\"menu\":\"农产品信息\",\"unicode\":\"&#xef27;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-pay\",\"buttons\":[\"查看\"],\"fontClass\":\"icon-common1\",\"menu\":\"公告资讯\",\"menuJump\":\"列表\",\"tableName\":\"news\",\"unicode\":\"&#xeda3;\"}],\"fontClass\":\"icon-common1\",\"menu\":\"公告资讯\",\"unicode\":\"&#xeda3;\"}],\"hasBackLogin\":\"是\",\"hasBackRegister\":\"否\",\"hasFrontLogin\":\"否\",\"hasFrontRegister\":\"否\",\"roleName\":\"管理员\",\"tableName\":\"users\"},{\"backMenu\":[{\"child\":[{\"appFrontIcon\":\"cuIcon-similar\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"用户反馈\",\"menuJump\":\"列表\",\"tableName\":\"yonghufankui\"}],\"fontClass\":\"icon-common14\",\"menu\":\"用户反馈管理\",\"unicode\":\"&#xedfb;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-attentionfavor\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"购物车\",\"menuJump\":\"列表\",\"tableName\":\"cart\"}],\"fontClass\":\"icon-common13\",\"menu\":\"购物车管理\",\"unicode\":\"&#xedf7;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-attentionfavor\",\"buttons\":[\"查看\"],\"menu\":\"全部订单\",\"tableName\":\"orders\"},{\"appFrontIcon\":\"cuIcon-attentionfavor\",\"buttons\":[\"查看\"],\"menu\":\"未支付订单\",\"menuJump\":\"未支付\",\"tableName\":\"orders\"},{\"appFrontIcon\":\"cuIcon-attentionfavor\",\"buttons\":[\"查看\"],\"menu\":\"已支付订单\",\"menuJump\":\"已支付\",\"tableName\":\"orders\"},{\"appFrontIcon\":\"cuIcon-attentionfavor\",\"buttons\":[\"查看\"],\"menu\":\"已完成订单\",\"menuJump\":\"已完成\",\"tableName\":\"orders\"},{\"appFrontIcon\":\"cuIcon-attentionfavor\",\"buttons\":[\"查看\"],\"menu\":\"已取消订单\",\"menuJump\":\"已取消\",\"tableName\":\"orders\"},{\"appFrontIcon\":\"cuIcon-attentionfavor\",\"buttons\":[\"查看\"],\"menu\":\"已退款订单\",\"menuJump\":\"已退款\",\"tableName\":\"orders\"},{\"appFrontIcon\":\"cuIcon-attentionfavor\",\"buttons\":[\"查看\",\"确认收货\"],\"menu\":\"已发货订单\",\"menuJump\":\"已发货\",\"tableName\":\"orders\"}],\"fontClass\":\"icon-common39\",\"menu\":\"订单管理\",\"unicode\":\"&#xeeba;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-link\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"地址\",\"menuJump\":\"列表\",\"tableName\":\"address\"}],\"fontClass\":\"icon-common37\",\"menu\":\"地址管理\",\"unicode\":\"&#xeea4;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-circle\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"我的发布\",\"menuJump\":\"14\",\"tableName\":\"forum\"}],\"fontClass\":\"icon-common26\",\"menu\":\"论坛管理\",\"unicode\":\"&#xee2b;\"}],\"frontMenu\":[{\"child\":[{\"appFrontIcon\":\"cuIcon-copy\",\"buttons\":[\"查看\",\"查看评论\"],\"fontClass\":\"icon-common3\",\"menu\":\"店铺信息\",\"menuJump\":\"列表\",\"tableName\":\"dianpuxinxi\",\"unicode\":\"&#xeda5;\"}],\"fontClass\":\"icon-common3\",\"menu\":\"店铺信息\",\"unicode\":\"&#xeda5;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-full\",\"buttons\":[\"查看\",\"查看评论\"],\"fontClass\":\"icon-common43\",\"menu\":\"农产品信息\",\"menuJump\":\"列表\",\"tableName\":\"nongchanpinxinxi\",\"unicode\":\"&#xef27;\"}],\"fontClass\":\"icon-common43\",\"menu\":\"农产品信息\",\"unicode\":\"&#xef27;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-pay\",\"buttons\":[\"查看\"],\"fontClass\":\"icon-common1\",\"menu\":\"公告资讯\",\"menuJump\":\"列表\",\"tableName\":\"news\",\"unicode\":\"&#xeda3;\"}],\"fontClass\":\"icon-common1\",\"menu\":\"公告资讯\",\"unicode\":\"&#xeda3;\"}],\"hasBackLogin\":\"否\",\"hasBackRegister\":\"否\",\"hasFrontLogin\":\"是\",\"hasFrontRegister\":\"是\",\"roleName\":\"用户\",\"tableName\":\"yonghu\"},{\"backMenu\":[{\"child\":[{\"appFrontIcon\":\"cuIcon-skin\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"查看评论\"],\"menu\":\"农产品信息\",\"menuJump\":\"列表\",\"tableName\":\"nongchanpinxinxi\"}],\"fontClass\":\"icon-common37\",\"menu\":\"农产品管理\",\"unicode\":\"&#xeea4;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-pay\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"查看评论\"],\"menu\":\"店铺信息\",\"menuJump\":\"列表\",\"tableName\":\"dianpuxinxi\"}],\"fontClass\":\"icon-common44\",\"menu\":\"店铺信息管理\",\"unicode\":\"&#xef28;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-attentionfavor\",\"buttons\":[\"查看\",\"删除\"],\"menu\":\"全部订单\",\"tableName\":\"orders\"},{\"appFrontIcon\":\"cuIcon-attentionfavor\",\"buttons\":[\"查看\",\"删除\"],\"menu\":\"未支付订单\",\"menuJump\":\"未支付\",\"tableName\":\"orders\"},{\"appFrontIcon\":\"cuIcon-attentionfavor\",\"buttons\":[\"查看\",\"删除\",\"发货\",\"物流\"],\"menu\":\"已支付订单\",\"menuJump\":\"已支付\",\"tableName\":\"orders\"},{\"appFrontIcon\":\"cuIcon-attentionfavor\",\"buttons\":[\"查看\",\"删除\",\"物流\"],\"menu\":\"已完成订单\",\"menuJump\":\"已完成\",\"tableName\":\"orders\"},{\"appFrontIcon\":\"cuIcon-attentionfavor\",\"buttons\":[\"查看\",\"删除\"],\"menu\":\"已取消订单\",\"menuJump\":\"已取消\",\"tableName\":\"orders\"},{\"appFrontIcon\":\"cuIcon-attentionfavor\",\"buttons\":[\"查看\",\"删除\",\"物流\"],\"menu\":\"已退款订单\",\"menuJump\":\"已退款\",\"tableName\":\"orders\"},{\"appFrontIcon\":\"cuIcon-attentionfavor\",\"buttons\":[\"查看\",\"删除\",\"物流\"],\"menu\":\"已发货订单\",\"menuJump\":\"已发货\",\"tableName\":\"orders\"}],\"fontClass\":\"icon-common39\",\"menu\":\"订单管理\",\"unicode\":\"&#xeeba;\"}],\"frontMenu\":[{\"child\":[{\"appFrontIcon\":\"cuIcon-copy\",\"buttons\":[\"查看\",\"查看评论\"],\"fontClass\":\"icon-common3\",\"menu\":\"店铺信息\",\"menuJump\":\"列表\",\"tableName\":\"dianpuxinxi\",\"unicode\":\"&#xeda5;\"}],\"fontClass\":\"icon-common3\",\"menu\":\"店铺信息\",\"unicode\":\"&#xeda5;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-full\",\"buttons\":[\"查看\",\"查看评论\"],\"fontClass\":\"icon-common43\",\"menu\":\"农产品信息\",\"menuJump\":\"列表\",\"tableName\":\"nongchanpinxinxi\",\"unicode\":\"&#xef27;\"}],\"fontClass\":\"icon-common43\",\"menu\":\"农产品信息\",\"unicode\":\"&#xef27;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-pay\",\"buttons\":[\"查看\"],\"fontClass\":\"icon-common1\",\"menu\":\"公告资讯\",\"menuJump\":\"列表\",\"tableName\":\"news\",\"unicode\":\"&#xeda3;\"}],\"fontClass\":\"icon-common1\",\"menu\":\"公告资讯\",\"unicode\":\"&#xeda3;\"}],\"hasBackLogin\":\"是\",\"hasBackRegister\":\"是\",\"hasFrontLogin\":\"否\",\"hasFrontRegister\":\"否\",\"roleName\":\"农民\",\"tableName\":\"nongmin\"}]');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `title` varchar(200) NOT NULL COMMENT '标题',
  `introduction` longtext COMMENT '简介',
  `picture` longtext NOT NULL COMMENT '图片',
  `content` longtext NOT NULL COMMENT '内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='公告资讯';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (31,'2024-04-13 08:31:25','青花瓷','素胚勾勒出青花笔锋浓转淡，瓶身描绘的牡丹一如你初妆，冉冉檀香透过窗心事我了然，宣上走笔至此搁一半，釉色渲染仕女图韵味被私藏，而你嫣然的一笑如含苞待放，你的美缕飘散，去到我去不了的地方，天青色等烟雨 而我在等你，炊烟袅袅升起','file/newsPicture1.jpg','素胚勾勒出青花笔锋浓转淡，瓶身描绘的牡丹一如你初妆，冉冉檀香透过窗心事我了然，宣上走笔至此搁一半，釉色渲染仕女图韵味被私藏，而你嫣然的一笑如含苞待放，你的美缕飘散，去到我去不了的地方，天青色等烟雨 而我在等你，炊烟袅袅升起， 隔江千万里，在瓶底书前朝的飘逸，就当我为遇见你伏笔，天青色等烟雨， 而我在等你，月色被打捞起， 晕开了局，如传世的青花瓷自顾自美丽，你眼带笑意，色白花青的锦鲤跃然于碗底，临摹宋体落款时却惦记着你，你隐藏在窑烧里千年的秘密，极细腻犹如绣花针落地，帘外芭蕉惹骤雨门环惹铜绿，而我路过那江南小镇惹了你，在泼墨山水画里，你从墨色深处被隐去，天青色等烟雨 ，而我在等你，炊烟袅袅升起 ，隔江千万里，在瓶底书汉隶仿前朝的飘逸，就当我为遇见你伏笔，天色等烟雨 ，而我在等你，月色被打捞起， 晕开了结局，如传世的青花瓷自顾自美丽，你眼带笑意，天青色等烟雨 ，而我在等你，炊烟袅袅升起 ，隔江千万里，在瓶底书汉隶仿前朝的飘逸，就当我为遇见你伏笔，天青色等烟雨， 而我在等你，月色被打捞起 ，晕开了结局，如传世的青花瓷自顾自美丽，你眼带笑意。'),(32,'2024-04-13 08:31:25','理想三旬','雨后有车驶来，驶过暮色苍白，旧铁皮往南开，恋人已不在，收听浓烟下的，诗歌电台，不动情的咳嗽，至少看起来，归途也还可爱，琴弦少了姿态，再不见那夜里，听歌的小孩，时光匆匆独白，将颠沛磨成卡带，已枯倦的情怀，踏碎成年代，就老去吧，孤独别醒来，你渴望的离开，只是无处停摆，就歌唱吧，眼睛眯起来，而热泪的崩坏，只是没抵达的存在','file/newsPicture2.jpg','雨后有车驶来，驶过暮色苍白，旧铁皮往南开，恋人已不在，收听浓烟下的，诗歌电台，不动情的咳嗽，至少看起来，归途也还可爱，琴弦少了姿态，再不见那夜里，听歌的小孩，时光匆匆独白，将颠沛磨成卡带，已枯倦的情怀，踏碎成年代，就老去吧，孤独别醒来，你渴望的离开，只是无处停摆，就歌唱吧，眼睛眯起来，而热泪的崩坏，只是没抵达的存在，青春又醉倒在，籍籍无名的怀，靠嬉笑来虚度，聚散得慷慨，辗转却去不到，对的站台，如果漂泊是成长，必经的路牌，你迷醒岁月中，那贫瘠的未来，像遗憾季节里，未结果的爱，弄脏了每一页诗，吻最疼痛的告白，而风声吹到这，已不需要释怀，就老去吧，孤独别醒来，渴望的离开只是无处停摆就歌唱吧，眼睛眯起来而热泪的崩坏，只是没抵达的存在，就甜蜜地忍耐，繁星润湿窗台，光影跳动着像在，困倦里说爱，再无谓的感慨，以为明白，梦倒塌的地方，今已爬满青苔。'),(33,'2024-04-13 08:31:25','七里香','窗外的麻雀在电线杆上多嘴，你说这一句很有夏天的感觉，手中的铅笔在纸上来来回回，我用几行字形容你是我的谁，秋刀鱼的滋味猫跟你都想了解，初恋的香味就这样被我们寻回，那温暖的阳光像刚摘的鲜艳草莓，你说你舍不得吃掉这一种感觉，雨下整夜我的爱溢出就像雨水，院子落叶跟我的思念厚厚一叠','file/newsPicture3.jpg','窗外的麻雀在电线杆上多嘴，你说这一句很有夏天的感觉，手中的铅笔在纸上来来回回，我用几行字形容你是我的谁，秋刀鱼的滋味猫跟你都想了解，初恋的香味就这样被我们寻回，那温暖的阳光像刚摘的鲜艳草莓，你说你舍不得吃掉这一种感觉，雨下整夜我的爱溢出就像雨水，院子落叶跟我的思念厚厚一叠，几句是非也无法将我的热情冷却，你出现在我诗的每一页，雨下整夜我的爱溢出就像雨水，窗台蝴蝶像诗里纷飞的美丽章节，我接着写，把永远爱你写进诗的结尾，你是我唯一想要的了解，雨下整夜我的爱溢出就像雨水，院子落叶跟我的思念厚厚一叠，几句是非也无法将我的热情冷却，你出现在我诗的每一页，那饱满的稻穗幸福了这个季节，而你的脸颊像田里熟透的番茄，你突然对我说七里香的名字很美，我此刻却只想亲吻你倔强的嘴，雨下整夜我的爱溢出就像雨水，院子落叶跟我的思念厚厚一叠，几句是非也无法将我的热情冷却，你出现在我诗的每一页，整夜我的爱溢出就像雨水，窗台蝴蝶像诗里纷飞的美丽章节，我接着写，把永远爱你写进诗的结尾，是我唯一想要的了解。'),(34,'2024-04-13 08:31:25','江南','风到这里就是粘，粘住过客的思念，雨到了这里缠成线，缠着我们流连人世间，你在身边就是缘，缘分写在三生石上面，爱有万分之一甜，宁愿我就葬在这一点，圈圈圆圆圈圈，天天年年天天的我，深深看你的脸，生气的温柔，埋怨的温柔的脸','file/newsPicture4.jpg','风到这里就是粘，粘住过客的思念，雨到了这里缠成线，缠着我们流连人世间，你在身边就是缘，缘分写在三生石上面，爱有万分之一甜，宁愿我就葬在这一点，圈圈圆圆圈圈，天天年年天天的我，深深看你的脸，生气的温柔，埋怨的温柔的脸，不懂爱恨情愁煎熬的我们，都以为相爱就像风云的善变，相信爱一天抵过永远，在这一刹那冻结了时间，不懂怎么表现温柔的我们，还以为殉情只是古老的传言，离愁能有多痛痛有多浓，当梦被埋在江南烟雨中，心碎了才懂，圈圈圆圆圈圈，天天年年天天的我，深深看你的脸，生气的温柔，埋怨的温柔的脸，不懂爱恨情愁煎熬的我们，都以为相爱就像风云的善变，相信爱一天 抵过永远，在这一刹那冻结了时间，不懂怎么表现温柔的我们，还以为殉情只是古老的传言，离愁能有多痛 痛有多浓，当梦被埋在江南烟雨中，心碎了才懂，相信爱一天抵过永远。在这一刹那冻结了时间，不懂怎么表现温柔的我们，还以为殉情只是古老的传言，离愁能有多痛 痛有多浓，当梦被埋在江南烟雨中，心碎了才懂。'),(35,'2024-04-13 08:31:25','那些你很冒险的梦','当两颗心开始震动，当你瞳孔学会闪躲，当爱慢慢被遮住只剩下黑，距离像影子被拉拖，当爱的故事剩听说，我找不到你单纯的面孔，当生命每分每秒都为你转动，心多执着就加倍心痛，那些你很冒险的梦， 我陪你去疯，折纸飞机碰到雨天终究会坠落','file/newsPicture5.jpg','当两颗心开始震动，当你瞳孔学会闪躲，当爱慢慢被遮住只剩下黑，距离像影子被拉拖，当爱的故事剩听说，我找不到你单纯的面孔，当生命每分每秒都为你转动，心多执着就加倍心痛，那些你很冒险的梦， 我陪你去疯，折纸飞机碰到雨天终究会坠落，太残忍的话我直说 因为爱很重，你却不想懂 只往反方向走，当爱的故事剩听说，我找不到你单纯的面孔，当生命每分每秒都为你转动，心有多执着就加倍心痛，那些你很冒险的梦 我陪你去疯，折纸飞机 碰到雨天 终究会坠落，太残忍的话我直说 因为爱很重，你却不想懂 只往反方向走，我不想放手 你松开的左手，你爱的放纵 我白不回天空，我输了 累了，但你再也 不回头，那些你很冒险的梦 我陪你去疯，折纸飞机 碰到雨天 终究会坠落，太残忍的话我直说 因为爱很重，你却不想懂 只往反方向走，你真的不懂 我的爱已降落。'),(36,'2024-04-13 08:31:25','孤勇者','都，是勇敢的，你额头的伤口 你的 不同 你犯的错，都 不必隐藏，你破旧的玩偶 你的 面具 你的自我，他们说 要带着光 驯服每一头怪兽，他们说 要缝好你的伤，没有人爱小丑 为何孤独 不可 光荣，人只有不完美 值得歌颂，谁说污泥满身的不算英雄，爱你孤身走暗巷，爱你不跪的模样，爱你对峙过绝望','file/newsPicture6.jpg','都，是勇敢的，你额头的伤口 你的 不同 你犯的错，都 不必隐藏，你破旧的玩偶 你的 面具 你的自我，他们说 要带着光 驯服每一头怪兽，他们说 要缝好你的伤，没有人爱小丑 为何孤独 不可 光荣，人只有不完美 值得歌颂，谁说污泥满身的不算英雄，爱你孤身走暗巷，爱你不跪的模样，爱你对峙过绝望，不肯哭一场，爱你破烂的衣裳，却敢堵命运的枪，爱你和我那么像，缺口都一样，去吗 配吗 这褴褛的披风，战吗 战啊 以最卑微的梦，致那黑夜中的呜咽与怒吼，谁说站在光里的才算英雄，他们说 要戒了你的狂，就像擦掉了污垢，他们说 要顺台阶而上，而代价是低头，那就让我 不可 乘风，你一样骄傲着 那种孤勇，谁说对弈平凡的不算英雄，爱你孤身走暗巷 爱你不跪的模样，爱你对峙过绝望 不肯哭一场，爱你破烂的衣裳 却敢堵命运的枪，爱你和我那么像 缺口都一样，去吗 配吗 这褴褛的披风，战吗 战啊 以最卑微的梦，致那黑夜中的呜咽与怒吼，谁说站在光里的才算英雄，你的斑驳 与众不同 与众不同，你的沉默 震耳欲聋 震耳欲聋，You Are The Hero，爱你孤身走暗巷 爱你不跪的模样，爱你对峙过绝望 不肯哭一场，爱你来自于蛮荒 一生不借谁的光，你将造你的城邦 在废墟之上，去吗 去啊 以最卑微的梦，战吗 战啊 以最孤高的梦，致那黑夜中的呜咽与怒吼，谁说站在光里的才算英雄。');
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nongchanpinxinxi`
--

DROP TABLE IF EXISTS `nongchanpinxinxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nongchanpinxinxi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `chanpinmingcheng` varchar(200) NOT NULL COMMENT '产品名称',
  `chanpinfenlei` varchar(200) NOT NULL COMMENT '产品分类',
  `tupian` longtext COMMENT '图片',
  `guige` varchar(200) DEFAULT NULL COMMENT '规格',
  `chanpinxiangqing` longtext COMMENT '产品详情',
  `nongminzhanghao` varchar(200) DEFAULT NULL COMMENT '农民账号',
  `nongminxingming` varchar(200) DEFAULT NULL COMMENT '农民姓名',
  `price` double DEFAULT NULL COMMENT '价格',
  `onelimittimes` int(11) DEFAULT NULL COMMENT '单限',
  `alllimittimes` int(11) DEFAULT NULL COMMENT '库存',
  `longitude` double DEFAULT NULL COMMENT '经度',
  `latitude` double DEFAULT NULL COMMENT '纬度',
  `fulladdress` varchar(200) DEFAULT NULL COMMENT '地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8 COMMENT='农产品信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nongchanpinxinxi`
--

LOCK TABLES `nongchanpinxinxi` WRITE;
/*!40000 ALTER TABLE `nongchanpinxinxi` DISABLE KEYS */;
INSERT INTO `nongchanpinxinxi` VALUES (81,'2024-04-13 08:31:25','产品名称1','产品分类1','file/nongchanpinxinxiTupian1.jpg,file/nongchanpinxinxiTupian2.jpg,file/nongchanpinxinxiTupian3.jpg','规格1','产品详情1','农民账号1','农民姓名1',99.9,1,96,1,1,'宇宙银河系地球1号'),(82,'2024-04-13 08:31:25','产品名称2','产品分类2','file/nongchanpinxinxiTupian2.jpg,file/nongchanpinxinxiTupian3.jpg,file/nongchanpinxinxiTupian4.jpg','规格2','产品详情2','农民账号2','农民姓名2',99.9,2,99,2,2,'宇宙银河系地球2号'),(83,'2024-04-13 08:31:25','产品名称3','产品分类3','file/nongchanpinxinxiTupian3.jpg,file/nongchanpinxinxiTupian4.jpg,file/nongchanpinxinxiTupian5.jpg','规格3','产品详情3','农民账号3','农民姓名3',99.9,3,99,3,3,'宇宙银河系地球3号'),(84,'2024-04-13 08:31:25','产品名称4','产品分类4','file/nongchanpinxinxiTupian4.jpg,file/nongchanpinxinxiTupian5.jpg,file/nongchanpinxinxiTupian6.jpg','规格4','产品详情4','农民账号4','农民姓名4',99.9,4,99,4,4,'宇宙银河系地球4号'),(85,'2024-04-13 08:31:25','产品名称5','产品分类5','file/nongchanpinxinxiTupian5.jpg,file/nongchanpinxinxiTupian6.jpg,file/nongchanpinxinxiTupian7.jpg','规格5','产品详情5','农民账号5','农民姓名5',99.9,5,99,5,5,'宇宙银河系地球5号'),(86,'2024-04-13 08:31:25','产品名称6','产品分类6','file/nongchanpinxinxiTupian6.jpg,file/nongchanpinxinxiTupian7.jpg,file/nongchanpinxinxiTupian8.jpg','规格6','产品详情6','农民账号6','农民姓名6',99.9,6,99,6,6,'宇宙银河系地球6号');
/*!40000 ALTER TABLE `nongchanpinxinxi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nongmin`
--

DROP TABLE IF EXISTS `nongmin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nongmin` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `nongminzhanghao` varchar(200) NOT NULL COMMENT '农民账号',
  `nongminmima` varchar(200) NOT NULL COMMENT '农民密码',
  `nongminxingming` varchar(200) NOT NULL COMMENT '农民姓名',
  `touxiang` longtext COMMENT '头像',
  `xingbie` varchar(200) DEFAULT NULL COMMENT '性别',
  `lianxidianhua` varchar(200) DEFAULT NULL COMMENT '联系电话',
  `shenfenzhenghao` varchar(200) DEFAULT NULL COMMENT '身份证号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `nongminzhanghao` (`nongminzhanghao`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COMMENT='农民';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nongmin`
--

LOCK TABLES `nongmin` WRITE;
/*!40000 ALTER TABLE `nongmin` DISABLE KEYS */;
INSERT INTO `nongmin` VALUES (51,'2024-04-13 08:31:25','农民账号1','123456','农民姓名1','file/nongminTouxiang1.jpg','男','19819881111','441622200101010001'),(52,'2024-04-13 08:31:25','农民账号2','123456','农民姓名2','file/nongminTouxiang2.jpg','男','19819881112','441622200202020002'),(53,'2024-04-13 08:31:25','农民账号3','123456','农民姓名3','file/nongminTouxiang3.jpg','男','19819881113','441622200303030003'),(54,'2024-04-13 08:31:25','农民账号4','123456','农民姓名4','file/nongminTouxiang4.jpg','男','19819881114','441622200404040004'),(55,'2024-04-13 08:31:25','农民账号5','123456','农民姓名5','file/nongminTouxiang5.jpg','男','19819881115','441622200505050005'),(56,'2024-04-13 08:31:25','农民账号6','123456','农民姓名6','file/nongminTouxiang6.jpg','男','19819881116','441622200606060006');
/*!40000 ALTER TABLE `nongmin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `orderid` varchar(200) NOT NULL COMMENT '订单编号',
  `tablename` varchar(200) DEFAULT NULL COMMENT '商品表名',
  `goodid` bigint(20) NOT NULL COMMENT '商品id',
  `goodname` varchar(200) DEFAULT NULL COMMENT '商品名称',
  `picture` longtext NOT NULL COMMENT '图片',
  `buynumber` int(11) DEFAULT NULL COMMENT '购买数量',
  `price` double DEFAULT NULL COMMENT '单价',
  `discountprice` double DEFAULT NULL COMMENT '折扣价',
  `total` double DEFAULT NULL COMMENT '总价',
  `discounttotal` double DEFAULT NULL COMMENT '折扣总价格',
  `type` varchar(200) DEFAULT NULL COMMENT '支付类型',
  `status` varchar(200) DEFAULT NULL COMMENT '订单状态',
  `address` varchar(200) DEFAULT NULL COMMENT '地址',
  `tel` varchar(200) DEFAULT NULL COMMENT '电话',
  `consignee` varchar(200) DEFAULT NULL COMMENT '收货人',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `logistics` longtext COMMENT '物流',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `nongminzhanghao` varchar(200) DEFAULT NULL COMMENT '商户名称',
  PRIMARY KEY (`id`),
  UNIQUE KEY `orderid` (`orderid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='商品订单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2024-04-13 08:43:11','202441316425698300771','nongchanpinxinxi',81,'产品名称1','file/nongchanpinxinxiTupian1.jpg',1,99.9,99.9,99.9,99.9,'1','已支付','北京','15021023622','11','','',47,'农民账号1'),(2,'2024-04-13 08:43:51','202441316433758213467','nongchanpinxinxi',81,'产品名称1','file/nongchanpinxinxiTupian1.jpg',1,99.9,99.9,99.9,99.9,'1','已支付','北京','15021023622','11','','',47,'农民账号1'),(3,'2024-04-13 08:46:53','202441316463957549338','nongchanpinxinxi',81,'产品名称1','file/nongchanpinxinxiTupian1.jpg',1,99.9,99.9,99.9,99.9,'1','未支付','北京','15201203201','111','','',48,'农民账号1'),(4,'2024-04-13 08:47:18','20244131647412537849','nongchanpinxinxi',81,'产品名称1','file/nongchanpinxinxiTupian1.jpg',1,99.9,99.9,99.9,99.9,'1','已退款','北京','15201203201','111','','<p>wfwerfgragfdgtrghrt </p>',48,'农民账号1');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `username` varchar(200) NOT NULL COMMENT '用户名',
  `password` varchar(200) NOT NULL COMMENT '密码',
  `role` varchar(200) DEFAULT NULL COMMENT '角色',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理员';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'2024-04-13 08:31:25','admin','admin','管理员');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yonghu`
--

DROP TABLE IF EXISTS `yonghu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yonghu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yonghuzhanghao` varchar(200) NOT NULL COMMENT '用户账号',
  `yonghumima` varchar(200) NOT NULL COMMENT '用户密码',
  `yonghuxingming` varchar(200) NOT NULL COMMENT '用户姓名',
  `touxiang` longtext COMMENT '头像',
  `xingbie` varchar(200) DEFAULT NULL COMMENT '性别',
  `dianhuahaoma` varchar(200) DEFAULT NULL COMMENT '电话号码',
  `money` double DEFAULT '0' COMMENT '余额',
  PRIMARY KEY (`id`),
  UNIQUE KEY `yonghuzhanghao` (`yonghuzhanghao`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COMMENT='用户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yonghu`
--

LOCK TABLES `yonghu` WRITE;
/*!40000 ALTER TABLE `yonghu` DISABLE KEYS */;
INSERT INTO `yonghu` VALUES (41,'2024-04-13 08:31:25','用户账号1','123456','用户姓名1','file/yonghuTouxiang1.jpg','男','19819881111',200),(42,'2024-04-13 08:31:25','用户账号2','123456','用户姓名2','file/yonghuTouxiang2.jpg','男','19819881112',200),(43,'2024-04-13 08:31:25','用户账号3','123456','用户姓名3','file/yonghuTouxiang3.jpg','男','19819881113',200),(44,'2024-04-13 08:31:25','用户账号4','123456','用户姓名4','file/yonghuTouxiang4.jpg','男','19819881114',200),(45,'2024-04-13 08:31:25','用户账号5','123456','用户姓名5','file/yonghuTouxiang5.jpg','男','19819881115',200),(46,'2024-04-13 08:31:25','用户账号6','123456','用户姓名6','file/yonghuTouxiang6.jpg','男','19819881116',200),(47,'2024-04-13 08:42:07','11','11','11','','男','15021460211',111110911.19999999),(48,'2024-04-13 08:45:58','111','111','111','file/微信截图_20240222155126-1712997952764.png','男','15201203200',111111);
/*!40000 ALTER TABLE `yonghu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yonghufankui`
--

DROP TABLE IF EXISTS `yonghufankui`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yonghufankui` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yonghuzhanghao` varchar(200) DEFAULT NULL COMMENT '用户账号',
  `yonghuxingming` varchar(200) DEFAULT NULL COMMENT '用户姓名',
  `dianhuahaoma` varchar(200) DEFAULT NULL COMMENT '电话号码',
  `fankuixiangqing` longtext COMMENT '反馈详情',
  `fankuishijian` datetime DEFAULT NULL COMMENT '反馈时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8 COMMENT='用户反馈';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yonghufankui`
--

LOCK TABLES `yonghufankui` WRITE;
/*!40000 ALTER TABLE `yonghufankui` DISABLE KEYS */;
INSERT INTO `yonghufankui` VALUES (131,'2024-04-13 08:31:25','用户账号1','用户姓名1','电话号码1','反馈详情1','2024-04-13 16:31:25'),(132,'2024-04-13 08:31:25','用户账号2','用户姓名2','电话号码2','反馈详情2','2024-04-13 16:31:25'),(133,'2024-04-13 08:31:25','用户账号3','用户姓名3','电话号码3','反馈详情3','2024-04-13 16:31:25'),(134,'2024-04-13 08:31:25','用户账号4','用户姓名4','电话号码4','反馈详情4','2024-04-13 16:31:25'),(135,'2024-04-13 08:31:25','用户账号5','用户姓名5','电话号码5','反馈详情5','2024-04-13 16:31:25'),(136,'2024-04-13 08:31:25','用户账号6','用户姓名6','电话号码6','反馈详情6','2024-04-13 16:31:25');
/*!40000 ALTER TABLE `yonghufankui` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-13 18:30:24

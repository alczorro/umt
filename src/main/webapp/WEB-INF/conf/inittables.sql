-- For UMT version 8.1
-- Based on the schema exported from the online system on 9 April 2016
-- nankai@cnic.ac.cn 10Apr2016

-- WRT token tables, see "inittokentables.sql"

-- MySQL dump 10.13  Distrib 5.1.69, for redhat-linux-gnu (x86_64)
--
-- Host: localhost    Database: umtpassport
-- ------------------------------------------------------
-- Server version	5.1.69-log

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
-- Table structure for table `_umt_passchangetoken`
--

DROP TABLE IF EXISTS `_umt_passchangetoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_umt_passchangetoken` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5449 DEFAULT CHARSET=utf8 ROW_FORMAT=REDUNDANT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `umt_access_ips`
--

DROP TABLE IF EXISTS `umt_access_ips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `umt_access_ips` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `scope` enum('A','B') NOT NULL DEFAULT 'B',
  `remark` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `umt_app_access`
--

DROP TABLE IF EXISTS `umt_app_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `umt_app_access` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `app_name` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74619 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `umt_app_ldap`
--

DROP TABLE IF EXISTS `umt_app_ldap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `umt_app_ldap` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rdn` varchar(255) DEFAULT NULL,
  `clientName` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `applicant` varchar(255) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `contactInfo` varchar(255) DEFAULT NULL,
  `appStatus` varchar(255) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `priv` enum('open','needApply','closed') DEFAULT 'open',
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `userCstnetId` varchar(255) DEFAULT NULL,
  `userName` varchar(255) DEFAULT NULL,
  `ldapPassword` varchar(255) DEFAULT NULL,
  `pubScope` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT 'ldap',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ldap_rdn_unique` (`rdn`) USING HASH
) ENGINE=InnoDB AUTO_INCREMENT=1026 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `umt_app_secret`
--

DROP TABLE IF EXISTS `umt_app_secret`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `umt_app_secret` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `app_id` varchar(255) DEFAULT NULL,
  `secret_type` enum('oauth','ldap','wifi') DEFAULT NULL,
  `secret` varchar(255) DEFAULT NULL,
  `userName` varchar(255) DEFAULT NULL,
  `userCstnetId` varchar(255) DEFAULT NULL,
  `userStatus` enum('accept','apply') DEFAULT NULL,
  `userLdapName` varchar(255) DEFAULT NULL,
  `hashedSecret` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1125 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `umt_application`
--

DROP TABLE IF EXISTS `umt_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `umt_application` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `keyid` int(11) DEFAULT NULL,
  `serverType` varchar(255) DEFAULT NULL,
  `description` text,
  `allowOperate` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `umt_certificate`
--

DROP TABLE IF EXISTS `umt_certificate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `umt_certificate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dn` varchar(255) NOT NULL DEFAULT '',
  `cstnetId` varchar(255) NOT NULL DEFAULT '',
  `regist_time` datetime DEFAULT NULL,
  `pub_cert` text,
  `full_cert` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cstnetId` (`cstnetId`),
  UNIQUE KEY `dn` (`dn`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `umt_common_use_geo`
--

DROP TABLE IF EXISTS `umt_common_use_geo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `umt_common_use_geo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=334 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `umt_email_template`
--

DROP TABLE IF EXISTS `umt_email_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `umt_email_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `target` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `content` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `umt_email_template_target_unique` (`target`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `umt_log`
--

DROP TABLE IF EXISTS `umt_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `umt_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appname` varchar(255) DEFAULT NULL,
  `eventType` varchar(255) DEFAULT NULL,
  `appurl` varchar(255) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `ipaddress` varchar(128) DEFAULT NULL,
  `occurTime` datetime DEFAULT NULL,
  `browserType` varchar(255) DEFAULT NULL,
  `remark` text,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `send_warn_email` enum('true','false') DEFAULT 'false',
  `unit_name` varchar(255) DEFAULT NULL,
  `is_cstnet_unit` enum('true','false') DEFAULT 'false',
  `from_dip` enum('true','false') DEFAULT 'false',
  PRIMARY KEY (`id`),
  KEY `topTenIndex` (`eventType`,`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `umt_login_name`
--

DROP TABLE IF EXISTS `umt_login_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `umt_login_name` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `login_name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `auth_by` varchar(255) DEFAULT NULL,
  `tmp_login_name` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `umt_login_name_login_name_index` (`login_name`),
  KEY `umt_login_name_uid_index` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=458373 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `umt_oauth_client`
--

DROP TABLE IF EXISTS `umt_oauth_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `umt_oauth_client` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` varchar(45) NOT NULL,
  `client_secret` varchar(45) NOT NULL,
  `description` text,
  `scope` varchar(45) DEFAULT NULL,
  `redirect_uri` varchar(255) NOT NULL,
  `status` varchar(45) NOT NULL,
  `client_name` varchar(45) DEFAULT NULL,
  `applicant` varchar(45) DEFAULT NULL,
  `application_time` varchar(45) DEFAULT NULL,
  `applicant_phone` varchar(45) DEFAULT NULL,
  `contact_info` varchar(45) DEFAULT NULL,
  `third_party` varchar(45) DEFAULT NULL,
  `client_website` varchar(255) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `app_type` varchar(100) DEFAULT 'webapp',
  `pwd_type` varchar(10) DEFAULT 'none',
  `need_org_info` int(11) DEFAULT '0',
  `logo_100` int(11) DEFAULT NULL,
  `logo_64` int(11) DEFAULT NULL,
  `logo_32` int(11) DEFAULT NULL,
  `logo_16` int(11) DEFAULT NULL,
  `default_logo` int(11) DEFAULT NULL,
  `logo_custom` varchar(255) DEFAULT NULL,
  `enable_app_pwd` enum('yes','no') DEFAULT NULL,
  `compulsion_strong_pwd` enum('true','false') DEFAULT 'false',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=346 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `umt_org`
--

DROP TABLE IF EXISTS `umt_org`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `umt_org` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `org_symbol` varchar(255) NOT NULL,
  `org_name` varchar(255) DEFAULT NULL,
  `is_cas` int(11) DEFAULT '0',
  `is_coremail` int(11) DEFAULT '0',
  `type` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=295 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `umt_org_domain`
--

DROP TABLE IF EXISTS `umt_org_domain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `umt_org_domain` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `org_id` varchar(255) DEFAULT NULL,
  `org_domain` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `org_domain_UNIQUE` (`org_domain`)
) ENGINE=InnoDB AUTO_INCREMENT=361 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `umt_pubkeys`
--

DROP TABLE IF EXISTS `umt_pubkeys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `umt_pubkeys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pubkey` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=REDUNDANT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `umt_regist_log`
--

DROP TABLE IF EXISTS `umt_regist_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `umt_regist_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `occur_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `user_agent` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4583 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `umt_requests`
--

DROP TABLE IF EXISTS `umt_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `umt_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `trueName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `phoneNumber` varchar(255) DEFAULT NULL,
  `orgnization` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `operator` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=REDUNDANT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `umt_role`
--

DROP TABLE IF EXISTS `umt_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `umt_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rolename` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rolename` (`rolename`(1))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=REDUNDANT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `umt_role_member`
--

DROP TABLE IF EXISTS `umt_role_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `umt_role_member` (
  `roleid` int(11) NOT NULL DEFAULT '0',
  `userid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`roleid`,`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=REDUNDANT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `umt_runtime_prop`
--

DROP TABLE IF EXISTS `umt_runtime_prop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `umt_runtime_prop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prop_name` varchar(255) DEFAULT NULL,
  `prop_value` text,
  `last_modify_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `umt_session`
--

DROP TABLE IF EXISTS `umt_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `umt_session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL DEFAULT '',
  `appname` varchar(255) NOT NULL DEFAULT '',
  `sessionid` varchar(64) NOT NULL DEFAULT '',
  `logouturl` varchar(255) DEFAULT NULL,
  `logintime` datetime DEFAULT NULL,
  `lastupdate` datetime DEFAULT NULL,
  `appType` varchar(64) DEFAULT NULL,
  `userip` varchar(255) DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1037842 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `umt_third_auth`
--

DROP TABLE IF EXISTS `umt_third_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `umt_third_auth` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `clientId` varchar(255) DEFAULT NULL,
  `secret` varchar(255) DEFAULT NULL,
  `serverUrl` varchar(255) DEFAULT NULL,
  `theme` varchar(255) DEFAULT NULL,
  `showInLogin` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `umt_third_party_bind`
--

DROP TABLE IF EXISTS `umt_third_party_bind`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `umt_third_party_bind` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `open_id` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `true_name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `openid` (`open_id`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=5909 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `umt_ticket`
--

DROP TABLE IF EXISTS `umt_ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `umt_ticket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `random` varchar(255) DEFAULT NULL,
  `sessionid` varchar(255) DEFAULT NULL,
  `extra` text,
  `userip` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `umt_unit_domain`
--

DROP TABLE IF EXISTS `umt_unit_domain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `umt_unit_domain` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `rootDomain` varchar(100) DEFAULT NULL,
  `mailDomain` varchar(1000) DEFAULT NULL,
  `symbol` varchar(100) DEFAULT NULL,
  `enName` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=150 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `umt_user`
--

DROP TABLE IF EXISTS `umt_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `umt_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cstnet_id` varchar(255) DEFAULT NULL,
  `true_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `security_email` varchar(255) DEFAULT NULL,
  `secondary_email` varchar(255) DEFAULT NULL,
  `umt_id` int(11) DEFAULT NULL,
  `account_status` enum('locked','normal') DEFAULT 'normal',
  `send_geo_email_switch` enum('true','false') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `umt_user_password_index` (`password`)
) ENGINE=InnoDB AUTO_INCREMENT=457443 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

-- Dump completed on 2016-04-09 15:27:24

--
-- Initial Records
--

INSERT INTO `umt_role` VALUES ('1', 'admin', '管理员');
INSERT INTO `umt_role_member` VALUES ('1', '1');
INSERT INTO `umt_access_ips` VALUES(1,1,'127.0.0.1','B','to check later');
INSERT INTO `umt_user`(`id`,`umt_id`,`cstnet_id`,`true_name`,`password`,`create_time`,`type`) VALUES (1,'10000001','admin@root.umt','admin','SO/EhR4VlAr11HfTwM6ZIRpwo74=',now(),'umt');
-- password is 1q2w3e4r
INSERT INTO `umt_login_name` VALUES ('1', '1', 'admin@root.umt', 'primary',null,null,'active');

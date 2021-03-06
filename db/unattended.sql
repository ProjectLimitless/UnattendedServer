/*
SQLyog Community v12.2.6 (64 bit)
MySQL - 10.1.19-MariaDB : Database - unattended
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`unattended` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `unattended`;

/*Table structure for table `update_log` */

DROP TABLE IF EXISTS `update_log`;

CREATE TABLE `update_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `event_type` int(3) unsigned NOT NULL,
  `event_result` int(3) unsigned NOT NULL,
  `app_id` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `track` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `current_version` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `update_version` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `bootid` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `trace_id` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `update_log` */

/*Table structure for table `updates` */

DROP TABLE IF EXISTS `updates`;

CREATE TABLE `updates` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `app_id` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `track` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'stable',
  `version` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0.0.1',
  `filename` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `download_location` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `size_in_bytes` int(11) unsigned NOT NULL,
  `sha256_hash` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `upgrade_count` int(11) unsigned DEFAULT '0',
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `is_active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `updates` */

insert  into `updates`(`id`,`app_id`,`track`,`version`,`filename`,`download_location`,`size_in_bytes`,`sha256_hash`,`upgrade_count`,`date_created`,`date_updated`,`is_active`) values 
(1,'limitless.core','stable','1.0.0.1','sampleapp.v1.0.0.1.zip','http://unattendedserver.local/packages/sampleapp.v1.0.0.1.zip',2522,'4fc21f834edfe576babd0f9e9eb0fe2327af9c256d7209550c9757c5e7efc47a',0,'2016-09-06 20:56:23','2016-09-06 20:56:26',1);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `ga_secret` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`email`,`password`,`first_name`,`last_name`,`ga_secret`,`date_created`) values 
(1,'admin@example.com','','Unattended','Admin','','2016-09-05 21:42:42');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

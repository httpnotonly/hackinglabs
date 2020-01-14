CREATE DATABASE  IF NOT EXISTS `atutor` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `atutor`;
-- MySQL dump 10.13  Distrib 8.0.19, for macos10.15 (x86_64)
--
-- Host: 0.0.0.0    Database: atutor
-- ------------------------------------------------------
-- Server version	5.6.46

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `AT_admin_log`
--

DROP TABLE IF EXISTS `AT_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_admin_log` (
  `login` varchar(30) NOT NULL DEFAULT '',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `operation` varchar(20) NOT NULL DEFAULT '',
  `table` varchar(30) NOT NULL DEFAULT '',
  `num_affected` tinyint(3) NOT NULL DEFAULT '0',
  `details` text,
  KEY `login` (`login`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_admin_log`
--

LOCK TABLES `AT_admin_log` WRITE;
/*!40000 ALTER TABLE `AT_admin_log` DISABLE KEYS */;
INSERT INTO `AT_admin_log` VALUES ('admin','2020-01-14 12:08:02','1','admins',1,'UPDATE AT_admins SET last_login=NOW() WHERE login=\\\'admin\\\''),('teacher','2020-01-14 12:09:14','4','courses',1,'REPLACE INTO AT_courses \\n                SET \\n                course_id=0, \\n                member_id=\\\'1\\\', \\n                access=\\\'public\\\', \\n                title=\\\'First Course\\\', \\n                description=\\\'Not bad, not good\\\', \\n                course_dir_name=\\\'\\\', \\n                cat_id=0, \\n                content_packaging=\\\'top\\\', \\n                notify=0, \\n                hide=0, \\n                max_quota=-2, max_file_size=-3,\\n                primary_language=\\\'en\\\',\\n                created_date=\\\'2020-01-14 13:08:28\\\',\\n                rss=0,\\n                copyright=\\\'\\\',\\n                icon=\\\'brain2.jpg\\\',\\n                banner=\\\'\\\',\\n                release_date=\\\'0000-00-00 00:00:00\\\', \\n                end_date=\\\'0000-00-00 00:00:00\\\' \\n                ,home_links=\\\'mods/_standard/file_storage/index.php|mods/_standard/tests/my_tests.php|mods/_standard/tracker/my_stats.php|mods/_standard/directory/directory.php\\\', main_links=\\\'mods/_standard/forums/forum/list.php|mods/_core/glossary/index.php|mods/_standard/file_storage/index.php|mods/_standard/social/index.php|mods/_standard/sitemap/sitemap.php|mods/_standard/photos/index.php\\\', side_menu=\\\'social|menu_menu|related_topics|users_online|glossary|search|poll|posts\\\''),('teacher','2020-01-14 12:09:14','4','course_enrollment',1,'REPLACE INTO AT_course_enrollment VALUES (1, 1, \\\'y\\\', 0, \\\'Instructor\\\', 0)'),('admin','2020-01-14 12:58:39','1','admins',1,'UPDATE AT_admins SET last_login=NOW() WHERE login=\\\'admin\\\''),('admin','2020-01-14 13:16:47','1','admins',1,'UPDATE AT_admins SET last_login=NOW() WHERE login=\\\'admin\\\'');
/*!40000 ALTER TABLE `AT_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_admins`
--

DROP TABLE IF EXISTS `AT_admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_admins` (
  `login` varchar(30) NOT NULL DEFAULT '',
  `password` varchar(40) NOT NULL DEFAULT '',
  `real_name` varchar(120) NOT NULL DEFAULT '',
  `email` varchar(50) NOT NULL DEFAULT '',
  `language` varchar(5) NOT NULL DEFAULT '',
  `privileges` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `last_login` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`login`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_admins`
--

LOCK TABLES `AT_admins` WRITE;
/*!40000 ALTER TABLE `AT_admins` DISABLE KEYS */;
INSERT INTO `AT_admins` VALUES ('admin','f865b53623b121fd34ee5426c792e5c33af8c227','','admin@vulncorp.local','en',1,'2020-01-14 13:16:47');
/*!40000 ALTER TABLE `AT_admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_assignments`
--

DROP TABLE IF EXISTS `AT_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_assignments` (
  `assignment_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `title` varchar(240) NOT NULL DEFAULT '',
  `assign_to` mediumint(8) unsigned DEFAULT '0',
  `date_due` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_cutoff` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `multi_submit` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`assignment_id`),
  KEY `course_id` (`course_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_assignments`
--

LOCK TABLES `AT_assignments` WRITE;
/*!40000 ALTER TABLE `AT_assignments` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_auto_enroll`
--

DROP TABLE IF EXISTS `AT_auto_enroll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_auto_enroll` (
  `auto_enroll_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `associate_string` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`auto_enroll_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_auto_enroll`
--

LOCK TABLES `AT_auto_enroll` WRITE;
/*!40000 ALTER TABLE `AT_auto_enroll` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_auto_enroll` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_auto_enroll_courses`
--

DROP TABLE IF EXISTS `AT_auto_enroll_courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_auto_enroll_courses` (
  `auto_enroll_courses_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `auto_enroll_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `course_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`auto_enroll_courses_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_auto_enroll_courses`
--

LOCK TABLES `AT_auto_enroll_courses` WRITE;
/*!40000 ALTER TABLE `AT_auto_enroll_courses` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_auto_enroll_courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_backups`
--

DROP TABLE IF EXISTS `AT_backups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_backups` (
  `backup_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `description` text,
  `file_size` int(10) unsigned NOT NULL DEFAULT '0',
  `system_file_name` varchar(50) NOT NULL DEFAULT '',
  `file_name` text,
  `contents` text,
  PRIMARY KEY (`backup_id`),
  KEY `course_id` (`course_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_backups`
--

LOCK TABLES `AT_backups` WRITE;
/*!40000 ALTER TABLE `AT_backups` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_backups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_basiclti_content`
--

DROP TABLE IF EXISTS `AT_basiclti_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_basiclti_content` (
  `id` mediumint(10) NOT NULL AUTO_INCREMENT,
  `content_id` mediumint(10) NOT NULL DEFAULT '0',
  `course_id` mediumint(10) NOT NULL DEFAULT '0',
  `toolid` varchar(32) NOT NULL DEFAULT '',
  `preferheight` mediumint(4) NOT NULL DEFAULT '0',
  `sendname` mediumint(1) NOT NULL DEFAULT '0',
  `sendemailaddr` mediumint(1) NOT NULL DEFAULT '0',
  `gradebook_test_id` mediumint(10) NOT NULL DEFAULT '0',
  `allowroster` mediumint(1) NOT NULL DEFAULT '0',
  `allowsetting` mediumint(1) NOT NULL DEFAULT '0',
  `customparameters` text,
  `launchinpopup` mediumint(1) NOT NULL DEFAULT '0',
  `debuglaunch` mediumint(1) NOT NULL DEFAULT '0',
  `placementsecret` varchar(1023) DEFAULT NULL,
  `timeplacementsecret` mediumint(10) NOT NULL DEFAULT '0',
  `oldplacementsecret` varchar(1023) DEFAULT NULL,
  `setting` text,
  `xmlimport` text,
  PRIMARY KEY (`id`,`course_id`,`content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_basiclti_content`
--

LOCK TABLES `AT_basiclti_content` WRITE;
/*!40000 ALTER TABLE `AT_basiclti_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_basiclti_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_basiclti_tools`
--

DROP TABLE IF EXISTS `AT_basiclti_tools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_basiclti_tools` (
  `id` mediumint(10) NOT NULL AUTO_INCREMENT,
  `toolid` varchar(32) NOT NULL,
  `course_id` mediumint(10) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `timecreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `timemodified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `toolurl` varchar(1023) NOT NULL,
  `resourcekey` varchar(1023) NOT NULL,
  `password` varchar(1023) NOT NULL,
  `preferheight` mediumint(4) NOT NULL DEFAULT '0',
  `allowpreferheight` mediumint(1) NOT NULL DEFAULT '0',
  `sendname` mediumint(1) NOT NULL DEFAULT '0',
  `sendemailaddr` mediumint(1) NOT NULL DEFAULT '0',
  `acceptgrades` mediumint(1) NOT NULL DEFAULT '0',
  `allowroster` mediumint(1) NOT NULL DEFAULT '0',
  `allowsetting` mediumint(1) NOT NULL DEFAULT '0',
  `allowcustomparameters` mediumint(1) NOT NULL DEFAULT '0',
  `customparameters` text,
  `organizationid` varchar(64) DEFAULT NULL,
  `organizationurl` varchar(255) DEFAULT NULL,
  `organizationdescr` varchar(255) DEFAULT NULL,
  `launchinpopup` mediumint(1) NOT NULL DEFAULT '0',
  `debuglaunch` mediumint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`toolid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_basiclti_tools`
--

LOCK TABLES `AT_basiclti_tools` WRITE;
/*!40000 ALTER TABLE `AT_basiclti_tools` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_basiclti_tools` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_blog_posts`
--

DROP TABLE IF EXISTS `AT_blog_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_blog_posts` (
  `post_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `owner_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `owner_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `private` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `num_comments` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `body` text,
  PRIMARY KEY (`post_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_blog_posts`
--

LOCK TABLES `AT_blog_posts` WRITE;
/*!40000 ALTER TABLE `AT_blog_posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_blog_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_blog_posts_comments`
--

DROP TABLE IF EXISTS `AT_blog_posts_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_blog_posts_comments` (
  `comment_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `member_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `private` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `comment` text,
  PRIMARY KEY (`comment_id`),
  KEY `post_id` (`post_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_blog_posts_comments`
--

LOCK TABLES `AT_blog_posts_comments` WRITE;
/*!40000 ALTER TABLE `AT_blog_posts_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_blog_posts_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_blog_subscription`
--

DROP TABLE IF EXISTS `AT_blog_subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_blog_subscription` (
  `group_id` mediumint(9) NOT NULL,
  `member_id` mediumint(9) NOT NULL,
  PRIMARY KEY (`group_id`,`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_blog_subscription`
--

LOCK TABLES `AT_blog_subscription` WRITE;
/*!40000 ALTER TABLE `AT_blog_subscription` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_blog_subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_calendar_bookmark`
--

DROP TABLE IF EXISTS `AT_calendar_bookmark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_calendar_bookmark` (
  `memberid` int(11) DEFAULT NULL,
  `ownerid` int(8) DEFAULT NULL,
  `courseid` int(8) DEFAULT NULL,
  `calname` varchar(256) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_calendar_bookmark`
--

LOCK TABLES `AT_calendar_bookmark` WRITE;
/*!40000 ALTER TABLE `AT_calendar_bookmark` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_calendar_bookmark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_calendar_events`
--

DROP TABLE IF EXISTS `AT_calendar_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_calendar_events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(256) DEFAULT NULL,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `allDay` varchar(20) DEFAULT NULL,
  `userid` int(8) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_calendar_events`
--

LOCK TABLES `AT_calendar_events` WRITE;
/*!40000 ALTER TABLE `AT_calendar_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_calendar_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_calendar_google_sync`
--

DROP TABLE IF EXISTS `AT_calendar_google_sync`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_calendar_google_sync` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(256) DEFAULT NULL,
  `userid` int(8) DEFAULT NULL,
  `calids` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_calendar_google_sync`
--

LOCK TABLES `AT_calendar_google_sync` WRITE;
/*!40000 ALTER TABLE `AT_calendar_google_sync` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_calendar_google_sync` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_calendar_notification`
--

DROP TABLE IF EXISTS `AT_calendar_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_calendar_notification` (
  `memberid` int(11) DEFAULT NULL,
  `status` int(8) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_calendar_notification`
--

LOCK TABLES `AT_calendar_notification` WRITE;
/*!40000 ALTER TABLE `AT_calendar_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_calendar_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_config`
--

DROP TABLE IF EXISTS `AT_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_config` (
  `name` char(30) NOT NULL DEFAULT '',
  `value` text,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_config`
--

LOCK TABLES `AT_config` WRITE;
/*!40000 ALTER TABLE `AT_config` DISABLE KEYS */;
INSERT INTO `AT_config` VALUES ('encyclopedia','http://www.wikipedia.org'),('dictionary','http://dictionary.reference.com/'),('thesaurus','http://thesaurus.reference.com/'),('atlas','http://maps.google.ca/'),('calculator','http://www.calculateforfree.com/'),('note_taking','http://www.aypwip.org/webnote/'),('abacas','http://www.mandarintools.com/abacus.html'),('pa_max_memory_per_member','50'),('transformable_uri','http://acontent.atutorspaces.com/'),('transformable_web_service_id','987f65dddffa43abd43b30426e6c7c1c'),('transformable_oauth_expire','93600'),('home_url','https://www.atutorspaces.com'),('custom_logo_foot_enabled','1'),('site_name','Course Server'),('contact_email','admin@vulncorp.local'),('set_utf8','1'),('session_path','/'),('db_size','487280'),('du_size','40816'),('db_size_ttl','1579090083'),('mysql_group_concat_max_len','1024');
/*!40000 ALTER TABLE `AT_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_content`
--

DROP TABLE IF EXISTS `AT_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_content` (
  `content_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `content_parent_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ordering` mediumint(8) NOT NULL DEFAULT '0',
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `revision` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `formatting` tinyint(4) NOT NULL DEFAULT '0',
  `release_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `keywords` text,
  `content_path` text,
  `title` varchar(255) NOT NULL,
  `text` text,
  `head` text,
  `use_customized_head` tinyint(4) NOT NULL,
  `test_message` text,
  `allow_test_export` tinyint(1) unsigned NOT NULL,
  `content_type` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`content_id`),
  KEY `course_id` (`course_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_content`
--

LOCK TABLES `AT_content` WRITE;
/*!40000 ALTER TABLE `AT_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_content_forums_assoc`
--

DROP TABLE IF EXISTS `AT_content_forums_assoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_content_forums_assoc` (
  `content_id` int(10) unsigned NOT NULL,
  `forum_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`content_id`,`forum_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_content_forums_assoc`
--

LOCK TABLES `AT_content_forums_assoc` WRITE;
/*!40000 ALTER TABLE `AT_content_forums_assoc` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_content_forums_assoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_content_prerequisites`
--

DROP TABLE IF EXISTS `AT_content_prerequisites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_content_prerequisites` (
  `content_id` mediumint(9) NOT NULL,
  `type` varchar(50) NOT NULL DEFAULT '',
  `item_id` mediumint(9) NOT NULL,
  PRIMARY KEY (`content_id`,`type`,`item_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_content_prerequisites`
--

LOCK TABLES `AT_content_prerequisites` WRITE;
/*!40000 ALTER TABLE `AT_content_prerequisites` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_content_prerequisites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_content_tests_assoc`
--

DROP TABLE IF EXISTS `AT_content_tests_assoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_content_tests_assoc` (
  `content_id` int(10) unsigned NOT NULL,
  `test_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`content_id`,`test_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_content_tests_assoc`
--

LOCK TABLES `AT_content_tests_assoc` WRITE;
/*!40000 ALTER TABLE `AT_content_tests_assoc` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_content_tests_assoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_course_access`
--

DROP TABLE IF EXISTS `AT_course_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_course_access` (
  `password` char(8) NOT NULL,
  `course_id` mediumint(8) unsigned NOT NULL,
  `expiry_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `enabled` tinyint(4) NOT NULL,
  PRIMARY KEY (`password`),
  UNIQUE KEY `course_id` (`course_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_course_access`
--

LOCK TABLES `AT_course_access` WRITE;
/*!40000 ALTER TABLE `AT_course_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_course_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_course_cats`
--

DROP TABLE IF EXISTS `AT_course_cats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_course_cats` (
  `cat_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(255) NOT NULL,
  `cat_parent` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `theme` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`cat_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_course_cats`
--

LOCK TABLES `AT_course_cats` WRITE;
/*!40000 ALTER TABLE `AT_course_cats` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_course_cats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_course_enrollment`
--

DROP TABLE IF EXISTS `AT_course_enrollment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_course_enrollment` (
  `member_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `course_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `approved` enum('y','n','a') NOT NULL DEFAULT 'n',
  `privileges` int(10) unsigned NOT NULL DEFAULT '0',
  `role` varchar(35) NOT NULL DEFAULT '',
  `last_cid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`member_id`,`course_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_course_enrollment`
--

LOCK TABLES `AT_course_enrollment` WRITE;
/*!40000 ALTER TABLE `AT_course_enrollment` DISABLE KEYS */;
INSERT INTO `AT_course_enrollment` VALUES (1,1,'y',0,'Instructor',0);
/*!40000 ALTER TABLE `AT_course_enrollment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_course_stats`
--

DROP TABLE IF EXISTS `AT_course_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_course_stats` (
  `course_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `login_date` date NOT NULL DEFAULT '0000-00-00',
  `guests` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `members` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`course_id`,`login_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_course_stats`
--

LOCK TABLES `AT_course_stats` WRITE;
/*!40000 ALTER TABLE `AT_course_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_course_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_courses`
--

DROP TABLE IF EXISTS `AT_courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_courses` (
  `course_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `cat_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `content_packaging` enum('none','top','all') NOT NULL DEFAULT 'top',
  `access` enum('public','protected','private') NOT NULL DEFAULT 'public',
  `created_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `title` varchar(255) NOT NULL,
  `description` text,
  `course_dir_name` varchar(255) NOT NULL,
  `notify` tinyint(4) NOT NULL DEFAULT '0',
  `max_quota` varchar(30) NOT NULL DEFAULT '',
  `max_file_size` varchar(30) NOT NULL DEFAULT '',
  `hide` tinyint(4) NOT NULL DEFAULT '0',
  `copyright` text,
  `primary_language` varchar(5) NOT NULL DEFAULT '',
  `rss` tinyint(4) NOT NULL DEFAULT '0',
  `icon` varchar(75) NOT NULL DEFAULT '',
  `home_links` text,
  `main_links` text,
  `side_menu` varchar(255) NOT NULL DEFAULT '',
  `release_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `banner` text,
  `home_view` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`course_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_courses`
--

LOCK TABLES `AT_courses` WRITE;
/*!40000 ALTER TABLE `AT_courses` DISABLE KEYS */;
INSERT INTO `AT_courses` VALUES (1,1,0,'top','public','2020-01-14 13:08:28','First Course','Not bad, not good','',0,'-2','-3',0,'','en',0,'brain2.jpg','mods/_standard/file_storage/index.php|mods/_standard/tests/my_tests.php|mods/_standard/tracker/my_stats.php|mods/_standard/directory/directory.php','mods/_standard/forums/forum/list.php|mods/_core/glossary/index.php|mods/_standard/file_storage/index.php|mods/_standard/social/index.php|mods/_standard/sitemap/sitemap.php|mods/_standard/photos/index.php','social|menu_menu|related_topics|users_online|glossary|search|poll|posts','0000-00-00 00:00:00','0000-00-00 00:00:00','',1);
/*!40000 ALTER TABLE `AT_courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_external_resources`
--

DROP TABLE IF EXISTS `AT_external_resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_external_resources` (
  `resource_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `author` varchar(150) NOT NULL,
  `publisher` varchar(150) NOT NULL,
  `date` varchar(20) NOT NULL DEFAULT '',
  `comments` text,
  `id` varchar(50) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`resource_id`),
  KEY `course_id` (`course_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_external_resources`
--

LOCK TABLES `AT_external_resources` WRITE;
/*!40000 ALTER TABLE `AT_external_resources` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_external_resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_faq_entries`
--

DROP TABLE IF EXISTS `AT_faq_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_faq_entries` (
  `entry_id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `topic_id` mediumint(8) NOT NULL DEFAULT '0',
  `revised_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `approved` tinyint(4) NOT NULL DEFAULT '0',
  `question` text,
  `answer` text,
  PRIMARY KEY (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_faq_entries`
--

LOCK TABLES `AT_faq_entries` WRITE;
/*!40000 ALTER TABLE `AT_faq_entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_faq_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_faq_topics`
--

DROP TABLE IF EXISTS `AT_faq_topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_faq_topics` (
  `topic_id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `course_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `name` text,
  PRIMARY KEY (`topic_id`),
  KEY `course_id` (`course_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_faq_topics`
--

LOCK TABLES `AT_faq_topics` WRITE;
/*!40000 ALTER TABLE `AT_faq_topics` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_faq_topics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_feeds`
--

DROP TABLE IF EXISTS `AT_feeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_feeds` (
  `feed_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`feed_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_feeds`
--

LOCK TABLES `AT_feeds` WRITE;
/*!40000 ALTER TABLE `AT_feeds` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_feeds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_fha_student_tools`
--

DROP TABLE IF EXISTS `AT_fha_student_tools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_fha_student_tools` (
  `course_id` mediumint(8) unsigned NOT NULL,
  `links` text,
  `home_view` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`course_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_fha_student_tools`
--

LOCK TABLES `AT_fha_student_tools` WRITE;
/*!40000 ALTER TABLE `AT_fha_student_tools` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_fha_student_tools` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_file_storage_groups`
--

DROP TABLE IF EXISTS `AT_file_storage_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_file_storage_groups` (
  `group_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_file_storage_groups`
--

LOCK TABLES `AT_file_storage_groups` WRITE;
/*!40000 ALTER TABLE `AT_file_storage_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_file_storage_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_files`
--

DROP TABLE IF EXISTS `AT_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_files` (
  `file_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `owner_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `owner_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `member_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `folder_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `parent_file_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `num_comments` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `num_revisions` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `file_name` varchar(80) NOT NULL DEFAULT '',
  `file_size` int(11) NOT NULL DEFAULT '0',
  `description` text,
  PRIMARY KEY (`file_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_files`
--

LOCK TABLES `AT_files` WRITE;
/*!40000 ALTER TABLE `AT_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_files_comments`
--

DROP TABLE IF EXISTS `AT_files_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_files_comments` (
  `comment_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `file_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `member_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `comment` text,
  PRIMARY KEY (`comment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_files_comments`
--

LOCK TABLES `AT_files_comments` WRITE;
/*!40000 ALTER TABLE `AT_files_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_files_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_folders`
--

DROP TABLE IF EXISTS `AT_folders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_folders` (
  `folder_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `parent_folder_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `owner_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `owner_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `title` varchar(120) NOT NULL DEFAULT '',
  PRIMARY KEY (`folder_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_folders`
--

LOCK TABLES `AT_folders` WRITE;
/*!40000 ALTER TABLE `AT_folders` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_forums`
--

DROP TABLE IF EXISTS `AT_forums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_forums` (
  `forum_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(240) NOT NULL DEFAULT '',
  `description` text,
  `num_topics` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `num_posts` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `last_post` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `mins_to_edit` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`forum_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_forums`
--

LOCK TABLES `AT_forums` WRITE;
/*!40000 ALTER TABLE `AT_forums` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_forums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_forums_accessed`
--

DROP TABLE IF EXISTS `AT_forums_accessed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_forums_accessed` (
  `post_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `member_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `last_accessed` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `subscribe` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`post_id`,`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_forums_accessed`
--

LOCK TABLES `AT_forums_accessed` WRITE;
/*!40000 ALTER TABLE `AT_forums_accessed` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_forums_accessed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_forums_courses`
--

DROP TABLE IF EXISTS `AT_forums_courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_forums_courses` (
  `forum_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `course_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`forum_id`,`course_id`),
  KEY `course_id` (`course_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_forums_courses`
--

LOCK TABLES `AT_forums_courses` WRITE;
/*!40000 ALTER TABLE `AT_forums_courses` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_forums_courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_forums_groups`
--

DROP TABLE IF EXISTS `AT_forums_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_forums_groups` (
  `forum_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `group_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`forum_id`,`group_id`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_forums_groups`
--

LOCK TABLES `AT_forums_groups` WRITE;
/*!40000 ALTER TABLE `AT_forums_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_forums_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_forums_subscriptions`
--

DROP TABLE IF EXISTS `AT_forums_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_forums_subscriptions` (
  `forum_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `member_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`forum_id`,`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_forums_subscriptions`
--

LOCK TABLES `AT_forums_subscriptions` WRITE;
/*!40000 ALTER TABLE `AT_forums_subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_forums_subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_forums_threads`
--

DROP TABLE IF EXISTS `AT_forums_threads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_forums_threads` (
  `post_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `member_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `forum_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `last_comment` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `num_comments` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(255) NOT NULL,
  `body` text,
  `date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `sticky` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`post_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_forums_threads`
--

LOCK TABLES `AT_forums_threads` WRITE;
/*!40000 ALTER TABLE `AT_forums_threads` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_forums_threads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_glossary`
--

DROP TABLE IF EXISTS `AT_glossary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_glossary` (
  `word_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `word` varchar(240) NOT NULL DEFAULT '',
  `definition` text,
  `related_word_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`word_id`),
  KEY `course_id` (`course_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_glossary`
--

LOCK TABLES `AT_glossary` WRITE;
/*!40000 ALTER TABLE `AT_glossary` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_glossary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_grade_scales`
--

DROP TABLE IF EXISTS `AT_grade_scales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_grade_scales` (
  `grade_scale_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `scale_name` varchar(255) NOT NULL DEFAULT '',
  `created_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`grade_scale_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_grade_scales`
--

LOCK TABLES `AT_grade_scales` WRITE;
/*!40000 ALTER TABLE `AT_grade_scales` DISABLE KEYS */;
INSERT INTO `AT_grade_scales` VALUES (1,0,'Letter Grade','2020-01-14 12:06:30'),(2,0,'Competency 1','2020-01-14 12:06:30'),(3,0,'Competency 2','2020-01-14 12:06:30');
/*!40000 ALTER TABLE `AT_grade_scales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_grade_scales_detail`
--

DROP TABLE IF EXISTS `AT_grade_scales_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_grade_scales_detail` (
  `grade_scale_id` mediumint(8) unsigned NOT NULL,
  `scale_value` varchar(50) NOT NULL DEFAULT '',
  `percentage_from` mediumint(9) NOT NULL DEFAULT '0',
  `percentage_to` mediumint(9) NOT NULL DEFAULT '0',
  PRIMARY KEY (`grade_scale_id`,`scale_value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_grade_scales_detail`
--

LOCK TABLES `AT_grade_scales_detail` WRITE;
/*!40000 ALTER TABLE `AT_grade_scales_detail` DISABLE KEYS */;
INSERT INTO `AT_grade_scales_detail` VALUES (1,'A+',90,100),(1,'A',80,89),(1,'B',70,79),(1,'C',60,69),(1,'D',50,59),(1,'E',0,49),(2,'Pass',75,100),(2,'Fail',0,74),(3,'Excellent',80,100),(3,'Good',70,79),(3,'Adequate',60,69),(3,'Inadequate',0,59);
/*!40000 ALTER TABLE `AT_grade_scales_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_gradebook_detail`
--

DROP TABLE IF EXISTS `AT_gradebook_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_gradebook_detail` (
  `gradebook_test_id` mediumint(8) unsigned NOT NULL,
  `member_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `grade` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`gradebook_test_id`,`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_gradebook_detail`
--

LOCK TABLES `AT_gradebook_detail` WRITE;
/*!40000 ALTER TABLE `AT_gradebook_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_gradebook_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_gradebook_tests`
--

DROP TABLE IF EXISTS `AT_gradebook_tests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_gradebook_tests` (
  `gradebook_test_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Values: 0, tests.test_id or assignments.assignment_id. 0 for external tests/assignments. tests.test_id for ATutor tests, assignments.assignment_id for ATutor assignments.',
  `type` varchar(50) NOT NULL DEFAULT '' COMMENT 'Values: ATutor Test, ATutor Assignment, External',
  `course_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Values: 0 or courses.course_id. Only has value for external tests/assignments. When ATutor internal assignments/tests/surveys, always 0.',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT 'Values: Null or test name. Always null if ATutor internal assignments/tests/surveys.',
  `due_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `grade_scale_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`gradebook_test_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_gradebook_tests`
--

LOCK TABLES `AT_gradebook_tests` WRITE;
/*!40000 ALTER TABLE `AT_gradebook_tests` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_gradebook_tests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_groups`
--

DROP TABLE IF EXISTS `AT_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_groups` (
  `group_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `type_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `title` varchar(80) NOT NULL DEFAULT '',
  `description` text,
  `modules` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_groups`
--

LOCK TABLES `AT_groups` WRITE;
/*!40000 ALTER TABLE `AT_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_groups_members`
--

DROP TABLE IF EXISTS `AT_groups_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_groups_members` (
  `group_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `member_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`group_id`,`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_groups_members`
--

LOCK TABLES `AT_groups_members` WRITE;
/*!40000 ALTER TABLE `AT_groups_members` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_groups_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_groups_types`
--

DROP TABLE IF EXISTS `AT_groups_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_groups_types` (
  `type_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `title` varchar(80) NOT NULL,
  PRIMARY KEY (`type_id`),
  KEY `course_id` (`course_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_groups_types`
--

LOCK TABLES `AT_groups_types` WRITE;
/*!40000 ALTER TABLE `AT_groups_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_groups_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_guests`
--

DROP TABLE IF EXISTS `AT_guests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_guests` (
  `guest_id` varchar(10) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `organization` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `focus` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`guest_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_guests`
--

LOCK TABLES `AT_guests` WRITE;
/*!40000 ALTER TABLE `AT_guests` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_guests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_handbook_notes`
--

DROP TABLE IF EXISTS `AT_handbook_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_handbook_notes` (
  `note_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `section` varchar(15) NOT NULL DEFAULT '',
  `page` varchar(50) NOT NULL DEFAULT '',
  `approved` tinyint(4) NOT NULL DEFAULT '0',
  `email` varchar(50) NOT NULL DEFAULT '',
  `note` text,
  PRIMARY KEY (`note_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_handbook_notes`
--

LOCK TABLES `AT_handbook_notes` WRITE;
/*!40000 ALTER TABLE `AT_handbook_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_handbook_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_instructor_approvals`
--

DROP TABLE IF EXISTS `AT_instructor_approvals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_instructor_approvals` (
  `member_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `request_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `notes` text,
  PRIMARY KEY (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_instructor_approvals`
--

LOCK TABLES `AT_instructor_approvals` WRITE;
/*!40000 ALTER TABLE `AT_instructor_approvals` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_instructor_approvals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_language_pages`
--

DROP TABLE IF EXISTS `AT_language_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_language_pages` (
  `term` varchar(50) NOT NULL DEFAULT '',
  `page` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`term`,`page`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_language_pages`
--

LOCK TABLES `AT_language_pages` WRITE;
/*!40000 ALTER TABLE `AT_language_pages` DISABLE KEYS */;
INSERT INTO `AT_language_pages` VALUES ('about_atutor','/admin/index.php'),('about_atutor','/index.php'),('about_atutor','/login.php'),('about_atutor','/mods/_core/courses/admin/courses.php'),('about_atutor','/mods/_core/courses/users/create_course.php'),('about_atutor','/mods/_core/users/users.php'),('about_atutor','/mods/_standard/file_storage/index.php'),('about_atutor','/users/index.php'),('about_private','/mods/_core/courses/users/create_course.php'),('about_protected','/mods/_core/courses/users/create_course.php'),('about_public','/mods/_core/courses/users/create_course.php'),('access','/mods/_core/courses/admin/courses.php'),('access','/mods/_core/courses/users/create_course.php'),('account_status','/mods/_core/users/users.php'),('add_announcement','/index.php'),('add_content','/index.php'),('add_top_folder','/index.php'),('add_top_folder','/mods/_standard/file_storage/index.php'),('add_top_page','/index.php'),('add_top_page','/mods/_standard/file_storage/index.php'),('administration','/admin/index.php'),('administration','/mods/_core/courses/admin/courses.php'),('administration','/mods/_core/users/users.php'),('administrators','/admin/index.php'),('administrators','/mods/_core/users/users.php'),('admin_email','/admin/index.php'),('admin_email','/mods/_core/users/users.php'),('admin_home','/admin/index.php'),('admin_home','/mods/_core/courses/admin/courses.php'),('admin_home','/mods/_core/users/users.php'),('all','/mods/_core/courses/admin/courses.php'),('all','/mods/_core/users/users.php'),('alumni','/mods/_core/courses/admin/courses.php'),('announcements','/index.php'),('announcements','/users/index.php'),('announcement_date_format','/admin/index.php'),('announcement_date_format','/index.php'),('announcement_date_format','/login.php'),('announcement_date_format','/mods/_core/courses/admin/courses.php'),('announcement_date_format','/mods/_core/courses/users/create_course.php'),('announcement_date_format','/mods/_core/users/users.php'),('announcement_date_format','/mods/_standard/file_storage/index.php'),('announcement_date_format','/users/index.php'),('applications','/index.php'),('applications','/mods/_standard/file_storage/index.php'),('apply','/mods/_core/users/users.php'),('apply_to_all_results','/mods/_core/users/users.php'),('assignments','/users/index.php'),('assignment_dropbox','/users/index.php'),('assignment_dropbox_text','/admin/index.php'),('assignment_dropbox_text','/bounce.php'),('assignment_dropbox_text','/index.php'),('assignment_dropbox_text','/login.php'),('assignment_dropbox_text','/logout.php'),('assignment_dropbox_text','/mods/_core/courses/admin/courses.php'),('assignment_dropbox_text','/mods/_core/courses/users/create_course.php'),('assignment_dropbox_text','/mods/_core/users/users.php'),('assignment_dropbox_text','/mods/_standard/file_storage/index.php'),('assignment_dropbox_text','/users/index.php'),('at','/mods/_core/courses/users/create_course.php'),('atutor_handbook','/admin/index.php'),('atutor_handbook','/index.php'),('atutor_handbook','/login.php'),('atutor_handbook','/mods/_core/courses/admin/courses.php'),('atutor_handbook','/mods/_core/courses/users/create_course.php'),('atutor_handbook','/mods/_core/users/users.php'),('atutor_handbook','/mods/_standard/file_storage/index.php'),('atutor_handbook','/users/index.php'),('atutor_version','/admin/index.php'),('atutor_version_text','/admin/index.php'),('AT_FEEDBACK_ACTION_COMPLETED_SUCCESSFULLY','/index.php'),('AT_FEEDBACK_ADMIN_NO_COURSES','/admin/index.php'),('AT_FEEDBACK_CREATE_NEW_COURSE','/mods/_core/courses/users/create_course.php'),('AT_FEEDBACK_LOGIN_SUCCESS','/admin/index.php'),('AT_FEEDBACK_LOGIN_SUCCESS','/mods/_core/courses/users/create_course.php'),('AT_FEEDBACK_LOGIN_SUCCESS','/users/index.php'),('AT_FEEDBACK_LOGOUT','/login.php'),('AT_INFOS_FIRST_PREFS','/users/index.php'),('author','/mods/_standard/file_storage/index.php'),('auto_enroll','/admin/index.php'),('auto_enroll','/mods/_core/courses/admin/courses.php'),('available_immediately','/mods/_core/courses/users/create_course.php'),('available_patches','/admin/index.php'),('available_patches_text','/admin/index.php'),('backups','/admin/index.php'),('backups','/mods/_core/courses/admin/courses.php'),('banner','/mods/_core/courses/users/create_course.php'),('basiclti','/admin/index.php'),('basiclti','/mods/_core/courses/admin/courses.php'),('basiclti','/mods/_core/users/users.php'),('basiclti','/users/index.php'),('basiclti_content_text','/admin/index.php'),('basiclti_content_text','/bounce.php'),('basiclti_content_text','/index.php'),('basiclti_content_text','/login.php'),('basiclti_content_text','/logout.php'),('basiclti_content_text','/mods/_core/courses/admin/courses.php'),('basiclti_content_text','/mods/_core/courses/users/create_course.php'),('basiclti_content_text','/mods/_core/users/users.php'),('basiclti_content_text','/mods/_standard/file_storage/index.php'),('basiclti_content_text','/users/index.php'),('basiclti_tool','/admin/index.php'),('basiclti_tool','/bounce.php'),('basiclti_tool','/index.php'),('basiclti_tool','/login.php'),('basiclti_tool','/logout.php'),('basiclti_tool','/mods/_core/courses/admin/courses.php'),('basiclti_tool','/mods/_core/courses/users/create_course.php'),('basiclti_tool','/mods/_core/users/users.php'),('basiclti_tool','/mods/_standard/file_storage/index.php'),('basiclti_tool','/users/index.php'),('blogs','/users/index.php'),('bl_create','/admin/index.php'),('breadcrumbs_links','/admin/index.php'),('breadcrumbs_links','/index.php'),('breadcrumbs_links','/mods/_core/courses/admin/courses.php'),('breadcrumbs_links','/mods/_core/courses/users/create_course.php'),('breadcrumbs_links','/mods/_core/users/users.php'),('breadcrumbs_links','/mods/_standard/file_storage/index.php'),('breadcrumbs_links','/users/index.php'),('breadcrumb_links','/admin/index.php'),('breadcrumb_links','/index.php'),('breadcrumb_links','/mods/_core/courses/admin/courses.php'),('breadcrumb_links','/mods/_core/courses/users/create_course.php'),('breadcrumb_links','/mods/_core/users/users.php'),('breadcrumb_links','/mods/_standard/file_storage/index.php'),('breadcrumb_links','/users/index.php'),('browse_courses','/login.php'),('browse_courses','/mods/_core/courses/users/create_course.php'),('browse_courses','/users/index.php'),('by','/index.php'),('calendar','/mods/_core/courses/users/create_course.php'),('calendar','/users/index.php'),('cancel','/mods/_core/courses/users/create_course.php'),('category','/mods/_core/courses/admin/courses.php'),('category','/mods/_core/courses/users/create_course.php'),('category','/users/index.php'),('cats_categories','/admin/index.php'),('cats_categories','/mods/_core/courses/admin/courses.php'),('cats_uncategorized','/mods/_core/courses/users/create_course.php'),('cats_uncategorized','/users/index.php'),('change_password','/admin/index.php'),('chat','/users/index.php'),('close','/admin/index.php'),('close','/index.php'),('close','/login.php'),('close','/mods/_core/courses/users/create_course.php'),('close','/users/index.php'),('close_menus','/index.php'),('close_menus','/mods/_standard/file_storage/index.php'),('close_related_topics','/index.php'),('close_related_topics','/mods/_standard/file_storage/index.php'),('collapse','/index.php'),('collapse','/mods/_standard/file_storage/index.php'),('comments','/mods/_standard/file_storage/index.php'),('connections','/index.php'),('connections','/mods/_standard/file_storage/index.php'),('content','/admin/index.php'),('content','/index.php'),('content','/login.php'),('content','/mods/_core/courses/admin/courses.php'),('content','/mods/_core/courses/users/create_course.php'),('content','/mods/_core/users/users.php'),('content','/mods/_standard/file_storage/index.php'),('content','/users/index.php'),('content_navigation','/index.php'),('content_navigation','/mods/_standard/file_storage/index.php'),('content_packaging_all','/mods/_core/courses/users/create_course.php'),('content_packaging_none','/mods/_core/courses/users/create_course.php'),('content_packaging_top','/mods/_core/courses/users/create_course.php'),('copyright','/admin/index.php'),('copyright','/index.php'),('copyright','/login.php'),('copyright','/mods/_core/courses/admin/courses.php'),('copyright','/mods/_core/courses/users/create_course.php'),('copyright','/mods/_core/users/users.php'),('copyright','/mods/_standard/file_storage/index.php'),('copyright','/users/index.php'),('course','/users/index.php'),('courses','/admin/index.php'),('courses','/mods/_core/courses/admin/courses.php'),('courses','/mods/_core/users/users.php'),('courses_below','/index.php'),('courses_below','/mods/_core/courses/users/create_course.php'),('courses_below','/mods/_standard/file_storage/index.php'),('courses_below','/users/index.php'),('course_admin_tools','/admin/index.php'),('course_admin_tools','/index.php'),('course_admin_tools','/login.php'),('course_admin_tools','/mods/_core/courses/admin/courses.php'),('course_admin_tools','/mods/_core/courses/users/create_course.php'),('course_admin_tools','/mods/_core/users/users.php'),('course_admin_tools','/users/index.php'),('course_copyright','/mods/_core/courses/users/create_course.php'),('course_email','/users/index.php'),('course_files','/mods/_standard/file_storage/index.php'),('course_home','/index.php'),('course_home','/mods/_standard/file_storage/index.php'),('course_title_instructor_enrolment_long','/mods/_core/courses/admin/courses.php'),('course_tools','/index.php'),('course_tools','/users/index.php'),('create','/mods/_standard/file_storage/index.php'),('created_date','/mods/_core/courses/admin/courses.php'),('create_basic','/mods/_core/courses/users/create_course.php'),('create_course','/admin/index.php'),('create_course','/mods/_core/courses/admin/courses.php'),('create_course','/mods/_core/courses/users/create_course.php'),('create_course','/users/index.php'),('create_folder','/mods/_standard/file_storage/index.php'),('create_patch','/admin/index.php'),('create_user','/admin/index.php'),('create_user','/mods/_core/users/users.php'),('creation_date','/mods/_core/users/users.php'),('cron_config','/admin/index.php'),('current_path','/mods/_standard/file_storage/index.php'),('database','/admin/index.php'),('date','/mods/_standard/file_storage/index.php'),('date_april','/mods/_core/courses/users/create_course.php'),('date_august','/mods/_core/courses/users/create_course.php'),('date_december','/mods/_core/courses/users/create_course.php'),('date_february','/mods/_core/courses/users/create_course.php'),('date_january','/admin/index.php'),('date_january','/index.php'),('date_january','/login.php'),('date_january','/mods/_core/courses/admin/courses.php'),('date_january','/mods/_core/courses/users/create_course.php'),('date_january','/mods/_core/users/users.php'),('date_january','/mods/_standard/file_storage/index.php'),('date_january','/users/index.php'),('date_july','/mods/_core/courses/users/create_course.php'),('date_june','/mods/_core/courses/users/create_course.php'),('date_march','/mods/_core/courses/users/create_course.php'),('date_may','/mods/_core/courses/users/create_course.php'),('date_november','/mods/_core/courses/users/create_course.php'),('date_october','/mods/_core/courses/users/create_course.php'),('date_september','/mods/_core/courses/users/create_course.php'),('date_tuesday','/admin/index.php'),('date_tuesday','/index.php'),('date_tuesday','/login.php'),('date_tuesday','/mods/_core/courses/admin/courses.php'),('date_tuesday','/mods/_core/courses/users/create_course.php'),('date_tuesday','/mods/_core/users/users.php'),('date_tuesday','/mods/_standard/file_storage/index.php'),('date_tuesday','/users/index.php'),('days','/mods/_core/users/users.php'),('default','/admin/index.php'),('default_announcement','/mods/_core/courses/users/create_course.php'),('default_modules','/admin/index.php'),('default_modules','/mods/_core/courses/admin/courses.php'),('default_preferences','/admin/index.php'),('default_preferences','/mods/_core/users/users.php'),('default_side_menu','/admin/index.php'),('default_side_menu','/mods/_core/courses/admin/courses.php'),('delete','/mods/_core/courses/admin/courses.php'),('delete','/mods/_core/users/users.php'),('delete','/mods/_standard/file_storage/index.php'),('description','/mods/_core/courses/admin/courses.php'),('description','/mods/_core/courses/users/create_course.php'),('description','/mods/_standard/file_storage/index.php'),('detailed_on','/index.php'),('directory','/index.php'),('directory','/users/index.php'),('disable','/mods/_core/users/users.php'),('disabled','/mods/_core/users/users.php'),('disable_syndicate','/mods/_core/courses/users/create_course.php'),('disk_usage','/admin/index.php'),('display_name_format_fst','/bounce.php'),('display_name_format_fst','/index.php'),('display_name_format_fst','/mods/_core/courses/users/create_course.php'),('display_name_format_fst','/mods/_standard/file_storage/index.php'),('display_name_format_fst','/users/index.php'),('download','/mods/_standard/file_storage/index.php'),('edit','/mods/_core/courses/admin/courses.php'),('edit','/mods/_core/users/users.php'),('edit','/mods/_standard/file_storage/index.php'),('email','/mods/_core/users/users.php'),('email_approvals','/mods/_core/courses/users/create_course.php'),('empty','/mods/_core/courses/users/create_course.php'),('enable_syndicate','/mods/_core/courses/users/create_course.php'),('end_date','/mods/_core/courses/users/create_course.php'),('end_on','/mods/_core/courses/users/create_course.php'),('enrolled','/mods/_core/courses/admin/courses.php'),('enrollment','/admin/index.php'),('enrollment','/mods/_core/courses/admin/courses.php'),('enrollment','/mods/_core/users/users.php'),('enter_edit_mode','/index.php'),('enter_edit_mode','/mods/_standard/file_storage/index.php'),('enter_search_terms','/index.php'),('enter_search_terms','/mods/_standard/file_storage/index.php'),('error_logging','/admin/index.php'),('exit_edit_mode','/index.php'),('exit_edit_mode','/mods/_standard/file_storage/index.php'),('expand','/index.php'),('expand','/mods/_standard/file_storage/index.php'),('export_content','/mods/_core/courses/users/create_course.php'),('export_content_text','/admin/index.php'),('export_content_text','/bounce.php'),('export_content_text','/index.php'),('export_content_text','/login.php'),('export_content_text','/logout.php'),('export_content_text','/mods/_core/courses/admin/courses.php'),('export_content_text','/mods/_core/courses/users/create_course.php'),('export_content_text','/mods/_core/users/users.php'),('export_content_text','/mods/_standard/file_storage/index.php'),('export_content_text','/users/index.php'),('faq','/users/index.php'),('farchive','/users/index.php'),('file','/mods/_standard/file_storage/index.php'),('file_manager_new','/mods/_standard/file_storage/index.php'),('file_storage','/index.php'),('file_storage','/mods/_standard/file_storage/index.php'),('file_storage','/users/index.php'),('filter','/mods/_core/courses/admin/courses.php'),('filter','/mods/_core/users/users.php'),('first_name','/mods/_core/users/users.php'),('flowplayer','/users/index.php'),('forums','/admin/index.php'),('forums','/index.php'),('forums','/mods/_core/courses/admin/courses.php'),('forums','/mods/_standard/file_storage/index.php'),('forums','/users/index.php'),('forum_posts','/index.php'),('forum_posts','/mods/_standard/file_storage/index.php'),('general_help','/admin/index.php'),('general_help','/index.php'),('general_help','/login.php'),('general_help','/mods/_core/courses/admin/courses.php'),('general_help','/mods/_core/courses/users/create_course.php'),('general_help','/mods/_core/users/users.php'),('general_help','/mods/_standard/file_storage/index.php'),('general_help','/users/index.php'),('glossary','/index.php'),('glossary','/mods/_standard/file_storage/index.php'),('go','/mods/_standard/file_storage/index.php'),('google_search','/users/index.php'),('google_search_text','/admin/index.php'),('google_search_text','/bounce.php'),('google_search_text','/index.php'),('google_search_text','/login.php'),('google_search_text','/logout.php'),('google_search_text','/mods/_core/courses/admin/courses.php'),('google_search_text','/mods/_core/courses/users/create_course.php'),('google_search_text','/mods/_core/users/users.php'),('google_search_text','/mods/_standard/file_storage/index.php'),('google_search_text','/users/index.php'),('goto_content','/admin/index.php'),('goto_content','/index.php'),('goto_content','/login.php'),('goto_content','/mods/_core/courses/admin/courses.php'),('goto_content','/mods/_core/courses/users/create_course.php'),('goto_content','/mods/_core/users/users.php'),('goto_content','/mods/_standard/file_storage/index.php'),('goto_content','/users/index.php'),('goto_main_nav','/admin/index.php'),('goto_main_nav','/index.php'),('goto_main_nav','/login.php'),('goto_main_nav','/mods/_core/courses/admin/courses.php'),('goto_main_nav','/mods/_core/courses/users/create_course.php'),('goto_main_nav','/mods/_core/users/users.php'),('goto_main_nav','/mods/_standard/file_storage/index.php'),('goto_main_nav','/users/index.php'),('goto_menu','/admin/index.php'),('goto_menu','/index.php'),('goto_menu','/login.php'),('goto_menu','/mods/_core/courses/admin/courses.php'),('goto_menu','/mods/_core/courses/users/create_course.php'),('goto_menu','/mods/_core/users/users.php'),('goto_menu','/mods/_standard/file_storage/index.php'),('goto_menu','/users/index.php'),('goto_top','/index.php'),('goto_top','/mods/_standard/file_storage/index.php'),('gradebook','/users/index.php'),('gradebook_text','/admin/index.php'),('gradebook_text','/bounce.php'),('gradebook_text','/index.php'),('gradebook_text','/login.php'),('gradebook_text','/logout.php'),('gradebook_text','/mods/_core/courses/admin/courses.php'),('gradebook_text','/mods/_core/courses/users/create_course.php'),('gradebook_text','/mods/_core/users/users.php'),('gradebook_text','/mods/_standard/file_storage/index.php'),('gradebook_text','/users/index.php'),('groups_text','/admin/index.php'),('groups_text','/bounce.php'),('groups_text','/index.php'),('groups_text','/login.php'),('groups_text','/logout.php'),('groups_text','/mods/_core/courses/admin/courses.php'),('groups_text','/mods/_core/courses/users/create_course.php'),('groups_text','/mods/_core/users/users.php'),('groups_text','/mods/_standard/file_storage/index.php'),('groups_text','/users/index.php'),('guest','/login.php'),('guests_not_listed','/index.php'),('guests_not_listed','/mods/_standard/file_storage/index.php'),('have','/mods/_core/users/users.php'),('have_not','/mods/_core/users/users.php'),('help','/admin/index.php'),('help','/index.php'),('help','/login.php'),('help','/mods/_core/courses/admin/courses.php'),('help','/mods/_core/courses/users/create_course.php'),('help','/mods/_core/users/users.php'),('help','/mods/_standard/file_storage/index.php'),('help','/users/index.php'),('hide','/admin/index.php'),('hide','/index.php'),('hide','/login.php'),('hide','/mods/_core/courses/admin/courses.php'),('hide','/mods/_core/courses/users/create_course.php'),('hide','/mods/_core/users/users.php'),('hide','/mods/_standard/file_storage/index.php'),('hide','/users/index.php'),('hide_course','/mods/_core/courses/users/create_course.php'),('hide_side_menu','/admin/index.php'),('hide_side_menu','/index.php'),('hide_side_menu','/login.php'),('hide_side_menu','/mods/_core/courses/admin/courses.php'),('hide_side_menu','/mods/_core/courses/users/create_course.php'),('hide_side_menu','/mods/_core/users/users.php'),('hide_side_menu','/mods/_standard/file_storage/index.php'),('hide_side_menu','/users/index.php'),('hide_sub_navigation','/admin/index.php'),('hide_sub_navigation','/login.php'),('hide_sub_navigation','/mods/_core/courses/admin/courses.php'),('hide_sub_navigation','/mods/_core/courses/users/create_course.php'),('hide_sub_navigation','/mods/_core/users/users.php'),('hide_sub_navigation','/users/index.php'),('home','/login.php'),('home','/mods/_standard/file_storage/index.php'),('home','/users/index.php'),('hours_24','/mods/_core/courses/users/create_course.php'),('icon','/mods/_core/courses/users/create_course.php'),('icon_on','/index.php'),('inbox','/index.php'),('inbox','/mods/_core/courses/users/create_course.php'),('inbox','/mods/_standard/file_storage/index.php'),('inbox','/users/index.php'),('initial_content','/mods/_core/courses/users/create_course.php'),('install_modules','/admin/index.php'),('instructor','/index.php'),('Instructor','/mods/_core/courses/admin/courses.php'),('instructor','/mods/_core/courses/users/create_course.php'),('instructor','/mods/_core/users/users.php'),('instructor','/mods/_standard/file_storage/index.php'),('instructor','/users/index.php'),('instructor_requests','/admin/index.php'),('instructor_requests','/mods/_core/users/users.php'),('instructor_requests_text','/admin/index.php'),('jump','/index.php'),('jump','/mods/_core/courses/users/create_course.php'),('jump','/mods/_standard/file_storage/index.php'),('jump','/users/index.php'),('jump_to_admin_tools','/index.php'),('jump_to_admin_tools','/mods/_standard/file_storage/index.php'),('just_social','/admin/index.php'),('languages','/admin/index.php'),('last_login','/mods/_core/users/users.php'),('last_name','/mods/_core/users/users.php'),('left_side','/admin/index.php'),('left_side','/index.php'),('left_side','/login.php'),('left_side','/mods/_core/courses/admin/courses.php'),('left_side','/mods/_core/courses/users/create_course.php'),('left_side','/mods/_core/users/users.php'),('left_side','/mods/_standard/file_storage/index.php'),('left_side','/users/index.php'),('links','/users/index.php'),('logged_in_within','/mods/_core/users/users.php'),('login','/login.php'),('login_name','/mods/_core/users/users.php'),('login_name_or_email','/login.php'),('login_text','/login.php'),('logout','/admin/index.php'),('logout','/index.php'),('logout','/mods/_core/courses/admin/courses.php'),('logout','/mods/_core/courses/users/create_course.php'),('logout','/mods/_core/users/users.php'),('logout','/mods/_standard/file_storage/index.php'),('logout','/users/index.php'),('main','/admin/index.php'),('main','/index.php'),('main','/login.php'),('main','/mods/_core/courses/admin/courses.php'),('main','/mods/_core/courses/users/create_course.php'),('main','/mods/_core/users/users.php'),('main','/mods/_standard/file_storage/index.php'),('main','/users/index.php'),('manage','/index.php'),('manage','/mods/_standard/file_storage/index.php'),('manage_navigation_bar','/index.php'),('manage_off','/index.php'),('manage_off','/mods/_standard/file_storage/index.php'),('manage_on','/index.php'),('manage_on','/mods/_standard/file_storage/index.php'),('manage_tools_off','/index.php'),('manage_tools_on','/index.php'),('master_student_list','/admin/index.php'),('master_student_list','/mods/_core/users/users.php'),('mb','/admin/index.php'),('megabytes','/admin/index.php'),('modules','/admin/index.php'),('modules','/mods/_core/courses/admin/courses.php'),('modules','/mods/_core/users/users.php'),('more_options','/mods/_core/users/users.php'),('move','/mods/_standard/file_storage/index.php'),('myown_patches','/admin/index.php'),('mysql_version','/admin/index.php'),('my_account','/admin/index.php'),('my_courses','/mods/_core/courses/users/create_course.php'),('my_courses','/users/index.php'),('my_files','/mods/_standard/file_storage/index.php'),('my_start_page','/index.php'),('my_start_page','/mods/_core/courses/users/create_course.php'),('my_start_page','/mods/_standard/file_storage/index.php'),('my_start_page','/users/index.php'),('my_tests','/index.php'),('my_tracker','/index.php'),('na','/index.php'),('na','/mods/_standard/file_storage/index.php'),('name','/mods/_standard/file_storage/index.php'),('navigation','/admin/index.php'),('navigation','/index.php'),('navigation','/login.php'),('navigation','/mods/_core/courses/admin/courses.php'),('navigation','/mods/_core/courses/users/create_course.php'),('navigation','/mods/_core/users/users.php'),('navigation','/mods/_standard/file_storage/index.php'),('navigation','/users/index.php'),('network_home','/index.php'),('network_home','/mods/_standard/file_storage/index.php'),('never','/mods/_core/users/users.php'),('new_file','/mods/_standard/file_storage/index.php'),('new_user','/login.php'),('new_window','/index.php'),('new_window','/mods/_core/courses/users/create_course.php'),('new_window','/mods/_standard/file_storage/index.php'),('new_window','/users/index.php'),('none_found','/index.php'),('none_found','/mods/_core/courses/admin/courses.php'),('none_found','/mods/_standard/file_storage/index.php'),('no_end_date','/mods/_core/courses/users/create_course.php'),('no_icon','/mods/_core/courses/users/create_course.php'),('open_sub_navigation','/admin/index.php'),('open_sub_navigation','/login.php'),('open_sub_navigation','/mods/_core/courses/admin/courses.php'),('open_sub_navigation','/mods/_core/courses/users/create_course.php'),('open_sub_navigation','/mods/_core/users/users.php'),('open_sub_navigation','/users/index.php'),('or','/mods/_core/courses/users/create_course.php'),('or','/mods/_standard/file_storage/index.php'),('os','/admin/index.php'),('page','/mods/_core/users/users.php'),('page','/users/index.php'),('password','/login.php'),('password','/mods/_core/users/users.php'),('password_reminder','/login.php'),('patcher','/admin/index.php'),('patcher','/mods/_core/courses/admin/courses.php'),('patcher','/mods/_core/users/users.php'),('patcher','/users/index.php'),('pa_photo_gallery','/admin/index.php'),('pa_photo_gallery','/index.php'),('pa_photo_gallery','/mods/_core/courses/admin/courses.php'),('pa_photo_gallery','/mods/_core/users/users.php'),('pa_photo_gallery','/mods/_standard/file_storage/index.php'),('pa_preferences','/admin/index.php'),('photos','/users/index.php'),('php_version','/admin/index.php'),('polls','/index.php'),('polls','/mods/_standard/file_storage/index.php'),('polls','/users/index.php'),('preferences','/index.php'),('preferences','/mods/_core/courses/users/create_course.php'),('preferences','/mods/_standard/file_storage/index.php'),('preferences','/users/index.php'),('primary_language','/mods/_core/courses/users/create_course.php'),('private','/mods/_core/courses/admin/courses.php'),('private','/mods/_core/courses/users/create_course.php'),('profile','/mods/_core/courses/users/create_course.php'),('profile','/users/index.php'),('profile_pictures','/users/index.php'),('properties','/index.php'),('properties','/mods/_core/courses/users/create_course.php'),('protected','/mods/_core/courses/admin/courses.php'),('protected','/mods/_core/courses/users/create_course.php'),('public','/mods/_core/courses/admin/courses.php'),('public','/mods/_core/courses/users/create_course.php'),('reading_list','/users/index.php'),('register','/login.php'),('registration_text','/login.php'),('related_topics','/index.php'),('related_topics','/mods/_standard/file_storage/index.php'),('release_date','/mods/_core/courses/users/create_course.php'),('release_on','/mods/_core/courses/users/create_course.php'),('required_field','/mods/_core/courses/users/create_course.php'),('required_field','/mods/_standard/file_storage/index.php'),('reset_filter','/mods/_core/courses/admin/courses.php'),('reset_filter','/mods/_core/users/users.php'),('results_found','/mods/_core/courses/admin/courses.php'),('results_found','/mods/_core/users/users.php'),('returning_user','/login.php'),('revisions','/mods/_standard/file_storage/index.php'),('rss_feeds','/admin/index.php'),('rss_feeds','/users/index.php'),('save','/admin/index.php'),('save','/mods/_core/courses/users/create_course.php'),('search','/admin/index.php'),('search','/index.php'),('search','/login.php'),('search','/mods/_core/courses/admin/courses.php'),('search','/mods/_core/courses/users/create_course.php'),('search','/mods/_core/users/users.php'),('search','/mods/_standard/file_storage/index.php'),('search','/users/index.php'),('search_all_words','/index.php'),('search_all_words','/mods/_core/users/users.php'),('search_all_words','/mods/_standard/file_storage/index.php'),('search_any_word','/index.php'),('search_any_word','/mods/_core/users/users.php'),('search_any_word','/mods/_standard/file_storage/index.php'),('search_for_friends','/index.php'),('search_for_friends','/mods/_standard/file_storage/index.php'),('search_match','/index.php'),('search_match','/mods/_core/users/users.php'),('search_match','/mods/_standard/file_storage/index.php'),('second_name','/mods/_core/users/users.php'),('select','/mods/_core/users/users.php'),('select_all','/mods/_core/users/users.php'),('select_all','/mods/_standard/file_storage/index.php'),('session_timeout_logout_now','/index.php'),('session_timeout_logout_now','/mods/_core/courses/users/create_course.php'),('session_timeout_logout_now','/mods/_standard/file_storage/index.php'),('session_timeout_logout_now','/users/index.php'),('session_timeout_stay_connected','/index.php'),('session_timeout_stay_connected','/mods/_core/courses/users/create_course.php'),('session_timeout_stay_connected','/mods/_standard/file_storage/index.php'),('session_timeout_stay_connected','/users/index.php'),('session_timeout_title','/index.php'),('session_timeout_title','/mods/_core/courses/users/create_course.php'),('session_timeout_title','/mods/_standard/file_storage/index.php'),('session_timeout_title','/users/index.php'),('session_will_expire','/index.php'),('session_will_expire','/mods/_core/courses/users/create_course.php'),('session_will_expire','/mods/_standard/file_storage/index.php'),('session_will_expire','/users/index.php'),('settings','/index.php'),('settings','/mods/_standard/file_storage/index.php'),('shortcuts','/users/index.php'),('show','/admin/index.php'),('show','/index.php'),('show','/login.php'),('show','/mods/_core/courses/admin/courses.php'),('show','/mods/_core/courses/users/create_course.php'),('show','/mods/_core/users/users.php'),('show','/mods/_standard/file_storage/index.php'),('show','/users/index.php'),('show_all','/users/index.php'),('show_side_menu','/admin/index.php'),('show_side_menu','/index.php'),('show_side_menu','/login.php'),('show_side_menu','/mods/_core/courses/admin/courses.php'),('show_side_menu','/mods/_core/courses/users/create_course.php'),('show_side_menu','/mods/_core/users/users.php'),('show_side_menu','/mods/_standard/file_storage/index.php'),('show_side_menu','/users/index.php'),('side_menu_closed','/index.php'),('side_menu_closed','/mods/_standard/file_storage/index.php'),('side_menu_opened','/index.php'),('side_menu_opened','/mods/_standard/file_storage/index.php'),('sitemap','/index.php'),('sitemap','/mods/_standard/file_storage/index.php'),('sitemap','/users/index.php'),('sitemap_text','/admin/index.php'),('sitemap_text','/bounce.php'),('sitemap_text','/index.php'),('sitemap_text','/login.php'),('sitemap_text','/logout.php'),('sitemap_text','/mods/_core/courses/admin/courses.php'),('sitemap_text','/mods/_core/courses/users/create_course.php'),('sitemap_text','/mods/_core/users/users.php'),('sitemap_text','/mods/_standard/file_storage/index.php'),('sitemap_text','/users/index.php'),('size','/mods/_standard/file_storage/index.php'),('smile_angry','/index.php'),('smile_confused','/index.php'),('smile_crazy','/index.php'),('smile_evil','/index.php'),('smile_frown','/index.php'),('smile_lol','/index.php'),('smile_muah','/index.php'),('smile_oh_well','/index.php'),('smile_smile','/index.php'),('smile_tired','/index.php'),('smile_tongue','/index.php'),('smile_wink','/index.php'),('social','/admin/index.php'),('social','/index.php'),('social','/login.php'),('social','/mods/_core/courses/users/create_course.php'),('social','/mods/_standard/file_storage/index.php'),('social','/users/index.php'),('social_and_lms','/admin/index.php'),('social_groups','/index.php'),('social_groups','/mods/_standard/file_storage/index.php'),('social_profile','/index.php'),('social_profile','/mods/_standard/file_storage/index.php'),('social_switch','/admin/index.php'),('social_switch_text','/admin/index.php'),('startend_date_longs_format','/mods/_core/users/users.php'),('statistics','/users/index.php'),('statistics_information','/admin/index.php'),('status','/mods/_core/users/users.php'),('status','/users/index.php'),('student','/mods/_core/users/users.php'),('student_tools','/users/index.php'),('student_tools_text','/admin/index.php'),('student_tools_text','/bounce.php'),('student_tools_text','/index.php'),('student_tools_text','/login.php'),('student_tools_text','/logout.php'),('student_tools_text','/mods/_core/courses/admin/courses.php'),('student_tools_text','/mods/_core/courses/users/create_course.php'),('student_tools_text','/mods/_core/users/users.php'),('student_tools_text','/mods/_standard/file_storage/index.php'),('student_tools_text','/users/index.php'),('sub','/admin/index.php'),('sub','/index.php'),('sub','/login.php'),('sub','/mods/_core/courses/admin/courses.php'),('sub','/mods/_core/courses/users/create_course.php'),('sub','/mods/_core/users/users.php'),('sub','/users/index.php'),('sub_nav_hidden','/admin/index.php'),('sub_nav_hidden','/login.php'),('sub_nav_hidden','/mods/_core/courses/admin/courses.php'),('sub_nav_hidden','/mods/_core/courses/users/create_course.php'),('sub_nav_hidden','/mods/_core/users/users.php'),('sub_nav_hidden','/users/index.php'),('sub_nav_opened','/admin/index.php'),('sub_nav_opened','/login.php'),('sub_nav_opened','/mods/_core/courses/admin/courses.php'),('sub_nav_opened','/mods/_core/courses/users/create_course.php'),('sub_nav_opened','/mods/_core/users/users.php'),('sub_nav_opened','/users/index.php'),('support_tools','/admin/index.php'),('support_tools','/mods/_core/courses/admin/courses.php'),('support_tools','/users/index.php'),('switch_icon_view','/index.php'),('switch_text','/mods/_core/courses/users/create_course.php'),('syndicate_announcements','/mods/_core/courses/users/create_course.php'),('system_preferences','/admin/index.php'),('system_preferences','/mods/_core/courses/admin/courses.php'),('system_preferences','/mods/_core/users/users.php'),('test','/admin/index.php'),('test','/bounce.php'),('test','/index.php'),('test','/login.php'),('test','/logout.php'),('test','/mods/_core/courses/admin/courses.php'),('test','/mods/_core/courses/users/create_course.php'),('test','/mods/_core/users/users.php'),('test','/mods/_standard/file_storage/index.php'),('test','/users/index.php'),('tests','/users/index.php'),('themes','/admin/index.php'),('things_current','/users/index.php'),('this_is_content','/mods/_core/courses/users/create_course.php'),('tile_search','/users/index.php'),('tile_search_text','/admin/index.php'),('tile_search_text','/bounce.php'),('tile_search_text','/index.php'),('tile_search_text','/login.php'),('tile_search_text','/logout.php'),('tile_search_text','/mods/_core/courses/admin/courses.php'),('tile_search_text','/mods/_core/courses/users/create_course.php'),('tile_search_text','/mods/_core/users/users.php'),('tile_search_text','/mods/_standard/file_storage/index.php'),('tile_search_text','/users/index.php'),('tile_setup','/admin/index.php'),('title','/mods/_core/courses/admin/courses.php'),('title','/mods/_core/courses/users/create_course.php'),('toggle_main','/admin/index.php'),('toggle_main','/index.php'),('toggle_main','/login.php'),('toggle_main','/mods/_core/courses/admin/courses.php'),('toggle_main','/mods/_core/courses/users/create_course.php'),('toggle_main','/mods/_core/users/users.php'),('toggle_main','/mods/_standard/file_storage/index.php'),('toggle_main','/users/index.php'),('tools','/admin/index.php'),('tools','/index.php'),('tools','/login.php'),('tools','/mods/_core/courses/admin/courses.php'),('tools','/mods/_core/courses/users/create_course.php'),('tools','/mods/_core/users/users.php'),('tools','/users/index.php'),('tracker','/users/index.php'),('unconfirmed','/mods/_core/users/users.php'),('upload','/mods/_standard/file_storage/index.php'),('upload_file','/mods/_standard/file_storage/index.php'),('upload_icon','/mods/_core/courses/users/create_course.php'),('upload_icon_text','/mods/_core/courses/users/create_course.php'),('user','/admin/index.php'),('user','/index.php'),('user','/login.php'),('user','/mods/_core/courses/admin/courses.php'),('user','/mods/_core/courses/users/create_course.php'),('user','/mods/_core/users/users.php'),('user','/mods/_standard/file_storage/index.php'),('user','/users/index.php'),('users','/admin/index.php'),('users','/mods/_core/courses/admin/courses.php'),('users','/mods/_core/users/users.php'),('users_online','/index.php'),('users_online','/mods/_standard/file_storage/index.php'),('view','/admin/index.php'),('view','/mods/_core/courses/admin/courses.php'),('view_entire_post','/index.php'),('vimeo','/users/index.php'),('welcome_to_atutor','/mods/_core/courses/users/create_course.php'),('workspace','/mods/_standard/file_storage/index.php');
/*!40000 ALTER TABLE `AT_language_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_language_text`
--

DROP TABLE IF EXISTS `AT_language_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_language_text` (
  `language_code` varchar(5) NOT NULL DEFAULT '',
  `variable` varchar(30) NOT NULL DEFAULT '',
  `term` varchar(50) NOT NULL DEFAULT '',
  `text` blob NOT NULL,
  `revised_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `context` text NOT NULL,
  PRIMARY KEY (`language_code`,`variable`,`term`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_language_text`
--

LOCK TABLES `AT_language_text` WRITE;
/*!40000 ALTER TABLE `AT_language_text` DISABLE KEYS */;
INSERT INTO `AT_language_text` VALUES ('en','_module','gradebook',_binary 'Gradebook','2008-09-25 15:59:56','gradebook'),('en','_msgs','AT_CONFIRM_ADD_FEED',_binary 'Are you sure you want to add this syndicated feed?','2005-11-15 13:19:26',''),('en','_msgs','AT_CONFIRM_ADD_MODULE',_binary 'Are you sure you want to install the module in <strong><code>%s</code></strong>?','2005-08-17 12:59:04',''),('en','_msgs','AT_CONFIRM_ADD_TEST_QUESTIONS',_binary 'Are you sure you want to <em>add</em> the following questions? \r\n<ul>%s</ul>','2004-11-23 12:38:56',''),('en','_msgs','AT_CONFIRM_ALUMNI',_binary 'Are you sure you want to mark the following users as course alumni: <ul> %s </ul>','2004-11-23 12:17:53','enrollment_manager, make students into alumi'),('en','_msgs','AT_CONFIRM_DELETE',_binary 'Are you sure you want to delete these items?<br />\r\n\r\n <ul> %s </ul>','2008-05-08 12:19:32','generic delete confirmation msg'),('en','_msgs','AT_CONFIRM_DELETE_ADMIN',_binary 'Are you sure you want to delete the following administrator?\r\n<br />\r\n<strong>%s</strong>','2008-01-22 09:38:06',''),('en','_msgs','AT_CONFIRM_DELETE_ASSIGNMENT',_binary 'Are you sure you want to delete assignment <em>%s</em>?','2006-05-23 13:10:30',''),('en','_msgs','AT_CONFIRM_DELETE_AUTO_ENROLL',_binary 'Are you sure you want to <strong>delete</strong> auto enrollment for <strong>%s</strong>','2008-03-10 11:52:57','confirm message when deleting an auto enroll definition'),('en','_msgs','AT_CONFIRM_DELETE_CATEGORY',_binary 'Are you sure you want to delete category  <strong>%s</strong>?','2005-02-17 14:57:18',''),('en','_msgs','AT_CONFIRM_DELETE_COURSE_1',_binary 'Are you sure you want to <strong>Delete</strong> the course <strong><em>%s</em></strong>?','2005-03-04 11:27:35',''),('en','_msgs','AT_CONFIRM_DELETE_COURSE_2',_binary 'Are you <strong>really really</strong> sure you want to <b>Delete</b> the course <strong><em>%s</em></strong>? Deleted courses can not be recovered.','2005-03-04 11:31:35',''),('en','_msgs','AT_CONFIRM_DELETE_FAQ_QUESTION',_binary 'Are you sure you want to delete the question <strong>%s</strong>?','2005-10-19 12:49:55',''),('en','_msgs','AT_CONFIRM_DELETE_FAQ_TOPIC',_binary 'Are you sure you want to delete the topic <strong>%s</strong> and its questions?','2005-11-08 13:42:33',''),('en','_msgs','AT_CONFIRM_DELETE_FEED',_binary 'Are you sure you want to delete feed <strong>%s</strong>.?','2005-12-07 09:36:25',''),('en','_msgs','AT_CONFIRM_DELETE_FORUM',_binary 'Are you sure you want to delete <strong>%s</strong> forum? All messages posted to this forum will be erased.','2005-12-07 09:36:15','deleting a forum'),('en','_msgs','AT_CONFIRM_DELETE_GRADE_SCALE',_binary 'Are you sure you want to <strong>delete</strong> grade scale <strong>%s</strong>?','2008-09-25 16:01:17','gradebook'),('en','_msgs','AT_CONFIRM_DELETE_GROUP',_binary 'Are you sure you want to delete the group: <strong>%s</strong>?','2005-02-21 12:07:05','deletep enrollment group'),('en','_msgs','AT_CONFIRM_DELETE_GROUP_TYPE',_binary 'Are you sure you want to delete group type <em>%s</em> and all its groups?','2006-03-23 11:27:52',''),('en','_msgs','AT_CONFIRM_DELETE_LANG',_binary 'Are you sure you want to delete the language ( <strong>%s </strong>)?','2004-11-24 13:19:50',''),('en','_msgs','AT_CONFIRM_DELETE_LINK',_binary 'Are you sure you want to delete the link %s?','2005-02-21 16:55:38',''),('en','_msgs','AT_CONFIRM_DELETE_MSGS',_binary 'Are you sure you want to delete the selected messages?','2007-02-22 13:09:14',''),('en','_msgs','AT_CONFIRM_DELETE_MYOWN_PATCH',_binary 'Are you sure you want to <strong>delete</strong> patch <strong>%s</strong>','2008-04-21 15:11:31',''),('en','_msgs','AT_CONFIRM_DELETE_NEWS',_binary 'Are you sure you want to delete %s?','2004-11-24 13:37:55','news deletion in editor'),('en','_msgs','AT_CONFIRM_DELETE_POLL',_binary 'Are you sure you want to delete this poll \'%s\'?  It cannot be recovered once deleted.','2004-11-24 14:03:36','editor'),('en','_msgs','AT_CONFIRM_DELETE_TEST',_binary 'Are you sure you want to delete the test/survey <strong><em>%s</em></strong> and any results? The questions, however, will not be deleted.','2004-12-15 10:42:13','Deleting Test'),('en','_msgs','AT_CONFIRM_DELETE_TEST_CATEGORY',_binary 'Are you sure you want to delete test category <strong>%s</strong>?','2005-03-07 11:58:48',''),('en','_msgs','AT_CONFIRM_DELETE_TEST_FROM_GRADEBOOK',_binary 'Are you sure you want to <strong>delete</strong> test <strong>%s</strong> from gradebook?','2008-09-25 16:01:17','gradebook'),('en','_msgs','AT_CONFIRM_DELETE_THEME',_binary 'Are you sure you want to delete the following theme: <b> % s </b>','2004-11-23 09:30:03','confirm message for delete theme'),('en','_msgs','AT_CONFIRM_DELETE_TOOL_1',_binary 'Are you sure you want to delete the tool <strong> %s</strong>?','2011-05-27 16:09:45',''),('en','_msgs','AT_CONFIRM_DELETE_TRACKING',_binary 'Are you sure your want to delete the content usage data for this course?','2005-08-11 10:08:50','reset tracking session'),('en','_msgs','AT_CONFIRM_DELETE_TRANSCRIPT',_binary 'Are you sure you want to delete the transcript <strong>%s</strong>?','2005-03-30 14:21:00','delete chat transcript'),('en','_msgs','AT_CONFIRM_DELETE_USER',_binary 'Are you sure you want to delete the following users? Selected instructors who own courses will not be deleted.<strong>%s</strong>','2007-02-19 11:44:45','deleting user from admin'),('en','_msgs','AT_CONFIRM_DIR_DELETE',_binary 'Are you sure you want to delete the following folder(s) and all their contents? <ul><strong>%s</strong></ul>','2004-12-15 09:59:39','filemanager'),('en','_msgs','AT_CONFIRM_DIR_MOVE',_binary 'Are you sure you want to move <strong>%1s</strong> to the folder <strong>%2s</strong>?','2005-01-10 10:35:17','filemanager'),('en','_msgs','AT_CONFIRM_EDIT_STATUS',_binary 'Are you sure you want to change the following users\' status to  <strong>%s</strong>? Status of selected instructors who own courses will not be changed. %s','2007-02-19 11:43:37',''),('en','_msgs','AT_CONFIRM_ENROLL_STUDENT',_binary 'Are you sure you want to enroll the following users: <ul> %s </ul>','2004-11-23 12:21:00','enrollment manager, enroll confirm'),('en','_msgs','AT_CONFIRM_FILE_DELETE',_binary 'Are you sure you want to delete the following file(s)? <ul>%s</ul>','2006-07-05 11:44:15','filemanager'),('en','_msgs','AT_CONFIRM_FILE_EXISTS',_binary 'The file <strong>%s</strong> already exists. Do you want to overwrite the file?','2005-03-09 16:26:11','filemanager'),('en','_msgs','AT_CONFIRM_FILE_MOVE',_binary 'Are you sure you want to move <strong>%1s</strong> to the folder <strong>%2s</strong>?','2005-01-10 10:33:21','file_manager'),('en','_msgs','AT_CONFIRM_GLOSSARY_REMAINS',_binary 'Deleting a term will not remove the embedded glossary codes from your content.','2005-02-24 10:34:33','content deletion'),('en','_msgs','AT_CONFIRM_GRANT_WRITE_PERMISSION',_binary 'Please grant <strong>write</strong> permission to folder: %s<p><strong>Note:</strong> To change permissions on Unix use <kbd>chmod a+rw</kbd> then the file name.</p>','2008-10-21 15:41:53',''),('en','_msgs','AT_CONFIRM_LIST_DELETE',_binary 'Are you sure you want to delete <strong>%s</strong> Student ID from the master student list?','2005-04-04 15:47:51',''),('en','_msgs','AT_CONFIRM_LOGIN_INSTRUCTOR',_binary '<h3>%2$s</h3>\r\nYou will be logged in as the instructor for this course.  Are you sure you want to continue?','2006-04-10 13:12:29','viewing courses from admin'),('en','_msgs','AT_CONFIRM_NO_ANSWER',_binary 'You are about to add a question with no correct choice. Continue?','2004-12-06 14:35:10','adding a question without specifying answer'),('en','_msgs','AT_CONFIRM_PA_DELETE_ALBUM',_binary 'Are you sure you want to delete the album <strong>%s</strong>? Once deleted, photos can not be recovered.','2010-03-17 16:08:25','photo album'),('en','_msgs','AT_CONFIRM_PA_DELETE_COMMENT',_binary 'Are you sure you want to delete this comment?','2010-03-17 16:09:08','photo album'),('en','_msgs','AT_CONFIRM_PA_DELETE_PHOTO',_binary 'Are you sure you want to delete this Photo?','2010-03-17 16:08:50','photo album'),('en','_msgs','AT_CONFIRM_REMOVE_STUDENT',_binary 'Are you sure you want to remove the following students: <ul> %s </ul>','2004-11-23 12:21:12','removing a student'),('en','_msgs','AT_CONFIRM_REMOVE_TEST_QUESTION',_binary 'Are you sure you want to remove this question from this test? Removing the question will not delete it from the question database.','2004-11-25 10:31:52',''),('en','_msgs','AT_CONFIRM_REMOVE_WRITE_PERMISSION',_binary '<span style=\"color:red\">For your security, please <strong>REMOVE</strong> write permission on the folder: %s</span><p><strong>Note:</strong> To remove permissions on Unix use <kbd>chmod 755</kbd> then the file or folder name.</p>','2008-10-21 15:41:53',''),('en','_msgs','AT_CONFIRM_RESET_ADMIN_LOG',_binary 'Are you sure you want to delete the Administrator Activity Log?','2005-03-03 10:42:50',''),('en','_msgs','AT_CONFIRM_RESET_ERROR_LOG',_binary 'Are you sure you want to delete all the error logs?','2005-03-10 15:49:02','error log reset (delete logs folder0'),('en','_msgs','AT_CONFIRM_RL_DELETE_READING',_binary 'Are you sure you want to delete this reading: <strong>%s</strong>?','2006-10-04 10:48:51',''),('en','_msgs','AT_CONFIRM_RL_DELETE_RESOURCE',_binary 'Are you sure you want to delete this resource: <strong>%s</strong>?<br/>Note: Any readings that use this resource will also be deleted.','2006-10-04 10:48:36',''),('en','_msgs','AT_CONFIRM_STUDENT_GROUP',_binary 'Are you sure you want to add the following users to group \'%s\'? <ul> %s </ul>','2005-06-02 12:07:05',''),('en','_msgs','AT_CONFIRM_STUDENT_REMOVE_GROUP',_binary 'Are you sure you want to <strong>remove</strong> the following users from group \'%s\'? <ul> %s </ul>','2005-06-02 12:06:56','Enrollment'),('en','_msgs','AT_CONFIRM_SUB_CONTENT_DELETE',_binary 'This content page has sub content. If you delete this page all its sub pages will be deleted as well.<br />','2004-11-24 13:31:34','content deletion'),('en','_msgs','AT_CONFIRM_UNENROLL',_binary 'Are you sure you want to un-enroll from <strong>%s</strong>?','2005-03-24 12:43:34',''),('en','_msgs','AT_CONFIRM_UNENROLL_PRIV',_binary 'Are you sure you want to un-enroll the following users (the users will have their roles and privileges removed): <ul> %s </ul>','2004-11-23 12:23:22','enrollment manager, unenrolling a TA'),('en','_msgs','AT_CONFIRM_UNENROLL_STUDENT',_binary 'Are you sure you want to un-enroll the following students: <ul> %s </ul>','2004-11-23 12:21:36','enrollment manager, confirm unenroll'),('en','_msgs','AT_ERROR_ACCESS_DENIED',_binary 'You do not have permission to access this area.','2005-06-15 15:13:59','error msg'),('en','_msgs','AT_ERROR_ACCOUNT_DISABLED',_binary 'That account has been disabled.','2005-04-01 10:30:12',''),('en','_msgs','AT_ERROR_ADMIN_EDIT_OWN_ACCOUNT',_binary 'To edit your own account use the <a href=\"mods/_core/users/admins/my_edit.php\">My Account</a> page.','2010-03-09 14:25:28',''),('en','_msgs','AT_ERROR_ALREADY_BOOKMARKED',_binary 'Calendar is already bookmarked.','2013-09-11 12:34:03',''),('en','_msgs','AT_ERROR_ALREADY_ENROLED',_binary 'You have already made a request to enroll in this course and you have not yet been approved by the instructor. You will be notified when your request has been approved.','2009-09-17 14:47:14','error msg'),('en','_msgs','AT_ERROR_ALREADY_INSTALLED',_binary 'Selected item appears to have been installed.','2008-10-21 15:41:53',''),('en','_msgs','AT_ERROR_ALREADY_OWNED',_binary 'You own this course, and cannot enroll.','2004-11-26 14:30:22','error msg'),('en','_msgs','AT_ERROR_ALREADY_UNINSTALLED',_binary 'Selected item appears to have been uninstalled. Module directory does not exist.','2008-10-21 15:41:53',''),('en','_msgs','AT_ERROR_ALTERNATIVE_ALREADY_DECLARED',_binary 'The file you selected has already been declared as an alternative to the selected primary resource.','2008-09-08 15:25:02',''),('en','_msgs','AT_ERROR_ALTERNATIVE_NOT_DEFINED',_binary 'You must select an alternative from files available in the File Manager to the right.','2009-12-01 11:02:01',''),('en','_msgs','AT_ERROR_ASSIGNMENT_CUTOFF',_binary 'The assignment cut-off date has past. Submissions are no longer accepted.','2006-03-20 14:41:46',''),('en','_msgs','AT_ERROR_BACKUP_RESTORE',_binary 'Restore failed - file is not a valid backup. Backups older than version 1.3 are not supported.','2005-11-29 14:33:56',''),('en','_msgs','AT_ERROR_BACKUP_UNSUPPORTED_GREATER_VERSION',_binary 'Backups created from versions of ATutor greater than this version are not supported.','2005-05-11 15:56:50',''),('en','_msgs','AT_ERROR_BAD_DATE',_binary 'That date is not valid.','2003-05-16 13:42:17','error msg'),('en','_msgs','AT_ERROR_BAD_FILE_TYPE',_binary 'Unsupported file type. Plain Text or HTML files only.','2003-05-16 13:42:17','error msg'),('en','_msgs','AT_ERROR_BAD_FOLDER_NAME',_binary 'The folder name contains illegal characters. You may choose from alphanumeric characters and underscores, dashes or periods.','2005-01-10 13:13:55','filemanager, foilder with illegal chars'),('en','_msgs','AT_ERROR_CACHE_DIR_BAD',_binary 'Cache dir cannot be created. Cache disabled. See the configuration options to either disable or fix the problem.','2003-05-27 13:10:53','global'),('en','_msgs','AT_ERROR_CACHE_DIR_NOT_EXIST',_binary 'Cache directory does not exist or is not writable. Create it and set write permissions to make the directory writable by the system\'s Web server user. (e.g. chmod a+rwx cache)','2010-03-04 14:41:51',''),('en','_msgs','AT_ERROR_CAL_FILE_DELETE',_binary 'Error in removing duplicate file.','2013-09-11 12:34:03',''),('en','_msgs','AT_ERROR_CAL_FILE_ERROR',_binary 'Error in file processing.','2013-09-11 12:34:03',''),('en','_msgs','AT_ERROR_CANNOT_BE_EMPTY',_binary 'Search field cannot be empty.','2009-05-27 12:01:11',''),('en','_msgs','AT_ERROR_CANNOT_CONNECT_SERVER',_binary 'Failed to connect to server: %s','2008-10-21 15:41:53',''),('en','_msgs','AT_ERROR_CANNOT_CREATE_DIR',_binary 'Cannot create content directory.','2003-10-15 12:20:51',''),('en','_msgs','AT_ERROR_CANNOT_DELETE_OWN_ACCOUNT',_binary 'You cannot delete your own account.','2005-03-03 10:59:44',''),('en','_msgs','AT_ERROR_CANNOT_OPEN_DIR',_binary 'Unable to open content directory. You may try to <a href=\"mods/_core/file_manager/new.php\">create it now</a>.','2010-03-09 14:26:18','error msg'),('en','_msgs','AT_ERROR_CANNOT_OPEN_FILE',_binary 'Cannot open the file: <b> %s </b>','2004-10-18 14:38:00','Theme Manager'),('en','_msgs','AT_ERROR_CANNOT_OVERWRITE_FILE',_binary 'Cannot override file.','2003-05-16 13:42:17','error msg'),('en','_msgs','AT_ERROR_CANNOT_READ_FILE',_binary 'Cannot read from file: <b> %s </b>','2004-11-19 13:00:03','admin/error_logging.php'),('en','_msgs','AT_ERROR_CANNOT_RENAME',_binary 'File or directory cannot be renamed. Either a file or directory with that name already exists, the original file or directory does not exist, or the file or directory name has not changed.','2004-08-20 12:05:15',''),('en','_msgs','AT_ERROR_CANNOT_UNINSTALL_MANUAL_MODULE',_binary 'This module needs to be uninstalled manually instead of using the ATutor module installer. Please uninstall it manually.','2008-10-21 15:41:53','error msg'),('en','_msgs','AT_ERROR_CANNOT_UNZIP',_binary 'Can NOT unzip the uploaded file.','2008-04-21 15:08:55','error msg'),('en','_msgs','AT_ERROR_CANNOT_WRITE_FILE',_binary 'Cannot write to file: <b> %s </b>','2004-10-18 14:39:10','Theme Manager'),('en','_msgs','AT_ERROR_CANT_DELETE_GROUP',_binary 'You cannot delete this group.','2009-05-27 12:01:11',''),('en','_msgs','AT_ERROR_CHAT_TRAN_REJECTED',_binary 'Transcript filename rejected. Please ensure that it is  alphanumeric and contains no spaces.','2003-06-02 13:47:39','achat'),('en','_msgs','AT_ERROR_CHOICES_EMPTY',_binary 'Enter at least two answer choices.','2005-03-08 15:41:49',''),('en','_msgs','AT_ERROR_CHOOSE_UNINSTALLED_PATCH',_binary 'Please choose an uninstalled patch.','2008-04-21 15:08:55','error msg'),('en','_msgs','AT_ERROR_COMBINE_TESTS',_binary '\"<strong>%1$s</strong>\" cannot be combined because the following students have taken it more than once:<br />\r\n%2$s.','2008-09-25 16:01:17','gradebook'),('en','_msgs','AT_ERROR_CONFIG_NOT_WRITEABLE',_binary 'It is not possible to edit these settings because the configuration file is locked for security reasons. If you want to make changes, you need to unlock the config.inc.php file first by changing its permissions with the command <kbd>chmod a+rw config.inc.php</kbd>.','2005-03-03 10:14:48',''),('en','_msgs','AT_ERROR_CONFIRM_BAD',_binary 'Your email address and account could not be confirmed.','2005-05-31 12:55:25',''),('en','_msgs','AT_ERROR_CONTACT_INFO_NOT_FOUND',_binary 'Contact Support is not available, because an email address has not been specified.','2005-03-17 11:33:38',''),('en','_msgs','AT_ERROR_COULD_NOT_LOAD_TOOL',_binary 'Could not load tool.','2013-09-07 10:12:08','admin edit LTI tool'),('en','_msgs','AT_ERROR_COURSE_DIR_NAME_INVALID',_binary 'The course directory name is invalid. It may contain only letters, numbers, and underscores, and may not contain spaces and hyphens.','2012-07-26 13:58:12',''),('en','_msgs','AT_ERROR_COURSE_DIR_NAME_IN_USE',_binary 'The course directory name is already in use. Please try another.','2008-10-06 13:19:17',''),('en','_msgs','AT_ERROR_COURSE_ENDED',_binary 'This course ended on %s.','2007-07-16 11:53:27',''),('en','_msgs','AT_ERROR_COURSE_NOT_RELEASED',_binary 'This course can only be accessed on %s.','2006-04-10 14:28:27',''),('en','_msgs','AT_ERROR_CREATE_MASTER_USED',_binary 'The Student ID you have entered already belongs to another user. If you wish to over-write this association with the new account, use the over-write checkbox.','2006-06-12 15:39:43',''),('en','_msgs','AT_ERROR_CURL_NOT_INSTALLED',_binary 'The curl library needs to be installed for gadgets to be added.  Please contact your administrator for more information.','2009-06-09 14:44:50',''),('en','_msgs','AT_ERROR_CUTOFF_DATE_WRONG',_binary 'The Late Submissions date appears to be wrong. It must occur after the Due Date, and must be in the future.','2012-07-23 12:10:15',''),('en','_msgs','AT_ERROR_DB_NOT_UPDATED',_binary 'Information could not be added to the database.','2003-05-16 13:42:17','error msg'),('en','_msgs','AT_ERROR_DB_QUERY',_binary 'ATutor was unable to access the database. If the problem persists, please report this to an Administrator with this date reference (%s)','2013-10-16 18:50:46','queryDB failure'),('en','_msgs','AT_ERROR_DIR_NOT_DELETED',_binary 'Cannot open directory to be deleted.','2003-05-16 13:42:17','error msg'),('en','_msgs','AT_ERROR_DIR_NOT_EXIST',_binary 'Directory <strong>%s</strong> does not exist. Please create it.','2005-09-22 14:08:05','file manager'),('en','_msgs','AT_ERROR_DIR_NOT_WRITEABLE',_binary 'Directory <strong>%s</strong> is not writeable. On Unix issue the command <kbd>chmod a+rw</kbd> on the directory.','2005-09-22 14:22:24',''),('en','_msgs','AT_ERROR_DIR_NO_PERMISSION',_binary 'Cannot delete folder. You may not have premission, or it may not be empty.','2003-05-22 12:20:14','error msg'),('en','_msgs','AT_ERROR_DISABLE_CORE_MODULE',_binary 'Core modules cannot be disabled.','2005-08-25 14:00:13',''),('en','_msgs','AT_ERROR_DISABLE_MISSING_MODULE',_binary 'You cannot disable a missing module. To continue managing this module you must first restore its directory.','2005-10-05 16:22:01',''),('en','_msgs','AT_ERROR_DISABLE_PARTIALLY_UNINSTALLED_MODULE',_binary 'You cannot disable a partially uninstalled module. To continue managing this module you must first restore it.','2008-10-21 15:41:53','error msg'),('en','_msgs','AT_ERROR_DOB_INVALID',_binary 'Date of birth has invalid format.','2004-06-24 12:53:34',''),('en','_msgs','AT_ERROR_EMAIL_EXISTS',_binary 'An account with that email address already exists.','2005-03-01 11:36:57','error msg'),('en','_msgs','AT_ERROR_EMAIL_INVALID',_binary 'Email address was invalid.','2003-05-16 13:42:17','error msg'),('en','_msgs','AT_ERROR_EMAIL_MISMATCH',_binary 'Email addresses do not match. Please re-type them.','2009-11-04 14:12:12',''),('en','_msgs','AT_ERROR_EMAIL_NOT_FOUND',_binary 'No account found with that email address.','2003-05-16 13:42:17','error msg'),('en','_msgs','AT_ERROR_EMPTY_FIELDS',_binary 'The following required field(s) are empty:<br />\r\n%s.','2006-10-05 15:51:52',''),('en','_msgs','AT_ERROR_EMPTY_ZIP_FILE',_binary 'Downloaded zip file is empty.','2008-10-21 15:41:53',''),('en','_msgs','AT_ERROR_END_DATE_INVALID',_binary 'That end date is not valid.','2003-05-16 13:42:17','error msg'),('en','_msgs','AT_ERROR_ENROLLMENT_NONE_FOUND',_binary 'There is no one to export.','2006-06-27 11:53:26',''),('en','_msgs','AT_ERROR_FEEDBACK_AUTOHIDE_NEGATIVE_VALUE',_binary 'The value for autohide feedback was set to negative. Please enter a positive value.','2013-12-18 18:39:32',''),('en','_msgs','AT_ERROR_FEED_NO_CONTENT',_binary 'The feed either cannot be found at that URL or is not valid.','2005-11-23 10:59:56',''),('en','_msgs','AT_ERROR_FILE_EMPTY',_binary 'You did not select a file to import or the file was empty.','2004-12-09 14:44:43','enrollment manager'),('en','_msgs','AT_ERROR_FILE_ILLEGAL',_binary '%s files are not allowed.','2003-05-22 11:52:08','error msg'),('en','_msgs','AT_ERROR_FILE_MAX_SIZE',_binary 'The file exceeded the maximum allowable size limit of %s.','2004-05-06 13:18:19',''),('en','_msgs','AT_ERROR_FILE_NOT_DELETED',_binary 'Error deleting file. Cannot delete file.','2004-11-08 16:33:12','file manager'),('en','_msgs','AT_ERROR_FILE_NOT_EXIST',_binary 'The selected file does not exist.','2005-01-07 09:51:45','filemanager, fiule to be edited does not exist'),('en','_msgs','AT_ERROR_FILE_NOT_FOUND',_binary 'File not found.','2006-03-20 14:45:12',''),('en','_msgs','AT_ERROR_FILE_NOT_SAVED',_binary 'The file cannot be saved.','2003-05-16 13:42:17','error msg'),('en','_msgs','AT_ERROR_FILE_NOT_SELECTED',_binary 'You did not select a file to upload.','2003-05-16 13:42:17','error msg'),('en','_msgs','AT_ERROR_FILE_TOO_BIG',_binary 'The file size exceeds the limit of <strong>%s </strong>. Contact your ATutor Administrator to have this limit increased.','2005-01-15 18:49:53','error msg'),('en','_msgs','AT_ERROR_FIRST_LAST_NAME_UNIQUE',_binary 'First, second, and last names combination must be unique.','2006-03-27 14:55:34',''),('en','_msgs','AT_ERROR_FOLDER_NOT_CREATED',_binary 'The folder \" %s \" could not be created.','2006-06-02 13:43:53','error msg'),('en','_msgs','AT_ERROR_FOLDER_NOT_EXIST',_binary 'Folder not found.','2006-03-20 15:37:24',''),('en','_msgs','AT_ERROR_FORUM_DENIED',_binary 'You do not  have permission to post in this forum.','2005-08-10 13:48:14',''),('en','_msgs','AT_ERROR_FORUM_NOT_FOUND',_binary 'Forum can not be found.','2003-05-16 13:42:17','error msg'),('en','_msgs','AT_ERROR_FORUM_NO_DEL_SHARE',_binary 'You do not have permission to delete a shared forum.','2004-12-10 11:10:25',''),('en','_msgs','AT_ERROR_FORUM_NO_EDIT_SHARE',_binary 'You do not have permission to edit a Shared forum.','2004-12-10 11:15:41',''),('en','_msgs','AT_ERROR_FORUM_NO_SUBSCRIBE',_binary 'Cannot subscribe to the requested thread. Only subscription to the top-level post is allowed.','2004-12-10 13:44:57','forum/subscribe.php'),('en','_msgs','AT_ERROR_GADGET_ADDED_FAILURE',_binary 'The following error occured while adding a gadget:\r\n%s','2009-06-22 11:19:44','gadget error'),('en','_msgs','AT_ERROR_GADGET_DELETED_CANNOT_BE_EMPTY',_binary 'You need to select at least one application to delete.','2009-05-27 12:01:11',''),('en','_msgs','AT_ERROR_GENERAL',_binary 'This is a search and %s ATutor error.','2003-05-22 11:52:28','error msg'),('en','_msgs','AT_ERROR_GOOGLE_KEY_INVALID',_binary 'Invalid key.','2005-11-30 14:35:03',''),('en','_msgs','AT_ERROR_GOOGLE_KEY_MISSING',_binary 'A Google Key must be entered in order for the enabled Web Search to be available in courses. Enter this key by going to Google Key under the Configuration tab.','2005-11-30 14:40:38',''),('en','_msgs','AT_ERROR_GOOGLE_QUERY_FAILED',_binary 'Query failed.','2005-10-20 10:52:04',''),('en','_msgs','AT_ERROR_GROUP_CREATION_FAILED',_binary 'Group creation failed.','2009-05-27 12:01:11',''),('en','_msgs','AT_ERROR_GROUP_EDIT_FAILED',_binary 'Group edit failed.','2009-05-27 12:01:11',''),('en','_msgs','AT_ERROR_GROUP_HAS_BEEN_REMOVED',_binary 'Group has been removed.','2009-05-27 12:01:11',''),('en','_msgs','AT_ERROR_GROUP_NOT_FOUND',_binary 'Group not found.','2004-11-25 16:03:01',''),('en','_msgs','AT_ERROR_GROUP_NO_STUDENTS',_binary 'There are no students to create groups for.','2006-03-22 13:33:24',''),('en','_msgs','AT_ERROR_HAND_IN_FOLDER',_binary 'Folders cannot be handed in.','2006-03-20 15:43:06',''),('en','_msgs','AT_ERROR_ID_ZERO',_binary 'Content ID was zero, or was missing.','2003-05-16 13:42:17','error msg'),('en','_msgs','AT_ERROR_IMPORTDIR_FAILED',_binary 'Unable to create import directory.','2005-07-20 14:02:57','error msg'),('en','_msgs','AT_ERROR_IMPORTDIR_IMS_NOTVALID',_binary 'The file does not appear to be a valid ZIP file.','2005-06-27 11:37:47','IMS file is not a ZIP file.'),('en','_msgs','AT_ERROR_IMPORTFILE_EMPTY',_binary 'The import file must not be empty.','2003-05-16 13:42:17','error msg'),('en','_msgs','AT_ERROR_IMPORT_CARTRIDGE_FAILED',_binary 'Import failed. Does not appear to be a valid content package or common cartridge:\r\n\r\n%s','2009-12-03 09:55:01',''),('en','_msgs','AT_ERROR_IMPORT_ERROR_IN_ZIP',_binary 'Zip file could not be extracted because: <b> %s </b>','2006-06-28 10:30:50','theme manager'),('en','_msgs','AT_ERROR_IMPORT_FAILED',_binary 'Import Failed','2005-01-15 09:50:40',''),('en','_msgs','AT_ERROR_IMPORT_NOT_PROPER_FORMAT',_binary 'The selected file does not appear to be a valid theme package.','2004-12-09 11:34:27','admin/themes/import.php'),('en','_msgs','AT_ERROR_IMS_AUTHORIZATION_NOT_SUPPORT',_binary 'Import failed.  ATutor does not support package authentications.','2009-12-10 12:19:12',''),('en','_msgs','AT_ERROR_INCOMPLETE',_binary 'Please fill out the forms as directed below','2004-10-18 11:14:50','enrollment Manager, incomplete info in create list'),('en','_msgs','AT_ERROR_INCORRECT_FILE_FORMAT',_binary 'File is in the incorrect format. Review line %s of your course list file and make sure it follows format guidelines.','2006-06-28 10:43:48',''),('en','_msgs','AT_ERROR_INST_INFO_NOT_FOUND',_binary 'Instructor information cannot be found.','2003-05-16 13:42:17','error msg'),('en','_msgs','AT_ERROR_INVALID_EMAIL',_binary 'Email address is invalid.','2013-09-11 12:34:03',''),('en','_msgs','AT_ERROR_INVALID_LINK',_binary 'The link is either invalid or expired.','2006-05-10 09:08:50',''),('en','_msgs','AT_ERROR_INVALID_LOGIN',_binary 'Invalid login/password combination.','2003-05-16 13:42:17','error msg'),('en','_msgs','AT_ERROR_INVALID_URL',_binary 'Localhost is not a valid URL','2004-11-05 10:22:37','AChecker'),('en','_msgs','AT_ERROR_ITEM_NOT_FOUND',_binary 'Item not found.','2006-10-04 10:52:48','generic something not found msg.'),('en','_msgs','AT_ERROR_JOIN_REQUEST_FAILED',_binary 'Request to join group failed. Perhaps you have already requested to join this group.','2009-05-27 12:01:11',''),('en','_msgs','AT_ERROR_LANG_EXISTS',_binary 'The language pack you are trying to import already exists. Language already exists. You can edit language properties by following the <em>translate</em> in the sub menu above.','2007-02-06 15:44:17',''),('en','_msgs','AT_ERROR_LANG_IMPORT_FAILED',_binary 'Language import failed.','2003-06-06 11:23:51','admin language manager'),('en','_msgs','AT_ERROR_LANG_NOT_COMPLETE',_binary 'The language pack you are trying to import has not been marked as complete and published. To use incomplete language packs you must enable <em>translating</em> using the instructions at the bottom of this page.','2005-11-30 14:49:00',''),('en','_msgs','AT_ERROR_LANG_WRONG_VERSION',_binary 'The language pack you are trying to import is not compatible with this version of ATutor. If you still want to import this language pack you must enable <em>translating</em> following the instructions under the Translate Tab.','2011-09-08 16:21:58',''),('en','_msgs','AT_ERROR_LAST_LANGUAGE',_binary 'Cannot delete the last language. At least one language must be available.','2006-06-29 16:50:59',''),('en','_msgs','AT_ERROR_LINK_CAT_EMPTY',_binary 'Cannot add a link because there are no categories.','2005-03-09 13:05:25','adding link but no cats'),('en','_msgs','AT_ERROR_LINK_CAT_NOT_EMPTY',_binary 'Link category cannot be deleted because it contains sub-categories and/or links.','2005-02-22 15:22:44','error msg'),('en','_msgs','AT_ERROR_LOGIN_CHARS',_binary 'Your Login Name must only contain letters, numbers, periods, or underscores (_\'s).','2006-07-11 10:40:57','error msg'),('en','_msgs','AT_ERROR_LOGIN_ENROL',_binary 'You must be logged in to enroll in a course.','2003-05-16 13:42:17','error msg'),('en','_msgs','AT_ERROR_LOGIN_EXISTS',_binary 'That login already exists, please choose another.','2003-05-16 13:42:17','error msg'),('en','_msgs','AT_ERROR_LOGIN_TO_POST',_binary 'You must be logged in to post.','2003-05-16 13:42:17','error msg'),('en','_msgs','AT_ERROR_LOG_NOT_RESET',_binary 'The error log could not be reset.','2005-03-10 15:54:03','error logging'),('en','_msgs','AT_ERROR_MAX_LOGIN_ATTEMPT',_binary 'Maximum login attempts has been reached. Login has been temporarily disabled for 1 hour.  Please try again later.','2009-06-17 11:59:49',''),('en','_msgs','AT_ERROR_MAX_LOGIN_ATTEMPT_1',_binary 'Invalid username or password. You have one more attempt before the login page is disabled.','2009-06-26 16:37:13',''),('en','_msgs','AT_ERROR_MAX_LOGIN_ATTEMPT_2',_binary 'You have entered an unrecognized login and password combination. You have two more attempts before the login page is disabled.','2009-06-26 16:35:44',''),('en','_msgs','AT_ERROR_MAX_STORAGE_EXCEEDED',_binary 'Adding this file exceeds the maximum course storage limit.','2003-10-03 16:00:08','error msg'),('en','_msgs','AT_ERROR_MISSING_TEST',_binary 'Two tests must be selected to combine tests.','2013-09-23 19:28:04','gradebook combine test'),('en','_msgs','AT_ERROR_MISSING_THEMEXML',_binary 'Cannot import. The import package is missing a vital component: themes.xml. Check that the theme package is for version 1.4.3 or above.','2004-12-09 11:59:21','admin/themese/import.php'),('en','_msgs','AT_ERROR_MODULE_INSTALL',_binary 'The following error(s) were encountered when trying to install this module:\r\n<ul>%s</ul>','2005-10-11 10:48:49',''),('en','_msgs','AT_ERROR_MODULE_UNINSTALL',_binary 'The following error(s) were encountered when trying to install this module:\r\n<ul>%s</ul>','2008-10-21 15:41:53','error msg'),('en','_msgs','AT_ERROR_MYSQL_FAILED',_binary 'Connection to MySQL failed.','2009-12-01 11:07:33',''),('en','_msgs','AT_ERROR_NEED_FILENAME',_binary 'Filename was left empty. Need a filename to create new file.','2004-11-09 16:19:24','file manager'),('en','_msgs','AT_ERROR_NEED_UNIQUE_TOOLID',_binary 'The ToolID is already in use. Choose another.','2013-09-07 09:50:48','admin create LTI'),('en','_msgs','AT_ERROR_NODELETE_USER',_binary 'Cannot delete this user because they own courses. Delete the courses first.','2003-05-16 13:42:17','error msg'),('en','_msgs','AT_ERROR_NOT_CONFIRMED',_binary 'Your account\'s email address has not yet been confirmed.  Please check your email account for a confirmation message.  Please contact us if you do not receive it.','2006-06-21 10:59:56',''),('en','_msgs','AT_ERROR_NOT_IN_ANY_GROUPS',_binary 'You are not in any groups.','2006-04-11 13:34:20',''),('en','_msgs','AT_ERROR_NOT_OWNER',_binary 'You do not own this course or it does not exist.','2003-05-16 13:42:17','error msg'),('en','_msgs','AT_ERROR_NOT_RELEASED',_binary 'This content has not yet been released. %s','2003-05-22 11:52:38','error msg'),('en','_msgs','AT_ERROR_NO_ACTION_SELECTED',_binary 'No action selected.','2007-02-21 14:12:39',''),('en','_msgs','AT_ERROR_NO_ASSIGNMENTS_FOUND',_binary 'No assignments are due in this workspace. You might try another workspace.','2007-12-13 16:12:07',''),('en','_msgs','AT_ERROR_NO_BOXES_CHECKED',_binary 'You must select at least one checkbox.','2010-04-12 16:39:34',''),('en','_msgs','AT_ERROR_NO_CHILD_AS_PARENT',_binary 'Cannot move the content to be the child of its own children.','2009-09-16 13:14:12',''),('en','_msgs','AT_ERROR_NO_CONTENT_SPACE',_binary 'Not enough space to import content directory. %s KB over the limit.','2003-10-03 15:58:38','error msg'),('en','_msgs','AT_ERROR_NO_COURSE_FLOAT',_binary 'Invalid Maximum Course Float value.','2005-06-20 10:44:45','Admin did not specify a float for course size.'),('en','_msgs','AT_ERROR_NO_FAQ_TOPICS',_binary 'You must first add a topic.','2005-10-19 12:44:36',''),('en','_msgs','AT_ERROR_NO_IMSMANIFEST',_binary 'IMS manifest file is missing. This does not appear to be a valid IMS content package or common cartridge.','2009-11-17 12:38:14',''),('en','_msgs','AT_ERROR_NO_IMS_BACKUP',_binary 'This file appears to be a <a href=\"mods/_core/backups/\">course backup</a> rather than a content package.','2010-03-09 14:27:08',''),('en','_msgs','AT_ERROR_NO_ITEM_SELECTED',_binary 'You must select an item before using a button.','2005-03-07 16:36:43',''),('en','_msgs','AT_ERROR_NO_LANGUAGE',_binary 'Selected language is not supported.','2003-05-16 13:42:17','error msg'),('en','_msgs','AT_ERROR_NO_LOGS_SELECTED',_binary 'You must select at least one profile to create a bundle.','2004-11-25 11:18:19','admin/error_logging_details.php'),('en','_msgs','AT_ERROR_NO_LOG_SELECTED',_binary 'You did not select a log file.','2004-11-23 15:59:57','admin/error_logging_details.php'),('en','_msgs','AT_ERROR_NO_MEMBERS',_binary 'No users found.','2005-05-18 12:43:40',''),('en','_msgs','AT_ERROR_NO_PROFILE_SELECTED',_binary 'You did not select a profile.','2004-11-23 16:01:27','admin/error_logging_details.php'),('en','_msgs','AT_ERROR_NO_QUESTIONS',_binary 'No questions were found for this test.','2003-05-16 13:42:17','error msg'),('en','_msgs','AT_ERROR_NO_QUESTIONS_SELECTED',_binary 'You did not select any questions to add to this test.','2004-11-23 11:56:45',''),('en','_msgs','AT_ERROR_NO_RECIPIENTS',_binary 'There are no recipients of this email.','2013-09-11 12:34:03',''),('en','_msgs','AT_ERROR_NO_SELF_AS_PARENT',_binary 'Cannot move the content to be its own child.','2009-09-16 13:14:00',''),('en','_msgs','AT_ERROR_NO_SPACE_LEFT',_binary 'There is no more space in this course to extract this archive.','2003-05-16 13:42:17','error msg'),('en','_msgs','AT_ERROR_NO_STUDENT_SELECTED',_binary 'You did not select any students.','2006-06-27 12:18:13','enrollment manager, no students selected'),('en','_msgs','AT_ERROR_NO_SUCH_USER',_binary 'The user you selected does not exist.','2005-03-17 15:34:30','veiwing profile but no such user'),('en','_msgs','AT_ERROR_ONLY_EXPORT_EXTRA_MODULE',_binary 'You can only export Extra modules.','2013-01-19 16:16:18',''),('en','_msgs','AT_ERROR_ONLY_UNINSTALL_EXTRA_MODULE',_binary 'Only modules with type \"Extra\" can be uninstalled.','2008-10-21 15:41:53',''),('en','_msgs','AT_ERROR_PACKAGE_DIR_FAILED',_binary 'Problem with Package Directory.','2005-05-17 12:02:28',''),('en','_msgs','AT_ERROR_PAGE_NOT_FOUND',_binary 'Page cannot be found.','2005-09-19 12:18:06','error msg'),('en','_msgs','AT_ERROR_PASSWORD_CHARS',_binary 'The password must contain a combination of letters, and numbers or symbols.','2010-10-07 09:26:30',''),('en','_msgs','AT_ERROR_PASSWORD_LENGTH',_binary 'Password must be at least 8 characters long.','2006-04-10 11:43:46',''),('en','_msgs','AT_ERROR_PASSWORD_MISMATCH',_binary 'Passwords did not match.','2003-05-16 13:42:17','error msg'),('en','_msgs','AT_ERROR_PATCH_ALREADY_INSTALLED',_binary 'The selected patch is already installed.','2008-04-21 15:08:55','error msg'),('en','_msgs','AT_ERROR_PATCH_DEPENDENCY',_binary 'Due to patch dependency, please install the listed patches before installing this patch: %s','2008-04-21 15:08:55','error msg'),('en','_msgs','AT_ERROR_PATCH_XML_NOT_FOUND',_binary 'Patch XML file is not found.','2008-04-21 15:08:55','error msg'),('en','_msgs','AT_ERROR_PA_ADD_COMMENT_FAILED',_binary 'Comment could not be added due to an internal error.  Please try again.','2010-03-17 16:05:53','photo album'),('en','_msgs','AT_ERROR_PA_ADD_PHOTO_FAILED',_binary 'Photo could not be added due to an internal error.  Please try again.','2010-03-17 16:06:23','photo album'),('en','_msgs','AT_ERROR_PA_CREATE_ALBUM_FAILED',_binary 'Album could not be created due to an internal error.  Please try again.','2010-03-17 16:06:36','photo album'),('en','_msgs','AT_ERROR_PA_EDIT_ALBUM_FAILED',_binary 'Album could not be edited due to an internal error.  Please try again.','2010-03-17 16:06:49','photo album'),('en','_msgs','AT_ERROR_PA_EDIT_PHOTO_FAILED',_binary 'Photo could not be edited due to an internal error.  Please try again.','2010-03-17 16:07:01','photo album'),('en','_msgs','AT_ERROR_PA_EMPTY_COMMENT',_binary 'Comment can not be empty.','2010-03-17 16:06:10','photo album'),('en','_msgs','AT_ERROR_PA_EMTPY_ALBUM_NAME',_binary 'Album name can not be empty.','2010-03-17 16:07:15','photo album'),('en','_msgs','AT_ERROR_PA_EXCEEDED_MAX_USAGE',_binary 'You have exceeded the maximum allowable memory usage for the photo album.','2010-03-17 16:08:06','photo album'),('en','_msgs','AT_ERROR_PA_MEMORY_INPUT_ERROR',_binary 'Invalid input.  Please enter a valid Integer.','2010-03-17 16:07:40','photo album'),('en','_msgs','AT_ERROR_PA_MEMORY_SQL_ERROR',_binary 'Preferences were not updated due to an internal error.  Please try again.','2010-03-17 16:07:52','photo album'),('en','_msgs','AT_ERROR_PA_PHOTO_NOT_FOUND',_binary 'Photo can not be found.','2010-03-17 16:07:27','photo album'),('en','_msgs','AT_ERROR_POLL_QUESTION_MINIMUM',_binary 'The poll must have at least two questions.','2005-07-20 10:12:40',''),('en','_msgs','AT_ERROR_QTI_WRONG_PACKAGE',_binary 'Import failed.  Please note that ATutor only supports QTI 1.2.1 import.','2008-12-15 10:04:05',''),('en','_msgs','AT_ERROR_RAND_TEST_Q_WEIGHT',_binary 'The non-required questions must all have the same weight.','2007-07-09 15:03:55',''),('en','_msgs','AT_ERROR_REGISTER_MASTER_USED',_binary 'The student ID and PIN combination you provided is either being used or is incorrect.','2005-04-04 13:01:33',''),('en','_msgs','AT_ERROR_REMOVE_WRITE_PERMISSION',_binary 'Please remove write permission from the listed files.','2008-04-21 15:08:55','error msg'),('en','_msgs','AT_ERROR_RESOURCE_NOT_DEFINED',_binary 'You did not select a resource to add.','2008-09-08 14:44:09',''),('en','_msgs','AT_ERROR_RESTORE_TOO_BIG',_binary 'The course is too small to restore this backup into.','2004-10-15 16:42:23',''),('en','_msgs','AT_ERROR_RESULTS_NOT_RELEASED',_binary 'You are not permitted to view these test results at this time.','2004-12-15 10:13:06',''),('en','_msgs','AT_ERROR_RETURNED_ROWS',_binary 'Query \"%s\" which should have returned only 1 row has returned more rows.','2013-10-16 18:57:57',''),('en','_msgs','AT_ERROR_SAME_LOCATION',_binary 'The content is already at the moved location.','2009-09-16 13:14:24',''),('en','_msgs','AT_ERROR_SAVE_BEFORE_PROCEED',_binary 'Please save the content before proceeding.','2013-03-22 16:12:34',''),('en','_msgs','AT_ERROR_SCORM_SETTINGS_SAVE_FAILED',_binary 'Save SCORM settings failed. This could mean the SCORM directory has not been setup properly. See the SCORM module readme for details.','2009-11-04 14:13:40',''),('en','_msgs','AT_ERROR_SCO_DIR_NOT_EXIST',_binary 'The SCORM RTE directory does not exist. Please create a directory called <em>sco</em> in your installations top directory (example: <code>server.com/ATutor/sco</code>).','2005-05-10 10:58:58',''),('en','_msgs','AT_ERROR_SCO_DIR_NOT_WRITEABLE',_binary 'The SCORM RTE directory is not writeable. Please execute the command <code>chmod a+rwx sco</code> while in ATutor\'s top directory.','2005-05-10 11:00:08',''),('en','_msgs','AT_ERROR_SCO_DISABLED',_binary 'The SCORM 1.2 RTE has not been enabled by the Administrator.','2005-05-10 11:06:09',''),('en','_msgs','AT_ERROR_SEARCH_TERM_REQUIRED',_binary 'You must specify at least one search term.','2003-08-22 12:03:29','search form'),('en','_msgs','AT_ERROR_SECRET_ERROR',_binary 'Letters or numbers entered from the CAPTCHA image are incorrect. Try again.','2009-07-16 09:01:08',''),('en','_msgs','AT_ERROR_SELECT_ONE_ITEM',_binary 'Only <em>one</em> item must be selected.','2007-02-21 14:07:53',''),('en','_msgs','AT_ERROR_SENDING_ERROR',_binary 'There was an error sending the email message.','2005-01-18 13:34:23','mail failed to be sent'),('en','_msgs','AT_ERROR_SEND_ENROL',_binary 'You can only send a message to other members after you enroll in a course.','2003-05-16 13:42:17','error msg'),('en','_msgs','AT_ERROR_SEND_MEMBERS',_binary 'You can only send a message to others who are enrolled in the same courses as you or your contacts.','2009-06-12 11:37:40','error msg'),('en','_msgs','AT_ERROR_SESSION_COOKIES',_binary 'Session cookies must be enabled in your browser to login.','2005-07-22 13:04:11',''),('en','_msgs','AT_ERROR_SOCIAL_SETTINGS_NOT_SAVED',_binary 'Social networking settings were not saved.','2009-05-27 12:01:11',''),('en','_msgs','AT_ERROR_START_DATE_INVALID',_binary 'That start date is not valid.','2003-05-16 13:42:17','error msg'),('en','_msgs','AT_ERROR_STUD_INFO_NOT_FOUND',_binary 'Student information cannot be found.','2003-05-16 13:42:17','error msg'),('en','_msgs','AT_ERROR_TERM_EXISTS',_binary 'The term <strong>%s</strong> already exists.','2004-07-22 16:55:03',''),('en','_msgs','AT_ERROR_THEME_NOT_DELETED',_binary 'The theme could not be deleted because it is either the current default theme or the original default theme.','2005-05-10 09:27:02','theme manager deleting theme'),('en','_msgs','AT_ERROR_THEME_NOT_DISABLED',_binary 'Theme cannot be disabled because it is currently the default theme.','2005-05-09 14:27:23',''),('en','_msgs','AT_ERROR_THEME_PREVIEW_DISABLED',_binary 'Theme must be enabled before previewing','2013-12-28 10:06:02',''),('en','_msgs','AT_ERROR_TILE_AUTHENTICATION_FAIL',_binary 'The AContent authentication fails at:<br />%s.','2010-06-25 12:46:10','tile search'),('en','_msgs','AT_ERROR_TILE_IMPORT_FAIL',_binary 'AContent lesson import failed at:<br />%s','2010-06-25 12:46:28','tile search'),('en','_msgs','AT_ERROR_TOO_BIG_TO_UPLOAD',_binary 'The file size %1s is too big to be uploaded.','2012-07-25 11:42:21',''),('en','_msgs','AT_ERROR_TRANSCRIPT_ACTIVE',_binary 'You may not delete an active transcript.','2005-05-16 12:46:32',''),('en','_msgs','AT_ERROR_TRANSFORMABLE_URI_INVALID',_binary 'The AContent URL appears to be invalid. It should point to the base directory of your AContent installation, like:\r\n\r\nhttp://www.mysite.com/AContent/','2010-09-20 11:58:40',''),('en','_msgs','AT_ERROR_UNABLE_TO_FIND_TOOL',_binary 'Unable to find tool.','2013-09-07 09:58:35','admin delete LTI tool'),('en','_msgs','AT_ERROR_UNKNOWN',_binary 'An undetermined error has occurred.','2003-05-16 14:24:59','error msg'),('en','_msgs','AT_ERROR_USER_NOT_FOUND',_binary 'User not found.','2005-03-09 15:56:27',''),('en','_msgs','AT_ERROR_WRONG_PASSWORD',_binary 'Incorrect password.','2006-05-11 11:34:11',''),('en','_msgs','AT_FEEDBACK_ACCEPT_GROUP_INVITATION',_binary 'Invitation to join group was accepted.','2009-05-27 12:01:11',''),('en','_msgs','AT_FEEDBACK_ACCEPT_GROUP_REQUEST',_binary 'Request to join group was accepted.','2009-05-27 12:01:11',''),('en','_msgs','AT_FEEDBACK_ACCOUNT_APPROVED',_binary 'You have successfully upgraded to an instructor account.','2004-11-05 10:25:41','feedback msg'),('en','_msgs','AT_FEEDBACK_ACCOUNT_CONFIRMED',_binary 'Account has been confirmed.','2005-03-30 11:56:59',''),('en','_msgs','AT_FEEDBACK_ACTION_COMPLETED_SUCCESSFULLY',_binary 'Action completed successfully.','2006-09-28 11:26:07',''),('en','_msgs','AT_FEEDBACK_ADD_TEST_INTO_GRADEBOOK',_binary '\"<strong>%1$s</strong>\" cannot be added into gradebook because the following students have taken it more than once:<br />\r\n%2$s.','2008-09-25 16:01:17','gradebook'),('en','_msgs','AT_FEEDBACK_ADMIN_CREATED',_binary 'Administrator account created successfully.','2005-03-03 16:12:49',''),('en','_msgs','AT_FEEDBACK_ADMIN_DELETED',_binary 'Administrator account deleted successfully.','2005-03-03 10:49:25',''),('en','_msgs','AT_FEEDBACK_ADMIN_LOG_RESET',_binary 'Administrator Activity Log has been reset successfully.','2005-03-03 10:43:36',''),('en','_msgs','AT_FEEDBACK_ADMIN_NO_COURSES',_binary 'There are no course on this system. To create a course, click on the <strong>Courses</strong> tab above, then in the Courses sub menu click <strong>Create Course</strong>.','2013-01-30 14:19:25',''),('en','_msgs','AT_FEEDBACK_ALREADY_ENROLLED',_binary 'The following students are already enrolled: <ul> %s </ul>','2005-06-23 12:50:58','enrollment manager, students added were alread enrolled'),('en','_msgs','AT_FEEDBACK_ALREADY_REQUESTED',_binary 'You have already made a request to enroll in this course and you have not yet been approved by the instructor. You will be notifed when your request has been approved.','2005-03-17 12:55:24','private enroll, already requested approval once'),('en','_msgs','AT_FEEDBACK_ALTERNATIVE_ADDED',_binary 'Alternate added. Be sure to define the resource type for the alternative.','2008-09-08 14:43:50',''),('en','_msgs','AT_FEEDBACK_ALTERNATIVE_DELETED',_binary 'Alternative was successfully removed.','2008-09-08 14:56:39',''),('en','_msgs','AT_FEEDBACK_APPROVAL_PENDING',_binary 'Your request has been made. You will be notified when your request has been approved.','2009-09-17 14:47:54','feedback msg'),('en','_msgs','AT_FEEDBACK_ARCHIVE_EXTRACTED',_binary 'Archive has been extracted successfully.','2003-05-16 13:47:01','feedback msg'),('en','_msgs','AT_FEEDBACK_ASSIGNMENT_ADDED',_binary 'Assignment was successfully added.','2006-04-20 14:42:13',''),('en','_msgs','AT_FEEDBACK_ASSIGNMENT_HANDED_IN',_binary 'Assignment files submitted successfully.','2006-03-20 14:35:53',''),('en','_msgs','AT_FEEDBACK_ATUTOR_SOCIAL_LMS',_binary 'ATutor is now configured as a learning management system (LMS) with social networking as a module.','2009-07-17 14:20:59',''),('en','_msgs','AT_FEEDBACK_ATUTOR_SOCIAL_ONLY',_binary 'ATutor is now configured as a social networking environment. Learning management tools are turned off.','2009-07-17 14:22:01',''),('en','_msgs','AT_FEEDBACK_ATUTOR_UPDATE_AVAILABLE',_binary 'An updated version of ATutor is available! View the <a href=\"http://atutor.ca/atutor/change_log.php\">Change Log</a> for details.','2005-11-21 12:36:30',''),('en','_msgs','AT_FEEDBACK_AUTO_DISABLED',_binary 'Auto-Login has been disabled','2003-05-16 13:47:01','feedback msg'),('en','_msgs','AT_FEEDBACK_AUTO_ENABLED',_binary 'Auto-Login has been enabled. Next time you enter ATutor using this computer, you will bypass the login screen. ','2003-05-16 13:47:01','feedback msg'),('en','_msgs','AT_FEEDBACK_BASICLTI_DELETED',_binary 'External tool removed as a Learning Activity from this content page.','2011-05-27 16:09:15',''),('en','_msgs','AT_FEEDBACK_BASICLTI_SAVED',_binary 'External tool added as a Learning Activity for this content page.','2011-05-27 16:08:58',''),('en','_msgs','AT_FEEDBACK_BLOG_SUBSCRIBED',_binary 'Subscribed to blog feed.','2009-06-24 11:57:05',''),('en','_msgs','AT_FEEDBACK_BLOG_UNSUBSCRIBED',_binary 'Unsubscribed to blog feed.','2009-06-24 11:57:20',''),('en','_msgs','AT_FEEDBACK_CANCELLED',_binary 'Successfully cancelled without any changes.','2003-12-10 10:40:21',''),('en','_msgs','AT_FEEDBACK_CLOSED',_binary 'Successfully closed','2004-05-03 11:26:52',''),('en','_msgs','AT_FEEDBACK_CONFIG_SAVED',_binary 'System preferences have been saved successfully. A backup of the old configuration file was created and saved as %s (it\'s in your content directory).','2005-03-29 15:22:14',''),('en','_msgs','AT_FEEDBACK_CONFIRMATION_SENT',_binary 'An email confirmation message has been sent.','2005-03-22 12:07:10',''),('en','_msgs','AT_FEEDBACK_CONFIRM_EMAIL',_binary 'An email message has been sent to the new email address you specified. You must follow the instructions in that email for the changes to take effect.','2006-05-11 15:55:32',''),('en','_msgs','AT_FEEDBACK_CONFIRM_EMAIL2',_binary 'An email with instructions on retrieving your password has been sent.','2006-05-10 10:23:41',''),('en','_msgs','AT_FEEDBACK_CONFIRM_GOOD',_binary 'Your email address has been confirmed successfully.','2005-04-11 10:29:29',''),('en','_msgs','AT_FEEDBACK_CONTACTS_UNCHANGED',_binary 'Your contacts were <strong>unchanged.</strong>','2013-10-16 19:21:55',''),('en','_msgs','AT_FEEDBACK_CONTACTS_UPDATED',_binary 'Your contacts were successfully updated.','2013-10-16 19:20:05',''),('en','_msgs','AT_FEEDBACK_CONTENT_DELETED',_binary 'Content was successfully deleted','2003-05-16 13:47:01','feedback msg'),('en','_msgs','AT_FEEDBACK_CONTENT_DIR_CREATED',_binary 'Content directory created successfully.','2003-10-15 12:20:11',''),('en','_msgs','AT_FEEDBACK_COURSE_DEFAULT_FSIZE',_binary 'The \'Max File Size\' was set to \'Default\' as the entered file size was either empty or negative.','2003-10-14 16:13:40','course properites: file size was set to default'),('en','_msgs','AT_FEEDBACK_COURSE_EMAIL_RECIPIENT_LIST',_binary 'Course emails were successfully sent to: <ul> %s </ul>','2013-12-06 18:37:08',''),('en','_msgs','AT_FEEDBACK_COURSE_PREFS_SAVED',_binary 'Course preferences were saved','2003-05-16 13:47:01','feedback msg'),('en','_msgs','AT_FEEDBACK_COURSE_PROPERTIES',_binary 'Course properties were successfully updated.','2003-05-16 13:47:01','feedback msg'),('en','_msgs','AT_FEEDBACK_COURSE_REMOVED',_binary 'Course was removed successfully.','2003-05-16 13:47:01','feedback msg'),('en','_msgs','AT_FEEDBACK_CREATE_NEW_COURSE',_binary 'To create a new course, enter at least a course title in the form below. For additional details see the Create Course handbook page linked above.','2012-08-20 10:33:46','bounce'),('en','_msgs','AT_FEEDBACK_DIRS_MOVED',_binary 'Directories successfully moved.','2004-11-10 14:12:11','file manager'),('en','_msgs','AT_FEEDBACK_DIR_DELETED',_binary 'Folder was successfully deleted.','2003-05-16 13:47:01','feedback msg'),('en','_msgs','AT_FEEDBACK_ENROLLED',_binary 'The following unique accounts were successfully added to the course list: <ul> %s </ul>','2005-06-23 12:51:35','enrollment manager, confirm enrollmnet'),('en','_msgs','AT_FEEDBACK_ERROR_LOG_RESET',_binary 'The error log was reset successfully.','2005-03-10 15:53:27','error logging'),('en','_msgs','AT_FEEDBACK_EXPORT_CANCELLED',_binary 'Export cancelled successfully.','2003-05-16 13:47:01','feedback msg'),('en','_msgs','AT_FEEDBACK_FILES_MOVED',_binary 'Files moved successfully.','2006-03-20 16:10:58',''),('en','_msgs','AT_FEEDBACK_FILEUPLOAD_DONE',_binary 'File(s) uploaded.','2008-07-22 16:45:58','Files uploaded'),('en','_msgs','AT_FEEDBACK_FILE_EDITED',_binary 'File successfully edited.','2006-08-29 11:07:02',''),('en','_msgs','AT_FEEDBACK_FILE_EDITED_SUCCESSFULLY',_binary 'File edited successfully.','2006-03-20 15:05:28',''),('en','_msgs','AT_FEEDBACK_FILE_EXISTS',_binary 'The file <strong>%1$s</strong> already exists. The newly uploaded file was saved as <strong>%2$s</strong>. <a href=\"mods/_core/file_manager/index.php?overwrite=%2$s%5$spathext=%3$s%5$spopup=%4$s\">Overwrite</a> the old existing file with the newer one.','2010-03-09 14:27:41','feedback msg'),('en','_msgs','AT_FEEDBACK_FILE_OVERWRITE',_binary 'File overwrite successful.','2003-05-16 13:47:01','feedback msg'),('en','_msgs','AT_FEEDBACK_FILE_PASTED',_binary 'The file was successfully pasted into the textarea below. <strong><em>Save to apply changes</em></strong>, or Cancel to return to the previously saved content.','2003-05-16 13:47:01','feedback msg'),('en','_msgs','AT_FEEDBACK_FILE_SAVED',_binary 'The file was successfully saved as <strong>%s</strong>','2005-01-10 09:35:48','file manager'),('en','_msgs','AT_FEEDBACK_FILE_UPLOADED',_binary 'File was successfully uploaded.','2003-05-16 13:47:01','feedback msg'),('en','_msgs','AT_FEEDBACK_FILE_UPLOADED_ZIP',_binary 'File was successfully uploaded. You may now <a href=\"mods/_core/file_manager/zip.php?pathext=%1$s%4$sfile=%2$s%4$spopup=%3$s\">extract</a> the file.','2010-03-09 14:28:13','feedback msg'),('en','_msgs','AT_FEEDBACK_FOLDER_EDITED_SUCCESSFULLY',_binary 'Folder edited successfully.','2006-03-20 15:42:30',''),('en','_msgs','AT_FEEDBACK_FORUM_POSTING',_binary 'To post messages to the new forum, log into ATutor as regular users or instructor.','2004-11-21 10:08:55',''),('en','_msgs','AT_FEEDBACK_FORUM_SUBSCRIBED',_binary 'You have successfully subscribed to the <strong>%s</strong> forum. Messages posted to this forum will be delivered to your registered email address. View your profile to modify your email address.','2004-12-02 15:04:51',''),('en','_msgs','AT_FEEDBACK_FORUM_UNSUBSCRIBED',_binary 'You have successfully unsubscribed from the <strong>%s</strong> forum. Messages posted to this forum will no longer be delivered to your email address.','2004-12-03 17:25:43',''),('en','_msgs','AT_FEEDBACK_GADGET_ADDED_SUCCESSFULLY',_binary 'Gadget was successsfully added.','2009-05-27 12:01:11',''),('en','_msgs','AT_FEEDBACK_GADGET_REMOVED_SUCCESSFULLY',_binary 'Gadget was successsfully removed.','2009-05-27 12:01:11',''),('en','_msgs','AT_FEEDBACK_GADGET_SETTINGS_SAVED',_binary 'Gadget settings have been saved.','2009-05-28 17:21:14',''),('en','_msgs','AT_FEEDBACK_GOOGLE_KEY_SAVED',_binary 'Google key saved successfully.','2005-10-20 11:07:29',''),('en','_msgs','AT_FEEDBACK_GRADEBOOK_UPDATED',_binary 'The following grades have been successfully updated into gradebook: <ul> %s </ul>','2008-09-25 16:01:17','gradebook'),('en','_msgs','AT_FEEDBACK_GROUP_CREATED',_binary 'Group was successfully created.','2009-05-27 12:01:11',''),('en','_msgs','AT_FEEDBACK_GROUP_DELETED',_binary 'Group deleted.','2004-11-25 15:48:40',''),('en','_msgs','AT_FEEDBACK_GROUP_EDITED_SUCCESSFULLY',_binary 'Group edited successfully.','2006-03-23 11:09:18',''),('en','_msgs','AT_FEEDBACK_GROUP_JOINED',_binary 'Group successfully joined.','2009-05-27 12:01:11',''),('en','_msgs','AT_FEEDBACK_GROUP_MEMBERS_SAVED',_binary 'Group members saved successfully.','2006-04-17 11:43:39',''),('en','_msgs','AT_FEEDBACK_GROUP_MEMBER_REMOVED',_binary 'Group member successfully removed.','2013-10-19 19:11:25','social'),('en','_msgs','AT_FEEDBACK_GROUP_TYPE_DELETED',_binary 'Group was successsfully deleted.','2006-05-23 15:33:56',''),('en','_msgs','AT_FEEDBACK_GROUP_TYPE_EDITED_SUCCESSFULLY',_binary 'Group type edited successfully.','2006-03-23 11:18:02',''),('en','_msgs','AT_FEEDBACK_GROUP_UPDATED',_binary 'Group updated successfully.','2004-11-25 15:49:09',''),('en','_msgs','AT_FEEDBACK_IMPORT_CANCELLED',_binary 'Import cancelled successfully.','2003-05-16 13:47:01','feedback msg'),('en','_msgs','AT_FEEDBACK_IMPORT_LANG_SUCCESS',_binary 'New language was successfully imported. You may enable the language using the Translate selection menu below.','2010-10-07 08:52:40','admin language manager'),('en','_msgs','AT_FEEDBACK_IMPORT_SUCCEEDED',_binary 'Import was successful.','2008-10-02 13:48:16',''),('en','_msgs','AT_FEEDBACK_INVITATION_SENT',_binary 'Invitation successfully sent. Person will be added when the invitation has been accepted.','2009-05-27 12:01:11',''),('en','_msgs','AT_FEEDBACK_JOIN_REQUEST_SENT',_binary 'Request to join group has been sent. You will be added to the group when your request has been approved.','2009-05-27 12:01:11',''),('en','_msgs','AT_FEEDBACK_LANG_ADDED',_binary 'New language was successfully created. Use the language selector to choose the new language, then beginning adding translated terms. Translation tools are enabled in include/vitals.inc.php','2004-11-20 20:14:55',''),('en','_msgs','AT_FEEDBACK_LANG_DELETED',_binary 'Language was successfully removed.','2003-06-05 19:38:01','admin language manager'),('en','_msgs','AT_FEEDBACK_LANG_UPDATED',_binary 'Language successfully updated.','2005-04-26 16:04:36',''),('en','_msgs','AT_FEEDBACK_LEFT_GROUP_SUCCESSFULLY',_binary 'Successfully removed from group.','2009-05-27 12:01:11',''),('en','_msgs','AT_FEEDBACK_LINK_ADDED',_binary 'Link added successfully.  Link will become visible if approved.','2005-02-23 12:07:59',''),('en','_msgs','AT_FEEDBACK_LOGIN_SUCCESS',_binary 'You have logged in successfully.','2012-08-20 10:38:28',''),('en','_msgs','AT_FEEDBACK_LOGIN_SUCCESS_AUTO_ENROLL',_binary 'You have successfully logged in and have been successfully enrolled in the following courses: <ul> %s </ul>','2013-12-18 18:08:32',''),('en','_msgs','AT_FEEDBACK_LOGOUT',_binary 'You have successfully been logged out.','2003-10-29 10:00:12','after logging out'),('en','_msgs','AT_FEEDBACK_MASTER_LIST_NO_CHANGES',_binary 'No changes were done to the Master Student List.','2005-06-16 12:32:19','When action to master list yields no changes'),('en','_msgs','AT_FEEDBACK_MASTER_LIST_UPLOADED',_binary 'Master Student List has been updated successfully.','2005-04-04 16:12:52',''),('en','_msgs','AT_FEEDBACK_MEMBERS_ALUMNI',_binary 'Student has been assigned alumni status.','2004-12-02 11:42:06',''),('en','_msgs','AT_FEEDBACK_MEMBERS_ENROLLED',_binary 'The selected students were successfully enrolled in the course.','2004-12-02 11:42:37','enrollment manager, confirm enrollment'),('en','_msgs','AT_FEEDBACK_MEMBERS_REMOVED',_binary 'The selected users were successfully removed from the course','2004-10-18 10:58:17','enrollment manager, confirm removal'),('en','_msgs','AT_FEEDBACK_MEMBERS_UNENROLLED',_binary 'The selected users were successfully un-enrolled from the course','2004-10-18 10:59:09','enrollemnt manager, confrm unenrollment'),('en','_msgs','AT_FEEDBACK_MOBILE_OFF',_binary 'Mobile theme turned off. Using responsive theme.','2013-12-15 11:00:42',''),('en','_msgs','AT_FEEDBACK_MOBILE_ON',_binary 'Mobile theme turned on.','2013-12-15 11:01:04',''),('en','_msgs','AT_FEEDBACK_MOD_INSTALLED',_binary 'Module successfully installed. Select the installed module from the list below, and press <strong>Enable</strong> to turn it on.','2008-10-24 14:05:27',''),('en','_msgs','AT_FEEDBACK_MOVED_FILES',_binary 'Files successfully moved.','2004-11-10 14:11:19','file manager'),('en','_msgs','AT_FEEDBACK_NOTIFY_OFF',_binary 'Calendar notifications now turned off.','2013-09-17 15:44:39','turn off calendar notification'),('en','_msgs','AT_FEEDBACK_NOTIFY_ON',_binary 'Calendar notifications are now turned on.','2013-09-17 15:43:27','calendar enalbe feedback'),('en','_msgs','AT_FEEDBACK_NOT_ENROLLED',_binary 'The following students were not enrolled: <ul> %s </ul>','2005-06-23 12:50:31','When a student was not enrolled when imported/created.'),('en','_msgs','AT_FEEDBACK_NOW_ENROLLED',_binary 'You are now enrolled in the %s course. You may enter the course at any time. To un-enroll, select \"Un-Enroll\" next to the course listing in My Courses.','2010-06-02 10:39:43',''),('en','_msgs','AT_FEEDBACK_NO_A4A_FOR_PLAIN_TEXT',_binary 'Defining adapted content is only available for content type \"html\".','2010-10-18 14:52:08','adapted content'),('en','_msgs','AT_FEEDBACK_NO_RESOURCES',_binary 'No resources found in this content page.','2010-10-18 14:49:41','adapted content'),('en','_msgs','AT_FEEDBACK_PACKAGES_IMPORT_SUCCESS',_binary 'The packages<ol> %s </ol>were imported successfully.','2005-05-17 12:03:34',''),('en','_msgs','AT_FEEDBACK_PACKAGE_IMPORT_SUCCESS',_binary 'The package &quot;%s&quot; was imported successfully.','2005-05-17 12:03:10',''),('en','_msgs','AT_FEEDBACK_PASSWORD_CHANGED',_binary 'Password changed successfully. You may now login using the new password.','2006-05-09 14:22:35',''),('en','_msgs','AT_FEEDBACK_PASSWORD_SUCCESS',_binary 'Your login and password have been successfully emailed.','2005-01-18 14:29:55',''),('en','_msgs','AT_FEEDBACK_PATCH_CREATED_SUCCESSFULLY',_binary 'The patch has been created successfully.','2008-04-21 15:11:31','feedback msg'),('en','_msgs','AT_FEEDBACK_PATCH_INSTALLED_SUCCESSFULLY',_binary 'The patch has been installed successfully.','2008-04-21 15:08:55','feedback msg'),('en','_msgs','AT_FEEDBACK_POST_ADDED_SUCCESSFULLY',_binary 'Blog message was successfully posted.','2006-05-22 12:35:15',''),('en','_msgs','AT_FEEDBACK_PREFS_LOGIN',_binary 'You cannot save these preferences because you are not logged in.','2003-05-16 13:47:01','feedback msg'),('en','_msgs','AT_FEEDBACK_PRIVS_CHANGED',_binary 'Privileges updated successfully.','2005-08-24 11:21:49',''),('en','_msgs','AT_FEEDBACK_PROFILE_CREATED_ADMIN',_binary 'User account created successfully.','2005-03-29 15:19:07','admin create user'),('en','_msgs','AT_FEEDBACK_PROFILE_UNCHANGED',_binary 'Profile was saved but unchanged.','2013-10-14 15:11:01',''),('en','_msgs','AT_FEEDBACK_PROFILE_UPDATED',_binary 'Your Profile was successfully updated.','2003-05-16 13:47:01','feedback msg'),('en','_msgs','AT_FEEDBACK_PROFILE_UPDATED_ADMIN',_binary 'The user profile was successfully updated','2004-12-17 11:47:52','change user profile from admin area'),('en','_msgs','AT_FEEDBACK_QUESTION_DELETED',_binary 'Question was successfully deleted.','2003-05-16 13:47:01','feedback msg'),('en','_msgs','AT_FEEDBACK_QUESTION_REMOVED',_binary 'Question was successfully removed from test/survey.','2004-11-24 10:03:12',''),('en','_msgs','AT_FEEDBACK_QUESTION_UPDATED',_binary 'Question was successfully updated.','2003-05-16 13:47:01','feedback msg'),('en','_msgs','AT_FEEDBACK_REG_THANKS',_binary 'Thank you for registering, please <a href=\"login.php\">login</a>.','2003-09-25 14:39:50','feedback msg'),('en','_msgs','AT_FEEDBACK_REG_THANKS_CONFIRM',_binary 'Thank-you for registering. Please follow the instructions in the email we sent you on how to confirm your account. You will need to confirm your account before you can login.','2005-03-22 11:29:22',''),('en','_msgs','AT_FEEDBACK_REJECT_GROUP_INVITATION',_binary 'Invitation to join group was rejected.','2009-05-27 12:01:11',''),('en','_msgs','AT_FEEDBACK_REJECT_GROUP_REQUEST',_binary 'Request to join group was rejected.','2009-05-27 12:01:11',''),('en','_msgs','AT_FEEDBACK_REQUEST_FRIEND_ADDED',_binary 'Your request has been sent. Your new contact will be added when the person has accepted your request.','2009-05-27 12:01:11',''),('en','_msgs','AT_FEEDBACK_RESOURCE_PROPERTIES_UPDATED',_binary 'Resource properties have been successfully updated.','2008-10-19 14:20:47',''),('en','_msgs','AT_FEEDBACK_RESULTS_UPDATED',_binary 'Result was successfully updated.','2003-05-16 13:47:01','feedback msg'),('en','_msgs','AT_FEEDBACK_RESULT_DELETED',_binary 'Successfully deleted selected results.','2008-08-20 15:02:07','feedback msg'),('en','_msgs','AT_FEEDBACK_SCORM_SETTINGS_SAVED',_binary 'SCORM settings have been saved.','2010-12-08 19:22:28',''),('en','_msgs','AT_FEEDBACK_SOCIAL_GROUP_UPDATED',_binary 'Group successfully updated.','2009-05-27 12:01:11',''),('en','_msgs','AT_FEEDBACK_SOCIAL_SETTINGS_SAVED',_binary 'Social networking settings have been saved.','2009-05-27 12:01:11',''),('en','_msgs','AT_FEEDBACK_STUDENT_TOOLS_SAVED',_binary 'Student tools successfully updated','2008-11-07 09:56:08',''),('en','_msgs','AT_FEEDBACK_SUBSITE_INSTALL_MODULE',_binary 'Contact <a href=\"mailto:%s\">ATutor system administrator</a> to request for the installation of a new module that is not on this list.','2012-07-24 09:49:41',''),('en','_msgs','AT_FEEDBACK_THEME_DEFAULT',_binary 'The theme, <b>%s</b>, is now the default theme.','2004-10-18 15:17:47','Theme Manager'),('en','_msgs','AT_FEEDBACK_THEME_DISABLED',_binary 'The theme, <b> %s</b>, has been disabled successfully <b>(users currently using the theme will still be able to use the theme until it is deleted)</b>','2004-10-19 16:55:20','theme manager'),('en','_msgs','AT_FEEDBACK_THREAD_LOCKED',_binary 'Thread has been successfully <strong><em>locked</em></strong>.','2003-05-16 13:47:01','feedback msg'),('en','_msgs','AT_FEEDBACK_THREAD_SUBSCRIBED',_binary 'You have successfully subscribed to the <strong>%s</strong> thread. Messages posted to this thread will be forwarded to your registered email address. View your profile to modify your email address.','2004-12-02 16:21:03','forum threads'),('en','_msgs','AT_FEEDBACK_THREAD_UNLOCKED',_binary 'Thread has been successfully <strong><em>unlocked</em></strong>.','2003-05-16 13:47:01','feedback msg'),('en','_msgs','AT_FEEDBACK_THREAD_UNSUBSCRIBED',_binary 'You have successfully unsubscribed from the <strong>%s</strong> thread. Messages will no longer be sent to your email address.','2004-12-02 16:34:13','forum threads'),('en','_msgs','AT_FEEDBACK_TILE_IMPORT_SUCCESS',_binary 'Content imported into AContent successfully. <br /><a href=\"%s\" target=\"_new\">View imported content in AContent in a new window</a>','2010-06-25 12:47:25','tile search'),('en','_msgs','AT_FEEDBACK_TOOLS_OFF',_binary 'Course management tools have been turned off. You can still access tools under the <strong>Manage</strong> tab above.','2013-09-30 16:32:13','course admin switch'),('en','_msgs','AT_FEEDBACK_TOOLS_ON',_binary 'Course management tools have been turned on.','2013-09-30 16:30:59',''),('en','_msgs','AT_FEEDBACK_TRANSFORMABLE_CONFIG_SAVED',_binary 'Your AContent settings have been saved.','2010-06-09 15:25:01',''),('en','_msgs','AT_FEEDBACK_UPDATE_GRADEBOOK',_binary '\"<strong>%1$s</strong>\" cannot be updated into gradebook because the following students have taken it more than once:<br />\r\n%2$s.','2008-09-25 16:01:17','gradebook'),('en','_msgs','AT_FEEDBACK_UPGRADE_IE',_binary 'For an optimal experience, this theme be used with Internet Explorer 8 or higher.','2012-06-29 13:04:12',''),('en','_msgs','AT_INFOS_404_BLURB',_binary 'The page you are trying to access <i>%s</i> does not exist, or has been moved. Try using the <a href=\"mods/_standard/sitemap/sitemap.php\">SiteMap</a> to find it.','2010-03-09 14:29:53','/404.php'),('en','_msgs','AT_INFOS_ACCESS_PUBLIC',_binary 'This feature is only available for protected or private courses.','2007-02-13 15:55:47',''),('en','_msgs','AT_INFOS_ACCOUNT_APPROVED',_binary 'You have successfully upgraded to an instructor account.','2004-02-12 12:52:57',''),('en','_msgs','AT_INFOS_ALREADY_ENROLLED',_binary 'You have already made a request to enroll in this course and you have not yet been approved by the instructor. You will be notifed when your request has been approved.','2004-11-05 10:29:01',''),('en','_msgs','AT_INFOS_APPROVAL_PENDING',_binary 'Your request has been made. You will be notified when your request has been approved.<br /><br />Return to <a href=\"users/index.php\">My Courses</a>.','2009-09-17 14:48:30',''),('en','_msgs','AT_INFOS_ASSIGNMENT_FS_SUBMISSIONS',_binary 'Assignments can be submitted using the Assignment Dropbox or through My Files in the  File Storage tool. Assign an assignment to all students, or create a group and enable File Storage for that group, to add an assignment drop-box.','2011-05-30 10:08:46',''),('en','_msgs','AT_INFOS_AUTO_ENROLL_ALREADY_ENROLLED',_binary 'You are already enrolled to the following courses: <ul> %s </ul>','2014-01-19 15:58:03','auto enroll'),('en','_msgs','AT_INFOS_CANNOT_CONNECT_GITHUB_SERVER',_binary 'Failed to connect to GitHub server to determine if the files that will be modified by the Patcher differ from the original versions of those files. So, to protect any customizations you have made, your local files are assumed to be customized. You may choose to ignore and continue, or create backups of your file just in case.','2013-12-10 18:01:45',''),('en','_msgs','AT_INFOS_CANNOT_CONNECT_MOD_SERVER',_binary 'Unable to connect to module server. Be sure your Internet connection is functioning, and your firewall is not blocking access.','2009-12-16 18:45:05',''),('en','_msgs','AT_INFOS_CANNOT_CONNECT_PATCH_SERVER',_binary 'Failed to connect to patch server: %s so patches provided by the patch server can not be listed. Please proceed with installing private patch.','2008-10-08 12:51:54',''),('en','_msgs','AT_INFOS_COURSE_ENDED',_binary 'This course has ended on %s.','2007-07-16 11:56:16',''),('en','_msgs','AT_INFOS_COURSE_RELEASE',_binary 'This course has not yet been released. It is scheduled to be released on %s.','2006-04-11 12:36:49',''),('en','_msgs','AT_INFOS_CREATE_TESTS',_binary 'There are no tests in this course. Follow these steps to create a test:\r\n<ol>\r\n<li>Open the Question Bank tab to create questions.</li>\r\n<li>Open the Create Test/Survey tab and define the properties for the test. (don\'t forget to set the start date)</li>\r\n<li>Choose the test just created, click on the Questions button then open the Add Questions tab to choose the questions you just created.</li>\r\n<li>Open the Tests & Surveys handbook page above for additional details about creating and configuring tests.</li>\r\n</ol>','2013-12-28 19:04:13',''),('en','_msgs','AT_INFOS_DECISION_NOT_REVERSED',_binary 'Decisions could not be reversed.','2004-08-18 12:08:25','AChecker - can\'t reverse decision'),('en','_msgs','AT_INFOS_DECISION_NOT_SAVED',_binary 'Decisions could not be saved.','2004-08-18 12:09:38','AChecker - can\'t save decision'),('en','_msgs','AT_INFOS_DECISION_REVERSED',_binary 'Decision reversed successfully.','2004-08-18 12:07:27','AChecker - reverse decision'),('en','_msgs','AT_INFOS_FEATURE_NOT_AVAILABLE',_binary 'This feature is not available.','2007-02-26 11:12:45',''),('en','_msgs','AT_INFOS_FIRST_PREFS',_binary 'Your personal preferences have not been setup yet. You can click on the icon next to you name above to open the personal preferences wizard, or ignore this message and use the default settings. You can adjust your preferences later under the <a href=\"users/preferences.php\" style=\"color:red;\">Preferences</a> tab on My Start Page.','2013-12-29 12:25:09','pref wizard'),('en','_msgs','AT_INFOS_GLOSSARY_REMAINS',_binary 'Note that removing a linked glossary term from your content will <strong>not</strong> delete the term from the glossary.','2003-05-16 13:45:50','info msg'),('en','_msgs','AT_INFOS_INBOX_SENT_MSGS_TTL',_binary 'Sent messages are automatically deleted every %s days.','2007-02-20 14:19:34',''),('en','_msgs','AT_INFOS_INVALID_URL',_binary 'Localhost is not a valid URL','2004-08-18 12:03:14','Used when AChecker reading URL'),('en','_msgs','AT_INFOS_INVALID_USER',_binary 'You must <a href=\"login.php?course=%s\">login</a> to use this section.','2004-04-15 13:52:32',''),('en','_msgs','AT_INFOS_LOGIN_ENROL',_binary 'You must be logged in to enroll in a course.','2014-05-10 12:49:16',''),('en','_msgs','AT_INFOS_LOGIN_TO_POST',_binary 'You must be logged in to post.','2004-11-05 10:29:51','info msg'),('en','_msgs','AT_INFOS_MASTER_LIST_DISABLED',_binary 'The master list has been disabled.  To enable this functionality go to <a href=\"admin/config_edit.php\">System Preferences</a>.','2005-05-10 15:16:13',''),('en','_msgs','AT_INFOS_MAX_ATTEMPTS',_binary 'This test is not currently available at this time.  If you have already completed this test. Please visit <a href=\"mods/_standard/tests/my_tests.php\">Tests & Surveys</a> to see your results.','2010-10-05 12:23:45',''),('en','_msgs','AT_INFOS_MSG_SEND_LOGIN',_binary 'You must be logged in to send messages.','2003-05-16 13:42:17','info msg'),('en','_msgs','AT_INFOS_NOT_ENROLLED',_binary 'You need to be enrolled in this course to access this area.','2004-05-12 11:35:43',''),('en','_msgs','AT_INFOS_NOT_IN_ANY_GROUPS',_binary 'You are not in any groups, or there are no groups created in this course.','2013-12-14 10:44:40','groups'),('en','_msgs','AT_INFOS_NOT_RELEASED',_binary 'This content has not yet been released. It is scheduled to be released on %s.','2005-11-22 15:21:27','info msg'),('en','_msgs','AT_INFOS_NO_CONTENT',_binary 'This course has no content yet.','2003-05-16 13:45:50','info msg'),('en','_msgs','AT_INFOS_NO_COURSES',_binary 'No courses found. <a href=\"./users/browse.php\">Browse</a> existing courses.','2006-11-24 15:24:59',''),('en','_msgs','AT_INFOS_NO_COURSES_INST',_binary 'No courses found. <a href=\"./browse.php\">Browse</a> existing courses or <a href=\"./mods/_core/courses/users/create_course.php\">create</a> a new one.','2010-03-09 14:07:35',''),('en','_msgs','AT_INFOS_NO_FORUMS',_binary 'There are no forums that exist.','2008-11-07 10:43:18',''),('en','_msgs','AT_INFOS_NO_LINK_CATEGORIES',_binary 'There are currently no link categories.  A link may not be suggested until link categories have been created.','2005-03-16 16:47:22',''),('en','_msgs','AT_INFOS_NO_PACKAGES',_binary 'No packages found.','2005-05-17 12:03:52',''),('en','_msgs','AT_INFOS_NO_PAGE_CONTENT',_binary 'There is no content on this page.','2003-05-16 13:45:50','info msg'),('en','_msgs','AT_INFOS_NO_PERMISSION',_binary 'You do not have permission to access this page.','2003-05-16 13:45:50','info msg'),('en','_msgs','AT_INFOS_NO_POLLS',_binary 'No polls are available right now.','2005-03-22 10:52:43','no active polls'),('en','_msgs','AT_INFOS_NO_POSTS_FOUND',_binary 'There are no posts in this forum.','2003-05-16 13:45:50','info msg'),('en','_msgs','AT_INFOS_NO_PROXY_TOOLS',_binary 'No external tools are currently available. If enabled see Manage>External Tools to add or manage your tools. Or, ask your administrator to add tools for you.','2014-05-19 13:03:18','external tools'),('en','_msgs','AT_INFOS_NO_SEARCH_RESULTS',_binary 'No search results.','2003-08-22 11:31:53','search page'),('en','_msgs','AT_INFOS_NO_STUDENTS',_binary 'There are no students enrolled in this course.','2005-03-22 11:09:35',''),('en','_msgs','AT_INFOS_NO_TESTS',_binary 'No tests available. Create tests using the Tests & Surveys manager.','2010-06-17 12:29:49',''),('en','_msgs','AT_INFOS_NO_TOOLS_FOUND',_binary 'No student tools are turned on. Turn them on through Manage>Student Tools','2008-12-11 11:02:22','FHA student tools screen'),('en','_msgs','AT_INFOS_OVER_QUOTA',_binary 'You have reached or passed your maximum quota for this course. You will have to delete some files before you will be able to upload again.','2003-10-07 15:06:28',''),('en','_msgs','AT_INFOS_PATCH_INSTALLED_AND_REMOVE_PERMISSION',_binary 'The patch has been installed. Please remove write permission as instructed below.','2008-04-22 14:10:33','info msg'),('en','_msgs','AT_INFOS_PRETEST',_binary 'You must take the prerequisite test in order to view the content.','2009-11-13 15:52:44','content'),('en','_msgs','AT_INFOS_PRETEST_EXPIRED',_binary 'You can\'t view this content because the prerequisite test <span style=\"font-weight:bold\">\"%s\"</span> has expired. Please contact your instructor.','2009-11-30 14:40:06',''),('en','_msgs','AT_INFOS_PRETEST_FAILED',_binary 'You this cannot view this content because you have not passed the prerequisite test <span style=\"font-weight:bold\">\"%s\"</span>.','2009-11-13 15:51:50','edit/create folder'),('en','_msgs','AT_INFOS_PRETEST_NO_PRIV',_binary 'You can\'t view this content before taking the prerequisite test <span style=\"font-weight:bold\">\"%s\"</span>.','2009-11-13 15:51:15',''),('en','_msgs','AT_INFOS_PRIVATE_ENROL',_binary 'The course you are trying to access is <strong>private</strong>. Enrollment in this course requires instructor approval.<br />','2003-10-24 15:31:11','info msg'),('en','_msgs','AT_INFOS_REG_DISABLED',_binary 'Public registration is disabled.','2008-09-10 14:09:17','registration form'),('en','_msgs','AT_INFOS_REMEDIAL_CONTENT_AVAILABLE',_binary 'Remedial Content available for this test %s','2013-01-23 14:52:04',''),('en','_msgs','AT_INFOS_SAVE_CONTENT',_binary 'Content must be saved before using this tool.','2008-11-11 15:49:25','AChecker requirement in ATutor content'),('en','_msgs','AT_INFOS_SERVICE_UNAVAILABLE',_binary 'Service currently unavailable.','2004-08-18 12:00:53','Used for AChecker'),('en','_msgs','AT_INFOS_TRACKING_NO',_binary 'Tracking information is <strong>not</strong> collected for course instructors. See Manage>Content>Usage for student tracking data.','2013-11-12 19:14:55','My Tracker'),('en','_msgs','AT_INFOS_TRACKING_NO_INST',_binary 'You have chosen your own ID number. Tracking information is not recorded for course instructors. Choose another user.','2003-10-24 15:31:44','info msg'),('en','_msgs','AT_INFOS_TRACKING_NO_INST1',_binary 'Tracking information is not recorded for course instructors. See the <a href=\"mods/_standard/tracker/course_tracker.php\">Course Tracker</a> for a record of course activity.','2010-03-09 14:33:16','info msg'),('en','_msgs','AT_INFOS_TRACKING_OFFIN',_binary 'Tracking is not enabled for this course. Contact your system administrator to have it turned on.','2003-05-16 13:45:50','info msg'),('en','_msgs','AT_INFOS_TRACKING_OFFST',_binary 'Tracking is not enabled for this course.','2003-05-16 13:45:50','info msg'),('en','_msgs','AT_WARNING_CANNOT_REGISTER_LOGGEDIN',_binary 'You cannot access this page while you are logged in.','2013-02-01 11:44:08',''),('en','_msgs','AT_WARNING_CHAT_TRAN_EXISTS',_binary 'A transcript with the name %s already exits. Either delete the original transcript, then resubmit, or rename your new transcript.','2003-06-02 14:05:26','achat instructor transcript tool'),('en','_msgs','AT_WARNING_DELETE_CATEGORY',_binary 'Are you sure you want to delete this category with all its links?','2003-05-16 13:46:16','warning msg'),('en','_msgs','AT_WARNING_LANG_EXISTS',_binary 'The language you are uploading is already installed on this system. Delete the existing language first by selecting the \"<strong>Remove</strong>\" link next to its listing below.','2003-06-06 09:40:14','admin language manager'),('en','_msgs','AT_WARNING_MAIL_NOT_ON',_binary 'Mail configuration is not set properly. You may not be able to send out emails. See <a href=\"http://www.atutor.ca/atutor/docs/faq.php\">ATutor FAQ</a> for details.','2009-12-08 16:18:50',''),('en','_msgs','AT_WARNING_QUESTION_WEIGHT',_binary 'One or more of the questions on this test do not have points associated with them.  Ensure that this is correct, or enter values for questions that do not have points.','2007-03-05 15:52:54',''),('en','_msgs','AT_WARNING_SAVE_YOUR_WORK',_binary 'Save your work before opening or closing the File Manager.','2003-05-16 13:46:16','warning msg'),('en','_msgs','AT_WARNING_THEME_VERSION_DIFF',_binary 'The theme, <b>%s</b>, may not be compatible with this version of Atutor.','2004-10-19 14:34:35','Theme Manager'),('en','_msgs','AT_WARNING_TRANSLATE_ON',_binary 'You are currently in Translation Mode. Any user can access the translation page at this time. To turn off the Translate mode please set AT_DEVEL_TRANSLATE in /include/vitals.inc.php to zero.','2004-12-09 10:53:02','admin index and admin language manager'),('en','_template','15_max_chars',_binary '8 characters minimum, 15 characters maximum','2010-07-28 19:26:52',''),('en','_template','20_max_chars',_binary '20 character maximum','2003-06-04 14:52:27','login name registration screen'),('en','_template','404',_binary 'Error: Missing Page','2004-03-10 11:24:10',''),('en','_template','a',_binary 'A','2007-01-10 13:47:54',''),('en','_template','a4a_export',_binary 'Export AccessForAll adapted content.','2008-10-19 15:12:28','content editor'),('en','_template','a4a_import_package',_binary 'Import available AccessForAll adapted content.','2008-10-21 11:44:08',''),('en','_template','abacus',_binary 'Abacus','2008-09-09 09:03:56',''),('en','_template','about_atutor',_binary 'About ATutor','2004-01-14 10:25:40',''),('en','_template','about_atutor_help_text',_binary 'Learn about various sources of ATutor help, and the help display options available.','2004-05-19 10:40:00',''),('en','_template','about_content_tests',_binary 'Link available tests to this content page.','2008-09-23 13:46:28','content editor tests tab'),('en','_template','about_content_tools',_binary 'Select from the available external tools, one that can be associated with this content page as a learning activity. Or, though  Manage>IMS Basic LTI add your own external tools to make them available here.','2011-05-27 16:08:42',''),('en','_template','about_pretest',_binary 'Select from the available tests one or more that must be passed before the student can view this content.','2010-09-28 16:29:00','edit/create folder'),('en','_template','about_private',_binary 'Available only to users with an ATutor System Account, and Instructor approved enrollment. Login required. Enrollment is required.','2004-01-22 14:54:29',''),('en','_template','about_protected',_binary 'Available only to users with an ATutor System Account. Login required. Enrollment is optional.','2004-02-05 09:43:13',''),('en','_template','about_public',_binary 'Available to all users with or without an ATutor System Account. Login not required. Enrollment is optional.','2004-02-05 09:42:59',''),('en','_template','accept_late_submissions',_binary 'Accept Late Submissions','2006-03-23 11:38:02',''),('en','_template','accept_request',_binary 'Accept Request','2009-05-27 12:01:11',''),('en','_template','access',_binary 'Access','2007-01-27 13:45:44','create a new course'),('en','_template','accessibility',_binary 'Accessibility','2003-05-21 13:56:28','help page'),('en','_template','accessibility_disabled',_binary 'Accessibility Validation disabled','2010-05-03 18:50:09',''),('en','_template','accessibility_enabled',_binary 'Accessibility Validation enabled','2011-08-23 10:57:54',''),('en','_template','accessibility_features',_binary 'Accessibility Features','2003-05-21 14:28:03','help'),('en','_template','accessibility_features_text',_binary 'Using ATutor with assistive technology and other accessibility features.','2003-05-21 14:00:59','help'),('en','_template','access_credit',_binary 'Accessibility report provided by <a title=\"AChecker Web Accessibility Checker (link opens in a new window)\" target=\"_new\" href=\"http://www.achecker.ca\">AChecker</a>.','2009-11-04 16:20:03','include/html/editor_tabs/accessibility.inc.php'),('en','_template','access_method',_binary 'Access Method','2003-05-18 09:07:28','tracker'),('en','_template','access_stats',_binary 'Access Method Statistics for','2005-02-07 16:22:32','context (?)'),('en','_template','account_authorization',_binary 'Account Creation Authorization','2005-05-27 13:33:38','registration page'),('en','_template','account_information',_binary 'Account Information','2003-05-18 09:14:11','control centre/registration'),('en','_template','account_settings',_binary 'Account settings','2009-05-27 12:01:11',''),('en','_template','account_status',_binary 'Account Status','2005-04-14 11:09:36',''),('en','_template','action',_binary 'Action','2004-10-14 14:10:28',''),('en','_template','active_admin',_binary 'Active Administrator','2005-03-03 11:00:47',''),('en','_template','activities',_binary 'Activities','2009-05-27 12:01:11',''),('en','_template','ac_access_groups',_binary 'Access Groups','2004-03-09 14:22:58',''),('en','_template','add',_binary 'Add','2004-11-24 14:28:53',''),('en','_template','added',_binary 'added','2010-04-21 14:36:43',''),('en','_template','added_members',_binary 'Current Group Members','2009-05-27 12:01:11',''),('en','_template','add_announcement',_binary 'Add Announcement','2003-05-18 09:17:38','course announcments/home page'),('en','_template','add_application',_binary 'Add Gadget','2009-05-27 12:01:11',''),('en','_template','add_application_url',_binary 'Add gadget by URL','2009-05-27 12:01:11',''),('en','_template','add_assignment',_binary 'Add Assignment','2006-03-23 11:36:30',''),('en','_template','add_atutor_test',_binary 'Add ATutor Assignments/Test/Surveys','2008-09-25 16:01:17','gradebook'),('en','_template','add_atutor_test_info',_binary 'Select from the available test and assignment titles, then optionally choose a  \"Grade Scale\", to add a test or assignment to the gradebook. . If \"Grade Scale\" is set to none, the raw final score will be used in place of a grade scale. Only tests with the test property \"Attempts Allowed\" set to 1 can be added to the Gradebook. Create tests using the ATutor Tests & Surveys Manager','2008-09-25 16:01:17','gradebook'),('en','_template','add_a_file',_binary 'Add A File','2008-04-21 15:11:31',''),('en','_template','add_a_new_language',_binary 'Add a new language.','2004-10-28 13:05:59',''),('en','_template','add_code',_binary 'Add Code','2004-05-06 12:22:57','Title for code tags in code picker'),('en','_template','add_content',_binary 'Create','2010-05-02 09:10:36','heading/submit button on Add Content screen'),('en','_template','add_content_folder',_binary 'Add Folder','2010-05-03 13:26:05',''),('en','_template','add_custom_logo',_binary 'Add Custom Logo','2014-06-06 19:19:43',''),('en','_template','add_dependent_patch',_binary 'Add A Dependent Patch','2008-04-21 15:11:31',''),('en','_template','add_external_test',_binary 'Add External Assignments/Tests','2008-09-25 16:01:17','gradebook'),('en','_template','add_file_folder',_binary 'Add File or Folder','2008-07-22 16:45:15','Title text used in File Manager'),('en','_template','add_glossary',_binary 'Add Glossary Term','2005-03-07 11:42:42','glossary screen'),('en','_template','add_grade_scale',_binary 'Add Grade Scale','2008-09-25 15:59:56','gradebook'),('en','_template','add_language',_binary 'Add Language','2004-09-01 15:42:32',''),('en','_template','add_link',_binary 'Add Link','2005-02-22 10:13:06',''),('en','_template','add_media',_binary 'Add Media','2009-11-04 12:48:56','content editor'),('en','_template','add_more',_binary 'Add More Students','2004-10-15 14:10:59','create student list manually in enrollment manager'),('en','_template','add_new_association',_binary 'Add new association','2009-05-27 12:01:11',''),('en','_template','add_new_award',_binary 'Add new award','2009-05-27 12:01:11',''),('en','_template','add_new_contact',_binary 'Add new alternate contact','2009-12-10 10:17:43',''),('en','_template','add_new_content',_binary 'Add Alternate Contact','2009-12-03 15:38:00',''),('en','_template','add_new_education',_binary 'Add new education','2009-05-27 12:01:11',''),('en','_template','add_new_interest',_binary 'Add new interest','2009-05-27 12:01:11',''),('en','_template','add_new_personal',_binary 'Add personal information','2009-12-07 13:47:05','Social personal info'),('en','_template','add_new_position',_binary 'Add new position','2009-05-27 12:01:11',''),('en','_template','add_new_representation',_binary 'Add new representative','2009-12-10 10:17:05',''),('en','_template','add_new_representative',_binary 'Add New Representative','2009-12-03 15:41:25',''),('en','_template','add_new_website',_binary 'Add new website','2009-05-27 12:01:11',''),('en','_template','add_poll',_binary 'Add Poll','2004-06-14 14:41:26',''),('en','_template','add_question',_binary 'Add Question','2005-10-19 12:44:11',''),('en','_template','add_questions',_binary 'Add Questions','2003-05-18 10:27:45','test manager add questions screen'),('en','_template','add_sibling_folder',_binary 'Add Folder','2010-05-03 13:26:20',''),('en','_template','add_sibling_page',_binary 'Add Page','2010-05-03 13:26:30',''),('en','_template','add_sub_folder',_binary 'Add Sub Folder','2009-09-16 13:13:00',''),('en','_template','add_sub_page',_binary 'Add Sub Page','2005-03-31 14:17:33','content page shortcuts'),('en','_template','add_term',_binary 'Add Term','2003-05-18 10:28:38','glossary'),('en','_template','add_tests',_binary 'Add Tests/Assignments','2008-09-25 16:01:17','gradebook'),('en','_template','add_topic',_binary 'Add Topic','2005-10-19 12:43:01',''),('en','_template','add_top_folder',_binary 'Add Folder','2010-08-09 08:38:27',''),('en','_template','add_top_page',_binary 'Add Page','2010-08-09 08:38:45',''),('en','_template','add_to_friends',_binary 'Add to contacts','2009-05-27 12:01:11',''),('en','_template','add_to_mygadgets',_binary 'Add to My Gadgets','2009-05-27 12:01:11',''),('en','_template','add_to_test_survey',_binary 'Add to Test/Survey','2004-11-22 16:38:53',''),('en','_template','administration',_binary 'Administration','2003-06-04 10:51:48','admin home page'),('en','_template','administrators',_binary 'Administrators','2005-03-03 10:40:40',''),('en','_template','admin_bundle_instructions',_binary 'Please select the profile(s) you wish to bundle and send via e-mail. All error logs coupled with these profiles will also be included.','2005-03-10 15:29:13','admin error reporting'),('en','_template','admin_email',_binary 'Email Users','2005-01-06 14:57:16',''),('en','_template','admin_home',_binary 'Home','2010-10-08 13:33:07',''),('en','_template','admin_log',_binary 'Administrator Activity Log','2005-03-03 10:40:27',''),('en','_template','admin_new_account',_binary 'A user account has been created for you at %1s. To access this account, please log into the site. It is strongly suggested you change your password upon logging in.','2005-06-21 16:38:21','Admin creates a new user account.'),('en','_template','admin_new_account_confirm',_binary 'An account has been created for you at %1s. To access your account, you must first confirm your email by using the following link: %2s. It is strongly suggested you change your password upon logging in.','2005-06-21 16:37:44','Admin creates a new user and confirm is ON'),('en','_template','admin_social',_binary 'Social Network Settings','2009-05-27 12:01:11',''),('en','_template','affected_entries',_binary 'Affected Entries','2005-03-03 12:14:33',''),('en','_template','after_topic',_binary 'After: %s','2004-01-16 13:19:46','content editor'),('en','_template','age',_binary 'Age','2003-05-18 10:38:32','registration, profile'),('en','_template','all',_binary 'All','2003-05-18 11:35:37','glossary'),('en','_template','allow_browse',_binary 'Course Browser','2009-07-23 15:48:57',''),('en','_template','allow_editing',_binary 'Allow Editing','2007-02-20 10:30:01',''),('en','_template','allow_guests',_binary 'Allow Guests','2007-03-06 14:44:45',''),('en','_template','allow_instructor_create_course',_binary 'Allow Instructors to Create Their own Courses','2013-01-30 12:12:34','sys prefs'),('en','_template','allow_instructor_registration',_binary 'Allow Instructors to Enroll Users from the System Registration List','2008-11-14 11:51:02',''),('en','_template','allow_instructor_requests',_binary 'Allow Instructor Requests','2005-03-03 10:51:13',''),('en','_template','allow_registration',_binary 'Allow Self-Registration','2008-09-10 14:14:38',''),('en','_template','allow_test_export',_binary 'Allow students to export tests with content packages:','2008-09-26 13:43:42',''),('en','_template','allow_unenroll',_binary 'Allow Users to Unenroll Themselves from Courses.','2008-09-10 14:16:06',''),('en','_template','all_atutor_assignments',_binary 'All ATutor Assignments','2008-09-25 16:01:17','gradebook'),('en','_template','all_atutor_tests',_binary 'All Applicable ATutor Tests &amp; Surveys','2008-09-25 16:01:17','gradebook'),('en','_template','all_available_courses',_binary 'All available courses','2004-08-18 12:03:26',''),('en','_template','all_courses',_binary 'All Courses','2005-04-01 14:08:29','forums'),('en','_template','all_failed_students',_binary 'All Failed Students','2008-03-10 11:52:03','Test/Survey Property'),('en','_template','all_forums',_binary 'Share with all courses, or','2006-06-01 14:31:37','admin create shared forum'),('en','_template','all_label',_binary 'All (%s)','2005-05-12 10:26:10',''),('en','_template','all_passed_students',_binary 'All Passed Students','2008-03-10 11:51:36','Test/Survey Property'),('en','_template','all_questions_on_page',_binary 'All questions on one page','2007-08-20 15:46:22','create/edit test'),('en','_template','all_students',_binary 'All Students','2006-03-23 13:39:11',''),('en','_template','all_users',_binary 'All Users','2005-03-10 15:24:33',''),('en','_template','already_registered',_binary 'If already registered login here','2014-01-19 16:07:17','auto enroll registration'),('en','_template','alter',_binary 'Alter','2008-04-21 15:11:31',''),('en','_template','alternate_text',_binary 'Alternate Text','2004-12-08 12:39:27','filemanager, image inset alt field'),('en','_template','alternatives',_binary 'Alternatives','2010-03-09 16:16:55','adapted content'),('en','_template','alternatives_to',_binary 'Adaptation of','2008-10-21 10:56:51',''),('en','_template','alternative_content',_binary 'Adapted Content','2008-10-19 12:03:00',''),('en','_template','alt_contact',_binary 'Alternate Contact','2009-12-03 15:40:35',''),('en','_template','alt_to_audio',_binary 'Alternatives To Audio','2010-04-12 16:36:06',''),('en','_template','alt_to_text',_binary 'Alternatives To Text','2010-04-12 16:35:54',''),('en','_template','alt_to_visual',_binary 'Alternatives To Visual','2010-04-12 16:35:59',''),('en','_template','alumni',_binary 'Alumni','2004-10-22 15:56:39',''),('en','_template','always',_binary 'Always','2006-03-23 11:38:33',''),('en','_template','american-asl',_binary 'American-ASL','2008-09-09 09:01:12',''),('en','_template','announcements',_binary 'Announcements','2003-05-18 11:36:24','course home page'),('en','_template','announcement_date_format',_binary '%%l %%F %%j, %%Y - %%H:%%i','2006-04-11 14:10:57','course home page'),('en','_template','anonymous',_binary 'Anonymous','2004-08-26 13:24:12',''),('en','_template','anonymous_test',_binary 'Anonymous','2004-08-26 12:31:05',''),('en','_template','answer',_binary 'Answer','2003-05-18 11:38:10','test question add/edit screens'),('en','_template','answers',_binary 'Answers','2007-01-10 13:47:41',''),('en','_template','answer_size',_binary 'Answer Size','2003-05-18 11:38:55','add/edit open ended question'),('en','_template','apache_mod_rewrite',_binary 'Apache mod_rewrite','2008-05-14 12:04:49',''),('en','_template','append',_binary 'Append','2008-09-09 09:02:05',''),('en','_template','append_content',_binary 'Append selected material','2004-10-15 14:18:20',''),('en','_template','append_or_replace',_binary 'Append or Replace Original Content','2008-09-09 08:56:34',''),('en','_template','applications',_binary 'Gadgets','2009-05-27 12:01:11',''),('en','_template','application_control_blurb',_binary 'Choose which gadgets to display on your networking home page.','2009-05-27 12:01:11',''),('en','_template','application_settings',_binary 'Gadget Settings','2009-05-27 12:01:11',''),('en','_template','applies_to_all_sub_pages',_binary 'Applies to all sub pages.','2007-03-01 10:23:22','edit/create content page. release date.'),('en','_template','apply',_binary 'Apply','2005-02-10 11:25:17',''),('en','_template','apply_audio_alternatives',_binary 'Apply Audio Alternatives','2010-04-21 14:34:24','alternative switcher'),('en','_template','apply_sign_lang_alternatives',_binary 'Apply Sign Language Alternatives','2010-04-21 14:35:03','alternative switcher'),('en','_template','apply_text_alternatives',_binary 'Apply Text Alternatives','2010-04-21 14:34:04','alternative switcher'),('en','_template','apply_theme_subcategories',_binary 'Apply theme to subcategories.','2004-08-04 11:35:11',''),('en','_template','apply_to_all_results',_binary 'Apply to all results','2007-02-21 11:49:40',''),('en','_template','apply_visual_alternatives',_binary 'Apply Visual Alternatives','2010-04-21 14:34:43','alternative switcher'),('en','_template','approve',_binary 'Approve','2003-05-18 11:41:29','enrol administration'),('en','_template','approved',_binary 'Approved','2005-02-23 12:17:50',''),('en','_template','approve_request',_binary 'Approve Request','2009-05-27 12:01:11',''),('en','_template','archive_total',_binary 'Archive Total','2003-05-18 11:42:55','file manager zip tool'),('en','_template','arrange_content',_binary 'Arrange','2010-05-02 08:53:12',''),('en','_template','assigned_to',_binary 'Assigned To','2005-06-02 12:18:18',''),('en','_template','assignment',_binary 'Assignment','2006-03-20 14:38:37',''),('en','_template','assignments',_binary 'Assignments','2006-03-20 14:40:50',''),('en','_template','assignment_dropbox',_binary 'Assignment Dropbox','2011-05-30 10:06:32',''),('en','_template','assignment_dropbox_text',_binary 'Submit assignments.','2011-05-30 10:06:54',''),('en','_template','assignment_due',_binary 'Assignment Due: %s - Due Date: %s','2010-03-25 15:32:59',''),('en','_template','assign_to',_binary 'Assign To','2006-03-23 11:37:44',''),('en','_template','assign_unassigned',_binary 'Assign Unassigned','2006-03-23 11:07:42',''),('en','_template','assistant',_binary 'Assistant','2006-05-23 15:24:15',''),('en','_template','assistants',_binary 'Assistants','2004-10-15 11:45:31','Assistants tab in enrollment manager'),('en','_template','associations',_binary 'Associations','2009-05-27 12:01:11',''),('en','_template','as_individual_content',_binary 'As individual content pages','2004-08-18 12:04:21',''),('en','_template','at',_binary 'at','2003-05-18 11:44:08','release date tool/links database'),('en','_template','atlas',_binary 'Atlas','2008-09-10 12:26:11','tool prefs'),('en','_template','attempts',_binary 'Attempts','2004-08-30 11:31:40',''),('en','_template','atutor_accessibility_text',_binary '<p>ATutor includes a variety of features designed to ensure that content is accessible to all potential users, including those with slow Internet connections, older Web browsers, and people with disabilities using assistive technologies to access the Web. These features are described in detail below. Depending on the theme being used, ATutor may include all or some of the features listed here. The default theme includes them all.</p>\r\n<h3>Screen Reader Settings</h3>\r\n<p>Though screen readers typically work well with ATutor, some default settings should be adjusted:</p>\r\n<ol>\r\n<li>Set screen reader Link Text setting to read the longer of either link text or associated title text.  In many cases link text needs to be truncated so it will fit in the available space. Title text associated with those shortened links will contain the full text.</li>\r\n</ol>\r\n\r\n<h3>Features</h3>\r\n<ol>\r\n<li><strong>ByPass Links:</strong> In the top left corner of ATutor is a  hidden bypass link that allows assistive technology users to skip over the navigation elements and jump directly to an anchor at the top of the content being displayed. Press the Tab key once after a page has finished loading to advance to the first bypass link then press Enter to reposition the content to the top of your screen. The content anchor can also be accessed with an accesskey [Alt-c], so it is possible to jump to the top of the content area no matter where the cursor might be located on the screen.<br /><br />\r\n\r\nOther bypass links include: \"jump past table\" so users can skip over various data table to quickly access content that may appear after the table; \"jump past codes\", so users can skip over the emoticon codes near the bottom of message posting form in the Forums.<br /><br /><br />\r\n\r\nUsers of current browsers and assistive technologies that support WAI-ARIA landmarks can take advantage of this alternate means of navigating through the ATutor interface. Pressing the semi-colon key repeatedly will cycle through all the landmarks, and once the desired landmark is announced continue reading from that point. <br />\r\n\r\n</li>\r\n\r\n<li><strong>Accesskeys:</strong> Keyboard accessibility has been added to many ATutor features. To activate accesskeys, press Alt plus the assigned number, letter, or character. Accesskeys are assigned dynamically to the tabs in the Main Navigation. The first tab will be assigned [Alt-1], the second tab will be assigned [Alt-2], and so on.  Note that not all browsers support accesskeys.<br /><br />\r\n\r\nGeneral AccessKeys\r\n<ul>\r\n<li>[Alt-1 to Alt-0] Main Navigation Tabs</li>\r\n<li>[Alt-,] Previous topic (i.e. Left angle bracket <)</li>\r\n<li>[Alt-.] Next topic (i.e. Right angle bracket > )</li>\r\n<li>[Alt-.] Resume (i.e. Right angle bracket > while outside the course content)</li>\r\n<li>[Alt-j] Jump Menu</li>\r\n<li>[Alt-s] Submit (active on many form pages)</li>\r\n<li>[Alt-c] Jump to content top (top and navigation bypass link)</li>\r\n</ul>\r\n\r\nContent Editor AccessKeys\r\n<ul>\r\n<li>[Alt-n] Content Tab</li>\r\n<li>[Alt-p] Properties Tab</li>\r\n<li>[Alt-g] Glossary Tab</li>\r\n<li>[Alt-r] Preview Tab</li>\r\n<li>[Alt-a] Accessibility Tab</li>\r\n<li>[Alt-s] Save</li>\r\n</ul>\r\n\r\nChat AccessKeys\r\n<ul>\r\n<li>[Alt-c] Jump to Compose Message field</li>\r\n<li>[Alt-r] Refresh Messages</li>\r\n<li>[Alt-m] Jump to Message List</li>\r\n<li>[Alt-q] Quit Chat</li>\r\n</ul>\r\n\r\nInbox AccessKeys\r\n<ul>\r\n<li>[Alt-r] Reply to Messages</li>\r\n</ul>\r\n<br />\r\n\r\nVisual Editor AccessKeys\r\n<ul>\r\n<li>[Alt-q] jump to button bar</li>\r\n<li>[Alt-z] jump to content area of editor</li>\r\n<li>[Alt-x] jump to element path (bottm)</li>\r\n</ul>\r\n</li>\r\n\r\n<li><strong>Accessibility Verifier: </strong>While using the ATutor Content Editor, instructors can check the accessibility of their content to be sure it can accessed by all students, including those using assistive technologies, or older technologies. While using the Content Editor, select [Alt-a] to open the accessibility verifier.</li>\r\n\r\n<li><strong>Alternative Text: </strong>All meaningful images in ATutor include a text alternative that describes the image or its function. Where images are not meaningful the Alt attribute is left empty so assistive technologies  will ignore the image.</li>\r\n\r\n<li><strong>Alternative Navigation: </strong>Global, hierarchical, and sequential navigation tools are available so users can view or structure content in a manner that suits their style of learning.  The ATutor SiteMap provides a full list of all content and tools available, so all features in a course can be accessed from a single location.</li>\r\n\r\n<li><strong>Resume/Continue: </strong>ATutor remembers the last page accessed when users leave the course content, to go to the Forums for instance, so they can quickly find their way back to where they left off. The content location is also remembered between sessions, so when returning to ATutor, users can simply choose the Resume link in the course listing on My Courses, or select the the resume link in the breadcrumbs at the top of the screen once in a course. Using the [Alt-.] accesskey will also return a user to the last content page they were viewing after they have entered into a course.</li>\r\n\r\n<li><strong>Hide Menus:</strong> For users of older assistive technologies that do not support columnar text laid out in tables, it is possible to hide ATutor\'s content navigation menu so that content will be displayed in a linear presentation. Hiding the content menu also conserves space for users viewing ATutor on smaller screens.</li>\r\n\r\n<li><strong>Search and Sort:</strong> Most data tables are accompanied by a search tool, or filter, so specific records can be displayed in the table, reducing the amount of data displayed at any given time. Most data tables can also be sorted by selecting the column header label, again allowing users to narrow down the data display.</li>\r\n\r\n<li><strong>Table  Header Associations: </strong>All data tables are marked up with the TH element and the scope attribute to ensure that screen reader users are able to navigate through data displays and understand what each data cell represents.</li>\r\n\r\n<li><strong>Form Labels: </strong>All form fields throughout ATutor are marked up using the LABEL element to ensure that they are properly described for assistive technology users. Explicit labeling in this manner also makes it possible to click on a form field\'s label to activate the field. This provides a larger target area for those people who have difficulty positioning a mouse pointer on a small form field such as a radio button or a checkbox.</li>\r\n\r\n<li><strong>Style Sheets: </strong>Wherever possible, the presentation of content in ATutor is controlled by style sheet elements. This allows users to override ATutor\'s default appearance and apply their own preferred presentation styles (i.e. increased font sizes, different font styles, colours, etc.)</li>\r\n\r\n<li><strong>Form Field Focus: </strong>For pages where the primary content is a form, the cursor will automatically be placed in the first field so that after a form page loads, users can begin typing into the form.  Users may choose to disable form focus in their preference settings if it interferes with their use of form screens.</li>\r\n\r\n<li><strong>Relative Sizing of Images: </strong>With browsers that support resizing of images, ATutor icons can be magnified for users with low vision, making them more easily visible. (e.g. Netscape 7 press Alt +) . Wherever possible relative measures have also been used for other feature within ATutor so when the interface is magnified or reduced, all features resize relative to each other, maintaining the screen\'s symmetry.</li>\r\n\r\n</ol>','2013-02-06 16:22:44',''),('en','_template','atutor_assignment',_binary 'ATutor Assignment','2011-08-29 13:33:13','gradebook type'),('en','_template','atutor_handbook',_binary 'Official ATutor Handbook','2005-07-12 10:42:58',''),('en','_template','atutor_home',_binary 'ATutor home','2003-05-18 11:49:37','mail response link text'),('en','_template','atutor_is',_binary '<strong><em>ATutor</em></strong> is an Open Source Web-based <strong>Learning Management System (LMS)</strong> designed with accessibility and adaptability in mind. Administrators can install or update ATutor in minutes, create custom themes to give it a new look, and extent its functionality by enabling or developing feature modules. Educators can quickly assemble, package, and redistribute instructional content, and conduct their courses online. Students learn in an adaptive learning environment.','2011-08-02 15:51:40',''),('en','_template','atutor_links',_binary '<p>Learn more about <a href=\"http://atutor.ca/index.php\">ATutor</a> by browsing the following links:</p>\r\n\r\n<ul>\r\n<li><a href=\"http://atutor.ca/forums/index.php\">Support Forums</a> - Post to the user forums</li>\r\n<li><a href=\"http://atutor.ca/services/index.php\">Support Services</a> - If you need our help, support is available</li>		\r\n<li><a href=\"http://atutor.ca/atutor/translate/index.php\">Translation</a> - Download language packs, become a translator</li>\r\n<li><a href=\"http://atutor.ca/services/licensing.php\">Licensing</a> - ATutor software is available for free under certain terms</li>\r\n<li><a href=\"http://atutor.ca/atutor/download.php\">Download ATutor</a> - All of the system software required to run ATutor can be downloaded here</li>\r\n</ul>','2007-12-14 11:22:47',''),('en','_template','atutor_patch_id',_binary 'ATutor Patch ID','2008-04-21 15:08:55',''),('en','_template','atutor_settings',_binary 'ATutor Settings','2008-09-09 08:56:34',''),('en','_template','atutor_test',_binary 'ATutor Test','2011-08-29 13:32:34','gredebook type'),('en','_template','atutor_version',_binary 'ATutor Version','2005-03-10 11:21:25',''),('en','_template','atutor_version_tested_with',_binary 'Last Tested With','2008-10-21 15:41:53',''),('en','_template','atutor_version_text',_binary '%s. <a href=\"http://atutor.ca/check_atutor_version.php?v=%s\">Check Latest Version</a>.','2007-07-26 13:52:25',''),('en','_template','atutor_version_to_apply',_binary 'ATutor Version to Apply','2008-04-21 15:11:31',''),('en','_template','at_tools',_binary 'ATutor Tools','2003-05-18 11:51:40','tracker column heading'),('en','_template','audible_captcha',_binary 'Audible Version of CAPTCHA','2009-07-16 08:50:02',''),('en','_template','audio',_binary 'Audio','2008-09-09 08:56:34',''),('en','_template','auditory',_binary 'Auditory','2008-09-08 14:18:54',''),('en','_template','australian-auslan',_binary 'Australian-Auslan','2008-09-09 09:01:12',''),('en','_template','austrian',_binary 'Austrian','2008-09-09 09:01:12',''),('en','_template','authenticated_access',_binary 'Authenticated Access','2007-02-13 15:37:33',''),('en','_template','author',_binary 'Author','2006-03-20 14:36:23',''),('en','_template','auth_access_text',_binary 'Give this link to those you wish to have limited access to your protected or private course.','2007-02-13 15:54:02',''),('en','_template','auto_approve_instructors',_binary 'Auto Approve Instructor Requests','2005-03-03 10:51:27',''),('en','_template','auto_check_new_version',_binary 'Check for ATutor Updates Automatically','2005-11-21 12:37:42',''),('en','_template','auto_enroll',_binary 'Auto Enrollment','2010-05-03 14:58:37','Auto Enroll Property'),('en','_template','auto_enrolled_msg',_binary 'You have been enrolled into these courses:','2008-03-10 12:02:23','auto enroll property'),('en','_template','auto_enroll_delete',_binary 'Delete Auto Enrollment','2008-03-10 11:54:52','Auto Enroll label'),('en','_template','auto_enroll_edit',_binary 'Create/Edit Auto Enrollment','2008-03-10 12:01:18','Auto Enroll property'),('en','_template','auto_enroll_msg',_binary 'You will be enrolled into these courses.','2008-03-10 12:01:55','auto enroll property'),('en','_template','auto_install_languages',_binary 'Automatically Install New Language Packs','2006-07-26 12:08:03',''),('en','_template','auto_install_languages_cron',_binary 'You must set-up the <a href=\"admin/cron_config.php\">cron</a> to use this feature.','2006-07-26 12:08:37',''),('en','_template','auto_login1',_binary 'Auto-Login','2003-05-18 11:53:47','control centre'),('en','_template','availability',_binary 'Availability','2007-03-06 14:24:05',''),('en','_template','available_applications',_binary 'Available Gadgets','2009-05-27 12:01:11',''),('en','_template','available_immediately',_binary 'Release immediately','2006-04-10 14:37:47',''),('en','_template','available_on_my_courses',_binary 'Link From The <em>My Courses</em> Page','2005-05-02 12:12:35',''),('en','_template','available_patches',_binary 'Available Patches','2008-04-21 15:08:55',''),('en','_template','available_patches_text',_binary 'There are <strong>%s</strong> patches available to install.','2008-04-21 15:08:55',''),('en','_template','available_to',_binary 'Available To','2008-04-21 15:08:55',''),('en','_template','average',_binary 'Average','2003-05-18 11:56:58','test results / tracker courses statistics'),('en','_template','avg_duration',_binary 'Avg. Duration','2005-03-01 12:40:29','tracker column heading'),('en','_template','awards',_binary 'Awards','2009-05-27 12:01:11',''),('en','_template','b',_binary 'B','2007-12-18 14:39:06',''),('en','_template','back',_binary 'Back','2003-05-18 12:02:02','file manager back up to previous directory'),('en','_template','backups',_binary 'Backups','2004-10-15 11:40:09',''),('en','_template','backup_manager',_binary 'Backup Manager','2004-10-14 13:59:50',''),('en','_template','back_to',_binary 'Back To:','2005-03-22 16:08:47',''),('en','_template','back_to_main',_binary 'Back to Main','2004-12-06 12:07:06',''),('en','_template','back_to_profile',_binary 'Back to Profile','2004-12-06 12:09:00',''),('en','_template','back_to_summary',_binary 'Back to Summary','2003-05-18 12:05:32','tracker'),('en','_template','banner',_binary 'Banner','2006-03-28 14:32:22',''),('en','_template','basiclti',_binary 'External Tools','2011-05-27 15:50:32',''),('en','_template','basiclti_comment',_binary 'You can choose and configure an External Tool associated with this Content Item.','2011-05-27 15:54:01',''),('en','_template','basiclti_content_text',_binary 'External Tool','2011-05-27 15:53:39',''),('en','_template','basiclti_text',_binary 'Support for integrating External Tools that support IMS Basic Learning Tools Interoperability','2011-05-27 15:50:55',''),('en','_template','basiclti_tool',_binary 'External Tool','2011-05-27 15:53:21',''),('en','_template','basic_profile',_binary 'Basic Profile','2009-05-27 12:01:11',''),('en','_template','before_topic',_binary 'Before: %s','2004-01-16 13:19:20','content editor'),('en','_template','bg_colour',_binary 'Background Colour','2008-09-09 09:01:13',''),('en','_template','black',_binary 'Black','2008-09-09 09:01:13',''),('en','_template','blogcomment_notify_body',_binary '*DO NOT REPLY TO THIS MESSAGE*  <br /><br />\r\nA new blog comment has been posted in the group %s.<br /><br />Click the following link to visit the course.<br /><br />%s','2009-06-24 11:59:01',''),('en','_template','blogcomment_notify_subject',_binary 'New blog comment','2009-06-24 11:57:46',''),('en','_template','blogs',_binary 'Blogs','2006-05-22 12:10:42',''),('en','_template','blog_notify_body',_binary '*DO NOT REPLY TO THIS MESSAGE*  <br /><br />\r\nA new blog post has been published in the group %s.<br /><br />Click the following link to visit the course.<br /><br />%s','2009-06-24 11:58:46',''),('en','_template','blog_notify_subject',_binary 'New blog post','2009-06-24 11:57:33',''),('en','_template','blog_subscribe',_binary 'Subscribe','2009-06-24 11:53:15',''),('en','_template','blog_unsubscribe',_binary 'Unsubscribe','2009-06-24 11:53:29',''),('en','_template','blti_missing_tool',_binary 'External Tool configuration has is missing toolid:','2011-05-27 15:54:37',''),('en','_template','blue',_binary 'Blue','2003-05-18 12:09:34','global code picker tool'),('en','_template','blue_guests',_binary 'Blue = Guests','2003-05-18 12:10:38','instructor course statistics'),('en','_template','bl_acceptgrades',_binary 'Accept Grades From External Tool','2011-05-27 15:55:10',''),('en','_template','bl_acceptgrades_off',_binary 'Do not allow','2011-05-27 15:55:21',''),('en','_template','bl_acceptgrades_on',_binary 'Allow','2011-05-27 15:55:35',''),('en','_template','bl_allowcustomparameters',_binary 'Allow Additional Custom Parameters in Content Item','2011-05-27 15:55:51',''),('en','_template','bl_allowcustomparameters_off',_binary 'Do not allow','2011-05-27 15:56:13',''),('en','_template','bl_allowcustomparameters_on',_binary 'Allow','2011-05-27 15:56:27',''),('en','_template','bl_allowpreferheight',_binary 'Allow Frame Height to be Changed','2011-05-27 15:56:39',''),('en','_template','bl_allowpreferheight_off',_binary 'Do not allow','2011-05-27 15:56:53',''),('en','_template','bl_allowpreferheight_on',_binary 'Allow','2011-05-27 15:57:06',''),('en','_template','bl_allowroster',_binary 'Allow External Tool To Retrieve Roster','2011-05-27 15:57:22',''),('en','_template','bl_allowroster_content',_binary 'Specify in each Content Item','2011-05-27 15:57:37',''),('en','_template','bl_allowroster_instructor',_binary 'Delegate to Instructor','2011-05-27 15:57:51',''),('en','_template','bl_allowroster_off',_binary 'Never','2011-05-27 15:58:04',''),('en','_template','bl_allowroster_on',_binary 'Always','2011-05-27 15:58:16',''),('en','_template','bl_allowsetting',_binary 'Allow External Tool to use the Setting Service','2011-05-27 15:58:31',''),('en','_template','bl_allowsetting_content',_binary 'Specify in each Content Item','2011-05-27 15:58:46',''),('en','_template','bl_allowsetting_instructor',_binary 'Delegate to Instructor','2011-05-27 15:58:59',''),('en','_template','bl_allowsetting_off',_binary 'Never','2011-05-27 15:59:12',''),('en','_template','bl_allowsetting_on',_binary 'Always','2011-05-27 15:59:26',''),('en','_template','bl_choose_gradbook_entry',_binary 'Select Gradebook Entry','2011-05-27 15:54:53',''),('en','_template','bl_choose_tool',_binary 'Select External Tool','2011-05-27 15:54:19',''),('en','_template','bl_content_title',_binary 'External Tool Settings','2011-05-27 15:53:07',''),('en','_template','bl_count',_binary 'Use Count','2011-05-27 15:52:47',''),('en','_template','bl_create',_binary 'Create External Tool','2011-05-27 15:51:13',''),('en','_template','bl_customparameters',_binary 'Custom Parameters','2011-05-27 15:59:40',''),('en','_template','bl_debuglaunch',_binary 'Launch Tool in Debug Mode','2011-05-27 15:59:52',''),('en','_template','bl_debuglaunch_content',_binary 'Specify in each Content Item','2011-05-27 16:00:08',''),('en','_template','bl_debuglaunch_instructor',_binary 'Delegate to Instructor','2011-05-27 16:00:22',''),('en','_template','bl_debuglaunch_off',_binary 'Never','2011-05-27 16:00:33',''),('en','_template','bl_debuglaunch_on',_binary 'Always','2011-05-27 16:00:45',''),('en','_template','bl_delete',_binary 'Deleting External Tool','2011-05-27 15:52:01',''),('en','_template','bl_description',_binary 'Description','2011-05-27 16:00:57',''),('en','_template','bl_edit',_binary 'Edit External Tool','2011-05-27 15:52:14',''),('en','_template','bl_launchinpopup',_binary 'Launch Tool in Pop Up Window','2011-05-27 16:01:12',''),('en','_template','bl_launchinpopup_content',_binary 'Specify in each Content Item','2011-05-27 16:01:27',''),('en','_template','bl_launchinpopup_instructor',_binary 'Delegate to Instructor','2011-05-27 16:01:42',''),('en','_template','bl_launchinpopup_off',_binary 'Never','2011-05-27 16:01:54',''),('en','_template','bl_launchinpopup_on',_binary 'Always','2011-05-27 16:02:07',''),('en','_template','bl_organizationdescr',_binary 'Organization Description','2011-05-27 16:02:22',''),('en','_template','bl_organizationid',_binary 'Organization Identifier (typically DNS)','2011-05-27 16:02:37',''),('en','_template','bl_organizationurl',_binary 'Organization URL','2011-05-27 16:02:51',''),('en','_template','bl_password',_binary 'Tool Secret','2011-05-27 16:03:05',''),('en','_template','bl_preferheight',_binary 'Frame Height','2011-05-27 16:03:18',''),('en','_template','bl_resourcekey',_binary 'Tool Key (oauth_consumer_key)','2011-05-27 16:03:32',''),('en','_template','bl_sendemailaddr',_binary 'Send User Mail Addresses to External Tool','2011-05-27 16:03:45',''),('en','_template','bl_sendemailaddr_content',_binary 'Specify in each Content Item','2011-05-27 16:04:07',''),('en','_template','bl_sendemailaddr_instructor',_binary 'Delegate to Instructor','2011-05-27 16:04:22',''),('en','_template','bl_sendemailaddr_off',_binary 'Never','2011-05-27 16:04:36',''),('en','_template','bl_sendemailaddr_on',_binary 'Always','2011-05-27 16:04:48',''),('en','_template','bl_sendname',_binary 'Send User Names to External Tool','2011-05-27 16:05:03',''),('en','_template','bl_sendname_content',_binary 'Specify in each Content Item','2011-05-27 16:05:15',''),('en','_template','bl_sendname_instructor',_binary 'Delegate to Instructor','2011-05-27 16:05:28',''),('en','_template','bl_sendname_off',_binary 'Never','2011-05-27 16:05:38',''),('en','_template','bl_sendname_on',_binary 'Always','2011-05-27 16:05:51',''),('en','_template','bl_settings',_binary 'Settings','2011-05-27 15:51:46',''),('en','_template','bl_title',_binary 'Title','2011-05-27 16:06:01',''),('en','_template','bl_toolid',_binary 'ToolId (must be unique across system)','2011-05-27 16:06:17',''),('en','_template','bl_toolid_header',_binary 'ToolID','2011-05-27 15:52:32',''),('en','_template','bl_toolurl',_binary 'Tool Launch URL','2011-05-27 16:06:30',''),('en','_template','bl_view',_binary 'External Tool Settings','2011-05-27 15:51:31',''),('en','_template','body',_binary 'Body','2003-05-18 12:11:16','add/edit forms for body field label'),('en','_template','bold',_binary 'Bold','2003-05-18 12:11:41','global code picker'),('en','_template','bottom',_binary 'Bottom','2003-05-23 16:58:31','preference settings option'),('en','_template','breadcrumb_links',_binary 'Breadcrumb links','2014-01-01 17:39:43','aria-label for breadcrumbs'),('en','_template','british-bsl',_binary 'British-BSL','2008-09-09 09:01:12',''),('en','_template','browse_all',_binary 'Browse All','2009-07-16 10:57:49','browse all'),('en','_template','browse_courses',_binary 'Browse Courses','2003-05-18 12:13:27','control centre, about, login screens'),('en','_template','browse_files',_binary 'Browse Files','2008-07-22 16:43:56','For \"Browse Files\" button in Fluid\'\'s multiple file uploader'),('en','_template','browse_for_upload',_binary 'Browse for file to upload','2010-04-21 14:36:58',''),('en','_template','bt',_binary '<acronym title=\"Byte\">B</acronym>','2007-12-18 14:39:47','byte, file manager/storage'),('en','_template','bug_count',_binary 'Bug Count','2004-12-06 12:23:46','admin/error_logging.php'),('en','_template','bug_identifier',_binary 'Bug Identifier','2004-12-06 12:05:07',''),('en','_template','builtin_icons',_binary 'Builtin Icons','2008-08-21 10:38:41','course properties'),('en','_template','business',_binary 'Business','2009-05-27 12:01:11',''),('en','_template','by',_binary 'by','2008-07-25 15:59:13','anouncements by a users'),('en','_template','bytes',_binary 'Bytes','2003-05-18 12:15:45','admin course size quote, course properties screen'),('en','_template','c',_binary 'C','2007-01-10 13:48:02',''),('en','_template','cache_directory',_binary 'Cache Directory','2005-03-03 10:52:26',''),('en','_template','cache_life',_binary 'Cache Lifetime','2014-04-27 12:33:10',''),('en','_template','calculator',_binary 'Calculator','2008-09-09 09:03:56',''),('en','_template','calendar',_binary 'Calendar','2013-09-11 12:34:02',''),('en','_template','calendar_assignment_cut',_binary 'Cut off date of ','2013-09-11 12:34:03',''),('en','_template','calendar_assignment_due',_binary 'Due date of ','2013-09-11 12:34:03',''),('en','_template','calendar_bookmarkd',_binary 'Bookmarked Calendars','2013-09-11 12:34:03',''),('en','_template','calendar_bookmark_this',_binary 'Bookmark this Calendar','2013-09-11 12:34:03',''),('en','_template','calendar_cancel_e',_binary 'Cancel','2013-09-11 12:34:03',''),('en','_template','calendar_connect_gcal',_binary 'Connect with Google Calendar','2013-09-11 12:34:03',''),('en','_template','calendar_course_end',_binary 'End date of ','2013-09-11 12:34:03',''),('en','_template','calendar_course_start',_binary 'Release date of ','2013-09-11 12:34:03',''),('en','_template','calendar_course_token',_binary ' course','2013-09-11 12:34:03',''),('en','_template','calendar_create_event',_binary 'Create Event','2013-12-31 13:44:40',''),('en','_template','calendar_creat_e',_binary 'Create Event','2013-09-11 12:34:03',''),('en','_template','calendar_day',_binary 'Day','2013-09-11 12:34:03',''),('en','_template','calendar_del_bookmark',_binary 'Remove Bookmark','2013-09-11 12:34:03',''),('en','_template','calendar_del_e',_binary 'Delete Event','2013-09-11 12:34:03',''),('en','_template','calendar_disconnect_gcal',_binary 'Disconnect from Google Calendar','2013-09-11 12:34:03',''),('en','_template','calendar_edit_e',_binary 'Save','2013-09-11 12:34:03',''),('en','_template','calendar_edit_title',_binary 'Edit Title','2013-09-11 12:34:03',''),('en','_template','calendar_email_part1',_binary ' has shared ','2013-09-11 12:34:03',''),('en','_template','calendar_email_part2',_binary ' with you. You may browse calendar at: ','2013-09-11 12:34:03',''),('en','_template','calendar_error',_binary 'Error: ','2013-09-11 12:34:03',''),('en','_template','calendar_events_assign_cut',_binary 'Assignment Cut off Date','2013-09-11 12:34:03',''),('en','_template','calendar_events_assign_due',_binary 'Assignment Due Date','2013-09-11 12:34:03',''),('en','_template','calendar_events_course_end',_binary 'Course End Date','2013-09-11 12:34:03',''),('en','_template','calendar_events_course_rel',_binary 'Course Release Date','2013-09-11 12:34:03',''),('en','_template','calendar_events_persnl',_binary 'Personal Events','2013-09-11 12:34:03',''),('en','_template','calendar_events_test_end',_binary 'Test End Date','2013-09-11 12:34:03',''),('en','_template','calendar_events_test_start',_binary 'Test Start Date','2013-09-11 12:34:03',''),('en','_template','calendar_export_file',_binary 'Export ics file','2013-09-11 12:34:03',''),('en','_template','calendar_form_end_d',_binary 'End Date (yyyy-mm-dd)','2013-09-11 12:34:03',''),('en','_template','calendar_form_end_t',_binary 'End Time (24hours)','2013-09-11 12:34:03',''),('en','_template','calendar_form_start_d',_binary 'Start Date (yyyy-mm-dd)','2013-09-11 12:34:03',''),('en','_template','calendar_form_start_t',_binary 'Start Time (24hours)','2013-09-11 12:34:03',''),('en','_template','calendar_form_title',_binary 'Event Title','2013-09-11 12:34:03',''),('en','_template','calendar_form_title_def',_binary 'Event Name','2013-09-11 12:34:03',''),('en','_template','calendar_gcals',_binary 'Google Calendars','2013-09-11 12:34:03',''),('en','_template','calendar_header',_binary 'Calendar','2013-09-11 12:34:03',''),('en','_template','calendar_import_file',_binary 'Import ics file','2013-09-11 12:34:03',''),('en','_template','calendar_internal_events',_binary 'ATutor Internal Events','2013-09-11 12:34:03',''),('en','_template','calendar_mailtxt',_binary 'Enter email','2013-09-11 12:34:03',''),('en','_template','calendar_mail_title',_binary 'Shared Calendar','2013-09-11 12:34:03',''),('en','_template','calendar_manemail',_binary 'Enter email address','2013-09-11 12:34:03',''),('en','_template','calendar_membrselect',_binary 'Select member','2013-09-11 12:34:03',''),('en','_template','calendar_month',_binary 'Month','2013-09-11 12:34:03',''),('en','_template','calendar_next',_binary 'Next','2013-09-11 12:34:03',''),('en','_template','calendar_notification',_binary 'Email Notifications','2013-09-11 12:34:03',''),('en','_template','calendar_noti_mail_1',_binary 'Events for tomorrow: ','2013-09-11 12:34:03',''),('en','_template','calendar_noti_mail_2',_binary 'Event','2013-09-11 12:34:03',''),('en','_template','calendar_noti_mail_3',_binary 'Start','2013-09-11 12:34:03',''),('en','_template','calendar_noti_mail_4',_binary 'End','2013-09-11 12:34:03',''),('en','_template','calendar_noti_mail_5',_binary 'Event','2013-09-11 12:34:03',''),('en','_template','calendar_noti_off',_binary 'Off','2013-09-11 12:34:03',''),('en','_template','calendar_noti_on',_binary 'On','2013-09-11 12:34:03',''),('en','_template','calendar_noti_title',_binary 'ATutor Calendar Notification','2013-09-11 12:34:03',''),('en','_template','calendar_noti_turn',_binary 'Turn','2013-09-11 12:34:03',''),('en','_template','calendar_no_one_else',_binary 'You are the only one in this course, no available recipients.','2013-09-11 12:34:03',''),('en','_template','calendar_nxt_day',_binary 'Next Day','2013-09-11 12:34:03',''),('en','_template','calendar_nxt_mnth',_binary 'Next Month','2013-09-11 12:34:03',''),('en','_template','calendar_nxt_week',_binary 'Next Week','2013-09-11 12:34:03',''),('en','_template','calendar_of',_binary 'Calendar of','2013-09-11 12:34:03',''),('en','_template','calendar_optional_fld',_binary 'Optional: If the title is not specified, default title will be set to \"Calendar of ','2013-09-11 12:34:03',''),('en','_template','calendar_options',_binary 'Calendar Options','2013-09-11 12:34:03',''),('en','_template','calendar_patch_error',_binary 'Install Patch First.','2013-09-11 12:34:03',''),('en','_template','calendar_prev',_binary 'Previous','2013-09-11 12:34:03',''),('en','_template','calendar_prv_day',_binary 'Previous Day','2013-09-11 12:34:03',''),('en','_template','calendar_prv_mnth',_binary 'Previous Month','2013-09-11 12:34:03',''),('en','_template','calendar_prv_week',_binary 'Previous Week','2013-09-11 12:34:03',''),('en','_template','calendar_public_note1',_binary 'You can','2013-09-11 12:34:03',''),('en','_template','calendar_public_note2',_binary 'login','2013-09-11 12:34:03',''),('en','_template','calendar_public_note3',_binary 'to bookmark this calendar.','2013-09-11 12:34:03',''),('en','_template','calendar_pub_def_msg',_binary 'Use this tab to view shared calendar.','2013-09-11 12:34:03',''),('en','_template','calendar_save',_binary 'Save','2013-09-11 12:34:03',''),('en','_template','calendar_sellist',_binary 'Select from list','2013-09-11 12:34:03',''),('en','_template','calendar_sendall',_binary 'Send to all other students in this course','2013-09-11 12:34:03',''),('en','_template','calendar_share',_binary 'Share Calendar','2013-09-11 12:34:03',''),('en','_template','calendar_submit',_binary 'Submit','2013-09-11 12:34:03',''),('en','_template','calendar_test_end',_binary 'End date of ','2013-09-11 12:34:03',''),('en','_template','calendar_test_start',_binary 'Start date of ','2013-09-11 12:34:03',''),('en','_template','calendar_test_token',_binary ' test','2013-09-11 12:34:03',''),('en','_template','calendar_titletxt',_binary 'Title of Calendar','2013-09-11 12:34:03',''),('en','_template','calendar_today',_binary 'Today','2013-09-11 12:34:03',''),('en','_template','calendar_tooltip_cell',_binary 'Click or press enter to create event','2013-09-11 12:34:03',''),('en','_template','calendar_tooltip_event',_binary 'Click or press enter to edit event','2013-09-11 12:34:03',''),('en','_template','calendar_uneditable',_binary 'Uneditable event','2013-09-11 12:34:03',''),('en','_template','calendar_upload_file',_binary 'Upload ics file','2013-09-11 12:34:03',''),('en','_template','calendar_viewcal',_binary 'View','2013-09-11 12:34:03',''),('en','_template','calendar_view_title',_binary 'View Shared Calendar','2013-09-11 12:34:03',''),('en','_template','calendar_week',_binary 'Week','2013-09-11 12:34:03',''),('en','_template','cancel',_binary 'Cancel','2003-05-18 12:16:07','global cancel button'),('en','_template','cannot_find_remote_languages',_binary 'ATutor was unable to connect to the ATutor.ca website to retrieve the list of available languages.','2004-10-18 14:28:15',''),('en','_template','categories',_binary 'Categories','2005-02-22 10:12:23',''),('en','_template','category',_binary 'Category','2003-05-18 12:16:54','links database'),('en','_template','cats_all',_binary 'All Categories','2005-02-23 10:22:07',''),('en','_template','cats_categories',_binary 'Categories','2003-09-24 18:21:26','admin course categories'),('en','_template','cats_none',_binary 'None','2003-09-24 18:13:50','admin course categories'),('en','_template','cats_no_categories',_binary 'No Categories','2003-09-24 18:28:32','admin course categories'),('en','_template','cats_parent_category',_binary 'Parent Category','2003-09-24 18:04:38','admin course categories'),('en','_template','cats_uncategorized',_binary 'Uncategorized','2003-09-24 18:17:50','admin course categories'),('en','_template','cats_view_links',_binary 'Show Links by Category','2005-03-29 14:08:08',''),('en','_template','cat_theme',_binary 'Category Theme','2004-08-04 11:34:15',''),('en','_template','center',_binary 'Center','2003-05-18 12:20:08','global code picker option'),('en','_template','change_email',_binary 'Change Email','2006-05-10 11:11:26',''),('en','_template','change_password',_binary 'Change Password','2006-05-10 11:11:41',''),('en','_template','charset',_binary 'Character Set','2004-11-20 19:36:01','admin new language'),('en','_template','chat',_binary 'Chat','2003-05-18 12:20:29','global chat label'),('en','_template','chat_altc',_binary 'Alt + C: Jump to Compose Message','2003-05-30 12:41:06','chat options frame'),('en','_template','chat_altm',_binary 'Alt + M: Jump to Messages','2004-08-18 10:58:16',''),('en','_template','chat_altq',_binary 'Alt + Q:  Quit Chat','2005-05-30 15:04:01',''),('en','_template','chat_altr',_binary 'Alt + R: Refresh Messages','2004-08-18 10:58:42',''),('en','_template','chat_auto180_checking',_binary 'Automatic (180 second interval)','2003-05-15 14:23:13','chat message checking preference'),('en','_template','chat_auto20_checking',_binary 'Automatic (20 second interval)','2003-05-15 14:22:22','chat message checking preference'),('en','_template','chat_auto5_checking',_binary 'Automatic (5 second interval)','2003-05-27 09:09:57','chat message checking preferences'),('en','_template','chat_auto60_checking',_binary 'Automatic (60 second interval)','2003-05-15 14:22:53','chat message checking preference'),('en','_template','chat_chime_help',_binary 'Set to \"Yes\" to recieve an audio tone when new messsages are posted. Does not work in all Web browsers.','2003-05-15 19:33:11','chat message checking preferences'),('en','_template','chat_compose_message',_binary 'Compose Message','2003-05-15 13:12:38','chat message compose frame'),('en','_template','chat_currently_active',_binary 'Currently active','2003-05-15 12:40:47','chat hompage transcript activated'),('en','_template','chat_current_tran',_binary 'A transcript is already being recorded.  You may view the current transcript at','2005-03-30 14:04:45','achat'),('en','_template','chat_delete_transcript',_binary 'Delete Transcript','2003-06-30 17:53:55','chat home page'),('en','_template','chat_edit_prefs',_binary 'Edit Preferences','2003-05-15 13:47:05','chat options frame'),('en','_template','chat_enter',_binary 'Enter Chat','2003-05-15 14:50:48','chat preferences pages'),('en','_template','chat_exit',_binary 'Exit Chat','2003-05-15 13:48:43','chat options frame'),('en','_template','chat_full_history',_binary 'Full History','2003-05-15 14:00:02','chat options frame'),('en','_template','chat_help_display_blurb',_binary '<p>Note: <em>Jump To</em> links and the <em>Quick Key</em> list only appear if you have turned on <em>Navigation Aids</em> in you preferences.</p>\r\n \r\n<ul>\r\n	<li>The <em>Jump to Quick Keys</em> link at the top takes you to a list of quick keys for the Chat. </li>\r\n	<li>The <em>Message Area</em> displays the most recent messages (up to ten). </li>\r\n    <li>The <em>Jump to Messages</em> links take you to the beginning of the list of messages. (Alt+M) </li>\r\n    <li>The <em>Refresh Messages</em> link lets you check for new messages (Alt+R). </li>\r\n    <li>The <em>Compose Message</em> Field and <em>Send Button</em> let you enter and send messages (Alt+C to enter the Compose Field, Enter to send a completed message). </li>\r\n</ul>','2004-08-18 11:00:36',''),('en','_template','chat_help_display_frame',_binary 'Display Frame Help (top left)','2003-05-15 15:24:02','chat help screen'),('en','_template','chat_help_display_jump',_binary 'Jump to Display Frame Help','2003-05-27 09:14:57','chat help screen'),('en','_template','chat_help_history_blurb',_binary 'The <em>User List</em> shows the Chat IDs of all the users in the chat. Click on a Chat ID to see the messages sent by that participant, along with your own messages. Click on <em>All Users</em> to see the messages sent by all participants.','2003-05-15 15:34:10','chat help screen'),('en','_template','chat_help_history_frame',_binary 'User List and History Help','2003-05-15 15:32:14','chat help screen'),('en','_template','chat_help_history_jump',_binary 'Jump to User List and History Help','2003-05-15 15:22:23','chat help screen'),('en','_template','chat_help_jump_top',_binary 'Jump to Top','2003-05-15 15:25:48','chat_help screen'),('en','_template','chat_help_options_blurb',_binary '<ul>\r\n	<li>The <em>Edit Preferences</em> link opens the preferences so you can modify your control and display settings. </li>\r\n    <li>The <em>Exit Chat</em> link ends your chat session.</li>\r\n    <li>The <em>Help</em> link brings you to this screen. (Alt+Q)</li>\r\n</ul>','2004-08-18 11:01:04',''),('en','_template','chat_help_options_frame',_binary 'Options Help (top right)','2003-05-15 15:24:50','chat help screen'),('en','_template','chat_help_options_jump',_binary 'Jump to Options Help','2003-05-27 09:15:04','chat help screen'),('en','_template','chat_help_screen',_binary 'Help Screen','2003-05-15 15:19:33','chat help'),('en','_template','chat_history_messages',_binary 'History - Messages %s to %s of %s','2003-05-15 15:59:13','chat full history screen'),('en','_template','chat_inactive',_binary 'Inactive','2005-03-30 14:47:25',''),('en','_template','chat_jump_to_message',_binary 'Jump to Message Area','2003-05-15 13:14:01','chat display frame'),('en','_template','chat_keep_tran',_binary 'This section allows you to keep a transcript of the chat in progress.','2003-05-28 11:10:47','achat'),('en','_template','chat_layout_prefs',_binary 'Preferences: Layout Settings','2003-05-15 14:53:04','chat layout preferences'),('en','_template','chat_list_and_history',_binary 'User List and History','2003-05-15 13:49:37','chat options frame'),('en','_template','chat_logged_out',_binary 'User %s has logged out.','2003-05-15 16:01:51','logout'),('en','_template','chat_manual_checking',_binary 'Manual Refresh','2003-05-15 14:23:42','chat message checking preference'),('en','_template','chat_messages',_binary 'Messages','2003-05-15 13:05:28','chat message display frame'),('en','_template','chat_message_checking',_binary 'Message Checking:','2003-05-15 14:19:45','chat message checking preferences'),('en','_template','chat_message_check_help',_binary 'Select the interval rate at which new messages are retrieved from the server. Screen reader users set this option to Manual Refresh.','2003-05-15 14:39:17','chat message checking preferences'),('en','_template','chat_message_chime',_binary 'New Message Chime:','2003-05-15 14:43:05','chat message checking preferences'),('en','_template','chat_message_new_help',_binary 'Screen reader users choose \"Yes\", along with the Manual Refresh setting.','2003-05-15 15:05:32','chat layout preferences'),('en','_template','chat_message_order_help',_binary 'Select New to Old to display new messages at the top of the screen, and Old to New to display new messages at the bottom of the screen.','2003-05-15 14:58:48','chat layout preferences'),('en','_template','chat_newmsg_prefs',_binary 'Show Only New Messages?','2003-05-15 15:00:44','chat layout preferences'),('en','_template','chat_newold_prefs',_binary 'New to Old','2003-05-15 14:55:15','chat layout preferences'),('en','_template','chat_none_found',_binary 'No transcripts found.','2005-03-31 11:32:44','chat home page'),('en','_template','chat_no_new_messages',_binary 'No new messages.','2003-05-15 13:09:01','chat display frames'),('en','_template','chat_oldnew_prefs',_binary 'Old to New','2003-05-15 14:54:48','chat layout preferences'),('en','_template','chat_options',_binary 'Options','2003-05-15 13:45:35','chat options frame'),('en','_template','chat_order_prefs',_binary 'Order of Messages:','2003-05-15 14:53:59','chat layout preferences'),('en','_template','chat_post',_binary 'Enter: Post a completed message','2003-05-15 14:07:17','chat options frame'),('en','_template','chat_prefs_checking',_binary 'Preferences: Message Checking Settings','2003-05-15 14:18:37','chat checking preferences'),('en','_template','chat_quick_keys',_binary 'Quick Keys','2003-05-15 14:03:24','chat options frame'),('en','_template','chat_refresh_message',_binary 'Refresh Messages','2003-05-15 13:16:05','chat display frame'),('en','_template','chat_refresh_user_list',_binary 'Refresh User List','2003-05-15 14:01:12','chat options frame'),('en','_template','chat_return',_binary 'Return to Chat','2003-05-15 15:20:17','chat help screen'),('en','_template','chat_start_tran',_binary 'Start keeping a transcript','2003-05-28 11:20:12','achat'),('en','_template','chat_start_transcript',_binary 'Start/Stop Transcript','2005-05-16 10:55:23',''),('en','_template','chat_stop_tran',_binary 'Stop keeping transcript.','2003-05-28 12:48:38','achat'),('en','_template','chat_system',_binary 'system','2003-05-15 13:07:42','chat display frame system message'),('en','_template','chat_transcript',_binary 'Transcript','2003-05-30 11:27:26','achat'),('en','_template','chat_transcript_end',_binary 'Transcript End:','2003-05-30 11:30:10','achat'),('en','_template','chat_transcript_start',_binary 'Transcript Start:','2003-05-30 11:29:26','achat'),('en','_template','chat_tran_file_name',_binary 'Transcript name (alphanumeric, no spaces):','2003-05-28 18:36:35','achat'),('en','_template','chat_user_logged_in',_binary 'User %s has logged in.','2003-05-15 16:02:29','chat display system login message'),('en','_template','chat_user_logged_out',_binary 'User %s has been logged out due to inactivity.','2003-05-15 16:02:16','chat logout system message'),('en','_template','chat_you',_binary 'you','2003-05-15 13:53:10','chat users online list'),('en','_template','checked',_binary 'Checked','2006-06-26 14:55:53',''),('en','_template','child_of',_binary 'Child of: %s','2004-01-16 13:21:25',''),('en','_template','choice',_binary 'Choice','2003-05-18 12:25:24','test manager, multiple choice question editor'),('en','_template','chunks_not_found',_binary '<small>(Warning: One or more code chunks to be deleted or replaced are not found.)</small>','2008-10-27 11:35:01','patcher message'),('en','_template','cid',_binary 'CID','2003-05-18 13:17:08','global code picker url content id indentifier'),('en','_template','city',_binary 'City','2003-05-18 13:17:52','registration, edit profile'),('en','_template','class_avg',_binary 'Class Avg','2008-09-25 16:01:17','gradebook'),('en','_template','click_browse_files',_binary 'Click <em>Browse Files</em> to add files to the queue','2008-07-22 16:44:21','Instructional text for using fluid\'\'s multiple file uploader'),('en','_template','click_code',_binary 'Click on the code or emoticon you want to use.','2003-05-22 15:42:52','global code picker instructions'),('en','_template','click_hide_tools',_binary 'Click to hide tool bar','2010-03-30 15:32:01','content editor'),('en','_template','click_show_head',_binary 'Click to customize HTML head','2010-03-30 15:01:59','content editor'),('en','_template','click_show_tools',_binary 'Click to show tools.','2010-03-30 14:48:25','content editor'),('en','_template','close',_binary 'Close','2005-08-10 16:13:36',''),('en','_template','close_after_saving',_binary 'Close after saving','2004-05-11 11:01:40',''),('en','_template','close_help_window',_binary 'Close Help Window','2003-05-18 13:21:37','close help window link text'),('en','_template','close_menus',_binary 'Menus','2005-03-05 18:29:54','Menus'),('en','_template','close_related_topics',_binary 'Related Topics','2005-03-05 18:30:15','Menus'),('en','_template','close_window',_binary 'Close Window','2004-12-08 12:04:59',''),('en','_template','codes',_binary 'Codes','2003-05-18 13:23:57','global code picker label'),('en','_template','code_to_replace_from',_binary 'Code To Replace From','2008-04-21 15:11:31',''),('en','_template','code_to_replace_to',_binary 'Code To Replace To','2008-04-21 15:11:31',''),('en','_template','collapse',_binary 'Collapse','2003-05-18 13:24:36','Menus'),('en','_template','colors',_binary 'Colours','2003-05-18 13:25:02','global code picker label'),('en','_template','combination',_binary 'Must use a combination of letters, and numbers or symbols','2010-10-07 09:23:45',''),('en','_template','combine',_binary 'Combine','2008-09-25 16:01:17','gradebook'),('en','_template','combine_from',_binary 'Combine From','2008-09-25 16:01:17','gradebook'),('en','_template','combine_into',_binary 'Combine Into','2008-09-25 16:01:17','gradebook'),('en','_template','combine_tests',_binary 'Combine ATutor Tests','2008-09-25 16:01:17','gradebook'),('en','_template','combine_tests_info',_binary 'Before combining tests, please run section above to update marks of \"Combine Into Test/Survey.\"','2008-09-25 16:01:17','gradebook'),('en','_template','comment',_binary 'Comment','2006-03-20 14:42:32',''),('en','_template','comments',_binary 'Comments','2006-03-20 14:36:45',''),('en','_template','comments_num',_binary '%s Comment(s)','2006-05-25 14:01:48',''),('en','_template','common_cartridge',_binary 'Common Cartridge','2008-12-02 11:57:49',''),('en','_template','common_interest',_binary 'Common Interest','2009-05-27 12:01:11',''),('en','_template','company',_binary 'Company','2009-05-27 12:01:11',''),('en','_template','completed',_binary 'Completed','2008-09-25 16:01:17','gradebook'),('en','_template','completed_date',_binary 'Completed Date','2008-09-25 16:01:17','gradebook'),('en','_template','completed_tests',_binary 'Your Submissions','2005-05-11 11:19:25',''),('en','_template','configuration',_binary 'Configuration','2005-02-07 16:04:01',''),('en','_template','confirm',_binary 'Confirm','2004-10-18 11:50:20','enrollment manager, confirm action'),('en','_template','confirm_account_text',_binary 'If you have already created an account, you will have to <a href=\"confirm.php\">confirm your email address</a>.','2005-07-27 15:05:53',''),('en','_template','confirm_admin_create',_binary 'Are you sure you want to create a Super Administrator account?','2005-03-03 10:34:16',''),('en','_template','confirm_deny_instructor',_binary 'You are about to deny the instructor request of the following user:','2005-07-21 16:16:48',''),('en','_template','confirm_password',_binary 'Confirm Password','2005-03-03 10:47:28',''),('en','_template','connections',_binary 'My Contacts','2009-05-27 12:01:11',''),('en','_template','contact_accepted',_binary 'ATutor Social Contact Accepted','2009-05-27 12:01:11',''),('en','_template','contact_email',_binary 'Contact Email','2005-03-03 10:50:32',''),('en','_template','contact_instructor',_binary 'Contact Course Instructor','2003-05-18 13:29:00','student contact instructor form'),('en','_template','contact_name',_binary 'Contact Name','2003-05-18 13:30:04','student contact instructor form'),('en','_template','contact_request',_binary 'ATutor Social Contact Request','2009-05-27 12:01:11',''),('en','_template','contact_support',_binary 'Contact Support','2005-07-19 10:27:52',''),('en','_template','contain_only',_binary 'May contain only letters, numbers, underscores, hyphens or periods.','2006-07-17 11:01:46','registration login name format'),('en','_template','content',_binary 'Content','2003-05-18 13:32:22','sitemap/delete course'),('en','_template','contents',_binary 'Contents','2003-05-18 13:35:43','content page table of content menu heading'),('en','_template','content_editor',_binary 'Content Editor','2006-11-23 13:17:41','user prefs'),('en','_template','content_folder_title',_binary 'Content Folder Title','2009-09-16 13:11:45',''),('en','_template','content_navigation',_binary 'Content Navigation','2005-03-29 12:18:45','menu content nav drop down'),('en','_template','content_package',_binary 'Content Package','2008-12-02 11:57:28',''),('en','_template','content_packaging',_binary 'Import Export','2013-12-23 18:24:27',''),('en','_template','content_packaging_all',_binary 'Available on every page','2003-10-15 10:10:17','option3'),('en','_template','content_packaging_disabled',_binary 'Content packaging has been disabled for this course.','2007-11-27 15:29:41',''),('en','_template','content_packaging_none',_binary 'Not available on any of the pages','2003-10-15 10:09:27','option1'),('en','_template','content_packaging_top',_binary 'Available only for top level pages','2007-11-27 15:29:26','option2'),('en','_template','content_settings',_binary 'Content Alternatives','2010-04-12 16:30:55',''),('en','_template','content_usage',_binary 'Usage','2010-05-02 08:52:22',''),('en','_template','continue',_binary 'Continue','2006-03-21 16:22:28',''),('en','_template','control_settings',_binary 'Navigation','2010-04-12 16:29:22',''),('en','_template','copyright',_binary 'Web site engine\'s code is copyright ©  ATutor®','2008-09-18 13:02:58',''),('en','_template','core',_binary 'Core','2005-08-30 10:17:41',''),('en','_template','correct_answer',_binary 'Correct Answer','2003-05-18 13:38:45','test manager add/edit questions'),('en','_template','count',_binary 'Count','2003-05-18 13:40:35','tracker'),('en','_template','country',_binary 'Country','2003-05-18 13:41:28','registration / profile edit'),('en','_template','course',_binary 'Course','2003-05-18 13:42:31','delete course warning screen'),('en','_template','courses',_binary 'Courses','2003-05-18 13:43:44','admin users/courses manager'),('en','_template','courses_below',_binary 'My Courses','2008-04-16 19:44:10','jump menu divider'),('en','_template','course_admin_tools',_binary 'Toggle course administration tools on or off.','2013-12-26 17:59:59',''),('en','_template','course_available',_binary 'Course Available','2003-05-18 13:46:03','file manager, server space available'),('en','_template','course_available_zip1',_binary 'Course Available (before extraction)','2003-05-18 13:46:37','file manager zip tool'),('en','_template','course_available_zip2',_binary 'Course Available (after extraction)','2003-05-18 13:47:06','file manager zip tool'),('en','_template','course_backups',_binary 'Course Backups','2005-03-03 10:21:39',''),('en','_template','course_copyright',_binary 'Optional Copyright Notice','2003-05-18 13:47:33','course copyright label'),('en','_template','course_dir_name',_binary 'Course Directory Name','2008-05-14 12:03:39',''),('en','_template','course_dir_name_contain_only',_binary 'May contain only letters, numbers and underscore.','2012-07-26 13:56:52',''),('en','_template','course_email',_binary 'Course Email','2003-05-18 13:51:48','taught courses table in instructor control centre'),('en','_template','course_enrolment',_binary 'Enrollment Manager','2003-10-01 18:54:09','instructor - course enrollment (previously ATutor Course Enrollment)'),('en','_template','course_files',_binary 'Course Files','2006-03-20 14:40:32',''),('en','_template','course_forums',_binary 'Course Forums','2004-11-13 19:55:06',''),('en','_template','course_home',_binary 'Course Home','2010-10-08 13:32:24','course main nav menu'),('en','_template','course_id',_binary 'Course ID','2003-05-18 13:54:57','admin course manager'),('en','_template','course_instructor',_binary 'Course Instructor','2003-05-18 13:57:00','student contact instructor form'),('en','_template','course_list',_binary 'Course List','2005-03-23 15:17:14','enrollment manager'),('en','_template','course_polls_summary',_binary 'Course polls listed by question, creation date and votes','2013-12-28 12:21:48',''),('en','_template','course_properties',_binary 'Course Properties','2003-05-18 14:00:23','course properties, admin course manager'),('en','_template','course_quota',_binary 'Course Quota','2003-05-18 14:01:10','course properties, admin course manager'),('en','_template','course_stats',_binary 'Course Statistics','2003-05-18 14:01:59','delete course'),('en','_template','course_summaries',_binary 'Course Summaries','2004-08-20 15:08:40',''),('en','_template','course_title_instructor_enrolment',_binary 'Course title, instructor, and enrollment.','2013-12-28 12:12:23','table summary admin mobile courses tmpl'),('en','_template','course_title_instructor_enrolment_long',_binary 'List of courses by title, instructor, access, category, creation date, enrollment, and alumni','2013-12-28 12:13:14','admin courses tmpl default template'),('en','_template','course_tools',_binary 'Course Tools','2008-11-07 09:18:55',''),('en','_template','course_total',_binary 'Course Total','2003-05-18 14:03:39','file manager, zip tool'),('en','_template','course_total_zip',_binary 'Course Total (before extraction)','2003-05-18 14:04:10','file manager zip tool'),('en','_template','course_to_auto_enroll',_binary 'Courses to Enroll','2008-03-12 11:11:57','Auto Enroll label'),('en','_template','create',_binary 'Create','2003-05-18 14:06:29','links database submit button'),('en','_template','created',_binary 'Created','2003-05-18 14:07:28','browse courses, control centre'),('en','_template','created_by',_binary 'Created By','2009-05-27 12:01:11',''),('en','_template','created_date',_binary 'Created','2003-05-18 14:09:05','admin course managers, profile editor'),('en','_template','create_admin',_binary 'Create Administrator Account','2005-03-03 10:40:10',''),('en','_template','create_backup',_binary 'Create Backup','2004-10-15 14:19:55',''),('en','_template','create_backup_about',_binary '<p>Creating a backup of this course will archive all available material into a single compressed ZIP file. Once the backup file is created, it will be available through the Backup Manager for download and safe-keeping, or available to be restored back into this or any other course.</p>\r\n\r\n<p>Depending on the course size and available server resources, the time needed to backup this course may take  some time.</p>\r\n		\r\n<p>Note: You are currently restricted to %s backups per course.</p>','2005-05-30 15:04:45',''),('en','_template','create_basic',_binary 'Create basic announcement, content, and forum.','2004-10-20 14:28:44',''),('en','_template','create_category',_binary 'Create Category','2005-02-18 10:28:39',''),('en','_template','create_course',_binary 'Create Course','2005-02-15 13:16:16','instructor control centre'),('en','_template','create_folder',_binary 'Create Folder','2003-05-18 14:12:40','file manager'),('en','_template','create_folder_here',_binary 'To create a folder, enter name here:','2009-11-05 14:42:23',''),('en','_template','create_forum',_binary 'Create Forum','2005-02-16 12:23:16',''),('en','_template','create_group',_binary 'Create Group','2005-02-22 16:51:56',''),('en','_template','create_groups',_binary 'Create Groups','2006-03-21 14:57:08',''),('en','_template','create_group_blurb',_binary 'Create a new group on a particular topic, then invite people to post news items or discuss the topic. ','2009-05-27 12:01:11',''),('en','_template','create_module',_binary 'Create Module','2005-08-17 13:06:07',''),('en','_template','create_new_file',_binary 'Create New File','2005-02-22 15:33:12',''),('en','_template','create_new_question',_binary 'Create New Question','2005-03-07 16:42:11',''),('en','_template','create_patch',_binary 'Create Patch','2008-04-21 15:11:31',''),('en','_template','create_test',_binary 'Create Test/Survey','2004-11-24 10:00:42','instructor test manager'),('en','_template','create_user',_binary 'Create User Account','2005-03-10 15:12:12',''),('en','_template','creation_date',_binary 'Creation Date','2009-06-17 13:32:26','admin/users.php'),('en','_template','creative_commons',_binary 'Creative Commons','2010-07-20 14:56:49',''),('en','_template','credits_and_work_experience',_binary 'Credits and Work Experience','2009-05-27 12:01:11',''),('en','_template','cron',_binary 'Cron','2006-03-31 15:42:46',''),('en','_template','cron_config',_binary 'Cron Set-up','2006-04-03 14:22:14',''),('en','_template','cron_url',_binary 'The URL to your cron service is:','2006-06-14 12:47:32',''),('en','_template','cron_url_usage',_binary 'The URL below must be used when setting-up the cron service. See the <em>Cron Set-Up</em> section in the <em>ATutor Handbook</em> for instructions.','2006-06-14 12:49:11',''),('en','_template','current_course_size',_binary 'Current course size','2003-10-07 15:41:36','admin course info'),('en','_template','current_location',_binary '(Current location)','2004-01-16 13:22:03','content editor'),('en','_template','current_path',_binary 'Path to Current Directory:','2003-05-18 14:13:52','file manager'),('en','_template','curren_tests_surveys',_binary 'Ongoing Tests & Surveys','2005-01-03 09:57:07',''),('en','_template','cursive',_binary 'Cursive','2008-09-09 09:01:13',''),('en','_template','custom',_binary 'Custom','2008-09-25 15:59:56','gradebook'),('en','_template','customized_head',_binary 'Scripts/CSS','2010-05-03 10:42:26',''),('en','_template','customized_head_disabled_title',_binary 'Scripts/CSS disabled','2010-05-03 10:42:37',''),('en','_template','customized_head_enabled_title',_binary 'Toggle Scripts/CSS','2010-05-03 10:42:50',''),('en','_template','customized_head_note',_binary 'Edit your own styles or javascript','2008-05-01 08:57:49',''),('en','_template','custom_grade_scale',_binary 'Custom Grade Scale','2008-09-25 15:59:56','gradebook'),('en','_template','custom_icons',_binary 'Custom Icons','2008-08-21 10:38:11','course properties'),('en','_template','custom_logo',_binary 'Custom Logo','2014-06-06 19:18:54',''),('en','_template','custom_logo_alt_text',_binary 'Alternative Text','2014-06-06 19:20:07',''),('en','_template','custom_logo_enabled',_binary 'Custom Logo State','2014-06-06 19:20:33',''),('en','_template','custom_logo_foot_disable',_binary 'Fixed Footer State','2014-07-12 10:36:34','custom logo opetion'),('en','_template','custom_logo_instructions',_binary 'Replace the ATutor logo in the footer area with your own custom logo. The dimensions of the logo should be 153 by 46, and should be a png, jpg, or gif image file.','2014-06-06 19:21:06',''),('en','_template','custom_logo_url',_binary 'URL','2014-06-06 19:21:23',''),('en','_template','custom_test_message',_binary 'Include a message to appear along with the link to the test.','2008-10-10 15:30:19',''),('en','_template','cyan',_binary 'Cyan','2008-09-09 09:01:13',''),('en','_template','d',_binary 'D','2007-01-10 13:48:05',''),('en','_template','danish-dsl',_binary 'Danish-DSL','2008-09-09 09:01:12',''),('en','_template','dark_gray',_binary 'Dark Gray','2008-09-09 09:01:13',''),('en','_template','database',_binary 'Database','2007-07-26 13:39:36',''),('en','_template','database_table',_binary 'Database Table','2005-03-03 12:14:20',''),('en','_template','date',_binary 'Date','2003-05-19 17:44:42','global date label'),('en','_template','date_apr',_binary 'Apr','2003-05-20 12:32:27','date'),('en','_template','date_april',_binary 'April','2003-05-20 12:28:03','date'),('en','_template','date_aug',_binary 'Aug','2003-05-20 12:33:34','date'),('en','_template','date_august',_binary 'August','2003-05-20 12:29:12','date'),('en','_template','date_created',_binary 'Date Created','2003-05-19 17:45:18','view profile'),('en','_template','date_dec',_binary 'Dec','2003-05-20 12:34:03','date'),('en','_template','date_december',_binary 'December','2003-05-20 12:30:35','date'),('en','_template','date_feb',_binary 'Feb','2003-05-20 12:32:12','date'),('en','_template','date_february',_binary 'February','2003-05-20 12:27:33','date'),('en','_template','date_fri',_binary 'Fri','2003-05-20 12:26:47','date'),('en','_template','date_friday',_binary 'Friday','2003-05-20 12:24:40','date'),('en','_template','date_jan',_binary 'Jan','2003-05-20 12:32:05','date'),('en','_template','date_january',_binary 'January','2003-05-20 12:27:11','date'),('en','_template','date_jul',_binary 'Jul','2003-05-20 12:33:27','date'),('en','_template','date_july',_binary 'July','2003-05-20 12:28:56','date'),('en','_template','date_jun',_binary 'Jun','2003-05-20 12:33:21','date'),('en','_template','date_june',_binary 'June','2003-05-20 12:28:41','date'),('en','_template','date_mar',_binary 'Mar','2003-05-20 12:32:22','date'),('en','_template','date_march',_binary 'March','2003-05-20 12:27:48','date'),('en','_template','date_may',_binary 'May','2003-05-20 12:28:20','date'),('en','_template','date_may_short',_binary 'May','2003-05-20 12:33:14','date'),('en','_template','date_mon',_binary 'Mon','2003-05-20 12:26:18','date'),('en','_template','date_monday',_binary 'Monday','2003-05-20 12:24:00','date'),('en','_template','date_nov',_binary 'Nov','2003-05-20 12:33:56','date'),('en','_template','date_november',_binary 'November','2003-05-20 12:30:20','date'),('en','_template','date_oct',_binary 'Oct','2003-05-20 12:33:49','date'),('en','_template','date_october',_binary 'October','2003-05-20 12:30:02','date'),('en','_template','date_of_birth',_binary 'Date of birth','2004-06-24 12:31:02',''),('en','_template','date_sat',_binary 'Sat','2003-05-20 12:26:55','date'),('en','_template','date_saturday',_binary 'Saturday','2003-05-20 12:24:48','date'),('en','_template','date_sep',_binary 'Sep','2003-05-20 12:33:42','date'),('en','_template','date_september',_binary 'September','2003-05-20 12:29:44','date'),('en','_template','date_sun',_binary 'Sun','2003-05-20 12:26:09','date'),('en','_template','date_sunday',_binary 'Sunday','2003-05-20 12:23:52','date'),('en','_template','date_taken',_binary 'Date Taken','2003-05-19 17:46:06','My Tests'),('en','_template','date_thu',_binary 'Thu','2003-05-20 12:26:40','date'),('en','_template','date_thursday',_binary 'Thursday','2003-05-20 12:24:32','date'),('en','_template','date_tue',_binary 'Tue','2003-05-20 12:26:24','date'),('en','_template','date_tuesday',_binary 'Tuesday','2003-05-20 12:24:12','date'),('en','_template','date_wed',_binary 'Wed','2003-05-20 12:26:32','date'),('en','_template','date_wednesday',_binary 'Wednesday','2003-05-20 12:24:21','date'),('en','_template','day',_binary 'Day','2004-06-24 15:45:56',''),('en','_template','days',_binary 'days','2007-02-21 14:04:48',''),('en','_template','default',_binary 'Default','2003-05-19 17:47:07','edit header/admin course manager'),('en','_template','default_announcement',_binary 'This is a welcome announcement. You can access additional help by using the Help link available throughout ATutor.','2005-05-11 14:52:19',''),('en','_template','default_description',_binary 'Default Description','2006-03-22 11:47:28',''),('en','_template','default_language',_binary 'Default Language','2005-03-03 10:50:22',''),('en','_template','default_modules',_binary 'Default Tools','2010-05-03 14:56:46',''),('en','_template','default_preferences',_binary 'Default Preferences','2005-10-05 12:19:22',''),('en','_template','default_side_menu',_binary 'Default Menu','2010-05-03 14:56:55',''),('en','_template','define_pretest',_binary 'Prerequisite Tests.','2009-11-13 15:43:11','create/edit folder'),('en','_template','define_resource_type',_binary 'Define resource type','2008-09-08 14:18:36',''),('en','_template','degree',_binary 'Degree/Program/Courses','2009-05-27 12:01:11',''),('en','_template','degrees',_binary 'Degrees','2009-05-27 12:01:11',''),('en','_template','delete',_binary 'Delete','2003-05-19 18:25:41','global delete label'),('en','_template','deleted',_binary 'Deleted','2003-05-19 18:26:45','links database'),('en','_template','delete_admin',_binary 'Delete Administrator Account','2005-03-03 10:48:32',''),('en','_template','delete_announcement',_binary 'Delete Announcement','2003-05-19 18:27:52','delete news screen'),('en','_template','delete_applications',_binary 'Delete applications','2009-05-27 12:01:11',''),('en','_template','delete_category',_binary 'Delete Category','2003-05-19 18:28:24','links database'),('en','_template','delete_content',_binary 'Delete Content','2003-05-19 18:29:01','delete content screen'),('en','_template','delete_course',_binary 'Delete Course','2003-05-19 18:29:37','delete course screen'),('en','_template','delete_forum',_binary 'Delete Forum','2003-05-19 18:30:40','instructor delete forum screen'),('en','_template','delete_from',_binary 'Delete From','2005-03-03 12:16:04',''),('en','_template','delete_glossary',_binary 'Delete Glossary Term','2005-03-07 11:33:35',''),('en','_template','delete_grade_scale',_binary 'Delete Grade Scale','2008-09-25 15:59:56','gradebook'),('en','_template','delete_group',_binary 'Delete Group','2005-01-15 16:01:10',''),('en','_template','delete_language',_binary 'Delete Language','2003-06-05 18:59:51','admin language manager'),('en','_template','delete_link',_binary 'Delete Link','2005-03-29 14:09:36','links manager'),('en','_template','delete_module_data',_binary 'Also delete module data','2008-10-21 15:41:53',''),('en','_template','delete_package',_binary 'Delete Package','2005-05-17 12:06:21',''),('en','_template','delete_patch',_binary 'Delete Patch','2008-04-21 15:11:31',''),('en','_template','delete_poll',_binary 'Delete Poll','2004-06-14 16:16:15',''),('en','_template','delete_post',_binary 'Delete Post','2006-06-14 11:53:29',''),('en','_template','delete_profile',_binary 'Delete Profile','2004-12-06 11:53:06','admin/error_logging.php'),('en','_template','delete_results',_binary 'Delete Test Results','2003-05-19 18:31:51','test manager'),('en','_template','delete_selected_package_s',_binary 'Delete selected packages','2005-07-19 09:54:28',''),('en','_template','delete_test',_binary 'Delete Test/Survey','2004-08-25 14:09:40',''),('en','_template','delete_text',_binary 'Note: \"Delete\" button is only available before the assignment due date.','2011-05-30 10:07:41',''),('en','_template','delete_this_file',_binary 'Delete This File','2008-04-21 15:11:31',''),('en','_template','delete_this_folder',_binary 'Delete This Folder','2009-11-25 10:53:28','Content'),('en','_template','delete_this_page',_binary 'Delete This Page','2005-03-31 14:18:22','content page shortcuts'),('en','_template','delete_thread',_binary 'Delete Topic','2014-01-02 15:40:03','forums'),('en','_template','delete_user',_binary 'Delete User','2003-05-19 18:35:55','admin user manager'),('en','_template','deny',_binary 'Deny','2005-03-30 15:26:27',''),('en','_template','deny_instructor_request',_binary 'Deny Instructor Request','2005-07-21 16:17:35',''),('en','_template','dependent_patches',_binary 'Dependent Patches','2008-04-21 15:11:31',''),('en','_template','dependent_patch_id',_binary 'Dependent Patch ID','2008-04-21 15:11:31',''),('en','_template','depth_reached',_binary 'Directory depth limit has been reached.','2003-05-19 18:36:54','file manager'),('en','_template','description',_binary 'Description','2003-05-19 18:37:34','global description label'),('en','_template','desktop_theme',_binary 'Desktop Theme','2010-06-18 15:46:31',''),('en','_template','detailed_on',_binary 'detailed view turned on','2014-01-01 15:19:45','icon/detailed view switch'),('en','_template','detailed_profile',_binary 'Detailed Profile','2009-05-27 12:01:11',''),('en','_template','details',_binary 'Details','2003-05-19 18:38:03','instructor taught course table of the control panel'),('en','_template','detail_view',_binary 'Detail View','2009-06-30 16:13:37',''),('en','_template','dictionary',_binary 'Dictionary','2008-09-09 09:03:56',''),('en','_template','direction',_binary 'Direction','2004-11-20 19:36:34',''),('en','_template','directory',_binary 'Directory','2005-03-09 15:28:11',''),('en','_template','directory_name',_binary 'Directory Name','2003-05-19 18:38:42','file manager zip utility'),('en','_template','directory_total',_binary 'Directory Total','2003-05-19 18:39:15','file manager'),('en','_template','disable',_binary 'Disable','2004-10-15 15:46:20','to disable a theme in theme manager'),('en','_template','disabled',_binary 'Disabled','2005-04-01 10:39:58',''),('en','_template','disable_syndicate',_binary 'Disable Announcements syndication','2005-01-04 09:48:31',''),('en','_template','disband_group',_binary 'Disband Group','2009-05-27 12:01:11',''),('en','_template','discussions',_binary 'Discussions','2003-05-19 18:43:39','global text for discussions label'),('en','_template','disk_usage',_binary 'Disk Usage','2007-07-26 17:02:11',''),('en','_template','display',_binary 'Display','2004-08-18 12:03:48',''),('en','_template','display_name_format',_binary 'Display Name Format','2006-09-07 10:21:44',''),('en','_template','display_name_format_fl',_binary '%2$s (%1$s)','2006-08-21 15:29:17',''),('en','_template','display_name_format_fst',_binary '%2$s %3$s %4$s','2006-08-21 15:27:41',''),('en','_template','display_name_format_fstl',_binary '%2$s %3$s %4$s (%1$s)','2006-08-21 15:28:21',''),('en','_template','display_name_format_l',_binary '%s','2006-08-21 15:25:55',''),('en','_template','display_name_format_lf',_binary '%1$s (%2$s)','2006-08-21 15:29:46',''),('en','_template','display_name_format_lfst',_binary '%1$s (%2$s %3$s %4$s)','2006-08-21 15:30:22',''),('en','_template','display_settings',_binary 'Text Settings','2010-04-12 16:32:09',''),('en','_template','dob',_binary 'Date of Birth','2009-05-27 12:01:11',''),('en','_template','donate',_binary 'Donate','2008-09-12 10:51:45','admin home'),('en','_template','donate_text',_binary 'The <a href=\"http://idrc.ocad.ca\">IDRC</a> is a not-for-profit organization that relies on community support to maintain ATutor, and keep it free. If you have found ATutor useful, please consider making a donation.','2011-02-09 13:06:37','admin home'),('en','_template','done',_binary 'Done','2003-05-19 18:44:34','enrolment manager'),('en','_template','download',_binary 'Download','2004-04-30 15:35:13',''),('en','_template','download_content_package',_binary 'Download content package:','2010-06-10 11:28:18',''),('en','_template','download_file',_binary 'Download File','2005-01-10 15:40:00',''),('en','_template','download_test_csv',_binary 'Download CSV of Results','2005-05-30 14:32:27',''),('en','_template','drag',_binary 'Drag','2008-05-22 09:15:04','alt text for fluid theme drag icon'),('en','_template','due',_binary 'Due','2006-03-20 14:38:46',''),('en','_template','due_date',_binary 'Due Date','2006-03-23 11:36:41',''),('en','_template','duration',_binary 'Total Duration','2005-03-01 12:40:00','tracker'),('en','_template','duration_sec',_binary 'Duration (sec)','2003-05-19 18:45:37','tracker'),('en','_template','e',_binary 'E','2007-01-10 13:48:09',''),('en','_template','edit',_binary 'Edit','2004-05-26 18:31:10',''),('en','_template','editor',_binary 'Editor','2003-10-22 15:01:19',''),('en','_template','editor_properties_instructions',_binary 'Select the radio button of the content you want to move. Use the %1$s and %2$s buttons to place this topic after or before the selected location, respectively. Use the %3$s button to add this topic as a child of the selected location.','2009-09-16 13:13:40',''),('en','_template','editor_properties_insturctions_related',_binary 'Add Related Topics by selecting the topic from the list.','2004-02-11 12:33:28','editor properties instructions'),('en','_template','edit_admin',_binary 'Edit Administrator Account','2005-03-03 11:06:16',''),('en','_template','edit_announcement',_binary 'Edit Announcement','2003-05-19 18:47:32','instructor announcement editor'),('en','_template','edit_backup',_binary 'Edit - %s','2004-10-19 12:46:00',''),('en','_template','edit_category',_binary 'Edit Category','2003-05-19 18:49:44','links database'),('en','_template','edit_contact',_binary 'Edit Alternate Contact','2009-12-03 15:38:52',''),('en','_template','edit_content',_binary 'Edit Content','2003-05-19 18:50:07','instructor content editor'),('en','_template','edit_content_folder',_binary 'Edit Content Folder','2009-11-25 11:36:02','Content'),('en','_template','edit_education',_binary 'Edit Education','2009-05-27 12:01:11',''),('en','_template','edit_forum',_binary 'Edit Forum','2003-05-19 18:50:54','instructor forum editor'),('en','_template','edit_for_minutes',_binary 'for another %s minutes','2007-02-23 11:53:28',''),('en','_template','edit_glossary',_binary 'Edit Glossary Term','2003-05-19 18:54:15','instructor edit glossary term screen'),('en','_template','edit_grade_scale',_binary 'Edit Grade Scale','2008-09-25 15:59:56','gradebook'),('en','_template','edit_group',_binary 'Edit Group','2009-05-27 12:01:11',''),('en','_template','edit_language',_binary 'Edit Language','2005-01-21 18:24:19',''),('en','_template','edit_link',_binary 'Edit Link','2003-05-19 18:54:44','links database'),('en','_template','edit_marks',_binary 'Edit Marks','2008-09-25 16:01:17','gradebook'),('en','_template','edit_patch',_binary 'Edit Patch','2008-04-21 15:11:31',''),('en','_template','edit_personal',_binary 'Edit Personal Information','2009-12-07 13:43:15',''),('en','_template','edit_poll',_binary 'Edit Poll','2004-06-14 14:53:54',''),('en','_template','edit_position',_binary 'Edit Position','2009-05-28 14:21:31',''),('en','_template','edit_post',_binary 'Edit Post','2003-09-25 12:54:59','instructor edit forum post'),('en','_template','edit_profile',_binary 'Edit Profile','2009-05-27 12:01:11',''),('en','_template','edit_question',_binary 'Edit Question','2004-12-14 17:58:58',''),('en','_template','edit_representation',_binary 'Edit Representative','2009-12-03 15:42:24','social profile'),('en','_template','edit_test',_binary 'Edit Test/Survey','2004-08-25 14:08:30',''),('en','_template','edit_tests',_binary 'Edit Tests/Assignments','2008-09-25 16:01:17','gradebook'),('en','_template','edit_this_page',_binary 'Edit This Page','2005-03-31 14:16:42','content page shortcuts'),('en','_template','edit_user',_binary 'Edit Member','2004-03-29 11:49:10',''),('en','_template','edit_websites',_binary 'Edit Websites','2009-05-28 14:21:57',''),('en','_template','education',_binary 'Education','2009-05-27 12:01:11',''),('en','_template','email',_binary 'Email','2003-05-19 19:07:59','global email label'),('en','_template','email_address',_binary 'Email Address','2003-05-19 19:09:06','profile, password reminder'),('en','_template','email_again',_binary 'Email Address Again','2009-06-03 15:33:17',''),('en','_template','email_approvals',_binary 'Email me when new enrollments require approval.','2004-01-22 14:57:19',''),('en','_template','email_confirmation_message',_binary 'You have registered for an account on %1s. Please finish the registration process by confirming your email address by using the following link: %2s .','2005-06-24 15:32:49',''),('en','_template','email_confirmation_message2',_binary 'To finish changing your account\'s email address on %1s, please confirm your email address by using the following link: %2s .','2006-05-11 16:08:25',''),('en','_template','email_confirmation_subject',_binary 'Email Confirmation','2005-03-22 11:35:30',''),('en','_template','email_enrollment_message',_binary 'An enrolment request has been made in the course %s.','2010-01-07 13:06:23',''),('en','_template','email_enrollment_subject',_binary 'Course Enrolment','2010-01-07 13:06:34',''),('en','_template','emoticons',_binary 'Emoticons','2003-05-22 15:43:20','code picker'),('en','_template','empty',_binary 'empty','2003-05-19 19:10:56','prefs page, menu options'),('en','_template','empty_gradebook',_binary 'Gradebook is empty.','2008-09-25 16:01:17','gradebook'),('en','_template','empty_url',_binary 'Please provide a remote URL.','2010-06-18 13:28:57',''),('en','_template','enable',_binary 'Enable','2004-10-15 15:52:29','enable button in theme'),('en','_template','enabled',_binary 'Enabled','2005-05-06 12:49:07','theme'),('en','_template','enable_mail_queue',_binary 'Enable Mail Queue','2006-04-03 14:21:43',''),('en','_template','enable_sco_rte',_binary 'Enable the SCORM 1.2 RTE','2005-05-10 10:52:42',''),('en','_template','enable_syndicate',_binary 'Enable Announcements syndication via <acronym title=\"Rich Site Summary\">RSS</acronym>','2005-01-04 10:27:41',''),('en','_template','enable_uploader',_binary 'Enable multi-file uploader tool','2008-07-24 16:19:54','Used for toggling between Fluid\'s Uploader and the basic uploader'),('en','_template','encyclopedia',_binary 'Encyclopedia','2008-09-10 12:25:52','tool prefs'),('en','_template','end_date',_binary 'End Date','2003-05-19 19:13:46','mytests'),('en','_template','end_on',_binary 'End on','2007-07-16 14:26:34',''),('en','_template','enroll',_binary 'Enroll','2003-05-19 19:16:50','link text for enroll function'),('en','_template','enrolled',_binary 'Enrolled','2003-05-19 19:18:28','control centre, delete course, admin course manager, text label'),('en','_template','enrolled_list_includes_assistants',_binary 'Enrolled Students (includes Assistants)','2004-10-15 11:56:23','enrolled students list in list exporter in enrollement manager'),('en','_template','enrolled_privileges',_binary 'Enrolled With Privileges','2005-06-10 10:58:01',''),('en','_template','enrollment',_binary 'Enrollment','2005-12-07 11:19:38',''),('en','_template','enroll_me',_binary 'Enroll Me','2005-04-14 13:15:58',''),('en','_template','enroll_to_post',_binary 'You must be enrolled to post to the forums.','2004-12-09 11:07:43',''),('en','_template','enrolment',_binary 'Enrollment','2006-10-18 11:47:33',''),('en','_template','enrol_login',_binary 'You must login to your course to approve the new enrollment request using the Enrollment section.','2005-07-05 12:15:39','instructor enrolment screen'),('en','_template','enrol_message3',_binary 'ATutor Course Enrollment','2003-04-21 15:03:49','context'),('en','_template','enrol_messagenew',_binary 'An enrollment request was made for the ATutor course %s. Log into your course at %s , go to Manage and then to the unenrolled tab in the Enrollment Manager.','2005-03-29 12:23:47','instructor enrolment email notice'),('en','_template','enrol_message_approved',_binary 'Your enrollment request for the course %1s has been approved.\r\nLog into ATutor, then select the course from My Courses or use the login link below:\r\n\r\n%2s','2005-03-30 11:49:50','email message sent to enrollee once approved'),('en','_template','enrol_message_subject',_binary 'Course enrollment approved','2003-05-20 11:18:15','enroll email approval'),('en','_template','enrol_msg',_binary 'A new enrollment request has been made for your course %s.','2005-07-05 12:15:49','instructor email enrollment notification message'),('en','_template','entertainment_arts',_binary 'Arts and Entertainment','2009-05-27 12:01:11',''),('en','_template','enter_chat',_binary 'Enter the Chat','2003-05-27 14:20:24','achat entry page'),('en','_template','enter_course',_binary 'Enter Course','2005-03-14 15:15:57',''),('en','_template','enter_edit_mode',_binary 'Enter Edit Mode','2009-09-16 13:12:12',''),('en','_template','enter_search_terms',_binary 'Enter search terms','2014-01-01 13:13:36',''),('en','_template','entire_course',_binary 'Entire Course','2006-07-24 10:44:01',''),('en','_template','error',_binary 'Error','2003-05-19 20:20:07','global error label'),('en','_template','error_logging',_binary 'Error Logging','2005-02-07 16:11:55',''),('en','_template','everyone',_binary 'Everyone','2004-12-07 17:54:16',''),('en','_template','existing_type',_binary 'Existing Type:','2006-03-22 15:11:15',''),('en','_template','exit_edit_mode',_binary 'Exit Edit Mode','2009-09-16 13:12:24',''),('en','_template','expand',_binary 'Expand','2003-05-19 20:20:35','menu toggle alt text'),('en','_template','experimental',_binary 'Experimental','2008-12-02 11:58:25',''),('en','_template','expertise',_binary 'Expertise','2009-05-27 12:01:11',''),('en','_template','expired',_binary 'Expired','2003-05-19 20:21:08','mytests'),('en','_template','expire_never',_binary 'Never expire','2007-02-13 15:38:14',''),('en','_template','expire_on',_binary 'Expire on','2007-02-13 15:38:24',''),('en','_template','expiry_date',_binary 'Expiry Date','2007-02-13 15:37:50',''),('en','_template','export',_binary 'Export','2003-05-19 20:21:32','instructor control centre'),('en','_template','export_content',_binary 'Export Content','2003-10-03 11:00:51',''),('en','_template','export_content_info',_binary 'Export content as an <strong>IMS or SCORM conformant content package</strong>, or as an <strong>IMS Common Cartridge</strong>. Import the zipped package or cartridge into another ATutor system or another course, or into another conformant LMS or LCMS.','2009-11-12 16:52:35',''),('en','_template','export_content_package_what',_binary 'What to export','2003-10-14 11:11:11',''),('en','_template','export_content_text',_binary 'Download content, unzip it onto your computer, then click \"index.html\" to view.','2009-07-02 14:15:47',''),('en','_template','export_entire_course_or_chap',_binary 'Entire course, or select a chapter below','2003-10-07 15:14:52',''),('en','_template','export_marks_info',_binary 'To simplify the import process, you can export an empty csv file on the test you want to import, fill in the marks, import back into ATutor.','2008-09-25 16:01:17','gradebook'),('en','_template','external',_binary 'External','2011-08-29 13:32:04','gradebook type'),('en','_template','external_help',_binary 'External Help','2005-03-17 10:31:39',''),('en','_template','external_tests',_binary 'External Tests','2008-09-25 16:01:17','gradebook'),('en','_template','extra',_binary 'Extra','2005-09-21 13:35:05',''),('en','_template','extract',_binary 'Extract','2003-05-19 20:23:33','file manager zip utility'),('en','_template','extract_archive',_binary 'Extract Archive','2003-05-19 20:23:58','file manager zip utility'),('en','_template','extract_tip',_binary 'Tip: Use an empty directory name to extract the contents into the current directory.','2003-05-19 20:24:27','file manager zip utility'),('en','_template','f',_binary 'F','2007-01-10 13:48:14',''),('en','_template','factory_default',_binary 'Reset to preference defaults','2010-04-20 13:58:25',''),('en','_template','fail_feedback',_binary 'Fail Feedback','2008-03-10 11:49:51','Test/Survey Property'),('en','_template','false',_binary 'False','2003-05-20 08:52:19','textmanager, mytests t/f label'),('en','_template','fantasy',_binary 'Fantasy','2008-09-09 09:01:13',''),('en','_template','faq',_binary 'Frequently Asked Questions (FAQ)','2005-10-19 12:41:54',''),('en','_template','farchive',_binary 'Forum Archiver','2008-11-07 10:41:59',''),('en','_template','farchive_export',_binary 'Export Forum','2008-11-07 10:42:18',''),('en','_template','farchive_select_forum',_binary 'Select Forum to Export:','2008-11-07 10:42:50',''),('en','_template','feedback',_binary 'Feedback','2003-05-20 09:09:40','global feedback label'),('en','_template','feedback_autohide',_binary 'AutoHide','2013-12-18 18:40:27',''),('en','_template','feedback_manual',_binary 'Manual','2013-12-18 18:40:56',''),('en','_template','feedback_placeholder',_binary 'Enter information to present to students after correctly answering this question.','2013-01-23 14:13:44','remedial content'),('en','_template','female',_binary 'Female','2003-05-20 09:18:03','registration, profile'),('en','_template','fg_colour',_binary 'Foreground Colour','2008-09-09 09:01:13',''),('en','_template','field',_binary 'Area of Study','2009-05-27 12:01:11',''),('en','_template','file',_binary 'File','2003-05-20 09:18:31','file manager, zip tool'),('en','_template','filemanager_date_format',_binary '%%Y-%%m-%%d %%H:%%i','2009-06-30 16:05:29','file manager date'),('en','_template','fileman_disabled_title',_binary 'File Manager disabled','2010-04-14 11:26:27',''),('en','_template','fileman_enabled_title',_binary 'Open File Manager window','2010-04-14 11:26:05',''),('en','_template','files',_binary 'Files','2005-08-16 15:27:36',''),('en','_template','file_manager',_binary 'File Manager','2003-05-20 09:27:19','global file manager label'),('en','_template','file_manager_frame',_binary 'File Manager Frame','2005-01-31 11:14:37','viewing files in filemanger frame'),('en','_template','file_manager_new',_binary 'Create a New File','2004-10-29 14:53:13','file manager'),('en','_template','file_name',_binary 'File Name','2004-10-15 12:08:25',''),('en','_template','file_placeholder',_binary 'File Name Placeholder','2008-07-22 16:44:59','Placeholder text used in Fluid\'\'s multiple file uploader.'),('en','_template','file_size',_binary 'File Size','2004-10-14 13:57:59',''),('en','_template','file_storage',_binary 'File Storage','2010-06-29 14:30:00',''),('en','_template','file_storage_edit_file',_binary 'File Storage - Edit File','2010-12-08 20:15:04','File Storage'),('en','_template','file_storage_edit_folder',_binary 'File Storage - Edit Folder','2010-12-08 20:15:31','File Storage'),('en','_template','file_storage_move',_binary 'File Storage - Move','2010-12-08 20:15:52','File Storage'),('en','_template','file_storage_new_file',_binary 'File Storage - New File','2010-12-08 20:21:53','File Storage'),('en','_template','file_storage_version_control',_binary 'Maintain File Storage Version Control','2010-06-29 14:29:49',''),('en','_template','file_to_read',_binary 'File To Read','2006-04-13 11:03:16',''),('en','_template','fill_groups',_binary 'Fill Groups','2006-03-22 11:52:47',''),('en','_template','fill_groups_randomly',_binary 'Fill groups randomly upon creation.','2006-03-22 11:53:14',''),('en','_template','filter',_binary 'Filter','2005-03-30 14:52:33',''),('en','_template','final_score',_binary 'Final Score','2007-03-16 14:10:05',''),('en','_template','find_gadgets',_binary 'Find Gadgets','2009-07-13 14:55:51',''),('en','_template','find_results_in',_binary 'Find results in','2004-08-18 12:02:16',''),('en','_template','first_name',_binary 'First Name','2003-05-20 09:58:26','registration, profile'),('en','_template','fix_content_ordering',_binary 'Fix Content Ordering','2004-10-18 14:03:47',''),('en','_template','fix_content_ordering_text',_binary 'Occasionally, content pages can get disordered due to miscalculation. This is an ongoing issue that will be resolved in an upcoming version of ATutor but until then, we have made a patch available that can be used to fix the issue. If you are experiencing this problem, please use the button below.','2005-03-10 11:19:41',''),('en','_template','flag_text',_binary '<small>%s indicates files have been handed in.</small>','2011-05-30 10:07:17',''),('en','_template','flowplayer',_binary 'Flowplayer','2010-03-18 11:46:30',''),('en','_template','focus',_binary 'Focus','2008-10-06 13:41:36',''),('en','_template','folder',_binary 'Folder','2003-05-20 10:05:51','file manager, zip utility'),('en','_template','font_face',_binary 'Font Face','2008-09-09 09:01:13',''),('en','_template','font_size',_binary 'Font Size','2008-09-09 09:01:13',''),('en','_template','formatting',_binary 'Formatting','2003-05-20 10:07:25','add/ edit content, news, export'),('en','_template','form_editor',_binary 'Atutor Form Editor','2005-03-11 10:31:45','Form editor for test questions'),('en','_template','form_focus',_binary 'Form Focus On Page Load','2005-03-29 12:38:11',''),('en','_template','forum',_binary 'Forum','2004-04-16 10:54:23','Forum list header'),('en','_template','forums',_binary 'Forums','2003-05-20 10:08:05','global forums label'),('en','_template','forum_date_format',_binary '%%D %%M %%j %%H:%%i','2004-05-26 15:18:29',''),('en','_template','forum_email_links',_binary 'All email addresses are made into links.','2003-05-20 10:11:14','forums email address links instruction'),('en','_template','forum_general_discussion',_binary 'General Discussion','2004-12-16 11:07:19','default forum in forum list'),('en','_template','forum_html_disabled',_binary 'HTML is disabled.','2003-05-20 10:11:42','forum compose message'),('en','_template','forum_links',_binary 'All words starting with http:// are made into links.','2003-05-20 10:12:23','forum compose link creation instruction'),('en','_template','forum_new_submsg',_binary '*DO NOT REPLY TO THIS MESSAGE*\r\nA discussion thread in the ATutor course \"%s\" has recieved a reply. Login to access the \"%s\" forum and view the \"%s\" thread. Click and view the message at: %s','2009-12-16 11:51:02','forum email message to thread subscribers'),('en','_template','forum_posts',_binary 'Forum Posts','2005-03-16 14:59:41',''),('en','_template','forum_reply_to',_binary 'Replying To','2003-05-20 10:12:48','forum reply to label for quoted messages'),('en','_template','forward',_binary 'Forward','2007-02-20 16:21:52',''),('en','_template','french',_binary 'French','2008-09-09 09:01:12',''),('en','_template','french-lsf',_binary 'French-LSF','2008-09-09 09:01:12',''),('en','_template','friends',_binary 'My Contacts','2009-05-27 12:01:11',''),('en','_template','friends_of_friends',_binary 'Contacts of Your Contacts','2009-05-27 12:01:11',''),('en','_template','from',_binary 'From','2003-05-20 10:17:19','global from label'),('en','_template','from_atutor',_binary 'This message was sent through the ATutor system from course %s.','2003-05-20 10:19:30','instructor/admin contact for email message'),('en','_template','from_email',_binary 'From Email','2003-05-20 10:21:35','instructor/admin contact form'),('en','_template','from_name',_binary 'From Name','2003-05-20 10:22:02','instrcutor/admin contact from'),('en','_template','fs_comment',_binary '%s Comment','2006-06-29 10:09:37',''),('en','_template','fs_comments',_binary '%s Comments','2006-06-29 09:55:11',''),('en','_template','fs_revision',_binary '%s Revision','2006-06-29 10:05:39',''),('en','_template','fs_revisions',_binary '%s Revisions','2006-06-29 09:52:36',''),('en','_template','full_name',_binary 'Full Name','2006-03-27 15:55:44',''),('en','_template','fwd',_binary 'Fwd','2007-02-20 16:20:07',''),('en','_template','g',_binary 'G','2007-01-10 13:48:18',''),('en','_template','gender',_binary 'Sex','2003-05-20 10:22:19','registration, profile'),('en','_template','general_help',_binary 'For guidance on using ATutor see the official <a href=\"%1$s\" onclick=\"poptastic(\'%1$s\'); return false;\" target=\"new\"><strong>ATutor Handbook</strong></a>.','2014-01-12 17:02:34','atutor default footer'),('en','_template','geography',_binary 'Geographic','2009-05-27 12:01:11',''),('en','_template','german',_binary 'German','2008-09-09 09:01:12',''),('en','_template','german-dgs',_binary 'German-DGS','2008-09-09 09:01:12',''),('en','_template','give_description',_binary 'Brief description of your proposed course(s)','2005-03-09 12:19:48','control centre request instructor account form'),('en','_template','global_more_than_10_pages',_binary 'Global: More than 10 pages.','2006-09-27 12:42:43',''),('en','_template','glossary',_binary 'Glossary','2003-05-20 10:24:33','global glossary label'),('en','_template','glossary_definition',_binary 'Definition','2003-05-20 10:25:13','glossary add/edit term'),('en','_template','glossary_related',_binary 'Related Term','2003-05-20 10:26:35','add/edit glossary term'),('en','_template','glossary_term',_binary 'Term','2003-05-20 10:27:01','add/edit glossary term'),('en','_template','glossary_terms',_binary 'Glossary Terms','2003-05-20 10:27:47','delete course feedback for terms deleted'),('en','_template','glossary_term_limit',_binary 'This term exceeds the 60 character limit and cannot be added.','2005-12-12 11:39:08',''),('en','_template','go',_binary 'Go!','2006-04-26 13:47:29',''),('en','_template','google_key',_binary 'Google Key','2005-10-20 11:02:40',''),('en','_template','google_key_txt',_binary 'To access the Google search as an <em>embedded service</em>, you must first create an account and obtain a license key at <a href=\"http://code.google.com/apis/ajaxsearch/signup.html\" target=\"_new\">google.com/apis</a> and enter it below.\r\n<br /><br />\r\nThe search can be used as an external service by clearing the key field below.','2007-09-04 15:14:30',''),('en','_template','google_new_window',_binary 'Search opens in a new window.','2005-11-30 16:45:26',''),('en','_template','google_search',_binary 'Web Search','2005-10-20 10:35:41',''),('en','_template','google_search_ajax',_binary 'Google AJAX Search <em>(requires license key</em> <strong>after</strong> <em>Dec 5th, 2006)</em>','2008-07-28 10:51:24','Google search'),('en','_template','google_search_attn',_binary 'Please note that the old Google search is only applicable to those who have obtained a license key before Dec 5th, 2006; any new license key obtained after December 5th, 2006 is only applicable to the new Google AJAX search.','2007-09-04 14:55:56','Google search'),('en','_template','google_search_books',_binary 'Books','2007-08-31 11:25:12','Google search'),('en','_template','google_search_images',_binary 'Images','2007-08-31 11:22:38','Google search'),('en','_template','google_search_local',_binary 'Local','2007-08-31 11:57:07','Google search'),('en','_template','google_search_news',_binary 'News','2007-08-31 11:23:30','Google search'),('en','_template','google_search_soap',_binary 'Old Google Search <em>(requires license key</em> <b>before</b> <em>Dec 5th, 2006)</em>','2008-07-28 10:51:46','Google search'),('en','_template','google_search_text',_binary 'Search the Web outside this course for additional information.','2009-07-02 14:17:14',''),('en','_template','google_search_txt',_binary 'To search for specific words within a website, enter them below then use the \'Search\' button.  If you wish to search course content, use the <a href=\"search.php\">content search</a>.','2005-10-20 11:02:02',''),('en','_template','google_search_type_txt',_binary 'Please select one of the Google search interfaces.','2007-08-31 14:36:30','Google search'),('en','_template','google_search_videos',_binary 'Videos','2007-08-31 11:22:53','Google search'),('en','_template','goto_content',_binary 'Go to content','2004-05-11 15:18:23',''),('en','_template','goto_main_nav',_binary 'Jump to Main Navigation','2014-01-01 17:34:51','bypass link'),('en','_template','goto_menu',_binary 'Go to Menu','2006-07-14 10:14:57','2nd invisible link on the page'),('en','_template','goto_top',_binary 'Go to Top','2003-05-20 10:34:03','bypass link text in ATutor header'),('en','_template','go_to_my_start_page',_binary 'Go To My Start Page','2008-03-10 12:02:45','auto enroll property'),('en','_template','grade',_binary 'Grade','2008-09-25 16:01:17','gradebook'),('en','_template','gradebook',_binary 'Gradebook','2011-05-11 14:40:35',''),('en','_template','gradebook_text',_binary 'Review marks for your tests and assignments.','2009-07-02 14:16:20',''),('en','_template','grades_uncomparable',_binary 'Grades are uncomparable. Choose another way to solve conflict','2008-09-25 16:01:17','gradebook'),('en','_template','grade_already_exists',_binary 'Conflict: Grade already exists - %s','2008-09-25 16:01:17','gradebook'),('en','_template','grade_info',_binary 'Note: \"Grade\" field can be grade defined in \"Grade Scale\" or percentage like 50%%.','2008-09-25 16:01:17','gradebook'),('en','_template','grade_scale',_binary 'Grade Scale','2008-09-25 15:59:56','gradebook'),('en','_template','grant_write_permission',_binary 'Please grant <strong>write</strong> permission to folders and files listed below:<p><strong>Note:</strong> To change permissions on Unix use <kbd>chmod a+rw</kbd> then the file name.</p>','2008-04-21 15:08:55','patcher'),('en','_template','graph',_binary 'Graph','2003-05-20 10:36:18','instructor course details graph label'),('en','_template','gray',_binary 'Gray','2003-05-20 10:36:32','global code picker'),('en','_template','green',_binary 'Green','2003-05-20 10:36:45','global code picker'),('en','_template','group',_binary 'Group','2005-05-03 15:42:38',''),('en','_template','grouped_by_course',_binary 'Grouped by course','2004-08-18 12:04:40',''),('en','_template','groups',_binary 'Groups','2004-11-25 15:45:26',''),('en','_template','groups_create_automatic',_binary 'Create multiple groups automatically','2006-03-21 15:36:08',''),('en','_template','groups_create_manual',_binary 'Create a single group manually','2006-03-21 15:36:58',''),('en','_template','groups_text',_binary 'Participate in group learning activities.','2009-07-02 14:16:03',''),('en','_template','groups_type',_binary 'Groups Type','2006-03-22 11:16:01',''),('en','_template','group_about_private',_binary 'Users will have to be approved by the moderator to join this group.','2009-05-27 12:01:11',''),('en','_template','group_about_public',_binary 'The group is opened to all users.  No approval is needed.','2009-05-27 12:01:11',''),('en','_template','group_admin',_binary 'Group Moderator','2009-05-27 12:01:11',''),('en','_template','group_forums',_binary 'Group Forums','2006-05-24 08:48:58',''),('en','_template','group_info',_binary 'Group Details','2009-05-27 12:01:11',''),('en','_template','group_invitation',_binary 'ATutor Social Group Invitation','2009-05-27 12:01:11',''),('en','_template','group_invitation_accepted',_binary 'ATutor Social Group Invitation Accepted','2009-05-27 12:01:11',''),('en','_template','group_joined',_binary 'You are a member of this group.','2009-05-27 12:01:11',''),('en','_template','group_last_update',_binary 'Last Update','2009-05-27 12:01:11',''),('en','_template','group_last_updated',_binary 'Last Updated ','2009-05-27 12:01:11',''),('en','_template','group_logo',_binary 'Group Logo','2009-05-27 12:01:11',''),('en','_template','group_members',_binary 'Group Members','2005-06-10 10:34:56',''),('en','_template','group_name',_binary 'Group Name','2009-05-27 12:01:11',''),('en','_template','group_prefix',_binary 'Group Prefix','2006-03-22 11:17:12',''),('en','_template','group_request',_binary 'ATutor Social Join Group Request','2009-05-27 12:01:11',''),('en','_template','group_request_accepted',_binary 'ATutor Social Group Request Accepted','2009-05-27 12:01:11',''),('en','_template','group_type',_binary 'Group Type','2009-05-27 12:01:11',''),('en','_template','guest',_binary 'Guest','2003-05-20 10:37:10','name assigned to non-registered users'),('en','_template','guests',_binary 'Guests','2003-05-20 10:38:19','instructor course stats/details'),('en','_template','guests_not_listed',_binary 'Guests are not listed','2003-05-20 10:38:32','who\'s on menu'),('en','_template','guest_information',_binary 'Guest Information','2008-10-06 13:40:43',''),('en','_template','guest_name',_binary 'Guest Name','2008-10-06 13:41:12',''),('en','_template','guide',_binary 'Guide','2010-09-21 11:46:53','mobile header.tmpl'),('en','_template','h',_binary 'H','2007-01-10 13:48:22',''),('en','_template','handout_to_read',_binary 'Handout to Read','2006-04-13 11:58:39',''),('en','_template','hand_in',_binary 'Hand In','2006-03-20 14:36:56',''),('en','_template','has_added_app',_binary 'has added the <a href=\"%s\">%s</a>  gadget','2009-05-27 12:01:11',''),('en','_template','has_added_group',_binary 'has added the group %s.','2009-07-22 14:35:24',''),('en','_template','has_invited_join',_binary '%s has invited you to join the group %s.','2009-07-22 14:36:55',''),('en','_template','has_joined_group',_binary 'has joined the group %s.','2009-07-22 14:35:05',''),('en','_template','has_requested_to',_binary '%s has requested to join the group %s.','2009-05-27 12:01:11',''),('en','_template','has_updated_group',_binary 'has updated the group %s.','2009-07-22 14:35:56',''),('en','_template','have',_binary 'Have','2007-02-21 13:22:47',''),('en','_template','have_not',_binary 'Have not','2007-02-21 14:06:25',''),('en','_template','help',_binary 'Help','2003-05-20 10:41:08','global help label'),('en','_template','hidden',_binary 'Hidden','2003-05-20 10:42:27','instructor/admin contact form'),('en','_template','hide',_binary 'Hide','2005-03-15 11:37:50',''),('en','_template','hide_all_remedial',_binary 'Hide All Remedial Content','2013-01-23 14:19:48',''),('en','_template','hide_course',_binary 'Hide this course from the Browse Courses list','2003-05-20 10:42:41','create course screen'),('en','_template','hide_feedback',_binary 'Hide Feedback','2013-12-18 18:41:36',''),('en','_template','hide_side_menu',_binary 'Hide Side Menu','2014-07-08 18:50:56','hide side menu toggle'),('en','_template','hide_sub_navigation',_binary '. Toggle sub navigation closed.','2013-12-26 17:30:46',''),('en','_template','history',_binary 'History','2003-05-25 08:36:00','context (removed after v1.1)'),('en','_template','hits',_binary 'Hits','2003-05-20 10:44:14','links database link hit count'),('en','_template','hit_count',_binary 'Hit Count','2003-05-20 10:45:17','tracker'),('en','_template','hl_colour',_binary 'Highlight Colour','2008-09-09 09:01:13',''),('en','_template','home',_binary 'Home','2006-05-31 11:12:30',''),('en','_template','home_url',_binary 'Home URL','2005-03-03 10:50:09',''),('en','_template','horizontal',_binary 'Horizontal','2004-12-01 13:35:05','edit/create option test questions'),('en','_template','hot',_binary 'Hot!','2003-05-20 10:47:10','(not used)'),('en','_template','hot_thread',_binary 'Hot topic!','2014-01-02 15:40:23','forum message for busy thread'),('en','_template','hours_24',_binary '24hr','2003-05-20 10:48:10','release date picker'),('en','_template','hour_short',_binary 'h','2007-07-09 12:31:21',''),('en','_template','howto_course',_binary '<a href=\"http://atutor.ca/atutor/docs/index.php\">ATutor Documentation</a>','2005-06-01 12:32:03','help'),('en','_template','howto_course_text',_binary 'In addition to the <a href=\"documentation/\" onclick=\"poptastic(\'documentation/\'); return false;\" target=\"_new\"><em>ATutor Handbook</em></a> bundled with ATutor, other documentation sources are available through the <a href=\"http://atutor.ca/atutor/docs/index.php\">ATutor Documentation</a> site.','2005-07-06 10:04:29',''),('en','_template','how_to_solve_conflict',_binary 'How to solve conflict','2008-09-25 16:01:17','gradebook'),('en','_template','html',_binary 'HTML','2003-05-20 10:48:48','global HTML label'),('en','_template','html_only',_binary ' Plain Text or HTML files only.','2003-05-20 10:49:49','add/edit content, header'),('en','_template','i',_binary 'I','2007-01-10 13:48:26',''),('en','_template','icon',_binary 'Icon','2005-03-03 11:19:49',''),('en','_template','icon_on',_binary 'icon view turned on','2014-01-01 15:18:28','icon/detailed view switch'),('en','_template','icon_view',_binary 'icon view','2014-01-01 14:43:12',''),('en','_template','id',_binary 'ID','2003-05-20 10:50:57','global ID (identification number) label'),('en','_template','ignore_validation',_binary 'Ignore validation','2010-06-16 10:01:11',''),('en','_template','illegal_file',_binary 'Illegal File Type','2003-05-20 10:52:36','zip utility when archive contain illegal extension'),('en','_template','illegal_file_extensions',_binary 'Illegal File Extensions','2005-03-03 10:52:15',''),('en','_template','image',_binary 'Image','2003-05-20 10:53:28','global code picker image code link text'),('en','_template','image_validation_text',_binary 'In the above image there are numbers and/or letters displayed.  Please type them into the following field.','2009-07-16 09:02:13',''),('en','_template','image_validation_text2',_binary 'This helps ensure a live person is registering on this system.','2009-06-03 15:33:17',''),('en','_template','import',_binary 'Import','2003-05-20 11:56:51','instructor import/export screen'),('en','_template','import_a_new_lang',_binary 'Import a New Language','2003-06-04 15:34:43','admin language manager'),('en','_template','import_content',_binary 'Import Content','2005-02-18 14:05:57',''),('en','_template','import_content_info',_binary 'Import a conformant IMS content package or IMS common cartridge. Select a location within the existing content to <strong>import into</strong>.  Or enter a URL to content package or common cartridge, to import directly from the Web.','2009-11-12 16:56:26',''),('en','_template','import_content_package',_binary 'Import Content Package','2003-10-03 13:07:38',''),('en','_template','import_content_package_bottom_subcontent',_binary 'As top level content, or as subcontent selected below','2003-10-20 13:36:27',''),('en','_template','import_content_package_where',_binary 'Import into','2003-10-14 12:24:03',''),('en','_template','import_err_email_exists',_binary 'Account exists.','2004-01-30 15:38:42',''),('en','_template','import_err_email_invalid',_binary 'Email invalid.','2004-01-30 13:28:32',''),('en','_template','import_err_email_missing',_binary 'Email missing.','2004-01-30 13:28:40',''),('en','_template','import_err_full_name_exists',_binary 'First and Last name exist.','2006-03-28 10:40:02',''),('en','_template','import_err_username_exists',_binary 'Username already taken.','2004-01-30 13:28:48',''),('en','_template','import_err_username_invalid',_binary 'Username contains invalid characters.','2004-01-30 13:28:56',''),('en','_template','import_export_external_marks',_binary 'External Marks','2008-09-25 16:01:17','gradebook'),('en','_template','import_lang_howto',_binary 'You may import additional languages into this installation of ATutor by downloading the language pack from the ATutor.ca website then uploading it using the form below, or if the drop down below is able to detect the available languages remotely then it may be used as well.','2004-10-18 14:25:21','admin language manager'),('en','_template','import_marks_info',_binary 'A mark list may be imported into ATutor. Create the mark list in a comma separated values (CSV) format as follows: \"firstname\", \"lastname\", \"email\", \"mark\" with one student per line. Please leave the first line as title. The mark in CSV file can be grade or percentage like 50%%. To simplify the process, you can export the CSV file with export functionality, update the marks into exported file and import back into ATutor.','2008-09-25 16:01:17','gradebook'),('en','_template','import_package',_binary 'Import Package','2005-05-17 12:06:10',''),('en','_template','import_question',_binary 'Import Questions','2008-09-23 13:59:41',''),('en','_template','import_remote_language',_binary 'Or, import a language directly from the ATutor.ca website.','2004-10-18 14:27:11',''),('en','_template','import_sep_txt',_binary 'For auto-generated usernames, separate first and last names with:','2004-06-22 12:07:48',''),('en','_template','import_test',_binary 'Import Test','2008-09-23 13:52:19',''),('en','_template','import_theme',_binary 'Import Theme','2004-10-15 15:47:13','import theme button in theme manager'),('en','_template','ims_files_missing',_binary 'In this package, the file, %1$s, is missing or misplaced.','2009-12-07 14:25:04',''),('en','_template','ims_missing_references',_binary 'Missing file references','2009-12-07 16:27:01',''),('en','_template','inactive_admin',_binary 'Inactive Administrator','2005-03-03 11:00:55',''),('en','_template','inbox',_binary 'Inbox','2003-05-20 11:59:47','global Inbox label'),('en','_template','inbox_date_format',_binary '%%l %%M %%j, %%Y - %%H:%%i','2003-05-20 12:00:47','inbox screen (see www.php.net/date for codes)'),('en','_template','inbox_notification',_binary 'Inbox Notification','2005-03-16 14:40:07',''),('en','_template','info',_binary 'Course Info','2005-04-01 15:09:41','global info message box label'),('en','_template','initial_content',_binary 'Initial Content','2004-10-15 15:45:10',''),('en','_template','insert',_binary 'Insert','2003-05-20 12:02:16','instructor add content screen'),('en','_template','insert_into',_binary 'Insert Into','2005-03-03 12:15:49',''),('en','_template','install',_binary 'Install','2005-08-16 15:51:57',''),('en','_template','installed',_binary 'Installed','2008-10-28 10:58:39',''),('en','_template','installed_date',_binary 'Installed Date','2008-11-17 10:41:34',''),('en','_template','install_modules',_binary 'Install Modules','2005-08-16 16:17:09',''),('en','_template','install_module_text',_binary 'To install a new module it must first be extracted into the <code>%s</code> directory for it to appear in the list below.','2005-08-17 13:47:02',''),('en','_template','install_themes',_binary 'Install Themes','2008-11-14 11:47:00',''),('en','_template','install_themes_text',_binary 'To install new themes the <code>%s</code> directory must be set to writeable. Use the command <kbd>chmod a+w themes</kbd> on Unix machines, while on Windows the web server must have write permissions on that directory.','2005-12-14 12:36:08',''),('en','_template','institution',_binary 'School/Institution','2009-05-27 12:01:11',''),('en','_template','instructions',_binary 'Instructions','2005-04-05 14:25:07',''),('en','_template','instructions_placeholder',_binary 'Enter information about how the test should be taken.','2013-01-23 14:15:37',''),('en','_template','instructor',_binary 'Instructor','2003-05-20 12:02:59','global instructor label'),('en','_template','instructors',_binary 'Instructors','2003-05-20 12:03:37','admin general statistics label for number of instructors'),('en','_template','instructor_contact_form',_binary 'Instructor Contact Form','2003-05-20 12:12:32','instructor contact form heading'),('en','_template','instructor_request',_binary 'ATutor Instructor Request','2003-05-25 08:37:50','subject line in email to admin when instructor request is made'),('en','_template','instructor_requests',_binary 'Instructor Requests','2003-05-20 12:19:52','admin home page heading'),('en','_template','instructor_requests_text',_binary 'There are <strong>%s</strong> instructor requests pending approval.','2005-03-30 15:30:02',''),('en','_template','instructor_request_deny',_binary 'Your ATutor instructor request has been denied.','2003-10-06 15:14:48','email message to denied instructor'),('en','_template','instructor_request_denymsg1',_binary 'Registration information is incomplete.','2003-10-06 15:55:47','reason why denied'),('en','_template','instructor_request_denymsg2',_binary 'Inappropriate subject matter.','2003-10-06 16:01:26','reason why denied'),('en','_template','instructor_request_denymsg3',_binary 'The course description requires more detail.','2003-10-07 15:47:33','deny instructor request'),('en','_template','instructor_request_denymsg4',_binary 'You have requested enrollment with the wrong form.','2003-10-07 15:52:12','admin deny instructor request'),('en','_template','instructor_request_email_notification',_binary 'Instructor Request Email Notification','2005-03-03 10:51:01',''),('en','_template','instructor_request_enterdenymsg',_binary 'Choose a message explaining why the user\'s request was denied or enter your own.','2003-10-06 15:19:05','Header text for deny message text area'),('en','_template','instructor_request_reply',_binary 'Your ATutor instructor request has been approved. Go to %s to login to My Courses, then select \"Create Course\".','2005-05-27 13:53:06','email in reply to instructor account approval'),('en','_template','interests',_binary 'Interests','2009-05-27 12:01:11',''),('en','_template','internet_technology',_binary 'Internet Technology','2009-05-27 12:01:11',''),('en','_template','invalid_session',_binary 'Not a Valid Session','2003-05-20 12:26:29','tracker'),('en','_template','invite',_binary 'Invite','2009-05-27 12:01:11',''),('en','_template','invite_groups',_binary 'Invite New Group Members','2009-05-27 12:01:11',''),('en','_template','in_minutes',_binary 'Minutes','2007-02-20 10:30:20',''),('en','_template','in_reply_to',_binary 'In reply to','2003-05-20 12:27:21','replyto label for quoted forum or inbox message'),('en','_template','irish-isl',_binary 'Irish-ISL','2008-09-09 09:01:12',''),('en','_template','italian',_binary 'Italian','2008-09-09 09:01:12',''),('en','_template','italian-lis',_binary 'Italian-LIS','2008-09-09 09:01:12',''),('en','_template','italic',_binary 'Italic','2003-05-20 12:27:44','global code picker link text'),('en','_template','item',_binary 'Item','2007-01-10 13:46:39',''),('en','_template','j',_binary 'J','2007-01-10 13:48:30',''),('en','_template','japanese-jsl',_binary 'Japanese-JSL','2008-09-09 09:01:12',''),('en','_template','join_group',_binary 'Join Group','2009-06-12 10:06:28',''),('en','_template','jump',_binary 'Jump','2003-05-20 12:28:03','jump menu submit button text'),('en','_template','jump_codes',_binary 'Jump over the code picker','2003-05-20 12:29:53','alt text for bypass link to jump over the code picker'),('en','_template','jump_redirect',_binary 'Direct Jump','2004-11-30 10:03:55','preferecnes'),('en','_template','jump_to_admin_tools',_binary 'jump to manage tools','2014-01-01 14:24:20',''),('en','_template','just_social',_binary 'Use just ATutor Social','2009-07-17 14:11:50',''),('en','_template','kb',_binary '<acronym title=\"Kilobytes\">KB</acronym>','2007-12-09 12:56:24',''),('en','_template','keep_email_private',_binary 'Keep email hidden from others.','2006-03-28 11:29:07',''),('en','_template','keep_it_short',_binary 'Tip: Keep it short, no spaces.','2003-05-20 12:31:53','file manager suggestion for folder creation'),('en','_template','keywords',_binary 'Keywords','2003-09-28 10:22:10','content add/edit'),('en','_template','language',_binary 'Language','2003-05-20 12:32:05','profile, registration'),('en','_template','languages',_binary 'Languages','2005-03-03 11:07:50',''),('en','_template','lang_code',_binary 'Language Code','2006-09-27 14:12:11',''),('en','_template','last_accessed',_binary 'Last Accessed','2005-03-01 12:52:16','tracker'),('en','_template','last_comment',_binary 'Last Comment','2003-05-20 12:33:10','forums, thread view column label'),('en','_template','last_login',_binary 'Last Login','2005-03-03 11:03:12',''),('en','_template','last_modified',_binary 'Last Modified','2003-05-20 12:36:35','instructor content editor link text'),('en','_template','last_name',_binary 'Last Name','2003-05-20 12:37:39','registration, profile, admin user manager'),('en','_template','last_post',_binary 'Last Post','2004-04-16 11:24:59','Refers to date of last post in forum'),('en','_template','last_updated',_binary 'Last updated: %s','2006-05-19 14:54:08',''),('en','_template','latex_server',_binary 'MimeTex Server for the LaTex service.  For production purposes, please install mimeTeX on your own server. (http://www.atutor.ca/cgi/mimetex.cgi?)','2010-03-04 08:46:33',''),('en','_template','leave_blank',_binary 'Leave blank','2003-05-20 12:39:07','mytest/test manager question option'),('en','_template','leave_group',_binary 'Leave Group','2009-05-27 12:01:11',''),('en','_template','leave_unchanged',_binary 'Leave unchanged','2005-05-10 16:04:07',''),('en','_template','left',_binary 'Left','2004-04-27 11:00:35',''),('en','_template','left_blank',_binary 'Left blank','2003-05-20 12:40:14','mytests/test manager question result text for unanswerd question'),('en','_template','left_side',_binary 'left side','2014-08-23 08:49:37','navigation'),('en','_template','legend',_binary 'Legend','2003-05-20 12:41:00','instructor course statistics/details'),('en','_template','license',_binary 'License','2005-08-16 15:27:07',''),('en','_template','light_gray',_binary 'Light Gray','2008-09-09 09:01:13',''),('en','_template','limit_to_group',_binary 'Assign To Groups','2004-12-10 14:39:53',''),('en','_template','link',_binary 'Link','2003-05-20 12:41:18','links database'),('en','_template','links',_binary 'Links','2005-02-09 13:25:20',''),('en','_template','link_alc',_binary 'Link from AContent:','2012-09-07 10:56:48','tile search'),('en','_template','list_add_course_list',_binary 'Add to Course List','2004-10-19 14:39:08','Enrollment manager, add students manually button'),('en','_template','list_add_enrolled_list',_binary 'Add to Enrolled List','2004-10-19 14:51:02','enrollment manager, add to enrolled students list button'),('en','_template','list_add_unenrolled_list',_binary 'Add to Un-enrolled List','2004-10-19 14:47:31','enrollment manager, add to unenrolled students list button'),('en','_template','list_create_course_list',_binary 'Create Course List','2004-10-15 12:04:06','create list of students function in enrollement manager'),('en','_template','list_export_course_list',_binary 'Export Course List','2003-09-16 10:15:29','enrol admin'),('en','_template','list_import_course_list',_binary 'Import Course List','2003-09-16 09:35:35','import course list'),('en','_template','list_import_howto',_binary 'A course enrollment list may be imported into ATutor. Create the course list in a comma separated values (CSV) format as follows: <code>\"firstname\", \"lastname\", \"email\"</code> with one student per line.  New students will receive their access instructions by email.','2004-02-05 10:22:29',''),('en','_template','lk_agree',_binary 'Agree','2004-08-12 15:45:53',''),('en','_template','lk_always',_binary 'Always','2004-08-26 12:23:31',''),('en','_template','lk_disagree',_binary 'Disagree','2004-08-12 15:46:29',''),('en','_template','lk_excellent',_binary 'Excellent','2004-08-12 15:42:09',''),('en','_template','lk_fair',_binary 'Fair','2004-08-12 15:43:07',''),('en','_template','lk_good',_binary 'Good','2004-08-12 15:42:50',''),('en','_template','lk_important',_binary 'Important','2004-08-26 12:26:09',''),('en','_template','lk_little_importance',_binary 'Of Little Importance','2004-08-26 12:26:41',''),('en','_template','lk_mod_important',_binary 'Moderately Important','2004-08-26 12:26:23',''),('en','_template','lk_never',_binary 'Never','2004-08-26 12:25:30',''),('en','_template','lk_occasionally',_binary 'Occasionally','2004-08-26 12:24:04',''),('en','_template','lk_poor',_binary 'Poor','2004-08-12 15:43:18',''),('en','_template','lk_rarely',_binary 'Rarely','2004-08-26 12:24:21',''),('en','_template','lk_strongly_agree',_binary 'Strongly Agree','2004-08-12 15:45:38',''),('en','_template','lk_strongly_disagree',_binary 'Strongly Disagree','2004-08-12 15:46:46',''),('en','_template','lk_undecided',_binary 'Undecided','2004-08-26 11:46:00',''),('en','_template','lk_unimportant',_binary 'Unimportant','2004-08-26 12:27:06',''),('en','_template','lk_very_frequently',_binary 'Very Frequently','2004-08-26 12:23:46',''),('en','_template','lk_very_good',_binary 'Very Good','2004-08-12 15:42:33',''),('en','_template','lk_very_important',_binary 'Very Important','2004-08-26 12:25:52',''),('en','_template','lk_very_poor',_binary 'Very Poor','2004-08-12 15:43:37',''),('en','_template','lk_very_rarely',_binary 'Very Rarely','2004-08-26 12:24:38',''),('en','_template','loading',_binary 'Loading','2016-01-02 13:44:33','google search'),('en','_template','locale',_binary 'Locale','2004-11-20 19:35:20',''),('en','_template','local_network',_binary 'Local Network','2009-05-27 12:01:11',''),('en','_template','location',_binary 'Location','2005-03-04 14:06:25',''),('en','_template','lock_no_post',_binary 'No posting, but allow reading.','2003-05-20 12:46:36','forum instructor lock text'),('en','_template','lock_no_post1',_binary 'This thread is locked from posting.','2003-05-20 12:46:45','forum instructor lock text'),('en','_template','lock_no_read',_binary 'No posting and no reading.','2003-05-20 12:46:56','context'),('en','_template','lock_no_read1',_binary 'This thread is locked from reading and posting.','2003-05-20 12:47:24','forum thread display lock message'),('en','_template','lock_submit',_binary 'Apply Lock','2003-05-20 12:47:50','text for instructor forum lock button'),('en','_template','lock_thread',_binary 'Lock Topic','2014-01-02 15:40:37','Alt text for forum instructor lock icon'),('en','_template','logged_in_within',_binary 'logged in within','2007-02-21 13:37:39',''),('en','_template','login',_binary 'Login','2006-07-27 17:35:30','global login label'),('en','_template','login_into_atutor',_binary 'Log into your ATutor Account','2003-05-20 12:51:48','login after enrollment message'),('en','_template','login_name',_binary 'Login Name','2003-05-20 12:52:32','control centre account information label'),('en','_template','login_name_or_email',_binary 'Login Name or Email','2006-03-28 14:21:34',''),('en','_template','login_statistics',_binary '%s login statistics for  %s','2003-05-31 14:49:29','course login details'),('en','_template','login_text',_binary 'Enter your login name or your email address, and  your password.','2010-10-07 09:00:45',''),('en','_template','logout',_binary 'Log-out','2003-05-20 12:53:44','global logout link text'),('en','_template','log_file_bundle',_binary 'Log File Bundle','2005-03-10 16:36:31','error logging - email subject'),('en','_template','ltr',_binary 'Left to Right','2004-11-20 19:37:04',''),('en','_template','magenta',_binary 'Magenta','2008-09-09 09:01:13',''),('en','_template','mail_queue_cron',_binary 'You must set-up the <a href=\"admin/cron_config.php\">cron</a> to use this feature.','2006-04-03 14:21:30',''),('en','_template','main',_binary 'main','2014-08-23 08:50:37',''),('en','_template','maintainers',_binary 'Maintainers','2005-08-16 15:26:57',''),('en','_template','main_navigation',_binary 'Main Navigation','2005-03-07 12:09:31',''),('en','_template','malaysian-msl',_binary 'Malaysian-MSL','2008-09-09 09:01:12',''),('en','_template','male',_binary 'Male','2003-05-20 12:55:53','registration, profile, admin user manager'),('en','_template','manage',_binary 'Manage','2005-02-23 12:05:42',''),('en','_template','manage_languages',_binary 'Manage Existing Languages','2004-09-23 16:30:59',''),('en','_template','manage_lang_howto',_binary 'Below are all the languages currently available in this installation of ATutor. You may export the language as an ATutor language pack or delete it from the installation.','2004-10-18 14:23:43',''),('en','_template','manage_links',_binary 'Manage Links','2006-05-24 11:24:51',''),('en','_template','manage_navigation_bar',_binary 'Manage tools','2014-01-01 17:16:47','aria-label for subnavmenu_i'),('en','_template','manage_off',_binary 'Manage off','2014-01-01 13:00:21','instructor admin switch'),('en','_template','manage_on',_binary 'Manage on','2014-01-01 12:59:55','instructor admin switch'),('en','_template','manage_tools_off',_binary 'Manage tools turned off','2014-01-14 18:17:45',''),('en','_template','manage_tools_on',_binary 'Manage tools turned on','2014-01-01 14:30:33',''),('en','_template','mark',_binary 'Mark','2003-05-20 12:56:19','mytests/test manager'),('en','_template','marked_label',_binary 'Marked (%s)','2005-05-12 10:25:44',''),('en','_template','marks',_binary 'marks','2003-05-20 12:56:34','mytests/test manager'),('en','_template','mark_alumni',_binary 'Mark Alumni','2004-10-25 12:24:38',''),('en','_template','mark_statistics',_binary 'Submission Statistics','2004-08-26 13:27:13',''),('en','_template','master_list_authentication',_binary 'Authenticate Against A Master Student List','2005-03-31 13:54:01',''),('en','_template','master_not_in_list',_binary 'If existing user not in new list','2005-05-10 16:04:31',''),('en','_template','master_student_list',_binary 'Master Student List','2005-04-04 10:39:26',''),('en','_template','material',_binary 'Material','2004-10-14 14:10:13',''),('en','_template','material_announcements',_binary 'Announcements (%s)','2004-10-14 14:14:23',''),('en','_template','material_content_pages',_binary 'Content Pages (%s)','2004-10-14 14:12:47',''),('en','_template','material_files',_binary 'Files (%s)','2004-10-14 14:22:54',''),('en','_template','material_glossary',_binary 'Glossary (%s)','2004-10-14 14:22:17',''),('en','_template','material_groups',_binary 'Groups (%s)','2004-11-25 15:43:53',''),('en','_template','material_links',_binary 'Links (%1$s categories,  %2$s links)','2004-10-14 14:18:25',''),('en','_template','material_polls',_binary 'Polls (%s)','2004-10-14 14:21:41',''),('en','_template','material_select_all',_binary 'Select All','2004-10-14 14:11:39',''),('en','_template','material_stats',_binary 'Statistics (%s days)','2004-10-14 14:23:22',''),('en','_template','maximum',_binary 'Maximum','2003-05-20 12:59:01','instructor course statistics/details'),('en','_template','maximum_course_float',_binary 'Maximum Course Float','2005-03-03 10:52:04',''),('en','_template','maximum_course_size',_binary 'Maximum Course Size','2005-03-03 10:51:52',''),('en','_template','maximum_file_size',_binary 'Maximum File Size','2005-03-03 10:51:39',''),('en','_template','maximum_login_attempt',_binary 'Maximum Login Attempts','2009-06-03 15:33:17',''),('en','_template','max_backups_reached',_binary 'You have reached the maximum number of backups allowed.','2004-10-15 14:16:57',''),('en','_template','max_file_size',_binary 'Max File Size','2003-05-20 12:59:52','admin course manager properties'),('en','_template','max_file_size_system',_binary 'Maximum system allows','2003-10-14 14:32:52','php\'s max file size'),('en','_template','mb',_binary '<acronym title=\"Megabyte\">MB</acronym>','2007-07-26 14:05:45','short for MB (megabytes)'),('en','_template','media',_binary 'Media','2007-06-15 14:41:08',''),('en','_template','megabytes',_binary 'Megabytes','2014-06-15 14:26:30',''),('en','_template','members',_binary 'Members','2003-05-20 13:00:39','instructor course statistics/details'),('en','_template','member_id',_binary 'Member ID','2003-05-20 13:01:18','admin user manager column heading'),('en','_template','member_stats',_binary 'Student Specific Usage','2005-03-03 15:25:57',''),('en','_template','menu',_binary 'Menu','2003-05-20 13:02:17','preferences option'),('en','_template','menu_menu',_binary 'Content Navigation','2005-03-30 10:13:27','context (?)'),('en','_template','message',_binary 'Message','2003-05-20 13:06:56','inbox send message screen'),('en','_template','message_board',_binary 'Message Board','2009-05-27 12:01:11',''),('en','_template','message_notification',_binary 'Message Notification','2005-03-14 15:31:15','preferences'),('en','_template','mexican-lsm',_binary 'Mexican-LSM','2008-09-09 09:01:12',''),('en','_template','mfu_add_more',_binary 'Add More','2012-06-08 10:04:20','file manager'),('en','_template','mfu_add_to_queue',_binary 'Choose <em>Browse files</em> to add files to the queue.','2012-06-08 09:59:28','file manager'),('en','_template','mfu_browse_files',_binary 'Browse Files','2012-06-08 10:03:37','file manager'),('en','_template','mfu_browse_to_add',_binary 'Use the Browse button to add a file, and the Save button to upload it.','2012-06-08 09:56:26','file manager'),('en','_template','mfu_cancel_uploads',_binary 'Cancel remaining Uploads','2012-06-08 10:05:12','file manager'),('en','_template','mfu_default_total',_binary 'Total: 0 files (0 KB)','2012-06-08 10:06:05','file manager'),('en','_template','mfu_error',_binary 'error','2012-06-08 10:02:50','file manager'),('en','_template','mfu_errors',_binary 'errors','2012-06-08 10:03:13','file manager'),('en','_template','mfu_error_allowed',_binary 'File upload error: you have uploaded as many files as you are allowed during this session','2012-06-08 12:11:31','file manager'),('en','_template','mfu_error_failed',_binary 'File upload error: the upload failed for an unknown reason.','2012-06-08 12:12:01','file manager'),('en','_template','mfu_error_file_empty',_binary 'One or more of the files that you attempted to add contained no data.','2012-06-08 12:13:30','file manager'),('en','_template','mfu_error_file_type',_binary 'One or more files were not added to the queue because they were of the wrong type.','2012-06-08 12:13:59','file manager'),('en','_template','mfu_error_msg',_binary ', %1s %2s','2012-06-08 12:05:23','file manager'),('en','_template','mfu_error_network',_binary 'File upload error: a network error occured.','2012-06-08 12:11:06','file manager'),('en','_template','mfu_error_queue_limit',_binary 'You have as many files in the queue as can be added at one time. Removing files from the queue may allow you to add different files.','2012-06-08 12:12:30','file manager'),('en','_template','mfu_error_size_limit',_binary 'One or more of the files that you attempted to add to the queue exceeded the limit of %1s.','2012-06-08 12:12:58','file manager'),('en','_template','mfu_error_unknown',_binary 'File upload error: a network error occured or the file was rejected (reason unknown).','2012-06-08 12:10:26','file manager'),('en','_template','mfu_file',_binary 'file','2012-06-08 10:02:09','file manager'),('en','_template','mfu_filename',_binary 'File Name','2012-06-08 09:56:54','file manager'),('en','_template','mfu_filename_placeholder',_binary 'File Name Placeholder','2012-06-08 09:58:25','file manager'),('en','_template','mfu_files',_binary 'files','2012-06-08 10:02:28','file manager'),('en','_template','mfu_files_not_added',_binary 'x files were too y and were not added to the queue.','2012-06-08 10:08:03','file manager'),('en','_template','mfu_files_not_added2',_binary 'The following files were not added:','2012-06-08 10:08:43','file manager'),('en','_template','mfu_file_list_waiting',_binary 'File List:  %1s files uploaded, %2s file waiting to be uploaded.','2012-06-08 12:05:54','file manager'),('en','_template','mfu_file_uploaded',_binary 'File Uploaded','2012-06-08 12:07:48','file manager'),('en','_template','mfu_file_upload_error',_binary 'File Upload Error','2012-06-08 12:08:12','file manager'),('en','_template','mfu_hide_list',_binary 'Hide this list','2012-06-08 10:09:27','file manager'),('en','_template','mfu_kb',_binary 'KB','2012-06-08 09:58:49','file manager'),('en','_template','mfu_no_file_list',_binary 'File list: No files waiting to be uploaded.','2012-06-08 10:07:01','file manager'),('en','_template','mfu_press_delete',_binary 'Press Delete key to remove file','2012-06-08 12:09:02','file manager'),('en','_template','mfu_remove_error',_binary 'Remove Error','2012-06-08 10:09:56','file manager'),('en','_template','mfu_resume_uploads',_binary 'Resume Upload','2012-06-08 10:05:34','file manager'),('en','_template','mfu_size',_binary 'Size','2012-06-08 09:57:24','file manager'),('en','_template','mfu_stop_upload',_binary 'Stop Upload','2012-06-08 10:04:44','file manager'),('en','_template','mfu_tolarge_files',_binary '%1s files were too large and were not added to the queue.','2012-06-08 12:10:00','file manager'),('en','_template','mfu_tomany_files',_binary 'Too many files were selected. %1s were not added to the queue.','2012-06-08 12:09:32','file manager'),('en','_template','mfu_to_upload',_binary 'To upload: %1s %2s (%3s)','2012-06-08 12:03:38','file manager'),('en','_template','mfu_upload',_binary 'Upload','2012-06-08 10:10:23','file manager'),('en','_template','mfu_uploaded',_binary 'Uploaded: %1s of %2s %3s (%4s)%5s','2012-06-08 12:04:58','file manager'),('en','_template','mfu_uploading',_binary 'Uploading: %1s of %2s %3s (%4s of %5s)','2012-06-08 12:04:11','file manager'),('en','_template','mfu_upload_limit',_binary '%1s %2s maximum','2012-06-08 12:03:07','file manager'),('en','_template','mfu_upload_queue',_binary 'File Upload Queue:','2012-06-08 09:57:57','file manager'),('en','_template','mfu_warnings',_binary 'Warnings:','2012-06-08 10:06:29','file manager'),('en','_template','minimum',_binary 'Minimum','2003-05-20 13:08:57','instructor course statistics/details'),('en','_template','minutes',_binary '%s min.','2006-03-31 15:41:57',''),('en','_template','minute_short',_binary 'm','2007-07-09 12:31:14',''),('en','_template','missing',_binary 'Missing','2005-10-05 14:02:53',''),('en','_template','missing_content',_binary 'Missing Content','2005-03-07 15:25:10',''),('en','_template','missing_info',_binary 'Missing Info','2005-08-17 13:23:48',''),('en','_template','mobile',_binary 'Mobile','2013-12-15 10:31:22',''),('en','_template','mobile_active',_binary 'Mobile active','2014-01-01 12:54:00',''),('en','_template','mobile_disabled',_binary 'Mobile disabled','2014-01-01 12:53:12',''),('en','_template','mobile_theme',_binary 'Mobile Theme','2010-06-18 15:46:42',''),('en','_template','mobile_toggle',_binary 'Toggle to switch between mobile and responsive themes','2014-01-01 12:52:27',''),('en','_template','modules',_binary 'Modules','2005-08-16 13:40:42',''),('en','_template','module_install_directory',_binary 'The following directory must be created for this module to install and function: <kbd>%s</kbd>.','2005-09-22 14:14:34',''),('en','_template','module_name',_binary 'Module Name','2005-08-17 13:11:29',''),('en','_template','module_uninstall',_binary 'Uninstall Module','2008-10-21 15:41:53',''),('en','_template','mod_rewrite',_binary 'mod_rewrite','2008-05-14 12:05:43',''),('en','_template','monospaced',_binary 'Monospaced','2008-09-09 09:01:13',''),('en','_template','month',_binary 'Month','2004-06-24 15:45:43',''),('en','_template','more_menu_items',_binary 'More menu items','2013-12-28 12:30:39',''),('en','_template','more_options',_binary 'More options...','2007-02-21 11:48:54',''),('en','_template','move',_binary 'Move','2004-01-15 13:31:18','editing content'),('en','_template','move_down',_binary 'Move Down','2005-03-30 15:54:20','modules'),('en','_template','move_thread',_binary 'Move Topic','2014-01-02 15:40:51',''),('en','_template','move_thread_to',_binary 'Move topic to:','2014-01-02 15:40:59',''),('en','_template','move_to_inbox',_binary 'Move to Inbox','2007-02-22 13:09:26',''),('en','_template','move_up',_binary 'Move Up','2005-08-02 15:44:46','modules'),('en','_template','music',_binary 'Music','2009-05-27 12:01:11',''),('en','_template','mutual_connections',_binary 'Mutual Connections','2009-06-12 15:42:42',''),('en','_template','myown_patches',_binary 'My Own Patches','2008-04-21 15:08:55',''),('en','_template','mysql_version',_binary 'MySQL Version','2007-07-26 13:40:50',''),('en','_template','my_account',_binary 'My Account','2005-03-28 14:04:37',''),('en','_template','my_courses',_binary 'My Courses','2004-04-15 12:05:31',''),('en','_template','my_enrolled_courses',_binary 'My enrolled courses','2004-08-18 12:03:04',''),('en','_template','my_files',_binary 'My Files','2006-03-20 14:40:42',''),('en','_template','my_friends_only',_binary 'Only my contacts','2009-05-27 12:01:11',''),('en','_template','my_groups',_binary 'My Network Groups','2009-05-27 12:01:11',''),('en','_template','my_start_page',_binary 'My Start Page','2005-02-08 10:58:06',''),('en','_template','my_tests',_binary 'My Tests and Surveys','2010-06-25 14:01:48',''),('en','_template','my_tracker',_binary 'My Tracker','2003-05-20 13:12:27','global my tracker  heading'),('en','_template','na',_binary 'N/A','2003-05-20 13:12:48','short form for \"not applicable\"'),('en','_template','name',_binary 'Name','2003-05-20 13:31:04','file manager, zip utility column heading'),('en','_template','name_in_english',_binary 'Language name in English','2004-11-20 19:41:16','admin add language'),('en','_template','name_in_language',_binary 'Language name translated','2004-11-20 19:39:49',''),('en','_template','native-american',_binary 'Native-American','2008-09-09 09:01:12',''),('en','_template','navigation',_binary 'Navigation','2008-09-09 09:03:56',''),('en','_template','nav_path',_binary 'Navigation Path for User','2003-05-20 13:31:22','tracker'),('en','_template','nav_tendencies',_binary 'Navigation Tendencies for User','2003-05-20 13:32:03','tracker'),('en','_template','netherlands-ngt',_binary 'Netherlands-NGT','2008-09-09 09:01:13',''),('en','_template','network_home',_binary 'My Network','2009-05-27 12:01:11',''),('en','_template','network_updates',_binary 'Network Activity','2009-05-27 12:01:11',''),('en','_template','never',_binary 'Never','2005-03-03 11:03:01',''),('en','_template','new',_binary 'New!','2003-05-20 13:32:52','forum/inbox new message indicator'),('en','_template','new_account_enroll',_binary 'A user account has been created for you at %1s and you have been enrolled into the course %2s. To access this course, please log into the site. It is strongly suggested you change your password upon logging in.','2005-06-24 15:33:45','Message emailed to new users as a result of enrollment.'),('en','_template','new_account_enroll_confirm',_binary 'You have been enrolled into the course %1s. To access this course, you must first confirm your account by using the following link: %2s. It is strongly suggested you change your password upon logging in.','2005-06-24 15:33:17','If new user created during enrollment and needs confirmation.'),('en','_template','new_file',_binary 'New File','2006-03-20 14:36:14',''),('en','_template','new_group_invitations',_binary 'New Group Invitations','2009-05-27 12:01:11',''),('en','_template','new_group_requests',_binary 'Join Group Requests','2013-10-19 18:42:08',''),('en','_template','new_name',_binary 'New Name','2005-03-07 13:26:12','filemanager rename file'),('en','_template','new_thread',_binary 'New Topic','2014-01-02 15:41:13','forum'),('en','_template','new_type',_binary 'New Type:','2006-03-22 15:11:48',''),('en','_template','new_user',_binary 'New User','2005-07-27 15:06:36',''),('en','_template','new_window',_binary 'Opens in a new window.','2010-04-22 13:41:52',''),('en','_template','next',_binary 'Next','2003-05-20 13:38:07','sequence arrow link text'),('en','_template','next_topic',_binary 'Next Topic','2003-05-20 13:38:42','sequence arrow link text'),('en','_template','no',_binary 'No','2005-03-03 10:18:39','the word no, preferences, admin course manager'),('en','_template','none',_binary 'None','2003-05-20 13:40:59','global message when no results were retrieved'),('en','_template','none_available',_binary 'None available.','2003-05-20 13:41:46','instructor add/edit content, glossary'),('en','_template','none_found',_binary 'None Found.','2005-05-18 13:12:47','glossary, related topis, users online'),('en','_template','non_group_members',_binary 'Non-Group Members','2005-06-10 10:51:55',''),('en','_template','norwegian-nsl',_binary 'Norwegian-NSL','2008-09-09 09:01:13',''),('en','_template','notes',_binary 'Notes','2003-05-20 13:43:39','admin hime, instructor request notes column heading'),('en','_template','note_taking',_binary 'Note Taking','2008-09-09 09:03:56',''),('en','_template','notification_accept_contact',_binary '%s has been added to your ATutor Social contacts. Follow the link below to review your new contact. \r\n\r\n------\r\nSent from ATutor Social at:\r\n%s\r\n','2009-05-27 12:01:11',''),('en','_template','notification_group_invite',_binary '%s has invited you to join the %s group. Follow the link below to login and accept or reject the invitation. \r\n\r\n------\r\nSent from ATutor Social at:\r\n%s\r\n','2009-05-27 12:01:11',''),('en','_template','notification_group_invite_accepted',_binary '%s has accepted your  invitation to join the %s group. Follow the link below to login to the group.\r\n\r\n------\r\nLogin to ATutor Social at:\r\n%s\r\n','2009-05-27 12:01:11',''),('en','_template','notification_group_request',_binary 'A request has been made to join the %s group Follow the link below to login and accept or reject the request.\r\n\r\n------\r\nLogin to ATutor Social at:\r\n%s\r\n','2009-05-27 12:01:11',''),('en','_template','notification_group_request_accepted',_binary 'Your request to join the %s group has been accepted. Follow the link below to login to the group.\r\n\r\n------\r\nLogin to ATutor Social at:\r\n%s\r\n','2009-05-27 12:01:11',''),('en','_template','notification_new_contact',_binary '%s wants to add you to as a ATutor Social contact. Follow the link below to login and accept or reject the request. \r\n\r\n------\r\nSent from ATutor Social at:\r\n%s\r\n','2009-05-27 12:01:11',''),('en','_template','notification_new_inbox',_binary 'You have received a new message from %s. Login to access your inbox and view the message. Login at: %s','2005-05-17 14:20:35','notification message for new mail in inbox'),('en','_template','notify',_binary 'Notify','2003-05-20 13:45:17','admin course properties'),('en','_template','not_added_members',_binary 'Invite Group Members','2009-05-27 12:01:11',''),('en','_template','not_created',_binary 'Not Created','2005-05-10 15:23:30',''),('en','_template','not_editable',_binary 'Not editable.','2006-03-20 15:17:50',''),('en','_template','not_enrolled',_binary 'Not Enrolled','2005-03-23 14:23:18','user status on my courses page'),('en','_template','not_installed',_binary 'Not Installed','2008-10-28 10:58:52',''),('en','_template','not_overwrite',_binary 'Not overwrite','2008-09-25 16:01:17','gradebook'),('en','_template','not_specified',_binary 'Not specified','2003-05-12 15:26:26','registration gender selection'),('en','_template','now_friends1',_binary 'and %s are now contacts.','2009-05-27 12:01:11',''),('en','_template','now_friends2',_binary 'and %s are now contacts','2009-05-27 12:01:11',''),('en','_template','no_activities',_binary 'No network activity.','2009-05-27 12:01:11',''),('en','_template','no_announcements',_binary 'No Announcements Found','2003-05-20 13:55:19','course homepage when no announcments exist'),('en','_template','no_content_avail',_binary 'No content available.','2005-10-20 11:00:59',''),('en','_template','no_courses',_binary 'There are no available courses.','2003-05-20 13:57:26','browse message when no courses exist'),('en','_template','no_courses_found',_binary 'No courses found.','2003-05-20 13:58:31','message when query resuylt in no courses found, admin course manager'),('en','_template','no_course_found',_binary 'Course not found.','2003-10-15 14:31:39','course not found'),('en','_template','no_description',_binary 'No description available.','2004-08-20 15:00:55',''),('en','_template','no_due_date',_binary 'No due date','2006-05-30 12:37:39',''),('en','_template','no_end_date',_binary 'No end date','2007-07-16 14:27:07',''),('en','_template','no_forums',_binary 'No Forums Found','2003-05-20 13:59:58','discussions message when no forums exist'),('en','_template','no_friends',_binary 'You have no contacts yet.','2009-05-27 12:01:11',''),('en','_template','no_gadgets_installed',_binary 'You have not installed any gadgets yet.','2009-05-27 12:01:11',''),('en','_template','no_glossary_items',_binary 'No glossary terms found.','2005-03-07 10:52:11','edit glossary'),('en','_template','no_groups_yet',_binary 'You have not joined any groups yet.','2009-05-27 12:01:11',''),('en','_template','no_icon',_binary 'No Icon','2005-03-03 11:20:05',''),('en','_template','no_month_data',_binary 'There is no data for this month.','2003-05-20 14:01:42','instructor course statistics when nonne exist'),('en','_template','no_pass_score',_binary 'No pass score','2008-03-10 11:50:35','Test/Survey Property'),('en','_template','no_post',_binary 'No post found.','2003-05-20 14:02:44','forums message when attempting to view a post that no longer exists'),('en','_template','no_questions',_binary 'No questions found.','2003-05-20 14:04:01','test manager message when no questions exist for a test.'),('en','_template','no_results_available',_binary 'No Results Available','2003-05-20 14:07:22','test manager'),('en','_template','no_results_yet',_binary 'No Results Yet','2003-05-20 14:07:32','my tests'),('en','_template','no_settings',_binary 'There is no available settings.','2009-06-09 14:25:23',''),('en','_template','no_student_tools',_binary 'No Student Tools Found','2010-12-07 16:51:03',''),('en','_template','no_terms_found',_binary 'There are no glossary terms being used in this content page.','2004-01-16 10:52:51','content editor'),('en','_template','no_tests',_binary 'No Tests or Surveys Available','2004-08-25 14:04:15',''),('en','_template','no_title',_binary 'No title.','2005-10-20 11:00:45',''),('en','_template','no_user_found',_binary 'No user found','2003-05-20 14:09:41','admin user amanager, profile'),('en','_template','num',_binary 'No.','2003-05-20 14:10:36','short form for the word number, test manager'),('en','_template','number_of_groups',_binary 'Number of Groups','2006-03-22 11:48:03',''),('en','_template','number_of_members',_binary 'Number of Members','2009-05-27 12:01:11',''),('en','_template','number_of_students_per_group',_binary 'Number of Students per Group','2006-03-22 11:52:10',''),('en','_template','num_pages',_binary '# pages','2005-03-16 13:54:47','content manager'),('en','_template','num_posts',_binary 'Number of Posts','2005-04-14 11:07:00',''),('en','_template','num_questions_per_test',_binary 'questions per test.','2004-08-23 16:13:24',''),('en','_template','num_students_currently_enrolled',_binary 'There are <em>%s</em> students currently enrolled in this course.','2006-03-22 13:02:01',''),('en','_template','num_takes_test',_binary 'Attempts Allowed','2004-08-26 10:34:04',''),('en','_template','num_threads',_binary 'Number of Topics','2014-01-02 15:41:28',''),('en','_template','oauth_expire',_binary 'OAuth Expire Threshold','2010-05-05 16:18:12',''),('en','_template','oauth_expire_note',_binary 'Note: When \"Expire Threshold\" is set to 0, the oauth token never expires.','2010-05-05 16:18:55',''),('en','_template','ok',_binary 'OK','2004-01-30 11:54:41',''),('en','_template','old_module_notes',_binary '<p>Some older modules, though not all, will need to be updated to work with ATutor 2.2 and above. They are made available so those who wish to use them can update the code, which typically involves replacing mysql database functions with the new queryDB() database functions.  For more about queryDB(), see the <a href=\"documentation/developer/guidelines.html#querydb\">Developer Documentation</a>. Be sure to submit the updated modules back to the <a href=\"http://atutor.ca/atutor/modules/index.php\">ATutor Modules site</a>. In addition to recieving credit, submitting modules is the fastest way to increase you ATutor contributor score. </p><br />\r\n<p>Use the filter to view all, or to view modules tested with specific versions of ATutor</p>','2014-08-21 19:28:34','install modules page'),('en','_template','on',_binary 'on','2003-05-20 14:11:28','admin course manager properties tracking option'),('en','_template','one_page',_binary 'One Page','2003-05-20 14:12:22','test manager open ended question type'),('en','_template','one_question_per_page',_binary 'One question per page','2007-08-20 15:46:36','edit/create test'),('en','_template','one_sentence',_binary 'One Sentence','2003-05-20 14:12:46','test manager open ended question type'),('en','_template','one_word',_binary 'One Word','2003-05-20 14:12:53','test manager open ended question type'),('en','_template','ongoing',_binary 'On Going!','2003-05-20 14:13:23','mytest currently running test indicator'),('en','_template','online_status',_binary 'Online Status','2005-03-11 16:18:30','directory'),('en','_template','only_show_edited_terms',_binary 'Only show edit terms.','2006-09-25 13:08:06','language editor filter form'),('en','_template','opensocial_status_message',_binary 'The future of OpenSocial gadgets is in question. The gadgets repository that was previously hosted by Google, no longer exists. Though there may still be gadgets available through various developer sites, you should not expect them all to work in ATutor\'s Gadget container application. We will revisit gadgets in a future version of ATutor to determine if a suitable alternative exists, or if it should be phased out. Community input is welcome through the <a href=\"http://atutor.ca/forum/16/1.html\" target=\"_new\">ATutor Forums</a>','2014-08-24 10:52:26','networking gadgets panel'),('en','_template','open_file_manager',_binary 'Open File Manager','2004-11-25 17:31:08',''),('en','_template','open_sub_navigation',_binary '. Toggle sub navigation open','2013-12-26 17:30:05',''),('en','_template','optional',_binary 'Optional','2003-05-20 14:40:09','registration screen'),('en','_template','optional_description',_binary 'Optional Description','2004-10-27 15:31:07',''),('en','_template','optional_feedback',_binary 'Optional Feedback','2004-11-24 14:33:15',''),('en','_template','option_alignment',_binary 'Alignment','2004-12-01 13:36:36','edit/create option in test questions'),('en','_template','or',_binary 'Or','2003-05-20 14:40:26','global word or'),('en','_template','orange',_binary 'Orange','2003-05-20 14:40:40','global code picker'),('en','_template','order',_binary 'Order','2005-03-04 14:07:25',''),('en','_template','organization',_binary 'Organization','2008-10-06 13:41:24',''),('en','_template','original_resource',_binary 'Original resource','2010-03-09 16:16:17','adapted content'),('en','_template','original_term',_binary 'Original term','2006-09-25 13:09:48',''),('en','_template','origin_page',_binary 'Originating Page','2003-05-20 14:40:57','tracker'),('en','_template','or_groups',_binary 'Or, Groups:','2006-08-28 15:58:14',''),('en','_template','os',_binary '<acronym title=\"Operating System\">OS</acronym>','2007-07-26 14:04:11',''),('en','_template','other',_binary 'Other','2005-03-03 12:17:32',''),('en','_template','others',_binary 'Others','2009-05-27 12:01:11',''),('en','_template','out_of',_binary 'Maximum Score','2008-07-17 08:36:47','mytests, score out of ...'),('en','_template','override',_binary 'Override selections with this course\'s custom Colour & Font theme.  <small class=\"spacer\">( If available. )</small>','2003-05-20 14:42:37','preferences page'),('en','_template','overwite_content',_binary 'Overwrite existing material with those selected','2004-10-15 14:18:47',''),('en','_template','overwrite',_binary 'Overwrite','2004-11-09 15:24:23','file manager'),('en','_template','overwrite_master',_binary 'If an existing account is using this Student ID, overwrite association with new account.','2006-06-12 13:58:31',''),('en','_template','packaged_in',_binary 'Content Package','2003-10-07 18:21:34','apckage label in edit content'),('en','_template','packages',_binary 'Packages','2005-05-17 12:09:25',''),('en','_template','packages_auto_advance',_binary 'Automatically start next Learning Object','2005-05-17 12:10:27',''),('en','_template','package_settings',_binary 'Package Settings','2005-05-17 12:06:33',''),('en','_template','package_type',_binary 'Package Type','2005-05-17 12:09:36',''),('en','_template','package_type_info',_binary 'Please select the type of package you wish to upload.','2005-05-17 12:07:10',''),('en','_template','package_upload_file',_binary 'Package File','2005-05-17 12:07:32',''),('en','_template','package_upload_file_info',_binary 'Select the package file from your computer','2005-05-17 12:07:20',''),('en','_template','package_upload_url',_binary 'Package URL','2005-05-17 12:06:58',''),('en','_template','package_upload_url_info',_binary 'or specify the URL to your web accessible package file','2005-05-17 12:06:47',''),('en','_template','page',_binary 'Page','2003-05-20 14:43:17','forum thread pages menu, tracker pages menu'),('en','_template','pages_found',_binary '%s pages found','2004-08-20 15:09:44',''),('en','_template','pages_stats',_binary 'Page Tracking Statistics for %s.','2003-06-08 09:20:38','tracker'),('en','_template','page_error',_binary 'An error occured while generating the paginator','2003-05-20 14:44:01','tracker'),('en','_template','page_info',_binary 'Last Modified: %s.  Revision: %s.  Release Date: %s.','2004-02-12 11:27:02',''),('en','_template','page_stats',_binary 'Content Tracking Summary','2003-05-20 14:44:48','tracker'),('en','_template','page_title',_binary 'Page Title','2003-05-20 14:45:16','tracker column heading'),('en','_template','page_viewed',_binary 'Page Viewed','2003-05-20 14:45:44','tracker'),('en','_template','parent',_binary 'Parent','2005-03-29 13:04:13','categories'),('en','_template','partially_uninstalled',_binary 'Partially Uninstalled','2008-10-21 15:41:53',''),('en','_template','password',_binary 'Password','2003-05-20 14:45:56','global password word'),('en','_template','password_again',_binary 'Password Again','2003-05-20 14:46:52','registration, edit profile'),('en','_template','password_blurb',_binary 'Enter your account\'s email address below and an email with instructions on retrieving your password will be sent to you. The email address must be the same as the one you used for\r\nregistration.','2006-06-08 11:20:16',''),('en','_template','password_changed',_binary 'Password Change','2005-11-30 13:54:49',''),('en','_template','password_change_confirm',_binary 'Your password on %s has been changed successfully. Go to %s to login.','2006-05-09 15:28:37',''),('en','_template','password_change_msg',_binary 'Your password has been altered. Please use the information below.','2005-11-30 13:55:47',''),('en','_template','password_forgot',_binary 'Forgot Password','2006-05-09 15:00:16',''),('en','_template','password_new_blurb',_binary 'Enter a new password for your account.','2006-05-09 15:54:44',''),('en','_template','password_old',_binary 'Old Password','2006-05-11 11:34:39',''),('en','_template','password_reminder',_binary 'Forgot your password?','2006-05-09 14:29:49','password reminder screen heading, public login header'),('en','_template','password_reminder_text',_binary 'If you have lost your password, use the forgotten password feature to regain access to your account.','2006-05-09 14:56:46',''),('en','_template','password_request2',_binary 'Dear %1$s,\r\n\r\nYour login name is %2$s.\r\n\r\nTo set a new password, follow the link below. \r\n\r\n%4$s\r\n\r\n(If this link does not take you to the site, copy and paste it into the address bar of your internet browser)\r\n\r\nThe link will become invalid after %3$s days.','2009-01-23 10:49:55','password reminder'),('en','_template','pass_feedback',_binary 'Pass Feedback','2008-03-10 11:49:19','Test/Survey Property'),('en','_template','pass_score',_binary 'Pass Score','2008-03-10 08:46:46','Test/Survey property'),('en','_template','paste',_binary 'Paste','2004-12-03 10:30:28','form_editor in create question'),('en','_template','paste_disabled_title',_binary 'Paste from file disabled','2010-04-14 11:25:30',''),('en','_template','paste_enabled_title',_binary 'Toggle paste from file','2010-04-14 11:25:05',''),('en','_template','paste_file',_binary 'Paste From File','2003-05-20 14:49:35','instructor content editor'),('en','_template','patcher',_binary 'Patcher','2008-04-21 15:08:55',''),('en','_template','patcher_alter_modified_files',_binary 'The listed files are modified locally. If you choose to proceed, your local file will be modified. The original\r\nfile will be backed up before the modification. Please note that the modification to your customized code may break your customization.<br />','2008-07-28 10:52:09','patcher'),('en','_template','patcher_overwrite_modified_files',_binary 'The listed files have been modified locally. If you choose to proceed, the patch file will be copied to your local machine. \r\nYou have to manually merge this file and your local copy.<br />','2008-07-28 10:52:22','patcher'),('en','_template','patcher_show_backup_files',_binary 'Below is the list of the backup files created by the Patcher. After ensuring ATutor works properly with the patch, you may want to \r\ndelete these files. If  ATutor does not work properly with the patch, you can always revert back to the old files by renaming the backup files \r\nto the original file names,  removing the [patch_id].old portion of the file name. <br />','2008-07-28 10:52:38','patcher'),('en','_template','patcher_show_patch_files',_binary 'Below is the list of the patch files copied to your computer. \r\nPlease manually merge the changes between the patch files and your local copy. <br />','2008-07-28 10:52:51','patcher'),('en','_template','patch_dependent_patch_not_installed',_binary '<br><span style=\"color: red\">Warning: There are patch dependencies, please install the listed patches first: </span>','2008-04-22 14:56:15','patcher'),('en','_template','patch_local_file_not_exist',_binary 'Cannot proceed. The listed files do not exist on your local machine. If you renamed the file, in order to proceed, please rename back.<br />','2008-07-28 10:53:03','patcher'),('en','_template','path_not_allowed',_binary 'Cannot proceed! The listed file path(s) is not allowed:<br />','2010-09-30 13:47:40','patcher'),('en','_template','pa_add_more_photos',_binary 'Add More Photos','2010-03-17 15:53:59','photo album'),('en','_template','pa_albums',_binary 'Albums','2010-03-17 15:49:41','photo album'),('en','_template','pa_album_cover',_binary 'Album Cover','2010-03-17 15:57:45','photo album'),('en','_template','pa_album_description',_binary 'Album Description','2010-03-17 15:57:34','photo album'),('en','_template','pa_album_location',_binary 'Album Location','2010-03-17 15:57:24','photo album'),('en','_template','pa_album_name',_binary 'Album Name','2010-03-17 15:57:02','photo album'),('en','_template','pa_album_permission',_binary 'Album Permission','2010-03-17 16:04:31','photo album'),('en','_template','pa_album_type',_binary 'Album Type','2010-03-17 15:57:13','photo album'),('en','_template','pa_alt_text',_binary 'Alternative Text','2010-03-17 15:59:00','photo album'),('en','_template','pa_choose_profile_picture',_binary 'Upload Profile Picture','2010-03-25 16:00:58','photo album'),('en','_template','pa_click_here_to_edit',_binary 'Click here to edit','2010-03-17 16:00:54','photo album'),('en','_template','pa_click_item_to_edit',_binary 'Click item to edit','2010-03-17 16:01:06','photo album'),('en','_template','pa_close_upload_manager',_binary 'Close Upload Manager','2010-03-17 16:04:18','photo album'),('en','_template','pa_course_albums',_binary 'Course Albums','2010-03-17 15:58:28','photo album'),('en','_template','pa_create_album',_binary 'Create Album','2010-03-17 15:58:50','photo album'),('en','_template','pa_delete_album',_binary 'Delete Album','2010-03-17 15:51:21','photo album'),('en','_template','pa_delete_comment',_binary 'Delete Comment','2010-03-17 15:51:34','photo album'),('en','_template','pa_delete_photo',_binary 'Delete Photo','2010-03-17 15:51:47','photo album'),('en','_template','pa_delete_profile_pic_blub',_binary 'You can remove this picture, but be sure to upload another or we will display a silhouette in its place.','2010-03-25 16:04:19','photo album'),('en','_template','pa_delete_this_photo',_binary 'Delete This Photo','2010-03-17 15:53:32','photo album'),('en','_template','pa_edit_album',_binary 'Edit Album','2010-03-17 15:51:09','photo album'),('en','_template','pa_edit_photo',_binary 'Edit Photo','2010-03-17 15:50:55','photo album'),('en','_template','pa_edit_photos',_binary 'Edit Photos','2010-03-17 15:50:39','photo album'),('en','_template','pa_last_updated',_binary 'Last Updated','2010-03-17 15:58:00','photo album'),('en','_template','pa_max_memory',_binary 'Maximum Memory Size allowed per member','2010-03-17 16:01:42','photo album'),('en','_template','pa_memory_usage',_binary 'Memory Usage','2010-03-17 16:03:53','photo album'),('en','_template','pa_my_albums',_binary 'My Albums','2010-03-17 15:58:14','photo album'),('en','_template','pa_no_album',_binary 'No Album Available','2010-03-17 15:59:28','photo album'),('en','_template','pa_no_image',_binary 'No image','2010-03-17 15:59:52','photo album'),('en','_template','pa_no_photos',_binary 'No Photos Available','2010-03-17 15:59:39','photo album'),('en','_template','pa_of',_binary 'of','2010-03-17 16:00:19','photo album'),('en','_template','pa_open_upload_manager',_binary 'Open Upload Manager','2010-03-17 16:04:07','photo album'),('en','_template','pa_organize_photos',_binary 'Organize Photos','2010-03-17 15:53:45','photo album'),('en','_template','pa_organize_photo_blurb',_binary 'Note: Drag photos using a mouse, or [CTRL]+[Left/Right/Up/Down Arrow] keys to rearrange them.','2010-03-17 16:00:09','photo album'),('en','_template','pa_photo',_binary 'Photo','2010-03-17 15:49:57','photo album'),('en','_template','pa_photos',_binary 'Photos','2010-03-17 15:50:12','photo album'),('en','_template','pa_photo_gallery',_binary 'Photo Gallery','2010-03-17 15:49:28','photo album'),('en','_template','pa_preferences',_binary 'Album Preferences','2010-03-17 16:01:30','photo album'),('en','_template','pa_private',_binary 'Private','2010-03-17 16:04:46','photo album'),('en','_template','pa_processed',_binary 'Processed','2010-03-17 15:59:14','photo album'),('en','_template','pa_profile_album',_binary 'Profile Album','2010-03-17 15:50:26','photo album'),('en','_template','pa_redo',_binary 'Redo','2010-03-17 16:00:41','photo album'),('en','_template','pa_set_album_cover',_binary 'Make Album Cover','2013-10-11 15:11:08',''),('en','_template','pa_set_profile_pic',_binary 'Make Profile Picture','2010-03-25 12:02:04','photo album'),('en','_template','pa_shared',_binary 'Shared','2010-03-17 16:04:58','photo album'),('en','_template','pa_shared_albums',_binary 'Shared Albums','2010-03-17 15:58:39','photo album'),('en','_template','pa_undo',_binary 'Undo','2010-03-17 16:00:31','photo album'),('en','_template','pa_uploaded_by',_binary 'Uploaded by','2010-03-17 16:05:10','photo album'),('en','_template','pa_upload_blurb',_binary 'Click \"Browse\" to look for the picture you wish to upload.  These photos will be processed and display below.  You also have the option to remove the pending photos anytime.  When you are done, click \"Upload\".','2010-03-17 15:56:41','photo album'),('en','_template','pa_write_a_comment',_binary 'Write a comment...','2010-03-17 16:01:18','photo album'),('en','_template','peer_interaction',_binary 'Peer Interaction','2008-09-09 09:03:56',''),('en','_template','pending',_binary 'Pending','2003-05-20 14:50:41','mytests, control centre'),('en','_template','pending_approval',_binary '(pending approval)','2003-05-20 14:51:49','control centre'),('en','_template','pending_enrollment',_binary 'Pending Enrollment','2005-06-10 10:14:46',''),('en','_template','pending_friend_requests',_binary 'Pending Friend Requests','2009-05-27 12:01:11',''),('en','_template','people_you_may_know',_binary 'People you may know','2009-05-27 12:01:11',''),('en','_template','percentage_from',_binary 'Percentage From','2008-09-25 15:59:56','gradebook'),('en','_template','percentage_score',_binary 'percentage score','2008-03-10 11:50:57','Test/Survey Property'),('en','_template','percentage_to',_binary 'Percentage To','2008-09-25 15:59:56','gradebook'),('en','_template','period',_binary 'Period','2004-06-22 12:09:54',''),('en','_template','personal',_binary 'Personal Information','2009-12-07 13:42:47','Social personal info'),('en','_template','personal_information',_binary 'Personal Information','2003-05-20 14:53:12','registration, profile edit'),('en','_template','per_day',_binary 'per day','2003-05-20 14:54:04','instructor course statistics, details'),('en','_template','per_disabilities',_binary 'Disabilities','2009-12-07 13:42:04',''),('en','_template','per_ethnicity',_binary 'Ethnicity','2009-12-07 13:40:53',''),('en','_template','per_eyes',_binary 'Eye Colour','2009-12-07 13:40:23','Social personal info'),('en','_template','per_hair',_binary 'Hair Colour','2009-12-07 13:39:57','Social personal info'),('en','_template','per_height',_binary 'Height','2009-12-07 13:39:21','social personal info'),('en','_template','per_languages',_binary 'Languages Spoken','2009-12-07 13:41:45',''),('en','_template','per_weight',_binary 'Body Weight','2009-12-07 14:09:24',''),('en','_template','phone',_binary 'Telephone Number','2006-11-23 11:33:30','global phone number field label'),('en','_template','photos',_binary 'Photo Gallery','2010-03-17 15:49:12','photo album'),('en','_template','php_version',_binary 'PHP Version','2007-07-26 13:40:22',''),('en','_template','picture',_binary 'Picture','2007-02-26 17:22:49',''),('en','_template','pink',_binary 'Pink','2008-09-09 09:01:13',''),('en','_template','placelogo',_binary 'Place holder logo','2009-05-27 12:01:11',''),('en','_template','plain_text',_binary 'Plain Text','2006-11-23 13:16:30','instructor content editor, news, inbox, forum message format'),('en','_template','points',_binary 'Points','2007-03-05 15:51:38',''),('en','_template','points_score',_binary 'points score','2008-03-10 11:51:16','Test/Survey Property'),('en','_template','poll',_binary 'Poll','2004-06-25 13:17:51',''),('en','_template','polls',_binary 'Polls','2004-06-14 13:55:42',''),('en','_template','position',_binary 'Position','2009-05-27 12:01:11',''),('en','_template','post',_binary 'Post','2003-05-20 14:56:13','forum new thread post button'),('en','_template','postal_code',_binary 'Postal/Zip Code','2003-05-20 14:56:34','global postal code filed labal'),('en','_template','posted_by',_binary 'By','2003-05-20 14:57:31','forum message submitter'),('en','_template','posted_on',_binary 'on','2003-05-20 14:58:10','forum message post date, inbox'),('en','_template','posts',_binary 'Forum Threads','2005-03-07 13:37:56','Header for posts in Forum List'),('en','_template','post_lock',_binary 'Locked from posting','2003-05-20 14:58:32','forum lock thread message'),('en','_template','post_message',_binary 'Post Message','2008-05-05 15:27:19','forum post fieldset'),('en','_template','powered_by_google',_binary 'Results by <a href=\"http://www.google.com\">Google</a>.','2005-10-20 10:52:51',''),('en','_template','preferences',_binary 'Preferences','2003-05-20 14:59:08','global preferences word'),('en','_template','prefer_alt',_binary 'Preferred Alternative','2008-09-09 08:56:34',''),('en','_template','prefer_lang',_binary 'Preferred Language','2008-09-09 08:56:34',''),('en','_template','prefs_set_atutor',_binary 'Setup your general ATutor configuration  options.','2010-04-12 16:28:18',''),('en','_template','prefs_set_audio',_binary 'If you want alternatives to audio content when it is available, select \"Yes\", choose the type of Preferred Alternative, then choose to have the alternative appended to, or replace the original audio content.','2010-04-12 16:23:16',''),('en','_template','prefs_set_display',_binary 'Select the text settings to make the screen easier to see.','2010-04-12 16:34:38',''),('en','_template','prefs_set_init',_binary 'You may use this wizard to setup your ATutor personal preferences. Select the checkbox(s) next to preferences you would like to modify, then choose <strong>Next</strong>, OR click <strong>Close</strong> to exit.','2010-04-12 16:08:38',''),('en','_template','prefs_set_init_atutor',_binary 'I would like to change or review my ATutor preferences.','2010-04-12 16:15:51',''),('en','_template','prefs_set_init_audio',_binary 'I would like alternatives to audio content.','2010-04-12 16:13:48',''),('en','_template','prefs_set_init_legend',_binary 'What preferences would you like to setup?','2010-04-12 16:16:51',''),('en','_template','prefs_set_init_nav',_binary 'I would like to enhance the navigation of the content.','2010-04-12 16:10:07',''),('en','_template','prefs_set_init_see',_binary 'I would like to make the text on the screen easier to see.','2010-04-12 16:09:35',''),('en','_template','prefs_set_init_text',_binary 'I would like alternatives to textual content.','2010-04-12 16:13:09',''),('en','_template','prefs_set_init_tool',_binary 'I would like access to learner support tools.','2010-04-12 16:15:10',''),('en','_template','prefs_set_init_visual',_binary 'I would like alternatives to visual content.','2010-04-12 16:14:32',''),('en','_template','prefs_set_nav',_binary 'Select the navigation features you would like added to ATutor.','2010-04-12 16:19:49',''),('en','_template','prefs_set_text',_binary 'If you want alternatives to text content when it is available, select \"Yes\", choose the type of Preferred Alternative, then choose to have the alternative appended to, or replace the original text content','2010-04-12 16:21:58',''),('en','_template','prefs_set_tools',_binary 'You may choose from the available Learner Support Tools to make them available while in a course.','2010-04-12 16:26:59',''),('en','_template','prefs_set_visual',_binary 'If you want alternatives to visual content when it is available, select \"Yes\", choose the type of Preferred Alternative, then choose to have the alternative appended to, or replace the original visual content','2010-04-12 16:24:47',''),('en','_template','presets',_binary 'Presets','2004-08-24 11:56:35',''),('en','_template','preset_grade_scale',_binary 'Preset Grade Scale','2008-09-25 15:59:56','gradebook'),('en','_template','preset_scales',_binary 'Preset &amp; Previously Used Scales','2004-08-24 13:48:44',''),('en','_template','pretty_url',_binary 'Pretty URL','2008-05-14 12:02:47',''),('en','_template','preview',_binary 'Preview','2003-05-20 14:59:52','test manager preview test'),('en','_template','preview_questions',_binary 'Preview Questions','2005-06-21 14:06:13',''),('en','_template','previous',_binary 'Previous','2003-05-20 15:01:31','global sequence arrow alt/link text'),('en','_template','previous_posts',_binary 'Previous Posts','2006-06-14 10:47:00',''),('en','_template','previous_topic',_binary 'Previous Topic','2003-05-20 15:02:06','global sequence arrow alt/link text'),('en','_template','prev_used',_binary 'Previously Used','2004-08-13 13:29:47',''),('en','_template','primary_language',_binary 'Original Language','2008-10-19 17:03:57',''),('en','_template','primary_resource_language',_binary 'Original Resource Language','2008-10-19 17:04:18',''),('en','_template','primary_resource_type',_binary 'Original Resource Type','2008-10-19 17:04:34',''),('en','_template','print_page',_binary 'Print Page','2008-01-04 10:16:49','redux theme'),('en','_template','privacy_control_blurb',_binary 'Controls who can see your profile and related information.','2009-05-27 12:01:11',''),('en','_template','privacy_settings',_binary 'Privacy Settings','2009-05-27 12:01:11',''),('en','_template','private',_binary 'Private','2003-05-20 15:03:14','global private course indicator'),('en','_template','private_enroll',_binary 'The course you are trying to access is <strong>private</strong>. Enrollment in this course requires instructor approval.<br />','2005-03-17 11:51:06','requesting enrollment in private course'),('en','_template','privileges',_binary 'Privileges','2004-03-05 12:29:02',''),('en','_template','priv_ac_access_all',_binary 'ACollab: Access all Groups','2005-08-10 15:21:20',''),('en','_template','priv_ac_create',_binary 'ACollab: Create Group','2005-08-10 15:20:47',''),('en','_template','priv_admin_super',_binary 'Super Administrator','2005-03-03 10:36:48',''),('en','_template','priv_admin_themes',_binary 'Themes','2005-03-03 10:38:07',''),('en','_template','priv_forums',_binary 'Forums & Chat','2004-03-08 10:04:06',''),('en','_template','priv_test_create',_binary 'Test Creation','2005-08-10 15:20:29',''),('en','_template','priv_test_mark',_binary 'Test Marking','2005-08-10 15:22:12',''),('en','_template','processing',_binary 'Processing','2010-04-26 15:39:06',''),('en','_template','profile',_binary 'Profile','2003-05-20 16:24:30','control centre heading'),('en','_template','profile_bundle_select',_binary 'Profile Bundle Selection','2004-12-06 12:13:34',''),('en','_template','profile_control',_binary 'Profile Visability','2009-05-27 12:01:11',''),('en','_template','profile_picture',_binary 'Profile Picture','2009-05-27 12:01:11',''),('en','_template','profile_pictures',_binary 'Profile Pictures','2007-02-27 13:43:00',''),('en','_template','profile_student_information',_binary 'Student Information','2003-09-16 11:49:35','view profile'),('en','_template','properties',_binary 'Properties','2003-05-21 12:15:58','instructor control centre'),('en','_template','protected',_binary 'Protected','2003-05-21 12:16:46','browse, create coruse, control centre, course properties'),('en','_template','province',_binary 'Province/State','2003-05-21 12:17:22','registration, profile editor'),('en','_template','proxy',_binary 'Learning Activity','2011-05-27 16:08:21',''),('en','_template','public',_binary 'Public','2003-05-21 12:18:37','browse courses, create course, course properties, control centre'),('en','_template','publish_date',_binary 'Publish Date','2008-10-21 15:41:53',''),('en','_template','purple',_binary 'Purple','2003-05-21 12:18:50','global code picker'),('en','_template','put_link',_binary 'put link name here','2004-12-08 12:38:42','filemanager, isert text'),('en','_template','quebec-lsq',_binary 'Quebec-LSQ','2008-09-09 09:01:13',''),('en','_template','question',_binary 'Question','2003-05-21 12:30:21','test manager'),('en','_template','questions',_binary 'Questions','2003-05-21 12:30:40','test manager'),('en','_template','questions_for',_binary 'Questions for','2003-05-21 12:30:50','test manager'),('en','_template','question_categories',_binary 'Question Categories','2005-02-22 14:17:33',''),('en','_template','question_database',_binary 'Question Bank','2010-06-25 15:13:30',''),('en','_template','question_statistics',_binary 'Question Statistics','2004-08-26 13:26:17',''),('en','_template','quote',_binary 'Quote','2003-05-21 12:31:19','code picker alt text'),('en','_template','randomize_questions',_binary 'Randomize Questions','2004-05-18 10:44:48',''),('en','_template','raw',_binary 'Raw','2003-09-13 09:25:20','course tracker member picker'),('en','_template','raw_data',_binary 'Raw Data','2003-05-21 12:31:48','instructor course statistics/details'),('en','_template','raw_final_score',_binary 'Raw Final Score','2008-09-25 16:01:17','gradebook'),('en','_template','re',_binary 'Re','2007-02-20 16:20:00',''),('en','_template','reading_list',_binary 'Reading List','2006-05-09 14:19:55',''),('en','_template','read_lock',_binary 'Locked from posting & reading','2003-05-21 12:32:39','forum lock message in thread list'),('en','_template','real_name',_binary 'Real Name','2003-10-20 11:33:14','course properties'),('en','_template','reapply_default',_binary 'Reset to System Defaults','2008-10-29 12:18:43',''),('en','_template','recent_first',_binary 'Recent First','2009-09-08 13:34:27',''),('en','_template','recent_last',_binary 'Recent Last','2009-09-08 13:34:44',''),('en','_template','recipient_address',_binary 'Recipient Address','2004-12-06 12:20:03','admin/error_logging_bundle.php'),('en','_template','red',_binary 'Red','2003-05-21 12:32:57','global code picker'),('en','_template','red_members',_binary 'Red = Members','2003-05-21 12:33:55','instructor course statistics/details'),('en','_template','refine_results',_binary 'Refine Results','2013-12-28 12:16:28','admin courses tmpl'),('en','_template','refresh_image',_binary 'Refresh Image','2009-07-16 08:51:44',''),('en','_template','regenerate',_binary 'Regenerate','2007-02-16 14:00:06',''),('en','_template','register',_binary 'Register','2003-11-26 15:09:00',''),('en','_template','registered_members',_binary 'Registered Members','2008-10-06 13:42:00',''),('en','_template','register_an_account',_binary 'Register an ATutor System Account','2003-05-21 12:36:01','private course enrolment screen, login screen'),('en','_template','registration_text',_binary 'If you do not have an account on this system,  please create a new account by clicking on the Register Button below.','2005-07-27 15:11:59',''),('en','_template','reg_exp',_binary 'Regular Expression','2004-11-20 19:38:23',''),('en','_template','reject_request',_binary 'Reject Request','2009-05-27 12:01:11',''),('en','_template','related_topics',_binary 'Related Topics','2003-05-21 12:38:26','context(?)'),('en','_template','relative_directory',_binary 'Directory is relative directory to ATutor root, for example: docs/images/ or tools/tests/. Leave empty if it is ATutor root directory.','2008-04-21 15:11:31',''),('en','_template','release_date',_binary 'Release Date','2003-05-21 12:39:24','instructor add/edit content, control centre'),('en','_template','release_immediate',_binary 'Once quiz has been submitted','2004-12-13 13:55:49',''),('en','_template','release_marked',_binary 'Once quiz has been submitted and all questions have been marked','2004-12-13 13:55:57',''),('en','_template','release_never',_binary 'Do not release results','2004-12-13 14:02:13',''),('en','_template','release_on',_binary 'Release on','2006-04-10 14:37:58',''),('en','_template','remedial_back_to_the_test',_binary 'Go back to test','2013-01-23 14:16:48',''),('en','_template','remedial_content',_binary 'Remedial Content','2013-01-23 14:16:02',''),('en','_template','remedial_content_goto_link',_binary 'Go to remedial content','2013-01-23 14:17:18',''),('en','_template','remedial_content_hide',_binary 'Do not show Remedial Content to students after failing the test','2013-01-23 14:18:37',''),('en','_template','remedial_content_placeholder',_binary 'Enter information to present to students who answer this question incorrectly.','2013-01-23 14:15:02',''),('en','_template','remedial_content_show',_binary 'Show Remedial Content to students after failing the test','2013-01-23 14:19:00',''),('en','_template','remove',_binary 'Remove','2003-05-21 12:40:11','control centre, admin user manager, instructor enrolment manager'),('en','_template','removed',_binary 'Removed','2004-02-03 09:36:19',''),('en','_template','remove_frame',_binary 'Remove Frame','2005-01-10 14:31:34','filemanager preview'),('en','_template','remove_question',_binary 'Remove Question','2004-11-25 10:30:59',''),('en','_template','remove_queued_file',_binary 'Remove file from queue','2008-07-22 16:44:41','Instruction to remove file in Fluid\'\'s multiple file uploader'),('en','_template','remove_write_permission',_binary '<span style=\"color:red\">Please <strong>REMOVE</strong> write permission on the listed folders and files for your security:</span><p><strong>Note:</strong> To remove permissions on Unix use <kbd>chmod 755</kbd> then the file name..</p>','2008-04-21 15:08:55','patcher'),('en','_template','rename',_binary 'Rename','2004-08-11 14:00:49',''),('en','_template','replace',_binary 'Replace','2008-09-09 09:01:12',''),('en','_template','replace_file',_binary 'Replace File','2008-04-21 15:11:31',''),('en','_template','replace_into',_binary 'Replace Into','2005-03-03 12:16:28',''),('en','_template','replied',_binary 'Replied','2003-05-21 12:40:35','inbox message status label'),('en','_template','replies',_binary 'Replies','2003-05-21 12:40:50','forum'),('en','_template','reply',_binary 'Reply','2003-05-21 12:41:20','forum, inbox'),('en','_template','report_errors',_binary 'Report Errors','2004-12-06 12:08:05',''),('en','_template','representation',_binary 'Representative','2009-12-03 15:41:02',''),('en','_template','request_enrollment',_binary 'Request Enrollment','2003-10-21 13:04:17',''),('en','_template','request_instructor',_binary 'You do not yet have permission to create courses. If you would like an instructor account, enter the required description of the course you wish to create.','2005-03-09 12:22:12',''),('en','_template','request_instructor_account',_binary 'Request Instructor Account','2003-05-21 12:43:12','control centre non-instructor'),('en','_template','request_instructor_pending',_binary 'Your instructor account request has been made. You will be notifed by email when your request has been approved.','2005-03-09 12:35:15',''),('en','_template','request_instructor_priv',_binary 'Request Instructor Account','2009-11-13 15:44:24','my start page'),('en','_template','request_services',_binary '<a href=\"http://www.atutor.ca/services\">Request ATutor Services</a>','2008-11-14 13:43:45',''),('en','_template','request_services_text',_binary 'Purchase yearly support packages, support tickets, or other ATutor services. Requires <a href=\"http://www.atutor.ca/my/register.php\">registration on atutor.ca</a>.','2008-11-14 14:04:23',''),('en','_template','required',_binary 'Required','2003-05-21 12:43:54','registration, export course, test manager question editor'),('en','_template','required_field',_binary 'Required Field','2005-03-04 12:52:17',''),('en','_template','required_information',_binary 'Required Information','2005-03-04 14:08:38',''),('en','_template','require_email_confirmation',_binary 'Require Email Confirmation Upon Registration','2005-03-22 10:55:04',''),('en','_template','req_message9',_binary 'ATutor Instructor Request','2003-05-21 18:52:38','email message subject line from control centre instructor request'),('en','_template','req_message_instructor',_binary 'A new Instructor account request has been made by: %s.\r\n\r\nCourse Description: %s\r\n\r\nYou must login as the administrator at %s to approve or reject this request.','2004-02-16 16:38:30',''),('en','_template','reset',_binary 'Reset','2003-05-21 18:53:27','global text for reset buttons'),('en','_template','reset_filter',_binary 'Reset Filter','2005-03-30 14:52:42',''),('en','_template','reset_log',_binary 'Reset Log','2005-03-03 10:42:24',''),('en','_template','resource_categories',_binary 'Resource Categories','2003-05-21 18:57:43','instructor export course feedback'),('en','_template','resource_links',_binary 'Resource Links','2003-05-21 18:58:34','instructor export course feedback'),('en','_template','resource_type',_binary 'Resource type','2010-03-09 16:16:42','adapted content'),('en','_template','response_text',_binary 'The following answers were given in response to:','2004-08-25 12:20:59',''),('en','_template','restore',_binary 'Restore','2003-05-21 18:59:34','preferences page (removed 1.2)'),('en','_template','restore_backup_about',_binary 'Choose the checkboxes next to the content to be restored, select course into which to restore the content, then choose to append the content to the course, or replace the content in the course.','2004-12-10 09:53:40',''),('en','_template','restore_upload',_binary 'To upload a backup file, enter a description of the backup, choose a file to upload, and use the \"Upload\" button. Only backups created using ATutor 1.3 and later are supported. Depending on the size of the course and your Internet connection speed,  uploading a backup may take a long time.','2004-12-10 18:06:04',''),('en','_template','resubmit',_binary 'Resubmit','2004-01-30 16:34:56',''),('en','_template','result',_binary 'Result','2004-08-12 15:22:08','single result in search engine'),('en','_template','results',_binary 'Results','2003-05-21 19:00:51','test manager'),('en','_template','results_found',_binary 'Results Found: %s','2005-04-14 11:01:25',''),('en','_template','results_from',_binary 'Results from %s','2004-08-18 12:05:27',''),('en','_template','result_release',_binary 'Release Results','2004-12-13 13:57:31',''),('en','_template','resume',_binary 'Resume','2003-05-21 19:01:48','alt/link text for the resume arrow'),('en','_template','return',_binary 'Return','2003-05-21 19:02:25','escape from delete course function'),('en','_template','returning_user',_binary 'Returning User','2010-10-19 10:06:09','login screen'),('en','_template','return_file_manager',_binary 'Return to the File Manager','2004-11-05 11:20:30','file manager'),('en','_template','return_to_admin_area',_binary 'Return to Admin Area','2006-03-28 12:31:38',''),('en','_template','revision',_binary 'Revision','2003-05-21 19:04:01','instructor content editor statistics below embedded links'),('en','_template','revisions',_binary 'Revisions','2006-03-20 14:36:35',''),('en','_template','revision_comment',_binary 'Revisions Comment','2006-03-20 14:37:58',''),('en','_template','right',_binary 'Right','2004-04-27 11:00:46',''),('en','_template','rl_add_av_material_to_resources',_binary 'Add AV Material To Resources','2006-02-23 09:18:51',''),('en','_template','rl_add_resource_av',_binary 'Add Resource AV','2006-02-23 09:18:51',''),('en','_template','rl_add_resource_book',_binary 'Add Resource Book','2006-02-23 09:18:51',''),('en','_template','rl_add_resource_file',_binary 'Add Resource File','2006-02-23 09:18:51',''),('en','_template','rl_add_resource_handout',_binary 'Add Resource Handout','2006-02-23 09:18:51',''),('en','_template','rl_add_resource_url',_binary 'Add Resource URL','2006-02-23 09:18:51',''),('en','_template','rl_av',_binary 'AV','2006-02-23 09:18:51',''),('en','_template','rl_av_material_to_view',_binary 'AV Material to View','2006-04-13 12:18:36',''),('en','_template','rl_book',_binary 'book','2006-02-23 09:18:51',''),('en','_template','rl_book_to_read',_binary 'Book To Read','2006-02-23 09:18:51',''),('en','_template','rl_create_new_av',_binary 'Create New AV','2006-02-23 09:18:51',''),('en','_template','rl_create_new_book',_binary 'Create New Book','2006-02-23 09:18:51',''),('en','_template','rl_create_new_file',_binary 'Create New File','2006-02-23 09:18:51',''),('en','_template','rl_create_new_handout',_binary 'Create New Handout','2006-02-23 09:18:51',''),('en','_template','rl_create_new_url',_binary 'Create New URL','2006-02-23 09:18:51',''),('en','_template','rl_create_resources',_binary 'Create Resource','2013-10-01 16:32:28','reading list'),('en','_template','rl_date_format',_binary '%%M %%d, %%Y','2006-06-26 16:10:05',''),('en','_template','rl_delete_reading',_binary 'Delete Reading','2006-02-23 09:18:51',''),('en','_template','rl_delete_resource',_binary 'Delete Resource','2006-02-23 09:18:51',''),('en','_template','rl_display_resource',_binary 'Display Resource','2006-02-23 09:18:51',''),('en','_template','rl_display_resources',_binary 'Resources','2006-02-23 09:18:51',''),('en','_template','rl_edit_reading_av',_binary 'Edit Reading AV','2006-02-23 09:18:51',''),('en','_template','rl_edit_reading_book',_binary 'Edit Reading Book','2006-02-23 09:18:51',''),('en','_template','rl_edit_reading_file',_binary 'Edit Reading File','2006-02-23 09:18:51',''),('en','_template','rl_edit_reading_handout',_binary 'Edit Reading Handout','2006-02-23 09:18:51',''),('en','_template','rl_edit_reading_url',_binary 'Edit Reading URL','2006-02-23 09:18:51',''),('en','_template','rl_edit_resource_av',_binary 'Edit Resource','2006-02-23 09:18:51',''),('en','_template','rl_edit_resource_book',_binary 'Edit Resource Book','2006-02-23 09:18:51',''),('en','_template','rl_edit_resource_file',_binary 'Edit Resource File','2006-02-23 09:18:51',''),('en','_template','rl_edit_resource_handout',_binary 'Edit Resource Handout','2006-02-23 09:18:51',''),('en','_template','rl_edit_resource_url',_binary 'Edit Resource URL','2006-02-23 09:18:51',''),('en','_template','rl_end',_binary 'End','2006-02-23 09:18:51',''),('en','_template','rl_file',_binary 'file','2006-02-23 09:18:51',''),('en','_template','rl_goto_url',_binary 'view page','2006-02-23 09:18:51',''),('en','_template','rl_handout',_binary 'handout','2006-02-23 09:18:51',''),('en','_template','rl_id',_binary 'ISBN','2013-02-28 19:17:38','reading list ISBN number'),('en','_template','rl_isbn_number',_binary 'ISBN','2006-02-23 09:18:51',''),('en','_template','rl_name_reading',_binary 'Name Of Reading','2006-02-23 09:18:51',''),('en','_template','rl_new_reading_av',_binary 'New Reading AV','2006-02-23 09:18:51',''),('en','_template','rl_new_reading_book',_binary 'New Reading Book','2006-02-23 09:18:51',''),('en','_template','rl_new_reading_file',_binary 'New Reading File','2006-02-23 09:18:51',''),('en','_template','rl_new_reading_handout',_binary 'New Reading Handout','2006-02-23 09:18:51',''),('en','_template','rl_new_reading_url',_binary 'New Reading URL','2006-02-23 09:18:51',''),('en','_template','rl_no_read_by_date',_binary 'No Read By Date','2006-02-23 09:18:51',''),('en','_template','rl_optional_reading',_binary 'Optional Reading','2006-02-23 09:18:51',''),('en','_template','rl_or',_binary 'or','2006-02-23 09:18:51',''),('en','_template','rl_pages',_binary 'Pages','2006-02-23 09:18:51',''),('en','_template','rl_publisher',_binary 'Publisher','2006-02-23 09:18:51',''),('en','_template','rl_reading_date',_binary 'Reading Date','2006-02-23 09:18:51',''),('en','_template','rl_read_by_date',_binary 'Read by Date','2006-04-13 10:58:30',''),('en','_template','rl_select_book',_binary 'Select Book','2006-07-25 09:08:20',''),('en','_template','rl_select_file',_binary 'Select File','2006-07-25 09:15:44',''),('en','_template','rl_select_handout',_binary 'Select Handout','2006-07-25 09:13:13',''),('en','_template','rl_select_url',_binary 'Select URL','2006-07-25 09:12:21',''),('en','_template','rl_start',_binary 'Start','2006-06-21 08:53:43',''),('en','_template','rl_type_of_reading',_binary 'Type of Reading','2006-07-31 15:23:22',''),('en','_template','rl_type_of_resource',_binary 'Type of Resource','2006-07-14 10:24:21',''),('en','_template','rl_url',_binary 'URL','2007-08-02 10:46:30','resource type picker'),('en','_template','rl_view_resource_details',_binary 'View Resource Details','2008-06-10 14:23:50','reading list.'),('en','_template','rl_year_written',_binary 'Year Written','2006-06-21 08:55:34',''),('en','_template','role',_binary 'Role','2004-03-05 12:26:47',''),('en','_template','rss_feeds',_binary 'News Feeds','2010-05-03 15:01:37',''),('en','_template','rtl',_binary 'Right to Left','2004-11-20 19:37:58',''),('en','_template','russian-rsl',_binary 'Russian-RSL','2008-09-09 09:01:13',''),('en','_template','same_course_users',_binary 'Only users in the same courses as you are listed.','2003-05-21 19:05:32','inbox send message form'),('en','_template','sans_serif',_binary 'Sans Serif','2008-09-09 09:01:13',''),('en','_template','save',_binary 'Save','2004-10-29 14:57:46','file manager'),('en','_template','save_changes',_binary 'Save Changes','2004-05-11 10:48:01',''),('en','_template','save_changes_saved',_binary 'All changes have been saved.','2004-02-16 14:06:16',''),('en','_template','save_changes_unsaved',_binary 'Unsaved changes have been made.','2004-02-16 14:04:25',''),('en','_template','save_types_and_language',_binary 'Update Resource Properties','2008-10-19 13:51:37',''),('en','_template','scaffold_text',_binary 'Modify the URLs for the learning tools below. Leave blank to disable.','2008-09-10 12:29:26','tool preferences'),('en','_template','scale',_binary 'Scale','2008-09-25 15:59:56','gradebook'),('en','_template','scale_value',_binary 'Scale Value','2008-09-25 15:59:56','gradebook'),('en','_template','schema_error',_binary 'Wrong schema location','2009-12-07 13:09:06','common cartridge'),('en','_template','search',_binary 'Search','2003-05-21 19:19:30','links database'),('en','_template','search_all_words',_binary 'All words','2003-08-11 11:22:04',''),('en','_template','search_any_word',_binary 'Any word','2003-08-11 11:22:14',''),('en','_template','search_connections',_binary 'Search Connections','2009-05-27 12:01:11',''),('en','_template','search_control',_binary 'Search Control','2009-11-06 15:53:36','networking settings'),('en','_template','search_education',_binary 'Search Education','2009-05-27 12:01:11',''),('en','_template','search_for_friends',_binary 'Search People','2009-05-27 12:01:11',''),('en','_template','search_for_groups',_binary 'Search for Groups','2009-05-27 12:01:11',''),('en','_template','search_in',_binary 'Search in','2004-04-30 10:51:57',''),('en','_template','search_match',_binary 'Match','2003-08-11 11:21:50',''),('en','_template','search_position',_binary 'Search Position','2009-05-27 12:01:11',''),('en','_template','search_profile',_binary 'Search Profile','2009-05-27 12:01:11',''),('en','_template','search_results',_binary 'Search Results','2003-05-21 19:21:29','links database'),('en','_template','search_site',_binary 'Only search within <strong>%s</strong>.','2005-10-20 10:53:28',''),('en','_template','search_visibility',_binary 'Search Visibility','2009-05-27 12:01:11',''),('en','_template','search_words',_binary 'Words','2003-08-11 11:21:36',''),('en','_template','secondary_resource_body',_binary 'Body','2008-09-23 13:50:56',''),('en','_template','secondary_resource_language',_binary 'Adapted Resource Language','2008-10-19 17:05:56',''),('en','_template','secondary_resource_type',_binary 'Adapted Resource Type','2008-10-19 17:06:06',''),('en','_template','seconds',_binary 'Seconds','2010-05-10 15:56:57',''),('en','_template','second_name',_binary 'Second Name','2006-03-27 14:53:50',''),('en','_template','second_short',_binary 's','2007-07-09 12:31:07',''),('en','_template','section',_binary 'Section','2005-03-04 14:06:06',''),('en','_template','see',_binary 'See','2003-05-21 19:24:22','glossary - \"see\" related terms'),('en','_template','see_attached',_binary 'See attached.','2005-03-10 16:37:04','error logging - email body'),('en','_template','select',_binary 'Select','2007-02-21 13:22:15',''),('en','_template','select_all',_binary 'select/unselect all','2004-10-29 13:25:57','file manager and enrollment manager'),('en','_template','select_av',_binary 'Select Audio/Visual','2006-07-25 09:14:57',''),('en','_template','select_cat',_binary 'Select Category','2005-02-23 12:23:56',''),('en','_template','select_directory',_binary 'Please choose the folder you want to move the selected files to:','2004-11-30 11:40:08','Filamanger, moving a file'),('en','_template','select_member',_binary 'Select a Member to View','2003-05-21 19:29:27','instructor course tracker'),('en','_template','select_parent_topic',_binary 'Select parent topic','2005-03-16 13:37:00','content manager'),('en','_template','select_term_to_edit',_binary 'Select term to edit.','2006-09-25 13:08:38',''),('en','_template','send',_binary 'Send','2003-05-21 19:31:57','global message send button text'),('en','_template','send_bundle',_binary 'Send Bundle','2004-12-06 12:16:19',''),('en','_template','send_confirmation',_binary 'Enter your email address below and the account confirmation message will be resent.','2005-03-24 09:57:32',''),('en','_template','send_delete',_binary 'Send & Delete','2003-05-21 19:32:55','send a message from the inbox and delete the original'),('en','_template','send_message',_binary 'Send Message','2003-05-21 19:34:13','inbox send message button text'),('en','_template','sent_messages',_binary 'Sent Messages','2007-02-20 16:21:09',''),('en','_template','sent_msgs_ttl_text',_binary 'Number of Days to Keep Copied Sent Messages for','2007-02-20 14:00:45',''),('en','_template','sent_via_atutor',_binary 'Sent via an ATutor system at %s','2003-05-21 20:04:50','global email message footer'),('en','_template','sequence',_binary 'Sequence','2003-05-21 20:05:50','context (removed 1.2)'),('en','_template','serif',_binary 'Serif','2008-09-09 09:01:13',''),('en','_template','server_date_format',_binary '%%Y-%%m-%%d %%G:%%i:%%s','2008-10-01 15:02:49','date format'),('en','_template','session_end',_binary 'and ended on','2003-05-21 20:12:12','tracker - to be updated ( started on [date] and ended on [date])'),('en','_template','session_start',_binary 'Session above started on','2003-05-21 20:11:35','tracker (to be updated)'),('en','_template','session_timeout',_binary 'Session Timeout Period','2013-01-31 11:49:21',''),('en','_template','session_timeout_logout_now',_binary 'Logout Now','2012-06-07 14:32:20','timeout dialog'),('en','_template','session_timeout_stay_connected',_binary 'Stay Connected','2012-06-07 14:32:41',''),('en','_template','session_timeout_title',_binary 'Session Timeout','2012-06-07 14:31:51','timeout dialog'),('en','_template','session_will_expire',_binary 'Your session is about to expire.','2012-06-07 11:00:24','timeout warning'),('en','_template','set',_binary 'Set','2003-06-30 17:02:05','admin language manager'),('en','_template','settings',_binary 'Settings','2009-05-27 12:01:11',''),('en','_template','set_all_weights',_binary 'Set a point value for all the questions on this test.  After you are done, click \"save\".','2010-06-16 11:22:11','test questions'),('en','_template','set_default',_binary 'Set as Default','2004-10-15 15:48:04','set as default button in theme manager'),('en','_template','set_preset',_binary 'Apply Preset','2003-05-24 10:52:43','preferences'),('en','_template','shared_forums',_binary 'Shared Forums','2004-11-03 11:18:31',''),('en','_template','shindig_blurb',_binary 'If you have your own Shindig server setup, your can enter the URL to the server here. If you do not have your own Shindig server, you can either leave the URL empty, or you can use \"http://social.atutor.ca/shindig/php\" to connect to the ATutor social network. Shindig allows users to link gadgets from other sites into their social networking environment, as well as communicate with those in other social networks. If you choose not to use a Shindig server, your social network will function as a self-contained network, without access to external networks.','2010-12-14 16:15:48',''),('en','_template','shindig_url',_binary 'URL of Optional ShinDig server.','2009-05-27 12:01:11',''),('en','_template','shortcuts',_binary 'Shortcuts','2004-04-27 14:57:01',''),('en','_template','short_paragraph',_binary 'Short Paragraph','2003-05-21 20:13:03','test manager test type'),('en','_template','show',_binary 'Show','2005-03-15 11:37:59',''),('en','_template','show_all',_binary 'show all','2009-05-27 12:01:11',''),('en','_template','show_all_remedial',_binary 'Show All Remedial Content','2013-01-23 14:19:21',''),('en','_template','show_available_applications',_binary 'Show Available Gadgets','2009-05-27 12:01:11',''),('en','_template','show_bread_crumbs',_binary 'Show Breadcrumb Link Navigation','2008-09-24 13:05:06',''),('en','_template','show_contents',_binary 'Show page Table of Contents','2010-10-07 10:42:22',''),('en','_template','show_current',_binary 'Display Current Activities on My Start Page','2015-12-29 17:40:12',''),('en','_template','show_guest_form',_binary 'Show Guest Information Collection Form','2008-10-09 14:13:38',''),('en','_template','show_guide',_binary 'Show Context Sensitive Links to Handbook','2008-09-24 12:09:33',''),('en','_template','show_next_previous_buttons',_binary 'Show Next/Previous Navigation Buttons','2008-09-24 13:04:28',''),('en','_template','show_numbers',_binary 'Topic Numbering','2005-02-09 10:20:54','preference option'),('en','_template','show_on_home_page',_binary 'Show on Home Page','2009-05-27 12:01:11',''),('en','_template','show_pages',_binary 'Show Pages','2010-04-21 16:28:13','thing current'),('en','_template','show_raw_tracking',_binary 'Show raw tracking','2003-11-26 15:19:12',''),('en','_template','show_side_menu',_binary 'Show Side Menu','2014-07-08 18:55:21','side menu toogle'),('en','_template','show_summary_tracking',_binary 'Show summary tracking','2003-11-26 15:18:39',''),('en','_template','show_your_applications',_binary 'Show Your Gadgets','2009-05-27 12:01:11',''),('en','_template','side_menu',_binary 'Side Menu','2005-03-04 14:37:00',''),('en','_template','side_menu_closed',_binary 'Side menu closed.','2014-01-01 18:16:50','sidemenu toggle aria-live message'),('en','_template','side_menu_opened',_binary 'Side menu opened','2014-01-01 18:16:10','sidemenu toggle aria-live message'),('en','_template','side_menu_text',_binary 'Choose which menu items you would like displayed at the side.','2005-03-04 15:17:16',''),('en','_template','sign_lang',_binary 'Sign Language','2008-09-09 08:56:34',''),('en','_template','sign_language',_binary 'Sign language','2008-09-08 14:19:39',''),('en','_template','singapore-sls',_binary 'Singapore-SLS','2008-09-09 09:01:13',''),('en','_template','sitemap',_binary 'Site-map','2003-05-21 20:17:21','global site-map text'),('en','_template','sitemap_text',_binary 'Browse through the whole course site from one location.','2009-07-02 14:15:24',''),('en','_template','site_name',_binary 'Site Name','2005-03-03 10:49:59',''),('en','_template','size',_binary 'Size','2003-05-22 13:01:20','file manager, zip tool'),('en','_template','smile_angry',_binary 'angry','2004-02-12 12:20:44',''),('en','_template','smile_confused',_binary 'confused','2004-02-12 12:21:15',''),('en','_template','smile_crazy',_binary 'crazy','2004-02-12 12:20:59',''),('en','_template','smile_evil',_binary 'evil','2004-02-12 12:20:37',''),('en','_template','smile_frown',_binary 'frown','2004-02-12 12:20:14',''),('en','_template','smile_lol',_binary 'laughing out loud','2004-02-12 12:20:53',''),('en','_template','smile_muah',_binary 'muah','2004-02-12 12:21:23',''),('en','_template','smile_oh_well',_binary 'oh well','2004-02-12 12:20:21',''),('en','_template','smile_smile',_binary 'smile','2004-02-12 12:20:02',''),('en','_template','smile_tired',_binary 'tired','2004-02-12 12:21:06',''),('en','_template','smile_tongue',_binary 'tongue','2004-02-12 12:20:27',''),('en','_template','smile_wink',_binary 'wink','2004-02-12 12:20:08',''),('en','_template','social',_binary 'Networking','2009-05-27 12:01:11',''),('en','_template','social_and_lms',_binary 'Use ATutor LMS with ATutor Social module','2009-07-17 14:12:34',''),('en','_template','social_groups',_binary 'Network Groups','2009-05-27 12:01:11',''),('en','_template','social_profile',_binary 'Network Profile','2009-05-27 12:01:11',''),('en','_template','social_switch',_binary 'Social Networking','2009-07-17 14:11:16',''),('en','_template','social_switch_text',_binary 'Choose to use ATutor as a social networking environment only, or as a learning management system with a social networking module.','2009-07-17 14:19:22',''),('en','_template','spanish',_binary 'Spanish','2008-09-09 09:01:12',''),('en','_template','spanish-lse',_binary 'Spanish-LSE','2008-09-09 09:01:13',''),('en','_template','specific_groups',_binary 'Specific Groups','2006-03-23 13:39:26',''),('en','_template','specify_url_to_content_package',_binary 'Or, Specify a URL to a Content Package or Common Cartridge','2009-11-16 10:57:14',''),('en','_template','specify_url_to_theme_package',_binary 'Or, Specify a URL to a Theme','2004-10-18 15:10:35',''),('en','_template','sports_recreation',_binary 'Sports and Recreation','2009-05-27 12:01:11',''),('en','_template','sql_statement',_binary 'SQL Statement','2008-04-21 15:11:31',''),('en','_template','standard',_binary 'Standard','2005-09-21 13:35:25',''),('en','_template','started_by',_binary 'Started By','2003-05-22 13:02:38','forums thread display table column header'),('en','_template','startend_date_format',_binary '%%j/%%n/%%y %%G:%%i','2007-12-09 15:58:39',''),('en','_template','startend_date_longs_format',_binary '%%Y-%%m-%%d %%H:%%i','2008-08-27 11:23:57',''),('en','_template','startend_date_long_format',_binary '%%Y-%%m-%%d %%H:%%i','2008-08-27 11:24:04',''),('en','_template','start_date',_binary 'Start Date','2003-05-22 13:03:05','mytests, test manager'),('en','_template','start_test',_binary 'Begin','2009-11-13 16:18:58','test intro'),('en','_template','state',_binary 'State','2005-08-16 15:27:15',''),('en','_template','statement',_binary 'Statement','2003-05-22 13:07:22','test manager add/edit questions'),('en','_template','statistics',_binary 'Statistics','2003-05-22 13:08:06','instructor course statistics/details'),('en','_template','statistics_information',_binary 'Statistics &amp; Information','2007-07-26 13:39:49',''),('en','_template','status',_binary 'Status','2003-05-22 13:09:29','test manager, control center, profile, admin user manager'),('en','_template','sticky_thread',_binary 'Sticky Topic - always at the top','2014-01-02 15:41:44','instructor forum option alt text'),('en','_template','stop_apply_audio_alternatives',_binary 'Stop Applying Audio Alternatives','2010-04-21 14:35:40','alternative switcher'),('en','_template','stop_apply_sign_lang_alternatives',_binary 'Stop Applying Sign Language Alternatives','2010-04-21 14:36:15','alternative switcher'),('en','_template','stop_apply_text_alternatives',_binary 'Stop Applying Text Alternatives','2010-04-21 14:35:20','alternative switcher'),('en','_template','stop_apply_visual_alternatives',_binary 'Stop Applying Visual Alternatives','2010-04-21 14:35:57','alternative switcher'),('en','_template','street_address',_binary 'Street Address','2003-05-22 13:10:43','registration, profile'),('en','_template','student',_binary 'Student','2003-10-27 11:44:47','tracker'),('en','_template','student1',_binary 'Student','2003-05-22 13:11:42','admin user manager'),('en','_template','students',_binary 'Students','2003-05-21 20:01:44','course email (removed 1.2)'),('en','_template','student_id',_binary 'Student ID','2003-05-22 13:12:40','tracker'),('en','_template','student_not_exists',_binary 'Student not exists','2008-09-25 16:01:17','gradebook'),('en','_template','student_page_stats',_binary 'Student usage statistics by login name','2013-11-17 11:11:06',''),('en','_template','student_pin',_binary 'Student PIN','2005-05-27 13:35:11',''),('en','_template','student_tools',_binary 'Student Tools','2008-11-07 09:17:23',''),('en','_template','student_tools_text',_binary 'Access the tools used in this course.','2009-07-02 14:16:37',''),('en','_template','style_editor',_binary 'Stylesheet Editor','2003-05-22 13:13:22','tool page/ stylesheet editor heading text'),('en','_template','sub',_binary 'sub','2014-08-23 08:54:56','sub navigation'),('en','_template','subject',_binary 'Subject','2003-05-22 13:14:21','global message subject label'),('en','_template','submission',_binary 'Submission','2005-05-11 11:29:07',''),('en','_template','submissions',_binary 'Submissions','2003-05-22 13:14:47','links database'),('en','_template','submit',_binary 'Submit','2003-05-22 13:15:05','global submit button text'),('en','_template','submitted_by',_binary 'Submitted By','2005-02-23 12:23:06',''),('en','_template','submit_no',_binary 'No','2004-11-22 16:23:09',''),('en','_template','submit_yes',_binary 'Yes','2004-11-22 16:23:00',''),('en','_template','subscribe',_binary 'Subscribe to this thread to receive notification via email of new replies.','2003-11-06 13:47:10',''),('en','_template','subscribe1',_binary 'Subscribe','2004-12-02 15:32:01',''),('en','_template','sub_nav_closed',_binary 'Sub navigation closed','2014-04-27 15:36:04',''),('en','_template','sub_nav_hidden',_binary 'Sub navigation hidden','2014-04-27 15:35:42','aria message when subnav closes'),('en','_template','sub_nav_opened',_binary 'Sub navigation bar opened','2014-06-15 14:25:51',''),('en','_template','sub_topics',_binary 'Subtopics','2005-03-16 13:55:12','content manager'),('en','_template','suggestions',_binary 'Suggestions','2009-05-27 12:01:11',''),('en','_template','suggest_link',_binary 'Suggest Course Link','2006-05-25 11:40:32',''),('en','_template','summary',_binary 'Summary','2003-09-13 09:24:55','course tracker member picker'),('en','_template','support_tools',_binary 'Learner Tools','2010-05-03 14:59:19',''),('en','_template','swedish',_binary 'Swedish','2008-09-09 09:01:13',''),('en','_template','switch_icon_view',_binary 'Switch between icon and detailed views','2014-01-01 14:43:41',''),('en','_template','switch_text',_binary 'Switch to text editor','2004-05-27 10:50:47','Content editor'),('en','_template','switch_visual',_binary 'Switch to visual editor','2004-05-27 10:52:19','Used in content editor'),('en','_template','syndicate_announcements',_binary 'Syndicate Announcements','2005-01-04 09:46:15',''),('en','_template','system_preferences',_binary 'System Preferences','2005-03-03 10:49:44',''),('en','_template','table_of_contents',_binary 'Page Contents','2010-10-07 10:42:38','preferences'),('en','_template','take_test',_binary 'Take Test','2003-05-22 13:54:16','MyTests'),('en','_template','tamil',_binary 'Tamil','2008-09-09 09:01:12',''),('en','_template','tech_support_forum',_binary 'Community Support Forum','2008-11-14 13:38:14','help'),('en','_template','tech_support_forum_text',_binary 'Support questions should be of a technical nature.','2005-07-05 14:13:20','help'),('en','_template','template',_binary 'Template','2006-09-25 13:07:42',''),('en','_template','tests',_binary 'Tests and Surveys','2010-06-25 14:02:12',''),('en','_template','test_anonymous',_binary 'This test/survey is anonymous.','2004-09-02 13:42:31',''),('en','_template','test_confirm_submit',_binary 'You are about to submit the test/survey.  Please note that changes are not allowed once the test/survey is submitted, do you want to proceed?','2010-05-07 10:53:46','test questions'),('en','_template','test_description',_binary 'Test Description','2008-03-10 11:50:11','Test/Survey Property'),('en','_template','test_import_package',_binary 'Import available tests.','2008-10-21 11:43:37',''),('en','_template','test_lk',_binary 'Likert','2004-08-12 15:55:22',''),('en','_template','test_ma',_binary 'Multiple Answer','2007-02-01 15:49:57',''),('en','_template','test_matching',_binary 'Matching (Simple)','2007-02-01 16:20:41',''),('en','_template','test_matchingdd',_binary 'Matching (Graphical)','2007-02-01 16:20:28',''),('en','_template','test_mc',_binary 'Multiple Choice','2003-05-22 14:03:29','test manager question type'),('en','_template','test_open',_binary 'Open Ended','2003-05-22 14:03:45','test manager question type'),('en','_template','test_ordering',_binary 'Ordering','2007-01-10 13:45:26',''),('en','_template','test_tf',_binary 'True or False','2003-05-22 14:09:05','test manager question type'),('en','_template','text',_binary 'Text','2004-04-20 16:40:07',''),('en','_template','textual',_binary 'Textual','2008-09-08 14:19:22',''),('en','_template','theme',_binary 'Theme','2004-04-23 15:26:57',''),('en','_template','themes',_binary 'Themes','2003-05-22 14:10:24','preferences'),('en','_template','themes_disabled',_binary 'The personal theme preference has been disabled in favour of theme specific categories.','2004-08-04 11:58:33',''),('en','_template','themes_for_desktop',_binary 'Themes for desktop computers','2010-06-18 15:45:59',''),('en','_template','themes_for_mobile',_binary 'Themes for mobile devices','2010-06-18 15:46:14',''),('en','_template','theme_screenshot',_binary 'Screenshot','2005-05-06 14:18:00','theme manager, screentshot alt/title'),('en','_template','theme_specific_categories',_binary 'Theme Specific Categories','2005-03-31 13:49:53',''),('en','_template','there_are_entries',_binary 'There are %s entries.','2009-05-27 12:01:11',''),('en','_template','thesaurus',_binary 'Thesaurus','2008-09-09 09:03:56',''),('en','_template','the_follow_errors_occurred',_binary 'The following errors occurred:','2005-03-07 12:41:09',''),('en','_template','things_current',_binary 'Current Activity','2013-11-17 15:09:50','my start page'),('en','_template','this_course_only',_binary 'This course only','2004-08-18 12:02:37',''),('en','_template','this_is_content',_binary 'This is a blank content page. Use Edit this Page in the Content Editor links above to modify this page. As the instructor of this course, you can manage it through the Manage tab above.','2010-10-19 10:16:29','default content insert when a new course is created'),('en','_template','thread',_binary 'Topic','2014-01-02 15:41:57','forums subscription email'),('en','_template','thread_already_subscribed',_binary 'You are already subscribed to this topic.','2014-01-02 15:42:05','forum view thread subscribe feedback'),('en','_template','thread_locked',_binary 'Topic Locked','2014-01-02 15:42:19','forum thread view thread lock message'),('en','_template','thread_notify1',_binary 'Topic Subscription','2014-01-02 15:42:31','Thread email notify subject'),('en','_template','thread_subscribe',_binary 'Subscribe to this topic to receive notification via email of replies.','2014-01-02 15:42:41','forum thread subscribe description'),('en','_template','tile_any_field',_binary 'Any Field','2004-05-03 13:14:02',''),('en','_template','tile_author',_binary 'Author','2004-05-03 13:14:17',''),('en','_template','tile_export',_binary 'Export content to the AContent repository. A valid AContent account is required.','2010-06-09 15:20:40',''),('en','_template','tile_howto',_binary 'Enter keywords to search AContent repository.','2010-06-09 15:21:01','tile search'),('en','_template','tile_import_content_package_about',_binary 'Import the content directly into this course.','2004-05-03 13:15:54',''),('en','_template','tile_keyword',_binary 'Keyword','2004-05-03 13:14:23',''),('en','_template','tile_not_accessible',_binary 'AContent repository is not accessible.','2010-06-09 15:21:48','tile search'),('en','_template','tile_no_response',_binary 'No response from AContent. It might because the course is too big to be auto-imported into AContent, or unknown problems occurred. Please download the ATutor package and manually import into AContent.','2010-07-12 11:48:07',''),('en','_template','tile_progress',_binary 'AContent Importing in Progress...','2010-06-09 15:22:31',''),('en','_template','tile_search',_binary 'AContent','2010-06-09 15:22:46',''),('en','_template','tile_search_text',_binary 'Search the content repository for additional learning materials. Use reserved keyword \"OR\" (must be capital) in between searching words for searching either one of several words.','2010-05-05 16:13:20',''),('en','_template','tile_setup',_binary 'AContent Setup','2010-06-09 15:17:05',''),('en','_template','tile_setup_txt',_binary 'Enter the location of the AContent repository (http://www.acontent.com) and the AContent web service ID. An AContent web service ID can be obtained by registering on an AContent system. Or, if already registered, it can be accessed from the AContent \"Profile\" page.','2010-06-09 15:19:49',''),('en','_template','tile_technical_format',_binary 'Technical Format','2004-05-03 13:14:51',''),('en','_template','timeout_minutes',_binary 'minutes','2013-01-31 11:48:32','system preferecnes'),('en','_template','times',_binary 'Times','2009-10-26 15:03:31',''),('en','_template','timestamp',_binary 'Timestamp','2004-12-06 12:04:30',''),('en','_template','time_spent',_binary 'Time Spent','2007-07-09 12:32:33',''),('en','_template','time_zone',_binary 'Time Zone (date below should match your local time)','2010-03-03 16:32:12','appears on the config page'),('en','_template','time_zones_not_supported',_binary 'Your server is not set-up to support time zones. See the Handbook for more details.','2006-11-01 13:06:40',''),('en','_template','title',_binary 'Title','2003-05-22 14:43:54','admin course manager column heading'),('en','_template','to',_binary 'To','2003-05-22 14:45:14','inbox send message \"to\" a user'),('en','_template','to1',_binary 'to','2003-05-22 14:48:13','login form header row login -to- some place'),('en','_template','toggle_disabled',_binary 'Toggle Disabled','2003-05-22 15:10:01','alt text for menu toggle'),('en','_template','toggle_main',_binary 'Toggle to open and close main navigation','2014-08-23 08:48:08',''),('en','_template','tools',_binary 'Tools','2006-03-22 12:52:10',''),('en','_template','tools_details',_binary 'Details for Tool Usage','2003-05-22 15:11:15','tracker'),('en','_template','tools_manager',_binary 'Add Activity','2009-10-22 16:17:01','content editor'),('en','_template','tool_manager',_binary 'Tool/Activity Manager','2009-11-19 16:12:28','core modules'),('en','_template','tool_man_comment',_binary 'Choose from the tools available in the course, to add activities to this content.','2009-11-05 12:29:40','content tool manager'),('en','_template','tool_settings',_binary 'Learner Supports','2010-04-12 16:29:59',''),('en','_template','tool_summary',_binary 'Tools Usage Summary','2003-05-22 15:11:26','tracker'),('en','_template','top',_binary 'Top','2003-05-22 15:11:53','global alt text for jump to top link/icon'),('en','_template','topic',_binary 'Topic','2003-05-22 15:12:45','forum thread list column heading'),('en','_template','top_20',_binary 'Only the top 20 results have been displayed.','2005-10-20 10:50:41',''),('en','_template','top_level',_binary 'Top Level','2005-03-16 13:36:35','content manager'),('en','_template','total',_binary 'Total','2003-05-22 15:14:13','instructor course statistic/details, test manager'),('en','_template','total_votes',_binary 'Total Votes','2005-03-11 15:51:33',''),('en','_template','to_2',_binary 'to','2003-05-22 15:15:16','test manager date'),('en','_template','to_email',_binary 'To Email','2003-05-22 15:17:02','help admin/instructor contact forms'),('en','_template','to_name',_binary 'To Name','2003-05-22 15:17:20','help admin/instructor contact forms'),('en','_template','tracker',_binary 'Content Tracker','2005-11-25 18:36:21',''),('en','_template','tracker_none_viewed',_binary 'No content pages have been viewed in this course yet.','2003-09-15 11:53:06','mytracker summary view'),('en','_template','tracker_not_viewed',_binary 'Jump to pages not yet viewed.','2003-09-13 12:16:10','mytracker bypass to not viewed alt text'),('en','_template','tracker_pages_total',_binary 'Total pages in this course %s (pages visited: %s.)','2003-09-13 09:11:43','tracker summary pages read'),('en','_template','tracker_percent_read',_binary 'Percentage of pages viewed %s.','2003-09-13 12:09:57','tracker pages read'),('en','_template','tracker_summary_read',_binary 'Summary of pages viewed by user %s.','2003-09-13 12:30:44','tracker summary read'),('en','_template','tracking',_binary 'Tracking','2003-05-22 15:18:11','admin course manager '),('en','_template','tracking_all_page_viewed',_binary 'All pages in this course have been viewed.','2003-09-13 12:37:23','mytracker page not viewed'),('en','_template','training_and_education',_binary 'Training and Education','2009-05-27 12:01:11',''),('en','_template','transformable_uri',_binary 'AContent URL','2010-06-09 15:32:25',''),('en','_template','translate',_binary 'Translate','2004-12-07 13:59:44','language manager translate button'),('en','_template','translate_lang_howto',_binary 'In order to translate a language you must : <br />\r\n1. Set the AT_DEVEL_TRANSLATE constant in /include/vitals.inc.php to \'1\' <br />\r\n2. Make sure that you have added the new language to the database<br />\r\n3. Select  the new language as the one you want to translate from the \'translate to:\' option at the bottom of the page<br />\r\n4. Use the translate button and translate the new language in a new window<br />','2004-12-10 16:29:48','Language Manager, translation message'),('en','_template','translate_to',_binary 'Translate to:','2003-05-22 15:19:14','footer'),('en','_template','true',_binary 'True','2003-05-22 15:19:50','test manager question answer option'),('en','_template','type',_binary 'Type','2003-05-22 15:20:30','test manager questions column heading'),('en','_template','unchecked',_binary 'Un-checked','2006-06-26 14:56:06',''),('en','_template','unconfirmed',_binary 'Unconfirmed','2005-04-01 10:39:51',''),('en','_template','underline',_binary 'Underline','2003-05-22 15:21:31','global code picker'),('en','_template','underscore',_binary 'Underscore','2004-06-22 12:09:46',''),('en','_template','unenroll',_binary 'Un-enroll','2004-10-15 11:51:25','unenroll button in enrollment manager'),('en','_template','unenrolled',_binary 'Un-enrolled','2004-10-15 11:50:06','unenrolled tab in enrollement manager'),('en','_template','unenroll_me',_binary 'Unenroll','2007-12-09 08:57:03',''),('en','_template','uninstall',_binary 'Uninstall','2008-10-21 15:41:53',''),('en','_template','uninstall_module_info',_binary 'You are about to <strong>UNINSTALL</strong> module <strong><em>%s</em></strong>.','2008-10-21 15:41:53',''),('en','_template','unique_visits',_binary 'Unique Visits','2005-03-01 12:41:13','tracker'),('en','_template','university',_binary 'School/Institution','2009-05-27 12:01:11',''),('en','_template','unknown',_binary 'Unknown','2003-06-06 10:41:35','links database , file upload progress window'),('en','_template','unknown_error',_binary 'An unknown error occured','2003-05-22 15:22:55','general catch all error message'),('en','_template','unlimited',_binary 'Unlimited','2005-03-01 11:22:02','admin course properties & file manager'),('en','_template','unlock_thread',_binary 'Unlock Topic','2014-01-02 15:42:55','forum instructor lock screen'),('en','_template','unmarked',_binary 'Unmarked','2003-05-22 15:25:33','mytests, test manager'),('en','_template','unmarked_label',_binary 'Unmarked (%s)','2005-05-12 10:25:56',''),('en','_template','unreleased',_binary 'Unreleased','2005-05-04 13:59:37',''),('en','_template','unshared_forums',_binary 'Unshared Forums','2004-11-05 10:50:02',''),('en','_template','unsubscribe',_binary 'UnSubscribe from this thread to cancel receiving notifications via email of new replies.','2003-11-06 13:47:20',''),('en','_template','unsubscribe1',_binary 'Unsubscribe','2004-12-02 15:32:28',''),('en','_template','until',_binary 'Until','2006-03-23 11:38:49',''),('en','_template','unvisited_pages',_binary 'You have not viewed the following pages:','2003-09-13 11:56:50','mytracker summary'),('en','_template','update',_binary 'Update','2004-11-24 14:28:45',''),('en','_template','updated',_binary 'Updated','2003-05-22 15:33:15','admin course manager'),('en','_template','update_gradebook',_binary 'Update ATutor Marks','2008-09-25 16:01:17','gradebook'),('en','_template','update_list',_binary 'Update List','2005-05-10 14:31:59',''),('en','_template','update_to',_binary 'Update To','2005-03-03 12:16:15',''),('en','_template','upload',_binary 'Upload','2003-05-22 15:56:16','global upload button/link text'),('en','_template','upload_backup',_binary 'Upload Backup','2008-05-20 12:44:13',''),('en','_template','upload_content_package',_binary 'Upload a Content Package or Common Cartridge','2009-11-16 10:54:04',''),('en','_template','upload_custom_logo',_binary 'Upload Custom Logo','2014-06-06 19:21:52',''),('en','_template','upload_file',_binary 'Upload File','2006-03-20 14:37:46',''),('en','_template','upload_files',_binary 'Upload files','2008-07-22 16:43:38','Used in filemanager and any place that uses fluid for multiple file upload.'),('en','_template','upload_icon',_binary 'Upload Custom Course Icon','2007-11-09 13:05:42','Course Properties Custom Icon'),('en','_template','upload_icon_text',_binary 'This icon will be uploaded to the file manager for this course under the folder \'/custom_icons\'.','2008-07-28 10:36:03','Course Properties Custom Icon Text'),('en','_template','upload_module',_binary 'Upload a module zip file to install it:','2008-11-05 08:48:45','Module installation message'),('en','_template','upload_new_picture',_binary 'Upload new picture','2007-02-26 17:23:08',''),('en','_template','upload_patch',_binary 'Upload a zip file to install patch:','2008-04-21 15:08:55','patcher'),('en','_template','upload_progress',_binary 'File Upload in Progress...','2003-06-06 10:36:38','file upload progress window'),('en','_template','upload_question',_binary 'Select Question Package to Upload','2008-09-23 14:00:24',''),('en','_template','upload_test',_binary 'Select Test Package to Upload','2008-09-23 13:58:43',''),('en','_template','upload_theme_package',_binary 'Upload a Theme','2004-10-18 15:09:32','Theme Manager'),('en','_template','upload_zip',_binary 'Choose a zip file to upload.','2016-01-02 10:48:00','patcher'),('en','_template','urdu',_binary 'Urdu','2008-09-09 09:01:12',''),('en','_template','url',_binary 'URL','2003-05-22 15:56:36','links database'),('en','_template','url_to_read',_binary 'URL To Read','2006-04-13 12:01:15',''),('en','_template','usage',_binary 'Usage','2005-03-16 13:55:31','content manager'),('en','_template','usaved_changes_made',_binary 'Unsaved changes made','2004-01-15 13:30:06','editing content'),('en','_template','user',_binary 'User','2003-05-22 15:59:34','links database'),('en','_template','username',_binary 'Username','2003-05-22 16:00:31','global username label/link text'),('en','_template','users',_binary 'Users','2003-05-22 16:02:26','forum, admin user manager'),('en','_template','users_online',_binary 'Users Online','2003-05-22 16:03:00','discussions page text'),('en','_template','user_contributed_notes',_binary 'User Contributed Handbook Notes','2005-07-27 12:01:52',''),('en','_template','user_offline',_binary 'Offline','2005-03-11 16:19:14','directory'),('en','_template','user_online',_binary 'Online','2005-03-11 16:19:28','directory'),('en','_template','user_type',_binary 'User Type','2008-10-06 13:41:48',''),('en','_template','use_alt_to_audio',_binary 'Use Alternative To Audio','2008-09-09 08:56:34',''),('en','_template','use_alt_to_text',_binary 'Use Alternative To Text','2008-09-09 08:56:34',''),('en','_template','use_alt_to_visual',_binary 'Use Alternative To Visual','2008-09-09 08:56:34',''),('en','_template','use_as_alternative',_binary 'Use As Alternative','2010-03-09 16:15:53','adapted content'),('en','_template','use_captcha',_binary 'Allow the use of CAPTCHA','2009-06-03 15:33:17',''),('en','_template','use_customized_head',_binary 'Turn on custom Scripts/CSS','2010-05-03 10:44:56',''),('en','_template','use_enrol_button',_binary 'Use the button below to enroll in this course.','2003-05-22 16:03:37','enrol screen instruction'),('en','_template','use_existing_logo',_binary 'Use Existing Logo','2014-03-02 10:41:20','admin custom logo'),('en','_template','use_higher_grade',_binary 'Use higher grade','2008-09-25 16:01:17','gradebook'),('en','_template','use_lower_grade',_binary 'Use lower grade','2008-09-25 16:01:17','gradebook'),('en','_template','use_parent_theme',_binary 'Use parent category\'s theme.','2004-08-04 11:34:41',''),('en','_template','use_system_time',_binary 'Use the system\'s time','2006-11-01 13:06:01',''),('en','_template','use_url_as_alternative',_binary 'Use a remote URL as an alternative','2010-06-18 13:28:40',''),('en','_template','use_visual_editor',_binary '<small style=\"text-decoration:underline;\">(Editor)</small>','2004-12-08 12:15:36','form editor in create test question'),('en','_template','version',_binary 'Version','2003-05-22 16:04:54','copyright notice in footer'),('en','_template','version_history',_binary 'Version History','2008-10-21 15:41:53',''),('en','_template','version_not_match',_binary 'This patch is for ATutor version %s. Does not match with your current ATutor version. The installation of it may break ATutor. Are you sure you want to proceed?','2008-06-19 13:20:45','patcher warning message'),('en','_template','vertical',_binary 'Vertical','2004-12-01 13:34:28','create/edit test question option'),('en','_template','view',_binary 'View','2004-02-16 15:23:09',''),('en','_template','viewing_errors',_binary 'Viewing Error(s)','2004-12-06 12:10:05',''),('en','_template','viewing_profile_bugs',_binary 'Viewing Profile Bugs','2004-12-06 12:03:33',''),('en','_template','view_all',_binary 'View All','2005-08-04 09:54:04',''),('en','_template','view_course_content',_binary 'View Course Content','2013-10-02 11:07:20','mobile'),('en','_template','view_details',_binary 'View Details','2005-03-11 11:27:43',''),('en','_template','view_entire_post',_binary 'View Entire Post','2003-05-22 16:07:57','forum message view'),('en','_template','view_groups',_binary 'View Group','2009-05-27 12:01:11',''),('en','_template','view_log',_binary 'View Activity Log','2005-03-03 10:44:12',''),('en','_template','view_mark_test',_binary 'View & Mark Test','2003-05-22 16:08:11','test manager'),('en','_template','view_message',_binary 'View Message','2005-03-14 11:48:21',''),('en','_template','view_profile_bugs',_binary 'View Profile Bugs','2004-12-06 11:51:58','admin/error_logging.php'),('en','_template','view_readme',_binary 'View Readme','2009-07-21 15:31:29',''),('en','_template','view_responses',_binary 'View Responses','2004-08-25 11:53:13',''),('en','_template','view_results',_binary 'View Results','2003-05-22 16:09:09','mytests, test manager'),('en','_template','view_selected_bugs',_binary 'View Selected Bugs','2004-12-06 12:06:26',''),('en','_template','view_sub_topics',_binary 'View subtopics','2005-03-16 13:35:47','content manager'),('en','_template','view_tracking',_binary 'View Tracking','2003-05-22 16:09:31','tracker'),('en','_template','vimeo',_binary 'Vimeo','2010-11-30 18:09:48','module name'),('en','_template','visitor_counts',_binary 'Visitor counts','2009-05-27 12:01:11',''),('en','_template','visits',_binary 'Visits','2003-09-13 09:19:09','tracker summary read'),('en','_template','visual',_binary 'Visual','2008-09-08 14:19:07',''),('en','_template','visual_editor',_binary 'Visual Editor','2006-11-23 13:31:56',''),('en','_template','vote_to_see_results',_binary 'Vote to see results.','2004-06-21 16:55:42',''),('en','_template','warning',_binary 'Warning','2003-05-22 16:09:47','text for warning message'),('en','_template','weblink',_binary 'Web Link','2009-10-22 16:18:13','content editor'),('en','_template','websites',_binary 'Websites','2009-05-27 12:01:11',''),('en','_template','web_service_id',_binary 'Web Service ID','2010-05-05 16:17:46',''),('en','_template','web_site',_binary 'Web Site','2003-05-22 16:10:20','registration, profile'),('en','_template','weight',_binary 'Weight','2003-05-22 16:10:31','test manager'),('en','_template','welcome_to_atutor',_binary 'Welcome To ATutor','2003-05-31 15:30:38','announcement default heading for new course'),('en','_template','white',_binary 'White','2008-09-09 09:01:13',''),('en','_template','window_auto_close',_binary 'This window will close automatically.','2003-06-06 10:37:43','file upload progress window'),('en','_template','workspace',_binary 'Workspace','2006-03-20 14:38:08',''),('en','_template','world_network',_binary 'World Network','2009-05-27 12:01:11',''),('en','_template','wrong_answer',_binary 'Wrong Answer','2003-05-22 16:11:51','test manager question editor'),('en','_template','wrong_request_token',_binary 'Mismatched request token from OAuth server.','2010-02-23 10:03:11','oauth client'),('en','_template','year',_binary 'Year','2004-06-24 15:45:35',''),('en','_template','yellow',_binary 'Yellow','2008-09-09 09:01:13',''),('en','_template','yes',_binary 'Yes','2005-03-03 10:18:48','preferences, admin course manager'),('en','_template','yes_delete',_binary 'Yes / Delete','2003-05-22 16:14:23','global delete response option'),('en','_template','your_applications',_binary 'My Gadgets','2009-05-27 12:01:11',''),('en','_template','your_mark',_binary 'Your Mark','2008-09-25 16:01:17','gradebook'),('en','_template','you_are_here',_binary 'You are here','2003-10-02 16:46:28','ALT text Global/Local Navigation link to self'),('en','_template','zip_archive',_binary 'Zip Archive','2003-05-22 16:20:01','file manager'),('en','_template','zip_file_manager',_binary 'Zip File Manager','2003-05-22 16:20:14','file manager'),('en','_template','zip_illegal_contents',_binary 'The contents of this archive are listed below. Illegal file types will not be extracted, and file names containing illegal characters will be translated.','2004-08-10 15:10:04',''),('en','_module','helpme',_binary 'HelpMe','2020-01-14 12:06:30',''),('en','_module','helpme_text',_binary 'The HelpMe module presents a short series of prompts for new Administrators and Instructors  to help them quickly learn to use ATutor effectively. Click on the checkbox below to enable or disable HelpMe. Use the HelpMe Language form below to modify the help messages presented to new users.','2020-01-14 12:06:30',''),('en','_module','helpme_disable',_binary 'Enable/Disable HelpMe','2020-01-14 12:06:30',''),('en','_module','helpme_dismiss',_binary 'Dismiss','2020-01-14 12:06:30',''),('en','_module','helpme_dismiss_all',_binary 'Dismiss All','2020-01-14 12:06:30',''),('en','_module','helpme_language',_binary 'HelpMe Language','2020-01-14 12:06:30',''),('en','_module','helpme_message',_binary 'Message','2020-01-14 12:06:30',''),('en','_msgs','AT_HELP_CREATE_A_COURSE',_binary 'You can <a href=\"%s\">Create a Course</a> by opening the Courses tab above, then opening the Create Course tab in the sub-menu that appears.','2020-01-14 12:06:30',''),('en','_msgs','AT_HELP_SYS_PREFS',_binary 'You will likely want to adjust the <a href=\"%s\">System Preferences</a> to match your requirements. Open the System Preferences tab above to modify ATutor settings.','2020-01-14 12:06:30',''),('en','_msgs','AT_HELP_DEFAULT_TOOLS',_binary 'You can adjust the <a href=\"%s\">Default Tools</a> that are setup in a newly created course by opening the Courses tab above, then opening the Default Tools tab in the sub-menu that appears.','2020-01-14 12:06:30',''),('en','_msgs','AT_HELP_ADMIN_CREATE_USER',_binary 'The administrator may want to <a href=\"%s\">Create Users</a>, or this can be left up to instructors using the Enrollment Manager, or students can register themselves if enabled in the System Preferences. Open the Users tab above, then open the Create User Account tab in the sub-menu.','2020-01-14 12:06:30',''),('en','_msgs','AT_HELP_USERS_PREFS',_binary 'The <a href=\"%s\">Default Preferences</a> can be adjusted to control settings for new users.  Open the Users tab above, then open the Default Preferences tab in the sub-menu that appears.','2020-01-14 12:06:30',''),('en','_msgs','AT_HELP_CHANGE_THEME',_binary 'The <a href=\"%s\">Theme Manager</a> can be used to change the appearance of ATutor, choosing from several themes provided with the system, or by uploading custom created themes. Open the System Preferences tab above, then open the Themes tab in the sub-menu.','2020-01-14 12:06:30',''),('en','_msgs','AT_HELP_MANAGE_MODULE',_binary 'The <a href=\"%s\">Module Manager</a> can be used manage the features installed and enabled on your ATutor system. Open the Modules Tab above to view the modules currently installed, and open the Add Module tab in the sub-menu to add new features, either importing from the main module repository, or uploading modules you have created yourself or downloaded from the Web.','2020-01-14 12:06:30',''),('en','_msgs','AT_HELP_APPLY_PATCHES',_binary 'It is important keep your ATutor installation up to date using the <a href=\"%s\">Patcher</a> to install bug fixes, security enhancements, and occassional feature adjustments. Open the Patcher tab above to review the patches installed on your system. If you are a developer, open the Create Patch tab in the sub-menu to create your own bug fixes or features that can be submitted and added to the public ATutor source code.','2020-01-14 12:06:30',''),('en','_msgs','AT_HELP_CREATE_ADMIN',_binary 'It can be helpful to <a href=\"%s\">Create Administrators</a> to perform specific tasks, assigning particular administrator tools to them to manage. Open the User tab above, then open the Administrator tab in the sub-menu.','2020-01-14 12:06:30',''),('en','_msgs','AT_HELP_READ_HANDBOOK',_binary 'For more about using ATutor see the %s in the links at the bottom of the screen. Enter a keyword search to find information about any feature. Also notice the context sensitive ATutor Handbook tab that often appears alongside or above various tools for specific information about using that tool, and notice the <a href=\"%s\">Help Page</a> in the upper right corner for community based help.','2020-01-14 12:06:30',''),('en','_msgs','AT_HELP_CREATE_COURSE',_binary 'You can <a href=\"%s\">Create a Course</a> by opening the My Courses tab above then opening the Create Course in the sub-menu that appears.','2020-01-14 12:06:30',''),('en','_msgs','AT_HELP_CREATE_CONTENT',_binary 'You can <a href=\"%s\">Create Content</a> for your course that includes movies, images, slides, documents or text, among other formats. Under the Manage tab above, open Create in the Content sub-menu to add new pages. Also notice the Content Navigation block to the side, and the small toobar their that can be used to quickly add folders or pages, and to edit the menu items below. Also notice the Editor Toolbar when viewing content, for quick access to all of content management tools. ','2020-01-14 12:06:30',''),('en','_msgs','AT_HELP_COURSE_TOOLS',_binary 'You can select from a range of <a href=\"%s\">Course Tools</a> to add particular features to a course. Tools can be added to the Main Tabs above, to the menu blocks at the side, or added as icons or boxes on the course home page. To manage the tools used in your course open the Manage tab above, then open the Course Tools sub-menu.','2020-01-14 12:06:30',''),('en','_msgs','AT_HELP_ADD_USERS',_binary 'After a course is setup and content added, the next step is often to <a href=\"%s\">Create a Course List</a>, and enroll students. Students can be enrolled manually typing them in one at a time, by importing a list in a CSV text file, by adding students from those registered on the system, or allowing students to enroll themselves. To add students to your course open the Manage tab above, then open the Enrollment sub-menu. ','2020-01-14 12:06:30',''),('en','_msgs','AT_HELP_COURSE_PROPERTIES',_binary 'Modify the initial <a href=\"%s\">Course Properties</a> that were set when the course was created. Open the Manage Tab above, then open the Properties sub-menu. ','2020-01-14 12:06:30',''),('en','_msgs','AT_HELP_CREATE_BACKUP',_binary 'To protect your course <a href=\"%s\">Create a Backup</a> that can be stored on your own computer, and restored in whole or in part whenever needed. Use backups to create a new session of a course, or to move a course to a different ATutor site. Also notice the tools for <a href=\"%s\">packaging content and tests</a>, and others for exporting test data or archiving forums as additional ways to backup your course.','2020-01-14 12:06:30','');
/*!40000 ALTER TABLE `AT_language_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_languages`
--

DROP TABLE IF EXISTS `AT_languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_languages` (
  `language_code` varchar(20) NOT NULL DEFAULT '',
  `char_set` varchar(80) NOT NULL DEFAULT '',
  `direction` varchar(16) NOT NULL DEFAULT '',
  `reg_exp` varchar(124) NOT NULL DEFAULT '',
  `native_name` varchar(80) NOT NULL DEFAULT '',
  `english_name` varchar(80) NOT NULL DEFAULT '',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`language_code`,`char_set`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_languages`
--

LOCK TABLES `AT_languages` WRITE;
/*!40000 ALTER TABLE `AT_languages` DISABLE KEYS */;
INSERT INTO `AT_languages` VALUES ('en','utf-8','ltr','en([-_][[:alpha:]]{2})?|english','English','English',3);
/*!40000 ALTER TABLE `AT_languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_links`
--

DROP TABLE IF EXISTS `AT_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_links` (
  `link_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `cat_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `Url` varchar(255) NOT NULL DEFAULT '',
  `LinkName` varchar(64) NOT NULL DEFAULT '',
  `Description` text,
  `Approved` tinyint(8) DEFAULT '0',
  `SubmitName` varchar(64) NOT NULL DEFAULT '',
  `SubmitEmail` varchar(64) NOT NULL DEFAULT '',
  `SubmitDate` date NOT NULL DEFAULT '0000-00-00',
  `hits` int(11) DEFAULT '0',
  PRIMARY KEY (`link_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_links`
--

LOCK TABLES `AT_links` WRITE;
/*!40000 ALTER TABLE `AT_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_links_categories`
--

DROP TABLE IF EXISTS `AT_links_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_links_categories` (
  `cat_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `owner_type` tinyint(4) NOT NULL DEFAULT '0',
  `owner_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `parent_id` mediumint(8) unsigned DEFAULT NULL,
  PRIMARY KEY (`cat_id`),
  KEY `owner_id` (`owner_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_links_categories`
--

LOCK TABLES `AT_links_categories` WRITE;
/*!40000 ALTER TABLE `AT_links_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_links_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_mail_queue`
--

DROP TABLE IF EXISTS `AT_mail_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_mail_queue` (
  `mail_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `to_email` varchar(50) NOT NULL DEFAULT '',
  `to_name` varchar(50) NOT NULL DEFAULT '',
  `from_email` varchar(50) NOT NULL DEFAULT '',
  `from_name` varchar(50) NOT NULL DEFAULT '',
  `char_set` varchar(20) NOT NULL DEFAULT '',
  `subject` varchar(255) NOT NULL,
  `body` text,
  PRIMARY KEY (`mail_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_mail_queue`
--

LOCK TABLES `AT_mail_queue` WRITE;
/*!40000 ALTER TABLE `AT_mail_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_mail_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_master_list`
--

DROP TABLE IF EXISTS `AT_master_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_master_list` (
  `public_field` char(30) NOT NULL DEFAULT '',
  `hash_field` char(40) NOT NULL DEFAULT '',
  `member_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`public_field`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_master_list`
--

LOCK TABLES `AT_master_list` WRITE;
/*!40000 ALTER TABLE `AT_master_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_master_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_member_login_attempt`
--

DROP TABLE IF EXISTS `AT_member_login_attempt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_member_login_attempt` (
  `login` varchar(20) NOT NULL,
  `attempt` tinyint(3) unsigned DEFAULT NULL,
  `expiry` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`login`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_member_login_attempt`
--

LOCK TABLES `AT_member_login_attempt` WRITE;
/*!40000 ALTER TABLE `AT_member_login_attempt` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_member_login_attempt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_member_track`
--

DROP TABLE IF EXISTS `AT_member_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_member_track` (
  `member_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `course_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `content_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `counter` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `duration` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `last_accessed` timestamp NULL DEFAULT NULL,
  KEY `member_id` (`member_id`),
  KEY `content_id` (`content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_member_track`
--

LOCK TABLES `AT_member_track` WRITE;
/*!40000 ALTER TABLE `AT_member_track` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_member_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_members`
--

DROP TABLE IF EXISTS `AT_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_members` (
  `member_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(20) NOT NULL DEFAULT '',
  `password` varchar(40) NOT NULL DEFAULT '',
  `email` varchar(50) NOT NULL DEFAULT '',
  `website` varchar(200) NOT NULL DEFAULT '',
  `first_name` varchar(100) NOT NULL,
  `second_name` varchar(100) NOT NULL DEFAULT '',
  `last_name` varchar(100) NOT NULL,
  `dob` date NOT NULL DEFAULT '0000-00-00',
  `gender` enum('m','f','n') NOT NULL DEFAULT 'n',
  `address` text,
  `postal` varchar(15) NOT NULL DEFAULT '',
  `city` varchar(100) NOT NULL DEFAULT '',
  `province` varchar(100) NOT NULL DEFAULT '',
  `country` varchar(100) NOT NULL DEFAULT '',
  `phone` varchar(15) NOT NULL DEFAULT '',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `preferences` text,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `language` varchar(5) NOT NULL DEFAULT '',
  `inbox_notify` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `private_email` tinyint(4) NOT NULL DEFAULT '1',
  `last_login` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`member_id`),
  UNIQUE KEY `login` (`login`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_members`
--

LOCK TABLES `AT_members` WRITE;
/*!40000 ALTER TABLE `AT_members` DISABLE KEYS */;
INSERT INTO `AT_members` VALUES (1,'teacher','e55c9b7dcb3eaf7f4239cdf5463d63e1a61d7681','teacher@vulncorp.local','','teacher','','teacher','0000-00-00','n','','','','','','',3,'','2020-01-14 12:06:59','en',0,1,'2020-01-14 14:53:42');
/*!40000 ALTER TABLE `AT_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_messages`
--

DROP TABLE IF EXISTS `AT_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_messages` (
  `message_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `from_member_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `to_member_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `date_sent` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `new` tinyint(4) NOT NULL DEFAULT '0',
  `replied` tinyint(4) NOT NULL DEFAULT '0',
  `subject` varchar(255) NOT NULL,
  `body` text,
  PRIMARY KEY (`message_id`),
  KEY `to_member_id` (`to_member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_messages`
--

LOCK TABLES `AT_messages` WRITE;
/*!40000 ALTER TABLE `AT_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_messages_sent`
--

DROP TABLE IF EXISTS `AT_messages_sent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_messages_sent` (
  `message_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `from_member_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `to_member_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `date_sent` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `subject` varchar(255) NOT NULL,
  `body` text,
  PRIMARY KEY (`message_id`),
  KEY `from_member_id` (`from_member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_messages_sent`
--

LOCK TABLES `AT_messages_sent` WRITE;
/*!40000 ALTER TABLE `AT_messages_sent` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_messages_sent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_modules`
--

DROP TABLE IF EXISTS `AT_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_modules` (
  `dir_name` varchar(50) NOT NULL DEFAULT '',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `privilege` bigint(20) unsigned NOT NULL DEFAULT '0',
  `admin_privilege` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `cron_interval` smallint(5) unsigned NOT NULL DEFAULT '0',
  `cron_last_run` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`dir_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_modules`
--

LOCK TABLES `AT_modules` WRITE;
/*!40000 ALTER TABLE `AT_modules` DISABLE KEYS */;
INSERT INTO `AT_modules` VALUES ('_core/properties',2,1,0,0,0),('_standard/statistics',2,1,0,0,0),('_core/content',2,2,0,0,0),('_core/glossary',2,4,0,0,0),('_standard/tests',2,8,0,0,0),('_standard/chat',2,16,0,0,0),('_core/file_manager',2,32,0,0,0),('_standard/links',2,64,0,0,0),('_standard/forums',2,128,16,0,0),('_standard/course_tools',2,256,0,0,0),('_core/enrolment',2,512,512,0,0),('_standard/course_email',2,1024,0,0,0),('_standard/announcements',2,2048,0,0,0),('_standard/polls',2,16384,0,0,0),('_standard/faq',2,32768,0,0,0),('_core/groups',2,65536,0,0,0),('_standard/reading_list',2,131072,0,0,0),('_standard/file_storage',2,262144,0,0,0),('_standard/assignments',2,524288,0,0,0),('_standard/gradebook',2,1048576,4096,0,0),('_standard/student_tools',2,2097152,0,0,0),('_standard/farchive',2,4194304,0,0,0),('_standard/social',2,8388608,0,0,0),('_standard/photos',2,16777216,0,0,0),('_standard/flowplayer',2,33554432,0,0,0),('_standard/basiclti',2,67108864,16384,0,0),('_standard/assignment_dropbox',2,134217728,0,0,0),('_standard/calendar',2,268435456,0,0,0),('_core/users',2,0,2,0,0),('_core/courses',2,0,4,0,0),('_core/backups',2,1,8,0,0),('_core/cats_categories',2,0,32,0,0),('_core/languages',2,0,64,1440,0),('_core/themes',2,0,128,0,0),('_standard/rss_feeds',2,0,256,0,0),('_standard/directory',2,0,0,0,0),('_standard/tile_search',2,0,0,0,0),('_standard/sitemap',2,0,0,0,0),('_standard/tracker',2,0,0,0,0),('_core/content_packaging',2,0,0,0,0),('_standard/google_search',2,0,0,0,0),('_standard/blogs',2,0,0,0,0),('_standard/profile_pictures',2,0,0,0,0),('_standard/patcher',2,0,1024,0,0),('_standard/support_tools',2,0,2048,0,0),('_core/tool_manager',2,0,0,0,0),('_core/modules',2,0,8192,0,0),('_standard/vimeo',2,0,1,0,0);
/*!40000 ALTER TABLE `AT_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_myown_patches`
--

DROP TABLE IF EXISTS `AT_myown_patches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_myown_patches` (
  `myown_patch_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `atutor_patch_id` varchar(20) NOT NULL DEFAULT '',
  `applied_version` varchar(10) NOT NULL DEFAULT '',
  `description` text,
  `sql_statement` text,
  `status` varchar(20) NOT NULL DEFAULT '',
  `last_modified` datetime NOT NULL,
  PRIMARY KEY (`myown_patch_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_myown_patches`
--

LOCK TABLES `AT_myown_patches` WRITE;
/*!40000 ALTER TABLE `AT_myown_patches` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_myown_patches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_myown_patches_dependent`
--

DROP TABLE IF EXISTS `AT_myown_patches_dependent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_myown_patches_dependent` (
  `myown_patches_dependent_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `myown_patch_id` mediumint(8) unsigned NOT NULL,
  `dependent_patch_id` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`myown_patches_dependent_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_myown_patches_dependent`
--

LOCK TABLES `AT_myown_patches_dependent` WRITE;
/*!40000 ALTER TABLE `AT_myown_patches_dependent` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_myown_patches_dependent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_myown_patches_files`
--

DROP TABLE IF EXISTS `AT_myown_patches_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_myown_patches_files` (
  `myown_patches_files_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `myown_patch_id` mediumint(8) unsigned NOT NULL,
  `action` varchar(20) NOT NULL DEFAULT '',
  `name` varchar(250) NOT NULL,
  `location` varchar(250) NOT NULL DEFAULT '',
  `code_from` text,
  `code_to` text,
  `uploaded_file` text,
  PRIMARY KEY (`myown_patches_files_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_myown_patches_files`
--

LOCK TABLES `AT_myown_patches_files` WRITE;
/*!40000 ALTER TABLE `AT_myown_patches_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_myown_patches_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_news`
--

DROP TABLE IF EXISTS `AT_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_news` (
  `news_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `member_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `formatting` tinyint(4) NOT NULL DEFAULT '0',
  `title` varchar(200) NOT NULL,
  `body` text,
  PRIMARY KEY (`news_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_news`
--

LOCK TABLES `AT_news` WRITE;
/*!40000 ALTER TABLE `AT_news` DISABLE KEYS */;
INSERT INTO `AT_news` VALUES (1,1,1,'2020-01-14 12:09:14',1,'Welcome To ATutor','This is a welcome announcement. You can access additional help by using the Help link available throughout ATutor.');
/*!40000 ALTER TABLE `AT_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_oauth_client_servers`
--

DROP TABLE IF EXISTS `AT_oauth_client_servers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_oauth_client_servers` (
  `oauth_server_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `oauth_server` varchar(255) NOT NULL DEFAULT '',
  `consumer_key` text,
  `consumer_secret` text,
  `expire_threshold` int(11) NOT NULL DEFAULT '0',
  `create_date` datetime NOT NULL,
  PRIMARY KEY (`oauth_server_id`),
  UNIQUE KEY `idx_consumer` (`oauth_server`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_oauth_client_servers`
--

LOCK TABLES `AT_oauth_client_servers` WRITE;
/*!40000 ALTER TABLE `AT_oauth_client_servers` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_oauth_client_servers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_oauth_client_tokens`
--

DROP TABLE IF EXISTS `AT_oauth_client_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_oauth_client_tokens` (
  `oauth_server_id` mediumint(8) unsigned NOT NULL,
  `token` varchar(50) NOT NULL DEFAULT '',
  `token_type` varchar(50) NOT NULL DEFAULT '',
  `token_secret` text,
  `member_id` mediumint(8) unsigned NOT NULL,
  `assign_date` datetime NOT NULL,
  PRIMARY KEY (`oauth_server_id`,`token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_oauth_client_tokens`
--

LOCK TABLES `AT_oauth_client_tokens` WRITE;
/*!40000 ALTER TABLE `AT_oauth_client_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_oauth_client_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_pa_album_comments`
--

DROP TABLE IF EXISTS `AT_pa_album_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_pa_album_comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `album_id` int(10) unsigned NOT NULL,
  `member_id` int(10) unsigned NOT NULL,
  `comment` text,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_pa_album_comments`
--

LOCK TABLES `AT_pa_album_comments` WRITE;
/*!40000 ALTER TABLE `AT_pa_album_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_pa_album_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_pa_albums`
--

DROP TABLE IF EXISTS `AT_pa_albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_pa_albums` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `description` text,
  `permission` tinyint(1) unsigned NOT NULL,
  `member_id` int(10) unsigned NOT NULL,
  `photo_id` int(10) unsigned NOT NULL,
  `type_id` tinyint(1) unsigned NOT NULL,
  `created_date` datetime NOT NULL,
  `last_updated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_pa_albums`
--

LOCK TABLES `AT_pa_albums` WRITE;
/*!40000 ALTER TABLE `AT_pa_albums` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_pa_albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_pa_course_album`
--

DROP TABLE IF EXISTS `AT_pa_course_album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_pa_course_album` (
  `course_id` int(10) unsigned NOT NULL DEFAULT '0',
  `album_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`course_id`,`album_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_pa_course_album`
--

LOCK TABLES `AT_pa_course_album` WRITE;
/*!40000 ALTER TABLE `AT_pa_course_album` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_pa_course_album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_pa_groups`
--

DROP TABLE IF EXISTS `AT_pa_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_pa_groups` (
  `group_id` int(10) unsigned NOT NULL,
  `album_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`group_id`,`album_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_pa_groups`
--

LOCK TABLES `AT_pa_groups` WRITE;
/*!40000 ALTER TABLE `AT_pa_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_pa_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_pa_photo_comments`
--

DROP TABLE IF EXISTS `AT_pa_photo_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_pa_photo_comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `photo_id` int(10) unsigned NOT NULL,
  `member_id` int(10) unsigned NOT NULL,
  `comment` text,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_pa_photo_comments`
--

LOCK TABLES `AT_pa_photo_comments` WRITE;
/*!40000 ALTER TABLE `AT_pa_photo_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_pa_photo_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_pa_photos`
--

DROP TABLE IF EXISTS `AT_pa_photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_pa_photos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text,
  `alt_text` text,
  `member_id` int(10) unsigned NOT NULL,
  `album_id` int(10) unsigned NOT NULL,
  `ordering` smallint(5) unsigned NOT NULL,
  `created_date` datetime NOT NULL,
  `last_updated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_pa_photos`
--

LOCK TABLES `AT_pa_photos` WRITE;
/*!40000 ALTER TABLE `AT_pa_photos` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_pa_photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_patches`
--

DROP TABLE IF EXISTS `AT_patches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_patches` (
  `patches_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `atutor_patch_id` varchar(20) NOT NULL DEFAULT '',
  `applied_version` varchar(10) NOT NULL DEFAULT '',
  `patch_folder` varchar(250) NOT NULL DEFAULT '',
  `description` text,
  `available_to` varchar(250) NOT NULL DEFAULT '',
  `sql_statement` text,
  `status` varchar(20) NOT NULL DEFAULT '',
  `remove_permission_files` text,
  `backup_files` text,
  `patch_files` text,
  `author` varchar(255) NOT NULL,
  `installed_date` datetime NOT NULL,
  PRIMARY KEY (`patches_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_patches`
--

LOCK TABLES `AT_patches` WRITE;
/*!40000 ALTER TABLE `AT_patches` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_patches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_patches_files`
--

DROP TABLE IF EXISTS `AT_patches_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_patches_files` (
  `patches_files_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `patches_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `action` varchar(20) NOT NULL DEFAULT '',
  `name` text,
  `location` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`patches_files_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_patches_files`
--

LOCK TABLES `AT_patches_files` WRITE;
/*!40000 ALTER TABLE `AT_patches_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_patches_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_patches_files_actions`
--

DROP TABLE IF EXISTS `AT_patches_files_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_patches_files_actions` (
  `patches_files_actions_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `patches_files_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `action` varchar(20) NOT NULL DEFAULT '',
  `code_from` text,
  `code_to` text,
  PRIMARY KEY (`patches_files_actions_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_patches_files_actions`
--

LOCK TABLES `AT_patches_files_actions` WRITE;
/*!40000 ALTER TABLE `AT_patches_files_actions` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_patches_files_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_polls`
--

DROP TABLE IF EXISTS `AT_polls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_polls` (
  `poll_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `question` varchar(255) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `total` smallint(5) unsigned NOT NULL DEFAULT '0',
  `choice1` varchar(255) NOT NULL,
  `count1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `choice2` varchar(255) NOT NULL,
  `count2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `choice3` varchar(255) NOT NULL,
  `count3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `choice4` varchar(255) NOT NULL,
  `count4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `choice5` varchar(255) NOT NULL,
  `count5` smallint(5) unsigned NOT NULL DEFAULT '0',
  `choice6` varchar(255) NOT NULL,
  `count6` smallint(5) unsigned NOT NULL DEFAULT '0',
  `choice7` varchar(255) NOT NULL,
  `count7` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`poll_id`),
  KEY `course_id` (`course_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_polls`
--

LOCK TABLES `AT_polls` WRITE;
/*!40000 ALTER TABLE `AT_polls` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_polls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_polls_members`
--

DROP TABLE IF EXISTS `AT_polls_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_polls_members` (
  `poll_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `member_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`poll_id`,`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_polls_members`
--

LOCK TABLES `AT_polls_members` WRITE;
/*!40000 ALTER TABLE `AT_polls_members` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_polls_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_primary_resources`
--

DROP TABLE IF EXISTS `AT_primary_resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_primary_resources` (
  `primary_resource_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `content_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `resource` text,
  `language_code` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`primary_resource_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_primary_resources`
--

LOCK TABLES `AT_primary_resources` WRITE;
/*!40000 ALTER TABLE `AT_primary_resources` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_primary_resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_primary_resources_types`
--

DROP TABLE IF EXISTS `AT_primary_resources_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_primary_resources_types` (
  `primary_resource_id` mediumint(8) unsigned NOT NULL,
  `type_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`primary_resource_id`,`type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_primary_resources_types`
--

LOCK TABLES `AT_primary_resources_types` WRITE;
/*!40000 ALTER TABLE `AT_primary_resources_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_primary_resources_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_reading_list`
--

DROP TABLE IF EXISTS `AT_reading_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_reading_list` (
  `reading_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `resource_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `required` enum('required','optional') NOT NULL DEFAULT 'required',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  `comment` text,
  PRIMARY KEY (`reading_id`),
  KEY `course_id` (`course_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_reading_list`
--

LOCK TABLES `AT_reading_list` WRITE;
/*!40000 ALTER TABLE `AT_reading_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_reading_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_related_content`
--

DROP TABLE IF EXISTS `AT_related_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_related_content` (
  `content_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `related_content_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`content_id`,`related_content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_related_content`
--

LOCK TABLES `AT_related_content` WRITE;
/*!40000 ALTER TABLE `AT_related_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_related_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_resource_types`
--

DROP TABLE IF EXISTS `AT_resource_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_resource_types` (
  `type_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `type` text,
  PRIMARY KEY (`type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_resource_types`
--

LOCK TABLES `AT_resource_types` WRITE;
/*!40000 ALTER TABLE `AT_resource_types` DISABLE KEYS */;
INSERT INTO `AT_resource_types` VALUES (1,'auditory'),(2,'sign_language'),(3,'textual'),(4,'visual');
/*!40000 ALTER TABLE `AT_resource_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_secondary_resources`
--

DROP TABLE IF EXISTS `AT_secondary_resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_secondary_resources` (
  `secondary_resource_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `primary_resource_id` mediumint(8) unsigned NOT NULL,
  `secondary_resource` text,
  `language_code` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`secondary_resource_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_secondary_resources`
--

LOCK TABLES `AT_secondary_resources` WRITE;
/*!40000 ALTER TABLE `AT_secondary_resources` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_secondary_resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_secondary_resources_types`
--

DROP TABLE IF EXISTS `AT_secondary_resources_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_secondary_resources_types` (
  `secondary_resource_id` mediumint(8) unsigned NOT NULL,
  `type_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`secondary_resource_id`,`type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_secondary_resources_types`
--

LOCK TABLES `AT_secondary_resources_types` WRITE;
/*!40000 ALTER TABLE `AT_secondary_resources_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_secondary_resources_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_social_activities`
--

DROP TABLE IF EXISTS `AT_social_activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_social_activities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(10) unsigned NOT NULL,
  `application_id` int(10) unsigned NOT NULL,
  `title` text,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_social_activities`
--

LOCK TABLES `AT_social_activities` WRITE;
/*!40000 ALTER TABLE `AT_social_activities` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_social_activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_social_application_settings`
--

DROP TABLE IF EXISTS `AT_social_application_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_social_application_settings` (
  `application_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` text,
  PRIMARY KEY (`application_id`,`member_id`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_social_application_settings`
--

LOCK TABLES `AT_social_application_settings` WRITE;
/*!40000 ALTER TABLE `AT_social_application_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_social_application_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_social_applications`
--

DROP TABLE IF EXISTS `AT_social_applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_social_applications` (
  `id` int(10) unsigned DEFAULT NULL,
  `url` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL,
  `height` int(10) unsigned DEFAULT NULL,
  `scrolling` int(10) unsigned DEFAULT NULL,
  `screenshot` varchar(255) NOT NULL,
  `thumbnail` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `author_email` varchar(128) NOT NULL,
  `description` text,
  `settings` text,
  `views` text,
  `last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`url`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_social_applications`
--

LOCK TABLES `AT_social_applications` WRITE;
/*!40000 ALTER TABLE `AT_social_applications` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_social_applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_social_friend_requests`
--

DROP TABLE IF EXISTS `AT_social_friend_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_social_friend_requests` (
  `member_id` int(10) unsigned NOT NULL,
  `friend_id` int(10) unsigned NOT NULL,
  `relationship` int(10) unsigned NOT NULL,
  PRIMARY KEY (`member_id`,`friend_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_social_friend_requests`
--

LOCK TABLES `AT_social_friend_requests` WRITE;
/*!40000 ALTER TABLE `AT_social_friend_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_social_friend_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_social_friends`
--

DROP TABLE IF EXISTS `AT_social_friends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_social_friends` (
  `member_id` int(10) unsigned NOT NULL,
  `friend_id` int(10) unsigned NOT NULL,
  `relationship` int(10) unsigned NOT NULL,
  PRIMARY KEY (`member_id`,`friend_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_social_friends`
--

LOCK TABLES `AT_social_friends` WRITE;
/*!40000 ALTER TABLE `AT_social_friends` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_social_friends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_social_groups`
--

DROP TABLE IF EXISTS `AT_social_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_social_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(10) unsigned NOT NULL,
  `type_id` int(10) unsigned NOT NULL,
  `privacy` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `description` text,
  `created_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_social_groups`
--

LOCK TABLES `AT_social_groups` WRITE;
/*!40000 ALTER TABLE `AT_social_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_social_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_social_groups_activities`
--

DROP TABLE IF EXISTS `AT_social_groups_activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_social_groups_activities` (
  `activity_id` int(10) unsigned NOT NULL,
  `group_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`activity_id`,`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_social_groups_activities`
--

LOCK TABLES `AT_social_groups_activities` WRITE;
/*!40000 ALTER TABLE `AT_social_groups_activities` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_social_groups_activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_social_groups_board`
--

DROP TABLE IF EXISTS `AT_social_groups_board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_social_groups_board` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(10) unsigned NOT NULL,
  `group_id` int(10) unsigned NOT NULL,
  `body` text,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_social_groups_board`
--

LOCK TABLES `AT_social_groups_board` WRITE;
/*!40000 ALTER TABLE `AT_social_groups_board` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_social_groups_board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_social_groups_invitations`
--

DROP TABLE IF EXISTS `AT_social_groups_invitations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_social_groups_invitations` (
  `sender_id` int(10) unsigned NOT NULL,
  `member_id` int(10) unsigned NOT NULL,
  `group_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`sender_id`,`member_id`,`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_social_groups_invitations`
--

LOCK TABLES `AT_social_groups_invitations` WRITE;
/*!40000 ALTER TABLE `AT_social_groups_invitations` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_social_groups_invitations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_social_groups_members`
--

DROP TABLE IF EXISTS `AT_social_groups_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_social_groups_members` (
  `group_id` int(10) unsigned NOT NULL,
  `member_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`group_id`,`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_social_groups_members`
--

LOCK TABLES `AT_social_groups_members` WRITE;
/*!40000 ALTER TABLE `AT_social_groups_members` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_social_groups_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_social_groups_requests`
--

DROP TABLE IF EXISTS `AT_social_groups_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_social_groups_requests` (
  `sender_id` int(10) unsigned NOT NULL,
  `member_id` int(10) unsigned NOT NULL,
  `group_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`sender_id`,`member_id`,`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_social_groups_requests`
--

LOCK TABLES `AT_social_groups_requests` WRITE;
/*!40000 ALTER TABLE `AT_social_groups_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_social_groups_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_social_groups_types`
--

DROP TABLE IF EXISTS `AT_social_groups_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_social_groups_types` (
  `type_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(127) NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_social_groups_types`
--

LOCK TABLES `AT_social_groups_types` WRITE;
/*!40000 ALTER TABLE `AT_social_groups_types` DISABLE KEYS */;
INSERT INTO `AT_social_groups_types` VALUES (1,'business'),(2,'common_interest'),(3,'entertainment_arts'),(4,'geography'),(5,'internet_technology'),(6,'organization'),(7,'music'),(8,'sports_recreation');
/*!40000 ALTER TABLE `AT_social_groups_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_social_member_additional_information`
--

DROP TABLE IF EXISTS `AT_social_member_additional_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_social_member_additional_information` (
  `member_id` int(10) unsigned NOT NULL,
  `expertise` varchar(255) NOT NULL,
  `interests` text,
  `associations` text,
  `awards` text,
  `others` text,
  PRIMARY KEY (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_social_member_additional_information`
--

LOCK TABLES `AT_social_member_additional_information` WRITE;
/*!40000 ALTER TABLE `AT_social_member_additional_information` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_social_member_additional_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_social_member_contact`
--

DROP TABLE IF EXISTS `AT_social_member_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_social_member_contact` (
  `contact_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(10) unsigned NOT NULL,
  `con_name` varchar(200) NOT NULL,
  `con_phone` varchar(15) NOT NULL,
  `con_email` varchar(50) NOT NULL,
  `con_address` text,
  PRIMARY KEY (`contact_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_social_member_contact`
--

LOCK TABLES `AT_social_member_contact` WRITE;
/*!40000 ALTER TABLE `AT_social_member_contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_social_member_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_social_member_education`
--

DROP TABLE IF EXISTS `AT_social_member_education`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_social_member_education` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(10) unsigned NOT NULL,
  `university` varchar(255) NOT NULL,
  `country` varchar(128) DEFAULT NULL,
  `province` varchar(128) DEFAULT NULL,
  `degree` varchar(64) DEFAULT NULL,
  `field` varchar(64) DEFAULT NULL,
  `from` varchar(10) NOT NULL DEFAULT '0',
  `to` varchar(10) NOT NULL DEFAULT '0',
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_social_member_education`
--

LOCK TABLES `AT_social_member_education` WRITE;
/*!40000 ALTER TABLE `AT_social_member_education` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_social_member_education` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_social_member_personal`
--

DROP TABLE IF EXISTS `AT_social_member_personal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_social_member_personal` (
  `per_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(10) unsigned NOT NULL,
  `per_weight` varchar(200) NOT NULL,
  `per_height` varchar(50) NOT NULL,
  `per_hair` varchar(15) NOT NULL,
  `per_eyes` varchar(50) NOT NULL,
  `per_ethnicity` varchar(50) NOT NULL,
  `per_languages` varchar(255) NOT NULL,
  `per_disabilities` varchar(255) NOT NULL,
  PRIMARY KEY (`per_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_social_member_personal`
--

LOCK TABLES `AT_social_member_personal` WRITE;
/*!40000 ALTER TABLE `AT_social_member_personal` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_social_member_personal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_social_member_position`
--

DROP TABLE IF EXISTS `AT_social_member_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_social_member_position` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(10) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `company` varchar(255) NOT NULL,
  `from` varchar(10) NOT NULL DEFAULT '0',
  `to` varchar(10) NOT NULL DEFAULT '0',
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_social_member_position`
--

LOCK TABLES `AT_social_member_position` WRITE;
/*!40000 ALTER TABLE `AT_social_member_position` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_social_member_position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_social_member_representation`
--

DROP TABLE IF EXISTS `AT_social_member_representation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_social_member_representation` (
  `rep_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(10) unsigned NOT NULL,
  `rep_name` varchar(200) NOT NULL,
  `rep_title` varchar(50) NOT NULL,
  `rep_phone` varchar(15) NOT NULL,
  `rep_email` varchar(50) NOT NULL,
  `rep_address` text,
  PRIMARY KEY (`rep_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_social_member_representation`
--

LOCK TABLES `AT_social_member_representation` WRITE;
/*!40000 ALTER TABLE `AT_social_member_representation` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_social_member_representation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_social_member_track`
--

DROP TABLE IF EXISTS `AT_social_member_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_social_member_track` (
  `member_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `visitor_id` int(10) unsigned NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`member_id`,`visitor_id`,`timestamp`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_social_member_track`
--

LOCK TABLES `AT_social_member_track` WRITE;
/*!40000 ALTER TABLE `AT_social_member_track` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_social_member_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_social_member_websites`
--

DROP TABLE IF EXISTS `AT_social_member_websites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_social_member_websites` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(10) unsigned NOT NULL,
  `url` varchar(255) NOT NULL,
  `site_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_social_member_websites`
--

LOCK TABLES `AT_social_member_websites` WRITE;
/*!40000 ALTER TABLE `AT_social_member_websites` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_social_member_websites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_social_members_applications`
--

DROP TABLE IF EXISTS `AT_social_members_applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_social_members_applications` (
  `member_id` int(10) unsigned NOT NULL,
  `application_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`member_id`,`application_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_social_members_applications`
--

LOCK TABLES `AT_social_members_applications` WRITE;
/*!40000 ALTER TABLE `AT_social_members_applications` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_social_members_applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_social_privacy_preferences`
--

DROP TABLE IF EXISTS `AT_social_privacy_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_social_privacy_preferences` (
  `member_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `preferences` text,
  PRIMARY KEY (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_social_privacy_preferences`
--

LOCK TABLES `AT_social_privacy_preferences` WRITE;
/*!40000 ALTER TABLE `AT_social_privacy_preferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_social_privacy_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_social_user_settings`
--

DROP TABLE IF EXISTS `AT_social_user_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_social_user_settings` (
  `member_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `app_settings` text,
  PRIMARY KEY (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_social_user_settings`
--

LOCK TABLES `AT_social_user_settings` WRITE;
/*!40000 ALTER TABLE `AT_social_user_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_social_user_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_tests`
--

DROP TABLE IF EXISTS `AT_tests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_tests` (
  `test_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `format` tinyint(4) NOT NULL DEFAULT '0',
  `start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `randomize_order` tinyint(4) NOT NULL DEFAULT '0',
  `num_questions` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `instructions` text,
  `content_id` mediumint(8) NOT NULL DEFAULT '0',
  `result_release` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `random` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `difficulty` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `num_takes` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `anonymous` tinyint(4) NOT NULL DEFAULT '0',
  `out_of` varchar(4) NOT NULL DEFAULT '',
  `guests` tinyint(4) NOT NULL DEFAULT '0',
  `display` tinyint(4) NOT NULL DEFAULT '0',
  `description` text,
  `passscore` mediumint(9) NOT NULL DEFAULT '0',
  `passpercent` mediumint(9) NOT NULL DEFAULT '0',
  `passfeedback` text,
  `failfeedback` text,
  `show_guest_form` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `remedial_content` tinyint(1) unsigned DEFAULT '0',
  PRIMARY KEY (`test_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_tests`
--

LOCK TABLES `AT_tests` WRITE;
/*!40000 ALTER TABLE `AT_tests` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_tests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_tests_answers`
--

DROP TABLE IF EXISTS `AT_tests_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_tests_answers` (
  `result_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `question_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `member_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `answer` text,
  `score` varchar(5) NOT NULL DEFAULT '',
  `notes` text,
  PRIMARY KEY (`result_id`,`question_id`,`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_tests_answers`
--

LOCK TABLES `AT_tests_answers` WRITE;
/*!40000 ALTER TABLE `AT_tests_answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_tests_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_tests_groups`
--

DROP TABLE IF EXISTS `AT_tests_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_tests_groups` (
  `test_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `group_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`test_id`,`group_id`),
  KEY `test_id` (`test_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_tests_groups`
--

LOCK TABLES `AT_tests_groups` WRITE;
/*!40000 ALTER TABLE `AT_tests_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_tests_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_tests_questions`
--

DROP TABLE IF EXISTS `AT_tests_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_tests_questions` (
  `question_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `course_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `feedback` text,
  `question` text,
  `choice_0` text,
  `choice_1` text,
  `choice_2` text,
  `choice_3` text,
  `choice_4` text,
  `choice_5` text,
  `choice_6` text,
  `choice_7` text,
  `choice_8` text,
  `choice_9` text,
  `answer_0` tinyint(4) NOT NULL DEFAULT '0',
  `answer_1` tinyint(4) NOT NULL DEFAULT '0',
  `answer_2` tinyint(4) NOT NULL DEFAULT '0',
  `answer_3` tinyint(4) NOT NULL DEFAULT '0',
  `answer_4` tinyint(4) NOT NULL DEFAULT '0',
  `answer_5` tinyint(4) NOT NULL DEFAULT '0',
  `answer_6` tinyint(4) NOT NULL DEFAULT '0',
  `answer_7` tinyint(4) NOT NULL DEFAULT '0',
  `answer_8` tinyint(4) NOT NULL DEFAULT '0',
  `answer_9` tinyint(4) NOT NULL DEFAULT '0',
  `option_0` text,
  `option_1` text,
  `option_2` text,
  `option_3` text,
  `option_4` text,
  `option_5` text,
  `option_6` text,
  `option_7` text,
  `option_8` text,
  `option_9` text,
  `properties` tinyint(4) NOT NULL DEFAULT '0',
  `content_id` mediumint(8) NOT NULL,
  `remedial_content` text,
  PRIMARY KEY (`question_id`),
  KEY `category_id` (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_tests_questions`
--

LOCK TABLES `AT_tests_questions` WRITE;
/*!40000 ALTER TABLE `AT_tests_questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_tests_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_tests_questions_assoc`
--

DROP TABLE IF EXISTS `AT_tests_questions_assoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_tests_questions_assoc` (
  `test_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `question_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `weight` varchar(4) NOT NULL DEFAULT '',
  `ordering` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `required` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`test_id`,`question_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_tests_questions_assoc`
--

LOCK TABLES `AT_tests_questions_assoc` WRITE;
/*!40000 ALTER TABLE `AT_tests_questions_assoc` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_tests_questions_assoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_tests_questions_categories`
--

DROP TABLE IF EXISTS `AT_tests_questions_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_tests_questions_categories` (
  `category_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `title` char(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`category_id`),
  KEY `course_id` (`course_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_tests_questions_categories`
--

LOCK TABLES `AT_tests_questions_categories` WRITE;
/*!40000 ALTER TABLE `AT_tests_questions_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_tests_questions_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_tests_results`
--

DROP TABLE IF EXISTS `AT_tests_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_tests_results` (
  `result_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `test_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `member_id` varchar(10) NOT NULL DEFAULT '',
  `date_taken` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `final_score` char(5) NOT NULL DEFAULT '',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `max_pos` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`result_id`),
  KEY `test_id` (`test_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_tests_results`
--

LOCK TABLES `AT_tests_results` WRITE;
/*!40000 ALTER TABLE `AT_tests_results` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_tests_results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_themes`
--

DROP TABLE IF EXISTS `AT_themes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_themes` (
  `title` varchar(80) NOT NULL DEFAULT '',
  `version` varchar(10) NOT NULL DEFAULT '',
  `dir_name` varchar(20) NOT NULL DEFAULT '',
  `type` varchar(20) NOT NULL DEFAULT 'Desktop',
  `last_updated` date NOT NULL DEFAULT '0000-00-00',
  `extra_info` text,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `customized` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_themes`
--

LOCK TABLES `AT_themes` WRITE;
/*!40000 ALTER TABLE `AT_themes` DISABLE KEYS */;
INSERT INTO `AT_themes` VALUES ('ATutor','2.2.2','default','Desktop','2020-01-14','This is the default ATutor theme and cannot be deleted as other themes inherit from it. Please do not alter this theme directly as it would complicate upgrading. Instead, create a new theme derived from this one.',2,0),('ATutor 2.1','2.2.2','default21','Desktop','2020-01-14','This is the ATutor 2.1 series defailt theme.',1,0),('Fluid','2.2.2','fluid','Desktop','2020-01-14','Theme that implements the Fluid reorderer used to drag-and-drop the menu from side-to-side.',1,0),('ATutor Classic','2.2.2','default_classic','Desktop','2020-01-14','This is the ATutor Classic theme which makes use of the custom Header and logo images. To customize those images you must edit the <code>theme.cfg.php</code> in this themes directory.',1,0),('Blumin','2.2.2','blumin','Desktop','2020-01-14','This is the plone look-alike theme.',1,0),('Greenmin','2.2.2','greenmin','Desktop','2020-01-14','This is the plone look-alike theme in green.',1,0),('ATutor 2.0','2.2.2','default20','Desktop','2020-01-14','This is the ATutor 2.0 series Default theme.',1,0),('ATutor 1.5','2.2.2','default15','Desktop','2020-01-14','This is the 1.5 series default theme.',1,0),('ATutor 1.6','2.2.2','default16','Desktop','2020-01-14','This is the 1.6 series default theme.',1,0),('IDI Theme','2.2.2','idi','Desktop','2020-01-14','The theme created for the IDI course server.',1,0),('Mobile','2.2.2','mobile','Mobile','2020-01-14','This is the default theme for mobile devices.',3,0),('Simple','2.2.2','simplified_desktop','Desktop','2020-01-14','An adapted version of the iPad theme, designed to make a desktop look like an iPad.',1,0),('ATutorSpaces','2.2.2','atspaces','Desktop','2020-01-14','This is the default theme for the ATutorSpaces.com hosting service.',1,0);
/*!40000 ALTER TABLE `AT_themes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AT_users_online`
--

DROP TABLE IF EXISTS `AT_users_online`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AT_users_online` (
  `member_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `course_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `login` varchar(255) NOT NULL DEFAULT '',
  `expiry` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`member_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 MAX_ROWS=500;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AT_users_online`
--

LOCK TABLES `AT_users_online` WRITE;
/*!40000 ALTER TABLE `AT_users_online` DISABLE KEYS */;
/*!40000 ALTER TABLE `AT_users_online` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'atutor'
--

--
-- Dumping routines for database 'atutor'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-14 16:11:29

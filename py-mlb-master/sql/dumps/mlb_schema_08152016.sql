CREATE DATABASE  IF NOT EXISTS `mlb` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `mlb`;
-- MySQL dump 10.13  Distrib 5.6.13, for osx10.6 (i386)
--
-- Host: localhost    Database: mlb
-- ------------------------------------------------------
-- Server version	5.5.51

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
-- Table structure for table `log_batter`
--

DROP TABLE IF EXISTS `log_batter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_batter` (
  `player_id` int(11) NOT NULL DEFAULT '0',
  `game_id` varchar(100) NOT NULL DEFAULT '',
  `game_date` date DEFAULT NULL,
  `game_type` char(1) DEFAULT '',
  `date` varchar(35) DEFAULT '',
  `game_pk` int(11) DEFAULT NULL,
  `opp` varchar(3) DEFAULT '',
  `opp_team_id` int(11) DEFAULT '0',
  `opp_team_display_full` varchar(35) DEFAULT '',
  `opp_team_display_short` varchar(35) DEFAULT '',
  `home_away` enum('H','A') DEFAULT NULL,
  `bb` int(11) DEFAULT '0',
  `hr` int(11) DEFAULT '0',
  `ibb` int(11) DEFAULT '0',
  `cs` int(11) DEFAULT '0',
  `go_ao` double DEFAULT '0',
  `hbp` int(11) DEFAULT '0',
  `tb` int(11) DEFAULT '0',
  `h3b` int(11) DEFAULT '0',
  `ab` int(11) DEFAULT '0',
  `h` int(11) DEFAULT '0',
  `ao` int(11) DEFAULT '0',
  `r` int(11) DEFAULT '0',
  `rbi` int(11) DEFAULT '0',
  `go` int(11) DEFAULT '0',
  `slg` double DEFAULT '0',
  `obp` double DEFAULT '0',
  `ops` double DEFAULT '0',
  `so` int(11) DEFAULT '0',
  `sb` int(11) DEFAULT '0',
  `avg` double DEFAULT '0',
  `h2b` int(11) DEFAULT '0',
  `sac` int(11) DEFAULT '0',
  `team_score` int(11) DEFAULT '0',
  `opp_score` int(11) DEFAULT '0',
  `lob` int(11) DEFAULT '0',
  `d` int(11) DEFAULT '0',
  `team_result` enum('W','L') DEFAULT NULL,
  `t` int(11) DEFAULT '0',
  `sf` int(11) DEFAULT '0',
  PRIMARY KEY (`game_id`,`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log_pitcher`
--

DROP TABLE IF EXISTS `log_pitcher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_pitcher` (
  `player_id` int(11) NOT NULL DEFAULT '0',
  `game_id` varchar(100) NOT NULL DEFAULT '',
  `game_date` date DEFAULT NULL,
  `game_type` char(1) DEFAULT '',
  `date` varchar(35) DEFAULT '',
  `game_pk` int(11) DEFAULT NULL,
  `opp` varchar(3) DEFAULT '',
  `opp_team_id` int(11) DEFAULT '0',
  `opp_team_display_full` varchar(35) DEFAULT '',
  `opp_team_display_short` varchar(35) DEFAULT '',
  `home_away` enum('H','A') DEFAULT NULL,
  `bb` int(11) DEFAULT '0',
  `hr` int(11) DEFAULT '0',
  `ibb` int(11) DEFAULT '0',
  `wp` int(11) DEFAULT '0',
  `bk` int(11) DEFAULT '0',
  `era` double DEFAULT '0',
  `hb` int(11) DEFAULT '0',
  `go_ao` double DEFAULT '0',
  `gidp` int(11) DEFAULT '0',
  `h` int(11) DEFAULT '0',
  `np` int(11) DEFAULT '0',
  `sho` int(11) DEFAULT '0',
  `irs` int(11) DEFAULT '0',
  `svo` int(11) DEFAULT '0',
  `ab` int(11) DEFAULT '0',
  `gs` int(11) DEFAULT '0',
  `g` int(11) DEFAULT '0',
  `ip` double DEFAULT '0',
  `ir` int(11) DEFAULT '0',
  `cg` int(11) DEFAULT '0',
  `l` int(11) DEFAULT '0',
  `ao` int(11) DEFAULT '0',
  `s` int(11) DEFAULT '0',
  `r` int(11) DEFAULT '0',
  `w` int(11) DEFAULT '0',
  `go` int(11) DEFAULT '0',
  `whip` double DEFAULT '0',
  `er` int(11) DEFAULT '0',
  `sv` int(11) DEFAULT '0',
  `so` int(11) DEFAULT '0',
  `avg` double DEFAULT '0',
  `tbf` int(11) DEFAULT '0',
  `team_score` int(11) DEFAULT '0',
  `opp_score` int(11) DEFAULT '0',
  `team_result` enum('W','L') DEFAULT NULL,
  PRIMARY KEY (`game_id`,`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player` (
  `name_matrilineal` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `h3b` int(11) DEFAULT '0',
  `death_city` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `ab` int(11) DEFAULT '0',
  `name_first` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `weight` int(11) DEFAULT '0',
  `status_code` varchar(3) COLLATE utf8_bin DEFAULT NULL,
  `active_sw` enum('Y','N') COLLATE utf8_bin DEFAULT NULL,
  `twitter_id` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `ao` int(11) DEFAULT '0',
  `tb` int(11) DEFAULT '0',
  `primary_position` char(1) COLLATE utf8_bin DEFAULT NULL,
  `go` int(11) DEFAULT '0',
  `team_id` int(11) DEFAULT '0',
  `death_state` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `bats` enum('R','L','S') COLLATE utf8_bin DEFAULT NULL,
  `birth_country` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `name_display_last_first_html` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `player_id` int(11) NOT NULL,
  `team_name` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `avg` double DEFAULT '0',
  `team_code` varchar(3) COLLATE utf8_bin DEFAULT NULL,
  `birth_city` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `name_display_roster` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `death_country` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `hbp` int(11) DEFAULT '0',
  `birth_state` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `name_middle` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `pro_debut_date` datetime DEFAULT NULL,
  `h` int(11) DEFAULT '0',
  `name_display_first_last_html` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `name_prefix` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `high_school` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `name_use` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `cs` int(11) DEFAULT '0',
  `status` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `name_nick` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `throws` enum('R','L') COLLATE utf8_bin DEFAULT NULL,
  `name_display_roster_html` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `ops` double DEFAULT '0',
  `hr` int(11) DEFAULT '0',
  `height_inches` int(11) DEFAULT '0',
  `name_full` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `primary_sport_code` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `sb` int(11) DEFAULT '0',
  `r` int(11) DEFAULT '0',
  `go_ao` double DEFAULT '0',
  `file_code` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `status_date` datetime DEFAULT NULL,
  `height_feet` int(11) DEFAULT '0',
  `name_last` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `primary_stat_type` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `g` int(11) DEFAULT '0',
  `gender` enum('M','F') COLLATE utf8_bin DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `ibb` int(11) DEFAULT '0',
  `death_date` datetime DEFAULT NULL,
  `name_title` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `name_display_last_first` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `bb` int(11) DEFAULT '0',
  `team_abbrev` varchar(3) COLLATE utf8_bin DEFAULT NULL,
  `name_display_first_last` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `so` int(11) DEFAULT '0',
  `rbi` int(11) DEFAULT '0',
  `primary_position_txt` varchar(2) COLLATE utf8_bin DEFAULT NULL,
  `birth_date` datetime DEFAULT NULL,
  `college` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `slg` double DEFAULT NULL,
  `jersey_number` int(11) DEFAULT NULL,
  `obp` double DEFAULT NULL,
  `h2b` int(11) DEFAULT '0',
  `np` int(11) DEFAULT '0',
  `ir` int(11) DEFAULT '0',
  `cg` int(11) DEFAULT '0',
  `w` int(11) DEFAULT '0',
  `l` int(11) DEFAULT '0',
  `s` int(11) DEFAULT '0',
  `er` int(11) DEFAULT '0',
  `sho` int(11) DEFAULT '0',
  `era` double DEFAULT '0',
  `sv` int(11) DEFAULT '0',
  `svo` int(11) DEFAULT '0',
  `wp` int(11) DEFAULT '0',
  `gs` int(11) DEFAULT '0',
  `whip` double DEFAULT '0',
  `irs` int(11) DEFAULT '0',
  `ip` double DEFAULT '0',
  `hb` int(11) DEFAULT '0',
  `tbf` int(11) DEFAULT '0',
  `bk` int(11) DEFAULT '0',
  `gidp` int(11) DEFAULT '0',
  PRIMARY KEY (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedule` (
  `game_id` varchar(100) NOT NULL DEFAULT '',
  `game_date` date DEFAULT NULL,
  `game_pk` int(11) DEFAULT NULL,
  `game_time_is_tbd` tinyint(1) DEFAULT NULL,
  `game_venue` varchar(100) DEFAULT '',
  `game_time` bigint(20) DEFAULT NULL,
  `game_time_offset_eastern` int(11) DEFAULT NULL,
  `game_location` varchar(100) DEFAULT '',
  `division_id` int(11) DEFAULT NULL,
  `game_time_offset_local` int(11) DEFAULT NULL,
  `scheduledTime` bigint(20) DEFAULT NULL,
  `game_status` char(1) DEFAULT NULL,
  `mlbtv` tinyint(1) DEFAULT NULL,
  `is_suspension_resumption` tinyint(1) DEFAULT NULL,
  `video_uri` varchar(255) DEFAULT '',
  `sport_code` varchar(10) DEFAULT '',
  `venue_id` int(11) DEFAULT NULL,
  `wrapup` varchar(1000) DEFAULT '',
  `preview` varchar(1000) DEFAULT '',
  `game_type` char(1) DEFAULT NULL,
  `resumptionTime` bigint(20) DEFAULT NULL,
  `game_dh` varchar(5) DEFAULT NULL,
  `game_num` int(11) DEFAULT NULL,
  `home_team_id` int(11) DEFAULT NULL,
  `home_team_full` varchar(30) DEFAULT '',
  `home_team_display_code` varchar(5) DEFAULT '',
  `home_probable_id` int(11) DEFAULT NULL,
  `home_score` int(11) DEFAULT NULL,
  `away_team_id` int(11) DEFAULT NULL,
  `away_team_full` varchar(30) DEFAULT '',
  `away_team_display_code` char(3) DEFAULT '',
  `away_probable_id` int(11) DEFAULT NULL,
  `away_score` int(11) DEFAULT NULL,
  PRIMARY KEY (`game_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team` (
  `shop_entry_code` int(11) DEFAULT '0',
  `shop_code` int(11) DEFAULT '0',
  `medianet_id` int(11) DEFAULT '0',
  `track_code` varchar(30) DEFAULT NULL,
  `text` varchar(30) DEFAULT NULL,
  `club_full_name` varchar(30) DEFAULT NULL,
  `url_prod` varchar(30) DEFAULT NULL,
  `team_id` int(11) NOT NULL DEFAULT '0',
  `postal_code` varchar(11) DEFAULT '0',
  `timezone` varchar(30) DEFAULT NULL,
  `club_common_url` varchar(30) DEFAULT NULL,
  `esp_common_url` varchar(30) DEFAULT NULL,
  `url_esp` varchar(30) DEFAULT NULL,
  `tertiary` varchar(30) DEFAULT NULL,
  `esp_common_name` varchar(30) DEFAULT NULL,
  `primary_link` varchar(30) DEFAULT NULL,
  `display_code` varchar(30) DEFAULT NULL,
  `newsletter_group_id` int(11) DEFAULT '0',
  `team_code` varchar(30) DEFAULT NULL,
  `club_id` int(11) DEFAULT '0',
  `id` int(11) DEFAULT '0',
  `field` varchar(100) DEFAULT NULL,
  `club_common_name` varchar(30) DEFAULT NULL,
  `location` varchar(30) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `division` varchar(30) DEFAULT NULL,
  `name_display_long` varchar(100) DEFAULT NULL,
  `club` varchar(30) DEFAULT NULL,
  `track_filter` varchar(30) DEFAULT NULL,
  `primary` varchar(30) DEFAULT NULL,
  `es_track_code` varchar(30) DEFAULT NULL,
  `newsletter_category_id` varchar(30) DEFAULT NULL,
  `address` varchar(30) DEFAULT NULL,
  `club_spanish_name` varchar(100) DEFAULT NULL,
  `secondary` varchar(30) DEFAULT NULL,
  `state_province` varchar(30) DEFAULT NULL,
  `league` varchar(30) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `country` varchar(30) DEFAULT NULL,
  `name_display_short` varchar(30) DEFAULT NULL,
  `url_cache` varchar(30) DEFAULT NULL,
  `historical_team_code` varchar(30) DEFAULT NULL,
  `pressbox_url` varchar(100) DEFAULT NULL,
  `twitter` varchar(50) DEFAULT NULL,
  `snapchat` varchar(50) DEFAULT NULL,
  `dc_site` varchar(50) DEFAULT NULL,
  `mobile_es_url` varchar(50) DEFAULT NULL,
  `instagram` varchar(50) DEFAULT NULL,
  `mobile_url` varchar(50) DEFAULT NULL,
  `venue_id` int(11) DEFAULT '0',
  `pinterest` varchar(50) DEFAULT NULL,
  `facebook_es` varchar(50) DEFAULT NULL,
  `twitter_es` varchar(50) DEFAULT NULL,
  `pressbox_title` varchar(50) DEFAULT NULL,
  `googleplus_id` varchar(50) DEFAULT NULL,
  `fanphotos_url` varchar(50) DEFAULT NULL,
  `fb_app_id` varchar(50) DEFAULT NULL,
  `photostore_url` varchar(50) DEFAULT NULL,
  `vine` varchar(50) DEFAULT NULL,
  `google_tag_manager` varchar(50) DEFAULT NULL,
  `mobile_short_code` varchar(50) DEFAULT NULL,
  `instagram_id` varchar(50) DEFAULT NULL,
  `tumblr` varchar(50) DEFAULT NULL,
  `youtube` varchar(50) DEFAULT NULL,
  `pinterest_verification` varchar(50) DEFAULT NULL,
  `mobile_url_base` varchar(50) DEFAULT NULL,
  `facebook` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`team_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction` (
  `conditional_sw` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `effective_date` date DEFAULT NULL,
  `final_asset` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `final_asset_type` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `from_team` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `from_team_id` int(11) DEFAULT NULL,
  `name_display_first_last` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `name_display_last_first` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `name_sort` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `note` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `orig_asset` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `orig_asset_type` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `player` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `player_id` int(11) DEFAULT NULL,
  `resolution_cd` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `resolution_date` date DEFAULT NULL,
  `team` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  `trans_date` date DEFAULT NULL,
  `trans_date_cd` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `transaction_id` int(11) NOT NULL,
  `type` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `type_cd` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-08-15 10:10:17

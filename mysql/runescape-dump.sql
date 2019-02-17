-- MySQL dump 10.13  Distrib 5.7.25, for Linux (x86_64)
--
-- Host: localhost    Database: RUNESCAPE
-- ------------------------------------------------------
-- Server version	5.7.25-0ubuntu0.16.04.2

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
-- Table structure for table `QUESTS`
--

DROP TABLE IF EXISTS `QUESTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QUESTS` (
  `quest_id` int(11) NOT NULL AUTO_INCREMENT,
  `quest_name` varchar(255) NOT NULL,
  PRIMARY KEY (`quest_id`)
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QUESTS`
--

LOCK TABLES `QUESTS` WRITE;
/*!40000 ALTER TABLE `QUESTS` DISABLE KEYS */;
INSERT INTO `QUESTS` VALUES (1,'Animal Magnetism'),(2,'Another Slice of H.A.M'),(3,'A Soul\'s Bane'),(4,'A Tail of Two Cats'),(5,'A Taste of Hope'),(6,'Between a Rock'),(7,'Big Chompy Bird Hunting'),(8,'Biohazard'),(9,'Black Knight Fortress'),(10,'Bone Voyage'),(11,'Cabin Fever'),(12,'Client of Kourend'),(13,'Clock Tower'),(14,'Cold War'),(15,'Contact!'),(16,'Cook\'s Assistant'),(17,'Creature of Fenkenstrain'),(18,'Darkness of Hallowvale'),(19,'Death Plateau'),(20,'Death to the Dorgeshuun'),(21,'Demon Slayer'),(22,'Desert Treasure'),(23,'Devious Minds'),(24,'Doric\'s QUest'),(25,'Dragon Slayer'),(26,'Dragon Slayer 2'),(27,'Dream Mentor'),(28,'Druidic Ritual'),(29,'Dwarf Cannon'),(30,'Eadgar\'s Ruse'),(31,'Eagle\'s Peak'),(32,'Elemental Workshop 1'),(33,'Elemental Workshop 2'),(34,'Enakhras Lament'),(35,'Enlightened Journey'),(36,'Ernest the Chicken'),(37,'Fairytale 1 - Growing Pains'),(38,'Fairytale 2 - Cure a Queen'),(39,'Family Crest'),(40,'Fight Arena'),(41,'Fishing Contest'),(42,'Forgettable Tale'),(43,'Garden of Tranquility'),(44,'Gertrudes Cat'),(45,'Ghosts Ahoy'),(46,'Goblin Diplomacy'),(47,'Grim Tales'),(48,'Haunted Mine'),(49,'Hazeel Cult'),(50,'Heroes Quest'),(51,'Hi'),(52,'Holy Grail'),(53,'Horror from the Deep'),(54,'Icthlarins Little Helper'),(55,'Imp Catcher'),(56,'In Aid of the Myreque'),(57,'In Search of the Myreque'),(58,'Jungle Potion '),(59,'Kings Ransom'),(60,'Legends Quest'),(61,'Lost City'),(62,'Lunary Diplomacy'),(63,'Making Friends with My Arm'),(64,'Making History'),(65,'Merlin\'s Crystal'),(66,'Mithalin Mystery'),(67,'Monk\'s Friend'),(68,'Monkey Madness 1'),(69,'Monkey Madness 2'),(70,'Mountain Daughter'),(71,'Mournings Ends Part 1'),(72,'Mournings Ends Part 2'),(73,'Murder Mystery'),(74,'My Arm\'s Big Adventure'),(75,'Nature Spirit'),(76,'Observatory Quest'),(77,'Olaf\'s Quest'),(78,'One Small Favour'),(79,'Pirates Treasure'),(80,'Plague City'),(81,'Priest in Peril'),(82,'Prince Ali Rescue'),(83,'Rag and Bone Man'),(84,'Rag and Bone Man 2'),(85,'Ratcatchers'),(86,'Recipe for Disaster'),(87,'Recruitment Drive'),(88,'Regicide'),(89,'Romeo & Juliet'),(90,'Roving Elves'),(91,'Royal Trouble '),(92,'Rum Deal'),(93,'Rune Mysteries'),(94,'Scoprion Catcher'),(95,'Sea Slug'),(96,'Shades of Morton'),(97,'Shadow of the Storm'),(98,'Sheep Herder'),(99,'Sheep Shearer'),(100,'Shield of Arrav'),(101,'Shilo Village'),(102,'Spirits of the Elid'),(103,'Swan Swong'),(104,'Tai Bwo Wannai Trio'),(105,'Tale of the Righteous'),(106,'Tears of Guthix'),(107,'Temple of Ikov'),(108,'The Ascent of Arceuus'),(109,'The Corsair Curse'),(110,'The Depths of Despair'),(111,'The Dig Site'),(112,'The Eyes of Glouphrie'),(113,'The Feud'),(114,'The Forsaken Tower'),(115,'The Fremennik Isles'),(116,'The Fremennik Trials'),(117,'The Giant Dwarf'),(118,'The Golem'),(119,'The Grand Tree'),(120,'The Great Brain Robbery'),(121,'The Hand in the Sand'),(122,'The Knights Sword'),(123,'The Lost Tribe'),(124,'The Queen of Thieves'),(125,'The Restless Ghost'),(126,'The Slug Menace'),(127,'The Tourist Trap'),(128,'Throne of Miscellania'),(129,'Tower of Life'),(130,'Tree Gnome Village'),(131,'Tribal Totem'),(132,'Troll Romance'),(133,'Troll Stronghold'),(134,'Underground Pass'),(135,'Vampire Slayer'),(136,'Wanted!'),(137,'Watchtower'),(138,'Waterfall Quest'),(139,'What Lies Below'),(140,'Witch\'s House'),(141,'Witch\'s Potion'),(142,'Zogre Flesh Eaters');
/*!40000 ALTER TABLE `QUESTS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QUEST_PREREQUISITES`
--

DROP TABLE IF EXISTS `QUEST_PREREQUISITES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QUEST_PREREQUISITES` (
  `quest_id` int(11) NOT NULL,
  `prerequisite_quest_id` int(11) NOT NULL,
  PRIMARY KEY (`quest_id`,`prerequisite_quest_id`),
  KEY `prerequisite_quest_id` (`prerequisite_quest_id`),
  CONSTRAINT `QUEST_PREREQUISITES_ibfk_1` FOREIGN KEY (`quest_id`) REFERENCES `QUESTS` (`quest_id`),
  CONSTRAINT `QUEST_PREREQUISITES_ibfk_2` FOREIGN KEY (`prerequisite_quest_id`) REFERENCES `QUESTS` (`quest_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QUEST_PREREQUISITES`
--

LOCK TABLES `QUEST_PREREQUISITES` WRITE;
/*!40000 ALTER TABLE `QUEST_PREREQUISITES` DISABLE KEYS */;
INSERT INTO `QUEST_PREREQUISITES` VALUES (26,1),(26,4),(11,7),(72,7),(86,7),(92,7),(120,7),(142,7),(26,8),(60,8),(86,8),(88,8),(90,8),(134,8),(23,9),(59,9),(87,9),(26,10),(120,11),(26,12),(105,12),(108,12),(110,12),(114,12),(124,12),(63,14),(86,16),(43,17),(63,17),(84,17),(103,17),(120,17),(5,18),(22,19),(23,19),(26,19),(27,19),(30,19),(63,19),(69,19),(74,19),(86,19),(132,19),(133,19),(2,20),(86,21),(97,21),(86,22),(23,24),(26,25),(50,25),(60,25),(86,25),(26,27),(2,28),(10,28),(11,28),(23,28),(26,28),(27,28),(30,28),(50,28),(58,28),(59,28),(60,28),(62,28),(63,28),(74,28),(78,28),(86,28),(87,28),(92,28),(103,28),(111,28),(120,28),(142,28),(6,29),(26,30),(27,30),(63,30),(74,30),(33,32),(69,35),(1,36),(26,36),(38,37),(26,39),(60,39),(86,39),(6,41),(42,41),(86,41),(63,43),(103,43),(4,44),(15,44),(26,44),(54,44),(85,44),(86,44),(26,45),(2,46),(20,46),(23,46),(86,46),(123,46),(26,50),(60,50),(86,50),(128,50),(59,52),(84,53),(86,53),(4,54),(15,54),(26,54),(85,54),(5,56),(18,56),(5,57),(18,57),(56,57),(11,58),(26,58),(27,58),(37,58),(59,58),(60,58),(62,58),(63,58),(74,58),(78,58),(86,58),(92,58),(101,58),(103,58),(104,58),(120,58),(142,58),(26,60),(86,60),(26,61),(27,61),(37,61),(38,61),(50,61),(60,61),(62,61),(86,61),(26,62),(27,62),(26,65),(50,65),(52,65),(59,65),(60,65),(86,65),(69,68),(86,68),(71,71),(59,73),(86,73),(63,74),(5,75),(18,75),(37,75),(38,75),(56,75),(57,75),(86,75),(59,78),(63,78),(103,78),(11,79),(120,79),(8,80),(26,80),(60,80),(86,80),(88,80),(90,80),(134,80),(1,81),(5,81),(11,81),(17,81),(18,81),(22,81),(23,81),(26,81),(37,81),(38,81),(43,81),(45,81),(48,81),(56,81),(57,81),(63,81),(64,81),(75,81),(86,81),(92,81),(96,81),(103,81),(120,81),(136,81),(15,82),(84,83),(69,86),(120,86),(23,87),(136,87),(90,88),(63,89),(72,90),(11,92),(120,92),(2,93),(20,93),(23,93),(26,93),(27,93),(59,93),(62,93),(63,93),(78,93),(103,93),(123,93),(136,93),(139,93),(126,95),(86,97),(72,98),(26,100),(50,100),(60,100),(86,100),(26,101),(27,101),(59,101),(60,101),(62,101),(63,101),(78,101),(86,101),(103,101),(63,103),(22,107),(86,107),(2,111),(10,111),(22,111),(26,111),(86,111),(69,112),(63,113),(74,113),(26,116),(27,116),(62,116),(77,116),(84,116),(115,116),(128,116),(2,117),(42,117),(86,118),(97,118),(68,119),(69,119),(86,119),(112,119),(117,122),(2,123),(20,123),(23,123),(136,123),(1,125),(5,125),(17,125),(18,125),(26,125),(37,125),(38,125),(43,125),(45,125),(56,125),(57,125),(63,125),(64,125),(75,125),(86,125),(103,125),(22,127),(86,127),(91,128),(68,130),(69,130),(86,130),(22,133),(23,133),(26,133),(27,133),(30,133),(63,133),(69,133),(74,133),(86,133),(132,133),(26,134),(60,134),(86,134),(88,134),(90,134),(23,136),(126,136),(69,137),(22,138),(60,138),(86,138),(90,138),(47,140),(86,140),(11,142),(84,142),(92,142),(120,142);
/*!40000 ALTER TABLE `QUEST_PREREQUISITES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SKILLS`
--

DROP TABLE IF EXISTS `SKILLS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SKILLS` (
  `skill_id` int(11) NOT NULL AUTO_INCREMENT,
  `skill_name` varchar(255) NOT NULL,
  PRIMARY KEY (`skill_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SKILLS`
--

LOCK TABLES `SKILLS` WRITE;
/*!40000 ALTER TABLE `SKILLS` DISABLE KEYS */;
INSERT INTO `SKILLS` VALUES (1,'Attack'),(2,'Strength'),(3,'Defence'),(4,'Ranged'),(5,'Prayer'),(6,'Magic'),(7,'Runecrafting'),(8,'Construction'),(9,'Hitpoints'),(10,'Agility'),(11,'Herblore'),(12,'Thieving'),(14,'Crafting'),(15,'Fletching'),(16,'Slayer'),(17,'Hunter'),(18,'Mining'),(19,'Smithing'),(20,'Cooking'),(21,'Firemaking'),(22,'Woodcutting'),(23,'Farming'),(24,'Fishing'),(25,'Combat');
/*!40000 ALTER TABLE `SKILLS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SKILL_PREREQUISITES`
--

DROP TABLE IF EXISTS `SKILL_PREREQUISITES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SKILL_PREREQUISITES` (
  `quest_id` int(11) NOT NULL,
  `prerequisite_skill_id` int(11) NOT NULL,
  `skill_value` int(10) DEFAULT NULL,
  PRIMARY KEY (`quest_id`,`prerequisite_skill_id`),
  KEY `prerequisite_skill_id` (`prerequisite_skill_id`),
  CONSTRAINT `SKILL_PREREQUISITES_ibfk_1` FOREIGN KEY (`quest_id`) REFERENCES `QUESTS` (`quest_id`),
  CONSTRAINT `SKILL_PREREQUISITES_ibfk_2` FOREIGN KEY (`prerequisite_skill_id`) REFERENCES `SKILLS` (`skill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SKILL_PREREQUISITES`
--

LOCK TABLES `SKILL_PREREQUISITES` WRITE;
/*!40000 ALTER TABLE `SKILL_PREREQUISITES` DISABLE KEYS */;
INSERT INTO `SKILL_PREREQUISITES` VALUES (1,4,30),(1,5,31),(1,14,19),(1,16,18),(1,22,35),(2,1,15),(2,5,25),(5,1,40),(5,10,45),(5,11,40),(5,14,48),(5,16,38),(6,3,30),(6,18,40),(6,19,50),(7,4,30),(7,15,5),(7,20,30),(8,10,33),(11,4,40),(11,10,42),(11,14,45),(11,19,50),(14,8,34),(14,10,30),(14,12,15),(14,14,30),(14,17,10),(17,12,25),(17,14,20),(18,2,40),(18,6,33),(18,8,5),(18,10,26),(18,12,22),(18,14,32),(18,18,20),(20,10,23),(20,12,23),(22,6,50),(22,12,53),(22,16,10),(22,21,50),(23,7,50),(23,15,50),(23,19,65),(24,18,15),(25,6,33),(25,14,8),(26,6,75),(26,8,50),(26,9,50),(26,10,60),(26,12,60),(26,14,62),(26,18,68),(26,19,70),(27,25,85),(30,10,44),(30,11,31),(31,17,27),(32,14,20),(32,18,20),(32,19,20),(33,6,20),(33,19,30),(34,5,43),(34,6,39),(34,14,50),(34,18,45),(34,21,45),(35,14,36),(35,21,20),(35,23,30),(38,11,57),(38,12,40),(38,23,49),(39,6,59),(39,14,40),(39,18,40),(39,19,40),(41,24,10),(42,20,22),(42,23,17),(43,23,25),(45,10,58),(45,20,20),(47,10,59),(47,11,52),(47,12,58),(47,22,71),(47,23,45),(48,5,40),(48,10,15),(48,14,35),(50,10,70),(50,11,25),(50,18,50),(50,20,53),(50,24,53),(52,1,20),(53,5,40),(53,10,35),(56,6,7),(56,10,50),(56,14,25),(56,18,15),(57,10,25),(58,11,3),(59,3,65),(59,6,45),(60,2,50),(60,5,42),(60,6,56),(60,10,50),(60,11,45),(60,12,50),(60,14,50),(60,18,52),(60,19,50),(60,22,50),(61,14,31),(61,22,36),(62,3,40),(62,6,65),(62,14,61),(62,18,60),(62,21,49),(62,22,55),(63,8,35),(63,10,68),(63,18,72),(63,21,66),(68,5,43),(69,10,55),(69,12,55),(69,14,70),(69,16,69),(69,17,60),(69,21,60),(70,10,20),(71,5,43),(71,10,60),(72,4,60),(72,12,50),(74,5,43),(74,6,61),(74,22,10),(74,23,29),(75,14,18),(76,14,10),(77,10,57),(77,21,40),(77,22,50),(78,10,36),(78,11,18),(78,14,25),(78,19,30),(84,3,20),(84,16,40),(85,11,54),(86,4,40),(86,6,59),(86,10,48),(86,11,25),(86,12,53),(86,14,40),(86,15,10),(86,16,10),(86,18,50),(86,19,40),(86,20,70),(86,21,50),(86,22,36),(86,24,53),(88,10,56),(88,14,10),(90,10,56),(92,5,47),(92,14,42),(92,16,42),(92,23,40),(92,24,50),(94,5,31),(95,21,30),(96,11,15),(96,14,20),(96,21,5),(97,14,30),(101,10,32),(101,14,20),(101,19,4),(102,4,37),(102,6,33),(102,12,37),(102,18,37),(103,6,66),(103,14,40),(103,19,45),(103,20,62),(103,21,42),(103,24,62),(104,10,15),(104,11,34),(104,20,30),(104,21,30),(104,24,65),(105,2,16),(105,18,10),(106,14,20),(106,18,20),(106,21,49),(107,4,40),(107,12,42),(108,17,12),(110,10,18),(111,10,10),(111,11,10),(111,12,25),(112,6,46),(112,8,5),(113,12,30),(115,8,20),(115,10,40),(115,14,46),(115,22,56),(116,10,48),(116,14,40),(116,15,25),(116,22,40),(117,6,33),(117,12,14),(117,14,12),(117,18,20),(117,19,20),(117,21,16),(118,12,25),(118,14,20),(119,10,25),(120,5,50),(120,8,30),(120,14,16),(121,12,38),(121,14,49),(121,23,59),(122,18,10),(122,19,15),(122,20,10),(123,10,13),(123,12,13),(123,18,17),(124,12,20),(126,7,30),(126,12,30),(126,14,30),(126,16,30),(127,15,10),(127,19,20),(128,18,30),(128,22,45),(128,23,10),(128,24,35),(129,8,10),(131,12,21),(133,5,43),(133,10,15),(133,12,30),(134,4,25),(134,5,43),(134,10,60),(134,12,50),(137,6,15),(137,10,25),(137,11,14),(137,12,15),(137,18,40),(139,7,35),(139,18,42),(142,2,10),(142,4,30),(142,5,43),(142,11,8),(142,15,30),(142,19,4);
/*!40000 ALTER TABLE `SKILL_PREREQUISITES` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-02-17 23:13:26

-- MySQL dump 10.13  Distrib 8.0.26, for macos11 (x86_64)
--
-- Host: localhost    Database: brandlux
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `BillAdrs`
--

DROP TABLE IF EXISTS `BillAdrs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BillAdrs` (
  `BillAdrsID` int NOT NULL,
  `Address1` varchar(50) NOT NULL,
  `Address2` varchar(50) DEFAULT NULL,
  `City` varchar(30) NOT NULL,
  `PostCode` varchar(10) NOT NULL,
  `CountryID` int NOT NULL,
  PRIMARY KEY (`BillAdrsID`),
  KEY `FK_CountryID` (`CountryID`),
  CONSTRAINT `FK_CountryID` FOREIGN KEY (`CountryID`) REFERENCES `Countries` (`CountryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BillAdrs`
--

LOCK TABLES `BillAdrs` WRITE;
/*!40000 ALTER TABLE `BillAdrs` DISABLE KEYS */;
INSERT INTO `BillAdrs` VALUES (1,'9818 Clyde Gallagher Crossing','Abruzzi','Pescara','14783-313',49),(2,'7885 Anthes Court','Abruzzi','Pescara','58118-0105',12),(3,'3851 Ludington Hill','Abruzzi','Pescara','0363-0831',44),(4,'068 Sunnyside Center','Abruzzi','Pescara','64125-130',9),(5,'5695 American Ash Place','Abruzzi','Pescara','60429-301',48),(6,'3 Manufacturers Plaza','Abruzzi','Pescara','13107-054',33),(7,'7 Sachs Road','Abruzzi','Pescara','25021-806',6),(8,'29 Northport Trail','Abruzzi','Pescara','68084-060',1),(9,'33 Northland Place','Abruzzi','Pescara','0268-0890',44),(10,'65 Cambridge Place','Abruzzi','Pescara','54868-5749',35),(11,'33632 Dovetail Parkway','Abruzzi','Pescara','0781-2274',50),(12,'466 Londonderry Crossing','Abruzzi','Pescara','63629-3332',40),(13,'606 Redwing Court','Abruzzi','Pescara','11523-7207',32),(14,'4 Esch Center','Abruzzi','Pescara','41250-016',24),(15,'3329 Sauthoff Circle','Abruzzi','Pescara','60232-8581',2),(16,'048 Westend Lane','Abruzzi','Pescara','49348-471',7),(17,'2 Maple Wood Trail','Abruzzi','Pescara','66975-350',6),(18,'1 Morning Terrace','Abruzzi','Pescara','42508-163',30),(19,'5949 Mallory Junction','Abruzzi','Pescara','60927-116',24),(20,'9 Mifflin Hill','Abruzzi','Pescara','64613-5800',17),(21,'8 Sunbrook Avenue','Abruzzi','Pescara','59630-750',22),(22,'60246 Becker Hill','Abruzzi','Pescara','0641-0497',18),(23,'8 Bultman Crossing','Abruzzi','Pescara','49288-0483',31),(24,'6861 Lukken Lane','Abruzzi','Pescara','52125-413',6),(25,'8 Eliot Lane','Abruzzi','Pescara','55714-2242',24),(26,'0 Northview Plaza','Abruzzi','Pescara','0378-0088',49),(27,'8266 Fairfield Court','Abruzzi','Pescara','62678-207',28),(28,'011 American Street','Abruzzi','Pescara','59762-1004',19),(29,'57 Graedel Alley','Abruzzi','Pescara','51143-124',34),(30,'9091 Forest Dale Park','Abruzzi','Pescara','65044-5222',41),(31,'6 Victoria Plaza','Abruzzi','Pescara','55301-003',1),(32,'3 Hauk Court','Abruzzi','Pescara','76340-4001',49),(33,'7990 Fuller Circle','Abruzzi','Pescara','54868-5095',3),(34,'2 Everett Park','Abruzzi','Pescara','25021-803',21),(35,'04630 Rieder Lane','Abruzzi','Pescara','59779-006',47),(36,'4700 Carioca Plaza','Abruzzi','Pescara','41616-882',30),(37,'79649 Mesta Road','Abruzzi','Pescara','50563-177',22),(38,'32 Warrior Court','Abruzzi','Pescara','68001-184',42),(39,'809 Golf View Drive','Abruzzi','Pescara','55154-0748',31),(40,'9880 Bartelt Court','Abruzzi','Pescara','46994-612',19),(41,'5427 Bultman Alley','Abruzzi','Pescara','55154-4351',31),(42,'55 Emmet Crossing','Abruzzi','Pescara','65044-2677',13),(43,'7 Magdeline Road','Abruzzi','Pescara','69043-003',41),(44,'94618 Anzinger Road','Abruzzi','Pescara','31722-729',3),(45,'50440 Blackbird Drive','Abruzzi','Pescara','44237-002',15),(46,'03 Westerfield Parkway','Abruzzi','Pescara','49288-0927',45),(47,'2 Washington Junction','Abruzzi','Pescara','0065-0325',41),(48,'547 Welch Crossing','Abruzzi','Pescara','43063-439',21),(49,'2581 Commercial Circle','Abruzzi','Pescara','59148-018',38),(50,'13 Shasta Hill','Abruzzi','Pescara','13537-152',6);
/*!40000 ALTER TABLE `BillAdrs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BrandNames`
--

DROP TABLE IF EXISTS `BrandNames`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BrandNames` (
  `BrandNameID` int NOT NULL,
  `BrandName` varchar(15) NOT NULL,
  PRIMARY KEY (`BrandNameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BrandNames`
--

LOCK TABLES `BrandNames` WRITE;
/*!40000 ALTER TABLE `BrandNames` DISABLE KEYS */;
INSERT INTO `BrandNames` VALUES (1,'Chanel'),(2,'Hermes'),(3,'Dior'),(4,'Celine'),(5,'Gucci'),(6,'Louis Vuitton');
/*!40000 ALTER TABLE `BrandNames` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Colours`
--

DROP TABLE IF EXISTS `Colours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Colours` (
  `ColourID` int NOT NULL,
  `Colour` varchar(10) NOT NULL,
  PRIMARY KEY (`ColourID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Colours`
--

LOCK TABLES `Colours` WRITE;
/*!40000 ALTER TABLE `Colours` DISABLE KEYS */;
INSERT INTO `Colours` VALUES (1,'Purple'),(2,'Aquamarine'),(3,'Fuscia'),(4,'Turquoise'),(5,'Maroon'),(6,'Indigo'),(7,'Turquoise'),(8,'Aquamarine'),(9,'Goldenrod');
/*!40000 ALTER TABLE `Colours` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ContactPersons`
--

DROP TABLE IF EXISTS `ContactPersons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ContactPersons` (
  `ContactPersonID` int NOT NULL,
  `FirstName` varchar(20) NOT NULL,
  `Surname` varchar(20) NOT NULL,
  PRIMARY KEY (`ContactPersonID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ContactPersons`
--

LOCK TABLES `ContactPersons` WRITE;
/*!40000 ALTER TABLE `ContactPersons` DISABLE KEYS */;
INSERT INTO `ContactPersons` VALUES (1,'Paten','Gasquoine'),(2,'Sonya','Southon'),(3,'Nedi','Newsham'),(4,'Rosalyn','Lilian'),(5,'Clara','Bum'),(6,'Tine','Szubert'),(7,'Lydie','MacCart'),(8,'Martie','Duchenne'),(9,'Myrwyn','Moakes'),(10,'Tulley','Jacquemy');
/*!40000 ALTER TABLE `ContactPersons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Countries`
--

DROP TABLE IF EXISTS `Countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Countries` (
  `CountryID` int NOT NULL,
  `Country` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`CountryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Countries`
--

LOCK TABLES `Countries` WRITE;
/*!40000 ALTER TABLE `Countries` DISABLE KEYS */;
INSERT INTO `Countries` VALUES (1,'Mexico'),(2,'France'),(3,'Philippines'),(4,'Indonesia'),(5,'China'),(6,'China'),(7,'United States'),(8,'China'),(9,'Canada'),(10,'Portugal'),(11,'Czech Republic'),(12,'Russia'),(13,'China'),(14,'Brazil'),(15,'Hungary'),(16,'Morocco'),(17,'Sweden'),(18,'Tanzania'),(19,'China'),(20,'Kosovo'),(21,'Portugal'),(22,'China'),(23,'China'),(24,'Poland'),(25,'France'),(26,'Albania'),(27,'Finland'),(28,'Czech Republic'),(29,'United States'),(30,'Turkey'),(31,'Czech Republic'),(32,'Indonesia'),(33,'Chad'),(34,'China'),(35,'Cameroon'),(36,'Portugal'),(37,'France'),(38,'Philippines'),(39,'Netherlands'),(40,'Philippines'),(41,'Uganda'),(42,'Philippines'),(43,'China'),(44,'China'),(45,'Brazil'),(46,'Tajikistan'),(47,'Iran'),(48,'China'),(49,'Faroe Islands'),(50,'Peru');
/*!40000 ALTER TABLE `Countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customers`
--

DROP TABLE IF EXISTS `Customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customers` (
  `CustomerID` int NOT NULL,
  `FName` varchar(15) NOT NULL,
  `Surname` varchar(15) NOT NULL,
  `PhoneNo` varchar(35) NOT NULL,
  `eMail` varchar(50) DEFAULT NULL,
  `BillAdrsID` int NOT NULL,
  `ShipAdrsID` int NOT NULL,
  PRIMARY KEY (`CustomerID`),
  KEY `FK_BillAdrsID` (`BillAdrsID`),
  KEY `FK_ShipAdrsID` (`ShipAdrsID`),
  CONSTRAINT `FK_BillAdrsID` FOREIGN KEY (`BillAdrsID`) REFERENCES `BillAdrs` (`BillAdrsID`),
  CONSTRAINT `FK_ShipAdrsID` FOREIGN KEY (`ShipAdrsID`) REFERENCES `ShipAdrs` (`ShipAdrsID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customers`
--

LOCK TABLES `Customers` WRITE;
/*!40000 ALTER TABLE `Customers` DISABLE KEYS */;
INSERT INTO `Customers` VALUES (1,'Addy','Cruickshank','+55 (184) 414-4465','acruickshank0@google.nl',25,16),(2,'Daryle','Littlefair','+57 (619) 528-5977','dlittlefair1@dailymotion.com',19,6),(3,'Daffi','Strowan','+994 (732) 815-9552','dstrowan2@hugedomains.com',2,5),(4,'Kerry','Spohrmann','+502 (288) 387-7298','kspohrmann3@nationalgeographic.com',26,28),(5,'Tobin','Le Noir','+381 (983) 788-6951','tlenoir4@nature.com',47,39),(6,'Carlin','Clemmow','+56 (447) 664-1144','cclemmow5@yahoo.com',1,16),(7,'Harli','Shakespeare','+86 (381) 724-7143','hshakespeare6@discuz.net',20,4),(8,'Felike','Boulsher','+81 (272) 266-9073','fboulsher7@xrea.com',10,6),(9,'Charisse','McLae','+48 (195) 494-8622','cmclae8@illinois.edu',34,42),(10,'Corie','Karlsson','+375 (746) 645-9822','ckarlsson9@etsy.com',47,11),(11,'Goober','Scanlin','+20 (427) 901-2640','gscanlina@usda.gov',7,26),(12,'Ignazio','Froment','+972 (826) 910-4006','ifromentb@weibo.com',46,9),(13,'Gun','Andreutti','+1 (573) 371-4356','gandreuttic@alibaba.com',40,40),(14,'Harmon','Banat','+52 (626) 843-9357','hbanatd@nsw.gov.au',47,37),(15,'Jerrold','Apedaile','+993 (480) 348-9274','japedailee@dot.gov',29,33),(16,'Hartley','Kinahan','+55 (258) 432-7167','hkinahanf@phpbb.com',40,32),(17,'Cyndy','Davidsen','+64 (376) 541-8614','cdavidseng@booking.com',15,49),(18,'Ellsworth','Sissens','+1 (332) 802-3244','esissensh@furl.net',37,49),(19,'Elwood','Bailes','+880 (136) 500-0317','ebailesi@fema.gov',14,34),(20,'Rheba','Ugoletti','+86 (436) 145-9466','rugolettij@whitehouse.gov',41,2),(21,'Dukie','Britian','+970 (371) 522-2059','dbritiank@columbia.edu',34,40),(22,'Jackqueline','D\'Alesco','+7 (610) 310-2573','jdalescol@dailymotion.com',20,35),(23,'Marj','Norcross','+95 (833) 336-7004','mnorcrossm@amazon.de',24,48),(24,'Fancy','Morilla','+86 (375) 383-1414','fmorillan@independent.co.uk',43,37),(25,'Shoshana','De Roeck','+856 (135) 220-1871','sderoecko@freewebs.com',46,11),(26,'Clarisse','Fallis','+962 (814) 719-3446','cfallisp@soundcloud.com',49,33),(27,'Corissa','Pettengell','+44 (317) 721-3475','cpettengellq@engadget.com',8,23),(28,'Jonathan','Rolls','+55 (765) 593-6269','jrollsr@usatoday.com',19,29),(29,'Camella','Killingbeck','+225 (216) 713-9422','ckillingbecks@biblegateway.com',46,31),(30,'Jackelyn','Kitt','+351 (965) 532-9578','jkittt@booking.com',23,31),(31,'Carlin','Eaklee','+86 (793) 907-5624','ceakleeu@adobe.com',1,3),(32,'Foss','Daburn','+33 (531) 728-3311','fdaburnv@t.co',1,27),(33,'Kasey','Logue','+86 (634) 464-3597','kloguew@rambler.ru',49,20),(34,'Gayle','Landreth','+86 (724) 495-9814','glandrethx@bravesites.com',49,2),(35,'Montgomery','Ivanchov','+86 (637) 310-2370','mivanchovy@scientificamerican.com',39,50),(36,'Suki','Malmar','+62 (692) 951-2590','smalmarz@answers.com',17,21),(37,'Ber','Armytage','+1 (255) 881-7003','barmytage10@opensource.org',48,39),(38,'Lyda','Mikalski','+373 (414) 656-9955','lmikalski11@arstechnica.com',19,24),(39,'Burk','Hamill','+86 (919) 573-7494','bhamill12@miibeian.gov.cn',21,43),(40,'Rebekkah','Burtonwood','+93 (678) 268-2738','rburtonwood13@jugem.jp',9,46),(41,'Genevieve','Scarce','+507 (707) 380-6668','gscarce14@printfriendly.com',5,32),(42,'Ambrosio','Beeby','+46 (556) 168-4102','abeeby15@rediff.com',33,34),(43,'Kylie','Reef','+62 (381) 341-1947','kreef16@reference.com',34,14),(44,'Jeniffer','Yarr','+56 (612) 520-7863','jyarr17@godaddy.com',32,9),(45,'Ronny','Cranna','+420 (738) 649-2461','rcranna18@mit.edu',31,5),(46,'Fernanda','Lohmeyer','+57 (226) 295-1636','flohmeyer19@techcrunch.com',28,18),(47,'Stanislaw','Bernollet','+62 (106) 600-4353','sbernollet1a@independent.co.uk',43,39),(48,'Elfrida','Yitshak','+55 (683) 795-9563','eyitshak1b@myspace.com',49,8),(49,'Allayne','Critcher','+86 (445) 869-1035','acritcher1c@myspace.com',26,34),(50,'Averell','Mourant','+351 (442) 896-6157','amourant1d@ft.com',19,11),(51,'Pris','Varfalameev','+86 (222) 860-8186','pvarfalameev1e@netscape.com',7,8),(52,'Rea','Bonin','+62 (218) 354-1671','rbonin1f@free.fr',28,13),(53,'Camila','Reinger','+971 (968) 256-7488','creinger1g@theglobeandmail.com',2,22),(54,'Robinette','Golton','+51 (104) 682-7787','rgolton1h@icq.com',28,9),(55,'Licha','Jewitt','+51 (272) 234-2841','ljewitt1i@state.gov',15,31),(56,'Judas','Peasee','+7 (953) 384-1596','jpeasee1j@pcworld.com',46,27),(57,'Gerri','Bointon','+54 (403) 245-3156','gbointon1k@latimes.com',24,21),(58,'Jed','Slite','+968 (539) 663-3686','jslite1l@comsenz.com',22,36),(59,'Cornie','Neary','+7 (504) 610-0709','cneary1m@furl.net',22,12),(60,'Verney','Oxby','+7 (809) 407-8599','voxby1n@dot.gov',12,25),(61,'Trisha','Stormonth','+1 (713) 843-1897','tstormonth1o@hatena.ne.jp',5,38),(62,'Neda','Davidzon','+86 (885) 417-8648','ndavidzon1p@forbes.com',6,8),(63,'Cicily','Puddefoot','+62 (428) 943-8115','cpuddefoot1q@oakley.com',40,33),(64,'Hoyt','McKague','+63 (795) 181-6193','hmckague1r@thetimes.co.uk',19,13),(65,'Gaston','Lowerson','+81 (607) 999-8539','glowerson1s@yahoo.co.jp',1,35),(66,'Pincus','MacKeeg','+7 (586) 574-5874','pmackeeg1t@booking.com',7,31),(67,'Josi','Wyett','+381 (394) 887-0565','jwyett1u@cocolog-nifty.com',27,9),(68,'Lelia','Arthars','+63 (731) 510-5321','larthars1v@nyu.edu',43,5),(69,'Dexter','Le Quesne','+57 (670) 839-9167','dlequesne1w@webmd.com',37,46),(70,'Kirk','Rathborne','+53 (474) 880-8535','krathborne1x@washingtonpost.com',14,3),(71,'Preston','Jenyns','+880 (405) 411-5877','pjenyns1y@icio.us',3,46),(72,'Francis','Defau','+86 (409) 333-6592','fdefau1z@shareasale.com',46,49),(73,'Olenolin','Durbin','+52 (918) 313-7614','odurbin20@abc.net.au',45,11),(74,'Sawyere','Brogioni','+1 (954) 542-7273','sbrogioni21@tripod.com',34,43),(75,'Bonny','Griggs','+1 (520) 494-7699','bgriggs22@unicef.org',29,16),(76,'Torey','MacNelly','+223 (114) 678-5494','tmacnelly23@apache.org',40,43),(77,'Felizio','Hamlen','+358 (656) 145-9821','fhamlen24@friendfeed.com',26,23),(78,'Andrea','Roper','+62 (255) 934-2062','aroper25@jimdo.com',37,36),(79,'Troy','Farquarson','+1 (518) 257-0689','tfarquarson26@bloglines.com',34,18),(80,'Wilburt','Zima','+86 (631) 566-0449','wzima27@hc360.com',46,32),(81,'Philbert','Perotti','+86 (470) 373-0430','pperotti28@globo.com',3,20),(82,'Thaddus','Averall','+86 (245) 854-5579','taverall29@nasa.gov',2,50),(83,'Matthieu','Cootes','+886 (554) 360-2187','mcootes2a@usnews.com',23,12),(84,'Patty','Baggelley','+62 (582) 983-2566','pbaggelley2b@irs.gov',12,5),(85,'Kirsti','Spat','+46 (903) 464-9936','kspat2c@google.com.hk',46,34),(86,'Jaquelyn','Wareham','+7 (692) 903-6924','jwareham2d@blog.com',29,7),(87,'Maudie','Ball','+86 (963) 243-0631','mball2e@t.co',34,7),(88,'Charil','Sandbach','+86 (741) 201-3264','csandbach2f@engadget.com',24,34),(89,'Florinda','Cisson','+62 (417) 100-6930','fcisson2g@nsw.gov.au',16,39),(90,'Ddene','Kinloch','+967 (174) 560-0947','dkinloch2h@desdev.cn',14,7),(91,'Alex','Simyson','+972 (871) 719-2498','asimyson2i@jugem.jp',43,5),(92,'Ira','Jacobsen','+7 (267) 815-9053','ijacobsen2j@desdev.cn',35,46),(93,'Jeramie','Bartak','+48 (782) 955-4484','jbartak2k@livejournal.com',5,15),(94,'Lida','Lothlorien','+994 (550) 570-2585','llothlorien2l@csmonitor.com',7,11),(95,'Stafani','Wickardt','+86 (462) 166-0509','swickardt2m@goo.ne.jp',36,23),(96,'Jess','Mulhill','+1 (501) 361-9434','jmulhill2n@who.int',37,17),(97,'Orrin','Keneforde','+420 (364) 302-3820','okeneforde2o@vistaprint.com',45,14),(98,'Horst','Velte','+351 (782) 546-8152','hvelte2p@deviantart.com',33,32),(99,'Lorri','Sharvill','+420 (569) 553-9317','lsharvill2q@nifty.com',48,12),(100,'Margarette','Macon','+30 (250) 180-8867','mmacon2r@exblog.jp',47,15),(101,'Elwin','Rampley','+63 (599) 119-0689','erampley2s@opera.com',23,50),(102,'Alfred','Dansey','+55 (848) 212-1843','adansey2t@buzzfeed.com',43,18),(103,'Terrill','Westcott','+86 (479) 963-8984','twestcott2u@nifty.com',11,39),(104,'Katalin','Capps','+86 (391) 555-5786','kcapps2v@ucoz.com',10,16),(105,'Uriah','Tenniswood','+86 (764) 521-4394','utenniswood2w@twitpic.com',24,13),(106,'Farlee','Alelsandrovich','+41 (403) 335-0157','falelsandrovich2x@photobucket.com',41,49),(107,'Edin','Kringe','+63 (879) 597-1069','ekringe2y@theguardian.com',23,14),(108,'Cheri','Machans','+93 (877) 860-5537','cmachans2z@indiatimes.com',15,32),(109,'Sonya','Ianiello','+998 (983) 639-4629','sianiello30@berkeley.edu',27,2),(110,'Jacquie','Fulle','+963 (155) 586-3032','jfulle31@barnesandnoble.com',45,10),(111,'Eugene','Roycroft','+46 (990) 290-1804','eroycroft32@booking.com',25,14),(112,'Minni','McGhie','+86 (656) 432-6485','mmcghie33@blinklist.com',37,22),(113,'Alvina','Aplin','+62 (492) 575-1426','aaplin34@rambler.ru',47,50),(114,'Harlene','Covelle','+63 (655) 244-3160','hcovelle35@weather.com',12,4),(115,'Samaria','Romain','+380 (509) 718-1412','sromain36@icio.us',16,25),(116,'Berty','Reeder','+62 (568) 922-0592','breeder37@sohu.com',1,15),(117,'Nadya','Breckin','+81 (492) 209-8139','nbreckin38@slideshare.net',3,37),(118,'Phylis','Keynd','+54 (172) 391-6985','pkeynd39@prlog.org',48,47),(119,'Chloette','Dudden','+351 (363) 888-1596','cdudden3a@alibaba.com',47,34),(120,'Karina','Nasi','+352 (696) 218-1479','knasi3b@last.fm',44,20),(121,'Verla','Abramovici','+48 (821) 715-9129','vabramovici3c@blog.com',44,11),(122,'Roosevelt','Ebenezer','+46 (736) 578-9520','rebenezer3d@thetimes.co.uk',29,15),(123,'Misty','Antoshin','+212 (671) 612-4752','mantoshin3e@wiley.com',44,31),(124,'Ignatius','Kennealy','+1 (614) 657-0572','ikennealy3f@clickbank.net',22,20),(125,'Elwood','Reinert','+389 (474) 916-5179','ereinert3g@mapy.cz',6,5),(126,'Carmel','Dolling','+383 (636) 501-8742','cdolling3h@blogger.com',25,17),(127,'Bryant','Johl','+86 (145) 314-2169','bjohl3i@apache.org',16,4),(128,'Natasha','Caustic','+86 (826) 853-9133','ncaustic3j@usgs.gov',2,25),(129,'Merline','Yakubovics','+63 (941) 827-7561','myakubovics3k@instagram.com',38,32),(130,'Clarabelle','Duding','+86 (310) 395-0236','cduding3l@nydailynews.com',11,29),(131,'Kali','Vanne','+57 (836) 413-2862','kvanne3m@washington.edu',17,16),(132,'Berri','Corday','+502 (473) 851-5768','bcorday3n@engadget.com',18,50),(133,'Ania','Boyat','+593 (345) 323-1103','aboyat3o@eventbrite.com',21,36),(134,'Leicester','Fairest','+62 (333) 667-1358','lfairest3p@slate.com',39,6),(135,'Phillipp','Trouel','+86 (337) 364-4776','ptrouel3q@sohu.com',47,36),(136,'Red','Kellen','+86 (519) 609-5101','rkellen3r@homestead.com',31,34),(137,'Nolan','Yerson','+86 (750) 387-7570','nyerson3s@trellian.com',44,17),(138,'Sean','O\'Neary','+86 (356) 458-3580','soneary3t@census.gov',37,4),(139,'Peder','Stilling','+381 (860) 337-5317','pstilling3u@reuters.com',27,30),(140,'Lacie','Janisson','+62 (826) 758-5574','ljanisson3v@youku.com',21,12),(141,'Jenn','Consadine','+353 (133) 447-0224','jconsadine3w@amazon.co.uk',45,11),(142,'Miquela','Djorevic','+62 (956) 370-6778','mdjorevic3x@businesswire.com',32,30),(143,'Ignacio','Chichgar','+86 (319) 666-1782','ichichgar3y@youtube.com',44,14),(144,'Penrod','Bridgwood','+856 (106) 764-0312','pbridgwood3z@sitemeter.com',26,2),(145,'Myron','Bembrigg','+375 (524) 757-3572','mbembrigg40@spotify.com',44,43),(146,'Thain','Layhe','+7 (287) 658-8706','tlayhe41@nifty.com',50,2),(147,'Petronia','Zannelli','+7 (418) 630-1048','pzannelli42@cbc.ca',28,1),(148,'Allayne','Olenchenko','+7 (678) 292-3759','aolenchenko43@w3.org',46,32),(149,'Johny','Winckle','+509 (645) 986-6194','jwinckle44@theguardian.com',26,45),(150,'Konstantine','Dukesbury','+63 (653) 746-5288','kdukesbury45@zdnet.com',21,21),(151,'Lavinie','Osmon','+385 (663) 484-5372','losmon46@free.fr',44,48),(152,'Garfield','Rumsby','+49 (832) 660-9303','grumsby47@hp.com',17,48),(153,'Evin','Haskur','+7 (810) 666-9354','ehaskur48@list-manage.com',2,22),(154,'Renaldo','Aspinall','+55 (754) 971-3595','raspinall49@bandcamp.com',18,7),(155,'Leola','Rudolf','+509 (110) 367-7551','lrudolf4a@etsy.com',1,39),(156,'Pooh','Crennan','+385 (211) 977-1832','pcrennan4b@theatlantic.com',27,48),(157,'Agnese','Mogford','+52 (170) 521-6194','amogford4c@walmart.com',24,1),(158,'Silvester','Beldon','+51 (995) 767-1270','sbeldon4d@altervista.org',33,13),(159,'Meyer','Gittens','+7 (520) 683-1656','mgittens4e@apache.org',25,25),(160,'Chery','Francom','+964 (944) 741-9410','cfrancom4f@nifty.com',40,26),(161,'Cathyleen','Dawes','+7 (560) 963-5941','cdawes4g@chronoengine.com',28,17),(162,'Keelia','Hannah','+1 (891) 853-2361','khannah4h@artisteer.com',23,14),(163,'Dalis','Sivess','+55 (787) 742-6492','dsivess4i@redcross.org',48,7),(164,'Shana','Batthew','+86 (587) 742-9633','sbatthew4j@google.pl',10,21),(165,'Katrine','Fownes','+7 (153) 246-3766','kfownes4k@engadget.com',20,39),(166,'Alick','Hatto','+84 (583) 291-5152','ahatto4l@themeforest.net',38,7),(167,'Claudie','Gergely','+86 (901) 692-8920','cgergely4m@google.it',3,49),(168,'Jorgan','Oddey','+7 (525) 188-6422','joddey4n@ifeng.com',19,28),(169,'Bendite','Tromans','+48 (783) 264-8889','btromans4o@edublogs.org',33,13),(170,'Irwin','Banaszewski','+86 (420) 650-1714','ibanaszewski4p@tinyurl.com',32,47),(171,'Giustino','Ferguson','+86 (131) 541-7133','gferguson4q@dailymail.co.uk',49,34),(172,'Jenine','Dyball','+60 (847) 985-6432','jdyball4r@163.com',45,25),(173,'Caesar','Herries','+351 (523) 629-0847','cherries4s@netvibes.com',8,19),(174,'Adah','Arpin','+86 (662) 821-9746','aarpin4t@admin.ch',17,27),(175,'Kerrie','Roubay','+1 (913) 835-4559','kroubay4u@psu.edu',17,33),(176,'Ferrell','Nisby','+86 (655) 914-8070','fnisby4v@wix.com',48,50),(177,'Fabiano','Browett','+86 (720) 842-5663','fbrowett4w@businessweek.com',14,42),(178,'Barnard','Jimenez','+82 (160) 355-0010','bjimenez4x@ca.gov',50,41),(179,'Monti','Bamlett','+86 (101) 178-0544','mbamlett4y@slate.com',18,45),(180,'Wilburt','Matteini','+351 (107) 870-2642','wmatteini4z@cdbaby.com',23,9),(181,'Salomi','Hackinge','+62 (881) 790-9208','shackinge50@buzzfeed.com',50,30),(182,'Jory','Roycroft','+420 (103) 911-3534','jroycroft51@ustream.tv',15,33),(183,'Nelia','Mayes','+351 (634) 689-0260','nmayes52@huffingtonpost.com',24,29),(184,'Marchall','Tallboy','+84 (556) 558-8376','mtallboy53@example.com',37,30),(185,'Randy','Coverlyn','+62 (592) 731-6449','rcoverlyn54@accuweather.com',31,2),(186,'Amandi','Groombridge','+63 (570) 331-3699','agroombridge55@mapy.cz',46,34),(187,'Brok','Tyler','+380 (635) 857-8119','btyler56@about.me',36,13),(188,'Rudie','Getcliffe','+45 (418) 245-5765','rgetcliffe57@microsoft.com',21,4),(189,'Raina','Stephens','+216 (998) 212-3148','rstephens58@usda.gov',41,41),(190,'Abe','Gashion','+86 (770) 223-9548','agashion59@biblegateway.com',45,29),(191,'Bjorn','Buckerfield','+86 (379) 486-9352','bbuckerfield5a@mozilla.org',18,50),(192,'Manon','Gylle','+380 (181) 392-0920','mgylle5b@fema.gov',16,40),(193,'Zebulen','Billington','+54 (674) 420-0630','zbillington5c@clickbank.net',25,20),(194,'Terrijo','Kosiada','+86 (985) 594-5940','tkosiada5d@skyrock.com',31,26),(195,'Boony','Thombleson','+7 (954) 370-1998','bthombleson5e@google.nl',37,15),(196,'Dari','Trenfield','+30 (392) 323-6725','dtrenfield5f@is.gd',40,6),(197,'Kimberlyn','Beer','+48 (192) 775-9434','kbeer5g@icio.us',15,27),(198,'Estevan','Rivilis','+63 (741) 175-3440','erivilis5h@spiegel.de',18,16),(199,'Arlana','Gadeaux','+86 (349) 675-7662','agadeaux5i@sogou.com',15,42),(200,'Eimile','Guinan','+502 (397) 647-2971','eguinan5j@cnn.com',27,38);
/*!40000 ALTER TABLE `Customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DeliveryCompany`
--

DROP TABLE IF EXISTS `DeliveryCompany`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DeliveryCompany` (
  `CompanyID` int NOT NULL,
  `CompanyName` varchar(30) DEFAULT NULL,
  `PhoneNo` varchar(35) DEFAULT NULL,
  `RepresentID` int NOT NULL,
  `AddressInfo` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`CompanyID`),
  KEY `FK_RepresentID` (`RepresentID`),
  CONSTRAINT `FK_RepresentID` FOREIGN KEY (`RepresentID`) REFERENCES `Representatives` (`RepresentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DeliveryCompany`
--

LOCK TABLES `DeliveryCompany` WRITE;
/*!40000 ALTER TABLE `DeliveryCompany` DISABLE KEYS */;
/*!40000 ALTER TABLE `DeliveryCompany` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Departments`
--

DROP TABLE IF EXISTS `Departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Departments` (
  `DepartmID` int NOT NULL,
  `DepartmName` varchar(50) NOT NULL,
  PRIMARY KEY (`DepartmID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Departments`
--

LOCK TABLES `Departments` WRITE;
/*!40000 ALTER TABLE `Departments` DISABLE KEYS */;
INSERT INTO `Departments` VALUES (1,'Sales'),(2,'Support'),(3,'Returns'),(4,'Service');
/*!40000 ALTER TABLE `Departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Locations`
--

DROP TABLE IF EXISTS `Locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Locations` (
  `LocationID` int NOT NULL,
  `LocationN` varchar(10) NOT NULL,
  PRIMARY KEY (`LocationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Locations`
--

LOCK TABLES `Locations` WRITE;
/*!40000 ALTER TABLE `Locations` DISABLE KEYS */;
INSERT INTO `Locations` VALUES (1,'Dublin S1'),(2,'Dublin S2'),(3,'Cork Store'),(4,'Warehouse');
/*!40000 ALTER TABLE `Locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ModelNames`
--

DROP TABLE IF EXISTS `ModelNames`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ModelNames` (
  `ModelNameID` int NOT NULL,
  `ModelName` varchar(15) NOT NULL,
  PRIMARY KEY (`ModelNameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ModelNames`
--

LOCK TABLES `ModelNames` WRITE;
/*!40000 ALTER TABLE `ModelNames` DISABLE KEYS */;
INSERT INTO `ModelNames` VALUES (1,'Speedy'),(2,'Tote'),(3,'Nil'),(4,'Keepall'),(5,'Pouch'),(6,'Elise'),(7,'Neverfull'),(8,'Note'),(9,'Saumur'),(10,'Birkin'),(11,'Timeless');
/*!40000 ALTER TABLE `ModelNames` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrderItems`
--

DROP TABLE IF EXISTS `OrderItems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OrderItems` (
  `OrderItemID` int NOT NULL,
  `ItemID` int NOT NULL,
  `Quantity` int NOT NULL,
  `OrderID` int NOT NULL,
  PRIMARY KEY (`OrderItemID`),
  KEY `FK_ItemID` (`ItemID`),
  KEY `FK_OrderItemsOrderID` (`OrderID`),
  CONSTRAINT `FK_ItemID` FOREIGN KEY (`ItemID`) REFERENCES `Stock` (`ItemID`),
  CONSTRAINT `FK_OrderItemsOrderID` FOREIGN KEY (`OrderID`) REFERENCES `Orders` (`OrderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderItems`
--

LOCK TABLES `OrderItems` WRITE;
/*!40000 ALTER TABLE `OrderItems` DISABLE KEYS */;
INSERT INTO `OrderItems` VALUES (1,3,4,218),(2,49,3,210),(3,92,5,189),(4,46,3,137),(5,87,4,201),(6,50,3,243),(7,24,4,142),(8,98,4,148),(9,50,5,129),(10,26,1,268),(11,79,5,299),(12,57,1,82),(13,34,1,146),(14,38,3,25),(15,24,5,262),(16,69,5,146),(17,36,5,18),(18,92,2,156),(19,7,3,240),(20,18,5,173),(21,60,5,5),(22,20,2,2),(23,73,3,244),(24,87,5,298),(25,10,5,108),(26,70,3,157),(27,38,1,287),(28,86,4,245),(29,97,1,246),(30,1,2,197),(31,26,4,264),(32,87,3,78),(33,72,5,159),(34,10,1,260),(35,37,1,300),(36,39,4,191),(37,34,2,129),(38,29,5,8),(39,52,2,114),(40,33,1,78),(41,35,2,229),(42,19,2,293),(43,5,3,75),(44,13,4,205),(45,35,1,201),(46,63,3,186),(47,49,2,172),(48,54,4,279),(49,10,3,115),(50,2,1,51),(51,7,3,199),(52,23,5,80),(53,86,3,76),(54,15,3,132),(55,92,4,224),(56,43,2,169),(57,81,3,210),(58,22,2,69),(59,26,1,79),(60,35,5,278),(61,97,4,60),(62,46,5,233),(63,19,1,155),(64,53,1,254),(65,75,5,45),(66,32,4,229),(67,23,1,82),(68,65,4,60),(69,90,3,203),(70,37,4,36),(71,77,5,3),(72,23,1,17),(73,35,3,170),(74,100,4,109),(75,54,5,114),(76,70,1,101),(77,38,3,124),(78,21,4,123),(79,89,4,221),(80,37,4,235),(81,23,3,13),(82,60,3,294),(83,5,3,266),(84,62,3,111),(85,17,3,90),(86,35,5,161),(87,94,3,210),(88,59,2,176),(89,78,1,78),(90,75,4,266),(91,33,4,298),(92,26,1,92),(93,75,1,110),(94,30,1,159),(95,45,3,143),(96,76,1,234),(97,89,2,96),(98,11,3,242),(99,8,2,181),(100,39,3,25),(101,88,3,218),(102,81,2,131),(103,81,5,197),(104,34,1,176),(105,69,1,183),(106,62,4,251),(107,75,4,258),(108,14,4,110),(109,71,3,140),(110,76,5,225),(111,87,2,150),(112,23,4,193),(113,24,5,290),(114,97,5,11),(115,19,5,92),(116,77,4,239),(117,53,4,89),(118,85,4,123),(119,38,4,114),(120,22,3,110),(121,53,4,77),(122,82,4,165),(123,52,1,3),(124,86,4,222),(125,59,5,27),(126,77,4,277),(127,26,5,291),(128,2,1,286),(129,86,3,221),(130,52,4,223),(131,44,3,142),(132,36,3,296),(133,22,1,148),(134,1,3,83),(135,50,2,145),(136,70,2,68),(137,7,1,209),(138,95,4,132),(139,43,1,249),(140,42,1,223),(141,83,2,256),(142,40,3,147),(143,52,3,266),(144,90,2,12),(145,94,4,153),(146,22,2,238),(147,48,5,49),(148,15,3,252),(149,49,1,106),(150,71,5,13),(151,91,1,148),(152,61,3,193),(153,75,4,20),(154,4,2,149),(155,7,1,81),(156,35,1,265),(157,100,3,199),(158,90,2,151),(159,71,5,19),(160,75,1,77),(161,52,5,66),(162,55,2,260),(163,82,4,130),(164,1,5,195),(165,56,1,240),(166,3,1,57),(167,18,2,25),(168,5,5,142),(169,67,2,189),(170,78,3,146),(171,87,2,284),(172,38,4,277),(173,53,3,256),(174,67,2,34),(175,25,5,279),(176,68,2,101),(177,40,2,100),(178,47,5,82),(179,69,2,292),(180,33,5,126),(181,78,1,7),(182,67,2,238),(183,71,2,129),(184,3,1,296),(185,85,4,129),(186,18,1,39),(187,97,5,294),(188,11,5,286),(189,37,4,89),(190,2,5,239),(191,36,4,94),(192,97,5,128),(193,50,2,165),(194,91,2,226),(195,48,5,161),(196,80,5,135),(197,21,4,192),(198,87,3,68),(199,38,4,263),(200,3,3,143),(201,57,4,164),(202,71,2,115),(203,60,4,234),(204,4,1,232),(205,21,4,293),(206,70,5,168),(207,51,5,179),(208,38,5,261),(209,41,5,121),(210,36,4,186),(211,65,2,194),(212,68,1,182),(213,38,4,47),(214,71,4,30),(215,69,3,224),(216,52,2,39),(217,1,2,22),(218,47,1,148),(219,71,4,35),(220,83,3,279),(221,58,1,128),(222,64,5,261),(223,30,1,2),(224,48,3,294),(225,41,3,258),(226,72,2,11),(227,53,5,71),(228,33,1,187),(229,86,2,160),(230,24,1,246),(231,16,3,273),(232,85,5,25),(233,26,3,94),(234,41,1,281),(235,42,3,46),(236,56,2,183),(237,78,3,186),(238,89,5,197),(239,82,5,129),(240,56,1,101),(241,75,1,277),(242,66,5,251),(243,56,2,42),(244,51,5,184),(245,19,2,293),(246,52,4,274),(247,48,4,39),(248,84,3,177),(249,9,4,188),(250,26,2,295),(251,81,4,223),(252,85,3,26),(253,92,4,88),(254,42,2,149),(255,19,1,243),(256,13,3,209),(257,84,5,125),(258,4,2,127),(259,36,5,86),(260,92,2,177),(261,8,3,200),(262,9,2,224),(263,46,5,46),(264,58,1,274),(265,85,3,277),(266,44,2,219),(267,62,1,103),(268,86,4,241),(269,12,1,263),(270,57,4,44),(271,50,4,126),(272,80,2,58),(273,28,4,225),(274,86,3,18),(275,8,2,172),(276,59,5,259),(277,4,3,62),(278,12,5,243),(279,15,1,198),(280,63,1,164),(281,31,3,151),(282,42,1,232),(283,40,2,153),(284,11,1,188),(285,69,3,16),(286,70,2,159),(287,47,4,290),(288,11,3,113),(289,84,2,107),(290,29,2,140),(291,4,3,181),(292,22,1,150),(293,70,2,6),(294,89,5,94),(295,93,4,91),(296,25,2,142),(297,3,1,220),(298,96,5,241),(299,18,4,233),(300,23,3,245);
/*!40000 ALTER TABLE `OrderItems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrderReturn`
--

DROP TABLE IF EXISTS `OrderReturn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OrderReturn` (
  `ReturnID` int NOT NULL,
  `ReturnDate` date DEFAULT NULL,
  `OrderID` int NOT NULL,
  `PayMethodID` int NOT NULL,
  `StaffID` int NOT NULL,
  PRIMARY KEY (`ReturnID`),
  KEY `FK_ReturnOrderID` (`OrderID`),
  KEY `FK_ReturnPayTypeID` (`PayMethodID`),
  KEY `FK_ReturnStaffID` (`StaffID`),
  CONSTRAINT `FK_ReturnOrderID` FOREIGN KEY (`OrderID`) REFERENCES `Orders` (`OrderID`),
  CONSTRAINT `FK_ReturnPayTypeID` FOREIGN KEY (`PayMethodID`) REFERENCES `PaymentMethods` (`MethodID`),
  CONSTRAINT `FK_ReturnStaffID` FOREIGN KEY (`StaffID`) REFERENCES `Staff` (`StaffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderReturn`
--

LOCK TABLES `OrderReturn` WRITE;
/*!40000 ALTER TABLE `OrderReturn` DISABLE KEYS */;
/*!40000 ALTER TABLE `OrderReturn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Orders`
--

DROP TABLE IF EXISTS `Orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Orders` (
  `OrderID` int NOT NULL,
  `OrderDate` date DEFAULT NULL,
  `TotalPrice` decimal(6,2) NOT NULL,
  `PaymentID` int NOT NULL,
  `OrderStatusID` int NOT NULL,
  `StaffID` int NOT NULL,
  `CustomerID` int NOT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `FK_OrderStatusID` (`OrderStatusID`),
  KEY `FK_PaymentID` (`PaymentID`),
  KEY `FK_StaffID` (`StaffID`),
  KEY `FK_CustomerID` (`CustomerID`),
  CONSTRAINT `FK_CustomerID` FOREIGN KEY (`CustomerID`) REFERENCES `Customers` (`CustomerID`),
  CONSTRAINT `FK_OrderStatusID` FOREIGN KEY (`OrderStatusID`) REFERENCES `OrderStatus` (`OrderStatusID`),
  CONSTRAINT `FK_PaymentID` FOREIGN KEY (`PaymentID`) REFERENCES `Payments` (`PaymentID`),
  CONSTRAINT `FK_StaffID` FOREIGN KEY (`StaffID`) REFERENCES `Staff` (`StaffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Orders`
--

LOCK TABLES `Orders` WRITE;
/*!40000 ALTER TABLE `Orders` DISABLE KEYS */;
INSERT INTO `Orders` VALUES (1,'2020-06-14',465.61,2,2,13,16),(2,'2021-10-04',694.40,1,1,27,10),(3,'2021-11-29',5476.10,2,1,16,135),(4,'2021-06-09',8188.41,2,1,5,195),(5,'2021-10-24',3836.08,3,2,26,108),(6,'2021-08-14',7515.77,3,1,30,29),(7,'2021-06-15',9247.20,2,1,14,137),(8,'2021-02-14',2804.01,2,1,5,126),(9,'2021-10-03',4281.57,3,2,25,80),(10,'2021-02-08',8826.01,3,2,3,191),(11,'2021-08-07',9339.47,2,2,5,92),(12,'2021-04-26',2322.65,2,2,11,105),(13,'2021-01-04',6626.04,2,2,10,88),(14,'2021-05-17',9602.07,2,2,22,23),(15,'2021-05-11',1377.07,3,3,21,141),(16,'2021-11-05',3545.59,3,3,29,105),(17,'2021-07-25',6512.32,1,1,15,71),(18,'2021-10-19',6521.19,1,3,24,103),(19,'2021-09-28',6609.06,1,3,12,92),(20,'2021-02-25',5475.72,3,3,13,24),(21,'2021-10-09',4627.19,1,1,19,146),(22,'2021-11-13',7689.92,2,3,20,15),(23,'2021-06-16',7396.79,2,1,26,9),(24,'2021-09-07',6056.31,3,2,26,129),(25,'2021-06-25',9477.07,2,2,20,100),(26,'2021-08-06',6758.47,2,1,23,97),(27,'2021-07-27',6871.21,3,2,19,129),(28,'2021-05-31',993.89,1,3,15,42),(29,'2021-01-09',619.37,2,3,8,83),(30,'2021-02-06',6365.11,1,1,20,34),(31,'2021-06-22',864.31,2,1,2,196),(32,'2021-02-17',1072.43,1,1,19,175),(33,'2021-06-01',4043.77,2,2,24,93),(34,'2021-01-13',9349.58,2,1,30,145),(35,'2021-07-19',2060.86,3,3,8,68),(36,'2021-01-11',7526.84,3,1,2,21),(37,'2021-08-09',2819.93,2,1,26,25),(38,'2021-04-09',8107.46,3,1,3,76),(39,'2021-09-25',7400.19,2,3,1,169),(40,'2021-04-26',1486.82,3,3,24,164),(41,'2021-06-28',8717.65,3,1,3,9),(42,'2021-10-27',8632.96,1,1,18,94),(43,'2021-04-11',4958.16,3,3,7,180),(44,'2021-08-28',1878.02,3,1,2,134),(45,'2021-11-28',4356.84,3,3,5,120),(46,'2021-02-22',2868.67,2,2,13,31),(47,'2021-06-20',5455.36,1,2,12,90),(48,'2021-06-14',5875.58,3,2,21,97),(49,'2021-10-25',9881.80,3,2,17,131),(50,'2021-06-29',9123.24,3,1,24,66),(51,'2021-11-09',2705.00,1,3,16,72),(52,'2021-04-23',2105.30,2,1,22,108),(53,'2021-05-08',2529.60,2,3,28,96),(54,'2021-11-22',3083.21,2,1,22,187),(55,'2021-06-03',9472.86,1,1,29,129),(56,'2021-04-10',4967.08,3,2,21,19),(57,'2021-01-13',4078.18,1,1,16,3),(58,'2021-08-20',6549.05,1,1,7,15),(59,'2021-04-28',7705.33,1,1,10,113),(60,'2021-08-06',4384.33,2,3,10,91),(61,'2021-01-02',1132.84,2,2,4,8),(62,'2021-07-25',3929.34,2,3,5,151),(63,'2021-01-21',8792.10,2,1,22,122),(64,'2021-01-28',6793.48,1,3,17,110),(65,'2021-10-18',4442.23,3,3,2,55),(66,'2021-10-09',5286.97,2,1,27,188),(67,'2021-08-07',7006.00,1,1,15,125),(68,'2021-11-28',7506.49,2,3,13,194),(69,'2021-04-25',8759.66,3,3,20,120),(70,'2021-05-17',2117.50,1,2,14,6),(71,'2021-04-25',3089.21,2,2,25,8),(72,'2021-01-14',6142.84,1,1,18,173),(73,'2021-10-03',5456.90,3,2,26,120),(74,'2021-03-06',1751.87,2,2,15,198),(75,'2021-09-04',7754.00,2,1,25,161),(76,'2021-03-27',693.70,1,3,4,199),(77,'2021-01-04',527.59,3,2,19,85),(78,'2021-07-02',2699.70,2,3,8,154),(79,'2021-04-26',4881.64,2,2,8,194),(80,'2021-08-29',5363.15,2,1,16,83),(81,'2021-05-20',7721.04,1,3,27,85),(82,'2021-07-12',8143.37,3,1,10,11),(83,'2021-03-01',3757.76,1,2,20,138),(84,'2021-05-05',6047.97,1,2,13,74),(85,'2021-02-17',5083.23,2,1,8,156),(86,'2021-02-28',9638.80,3,1,9,48),(87,'2021-08-14',2109.74,3,1,18,2),(88,'2021-05-03',2086.55,3,3,8,162),(89,'2021-01-06',5894.36,3,3,16,118),(90,'2021-03-10',8217.08,1,1,12,21),(91,'2021-07-26',5296.51,1,2,18,120),(92,'2021-02-13',4714.09,3,2,18,40),(93,'2021-05-16',4073.56,2,1,7,9),(94,'2021-10-23',9790.34,1,3,27,131),(95,'2021-06-08',8333.58,3,1,12,20),(96,'2021-03-28',7123.32,2,3,20,90),(97,'2021-11-29',7111.13,3,1,2,39),(98,'2021-04-13',9326.06,3,2,28,160),(99,'2021-09-28',6403.93,3,2,21,98),(100,'2021-08-30',4752.16,2,2,18,166),(101,'2021-11-04',8739.52,1,1,16,187),(102,'2021-04-03',7858.91,2,1,12,136),(103,'2021-05-25',6635.07,3,2,18,30),(104,'2021-03-01',2563.60,3,1,3,24),(105,'2021-06-25',4688.00,1,2,29,185),(106,'2021-06-05',9224.93,3,1,15,182),(107,'2021-02-03',1737.79,2,3,29,126),(108,'2021-11-19',8855.06,2,3,18,116),(109,'2021-09-13',7097.64,1,2,27,32),(110,'2021-01-25',5907.82,1,3,2,89),(111,'2021-01-15',5313.98,2,3,16,43),(112,'2021-01-14',1280.27,2,3,28,24),(113,'2021-11-20',4629.79,1,3,18,55),(114,'2021-04-15',810.64,1,3,14,116),(115,'2021-07-28',8077.95,3,2,18,185),(116,'2021-08-25',4828.42,3,1,14,192),(117,'2021-01-09',3849.17,3,2,24,112),(118,'2021-07-15',2114.06,1,1,28,153),(119,'2021-01-01',9363.12,2,3,14,52),(120,'2021-05-28',4935.37,1,1,24,127),(121,'2021-06-13',1547.80,3,1,28,190),(122,'2021-06-06',6584.37,1,1,2,112),(123,'2021-06-23',5147.42,3,2,28,45),(124,'2021-10-13',3845.13,1,2,26,198),(125,'2021-09-19',4953.65,3,2,8,47),(126,'2021-05-16',6190.89,1,1,11,54),(127,'2021-03-17',9016.50,3,2,15,29),(128,'2021-08-30',3782.98,2,2,15,30),(129,'2021-03-31',2689.36,1,2,29,148),(130,'2021-11-22',639.81,2,1,29,108),(131,'2021-03-29',688.76,2,2,19,83),(132,'2021-01-07',3822.54,2,2,15,164),(133,'2021-08-27',8117.60,2,2,28,122),(134,'2021-11-02',4609.12,2,1,22,4),(135,'2021-01-11',6997.96,3,2,26,187),(136,'2021-11-07',2145.46,1,1,8,160),(137,'2021-08-12',5288.77,2,3,13,107),(138,'2021-10-19',1948.77,3,3,11,59),(139,'2021-10-12',3109.30,1,3,5,13),(140,'2021-08-04',9058.38,2,1,28,198),(141,'2021-05-25',7970.11,1,3,1,158),(142,'2021-09-16',7698.79,3,2,18,70),(143,'2021-01-23',6523.32,3,3,10,128),(144,'2021-10-13',2879.79,3,2,19,180),(145,'2021-04-28',3623.04,1,2,21,6),(146,'2021-09-13',5508.94,1,2,7,112),(147,'2021-08-08',5609.52,2,3,13,131),(148,'2021-06-11',4616.32,1,3,21,198),(149,'2021-09-23',5400.66,2,1,9,59),(150,'2021-02-12',9714.18,1,2,3,62),(151,'2021-11-14',4074.55,3,1,27,64),(152,'2021-04-08',3039.28,2,3,30,164),(153,'2021-04-23',4613.74,1,2,30,22),(154,'2021-05-03',3258.86,1,2,25,115),(155,'2021-11-22',759.02,1,2,6,131),(156,'2021-07-16',1855.97,2,3,24,126),(157,'2021-06-15',8855.88,1,2,7,17),(158,'2021-09-18',9805.77,3,3,1,99),(159,'2021-09-04',4692.40,1,2,4,92),(160,'2021-03-14',8152.74,3,2,27,73),(161,'2021-03-15',4501.65,3,2,26,106),(162,'2021-06-13',4934.65,3,3,5,10),(163,'2021-10-30',3867.34,3,1,21,108),(164,'2021-10-05',8517.21,3,2,4,3),(165,'2021-08-23',8700.68,1,2,9,70),(166,'2021-04-09',7681.47,3,3,11,79),(167,'2021-10-22',3397.91,3,3,14,196),(168,'2021-09-16',9182.63,1,3,2,50),(169,'2021-09-28',8241.25,2,3,10,33),(170,'2021-06-02',4791.02,2,3,8,62),(171,'2021-08-28',4297.68,3,2,23,37),(172,'2021-09-19',609.50,1,1,24,129),(173,'2021-05-29',6103.99,3,2,25,50),(174,'2021-07-25',8175.59,3,3,25,130),(175,'2021-02-17',5103.29,1,3,26,155),(176,'2021-11-11',1476.26,2,1,3,141),(177,'2021-11-11',7793.13,1,1,17,120),(178,'2021-02-18',5507.09,3,2,30,79),(179,'2021-04-19',9000.14,1,2,30,179),(180,'2021-07-09',9846.59,2,2,10,140),(181,'2021-07-25',6134.82,2,3,12,141),(182,'2021-11-12',2063.46,1,2,3,187),(183,'2021-02-26',5698.06,1,2,7,52),(184,'2021-05-28',4648.78,3,1,13,157),(185,'2021-05-08',8816.24,1,3,17,35),(186,'2021-10-28',393.85,1,1,30,85),(187,'2021-11-06',6401.32,2,2,6,161),(188,'2021-08-20',4380.72,2,3,7,5),(189,'2021-11-15',8224.20,2,3,28,11),(190,'2021-11-26',722.20,1,2,24,186),(191,'2021-05-02',9401.74,3,2,5,178),(192,'2021-05-11',7463.37,2,2,25,83),(193,'2021-05-22',3888.12,1,3,28,39),(194,'2021-04-17',9549.82,1,1,28,174),(195,'2021-06-06',5022.21,2,1,11,154),(196,'2021-05-02',4916.28,2,3,2,169),(197,'2021-06-29',8672.89,1,1,21,76),(198,'2021-06-18',5086.84,1,2,7,130),(199,'2021-05-02',9589.35,2,1,18,50),(200,'2021-11-04',7466.47,3,3,20,122),(201,'2021-10-24',1810.59,1,3,28,53),(202,'2021-04-10',2461.79,3,1,26,145),(203,'2021-11-10',6838.35,2,3,25,128),(204,'2021-08-11',3937.59,1,1,16,188),(205,'2021-03-17',5112.95,3,2,19,184),(206,'2021-03-03',3885.90,2,1,4,42),(207,'2021-08-09',4033.29,2,3,2,44),(208,'2021-01-02',4362.53,2,1,30,53),(209,'2021-11-23',6836.26,1,1,21,196),(210,'2021-05-14',9990.57,2,2,15,11),(211,'2021-09-27',1207.75,3,1,26,61),(212,'2021-10-19',8307.64,2,3,19,179),(213,'2021-10-23',1460.48,2,1,15,104),(214,'2021-04-19',3426.21,1,1,30,36),(215,'2021-11-23',8603.16,1,1,4,28),(216,'2021-05-24',2037.74,1,2,29,140),(217,'2021-04-15',7466.46,3,2,29,41),(218,'2021-05-30',2794.83,2,1,18,185),(219,'2021-11-20',7937.83,3,2,26,116),(220,'2021-03-28',1064.43,2,1,15,97),(221,'2021-05-27',1043.78,3,1,1,64),(222,'2021-01-22',7016.67,1,2,8,113),(223,'2021-11-08',740.95,3,1,21,89),(224,'2021-08-31',9212.27,1,3,23,178),(225,'2021-11-06',471.71,2,2,17,36),(226,'2021-02-22',5238.28,1,2,22,67),(227,'2021-10-02',9873.91,1,3,7,24),(228,'2021-05-05',7213.13,1,2,9,11),(229,'2021-01-02',4312.05,1,3,12,189),(230,'2021-04-06',5404.21,2,3,18,88),(231,'2021-07-12',391.11,2,2,14,94),(232,'2021-05-25',1868.54,2,3,3,171),(233,'2021-09-01',6543.13,1,1,9,25),(234,'2021-03-07',3477.64,1,2,21,33),(235,'2021-01-05',1384.93,1,1,6,43),(236,'2021-02-27',1416.04,1,2,18,193),(237,'2021-10-07',8116.84,3,1,28,183),(238,'2021-02-25',7906.19,2,2,11,134),(239,'2021-11-27',2333.95,2,3,15,63),(240,'2021-04-23',5972.60,1,2,2,66),(241,'2021-04-24',6440.82,1,3,20,146),(242,'2021-06-15',7045.75,1,2,8,34),(243,'2021-03-29',6571.69,2,1,12,179),(244,'2021-10-30',9030.86,3,3,9,47),(245,'2021-10-29',5789.42,3,3,3,105),(246,'2021-04-04',9011.53,2,3,18,8),(247,'2021-05-01',6722.54,1,1,11,102),(248,'2021-05-05',9568.40,3,2,24,192),(249,'2021-10-21',3935.13,2,1,10,122),(250,'2021-01-10',3698.18,2,3,1,92),(251,'2021-01-06',6554.75,1,1,17,20),(252,'2021-08-26',1477.14,2,1,6,13),(253,'2021-09-01',822.00,1,1,16,157),(254,'2021-01-15',739.04,1,1,15,137),(255,'2021-04-05',8951.95,3,3,21,177),(256,'2021-06-09',775.93,3,1,12,1),(257,'2021-06-19',4711.49,3,3,3,62),(258,'2021-09-23',6670.07,1,2,26,113),(259,'2021-01-31',6453.91,2,1,19,102),(260,'2021-06-16',5359.30,1,1,20,169),(261,'2021-10-29',3968.99,3,3,5,128),(262,'2021-01-31',2407.50,2,1,29,73),(263,'2021-01-10',711.12,1,1,24,66),(264,'2021-06-24',9671.23,1,1,17,99),(265,'2021-07-02',1829.99,1,2,18,113),(266,'2021-06-06',1024.72,1,2,12,181),(267,'2021-09-12',6037.96,3,2,9,132),(268,'2021-01-06',9703.42,3,3,26,177),(269,'2021-10-28',9800.88,3,2,16,26),(270,'2021-07-27',9266.80,1,1,30,79),(271,'2021-10-26',9606.45,1,1,3,36),(272,'2021-01-08',4786.34,3,2,6,67),(273,'2021-09-14',7568.80,3,3,7,152),(274,'2021-11-02',4283.17,1,3,25,143),(275,'2021-10-28',7718.14,3,3,4,15),(276,'2021-03-31',4145.16,3,2,9,70),(277,'2021-09-29',6227.84,1,3,28,64),(278,'2021-01-16',8604.07,2,2,21,105),(279,'2021-09-30',5273.34,3,1,16,5),(280,'2021-04-12',1451.55,2,2,3,14),(281,'2021-10-07',4700.21,3,1,27,51),(282,'2021-06-24',1695.60,1,2,10,110),(283,'2021-01-27',8550.30,1,1,30,78),(284,'2021-01-25',6726.00,3,3,20,106),(285,'2021-03-25',7652.61,2,2,23,89),(286,'2021-05-28',8857.41,1,2,18,13),(287,'2021-08-22',8340.49,1,1,24,52),(288,'2021-04-24',4076.63,3,2,12,98),(289,'2021-04-10',3482.83,3,2,20,15),(290,'2021-03-11',937.95,2,3,18,112),(291,'2021-02-14',6667.38,3,3,22,75),(292,'2021-07-08',2313.38,3,3,22,135),(293,'2021-06-14',1166.10,2,2,26,131),(294,'2021-06-22',7525.17,1,3,4,50),(295,'2021-02-26',8305.86,3,3,7,85),(296,'2021-04-20',2079.80,2,1,9,17),(297,'2021-03-08',3380.70,3,2,14,133),(298,'2021-11-28',7595.33,1,2,24,3),(299,'2021-04-22',6557.52,3,1,18,112),(300,'2021-08-14',8869.69,1,3,20,32),(301,'2021-06-12',2207.94,1,3,17,76),(302,'2021-02-07',4187.75,3,1,4,92),(303,'2021-04-14',1915.54,2,2,1,36),(304,'2021-04-23',8560.29,3,3,10,155),(305,'2021-01-17',9756.80,1,2,4,45),(306,'2021-03-24',7763.86,2,3,30,44),(307,'2021-06-26',3600.51,2,2,2,105),(308,'2021-01-10',2102.87,3,1,6,40),(309,'2021-03-11',4758.22,1,2,25,70),(310,'2021-02-25',9882.43,2,1,30,137),(311,'2021-04-04',3520.90,2,1,20,174),(312,'2021-03-19',3952.07,3,3,24,38),(313,'2021-01-19',7946.39,1,3,17,79),(314,'2021-07-12',326.23,3,2,29,163),(315,'2021-07-02',4234.18,3,1,20,96),(316,'2021-10-17',9910.90,2,1,24,154),(317,'2021-01-26',8933.36,3,2,28,135),(318,'2021-02-06',3429.38,3,3,3,44),(319,'2021-02-03',9234.02,3,2,28,78),(320,'2021-08-15',3908.53,3,2,27,158),(321,'2021-08-08',1586.51,1,1,9,151),(322,'2021-10-25',6292.73,2,3,4,6),(323,'2021-01-28',2914.76,3,3,11,112),(324,'2021-11-06',615.04,1,3,29,133),(325,'2021-01-03',2271.11,1,1,6,4),(326,'2021-06-01',4367.25,3,2,21,72),(327,'2021-06-17',4700.03,1,1,22,64),(328,'2021-04-21',5490.14,1,3,3,61),(329,'2021-10-08',2426.75,3,3,25,89),(330,'2021-06-29',4355.95,3,1,13,62),(331,'2021-05-01',1042.23,3,2,2,179),(332,'2021-08-15',1181.38,2,1,29,7),(333,'2021-05-03',3022.17,1,2,17,36),(334,'2021-05-12',4843.11,2,2,28,184),(335,'2021-08-05',3712.01,2,2,23,83),(336,'2021-06-13',2468.25,2,1,17,1),(337,'2021-04-16',2914.65,1,1,30,50),(338,'2021-04-22',6714.83,2,3,20,10),(339,'2021-01-06',6483.44,1,2,14,150),(340,'2021-03-29',5574.55,3,3,8,70),(341,'2021-03-08',7106.38,1,3,24,49),(342,'2021-03-22',6264.85,2,1,30,51),(343,'2021-05-24',393.50,3,1,24,79),(344,'2021-09-13',1828.63,1,1,25,74),(345,'2021-10-21',2687.56,3,2,13,193),(346,'2021-11-22',5705.56,2,3,15,199),(347,'2021-09-15',5152.42,1,3,16,72),(348,'2021-01-01',6594.55,2,2,11,69),(349,'2021-04-30',8412.19,2,1,19,85),(350,'2021-01-26',8720.84,1,2,24,27),(351,'2021-09-19',6876.78,2,1,30,138),(352,'2021-07-27',9219.88,1,1,24,105),(353,'2021-06-14',615.63,1,3,29,123),(354,'2021-09-24',2282.39,2,3,30,89),(355,'2021-04-17',4090.20,2,3,8,37),(356,'2021-06-19',6598.25,1,1,29,6),(357,'2021-03-20',1056.55,3,1,29,77),(358,'2021-08-02',2768.43,3,3,10,178),(359,'2021-07-18',673.55,3,1,1,76),(360,'2021-03-03',5861.72,1,3,22,33),(361,'2021-07-11',7032.68,3,2,4,184),(362,'2021-10-12',8919.01,3,2,4,60),(363,'2021-02-20',1778.08,1,1,10,3),(364,'2021-11-14',3283.32,1,1,4,160),(365,'2021-11-06',9576.77,1,1,30,26),(366,'2021-02-08',6001.97,1,3,1,4),(367,'2021-08-09',2517.55,1,2,11,193),(368,'2021-02-14',8269.03,2,3,9,33),(369,'2021-08-05',3736.83,2,2,5,169),(370,'2021-03-07',7899.60,2,3,2,117),(371,'2021-02-19',2494.83,3,3,16,125),(372,'2021-03-18',3856.13,3,3,8,156),(373,'2021-11-08',7552.34,2,3,28,156),(374,'2021-02-06',4898.03,3,3,5,178),(375,'2021-10-01',5672.84,2,2,14,43),(376,'2021-03-13',9763.59,2,3,10,85),(377,'2021-03-21',3173.48,3,3,15,152),(378,'2021-06-02',681.37,2,1,26,4),(379,'2021-09-07',5254.08,2,1,17,61),(380,'2021-06-10',1964.80,2,3,2,194),(381,'2021-02-22',5286.73,2,2,30,79),(382,'2021-01-30',7230.92,3,3,3,136),(383,'2021-01-23',3074.17,1,2,1,2),(384,'2021-03-21',7220.49,2,1,13,130),(385,'2021-06-01',5252.01,2,2,15,124),(386,'2021-01-10',5625.31,3,2,30,67),(387,'2021-05-30',9779.35,1,3,28,74),(388,'2021-08-24',7242.73,3,3,27,16),(389,'2021-07-13',3832.33,2,3,1,186),(390,'2021-05-07',5681.58,2,2,29,41),(391,'2021-05-23',7123.43,1,1,18,132),(392,'2021-07-21',9075.13,3,1,12,142),(393,'2021-11-28',6081.99,3,1,7,3),(394,'2021-06-22',2889.64,2,1,2,17),(395,'2021-07-18',8384.95,1,3,14,190),(396,'2021-02-24',1116.60,1,2,2,70),(397,'2021-05-08',2224.54,1,3,9,173),(398,'2021-09-14',6852.09,2,3,23,44),(399,'2021-09-16',3852.78,3,1,14,104),(400,'2021-05-30',6225.12,1,2,2,178);
/*!40000 ALTER TABLE `Orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrderStatus`
--

DROP TABLE IF EXISTS `OrderStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OrderStatus` (
  `OrderStatusID` int NOT NULL,
  `StatusName` varchar(50) NOT NULL,
  PRIMARY KEY (`OrderStatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderStatus`
--

LOCK TABLES `OrderStatus` WRITE;
/*!40000 ALTER TABLE `OrderStatus` DISABLE KEYS */;
INSERT INTO `OrderStatus` VALUES (1,'Open'),(2,'Processed'),(3,'In Progress');
/*!40000 ALTER TABLE `OrderStatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PaymentMethods`
--

DROP TABLE IF EXISTS `PaymentMethods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PaymentMethods` (
  `MethodID` int NOT NULL,
  `Method` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`MethodID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PaymentMethods`
--

LOCK TABLES `PaymentMethods` WRITE;
/*!40000 ALTER TABLE `PaymentMethods` DISABLE KEYS */;
/*!40000 ALTER TABLE `PaymentMethods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Payments`
--

DROP TABLE IF EXISTS `Payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Payments` (
  `PaymentID` int NOT NULL,
  `PayStateID` int DEFAULT NULL,
  PRIMARY KEY (`PaymentID`),
  KEY `FK_PayStateID` (`PayStateID`),
  CONSTRAINT `FK_PayStateID` FOREIGN KEY (`PayStateID`) REFERENCES `PayStates` (`PayStatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Payments`
--

LOCK TABLES `Payments` WRITE;
/*!40000 ALTER TABLE `Payments` DISABLE KEYS */;
INSERT INTO `Payments` VALUES (1,1),(6,1),(9,1),(10,1),(11,1),(14,1),(18,1),(25,1),(27,1),(28,1),(31,1),(37,1),(41,1),(42,1),(44,1),(50,1),(51,1),(52,1),(53,1),(60,1),(61,1),(62,1),(72,1),(74,1),(77,1),(80,1),(83,1),(86,1),(87,1),(89,1),(90,1),(99,1),(102,1),(104,1),(111,1),(112,1),(113,1),(114,1),(116,1),(117,1),(118,1),(120,1),(122,1),(125,1),(128,1),(130,1),(131,1),(133,1),(136,1),(139,1),(142,1),(143,1),(144,1),(147,1),(149,1),(152,1),(155,1),(156,1),(157,1),(165,1),(166,1),(172,1),(173,1),(174,1),(177,1),(179,1),(183,1),(184,1),(194,1),(197,1),(201,1),(206,1),(208,1),(210,1),(211,1),(213,1),(214,1),(215,1),(216,1),(220,1),(222,1),(226,1),(229,1),(230,1),(231,1),(233,1),(234,1),(242,1),(244,1),(250,1),(252,1),(255,1),(258,1),(260,1),(263,1),(267,1),(270,1),(271,1),(276,1),(278,1),(282,1),(284,1),(286,1),(287,1),(289,1),(294,1),(298,1),(305,1),(306,1),(307,1),(308,1),(312,1),(315,1),(325,1),(330,1),(335,1),(337,1),(340,1),(345,1),(346,1),(350,1),(351,1),(352,1),(354,1),(355,1),(357,1),(359,1),(361,1),(363,1),(366,1),(368,1),(369,1),(370,1),(372,1),(373,1),(374,1),(376,1),(377,1),(381,1),(382,1),(385,1),(391,1),(398,1),(8,2),(13,2),(15,2),(19,2),(22,2),(23,2),(24,2),(29,2),(32,2),(33,2),(36,2),(38,2),(39,2),(45,2),(46,2),(47,2),(54,2),(57,2),(59,2),(63,2),(64,2),(68,2),(69,2),(73,2),(75,2),(76,2),(81,2),(85,2),(93,2),(94,2),(98,2),(107,2),(108,2),(109,2),(110,2),(115,2),(119,2),(121,2),(129,2),(132,2),(137,2),(141,2),(145,2),(148,2),(150,2),(151,2),(159,2),(160,2),(161,2),(164,2),(167,2),(168,2),(170,2),(171,2),(175,2),(176,2),(181,2),(186,2),(187,2),(188,2),(191,2),(195,2),(199,2),(200,2),(217,2),(219,2),(224,2),(227,2),(228,2),(239,2),(241,2),(246,2),(247,2),(249,2),(251,2),(257,2),(262,2),(264,2),(265,2),(266,2),(268,2),(269,2),(272,2),(273,2),(274,2),(275,2),(279,2),(281,2),(288,2),(291,2),(292,2),(297,2),(299,2),(303,2),(304,2),(309,2),(311,2),(318,2),(319,2),(323,2),(324,2),(326,2),(329,2),(333,2),(334,2),(344,2),(347,2),(353,2),(356,2),(360,2),(365,2),(367,2),(375,2),(378,2),(379,2),(383,2),(384,2),(386,2),(388,2),(392,2),(393,2),(394,2),(396,2),(400,2),(2,3),(3,3),(4,3),(5,3),(7,3),(12,3),(16,3),(17,3),(20,3),(21,3),(26,3),(30,3),(34,3),(35,3),(40,3),(43,3),(48,3),(49,3),(55,3),(56,3),(58,3),(65,3),(66,3),(67,3),(70,3),(71,3),(78,3),(79,3),(82,3),(84,3),(88,3),(91,3),(92,3),(95,3),(96,3),(97,3),(100,3),(101,3),(103,3),(105,3),(106,3),(123,3),(124,3),(126,3),(127,3),(134,3),(135,3),(138,3),(140,3),(146,3),(153,3),(154,3),(158,3),(162,3),(163,3),(169,3),(178,3),(180,3),(182,3),(185,3),(189,3),(190,3),(192,3),(193,3),(196,3),(198,3),(202,3),(203,3),(204,3),(205,3),(207,3),(209,3),(212,3),(218,3),(221,3),(223,3),(225,3),(232,3),(235,3),(236,3),(237,3),(238,3),(240,3),(243,3),(245,3),(248,3),(253,3),(254,3),(256,3),(259,3),(261,3),(277,3),(280,3),(283,3),(285,3),(290,3),(293,3),(295,3),(296,3),(300,3),(301,3),(302,3),(310,3),(313,3),(314,3),(316,3),(317,3),(320,3),(321,3),(322,3),(327,3),(328,3),(331,3),(332,3),(336,3),(338,3),(339,3),(341,3),(342,3),(343,3),(348,3),(349,3),(358,3),(362,3),(364,3),(371,3),(380,3),(387,3),(389,3),(390,3),(395,3),(397,3),(399,3);
/*!40000 ALTER TABLE `Payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PayStates`
--

DROP TABLE IF EXISTS `PayStates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PayStates` (
  `PayStatusID` int NOT NULL,
  `StatusP` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`PayStatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PayStates`
--

LOCK TABLES `PayStates` WRITE;
/*!40000 ALTER TABLE `PayStates` DISABLE KEYS */;
INSERT INTO `PayStates` VALUES (1,'Pending'),(2,'Received'),(3,'Declined');
/*!40000 ALTER TABLE `PayStates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Representatives`
--

DROP TABLE IF EXISTS `Representatives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Representatives` (
  `RepresentID` int NOT NULL,
  `RepFirstName` varchar(20) NOT NULL,
  `RepLastName` varchar(30) NOT NULL,
  PRIMARY KEY (`RepresentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Representatives`
--

LOCK TABLES `Representatives` WRITE;
/*!40000 ALTER TABLE `Representatives` DISABLE KEYS */;
/*!40000 ALTER TABLE `Representatives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ReturnedItems`
--

DROP TABLE IF EXISTS `ReturnedItems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ReturnedItems` (
  `ReturnNo` int NOT NULL,
  `ItemID` int NOT NULL,
  `Quantity` int NOT NULL,
  PRIMARY KEY (`ReturnNo`),
  KEY `FK_ReturnItemID` (`ItemID`),
  CONSTRAINT `FK_ReturnItemID` FOREIGN KEY (`ItemID`) REFERENCES `Stock` (`ItemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ReturnedItems`
--

LOCK TABLES `ReturnedItems` WRITE;
/*!40000 ALTER TABLE `ReturnedItems` DISABLE KEYS */;
/*!40000 ALTER TABLE `ReturnedItems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Roles`
--

DROP TABLE IF EXISTS `Roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Roles` (
  `RoleID` int NOT NULL,
  `RoleName` varchar(30) NOT NULL,
  PRIMARY KEY (`RoleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Roles`
--

LOCK TABLES `Roles` WRITE;
/*!40000 ALTER TABLE `Roles` DISABLE KEYS */;
INSERT INTO `Roles` VALUES (1,'Sales Assistant'),(2,'Sales Manager'),(3,'Trainee'),(4,'Customer Support');
/*!40000 ALTER TABLE `Roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `sales2021`
--

DROP TABLE IF EXISTS `sales2021`;
/*!50001 DROP VIEW IF EXISTS `sales2021`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `sales2021` AS SELECT 
 1 AS `Year`,
 1 AS `Month`,
 1 AS `Products`,
 1 AS `RevenueMonthly`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `ShipAdrs`
--

DROP TABLE IF EXISTS `ShipAdrs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ShipAdrs` (
  `ShipAdrsID` int NOT NULL,
  `Address1` varchar(50) NOT NULL,
  `Address2` varchar(50) DEFAULT NULL,
  `City` varchar(30) NOT NULL,
  `PostCode` varchar(10) NOT NULL,
  `CountryID` int NOT NULL,
  PRIMARY KEY (`ShipAdrsID`),
  KEY `FK_ShipCountryID` (`CountryID`),
  CONSTRAINT `FK_ShipCountryID` FOREIGN KEY (`CountryID`) REFERENCES `Countries` (`CountryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ShipAdrs`
--

LOCK TABLES `ShipAdrs` WRITE;
/*!40000 ALTER TABLE `ShipAdrs` DISABLE KEYS */;
INSERT INTO `ShipAdrs` VALUES (1,'9592 John Wall Street','Abruzzi','Pescara','43063-244',22),(2,'9 Garrison Hill','Abruzzi','Pescara','49514-253',14),(3,'8377 Waxwing Terrace','Abruzzi','Pescara','52125-105',45),(4,'40 Farmco Crossing','Abruzzi','Pescara','0168-0071',31),(5,'1905 Lotheville Road','Abruzzi','Pescara','52380-0005',38),(6,'8373 Carey Alley','Abruzzi','Pescara','43419-363',9),(7,'26 Shoshone Place','Abruzzi','Pescara','41520-980',37),(8,'53 Kropf Parkway','Abruzzi','Pescara','43063-481',38),(9,'3312 Talmadge Alley','Abruzzi','Pescara','11673-447',16),(10,'11180 Monument Trail','Abruzzi','Pescara','55648-737',21),(11,'2792 Delladonna Crossing','Abruzzi','Pescara','66975-415',5),(12,'22 Bashford Place','Abruzzi','Pescara','17478-060',40),(13,'7597 Northridge Center','Abruzzi','Pescara','0280-8050',16),(14,'9 Johnson Way','Abruzzi','Pescara','68788-9798',32),(15,'4090 Delaware Pass','Abruzzi','Pescara','61328-001',34),(16,'1 Clarendon Street','Abruzzi','Pescara','52862-200',41),(17,'41615 Cascade Point','Abruzzi','Pescara','76439-122',45),(18,'6486 Mendota Hill','Abruzzi','Pescara','55154-4036',21),(19,'811 Eastlawn Place','Abruzzi','Pescara','61957-1830',29),(20,'39441 Karstens Alley','Abruzzi','Pescara','59260-135',18),(21,'16 Menomonie Drive','Abruzzi','Pescara','58479-004',45),(22,'03702 Namekagon Drive','Abruzzi','Pescara','54868-6745',49),(23,'54 Scott Crossing','Abruzzi','Pescara','21695-551',7),(24,'2925 Spohn Terrace','Abruzzi','Pescara','56062-302',6),(25,'9 Ludington Way','Abruzzi','Pescara','54973-2925',12),(26,'89404 Katie Junction','Abruzzi','Pescara','76485-1040',19),(27,'4922 Duke Hill','Abruzzi','Pescara','55301-343',41),(28,'661 Rigney Parkway','Abruzzi','Pescara','35356-952',31),(29,'64 Springview Point','Abruzzi','Pescara','60429-767',8),(30,'412 Gulseth Road','Abruzzi','Pescara','0363-0125',38),(31,'1 Kenwood Hill','Abruzzi','Pescara','60840-0200',7),(32,'72244 Luster Parkway','Abruzzi','Pescara','63629-1507',15),(33,'9382 Erie Street','Abruzzi','Pescara','57955-5024',9),(34,'27 Lawn Drive','Abruzzi','Pescara','62672-221',19),(35,'6 Golf View Junction','Abruzzi','Pescara','59779-107',16),(36,'6 Charing Cross Avenue','Abruzzi','Pescara','68428-040',37),(37,'25935 Anderson Hill','Abruzzi','Pescara','11673-106',16),(38,'7766 Carey Trail','Abruzzi','Pescara','51545-120',50),(39,'8 Columbus Alley','Abruzzi','Pescara','36987-1742',49),(40,'140 Arapahoe Point','Abruzzi','Pescara','59779-182',9),(41,'6 Schurz Road','Abruzzi','Pescara','10889-102',16),(42,'0115 Towne Street','Abruzzi','Pescara','68382-079',39),(43,'596 Twin Pines Hill','Abruzzi','Pescara','0078-0337',37),(44,'5 Dwight Court','Abruzzi','Pescara','63941-370',37),(45,'744 Esker Road','Abruzzi','Pescara','57520-0303',24),(46,'17 Trailsway Street','Abruzzi','Pescara','61787-557',3),(47,'08 Killdeer Center','Abruzzi','Pescara','54569-3335',49),(48,'529 Wayridge Center','Abruzzi','Pescara','46122-193',16),(49,'5158 Riverside Lane','Abruzzi','Pescara','49967-050',16),(50,'3923 East Way','Abruzzi','Pescara','36987-3094',6);
/*!40000 ALTER TABLE `ShipAdrs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Staff`
--

DROP TABLE IF EXISTS `Staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Staff` (
  `StaffID` int NOT NULL,
  `FirstName` varchar(15) NOT NULL,
  `Surname` varchar(15) NOT NULL,
  `DepartmentID` int NOT NULL,
  `RoleID` int DEFAULT NULL,
  `AddressInfo` varchar(80) DEFAULT NULL,
  `PhoneNo` varchar(35) DEFAULT NULL,
  `StartDate` date DEFAULT NULL,
  PRIMARY KEY (`StaffID`),
  KEY `FK_DepartmentID` (`DepartmentID`),
  KEY `FK_RoleID` (`RoleID`),
  CONSTRAINT `FK_DepartmentID` FOREIGN KEY (`DepartmentID`) REFERENCES `Departments` (`DepartmID`),
  CONSTRAINT `FK_RoleID` FOREIGN KEY (`RoleID`) REFERENCES `Roles` (`RoleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Staff`
--

LOCK TABLES `Staff` WRITE;
/*!40000 ALTER TABLE `Staff` DISABLE KEYS */;
INSERT INTO `Staff` VALUES (2,'Elisabetta','Dungay',2,2,'810 Steensland Junction','+62 (364) 566-6105','2011-04-07'),(3,'Forrester','Marzella',3,2,'077 Cardinal Parkway','+86 (539) 815-9012','2020-12-23'),(4,'Candida','Howlett',3,4,'6598 Union Park','+54 (947) 443-4814','2020-06-03'),(5,'Kane','Alesin',4,3,'0 Londonderry Drive','+420 (961) 276-3722','2011-09-15'),(6,'Orren','McLelland',4,2,'33 Ilene Parkway','+242 (999) 915-8657','2014-10-31'),(7,'Katalin','Vairow',3,1,'30012 Crest Line Crossing','+7 (620) 766-8603','2017-05-12'),(8,'Florenza','Pilsworth',4,3,'84379 Farmco Plaza','+7 (500) 629-4149','2015-11-16'),(9,'Jenelle','Martensen',2,1,'1 Springview Hill','+355 (871) 646-8034','2014-02-17'),(10,'Courtney','Collecott',2,2,'727 Petterle Crossing','+420 (102) 622-2760','2018-03-17'),(11,'Sande','Bowkley',2,4,'6 Forest Court','+53 (361) 626-6125','2011-04-20'),(12,'Ryley','Eliyahu',3,3,'2 Waywood Center','+7 (680) 830-8336','2014-09-19'),(13,'Saul','Dalyell',2,2,'603 Utah Point','+86 (306) 822-5751','2014-10-31'),(14,'Dirk','Goade',1,4,'2 Columbus Terrace','+86 (363) 946-0919','2020-09-13'),(15,'Shawn','Nono',4,4,'2222 Dapin Hill','+594 (303) 759-5179','2014-06-25'),(16,'Maxwell','Hudel',1,2,'3 Everett Hill','+7 (388) 709-0840','2015-02-22'),(17,'Crista','Zanussii',3,3,'3851 Mayfield Road','+234 (595) 591-5894','2017-02-01'),(18,'Sandro','Carson',3,1,'15 Michigan Plaza','+86 (951) 199-6185','2012-07-25'),(19,'Shepherd','Mungane',1,3,'49618 Kensington Road','+351 (215) 549-4962','2018-07-06'),(20,'Torrin','Tomich',4,2,'86 Ridgeway Road','+7 (449) 472-2496','2016-03-22'),(21,'Xymenes','Donhardt',2,2,'6 Green Avenue','+86 (856) 886-1664','2013-02-12'),(22,'Kathrine','Tripney',2,4,'168 Annamark Road','+86 (306) 327-0983','2019-03-31'),(23,'Wynn','Trewhitt',3,1,'43 Sutteridge Plaza','+86 (887) 831-3748','2012-02-04'),(24,'Pia','Greetham',1,4,'79444 Buena Vista Circle','+86 (549) 364-9695','2015-04-12'),(25,'Charyl','Scintsbury',1,2,'63325 Forest Run Hill','+62 (632) 619-5029','2016-08-11'),(26,'Keary','Ogilvy',4,2,'190 Rockefeller Alley','+86 (482) 842-2821','2012-11-19'),(27,'Ogdan','Dradey',1,3,'74 Sutteridge Point','+66 (408) 443-4638','2011-07-29'),(28,'Horst','Arnout',3,1,'22460 Spohn Terrace','+351 (520) 287-2633','2016-07-09'),(29,'Benn','Skeat',3,2,'1 Stang Place','+86 (281) 991-6926','2013-06-07'),(30,'Flynn','Petronis',4,2,'3530 Pepper Wood Trail','+86 (127) 720-3815','2019-06-01');
/*!40000 ALTER TABLE `Staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Stock`
--

DROP TABLE IF EXISTS `Stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Stock` (
  `ItemID` int NOT NULL,
  `BrandNameID` int NOT NULL,
  `ModelNameID` int NOT NULL,
  `ColourID` int NOT NULL,
  `Size` int DEFAULT NULL,
  `UnitPrice` float DEFAULT NULL,
  `LocationID` int DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  `SupplierID` int NOT NULL,
  PRIMARY KEY (`ItemID`),
  KEY `FK_BrandNameID` (`BrandNameID`),
  KEY `FK_ModelNameID` (`ModelNameID`),
  KEY `FK_ColourID` (`ColourID`),
  KEY `FK_LocationID` (`LocationID`),
  KEY `FK_SupplierID` (`SupplierID`),
  CONSTRAINT `FK_BrandNameID` FOREIGN KEY (`BrandNameID`) REFERENCES `BrandNames` (`BrandNameID`),
  CONSTRAINT `FK_ColourID` FOREIGN KEY (`ColourID`) REFERENCES `Colours` (`ColourID`),
  CONSTRAINT `FK_LocationID` FOREIGN KEY (`LocationID`) REFERENCES `Locations` (`LocationID`),
  CONSTRAINT `FK_ModelNameID` FOREIGN KEY (`ModelNameID`) REFERENCES `ModelNames` (`ModelNameID`),
  CONSTRAINT `FK_SupplierID` FOREIGN KEY (`SupplierID`) REFERENCES `Suppliers` (`SupplierID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Stock`
--

LOCK TABLES `Stock` WRITE;
/*!40000 ALTER TABLE `Stock` DISABLE KEYS */;
INSERT INTO `Stock` VALUES (1,2,8,1,41,1943.1,1,20,28),(2,6,1,1,44,2573.44,2,35,27),(3,1,9,6,44,2876.43,4,36,15),(4,3,6,1,11,6865.71,1,35,1),(5,2,9,2,16,1753.27,2,15,2),(6,6,5,8,27,2299.13,4,31,1),(7,3,2,7,28,5918.5,1,14,2),(8,5,8,8,14,2306.57,4,8,28),(9,4,5,9,31,5338.12,4,20,27),(10,4,7,8,50,4229.29,1,22,4),(11,2,9,9,14,3730.7,1,18,1),(12,4,3,6,32,4318.82,4,14,11),(13,3,8,2,50,2553.25,4,26,26),(14,2,10,3,13,1567.2,2,7,3),(15,4,11,8,48,6919.54,4,33,25),(16,1,5,3,36,1316.98,2,17,20),(17,2,6,6,15,6373.21,1,2,8),(18,5,5,5,32,747.75,1,16,17),(19,6,2,5,43,6998.07,1,28,14),(20,1,3,6,17,3353.93,1,39,6),(21,4,9,7,21,328.79,4,5,23),(22,2,1,2,20,6120.81,4,28,23),(23,1,11,6,20,3483.85,1,9,12),(24,3,11,8,36,6142.8,1,6,29),(25,4,1,7,42,5635.77,2,30,13),(26,2,11,4,20,1053.71,3,19,2),(27,6,2,1,28,1561.34,3,5,17),(28,3,5,2,49,3549.2,3,26,1),(29,3,1,9,35,4695.77,4,38,18),(30,1,3,3,32,936.66,1,34,8),(31,3,11,4,44,1016.31,4,23,19),(32,2,8,4,19,6060.85,4,26,4),(33,3,11,8,36,5748.81,4,39,1),(34,3,2,5,38,596.51,1,37,26),(35,1,3,4,12,2897.73,1,31,30),(36,3,5,4,28,2374.75,1,39,3),(37,6,3,6,41,6756.3,1,3,26),(38,6,1,5,12,6945.18,1,20,12),(39,4,6,1,14,4796.42,1,4,5),(40,6,8,1,25,2444.96,2,9,5),(41,1,11,7,29,1972.03,4,28,12),(42,3,9,9,20,1660.24,4,5,16),(43,4,7,9,40,4720.85,3,37,3),(44,1,4,8,48,2225.84,3,8,11),(45,3,1,7,28,4419.03,4,39,24),(46,1,7,1,38,4385,1,13,11),(47,4,3,4,48,6332,1,15,27),(48,4,2,9,34,5651.09,1,23,30),(49,1,4,3,10,1765.67,1,39,20),(50,3,10,6,10,6024.79,3,12,7),(51,1,3,1,24,4612.84,4,35,3),(52,6,7,4,49,2400.87,2,11,3),(53,1,10,9,18,2441.12,4,2,1),(54,6,3,6,32,1999.42,1,36,27),(55,1,3,3,17,1726.15,2,7,23),(56,5,8,7,19,3288.07,4,30,21),(57,5,11,1,40,3378.13,4,19,15),(58,3,6,7,14,2012.94,4,36,30),(59,4,2,9,27,565.79,4,4,12),(60,1,4,5,30,4095.04,1,27,29),(61,6,5,8,41,4637.98,2,15,4),(62,6,7,2,38,777.69,2,15,29),(63,4,11,3,32,2271.2,2,21,14),(64,5,1,5,48,5823.03,2,16,12),(65,1,4,5,38,2875.91,3,27,19),(66,3,4,1,45,495.53,1,10,16),(67,2,5,4,42,6972.53,3,12,8),(68,6,3,6,28,4508.76,2,13,23),(69,5,11,4,28,3022.8,1,28,28),(70,4,3,5,21,4381.27,2,36,26),(71,1,9,3,22,6762.52,1,31,9),(72,2,11,1,28,3568.03,3,2,7),(73,2,6,3,24,393.23,1,26,27),(74,6,11,8,14,5317.53,2,34,20),(75,4,2,8,47,3901.87,4,11,6),(76,6,6,6,40,1205.47,3,27,18),(77,2,11,3,47,423.74,4,4,14),(78,2,3,2,29,5003.45,4,20,7),(79,3,11,2,33,1250.52,1,10,13),(80,5,3,4,19,2707.39,4,28,19),(81,2,7,3,49,2280.23,2,18,11),(82,4,10,6,17,1746.83,3,18,22),(83,5,11,8,29,580.85,4,11,7),(84,2,4,6,29,3500.6,4,25,21),(85,6,1,1,13,2361.53,4,6,16),(86,5,10,3,18,5127.12,2,9,5),(87,6,4,1,44,3023.64,1,4,26),(88,1,8,6,24,1593.46,2,28,21),(89,3,1,9,33,2928.45,3,23,27),(90,5,6,1,16,4461.02,1,24,25),(91,3,4,3,17,3046.49,3,5,11),(92,4,7,9,16,5069.9,3,15,21),(93,4,4,1,32,3958.08,3,4,12),(94,5,11,5,20,4415.59,3,13,22),(95,3,8,5,17,5386.19,4,40,12),(96,6,1,3,35,2722.98,3,38,19),(97,5,2,7,32,3558.33,2,38,8),(98,2,11,6,50,4549.37,3,32,14),(99,6,10,2,38,5116.79,4,31,6),(100,3,9,2,19,1164.54,3,3,11);
/*!40000 ALTER TABLE `Stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Suppliers`
--

DROP TABLE IF EXISTS `Suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Suppliers` (
  `SupplierID` int NOT NULL,
  `SupplierName` varchar(50) DEFAULT NULL,
  `PhoneNo` varchar(35) DEFAULT NULL,
  `eMail` varchar(50) DEFAULT NULL,
  `ContactPersonID` int NOT NULL,
  PRIMARY KEY (`SupplierID`),
  KEY `FK_ContactPersonID` (`ContactPersonID`),
  CONSTRAINT `FK_ContactPersonID` FOREIGN KEY (`ContactPersonID`) REFERENCES `ContactPersons` (`ContactPersonID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Suppliers`
--

LOCK TABLES `Suppliers` WRITE;
/*!40000 ALTER TABLE `Suppliers` DISABLE KEYS */;
INSERT INTO `Suppliers` VALUES (1,'Gigazoom','+7 (579) 739-5285','tdancer0@bravesites.com',7),(2,'Roombo','+86 (970) 260-5496','hburkett1@bloglovin.com',5),(3,'Skyndu','+86 (489) 404-1951','gcapnor2@irs.gov',1),(4,'Dablist','+30 (180) 481-1989','csparsholt3@eventbrite.com',8),(5,'Skyvu','+1 (605) 191-3826','bpocknell4@unc.edu',7),(6,'Linktype','+81 (193) 940-8060','ghenriksson5@europa.eu',9),(7,'Fiveclub','+39 (364) 664-7125','dsimenel6@oakley.com',3),(8,'Tekfly','+84 (713) 630-8844','ecowderoy7@zimbio.com',9),(9,'LiveZ','+51 (742) 675-5646','cyukhin8@aol.com',8),(10,'Vimbo','+351 (905) 389-4807','gcurm9@state.gov',3),(11,'Tagcat','+7 (901) 314-0067','sblaszczyka@elegantthemes.com',6),(12,'Reallinks','+62 (330) 122-6128','hbelderfieldb@samsung.com',1),(13,'Meembee','+237 (490) 682-0293','ktrodlerc@vistaprint.com',9),(14,'Topicware','+48 (429) 182-3735','msurgoodd@shareasale.com',5),(15,'Aimbu','+82 (502) 842-3180','ssamsonsene@wordpress.org',1),(16,'Meeveo','+62 (428) 203-9169','eetchinghamf@foxnews.com',3),(17,'Thoughtbridge','+57 (596) 212-1351','wmomeryg@va.gov',9),(18,'Gabcube','+7 (972) 594-0805','nmcgeochh@addthis.com',1),(19,'Zoonoodle','+48 (718) 428-6825','slynaghi@cmu.edu',10),(20,'Jetwire','+63 (923) 192-8114','lmcalindenj@weebly.com',4),(21,'Twimm','+385 (375) 747-2798','mgareisrk@noaa.gov',5),(22,'Blogpad','+86 (422) 934-8425','dmccanel@ameblo.jp',5),(23,'Divanoodle','+63 (214) 470-1314','dtodmanm@qq.com',9),(24,'Meembee','+1 (917) 439-1695','mronaldn@mozilla.com',1),(25,'Zooveo','+55 (334) 291-8214','cgriolio@nyu.edu',10),(26,'Vitz','+358 (675) 160-4052','megerp@hexun.com',5),(27,'Latz','+86 (984) 901-2316','eblandamoreq@macromedia.com',1),(28,'Jaxnation','+33 (255) 868-9538','lstollmanr@ning.com',8),(29,'Photojam','+51 (390) 972-8066','efordhams@forbes.com',3),(30,'Skajo','+66 (343) 514-7250','aobriant@nydailynews.com',4);
/*!40000 ALTER TABLE `Suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `topstaff`
--

DROP TABLE IF EXISTS `topstaff`;
/*!50001 DROP VIEW IF EXISTS `topstaff`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `topstaff` AS SELECT 
 1 AS `Transaction_Value`,
 1 AS `FirstName`,
 1 AS `Surname`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Tracking`
--

DROP TABLE IF EXISTS `Tracking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Tracking` (
  `TransportID` int NOT NULL,
  `OrderID` int NOT NULL,
  PRIMARY KEY (`TransportID`),
  KEY `FK_TrackingOrderID` (`OrderID`),
  CONSTRAINT `FK_TrackingOrderID` FOREIGN KEY (`OrderID`) REFERENCES `Orders` (`OrderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tracking`
--

LOCK TABLES `Tracking` WRITE;
/*!40000 ALTER TABLE `Tracking` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tracking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'brandlux'
--
/*!50003 DROP PROCEDURE IF EXISTS `ItemsSoldOctober2021` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ItemsSoldOctober2021`(in SelectDateFrom date,
in SelectDateTo date)
BEGIN
	Select* FROM Orders
    WHERE Orders.DateCreated BETWEEN SelectDateFrom AND SelectDateTo;
End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `sales2021`
--

/*!50001 DROP VIEW IF EXISTS `sales2021`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sales2021` AS select year(`orders`.`OrderDate`) AS `Year`,month(`orders`.`OrderDate`) AS `Month`,sum(`orderitems`.`Quantity`) AS `Products`,sum(`orders`.`TotalPrice`) AS `RevenueMonthly` from (`orderitems` left join `orders` on((`orderitems`.`OrderID` = `orders`.`OrderID`))) where (`orders`.`OrderDate` between '2021-01-01 00:00:01' and '2021-12-31 23:59:59') group by year(`orders`.`OrderDate`),month(`orders`.`OrderDate`) with rollup */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `topstaff`
--

/*!50001 DROP VIEW IF EXISTS `topstaff`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `topstaff` AS select sum(`orders`.`TotalPrice`) AS `Transaction_Value`,`staff`.`FirstName` AS `FirstName`,`staff`.`Surname` AS `Surname` from (`orders` left join `staff` on((`orders`.`StaffID` = `staff`.`StaffID`))) group by `orders`.`StaffID` order by `Transaction_Value` desc limit 10 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-01 23:23:42

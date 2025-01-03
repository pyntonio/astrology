-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: oroscopi_db
-- ------------------------------------------------------
-- Server version	8.0.38

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `astrological_details`
--

DROP TABLE IF EXISTS `astrological_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `astrological_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `horoscope_id` int NOT NULL,
  `mercury` varchar(100) DEFAULT NULL,
  `venus` varchar(100) DEFAULT NULL,
  `mars` varchar(100) DEFAULT NULL,
  `jupiter` varchar(100) DEFAULT NULL,
  `saturn` varchar(100) DEFAULT NULL,
  `neptune` varchar(100) DEFAULT NULL,
  `uranus` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `horoscope_id` (`horoscope_id`),
  CONSTRAINT `astrological_details_ibfk_1` FOREIGN KEY (`horoscope_id`) REFERENCES `horoscopes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `astrological_details`
--

LOCK TABLES `astrological_details` WRITE;
/*!40000 ALTER TABLE `astrological_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `astrological_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `generic_horoscopes`
--

DROP TABLE IF EXISTS `generic_horoscopes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `generic_horoscopes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `birth_place` varchar(255) DEFAULT NULL,
  `horoscope_text` text,
  `pdf_filename` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `generic_horoscopes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `generic_horoscopes`
--

LOCK TABLES `generic_horoscopes` WRITE;
/*!40000 ALTER TABLE `generic_horoscopes` DISABLE KEYS */;
/*!40000 ALTER TABLE `generic_horoscopes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horoscope_generations`
--

DROP TABLE IF EXISTS `horoscope_generations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `horoscope_generations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `horoscope_type` enum('generic','monthly') DEFAULT NULL,
  `generation_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `horoscope_generations_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horoscope_generations`
--

LOCK TABLES `horoscope_generations` WRITE;
/*!40000 ALTER TABLE `horoscope_generations` DISABLE KEYS */;
/*!40000 ALTER TABLE `horoscope_generations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horoscopes`
--

DROP TABLE IF EXISTS `horoscopes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `horoscopes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `birthdate` date NOT NULL,
  `birthplace` varchar(255) NOT NULL,
  `sun_sign` varchar(50) DEFAULT NULL,
  `ascendant_sign` varchar(50) DEFAULT NULL,
  `moon_sign` varchar(50) DEFAULT NULL,
  `generated_text` text NOT NULL,
  `pdf_filename` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `horoscopes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horoscopes`
--

LOCK TABLES `horoscopes` WRITE;
/*!40000 ALTER TABLE `horoscopes` DISABLE KEYS */;
/*!40000 ALTER TABLE `horoscopes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language_settings`
--

DROP TABLE IF EXISTS `language_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `language_settings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `language_code` varchar(10) NOT NULL,
  `language_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language_settings`
--

LOCK TABLES `language_settings` WRITE;
/*!40000 ALTER TABLE `language_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `language_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `message` text NOT NULL,
  `level` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs`
--

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monthly_horoscopes`
--

DROP TABLE IF EXISTS `monthly_horoscopes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `monthly_horoscopes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `pdf_filename` varchar(255) DEFAULT NULL,
  `generated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `birthdate` date NOT NULL,
  `birthplace` varchar(255) NOT NULL,
  `sun_sign` varchar(50) DEFAULT NULL,
  `ascendant_sign` varchar(50) DEFAULT NULL,
  `moon_sign` varchar(50) DEFAULT NULL,
  `generated_text` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `monthly_horoscopes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monthly_horoscopes`
--

LOCK TABLES `monthly_horoscopes` WRITE;
/*!40000 ALTER TABLE `monthly_horoscopes` DISABLE KEYS */;
INSERT INTO `monthly_horoscopes` VALUES (1,23,'horoscope_23.pdf','2024-12-01 09:00:00','1990-06-15','Rome','Gemini','Aquarius','Libra','This month, you will experience growth in your career and relationships. Expect challenges at work, but your adaptability will lead to success.'),(2,23,'horoscope_24.pdf','2024-12-01 10:00:00','1985-03-22','Milan','Aries','Sagittarius','Cancer','Focus on self-care this month, as your health and well-being need attention. Avoid overexerting yourself in the workplace.'),(3,23,'horoscope_25.pdf','2024-12-01 11:00:00','1992-09-09','Naples','Virgo','Pisces','Leo','Your social life will thrive this month. Attend gatherings and make new connections, but be careful with overspending.'),(4,23,'horoscope_26.pdf','2024-12-01 12:00:00','1988-02-25','Turin','Pisces','Capricorn','Sagittarius','This is a great month for introspection. Take time for yourself and assess your goals for the future.'),(5,23,'horoscope_27.pdf','2024-12-01 13:00:00','1980-12-10','Bologna','Sagittarius','Virgo','Taurus','Financial gains are on the horizon. Be cautious with investments and ensure you have proper guidance.'),(6,23,'horoscope_28.pdf','2024-12-01 14:00:00','1995-07-30','Florence','Leo','Leo','Gemini','A month full of creativity. You?ll shine in artistic endeavors, but don?t forget about your personal relationships.'),(7,23,'horoscope_29.pdf','2024-12-01 15:00:00','1982-11-12','Rome','Scorpio','Scorpio','Capricorn','Embrace new opportunities at work, but be cautious in your personal life. There could be some conflicts to resolve.'),(8,23,'horoscope_30.pdf','2024-12-01 16:00:00','1990-01-05','Milan','Capricorn','Aquarius','Virgo','Your career will see a breakthrough, but your family life may require extra attention.'),(9,23,'horoscope_31.pdf','2024-12-01 17:00:00','1993-08-21','Naples','Aquarius','Gemini','Cancer','Focus on your emotional well-being this month. Relationships could become strained if communication breaks down.'),(10,23,'horoscope_32.pdf','2024-12-01 18:00:00','1987-04-14','Turin','Taurus','Leo','Leo','This month is all about stability. Avoid unnecessary risks, and focus on maintaining what you?ve built so far.'),(11,23,'horoscope_33.pdf','2024-12-01 19:00:00','1983-10-03','Bologna','Libra','Aries','Pisces','You may feel a bit overwhelmed this month. Take some time off from work to recharge.'),(12,23,'horoscope_34.pdf','2024-12-01 20:00:00','1991-12-19','Florence','Sagittarius','Taurus','Leo','Your focus will be on personal growth. This is a good time to start new projects or take on new challenges.'),(13,23,'horoscope_35.pdf','2024-12-01 21:00:00','1989-05-25','Rome','Virgo','Cancer','Capricorn','Take a more strategic approach to your career. This month could bring new responsibilities.'),(14,23,'horoscope_36.pdf','2024-12-01 22:00:00','1994-10-11','Milan','Scorpio','Libra','Aquarius','Your creativity will be at its peak. This is a good time to explore new hobbies or creative outlets.'),(15,23,'horoscope_37.pdf','2024-12-01 23:00:00','1986-03-03','Naples','Pisces','Aries','Sagittarius','Expect a surge in energy this month. This is a good time to take on new challenges, but pace yourself.'),(16,23,'horoscope_38.pdf','2024-12-02 00:00:00','1992-07-18','Turin','Leo','Virgo','Capricorn','Focus on your financial situation this month. Avoid impulse spending and save for the future.'),(17,23,'horoscope_39.pdf','2024-12-02 01:00:00','1981-01-27','Bologna','Gemini','Taurus','Leo','This is a good month to focus on family matters. Spend time nurturing relationships with your loved ones.'),(18,23,'horoscope_40.pdf','2024-12-02 02:00:00','1993-09-13','Florence','Cancer','Aquarius','Libra','This month will challenge you to balance your work and personal life. Find time for relaxation to avoid burnout.');
/*!40000 ALTER TABLE `monthly_horoscopes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monthly_subscriptions`
--

DROP TABLE IF EXISTS `monthly_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `monthly_subscriptions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `status` enum('active','cancelled','expired') DEFAULT 'active',
  `start_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `expiration_date` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `monthly_subscriptions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monthly_subscriptions`
--

LOCK TABLES `monthly_subscriptions` WRITE;
/*!40000 ALTER TABLE `monthly_subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `monthly_subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `natale_card`
--

DROP TABLE IF EXISTS `natale_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `natale_card` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `birth_date` date NOT NULL,
  `birth_time` time NOT NULL,
  `birth_place` varchar(255) NOT NULL,
  `sun_sign` varchar(50) DEFAULT NULL,
  `ascendant` varchar(50) DEFAULT NULL,
  `planets` json DEFAULT NULL,
  `sun_sign_description` text,
  `ascendant_description` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `natale_card_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `natale_card`
--

LOCK TABLES `natale_card` WRITE;
/*!40000 ALTER TABLE `natale_card` DISABLE KEYS */;
INSERT INTO `natale_card` VALUES (2,23,'1983-12-12','23:00:00','45.8091199,8.8374398','Sagittario','Leone','{\"Luna\": 79.49121818418088, \"Sole\": 69.21139570764865, \"Giove\": 261.413707876055, \"Marte\": 163.41739177515973, \"Urano\": 248.0755610137483, \"Venere\": 150.5965835587927, \"Nettuno\": 269.069101488977, \"Saturno\": 217.19528989237276, \"Mercurio\": 358.11618026852835}','L\'Sole in Sagittario indica ottimismo, espansione e ricerca di verit├á.','L\'Ascendente in Leone riflette leadership, creativit├á e passione.','2024-12-02 15:46:57','2024-12-02 17:32:58');
/*!40000 ALTER TABLE `natale_card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oroscope_logs`
--

DROP TABLE IF EXISTS `oroscope_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oroscope_logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `horoscope_id` int DEFAULT NULL,
  `action_type` enum('generated','downloaded','viewed') DEFAULT NULL,
  `action_timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `horoscope_id` (`horoscope_id`),
  CONSTRAINT `oroscope_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `oroscope_logs_ibfk_2` FOREIGN KEY (`horoscope_id`) REFERENCES `horoscopes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oroscope_logs`
--

LOCK TABLES `oroscope_logs` WRITE;
/*!40000 ALTER TABLE `oroscope_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `oroscope_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `payment_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `payment_type` enum('one_time','monthly_subscription') DEFAULT NULL,
  `payment_status` enum('completed','cancelled','pending') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prompts`
--

DROP TABLE IF EXISTS `prompts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prompts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `prompt_text` text NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prompts`
--

LOCK TABLES `prompts` WRITE;
/*!40000 ALTER TABLE `prompts` DISABLE KEYS */;
/*!40000 ALTER TABLE `prompts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `responses`
--

DROP TABLE IF EXISTS `responses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `responses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `prompt_id` int NOT NULL,
  `response_text` text NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `prompt_id` (`prompt_id`),
  CONSTRAINT `responses_ibfk_1` FOREIGN KEY (`prompt_id`) REFERENCES `prompts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `responses`
--

LOCK TABLES `responses` WRITE;
/*!40000 ALTER TABLE `responses` DISABLE KEYS */;
/*!40000 ALTER TABLE `responses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `session_token` varchar(255) NOT NULL,
  `expires_at` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `sessions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscription_history`
--

DROP TABLE IF EXISTS `subscription_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscription_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `subscription_id` int DEFAULT NULL,
  `status` enum('active','cancelled','expired') DEFAULT NULL,
  `status_change_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `subscription_id` (`subscription_id`),
  CONSTRAINT `subscription_history_ibfk_1` FOREIGN KEY (`subscription_id`) REFERENCES `monthly_subscriptions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription_history`
--

LOCK TABLES `subscription_history` WRITE;
/*!40000 ALTER TABLE `subscription_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscription_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_preferences`
--

DROP TABLE IF EXISTS `user_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_preferences` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `preference_name` varchar(100) DEFAULT NULL,
  `preference_value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_preferences_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_preferences`
--

LOCK TABLES `user_preferences` WRITE;
/*!40000 ALTER TABLE `user_preferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `born_date` date DEFAULT NULL,
  `born_hour` time DEFAULT NULL,
  `born_place` varchar(255) DEFAULT NULL,
  `password_hash` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_verified` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (23,'antoniotrento','Antonio','Trento','lantoniotrento@gmail.com','1983-12-12','23:00:00','45.8091199,8.8374398','$2b$12$Tp.Jg8FUEX0stjmehDWbTeRPJY6HRx6fwUL894AFIaj1fmlULBvJW','2024-11-30 08:44:04','2024-12-02 17:32:58',1),(25,'trentopay',NULL,NULL,'trentopay@gmail.com',NULL,NULL,NULL,'$2b$12$w.yuXxbv6JedcEhKk3xgnOrwci92RLPng5lwbP/epGuEL0ZNVHMdm','2024-11-30 10:48:03','2024-11-30 10:49:13',1),(33,'antoniotrentos',NULL,NULL,'a.trento@wmanager.com',NULL,NULL,NULL,'$2b$12$aeo947IRsFMJ5.4Vfb6gYODRTdK8ajVubA5FyKeR.RPrw2dv8IVYO','2024-12-01 07:51:22','2024-12-01 07:51:33',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-03 11:46:59

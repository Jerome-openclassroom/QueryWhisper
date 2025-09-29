-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: entreprise
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Table structure for table `employe`
--

DROP TABLE IF EXISTS `employe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employe` (
  `id_employe` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `service` varchar(100) DEFAULT NULL,
  `poste` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_employe`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employe`
--

LOCK TABLES `employe` WRITE;
/*!40000 ALTER TABLE `employe` DISABLE KEYS */;
INSERT INTO `employe` VALUES (1,'Martin','Sophie','Informatique','Développeuse Backend'),(2,'Dubois','Lucas','Informatique','Administrateur Systèmes'),(3,'Bernard','Claire','Informatique','Cheffe de Projet IT'),(4,'Durand','Nicolas','Marketing','Chargé de Communication'),(5,'Lefevre','Julie','Marketing','Responsable Marketing'),(6,'Moreau','Thomas','Marketing','Analyste Digital'),(7,'Simon','Camille','Ressources Humaines','Chargée de Recrutement'),(8,'Laurent','Hugo','Ressources Humaines','Responsable RH'),(9,'Garcia','Emma','Finance','Comptable'),(10,'Petit','Antoine','Finance','Contrôleur de Gestion'),(11,'Roux','Alice','Finance','Directrice Financière'),(12,'Fournier','Paul','Direction Générale','Directeur Général'),(13,'Girard','Manon','Commercial','Ingénieure Commerciale'),(14,'Andre','Julien','Commercial','Responsable Grands Comptes'),(15,'Mercier','Chloé','Commercial','Assistante Commerciale');
/*!40000 ALTER TABLE `employe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employe_projet`
--

DROP TABLE IF EXISTS `employe_projet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employe_projet` (
  `id_employe` int NOT NULL,
  `id_projet` int NOT NULL,
  `role_dans_projet` varchar(100) DEFAULT NULL,
  `taux_allocation` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`id_employe`,`id_projet`),
  KEY `id_projet` (`id_projet`),
  CONSTRAINT `employe_projet_ibfk_1` FOREIGN KEY (`id_employe`) REFERENCES `employe` (`id_employe`),
  CONSTRAINT `employe_projet_ibfk_2` FOREIGN KEY (`id_projet`) REFERENCES `projet` (`id_projet`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employe_projet`
--

LOCK TABLES `employe_projet` WRITE;
/*!40000 ALTER TABLE `employe_projet` DISABLE KEYS */;
INSERT INTO `employe_projet` VALUES (1,1,'Développeuse Backend',80.00),(1,3,'Développeuse Backend',60.00),(1,5,'Développeuse Backend',50.00),(2,1,'Administrateur Systèmes',70.00),(2,3,'Administrateur Systèmes',60.00),(3,1,'Cheffe de projet',60.00),(3,3,'Cheffe de projet',50.00),(3,5,'Cheffe de projet',40.00),(4,2,'Chargé de Communication',80.00),(4,3,'Chargé de Communication',30.00),(5,2,'Responsable Marketing',60.00),(5,4,'Responsable Marketing (support)',30.00),(6,2,'Analyste Digital',70.00),(6,3,'Analyste Digital',40.00),(7,4,'Chargée de Recrutement',60.00),(8,4,'Responsable RH',70.00),(9,1,'Comptable (support)',30.00),(9,6,'Comptable',80.00),(10,6,'Contrôleur de Gestion',70.00),(11,5,'Directrice Financière (sponsor)',20.00),(11,6,'Directrice Financière',50.00),(12,4,'Directeur Général',20.00),(12,6,'Directeur Général',20.00),(13,2,'Ingénieure Commerciale',40.00),(13,5,'Ingénieure Commerciale',60.00),(14,5,'Responsable Grands Comptes',70.00);
/*!40000 ALTER TABLE `employe_projet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projet`
--

DROP TABLE IF EXISTS `projet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projet` (
  `id_projet` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(150) NOT NULL,
  `budget` decimal(12,2) DEFAULT NULL,
  `date_debut` date DEFAULT NULL,
  `date_fin` date DEFAULT NULL,
  `statut` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_projet`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projet`
--

LOCK TABLES `projet` WRITE;
/*!40000 ALTER TABLE `projet` DISABLE KEYS */;
INSERT INTO `projet` VALUES (1,'Migration Système ERP',120000.00,'2025-01-15','2025-06-30','En cours'),(2,'Lancement Nouvelle Campagne Marketing',50000.00,'2025-03-01','2025-04-30','Terminé'),(3,'Refonte Site Web Institutionnel',80000.00,'2025-02-10','2025-07-31','En cours'),(4,'Programme Formation Interne',30000.00,'2025-04-01','2025-12-31','En cours'),(5,'Déploiement Outil CRM',95000.00,'2025-05-15','2025-11-30','En cours'),(6,'Audit Financier Annuel',40000.00,'2025-01-01','2025-03-15','Terminé');
/*!40000 ALTER TABLE `projet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tache`
--

DROP TABLE IF EXISTS `tache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tache` (
  `id_tache` int NOT NULL AUTO_INCREMENT,
  `id_projet` int NOT NULL,
  `id_employe` int DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `statut` varchar(50) DEFAULT NULL,
  `date_echeance` date DEFAULT NULL,
  PRIMARY KEY (`id_tache`),
  KEY `id_projet` (`id_projet`),
  KEY `id_employe` (`id_employe`),
  CONSTRAINT `tache_ibfk_1` FOREIGN KEY (`id_projet`) REFERENCES `projet` (`id_projet`),
  CONSTRAINT `tache_ibfk_2` FOREIGN KEY (`id_employe`) REFERENCES `employe` (`id_employe`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tache`
--

LOCK TABLES `tache` WRITE;
/*!40000 ALTER TABLE `tache` DISABLE KEYS */;
INSERT INTO `tache` VALUES (1,1,3,'Planification initiale du projet ERP','Terminé','2025-01-31'),(2,1,1,'Développement des modules financiers','En cours','2025-04-15'),(3,1,2,'Configuration des serveurs ERP','En cours','2025-03-30'),(4,1,9,'Validation des écritures comptables tests','À faire','2025-05-01'),(5,1,1,'Intégration des modules RH','À faire','2025-05-15'),(6,1,2,'Sécurisation des accès utilisateurs','À faire','2025-05-10'),(7,1,3,'Suivi hebdomadaire avec la direction','En cours','2025-06-01'),(8,1,1,'Mise en place des sauvegardes automatiques','À faire','2025-06-10'),(9,1,9,'Formation utilisateurs sur le module Finance','À faire','2025-06-15'),(10,1,3,'Clôture et bilan du projet ERP','À faire','2025-06-30'),(11,2,5,'Définition des objectifs de campagne','Terminé','2025-03-05'),(12,2,4,'Rédaction des supports de communication','Terminé','2025-03-10'),(13,2,6,'Analyse de marché préalable','Terminé','2025-03-02'),(14,2,13,'Identification des clients cibles','Terminé','2025-03-08'),(15,2,5,'Validation du budget de la campagne','Terminé','2025-03-06'),(16,2,4,'Lancement des posts sur réseaux sociaux','Terminé','2025-03-15'),(17,2,6,'Suivi des indicateurs de performance','Terminé','2025-03-25'),(18,2,13,'Organisation d’un webinaire client','Terminé','2025-03-20'),(19,2,5,'Analyse des retours de campagne','Terminé','2025-04-05'),(20,2,4,'Rédaction du rapport final de campagne','Terminé','2025-04-30'),(21,3,3,'Rédaction du cahier des charges','En cours','2025-02-28'),(22,3,1,'Développement de la page d’accueil','En cours','2025-04-15'),(23,3,2,'Mise en place de l’hébergement web','En cours','2025-03-20'),(24,3,6,'Intégration des outils d’analyse web','À faire','2025-06-01'),(25,3,4,'Création du contenu éditorial','À faire','2025-05-10'),(26,3,1,'Développement du module contact','En cours','2025-04-25'),(27,3,2,'Configuration SSL et sécurité','À faire','2025-05-20'),(28,3,6,'Tests de performance du site','À faire','2025-07-01'),(29,3,3,'Réunion de validation avec la direction','À faire','2025-07-10'),(30,3,4,'Publication du site en production','À faire','2025-07-31'),(31,4,7,'Identification des besoins en formation','En cours','2025-04-15'),(32,4,8,'Élaboration du planning de formation','En cours','2025-04-30'),(33,4,5,'Création des supports marketing internes','À faire','2025-05-10'),(34,4,12,'Validation budgétaire du programme','En cours','2025-04-20'),(35,4,7,'Sélection des formateurs externes','À faire','2025-05-30'),(36,4,8,'Mise en place d’une plateforme e-learning','À faire','2025-06-15'),(37,4,7,'Organisation des premières sessions','À faire','2025-07-01'),(38,4,5,'Communication interne sur le programme','À faire','2025-06-25'),(39,4,8,'Suivi de la participation des employés','À faire','2025-09-15'),(40,4,12,'Évaluation finale et rapport à la direction','À faire','2025-12-31'),(41,5,11,'Validation du budget CRM par la direction financière','En cours','2025-05-30'),(42,5,14,'Définition des besoins commerciaux','En cours','2025-06-15'),(43,5,13,'Saisie des premiers comptes clients','À faire','2025-07-01'),(44,5,1,'Développement du connecteur ERP–CRM','En cours','2025-07-15'),(45,5,3,'Pilotage global du déploiement','En cours','2025-06-20'),(46,5,14,'Tests de la gestion des opportunités','À faire','2025-08-01'),(47,5,13,'Formation des équipes commerciales','À faire','2025-08-10'),(48,5,1,'Mise en place des droits d’accès','À faire','2025-07-30'),(49,5,3,'Organisation des comités de suivi','En cours','2025-09-01'),(50,5,11,'Clôture et reporting final CRM','À faire','2025-11-30'),(51,6,10,'Préparation des documents financiers','Terminé','2025-01-20'),(52,6,9,'Vérification des écritures comptables','Terminé','2025-02-05'),(53,6,11,'Validation des bilans intermédiaires','Terminé','2025-02-28'),(54,6,12,'Présentation intermédiaire au comité de direction','Terminé','2025-02-25'),(55,6,10,'Contrôle des immobilisations','Terminé','2025-03-01'),(56,6,9,'Contrôle des charges et produits','Terminé','2025-03-05'),(57,6,11,'Analyse des écarts budgétaires','Terminé','2025-03-10'),(58,6,12,'Validation finale du rapport','Terminé','2025-03-12'),(59,6,10,'Archivage des justificatifs','Terminé','2025-03-14'),(60,6,9,'Clôture et diffusion du rapport d’audit','Terminé','2025-03-15');
/*!40000 ALTER TABLE `tache` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `maj_statut_projet` AFTER UPDATE ON `tache` FOR EACH ROW BEGIN
    DECLARE nb_total INT;
    DECLARE nb_terminees INT;

    
    SELECT COUNT(*), SUM(CASE WHEN statut = 'Terminé' THEN 1 ELSE 0 END)
    INTO nb_total, nb_terminees
    FROM tache
    WHERE id_projet = NEW.id_projet;

    
    IF nb_total > 0 AND nb_total = nb_terminees THEN
        UPDATE projet
        SET statut = 'Terminé'
        WHERE id_projet = NEW.id_projet;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-29 17:47:37

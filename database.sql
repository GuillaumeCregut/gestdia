--
-- Procédures
--
DELIMITER $$
DROP PROCEDURE IF EXISTS `P_Add_Boitier`$$
CREATE  PROCEDURE `P_Add_Boitier` (IN `IdMarque` INT, IN `NomBoitier` VARCHAR(20) CHARSET utf8mb4)  MODIFIES  DATA INSERT INTO t_boitier(numbmarque,nomboitier)
VALUES(IdMarque,NomBoitier)$$

DROP PROCEDURE IF EXISTS `P_Add_Cat`$$
CREATE PROCEDURE `P_Add_Cat` (IN `nom_categorie` VARCHAR(20) CHARSET utf8, IN `Lacouleur` VARCHAR(7) CHARSET utf8mb4)  MODIFIES  DATA INSERT INTO t_categorie(nomcat,couleur) VALUES (nom_categorie,Lacouleur)$$

DROP PROCEDURE IF EXISTS `P_Add_Film`$$
CREATE  PROCEDURE `P_Add_Film` (IN `idBoitier` INT, IN `idtpe` INT, IN `NomFilm` VARCHAR(20) CHARSET utf8mb4)  MODIFIES  DATA INSERT INTO t_film (numbfilm,numtfilm,nomfilm) VALUES(idBoitier,idtpe,NomFilm)$$

DROP PROCEDURE IF EXISTS `p_add_marque`$$
CREATE  PROCEDURE `p_add_marque` (IN `nom_marque` VARCHAR(20) CHARSET utf8)  MODIFIES  DATA INSERT INTO t_marque(nommarque) VALUES (nom_marque)$$

DROP PROCEDURE IF EXISTS `P_Add_Photo`$$
CREATE PROCEDURE `P_Add_Photo` (IN `num_f` INT, IN `num_c` INT, IN `codep` VARCHAR(10) CHARSET utf8mb4, IN `nom` VARCHAR(30) CHARSET utf8mb4, IN `datep` DATE, IN `descr` VARCHAR(250) CHARSET utf8mb4, IN `com` VARCHAR(200) CHARSET utf8mb4, IN `chemin` VARCHAR(250) CHARSET utf8mb4)  MODIFIES  DATA INSERT INTO t_photo (
codephoto,numfphoto,numcphoto,nomphoto,datephoto,commentaire,description,chemin)
VALUES(codep,num_f,num_c,nom,datep,com, descr,chemin)$$

DROP PROCEDURE IF EXISTS `P_Add_Type`$$
CREATE PROCEDURE `P_Add_Type` (IN `IdMarque` INT, IN `nouvnom` VARCHAR(20) CHARSET utf8mb4)  MODIFIES  DATA INSERT INTO t_type(nummtype,nomtype) VALUES(IdMarque,nouvnom)$$

DROP PROCEDURE IF EXISTS `P_Mod_Boitier`$$
CREATE PROCEDURE `P_Mod_Boitier` (IN `idBoitier` INT, IN `IdMarque` INT, IN `NouvNom` VARCHAR(20) CHARSET utf8mb4)  MODIFIES  DATA UPDATE t_boitier SET numbmarque=IdMarque,nomboitier=NouvNom WHERE numboitier=idBoitier$$

DROP PROCEDURE IF EXISTS `P_Mod_Cat`$$
CREATE  PROCEDURE `P_Mod_Cat` (IN `IdCat` INT, IN `NvoNomCat` VARCHAR(20))  MODIFIES  DATA UPDATE t_categorie SET nomcat=NvoNomCat WHERE numcat=IdCat$$

DROP PROCEDURE IF EXISTS `P_Mod_Film`$$
CREATE PROCEDURE `P_Mod_Film` (IN `id_film` INT, IN `id_boitier` INT, IN `id_type` INT, IN `nouv_nom` VARCHAR(20) CHARSET utf8mb4)  MODIFIES  DATA UPDATE t_film SET
numbfilm=id_boitier,
numtfilm=id_type,
nomfilm=nouv_nom
WHERE numfilm=id_film$$

DROP PROCEDURE IF EXISTS `P_Mod_Marque`$$
CREATE PROCEDURE `P_Mod_Marque` (IN `IdMarque` INT, IN `NvoNomMarque` VARCHAR(20))  MODIFIES  DATA UPDATE t_marque
SET nommarque=NvoNomMarque
WHERE num_marque=IdMarque$$

DROP PROCEDURE IF EXISTS `P_Mod_Photo`$$
CREATE PROCEDURE `P_Mod_Photo` (IN `id_photo` INT, IN `LaCat` INT, IN `LeNom` VARCHAR(30) CHARSET utf8mb4, IN `LaDate` DATE, IN `LeCom` VARCHAR(200) CHARSET utf8mb4, IN `LaDesc` VARCHAR(250) CHARSET utf8mb4, IN `LeChemin` VARCHAR(250) CHARSET utf8mb4)  MODIFIES  DATA UPDATE t_photo SET nomphoto=LeNom, numcphoto=LaCat, datephoto=LaDate, description=LaDesc, commentaire=LeCom, chemin=LeChemin WHERE codephoto=id_photo$$

DROP PROCEDURE IF EXISTS `P_Mod_Type`$$
CREATE  PROCEDURE `P_Mod_Type` (IN `IdType` INT, IN `IdMarque` INT, IN `NouvNom` VARCHAR(20) CHARSET utf8mb4)  MODIFIES  DATA UPDATE t_type SET nummtype=IdMarque, nomtype=NouvNom WHERE numtype=IdType$$

DROP PROCEDURE IF EXISTS `P_Supp_Boitier`$$
CREATE PROCEDURE `P_Supp_Boitier` (IN `idBoitier` INT)  MODIFIES  DATA DELETE FROM t_boitier WHERE numboitier=idBoitier$$

DROP PROCEDURE IF EXISTS `p_Supp_Cat`$$
CREATE  PROCEDURE `p_Supp_Cat` (IN `IdCat` INT)  MODIFIES  DATA DELETE FROM t_categorie where numcat=IdCat$$

DROP PROCEDURE IF EXISTS `P_Supp_Film`$$
CREATE  PROCEDURE `P_Supp_Film` (IN `idfilm` INT)  MODIFIES  DATA DELETE FROM t_film WHERE numfilm=idfilm$$

DROP PROCEDURE IF EXISTS `p_Supp_Marque`$$
CREATE  PROCEDURE `p_Supp_Marque` (IN `IdMarque` INT)  MODIFIES  DATA DELETE FROM t_marque where num_marque=IdMarque$$

DROP PROCEDURE IF EXISTS `P_Supp_Type`$$
CREATE  PROCEDURE `P_Supp_Type` (IN `IdType` INT)  MODIFIES  DATA DELETE FROM t_type WHERE numtype=IdType$$

DROP PROCEDURE IF EXISTS `P_Sup_Photo`$$
CREATE  PROCEDURE `P_Sup_Photo` (IN `id_photo` INT)  MODIFIES  DATA DELETE FROM t_photo WHERE codephoto=id_photo$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `t_boitier`
--

DROP TABLE IF EXISTS `t_boitier`;
CREATE TABLE IF NOT EXISTS `t_boitier` (
  `numboitier` int NOT NULL AUTO_INCREMENT,
  `numbmarque` int NOT NULL,
  `nomboitier` varchar(20) NOT NULL,
  PRIMARY KEY (`numboitier`),
  KEY `FK_MArque_Boitier` (`numbmarque`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


--
-- Structure de la table `t_categorie`
--

DROP TABLE IF EXISTS `t_categorie`;
CREATE TABLE IF NOT EXISTS `t_categorie` (
  `numcat` int NOT NULL AUTO_INCREMENT,
  `nomcat` varchar(20) NOT NULL,
  `couleur` varchar(7) DEFAULT NULL,
  PRIMARY KEY (`numcat`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


-- --------------------------------------------------------

--
-- Structure de la table `t_film`
--

DROP TABLE IF EXISTS `t_film`;
CREATE TABLE IF NOT EXISTS `t_film` (
  `numfilm` int NOT NULL AUTO_INCREMENT,
  `numbfilm` int NOT NULL,
  `numtfilm` int NOT NULL,
  `nomfilm` varchar(20) NOT NULL,
  PRIMARY KEY (`numfilm`),
  KEY `FK_Film_Type` (`numtfilm`),
  KEY `FK_Film_Boitier` (`numbfilm`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


--
-- Structure de la table `t_marque`
--

DROP TABLE IF EXISTS `t_marque`;
CREATE TABLE IF NOT EXISTS `t_marque` (
  `num_marque` int NOT NULL AUTO_INCREMENT,
  `nommarque` varchar(20) NOT NULL,
  PRIMARY KEY (`num_marque`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


--
-- Structure de la table `t_photo`
--

DROP TABLE IF EXISTS `t_photo`;
CREATE TABLE IF NOT EXISTS `t_photo` (
  `codephoto` varchar(10) NOT NULL,
  `numfphoto` int NOT NULL,
  `numcphoto` int NOT NULL,
  `nomphoto` varchar(30) NOT NULL,
  `datephoto` date NOT NULL,
  `commentaire` varchar(200) NOT NULL,
  `description` varchar(250) NOT NULL,
  `chemin` varchar(250) NOT NULL,
  PRIMARY KEY (`codephoto`),
  KEY `FK_Photo_Type` (`numfphoto`),
  KEY `FK_Photo_Cat` (`numcphoto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Structure de la table `t_type`
--

DROP TABLE IF EXISTS `t_type`;
CREATE TABLE IF NOT EXISTS `t_type` (
  `numtype` int NOT NULL AUTO_INCREMENT,
  `nummtype` int NOT NULL,
  `nomtype` varchar(15) NOT NULL,
  PRIMARY KEY (`numtype`),
  KEY `FK_Type_Marque` (`nummtype`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


-- --------------------------------------------------------

--
-- Structure de la vue `v_boitier_marque`
--


DROP VIEW IF EXISTS `v_boitier_marque`;
CREATE  VIEW `v_boitier_marque`  AS SELECT `tb`.`nomboitier` AS `nomboitier`, `tb`.`numboitier` AS `numboitier`, `tm`.`nommarque` AS `nommarque` FROM (`t_boitier` `tb` join `t_marque` `tm` on((`tb`.`numbmarque` = `tm`.`num_marque`)))  ;

-- --------------------------------------------------------

--

DROP VIEW IF EXISTS `v_detail_photo`;
CREATE  VIEW `v_detail_photo`  AS SELECT `tp`.`codephoto` AS `codephoto`, `tp`.`chemin` AS `chemin`, `tp`.`commentaire` AS `commentaire`, `tp`.`description` AS `description`, `tp`.`nomphoto` AS `nomphoto`, `tp`.`datephoto` AS `datephoto`, `tb`.`nomboitier` AS `nomboitier`, `tf`.`nomfilm` AS `nomfilm`, `tc`.`nomcat` AS `nomcat`, `tt`.`nomtype` AS `nomtype` FROM ((((`t_photo` `tp` join `t_categorie` `tc` on((`tp`.`numcphoto` = `tc`.`numcat`))) join `t_film` `tf` on((`tp`.`numfphoto` = `tf`.`numfilm`))) join `t_type` `tt` on((`tf`.`numtfilm` = `tt`.`numtype`))) join `t_boitier` `tb` on((`tf`.`numbfilm` = `tb`.`numboitier`)))  ;

-- --------------------------------------------------------

--
-- Structure de la vue `v_film_boitier_type`
--


DROP VIEW IF EXISTS `v_film_boitier_type`;
CREATE VIEW `v_film_boitier_type`  AS SELECT `tf`.`numfilm` AS `id_film`, `tf`.`nomfilm` AS `nom_film`, `tb`.`nomboitier` AS `nom_boitier`, `tt`.`nomtype` AS `nom_type` FROM ((`t_film` `tf` join `t_boitier` `tb` on((`tf`.`numbfilm` = `tb`.`numboitier`))) join `t_type` `tt` on((`tf`.`numtfilm` = `tt`.`numtype`)))  ;

-- --------------------------------------------------------

--
-- Structure de la vue `v_photo_film_cat`
--


DROP VIEW IF EXISTS `v_photo_film_cat`;
CREATE VIEW `v_photo_film_cat`  AS SELECT `tp`.`codephoto` AS `id_photo`, `tp`.`nomphoto` AS `nom_photo`, `tp`.`datephoto` AS `date_photo`, `tp`.`commentaire` AS `commentaire`, `tp`.`description` AS `description`, `tp`.`chemin` AS `chemin`, `tf`.`nomfilm` AS `nom_film`, `tc`.`nomcat` AS `categorie` FROM ((`t_photo` `tp` join `t_film` `tf` on((`tp`.`numfphoto` = `tf`.`numfilm`))) join `t_categorie` `tc` on((`tp`.`numcphoto` = `tc`.`numcat`)))  ;

-- --------------------------------------------------------

--
-- Structure de la vue `v_photo_idfilm_cat`
--


DROP VIEW IF EXISTS `v_photo_idfilm_cat`;
CREATE VIEW `v_photo_idfilm_cat`  AS SELECT `tp`.`codephoto` AS `id_photo`, `tp`.`numfphoto` AS `id_film`, `tp`.`nomphoto` AS `nom`, `tp`.`chemin` AS `chemin`, `tc`.`nomcat` AS `categorie` FROM (`t_photo` `tp` join `t_categorie` `tc` on((`tp`.`numcphoto` = `tc`.`numcat`))) ORDER BY `tp`.`codephoto` ASC  ;

-- --------------------------------------------------------

--
-- Structure de la vue `v_photo_rech`
--


DROP VIEW IF EXISTS `v_photo_rech`;
CREATE VIEW `v_photo_rech`  AS SELECT `tp`.`codephoto` AS `Id_Photo`, `tp`.`numcphoto` AS `numcphoto`, `tp`.`numfphoto` AS `numfphoto`, `tp`.`nomphoto` AS `nomphoto`, `tp`.`commentaire` AS `commentaire`, `tp`.`description` AS `description`, `tp`.`chemin` AS `chemin`, `tc`.`nomcat` AS `categorie` FROM (`t_photo` `tp` join `t_categorie` `tc` on((`tp`.`numcphoto` = `tc`.`numcat`)))  ;

-- --------------------------------------------------------

--
-- Structure de la vue `v_type_marque`
--


DROP VIEW IF EXISTS `v_type_marque`;
CREATE VIEW `v_type_marque`  AS SELECT `tt`.`numtype` AS `numtype`, `tt`.`nomtype` AS `nomtype`, `tm`.`nommarque` AS `nommarque` FROM (`t_type` `tt` join `t_marque` `tm` on((`tt`.`nummtype` = `tm`.`num_marque`))) ORDER BY `tt`.`nomtype` ASC  ;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `t_boitier`
--
ALTER TABLE `t_boitier`
  ADD CONSTRAINT `FK_PK_MARQUE` FOREIGN KEY (`numbmarque`) REFERENCES `t_marque` (`num_marque`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `t_film`
--
ALTER TABLE `t_film`
  ADD CONSTRAINT `FK_Film_Boitier` FOREIGN KEY (`numbfilm`) REFERENCES `t_boitier` (`numboitier`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `FK_Film_Type` FOREIGN KEY (`numtfilm`) REFERENCES `t_type` (`numtype`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `t_photo`
--
ALTER TABLE `t_photo`
  ADD CONSTRAINT `FK_Photo_Cat` FOREIGN KEY (`numcphoto`) REFERENCES `t_categorie` (`numcat`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `FK_Photo_Type` FOREIGN KEY (`numfphoto`) REFERENCES `t_film` (`numfilm`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `t_type`
--
ALTER TABLE `t_type`
  ADD CONSTRAINT `FK_Type_Marque` FOREIGN KEY (`nummtype`) REFERENCES `t_marque` (`num_marque`) ON DELETE RESTRICT ON UPDATE RESTRICT;



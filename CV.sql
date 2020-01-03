CREATE DATABASE `cv2`;
USE `cv2`;

CREATE TABLE `diplomes` (
	`diplome_id` INT NOT NULL UNIQUE AUTO_INCREMENT,
    `designation` VARCHAR(32) NOT NULL,
    CONSTRAINT `pk_diplomes`
    PRIMARY KEY (`diplome_id`)
);

CREATE TABLE `langues` (
	`langue_id` INT NOT NULL UNIQUE AUTO_INCREMENT,
    `designation` VARCHAR(32) NOT NULL,
    CONSTRAINT `pk_langues`
    PRIMARY KEY (`langue_id`)
);

CREATE TABLE `interets` (
	`interet_id` INT NOT NULL UNIQUE AUTO_INCREMENT,
    `designation` VARCHAR(32) NOT NULL,
    CONSTRAINT `pk_interets`
	PRIMARY KEY (`interet_id`)
);

CREATE TABLE `candidats` (
	`candidat_id` INT NOT NULL UNIQUE AUTO_INCREMENT,
    `nom` VARCHAR(16) NOT NULL,
    `prenom` VARCHAR(16) NOT NULL,
    `date_naissance` DATE NOT NULL,
    `salaire_actuel` DOUBLE NOT NULL,
	`salaire_recherche` DOUBLE NOT NULL,
    CONSTRAINT `pk_candidats`
    PRIMARY KEY (`candidat_id`)
);

CREATE TABLE `obtentions_diplomes` (
	`candidat_id` INT NOT NULL,
    `diplome_id` INT NOT NULL,
    `date_obtention` DATE NOT NULL,
    CONSTRAINT `fk_obtentions_diplomes_diplomes`
    FOREIGN KEY (`diplome_id`)
    REFERENCES `diplomes`(`diplome_id`)
    ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_obtentions_diplomes_candidats`
    FOREIGN KEY (`candidat_id`)
    REFERENCES `candidats`(`candidat_id`)
    ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `langues_maitrisees` (
	`candidat_id` INT NOT NULL,
    `langue_id` INT NOT NULL,
    `niveau` VARCHAR(16) NOT NULL,
    CONSTRAINT `fk_langues_maitrisees_langues`
    FOREIGN KEY (`langue_id`)
    REFERENCES `langues`(`langue_id`)
    ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_langues_maitrisees_candidats`
    FOREIGN KEY (`candidat_id`)
    REFERENCES `candidats`(`candidat_id`)
    ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `centre_interets` (
	`interet_id` INT NOT NULL,
    `candidat_id` INT NOT NULL,
    CONSTRAINT `fk_centre_interets_interets`
    FOREIGN KEY (`interet_id`)
    REFERENCES `interets`(`interet_id`)
    ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_centre_interets_candidats`
    FOREIGN KEY (`candidat_id`)
    REFERENCES `candidats`(`candidat_id`)
    ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `fonctions` (
	`fonction_id` INT NOT NULL UNIQUE AUTO_INCREMENT,
    `designation` VARCHAR(16) NOT NULL,
    CONSTRAINT `pk_fonctions`
    PRIMARY KEY (`fonction_id`)
);

CREATE TABLE `employeurs` (
	`SIREN` VARCHAR(32) NOT NULL UNIQUE,
    `raison_sociale` VARCHAR(32) NOT NULL
);

CREATE TABLE `emplois` (
	`candidat_id` INT NOT NULL,
    `fonction_id` INT NOT NULL,
    `SIREN` VARCHAR(32) NOT NULL,
    `date_entree_emp` DATE NOT NULL,
    `date_sortie_emp` DATE,
    `date_debut_fonc` DATE NOT NULL,
    `date_fin_fonc` DATE,
    CONSTRAINT `fk_emplois_candidats`
    FOREIGN KEY (`candidat_id`)
    REFERENCES `candidats`(`candidat_id`)
    ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_emplois_fonctions`
    FOREIGN KEY (`fonction_id`)
    REFERENCES `fonctions`(`fonction_id`)
    ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_emplois_employeurs`
    FOREIGN KEY (`SIREN`)
    REFERENCES `employeurs`(`SIREN`)
    ON DELETE CASCADE ON UPDATE CASCADE
);
















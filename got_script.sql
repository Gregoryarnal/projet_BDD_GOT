-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE `Personnage` (
    `id_personnage` int  NOT NULL ,
    `Name` string  NOT NULL ,
    `Surname` string  NOT NULL ,
    `tué_par` int  NOT NULL ,
    `famille` int  NOT NULL ,
    `civilisation` int  NOT NULL ,
    PRIMARY KEY (
        `id_personnage`
    )
);

CREATE TABLE `Chateau` (
    `id_chateau` int  NOT NULL ,
    `lieu` string  NOT NULL ,
    `roi` int  NOT NULL ,
    `famille` int  NOT NULL ,
    PRIMARY KEY (
        `id_chateau`
    )
);

CREATE TABLE `Famille` (
    `id_famille` int  NOT NULL ,
    `nom` string  NOT NULL ,
    `histoire` string  NOT NULL ,
    PRIMARY KEY (
        `id_famille`
    )
);

CREATE TABLE `Enfant_de` (
    `id` int  NOT NULL ,
    `id_pere` int  NOT NULL ,
    `id_mere` int  NOT NULL 
);

CREATE TABLE `A_couche` (
    `id1` int  NOT NULL ,
    `id2` int  NOT NULL 
);

CREATE TABLE `A_tué` (
    `tueur` int  NOT NULL ,
    `tuées` int  NOT NULL 
);

CREATE TABLE `Guerre` (
    `id` int  NOT NULL ,
    `nom` string  NOT NULL ,
    `lieu` id  NOT NULL ,
    `dirigeant` id  NOT NULL ,
    PRIMARY KEY (
        `id`
    )
);

CREATE TABLE `Marie_a` (
    `époux` int  NOT NULL ,
    `épouse` int  NOT NULL 
);

CREATE TABLE `Lieu` (
    `id_lieu` int  NOT NULL ,
    `nom` string  NOT NULL ,
    `sous_le_controle_de` int  NOT NULL ,
    PRIMARY KEY (
        `id_lieu`
    )
);

CREATE TABLE `Armee` (
    `id` int  NOT NULL ,
    `nom` string  NOT NULL ,
    `chef` int  NOT NULL ,
    PRIMARY KEY (
        `id`
    )
);

-- Free plan table limit reached. SUBSCRIBE for more.



ALTER TABLE `Personnage` ADD CONSTRAINT `fk_Personnage_famille` FOREIGN KEY(`famille`)
REFERENCES `Famille` (`id_famille`);

ALTER TABLE `Personnage` ADD CONSTRAINT `fk_Personnage_civilisation` FOREIGN KEY(`civilisation`)
REFERENCES `Table 11` (`...`);

ALTER TABLE `Chateau` ADD CONSTRAINT `fk_Chateau_roi` FOREIGN KEY(`roi`)
REFERENCES `Personnage` (`id_personnage`);

ALTER TABLE `Chateau` ADD CONSTRAINT `fk_Chateau_famille` FOREIGN KEY(`famille`)
REFERENCES `Famille` (`id_famille`);

ALTER TABLE `Enfant_de` ADD CONSTRAINT `fk_Enfant_de_id` FOREIGN KEY(`id`)
REFERENCES `Personnage` (`id_personnage`);

ALTER TABLE `Enfant_de` ADD CONSTRAINT `fk_Enfant_de_id_pere` FOREIGN KEY(`id_pere`)
REFERENCES `Personnage` (`id_personnage`);

ALTER TABLE `Enfant_de` ADD CONSTRAINT `fk_Enfant_de_id_mere` FOREIGN KEY(`id_mere`)
REFERENCES `Personnage` (`id_personnage`);

ALTER TABLE `A_couche` ADD CONSTRAINT `fk_A_couche_id1` FOREIGN KEY(`id1`)
REFERENCES `Personnage` (`id_personnage`);

ALTER TABLE `A_couche` ADD CONSTRAINT `fk_A_couche_id2` FOREIGN KEY(`id2`)
REFERENCES `Personnage` (`id_personnage`);

ALTER TABLE `A_tué` ADD CONSTRAINT `fk_A_tué_tueur` FOREIGN KEY(`tueur`)
REFERENCES `Personnage` (`id_personnage`);

ALTER TABLE `A_tué` ADD CONSTRAINT `fk_A_tué_tuées` FOREIGN KEY(`tuées`)
REFERENCES `Personnage` (`id_personnage`);

ALTER TABLE `Guerre` ADD CONSTRAINT `fk_Guerre_lieu` FOREIGN KEY(`lieu`)
REFERENCES `Lieu` (`id_lieu`);

ALTER TABLE `Guerre` ADD CONSTRAINT `fk_Guerre_dirigeant` FOREIGN KEY(`dirigeant`)
REFERENCES `Personnage` (`id_personnage`);

ALTER TABLE `Marie_a` ADD CONSTRAINT `fk_Marie_a_époux` FOREIGN KEY(`époux`)
REFERENCES `Personnage` (`id_personnage`);

ALTER TABLE `Marie_a` ADD CONSTRAINT `fk_Marie_a_épouse` FOREIGN KEY(`épouse`)
REFERENCES `Personnage` (`id_personnage`);

ALTER TABLE `Lieu` ADD CONSTRAINT `fk_Lieu_sous_le_controle_de` FOREIGN KEY(`sous_le_controle_de`)
REFERENCES `Personnage` (`id_personnage`);

ALTER TABLE `Armee` ADD CONSTRAINT `fk_Armee_chef` FOREIGN KEY(`chef`)
REFERENCES `Personnage` (`id_personnage`);

-- Free plan table limit reached. SUBSCRIBE for more.



-- Free plan table limit reached. SUBSCRIBE for more.




-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots (.. - without quotes).

DROP TABLE IF EXISTS Civilisation;
DROP TABLE IF EXISTS Allegeance_famille;
DROP TABLE IF EXISTS Batard;
DROP TABLE IF EXISTS Famille;
DROP TABLE IF EXISTS Enfant_de;


DROP TABLE IF EXISTS Chateau;

DROP TABLE IF EXISTS ville;
DROP TABLE IF EXISTS region;
DROP TABLE IF EXISTS continent;




DROP TABLE IF EXISTS Allegeance_camp;




DROP TABLE IF EXISTS Marie_a;


DROP TABLE IF EXISTS A_couche;
DROP TABLE IF EXISTS A_tué;
DROP TABLE IF EXISTS Armee;
DROP TABLE IF EXISTS Guerre;
DROP TABLE IF EXISTS Personnage;

CREATE TABLE Personnage (
    id_personnage INT  NOT NULL AUTO_INCREMENT,
    nom varchar(50) ,
    prenom varchar(50),
    tue_par INT(5) ,
    famille INT(5) ,
    civilisation INT (5),
    CONSTRAINT pk_id_personnage PRIMARY KEY (id_personnage)
);



CREATE TABLE Famille (
    id_famille INT  NOT NULL AUTO_INCREMENT,
    nom varchar(50)  NOT NULL UNIQUE,
    histoire varchar(50),
    CONSTRAINT pk_id PRIMARY KEY (id_famille)
);



CREATE TABLE Batard (
    id_batard INT(5)  NOT NULL ,
    famille1 INT(5)  NOT NULL ,
    famille2 INT(5)  NOT NULL ,
    CONSTRAINT fk_id FOREIGN KEY(id_batard) REFERENCES Personnage (id_personnage),
    CONSTRAINT fk_f1 FOREIGN KEY(famille1) REFERENCES Famille (id_famille),
    CONSTRAINT fk_f2 FOREIGN KEY(famille2) REFERENCES Famille (id_famille)
);




CREATE TABLE Allegeance_famille(
    id_personnage INT(5) NOT NULL,
    id_famille INT(5) NOT NULL,
    CONSTRAINT fk_id_personnage_al_fa FOREIGN KEY(id_personnage) REFERENCES Personnage (id_personnage),
    CONSTRAINT fk_id_camp_al_fa FOREIGN KEY(id_famille) REFERENCES Famille (id_famille)
);


CREATE TABLE Armee (
    id_armee INT(5)  NOT NULL AUTO_INCREMENT,
    nom varchar(50) NOT NULL ,
    chef INT (5),
    CONSTRAINT pk_id_armee PRIMARY KEY (id_armee)
);




CREATE TABLE Allegeance_camp(
    id_personnage INT(5) NOT NULL,
    id_camp INT(5) NOT NULL,
    CONSTRAINT fk_id_personnage FOREIGN KEY(id_personnage) REFERENCES Personnage (id_personnage),
    CONSTRAINT fk_id_camp FOREIGN KEY(id_camp) REFERENCES Armee (id_armee)
);



CREATE TABLE Chateau (
    id_chateau INT(5)  NOT NULL AUTO_INCREMENT,
    lieu varchar(50)  NOT NULL ,
    roi INT(5)  NOT NULL ,
    famille INT(5)  NOT NULL ,
    CONSTRAINT pk_id_cheateau PRIMARY KEY (id_chateau)
);




CREATE TABLE Enfant_de (
    id_enfant INT NOT NULL,
    id_pere INT  NOT NULL ,
    id_mere INT  NOT NULL ,
    CONSTRAINT fk_id_enfant FOREIGN KEY(id_enfant) REFERENCES Personnage (id_personnage),
    CONSTRAINT fk_id_pere FOREIGN KEY(id_pere) REFERENCES Personnage (id_personnage),
    CONSTRAINT fk_id_mere FOREIGN KEY(id_mere) REFERENCES Personnage (id_personnage)
);





CREATE TABLE A_couche (
    id1 INT  NOT NULL ,
    id2 INT  NOT NULL,
    CONSTRAINT fk_id1 FOREIGN KEY(id1) REFERENCES Personnage (id_personnage),
    CONSTRAINT fk_id2 FOREIGN KEY(id2) REFERENCES Personnage (id_personnage)
);



CREATE TABLE A_tué (
    tueur INT  NOT NULL ,
    tuees INT  NOT NULL,
    CONSTRAINT fk_tueur FOREIGN KEY(tueur) REFERENCES Personnage (id_personnage),
    CONSTRAINT fk_tuees FOREIGN KEY(tuees) REFERENCES Personnage (id_personnage)
);


CREATE TABLE Guerre (
    id_guerre INT  NOT NULL AUTO_INCREMENT,
    nom varchar(50)  NOT NULL ,
    lieu_id  INT NOT NULL ,
    dirigeant_id  INT NOT NULL ,
    CONSTRAINT pk_id_guerre PRIMARY KEY (id_guerre)
);



CREATE TABLE Marie_a (
    epoux INT  NOT NULL ,
    epouse INT  NOT NULL,
    CONSTRAINT fk_epoux FOREIGN KEY(epoux) REFERENCES Personnage (id_personnage),
    CONSTRAINT fk_epouse FOREIGN KEY(epouse) REFERENCES Personnage (id_personnage)

);



CREATE TABLE continent (
    id_continent INT  NOT NULL AUTO_INCREMENT,
    nom varchar(50)  NOT NULL ,
    CONSTRAINT pk_id_continent PRIMARY KEY (id_continent)
);





CREATE TABLE region (
    id_region INT  NOT NULL AUTO_INCREMENT,
    nom varchar(50)  NOT NULL ,
    id_continent INT NOT NULL,
    CONSTRAINT pk_id_region PRIMARY KEY (id_region),
    CONSTRAINT fk_id_continent FOREIGN KEY(id_continent) REFERENCES continent(id_continent)
);




CREATE TABLE ville (
    id_lieu INT  NOT NULL AUTO_INCREMENT,
    nom varchar(50)  NOT NULL ,
    region INT  NOT NULL ,
    CONSTRAINT pk_id_lieu PRIMARY KEY (id_lieu),
    CONSTRAINT fk_region FOREIGN KEY(region) REFERENCES region (id_region)
);








CREATE TABLE Civilisation (
    id_civilisation INT NOT NULL AUTO_INCREMENT,
    nom VARCHAR(50) unique,
    CONSTRAINT pk_id_civilisation PRIMARY KEY (id_civilisation)
);







INSERT INTO Civilisation (nom) values ("Andals");
INSERT INTO Civilisation (nom) values ("Dothrakis");
INSERT INTO Civilisation (nom) values ("Fer-nés");
INSERT INTO Civilisation (nom) values ("Nordiens");
INSERT INTO Civilisation (nom) values ("Peuple libre");
INSERT INTO Civilisation (nom) values ("Thenns");
INSERT INTO Civilisation (nom) values ("Tribus des Collines");
INSERT INTO Civilisation (nom) values ("Premiers Hommes");
INSERT INTO Civilisation (nom) values ("Valyriens");












INSERT INTO Famille (nom) values ("Stark");
INSERT INTO Famille (nom) values ("Lannister");
INSERT INTO Famille (nom) values ("Baratheon");
INSERT INTO Famille (nom) values ("Tyrell");
INSERT INTO Famille (nom) values ("Martell");
INSERT INTO Famille (nom) values ("Tully");
INSERT INTO Famille (nom) values ("Arryn");
INSERT INTO Famille (nom) values ("Greyjoy");
INSERT INTO Famille (nom) values ("Bolton");
INSERT INTO Famille (nom) values ("Clegane");
INSERT INTO Famille (nom) values ("Targaryen");
INSERT INTO Famille (nom) values ("Snow");
INSERT INTO Famille (nom) values ("Torth");

















INSERT INTO Armee (nom) values ("Compagnie Dorée");
INSERT INTO Armee (nom) values ("Garde de Nuit");
INSERT INTO Armee (nom) values ("Immaculés", "Ver Gris");
INSERT INTO Armee (nom) values ("Moineaux");
INSERT INTO Armee (nom) values ("Foi Militante");
INSERT INTO Armee (nom) values ("Guet de Port-Réal");
INSERT INTO Armee (nom) values ("Marcheur blanc");














INSERT INTO continent (nom) values ("Essos");
INSERT INTO continent (nom) values ("Sothoryos");
INSERT INTO continent (nom) values ("Westeros");





INSERT INTO region (nom, id_continent) values ("Au-delà du Mur", (select id_continent from continent where nom = "Westeros"));
INSERT INTO region (nom, id_continent) values ("Bief", (select id_continent from continent where nom = "Westeros"));
INSERT INTO region (nom, id_continent) values ("Conflans", (select id_continent from continent where nom = "Westeros"));
INSERT INTO region (nom, id_continent) values ("Détroit de Ghis", (select id_continent from continent where nom = "Essos"));
INSERT INTO region (nom, id_continent) values ("Le Neck", (select id_continent from continent where nom = "Westeros"));
INSERT INTO region (nom, id_continent) values ("Les doigts", (select id_continent from continent where nom = "Westeros"));
INSERT INTO region (nom, id_continent) values ("Mer Dothrak", (select id_continent from continent where nom = "Essos"));
INSERT INTO region (nom, id_continent) values ("Nord", (select id_continent from continent where nom = "Westeros"));
INSERT INTO region (nom, id_continent) values ("Péninsule valyrienne", (select id_continent from continent where nom = "Essos"));
INSERT INTO region (nom, id_continent) values ("Roches", (select id_continent from continent where nom = "Westeros"));
INSERT INTO region (nom, id_continent) values ("Terres de l'Orage", (select id_continent from continent where nom = "Westeros"));
INSERT INTO region (nom, id_continent) values ("Terres de l'Ouest", (select id_continent from continent where nom = "Westeros"));
INSERT INTO region (nom, id_continent) values ("Terres de la Couronne", (select id_continent from continent where nom = "Westeros"));
INSERT INTO region (nom, id_continent) values ("Val d'Arryn", (select id_continent from continent where nom = "Westeros"));
INSERT INTO region (nom, id_continent) values ("Îles de Fer", (select id_continent from continent where nom = "Westeros"));
INSERT INTO region (nom, id_continent) values ("Baie des Serfs", (select id_continent from continent where nom = "Westeros"));
INSERT INTO region (nom, id_continent) values ("Cité libres", (select id_continent from continent where nom = "Essos"));
INSERT INTO region (nom, id_continent) values ("Désert Rouge", (select id_continent from continent where nom = "Essos"));
















INSERT INTO ville (nom, region) values ("Ancienne Valyria", 8);
INSERT INTO ville (nom, region) values ("Asshaï", (select id_region from region where nom = "Mer Dothrak"));
INSERT INTO ville (nom, region) values ("Astapor", (select id_region from region where nom = "Baie des Serfs"));
INSERT INTO ville (nom, region) values ("Blancport", (select id_region from region where nom = "Nord"));
INSERT INTO ville (nom, region) values ("Braavos", (select id_region from region where nom = "Baie des Serfs"));
INSERT INTO ville (nom, region) values ("Durlieu", (select id_region from region where nom = "Au-delà du Mur"));
INSERT INTO ville (nom, region) values ("Gué-Cabot", (select id_region from region where nom = "Conflans"));
INSERT INTO ville (nom, region) values ("La Mole", (select id_region from region where nom = "Nord"));
INSERT INTO ville (nom, region) values ("Meereen", (select id_region from region where nom = "Baie des Serfs"));
INSERT INTO ville (nom, region) values ("Pentos", (select id_region from region where nom = "Cité libres"));
INSERT INTO ville (nom, region) values ("Port-Lannis", (select id_region from region where nom = "Terres de l'Ouest"));
INSERT INTO ville (nom, region) values ("Port-Réal", (select id_region from region where nom = "Terres de la Couronne"));
INSERT INTO ville (nom, region) values ("Qarth", (select id_region from region where nom = "Désert Rouge"));
INSERT INTO ville (nom, region) values ("Salins", (select id_region from region where nom = "Conflans"));
INSERT INTO ville (nom, region) values ("Vaes Dothrak", (select id_region from region where nom = "Mer Dothrak"));
INSERT INTO ville (nom, region) values ("Ville d'hiver", (select id_region from region where nom = "Nord"));
INSERT INTO ville (nom, region) values ("Villevieille", (select id_region from region where nom = "Bief"));
INSERT INTO ville (nom, region) values ("Volantis", (select id_region from region where nom = "Cité libres"));
INSERT INTO ville (nom, region) values ("Yunkaï", (select id_region from region where nom = "Baie des Serfs"));












INSERT INTO Personnage (prenom, nom, famille, civilisation) values ("Robin", "Arryn", 7, 0);
INSERT INTO Personnage (prenom, nom, civilisation) values ("Adrack", "Humble",2);
INSERT INTO Personnage (prenom, nom, famille, civilisation) values ("Daenerys", "Targaryen", 11, 9);
INSERT INTO Personnage (prenom, nom, famille, civilisation) values ("Jon", "Snow", 12,3);
INSERT INTO Personnage (nom,civilisation) values ("Aemon", (select id_civilisation from civilisation where nom like 'Valyriens'));
INSERT INTO Personnage (prenom, nom, famille, civilisation) values ("Arya", "Stark", (select id_famille from famille where nom = "Stark"), (select id_civilisation from Civilisation where nom like 'Nordiens'));
INSERT INTO Personnage (prenom, nom, famille, civilisation) values ("Eddard","Stark", (select id_famille from famille where nom = "Stark"), (select id_civilisation from Civilisation where nom like 'Nordiens'));
INSERT INTO Personnage (prenom, nom, famille, civilisation) values ("Euron", "Greyjoy", (select id_famille from famille where nom = "Greyjoy"), (select id_civilisation from Civilisation where nom like 'Fer-nés')); 
INSERT INTO Personnage (prenom, nom, famille, civilisation) values ("Balon", "Greyjoy", (select id_famille from famille where nom = "Greyjoy"), (select id_civilisation from Civilisation where nom like 'Fer-nés')); 
INSERT INTO Personnage (prenom, nom, famille, civilisation) values ("Brandon", "Stark", (select id_famille from famille where nom = "Stark"), (select id_civilisation from Civilisation where nom like 'Nordiens')); 
INSERT INTO Personnage (prenom, nom, famille, civilisation) values ("Brienne", "de Torth", (select id_famille from famille where nom = "Torth"), (select id_civilisation from Civilisation where nom like 'Andals')); 
INSERT INTO Personnage (prenom, nom, famille, civilisation) values ("Catelyn", "Stark", (select id_famille from famille where nom = "Stark"), (select id_civilisation from Civilisation where nom like 'Andals')); 
INSERT INTO Personnage (prenom, nom, famille, civilisation) values ("Cersei ", "Lannister", (select id_famille from famille where nom = "Lannister"), (select id_civilisation from Civilisation where nom like 'Andals')); 
INSERT INTO Personnage (prenom, nom, famille, civilisation) values ("Jaime", "Lannister", (select id_famille from famille where nom = "Lannister"), (select id_civilisation from Civilisation where nom like 'Andals')); 
INSERT INTO Personnage (prenom, nom, famille, civilisation) values ("Joffrey", "Baratheon", (select id_famille from famille where nom = "Baratheon"), (select id_civilisation from Civilisation where nom like 'Andals')); 
INSERT INTO Personnage (prenom, nom, famille, civilisation) values ("Jon", "Stark", (select id_famille from famille where nom = "Stark"), (select id_civilisation from Civilisation where nom like 'Nordiens')); 
INSERT INTO Personnage (prenom, nom, famille, civilisation) values ("Kevan", "Lannister", (select id_famille from famille where nom = "Lannister"), (select id_civilisation from Civilisation where nom like 'Andals')); 
INSERT INTO Personnage (prenom, nom, famille, civilisation) values ("Lancel", "Lannister", (select id_famille from famille where nom = "Lannister"), (select id_civilisation from Civilisation where nom like 'Andals')); 
INSERT INTO Personnage (prenom, nom, famille, civilisation) values ("Rhaegar", "Targaryen", (select id_famille from famille where nom = "Targaryen"), (select id_civilisation from Civilisation where nom like 'Valyriens')); 
INSERT INTO Personnage (prenom, nom, famille, civilisation) values ("Robb", "Stark", (select id_famille from famille where nom = "Stark"), (select id_civilisation from Civilisation where nom like 'Nordiens')); 
INSERT INTO Personnage (prenom, nom, famille, civilisation) values ("Robert", "Baratheon", (select id_famille from famille where nom = "Baratheon"), (select id_civilisation from Civilisation where nom like 'Andals')); 
INSERT INTO Personnage (prenom, civilisation) values ("Roi de la Nuit", (select id_civilisation from Civilisation where nom like 'Premiers Hommes')); 
INSERT INTO Personnage (prenom, nom, famille, civilisation) values ("Roose", "Bolton", (select id_famille from famille where nom = "Bolton"), (select id_civilisation from Civilisation where nom like 'Nordiens')); 
INSERT INTO Personnage (prenom, nom, famille, civilisation) values ("Roslin", "Tully", (select id_famille from famille where nom = "Tully"), (select id_civilisation from Civilisation where nom like 'Andals')); 
INSERT INTO Personnage (prenom, nom, famille, civilisation) values ("Sandor", "Clegane", (select id_famille from famille where nom = "Clegane"), (select id_civilisation from Civilisation where nom like 'Andals')); 
INSERT INTO Personnage (prenom, nom, famille, civilisation) values ("Sansa", "Stark", (select id_famille from famille where nom = "Stark"), (select id_civilisation from Civilisation where nom like 'Nordiens')); 
INSERT INTO Personnage (prenom, nom, famille, civilisation) values ("Lyanna", "Stark", (select id_famille from famille where nom = "Stark"), (select id_civilisation from Civilisation where nom like 'Nordiens')); 










INSERT INTO Batard (id_batard, famille1, famille2) values ((select id_personnage from personnage where nom = "Snow" and prenom ="Jon"), (select id_famille from famille where nom = "Stark"),(select id_famille from famille where nom = "Targaryen"));

















INSERT INTO Enfant_de (id_enfant, id_mere, id_pere) values ((select id_personnage from personnage where nom like "Snow" and prenom like "Jon"), (select id_personnage from personnage where nom like "Stark" and prenom like "Lyanna"),(select id_personnage from personnage where nom = "Targaryen" and prenom ="Rhaegar"));


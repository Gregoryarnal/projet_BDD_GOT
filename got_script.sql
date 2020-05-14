-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots (.. - without quotes).

DROP TABLE IF EXISTS Civilisation;
DROP TABLE IF EXISTS Allegeance_maison;
DROP TABLE IF EXISTS Batard;
DROP TABLE IF EXISTS maison;
DROP TABLE IF EXISTS Enfant_de;
DROP TABLE IF EXISTS Chateau;
DROP TABLE IF EXISTS ville;
DROP TABLE IF EXISTS region;
DROP TABLE IF EXISTS continent;
DROP TABLE IF EXISTS Allegeance;
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
    nom_acteur varchar(50),
    prenom_acteur varchar(50),
    mort varchar(50) ,
    civilisation INT (5),
    CONSTRAINT pk_id_personnage PRIMARY KEY (id_personnage)
);



CREATE TABLE maison (
    id_maison INT  NOT NULL AUTO_INCREMENT,
    nom varchar(50)  NOT NULL UNIQUE,
    histoire varchar(50),
    CONSTRAINT pk_id PRIMARY KEY (id_maison)
);



CREATE TABLE Batard (
    id_batard INT(5)  NOT NULL ,
    famille1 INT(5)  NOT NULL ,
    famille2 INT(5)  NOT NULL ,
    CONSTRAINT fk_id FOREIGN KEY(id_batard) REFERENCES Personnage (id_personnage),
    CONSTRAINT fk_f1 FOREIGN KEY(famille1) REFERENCES maison (id_maison),
    CONSTRAINT fk_f2 FOREIGN KEY(famille2) REFERENCES maison (id_maison)
);




CREATE TABLE Allegeance_maison(
    id_personnage INT(5) NOT NULL,
    id_maison INT(5) NOT NULL,
    CONSTRAINT fk_id_personnage_al_fa FOREIGN KEY(id_personnage) REFERENCES Personnage (id_personnage),
    CONSTRAINT fk_id_camp_al_fa FOREIGN KEY(id_maison) REFERENCES maison (id_maison)
);


CREATE TABLE Armee (
    id_armee INT(5)  NOT NULL AUTO_INCREMENT,
    nom varchar(50) NOT NULL ,
    chef INT (5),
    CONSTRAINT pk_id_armee PRIMARY KEY (id_armee)
);


CREATE TABLE Allegeance(
    id_personnage INT(5) NOT NULL,
    nom varchar(50) NOT NULL,
    CONSTRAINT fk_id_personnage FOREIGN KEY(id_personnage) REFERENCES Personnage (id_personnage)
);



CREATE TABLE Chateau (
    id_chateau INT(5)  NOT NULL AUTO_INCREMENT,
    nom VARCHAR(50),
    lieu varchar(50)  NOT NULL ,
    maison INT(5) ,
    armee int(5)
    CONSTRAINT pk_id_cheateau PRIMARY KEY (id_chateau),
    CONSTRAINT fk_famille FOREIGN KEY(maison) REFERENCES Maison (id_famille),
    CONSTRAINT fk_armee FOREIGN KEY(armee) REFERENCES Armee (id_armee),
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


Create table deplacement(
    id_personnage int,
    id_lieu int,
    CONSTRAINT fk_id_perso_deplacement FOREIGN KEY(id_personnage) REFERENCES Personnage (id_personnage),
    CONSTRAINT fk_id_lieu_deplacement FOREIGN KEY(id_lieu) REFERENCES ville (id_lieu)
)



INSERT INTO Civilisation (nom) values ("Andals");
INSERT INTO Civilisation (nom) values ("Andals");
INSERT INTO Civilisation (nom) values ("Dothrakis");
INSERT INTO Civilisation (nom) values ("Fer-nés");
INSERT INTO Civilisation (nom) values ("Nordiens");
INSERT INTO Civilisation (nom) values ("Peuple libre");
INSERT INTO Civilisation (nom) values ("Thenns");
INSERT INTO Civilisation (nom) values ("Tribus des Collines");
INSERT INTO Civilisation (nom) values ("Premiers Hommes");
INSERT INTO Civilisation (nom) values ("Valyriens");

INSERT INTO Maison (nom) values ("Arryn");
INSERT INTO Maison (nom) values ("Baratheon");
INSERT INTO Maison (nom) values ("Baratheon de Peyredragon");
INSERT INTO Maison (nom) values ("Bolton");
INSERT INTO Maison (nom) values ("Castral");
INSERT INTO Maison (nom) values ("Chenu");
INSERT INTO Maison (nom) values ("d'Alluve");
INSERT INTO Maison (nom) values ("de Bronn");
INSERT INTO Maison (nom) values ("Durrandon");
INSERT INTO Maison (nom) values ("Frey");
INSERT INTO Maison (nom) values ("Greyjoy");
INSERT INTO Maison (nom) values ("Jardinier");
INSERT INTO Maison (nom) values ("Lannister");
INSERT INTO Maison (nom) values ("Lejuste");
INSERT INTO Maison (nom) values ("Martell");
INSERT INTO Maison (nom) values ("Stark");
INSERT INTO Maison (nom) values ("Targaryen");
INSERT INTO Maison (nom) values ("Tully");
INSERT INTO Maison (nom) values ("Tyrell");
INSERT INTO Maison (nom) values ("Clegane");
INSERT INTO Maison (nom) values ("Connington");
INSERT INTO Maison (nom) values ("Cuillêtre");
INSERT INTO Maison (nom) values ("Swyft");
INSERT INTO Maison (nom) values ("Verchamps");
INSERT INTO Maison (nom) values ("Ambre");
INSERT INTO Maison (nom) values ("Baelish");
INSERT INTO Maison (nom) values ("Blount");
INSERT INTO Maison (nom) values ("Bracken");
INSERT INTO Maison (nom) values ("Brune");
INSERT INTO Maison (nom) values ("Cargyll");
INSERT INTO Maison (nom) values ("Caron");
INSERT INTO Maison (nom) values ("Cassel");
INSERT INTO Maison (nom) values ("Castelfoyer");
INSERT INTO Maison (nom) values ("Cendregué");
INSERT INTO Maison (nom) values ("Cerwyn");
INSERT INTO Maison (nom) values ("Clegane");
INSERT INTO Maison (nom) values ("Cole");
INSERT INTO Maison (nom) values ("Connington");
INSERT INTO Maison (nom) values ("Corbois");
INSERT INTO Maison (nom) values ("Corbray");
INSERT INTO Maison (nom) values ("Cossepois");
INSERT INTO Maison (nom) values ("Crakehall");
INSERT INTO Maison (nom) values ("Cuillêtre");
INSERT INTO Maison (nom) values ("Darry");
INSERT INTO Maison (nom) values ("Dayne");
INSERT INTO Maison (nom) values ("Dondarrion");
INSERT INTO Maison (nom) values ("Dormand");
INSERT INTO Maison (nom) values ("du Rouvre");
INSERT INTO Maison (nom) values ("Dustin");
INSERT INTO Maison (nom) values ("Egen");
INSERT INTO Maison (nom) values ("Errol");
INSERT INTO Maison (nom) values ("Estremont");
INSERT INTO Maison (nom) values ("Ferboys");
INSERT INTO Maison (nom) values ("Florent");
INSERT INTO Maison (nom) values ("Foin");
INSERT INTO Maison (nom) values ("Forrester");
INSERT INTO Maison (nom) values ("Fort");
INSERT INTO Maison (nom) values ("Gaunt");
INSERT INTO Maison (nom) values ("Glover");ƒ
INSERT INTO Maison (nom) values ("Grandison");
INSERT INTO Maison (nom) values ("Harloi");
INSERT INTO Maison (nom) values ("Herpivoie");
INSERT INTO Maison (nom) values ("Hightower");
INSERT INTO Maison (nom) values ("Karstark");
INSERT INTO Maison (nom) values ("Kenning");
INSERT INTO Maison (nom) values ("Lannister de Port-Lannis");
INSERT INTO Maison (nom) values ("Lefford");
INSERT INTO Maison (nom) values ("Lorch");
INSERT INTO Maison (nom) values ("Lothston");
INSERT INTO Maison (nom) values ("Mallister");
INSERT INTO Maison (nom) values ("Manderly");
INSERT INTO Maison (nom) values ("Marpheux");
INSERT INTO Maison (nom) values ("Mazin");
INSERT INTO Maison (nom) values ("Mervault");
INSERT INTO Maison (nom) values ("Mollen");
INSERT INTO Maison (nom) values ("Moore");
INSERT INTO Maison (nom) values ("Mormont");
INSERT INTO Maison (nom) values ("Morrigen");
INSERT INTO Maison (nom) values ("Mossegonde");
INSERT INTO Maison (nom) values ("Nerbosc");
INSERT INTO Maison (nom) values ("Omble");
INSERT INTO Maison (nom) values ("Ouestrelin");
INSERT INTO Maison (nom) values ("Payne");
INSERT INTO Maison (nom) values ("Petibois");
INSERT INTO Maison (nom) values ("Poole");
INSERT INTO Maison (nom) values ("Qoherys");
INSERT INTO Maison (nom) values ("Redwyne");
INSERT INTO Maison (nom) values ("Reed");
INSERT INTO Maison (nom) values ("Reyne");
INSERT INTO Maison (nom) values ("Rosby");
INSERT INTO Maison (nom) values ("Royce");
INSERT INTO Maison (nom) values ("Rykker");
INSERT INTO Maison (nom) values ("Ryswell");
INSERT INTO Maison (nom) values ("Selmy");
INSERT INTO Maison (nom) values ("Slynt");
INSERT INTO Maison (nom) values ("Swann");
INSERT INTO Maison (nom) values ("Swyft");
INSERT INTO Maison (nom) values ("Tallett");
INSERT INTO Maison (nom) values ("Tallhart");
INSERT INTO Maison (nom) values ("Tarbeck");
INSERT INTO Maison (nom) values ("Tarly");
INSERT INTO Maison (nom) values ("Thorne");
INSERT INTO Maison (nom) values ("Tignac");
INSERT INTO Maison (nom) values ("Torth");
INSERT INTO Maison (nom) values ("Tourelles");
INSERT INTO Maison (nom) values ("Trant");
INSERT INTO Maison (nom) values ("Uller");
INSERT INTO Maison (nom) values ("Vanbois");
INSERT INTO Maison (nom) values ("Velaryon");
INSERT INTO Maison (nom) values ("Verchamps");
INSERT INTO Maison (nom) values ("Whent");
INSERT INTO Maison (nom) values ("Whitehill");
INSERT INTO Maison (nom) values ("Wylde");
INSERT INTO Maison (nom) values ("Yarwyck");
INSERT INTO Maison (nom) values ("Ambre");
INSERT INTO Maison (nom) values ("Baelish");
INSERT INTO Maison (nom) values ("Baratheon de Peyredragon");
INSERT INTO Maison (nom) values ("Bolton");
INSERT INTO Maison (nom) values ("Cargyll");
INSERT INTO Maison (nom) values ("Cassel");
INSERT INTO Maison (nom) values ("Castral");
INSERT INTO Maison (nom) values ("Chenu");
INSERT INTO Maison (nom) values ("Clegane");
INSERT INTO Maison (nom) values ("Cole");
INSERT INTO Maison (nom) values ("d'Alluve");
INSERT INTO Maison (nom) values ("Darry");
INSERT INTO Maison (nom) values ("Durrandon");
INSERT INTO Maison (nom) values ("Feunoyr");
INSERT INTO Maison (nom) values ("Fort");
INSERT INTO Maison (nom) values ("Frimas");
INSERT INTO Maison (nom) values ("Greyfer");
INSERT INTO Maison (nom) values ("Herpivoie");
INSERT INTO Maison (nom) values ("Hollard");
INSERT INTO Maison (nom) values ("Jardinier");
INSERT INTO Maison (nom) values ("Karstark");
INSERT INTO Maison (nom) values ("Lejuste");
INSERT INTO Maison (nom) values ("Lothston");
INSERT INTO Maison (nom) values ("Martell");
INSERT INTO Maison (nom) values ("Mormont");
INSERT INTO Maison (nom) values ("Omble");
INSERT INTO Maison (nom) values ("Qoherys");
INSERT INTO Maison (nom) values ("Reyne");
INSERT INTO Maison (nom) values ("Slynt");
INSERT INTO Maison (nom) values ("Tarbeck");
INSERT INTO Maison (nom) values ("Tignac");
INSERT INTO Maison (nom) values ("Tourelles");
INSERT INTO Maison (nom) values ("Tourelles (Nord)");
INSERT INTO Maison (nom) values ("Tyrell");
INSERT INTO Maison (nom) values ("Verbois");
INSERT INTO Maison (nom) values ("Whent");


INSERT INTO Armee (nom) values ("Compagnie Dorée");
INSERT INTO Armee (nom) values ("Garde de Nuit");
INSERT INTO Armee (nom) values ("Immaculés", "Ver Gris");
INSERT INTO Armee (nom) values ("Moineaux");
INSERT INTO Armee (nom) values ("Foi Militante");
INSERT INTO Armee (nom) values ("Guet de Port-Réal");
INSERT INTO Armee (nom) values ("Marcheur blanc");
INSERT INTO Armee (nom) values ("Garde Royal");

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

INSERT INTO chateau (nom, lieu, maison ) values ("Accalmie", (select id_continent from continent where nom like "Westeros"), (select id_famille from famille where nom like "Baratheon"));
INSERT INTO chateau (nom, lieu, maison ) values ("Castamere", (select id_continent from continent where nom like "Westeros"));
INSERT INTO chateau (nom, lieu, maison ) values ("Castelfoyer", (select id_continent from continent where nom like "Westeros"), (select id_famille from famille where nom like "Castelfoyer"));
INSERT INTO chateau (nom, lieu, maison ) values ("Castral Roc", (select id_continent from continent where nom like "Westeros"), (select id_famille from famille where nom like "Lannister"));
INSERT INTO chateau (nom, lieu, armee ) values ("Châteaunoir", (select id_continent from continent where nom like "Westeros"), (select id_armee from Armee where nom like "Garde de Nuit"));
INSERT INTO chateau (nom, lieu, maison ) values ("Donjon des Clegane", (select id_continent from continent where nom like "Westeros"), (select id_famille from famille where nom like "Clegane"));
INSERT INTO chateau (nom, lieu, armee ) values ("Donjon Rouge", (select id_continent from continent where nom like "Westeros"), (select id_armee from Armee where nom like "Garde Royal"));
INSERT INTO chateau (nom, lieu, maison ) values ("Hautjardin", (select id_continent from continent where nom like "Westeros"), (select id_famille from famille where nom like "Broon"));
INSERT INTO chateau (nom, lieu, maison ) values ("Winterfell", (select id_continent from continent where nom like "Westeros"), (select id_famille from famille where nom like "Stark"));

INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Marpheux", "Addam", "B.J.", "Hogg", "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Humble", "Adrack", "Jody", "Halse", "Ramsay Snow", (select id_civilisation from Civilisation where nom like "Fer-nés"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Feunoyr", "Aegon",  "NULL", (select id_civilisation from Civilisation where nom like "Fer-nés"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Targaryen", "Aegon I",  "NULL", (select id_civilisation from Civilisation where nom like "Valyriens"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("IV Targaryen", "Aegon",  "NULL", (select id_civilisation from Civilisation where nom like "Valyriens"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Targaryen", "Aegon",  "Sac de Port-Réal", (select id_civilisation from Civilisation where nom like "Valyriens"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("V Targaryen", "Aegon",  "Tragédie de Lestival", (select id_civilisation from Civilisation where nom like "Valyriens"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Rivers", "Aegor",  "NULL", (select id_civilisation from Civilisation where nom like "Valyriens"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Arryn", "Aemma",  "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Aemon", "Peter", "Vaughan", "NULL", (select id_civilisation from Civilisation where nom like "Valyriens"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Feunoyr", "Aemon",  "NULL", (select id_civilisation from Civilisation where nom like "Valyriens"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Targaryen", "Aemond",  "Daemon Targaryen", (select id_civilisation from Civilisation where nom like "Valyriens"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Targaryen", "Aenar",  "NULL", (select id_civilisation from Civilisation where nom like "Valyriens"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Targaryen", "Aenys I",  "NULL", (select id_civilisation from Civilisation where nom like "Valyriens"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Targaryen", "Aerion",  "feu grégeois", (select id_civilisation from Civilisation where nom like "Valyriens"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Greyjoy", "Aeron", "Michael", "Feast", "NULL", (select id_civilisation from Civilisation where nom like "Fer-nés"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Targaryen", "Aerys I",  "NULL", (select id_civilisation from Civilisation where nom like "Valyriens"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Targaryen", "Aerys II", "David", "Rintoul", "Jaime Lannister", (select id_civilisation from Civilisation where nom like "Valyriens"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Aggo", "David", "Rintoul", "NULL", (select id_civilisation from Civilisation where nom like "Dothraki"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Greyjoy", "Alannys",  "NULL", (select id_civilisation from Civilisation where nom like "Fer-nés"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Thorne", "Alliser", "Owen", "Teale", "Jon Snow", (select id_civilisation from Civilisation where nom like "Fer-nés"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Lannister", "Alton", "Karl", "Davies", "Jaime Lannister", (select id_civilisation from Civilisation where nom like "Andal"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Herpivoie", "Alys",  "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Karstark", "Alys", "Megan", "Parkinson", "Spectres", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Targaryen", "Alysanne",  "NULL", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Velaryon", "Alyssa",  "NULL", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Omble", "Amarylis",  "NULL", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Lorch", "Amory", "Fintan", "McKeown", "Jaqen H'ghar", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Anara", "Ollie", "Kram", "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Anguy", "Philip", "McGinley", "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Vanbois", "Anya", "Paola", "Dionisotti", "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Hotah", "Areo", "DeObia", "Oparei", "Tyerne Sand", (select id_civilisation from Civilisation where nom like "Norvos"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Baratheon", "Argella",  "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Durrandon", "Argilac",  "Orys Baratheon", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Armeca", "Sahara", "Knite", "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Briseglace", "Arson",  "Garde de Nuit", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Arthur", "Nathanael", "Saleh", "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Dayne", "Arthur", "Luke", "Roberts", "Howland Reed", (select id_civilisation from Civilisation where nom like "Dorniens"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Frey", "Arwaya",  "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Stark", "Arya", "Maisie", "Williams", "NULL", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Ash", "Yousef", "Sweid", "NULL", (select id_civilisation from Civilisation where nom like "Ghiscaris"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Dayne", "Ashara",  "NULL", (select id_civilisation from Civilisation where nom like "Dornienne"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Florent", "Axell", "James", "McHale", "Mélisandre", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Aya", "Aifric", "O'Donnell", "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Ahai", "Azor",  "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Targaryen", "Baelor",  "NULL", (select id_civilisation from Civilisation where nom like "Valyriens"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Greyjoy", "Balon", "Patrick", "Malahide", "Projeté du haut du pont", (select id_civilisation from Civilisation where nom like "Fer-nés"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Barra", "Patrick", "Malahide", "Janos Slynt", (select id_civilisation from Civilisation where nom like "Fer-nés"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Selmy", "Barristan", "Ian", "McElhinney", "Fils de la Harpie", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Paenymion", "Belicho", "Eddie", "Jackson", "Ver Gris", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Stark", "Benjen", "Joseph", "Mawle", "Spectres", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Dayne", "Beric",  "NULL", (select id_civilisation from Civilisation where nom like "Dorniens"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Bernadette", "Sara", "Dylan", "NULL", (select id_civilisation from Civilisation where nom like "Dorniens"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Bessie", "Sara", "Dylan", "NULL", (select id_civilisation from Civilisation where nom like "Dorniens"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Bharbo", "Sara", "Dylan", "NULL", (select id_civilisation from Civilisation where nom like "Dothraki"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Bianca", "Eline", "Powell", "NULL", (select id_civilisation from Civilisation where nom like "Braaviens"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Bobono", "Leigh", "Gill", "NULL", (select id_civilisation from Civilisation where nom like "Braaviens"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Stark", "Bran", "Isaac", "Hempstead-Wright", "NULL", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Brea", "Gemita", "Samarra", "NULL", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Brian", "Gemita", "Samarra", "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("de Torth", "Brienne", "Gwendoline", "Christie", "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Bronn", "Jerome", "Flynn", "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Brozho", "Elie", "Haddad", "Daenerys Targaryen", (select id_civilisation from Civilisation where nom like "Dothrakis"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Bruni", "Elie", "Haddad", "Osha", (select id_civilisation from Civilisation where nom like "Peuple libre"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Tully", "Brynden", "Clive", "Russell", "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Swann", "Byron",  "Vhagar", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("mort-nés Baratheon", "Bébés",  "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Dondarrion", "Béric", "Michael Scott", "David", "spectres", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Caleotte", "Colin", "Azzopardi", "Tyerne Sand", (select id_civilisation from Civilisation where nom like "Dorniens"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Camello", "Kevin", "Eldon", "NULL", (select id_civilisation from Civilisation where nom like "Braaviens"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Baratheon", "Cassana",  "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Stark", "Catelyn", "Michelle", "Fairley", "Walder Rivers", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Lannister", "Cersei", "Lena", "Headey", "Donjon Rouge", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Thenn", "Change-peau", "Joseph", "Gatt", "Samwell Tarly", (select id_civilisation from Civilisation where nom like "Peuple libre"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Chella", "Natalie", "Lee", "NULL", (select id_civilisation from Civilisation where nom like "Tribus des Collines"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Clarenzo", "Rob", "Callender", "NULL", (select id_civilisation from Civilisation where nom like "Braaviens"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Clea", "Gwyneth", "Keyworth", "NULL", (select id_civilisation from Civilisation where nom like "Braaviens"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Cleon", "Gwyneth", "Keyworth", "siège d'Astapor", (select id_civilisation from Civilisation where nom like "Astapor"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Cerwyn", "Cley", "Tom", "Varey", "NULL", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Cohollo", "Tom", "Varey", "NULL", (select id_civilisation from Civilisation where nom like "Dothraki"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Cooper", "Jack", "Roth", "Mag Mar Tun Doh Weg", (select id_civilisation from Civilisation where nom like "Dothraki"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Omble", "Corin",  "NULL", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("à trois", "Corneille", "Struan", "Rodger", "Roi de la Nuit", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Craster", "Robert", "Pugh", "Karl Tanner", (select id_civilisation from Civilisation where nom like "Peuple libre"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Craya", "Lucy", "Aarden", "NULL", (select id_civilisation from Civilisation where nom like "Peuple libre"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Stark", "Cregan",  "NULL", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Cressen", "Ford Davies", "Oliver", "NULL", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Lannister", "Cynda",  "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Naharis", "Daario", "Ed", "Skrein", "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Feunoyr", "Daemon",  "Bataille du Champ d'Herberouge", (select id_civilisation from Civilisation where nom like "Valyriens"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Feunoyr", "Daemon II",  "Donjon Rouge", (select id_civilisation from Civilisation where nom like "Valyriens"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Targaryen", "Daemon",  "Œildieu", (select id_civilisation from Civilisation where nom like "Valyriens"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Targaryen", "Daena",  "NULL", (select id_civilisation from Civilisation where nom like "Valyriens"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Targaryen", "Daenerys", "Emilia", "Clarke", "Jon Snow", (select id_civilisation from Civilisation where nom like "Valyriens"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Targaryen", "Daenys",  "NULL", (select id_civilisation from Civilisation where nom like "Valyriens"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Targaryen", "Daeron I",  "Conquête de Dorne", (select id_civilisation from Civilisation where nom like "Valyriens"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Targaryen", "Daeron II",  "NULL", (select id_civilisation from Civilisation where nom like "Valyriens"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Dagmer", "Ralph", "Ineson", "Ramsay Snow", (select id_civilisation from Civilisation where nom like "Fer-nés"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Daisy", "Maisie", "Dee", "NULL", (select id_civilisation from Civilisation where nom like "Fer-nés"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Marpheux", "Damon",  "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Lothston", "Danelle",  "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Omble", "Daragh",  "NULL", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Mervault", "Davos", "Liam", "Cunningham", "NULL", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Mallister", "Denys", "J.J.", "Murphy", "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Frey", "Derwa",  "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Crakehall", "Desmond", "Maro", "Drobnic", "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Tarly", "Dickon", "Tom", "Hopper", "Drogon", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Dalba", "Dim", "Murray", "McArthur", "NULL", (select id_civilisation from Civilisation where nom like "Peuple libre"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Dirah", "Marina", "Lawrence-Mahrra", "NULL", (select id_civilisation from Civilisation where nom like "Peuple libre"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Dolf", "Marina", "Lawrence-Mahrra", "NULL", (select id_civilisation from Civilisation where nom like "Tribus des Collines"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Bolton", "Domeric",  "NULL", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Dongo", "Ian", "Whyte", "Bataille de Châteaunoir", (select id_civilisation from Civilisation where nom like "Peuple libre"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Vanbois", "Donnel", "Alisdair", "Simpson", "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Hollard", "Dontos", "Tony", "Way", "Petyr Baelish", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Martell", "Doran", "Alexander", "Siddig", "Ellaria Sand", (select id_civilisation from Civilisation where nom like "Dorniens"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Doreah", "Roxanne", "McKee", "Daenerys Targaryen", (select id_civilisation from Civilisation where nom like "Lysienne"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Stark", "Dorren",  "NULL", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Drennan", "David", "Coakley", "Osha", (select id_civilisation from Civilisation where nom like "Fer-nés"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Drogo", "Jason", "Momoa", "Daenerys", (select id_civilisation from Civilisation where nom like "Dothraki"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("le Grand", "Duncan",  "Tragédie de Lestival", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Targaryen", "Duncan",  "Tragédie de Lestival", (select id_civilisation from Civilisation where nom like "Valyriens"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Durran", "Jason", "Momoa", "NULL", (select id_civilisation from Civilisation where nom like "Premiers Hommes"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Dayne", "Dyanna",  "NULL", (select id_civilisation from Civilisation where nom like "Dorniens"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Ebrose", "Jim", "Broadbent", "NULL", (select id_civilisation from Civilisation where nom like "Dorniens"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Stark", "Eddard", "Sean", "Bean", "Ilyn Payne", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Eddie", "Ed", "Sheeran", "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Tallett", "Eddison", "Ben", "Crompton", "spectre", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Ferboys", "Edgar",  "NULL", (select id_civilisation from Civilisation where nom like "Dorniens"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Tully", "Edmure", "Tobias", "Menzies", "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Targaryen", "Elaena",  "NULL", (select id_civilisation from Civilisation where nom like "Valyriens"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Sarsfield", "Eldrick",  "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Elenei", "Tobias", "Menzies", "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Martell", "Elia",  "Gregor Clegane", (select id_civilisation from Civilisation where nom like "Dorniens"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Sand", "Elia",  "NULL", (select id_civilisation from Civilisation where nom like "Dorniens"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Sand", "Ellaria", "Indira", "Varma", "Donjon Rouge", (select id_civilisation from Civilisation where nom like "Dorniens"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Reyne", "Ellyn",  "Siège de Château Tarbeck", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Glover", "Erena",  "NULL", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("et Affranchis", "Catégorie:Esclaves",  "NULL", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Glover", "Ethan",  "Aerys II Targaryen", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Greyjoy", "Euron", "Pilou", "Asbæk", "Jaime Lannister", (select id_civilisation from Civilisation where nom like "Fer-nés"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Castelfoyer", "Falyse",  "NULL", (select id_civilisation from Civilisation where nom like "Andal"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Farlen", "Peter", "Ballance", "NULL", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Fennesz", "Allan Davies", "Trevor", "NULL", (select id_civilisation from Civilisation where nom like "Ghiscaris"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Fermier", "Finbar", "Lynch", "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Feuille", "Kae", "Alexander", "Spectres", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Forzho", "Tamer", "Hassan", "Daenerys Targaryen", (select id_civilisation from Civilisation where nom like "Dothrakis"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Frances", "Annette", "Hannah", "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Frey", "Freya",  "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("abandonnée", "Gamine", "Faye", "Marsay", "Arya Stark", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Gared", "Dermot", "Keaney", "Marcheur Blanc", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Omble", "Gareth",  "NULL", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Jardinier", "Garth",  "NULL", (select id_civilisation from Civilisation where nom like "Premiers Hommes"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Glover", "Gawen",  "NULL", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Gendel", "Dermot", "Keaney", "NULL", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Baratheon", "Gendry", "Joe", "Dempsie", "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Genna", "Kylie", "Harris", "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Hightower", "Gerold", "Eddie", "Eyre", "Eddard Stark", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Ghita", "Hattie", "Gotobed", "Arya Stark", (select id_civilisation from Civilisation where nom like "Braaviens"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Gorne", "Hattie", "Gotobed", "NULL", (select id_civilisation from Civilisation where nom like "Braaviens"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Moineau", "Grand", "Jonathan", "Pryce", "feu grégeois", (select id_civilisation from Civilisation where nom like "Braaviens"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Clegane", "Gregor", "Conan", "Stevens", "Sandor Clegane", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("mo Ullhor", "Greizhen", "Clifford", "Barry", "Immaculés", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Grenn", "Mark", "Stanley", "Mag Mar Tun Doh Weg", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Guymon", "Jem", "Wall", "Ygrid", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Gaunt", "Gwayne",  "Symon Hollard", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Haggo", "Jem", "Wall", "NULL", (select id_civilisation from Civilisation where nom like "Dothraki"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Hallyne", "Roy", "Dotrice", "NULL", (select id_civilisation from Civilisation where nom like "Dothraki"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Karstark", "Harald", "Paul", "Rattray", "Bataille des Bâtards", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Omble", "Harkon",  "NULL", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Harrag", "Brendan", "Cowell", "NULL", (select id_civilisation from Civilisation where nom like "Fer-nés"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Chenu", "Harren",  "Balerion", (select id_civilisation from Civilisation where nom like "Fer-nés"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Strickland", "Harry", "Marc", "Rissmann", "Ver Gris", (select id_civilisation from Civilisation where nom like "Fer-nés"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Swyft", "Harys",  "NULL", (select id_civilisation from Civilisation where nom like "Fer-nés"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Hazzéa", "Marc", "Rissmann", "Drogon", (select id_civilisation from Civilisation where nom like "Ghiscaris"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Helliweg", "Joe", "Hewetson", "NULL", (select id_civilisation from Civilisation where nom like "Ghiscaris"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Henk", "Danny", "Kirrane", "NULL", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Heward", "Danny", "Kirrane", "NULL", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("zo Loraq", "Hizdahr", "Joel", "Fry", "Fils de la Harpie", (select id_civilisation from Civilisation where nom like "Ghiscaris"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Hodor", "Kristian", "Nairn", "armée des morts", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Tully", "Hoster", "Christopher", "Newman", "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Omble", "Hothor",  "NULL", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Reed", "Howland", "Leo", "Woodruff", "NULL", (select id_civilisation from Civilisation where nom like "Paludiers"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Hugh", "Jefferson", "Hall", "NULL", (select id_civilisation from Civilisation where nom like "Paludiers"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("de la", "Hugor",  "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("légendaires", "Catégorie:Héros",  "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Iggo", "Deon", "Lee-Williams", "Daario Naharis", (select id_civilisation from Civilisation where nom like "Dothrakis"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Mopatis", "Illyrio", "Roger", "Allam", "NULL", (select id_civilisation from Civilisation where nom like "Dothrakis"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Payne", "Ilyn", "Wilko", "Johnson", "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Royal", "Intendant", "Robert", "Sterne", "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Irri", "Amrita", "Acharia", "Doreah", (select id_civilisation from Civilisation where nom like "Dothraki"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Targaryen", "Jaehaerys I",  "NULL", (select id_civilisation from Civilisation where nom like "Valyriens"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Flowers", "Jafer",  "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Lannister", "Jaime", "Nikolaj", "Coster-Waldau", "Donjon Rouge", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Frey", "Janeya",  "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Slynt", "Janos", "Dominic", "Carter", "Jon Snow", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("H'ghar", "Jaqen", "Tom", "Wlaschiha", "NULL", (select id_civilisation from Civilisation where nom like "Braaviens"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Rykker", "Jaremy", "Jeffrey", "O'Brien", "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("de Vieilles-Pierres", "Jenny",  "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Mormont", "Jeor", "James", "Cosmo", "Rast", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Mallister", "Jeremy",  "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Marpheux", "Jeyne",  "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Poole", "Jeyne",  "NULL", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Jhiqui", "Sarita", "Piotrowski", "NULL", (select id_civilisation from Civilisation where nom like "Dothraki"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Lannister", "Joanna",  "Tyrion Lannister", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Baratheon", "Joffrey", "Jack", "Gleeson", "Olenna Tyrell", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Johnna", "Ali", "Lyons", "NULL", (select id_civilisation from Civilisation where nom like "Peuple libre"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Reed", "Jojen", "Thomas", "Brodie-Sangster", "Meera Reed", (select id_civilisation from Civilisation where nom like "Paludiers"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Arryn", "Jon", "John", "Standing", "Lysa", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Lynderly", "Jon", "Patrick", "Rocks", "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Snow", "Jon", "Kit", "Harington", "NULL", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Stark", "Jon",  "NULL", (select id_civilisation from Civilisation where nom like "Premiers Hommes"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Bracken", "Jonos", "Gerry", "O'Brien", "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Darry", "Jonothor",  "Bataille du Trident", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Mormont", "Jorah", "Iain", "Glen", "NULL", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Joramun", "Iain", "Glen", "NULL", (select id_civilisation from Civilisation where nom like "Peuple libre"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Cassel", "Jory", "Jamie", "Sives", "Jaime Lannister", (select id_civilisation from Civilisation where nom like "Peuple libre"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Omble", "Joseth",  "NULL", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Joss", "Niall", "Cusack", "NULL", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Frey", "Joyeuse", "Kelly", "Long", "Catelyn Stark", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Kaeth", "Kelly", "Long", "NULL", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Tanner", "Karl", "Burn", "Gorman", "Jon Snow", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Stark", "Karlon",  "NULL", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Karsi", "Hjort Sørensen", "Birgitte", "spectres", (select id_civilisation from Civilisation where nom like "Peuple libre"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Kayla", "Le Knot", "Pixie", "NULL", (select id_civilisation from Civilisation where nom like "Peuple libre"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Kesh", "Michael", "Heath", "NULL", (select id_civilisation from Civilisation where nom like "Ghiscaris"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Lannister", "Kevan", "Ian", "Gelder", "feu grégeois", (select id_civilisation from Civilisation where nom like "Ghiscaris"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Kinvara", "Ania", "Bukstein", "NULL", (select id_civilisation from Civilisation where nom like "Ghiscaris"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Frey", "Kitty", "Lucy", "Hayes", "NULL", (select id_civilisation from Civilisation where nom like "Ghiscaris"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Koner", "Joseph", "Quinn", "NULL", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Kovarro", "Steven", "Cole", "NULL", (select id_civilisation from Civilisation where nom like "Dothraki"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("mo Nakloz", "Kraznys", "Dan", "Hildebrand", "Drogon", (select id_civilisation from Civilisation where nom like "Astapor"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Kurleket", "Kevin", "Keenan", "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Kyra", "Kevin", "Keenan", "Ramsay Bolton", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Cigogne", "Lady", "Essie", "Davis", "Gamine abandonnée", (select id_civilisation from Civilisation where nom like "Braaviens"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Lannister", "Lancel", "Eugene", "Simon", "feu grégeois", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Lann", "Eugene", "Simon", "NULL", (select id_civilisation from Civilisation where nom like "Premiers Hommes"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Lefford", "Leo",  "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Hightower", "Leyton",  "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Lhara", "Sarine", "Sofair", "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Loboda", "Zachary", "Baharov", "Marcheur Blanc", (select id_civilisation from Civilisation where nom like "Peuple libre"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Locke", "Noah", "Taylor", "Hodor", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Castelfoyer", "Lollys", "Elizabeth", "Cadwallader", "NULL", (select id_civilisation from Civilisation where nom like "Andal"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Lommy", "Eros", "Vlahos", "Polliver", (select id_civilisation from Civilisation where nom like "Andal"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Tyrell", "Loras", "Finn", "Jones", "feu grégeois", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Une", "Lord", "Michael", "Benbaruk", "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Lannister", "Loren",  "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Lorren", "Forbes", "Keir-Bucknall", "Ramsay Snow", (select id_civilisation from Civilisation where nom like "Fer-nés"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Frey", "Lothar", "Tom", "Brooke", "Arya Stark", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Lowell", "Tom", "Brooke", "Sandor Clegane", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Omble", "Lucan",  "NULL", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Velaryon", "Lucerys",  "Baie des Naufrageurs", (select id_civilisation from Civilisation where nom like "Valyriens"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Tyrell", "Luthor",  "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Luwin", "Donald", "Sumpter", "Dagmer", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Mormont", "Lyanna", "Bella", "Ramsey", "géant", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Stark", "Lyanna", "Cordelia", "Hill", "Jon", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Hightower", "Lymond",  "NULL", (select id_civilisation from Civilisation where nom like "Premiers Hommes"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Selmy", "Lyonel",  "NULL", (select id_civilisation from Civilisation where nom like "Premiers Hommes"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Arryn", "Lysa", "Kate", "Dickie", "Petyr Baelish", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Tyrell", "Mace", "Roger", "Ashton-Griffiths", "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Mormont", "Maege", "Elizabeth", "Barrett", "Guerre des Cinq Rois", (select id_civilisation from Civilisation where nom like "Nordienne"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Targaryen", "Maegor III",  "NULL", (select id_civilisation from Civilisation where nom like "Valyriens"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Targaryen", "Maegor",  "NULL", (select id_civilisation from Civilisation where nom like "Valyriens"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Targaryen", "Maekar",  "NULL", (select id_civilisation from Civilisation where nom like "Valyriens"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Feunoyr", "Maelys",  "Barristan Selmy", (select id_civilisation from Civilisation where nom like "Valyriens"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Mar Tun", "Mag", "Neil", "Fingleton", "Grenn", (select id_civilisation from Civilisation where nom like "Géants"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Maggy", "Jodhi", "May", "Randyll Tarly", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Magicien", "James McMullan", "Harold", "NULL", (select id_civilisation from Civilisation where nom like "Myriens"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Mago", "Ivailo", "Dimitrov", "Drogo", (select id_civilisation from Civilisation where nom like "Dothraki"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Malcom", "Ivailo", "Dimitrov", "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Malko", "Adewale", "Akinnuoye-Agbaje", "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Rayder", "Mance", "Ciarán", "Hinds", "Mélisandre", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Moore", "Mandon", "James", "Doran", "Podrick Payne", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Marei", "Josephine", "Gillan", "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Tyrell", "Margaery", "Natalie", "Dormer", "feu grégeois", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Frey", "Marianne", "Katie", "Creaven", "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Marillion", "Emun", "Elliott", "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Greyjoy", "Maron",  "Siège de Pyk", (select id_civilisation from Civilisation where nom like "Fer-nés"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Martell", "Maron",  "NULL", (select id_civilisation from Civilisation where nom like "Dorniens"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Martha", "Bronte", "Carmichael", "NULL", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Lannister", "Martyn", "Dean-Charles", "Chapman", "Rickard Karstark", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Mervault", "Marya",  "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Heddle", "Masha", "Susie", "Kelly", "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Mervault", "Matthos", "Kerr", "Logan", "feu grégeois", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Reed", "Meera", "Ellie", "Kendrick", "NULL", (select id_civilisation from Civilisation where nom like "Paludiers"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Cuillêtre", "Melara", "Isabella", "Steinbarth", "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Tarly", "Melessa", "Samantha", "Spiro", "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("IX Jardinier", "Mern",  "Champ de Feu", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Mero", "Mark", "Killeen", "Daario Naharis", (select id_civilisation from Civilisation where nom like "Braaviens"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Frey", "Merry", "Grace", "Hendy", "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Trant", "Meryn", "Ian", "Beattie", "Arya Stark", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Mhaegen", "Ian", "Beattie", "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Mighdal", "Ian", "Beattie", "NULL", (select id_civilisation from Civilisation where nom like "Ghiscaris"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Mikken", "Boyd", "Rankin", "NULL", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Tully", "Minisa",  "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Mirelle", "Elisa", "Lasowski", "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Maz Duur", "Mirri", "Mia", "Soteriou", "NULL", (select id_civilisation from Civilisation where nom like "Lhazaréen"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Missandei", "Nathalie", "Emmanuel", "Gregor Clegane", (select id_civilisation from Civilisation where nom like "Lhazaréen"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Morag", "Deirdre", "Monaghan", "NULL", (select id_civilisation from Civilisation where nom like "Peuple libre"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Omble", "Morag",  "NULL", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Mord", "Ciaran", "Bermingham", "NULL", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Mordane", "Susan", "Brown", "Maison Lannister", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Mordeur", "Gerard", "Jordan", "Sandor Clegane", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Moro", "Joseph", "Naufahu", "Daenerys Targaryen", (select id_civilisation from Civilisation where nom like "Dothraki"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Mossador", "Reece", "Noi", "Daario Naharis", (select id_civilisation from Civilisation where nom like "Dothraki"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Munkun", "Reece", "Noi", "NULL", (select id_civilisation from Civilisation where nom like "Dothraki"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Mycah", "Rhodri", "Hosking", "Sandor Clegane", (select id_civilisation from Civilisation where nom like "Dothraki"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Omble", "Mycah",  "sauvageons", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Myranda", "Charlotte", "Hope", "Winterfell", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Baratheon", "Myrcella", "Tiger Free", "Nell", "Empoisonnée", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Mélisandre", "van Houten", "Carice", "NULL", (select id_civilisation from Civilisation where nom like "Asshaï"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Targaryen", "Naerys",  "NULL", (select id_civilisation from Civilisation where nom like "Valyriens"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Omble", "Ned", "Harry", "Grasby", "Âtre-lès-Confins", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Frey", "Neyela",  "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Nissa", "Nissa",  "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Nora", "Laura", "Elphinstone", "Drogon", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Prince de", "Nouveau", "Toby", "Osmond", "NULL", (select id_civilisation from Civilisation where nom like "Dorniens"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Nymeria", "Toby", "Osmond", "NULL", (select id_civilisation from Civilisation where nom like "Dorniens"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Sand", "Nymeria", "Jessica", "Henwick", "Euron Greyjoy", (select id_civilisation from Civilisation where nom like "Dorniens"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Sand", "Obara", "Keisha", "Castle-Hughes", "Euron Greyjoy", (select id_civilisation from Civilisation where nom like "Dorniens"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Martell", "Oberyn", "Pedro", "Pascal", "Gregor Clegane", (select id_civilisation from Civilisation where nom like "Dorniens"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Tyrell", "Olenna", "Diana", "Rigg", "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Olly", "Brenock", "O'Connor", "Jon Snow", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Olyvar", "Will", "Tudor", "NULL", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Frey", "Olyvar",  "Arya Stark", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Orell", "Mackenzie", "Crook", "Jon Snow", (select id_civilisation from Civilisation where nom like "Peuple libre"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Ornela", "Hannah", "John-Kamen", "NULL", (select id_civilisation from Civilisation where nom like "Lhazaréen"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Lannister", "Orson",  "NULL", (select id_civilisation from Civilisation where nom like "Lhazaréen"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Baratheon", "Orys",  "NULL", (select id_civilisation from Civilisation where nom like "Valyriens"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("I", "Orys",  "NULL", (select id_civilisation from Civilisation where nom like "Valyriens"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Osha", "Natalia", "Tena", "Ramsay Bolton", (select id_civilisation from Civilisation where nom like "Peuple libre"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Yarwyck", "Othell", "Brian", "Fortune", "Jon Snow", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Othor", "Brian", "Fortune", "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("zo Pahl", "Oznak", "Daniel", "Naprous", "Daario Naharis", (select id_civilisation from Civilisation where nom like "Ghiscaris"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Palla", "Joy", "Carleton", "NULL", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("mentionnés", "Catégorie:Personnages",  "NULL", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("mineurs", "Catégorie:Personnages",  "NULL", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("par région", "Catégorie:Personnages",  "NULL", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("par saison", "Catégorie:Personnages",  "NULL", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("par statut", "Catégorie:Personnages",  "NULL", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("principaux", "Catégorie:Personnages",  "NULL", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("récurrents", "Catégorie:Personnages",  "NULL", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("garçon de", "Petit", "Felix", "Jamieson", "NULL", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Baelish", "Petyr", "Aidan", "Gillen", "Arya Stark", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Payne", "Podrick", "Daniel", "Portman", "NULL", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Polliver", "Andy", "Kellegher", "Arya Stark", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("na Ghezn", "Prendahl", "Ramon", "Tikaram", "Daario Naharis", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("du dosh", "Prophétesse", "Amira", "Ghazella", "NULL", (select id_civilisation from Civilisation where nom like "Dothraki"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Pree", "Pyat", "Ian", "Hanmore", "Daenerys Targaryen", (select id_civilisation from Civilisation where nom like "Dothraki"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Pycelle", "Julian", "Glover", "Petits oiseaux", (select id_civilisation from Civilisation where nom like "Dothraki"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Pypar", "Josef", "Altin", "Ygrid", (select id_civilisation from Civilisation where nom like "Dothraki"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Qhono", "Staz", "Nair", "Spectre", (select id_civilisation from Civilisation where nom like "Dothraki"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Qhorin", "Simon", "Armstrong", "Jon Snow", (select id_civilisation from Civilisation where nom like "Dothraki"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Qorro", "Dar Khan", "Darius", "Daenerys Targaryen", (select id_civilisation from Civilisation where nom like "Dothrakis"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Qotho", "Dar", "Salim", "Jorah Mormont", (select id_civilisation from Civilisation where nom like "Dothraki"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Quaithe", "Laura", "Pradelska", "NULL", (select id_civilisation from Civilisation where nom like "Dothraki"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Qoherys", "Quenton",  "NULL", (select id_civilisation from Civilisation where nom like "Valyriens"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Qyburn", "Anton", "Lesser", "Gregor Clegane", (select id_civilisation from Civilisation where nom like "Valyriens"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Rakharo", "Elyes", "Gabel", "NULL", (select id_civilisation from Civilisation where nom like "Dothraki"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Kenning", "Ralf", "Grahame", "Fox", "Adrack Humble", (select id_civilisation from Civilisation where nom like "Fer-nés"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Bolton", "Ramsay", "Iwan", "Rheon", "ses chiens", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Tarly", "Randyll", "James", "Faulkner", "Drogon", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Rast", "Luke", "Barnes", "Fantôme", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Blanc", "Rat",  "Fils de la Harpie", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Coq", "Rat",  "NULL", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Ray", "Ian", "McShane", "Fraternité sans Bannières", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("mo Eraz", "Razdal", "George", "Georgiou", "Ver Gris", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Karstark", "Regan",  "NULL", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Lannister", "Reginald", "Patrick", "Fitzsymons", "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Catégorie:Relations", "Patrick", "Fitzsymons", "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Baratheon", "Renly", "Gethin", "Anthony", "Stannis Baratheon", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Rennick", "David", "Fynn", "Vent Gris", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Reyne", "Reynard",  "Tywin Lannister", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Targaryen", "Rhaegar", "Wilf", "Scolding", "Robert Baratheon", (select id_civilisation from Civilisation where nom like "Valyriens"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Targaryen", "Rhaegel",  "NULL", (select id_civilisation from Civilisation where nom like "Valyriens"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Rhaego", "Ros Elliot-Sloan", "Wren", "NULL", (select id_civilisation from Civilisation where nom like "Valyriens"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Targaryen", "Rhaella",  "Daenerys", (select id_civilisation from Civilisation where nom like "Valyriens"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Targaryen", "Rhaena",  "NULL", (select id_civilisation from Civilisation where nom like "Valyriens"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Targaryen", "Rhaenyra",  "Feux-du-Soleyl", (select id_civilisation from Civilisation where nom like "Valyriens"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Rhalko", "Andrei", "Claude", "Daenerys Targaryen", (select id_civilisation from Civilisation where nom like "Dothrakis"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Karstark", "Rickard", "John", "Stahl", "Robb Stark", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Stark", "Rickard", "Wayne", "Foskett", "Aerys II", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Stark", "Rickon", "Art", "Parkinson", "Bataille des Bâtards", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Stark", "Robb", "Richard", "Madden", "Frey", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Baratheon", "Robert", "Mark", "Addy", "Lancel Lannister", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Glover", "Robett", "Tim", "McInnerny", "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Arryn", "Robin", "Lino", "Facioli", "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Cassel", "Rodrik", "Ron", "Donachie", "Theon Greyjoy", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Greyjoy", "Rodrik",  "Jason Mallister", (select id_civilisation from Civilisation where nom like "Fer-nés"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Stark", "Rodrik",  "NULL", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Reyne", "Roger",  "Tywin Lannister", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("de la", "Roi", "Richard", "Brake", "Grande Bataille de Winterfell", (select id_civilisation from Civilisation where nom like "Marcheurs Blancs"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("de la", "Roi", "Slavko", "Juraga", "Pyat Pree", (select id_civilisation from Civilisation where nom like "Marcheurs Blancs"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("des Épices", "Roi", "Nicholas", "Blane", "Pyat Pree", (select id_civilisation from Civilisation where nom like "Qarthiens"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("du Cuivre", "Roi",  "Pyat Pree", (select id_civilisation from Civilisation where nom like "Qarthiens"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Gris", "Roi",  "NULL", (select id_civilisation from Civilisation where nom like "Fer-nés"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Bolton", "Roose", "Michael", "McElhatton", "Ramsay", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Rorge", "Andy", "Beckwith", "Arya Stark", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Ros", "Esmé", "Bianco", "Joffrey Baratheon", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Tully", "Roslin", "Alexandra", "Dowling", "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Rossart", "Alexandra", "Dowling", "Jaime Lannister", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("IV Bolton", "Royce",  "NULL", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Rivers", "Ryger", "Bryan", "McCaugherty", "Arya Stark", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Florent", "Rylene",  "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Sally", "Trixiebelle", "Harrowell", "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Sam", "et Finn", "Logan", "NULL", (select id_civilisation from Civilisation where nom like "Peuple libre"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Tarly", "Samwell", "John", "Bradley-West", "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Clegane", "Sandor", "Rory", "McCann", "Gregor Clegane", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Stark", "Sansa", "Sophie", "Turner", "NULL", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Sarra", "Danielle", "Galligan", "NULL", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Frey", "Sarra",  "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("des Os", "Seigneur", "Edward", "Dogliani", "Tormund", (select id_civilisation from Civilisation where nom like "Peuple libre"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("du Nord", "Seigneur", "Niall", "Bishop", "NULL", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("du Val", "Seigneur", "Frank", "Jakeman", "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Torth", "Selwyn",  "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Baratheon", "Selyse", "Tara", "Fitzgerald", "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Feunoyr", "Serena",  "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Frey", "Serra",  "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Shae", "Sibel", "Kekilli", "Tyrion Lannister", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Shagga", "Lewis Jones", "Mark", "NULL", (select id_civilisation from Civilisation where nom like "Tribus des Collines"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Baratheon", "Shireen", "Kerry", "Ingram", "Mélisandre", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Frey", "Shirei",  "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Sissy", "Jane", "McGrath", "NULL", (select id_civilisation from Civilisation where nom like "Peuple libre"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Saan", "Sladhor", "Lucian", "Msamati", "NULL", (select id_civilisation from Civilisation where nom like "Peuple libre"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Spadassin", "Lucian", "Msamati", "Été", (select id_civilisation from Civilisation where nom like "Peuple libre"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Lannister", "Stafford",  "Bataille de Croixbœuf", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Baratheon", "Stannis", "Stephen", "Dillane", "Brienne de Torth", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Frey", "Stevron", "Colin", "Carnegie", "Arya Stark", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Stiv", "Stephen", "Don", "Theon Greyjoy", (select id_civilisation from Civilisation where nom like "Peuple libre"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Styr", "Yuri", "Kolokolnikov", "Jon Snow", (select id_civilisation from Civilisation where nom like "Peuple libre"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Glover", "Sybelle",  "NULL", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Hollard", "Symon",  "Barristan Selmy", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Forel", "Syrio", "Miltos", "Yerolemou", "Meryn Trant", (select id_civilisation from Civilisation where nom like "Braaviens"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Talbot", "Miltos", "Yerolemou", "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Stark", "Talisa", "Oona", "Chaplin", "Lothar Frey", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Tarly", "Talla", "Rebecca", "Benson", "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Castelfoyer", "Tanda",  "NULL", (select id_civilisation from Civilisation where nom like "Andal"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Tansy", "De Lisser", "Jazzy", "Filles du Bâtard", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Teela", "Bea", "Glancy", "NULL", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Terys", "Ternesio", "Gary", "Oliver", "NULL", (select id_civilisation from Civilisation where nom like "Braaviens"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Greyjoy", "Theon", "Alfie", "Allen", "Roi de la Nuit", (select id_civilisation from Civilisation where nom like "Fer-nés"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Thoros", "Paul", "Kaye", "au-delà du Mur", (select id_civilisation from Civilisation where nom like "Myriens"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Timett", "Tobias", "Winter", "NULL", (select id_civilisation from Civilisation where nom like "Tribus des Collines"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Lannister", "Tion",  "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Tarbeck", "Tion",  "Siège de Château Tarbeck", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Titilleur", "Anthony", "Morris", "Jaqen H'ghar", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Mott", "Tobho", "Andrew", "Wilde", "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Tomard", "Phil", "Dixon", "NULL", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Baratheon", "Tommen", "Dean-Charles", "Chapman", "Donjon Rouge", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Tommy", "Tommy", "Dunne", "NULL", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Tormund", "Kristofer", "Hivju", "NULL", (select id_civilisation from Civilisation where nom like "Peuple libre"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Stark", "Torrhen",  "NULL", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Tourte-Chaude", "Ben", "Hawkey", "NULL", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("d'Alluve", "Tristan",  "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Martell", "Trystan", "Toby", "Sebastian", "Obara Sand", (select id_civilisation from Civilisation where nom like "Dorniens"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Nestoris", "Tycho", "Mark", "Gatiss", "NULL", (select id_civilisation from Civilisation where nom like "Braaviens"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Sand", "Tyerne", "Laurenti Sellers", "Rosabell", "Cersei Lannister", (select id_civilisation from Civilisation where nom like "Dorniens"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Lannister", "Tyrion", "Peter", "Dinklage", "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Tysha", "Peter", "Dinklage", "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Lannister", "Tytos",  "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Lannister", "Tywald",  "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Lannister", "Tywin", "Charles", "Dance", "Tyrion", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Unella", "Hannah", "Waddingham", "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Vala", "Meena", "Rayann", "NULL", (select id_civilisation from Civilisation where nom like "Meereenienne"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Corbray", "Vance", "Richard", "Doubleday", "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Egen", "Vardis", "Brendan", "McCormack", "Bronn", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Varly", "Graham", "Charles", "Lannister", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Varys", "Conleth", "Hill", "Drogon", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Poole", "Vayon", "Matthew", "Scurfield", "Port-Réal", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Gris", "Ver", "Jacob", "Anderson", "NULL", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Greyjoy", "Vickon",  "NULL", (select id_civilisation from Civilisation where nom like "Fer-nés"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Nan", "Vieille", "Margaret", "John", "NULL", (select id_civilisation from Civilisation where nom like "Fer-nés"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Redwyne", "Viola",  "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Violet", "Stephanie", "Blacker", "Ramsay Bolton", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Targaryen", "Visenya",  "NULL", (select id_civilisation from Civilisation where nom like "Valyriens"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Targaryen", "Viserys I",  "NULL", (select id_civilisation from Civilisation where nom like "Valyriens"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Targaryen", "Viserys II",  "Aegon IV", (select id_civilisation from Civilisation where nom like "Valyriens"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Targaryen", "Viserys", "Harry", "Lloyd", "Drogo", (select id_civilisation from Civilisation where nom like "Valyriens"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Vère", "Hannah", "Murray", "NULL", (select id_civilisation from Civilisation where nom like "Peuple libre"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Bolton", "Walda", "Elizabeth", "Webster", "Filles du Bâtard", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Frey", "Walda",  "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Frey", "Walder", "David", "Bradley", "Égorgé", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Rivers", "Walder", "Tim", "Plester", "Arya Stark", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Tarbeck", "Walderan",  "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Frey", "Waldra",  "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Frey", "Waldron",  "Arya Stark", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Wallen", "Barry", "O'Connor", "Robb Stark", (select id_civilisation from Civilisation where nom like "Peuple libre"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Royce", "Waymar", "Rob", "Ostlere", "Marcheur Blanc", (select id_civilisation from Civilisation where nom like "Peuple libre"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Manderly", "Wendel",  "Noces Pourpres", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Weyland", "Rob", "Ostlere", "NULL", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Will", "Bronson", "Webb", "Eddard Stark", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Willa", "Karla", "Lyons", "NULL", (select id_civilisation from Civilisation where nom like "Peuple libre"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Darry", "Willem",  "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Frey", "Willem",  "Arya Stark", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Lannister", "Willem", "Timothy", "Gibbons", "Rickard Karstark", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Guède", "Willis", "Ryan", "McKenna", "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Wolkan", "Richard", "Rycroft", "NULL", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Weg Wun", "Wun", "Ian", "Whyte", "Bolton", (select id_civilisation from Civilisation where nom like "Géants"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Wyl", "Ian", "Whyte", "NULL", (select id_civilisation from Civilisation where nom like "Nordiens"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Wylla", "Ian", "Whyte", "NULL", (select id_civilisation from Civilisation where nom like "Dornienne"));
INSERT INTO Personnage (nom, prenom,mort, civilisation) values ("Bracken", "Wyllis",  "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Manderly", "Wyman", "Sean", "Blowers", "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Xhoan Daxos", "Xaro", "Nonso", "Anozie", "Doreah", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Greyjoy", "Yara", "Gemma", "Whelan", "NULL", (select id_civilisation from Civilisation where nom like "Fer-nés"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("zo Qaggaz", "Yezzan", "Enzo", "Cilenti", "NULL", (select id_civilisation from Civilisation where nom like "Fer-nés"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Ygrid", "Rose", "Leslie", "Olly", (select id_civilisation from Civilisation where nom like "Peuple libre"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Royce", "Yohn", "Rupert", "Vansittart", "NULL", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Yoren", "Francis", "Magee", "Amory Lorch", (select id_civilisation from Civilisation where nom like "Andals"));
INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values ("Zanrush", "Gerald", "Lepkowski", "NULL", (select id_civilisation from Civilisation where nom like "Ghiscaris"));
INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values ("Veneur", "Éon", "Barrington", "Cullen", "NULL", (select id_civilisation from Civilisation where nom like "Andals"));

INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Marpheux" and prenom like  "Addam"), (select id_maison from Maison where nom like "Lannister"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Marpheux" and prenom like  "Addam"), (select id_maison from Maison where nom like "Marpheux"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Humble" and prenom like  "Adrack"), (select id_maison from Maison where nom like "Greyjoy"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Feunoyr" and prenom like  "Aegon"), (select id_maison from Maison where nom like "Feunoyr"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Targaryen" and prenom like  "Aegon I"), (select id_maison from Maison where nom like "Targaryen"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "IV Targaryen" and prenom like  "Aegon"), (select id_maison from Maison where nom like "Targaryen"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Targaryen" and prenom like  "Aegon"), (select id_maison from Maison where nom like "Targaryen"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "V Targaryen" and prenom like  "Aegon"), (select id_maison from Maison where nom like "Targaryen"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Rivers" and prenom like  "Aegor"), (select id_maison from Maison where nom like "Targaryen"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Rivers" and prenom like  "Aegor"), (select id_maison from Maison where nom like "Feunoyr"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Arryn" and prenom like  "Aemma"), (select id_maison from Maison where nom like "Arryn"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Arryn" and prenom like  "Aemma"), (select id_maison from Maison where nom like "Targaryen"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Aemon"), (select id_maison from Maison where nom like "Targaryen"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Feunoyr" and prenom like  "Aemon"), (select id_maison from Maison where nom like "Feunoyr"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Targaryen" and prenom like  "Aemond"), (select id_maison from Maison where nom like "Targaryen"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Targaryen" and prenom like  "Aenar"), (select id_maison from Maison where nom like "Targaryen"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Targaryen" and prenom like  "Aerion"), (select id_maison from Maison where nom like "Targaryen"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Greyjoy" and prenom like  "Aeron"), (select id_maison from Maison where nom like "Greyjoy"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Targaryen" and prenom like  "Aerys I"), (select id_maison from Maison where nom like "Targaryen"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Targaryen" and prenom like  "Aerys II"), (select id_maison from Maison where nom like "Targaryen"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Aggo"), (select id_maison from Maison where nom like "Targaryen"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Greyjoy" and prenom like  "Alannys"), (select id_maison from Maison where nom like "Harloi"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Greyjoy" and prenom like  "Alannys"), (select id_maison from Maison where nom like "Greyjoy"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Thorne" and prenom like  "Alliser"), (select id_maison from Maison where nom like "Thorne"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Lannister" and prenom like  "Alton"), (select id_maison from Maison where nom like "Lannister"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Herpivoie" and prenom like  "Alys"), (select id_maison from Maison where nom like "Herpivoie"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Herpivoie" and prenom like  "Alys"), (select id_maison from Maison where nom like "Targaryen"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Karstark" and prenom like  "Alys"), (select id_maison from Maison where nom like "Karstark"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Karstark" and prenom like  "Alys"), (select id_maison from Maison where nom like "Stark"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Omble" and prenom like  "Amarylis"), (select id_maison from Maison where nom like "Omble"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Omble" and prenom like  "Amarylis"), (select id_maison from Maison where nom like "Manderly"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Lorch" and prenom like  "Amory"), (select id_maison from Maison where nom like "Lannister"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Lorch" and prenom like  "Amory"), (select id_maison from Maison where nom like "Lorch"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Anara"), (select id_maison from Maison where nom like "Lannister"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Anara"), (select id_maison from Maison where nom like "Lorch"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Vanbois" and prenom like  "Anya"), (select id_maison from Maison where nom like "Arryn"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Vanbois" and prenom like  "Anya"), (select id_maison from Maison where nom like "Vanbois"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Hotah" and prenom like  "Areo"), (select id_maison from Maison where nom like "Martell"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Baratheon" and prenom like  "Argella"), (select id_maison from Maison where nom like "Durrandon"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Baratheon" and prenom like  "Argella"), (select id_maison from Maison where nom like "Baratheon"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Durrandon" and prenom like  "Argilac"), (select id_maison from Maison where nom like "Durrandon"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Dayne" and prenom like  "Arthur"), (select id_maison from Maison where nom like "Dayne"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Frey" and prenom like  "Arwaya"), (select id_maison from Maison where nom like "Frey"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Stark" and prenom like  "Arya"), (select id_maison from Maison where nom like "Stark"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Ash"), (select id_maison from Maison where nom like "Targaryen"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Dayne" and prenom like  "Ashara"), (select id_maison from Maison where nom like "Dayne"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Florent" and prenom like  "Axell"), (select id_maison from Maison where nom like "Florent"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Florent" and prenom like  "Axell"), (select id_maison from Maison where nom like "Baratheon de Peyredragon"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Florent" and prenom like  "Axell"), (select id_maison from Maison where nom like "Tyrell"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Aya"), (select id_maison from Maison where nom like "Florent"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Aya"), (select id_maison from Maison where nom like "Baratheon de Peyredragon"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Aya"), (select id_maison from Maison where nom like "Tyrell"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Ahai" and prenom like  "Azor"), (select id_maison from Maison where nom like "Florent"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Ahai" and prenom like  "Azor"), (select id_maison from Maison where nom like "Baratheon de Peyredragon"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Ahai" and prenom like  "Azor"), (select id_maison from Maison where nom like "Tyrell"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Targaryen" and prenom like  "Baelor"), (select id_maison from Maison where nom like "Targaryen"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Greyjoy" and prenom like  "Balon"), (select id_maison from Maison where nom like "Greyjoy"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Barra"), (select id_maison from Maison where nom like "Greyjoy"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Selmy" and prenom like  "Barristan"), (select id_maison from Maison where nom like "Targaryen"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Selmy" and prenom like  "Barristan"), (select id_maison from Maison where nom like "Selmy"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Paenymion" and prenom like  "Belicho"), (select id_maison from Maison where nom like "Targaryen"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Paenymion" and prenom like  "Belicho"), (select id_maison from Maison where nom like "Selmy"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Stark" and prenom like  "Benjen"), (select id_maison from Maison where nom like "Stark"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Dayne" and prenom like  "Beric"), (select id_maison from Maison where nom like "Dayne"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Bernadette"), (select id_maison from Maison where nom like "Lannister"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Bessie"), (select id_maison from Maison where nom like "Lannister"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Stark" and prenom like  "Bran"), (select id_maison from Maison where nom like "Stark"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Brea"), (select id_maison from Maison where nom like "Stark"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Brian"), (select id_maison from Maison where nom like "Lannister"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "de Torth" and prenom like  "Brienne"), (select id_maison from Maison where nom like "Stark"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "de Torth" and prenom like  "Brienne"), (select id_maison from Maison where nom like "Torth"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Tully" and prenom like  "Brynden"), (select id_maison from Maison where nom like "Tully"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Swann" and prenom like  "Byron"), (select id_maison from Maison where nom like "Swann"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "mort-nés Baratheon" and prenom like  "Bébés"), (select id_maison from Maison where nom like "Swann"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Dondarrion" and prenom like  "Béric"), (select id_maison from Maison where nom like "Dondarrion"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Caleotte"), (select id_maison from Maison where nom like "Martell"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Camello"), (select id_maison from Maison where nom like "Martell"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Baratheon" and prenom like  "Cassana"), (select id_maison from Maison where nom like "Baratheon"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Baratheon" and prenom like  "Cassana"), (select id_maison from Maison where nom like "Estremont"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Stark" and prenom like  "Catelyn"), (select id_maison from Maison where nom like "Stark"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Stark" and prenom like  "Catelyn"), (select id_maison from Maison where nom like "Tully"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Lannister" and prenom like  "Cersei"), (select id_maison from Maison where nom like "Lannister"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Lannister" and prenom like  "Cersei"), (select id_maison from Maison where nom like "Baratheon"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Cerwyn" and prenom like  "Cley"), (select id_maison from Maison where nom like "Cerwyn"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Cerwyn" and prenom like  "Cley"), (select id_maison from Maison where nom like "Stark"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Omble" and prenom like  "Corin"), (select id_maison from Maison where nom like "Omble"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "à trois" and prenom like  "Corneille"), (select id_maison from Maison where nom like "Omble"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Craster"), (select id_maison from Maison where nom like "Omble"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Stark" and prenom like  "Cregan"), (select id_maison from Maison where nom like "Stark"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Cressen"), (select id_maison from Maison where nom like "Baratheon de Peyredragon"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Lannister" and prenom like  "Cynda"), (select id_maison from Maison where nom like "Lannister"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Naharis" and prenom like  "Daario"), (select id_maison from Maison where nom like "Targaryen"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Feunoyr" and prenom like  "Daemon"), (select id_maison from Maison where nom like "Feunoyr"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Feunoyr" and prenom like  "Daemon"), (select id_maison from Maison where nom like "Targaryen"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Feunoyr" and prenom like  "Daemon II"), (select id_maison from Maison where nom like "Feunoyr"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Targaryen" and prenom like  "Daemon"), (select id_maison from Maison where nom like "Targaryen"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Targaryen" and prenom like  "Daena"), (select id_maison from Maison where nom like "Targaryen"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Targaryen" and prenom like  "Daenerys"), (select id_maison from Maison where nom like "Targaryen"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Targaryen" and prenom like  "Daenys"), (select id_maison from Maison where nom like "Targaryen"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Targaryen" and prenom like  "Daeron I"), (select id_maison from Maison where nom like "Targaryen"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Targaryen" and prenom like  "Daeron II"), (select id_maison from Maison where nom like "Targaryen"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Dagmer"), (select id_maison from Maison where nom like "Greyjoy"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Daisy"), (select id_maison from Maison where nom like "Greyjoy"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Marpheux" and prenom like  "Damon"), (select id_maison from Maison where nom like "Lannister"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Marpheux" and prenom like  "Damon"), (select id_maison from Maison where nom like "Marpheux"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Lothston" and prenom like  "Danelle"), (select id_maison from Maison where nom like "Lothston"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Lothston" and prenom like  "Danelle"), (select id_maison from Maison where nom like "Tully"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Omble" and prenom like  "Daragh"), (select id_maison from Maison where nom like "Omble"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Mervault" and prenom like  "Davos"), (select id_maison from Maison where nom like "Mervault"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Mervault" and prenom like  "Davos"), (select id_maison from Maison where nom like "Stark"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Mervault" and prenom like  "Davos"), (select id_maison from Maison where nom like "Baratheon de Peyredragon"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Mallister" and prenom like  "Denys"), (select id_maison from Maison where nom like "Mallister"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Frey" and prenom like  "Derwa"), (select id_maison from Maison where nom like "Frey"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Crakehall" and prenom like  "Desmond"), (select id_maison from Maison where nom like "Crakehall"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Tarly" and prenom like  "Dickon"), (select id_maison from Maison where nom like "Tarly"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Bolton" and prenom like  "Domeric"), (select id_maison from Maison where nom like "Bolton"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Vanbois" and prenom like  "Donnel"), (select id_maison from Maison where nom like "Arryn"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Vanbois" and prenom like  "Donnel"), (select id_maison from Maison where nom like "Vanbois"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Hollard" and prenom like  "Dontos"), (select id_maison from Maison where nom like "Hollard"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Hollard" and prenom like  "Dontos"), (select id_maison from Maison where nom like "Baratheon"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Martell" and prenom like  "Doran"), (select id_maison from Maison where nom like "Martell"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Doreah"), (select id_maison from Maison where nom like "Targaryen"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Stark" and prenom like  "Dorren"), (select id_maison from Maison where nom like "Stark"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Drennan"), (select id_maison from Maison where nom like "Greyjoy"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "le Grand" and prenom like  "Duncan"), (select id_maison from Maison where nom like "Targaryen"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Targaryen" and prenom like  "Duncan"), (select id_maison from Maison where nom like "Targaryen"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Durran"), (select id_maison from Maison where nom like "Durrandon"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Dayne" and prenom like  "Dyanna"), (select id_maison from Maison where nom like "Targaryen"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Dayne" and prenom like  "Dyanna"), (select id_maison from Maison where nom like "Dayne"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Stark" and prenom like  "Eddard"), (select id_maison from Maison where nom like "Stark"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Eddie"), (select id_maison from Maison where nom like "Lannister"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Tallett" and prenom like  "Eddison"), (select id_maison from Maison where nom like "Tallett"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Ferboys" and prenom like  "Edgar"), (select id_maison from Maison where nom like "Ferboys"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Tully" and prenom like  "Edmure"), (select id_maison from Maison where nom like "Tully"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Tully" and prenom like  "Edmure"), (select id_maison from Maison where nom like "Stark"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Tully" and prenom like  "Edmure"), (select id_maison from Maison where nom like "Lannister"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Targaryen" and prenom like  "Elaena"), (select id_maison from Maison where nom like "Targaryen"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Elenei"), (select id_maison from Maison where nom like "Durrandon"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Martell" and prenom like  "Elia"), (select id_maison from Maison where nom like "Martell"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Martell" and prenom like  "Elia"), (select id_maison from Maison where nom like "Targaryen"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Sand" and prenom like  "Elia"), (select id_maison from Maison where nom like "Martell"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Sand" and prenom like  "Ellaria"), (select id_maison from Maison where nom like "Martell"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Sand" and prenom like  "Ellaria"), (select id_maison from Maison where nom like "Uller"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Sand" and prenom like  "Ellaria"), (select id_maison from Maison where nom like "Targaryen"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Reyne" and prenom like  "Ellyn"), (select id_maison from Maison where nom like "Reyne"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Reyne" and prenom like  "Ellyn"), (select id_maison from Maison where nom like "Tarbeck"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Reyne" and prenom like  "Ellyn"), (select id_maison from Maison where nom like "Lannister"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Glover" and prenom like  "Erena"), (select id_maison from Maison where nom like "Glover"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Glover" and prenom like  "Erena"), (select id_maison from Maison where nom like "Stark"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "et Affranchis" and prenom like  "Catégorie:Esclaves"), (select id_maison from Maison where nom like "Glover"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "et Affranchis" and prenom like  "Catégorie:Esclaves"), (select id_maison from Maison where nom like "Stark"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Glover" and prenom like  "Ethan"), (select id_maison from Maison where nom like "Glover"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Glover" and prenom like  "Ethan"), (select id_maison from Maison where nom like "Stark"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Greyjoy" and prenom like  "Euron"), (select id_maison from Maison where nom like "Greyjoy"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Castelfoyer" and prenom like  "Falyse"), (select id_maison from Maison where nom like "Castelfoyer"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Farlen"), (select id_maison from Maison where nom like "Stark"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Frey" and prenom like  "Freya"), (select id_maison from Maison where nom like "Frey"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Omble" and prenom like  "Gareth"), (select id_maison from Maison where nom like "Omble"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Jardinier" and prenom like  "Garth"), (select id_maison from Maison where nom like "Jardinier"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Glover" and prenom like  "Gawen"), (select id_maison from Maison where nom like "Glover"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Glover" and prenom like  "Gawen"), (select id_maison from Maison where nom like "Stark"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Baratheon" and prenom like  "Gendry"), (select id_maison from Maison where nom like "Baratheon"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Hightower" and prenom like  "Gerold"), (select id_maison from Maison where nom like "Hightower"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Ghita"), (select id_maison from Maison where nom like "Hightower"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Clegane" and prenom like  "Gregor"), (select id_maison from Maison where nom like "Lannister"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Clegane" and prenom like  "Gregor"), (select id_maison from Maison where nom like "Clegane"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Gaunt" and prenom like  "Gwayne"), (select id_maison from Maison where nom like "Gaunt"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Gaunt" and prenom like  "Gwayne"), (select id_maison from Maison where nom like "Targaryen"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Hallyne"), (select id_maison from Maison where nom like "Lannister"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Hallyne"), (select id_maison from Maison where nom like "Targaryen"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Karstark" and prenom like  "Harald"), (select id_maison from Maison where nom like "Karstark"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Karstark" and prenom like  "Harald"), (select id_maison from Maison where nom like "Bolton"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Karstark" and prenom like  "Harald"), (select id_maison from Maison where nom like "Stark"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Omble" and prenom like  "Harkon"), (select id_maison from Maison where nom like "Omble"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Harrag"), (select id_maison from Maison where nom like "Greyjoy"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Chenu" and prenom like  "Harren"), (select id_maison from Maison where nom like "Chenu"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Strickland" and prenom like  "Harry"), (select id_maison from Maison where nom like "Lannister"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Swyft" and prenom like  "Harys"), (select id_maison from Maison where nom like "Lannister"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Hazzéa"), (select id_maison from Maison where nom like "Lannister"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Helliweg"), (select id_maison from Maison where nom like "Royce"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Henk"), (select id_maison from Maison where nom like "Stark"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Heward"), (select id_maison from Maison where nom like "Stark"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "zo Loraq" and prenom like  "Hizdahr"), (select id_maison from Maison where nom like "Loraq"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "zo Loraq" and prenom like  "Hizdahr"), (select id_maison from Maison where nom like "Targaryen"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Hodor"), (select id_maison from Maison where nom like "Stark"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Tully" and prenom like  "Hoster"), (select id_maison from Maison where nom like "Tully"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Omble" and prenom like  "Hothor"), (select id_maison from Maison where nom like "Omble"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Reed" and prenom like  "Howland"), (select id_maison from Maison where nom like "Reed"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Reed" and prenom like  "Howland"), (select id_maison from Maison where nom like "Stark"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Hugh"), (select id_maison from Maison where nom like "Arryn"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "de la" and prenom like  "Hugor"), (select id_maison from Maison where nom like "Arryn"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "légendaires" and prenom like  "Catégorie:Héros"), (select id_maison from Maison where nom like "Arryn"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Iggo"), (select id_maison from Maison where nom like "Arryn"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Mopatis" and prenom like  "Illyrio"), (select id_maison from Maison where nom like "Arryn"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Payne" and prenom like  "Ilyn"), (select id_maison from Maison where nom like "Lannister"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Payne" and prenom like  "Ilyn"), (select id_maison from Maison where nom like "Baratheon"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Payne" and prenom like  "Ilyn"), (select id_maison from Maison where nom like "Payne"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Royal" and prenom like  "Intendant"), (select id_maison from Maison where nom like "Baratheon"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Irri"), (select id_maison from Maison where nom like "Targaryen"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Targaryen" and prenom like  "Jaehaerys I"), (select id_maison from Maison where nom like "Targaryen"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Lannister" and prenom like  "Jaime"), (select id_maison from Maison where nom like "Lannister"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Frey" and prenom like  "Janeya"), (select id_maison from Maison where nom like "Frey"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Slynt" and prenom like  "Janos"), (select id_maison from Maison where nom like "Baratheon"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Slynt" and prenom like  "Janos"), (select id_maison from Maison where nom like "Slynt"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Mormont" and prenom like  "Jeor"), (select id_maison from Maison where nom like "Mormont"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Mallister" and prenom like  "Jeremy"), (select id_maison from Maison where nom like "Mallister"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Mallister" and prenom like  "Jeremy"), (select id_maison from Maison where nom like "Tully"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Marpheux" and prenom like  "Jeyne"), (select id_maison from Maison where nom like "Marpheux"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Marpheux" and prenom like  "Jeyne"), (select id_maison from Maison where nom like "Lannister"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Poole" and prenom like  "Jeyne"), (select id_maison from Maison where nom like "Stark"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Poole" and prenom like  "Jeyne"), (select id_maison from Maison where nom like "Poole"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Jhiqui"), (select id_maison from Maison where nom like "Targaryen"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Lannister" and prenom like  "Joanna"), (select id_maison from Maison where nom like "Lannister"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Baratheon" and prenom like  "Joffrey"), (select id_maison from Maison where nom like "Baratheon"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Baratheon" and prenom like  "Joffrey"), (select id_maison from Maison where nom like "Lannister"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Reed" and prenom like  "Jojen"), (select id_maison from Maison where nom like "Reed"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Reed" and prenom like  "Jojen"), (select id_maison from Maison where nom like "Stark"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Arryn" and prenom like  "Jon"), (select id_maison from Maison where nom like "Arryn"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Lynderly" and prenom like  "Jon"), (select id_maison from Maison where nom like "Arryn"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Lynderly" and prenom like  "Jon"), (select id_maison from Maison where nom like "Lynderly"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Snow" and prenom like  "Jon"), (select id_maison from Maison where nom like "Stark"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Snow" and prenom like  "Jon"), (select id_maison from Maison where nom like "Targaryen"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Stark" and prenom like  "Jon"), (select id_maison from Maison where nom like "Stark"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Bracken" and prenom like  "Jonos"), (select id_maison from Maison where nom like "Bracken"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Bracken" and prenom like  "Jonos"), (select id_maison from Maison where nom like "Tully"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Darry" and prenom like  "Jonothor"), (select id_maison from Maison where nom like "Darry"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Mormont" and prenom like  "Jorah"), (select id_maison from Maison where nom like "Targaryen"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Mormont" and prenom like  "Jorah"), (select id_maison from Maison where nom like "Mormont"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Mormont" and prenom like  "Jorah"), (select id_maison from Maison where nom like "Baratheon"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Cassel" and prenom like  "Jory"), (select id_maison from Maison where nom like "Cassel"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Cassel" and prenom like  "Jory"), (select id_maison from Maison where nom like "Stark"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Omble" and prenom like  "Joseth"), (select id_maison from Maison where nom like "Omble"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Joss"), (select id_maison from Maison where nom like "Tully"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Frey" and prenom like  "Joyeuse"), (select id_maison from Maison where nom like "Frey"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Frey" and prenom like  "Joyeuse"), (select id_maison from Maison where nom like "Erongué"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Stark" and prenom like  "Karlon"), (select id_maison from Maison where nom like "Stark"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Stark" and prenom like  "Karlon"), (select id_maison from Maison where nom like "Stark de Fort-Karl"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Kesh"), (select id_maison from Maison where nom like "Targaryen"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Lannister" and prenom like  "Kevan"), (select id_maison from Maison where nom like "Lannister"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Frey" and prenom like  "Kitty"), (select id_maison from Maison where nom like "Frey"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Koner"), (select id_maison from Maison where nom like "Stark"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Kovarro"), (select id_maison from Maison where nom like "Targaryen"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "mo Nakloz" and prenom like  "Kraznys"), (select id_maison from Maison where nom like "Targaryen"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Kurleket"), (select id_maison from Maison where nom like "Bracken"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Kyra"), (select id_maison from Maison where nom like "Bolton"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Cigogne" and prenom like  "Lady"), (select id_maison from Maison where nom like "Bolton"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Lannister" and prenom like  "Lancel"), (select id_maison from Maison where nom like "Lannister"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Lann"), (select id_maison from Maison where nom like "Lannister"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Lefford" and prenom like  "Leo"), (select id_maison from Maison where nom like "Lefford"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Lefford" and prenom like  "Leo"), (select id_maison from Maison where nom like "Lannister"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Hightower" and prenom like  "Leyton"), (select id_maison from Maison where nom like "Hightower"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Hightower" and prenom like  "Leyton"), (select id_maison from Maison where nom like "Tyrell"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Lhara"), (select id_maison from Maison where nom like "Hightower"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Lhara"), (select id_maison from Maison where nom like "Tyrell"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Locke"), (select id_maison from Maison where nom like "Bolton"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Castelfoyer" and prenom like  "Lollys"), (select id_maison from Maison where nom like "Castelfoyer"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Lommy"), (select id_maison from Maison where nom like "Castelfoyer"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Tyrell" and prenom like  "Loras"), (select id_maison from Maison where nom like "Tyrell"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Une" and prenom like  "Lord"), (select id_maison from Maison where nom like "Baratheon"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Lannister" and prenom like  "Loren"), (select id_maison from Maison where nom like "Lannister"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Lorren"), (select id_maison from Maison where nom like "Greyjoy"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Frey" and prenom like  "Lothar"), (select id_maison from Maison where nom like "Frey"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Lowell"), (select id_maison from Maison where nom like "Lannister"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Omble" and prenom like  "Lucan"), (select id_maison from Maison where nom like "Omble"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Velaryon" and prenom like  "Lucerys"), (select id_maison from Maison where nom like "Targaryen"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Velaryon" and prenom like  "Lucerys"), (select id_maison from Maison where nom like "Velaryon"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Tyrell" and prenom like  "Luthor"), (select id_maison from Maison where nom like "Tyrell"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Luwin"), (select id_maison from Maison where nom like "Stark"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Mormont" and prenom like  "Lyanna"), (select id_maison from Maison where nom like "Stark"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Mormont" and prenom like  "Lyanna"), (select id_maison from Maison where nom like "Mormont"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Stark" and prenom like  "Lyanna"), (select id_maison from Maison where nom like "Stark"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Hightower" and prenom like  "Lymond"), (select id_maison from Maison where nom like "Hightower"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Hightower" and prenom like  "Lymond"), (select id_maison from Maison where nom like "Jardinier"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Selmy" and prenom like  "Lyonel"), (select id_maison from Maison where nom like "Selmy"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Arryn" and prenom like  "Lysa"), (select id_maison from Maison where nom like "Baelish"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Arryn" and prenom like  "Lysa"), (select id_maison from Maison where nom like "Arryn"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Arryn" and prenom like  "Lysa"), (select id_maison from Maison where nom like "Tully"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Tyrell" and prenom like  "Mace"), (select id_maison from Maison where nom like "Tyrell"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Mormont" and prenom like  "Maege"), (select id_maison from Maison where nom like "Mormont"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Mormont" and prenom like  "Maege"), (select id_maison from Maison where nom like "Stark"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Targaryen" and prenom like  "Maegor III"), (select id_maison from Maison where nom like "Targaryen"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Targaryen" and prenom like  "Maegor"), (select id_maison from Maison where nom like "Targaryen"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Targaryen" and prenom like  "Maekar"), (select id_maison from Maison where nom like "Targaryen"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Feunoyr" and prenom like  "Maelys"), (select id_maison from Maison where nom like "Feunoyr"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Malcom"), (select id_maison from Maison where nom like "Frey"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Malko"), (select id_maison from Maison where nom like "Frey"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Moore" and prenom like  "Mandon"), (select id_maison from Maison where nom like "Moore"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Tyrell" and prenom like  "Margaery"), (select id_maison from Maison where nom like "Tyrell"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Tyrell" and prenom like  "Margaery"), (select id_maison from Maison where nom like "Baratheon"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Tyrell" and prenom like  "Margaery"), (select id_maison from Maison where nom like "Baratheon"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Frey" and prenom like  "Marianne"), (select id_maison from Maison where nom like "Frey"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Marillion"), (select id_maison from Maison where nom like "Frey"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Greyjoy" and prenom like  "Maron"), (select id_maison from Maison where nom like "Greyjoy"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Martell" and prenom like  "Maron"), (select id_maison from Maison where nom like "Martell"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Lannister" and prenom like  "Martyn"), (select id_maison from Maison where nom like "Lannister"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Mervault" and prenom like  "Marya"), (select id_maison from Maison where nom like "Mervault"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Heddle" and prenom like  "Masha"), (select id_maison from Maison where nom like "Mervault"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Mervault" and prenom like  "Matthos"), (select id_maison from Maison where nom like "Baratheon de Peyredragon"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Mervault" and prenom like  "Matthos"), (select id_maison from Maison where nom like "Mervault"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Reed" and prenom like  "Meera"), (select id_maison from Maison where nom like "Reed"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Reed" and prenom like  "Meera"), (select id_maison from Maison where nom like "Stark"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Cuillêtre" and prenom like  "Melara"), (select id_maison from Maison where nom like "Cuillêtre"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Cuillêtre" and prenom like  "Melara"), (select id_maison from Maison where nom like "Lannister"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Tarly" and prenom like  "Melessa"), (select id_maison from Maison where nom like "Tarly"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Tarly" and prenom like  "Melessa"), (select id_maison from Maison where nom like "Florent"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "IX Jardinier" and prenom like  "Mern"), (select id_maison from Maison where nom like "Jardinier"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Frey" and prenom like  "Merry"), (select id_maison from Maison where nom like "Frey"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Trant" and prenom like  "Meryn"), (select id_maison from Maison where nom like "Trant"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Mikken"), (select id_maison from Maison where nom like "Stark"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Tully" and prenom like  "Minisa"), (select id_maison from Maison where nom like "Tully"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Tully" and prenom like  "Minisa"), (select id_maison from Maison where nom like "Whent"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Missandei"), (select id_maison from Maison where nom like "Targaryen"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Morag"), (select id_maison from Maison where nom like "Targaryen"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Omble" and prenom like  "Morag"), (select id_maison from Maison where nom like "Omble"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Mord"), (select id_maison from Maison where nom like "Arryn"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Mordane"), (select id_maison from Maison where nom like "Stark"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Mordeur"), (select id_maison from Maison where nom like "Lannister"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Mossador"), (select id_maison from Maison where nom like "Targaryen"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Omble" and prenom like  "Mycah"), (select id_maison from Maison where nom like "Omble"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Myranda"), (select id_maison from Maison where nom like "Bolton"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Baratheon" and prenom like  "Myrcella"), (select id_maison from Maison where nom like "Baratheon"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Baratheon" and prenom like  "Myrcella"), (select id_maison from Maison where nom like "Martell"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Mélisandre"), (select id_maison from Maison where nom like "Baratheon de Peyredragon"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Mélisandre"), (select id_maison from Maison where nom like "Targaryen"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Targaryen" and prenom like  "Naerys"), (select id_maison from Maison where nom like "Targaryen"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Omble" and prenom like  "Ned"), (select id_maison from Maison where nom like "Omble"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Omble" and prenom like  "Ned"), (select id_maison from Maison where nom like "Stark"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Frey" and prenom like  "Neyela"), (select id_maison from Maison where nom like "Frey"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Nissa" and prenom like  "Nissa"), (select id_maison from Maison where nom like "Frey"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Nora"), (select id_maison from Maison where nom like "Frey"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Prince de" and prenom like  "Nouveau"), (select id_maison from Maison where nom like "Targaryen"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Sand" and prenom like  "Nymeria"), (select id_maison from Maison where nom like "Martell"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Sand" and prenom like  "Obara"), (select id_maison from Maison where nom like "Martell"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Martell" and prenom like  "Oberyn"), (select id_maison from Maison where nom like "Martell"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Tyrell" and prenom like  "Olenna"), (select id_maison from Maison where nom like "Tyrell"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Tyrell" and prenom like  "Olenna"), (select id_maison from Maison where nom like "Redwyne"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Olyvar"), (select id_maison from Maison where nom like "Baelish"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Frey" and prenom like  "Olyvar"), (select id_maison from Maison where nom like "Frey"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Ornela"), (select id_maison from Maison where nom like "Targaryen"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Lannister" and prenom like  "Orson"), (select id_maison from Maison where nom like "Lannister"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Baratheon" and prenom like  "Orys"), (select id_maison from Maison where nom like "Baratheon"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Baratheon" and prenom like  "Orys"), (select id_maison from Maison where nom like "Targaryen"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "I" and prenom like  "Orys"), (select id_maison from Maison where nom like "Baratheon"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "I" and prenom like  "Orys"), (select id_maison from Maison where nom like "Targaryen"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Osha"), (select id_maison from Maison where nom like "Stark"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Yarwyck" and prenom like  "Othell"), (select id_maison from Maison where nom like "Yarwyck"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "zo Pahl" and prenom like  "Oznak"), (select id_maison from Maison where nom like "Pahl"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Palla"), (select id_maison from Maison where nom like "Stark"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "mentionnés" and prenom like  "Catégorie:Personnages"), (select id_maison from Maison where nom like "Stark"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "mineurs" and prenom like  "Catégorie:Personnages"), (select id_maison from Maison where nom like "Stark"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "par région" and prenom like  "Catégorie:Personnages"), (select id_maison from Maison where nom like "Stark"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "par saison" and prenom like  "Catégorie:Personnages"), (select id_maison from Maison where nom like "Stark"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "par statut" and prenom like  "Catégorie:Personnages"), (select id_maison from Maison where nom like "Stark"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "principaux" and prenom like  "Catégorie:Personnages"), (select id_maison from Maison where nom like "Stark"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "récurrents" and prenom like  "Catégorie:Personnages"), (select id_maison from Maison where nom like "Stark"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "garçon de" and prenom like  "Petit"), (select id_maison from Maison where nom like "Stark"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Baelish" and prenom like  "Petyr"), (select id_maison from Maison where nom like "Baelish"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Payne" and prenom like  "Podrick"), (select id_maison from Maison where nom like "Payne"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Polliver"), (select id_maison from Maison where nom like "Lannister"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "du dosh" and prenom like  "Prophétesse"), (select id_maison from Maison where nom like "Targaryen"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Pycelle"), (select id_maison from Maison where nom like "Lannister"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Qoherys" and prenom like  "Quenton"), (select id_maison from Maison where nom like "Qoherys"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Qoherys" and prenom like  "Quenton"), (select id_maison from Maison where nom like "Targaryen"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Qyburn"), (select id_maison from Maison where nom like "Lannister"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Qyburn"), (select id_maison from Maison where nom like "Baratheon"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Qyburn"), (select id_maison from Maison where nom like "Bolton"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Rakharo"), (select id_maison from Maison where nom like "Targaryen"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Kenning" and prenom like  "Ralf"), (select id_maison from Maison where nom like "Kenning"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Kenning" and prenom like  "Ralf"), (select id_maison from Maison where nom like "Greyjoy"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Bolton" and prenom like  "Ramsay"), (select id_maison from Maison where nom like "Bolton"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Tarly" and prenom like  "Randyll"), (select id_maison from Maison where nom like "Tarly"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Tarly" and prenom like  "Randyll"), (select id_maison from Maison where nom like "Lannister"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Tarly" and prenom like  "Randyll"), (select id_maison from Maison where nom like "Tyrell"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Blanc" and prenom like  "Rat"), (select id_maison from Maison where nom like "Targaryen"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Karstark" and prenom like  "Regan"), (select id_maison from Maison where nom like "Omble"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Karstark" and prenom like  "Regan"), (select id_maison from Maison where nom like "Karstark"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Lannister" and prenom like  "Reginald"), (select id_maison from Maison where nom like "Lannister de Port-Lannis"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Lannister" and prenom like  "Reginald"), (select id_maison from Maison where nom like "Lannister"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Catégorie:Relations"), (select id_maison from Maison where nom like "Lannister de Port-Lannis"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Catégorie:Relations"), (select id_maison from Maison where nom like "Lannister"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Baratheon" and prenom like  "Renly"), (select id_maison from Maison where nom like "Baratheon"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Rennick"), (select id_maison from Maison where nom like "Lannister"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Reyne" and prenom like  "Reynard"), (select id_maison from Maison where nom like "Reyne"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Reyne" and prenom like  "Reynard"), (select id_maison from Maison where nom like "Lannister"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Targaryen" and prenom like  "Rhaegar"), (select id_maison from Maison where nom like "Targaryen"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Targaryen" and prenom like  "Rhaegel"), (select id_maison from Maison where nom like "Targaryen"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Rhaego"), (select id_maison from Maison where nom like "Targaryen"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Targaryen" and prenom like  "Rhaella"), (select id_maison from Maison where nom like "Targaryen"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Targaryen" and prenom like  "Rhaena"), (select id_maison from Maison where nom like "Targaryen"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Targaryen" and prenom like  "Rhaenyra"), (select id_maison from Maison where nom like "Targaryen"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Karstark" and prenom like  "Rickard"), (select id_maison from Maison where nom like "Karstark"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Karstark" and prenom like  "Rickard"), (select id_maison from Maison where nom like "Stark"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Stark" and prenom like  "Rickard"), (select id_maison from Maison where nom like "Stark"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Stark" and prenom like  "Rickon"), (select id_maison from Maison where nom like "Stark"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Stark" and prenom like  "Robb"), (select id_maison from Maison where nom like "Stark"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Baratheon" and prenom like  "Robert"), (select id_maison from Maison where nom like "Baratheon"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Glover" and prenom like  "Robett"), (select id_maison from Maison where nom like "Glover"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Glover" and prenom like  "Robett"), (select id_maison from Maison where nom like "Stark"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Arryn" and prenom like  "Robin"), (select id_maison from Maison where nom like "Arryn"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Cassel" and prenom like  "Rodrik"), (select id_maison from Maison where nom like "Cassel"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Cassel" and prenom like  "Rodrik"), (select id_maison from Maison where nom like "Stark"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Greyjoy" and prenom like  "Rodrik"), (select id_maison from Maison where nom like "Greyjoy"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Stark" and prenom like  "Rodrik"), (select id_maison from Maison where nom like "Stark"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Reyne" and prenom like  "Roger"), (select id_maison from Maison where nom like "Reyne"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Reyne" and prenom like  "Roger"), (select id_maison from Maison where nom like "Lannister"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Gris" and prenom like  "Roi"), (select id_maison from Maison where nom like "Greyjoy"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Bolton" and prenom like  "Roose"), (select id_maison from Maison where nom like "Bolton"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Rorge"), (select id_maison from Maison where nom like "Lannister"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Tully" and prenom like  "Roslin"), (select id_maison from Maison where nom like "Frey"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Tully" and prenom like  "Roslin"), (select id_maison from Maison where nom like "Tully"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Rossart"), (select id_maison from Maison where nom like "Targaryen"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "IV Bolton" and prenom like  "Royce"), (select id_maison from Maison where nom like "Bolton"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Rivers" and prenom like  "Ryger"), (select id_maison from Maison where nom like "Frey"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Florent" and prenom like  "Rylene"), (select id_maison from Maison where nom like "Florent"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Sally"), (select id_maison from Maison where nom like "Florent"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Sam"), (select id_maison from Maison where nom like "Florent"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Tarly" and prenom like  "Samwell"), (select id_maison from Maison where nom like "Tarly"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Clegane" and prenom like  "Sandor"), (select id_maison from Maison where nom like "Lannister"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Clegane" and prenom like  "Sandor"), (select id_maison from Maison where nom like "Clegane"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Stark" and prenom like  "Sansa"), (select id_maison from Maison where nom like "Stark"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Sarra"), (select id_maison from Maison where nom like "Stark"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Frey" and prenom like  "Sarra"), (select id_maison from Maison where nom like "Frey"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "du Nord" and prenom like  "Seigneur"), (select id_maison from Maison where nom like "Stark"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "du Val" and prenom like  "Seigneur"), (select id_maison from Maison where nom like "Arryn"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Torth" and prenom like  "Selwyn"), (select id_maison from Maison where nom like "Torth"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Baratheon" and prenom like  "Selyse"), (select id_maison from Maison where nom like "Baratheon de Peyredragon"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Baratheon" and prenom like  "Selyse"), (select id_maison from Maison where nom like "Florent"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Feunoyr" and prenom like  "Serena"), (select id_maison from Maison where nom like "Feunoyr"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Frey" and prenom like  "Serra"), (select id_maison from Maison where nom like "Frey"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Shae"), (select id_maison from Maison where nom like "Frey"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Baratheon" and prenom like  "Shireen"), (select id_maison from Maison where nom like "Baratheon de Peyredragon"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Frey" and prenom like  "Shirei"), (select id_maison from Maison where nom like "Frey"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Sissy"), (select id_maison from Maison where nom like "Frey"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Saan" and prenom like  "Sladhor"), (select id_maison from Maison where nom like "Baratheon de Peyredragon"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Spadassin"), (select id_maison from Maison where nom like "Lannister"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Spadassin"), (select id_maison from Maison where nom like "Baelish"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Lannister" and prenom like  "Stafford"), (select id_maison from Maison where nom like "Lannister"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Baratheon" and prenom like  "Stannis"), (select id_maison from Maison where nom like "Baratheon de Peyredragon"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Baratheon" and prenom like  "Stannis"), (select id_maison from Maison where nom like "Baratheon"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Frey" and prenom like  "Stevron"), (select id_maison from Maison where nom like "Frey"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Glover" and prenom like  "Sybelle"), (select id_maison from Maison where nom like "Glover"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Glover" and prenom like  "Sybelle"), (select id_maison from Maison where nom like "Stark"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Hollard" and prenom like  "Symon"), (select id_maison from Maison where nom like "Hollard"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Forel" and prenom like  "Syrio"), (select id_maison from Maison where nom like "Stark"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Talbot"), (select id_maison from Maison where nom like "Frey"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Stark" and prenom like  "Talisa"), (select id_maison from Maison where nom like "Stark"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Tarly" and prenom like  "Talla"), (select id_maison from Maison where nom like "Tarly"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Castelfoyer" and prenom like  "Tanda"), (select id_maison from Maison where nom like "Castelfoyer"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Tansy"), (select id_maison from Maison where nom like "Bolton"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Teela"), (select id_maison from Maison where nom like "Stark"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Terys" and prenom like  "Ternesio"), (select id_maison from Maison where nom like "Stark"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Greyjoy" and prenom like  "Theon"), (select id_maison from Maison where nom like "Greyjoy"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Greyjoy" and prenom like  "Theon"), (select id_maison from Maison where nom like "Stark"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Greyjoy" and prenom like  "Theon"), (select id_maison from Maison where nom like "Targaryen"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Greyjoy" and prenom like  "Theon"), (select id_maison from Maison where nom like "Bolton"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Lannister" and prenom like  "Tion"), (select id_maison from Maison where nom like "Lannister"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Tarbeck" and prenom like  "Tion"), (select id_maison from Maison where nom like "Tarbeck"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Tarbeck" and prenom like  "Tion"), (select id_maison from Maison where nom like "Reyne"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Tarbeck" and prenom like  "Tion"), (select id_maison from Maison where nom like "Lannister"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Titilleur"), (select id_maison from Maison where nom like "Clegane"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Mott" and prenom like  "Tobho"), (select id_maison from Maison where nom like "Clegane"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Tomard"), (select id_maison from Maison where nom like "Stark"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Baratheon" and prenom like  "Tommen"), (select id_maison from Maison where nom like "Baratheon"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Tommy"), (select id_maison from Maison where nom like "Stark"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Tormund"), (select id_maison from Maison where nom like "Stark"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Stark" and prenom like  "Torrhen"), (select id_maison from Maison where nom like "Stark"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Tourte-Chaude"), (select id_maison from Maison where nom like "Stark"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "d'Alluve" and prenom like  "Tristan"), (select id_maison from Maison where nom like "d'Alluve"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Martell" and prenom like  "Trystan"), (select id_maison from Maison where nom like "Martell"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Sand" and prenom like  "Tyerne"), (select id_maison from Maison where nom like "Martell"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Lannister" and prenom like  "Tyrion"), (select id_maison from Maison where nom like "Targaryen"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Lannister" and prenom like  "Tyrion"), (select id_maison from Maison where nom like "Lannister"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Tysha"), (select id_maison from Maison where nom like "Targaryen"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Tysha"), (select id_maison from Maison where nom like "Lannister"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Lannister" and prenom like  "Tytos"), (select id_maison from Maison where nom like "Lannister"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Lannister" and prenom like  "Tywald"), (select id_maison from Maison where nom like "Lannister"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Lannister" and prenom like  "Tywin"), (select id_maison from Maison where nom like "Lannister"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Corbray" and prenom like  "Vance"), (select id_maison from Maison where nom like "Corbray"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Corbray" and prenom like  "Vance"), (select id_maison from Maison where nom like "Arryn"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Egen" and prenom like  "Vardis"), (select id_maison from Maison where nom like "Arryn"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Egen" and prenom like  "Vardis"), (select id_maison from Maison where nom like "Egen"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Varly"), (select id_maison from Maison where nom like "Arryn"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Varly"), (select id_maison from Maison where nom like "Egen"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Varys"), (select id_maison from Maison where nom like "Targaryen"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Poole" and prenom like  "Vayon"), (select id_maison from Maison where nom like "Stark"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Poole" and prenom like  "Vayon"), (select id_maison from Maison where nom like "Poole"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Gris" and prenom like  "Ver"), (select id_maison from Maison where nom like "Targaryen"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Greyjoy" and prenom like  "Vickon"), (select id_maison from Maison where nom like "Greyjoy"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Nan" and prenom like  "Vieille"), (select id_maison from Maison where nom like "Stark"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Redwyne" and prenom like  "Viola"), (select id_maison from Maison where nom like "Redwyne"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Violet"), (select id_maison from Maison where nom like "Bolton"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Targaryen" and prenom like  "Visenya"), (select id_maison from Maison where nom like "Targaryen"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Targaryen" and prenom like  "Viserys I"), (select id_maison from Maison where nom like "Targaryen"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Targaryen" and prenom like  "Viserys II"), (select id_maison from Maison where nom like "Targaryen"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Targaryen" and prenom like  "Viserys"), (select id_maison from Maison where nom like "Targaryen"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Vère"), (select id_maison from Maison where nom like "Targaryen"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Bolton" and prenom like  "Walda"), (select id_maison from Maison where nom like "Frey"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Bolton" and prenom like  "Walda"), (select id_maison from Maison where nom like "Bolton"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Frey" and prenom like  "Walda"), (select id_maison from Maison where nom like "Frey"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Frey" and prenom like  "Walder"), (select id_maison from Maison where nom like "Frey"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Rivers" and prenom like  "Walder"), (select id_maison from Maison where nom like "Frey"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Tarbeck" and prenom like  "Walderan"), (select id_maison from Maison where nom like "Tarbeck"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Tarbeck" and prenom like  "Walderan"), (select id_maison from Maison where nom like "Reyne"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Tarbeck" and prenom like  "Walderan"), (select id_maison from Maison where nom like "Lannister"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Frey" and prenom like  "Waldra"), (select id_maison from Maison where nom like "Frey"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Frey" and prenom like  "Waldron"), (select id_maison from Maison where nom like "Frey"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Manderly" and prenom like  "Wendel"), (select id_maison from Maison where nom like "Manderly"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Manderly" and prenom like  "Wendel"), (select id_maison from Maison where nom like "Stark"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Darry" and prenom like  "Willem"), (select id_maison from Maison where nom like "Targaryen"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Darry" and prenom like  "Willem"), (select id_maison from Maison where nom like "Darry"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Frey" and prenom like  "Willem"), (select id_maison from Maison where nom like "Frey"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Lannister" and prenom like  "Willem"), (select id_maison from Maison where nom like "Lannister"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Guède" and prenom like  "Willis"), (select id_maison from Maison where nom like "Whent"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Guède" and prenom like  "Willis"), (select id_maison from Maison where nom like "Guède"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Wolkan"), (select id_maison from Maison where nom like "Stark"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Wolkan"), (select id_maison from Maison where nom like "Bolton"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Wyl"), (select id_maison from Maison where nom like "Stark"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  "Wylla"), (select id_maison from Maison where nom like "Dayne"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Bracken" and prenom like  "Wyllis"), (select id_maison from Maison where nom like "Bracken"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Manderly" and prenom like  "Wyman"), (select id_maison from Maison where nom like "Stark"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Manderly" and prenom like  "Wyman"), (select id_maison from Maison where nom like "Manderly"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Greyjoy" and prenom like  "Yara"), (select id_maison from Maison where nom like "Greyjoy"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Royce" and prenom like  "Yohn"), (select id_maison from Maison where nom like "Royce"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Royce" and prenom like  "Yohn"), (select id_maison from Maison where nom like "Arryn"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Veneur" and prenom like  "Éon"), (select id_maison from Maison where nom like "Veneur"));
INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like "Veneur" and prenom like  "Éon"), (select id_maison from Maison where nom like "Arryn"));





INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "Rivers" and prenom like  "Aegor"), "Compagnie Dorée");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Aemon"), "Garde de Nuit");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Aemon"), "Mestres");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "Targaryen" and prenom like  "Aemond"), "Verts");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "Greyjoy" and prenom like  "Aeron"), "Dieu Noyé");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Aggo"), "Drogo");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "Thorne" and prenom like  "Alliser"), "Garde de Nuit");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Anguy"), "Fraternité sans Bannières");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Armeca"), "Petyr Baelish");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "Briseglace" and prenom like  "Arson"), "Peuple libre");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Arthur"), "Qyburn");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Arthur"), "Varys");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "Dayne" and prenom like  "Arthur"), "Garde Royale");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "Targaryen" and prenom like  "Baelor"), "Foi des Sept");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "Selmy" and prenom like  "Barristan"), "Garde Royale");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "Paenymion" and prenom like  "Belicho"), "Garde Royale");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "Stark" and prenom like  "Benjen"), "Garde de Nuit");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "de Torth" and prenom like  "Brienne"), "Garde Royale");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "de Torth" and prenom like  "Brienne"), "Renly Baratheon");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Bronn"), "Jaime Lannister");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Bronn"), "Tyrion Lannister");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Bruni"), "Peuple libre");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Bruni"), "Marcheurs Blancs");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "Dondarrion" and prenom like  "Béric"), "Fraternité sans Bannières");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Caleotte"), "Mestres");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Camello"), "Mestres");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "Thenn" and prenom like  "Change-peau"), "Peuple libre");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "Thenn" and prenom like  "Change-peau"), "Mance Rayder");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "Thenn" and prenom like  "Change-peau"), "Thenns");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Chella"), "Oreilles Noires");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Clarenzo"), "Oreilles Noires");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Clea"), "Oreilles Noires");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Cleon"), "Oreilles Noires");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Cohollo"), "Drogo");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Cooper"), "Garde de Nuit");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "Stark" and prenom like  "Cregan"), "Noirs");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Cressen"), "Mestres");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "Naharis" and prenom like  "Daario"), "Puînés");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "Targaryen" and prenom like  "Daemon"), "Noirs");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "Mallister" and prenom like  "Denys"), "Garde de Nuit");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "Dalba" and prenom like  "Dim"), "Peuple libre");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "Dalba" and prenom like  "Dim"), "Jon Snow");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "Dalba" and prenom like  "Dim"), "Mance Rayder");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Dolf"), "Freux");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Dongo"), "Peuple libre");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Dongo"), "Mance Rayder");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Doreah"), "Xaro Xhoan Daxos");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "le Grand" and prenom like  "Duncan"), "Garde Royale");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Ebrose"), "Mestres");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Ebrose"), "Citadelle");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "Tallett" and prenom like  "Eddison"), "Garde de Nuit");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Fennesz"), "Mighdal");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Fermier"), "Mighdal");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Feuille"), "Enfants de la Forêt");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Frances"), "Qyburn");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Frances"), "Varys");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "abandonnée" and prenom like  "Gamine"), "Sans-Visage");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Gared"), "Garde de Nuit");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Gendel"), "Peuple libre");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Genna"), "Petyr Baelish");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "Hightower" and prenom like  "Gerold"), "Garde Royale");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Ghita"), "Garde Royale");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Gorne"), "Peuple libre");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "Moineau" and prenom like  "Grand"), "Foi des Sept");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "Moineau" and prenom like  "Grand"), "Moineaux");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "Moineau" and prenom like  "Grand"), "Foi Militante");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "Clegane" and prenom like  "Gregor"), "Garde Royale");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "mo Ullhor" and prenom like  "Greizhen"), "Astapor");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Grenn"), "Garde de Nuit");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Guymon"), "Garde de Nuit");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "Gaunt" and prenom like  "Gwayne"), "Garde Royale");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Haggo"), "Drogo");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Hallyne"), "Guilde des Alchimistes");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "Strickland" and prenom like  "Harry"), "Compagnie Dorée");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Helliweg"), "Mestres");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "zo Loraq" and prenom like  "Hizdahr"), "Grands Maîtres");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "zo Loraq" and prenom like  "Hizdahr"), "Meereen");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "Flowers" and prenom like  "Jafer"), "Garde de Nuit");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "Flowers" and prenom like  "Jafer"), "Marcheurs Blancs");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "Lannister" and prenom like  "Jaime"), "Garde Royale");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "Slynt" and prenom like  "Janos"), "Garde de Nuit");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "H'ghar" and prenom like  "Jaqen"), "Sans-Visage");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "Rykker" and prenom like  "Jaremy"), "Garde de Nuit");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "de Vieilles-Pierres" and prenom like  "Jenny"), "Garde de Nuit");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "Mormont" and prenom like  "Jeor"), "Garde de Nuit");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Jhiqui"), "Drogo");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Johnna"), "Peuple libre");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "Snow" and prenom like  "Jon"), "Garde de Nuit");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "Darry" and prenom like  "Jonothor"), "Garde Royale");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "Mormont" and prenom like  "Jorah"), "Varys");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "Mormont" and prenom like  "Jorah"), "Compagnie Dorée");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Joramun"), "Peuple libre");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Kaeth"), "Mestres");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "Tanner" and prenom like  "Karl"), "Garde de Nuit");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Karsi"), "Peuple libre");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Karsi"), "Mance Rayder");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Karsi"), "Marcheurs blancs");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Kayla"), "Peuple libre");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Kayla"), "Mance Rayder");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Kayla"), "Marcheurs blancs");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Kinvara"), "R'hllor");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Kinvara"), "Temple Rouge de Volantis");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Kovarro"), "Drogo");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "mo Nakloz" and prenom like  "Kraznys"), "Drogo");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "Lannister" and prenom like  "Lancel"), "Moineaux");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "Lannister" and prenom like  "Lancel"), "Foi Militante");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Loboda"), "Peuple libre");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Loboda"), "Thenns");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Loboda"), "Mance Rayder");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Locke"), "Garde de Nuit");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "Velaryon" and prenom like  "Lucerys"), "Noirs");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Luwin"), "Mestres");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "Mar Tun" and prenom like  "Mag"), "Peuple libre");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Maggy"), "Peuple libre");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Magicien"), "Peuple libre");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Mago"), "Drogo");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "Rayder" and prenom like  "Mance"), "Peuple libre");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "Rayder" and prenom like  "Mance"), "Garde de Nuit");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "Moore" and prenom like  "Mandon"), "Garde Royale");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Marei"), "Petyr Baelish");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Martha"), "Varys");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Mero"), "Puînés");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "Trant" and prenom like  "Meryn"), "Garde Royale");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Mhaegen"), "Petyr Baelish");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Mighdal"), "Grands Maîtres");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Mighdal"), "Meereen");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Mirelle"), "Petyr Baelish");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "Maz Duur" and prenom like  "Mirri"), "Pâtre Suprême");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Mordane"), "Foi des Sept");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Munkun"), "Citadelle");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Mycah"), "Citadelle");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "Omble" and prenom like  "Mycah"), "Garde de Nuit");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Mélisandre"), "Jon Snow");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Mélisandre"), "R'hllor");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "Omble" and prenom like  "Ned"), "Marcheurs Blancs");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Olly"), "Garde de Nuit");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Orell"), "Peuple libre");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Orell"), "Mance Rayder");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Ornela"), "Dosh kaleen");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "Yarwyck" and prenom like  "Othell"), "Garde de Nuit");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Othor"), "Garde de Nuit");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Othor"), "Marcheurs Blancs");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "zo Pahl" and prenom like  "Oznak"), "Grands Maîtres");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "zo Pahl" and prenom like  "Oznak"), "Meereen");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "Payne" and prenom like  "Podrick"), "Garde Royale");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "Payne" and prenom like  "Podrick"), "Brienne de Torth");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "Payne" and prenom like  "Podrick"), "Tyrion Lannister");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "du dosh" and prenom like  "Prophétesse"), "Drogo");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "Pree" and prenom like  "Pyat"), "Treize");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "Pree" and prenom like  "Pyat"), "Conjurateurs");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Pypar"), "Garde de Nuit");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Qhono"), "Daenerys Targaryen");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Qhono"), "Moro");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Qhorin"), "Garde de Nuit");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Qotho"), "Drogo");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Quaithe"), "Drogo");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Qyburn"), "Mestres");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Rakharo"), "Drogo");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Rast"), "Garde de Nuit");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "Coq" and prenom like  "Rat"), "Garde de Nuit");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Ray"), "Foi des Sept");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "mo Eraz" and prenom like  "Razdal"), "Foi des Sept");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "Targaryen" and prenom like  "Rhaenyra"), "Noirs");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "de la" and prenom like  "Roi"), "Marcheurs Blancs");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "de la" and prenom like  "Roi"), "Treize");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "des Épices" and prenom like  "Roi"), "Treize");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "du Cuivre" and prenom like  "Roi"), "Treize");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Ros"), "Petyr Baelish");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Ros"), "Varys");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Rossart"), "Guilde des Alchimistes");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "Tarly" and prenom like  "Samwell"), "Ordre des Mestres");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "Tarly" and prenom like  "Samwell"), "Garde de Nuit");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "Clegane" and prenom like  "Sandor"), "Fraternité sans Bannières");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "Clegane" and prenom like  "Sandor"), "Garde Royale");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "des Os" and prenom like  "Seigneur"), "Peuple libre");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Shagga"), "Freux");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Stiv"), "Peuple libre");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Styr"), "Peuple libre");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Styr"), "Mance Rayder");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Styr"), "Thenns");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "Forel" and prenom like  "Syrio"), "Seigneur de la Mer");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "Stark" and prenom like  "Talisa"), "Famille Maegyr");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "Greyjoy" and prenom like  "Theon"), "otage");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Thoros"), "Fraternité sans Bannières");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Thoros"), "R'hllor");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Timett"), "Faces Brûlées");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "Baratheon" and prenom like  "Tommen"), "Foi Militante");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Tormund"), "Peuple libre");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Tormund"), "Mance Rayder");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Tormund"), "Jon Snow");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "d'Alluve" and prenom like  "Tristan"), "Garde de Nuit");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "Nestoris" and prenom like  "Tycho"), "Banque de Fer");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Unella"), "Foi des Sept");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Unella"), "Saintetés");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Unella"), "Foi Militante");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Vala"), "Fils de la Harpie");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "Gris" and prenom like  "Ver"), "Immaculés");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "Targaryen" and prenom like  "Viserys II"), "Noirs");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Wallen"), "Peuple libre");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "Royce" and prenom like  "Waymar"), "Peuple libre");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Weyland"), "Mestres");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Will"), "Garde de Nuit");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Willa"), "Peuple libre");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Wolkan"), "Mestres");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "Weg Wun" and prenom like  "Wun"), "Peuple libre");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "Weg Wun" and prenom like  "Wun"), "Jon Snow");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "Xhoan Daxos" and prenom like  "Xaro"), "Treize");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where nom like "zo Qaggaz" and prenom like  "Yezzan"), "Bontés");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Ygrid"), "Peuple libre");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Ygrid"), "Jon Snow");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Ygrid"), "Mance Rayder");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Yoren"), "Garde de Nuit");
INSERT INTO Allegeance (id_personnage, nom) values ((select id_personnage from personnage where prenom like  "Zanrush"), "R'hllor");



INSERT INTO Batard (id_batard, famille1, famille2) values ((select id_personnage from personnage where nom = "Snow" and prenom ="Jon"), (select id_famille from famille where nom = "Stark"),(select id_famille from famille where nom = "Targaryen"));

INSERT INTO Enfant_de (id_enfant, id_mere, id_pere) values ((select id_personnage from personnage where nom like "Snow" and prenom like "Jon"), (select id_personnage from personnage where nom like "Stark" and prenom like "Lyanna"),(select id_personnage from personnage where nom = "Targaryen" and prenom ="Rhaegar"));


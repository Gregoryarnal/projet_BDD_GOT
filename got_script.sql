create table personnage (
    id INT(5) NOT NULL,
    nom   VARCHAR (50) NOT NULL ,
    prenom   VARCHAR (50) NOT NULL,
    tué_par  VARCHAR (50),
    famille
    CONSTRAINT user_PK PRIMARY KEY (id)
)

CREATE TABLE chateau (
    nom  VARCHAR (50),
    lieu  VARCHAR (50),
    CONSTRAINT user_PK PRIMARY KEY (nom)
)

create TABLE enfant_de(
    id INT (50) not null,
    pere VARCHAR (50),
    mere VARCHAR (50),
)

CREATE TABLE a_couché(
    personne1 INT(5) NOt null,
    personne1 INT(5) NOt null
)

create TABLE a_tué(
    tueur INT(5) not null,
    tué INT(5)
)

create TABLE guerre(
    nom VARCHAR(50) not null,
    armée1 INT(5)
)

create table armée(
    id int(5) Not null,
    nom VARCHAR(50),
    dirigeant VARCHAR(50)
)

create table famille(
    nom VARCHAR(50) not null,
    histoire VARCHAR(250)
)

create table mariée(
    personnage1 INT(5) not null,
    personnage2 INT(5) not null,
    CONSTRAINT mariee1_FK FOREIGN KEY (personnage1) REFERENCES personnage.id,    
    CONSTRAINT mariee2_FK FOREIGN KEY (personnage2) REFERENCES personnage.id
)

create table lieu(

)

create table trompe_avec(

)

create table 
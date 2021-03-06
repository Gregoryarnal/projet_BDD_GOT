INSERT INTO chateau (nom, lieu, maison ) values ("Accalmie", (select id_region from region where nom like "Terres de l'Orage"), (select id_maison from maison where nom like "Baratheon"));
INSERT INTO chateau (nom, lieu, maison ) values ("Castamere", (select id_region from region where nom like "Terres de l'Ouest"), (select id_maison from maison where nom like "Reyne"));
INSERT INTO chateau (nom, lieu, maison ) values ("Castelfoyer", (select id_region from region where nom like "Terres de la Couronne"), (select id_maison from maison where nom like "Castelfoyer"));
INSERT INTO chateau (nom, lieu, maison ) values ("Castral Roc", (select id_region from region where nom like "Terres de l'Ouest"), (select id_maison from maison where nom like "Lannister"));
INSERT INTO chateau (nom, lieu, maison ) values ("Cendregué", (select id_region from region where nom like "Le Bief"), (select id_maison from maison where nom like "Cendregué"));
INSERT INTO chateau (nom, lieu, maison ) values ("Cendremarc", (select id_region from region where nom like "Terres de l'Ouest"), (select id_maison from maison where nom like "Marpheux"));
INSERT INTO chateau (nom, lieu, maison ) values ("Chutebourg", (select id_region from region where nom like "Le Bief"), (select id_maison from maison where nom like "Marpheux"));
INSERT INTO chateau (nom, lieu, maison ) values ("Château Tarbeck", (select id_region from region where nom like "Terres de l'Ouest"), (select id_maison from maison where nom like "Tarbeck"));
INSERT INTO chateau (nom, lieu, maison ) values ("Châteaunoir", (select id_region from region where nom like "Nord"), (select id_maison from maison where nom like "Garde de Nuit"));
INSERT INTO chateau (nom, lieu, maison ) values ("Catégorie:Châteaux de Dorne", (select id_region from region where nom like "Nord"), (select id_maison from maison where nom like "Garde de Nuit"));
INSERT INTO chateau (nom, lieu, maison ) values ("Catégorie:Châteaux de l'Orage", (select id_region from region where nom like "Nord"), (select id_maison from maison where nom like "Garde de Nuit"));
INSERT INTO chateau (nom, lieu, maison ) values ("Catégorie:Châteaux de l'Ouest", (select id_region from region where nom like "Nord"), (select id_maison from maison where nom like "Garde de Nuit"));
INSERT INTO chateau (nom, lieu, maison ) values ("Catégorie:Châteaux de la Couronne", (select id_region from region where nom like "Nord"), (select id_maison from maison where nom like "Garde de Nuit"));
INSERT INTO chateau (nom, lieu, maison ) values ("Catégorie:Châteaux de la Garde de Nuit", (select id_region from region where nom like "Nord"), (select id_maison from maison where nom like "Garde de Nuit"));
INSERT INTO chateau (nom, lieu, maison ) values ("Catégorie:Châteaux des Îles de Fer", (select id_region from region where nom like "Nord"), (select id_maison from maison where nom like "Garde de Nuit"));
INSERT INTO chateau (nom, lieu, maison ) values ("Catégorie:Châteaux du Bief", (select id_region from region where nom like "Nord"), (select id_maison from maison where nom like "Garde de Nuit"));
INSERT INTO chateau (nom, lieu, maison ) values ("Catégorie:Châteaux du Conflans", (select id_region from region where nom like "Nord"), (select id_maison from maison where nom like "Garde de Nuit"));
INSERT INTO chateau (nom, lieu, maison ) values ("Catégorie:Châteaux du Nord", (select id_region from region where nom like "Nord"), (select id_maison from maison where nom like "Garde de Nuit"));
INSERT INTO chateau (nom, lieu, maison ) values ("Catégorie:Châteaux du Val d'Arryn", (select id_region from region where nom like "Nord"), (select id_maison from maison where nom like "Garde de Nuit"));
INSERT INTO chateau (nom, lieu, maison ) values ("Chênes-en-fer", (select id_region from region where nom like "Val d'Arryn"), (select id_maison from maison where nom like "Vanbois"));
INSERT INTO chateau (nom, lieu, maison ) values ("Citadelle", (select id_region from region where nom like "Villevieille"), (select id_maison from maison where nom like "Vanbois"));
INSERT INTO chateau (nom, lieu, maison ) values ("Corbois", (select id_region from region where nom like "Le Nord"), (select id_maison from maison where nom like "Corbois"));
INSERT INTO chateau (nom, lieu, maison ) values ("Corcolline", (select id_region from region where nom like "Le Bief"), (select id_maison from maison where nom like "Tarly"));
INSERT INTO chateau (nom, lieu, maison ) values ("Corneilla", (select id_region from region where nom like "Conflans"), (select id_maison from maison where nom like "Nerbosc"));
INSERT INTO chateau (nom, lieu, maison ) values ("Darry", (select id_region from region where nom like "Conflans"), (select id_maison from maison where nom like "Darry"));
INSERT INTO chateau (nom, lieu, maison ) values ("Denfert", (select id_region from region where nom like "Dorne"), (select id_maison from maison where nom like "Uller"));
INSERT INTO chateau (nom, lieu, maison ) values ("Dent d'Or", (select id_region from region where nom like "Terres de l'Ouest"), (select id_maison from maison where nom like "Lefford"));
INSERT INTO chateau (nom, lieu, maison ) values ("Donjon des Clegane", (select id_region from region where nom like "Terres de l'Ouest"), (select id_maison from maison where nom like "Clegane"));
INSERT INTO chateau (nom, lieu, maison ) values ("Donjon Rouge", (select id_region from region where nom like "Port-Réal"), (select id_maison from maison where nom like "Roi des Sept Couronnes"));
INSERT INTO chateau (nom, lieu, maison ) values ("Ferboys", (select id_region from region where nom like "Westeros"), (select id_maison from maison where nom like "Ferboys"));
INSERT INTO chateau (nom, lieu, maison ) values ("Fort Nox", (select id_region from region where nom like "Mur"), (select id_maison from maison where nom like "Ferboys"));
INSERT INTO chateau (nom, lieu, maison ) values ("Fort-Griseaux", (select id_region from region where nom like "Le Neck"), (select id_maison from maison where nom like "Reed"));
INSERT INTO chateau (nom, lieu, maison ) values ("Fort-Levant", (select id_region from region where nom like "Le Mur"), (select id_maison from maison where nom like "Garde de Nuit"));
INSERT INTO chateau (nom, lieu, maison ) values ("Fort-Terreur", (select id_region from region where nom like "Nord"), (select id_maison from maison where nom like "Bolton"));
INSERT INTO chateau (nom, lieu, maison ) values ("Griposte", (select id_region from region where nom like "Le Mur"), (select id_maison from maison where nom like "Bolton"));
INSERT INTO chateau (nom, lieu, maison ) values ("Harrenhal", (select id_region from region where nom like "Conflans"), (select id_maison from maison where nom like "Baelish"));
INSERT INTO chateau (nom, lieu, maison ) values ("Hautjardin", (select id_region from region where nom like "Bief"), (select id_maison from maison where nom like "de Bronn"));
INSERT INTO chateau (nom, lieu, maison ) values ("Ironrath", (select id_region from region where nom like "Bois-aux-Loups"), (select id_maison from maison where nom like "Whitehill"));
INSERT INTO chateau (nom, lieu, maison ) values ("Jardins Aquatiques", (select id_region from region where nom like "Dorne"), (select id_maison from maison where nom like "Ellaria Sand"));
INSERT INTO chateau (nom, lieu, maison ) values ("Karhold", (select id_region from region where nom like "Nord"), (select id_maison from maison where nom like "Karstark"));
INSERT INTO chateau (nom, lieu, maison ) values ("La Vesprée", (select id_region from region where nom like "Terres de l'Orage"), (select id_maison from maison where nom like "Torth"));
INSERT INTO chateau (nom, lieu, maison ) values ("Lancehélion", (select id_region from region where nom like "Dorne"), (select id_maison from maison where nom like "Ellaria Sand"));
INSERT INTO chateau (nom, lieu, maison ) values ("Les Eyrié", (select id_region from region where nom like "Val d'Arryn"), (select id_maison from maison where nom like "Arryn"));

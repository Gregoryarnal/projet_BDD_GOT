Projet de Base de données sur le theme de GOT.

FIP 1ère année 2020 Projet Base de données
Cédric du Mouza, Raphaël Fournier-S’niehotta
L’objectif de ce projet est de montrer vos capacités à construire une base de données relationnelle à partir de données existantes, non structurées. Durant ce projet, vous allez faire des choix de modélisation qu’il faudra autant que possible expliquer. La note prendra en compte la qualité de la modélisation et du code SQL, mais également les justifications/explications. La réalisation du projet est strictement individuelle.
Pour ce projet, vous devez réaliser la base de données permettant de stocker toutes les informations concernant les livres ou la série télévisée Game of Thrones. Votre base devra être la plus complète possible, notamment sur la représentation :
 Les personnages (dates principales et lieux associés, famille, proches, faits principaux, etc.)
 La géographie : villes, régions, lieux, etc., avec leurs propriétés connues
 Les événements importants (batailles, morts, alliances, rencontres, etc.)
 Les déplacements/séjours des différents personnages
Vous pouvez trouver des informations par exemple sur les sites suivants :
https://fr.wikipedia.org/wiki/Personnages_du_Tr%C3%B4ne_de_fer https://gameofthrones.fandom.com/fr/wiki/Wiki_Game_of_Thrones https://gameofthrones.fandom.com/wiki/Game_of_Thrones_Wiki (en anglais mais plus d’infos) https://www.lagardedenuit.com/wiki/index.php?title=Accueil
Et tout autre source bien sûr que vous pouvez trouver. Ne vous perdez cependant pas dans la recherche et la compilation de ces informations, ce n’est pas ce que nous évaluons en priorité.
     
Plus précisément, il vous sera demandé de réaliser les exercices suivants :
A) (optionnel) Proposer un schéma conceptuel (entités-associations) permettant de stocker l’ensemble des informations. Justifier/expliquer les choix non-triviaux.
B) Proposer le schéma logique (relationnel) permettant de stocker vos données. Expliquer et justifier vos choix. (PS : vous devriez avoir au moins une dizaine de tables !).
C) Donner le code SQL pour créer les différentes tables avec toutes leurs contraintes.
D) Créer quelques enregistrements pour peupler vos différentes tables (inutile de saisir tous les
personnages, lieux, événements, etc.)
E) Proposer 10 requêtes non-triviales sur votre base, suffisamment différentes les unes des
autres (agrégations, différences, des jointures sur plusieurs tables, imbrications, division,
etc).
F) Créer une fonction permettant de compter tous les lieux visités par un personnage passé en
paramètre.
G) Créer une procédure stockée affichant la liste des personnes d’une famille donnée en
paramètre, triée par nombre de lieux visités (vous pouvez utiliser la fonction de la question
précédente).
H) Créer une procédure stockée affichant les participants d’une bataille dont le nom sera passé
en paramètre. La procédure devra gérer (au moins) l’exception où la bataille n’existe pas.
I) Identifier et créer un trigger pertinent pour garantir la cohérence de données (de votre
choix).
Contraintes :
• SGBD autorisés : MySQL/MariaDB, Oracle, Postegre Remise des travaux :
 un code source sql, contenant les déclarations de fonctions, trigger et procédures, créations de tables, et les commandes pour remplir les tables
 un rapport, format pdf avec un schéma de nommage nom.prenom_fip1bdd.pdf, faisant référence à votre code source
 le tout sera envoyé à cedric.du_mouza@cnam.fr et fournier@cnam.fr avant le vendredi 12 juin 17h59 (heure de Paris).
  
 
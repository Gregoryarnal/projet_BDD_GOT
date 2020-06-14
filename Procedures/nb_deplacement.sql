DROP PROCEDURE IF EXISTS deplacement_perso;
DROP PROCEDURE IF EXISTS deplacement_famille_total;
DROP PROCEDURE IF EXISTS deplacement_famille_int;
DROP PROCEDURE IF EXISTS deplacement_famille_trie_int;
DROP PROCEDURE IF EXISTS deplacement_perso_with_data;
delimiter //
CREATE PROCEDURE deplacement_perso (IN id_perso INT)
BEGIN
    DECLARE result TEXT;
    DECLARE nb INT;
    SELECT COUNT(*) into nb FROM ville NATURAL JOIN deplacement NATURAL JOIN Personnage 
    WHERE personnage.id_personnage =  id_perso;
    SET result = CONCAT((select prenom, (select nom from maison where id_maison = famille) from personnage where id_personnage = id_perso), " a réalisé/e ", nb, " déplacements");

    SELECT result;
END//

CREATE PROCEDURE deplacement_perso_with_data (IN id_perso INT)
BEGIN
    SELECT ville.nom FROM ville NATURAL JOIN deplacement NATURAL JOIN Personnage 
    WHERE personnage.id_personnage =  id_perso;
END//


CREATE PROCEDURE deplacement_famille_total()
BEGIN
    SELECT famille, (select nom from maison where id_maison = famille), count(*) FROM ville NATURAL JOIN deplacement NATURAL JOIN Personnage
    where famille is not NULL
    group by famille
    order by count(*);
END//

CREATE PROCEDURE deplacement_famille_int (IN id_famille INT)
BEGIN
    SELECT count(*) FROM ville NATURAL JOIN deplacement NATURAL JOIN Personnage 
    WHERE personnage.famille =  id_famille;
END//

CREATE PROCEDURE deplacement_famille_trie_int (IN id_famille INT)
BEGIN

    SELECT id_personnage, prenom, count(*)  FROM ville NATURAL JOIN deplacement NATURAL JOIN Personnage 
    WHERE personnage.famille =  id_famille
    group by id_personnage
    order by count(*);
END//
delimiter ;
DROP PROCEDURE allegeance_perso;
DROP PROCEDURE deplacement_famille_total;
DROP PROCEDURE deplacement_famille_int;
DROP PROCEDURE deplacement_famille_trie_int;
delimiter //
CREATE PROCEDURE allegeance_perso (IN id_perso INT)
BEGIN
    select prenom, count(*) from allegeance natural join personnage natural join allegeance_maison 
    where personnage.id_personnage = id_perso;
END//

delimiter ;
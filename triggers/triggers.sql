DROP TRIGGER IF EXISTS chk_date_guerre;
DROP TRIGGER IF EXISTS chk_enfant;
delimiter //

-- verifie la cohérence de guerre pour que les dates de début et fin soit logique
CREATE TRIGGER chk_date_guerre BEFORE INSERT ON Guerre
FOR EACH ROW
BEGIN
declare msg varchar(128);
    IF NEW.annee_deb > NEW.annee_fin THEN
        SIGNAL sqlstate '45000' set message_text = 'Erreur de date, une guerre ne peux commencer apres sa fin';  
    END IF;
END//


-- verifie la cohérence de enfant_de pour qu'un enfant ne puisse pas être mis en tant que parent de ses parents
CREATE TRIGGER chk_enfant BEFORE INSERT ON Enfant_de
FOR EACH ROW
BEGIN
   IF EXISTS (SELECT id_enfant FROM enfant_de WHERE id_mere = NEW.id_enfant AND id_enfant = NEW.id_mere)
   OR (SELECT id_enfant FROM enfant_de WHERE id_pere = NEW.id_enfant AND id_enfant = NEW.id_pere)
    THEN
        SIGNAL sqlstate '45000' set message_text = 'Un enfant ne peux pas etre le pere/mere de ses parents';  
    END IF;
END//

delimiter ;


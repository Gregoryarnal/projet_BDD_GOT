DROP PROCEDURE IF EXISTS nombre_de_participant;

delimiter //
CREATE PROCEDURE nombre_de_participant (IN nomguerre VARCHAR(50)) 
BEGIN
    DECLARE nb_guerre INT;
    DECLARE code CHAR(5) DEFAULT '00000';
    DECLARE msg TEXT;
    DECLARE result TEXT;
      -- Declare exception handler for failed insert
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
      GET DIAGNOSTICS CONDITION 1
        code = RETURNED_SQLSTATE, msg = MESSAGE_TEXT;
    END;

    select count(*) into nb_guerre from guerre where nom like nomguerre;

    IF nb_guerre > 0 THEN
        set result = CONCAT("nombre de participants : " ,(select count(*) from guerre natural join armee_guerre natural join appartenance_armee where guerre.nom like nomguerre group by id_guerre), " à la guerre de : ", nomguerre);
    ELSE
        SET result = CONCAT('Cette guerre n\'existe pas : ',nomguerre);
    END IF;

    -- Say what happened
    SELECT result;
        

        
END//

delimiter ;


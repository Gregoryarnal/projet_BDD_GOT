-- nom et prenom des mariage
select p1.prenom as prenom1, (select nom from maison where id_maison = p1.famille) as nom1, personnage.prenom as prenom2,  (select nom from maison where id_maison = personnage.famille) as nom2 from personnage p1 INNER JOIN marie_a ON p1.id_personnage = marie_a.id1 INNER JOIN personnage on marie_a.id2 = personnage.id_personnage ;
-- nom et prenom des copulations
select p1.prenom as prenom1, (select nom from maison where id_maison = p1.famille) as nom1, personnage.prenom as prenom2,  (select nom from maison where id_maison = personnage.famille) as nom2 from personnage p1 INNER JOIN a_couche ON p1.id_personnage = a_couche.id1 INNER JOIN personnage on a_couche.id2 = personnage.id_personnage ;
-- nom et prenom des infidélitées entre couple marié
select (select prenom from personnage where id_personnage = marie_a.id1) as prenom1,
        (select (select nom from maison where id_maison = famille) from personnage where id_personnage = marie_a.id1) as nom1,
        (select prenom from personnage where id_personnage = marie_a.id2) as prenom2,
        (select (select nom from maison where id_maison = famille) from personnage where id_personnage = marie_a.id2) as nom2,
        (select prenom from personnage where id_personnage = a_couche.id1) as prenom1,
        (select (select nom from maison where id_maison = famille) from personnage where id_personnage = a_couche.id1) as nom1,
        (select prenom from personnage where id_personnage = a_couche.id2) as prenom2,
        (select (select nom from maison where id_maison = famille) from personnage where id_personnage = a_couche.id2) as nom2
        
         from marie_a inner join  a_couche on marie_a.id1 = a_couche.id1 and marie_a.id2 != a_couche.id2 
                                            or marie_a.id1 = a_couche.id2 and marie_a.id2 != a_couche.id1 
                                            or marie_a.id2 = a_couche.id2 and marie_a.id1 != a_couche.id1
                                            or marie_a.id2 = a_couche.id1 and marie_a.id1 != a_couche.id2;
-- nom et prenom des couples illegitimes 
select (select prenom from personnage where id_personnage = a_couche.id1) as prenom1,
        (select (select nom from maison where id_maison = famille) from personnage where id_personnage = a_couche.id1) as nom1,
        (select prenom from personnage where id_personnage = a_couche.id2) as prenom2,
        (select (select nom from maison where id_maison = famille) from personnage where id_personnage = a_couche.id2) as nom2
        from marie_a right join a_couche on marie_a.id1 = a_couche.id1 where marie_a.id1 is NULL;
-- nombre de membre de famille
select nom, (select count(*) from personnage where famille = id_maison) as nombre from maison order by nombre desc;
-- nombre d'allegeance par famille
select nom, (select count(*) from allegeance_maison where id_maison = maison.id_maison) as nombre from maison order by nombre desc;
-- nombre de membre par armee
select nom, (select count(*) from appartenance_armee where id_armee = armee.id_armee) as nombre from armee order by nombre desc;
-- nombre de camp par guerre
select id_guerre, nom, (select count(*) from armee_guerre  where id_guerre = guerre.id_guerre) as nombre_darmee from guerre order by nombre_darmee desc;
-- nombre de personne par guerre
select id_guerre,guerre.nom, count(*) as nombre_de_participant from guerre natural join armee_guerre natural join appartenance_armee group by id_guerre ;
-- select nombre de mort
select ((select prenom from personnage where id_personnage = tueur)) as prenom, (select (select nom from maison where id_maison = famille) from personnage where id_personnage = tueur) as nom, count(*) as a_tue from a_tue group by tueur;
-- select inceste
select (select prenom from personnage where id_personnage = id1) as prenom1, (select nom from maison where id_maison = (select famille from personnage where id_personnage = id1)) as nom1,
        (select prenom from personnage where id_personnage = id2) as prenom2, (select nom from maison where id_maison = (select famille from personnage where id_personnage = id2)) as nom2
        from a_couche 
        
        where (select id_pere from enfant_de where id_enfant = id1) like (select id_pere from enfant_de where id_enfant = id2)
        and (select id_mere from enfant_de where id_enfant = id1) like (select id_mere from enfant_de where id_enfant = id2)
 ;
 
-- select personnage sans acteur
select prenom, (select nom from maison where id_maison = famille) as nom from personnage where prenom_acteur is NULL and nom_acteur is NULL;


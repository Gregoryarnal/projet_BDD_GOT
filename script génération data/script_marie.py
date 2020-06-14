import os
import csv
import requests
from bs4 import BeautifulSoup
pages = ["https://gameofthrones.fandom.com/fr/wiki/Cat%C3%A9gorie:Personnages", "https://gameofthrones.fandom.com/fr/wiki/Catégorie:Personnages?from=Irri","https://gameofthrones.fandom.com/fr/wiki/Catégorie:Personnages?from=Rickard+Stark+%28Roi%29"
]
marie = open("marie.sql", "w")


cpt = 0
for page in pages:
    requete = requests.get(page)
    page = requete.content
    soup = BeautifulSoup(page)

    noms = soup.find_all("a", {"class": "category-page__member-link"})
    liste_nom = [elt.string.strip() for elt in noms]

    for nom_p in liste_nom:
        url = "https://gameofthrones.fandom.com/fr/wiki/"+nom_p
        requete_perso = requests.get(url)
        page_perso = requete_perso.content
        soup_perso = BeautifulSoup(page_perso)
        
        try:
            
            if not "(" in nom_p:

                try:
                    data_mariage = soup_perso.find("div", {"data-source": "Relation"})
                    mariage = data_mariage.find('div')

                    if "époux" in mariage.text or "épouse" in mariage.text:
                        data_brut = mariage.find('a').text  
                        data = data_brut.split(" ")
                        if len(data) == 1 :
                            prenom1 = data[0]
                            nom1 = ""
                        elif len(data) == 2 :
                            nom1 = data[1]
                            prenom1 = data[0]
                        elif len(data) > 2 : 
                            prenom1 = data[0] + " " + data[1]
                            nom1 = data[2]

                        
                        data2 = nom_p.split(" ")
                        if len(data2) == 1 :
                            prenom2 = data2[0]
                            nom2 = ""
                        elif len(data2) == 2 :
                            nom2 = data2[1]
                            prenom2 = data2[0]
                        elif len(data2) > 2 : 
                            prenom2 = data2[0] + " " + data2[1]
                            nom2 = data2[2]

                        if nom1 == "":
                            marie.write("INSERT INTO marie_a(id1, id2) VALUES ((select id_personnage from personnage where prenom like \"" +prenom1+ "\"), (select id_personnage from personnage where prenom like \"" +prenom2+ "\" and famille = (select id_maison from maison where nom like \"" + nom2 + "\")));\r\n")
                        elif nom2 == "":
                            marie.write("INSERT INTO marie_a(id1, id2) VALUES ((select id_personnage from personnage where prenom like \"" +prenom1+ "\" and famille = (select id_maison from maison where nom like \"" + nom1 + "\")), (select id_personnage from personnage where prenom like \"" +prenom2+ "\")));\r\n")
                        elif nom1 == "" and nom2 == "":
                            marie.write("INSERT INTO marie_a(id1, id2) VALUES ((select id_personnage from personnage where prenom like \"" +prenom1+ "\"), (select id_personnage from personnage where prenom like \"" +prenom2+ "\"));\r\n")
                        else :
                            marie.write("INSERT INTO marie_a(id1, id2) VALUES ((select id_personnage from personnage where prenom like \"" +prenom1+ "\" and famille = (select id_maison from maison where nom like \"" + nom1 + "\")), (select id_personnage from personnage where prenom like \"" +prenom2+ "\" and famille = (select id_maison from maison where nom like \"" + nom2 + "\")));\r\n")

                except Exception as e:
                    parents = "NULL"

        except Exception as e:
            print(e)
print("fin")
marie.close()





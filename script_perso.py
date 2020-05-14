import os
import csv
import requests
from bs4 import BeautifulSoup

pages = ["https://gameofthrones.fandom.com/fr/wiki/Cat%C3%A9gorie:Personnages", "https://gameofthrones.fandom.com/fr/wiki/Catégorie:Personnages?from=Irri","https://gameofthrones.fandom.com/fr/wiki/Catégorie:Personnages?from=Rickard+Stark+%28Roi%29"
]
armees= ["Compagnie Dorée", "Garde de Nuit", "Immaculés", "Moineaux", "Foi Militante", "Guet de Port-Réal", "Marcheur blanc", "Garde Royal"]

perso = open("personnage.sql", "w")
allegeance_famille = open("Allegeance_maison.sql", "w")
allegeance_camp = open("Allegeance_camp.sql", "w")
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
                    data_acteur = soup_perso.find("div", {"data-source": "Acteur"})
                    acteur = data_acteur.div.a.text
                except:
                    acteur = None

                try:
                    data_Allegeance = soup_perso.find("div", {"data-source": "Allégeance"})
                    data = data_Allegeance.find_all('a')
                    liste_data = [elt.string.strip() for elt in data]
                except:
                    Allegeance = "NULL"

                try:
                    data_mort = soup_perso.find("div", {"data-source": "Mort"})
                    mort = data_mort.div.a.text
                except:
                    mort = "NULL"


                try:
                    culture_data = soup_perso.find("div", {"data-source": "Culture"})
                    culture = culture_data.div.a.text
                except:
                    pass


                data = nom_p.split(" ")
                if not acteur == None :
                    acteur_data = acteur.split(" ")

                if len(acteur_data) == 1 :
                    prenom_acteur = acteur_data[0]
                elif len(acteur_data) == 2 :
                    prenom_acteur = acteur_data[1]
                    nom_acteur = acteur_data[0]
                elif len(acteur_data) > 2 : 
                    nom_acteur = acteur_data[1] + " " + acteur_data[2]
                    prenom_acteur = acteur_data[0]
                elif acteur == None:
                    nom_acteur = None
                    prenom_acteur = None
                

                if len(data) == 1:
                    prenom = data[0]
                    nom = ""
                elif len(data) == 2 :
                    nom = data[1]
                    prenom = data[0]
                else:
                    if data[1] == "I" or data[1] == "II"or data[1] == "III":
                        nom = data[2]
                        prenom = data[0] + " " + data[1]
                    else:
                        nom = data[1] + " " + data[2]
                        prenom = data[0]
                
                if nom == "" and nom_acteur != "" and prenom_acteur != "":
                    perso.write("INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation) values (\"" + prenom + "\", \"" + nom_acteur + "\", \"" + prenom_acteur + "\", \"" + mort + "\", (select id_civilisation from Civilisation where nom like \"" + culture + "\"));\r\n")
                elif nom == "" and nom_acteur == "" and prenom_acteur == "":
                    perso.write("INSERT INTO Personnage (prenom, mort, civilisation) values (\"" + prenom + "\",  \"" + mort + "\",(select id_civilisation from Civilisation where nom like \"" + culture + "\"));\r\n")
                elif nom != "" and acteur == None:
                    perso.write("INSERT INTO Personnage (nom, prenom,mort, civilisation) values (\"" + nom + "\", \"" + prenom + "\",  \"" + mort + "\", (select id_civilisation from Civilisation where nom like \"" + culture + "\"));\r\n")
                elif nom != "" and nom_acteur != "" and prenom_acteur!= "":  
                    perso.write("INSERT INTO Personnage (nom, prenom,  nom_acteur, prenom_acteur, mort, civilisation) values (\"" + nom + "\", \"" + prenom + "\", \"" + nom_acteur + "\", \"" + prenom_acteur + "\", \"" + mort + "\", (select id_civilisation from Civilisation where nom like \"" + culture + "\"));\r\n")
                prenom_acteur = ""
                nom_acteur = ""

                for data in liste_data:
                    if data.startswith("Maison"):
                        allegeance_famille.write("INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where nom like \""+nom+"\" and prenom like  \""+prenom+"\"), (select id_maison from Maison where nom like \""+data[7:]+"\"));\r\n")
                    else:
                        allegeance_camp.write("INSERT INTO Allegeance_camp (id_personnage, id) values ((select id_personnage from personnage where nom like \""+nom+"\" and prenom like  \""+prenom+"\"), \""+data+"\");\r\n")

                print(cpt)
                cpt += 1
        except Exception as e:
            print(e)
print("fin")
perso.close()
allegeance_famille.close()
allegeance_camp.close()
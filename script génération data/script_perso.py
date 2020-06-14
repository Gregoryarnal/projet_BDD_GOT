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
enfant_de = open("enfant_de.sql", "w")
batard = open("batard.sql", "w")
persoliste = open("persos.txt","w")

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
                    data_parents = soup_perso.find("div", {"data-source": "Parents"})
                    parents = data_parents.find('div')
                    
                    if "père" in parents.text and "mère" in parents.text:
                        data_parent = parents.find_all('a')  
                        liste_parents = [elt.string.strip() for elt in data_parent]

                    elif "père" in parents.text:
                        pere = parents.a.text.split(" ")
                        mere = "NULL"
                        liste_parents = None
                    else:
                        mere = parents.a.text.split(" ")
                        pere = "NULL"
                        liste_parents = None


                except Exception as e:
                    parents = "NULL"

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
                    data_origine = soup_perso.find("div", {"data-source": "Origine"})
                    origine = data_origine.div.a.text
                except:
                    mort = "NULL"

                try:
                    data_app = soup_perso.find("div", {"data-source": "Nbr. Apparition"})
                    
                    if "épisodes" in data_app.div.text:
                        apparition = data_app.div.text.split(" ")[0]
                    else:
                        apparition = 0
                except:
                    apparition = 0


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
                    if data[1] == "I" or data[1] == "II"or data[1] == "III" or data[1] == "IV" or data[1] == "V":
                        nom = data[2]
                        prenom = data[0] + " " + data[1]
                    else:
                        nom = data[1] + " " + data[2]
                        prenom = data[0]
                
                if nom == "" and nom_acteur != "" and prenom_acteur != "":
                    perso.write("INSERT INTO Personnage (prenom, nom_acteur, prenom_acteur, mort, civilisation, origine, Nbr_Apparition) values (\"" + prenom + "\", \"" + nom_acteur + "\", \"" + prenom_acteur + "\", \"" + mort + "\", (select id_civilisation from Civilisation where nom like \"" + culture + "\"), (select id_ville from ville where nom like \"" + origine + "\"), " + str(apparition) + ");\r\n")
                elif nom == "" and nom_acteur == "" and prenom_acteur == "":
                    perso.write("INSERT INTO Personnage (prenom, mort, civilisation, origine, Nbr_Apparition) values (\"" + prenom + "\",  \"" + mort + "\",(select id_civilisation from Civilisation where nom like \"" + culture + "\"),(select id_ville from ville where nom like \"" + origine + "\"), " + str(apparition) + ");\r\n")
                elif nom != "" and acteur == None:
                    perso.write("INSERT INTO Personnage (famille, prenom,mort, civilisation, origine,Nbr_Apparition) values ((select id_maison from maison where nom like \"" + nom + "\"), \"" + prenom + "\",  \"" + mort + "\", (select id_civilisation from Civilisation where nom like \"" + culture + "\"), (select id_ville from ville where nom like \"" + origine + "\"), " + str(apparition) + ");\r\n")
                elif nom != "" and nom_acteur != "" and prenom_acteur!= "":  
                    perso.write("INSERT INTO Personnage (famille, prenom,  nom_acteur, prenom_acteur, mort, civilisation, origine, Nbr_Apparition) values ((select id_maison from maison where nom like \"" + nom + "\"), \"" + prenom + "\", \"" + nom_acteur + "\", \"" + prenom_acteur + "\", \"" + mort + "\", (select id_civilisation from Civilisation where nom like \"" + culture + "\"), (select id_ville from ville where nom like \"" + origine + "\"), " + str(apparition) + ");\r\n")
                prenom_acteur = ""
                nom_acteur = ""
                
                print(cpt)
                cpt += 1

                for data in liste_data:
                    if data.startswith("Maison"):
                        allegeance_famille.write("INSERT INTO Allegeance_maison (id_personnage, id_maison) values ((select id_personnage from personnage where prenom like  \""+prenom+"\" and famille = (select id_maison from maison where nom like \""+nom+"\")), (select id_maison from Maison where nom like \""+data[7:]+"\"));\r\n")
                    else:
                        allegeance_camp.write("INSERT INTO Allegeance (id_personnage, id) values ((select id_personnage from personnage where prenom like  \""+prenom+"\" and famille = (select id_maison from maison where nom like \""+nom+"\")), \""+data+"\");\r\n")

                if liste_parents is not None:
                    pere = liste_parents[0].split(" ")
                    mere = liste_parents[1].split(" ")


                if pere is not "NULL":
                    if len(pere) == 1:
                        prenom_pere = pere[0]
                        nom_pere = ""
                    elif len(pere) == 2 :
                        if pere[1] == "I" or pere[1] == "II"or pere[1] == "III" or pere[1] == "IV" or pere[1] == "V":
                            prenom_pere = pere[0] + " " + pere[1]
                            nom_pere = "NULL"
                        else:
                            nom_pere = pere[1]
                            prenom_pere = pere[0]
                    else:
                        if pere[1] == "I" or pere[1] == "II"or pere[1] == "III" or pere[1] == "IV" or pere[1] == "V":
                            nom_pere = pere[2]
                            prenom_pere = pere[0] + " " + pere[1]
                        else:
                            nom_pere = pere[1] + " " + pere[2]
                            prenom_pere = pere[0]

                if mere is not "NULL":  
                    if len(mere) == 1:
                        prenom_mere = mere[0]
                        nom_mere = ""
                    elif len(mere) == 2 :
                        nom_mere = mere[1]
                        prenom_mere = mere[0]
                    else:
                        if mere[1] == "I" or mere[1] == "II"or mere[1] == "III" or mere[1] == "IV" or mere[1] == "V":
                            nom_mere = mere[2]
                            prenom_mere = mere[0] + " " + mere[1]
                        else:
                            nom_mere = mere[1] + " " + mere[2]
                            prenom_mere = mere[0]

                if mere is not "NULL" and pere is not "NULL" and :
                    enfant_de.write("INSERT INTO Enfant_de (id_enfant, id_mere, id_pere) values ((select id_personnage from personnage where prenom like \""+prenom+"\" and famille = (select id_maison from maison where nom like \""+nom+"\")), (select id_personnage from personnage where prenom like \""+prenom_mere+"\" and famille = (select id_maison from maison where nom like \""+nom+"\")), (select id_personnage from personnage where prenom like \""+prenom_pere+"\" and famille = (select id_maison from maison where nom like \""+nom+"\")));\r\n")
                    if nom_mere != nom_pere:
                        batard.write("INSERT INTO Batard (id_batard, famille1, famille2) values ((select id_personnage from personnage where prenom like \""+prenom+"\" and famille = (select id_maison from maison where nom like \""+nom+"\")),(select id_maison from maison where nom like \""+nom_mere+"\"),(select id_maison from maison where nom like \""+nom_pere+"\")));\r\n")

        except Exception as e:
            print(e)
print("fin")
perso.close()
allegeance_famille.close()
allegeance_camp.close()
enfant_de.close()




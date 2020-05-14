import os
import csv
import requests
from bs4 import BeautifulSoup

pages = ["https://gameofthrones.fandom.com/fr/wiki/Cat%C3%A9gorie:Personnages", "https://gameofthrones.fandom.com/fr/wiki/Catégorie:Personnages?from=Irri","https://gameofthrones.fandom.com/fr/wiki/Catégorie:Personnages?from=Rickard+Stark+%28Roi%29"
]

cpt = 0
for page in pages:
    requete = requests.get(page)
    page = requete.content
    soup = BeautifulSoup(page)

    cultures = ["Andals", "Valyriens", "Dothrakis", "Fer-n%C3%A9s", "Nordiens", "Peuple libre", "Premiers Hommes" , "Thenns", "Tribus des Collines" ]


    nom = soup.find_all("a", {"class": "category-page__member-link"})
    liste_nom = [elt.string.strip() for elt in nom]

    for i in range (0,len(liste_nom)):

        requete_perso = requests.get("https://gameofthrones.fandom.com/fr/wiki/"+liste_nom[i])
        page_perso = requete_perso.content
        soup_perso = BeautifulSoup(page_perso)
        
        try:
            try:
                data_acteur = soup_perso.find("div", {"data-source": "Acteur"})
                acteur = data_acteur.div.a.text
                print(acteur)
            except:
                pass
            
            culture_data = soup_perso.find("div", {"data-source": "Culture"})
            culture = culture_data.div.a.text

           
        except Exception as e:
            print(e)
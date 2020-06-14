import os
import csv
import requests
from bs4 import BeautifulSoup


requete = requests.get("https://gameofthrones.fandom.com/fr/wiki/Catégorie:Maisons_par_statut")
page = requete.content
soup = BeautifulSoup(page)
nom = soup.find_all("a", {"class": "category-page__member-link"})
pages = [elt.string.strip() for elt in nom]
f = open("maison.txt", "a")

for page in pages:
    requete_perso = requests.get("https://gameofthrones.fandom.com/fr/wiki/"+page)
    page_perso = requete_perso.content
    soup_perso = BeautifulSoup(page_perso)
    noms = soup_perso.find_all("a", {"class": "category-page__member-link"})
    familles = [elt.string.strip() for elt in noms]

    for famille in familles:
        if famille.startswith("Maison"):
          f.write("INSERT INTO Famille (nom) values (\""+famille[7:]+"\");\r\n")
f.close()
import os
import csv
import requests
from bs4 import BeautifulSoup


requete = requests.get("https://gameofthrones.fandom.com/fr/wiki/Catégorie:Châteaux")
page = requete.content
soup = BeautifulSoup(page)
nom = soup.find_all("a", {"class": "category-page__member-link"})
Chateaux = [elt.string.strip() for elt in nom]
f = open("chateau.sql", "w")

for Chateau in Chateaux:
    requete_perso = requests.get("https://gameofthrones.fandom.com/fr/wiki/"+Chateau)
    page_perso = requete_perso.content
    soup_perso = BeautifulSoup(page_perso)
    noms = soup_perso.find_all("a", {"class": "category-page__member-link"})
    familles = [elt.string.strip() for elt in noms]

    try:
        data_lieu = soup_perso.find("div", {"data-source": "Localisation"})
        lieu = data_lieu.div.a.text
        print(lieu)
    except:
        acteur = None
    
    try:
        data_gouv = soup_perso.find("div", {"data-source": "Gouvernement"})
        gouv = data_gouv.div.a.text
        print(gouv)
    except:
        acteur = None

    if gouv.startswith("Maison"):
        f.write("INSERT INTO chateau (nom, lieu, maison ) values (\""+Chateau+"\", (select id_region from region where nom like \""+lieu+"\"), (select id_maison from maison where nom like \""+gouv[7:]+"\"));\r\n")
    else:
        f.write("INSERT INTO chateau (nom, lieu, maison ) values (\""+Chateau+"\", (select id_region from region where nom like \""+lieu+"\"), (select id_maison from maison where nom like \""+gouv+"\"));\r\n")

f.close()
import os
import csv
import requests
from bs4 import BeautifulSoup


requete = requests.get("https://gameofthrones.fandom.com/fr/wiki/Catégorie:Guerres")
page = requete.content
soup = BeautifulSoup(page)
nom = soup.find_all("a", {"class": "category-page__member-link"})
guerres = [elt.string.strip() for elt in nom]
print(guerres)
f = open("guerre.sql", "w")

for guerre in guerres:
    requete_perso = requests.get("https://gameofthrones.fandom.com/fr/wiki/"+guerre)
    page_perso = requete_perso.content
    soup_perso = BeautifulSoup(page_perso)

    try:
        data_lieu = soup_perso.find("div", {"data-source": "lieu"})
        lieu = data_lieu.div.a.text
        print(lieu)
    except:
        pass

    f.write("INSERT INTO Guerre (nom, id_lieu, dirigeant) values (\""+guerre+"\", (select id_lieu from Lieu where nom like \""+lieu+"\"));\r\n")

f.close()


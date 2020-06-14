import os
import csv
import requests
from bs4 import BeautifulSoup


requete = requests.get("https://gameofthrones.fandom.com/fr/wiki/Cat%C3%A9gorie:Guerres")
page = requete.content
soup = BeautifulSoup(page)
nom = soup.find_all("a", {"class": "category-page__member-link"})
guerres = [elt.string.strip() for elt in nom]

f = open("guerre.sql", "w")

for guerre in guerres:
    requete_perso = requests.get("https://gameofthrones.fandom.com/fr/wiki/"+guerre)
    page_perso = requete_perso.content
    soup_perso = BeautifulSoup(page_perso)

    try:
        data_lieu = soup_perso.find("div", {"data-source": "lieu"})
        lieu = data_lieu.div.a.text
     
    except:
        pass

    try:
        data_deb = soup_perso.find("div", {"data-source": "début"})
        debut = data_deb.div.text
        if  "An" in data_deb.div.text:
            if debut.endswith("[1]"):
                deb = data_deb.div.text[3:]
                debut = deb[:len(deb)-3]
            else:
                debut = data_deb.div.text[3:]
        if "(avant la Conquête)" in data_deb.div.text:
            debut =  "-"+data_deb.div.text[:len(data_deb.div.text)-len("(avant la Conquête)")-1].replace(" ","")

            

    except Exception as e:
        print(e)

    try:
        data_fin = soup_perso.find("div", {"data-source": "fin"})
        fin = data_fin.div.text
        if  "An" in data_fin.div.text:
            if fin.endswith("[1]"):
                fi = data_fin.div.text[3:]
                fin = fi[:len(fi)-3]
            else:
                fin = data_fin.div.text[3:]
        if "(avant la Conquête)" in data_fin.div.text:
            fin =  "-"+data_fin.div.text[:len(data_fin.div.text)-len("(avant la Conquête)")-1].replace(" ","")
    except Exception as e:
        pass

    f.write("INSERT INTO Guerre (nom, id_lieu, dirigeant,annee_deb , annee_fin) values (\""+guerre+"\", (select id_region from region where nom like \""+lieu+"\"),\""+debut+"\",\""+fin+"\");\r\n")

f.close()


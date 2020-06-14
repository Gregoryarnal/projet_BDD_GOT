from random import *

villes = ["Ancienne Valyria","Asshaï","Astapor","Blancport","Braavos", "Durlieu","Gué-Cabot" , "La Mole" , "Meereen", "Pentos", "Port-Lannis", "Port-Réal", "Qarth","Salins", "Vaes Dothrak", "Ville d'hiver", "Villevieille","Volantis","Yunkaï"]

deplacement = open("deplacement.sql", "w")

for i in range (0, 300):
    perso = randint(20,500)
    fin = randint(2,20)
    for i in range(0,fin):
        ville = randint(0,len(villes)-1)
        dest = randint(0,len(villes)-1)
        while ville == dest:
            dest = randint(0,len(villes)-1)
        deplacement.write("INSERT INTO deplacement (id_personnage, id_ville_dep, id_ville_dest) VALUES (" + str(perso) + ",(select id_ville from ville where nom like \"" + villes[ville] + "\"),(select id_ville from ville where nom like \"" + villes[dest] + "\"));\r\n")
for i in range(0,15):
    perso = 94
    ville = randint(0,len(villes)-1)
    dest = randint(0,len(villes)-1)
    while ville == dest:
        dest = randint(0,len(villes)-1)
    deplacement.write("INSERT INTO deplacement (id_personnage, id_ville_dep, id_ville_dest) VALUES (" + str(perso) + ",(select id_ville from ville where nom like \"" + villes[ville] + "\"),(select id_ville from ville where nom like \"" + villes[dest] + "\"));\r\n")
    
deplacement.close
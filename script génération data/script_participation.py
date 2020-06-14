from random import *

participation = open("data/participation.sql", "w")
participation_armee = open("data/participation_guerre.sql", "w")
for i in range (0, 300):
    perso = randint(20,500)
    guerre = randint(1, 24)
    fin = randint(1,2)
    for i in range(0,fin):
        armee = randint(1,8)
        participation.write("INSERT INTO appartenance_armee (id_personnage, id_armee) VALUES (" + str(perso) + "," + str(armee) + ");\r\n")
       
for guerre in range(1, 25):
    perso = randint(20,500)
    fin = randint(1,9)
    for i in range(0,fin):
        armee = randint(1,8)
        participation_armee.write("INSERT INTO armee_guerre (id_guerre, id_armee) VALUES (" + str(guerre) + "," + str(armee) + ");\r\n")

participation.close
participation_armee.close()
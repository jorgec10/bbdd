# -*- coding: utf-8 -*-
import random

countries_list = [ "Brasil",
"México",
"Argentina",
"Colombia",
"Venezuela",
"Perú",
"Chile",
"Ecuador",
"República Dominicana",
"Guatemala",
"Costa Rica Uruguay",
"Bolivia",
"Panamá",
"El salvador",
"Paraguay",
"Honduras",
"Nicaragua",
"Haití",
"El Congo",
"Somalia"]

objectives_list = [
    "Conseguir ayudas sociales para los más desfavorecidos",
    "Construir escuelas",
    "Garantizar la correcta alimentación de los niños",
    "Construir refugios para animales",
    "Protegere las zonas con fauna en riesgo de extinción",
    "Promover políticas de conservación de la flora",
    "Construir hospitales"
]

regions = ["Norte", "Sur", "Este", "Oeste"]

for x in range(20):
    random_ong = random.randint(0,10)
    random_objective = random.choice(objectives_list)
    random_region = random.choice(regions)
    random_benef = random.randint(1, 1000)
    if random_ong < 10:
        print "\'00" + str(random_ong) + "\', \'" + str(x+1) + "\', \'" + random_objective + "\', \'" + countries_list[x] + "\', \'" + \
              random_region + "\', " + str(random_benef)
    elif random_ong == 10:
        print "\'0" + str(random_ong) + "\', \'" + str(x + 1) + "\', \'" + random_objective + "\', \'" + \
              countries_list[x] + "\', \'" + \
              random_region + "\', " + str(random_benef)
#Not finished

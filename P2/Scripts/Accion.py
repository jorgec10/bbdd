# -*- coding: utf-8 -*-
import random

action_list = ["Vacunar niños sin recursos", "Crear escuelas", "Alimentar a los malnutridos", "Proteger derechos de los niños",
               "Conservación y uso sostenible de los bosques", "Protección de los océanos", "Restauración de ríos y humedales",
               "Conservación de las grandes especies de la fauna", "Repatriación voluntaria de refugiados",
               "Actividades para personas mayores y sus cuidadores", "Promover una educación de calidad"]
for x in range(20):
    random_ong = random.randint(0,10)
    random_project = random.randint(0,20)
    random_desc = random.choice(action_list)

    if random_ong < 10 and random_project < 10:
        print "00" + str(random_ong) + " " + "00" + str(random_project) +" " + "00" + str(x + 1) + " " + random_desc
    elif random_ong == 10 and random_project < 10:
        print "0" + str(random_ong) + " " + "00" + str(random_project) + " " + "00" + str(x + 1) + " " + random_desc
    elif random_ong == 10 and random_project >= 10:
        print "0" + str(random_ong) + " " + "0" + str(random_project) + " " + "00" + str(
        x + 1) + " " + random_desc
    elif random_ong == 10 and random_project >= 10:
        print "0" + str(random_ong) + " " + "0" + str(random_project) + " " + "0" + str(
        x + 1) + " " + random_desc
    elif random_ong < 10 and random_project >= 10:
        print "00" + str(random_ong) + " " + "0" + str(random_project) + " " + "00" + str(
        x + 1) + " " + random_desc
    elif random_ong < 10 and random_project >= 10:
        print "00" + str(random_ong) + " " + "0" + str(random_project) + " " + "0" + str(
        x + 1) + " " + random_desc
    elif random_ong < 10 and random_project < 10:
        print "00" + str(random_ong) + " " + "00" + str(random_project) +" " + "0" + str(x + 1) + " " + random_desc
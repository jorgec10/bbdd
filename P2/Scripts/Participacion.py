import random

dni_list = ["53085816F", "89854340Y", "97136258G", "15648049K", "94597124Q", "40302552M", "95068214D", "17939291M",
            "59090793H", "28953191K", "17853689E", "43933633L", "87581438A", "60059217K", "91796428F", "11297456C",
            "22943015C", "56860801Q", "66379861V", "21089946N", "81951718J", "54091927E", "96443853J", "15373625Z",
            "80947268P", "34215946K", "30014495A", "36134735E", "12856403L", "24742111H", "85264926G", "88628841S",
            "61547353L", "39598800A", "19492023A", "90999122F", "65438356X", "83388630S", "44404594X", "92820364G",
            "74003730Y", "27712446F", "25777945L", "67698962C", "98308213B", "47701880B", "37412716G", "47144137T",
            "21747544Q", "50217419Q"]

for x in range(50):
    random_ong = random.randint(0,10)
    random_project = random.randint(0,20)
    random_action = random.randint(0,20)
    if random_ong < 10 and random_project < 10 and random_action < 10:
        print "VALUES (" + "\'00" + str(random_ong) + "\', \'" + "00" + str(random_project) + "\', \'" + "00" + str(
            random_action) + "\', \'" + str(dni_list[x]) + "\'" + ");"
    elif random_ong == 10 and random_project < 10 and random_action < 10:
        print "VALUES (" +  "\'0" + str(random_ong) + "\', \'" + "00" + str(random_project) + "\', \'" + "00" + str(
            random_action) + "\', \'" + str(dni_list[x]) + "\'" + ");"
    elif random_ong == 10 and random_project >= 10 and random_action < 10:
        print "VALUES (" +   "\'0" + str(random_ong) + "\', \'" + "0" + str(random_project) + "\', \'" + "00" + str(
            random_action) + "\', \'" + str(dni_list[x]) + "\'" + ");"
    elif random_ong == 10 and random_project >= 10 and random_action >= 10:
        print "VALUES (" +   "\'0" + str(random_ong) + "\', \'" + "0" + str(random_project) + "\', \'" + "0" + str(
            random_action) + "\', \'" + str(dni_list[x]) + "\'" + ");"
    elif random_ong < 10 and random_project >= 10 and random_action < 10:
        print "VALUES (" +   "\'00" + str(random_ong) + "\', \'" + "0" + str(random_project) + "\', \'" + "00" + str(
            random_action) + "\', \'" + str(dni_list[x]) + "\'" + ");"
    elif random_ong < 10 and random_project >= 10 and random_action >= 10:
        print "VALUES (" +   "\'00" + str(random_ong) + "\', \'" + "0" + str(random_project) + "\', \'" + "0" + str(
            random_action) + "\', \'" + str(dni_list[x]) + "\'" + ");"
    elif random_ong < 10 and random_project < 10 and random_action >= 10:
        print "VALUES (" +   "\'00" + str(random_ong) + "\', \'" + "00" + str(random_project) + "\', \'" + "0" + str(
            random_action) + "\', \'" + str(dni_list[x]) + "\'" + ");"
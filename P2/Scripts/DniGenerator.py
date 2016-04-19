import random

char_list = [ "T","R","W","A","G","M","Y","F","P","D","X","B","N","J","Z","S","Q","V","H","L","C","K","E" ]


for x in range(50):
    dni = random.randint(10000000, 99999999)
    letra = random.choice(char_list)
    print '"' + str(dni) + letra + '"' + ",",

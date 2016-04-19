from datetime import date
import random
for x in range(50):
    start_date = date.today().replace(year=2011, day=1, month=1).toordinal()
    end_date = date.today().replace(year=2015, day=31, month=12).toordinal()
    random_day = date.fromordinal(random.randint(start_date, end_date))
    random_qtty = random.uniform(0.0, 10000.0)
    random_ong = random.randint(0, 10)
    random_sonsio = random.randint(0, 10)
    if random_ong < 10 and random_sonsio < 10:
        print 'VALUES(' + "\'00" + str(random_ong) + "\', \'" + "00" + str(random_sonsio) + "\' TO_DATE(\'" + random_day.strftime(
            "%d/%m/%Y") + "\', \'dd/mm/yyyy\'), " + str("%.2f" % random_qtty) + ');'
    elif random_ong == 10 and random_sonsio < 10:
        print 'VALUES(' + "\'0" + str(random_ong) + "\', \'" + "00" + str(
            random_sonsio) + "\' TO_DATE(\'" + random_day.strftime(
                "%d/%m/%Y") + "\', \'dd/mm/yyyy\'), " + str("%.2f" % random_qtty) + ');'
    elif random_ong == 10 and random_sonsio == 10:
        print 'VALUES(' + "\'0" + str(random_ong) + "\', \'" + "0" + str(
            random_sonsio) + "\' TO_DATE(\'" + random_day.strftime(
                "%d/%m/%Y") + "\', \'dd/mm/yyyy\'), " + str("%.2f" % random_qtty) + ');'
    else:
        print 'VALUES(' + "\'00" + str(random_ong) + "\', \'" + "0" + str(
            random_sonsio) + "\' TO_DATE(\'" + random_day.strftime(
                "%d/%m/%Y") + "\', \'dd/mm/yyyy\'), " + str("%.2f" % random_qtty) + ');'
from datetime import date
import random
for x in range(50):
    start_date = date.today().replace(year=1970, day=1, month=1).toordinal()
    end_date = date.today().replace(year=1980, day=31, month=12).toordinal()
    random_day = date.fromordinal(random.randint(start_date, end_date))
    print random_day.strftime("%d/%m/%Y")

#!/usr/local/bin/python3

import names
import random

with open('players.txt', 'w') as f:
    for index in range(10000, 50000):
        print(index)
        f.write(f"insert into PlayerTest (PlayerID, FirstName, LastName, Birthdate, MarketValue, ManagerID, ClubID) values ({index}, '{names.get_first_name()}', '{names.get_last_name()}', '{random.randint(1980,2001)}-{random.randint(1,12)}-{random.randint(1,28)}', {random.randint(50000,100000000)}, {random.randint(1, 30)}, {random.randint(1, 30)});\n")
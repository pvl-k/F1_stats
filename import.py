import pandas as pd
from sqlalchemy import create_engine
from zipfile import ZipFile
from urllib import request


def csv2sql(filename):
    df = pd.read_csv(filename)
    df.to_sql(filename[:-4], conn, if_exists='replace', index=False)

files =    ['circuits.csv',
            'constructor_results.csv',
            'constructor_standings.csv',
            'constructors.csv',
            'driver_standings.csv',
            'drivers.csv',
            'lap_times.csv',
            'pit_stops.csv',
            'qualifying.csv',
            'races.csv',
            'results.csv',
            'seasons.csv',
            'sprint_results.csv',
            'status.csv']

remote_url = 'http://ergast.com/downloads/f1db_csv.zip'
local_file = '/home/pvlk/f1stats/f1db_csv.zip'
request.urlretrieve(remote_url, local_file)

with ZipFile('f1db_csv.zip', 'r') as zipObj:
   zipObj.extractall()

with open('mysql_user.txt', 'r', encoding='utf-8') as fp:
    mysql_user = fp.read().rstrip()

with open('mysql_password.txt', 'r', encoding='utf-8') as fp:
    mysql_password = fp.read().rstrip()

with open('mysql_base.txt', 'r', encoding='utf-8') as fp:
    mysql_base = fp.read().rstrip()

conn_url = 'mysql://' + mysql_user + ':' + mysql_password + '@' + mysql_base
conn = create_engine(conn_url)

for i in files:
    csv2sql(i)

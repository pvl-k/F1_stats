import pandas as pd
from sqlalchemy import create_engine
from zipfile import ZipFile
from urllib import request


def csv2sql(filename):
    df = pd.read_csv(filename)
    df.to_sql(filename[:-4], conn, if_exists='replace', index=False)

files =    ['circuits.csv',
            'seasons.csv',
            'constructors.csv',
            'drivers.csv',
            'races.csv',
            'status.csv',
            'constructor_results.csv',
            'constructor_standings.csv',
            'driver_standings.csv',
            'lap_times.csv',
            'pit_stops.csv',
            'qualifying.csv',
            'results.csv',
            'sprint_results.csv']

remote_url = 'http://ergast.com/downloads/f1db_csv.zip'
local_file = 'f1db_csv.zip'
request.urlretrieve(remote_url, local_file)
print('Downloading of remote file finished...')

with ZipFile('f1db_csv.zip', 'r') as zipObj:
   zipObj.extractall()
print('Unpacking of the downloaded file finished...')

with open('db_user.txt', 'r', encoding='utf-8') as fp:
    db_user = fp.read().rstrip()

with open('db_user_password.txt', 'r', encoding='utf-8') as fp:
    db_user_password = fp.read().rstrip()

with open('hostname.txt', 'r', encoding='utf-8') as fp:
    hostname = fp.read().rstrip()

conn_url = 'postgresql://' + db_user + ':' + db_user_password + '@' + hostname
conn = create_engine(conn_url)

for i in files:
    print(f'Loading of file "{i}" into DB...')
    csv2sql(i)
    print(f'Loading of file "{i}" into DB finished.')

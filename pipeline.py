import pandas as pd
from sqlalchemy import create_engine
from zipfile import ZipFile
from urllib import request


def csv2sql(filename):
    df = pd.read_csv(filename)
    df.to_sql(filename[:-4], conn, if_exists='replace', index=False)

files =    ['constructors.csv',
            'circuits.csv',
            'drivers.csv',
            'seasons.csv',
            'races.csv',
            'constructor_results.csv',
            'constructor_standings.csv',
            'driver_standings.csv',
            'lap_times.csv',
            'pit_stops.csv',
            'qualifying.csv',
            'results.csv',
            'sprint_results.csv',
            'status.csv']

remote_url = 'http://ergast.com/downloads/f1db_csv.zip'
local_file = 'f1db_csv.zip'
print('Downloading of remote file...', end='')
request.urlretrieve(remote_url, local_file)
print('finished.')

print('Unpacking of the downloaded file...', end='')
with ZipFile('f1db_csv.zip', 'r') as zipObj:
   zipObj.extractall()
print('finished.')

with open('db_user.txt', 'r', encoding='utf-8') as fp:
    db_user = fp.read().rstrip()

with open('db_user_password.txt', 'r', encoding='utf-8') as fp:
    db_user_password = fp.read().rstrip()

with open('hostname.txt', 'r', encoding='utf-8') as fp:
    hostname = fp.read().rstrip()

conn_url = 'postgresql://' + db_user + ':' + db_user_password + '@' + hostname
conn = create_engine(conn_url)

for i in files:
    print(f'Loading of file "{i}" into DB...', end='')
    csv2sql(i)
    print('finished.')

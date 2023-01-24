import pandas as pd
from sqlalchemy import create_engine
from zipfile import ZipFile
from urllib import request
from prefect import flow, task
import os

# os.chdir(r'.')
# os.listdir()

with open('credentials/db_user.txt', 'r', encoding='utf-8') as fp:
    db_user = fp.read().rstrip()
with open('credentials/db_user_password.txt', 'r', encoding='utf-8') as fp:
    db_user_password = fp.read().rstrip()
with open('credentials/hostname.txt', 'r', encoding='utf-8') as fp:
    hostname = fp.read().rstrip()

@task()
def exctract_data(url: str, zipfile: str):
    request.urlretrieve(url, zipfile)
    with ZipFile(zipfile, 'r') as zipObj:
        zipObj.extractall('files')

@task()
def create_dataframes(filenames):
    for file in filenames:
        pd.read_csv(f'files/{file}').to_sql(file[:-4], conn, if_exists='replace', index=False)
        # print(file)
        # file = pd.read_csv(f'files/{file}')
        # file.to_sql(file, conn, if_exists='replace', index=False)
        # print(file)
        # {file[:-4]}.to_sql(file[:-4], conn, if_exists='replace', index=False)

# @task()
# def load_data(filenames):
#     for file in filenames:
#         # {file[:-4]}.to_sql(file[:-4], conn, if_exists='replace', index=False)
#         file.to_sql('file', conn, if_exists='replace', index=False)


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

conn_url = 'postgresql://' + db_user + ':' + db_user_password + '@' + hostname
conn = create_engine(conn_url)
url = 'http://ergast.com/downloads/f1db_csv.zip'
local_file = 'files/f1db_csv.zip'


@flow
def main_flow():
    url = 'http://ergast.com/downloads/f1db_csv.zip'
    local_file = 'files/f1db_csv.zip'
    exctract_data(url, local_file)
    create_dataframes(files)
    # load_data(files)

if __name__ == '__main__':
    # main_flow('http://ergast.com/downloads/f1db_csv.zip', 'f1db_csv.zip', ['constructors.csv', 'circuits.csv', 'drivers.csv', 'seasons.csv', 'races.csv', 'constructor_results.csv', 'constructor_standings.csv', 'driver_standings.csv', 'lap_times.csv', 'pit_stops.csv', 'qualifying.csv', 'results.csv', 'sprint_results.csv', 'status.csv'])
    main_flow()

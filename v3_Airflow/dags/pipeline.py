
# user postgres
# password :;k~/\>}Gxh8'(?|

from airflow.models import DAG
from airflow.operators.python_operator import PythonOperator
from sqlalchemy import create_engine
from zipfile import ZipFile
from urllib import request
import pandas as pd
from datetime import datetime, timedelta

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

db_user = 'postgres'
db_user_password = ':;k~/\>}Gxh8'(?|'
hostname = '10.70.240.3'

# conn_url = 'postgresql://' + db_user + ':' + db_user_password + '@' + hostname
# conn_url = my-second-project-381711:us-central1:f1-postgres
conn_url = "postgresql://postgres::;k~/\>}Gxh8'(?|@10.70.240.3"
conn = create_engine(conn_url)
url = 'http://ergast.com/downloads/f1db_csv.zip'
local_file = '/home/airflow/gcs/data/f1db_csv.zip'

default_args = {
    'owner': 'airflow',
    'start_date': datetime(2023, 1, 1),
    'email': ['example@example.com'],
    'email_on_failure': False,
    'email_on_retry': False,
    'retries': 1,
    'retry_delay': timedelta(minutes=5)
    }

main_dag = DAG('main_dag',
        description='Main DAG',
        default_args=default_args,
        schedule_interval='0 3 * * *',
        catchup=False
        )

def exctract_data(url: str, local_file: str):
    """Extract data from URL and create DataFrames"""
    request.urlretrieve(url, local_file)
    with ZipFile(local_file, 'r') as zipObj:
        zipObj.extractall('/home/airflow/gcs/data/')

def load_data(files):
    """Load DataFrames to Tables"""
    for file in files:
        pd.read_csv(f'/home/airflow/gcs/data/{file}').to_sql(file[:-4], conn, if_exists='replace', index=False)

exctract_data_task = PythonOperator (
    task_id = 'exctract_data_task',
    python_callable = exctract_data,
    op_kwargs={'url':url, 'local_file':local_file},
    dag = main_dag
)

load_data_task = PythonOperator (
    task_id = 'load_data_task',
    python_callable = load_data,
    op_kwargs={'files':files},
    dag = main_dag    
)

exctract_data_task >> load_data_task

FROM prefecthq/prefect:2.7.7-python3.9

COPY prefect-requirements.txt . 

RUN pip install -r prefect-requirements.txt --trusted-host pypi.python.org --no-cache-dir
RUN mkdir -p /opt/prefect/flows/credentials/ /opt/prefect/flows/files

COPY pipeline_prefect.py /opt/prefect/flows/pipeline_prefect.py
COPY /cred /opt/prefect/flows/credentials/

WORKDIR /opt/prefect/flows/

RUN prefect deployment build flows/pipeline_prefect.py:main_flow -n etl_f1_stats --cron "0 23 * * 4-7" -a

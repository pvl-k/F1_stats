FROM prefecthq/prefect:2.7.7-python3.9

COPY prefect-requirements.txt . 

RUN pip install -r prefect-requirements.txt --trusted-host pypi.python.org --no-cache-dir
RUN mkdir -p /opt/prefect/flows/credentials/ /opt/prefect/flows/files

COPY pipeline_prefect.py /opt/prefect/flows/pipeline_prefect.py
COPY /cred /opt/prefect/flows/credentials/

WORKDIR /opt/prefect/flows/
# COPY pipeline.py pipeline.py
# COPY hostname.txt hostname.txt
# COPY db_user.txt db_user.txt
# COPY db_user_password.txt db_user_password.txt

# ADD init.sql /docker-entrypoint-initdb.d/init.sql
# RUN chown -R postgres:postgres /docker-entrypoint-initdb.d/ && \
#     apt-get update && \
#     apt-get install -y python3 && \
#     apt-get install -y python3-pip && \
#     pip3 install pandas sqlalchemy psycopg2-binary && 
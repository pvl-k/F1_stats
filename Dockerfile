FROM postgres:13

WORKDIR /home/app/
COPY pipeline.py pipeline.py
COPY hostname.txt hostname.txt
COPY db_user.txt db_user.txt
COPY db_user_password.txt db_user_password.txt

ADD init.sql /docker-entrypoint-initdb.d/init.sql
RUN chown -R postgres:postgres /docker-entrypoint-initdb.d/ && \
    apt-get update && \
    apt-get install -y python3 && \
    apt-get install -y python3-pip && \
    pip3 install pandas sqlalchemy psycopg2-binary && 
#    pip3 install sqlalchemy && \
#    pip install psycopg2-binary 
#    python3 pipeline.py

#  ENTRYPOINT ["python3", "pipeline.py"]
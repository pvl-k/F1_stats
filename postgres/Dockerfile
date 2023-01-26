FROM postgres:13

ADD init.sql /docker-entrypoint-initdb.d/init.sql

# RUN chown -R postgres:postgres /docker-entrypoint-initdb.d/ && \
#     apt-get update && \
#     apt-get install -y python3 && \
#     apt-get install -y python3-pip && \
#     pip3 install pandas sqlalchemy psycopg2-binary && 
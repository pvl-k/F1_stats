FROM postgres:13

ADD init.sql /docker-entrypoint-initdb.d/init.sql
RUN chown -R postgres:postgres /docker-entrypoint-initdb.d/

RUN apt-get update && \
    apt-get install -y python3 && \
    apt-get install -y python3-pip && \
    pip3 install pandas && \
    pip3 install sqlalchemy && \
    pip install psycopg2-binary

WORKDIR /home/app/
COPY pipeline.py pipeline.py
COPY hostname.txt hostname.txt
COPY db_user.txt db_user.txt
COPY db_user_password.txt db_user_password.txt

# ENTRYPOINT ["/usr/bin/python3"]
# CMD ["./pipeline.py"]
# ENTRYPOINT [ psql -h localhost -U postgres \i /home/app/init.sql ]
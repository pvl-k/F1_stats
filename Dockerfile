FROM postgres:13

RUN apt-get update && \
    apt-get install -y python3 && \
    apt-get install -y python3-pip && \
    pip3 install pandas && \
    pip3 install sqlalchemy && \
    pip install psycopg2-binary

WORKDIR /home/app/
COPY init.sql init.sql
COPY pipeline.py pipeline.py
COPY hostname.txt hostname.txt
COPY db_user.txt db_user.txt
COPY db_user_password.txt db_user_password.txt
# ENTRYPOINT [ "python3", "pipeline.py" ]
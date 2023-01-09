FROM postgres:13
ENV POSTGRES_USER postgres
ENV POSTGRES_PASSWORD postgres 
ENV POSTGRES_DB f1stat 
COPY create_tables.sql /docker-entrypoint-initdb.d/


# RUN pip install pandas

# WORKDIR /app
# COPY pipeline.py pipeline.py

# ENTRYPOINT [ "python", "pipeline.py" ]
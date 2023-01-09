FROM python:3.9

RUN pip install pandas
RUN pip install sqlalchemy
RUN pip install zipfile
RUN pip install urllib

WORKDIR /app
COPY pipeline.py pipeline.py

ENTRYPOINT [ "python", "pipeline.py" ]
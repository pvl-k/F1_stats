# F1 Stats
This project developed for Formula One fans who want to have statistics championships since 1950 and to these days for analytics, etc.
Data provides and downloads from [The Ergast Developer API](http://ergast.com/mrd/db/#csv).
Data loads to a database in Docker-container based Debian with PostgreSQL. 
ETL processes built in Prefect for orchestration and scheduled runs using pandas and SQLAlchemy.
## For building Docker containers: 
docker-compose up -d
<!-- ### For building docker image:
>docker build -t pipeline-app .

### For first start docker container:
>docker run --name=pipeline-app-container -d -p 5432:5432 -e POSTGRES_PASSWORD=postgres pipeline-app

### After first start you need to enter into bash:
>docker exec -it pipeline-app-container bash
### and next run ETL python-script:
>python3 pipeline.py

### For all next starts:
>docker start pipeline-app-container

### For stops:
>docker stop pipeline-app-container -->

### ER model of Data:
![db_F1_Stats](https://user-images.githubusercontent.com/63403198/180854011-674cac50-82d1-4104-9bf8-580eb36fa766.png)

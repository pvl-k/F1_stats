# F1 Stats
This project developed for Formula One fans who want to have statistics championships since 1950 and to these days.
Data providing and downloading from [The Ergast Developer API](http://ergast.com/mrd/db/#csv).
# For building docker image:
>docker build -t pipeline-app .
# For first start docker container:
>docker run --name=pipeline-app-container -d -p 5432:5432 -e POSTGRES_PASSWORD=postgres pipeline-app
# After first start you need to enter into bash and next run ETL python-script:
>docker exec -it pipeline-app-container bash
>python3 pipeline.py
# For next starts
>docker start pipeline-app-container
# For stop 
>docker stop pipeline-app-container



![db_F1_Stats](https://user-images.githubusercontent.com/63403198/180854011-674cac50-82d1-4104-9bf8-580eb36fa766.png)

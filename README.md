# F1_stats
This project developed for Formula One fans who want to have statistics championships since 1950 and to these days.
Data providing and downloading from [The Ergast Developer API](http://ergast.com/mrd/db/#csv).
# Build
docker build -t pipeline-app .
# First start
docker run --name=pipeline-app-container -d -p 5432:5432 -e POSTGRES_PASSWORD=postgres pipeline-app
# Next starts
docker start pipeline-app-container
# Stop 
docker stop pipeline-app-container
# Enter into bash
docker exec -it pipeline-app-container bash


![db_F1_Stats](https://user-images.githubusercontent.com/63403198/180854011-674cac50-82d1-4104-9bf8-580eb36fa766.png)

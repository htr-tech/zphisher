# Run ZPhiSher in Docker Compose

![docker](https://img.shields.io/badge/Docker-v19.03.12-blue?style=plastic&logo=docker)
![dockercompose](https://img.shields.io/badge/Docker_Compose-v1.25.4-orange?style=plastic&logo=docker)
![Maintainer](https://img.shields.io/badge/Maintainer-Equinockx-success?style=plastic&logo=terraform)


## Runnin within container


## Requeriments

- [X] Docker
- [X] docker-compose

## Usage Mode

Clone the repo from Github
```bash
git clone https://github.com/htr-tech/zphisher
cd zpshisher
```

Run docker-compose

```bash
docker-compose up --build -d
```
'_Don not need redirection of ports 'cause the container is exposed to internet_' <br>
Verify of the container is running with:

```bash
equinockx~$ docker-compose ps

  Name         Command        State   Ports
-------------------------------------------
zphisher   bash zphisher.sh   Up           

```


Executing zphisher inside of container

```bash
docker-compose exec zphisher bash zphisher.sh
```

## Persist Data

When we make or buils the service with `docker-compose up --build -d` this persist the data templates in the same folder `websites`.
If you add the new Template in `websites` this will be reflected in the container and you can use it.

- [X] `equinockx~/websites$`
- [X] websites

## First Start the services

```bash
docker-compose up --build -d
```
## Down the container
```bash
docker-compose down
```
## Stop the services

```bash
docker-compose stop
```
## Start the services

With this command docker-compose will initialize the service stopped

```bash
docker-compose start
```

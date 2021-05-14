#!/bin/bash
docker run --name supernova-citiesBrazilDb -d -p 5432:5432 -e POSTGRES_USER=postgres_supernova_user -e POSTGRES_PASSWORD=supernova_pass -e POSTGRES_DB=citiesBrazil -v $PWD:/tmp postgres

docker exec -it supernova-citiesBrazilDb /bin/bash

cd tmp/

psql -h localhost -U postgres_supernova_user -p supernova_pass citiesBrazil -f /tmp/pais.sql

psql -h localhost -U postgres_supernova_user -p supernova_pass citiesBrazil -f /tmp/estado.sql

psql -h localhost -U postgres_supernova_user -p supernova_pass citiesBrazil -f /tmp/cidade.sql


# Ejercicio 02 - Interpretacion de `run.sh`

En este ejercicio se ejecuta manualmente lo que hace `run.sh` para desplegar WordPress + MariaDB con Docker.

## Que hace `run.sh`

El script crea dos contenedores:

1. **`wordpress-db`** con imagen `mariadb:10.3.9`
   - Crea un volumen `wordpress-db` montado en `/var/lib/mysql`
   - Configura usuario, password y base de datos con variables de entorno

2. **`wordpress`** con imagen `wordpress:4.9.8`
   - Se enlaza con `wordpress-db` (`--link wordpress-db:mysql`)
   - Monta la carpeta local `wordpress/` en `/var/www/html`
   - Publica el puerto `8080`

## Ejecucion manual en terminal

Desde la carpeta `ejem02`:

```bash
docker rm -f wordpress wordpress-db

docker run -d --name wordpress-db \
  --mount source=wordpress-db,target=/var/lib/mysql \
  -e MYSQL_ROOT_PASSWORD=secret \
  -e MYSQL_DATABASE=wordpress \
  -e MYSQL_USER=manager \
  -e MYSQL_PASSWORD=secret \
  mariadb:10.3.9

docker ps

docker run -d --name wordpress \
  --link wordpress-db:mysql \
  --mount type=bind,source="$(pwd)"/wordpress,target=/var/www/html \
  -e WORDPRESS_DB_USER=manager \
  -e WORDPRESS_DB_PASSWORD=secret \
  -p 8080:80 \
  wordpress:4.9.8

docker ps

rifica en http://localhost:8080 que WordPress queda desplegado correctamente.`


# Ejercicio 01

Se crea y ejecuta un contenedor Apache + PHP con Docker.  
Se actualiza la imagen base de `php:7.0-apache` a `php:8.2-apache` para evitar problemas de compatibilidad.

## Pasos

```bash
docker rm -f miapache-php
docker rmi -f miapache-php
docker build -t miapache-php .
docker run -dit --name miapache-php -p 5555:80 --mount type=bind,source="$(pwd)"/src,target=/var/www/html miapache-php
docker ps

Abrir en navegador: http://localhost:5555

##Edicion dentro del contenedor

docker exec -it miapache-php bash
apt-get update
apt-get install -y vim
cd /var/www/html
vi index.html
En vi: i para editar, ESC + :wq para guardar.

Datos cargados en index.html
Nombre: Roman Acuña
Fecha: 08/05/2026
Materia: Diseño y arquitectura de despliegue 2
Evidencia
Captura de docker ps con miapache-php
Captura de http://localhost:5555
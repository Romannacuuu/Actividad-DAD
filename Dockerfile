# Imagen base actualizada para evitar incompatibilidades de GLIBC.
FROM php:8.2-apache

# Copiamos todos los ficheros al directorio público de Apache.
COPY src/ /var/www/html

# Exponemos el puerto HTTP.
EXPOSE 80

# Metadata del autor (reemplaza MAINTAINER obsoleto).
LABEL maintainer="JL Gonzalez <jlgs@cifpvirgendegracia.com>"

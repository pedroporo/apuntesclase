[[SA6AAQ62.-Containeritzacio-app-amb-servici-ldap.pdf#page=6&selection=0,0,2,1|Ejercicio 1, Indica els diferents serveis declarats en el fitxer docker-compose.yml i la funció que realitzarà dins de la infraestructura configurada.]]

- ldap
Es el que crea la infraestructura de la organizacion.
- phpldapadmin
Es la base de datos de la infraestructura
- web
Es la aplicacion web de nuestra infraestructura


[[SA6AAQ62.-Containeritzacio-app-amb-servici-ldap.pdf#page=6&selection=67,0,73,93|Activitat 2 ,Explica la funcionalitat que du a terme cada una de les lines del fitxer Dockerfile anterior.]]

```
FROM php:8.2-apache

# Instal·la l'extensió LDAP

RUN apt-get update && apt-get install -y libldap2-dev && docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu && docker-php-ext-install ldap

# Habilita els mòduls necessaris d'Apache

RUN a2enmod rewrite

# Copia el codi PHP al contenidor

COPY ./web /var/www/html

# Estableix permisos per al directori web

RUN chown -R www-data:www-data /var/www/html
```

- FROM php:8.2-apache
Usa la imagen php y version 8.2-apache
- RUN apt-get update && apt-get install -y libldap2-dev && docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu && docker-php-ext-install ldap
Ejecuta los comandos para instalar lo necesario de LDAP
- RUN a2enmod rewrite
Activa el modulo rewrite 

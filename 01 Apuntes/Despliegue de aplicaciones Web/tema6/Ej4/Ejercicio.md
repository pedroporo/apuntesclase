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
Activa el modulo rewrite de apache
- COPY ./web /var/www/html
Copia el contenido de la carpeta web a la carpeta html del contenedor
- RUN chown -R www-data:www-data /var/www/html
Estableze el nuevo dueño de la carpeta /var/www/html de forma recursiva del contenedor

## [[SA6AAQ62.-Containeritzacio-app-amb-servici-ldap.pdf#page=8&selection=16,0,18,1|Actividad 3]]
- Crea una unitat organitzativa anomenada "usuaris" i crea un usuari per cada membre del grup que esteu fent la pràctica. Per això hauràs de: 
	- Crear la OU usuaris 
	-  Crear un Grup Posix anomenat ‘default’ que pertanya a la organització (això hem de fer-ho perqué l’esquema per defecte d’usuaris té el atribut gid definit com a requerit 
	- Crear els usuaris associats al grup POSIX i amb el shell "No login"

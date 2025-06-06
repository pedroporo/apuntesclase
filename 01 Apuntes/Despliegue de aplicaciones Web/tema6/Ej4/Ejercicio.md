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
	![[Pasted image 20250120171531.png]]
	
	-  Crear un Grup Posix anomenat ‘default’ que pertanya a la organització (això hem de fer-ho perqué l’esquema per defecte d’usuaris té el atribut gid definit com a requerit 
	
	![[Pasted image 20250120171805.png]]
	- Crear els usuaris associats al grup POSIX i amb el shell "No login"
	![[Pasted image 20250120171947.png]]

## [[SA6AAQ62.-Containeritzacio-app-amb-servici-ldap.pdf#page=9&selection=0,0,2,1|Actividad4]]
### 4.1 Modifica els arxius de configuració de l’arquitectura per a que el servidor LDAP faça ús d’una contrasenya segura per a l’administrador per a la connexió del administrador i la organització base siga "ddaw.com".
`LDAP_ADMIN_PASSWORD: "Admin_Password@#"`
### 4.2. Modifica l’aplicació web per a que mostre la informació del usuaris en format tabla.
![[Pasted image 20250120173030.png]]
### 4.3. Explica el procés que seguiries per a autenticar els usuaris fent ús del servici LDAP que acabes de configurar.
Cuando se quiera logear pillaría del ldap el usuario y su hash de contraseña, luego comprobaría el hash con la contraseña introducida en el form y si coinciden lo dejo pasar, si no le pido que intente de nuevo.
Cuando recivas la contraseña, lo que se hara es buscar en los usuarios alguno con ese nombre, luego se pillara la id y se buscara el la contraseña del usuario de ldap (la cual estara en base64), usaremos un if con la funcion de php bin2hex y dentro de esa funcion estara un base64_decode con la contraseña del ldap y lo compararemos que sea igual al input de la contraseña introducida en el login dentro de un metodo md5, si estas dos coinciden se le dejara pasar, sino se le volveria a pedir el login.

```
var_dump(bin2hex(base64_decode('gdyb21LQTcIANtvYMT7QVQ=='))==md5('1234')) ;
```

### 4.4. ¿Com podem donar d’alta els rol que té cada usuari? Busca informació al respecte
Vas a crear un hijo y que sea Organisational Role, le das un nombre y le asignas un usuario
![[Pasted image 20250122152602.png]]
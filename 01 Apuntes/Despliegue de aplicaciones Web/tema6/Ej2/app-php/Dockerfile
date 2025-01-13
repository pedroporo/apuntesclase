# Utilitzar una imatge base amb Apache i PHP preinstal·lats 
FROM php:8.1-apache 
# Copiar el contingut de l'aplicació a la carpeta d'Apache 
COPY html/ /var/www/html/ 
# Establir permisos per al directori d'uploads 
RUN mkdir -p /var/www/html/uploads && \ chown -R www-data:www-data /var/www/html/uploads && \ chmod -R 755 /var/www/html/uploads 
# Exposar el port 80
EXPOSE 80

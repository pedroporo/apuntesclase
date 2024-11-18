```
sudo mkdir -p /var/www/app.cipfpbatoi.es/html
sudo chown -R $USER:$USER /var/www/app.cipfpbatoi.es/html
sudo chmod -R 755 /var/www/app.cipfpbatoi.es
nano /var/www/app.cipfpbatoi.es/html/index.html
sudo nano /etc/nginx/sites-available/app.cipfpbatoi.es
```

## Fichero de config con php
``` conf
server { 
llisten 80; 
root /var/www/html; 
index index.php index.html; 
server_name example.com; 
location ~ \.php$ {

include snippets/fastcgi-php.conf; 
fastcgi_pass unix:/var/run/php/php8.1-fpm.sock; 
} 
}
```

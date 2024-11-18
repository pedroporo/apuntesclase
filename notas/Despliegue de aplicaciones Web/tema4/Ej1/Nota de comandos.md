```
sudo mkdir -p /var/www/app.cipfpbatoi.es/html
sudo chown -R $USER:$USER /var/www/app.cipfpbatoi.es/html
sudo chmod -R 755 /var/www/app.cipfpbatoi.es
nano /var/www/app.cipfpbatoi.es/html/index.html
sudo nano /etc/nginx/sites-available/app.cipfpbatoi.es
sudo ln -s /etc/nginx/sites-available/app.cipfpbatoi.es /etc/nginx/sites-enabled/
sudo nginx -t
```

## Fichero de config con php
``` conf
server { 
listen 80; 
root /var/www/app.cipfpbatoi.es/html; 
index index.php index.html; 
server_name app.cipfpbatoi.es; 
location ~ \.php$ {

include snippets/fastcgi-php.conf; 
fastcgi_pass unix:/var/run/php/php8.3-fpm.sock; 
} 
}
```

```
sudo apt install composer -y

```
/etc/ssl/api/server.crt
/etc/ssl/api/server.key

```
server {
listen 80;
listen 443 ssl;
root /home/api/www/html/src/;
index index.php index.html;
server_name api.projecte1.es;
ssl_certificate     /etc/ssl/api/server.crt;
ssl_certificate_key /etc/ssl/api/server.key;
ssl_protocols       TLSv1 TLSv1.1 TLSv1.2 TLSv1.3;
ssl_ciphers         HIGH:!aNULL:!MD5;
location ~ \.php$ {

include snippets/fastcgi-php.conf;
fastcgi_pass unix:/var/run/php/php8.3-fpm.sock;
}
}

```

```
sudo apt install composer -y

sudo apt -y install libapache2-mod-php php-{mbstring,xmlrpc,soap,gd,xml,curl,zip,cli,bcmath,tokenizer,json,pear,mysql}
GRANT ALL PRIVILEGES ON laravel.* TO 'pedro'@'localhost';
sudo ln -s /etc/nginx/sites-available/dev.todo.cipfpbatoi.es /etc/nginx/sites-enabled/

sudo cp /etc/php/8.3/fpm/pool.d/www.conf /etc/php/8.3/fpm/pool.d/002-es-cipfpbatoi-todo-dev.conf
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

```
server {
listen 80;
root /var/www/002-es-cipfpbatoi-todo-dev/html/public/;
index index.php index.html;
server_name api.projecte1.es;
location ~ \.php$ {

include snippets/fastcgi-php.conf;
fastcgi_pass unix:/var/run/php/php8.3-fpm.sock;
}
}

```
```
server { 
listen 80; 
listen [::]:80;
server_name dev.todo.cipfpbatoi.es; 
root /var/www/002-es-cipfpbatoi-todo-dev/html/todo/public/; 
index index.htm index.html index.php; 
location / { 
try_files $uri $uri/ /index.php?$query_string; 
}
location ~ \.php$ { 
include snippets/fastcgi-php.conf; 
fastcgi_pass 127.0.0.1:9000; 
}
}
```

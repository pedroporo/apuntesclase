```
sudo adduser deployer
sudo chfn -o umask=022 deployer
sudo mkdir /var/www/api -p 
sudo chown deployer:www-data /var/www/api
sudo apt install acl -y

sudo ln -s /etc/nginx/sites-available/futbolfem.cipfpbatoi.es /etc/nginx/sites-enabled/
sudo cp /etc/php/8.3/fpm/pool.d/002-es-cipfpbatoi-todo-dev.conf /etc/php/8.3/fpm/pool.d/futbolfem.cipfpbatoi.es.conf

CREATE DATABASE laravel1;
GRANT ALL PRIVILEGES ON laravel1.* TO 'pedro'@'localhost';
```
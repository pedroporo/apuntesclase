```
sudo adduser deployer
sudo chfn -o umask=022 deployer
sudo mkdir /var/www/api -p 
sudo chown deployer:www-data /var/www/api
sudo apt install acl -y

sudo apt install composer -y

sudo apt -y install libapache2-mod-php php8.4-{mbstring,xmlrpc,soap,gd,xml,curl,zip,cli,bcmath,tokenizer,json,pear,mysql}


sudo ln -s /etc/nginx/sites-available/api /etc/nginx/sites-enabled/
sudo cp /etc/php/8.3/fpm/pool.d/002-es-cipfpbatoi-todo-dev.conf /etc/php/8.3/fpm/pool.d/futbolfem.cipfpbatoi.es.conf

CREATE DATABASE laravel;
GRANT ALL PRIVILEGES ON laravel.* TO 'sail'@'localhost';
```

```
projectegroup1 IN NS ns1.projectegroup1.ddaw.es. 
ns1.projectegroup1 IN A 95.19.106.4
```

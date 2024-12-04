```
sudo adduser ddaw-ud4-deployer
sudo chfn -o umask=022 ddaw-ud4-deployer
sudo mkdir /var/www/ddaw-ud4-a4/html -p 
sudo chown ddaw-ud4-deployer:www-data /var/www/ddaw-ud4-a4/html
sudo apt install acl -y

sudo ln -s /etc/nginx/sites-available/futbolfem.cipfpbatoi.es /etc/nginx/sites-enabled/
sudo cp /etc/php/8.3/fpm/pool.d/002-es-cipfpbatoi-todo-dev.conf /etc/php/8.3/fpm/pool.d/futbolfem.cipfpbatoi.es.conf
```
Host 18.235.170.221 futbolfem.cipfpbatoi.es

```
ddaw-ud4-deployer ALL=(ALL) NOPASSWD: /etc/init.d/php8.3-fpm restart
ddaw-ud4-deployer ALL=(ALL) NOPASSWD: /bin/systemctl reload php-fpm
```
```php
<?php 
namespace Deployer; 
require 'recipe/laravel.php'; 
set('application', 'Futbol Femeni'); 
set('repository', 'https://github.com/cipfpbatoi/projectes-laravel-pedroporo.git'); 
set('git_tty', true);
add('shared_dirs', ['']);
add('shared_files', ['']); 
add('writable_dirs', []); 
host('18.235.170.221') 
->set('remote_user’, ‘ddaw-ud4-deployer’') 
->set('identity_file’, ‘~/.ssh/id_rsa') 
->set('deploy_path', '/var/www/ddaw-ud4-a4/html');

task('build', function () { run('cd {{release_path}} && build'); });
after('deploy:failed', 'deploy:unlock'); 
before('deploy:symlink', 'artisan:migrate'); 
```

```
vendor/bin/dep deploy -vvv
git commit -am '[*ADD] Feature a43534sg – CRUD usuaris'
git push origin master

```

crear una keygen con user de despliege
ir a github y añadir la clave

```
server {
    listen 80;
    listen [::]:80;
    server_name futbolfem.cipfpbatoi.es;
    root /var/www/ddaw-ud4-a4/html/relase/futbol-femeni/routes;
    add_header X-Frame-Options "SAMEORIGIN";
    add_header X-Content-Type-Options "nosniff";
    index index.php;
    charset utf-8;
    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }
    location = /favicon.ico { access_log off; log_not_found off; }
    location = /robots.txt  { access_log off; log_not_found off; }
    error_page 404 /index.php;
    location ~ \.php$ {
        fastcgi_pass unix:/run/php/php8.3-fpm-futbolfem-cipfpbatoi-es.sock;
        fastcgi_param SCRIPT_FILENAME $realpath_root$fastcgi_script_name;
        include fastcgi_params;
    }
    location ~ /\.(?!well-known).* {
        deny all;
    }
}
```

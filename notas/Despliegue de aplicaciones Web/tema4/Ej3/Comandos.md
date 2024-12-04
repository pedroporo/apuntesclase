```
sudo adduser ddaw-ud4-deployer
sudo chfn -o umask=022 ddaw-ud4-deployer
sudo mkdir /var/www/ddaw-ud4-a4/html -p 
sudo chown ddaw-ud4-deployer:www-data /var/www/ddaw-ud4-a4/html
sudo apt install acl -y
```

```php
<?php 
namespace Deployer; 
require 'recipe/laravel.php'; 
set('application', 'NomDelProjecte'); 
set('repository', 'https://github.com/acoloma-edu/todo'); 
set('git_tty', true);
add('shared_dirs', ['']);
add('shared_files', ['']); 
add('writable_dirs', []); 
host('your_server_ip') 
->set('remote_user’, ‘ddaw-ud4-deployer’') 
->set('identity_file’, ‘~/.ssh/id_rsa') ->set('deploy_path', '/var/www/ddaw-ud4-a4/html');

task('build', function () { run('cd {{release_path}} && build'); });
after('deploy:failed', 'deploy:unlock'); 
before('deploy:symlink', 'artisan:migrate'); 
```
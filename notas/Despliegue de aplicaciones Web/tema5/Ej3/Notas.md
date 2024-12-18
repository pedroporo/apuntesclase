```
sudo nano /etc/bind/named.conf.options
```
```
forwarders { 
     1.0.0.1; 
     1.1.1.1; 
};
```
```
$TTL    604800
@       IN      SOA     ns1.pedro.ddaw.es. root.pedro.ddaw.es. (
                              2         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      ns1.pedro.ddaw.es. 
@       IN      NS      ns2.pedro.ddaw.es.
ns1     IN      A       100.28.192.202
ns2     IN      A       100.28.192.202
app1    IN      A       172.16.224.21
app2    IN      A       172.16.224.22
app3    IN      A       172.16.224.23
@       IN      MX      1 mail.pedro.ddaw.es.
mail    IN      A       172.16.224.24
www     IN      CNAME   dev.todo.cipfpbatoi.es
@       IN      TXT     "google-site-verification=qW2WOnmUMDHWaF-2Tgfyzmwyk2BqWg4dghWqvW0PY8c8"
```
```
pedro IN NS ns1.pedro.ddaw.es. 
ns1.pedro IN A 100.28.192.202
```
```
sudo mkdir -p /var/www/app1.pedro.ddaw.es/
sudo mkdir -p /var/www/app2.pedro.ddaw.es/
sudo mkdir -p /var/www/app3.pedro.ddaw.es/
sudo chown -R $USER:$USER /var/www/app1.pedro.ddaw.es/
sudo chown -R $USER:$USER /var/www/app2.pedro.ddaw.es/
sudo chown -R $USER:$USER /var/www/app3.pedro.ddaw.es/
sudo chmod -R 755 /var/www/app1.pedro.ddaw.es
sudo chmod -R 755 /var/www/app2.pedro.ddaw.es
sudo chmod -R 755 /var/www/app3.pedro.ddaw.es
nano /var/www/app1.pedro.ddaw.es/index.html
```
```
<h1>Pagina de app.pedro.ddaw.es</h1>
```
```
server { 
listen 80; 
root /var/www/app1.pedro.ddaw.es; 
index index.html; 
server_name app1.pedro.ddaw.es;
location / {
    try_files $uri $uri/ =404;
}
```
```
server { 
listen 80; 
root /var/www/app2.pedro.ddaw.es; 
index index.html; 
server_name app2.pedro.ddaw.es;
location / {
    try_files $uri $uri/ =404;
}
```
```
server { 
listen 80; 
root /var/www/app3.pedro.ddaw.es; 
index index.html; 
server_name app3.pedro.ddaw.es;
location / {
    try_files $uri $uri/ =404;
}
```
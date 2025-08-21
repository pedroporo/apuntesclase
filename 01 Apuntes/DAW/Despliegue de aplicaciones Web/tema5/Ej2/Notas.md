```
zone "pedro.ddaw.es" in {
            type master;
            file "/etc/bind/db.pedro-ddaw.lan";
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
sudo rndc flush
sudo rndc reload
sudo netstat -ntpapu

```
```
zone "pedro.ddaw.es" in {
            type master;
            file "/etc/bind/db.pedro-ddaw.lan";
};
```
```
$TTL    604800
@       IN      SOA     ns1.pedro.ddaw.es. root.localhost. (
                              2         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      ns1.pedro.ddaw.es. 
@       IN      NS      ns2.pedro.ddaw.es.
ns1     IN      A       172.16.224.2 
ns2     IN      A       172.16.224.3
app1    IN      A       172.16.224.21
app2    IN      A       172.16.224.22
```
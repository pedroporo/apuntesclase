[[UD5A01_cliente_dns_terminal.pdf#page=5&selection=68,0,69,20|UD5A01_cliente_dns_terminal, página 5]]

> [[UD5A01_cliente_dns_terminal.pdf#page=5&selection=96,0,124,75|1]]. Realiza una consulta DNS para mostrar el registro SOA relacionado con el dominio del centro (cipfpbatoi.es). Muestra la instrucción que has ejecutado y sus resultados utilizando las 3 herramientas disponibles (dig, host, nslookup).


```
Dig: dig +nostats cipfpbatoi.es SOA

Host: host -t SOA cipfpbatoi.es

nslookup: nslookup -q=SOA cipfpbatoi.es
```
[[UD5A01_cliente_dns_terminal.pdf#page=5&selection=126,0,126,1|2]]
```
Dig: dig +nostats cipfpbatoi.es NS

Host: host -t NS cipfpbatoi.es

nslookup: nslookup -q=NS cipfpbatoi.es
```
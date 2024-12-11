[[UD5A01_cliente_dns_terminal.pdf#page=5&selection=68,0,69,20|UD5A01_cliente_dns_terminal, página 5]]

> [[UD5A01_cliente_dns_terminal.pdf#page=5&selection=96,0,124,75|1. Realiza una consulta DNS para mostrar el registro SOA relacionado con el dominio del centro (cipfpbatoi.es). Muestra la instrucción que has ejecutado y sus resultados utilizando las 3 herramientas disponibles (dig, host, nslookup).]]

```
Dig: dig +nostats cipfpbatoi.es SOA

Host: host -t SOA cipfpbatoi.es

nslookup: nslookup -q=SOA cipfpbatoi.es
```

> [[UD5A01_cliente_dns_terminal.pdf#page=5&selection=126,0,156,19|2. ¿Cuáles son los servidores de nombres responsables del dominio del centro que pueden responder con autoridad? Hay más de uno? Muestra la instrucción que has ejecutado y sus resultados utilizando una de las 3 herramientas disponibles. Recuerda que los servidores de nombres autoritativos vienen establecidos por el tipo de registro NS]]

```
Dig: dig +nostats cipfpbatoi.es NS

Host: host -t NS cipfpbatoi.es

nslookup: nslookup -q=NS cipfpbatoi.es
```

> [[UD5A01_cliente_dns_terminal.pdf#page=5&selection=158,0,162,73|3. ¿Cuáles son los servidores de correo del centro? Hay más de uno? ¿Cuál tiene más prioridad? Muestra la instrucción que has ejecutado y sus resultados.]]

```
Dig: dig +nostats cipfpbatoi.es MX

Host: host -t MX cipfpbatoi.es

nslookup: nslookup -q=MX cipfpbatoi.es
```

> [[UD5A01_cliente_dns_terminal.pdf#page=5&selection=164,0,183,61|4. Realiza un seguimiento de las consultas DNS que se realizan para resolver el dominio "gva.es" utilizando la herramienta dig y la opción trace. Muestra los nombres de los diferentes servidores de nombres que han consultado hasta llegar al servidor que contiene la información del dominio a buscar.]]
```
dig +trace cipfpbatoi.es
```

> [[UD5A01_cliente_dns_terminal.pdf#page=6&selection=17,0,70,11|5. Realiza una consulta DNS para mostrar todos los registros de la zona cipfpbatoi.es. La respuesta debe ser de un servidor con autoridad (Recuerda que para ello deberás de preguntar directamente a uno de los servidores de nombres autoritativos del dominio). Muestra la instrucción que has ejecutado y sus resultados.]]


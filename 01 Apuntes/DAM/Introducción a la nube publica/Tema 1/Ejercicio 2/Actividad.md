---
dg-publish: true
---
Ultima Modificacion: <%+ tp.file.last_modified_date() %>
Curso: Desarollo de aplicaciones multiplataforma segundo
Pedro Guill Ferri
Fecha de entrega: `$= dv.date("today")`

1. Define cada uno de los servicios presentados en el diagrama:

Internet Gateway:
Un Internet Gateway es un componente de la Private Subnet que es escalable, y permite la comunicación entre una subnet y Internet. Actúa como un puente entre la VPC y Internet, facilitando que los recursos dentro de subredes públicas (como instancias EC2) se conecten a Internet si tienen una dirección IPv4 pública o una dirección IPv6.

Bucket:
Es un contenedor de objetos y tablasque se almacenan en Amazon S3, osea un servicio de almacenamiento de objetos en la nube. 
Virtual Private Cloud:

Public subnet:
Una subred pública en Amazon AWS es una subred que tiene una ruta en su tabla de enrutamiento hacia una puerta de enlace de Internet (Internet Gateway). Esta configuración permite que las instancias dentro de la subred se comuniquen directamente con Internet. Para que esta comunicación funcione, las instancias en una subred pública deben tener direcciones IP públicas o direcciones IP elásticas asignadas. La presencia de una ruta para el destino 0.0.0.0/0 que apunta a una puerta de enlace de Internet es el criterio clave para determinar si una subred es pública. Las subredes públicas suelen utilizarse para alojar recursos como servidores web o balanceadores de carga que necesitan ser accesibles desde Internet.

Private Subnet:

Instancia de EC2:

Instancia DB:

Network Access Control List
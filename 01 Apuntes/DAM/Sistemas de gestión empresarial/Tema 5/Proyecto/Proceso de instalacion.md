---
dg-publish: true
---
Ultima Modificacion: `$= dv.current().file.mtime`

Curso: Desarollo de aplicaciones multiplataforma segundo

Titulo de la actividad: **SGE: Proyecto La instalacion de odoo**

Alumno: Pedro Guill Ferri

Fecha de entrega: `$= dv.date("today")`


<center><img src="https://picsum.photos/513/725" alt="Portada" /></center>
> Eliminar despues
> Contraseña maestra: 57gg-kgyy-q3nn
> Email maestro: el mio personal
> Contraseña del email maestro: 57gg-kgyy-q3nn

# 1. Configurar los datos de la empresa
Cambio de la informacion de la emppresa:
![[Pasted image 20260101115328.png]]
# 2. Crear Estructura Organizativa
## Grupos de la organizacion

Los grupos serán los siguientes y cada grupo por encima de otro heredara los permisos de ese grupo, osea que el ceo podra ver todo lo que hagan los demas

```mermaid
stateDiagram-v2

state "Gran Tubérculo Supremo (CEO)" as ceo

state "Don Patatón" as ceo

ceo --> cosechamngr

ceo --> freidoramngr

ceo --> logimngr

ceo --> rrhhmngr

ceo --> cazaevilmngr

  

state "Jefe de Cosecha" as cosechamngr

state "Papañero Mayor" as cosechamngr

cosechamngr --> cosecha

  

state "Equipo de Cosecha" as cosecha

state "Tubérculo Tomás" as cosecha

state "Raíz Ramona" as cosecha

state "Brotes Bruno" as cosecha

  

state "Maestro de la Freidora" as freidoramngr

state "Crispín Doradillo" as freidoramngr

freidoramngr --> freidora

  

state "Equipo de Freidora" as freidora

state "Crujiente Clara" as freidora

state "Aceitín Álvaro" as freidora

state "Salsón Sergio" as freidora

  

state "Jefe de Logística" as logimngr

state "Trans-Portato" as logimngr

logimngr --> logistica

  

state "Equipo de Logística" as logistica

state "Ruedín Rita" as logistica

state "Carretillo Carl" as logistica

state "Embolsada Emma" as logistica

  

state "Jefe de RRHH" as rrhhmngr

state "Patatalia Humana" as rrhhmngr

rrhhmngr --> rrhh

  

state "Equipo de RRHH" as rrhh

state "Capacita-Coto" as rrhh

state "Bienestar Blanca" as rrhh

  

state "Jefe de cazapatatas malignas" as cazaevilmngr

state "Sr. Potatoe" as cazaevilmngr

cazaevilmngr --> cazaevil

  

state "Equipo cazapatatas malignas" as cazaevil

state "Potatus Chip" as cazaevil

state "Doña Frita" as cazaevil

state "Fry" as cazaevil

```

Y aqui esta la captura de odoo con los equipos creados:
![[Pasted image 20260102114108.png]]

## Usuarios
Aqui se introduciran los usuarios que estan debajo de cada puesto en el apartado anteror, aunque para el proyecto solo los equipos de Freidora(ventas encuvierta, ya que son los responsables del putno de venta especifico) y Logistica tendran relevancia, aun asi crearemos todos los usuarios

---
dg-publish: false
---
Ultima Modificacion: `$= dv.current().file.mtime`

Curso: Desarollo de aplicaciones multiplataforma segundo

Titulo de la actividad: **Act 5.1 - Modo desarollador odoo**

Alumno: Pedro Guill Ferri

Fecha de entrega: `$= dv.date("today")`


<center><img src="https://picsum.photos/500/700" alt="Portada" /></center>

> [!important]+
> **Para poder realizar la actividad hay que mostrar tanto el código que habéis tocado y la vista gráfica con lo que habéis generado.**

Para la actividad debéis generar una nueva base de datos, con la opción de “demo data” activa, y además para trabajar debéis instalar el módulo de inventario. Además de la opción de “**Desarrollador**” activa.

## 1. Debes generar 2 grupos nuevo para el módulo de inventario, con los siguientes nombres y permisos.
- Jefe de departamento, con todos los permisos de los apartados de "Información general”, “Operaciones”, “Productos”, “Informes”. 
- Empleados departamento, con acceso de lectura en “Operaciones/transferencias”, “Operaciones/reposición” y todas las opciones de “Productos”.

## 2. Debéis añadir 3 campos nuevos dentro de las transacciones, pidiendo la siguiente información:
- Es importante (boolean). `isImportant boo`
- Fecha de pedido del cliente (fecha). `client`
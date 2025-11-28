---
dg-publish: true
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
![[Pasted image 20251127201618.png]]
## 1. Debes generar 2 grupos nuevos para el módulo de inventario, con los siguientes nombres y permisos.
- Jefe de departamento, con todos los permisos de los apartados de "Información general”, “Operaciones”, “Productos”, “Informes”. 
![[Pasted image 20251127202713.png]]
- Empleados departamento, con acceso de lectura en “Operaciones/transferencias”, “Operaciones/reposición” y todas las opciones de “Productos”.
![[Pasted image 20251128164134.png]]
## 2. Debéis añadir 3 campos nuevos dentro de las transacciones, pidiendo la siguiente información:
- Es importante (boolean). `isImportant boo`
- Fecha de pedido del cliente (fecha). `clientPurcharseDate date`
- Previsión de envío en días (entero). `arribeInDays int`

## 3. Genera un nuevo apartado (Ventana dentro de la transacción) donde muestres los días previstos de envío en lugar de en la parte superior. (Podéis utilizar xpath o html).

## 4. Busca una vista Kanban y modifica algo de ella (Que no sea hacer invisible la imagen).
> Voy a agregar la misma imagen otra vez :)

## 5. Genera un elemento de menú dentro de Inventario con las transferencias que sean importantes. Añade o modifica varias transferencias activándole la opción para comprobar que se muestran.

## 6. Modifícala la factura de la empresa añadiendo información sobre vuestra empresa. (Que no sean las redes sociales).
## 7. Elimina información de la factura de la empresa, que no sea ni lo del punto 6, ni el comercial.
> Procedo a eliminar el body

## 8. Genera un nuevo modelo con un mínimo de 3 campos, además genera los permisos que debería tener el módulo. Con 2 vistas mínimos, a elección vuestra. Junto a la acción o acciones de ventana pertinentes y los elementos de menú. Para finalizar mostrad que funciona y generad el producto al que haga referencia. (“No podéis realizar el de videojuegos”).
 > `>:(`


---
dg-publish: false
---

# <h1><center>RedData</center></h1>

![[Pasted image 20260121173155.png|1000]]

## 2. Introducción

### Descripción

La aplicación sirve para mostrar productos/clientes e insertarlos

**Audiencia objetivo**

Administradores de ventas


**Alcance**

Resuelve la gestión de clientes, recopilación de info de productos y la información de todas las compras

**Requisitos previos**

- Tener instalado un servidor sql.
- Tener internet.
- 8GB de ram
- 3 GB de almacenamiento.

## 4. Uso de la aplicación
### FlowChart
![[Pasted image 20260121181823.png]]

### Descripción del menú
Menu de clientes<sub>El unico menu funcional</sub>: 
![[Pasted image 20260121182400.png]]
En este menu Hay 3 opciones,
Listar Clientes: esta opción lo que hace es listar los clientes de la base de datos
Clientes API: Este genera clientes de prueba a trabes de una api

### Guia paso a paso
No hay nada mas que hacer en esta app, solo ver clientes.

## 5. Mantenimiento
Las copias de seguridad se harán a través del phpmyadmin.
1. Seleccionas la base de datos.
![[Pasted image 20260121183010.png]]
2. Se va ala pestaña de Exportar.
 ![[Pasted image 20260121183102.png]]
3. Se seleccionan las opciones de rapido y el formato sql
4. Y listo, ya tendrias una copia de seguridad de la base de datos.

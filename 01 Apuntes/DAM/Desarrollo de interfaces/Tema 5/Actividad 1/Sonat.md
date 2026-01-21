---
dg-publish: false
---

# <h1><center>RedData</center></h1>

![[Pasted image 20260121173155.png|1000]]

## Introducción

### Descripción

La aplicacion sirve para mostrar productos/clientes e insertarlos

**Audiencia objetivo**

Administradores de ventas


**Alcance**

Resuelve la gestion de clientes, recopilacion de info de productos y la informacion de todas las compras

**Requisitos previos**

- Tener instalado un servidor sql.
- Tener internet.
- 8GB de ram
- 3 GB de almacenamiento.

## Uso de la aplicación
### FlowChart
```mermaid
flowchart LR

A[Inici aplicacio REDATA] --> B[Mostrar formulari principal]

B --> C[Ocultar tots els submenus]

  

C --> D{Clic en boto principal}

D -->|Productes| E[Cridar showSubmenu panelSubProductes]

D -->|Clients| F[Cridar showSubmenu panelSubClients]

D -->|Compres| G[Cridar showSubmenu panelSubCompras]

  

%% Submenu Clients

F --> H{Opcio submenu clients}

H -->|Listado clientes| I[Obrir formulari llistat clients]

H -->|Insertar cliente| J[Obrir formulari insertar client]

H -->|Buscar clientes| K[Obrir formulari buscar client]

H -->|Clients API| P[Obrir formulari clients API]

  

%% Insertar client

J --> J1[Usuari emplena dades]

J1 --> J2[Insert en base de dades MySQL]

J2 --> J3[Mostrar missatge registre guardat]

  

%% Buscar client

K --> K1[Usuari escriu idClient]

K1 --> K2[Buscar client en MySQL]

K2 --> L{idClient existeix}

L -->|Si| M[Emplenar nom cognoms telefon]

L -->|No| N[Mostrar missatge id no existeix]

  

%% Llistat clients

I --> I1[Carregar clients de MySQL]

I1 --> I2[Mostrar clients en DataGridView]

  

%% Clients API

P --> Q[Botó carregar API]

Q --> R[Fer GET amb HttpClient a JSONPlaceholder]

R --> S[Deserialitzar JSON a llista APIUser]

S --> T[Mostrar usuaris en DataGridView]

  

%% Esquelet altres menus

E --> U[Interaccio amb submenu productes]

G --> V[Interaccio amb submenu compres]
```

<img src="https://r2cdn.perplexity.ai/pplx-full-logo-primary-dark%402x.png" style="height:64px;margin-right:32px"/>



Para un proyecto basado en sprints, lo más habitual es usar 5 columnas principales, aunque puedes simplificar según tus necesidades:
ColumnaFunción
Product Backlog / Ideas
Todas las tareas futuras o ideas para próximos sprints. No se tocan hasta que se planifica el sprint.
Sprint Backlog (To Do / Pendientes)
Tareas que van a entrar en el sprint actual.
In Progress / En progreso
Tareas que alguien está desarrollando o implementando.
Review / En revisión
Tareas terminadas pero pendientes de revisión (tests, code review, documentación).
Done / Completadas
Tareas finalizadas y validadas.
Opcional: Puedes añadir columnas extra si quieres bloqueadas / impedimentos o testing para reflejar problemas específicos.
2. Tips para usar GitHub Projects eficazmente
Crea los Sprints del proyecto (elige una duración realista, 4-6 semanas por sprint).
Usa issues para cada tarea → luego arrástralas a la columna correspondiente.
Etiqueta cada issue: bug, feature, documentación.
Asignar responsables: si trabajas en equipo o tú solo, sirve para organizar prioridades.
Automatización: GitHub Projects puede mover issues automáticamente a Done cuando se hace merge de un Pull Request.
Métricas visibles: revisa el progreso del sprint con el porcentaje de issues completadas en la vista de tablero.'

Aquí tienes una propuesta de sprints y un listado de issues detallados para cada aplicación del proyecto BatoiLOGIC, perfectamente estructurados para gestión en GitHub Projects con la metodología de sprints y columnas sugeridas.

***

### Propuesta de Sprints

Se propone una duración realista de 4 semanas por sprint. Los sprints están secuenciados por entregables funcionales y por aplicación, priorizando dependencias técnicas y entregas incrementales:

1. Sprint 1: Fundamentos de datos y backend común (API, modelos, autenticación, base de datos, CLI utilidades esenciales).
2. Sprint 2: MVP de apps móviles (repartidor y cliente), CLI de import/export, portal backoffice Windows Forms.
3. Sprint 3: Extensiones avanzadas, integración de Odoo, mejora de seguimiento, voz, módulos custom Odoo, optimización de procesos, pulido y QA.

***

### Issues detallados para cada proyecto/aplicación

#### 1) Backend/API Central y Utilidades CLI

| Issue | Tipo | Etiqueta |
| :-- | :-- | :-- |
| Definir y modelar el esquema relacional para productos, inventario, comandos | Arquitectura | feature |
| Implementar autenticación para APIs (token o JWT) | Backend | feature |
| Crear endpoints para gestión y consulta de productos, stock y pedidos | Backend | feature |
| Implementar lógica automatizada para pedidos a proveedor por falta de stock | Backend | feature |
| Exportar rutas y repartidores (CLI) | CLI | feature |
| Importar datos de ciudades y códigos postales desde fichero CSV | CLI | feature |
| Importación de tarifas de productos desde fichero | CLI | feature |
| Tests de integración para APIs principales | QA | test |
| Documentar endpoints REST | Docs | documentación |
| Desplegar base de datos en entorno de pruebas (docker-compose opcional) | Infra | feature |


***

#### 2) App móvil para repartidores

| Issue | Tipo | Etiqueta |
| :-- | :-- | :-- |
| Diseño de UI para login y receiving de rutas diarias automáticas | Frontend | feature |
| Implementar consumo de API REST para carga/actualización de pedidos | Frontend | feature |
| Envío periódico de geolocalización al backend | Backend | feature |
| Pantalla para marcar estado de entrega/no entrega, con motivo | Frontend | feature |
| Implementar recepción y visualización de albarán digital | Frontend | feature |
| Persistencia local básica y manejo de offline | Mobile | feature |
| Tests unitarios de componentes críticos | QA | test |
| Documentar uso y endpoints | Docs | documentación |
| Integración inicial de tablets/repartidor con sistema de rutas | Integración | feature |
| Notificación push para nuevas rutas/avisos | Mobile | feature |


***

#### 3) App móvil/escritorio para clientes

| Issue | Tipo | Etiqueta |
| :-- | :-- | :-- |
| UI y flujo de registro/login de clientes | Frontend | feature |
| Edición de perfil y gestión de direcciones | Frontend | feature |
| Listado y filtrado de productos con buscador | Frontend | feature |
| Implementar realización de pedidos y comprobación de stock | Frontend | feature |
| Visualización de historial de pedidos | Frontend | feature |
| Seguimiento de estado de pedido (preparación/ruta/entregado) | Frontend | feature |
| Integración de notificaciones de estado | Mobile | feature |
| Página de soporte/ayuda por canal de mensaje | Frontend | feature |
| Tests de flujo de realización y seguimiento de pedido | QA | test |
| Documentar proceso de onboarding y uso | Docs | documentación |


***

#### 4) Backoffice Windows Forms 
Yes

| Issue | Tipo | Etiqueta |
| :-- | :-- | :-- |
| Diseño inicial de la UI principal y login | Frontend | feature |
| Integrar gestión de pedidos (listado, edición, estatus) | Backend | feature |
| Importar nuevas tarifas de proveedor (CSV/XML) | Backend | feature |
| Generar rutas manuales y asignar a repartidor/camión | Backend | feature |
| Visualización en tiempo real de la flota | Backend | feature |
| Integrar comandos por voz (abrir/cerrar ventana, seguimiento flota, importar) | Frontend | feature |
| Integración con API REST central | Backend | feature |
| Tests básicos UI y operaciones | QA | test |
| Documentar instalación y primer uso | Docs | documentación |


***

#### 5) Backoffice Odoo (ERP)
Yes

| Issue | Tipo | Etiqueta |
| :-- | :-- | :-- |
| Crear módulos propios para camiones y repartidores (modelo y vista) | Backend | feature |
| Mantener tablas maestras (proveedores, ciudades, CP, productos, inventario) | Backend | feature |
| Desarrollar gestión avanzada de pedidos | Backend | feature |
| Integrar generación de albaranes y facturas según pedidos | Backend | feature |
| Gestión de stock automática y pedidos a proveedor por stock bajo | Backend | feature |
| Pruebas funcionales de los módulos Odoo desarrollados | QA | test |
| Documentar customizaciones y módulos propios | Docs | documentación |


***

#### Organización en el tablero de GitHub Projects

- **Product Backlog / Ideas:** Todas las issues listadas de cada módulo, desglosadas, se quedan en esta columna inicialmente.
- **Sprint Backlog:** Selecciona las issues que van a entrar en el sprint activo (reparte equitativamente según prioridad).
- **In Progress:** Arrastra aquí issues cuando se estén desarrollando.
- **Review:** Cuando estén listas pero pendientes de testing/código/documentación.
- **Done:** Issues completadas y validadas, listas para cerrar sprint.
- **Opcional:** Añadir columna bloqueado/impedimentos si una tarea depende de externo o está esperando algo.

Utiliza etiquetas como `bug`, `feature`, `test`, `documentación`, etc., y asigna responsables según cada equipo o área.

***

Esta estructura te permitirá monitorizar el progreso, asignar responsables y tener un control visual y operativo de todos los proyectos software de BatoiLOGIC.


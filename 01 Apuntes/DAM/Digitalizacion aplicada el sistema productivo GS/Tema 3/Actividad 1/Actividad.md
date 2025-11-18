---
dg-publish: true
---

### Situación actual

La empresa dispone actualmente de una infraestructura básica en la nube, contratada en modalidad on-demand, que cubre las necesidades habituales del negocio.

| Servicio                  | Descripción                                                                    | Estado actual |
| ------------------------- | ------------------------------------------------------------------------------ | ------------- |
| Servidor web / aplicación | 1 instancia virtual (2 vCPU, 4 GB RAM) con la aplicación en contenedor Docker. | En producción |
| Base de datos             | 1 base de datos relacional gestionada (MySQL o PostgreSQL).                    | En producción |
| Almacenamiento de objetos | Bucket para imágenes y archivos de productos.                                  | En uso        |
| Certificado SSL y dominio | Gestionado por el proveedor cloud.                                             | Activo        |
| Backup y logs             | Copias automáticas diarias y registros centralizados.                          | Activo        |


Actualmente, la plataforma mantiene un promedio de 500 usuarios simultáneos, con un rendimiento estable.

### Nueva situación: campaña de Black Friday
Durante el mes de noviembre, el cliente lanzará ofertas todos los viernes con motivo del Black Friday, lo que provocará un incremento estimado de 2.500 usuarios simultáneos adicionales.

Será necesario ampliar la infraestructura de manera temporal para evitar saturaciones o caídas, garantizando alta disponibilidad y rendimiento óptimo durante los picos de tráfico.

#### Tareas para realizar
1. Selección de plataformas
	- Elegir dos proveedores cloud (AWS, Azure o GCP).
	- Identificar los servicios necesarios para cubrir la nueva demanda (instancias, balanceador, almacenamiento, etc.).
2. Diseño de estrategias de escalabilidad
	- Escalabilidad vertical: aumentar recursos de las instancias existentes (CPU, RAM, disco).
	
	- Escalabilidad horizontal: habilitar autoscaling con balanceo de carga para que se creen instancias adicionales automáticamente cuando la carga lo requiera (distribuyendo el tráfico mediante un load balancer). La solución debe garantizar alta disponibilidad y equilibrio de carga durante los días críticos.
3. Estudio de costes
	- Calcular el coste estimado adicional necesario para soportar el incremento de usuarios durante noviembre. 
	- Utilizar las calculadoras oficiales de los proveedores:
		- [AWS](https://calculator.aws/#/):
			![[01 Apuntes/DAM/Digitalizacion aplicada el sistema productivo GS/Tema 3/Actividad 1/My Estimate - Calculadora de precios de AWS.pdf#page=1]]


			![[01 Apuntes/DAM/Digitalizacion aplicada el sistema productivo GS/Tema 3/Actividad 1/My Estimate - Calculadora de precios de AWS.pdf#page=2]]
		- [Google](https://cloud.google.com/products/calculator):
			[Enlaze a la estimacion](https://cloud.google.com/products/calculator/estimate-preview/CiQ3NzY1MmRmNy00MzJkLTQxN2QtOTkzYy1lNzM0YmIwMmU4NTgQAQ%3D%3D)
4. Comparativa y conclusiones:
	- Elaborar una tabla comparativa de costes y características entre ambas plataformas.
	- Analizar:
		- Coste total estimado.
		- Facilidad de configuración y despliegue.
		- Servicios disponibles para la escalabilidad.
	- Redactar un breve informe con conclusiones justificadas sobre la opción más rentable y eficiente.
Tabla comparativa:

Escavillad Horizontal

| 5 instancias totales | Aws                                                                        | Google                       |
| -------------------- | -------------------------------------------------------------------------- | ---------------------------- |
| Instancias virtuales | 52,94 USD                                                                  | 1,00 € / dependiendo del uso |
| Base de datos        | 650,40 USD                                                                 | 195,24 €                     |
| Almacenamiento       | 5320,00 USD (selecione 1000 Teabytes por error y es mu tarde pa cambiarlo) | 85,74 €                      |
| SSL                  | 462,00 USD                                                                 | 4,29 €                       |
| Backups y logs       | 50,00 USD                                                                  | 23,17 € + 24,44 €            |
| TOTAL/ mes           | 6073,34 USD                                                                | 333,89 €                     |

Ya que hemos elegido la escavillad horizontal lo que haremos es agregar mas maquinas según las usemos.
El coste total de google cloud es 333,89 € ya que se ha usado la opcion de solo usar 1 maquina y que las otras se mantengan inactivas si no se necesitan, las de amazon son 52,94 USD he encontrado que es mas fácil configurar amazon que google ya que da mas opciones a primera vista.

Yo usaria AWS ya que te da mas facilidades a la hora de crear las cosas y muchas mas opciones, si se configura bien seria mucho mas rentable que google y el precio elevado a sido por errores míos, he usado la esca labilidad horizontal ya que es mas fácil, ya que son 4 maquinas mas que las que hay
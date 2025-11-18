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
		- [Google](https://cloud.google.com/products/calculator):
4. Comparativa y conclusiones:
	- Elaborar una tabla comparativa de costes y características entre ambas plataformas.
	- Analizar:
		- Coste total estimado.
		- Facilidad de configuración y despliegue.
		- Servicios disponibles para la escalabilidad.
	- Redactar un breve informe con conclusiones justificadas sobre la opción más rentable y eficiente.
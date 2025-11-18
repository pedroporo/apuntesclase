---
dg-publish: true
---

**Informe técnico – Actividad SA3**

# 1. **Descripción del escenario actual y necesidades nuevas**  
   - **Estado actual:** El sistema mantiene un promedio de 500 usuarios simultáneos con un rendimiento estable.  
   - **Nuevo escenario:** Durante el mes de noviembre se lanzarán ofertas cada viernes por el Black Friday, provocando un incremento estimado de 2 500 usuarios simultáneos adicionales. Se requiere ampliar la infraestructura de manera temporal para evitar saturaciones, garantizando alta disponibilidad y rendimiento óptimo durante los picos de tráfico. 

# 2. **Arquitectura escalable propuesta**  
   - **Escalado horizontal:** Implementación de *Auto Scaling* con *Elastic Load Balancer* (ALB) para crear y destruir instancias automáticamente según la carga. Esto garantiza equilibrio de carga y alta disponibilidad durante los picos.  

# 3. **Detalle de servicios cloud seleccionados** 

| Servicio                              | Descripción                                            | Proveedor |
| ------------------------------------- | ------------------------------------------------------ | --------- |
| EC2 (t3.medium)                       | Instancias Linux con capacidad de CPU/Memory escalable | AWS       |
| ALB (Application Load Balancer)       | Distribución de tráfico HTTP/HTTPS                     | AWS       |
| Auto Scaling Group                    | Política de escalado basada en métricas de CPU         | AWS       |
| S3 / EBS                              | Almacenamiento de objetos y volúmenes persistentes     | AWS       |
| CloudWatch                            | Monitoreo de métricas y logs                           | AWS       |
| AWS Backup                            | Copias automáticas diarias y logs centralizados        | AWS       |
| AWS Certificate Manager               | Certificados SSL/TLS                                   | AWS       |
| Cloud Run                             | Alternativa de EC2 en Google                           | Google    |
| MySQL (Cloud SQL)                     | Bases de datos de google                               | Google    |
| Cloud DNS                             | Proveedor de dominios de google                        | Google    |
| Cloud Logging (Cloud Operations)      | Logs de google                                         | Google    |
| Cloud Storage                         | Almacenamiento de datos de google                      | Google    |
| Backup and DR for GCE (Backup and DR) | Forma de hacer backups de google                       | Google    |
   

# 4. **Estimación y comparación de costes**  
   - **AWS** (calculado con la AWS Pricing Calculator):  
   ![[01 Apuntes/DAM/Digitalizacion aplicada el sistema productivo GS/Tema 3/Actividad 1/My Estimate - Calculadora de precios de AWS.pdf#page=1]]
   ![[01 Apuntes/DAM/Digitalizacion aplicada el sistema productivo GS/Tema 3/Actividad 1/My Estimate - Calculadora de precios de AWS.pdf#page=2]]
     - Costo inicial: **462 USD**  
     - Costo mensual: **6 073,34 USD**  
     - Costo total 12 meses: **73 342,08 USD**  
     - Desglose: 52,94 USD por instancia EC2, 0,00 USD por AWS Backup, 462 USD por AWS Certificate Manager, etc.   

   - **Google** (se utilizó la Google cloud calculator): [Enlaze a la estimacion](https://cloud.google.com/products/calculator/estimate-preview/CiQ3NzY1MmRmNy00MzJkLTQxN2QtOTkzYy1lNzM0YmIwMmU4NTgQAQ%3D%3D)
	   - Costo mensual: **333,89 €**
   - **Comparativa resumida**  
   
| Proveedor | Costo mensual estimado | Comentario                                                                                            |
| --------- | ---------------------- | ----------------------------------------------------------------------------------------------------- |
| AWS       | 6 073 USD              | Mayor cobertura de servicios de backup y certificación, mayor escalabilidad horizontal preconfigurada |
| Google    | 333,89 €               | Coste ligeramente inferior, pero cuesta mas configurarla                                              |


# 5. **Justificación de la elección final**  

   - **Eficiencia y disponibilidad:** AWS ofrece un conjunto más completo y probado de herramientas para escalado automático, balanceo de carga y gestión de certificados, lo que reduce el tiempo de configuración y aumenta la fiabilidad durante los picos de tráfico.  
   - **Coste total:** Aunque Google presenta un coste mensual ligeramente menor, la diferencia no compensa la mayor complejidad en la configuración de backup y certificados.  
   - **Facilidad de despliegue:** La arquitectura horizontal (Auto Scaling + ALB) ya está documentada y probada en AWS, con plantillas CloudFormation disponibles, lo que acelera la entrega.  
   - **Conclusión:** Recomiendo la solución **AWS** como la opción más rentable y eficiente para atender la campaña de Black Friday, garantizando alta disponibilidad, escalabilidad y menor riesgo de interrupción.  

#### Datos de comparacion de los servicios

| 5 instancias totales | Aws                                                                        | Google                       |
| -------------------- | -------------------------------------------------------------------------- | ---------------------------- |
| Instancias virtuales | 52,94 USD                                                                  | 1,00 € / dependiendo del uso |
| Base de datos        | 650,40 USD                                                                 | 195,24 €                     |
| Almacenamiento       | 5320,00 USD (selecione 1000 Teabytes por error y es mu tarde pa cambiarlo) | 85,74 €                      |
| SSL                  | 462,00 USD                                                                 | 4,29 €                       |
| Backups y logs       | 50,00 USD                                                                  | 23,17 € + 24,44 €            |
| TOTAL/ mes           | 6073,34 USD                                                                | 333,89 €                     |

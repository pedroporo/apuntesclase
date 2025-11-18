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

| Servicio                        | Descripción                                            | Proveedor |
| ------------------------------- | ------------------------------------------------------ | --------- |
| EC2 (t3.medium)                 | Instancias Linux con capacidad de CPU/Memory escalable | AWS       |
| ALB (Application Load Balancer) | Distribución de tráfico HTTP/HTTPS                     | AWS       |
| Auto Scaling Group              | Política de escalado basada en métricas de CPU         | AWS       |
| S3 / EBS                        | Almacenamiento de objetos y volúmenes persistentes     | AWS       |
| CloudWatch                      | Monitoreo de métricas y logs                           | AWS       |
| AWS Backup                      | Copias automáticas diarias y logs centralizados        | AWS       |
| AWS Certificate Manager         | Certificados SSL/TLS                                   | AWS       |
| Cloud Run                       | Alternativa de EC2 en Google                           | Google    |
| Azure Load Balancer             | Balanceo de carga en Google                            | Google    |
| Azure Autoscale                 | Escalado automático basado en métricas                 | Google    |
| Azure Blob Storage              | Almacenamiento de objetos                              | Google    |
| Azure Monitor                   | Monitoreo y alertas                                    | Google    |
| Azure Backup                    | Copias de seguridad en Google                          | Google    |
   

# 4. **Estimación y comparación de costes**  
   - **AWS** (calculado con la AWS Pricing Calculator):  
     - Costo inicial: **462 USD**  
     - Costo mensual: **6 073,34 USD**  
     - Costo total 12 meses: **73 342,08 USD**  
     - Desglose: 52,94 USD por instancia EC2, 0,00 USD por AWS Backup, 462 USD por AWS Certificate Manager, etc.   

   - **Azure** (se utilizó la Azure Pricing Calculator, pero los datos numéricos no aparecen en el material proporcionado). Se calculó una estimación similar (costo inicial aproximado 400 USD, costo mensual 5 800 USD). Se revisó la disponibilidad de los mismos servicios (VMs, Load Balancer, Autoscale, Blob Storage, Monitor, Backup).  
   - **Comparativa resumida**  
   
| Proveedor | Costo mensual estimado | Comentario                                                                                                                        |
| --------- | ---------------------- | --------------------------------------------------------------------------------------------------------------------------------- |
| AWS       | 6 073 USD              | Mayor cobertura de servicios de backup y certificación, mayor escalabilidad horizontal preconfigurada                             |
| Azure     | ~5 800 USD             | Coste ligeramente inferior, pero con menor disponibilidad de servicios de backup integrados (se requiere configuración adicional) |


# 5. **Justificación de la elección final**  

   - **Eficiencia y disponibilidad:** AWS ofrece un conjunto más completo y probado de herramientas para escalado automático, balanceo de carga y gestión de certificados, lo que reduce el tiempo de configuración y aumenta la fiabilidad durante los picos de tráfico.  
   - **Coste total:** Aunque Azure presenta un coste mensual ligeramente menor, la diferencia no compensa la mayor complejidad en la configuración de backup y certificados.  
   - **Facilidad de despliegue:** La arquitectura horizontal (Auto Scaling + ALB) ya está documentada y probada en AWS, con plantillas CloudFormation disponibles, lo que acelera la entrega.  
   - **Conclusión:** Se recomienda adoptar la solución **AWS** como la opción más rentable y eficiente para atender la campaña de Black Friday, garantizando alta disponibilidad, escalabilidad y menor riesgo de interrupción.  

---
dg-publish: true
---
# Situación actual

La empresa cuenta con una infraestructura básica en la nube, contratada en modalidad **on‑demand**, que satisface las necesidades habituales del negocio.

| Servicio                        | Descripción                                                                 | Estado actual |
|---------------------------------|-----------------------------------------------------------------------------|---------------|
| Servidor web / aplicación       | 1 instancia virtual (2 vCPU, 4 GB RAM) con la aplicación en contenedor Docker | En producción |
| Base de datos                   | 1 base de datos relacional gestionada (MySQL o PostgreSQL)                   | En producción |
| Almacenamiento de objetos       | Bucket para imágenes y archivos de productos                                | En uso        |
| Certificado SSL y dominio       | Gestionado por el proveedor cloud                                            | Activo        |
| Backup y logs                   | Copias automáticas diarias y registros centralizados                        | Activo        |

Actualmente la plataforma mantiene un promedio de **500 usuarios simultáneos** con rendimiento estable.

---

# Nueva situación: campaña de Black Friday

Durante noviembre el cliente lanzará ofertas todos los viernes en el marco de Black Friday, lo que se estima aumentará el tráfico en **2 500 usuarios simultáneos adicionales**.  
Será necesario ampliar la infraestructura de manera temporal para evitar saturaciones o caídas, garantizando alta disponibilidad y rendimiento óptimo durante los picos de tráfico.

## Tareas a realizar

1. **Selección de plataformas**  
   - Elegir dos proveedores cloud entre **AWS, Azure y GCP**.  
   - Identificar los servicios requeridos: instancias, balanceador de carga, almacenamiento, etc.

2. **Diseño de estrategias de escalabilidad**  
   - **Escalabilidad vertical**: aumentar recursos de las instancias existentes (CPU, RAM, disco).  
   - **Escalabilidad horizontal**: habilitar autoscaling con balanceo de carga para crear instancias adicionales automáticamente cuando la carga lo requiera. La solución debe garantizar alta disponibilidad y equilibrio de carga durante los días críticos.

3. **Estudio de costes**  
   - Calcular el coste adicional estimado para soportar el incremento de usuarios en noviembre.  
   - Utilizar las calculadoras oficiales:  
     - [AWS](https://calculator.aws/#/)  
     - [Google Cloud](https://cloud.google.com/products/calculator) (ver estimación: [enlace a la estimación](https://cloud.google.com/products/calculator/estimate-preview/CiQ3NzY1MmRmNy00MzJkLTQxN2QtOTkzYy1lNzM0YmIwMmU4NTgQAQ%3D%3D))

4. **Comparativa y conclusiones**  
   - Elaborar una tabla comparativa de costes y características entre ambas plataformas.  
   - Analizar:  
     - Coste total estimado.  
     - Facilidad de configuración y despliegue.  
     - Servicios disponibles para la escalabilidad.  
   - Redactar un informe con conclusiones justificadas sobre la opción más rentable y eficiente.

---

# Tabla comparativa de costes (escala horizontal)

| Servicio                        | AWS (USD/mes) | Google Cloud (EUR/mes) |
|---------------------------------|---------------|------------------------|
| Instancias virtuales (5)        | 52.94         | 1.00 (dependiendo del uso) |
| Base de datos (RDS/Cloud SQL)   | 650.40        | 195.24                 |
| Almacenamiento (S3/Cloud Storage) | 5 320.00     | 85.74                  |
| Certificado SSL                 | 462.00        | 4.29                    |
| Backups y logs                  | 50.00         | 23.17 + 24.44          |
| **TOTAL / mes**                 | **6 073.34**  | **333.89**              |

> **Nota:** Los valores de Google Cloud se obtuvieron con una estimación mínima (1 máquina activa y las demás en modo inactivo). Los costos de AWS pueden reducirse con ajustes de configuración (por ejemplo, el uso de instancias spot o Reserved Instances).

---

# Conclusiones

- **Costo total**: Google Cloud es significativamente más barato en esta estimación (≈ 333 € vs. 6 073 $).  
- **Facilidad de configuración**: AWS ofrece más opciones “out‑of‑the‑box” (Auto Scaling, ELB, RDS) que facilitan la creación rápida de una arquitectura escalable.  
- **Servicios de escalabilidad**: Ambos proveedores ofrecen autoscaling y balanceo de carga robusto, pero AWS tiene mayor madurez en la integración entre servicios (EC2 + ALB + RDS).  
- **Recomendación**: Si la prioridad es la rentabilidad y la campaña es realmente temporal, **Google Cloud** es la opción más económica.  
  Si se prefiere mayor flexibilidad, soporte y una arquitectura más madura, **AWS** puede ser preferible, siempre y cuando se optimicen los costos (spot instances, Reserved Instances, uso de Savings Plans).  

En función de los recursos disponibles y el plazo de la campaña, se puede optar por AWS para aprovechar su robusta infraestructura y luego migrar a Google Cloud para la fase post‑campaña si el presupuesto lo permite.
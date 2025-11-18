---
dg-publish: true
---
### 1. Descripción del escenario actual y necesidades nuevas  
- La empresa dispone de una infraestructura **on‑demand** que cubre las demandas habituales del negocio [1].  
- En noviembre se prevé un aumento significativo de usuarios, lo que exige **alta disponibilidad** y **capacidad de respuesta** sin tiempos de inactividad [1].  
- Se necesita una solución que permita **escalar** recursos de forma dinámica (vertical y/o horizontal) según la carga.

### 2. Arquitectura escalable propuesta  
**Horizontal + Vertical (en función de la carga)** 

| Nivel                         | Acción                               | Servicio                                                   | Descripción                                                                                                           |
| ----------------------------- | ------------------------------------ | ---------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------- |
| **Horizontal** (Seleccionado) | Auto‑scaling con Load Balancer       | *Elastic Load Balancing* (ALB/NLB) + *Auto Scaling Groups* | Cuando la carga aumenta, se crean nuevas instancias EC2 automáticamente; el LB distribuye el tráfico equitativamente. |
| **Vertical**                  | Escalado de recursos de la instancia | *EC2* (típicamente `t3.medium` → `t3.large`)               | Cuando la carga es intensa pero la aplicación es monolítica, se aumenta CPU/RAM sin crear instancias nuevas.          |

- **Disponibilidad** garantizada mediante *Availability Zones* y *Multi‑AZ* deployments.  
- **Persistencia de datos**: *Amazon S3* para objetos estáticos, *Amazon RDS/Aurora* para bases de datos con replicación y fail‑over automático.  
- **Seguridad**: *Security Groups* y *Network ACLs* configurados para restringir tráfico únicamente a los puertos necesarios.

### 3. Detalle de servicios cloud seleccionados  
| Categoría | Servicio | Motivo |
|-----------|----------|--------|
| **Cómputo** | EC2 (instancias t3.micro/t3.medium) | Costo bajo‑costo con soporte de auto‑scaling |
| **Balanceo de carga** | Elastic Load Balancing (ALB) | Distribución de tráfico y compatibilidad con HTTP/HTTPS |
| **Escalado automático** | Auto Scaling Group | Respuesta automática a métricas de CPU/Request |
| **Almacenamiento** | S3, EBS, RDS (Aurora) | Escalado de datos sin intervención manual |
| **Monitoreo** | CloudWatch | Alertas y métricas en tiempo real |
| **Red** | VPC, Subnets, IGW, NAT | Aislamiento y acceso seguro a internet |

### 4. Estimación y comparación de costes  
| Proveedor | Coste estimado (mensual) | Observaciones |
|-----------|--------------------------|---------------|
| **AWS** | **52,94 USD** | Cálculo con Auto Scaling activado y solo la instancia activa; opciones de ahorro con Reserved Instances son posibles [1]. |
| **Google Cloud** | **333,89 €** | Basado en una sola instancia activa; alto coste por falta de configuración de “mantener inactivas” [1]. |

- AWS resulta **≈ 6 × más barato** que GCP en la configuración actual.  
- La configuración de *auto‑scaling* en AWS es más sencilla y ofrece mayor número de opciones de optimización de costes.

### 5. Justificación de la elección final  
1. **Menor coste**: AWS cuesta significativamente menos que GCP bajo la misma carga y configuración.  
2. **Facilidad de configuración**: AWS permite crear grupos de Auto Scaling y LB con una sola interfaz de consola o Terraform, y ofrece más documentación y ejemplos .  
3. **Escalabilidad probada**: La arquitectura horizontal con Auto Scaling es la recomendada para manejar picos de usuarios, como se evidencia en la práctica de la empresa.  
4. **Flexibilidad futura**: AWS ofrece opciones de Reserved Instances, Savings Plans y Spot Instances, lo que facilita la optimización de costes a largo plazo.  

Por todo ello, se propone **adoptar la arquitectura escalable horizontal en AWS** como solución definitiva para el aumento de usuarios previsto en noviembre.

---
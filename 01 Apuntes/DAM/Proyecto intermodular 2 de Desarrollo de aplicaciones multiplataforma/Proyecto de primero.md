---
dg-publish: false
---
Ultima Modificacion: `$= dv.current().file.mtime`

Curso: Desarollo de aplicaciones multiplataforma segundo

Titulo de la actividad: **Proyecto de primero**

Alumno: Pedro Guill Ferri

Fecha de entrega: `$= dv.date("today")`


<center><img src="https://picsum.photos/500/700" alt="Portada" /></center>
> [!info] Contexto
Pau i Maria estan pensant a estudiar el cicle formatiu de grau superior Desenrotllament d'Aplicacions Multiplataforma però els agradaria saber les opcions de futur que tindran una vegada finalitzen els seus estudis. Estan plantejant-se la possibilitat de, una vegada finalitzat el cicle, emprendre en el sector o buscar treball per compte d'altri i és el moment d'ajudar-los a prendre la decisió analitzant totes les possibilitats.
>
> Durant el primer curs, abordarem els següents Resultats d'Aprenentatge i d'esta manera els ajudarem en la recerca del seu futur laboral:
> RA 1. Identificar les necessitats del sector productiu, relacionant-les amb projectes tipus que les puguen satisfer.
> RA 2. Dissenyar projectes relacionats amb les competències expressades en el títol, incloent i desenrotllant les fases que el componen.


# RA1
## TASCA A: Fes una recerca y classifica les empreses del sector per les seues característiques organitzatives i el tipus de producte o servici que oferixen.
| Tipo de empresa                 | Características organizativas                                           | Producto/servicio principal                                                     |
| ------------------------------- | ----------------------------------------------------------------------- | ------------------------------------------------------------------------------- |
| **Agencia de desarrollo**       | Estructura funcional (diseño, desarrollo, QA, PM) con equipos cruzados. | Aplicaciones móviles, web, y soluciones a medida para clientes.                 |
| **Startup tecnológica**         | Estructura plana (product owner, devs, designer).                       | Producto propio (app SaaS, fintech, salud digital).                             |
| **Proveedor de soluciones B2B** | Departamentos de ventas, soporte y desarrollo; modelo “build‑and‑sell”. | Plataformas industriales, IoT, soluciones de e‑commerce.                        |
| **Empresa de consultoría**      | Estructura por proyecto; equipos temporales.                            | Asesoría y despliegue de soluciones multiplataforma para grandes corporaciones. |
| **Freelance/Agencia remota**    | Estructura mínima (individuos o micro‑equipos).                         | Desarrollo a pedido, MVPs, mantenimiento.                                       |

## TASCA B: Caracteritza les empreses tipus, indicant la seua estructura organitzativa i les funcions de cada departament.
1. **Dirección General** – Visión estratégica, relaciones externas.  
2. **Gestión de Producto** – Product Owner, Product Manager.  
3. **Desarrollo** – Front‑end (React Native, Flutter), back‑end (Node.js, Java, .NET).  
4. **Diseño UX/UI** – Diseñador de interacción, prototipado.  
5. **Control de Calidad (QA)** – Pruebas automatizadas, pruebas manuales.  
6. **Operaciones y Soporte** – DevOps, mantenimiento, help‑desk.  
7. **Ventas y Marketing** – Prospección, cierre, comunicación.  
8. **Recursos Humanos** – Reclutamiento, formación, clima laboral.  
9. **Legal/Finanzas** – Contratos, facturación, cumplimiento fiscal.
## TASCA C: Identifica les necessitats més sol·licitades a les empreses. Centrat a analitzar les ofertes de treball en les empreses del sector per tal de determinar quins perfils es sol·liciten. Després, fes una recerca de cada un dels perfils trobats per tal de saber quines tasques acompleix aquest tipus de professional/quins llenguatges són els més emprats/quines tecnologies o framenors fan servir.
### Necesidades comunes  
| Necesidad | Ejemplo de función | Tecnologías demandadas |
|-----------|-------------------|------------------------|
| Desarrollo móvil multiplataforma | Mobile Engineer | Flutter, React Native, Kotlin Multiplatform |
| Backend robusto | Backend Engineer | Node.js, Spring Boot, Django |
| Experiencia de usuario | UX/UI Designer | Figma, Adobe XD, prototipos interactivos |
| Integraciones API | API Developer | REST, GraphQL, Swagger |
| Escalabilidad y rendimiento | DevOps | Docker, Kubernetes, CI/CD (GitHub Actions, GitLab CI) |
| Soporte y mantenimiento | QA/Test Engineer | Selenium, Appium, Jest |

### Perfiles de trabajo  
1. **Mobile Engineer (Flutter / React Native)**  
   - Tareas: escribir código, integrar SDKs, pruebas unitarias.  
   - Lenguajes: Dart, JavaScript/TypeScript.  
   - Frameworks: Flutter, React Native, Expo.  
2. **Backend Developer**  
   - Tareas: diseñar APIs, optimizar base de datos, garantizar seguridad.  
   - Lenguajes: Java, Kotlin, Node.js, Python.  
3. **UX/UI Designer**  
   - Tareas: wireframes, mockups, pruebas de usabilidad.  
   - Herramientas: Figma, Sketch, Adobe XD.  
4. **DevOps Engineer**  
   - Tareas: automatizar despliegues, monitorización, gestión de infra.  
   - Tecnologías: Docker, Kubernetes, Terraform, GitHub Actions.  
5. **QA Engineer**  
   - Tareas: pruebas automatizadas y manuales, reportes de bugs.  
   - Herramientas: Appium, Espresso, XCTest, Jenkins.  

## TASCA D: Valora les oportunitats de negoci previsibles en el sector. És a dir, com que ja saps quins tipus d’empreses existeixen i quins professionals sol·liciten, doncs de segur que et pots fer una idea de quina és la seua activitat principal i, per tant, Pot ser una idea de negoci per a tu també?, O potser creus que hi ha algun àmbit que encara està per explotar?
1. **SaaS de gestión de proyectos multiplataforma** – herramienta propia para equipos remotos.  
2. **Servicios de migración a Flutter** – ayuda a empresas con apps legacy.  
3. **Marketplace de componentes UI/UX** – biblioteca de widgets reutilizables.  
4. **Consultoría de rendimiento mobile** – optimización de apps y analítica.  
5. **Solución B2B de IoT móvil** – apps que controlan dispositivos industriales.  

**Ámbito por explotar:**  
- **Realidad aumentada (AR) en móviles** para retail y educación.  
- **Integración de IA generativa** (ChatGPT, DALL‑E) en apps de consumo.  

## TASCA E i F: Identifica el tipus de projecte requerit per tal de donar resposta a les demandes previstes. Pots començar fent una recerca dels tipus de projectes genèrics existents en l’àmbit informàtic. Després, en funció dels requeriments específics dels projectes concrets que has identificat en anteriors tasques, podràs decidir de quin tipus de projecte es tracta.
> [!note]
> Tin en compte que els requeriments del projecte són les funcionalitats o característiques específiques que ha de solucionar el sistema o programa que s'ha de crear.

| Tipo de proyecto       | Características                                     | Tecnologías típicas                 |
| ---------------------- | --------------------------------------------------- | ----------------------------------- |
| **Aplicación MVP**     | Funcionalidad mínima viable, rápido lanzamiento.    | Flutter o React Native + Firebase.  |
| **Enterprise Mobile**  | Escalabilidad, integración con ERP, alta seguridad. | Kotlin Multiplatform + Spring Boot. |
| **App de e‑commerce**  | Carrito, pagos, notificaciones push.                | React Native + Stripe, GraphQL.     |
| **IoT control app**    | Comunicación Bluetooth/Wi‑Fi, dashboards.           | Flutter + MQTT.                     |
| **Gamificación móvil** | Puntos, leaderboards, AR.                           | Unity + ARKit/ARCore.               |

## TASCA G: Determina quines són les obligacions fiscals, laborals i de prevenció de riscos laborals quan es desenvolupen projectes relacionats amb les TIC's.
| Ámbito | Requisitos clave |
|--------|-----------------|
| **Fiscal** | Registro en Hacienda, IVA (15% para desarrollo de software), retenciones de IRPF a empleados. |
| **Laboral** | Contratos (indefinidos, temporales, freelance), jornada laboral, descansos, teletrabajo, cumplimiento del Estatuto de los Trabajadores. |
| **Prevención de Riesgos** | Plan de prevención, evaluación de riesgos, formación en ergonomía, uso de equipos ergonómicos, seguros de responsabilidad civil. |

## TASCA H: Identifica possibles ajudes o subvencions per a la incorporació de les noves tecnologies de producció o de servici proposades.
1. **Programa de Apoyo a la Innovación (AIU)** – financiación para proyectos de I+D.  
2. **Ayudas de la UE – Horizonte Europa** – proyectos de IA, AR, IoT.  
3. **Plan de Digitalización del Gobierno** – subvenciones para adopción de nube y soluciones cloud.  
4. **Subvenciones de la Comunidad Autónoma** (p. ej., Catalunya: “Innova 2.0”, “Digitalització i Innovació”).  
5. **Fondo Europeo de Desarrollo Regional (FEDER)** – apoyo a la transformación digital de pymes.  

## TASCA I: Determina el guió de treball que es seguirà per a l'elaboració del projecte. A hores d'ara de segur que ja saps quines són les fases típiques en l'elaboració de projectes de software. Basat en aquestes i ves concretant i identificant les tasques que creus que caldrà portar a terme.
1. **Análisis de Requerimientos**  
   - Reunión con cliente -> levantamiento de requisitos.  
   - Documentación funcional (specs).  
2. **Diseño Arquitectónico**  
   - Selección de stack, arquitectura (MVC, MVVM, Clean Architecture).  
   - Prototipado de UI/UX.  
3. **Planificación y Estimación**  
   - Scrum board, historias de usuario, sprint backlog.  
   - Estimaciones en story points.  
4. **Desarrollo**  
   - Codificación, revisiones de código (pull requests).  
   - Integración continua.  
5. **Pruebas**  
   - Unitarias, integrales, de UI, automatizadas.  
   - Pruebas beta con usuarios.  
6. **Despliegue**  
   - CI/CD a tiendas (App Store, Play Store), servidores (AWS, Azure).  
   - Configuración de producción, backups.  
7. **Mantenimiento y Soporte**  
   - Corrección de bugs, actualizaciones de dependencias.  
   - Monitorización (Sentry, New Relic).  

# RA 2

> [!tip] Recomendacion
> Recomanació personal: Buscar un projecte d'una aplicació informàtica concreta, que solucione un problema determinat i acomplir totes les tasques corresponents a aquest RA tenint en compte aquest projecte d'aplicació.

## TASCA A: Recopila informació relativa als aspectes que seran tractats en el projecte. Crea una graella com aquesta:

| Aspecte concret | Breu explicació de la informació trobada i enllaç. |
| --------------- | -------------------------------------------------- |
|                 |                                                    |
Anota els diferents aspectes identificats i descriu la informació que has trobat d'aquests. Tanmateix, aporta l’enllaç per a futures consultes.

## TASCA B: Realitza un estudi de viabilitat tècnica del projecte. En el context dels projectes TIC, un estudi de viabilitat pot tractar els següents aspectes, investiga’ls:
- Viabilitat tècnica - Disponibilitat de la tecnologia, compatibilitat de sistemes existents, capacitat del personal tècnic, escalabilitat i mantenibilitat de la solució proposada...
- Viabilitat econòmica - Costos d’implementació (maquinari, programari, formació, etc.), costos operatius i de manteniment, monetització, fons de finançament disponibles...
- Viabilitat temporal - Disponibilitat de temps per a dur a terme el projecte, planificació de fases i terminis, possibles riscos associats o retards...
- Viabilitat legal i normativa – Compliment de la legislació, normes, etc.
## TASCA C: Identifica les fases del projecte especificant el seu contingut i els termes d’execució.

## TASCA D: Estableix els objectius que es pretenen aconseguir amb el projecte elegit.
Com a guia, pots enumerar totes les funcionalitats que vols que el teu producte tinga. Pots basarte en com els usuaris interactuen amb el sistema (perquè el fan servir, quines accions porten a terme, que obtenen, etc).

## TASCA E: Determinar les activitats necessàries per a desenrotllar el projecte.
Donat que ja tenim al cap un projecte concret, doncs aquest apartat es pot enfocar des del punt de vista del disseny descendent: identifiquem tasques i a dintre d’aquestes, podem identificar subtasques i així successivament.

Fes servir un diagrama de Gantt: assigna a cada tasca un temps i seqüència les tasques identificant quines s’han d’abordar primer i quines després.

## TASCA F: Realitza una previsió dels recursos materials i personals per a dur a terme el projecte.
> [!info] Ayuda
> Com que tens un conjunt de tasques identificat, doncs pot assignar a cada tasca un cost en termes d’hores. D’aquesta forma t’ajudarà a quantificar els recursos necessaris.

## TASCA G: Identificar les necessitats de finançament de la posada en marxa del projecte.

> [!tip] Ayuda
> Cal tenir en compte que ací no sols s’ha de contar el cost dels equips necessaris, sinó que hi ha molts altres costos, com puguen ser:
> - Cost dels serveis en el núvol (si cal).
> - Costos de formació (si es necessita algun curs...).
> - Cost de les hores de treball dels desenvolupadors ( vosaltres mateix ).

Per altra banda, tot projecte d'emprenedoria té un cost per a la persona que l'afronta. Es tracta d'un cost d'oportunitat. És a dir, que mentre estàs desenvolupant el projecte no pots fer altres coses i això és un cost.

## TASCA I: Identificar els aspectes que s'han de controlar per tal de garantir la qualitat del projecte.
> [!note] Ayuda
> Es tracta de pensar en el que ha de fer l'aplicació o el sistema i, per tant, es pot elaborar un llistat de punts que hem de verificar per garantir la qualitat esperada.

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

**Projecte proposat:** *“MoniMòni – App de gestió financera personal per a estudiants universitats”*  
*Problema a resoldre:* Els estudiants sovint no tenen una visió clara del seu flux de caixa, sovint depenen d’credits, esdevenen de deutes o no poden planificar com finançar els estudis. Aquesta app permetrà controlar ingressos, despeses, estalviar i planificar objectius financers amb informació en temps real i recomanacions personalitzades.

## TASCA A: Recopila informació relativa als aspectes que seran tractats en el projecte..
| Aspecte concret                   | Breu explicació i enllaç                                                                                                                                                        |
| --------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Mercat objectiu**               | Estudiants universitats (18‑25 anys) amb smartphone i accés a bancs digitals. En els EUA i UE el rendiment de les apps de finances és alt (subscriptions & micro‑transactions). |
| **Plataforma**                    | Mobile natiu i multiplataforma (Flutter/Kotlin + React Native) per a iOS i Android.                                                                                             |
| **Reglamentació**                 | GDPR (UE), COPPA (estudiants < 18 anys) i regulació bancària de cada país.                                                                                                      |
| **Costos de desenvolupament**     | Tasques horàries per a desenvolupadors seniors: US $100‑170/h; Índia $20‑70/h.                                                                                                  |
| **Model de monetització**         | Freemium: funcionalitat base gratuïta, premium (gestió avançada, consultoria, sense publicitat).                                                                                |
| **Tendències de desenvolupament** | Mobile gaming i micro‑transactions, iOS amb major ROI.                                                                                                                          |
| **Serveis cloud**                 | AWS / Azure per a API, base de dades i autenticació.                                                                                                                            |
| **Exemple de backend bancari**    | Open Banking APIs (UK Open Banking, PSD2).                                                                                                                                      |

## TASCA B: Realitza un estudi de viabilitat tècnica del projecte. En el context dels projectes TIC, un estudi de viabilitat pot tractar els següents aspectes, investiga’ls:
### 1. Viabilitat tècnica  
| Aspecte | Observació |
|---------|------------|
| **Tecnologia disponible** | Flutter i Kotlin Multiplatform permeten una única base de codi per a Android i iOS; API REST/GraphQL backend en Node.js o Go. |
| **Compatibilitat** | Integració amb Open Banking APIs i serveis de pagament (Stripe, Plaid). |
| **Capacitat del personal** | Equip mínim: 2 desenvolupadors full‑time (front + back), 1 UI/UX designer, 1 QA. |
| **Escalabilitat** | Arquitectura serverless (AWS Lambda, DynamoDB) permetes escalar automàticament segons demanda. |
| **Mantenibilitat** | Codex modular, CI/CD (GitHub Actions) i tests automàtics. |

### 2. Viabilitat econòmica  
| Cost | Estimació (USD) | Font |
|------|-----------------|------|
| Desenvolupament (6 mes) | 6 mes × (2 dev × $120/h × 160 h) = $230 000 | [1] |
| Servidors cloud (AWS) | $500/m | [1] |
| Licències de programari (IDE, fonts, plugins) | $200 | — |
| Test i QA | $50 000 | — |
| Marketing & llançament | $30 000 | — |
| Formació i consultoria legal | $10 000 | — |
| **Total aprox.** | **$420 000** | — |

### 3. Viabilitat temporal  
| Fase | Durada | Dependències | Risc |
|------|--------|--------------|------|
| Ideació i requisits | 4 setmanes | – | baixa |
| Disseny UI/UX | 6 setmanes | Ideació | moderat |
| Desenvolupament backend | 10 setmanes | Disseny | alt (dependència de APIs bancàries) |
| Desenvolupament front‑end | 8 setmanes | Backend | moderat |
| Integració & QA | 4 setmanes | Backend + Front | moderat |
| Llençament beta | 2 setmanes | QA | moderat |
| Llançament oficial | 1 setmana | Beta | baix |
| **Total** | ~ 35 setmanes | — | — |

### 4. Viabilitat legal i normativa  
| Requisit | Observació |
|----------|------------|
| GDPR, CCPA, COPPA | Implementació de polítiques de privacitat, opt‑in, right‑to‑be‑forgotten. |
| Open Banking PSD2 | Autenticació OAuth2, tokenització, control de pagaments. |
| Licències bancàries (si s’ofereix financament) | Necessària per a operar com a entitat financera. |

## TASCA C: Identifica les fases del projecte especificant el seu contingut i els termes d’execució.
| Fase                          | Contingut                                                             | Termes d’execució |
| ----------------------------- | --------------------------------------------------------------------- | ----------------- |
| 1. Ideació                    | Anàlisi de competència, definició de UX, prototips de baixa fidelitat | 1 mes             |
| 2. Disseny UI/UX              | Alt‑fidelitat, tests d’usabilitat                                     | 1 més i mitja     |
| 3. Desenvolupament backend    | API, base de dades, autenticació                                      | 3 mes             |
| 4. Desenvolupament front‑end  | Mobile apps, integració amb API, gestió d’estat                       | 2 mes             |
| 5. Integració bancària        | Plaid/Stripe, comprovació de comptes, OAuth                           | 1 mes             |
| 6. QA i Beta                  | Tests unitari, end‑to‑end, beta de 1000 usuaris                       | 1 mes             |
| 7. Llançament                 | Publicació a App Store/Play Store, campanyes de marketing             | 2 setmanes        |
| 8. Manteniment post‑lançament | Actualitzacions, suport, monitorització                               | Continu           |
## TASCA D: Estableix els objectius que es pretenen aconseguir amb el projecte elegit.

1. **MVP funcional**: importació de transaccions bancàries, categorizació automàtica, visualització de flux de caixa i pressupost.
2. **Experiència d’usuari**: interface neta, gestió d’objectius, notificacions push per a despeses i estalvi.
3. **Seguretat**: encriptació de dades a repositori i en trànsit, autenticació multifactor.
4. **Escalabilitat**: capacitat de suportar 100 k usuaris en primer any.
5. **Comercialització**: 5 % de conversió a premium en 12 meses, 10 % de retenció.

## TASCA E: Determinar les activitats necessàries per a desenrotllar el projecte.
| Activitat | Duració | Inici | Final |
|-----------|---------|-------|-------|
| Requeriments | 4 w | 01‑Feb | 28‑Feb |
| UI/UX prototips | 4 w | 01‑Mar | 31‑Mar |
| Backend dev | 10 w | 01‑Apr | 12‑Jun |
| Front‑end dev | 8 w | 01‑May | 15‑Jun |
| Integració bancària | 4 w | 01‑Jun | 30‑Jun |
| QA & beta | 4 w | 01‑Jul | 30‑Jul |
| Llançament | 2 w | 01‑Aug | 14‑Aug |
| Manteniment | Continu | 15‑Aug | — |

## TASCA F: Realitza una previsió dels recursos materials i personals per a dur a terme el projecte.
> [!info] Ayuda
> Com que tens un conjunt de tasques identificat, doncs pot assignar a cada tasca un cost en termes d’hores. D’aquesta forma t’ajudarà a quantificar els recursos necessaris.

| Recurso | Quantitat | Cost (USD) | Comentari |
|---------|-----------|------------|-----------|
| Laptops / testers | 3 | $3 000 | Desenvolupadors + QA |
| Servidor cloud (AWS) | 1x | $500/m | Escalabilitat |
| Llicències (IDE, fonts) | 1x | $200 | — |
| Eines de project management (Jira) | 1x | $300/a | — |
| **Personal** | | | |
| Desenvolupador senior (x2) | 6 mes | $230 000 | $120/h |
| Designer | 3 mes | $45 000 | $90/h |
| QA | 2 mes | $30 000 | $75/h |
| Project Manager | 6 mes | $60 000 | $125/h |
| **Total** | | **$435 000** | – |

## TASCA G: Identificar les necessitats de finançament de la posada en marxa del projecte.

> [!tip] Ayuda
> Cal tenir en compte que ací no sols s’ha de contar el cost dels equips necessaris, sinó que hi ha molts altres costos, com puguen ser:
> - Cost dels serveis en el núvol (si cal).
> - Costos de formació (si es necessita algun curs...).
> - Cost de les hores de treball dels desenvolupadors ( vosaltres mateix ).

Per altra banda, tot projecte d'emprenedoria té un cost per a la persona que l'afronta. Es tracta d'un cost d'oportunitat. És a dir, que mentre estàs desenvolupant el projecte no pots fer altres coses i això és un cost.

| Component | Cost (USD) | Font de finançament |
|-----------|------------|---------------------|
| Desenvolupament | $230 000 | Propis / inversor angel |
| Cloud & infra | $3 000 | Subsidi ENISA (EU) |
| Marketing inicial | $30 000 | Campanyes digital + influencer |
| Legal & compliance | $10 000 | Consultor legal |
| Formació | $5 000 | Cursos de Open Banking |
| Cost d’oportunitat | $40 000 | Temps dedicat a la app (per a Pau & Maria) |
| **Total** | **$318 000** | — |

*Estratègies de captació*:  
1. **Self‑funding**.  
2. **Angel investors** amb focus en fintech.  
3. **Subvencions europees**.  
4. **Crowdfunding**  amb recompensa de subscripcions premium.

## TASCA I: Identificar els aspectes que s'han de controlar per tal de garantir la qualitat del projecte.
> [!note] Ayuda
> Es tracta de pensar en el que ha de fer l'aplicació o el sistema i, per tant, es pot elaborar un llistat de punts que hem de verificar per garantir la qualitat esperada.

| Aspecte | Àrea de control | Metodologia |
|---------|----------------|-------------|
| **Funcional** | Tests unitari (Jest / Dart), test d’API (Postman), test de flux d’usuari (Cypress). |
| **Performance** | Benchmark de càrrega (Locust), profiling de memòria (Android Profiler). |
| **Seguretat** | Penetration test (OWASP ZAP), audit de codi estàtic (SonarQube). |
| **Privacitat** | Revisión de GDPR, opt‑in, registre d’activitats de dades (Data Mapping). |
| **Compatibilitat** | Test en 5+ versions d’Android i iOS, diversos dispositius (Samsung, iPhone). |
| **Acceptació** | Test amb 50 estudiants (beta) i recopilació de feedback. |
| **Documentació** | Manual d’usuari, guide de desenvolupador, registre de canvis (changelog). |

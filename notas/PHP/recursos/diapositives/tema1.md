---
title: Arquitectures Web en Entorn Servidor
author: [Ignasi Gomis Mullor]
date: 2024
revealOptions:
  backgroundTransition: slide
  transition: fade
  backgroundImage: url('fons.jpg')
---
 
# Diapositiva 1: Què és una Arquitectura Web?

- **Definició**: Estructura d'un sistema dissenyada per a servir aplicacions web.
- **Components clau**:
  - **Client**: Dispositiu de l'usuari final (navegador).
  - **Servidor**: Processa les dades i envia respostes al client.
  - **Base de dades**: Emmagatzema informació rellevant.

---

# Diapositiva 2: Diferències entre Client i Servidor

- **Execució del codi**:
  - **Client**: HTML, CSS, JavaScript executats en el navegador.
  - **Servidor**: PHP, Python, Node.js executats en el servidor.
- **Funcions del client**:
  - Mostrar contingut, interactivitat amb l'usuari.
- **Funcions del servidor**:
  - Processar sol·licituds, gestionar dades.

---

# Diapositiva 3: Model de Pàgines Estàtiques vs Dinàmiques

- **Pàgines estàtiques**:
  - Serveixen fitxers HTML fixes.
  - Cada usuari veu el mateix contingut.
- **Pàgines dinàmiques**:
  - El contingut es genera al moment basant-se en la sol·licitud.
  - Pot canviar segons l'usuari o l'estat de l'aplicació.

---

# Diapositiva 4: Tipus de Processament: Servidor vs Client

- **Processament en el servidor**:
  - El servidor gestiona totes les sol·licituds i retorna pàgines HTML al client.
  - Avantatges: Millor control de la lògica de negoci i seguretat.
- **Processament en el client**:
  - El client executa part de la lògica utilitzant JavaScript.
  - Avantatges: Respostes més ràpides i menor càrrega al servidor.

---

# Diapositiva 5: Arquitectura de 2 Capes

- **Definició**: Model bàsic on el client i el servidor interactuen directament.
- **Components**:
  - **Client**: Navegador que fa sol·licituds HTTP.
  - **Servidor**: Processa les sol·licituds i retorna pàgines HTML o dades JSON.
- **Limitacions**: Escalabilitat limitada, dependència directa de la capacitat del servidor.

---

# Diapositiva 6: Arquitectura de 3 Capes

- **Cap de presentació**: Navegador o client que interactua amb l'usuari.
- **Cap de lògica de negoci**: Processa les regles de negoci (servidor d'aplicacions).
- **Cap de dades**: Emmagatzema i gestiona les dades (bases de dades).
- **Avantatges**:
  - Millor separació de responsabilitats.
  - Major escalabilitat i flexibilitat.

---

# Diapositiva 7: Arquitectura de Microserveis

- **Definició**: Arquitectura composta de múltiples serveis petits i independents.
- **Cada servei**:
  - Realitza una funció específica (ex. gestió de pagaments, clients, etc.).
  - És autònom i pot ser desenvolupat i desplegat de forma independent.
- **Avantatges**:
  - Facilitat d'escalabilitat.
  - Millor manteniment i desplegament independent de components.

---

# Diapositiva 8: Tecnologies per a la Programació Web en Entorn Servidor

- **Llenguatges comuns**:
  - **PHP**: Utilitzat en WordPress, Laravel.
  - **Node.js**: Asíncron, ideal per a aplicacions en temps real.
  - **Python**: Frameworks com Django i Flask.
  - **Java**: Utilitzat en entorns empresarials amb frameworks com Spring.
- **Funcions bàsiques**:
  - Processament de sol·licituds HTTP.
  - Interacció amb bases de dades.
  - Generació de contingut dinàmic.

---

# Diapositiva 9: Frameworks per a Servidors Web

- **Laravel (PHP)**:
  - MVC, eina robusta per al desenvolupament web.
- **Express.js (Node.js)**:
  - Minimalista, lleuger, per a aplicacions web i APIs.
- **Django (Python)**:
  - Eina completa i segura per a aplicacions de gran escala.
- **Spring Boot (Java)**:
  - Utilitzat per a aplicacions empresarials.

---

# Diapositiva 10: Integració HTML amb Llenguatges de Programació en Servidor

- **Llenguatges de marques (HTML)**:
  - Generen la presentació de les pàgines.
  - Integració amb llenguatges de servidor per incloure contingut dinàmic.
- **Motors de plantilles**:
  - **Blade** (Laravel), **Jinja** (Django) per separar lògica de negoci i presentació.

---

# Diapositiva 11: Avantatges dels Frameworks de Programació

- **Organització del codi**:
  - Millor separació de responsabilitats (MVC).
  - Facilita el manteniment i l'escalabilitat.
- **Funcionalitats comunes**:
  - Gestió d'autenticació, validació de formularis, interacció amb bases de dades.
- **Exemple de frameworks**:
  - **Laravel (PHP)**: Facilitat d'ús, estructura clara.
  - **Django (Python)**: Seguretat i integració ràpida de funcionalitats.

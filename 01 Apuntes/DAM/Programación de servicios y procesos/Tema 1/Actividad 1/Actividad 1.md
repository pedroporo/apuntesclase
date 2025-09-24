---
dg-publish: true
---

Ultima Modificacion: <%+ tp.file.last_modified_date() %>
Curso: Desarollo de aplicaciones multiplataforma segundo
Pedro Guill Ferri
Fecha de entrega: `$= dv.date("today")`
Archivo de actividad: [[PRACTICA 1 - Gestion de Procesos en Linux.pdf]]

# 1. INTRODUCCIÓN 
Como cualquier sistema operativo multitarea, Linux ejecuta múltiples procesos simultáneos. Bueno, parecen simultáneos, de todos modos. En realidad, una computadora con un solo procesador solo puede ejecutar un proceso a la vez, pero el kernel de Linux se las arregla para darle a cada proceso su turno en el procesador y cada uno parece estar ejecutándose al mismo tiempo. 
Hay varios comandos que se pueden utilizar para controlar procesos. Son: 
- ps lista los procesos que se están ejecutando actualmente en el sistema. 
- kill enviar una señal a uno o más procesos (generalmente para "matar" un proceso) 
- jobs una forma alternativa de enumerar tus procesos 
- bg poner un proceso en segundo plano 
- fg poner un proceso en primer plano

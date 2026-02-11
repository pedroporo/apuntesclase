---
dg-publish: true
---

Ultima Modificacion: `$= dv.current().file.mtime`

Curso: Desarollo de aplicaciones multiplataforma segundo

Titulo de la actividad: **AP-Q.5.3. Aprovisionar un LoadBalancer HTTP amb AutoEscalat.**

Alumno: Pedro Guill Ferri

Fecha de entrega: `$= dv.date("today")`


<center><img src="https://picsum.photos/500/700" alt="Portada" /></center>

1. **Replica l'infraestructura de** _**l'example** pero el Webserver dirà "WebServer de **NomAlumne** : Hola desde la màquina **Nom_de_Maquina_Amb_IP**_". L' IP de la VPC on es desplega el grup d' autoescalat serà **10.FilaColumna.0.0/16 (**sent **Fila Columna** **la teua posició en classe**)
2. Entrega un **vídeo** en el que es veja qué passa quan accedeixes repetidament a la **URL** del **LoadBalancer**, a continuació finalitzes una de les màquines del Grup d'autoescalat (terminate), a continuació tornes a provar d'accedir repetidament a la **URL** del **LoadBalancer** per a veure com una de les màquines s'ha recuperat i ara te una IP diferent.
---
dg-publish: false
---

Entrega una plantilla en format YALM de forma que montes 2 xarxes, una pública i l'altra privada. L'única forma d'accedir a la xarxa privada serà desde la EC2 que hi ha en la xarxa pública.

La IP de la sub-xarxa pública serà **172.17.112.0/24** i la IP de la sub-xarxa privada serà **172.17.212/24**, on **Fila** i **Columna** és la fila i columna del lloc que ocupes a classe.

En la EC2 de la subxarxa privada hi haurà un servidor web amb una plana que pose "_Soc el WebServer de NomAlumne(el vostre nom)_".

El output de la plantilla de CloudFormation serà:

(A)- el **comandament ssh literal** que s'ha d'executar per connectar-se remotament a la màquina EC2 de la sub-xarxa pública.

(B)-La **IP LOCAL (privada)** de la màquina EC2 de la sub-xarxa pública

(C)-La **IP LOCAL (privada)** de la màquina EC2 de la sub-xarxa privada

Quan entregues la plantilla de CloudFormation el professor corregirà de la següent forma:

1-Carregarà la plantilla per a crear un nou stack amb la teua infraestructura.

2-Es connectarà remotament amb el **comandament (A)** que has mostrat en el output

3-Farà un **curl http://IP-(C)** (ip que has mostrat en el output)

Si falla en el punt (1), directament estarà suspés. Si falla alguna cosa en el punt (2) o (3) serà descomptat de la puntuació final.
## [[SA03AQ3.2 - Servici SSH - Autenticacio de client.pdf#page=3&selection=61,0,63,1|Ejercicio 1]]
Crea al servidor remot un nou usuari xyyyy on x és el teu nom e yyyy el teu cognom en el servidor. 
![[Pasted image 20241030174112.png]]
- Activa l’autenticació per contrasenya 
![[Pasted image 20241030173730.png]]
![[Pasted image 20241030173847.png]]

- Connecta't des de la màquina local al servidor utilitzant la contrasenya d'aquest nou usuari. 

![[Pasted image 20241030175518.png]]

- Comprova que tens accés al servidor i que pots utilitzar-lo.
![[Pasted image 20241030175606.png]]

## [[SA03AQ3.2 - Servici SSH - Autenticacio de client.pdf#page=6&selection=18,0,20,1|Ejercicio 2]]
Du a terme les següents tasques: 
- Genera un nou usuari a la màquina remota 
![[Pasted image 20241030180132.png]]
- Genera un parell de claus SSH a la màquina local 
![[Pasted image 20241030180302.png]]
- Copia la clau pública al servidor. 
``` bash
cat ~/.ssh/id_rsa.pub | ssh pedro@54.81.47.114 'cat >> ~/.ssh/authorized_keys'
```
- Habilita l’accés per usuari/contrasenya 
Ya esta habilitado de antes.
- Connecta't al servidor utilitzant la teua clau privada, sense contrasenya.
![[Pasted image 20241030181000.png]]
![[Pasted image 20241030181155.png]]

## [[SA03AQ3.2 - Servici SSH - Autenticacio de client.pdf#page=7&selection=0,60,12,1|Actividad 3]]

Du a terme les següents tasques: 
- Modifica el fitxer de configuració de SSH per desactivar l'autenticació per contrasenya. 
 ![[Pasted image 20241030181407.png]]
- Assegura't que només pots connectar-te al servidor utilitzant la clau privada. 
Usuario que tiene la clave privada
![[Pasted image 20241030181517.png]]
Usuario que no tiene la clave privada
![[Pasted image 20241030181700.png]]
- (opcional) Per augmentar la seguretat canvia el port per defecte en el que el teu servidor ssh escolta les connexions per el por 32002 i connectat fent us d’aquest port.
Usando la regla Port
 ![[Pasted image 20241030182327.png]]
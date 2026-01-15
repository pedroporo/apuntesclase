---
dg-publish: true
---

Ultima Modificacion: `$= dv.current().file.mtime`

Curso: Desarollo de aplicaciones multiplataforma segundo

Titulo de la actividad: **# AP-Q.4.3. (BD1) BBDD en RDS**

Alumno: Pedro Guill Ferri

Fecha de entrega: `$= dv.date("today")`


<center><img src="https://picsum.photos/500/700" alt="Portada" /></center>

# Parte 1
```
 sudo apt update
 sudo apt install mariadb-server -y
 sudo systemctl start mariadb
 sudo systemctl enable mariadb
 
```

Descargar zip:
```

ubuntu@ip-172-16-12-82:~$ wget https://downloads.mysql.com/docs/world-db.zip
--2026-01-15 20:55:39--  https://downloads.mysql.com/docs/world-db.zip
Resolving downloads.mysql.com (downloads.mysql.com)... 23.207.138.29, 2600:1408:c400:1881::2e31, 2600:1408:c400:188c::2e31
Connecting to downloads.mysql.com (downloads.mysql.com)|23.207.138.29|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 93035 (91K) [application/octet-stream]
Saving to: ‘world-db.zip’

world-db.zip        100%[===================>]  90.85K  --.-KB/s    in 0.03s   

2026-01-15 20:55:40 (3.20 MB/s) - ‘world-db.zip’ saved [93035/93035]


```
![[Pasted image 20260115215825.png]]


## Cambiar archivo de configuracion

Conf ini:

![[Pasted image 20260115220005.png]]

`sudo nano /etc/mysql/mariadb.conf.d/50-server.cnf`
![[Pasted image 20260115220352.png]]

![[Pasted image 20260115220427.png]]

# Tarea 2

![[Pasted image 20260115220615.png]]

Contraseña: PedroGuillFerri
![[Pasted image 20260115220840.png]]

![[Pasted image 20260115221010.png]]

![[Pasted image 20260115221251.png]]


![[Pasted image 20260115221439.png]]

Y ya estaria la base de datos creada:
![[Pasted image 20260115221511.png]]


![[Pasted image 20260115222045.png]]

![[Pasted image 20260115222224.png]]

## Opcional 1
### Crear el grupo

![[Pasted image 20260115222504.png]]

![[Pasted image 20260115222705.png]]

No se puede comparar debido a que no puedo seleccionar el default y mi grupo al mismo tiempo


## Opcional 2

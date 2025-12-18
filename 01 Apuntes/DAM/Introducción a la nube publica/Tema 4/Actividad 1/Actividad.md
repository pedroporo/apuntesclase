---
dg-publish: true
---

Ultima Modificacion: `$= dv.current().file.mtime`

Curso: Desarollo de aplicaciones multiplataforma segundo

Titulo de la actividad: **AP-Q.4.1. S3 bucket**

Alumno: Pedro Guill Ferri

Fecha de entrega: `$= dv.date("today")`


<center><img src="https://picsum.photos/500/700" alt="Portada" /></center>

# Actividad 1 Crear Bucket S3

Crear Bucket:
![[Pasted image 20251218170650.png]]

Propiedad de objetos:
![[Pasted image 20251218170739.png]]
Configuración de bloqueo de acceso público para este bucket:
![[Pasted image 20251218170831.png]]

## Configuracion del web estatico
![[Pasted image 20251218171140.png]]

![[Pasted image 20251218171241.png]]

# Actividad 2: Cargar informacion el bucket
Cargar html en el bucket
![[Pasted image 20251218171615.png]]
![[Pasted image 20251218171701.png]]
```html
<!DOCTYPE html>

<html lang="es">

<head>

<meta charset="UTF-8" />

<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<title>Pagina de pedro guill Ferri</title>

</head>

<body>

<header>

<h1>Bienvenido a mi pagina</h1>

</header>

<main>

<p>Esta es la pagina de Pedro Guillermo Ferri.</p>

</main>

<footer>

<p>&copy; de por vida</p>

</footer>

</body>

</html>
```
# Actividad 3: Habilitar el acceso a los objetos
![[Pasted image 20251218171907.png]]

Hacer publico mediante ACL:
![[Pasted image 20251218171957.png]]

Actualizar Pagina:
![[Pasted image 20251218172114.png]]

Modificar archivo y subirlo:
```html
<!DOCTYPE html>

<html lang="es">

<head>

<meta charset="UTF-8" />

<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<title>Pagina de pedro guill Ferri</title>

</head>

<body>

<header>

<h1>Bienvenido a mi pagina Modificada</h1>

</header>

<main>

<p>Esta es la pagina de Pedro Guillermo Ferri.</p>

</main>

<footer>

<p>&copy; de por vida</p>

</footer>

</body>

</html>
```
![[Pasted image 20251218172451.png]]

Captura de la pagina modificada:

![[Pasted image 20251218172544.png]]
---
dg-publish: true
---
Ultima Modificacion: `$= dv.current().file.mtime`

Curso: Desarollo de aplicaciones multiplataforma segundo

Titulo de la actividad: **Actividad 72: Proves unitaries a C#**

Alumno: Pedro Guill Ferri

Fecha de entrega: `$= dv.date("today")`


<center><img src="https://picsum.photos/500/700" alt="Portada" /></center>



# Parte 2: Análisis

## APK 1
- Nombre: Brillante Linterna
- URL: https://play.google.com/store/apps/details?id=goldenshorestechnologies.brightestflashlight.free&hl=es&gl=US
- Análisis:
	- Tiene permisos que no debería, los cuales son acceder al internet, poder sacar fotos y acceder al estado del dispositivo.
		```
		android.permission.CAMERA, 
		android.permission.WAKE_LOCK, 
		android.permission.ACCESS_NETWORK_STATE, 
		android.permission.INTERNET, 
		android.permission.READ_PHONE_STATE, 
		android.permission.WRITE_EXTERNAL_STORAGE, 
		android.permission.ACCESS_WIFI_STATE
		```
	- Usa el algoritmo SHA1 que es débil a ataques de colisiones [Wikipedia SHA! Ataques](https://es.wikipedia.org/wiki/SHA-1#Ataques)
	- La aplicación registra informacion que no deberia, la nacionalización del dispositivo
	- Hay 3091 secretos harcodeados en la aplicación
## APK 2
- Nombre: Lector QR - Escáner Código QR
- URL: https://play.google.com/store/apps/details?id=qrcodereader.barcodescanner.scan.qrscanner
- Análisis:
	- Por parte de los permisos todo esta normal, ya que necesita la cámara para hacer las fotos de los qr y permiso de lectura por si quiere cargar el qr de la galería y el acceso a Internet lo necesita para los anuncios.
	- Por certificados parece que uno esta firmado con una arquitectura que tiene una vulnerabilidad, específicamente es una vulnerabilidad a Janus.
	- Las actividades de la aplicación no están protegidas.
	- En el código parece que alguna partes de el esta expuesto a vulnerabilidades, por ejemplo el algoritmo de encryptacion.
	- La base de datos de firebase esta expuesta, `The Firebase Remote Config at https://firebaseremoteconfig.googleapis.com/v1/projects/752825482527/namespaces/firebase:fetch?key=AIzaSyD7Dif2wA71pqzl0VXhyl-5p4gTC2lJWtI`
	- La aplicacion contacta con dominios en paises sancionados:
		- DOMAIN	COUNTRY/REGION
		- log-mva.isnssdk.com	IP: 23.211.15.141               Country: Hong Kong              Region: Hong Kong              City: Hong Kong
		- pangolin16.isnssdk.com	IP: 23.211.15.157               Country: Hong Kong              Region: Hong Kong              City: Hong Kong
		- www.pangleglobal.com	IP: 23.211.15.138               Country: Hong Kong              Region: Hong Kong              City: Hong Kong
	- Hay 2 emails expuestos en la app
	- Hay 32

## APK 3: Elección
- Nombre:
- URL: 
- Analisis:

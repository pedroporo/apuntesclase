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
- Analisis:
	- Tiene permisos que no deberia, los cuales son acceder al internet, poder sacar fotos y acceder al estado del dispositivo.
		```
		android.permission.CAMERA, 
		android.permission.WAKE_LOCK, 
		android.permission.ACCESS_NETWORK_STATE, 
		android.permission.INTERNET, 
		android.permission.READ_PHONE_STATE, 
		android.permission.WRITE_EXTERNAL_STORAGE, 
		android.permission.ACCESS_WIFI_STATE
		```
	- Usa el algoritmo SHA1 que es debil a ataques de colisiones [Wikipedia SHA! Ataques](https://es.wikipedia.org/wiki/SHA-1#Ataques)
	- La aplicacion registra informacion que no deberia, la geolocalizacion del dispositivo
	- Hay 3091 secretos harcodeados en la aplicacion
## APK 2
- Nombre: Lector QR - Escáner Código QR
- URL: https://play.google.com/store/apps/details?id=qrcodereader.barcodescanner.scan.qrscanner
- Analisis:
	- Por parte de los permisos todos

## APK 3: Elección
- Nombre:
- URL: 
- Analisis:

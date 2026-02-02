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
	- Hay 3218 secretis hardcodeados en la app

## APK 3: Elección
- Nombre: SD Maid - Limpieza del sistema
- URL: https://play.google.com/store/apps/details?id=eu.thedarken.sdm
- Analisis:
	- Hay dominios a los que no se le pueden localizar: `apps.darken.eu`
	- Tiene permisos que podrian considerarse malware:
		- android.permission.ACCESS_NETWORK_STATE
		- android.permission.RECEIVE_BOOT_COMPLETED
		- android.permission.WAKE_LOCK
	- Tiene funciones que no reconoce android, podrian ser usadas parahacer cosas 
	- Tiene comportamientos extraños:

| RULE ID | BEHAVIOUR                                                             | LABEL                              |
| ------- | --------------------------------------------------------------------- | ---------------------------------- |
| 9       | Put data in cursor to JSON object                                     | file                               |
| 12      | Read data and put it into a buffer stream                             | file                               |
| 13      | Read file and put it into a stream                                    | file                               |
| 22      | Open a file from given absolute path of the file                      | file                               |
| 23      | Start another application from current application                    | Reflection, control                |
| 30      | Connect to the remote server through the given URL                    | network                            |
| 35      | Query the list of the installed packages                              | reflection                         |
| 36      | Get resource file from res/raw directory                              | reflection                         |
| 51      | Implicit intent(view a web page, make a phone call, etc.) via setData | control                            |
| 54      | Install other APKs from file                                          | reflection                         |
| 63      | Implicit intent(view a web page, make a phone call, etc.)             | control                            |
| 75      | Get location of the device                                            | Collection, location               |
| 77      | Read sensitive data(SMS, CALLLOG, etc)                                | Collection, sms, calllog, calendar |
| 79      | Hide the current app's icon                                           | evasion                            |
| 89      | Connect to a URL and receive input stream from the server             | Command, network                   |
| 91      | Retrieve data from broadcast                                          | collection                         |
| 96      | Connect to a URL and set request method                               | Command, network                   |
| 109     | Connect to a URL and get the response code                            | Network, command                   |
| 112     | Get the date of the calendar event                                    | Collection, calendar               |
| 114     | Create a secure socket connection to the proxy address                | Network, command                   |
| 115     | Get last known location of the device                                 | Collection, location               |
| 126     | Read sensitive data(SMS, CALLLOG, etc)                                | Collection, sms, calllog, calendar |
| 147     | Get the time of current location                                      | Collection, location               |
| 161     | Perform accessibility service action on accessibility node info       | accessibility service              |
| 162     | Create InetSocketAddress object and connecting to it                  | socket                             |
| 163     | Create new Socket and connecting to it                                | socket                             |
| 175     | Get notification manager and cancel notifications                     | notification                       |
| 187     | Query a URI and check the result                                      | Collection, sms, calllog, calendar |
 

Descarga de apk: https://apkdownloader.pages.dev/
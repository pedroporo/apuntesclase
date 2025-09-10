#### 1.1 Llista tots els volums que tens creats a la teua màquina. ¿Quan tens? 

```
docker volume ls
```
#### 1.2 Crea 3 volums amb noms web-logs, upload-data i cache-data. Consulta els volums que tens disponibles. Esborra els volums creats per a la caché i per als log i torna a consultar els volums disponibles. 

```
docker volume create upload-data
docker volume create web-logs
docker volume create cache-data
docker volume ls
docker volume rm cache-data
docker volume rm web-logs
docker volume ls
```

#### 1.3.- Fes una captura de pantalla dels volums que tens disponibles a la teua màquina.

DRIVER    VOLUME NAME
local     4-ratlla-pedroporo_persistent
local     batoibook-pedroguillferri_persistent
local     examen-php-pedroporo_persistent
local     futbol-femeni_sail-mysql
local     repositori-b-sic-pedroporo_persistent
local     upload-data

#### 2. Activitat 2.- Desplegament de l’aplicació 
- Executa les passes anteriors i llença 3 contenidors app1, app2 i app3 que estiguen executant l’aplicació i utilitzen el mateix volum per a gestionar les imatges pujades. 
```
docker build -t php-apache-upload .
docker run -d -p 8000:80 -v upload-data:/var/www/html/uploads --name app1 php-apache-upload
```
Pega captures de pantalla on es vega:
	-  El volum creat 
	-  Els contenidors que estan en marxa 
	-  El accés a les aplicacions de cada contenidor on es vegen totes les imatges. 
	-  Els logs que demostren que cada contenidor a pujat una imatge
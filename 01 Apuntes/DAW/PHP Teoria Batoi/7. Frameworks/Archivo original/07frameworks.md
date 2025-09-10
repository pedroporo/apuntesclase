# Frameworks PHP. Laravel

## Introducció als Frameworks PHP i Laravel

### Què és un framework?

Un **framework** proporciona una estructura base per al desenvolupament d'aplicacions, facilitant tasques com:
     
   - Connexió a bases de dades.
   - Organització del codi.
   - Gestió de rutes i validacions.

La majoria de frameworks PHP segueixen el patró **MVC** (Model-Vista-Controlador), que permet separar clarament la lògica de negoci, la interfície d'usuari i les dades.

### Per què utilitzar un framework?

Els frameworks ofereixen:

- **Estandardització:** Promouen bones pràctiques de desenvolupament.
- **Eficàcia:** Acceleració del desenvolupament amb eines preconstruïdes.
- **Mantenibilitat:** Faciliten l'escalabilitat i el manteniment del codi.

Exemples de frameworks PHP populars:

- **Laravel:** Sintaxi clara, funcionalitats modernes, ideal per a projectes de qualsevol mida.
- **Symfony:** Robust i altament modular, enfocat en aplicacions complexes.
- **Slim:** Lleuger i ideal per APIs RESTful.

---

## Laravel: El framework de referència

### Per què triar Laravel?

Laravel és un dels frameworks més populars gràcies a:

- **Facilitat d'ús:** Sintaxi expressiva i intuïtiva.
- **Patró MVC:** Clarament implementat per separar lògica, vistes i dades.
- **ORM Eloquent:** Gestió intuïtiva de bases de dades.
- **Artisan CLI:** Automatització de tasques habituals com migracions o generació de models.
- **Blade:** Motor de plantilles per modularitzar vistes amb herència i layouts.

### Característiques clau

1. **Eloquent ORM:** Treballar amb bases de dades de manera intuïtiva, suportant relacions complexes.
2. **Migracions:** Control de versions per a estructures de bases de dades.
3. **Artisan:** Línia de comandaments per accelerar tasques rutinàries.
4. **Blade:** Motor de plantilles amb sintaxi simplificada.
5. **Seguretat integrada:** Protecció contra atacs com CSRF i XSS.
6. **Ecosistema extens:** Suport per autenticació (Sanctum, Passport), gestió de dependències, i més.

---
 
###  Instal·lació de Laravel

#### Instal·lacio amb docker (laravel sail)

Si ja esteu desenvolupant Linux i Docker Compose està instal·lat, podeu utilitzar una senzilla ordre de terminal per a crear un nou projecte Laravel. Per exemple, per a crear una nova aplicació Laravel en un directori anomenat "exemple-app", podeu executar l'ordre següent al terminal:

```bash
curl -s https://laravel.build/example-app | bash
``` 

Per descomptat, podeu canviar "exemple-app" en aquest URL a qualsevol cosa que vulgueu - només assegureu-vos que el nom de l'aplicació només conté caràcters alfanumèrics, guions i guions baixos. El directori de l'aplicació Laravel es crearà dins del directori des del qual executeu l'ordre.

La instal·lació del **Sail** pot trigar diversos minuts mentre els contenidors de l'aplicació del **sail** es construeixen a la vostra màquina local.

 
Ara podeu navegar al directori de l'aplicació i iniciar Laravel Sail. Laravel Sail proporciona una interfície senzilla de línia d'ordres per a interactuar amb la configuració predeterminada de l'acoblador Laravel:
```php
cd exemple-app && ./vendor/bin/sail up &
```

Un cop iniciats els contenidors Docker de l'aplicació, podeu accedir a l'aplicació al vostre navegador web a: http://localhost.

I per a inicialitzar la base de dades des de dins del contenidor:

```php
./vendor/bin/sail artisan migrate
```
 

##### phpmyadmin

Si volem que funcione el phpmyadmin haurien d'afegir un altre contenidor docker, o farem incluint el següent codi en el docker-compose.yml

```php
myadmin:
 image: 'phpmyadmin:latest'
 ports:
 - 8080:80
 environment:
 MYSQL_ROOT_PASSWORD: '${DB_PASSWORD}'
 links:
 - "mysql:db"
 depends_on:
 - mysql
 networks:
 - sail
```


### Configuració de Laravel

La configuració en Laravel està centralitzada i organitzada en fitxers dins del directori **config/**. Aquests fitxers permeten ajustar el comportament de diferents aspectes de l'aplicació.

#### Fitxer .env

Laravel utilitza el fitxer `.env` per gestionar configuracions específiques de l'entorn. Aquest fitxer permet canviar paràmetres sense modificar el codi base.

##### Exemple de `.env`:
```env
APP_NAME="LaravelApp"
APP_ENV=local
APP_KEY=base64:...
APP_DEBUG=true
APP_URL=http://localhost

DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=laravel
DB_USERNAME=root
DB_PASSWORD=
```
### Configuració predeterminada

Els fitxers de configuració es troben al directori `config/`. A continuació es descriuen alguns dels més importants:

#### **1. config/app.php**
Conté configuracions globals de l'aplicació.

- **`name`**: Nom de l'aplicació.
- **`env`**: Entorn d'execució (`local`, `production`, `testing`).
- **`debug`**: Habilita o deshabilita el mode depuració (`true` o `false`).
- **`timezone`**: Zona horària de l'aplicació (per defecte `UTC`).
- **`locale`**: Idioma predeterminat.
- **`providers`**: Llista de proveïdors de serveis.
- **`aliases`**: Aliases per a facades.

#### **2. config/database.php**
Configura les bases de dades de l'aplicació.

- **`default`**: Connexió predeterminada (`mysql`, `sqlite`, `pgsql`, etc.).
- **Configuracions per a cada connexió**:
- **`mysql`**: Exemple:
 ```php
 'mysql' => [
 'driver' => 'mysql',
 'host' => env('DB\_HOST', '127.0.0.1'),
 'port' => env('DB\_PORT', '3306'),
 'database' => env('DB\_DATABASE', 'laravel'),
 'username' => env('DB\_USERNAME', 'root'),
 'password' => env('DB\_PASSWORD', ''),
 ],
 ```

#### **3. config/mail.php**
Configura el sistema d'enviament de correus electrònics.

- **`default`**: Transport predeterminat (`smtp`, `mailgun`, `sendmail`, etc.).
- **Configuracions SMTP**:
 ```php
 'mailers' => [
 'smtp' => [
 'transport' => 'smtp',
 'host' => env('MAIL\_HOST', 'smtp.mailtrap.io'),
 'port' => env('MAIL\_PORT', 2525),
 'username' => env('MAIL\_USERNAME'),
 'password' => env('MAIL\_PASSWORD'),
 'encryption' => env('MAIL\_ENCRYPTION', 'tls'),
 ],
 ],
 ```
#### **4. config/filesystems.php**
Gestiona els sistemes d'arxius.

- **`default`**: Sistema predeterminat (local, s3, etc.).
- **Configuració de discos**:
```php
 'disks' => [
 'local' => [
 'driver' => 'local',
 'root' => storage_path('app'),
 ],
 's3' => [
 'driver' => 's3',
 'key' => env('AWS_ACCESS_KEY_ID'),
 'secret' => env('AWS_SECRET_ACCESS_KEY'),
 'region' => env('AWS_DEFAULT_REGION'),
 'bucket' => env('AWS_BUCKET'),
 ],
 ],
```

### Funcions d'ajuda

Laravel proporciona **helpers** per treballar amb configuracions de manera senzilla i dinàmica.

#### **Accedir a configuracions**

Utilitza la funció `config()` per obtenir valors de configuració des de qualsevol lloc de l'aplicació:

```php
config('app.name'); // Retorna el nom de l'aplicació
```
#### Canviar configuracions en temps d'execució

Pots modificar configuracions de forma temporal durant l'execució de l'aplicació:

```php
config(['app.debug' => false]); // Desactiva el mode depuració
``` 

#### Establir valors predeterminats

Si el valor no existeix, pots establir un valor predeterminat:

```php
$value = config('app.missing_key', 'valor per defecte');
```
Aquestes funcions són útils per ajustar l'aplicació a les necessitats de l'entorn o per gestionar configuracions específiques durant l'execució.

### El comanament Artisan

Laravel inclou un interfície de línia de comandos (CLI, Command line interface) anomenat **Artisan**. Aquesta utilitat ens va a permetre realitzar múltiples tasques necessàries durant el procés de desenvolupament o desplegament a producció d'una aplicació, per la qual cosa ens facilitarà i accelerarà el treball.
Per a veure una llista de totes les opcions que inclou Artisan podem executar el següent comando en un consola o terminal del sistema en la carpeta arrel del nostre projecte:

```bash
php artisan list
``` 

Si volem obtenir una ajuda més detallada sobre alguna de les opcions de Artisan simplement hem d'escriure la paraula **help** davant del comando en qüestió, per exemple:

```bash
php artisan help migrate
``` 

A poc a poc anirem veient més opcions de Artisan, de moment anem a comentar solament dues opcions importants: el llistat de rutes i la generació de codi.

Per a veure un llistat amb totes les rutes que hem definit en el fitxer routes.php podem executar el comando:

```bash
php artisan route:list
``` 

Açò ens mostrarà una taula amb el mètode, l'adreça, l'acció i els filtres definits per a totes les rutes. D'aquesta forma podem comprovar totes les rutes de la nostra aplicació i assegurar-nos que estiga tot correcte.


### Estructura d'un projecte Laravel


Laravel segueix una estructura modular basada en el patró **MVC (Model-Vista-Controlador)**. Aquesta organització facilita la separació de responsabilitats, manteniment i escalabilitat. A continuació, es descriuen les carpetes més importants.

#### Carpetes principals

##### **1. app/**
Conté la lògica principal de l'aplicació.
  
- **Models/**: Classes que representen les taules de la base de dades. Gestionen les relacions i la lògica de negoci.
- **Http/Controllers/**: Controladors que processen les peticions i retornen respostes.
- **Http/Middleware/**: Classes per filtrar i processar les peticions abans d'arribar als controladors.
- **Observers/**: Classes per observar i respondre a esdeveniments dels models.
- **Policies/**: Gestionen l'autenticació basada en permisos.

##### **2. bootstrap/**

Conté el fitxer `app.php`, que inicialitza el framework i carrega configuracions bàsiques. També inclou la **caché de rutes i serveis** per millorar el rendiment.

##### **3. config/**

Fitxers de configuració global de l'aplicació (base de dades, mail, cues, etc.). És recomanable revisar aquests fitxers per personalitzar-los segons les necessitats del projecte.

##### **4. database/**

Gestió de bases de dades.
 
- **Migrations/**: Fitxers per definir l'estructura de les taules de manera programàtica.
- **Factories/**: Generació de dades de prova per als models.
- **Seeders/**: Inserció de dades inicials per a la base de dades.

##### **5. public/**

Punt d'entrada de l'aplicació. Conté:
  
- Fitxer `index.php`, que gestiona totes les peticions.
- Recursos públics com **CSS, JavaScript, imatges**.

##### **6. resources/**

Carpeta de recursos per a la interfície d'usuari.
  
- **views/**: Conté les vistes Blade.
- **lang/**: Fitxers de traducció per a aplicacions multilingües.
- **css/** i **js/**: Recursos d'estil i funcionalitat del client.

##### **7. routes/**
Defineix totes les rutes de l'aplicació.

- **web.php**: Rutes per a l'aplicació web.
- **api.php**: Rutes per a APIs RESTful.
- **console.php**: Comandes Artisan personalitzades.
- **channels.php**: Rutes per a canals de difusió.

##### **8. storage/**
Emmagatzematge d'arxius generats per l'aplicació.

- **app/**: Conté arxius d'usuari o aplicació.
- **framework/**: Caché, sessions, i altres fitxers temporals.
- **logs/**: Registres d'errors i activitat.

##### **9. tests/**
Inclou proves automatitzades per garantir el bon funcionament de l'aplicació.

- **Feature/**: Proves completes que cobreixen múltiples components.
- **Unit/**: Proves individuals per a components o mètodes específics.

##### **10. vendor/**
Carpeta gestionada per Composer. Conté totes les dependències i paquets de tercers utilitzats pel projecte. **No s'ha de modificar manualment.**


### Desenvolupament del Frontend

Laravel ofereix diverses opcions per al desenvolupament del frontend, depenent de si prefereixes utilitzar PHP o frameworks JavaScript com Vue o React.

#### Utilitzant PHP

##### Blade
Blade és el motor de plantilles lleuger de Laravel que permet crear vistes amb una sintaxi senzilla per mostrar dades i iterar sobre elles.

##### Livewire
Livewire és un framework que facilita la construcció d'interfícies dinàmiques utilitzant PHP, sense necessitat de JavaScript addicional.

#### Utilitzant Vue o React

##### Inertia
Inertia actua com a pont entre Laravel i frameworks com Vue o React, permetent construir aplicacions modernes sense gestionar rutes o autenticació al costat del client.

#### Kits d'Inici
Laravel proporciona kits com Breeze i Jetstream que ofereixen scaffolding per a l'autenticació i altres funcionalitats, utilitzant Blade, Livewire, Vue o React.

#### Agrupació d'Actius
Laravel utilitza **Vite** per compilar i agrupar els actius del frontend, oferint temps de compilació ràpids i reemplaçament de mòduls en calent durant el desenvolupament.


### Laravel : Kits d'Inici

Laravel ofereix diversos kits d'inici per agilitzar el desenvolupament d'aplicacions, proporcionant scaffolding per a l'autenticació i altres funcionalitats essencials.

#### Laravel Breeze

Breeze és un kit d'inici minimalista que implementa les funcionalitats bàsiques d'autenticació, incloent:

- Inici de sessió
- Registre
- Restabliment de contrasenya
- Verificació de correu electrònic
- Confirmació de contrasenya

Per defecte, Breeze utilitza plantilles Blade estilitzades amb Tailwind CSS. També ofereix opcions de scaffolding basades en Livewire o Inertia, amb la possibilitat d'utilitzar Vue o React.

#### Laravel Jetstream

Jetstream és un kit d'inici més robust que amplia les funcionalitats de Breeze, afegint:

- Autenticació de dos factors
- Gestió de sessions
- Suport per a API mitjançant Laravel Sanctum
- Opcionalment, gestió d'equips

Jetstream està dissenyat amb Tailwind CSS i ofereix la possibilitat d'utilitzar Livewire o Inertia per al frontend.

##### Instal·lació

Per instal·lar Laravel Breeze en una aplicació Laravel existent:

```bash
composer require laravel/breeze --dev
php artisan breeze:install
php artisan migrate
npm install
npm run dev
``` 
Per instal·lar Laravel Jetstream:

```bash 
composer require laravel/jetstream
php artisan jetstream:install livewire
php artisan migrate
npm install
npm run dev
```
Nota: Substitueix livewire per inertia si prefereixes utilitzar Inertia.


### Arquitectura d'un projecte Laravel


#### Cicle de Vida d'una Sol·licitud en Laravel

Quan una sol·licitud HTTP arriba a una aplicació Laravel, aquesta segueix una sèrie de passos abans de retornar una resposta al client. A continuació, es detallen les etapes principals d'aquest procés:

##### 1. Creació de la Instància de l'Aplicació

Laravel inicia creant una instància de l'aplicació, que serveix com a contenidor de serveis per a la gestió de dependències.

##### 2. Selecció del Nucli (Kernel)

Segons el tipus de sol·licitud (HTTP o consola), Laravel dirigeix la sol·licitud al nucli corresponent:

- **HTTP Kernel**: Gestiona sol·licituds web.
- **Console Kernel**: Gestiona comandes de consola.

##### 3. Carregant els Bootstrapers

Abans de processar la sol·licitud, Laravel executa una sèrie de bootstrapers que configuren aspectes com la gestió d'errors, el registre de logs i la detecció de l'entorn de l'aplicació.

##### 4. Registre dels Proveïdors de Serveis

Els proveïdors de serveis són responsables de carregar i configurar els diversos components de Laravel, com la base de dades, la cua de treballs, la validació i el sistema de rutes.

##### 5. Execució del Middleware

Laravel passa la sol·licitud a través d'una cadena de middleware, que poden realitzar tasques com la verificació d'autenticació, la protecció CSRF i la gestió de sessions.

##### 6. Despatx de la Sol·licitud

Després de passar pel middleware, la sol·licitud és dirigida al controlador o ruta corresponent, on es processa la lògica de l'aplicació.

##### 7. Retorn de la Resposta

Un cop processada la sol·licitud, es genera una resposta que és retornada al client.


### Els Proveïdors de Serveis (Service Providers)

Els **proveïdors de serveis** són responsables de l'arrencada o "bootstrapping" de qualsevol projecte Laravel. La seva funció principal és registrar els components, dependències externes, classes i mètodes que hem definit, fent-los accessibles a tota l'aplicació.

Al fitxer **config/app.php** del projecte, trobaràs una secció anomenada **providers**. Aquest array conté tots els proveïdors de serveis que Laravel carrega quan l'aplicació s'inicia. Alguns exemples són:

- **DatabaseServiceProvider**: Gestiona l'accés a bases de dades.
- **AuthServiceProvider**: Configura el sistema d'autenticació d'usuaris.

Un proveïdor de serveis pot contenir dos mètodes principals:

- **register**: Defineix els serveis i els vincula al contenidor de Laravel.
- **boot**: S'executa després de carregar tots els serveis, ideal per inicialitzar funcionalitats.

---

### Les Classes del Nucli de Laravel

Laravel proporciona una infraestructura robusta de classes que faciliten el desenvolupament. Algunes d'aquestes classes són:

- **Route**: Permet definir i gestionar rutes.
- **Model**: Proporciona funcionalitats per a treballar amb la base de dades mitjançant Eloquent ORM.

Aquestes classes estan organitzades dins de l'espai de noms **Illuminate**, per la qual cosa sovint veurem imports com:

```php
use Illuminate\Database\Eloquent\Model;
```

### Altres elements

A més dels dos pilars anteriors sobre els quals se sustenta fonamentalment el desenvolupament de projectes en Laravel, podem parlar d'altres elements que ens poden resultar d'utilitat en el desenvolupament, com són els facades i els contracts.

Les facades proporcionen una interfície estàtica als elements de l'aplicació, de manera que faciliten l'accésa uns certs mètodes o utilitats. Per exemple, la facade **cache** permet accedir de manera senzilla amb el seu mètode **get**a unes certes propietats cachejades prèviament.

```php
return Cache::get('key');
```

Els **contracts** són un conjunt d'interfícies que proporcionen el nucli de serveis oferits per Laravel. Per exemple, mètodes per a enviar e-mails, o encolar tasques en una cola de prioritat, etc.


### MVC: Model - Vista - Controlador

El model–vista–controlador (MVC) és un patró d'arquitectura de programari que separa les dades i la lògica de negoci d'una aplicació de la interfície d'usuari i el mòdul encarregat de gestionar els esdeveniments i les comunicacions. Per a açò MVC proposa la construcció de tres components diferents que són el model, la vista i el controlador, és a dir, d'una banda defineix components per a la representació de la informació, i d'altra banda per a la interacció de l'usuari. Aquest patró d'arquitectura de programari es basa en les idees de **reutilització de codi** i la **separació de conceptes**, característiques que cerquen facilitar la tasca de desenvolupament d'aplicacions i el seu posterior manteniment.
De manera genèrica, els components de MVC es podrien definir com segueix:

* El **Model**: És la **representació de la informació** amb la qual el sistema opera, per tant gestiona tots els accessos a aquesta informació, tant consultes com a actualitzacions. Les peticions d'accés o manipulació d'informació arriben al 'model' a través del 'controlador'.
* El **Controlador**: **Respon a esdeveniments** (usualment accions de l'usuari) i **invoca peticions al 'model'** quan es fa alguna sol·licitud d'informació (per exemple, editar un document o un registre en una base de dades). Per tant es podria dir que el 'controlador' fa d'intermediari entre la 'vista' i el 'model'.
* La **Vista**: **Presenta el 'model'** i les dades preparades pel controlador a l'usuari de **forma visual**. L'usuari podrà interactuar amb la vista i realitzar altres peticions que s'enviaran al controlador.

![Modelo Vista Controlador](01%20Apuntes/DAW/PHP%20Teoria%20Batoi/imagenes/07/mvc.png)

#### Funcionament bàsic

El funcionament bàsic que segueix Laravel després d'una petició web a una URL del nostre lloc és el següent:

* Totes les peticions entren a través del fitxer **public/index.php**, el qual en primer lloc comprovarà en el fitxer de rutes (**routes/web.php**) si la URL és vàlida i en cas de ser-ho al fet que controlador ha de fer la petició.

* A continuació cridarà al mètode del controlador assignat per a aquesta ruta. Com hem vist, el controlador és el punt d'entrada de les peticions de l'usuari, el qual, depenent de la petició:
* Accedirà a la base de dades (si fóra necessari) a través dels "models" per a obtenir dades (o per a afegir, modificar o eliminar).
* Després d'obtenir les dades necessàries els prepararà per a passar-li'ls a la vista.

* En el tercer pas el controlador cridarà a una vista amb una sèrie de dades associades, la qual es prepararà per a
  mostrar-se correctament a partir de les dades d'entrada i finalment es mostrarà a l'usuari.
  A continuació s'inclou un xicotet esquema d'aquest funcionament:


![](l101.png)
Funcionament Bàsic Laravel



## Rutes
[![](../img/ull.png)Video](https://youtu.be/oHJokaq0yeY)

Podríem dir que existeixen dos tipus principals de rutes:

- **Rutes web**: Emmagatzemades a l'arxiu `web.php`, ens permeten carregar diferents vistes en funció de la URL que indique el client.
- **Rutes API**: Emmagatzemades a l'arxiu `api.php`, s'utilitzen per definir serveis **REST**.

En aquest tema, ens centrarem en les rutes web, per la qual cosa editarem el contingut de l'arxiu `routes/web.php`. Aquest fitxer és el punt centralitzat per a la definició de rutes. Qualsevol ruta no definida en aquest fitxer no serà vàlida i generarà un error 404.

Les rutes poden:
1. Retornar directament un valor des del fitxer de rutes.
2. Cridar una vista o un controlador.

### Rutes simples

Una ruta simple té una URL fixa i una funció que retorna una resposta. Per exemple, una petició tipus GET es defineix així:

```php
Route::get('/salut', function () {
 return 'Hola món!';
});
```

Quan accedim a `http://localhost/salut`, Laravel retornarà "Hola món!".

### Rutes amb paràmetres

Es poden definir paràmetres dinàmics a les rutes mitjançant claus `{}`. Per exemple:

```php
Route::get('/salut/{nom}', function ($nom) {
 return 'Bon dia, ' . $nom;
});
```

Si accedim a `/salut/Joan`, retornarà "Bon dia, Joan". Per definir un paràmetre opcional, afegim un símbol `?`:

```php
Route::get('/salut/{nom?}', function ($nom = 'Convidat') {
 return 'Bon dia, ' . $nom;
});
```

Ara, `/salut` retornarà "Bon dia, Convidat".

### Validació de paràmetres

Podem validar els paràmetres usant el mètode `where`. Per exemple:

```php
Route::get('/salut/{nom}', function ($nom) {
 return 'Hola, ' . $nom;
})->where('nom', '[A-Za-z]+');

Route::get('/producte/{id}', function ($id) {
 return 'Producte ID: ' . $id;
})->where('id', '[0-9]+');

Route::get('/usuari/{nom}/{id}', function ($nom, $id) {
 return 'Usuari: ' . $nom . ', ID: ' . $id;
})->where(['nom' => '[A-Za-z]+', 'id' => '[0-9]+']);
```

### Rutes amb nom (Named Routes)

És possible assignar un nom a una ruta utilitzant el mètode `name`. Això permet referenciar-la fàcilment:

```php
Route::get('/contacte', function () {
 return 'Pàgina de contacte';
})->name('contacte');
```

Podem utilitzar el nom de la ruta a les plantilles Blade:

```blade
[Contacte]({{ route('contacte') }})
```

### Grups de rutes

Laravel permet agrupar rutes per compartir configuracions com prefixos o middleware:

```php
Route::prefix('admin')->group(function () {
 Route::get('/dashboard', function () {
 return 'Admin Dashboard';
 });

 Route::get('/usuaris', function () {
 return 'Admin Usuaris';
 });
});
```

Això crea les rutes `/admin/dashboard` i `/admin/usuaris`.

### Rutes amb controladors

Per gestionar lògica més complexa, és recomanable utilitzar controladors:

```php
Route::get('/usuari/{id}', [UsuariController::class, 'mostrar']);

// Controlador definit amb l'artisan:
// php artisan make:controller UsuariController
```

### Recursos i APIS

Podem definir rutes amb el mètode `resource` per a CRUDs:

```php
Route::resource('articles', ArticleController::class);
```

Aquest mètode genera automàticament les rutes per accions com `index`, `create`, `store`, `show`, `edit`, `update` i `destroy`.

---

## Vistes

[![](../img/ull.png)Video](https://youtu.be/D3uLYwkQ3C0)

Les vistes són la forma de presentar el resultat (una pantalla del nostre lloc web) de forma visual a l'usuari. Laravel permet estructurar aquesta part de l'aplicació utilitzant **vistes simples** o **plantilles Blade**, una eina potent per modularitzar i reutilitzar el codi de les nostres vistes.

### Què són les vistes?
Les vistes es defineixen a la carpeta `resources/views` i estan dissenyades per separar la part visual de la lògica de l'aplicació. Aquesta separació millora l'estructura del projecte i facilita el manteniment del codi.

Les vistes no han de contenir lògica de negoci ni fer consultes a bases de dades. Només han de rebre dades dels controladors i presentar-les a l'usuari.

### Mostrar una vista

Per mostrar una vista, podem utilitzar la funció `view()` des d'una ruta o controlador. Per exemple:

```php
Route::get('/', function () {
 return view('welcome');
});
```

### Passar dades a una vista

És habitual passar dades a les vistes des d'una ruta o controlador. Es poden passar dades de diverses maneres:

1. **Amb `with`:**

```php
Route::get('/', function () {
 $nom = 'Nacho';
 return view('inici')->with('nom', $nom);
});
```

2. **Amb un array associatiu:**

```php
return view('inici', ['nom' => $nom]);
```

3. **Amb la funció `compact`:**

```php
return view('inici', compact('nom'));
```

4. **Utilitzant la funció `Route::view`:**

```php
Route::view('/', 'inici', ['nom' => 'Nacho']);
```

A la vista, podem utilitzar Blade per mostrar aquestes dades:

```blade
Benvingut/a, {{ $nom }}


```

---

## Plantilles mitjançant Blade

Laravel utilitza **Blade** per modularitzar i optimitzar les vistes. Els fitxers Blade tenen l'extensió `.blade.php` i permeten utilitzar una sintaxi específica per treballar amb dades, herència de plantilles, i estructures de control.

### Mostrar dades

Per mostrar dades en Blade, utilitzem doble claus:

```blade
Hola, {{ $nom }}


```

Per evitar problemes de seguretat com **XSS**, Blade utilitza la funció `e()` per escapar dades. Si volem mostrar dades sense escapament, podem fer servir:

```blade
{!! $html !!}


```

### Comentaris

Els comentaris en Blade s'escriuen així:

```blade
{{-- Això és un comentari --}}
```

### Estructures de control

1. **Condicionals:**

```blade
@if($condicio)
 Condició complerta


@elseif($altraCondicio)
 Altra condició complerta


@else
 No s'ha complert cap condició


@endif
```

2. **Bucle foreach:**

```blade
@foreach($elements as $element)
 {{ $element }}


@endforeach
```

3. **Forelse amb condició buida:**

```blade
@forelse($elements as $element)
 {{ $element }}


@empty
 No hi ha elements


@endforelse
```

### Herència de plantilles

Per modularitzar, podem definir una plantilla base amb la directiva `@yield`:

```blade


@yield('title')


 @include('partials.nav')
 @yield('content')


```

Les vistes poden heretar aquesta plantilla amb `@extends` i definir les seccions:

```blade
@extends('layout')

@section('title', 'Pàgina d'inici')

@section('content')
 Benvingut/a!
============


@endsection
```

### Components Blade

Els **Components Blade** permeten definir elements reutilitzables:

1. Crear component:

```bash
php artisan make:component Alert
```

2. Definir la lògica:

```php
class Alert extends Component {
 public $type;
 public function __construct($type) {
    $this->type = $type;
 }
 public function render() {
 return view('components.alert');
 }
}
```

3. Vista del component:

```blade

 {{ $slot }}

```

4. Utilitzar-lo en una vista:

```blade
Missatge enviat!
```


## Enllaçant amb CSS i Javascript en el client

Ara que ja coneixem com utilitzar Blade per modularitzar les nostres vistes, és moment d'afegir estils CSS i scripts Javascript per millorar la presentació i funcionalitat del nostre projecte Laravel. Laravel integra **Vite**, una eina moderna per gestionar i empaquetar els recursos del frontend.

### Què és Vite?

Vite és una eina de construcció de frontend que ofereix un entorn de desenvolupament extremadament ràpid i empaqueta el codi per a producció. Amb Laravel, Vite permet:
  
- Gestionar fitxers CSS i Javascript del projecte.
- Optimitzar els recursos per a producció.
- Carregar els canvis en temps real durant el desenvolupament.

Laravel inclou per defecte un connector oficial per treballar amb Vite.

---

### Instal·lació del connector Vite per a Laravel

Si has creat una nova aplicació Laravel, trobaràs el fitxer `package.json` al directori arrel. Per començar, instal·la les dependències del frontend executant:

```bash
npm install
```

Això instal·larà totes les dependències definides al fitxer `package.json`, incloent-hi el connector de Laravel per a Vite.

---

### Configuració de Vite

La configuració de Vite es troba al fitxer `vite.config.js`. Aquest fitxer defineix els punts d'entrada (CSS i Javascript) del projecte:

```javascript
import { defineConfig } from 'vite';
import laravel from 'laravel-vite-plugin';

export default defineConfig({
 plugins: [
 laravel([
 'resources/css/app.css',
 'resources/js/app.js',
 ]),
 ],
});
```

És possible afegir connectors addicionals si utilitzes frameworks com Vue o React.

---

### Carregar CSS i Javascript a les vistes

Un cop configurats els punts d'entrada al fitxer `vite.config.js`, pots carregar els recursos utilitzant la directiva `@vite` de Blade. Per exemple:

```html



 {{-- Altres metadades i configuracions --}}
 @vite(['resources/css/app.css', 'resources/js/app.js'])


 {{-- Contingut de la vista --}}


```

Aquesta directiva s'encarrega automàticament de:
- Injectar el client de desenvolupament per a substitució de mòduls (Hot Module Replacement - HMR).
- Carregar els fitxers versionats en producció.

---

### Executar Vite

Pots executar Vite de dues maneres:

1. **Entorn de desenvolupament:**

Durant el desenvolupament, pots executar el servidor de Vite per reflectir els canvis automàticament al navegador:

 ```bash
 npm run dev
 ```

2. **Producció:**

Per empaquetar i versionar els recursos per a producció, executa:

 ```bash
 npm run build
 ```

---
 

## Controladors

[![](../img/ull.png)Video](https://www.youtube.com/watch?v=VwNTfrN8XTU&t=629s)

Els controladors són una peça clau a Laravel per organitzar i estructurar la lògica de la nostra aplicació. Permeten separar la gestió de les rutes i la lògica del negoci, fent que el codi sigui més net, escalable i fàcil de mantenir.

---

### Crear un controlador

Per crear un controlador, podem utilitzar l'ordre `php artisan make:controller`. Per convenció, els controladors solen acabar amb el sufix `Controller`. Exemple:

```bash
php artisan make:controller PruebaController
```

Això crea un fitxer dins de la carpeta `app/Http/Controllers`. El controlador estarà buit per defecte i podrem afegir-hi els mètodes necessaris.

---

### Controladors de recursos

Podem generar un controlador de recursos amb l'opció `-r`. Això crearà un controlador amb mètodes predeterminats per a operacions comunes:

```bash
php artisan make:controller PruebaController -r
```

Els mètodes generats són:

- `index`: Mostrar un llistat d'elements.
- `create`: Mostrar un formulari per crear un nou element.
- `store`: Emmagatzemar un nou element a la base de dades.
- `show`: Mostrar un element específic.
- `edit`: Mostrar un formulari per editar un element existent.
- `update`: Actualitzar un element a la base de dades.
- `destroy`: Eliminar un element.

Per cridar un mètode d'aquest tipus des d'una ruta:

```php
Route::get('prueba', [PruebaController::class, 'index'])->name('listado\_prueba');
```

---

### Rutes i controladors

Laravel permet registrar totes les rutes associades a un controlador de recursos amb el mètode `Route::resource`:

```php
Route::resource('catalog', CatalogController::class);
```

Això genera rutes per a tots els mètodes del controlador de recursos (`index`, `show`, `create`, etc.). Si només volem algunes rutes, podem utilitzar:

- **`only`:**

 ```php
 Route::resource('catalog', CatalogController::class)->only(['index', 'show']);
 ```

- **`except`:**

 ```php
 Route::resource('catalog', CatalogController::class)->except(['update', 'edit']);
 ```

---

### Organització de vistes i controladors

Les vistes associades a un controlador solen estar estructurades dins de la carpeta `resources/views` seguint el nom del controlador o el model. Exemple:

- Controlador: `CatalogController`
- Vistes: `resources/views/catalog/index.blade.php`, `resources/views/catalog/show.blade.php`, etc.

Per renderitzar aquestes vistes des del controlador:

```php
public function index() {
 return view('catalog.index');
}
```

---

### Subcarpetes i espais de noms

Els controladors es poden organitzar en subcarpetes dins de `app/Http/Controllers`. Si un controlador es troba en una subcarpeta, cal incloure el seu espai de noms:

```php
// Fitxer: app/Http/Controllers/Photos/AdminController.php
Route::get('admin', [App\Http\Controllers\Photos\AdminController::class, 'method']);
```

Laravel afegeix automàticament l'espai de noms per als controladors a `RouteServiceProvider`. Si crees subcarpetes, assegura't d'actualitzar el fitxer de rutes amb el nom complet del controlador.

---
 
 
## Exercici Pràctic: Guia d'Equips de Futbol Femení

L'objectiu d'aquest exercici és construir una aplicació Laravel per gestionar una guia d'equips de futbol femení. Aprendrem a configurar rutes, controladors, vistes i a passar dades utilitzant les funcionalitats de Laravel.

---

#### Pas 1: Configurar el projecte

1. **Crear un projecte Laravel anomenat `futbol-femeni`:**

 ```bash
  curl -s "https://laravel.build/futbol-femeni?with=mysql,mailpit" | bash
 ```

 Problemes:  des de dins de l'institut no funciona perquè els repositoris estan capats.

Solució: 

  * Quan falle . Copiar la següent [carpeta](recursos/docker.zip) a la carpeta del projecte.
  * Canviar este troç del docker-compose.yml per este:

```
    laravel.test:
        build:
            context: './vendor/laravel/sail/runtimes/8.3'  
```
per
```
    laravel.test:
        build:
            context: './docker'
```

i despres acabem la instal·lació:

```bash
  cd futbol-femeni
  ./vendor/bin/sail up 
  ./vendor/bin/sail artisan migrate
```

2. **Qüestió:** Per què és important tenir una estructura clara al projecte Laravel?

---

#### Pas 2: Definir la ruta inicial

1. **Editar `routes/web.php` per crear una ruta inicial:**

```php
Route::get('/', function () {
   return "Benvingut a la Guia d"Equips de Futbol Femení!";
});
```

2. **Qüestió:** Quina diferència hi ha entre definir una ruta directa i una que utilitza un controlador?

---

#### Pas 3: Crear un controlador

1. **Generar un controlador anomenat `EquipController`:**

```bash
./vendor/bin/sail artisan make:controller EquipController
```

2. **Afegir un mètode `index` al controlador:**

```php
public function index() {
   return view('equips.index');
}
```

3. **Definir una ruta per al mètode `index`:**

```php
Route::get('/equips', [EquipController::class, 'index']);
```

4. **Qüestió:** Per què és recomanable separar la lògica en controladors?

---

#### Pas 4: Crear una vista

1. **Crear una vista a `resources/views/equips/index.blade.php`:**

```html
<h1>Guia d'Equips</h1>
```

2. **Qüestió:** Què fa especial el motor de plantilles Blade en comparació amb HTML estàndard?

---

#### Pas 5: Passar dades a la vista

1. **Modifica el mètode `index` per passar un array d'equips:**

```php
public function index() {
   $equips = ['Barça Femení', 'Atlètic de Madrid', 'Real Madrid Femení'];
   return view('equips.index', compact('equips'));
}
```

2. **Afegeix un bucle `@foreach` a la vista:**

```html
<h1>Guia d'Equips</h1>
<ul>
   @foreach($equips as $equip)
       <li>{{ $equip }}</li>
   @endforeach
</ul>
```

3. **Qüestió:** Com podem utilitzar Blade per fer el codi més segur?

---

#### Pas 6: Afegir estils amb Vite

1. **Crear un fitxer CSS a `resources/css/equips.css`:**

```css
body {
   font-family: Arial, sans-serif;
}

h1 {
   color: darkblue;
}

nav ul {
list-style-type: none;
padding: 0;
}

nav ul li {
display: inline;
margin-right: 15px;
}

nav ul li a {
text-decoration: none;
color: darkblue;
}

nav ul li a:hover {
text-decoration: underline;
}
```

2. **Incloure el fitxer CSS amb `@vite`:**

  Modificar el fitxer vite.config.js per a que inclogui el fitxer CSS:

``` 
import laravel from 'laravel-vite-plugin';

export default defineConfig({
  plugins: [
    laravel({
      input: [
        'resources/css/app.css',
        'resources/css/equips.css',
        'resources/js/app.js'],
      refresh: true,
    }),
  ],
});
```
    
    i incloure el fitxer CSS a la vista:
 
```html
@vite('resources/css/equips.css')
```

3. **Executar Vite:**

```bash
npm install
npm run build
```

4. **Qüestió:** Què és Hot Module Replacement (HMR) i com ajuda en el desenvolupament?

---

#### Pas 7: Ampliar funcionalitats

1. **Afegir més camps als equips:**

   ```php
   public function index() {
       $equips = [
           ['nom' => 'Barça Femení', 'estadi' => 'Camp Nou', 'titols' => 30],
           ['nom' => 'Atlètic de Madrid', 'estadi' => 'Cívitas Metropolitano', 'titols' => 10],
           ['nom' => 'Real Madrid Femení', 'estadi' => 'Alfredo Di Stéfano', 'titols' => 5],
       ];
       return view('equips.index', compact('equips'));
   }
   ```

2. **Actualitzar la vista per mostrar una taula:**

   ```html
   <h1>Guia d'Equips</h1>
   <table>
       <thead>
           <tr>
               <th>Nom</th>
               <th>Estadi</th>
               <th>Títols</th>
           </tr>
       </thead>
       <tbody>
           @foreach($equips as $equip)
               <tr>
                   <td>{{ $equip['nom'] }}</td>
                   <td>{{ $equip['estadi'] }}</td>
                   <td>{{ $equip['titols'] }}</td>
               </tr>
           @endforeach
       </tbody>
   </table>
   ```

3. **Crear una nova vista parcial per al menú de navegació:**
  
* Afegeix un fitxer nou a resources/views/partials/menu.blade.php amb el contingut següent:

```html
<nav>
    <ul>
        <li><a href="/">Inici</a></li>
        <li><a href="/equips">Guia d'Equips</a></li>
        <li><a href="/estadis">Llistat d'Estadis</a></li>
    </ul>
</nav>
```

* Modifica la vista resources/views/equips/index.blade.php per incloure el menú amb la directiva @include:

```html
@include('partials.menu')
```


4. Crear una plantilla base

* Crea el fitxer resources/views/layouts/app.blade.php:

```html
<!DOCTYPE html>
<html lang="ca">
<head>
      <meta charset="UTF-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>@yield('title','Guia de futbol femení')</title>
      @vite(['resources/css/app.css', 'resources/css/equips.css'])
</head>
<body>
      <header>
        @include('partials.menu')
      </header>
      <main>
       @yield('content')
      </main>
      <footer>
          <p>&copy; 2024 Guia de Futbol Femení</p>
      </footer>
</body>
</html>
```

* Modifica la vista resources/views/equips/index.blade.php per heretar de la plantilla base:
      
```php
 @extends('layouts.app')
@section('title', " Guia d'Equips" )
@section('content')
    <h1>Guia d'Equips</h1>
    <table>
        <thead>
        <tr>
            <th>Nom</th>
            <th>Estadi</th>
            <th>Títols</th>
        </tr>
        </thead>
        <tbody>
        @foreach($equips as $equip )
            <tr>
                <td class="equip"><h2>{{ $equip['nom']  }}</h2></td>
                <td class="equip">{{ $equip['estadi']  }}</td>
                <td class="equip">{{ $equip['titols']  }}</td>
            </tr>
        @endforeach
        </tbody>
    </table>
@endsection

```

5. Crear un component per als equips

* Executa la següent comanda per crear un component Blade anomenat Equip:

```bash
./vendor/bin/sail artisan make:component Equip
```

* Afegeix els estils al fitxer CSS resources/css/equips.css:

```css
  .equip {
  border: 1px solid #ddd;
  padding: 10px;
  margin: 10px 0;
  border-radius: 5px;
  box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.1);
  }

  .equip h2 {
  margin: 0;
  color: darkblue;
  }

```
* Modifica la vista resources/views/components/equip.blade.php per crear el component:

```html
<div class="equip">
    <h2>{{ $nom }}</h2>
    <p><strong>Estadi:</strong> {{ $estadi }}</p>
    <p><strong>Títols:</strong> {{ $titols }}</p>
</div>
```
* Crea un mètode al controlador d'equips per mostrar un equip:

```php
public function show($id) {
    $equips = [
        ['nom' => 'Barça Femení', 'estadi' => 'Camp Nou', 'titols' => 30],
        ['nom' => 'Atlètic de Madrid', 'estadi' => 'Cívitas Metropolitano', 'titols' => 10],
        ['nom' => 'Real Madrid Femení', 'estadi' => 'Alfredo Di Stéfano', 'titols' => 5],
    ];
    $equip = $equips[$id];
    return view('equips.show', compact('equip'));
}
```

* Crea la vista resources/views/equips/show.blade.php per utilitzar el component:

```html
@extends('layouts.app')
@section('title', " Guia d'Equips" )
@section('content')
<x-equip
   :nom="$equip['nom']"
   :estadi="$equip['estadi']"
   :titols="$equip['titols']"
/>
@endsection 
```

* Modifica el component (app/Views/components/Equip.php) per utilitzar les dades passades:

```php
public function __construct(
     public string $nom,
     public string $estadi,
     public int $titols ) { }
``` 

* Crea la ruta:

```php
Route::get('/equips/{id}', [EquipController::class, 'show']);
```

 6. **Qüestió:** Com podem fer per no repetir l'array d'equips en el controlador ?

 7. **Qüestió:** Què és un component Blade i quins avantatges té respecte a les vistes parcials?

 8. **Qüestio:** Què permet la directiva @yield i com es relaciona amb @section?

 9. **Qüestió:** Per què és important tenir una plantilla base en una aplicació web? 
---

#### Pas 8: Refactoritzar el codi

1. **No repetir l'array d'equips en el controlador**

```php
public $equips = [
        ['nom' => 'Barça Femení', 'estadi' => 'Camp Nou', 'titols' => 30],
        ['nom' => 'Atlètic de Madrid', 'estadi' => 'Cívitas Metropolitano', 'titols' => 10],
        ['nom' => 'Real Madrid Femení', 'estadi' => 'Alfredo Di Stéfano', 'titols' => 5],
    ];

    public function index() {
        $equips = $this->equips;
        return view('equips.index', compact('equips'));
    }

    public function show($id) {
        $equip = $this->equips[$id];
        return view('equips.show', compact('equip'));
    }
```

2. **Passar les rutes a resource**
    
  ```php
  Route::resource('equips', EquipController::class);
  ```
3. **Crear l'enllaç en el index per a vore un equip**

```html
@foreach($equips as $key => $equip)
    <tr>
        <td><a href="{{ route('equips.show', $key) }}">{{ $equip['nom'] }}</a></td>
        <td>{{ $equip['estadi'] }}</td>
        <td>{{ $equip['titols'] }}</td>
    </tr>
@endforeach
```
4. **Utilitza chatgpt per a donar estil a les vistes mitjançant tailwind**

```html
app.blade.php
<!DOCTYPE html>
<html lang="ca">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>@yield('title', 'Guia de futbol femení')</title>
    @vite(['resources/css/app.css'])
</head>
<body class="font-sans bg-gray-100 text-gray-900">
<header class="bg-blue-800 text-white p-4">
    @include('partials.menu')
</header>
<main class="container mx-auto p-6">
    @yield('content')
</main>
<footer class="bg-blue-800 text-white text-center p-4">
    <p>&copy; 2024 Guia de Futbol Femení</p>
</footer>
</body>
</html>
``` 

```html
index.blade.php
@extends('layouts.app')

@section('title', "Guia d'Equips")

@section('content')
<h1 class="text-3xl font-bold text-blue-800 mb-6">Guia d'Equips</h1>
<table class="w-full border-collapse border border-gray-300">
    <thead class="bg-gray-200">
    <tr>
        <th class="border border-gray-300 p-2">Nom</th>
        <th class="border border-gray-300 p-2">Estadi</th>
        <th class="border border-gray-300 p-2">Títols</th>
    </tr>
    </thead>
    <tbody>
    @foreach($equips as $key => $equip)
    <tr class="hover:bg-gray-100">
        <td class="border border-gray-300 p-2">
            <a href="{{ route('equips.show', $key) }}" class="text-blue-700 hover:underline">{{ $equip['nom'] }}</a>
        </td>
        <td class="border border-gray-300 p-2">{{ $equip['estadi'] }}</td>
        <td class="border border-gray-300 p-2">{{ $equip['titols'] }}</td>
    </tr>
    @endforeach
    </tbody>
</table>
@endsection
``` 
```html
equip.blade.php
<div class="equip border rounded-lg shadow-md p-4 bg-white">
    <h2 class="text-xl font-bold text-blue-800">{{ $nom }}</h2>
    <p><strong>Estadi:</strong> {{ $estadi }}</p>
    <p><strong>Títols:</strong> {{ $titols }}</p>
</div>
``` 
```html
menu.blade.php
<nav>
    <ul class="flex space-x-4">
        <li><a href="/" class="text-white hover:underline">Inici</a></li>
        <li><a href="/equips" class="text-white hover:underline">Guia d'Equips</a></li>
        <li><a href="/estadis" class="text-white hover:underline">Llistat d'Estadis</a></li>
    </ul>
</nav>
```


## Exercici: Guia d'Estadis de Futbol

L'objectiu d'aquest exercici és crear una extensió de la guia d'equips de futbol femení per incloure una nova funcionalitat: un llistat d'estadis de futbol. Els alumnes implementaran rutes, controladors i vistes per mostrar estadis i les seves característiques.

---

### Instruccions

#### **1. Crear un controlador d'estadis**

1. Genera un nou controlador anomenat `EstadiController`.

2. Afegeix un mètode `index` al controlador per retornar una vista amb un llistat d'estadis.

```php
$estadiosFutbolFemeni = [
    [
    'nom' => 'Estadi Johan Cruyff',
    'ciutat' => 'Sant Joan Despí',
    'capacitat' => 6000,
    'equip_principal' => 'FC Barcelona Femení'
    ],
    [
    'nom' => 'Centro Deportivo Wanda Alcalá de Henares',
    'ciutat' => 'Alcalá de Henares',
    'capacitat' => 2800,
    'equip_principal' => 'Atlètic de Madrid Femení'
    ],
    [
    'nom' => 'Estadio Alfredo Di Stéfano',
    'ciutat' => 'Madrid',
    'capacitat' => 6000,
    'equip_principal' => 'Real Madrid Femení'
    ]
];
```  
---

#### **2. Crear una ruta per als estadis**

1. Defineix una nova ruta a `routes/web.php` que apunti al mètode `index` del controlador.

---

#### **3. Crear una vista per mostrar els estadis**

1. Crea un fitxer de vista a `resources/views/estadis/index.blade.php` per mostrar els estadis en format de taula.
2. Inclou el menu.

---

#### **4. Afegir estils al llistat d'estadis**

1. Crea un fitxer CSS a `resources/css/estadis.css` per estilitzar la taula.

2. Inclou el CSS a la vista utilitzant `@vite`.

3. Executa Vite per aplicar els estils.

---

#### **5. Ampliar la guia d'estadis**

1. Afegir una nova ruta /estadis/crear per mostrar un formulari que permet afegir un nou estadi.

2. Crear un controlador amb un mètode crear que retorne una vista amb el formulari.

3. Dissenyar un formulari Blade que contingui camps per al nom de l'estadi, ciutat i capacitat.

4. Mostrar un missatge de confirmació quan l'usuari faci clic al botó d'enviar.

5. Crea un component per als estadis.
  
6. Modifica la vista resources/views/estadis/index.blade.php per heretar de layouts.app.

#### **6. Jugadores**

Fes el mateix amb les jugadores, crea un controlador, una vista i un component.

Exemple : 

```php
$jugadores = [
    ['nom' => 'Alexia Putellas', 'equip' => 'Barça Femení', 'posició' => 'Migcampista'],
    ['nom' => 'Esther González', 'equip' => 'Atlètic de Madrid', 'posició' => 'Davantera'],
    ['nom' => 'Misa Rodríguez', 'equip' => 'Real Madrid Femení', 'posició' => 'Portera'],
];
```
#### **7. Partits**
 
Fes el mateix amb els partits, crea un controlador, una vista i un component.
 
Exemple :

```php
$partits = [
    ['local' => 'Barça Femení', 'visitant' => 'Atlètic de Madrid', 'data' => '2024-11-30', 'resultat' => null],
    ['local' => 'Real Madrid Femení', 'visitant' => 'Barça Femení', 'data' => '2024-12-15', 'resultat' => '0-3'],
];
```

#### **8. Modifica el menu**

Per poder anar a totes les pantalles i canvia les rutes a anomenades.

 ---

#### Preguntes per reflexionar

1. **Rutes:** Per què utilitzem un controlador per gestionar la lògica d'aquesta funcionalitat?
2. **Blade:** Què passa si intentem accedir a una clau que no existeix en un array?
3. **CSS i Vite:** Quina diferència hi ha entre incloure un fitxer CSS estàtic i utilitzar `@vite`?
![[l101.png]]

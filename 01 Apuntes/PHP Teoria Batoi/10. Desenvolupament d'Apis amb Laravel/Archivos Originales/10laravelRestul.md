<style>
    img { margin: 20px 0; border-radius: 8px; }

    .alert { color: #BD1550; }
    .warning { color: #E97F02; }
    .success { color: #8A9B0F; }

    .center { text-align: center; }
    .right { text-align: right; }

    .img-small { max-width: 200px; margin: auto; }
    .img-medium { max-width: 400px; margin: auto; }
    .img-large { max-width: 800px; margin: auto; }

    .leyenda {
        font-size: small;
        margin: 10px 0;
    }
</style>

# Servicios REST

> Duración estimada: 16 sesiones


## Introducció als serveis REST

[![](imagenes/ull.png)Video](https://youtu.be/ByJ804KuEas)

Una **API** (Application Programming Interface) és un conjunt de funcions i procediments pels quals, una aplicació externa accedeix a les dades, a manera de biblioteca com una capa d'abstracció i la API s'encarrega d'enviar la dada sol·licitada.

Una de les característiques fonamentals de les API és que són **Sateless**, la qual cosa vol dir que les peticions es fan i desapareixen, no hi ha usuaris loguejats ni dades que es queden emmagatzemats.

### Característiques fonamentals de REST:
- **Stateless**: Cada petició HTTP conté tota la informació necessària per processar-la.
- **Mètodes HTTP**: Utilitza mètodes com GET, POST, PUT i DELETE.
- **Formats d'intercanvi de dades**: Habitualment JSON o XML.
 

## Els serveis REST

### Consultar una API externa

Per consultar una API externa com https://swapi.dev/ des de Laravel, pots utilitzar la biblioteca HTTP client de Laravel, que proporciona una interfície senzilla per a realitzar peticions HTTP. Ací tens un exemple de com fer una petició GET per a obtenir informació sobre personatges de "Star Wars":

**Instal·la la Biblioteca HTTP Client:**
Si no està ja instal·lat, pots afegir la biblioteca HTTP client de Laravel al teu projecte amb Composer:

```bash
composer require guzzlehttp/guzzle
```

**Realitza una Petició GET:**
Després, pots utilitzar el facade Http per a realitzar una petició GET. Aquí tens un exemple de com consultar informació sobre personatges:

```php
use Illuminate\Support\Facades\Http;

public function getStarWarsCharacters()
{
$response = Http::get('https://swapi.dev/api/people/');

    if ($response->successful()) {
        $data = $response->json();
        // Manipula o mostra les dades com necessites
    } else {
        // Maneja l'error
    }
}
```

En aquest exemple, la petició GET a https://swapi.dev/api/people/ retorna informació sobre personatges de "Star Wars". La resposta es verifica per a comprovar si ha estat exitosa, i després es processen les dades JSON. Pots adaptar aquest codi per a fer altres tipus de consultes a l'API, depenent de la informació que necessites.
 

### Construïnt una API/REST bàsica amb Laravel

Amb aquesta metodologia anomenada **REST** podrem construir *APIs* perquè des d'un client extern es puguen consumir.

Gràcies a aquest **standard** de l'arquitectura del programari podrem muntar una API que utilitze els mètodes standard GET, POST, PUT i DELETE.


#### Instal·lació Laravel Sanctum

Laravel Sanctum proporciona un sistema lleuger d'autenticació dissenyat per a SPAs (Single Page Applications), aplicacions mòbils i APIs senzilles basades en tokens. Amb Sanctum, cada usuari de la teua aplicació pot generar diversos tokens d'API, cadascun amb habilitats o permisos específics que defineixen quines accions poden realitzar amb aquests tokens.

Sanctum resol dues necessitats d'autenticació diferents. Vegem cadascuna abans d'entrar en detall.

##### **1. Tokens d'API**

Sanctum és un paquet senzill que et permet emetre tokens d'API als teus usuaris sense la complexitat d'OAuth. Aquesta funcionalitat està inspirada en plataformes com GitHub, que proporcionen "tokens d'accés personal". Per exemple, la pàgina de configuració del compte de la teua aplicació podria incloure una secció on els usuaris generen tokens d'API per als seus comptes. Aquests tokens solen tindre un temps d'expiració molt llarg (per exemple, anys), però poden ser revocats manualment pels usuaris en qualsevol moment.

Sanctum implementa aquesta funcionalitat mitjançant:
- L'emmagatzematge dels tokens d'API en una taula específica de la base de dades.
- L'autenticació de les peticions HTTP entrants mitjançant l'encapçalament `Authorization`, que ha d'incloure un token d'API vàlid.


##### **2. Autenticació per a SPAs**

Sanctum també ofereix una forma senzilla d'autenticar aplicacions de pàgina única (SPAs) que necessiten comunicar-se amb una API desenvolupada amb Laravel. Aquestes SPAs poden formar part del mateix repositori que la teua aplicació Laravel o ser un repositori totalment separat, com una SPA desenvolupada amb Next.js o Nuxt.

Per a aquesta funcionalitat:
- Sanctum **no utilitza tokens**, sinó que empra els serveis d'autenticació de sessió basats en galetes (cookies) ja integrats en Laravel.
- Normalment, utilitza el sistema d'autenticació web de Laravel per aconseguir-ho, oferint protecció contra CSRF, autenticació de sessió i prevenció de filtracions de credencials mitjançant XSS.

Sanctum només intentarà autenticar-se amb galetes si la petició prové del frontend de la SPA de la teua pròpia aplicació. Quan Sanctum examina una petició HTTP, comprova primer si existeix una galeta d'autenticació. Si no n'hi ha cap, llavors examina l'encapçalament `Authorization` per a un token d'API vàlid.

##### Instal·lació

Es pot instal·lar amb el comanament d'artisan

```bash
php artisan install:api
```

Vegem ara quins passos donar per a construir una API REST en Laravel que done suport a les operacions
bàsiques sobre una o diverses entitats: consultes (GET), insercions (POST), modificacions (PUT) i esborrats (DELETE). Emprarem per a això els denominats controladors de API
i que proporcionen un conjunt de funcions ja definides per a donar suport a cadascun d'aquests
comandos.



#### Definint els controlador de la API

Per a proporcionar una API REST als clients que ho requerisquen, necessitem definir un controlador (ocontroladors) orientats a oferir aquests serveis REST. Aquests controladors en Laravel es denominen de tipus **api**, com vam veure en sessions prèvies. Normalment es definirà un controlador API per cadascun dels models als quals necessitem accedir. 

```php
php artisan make:controller Api/MovieController --api --model=Movie
```

Això crearà el controlador en la carpeta **App\Http\Controllers\Api** amb una sèrie de funcions ja predefinides. No és obligatori situar-ho en aqueixa subcarpeta, òbviament, però això ens servirà per a separar els controladors de API de la resta. Aquesta serà l'aparença del controlador generat:

```php
<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Movie;
use Illuminate\Http\Request;

class MovieController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Movie  $movie
     * @return \Illuminate\Http\Response
     */
    public function show(Movie $movie)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Movie  $movie
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Movie $movie)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Movie  $movie
     * @return \Illuminate\Http\Response
     */
    public function destroy(Movie $movie)
    {
        //
    }
}
```

Observem que s'incorpora automàticament la clàusula use per a carregar el model associat, que hem indicat en el paràmetre **--model** . A més, els mètodes show , update i destroy ja vénen amb un paràmetre de tipus Llibre que facilitarà molt algunes tasques.

##### Establint les rutes (endPoints)


Una vegada tenim el controlador API creat, definirem les rutes associades a cada mètode del controlador. Podem emprar el mètode **Route::apiResource** en l'arxiu
**routes/api.php** per a establir automàticament totes les rutes d'un controlador de API. Afegim aquesta línia en aquest arxiu **routes/api.php** :

```
Route::apiResource('movies',Api\MovieController::class);
```

Les rutes de API (aquelles definides en l'arxiu **routes/api.php** ) per defecte tenen un prefix api , tal com s'estableix en el provider **RouteServiceProvider** . Per tant, hem definit una
ruta general **api/movies** , de manera que totes les subrutes que es deriven d'ella portaran a l'un o l'altre mètode del controlador de API de video.
Podem comprovar quines rutes hi ha actives amb aquest comando:

```
php artisan route:list

+--------+-----------+--------------------+----------------+--------------------------------------------------+------------+
| Domain | Method    | URI                | Name           | Action                                           | Middleware |
+--------+-----------+--------------------+----------------+--------------------------------------------------+------------+
|        | GET|HEAD  | /                  |                | App\Http\Controllers\HomeController              | web        |
|        | GET|HEAD  | api/movies         | movies.index   | App\Http\Controllers\Api\MovieController@index   | api        |
|        | POST      | api/movies         | movies.store   | App\Http\Controllers\Api\MovieController@store   | api        |
|        | GET|HEAD  | api/movies/{movie} | movies.show    | App\Http\Controllers\Api\MovieController@show    | api        |
|        | PUT|PATCH | api/movies/{movie} | movies.update  | App\Http\Controllers\Api\MovieController@update  | api        |
|        | DELETE    | api/movies/{movie} | movies.destroy | App\Http\Controllers\Api\MovieController@destroy | api        |
|        | GET|HEAD  | api/user           |                | Closure                                          +--------------------------------------------------+------------+

```

### Serveis GET

Començarem per definir el mètode index . En aquest cas, obtindrem el conjunt de videos de labase de dades i retornar-lo tal qual:

```php
public function index()
{
	$movies = Movie::get();
	return $movies;
}
```

Si accedim a la ruta **api/videos** des del navegador, s'activarà el mètode index que acabem d'implementar, i rebrem els llibres de la base de dades, directament en format JSON.

```json
{
"id": 1,
"title": "El padrino",
"year": "1972",
"director": "Francis Ford Coppola",
"poster": "http://ia.media-imdb.cimages/M/MV5BMjEyMjcyNDI4MF5BMl5BanBnXkFtZTcwMDA5Mzg3OA@@._V1_SX214_AL_.jpg",
"rented": 0,
"synopsis": "Don Vito Corleone (Marlon Brando) es el respetado y temido jefe de una de las cinco familias de la mafia de Nueva York. Tiene cuatro hijos: Connie (Talia Shire), el impulsivo Sonny (James Caan), el pusilánime Freddie (John Cazale) y Michael (Al Pacino), que no quiere saber nada de los negocios de su padre. Cuando Corleone, en contra de los consejos de 'Il consigliere' Tom Hagen (Robert Duvall), se niega a intervenir en el negocio de las drogas, el jefe de otra banda ordena su asesinato. Empieza entonces una violenta y cruenta guerra entre las familias mafiosas.",
"created_at": "2020-12-03T11:19:19.000000Z",
"updated_at": "2020-12-21T10:36:20.000000Z"
},
{
"id": 2,
"title": "El Padrino. Parte II",
"year": "1974",
"director": "Francis Ford Coppola",
"poster": "http://ia.media-imdb.cimages/M/MV5BNDc2NTM3MzU1Nl5BMl5BanBnXkFtZTcwMTA5Mzg3OA@@._V1_SX214_AL_.jpg",
"rented": 0,
"synopsis": "Continuación de la historia de los Corleone por medio de dos historias paralelas: la elección de Michael Corleone como jefe de los negocios familiares y los orígenes del patriarca, el ya fallecido Don Vito, primero en Sicilia y luego en Estados Unidos, donde, empezando desde abajo, llegó a ser un poderosísimo jefe de la mafia de Nueva York.",
"created_at": "2020-12-03T11:19:19.000000Z",
"updated_at": "2020-12-03T11:19:19.000000Z"
}}
```


D'una forma similar, podríem implementar i provar el mètode show

```php
public function show(Movie $movie)
{
	return $movie;
}
```

En aquest cas, si accedim a la URI **api/movies/1** , obtindrem la informació del video amb id = 1. Notar que Laravel s'encarrega automàticament de buscar el llibre per nosaltres (fer la corresponent operació **find** per a l'id proporcionat). És el que es coneix com a enllaç implícit, i és alguna cosa que també està disponible en els controladors web normals, sempre que els associem correctament amb el model vinculat. Això es fa automàticament si creem el controlador juntament amb el model o si usem el paràmetre --model per a associar-ho, com hem fet ací.

#### Maneig de Respostes JSON en Laravel

Laravel ofereix diverses eines per gestionar respostes JSON, ja siga directament o utilitzant API Resources. Aquesta guia mostra com personalitzar les respostes, controlar els camps visibles i gestionar la paginació.

##### 1. Ús de `response()->json()`

Aquest mètode et permet retornar respostes JSON personalitzades amb un codi d'estat específic.

```php
public function show(Movie $movie)
{
    return response()->json($movie, 200); // JSON amb codi 200 (èxit)
}

```


| Codi | Significat                   |
|------|-------------------------------|
| 200  | Operació correcta.            |
| 201  | Recurs creat (ex. POST).      |
| 204  | Sense contingut (ex. DELETE). |
| 400  | Petició incorrecta.           |
| 404  | No trobat.                    |
| 500  | Error del servidor.           |

##### 2. Camps Ocults o Visibles en Models

Laravel permet configurar directament al model quins camps es mostraran o s'ocultaran a les respostes JSON.

- **Ocultar camps:** Utilitza la propietat `hidden` en el model.

```php
protected $hidden = ['password'];
``` 

- **Mostrar només camps seleccionats:** Utilitza la propietat `visible` en el model.

```php
protected $visible = ['id', 'name', 'email'];
```

##### 3. Personalització Directa a Controladors

Si necessites un control més gran sobre els camps retornats, pots definir manualment un array al controlador.

```php
public function show(Movie $movie)
{
    return [
        'title' => $movie->title,
        'director' => $movie->director,
    ];
}

```

##### 4. Ús de Recursos (API Resources)

Els **API Resources** permeten controlar millor el format de les respostes JSON, separant la lògica de transformació del model.

**Generar un recurs:**
Es pot generar un recurs amb Artisan, i aquest recurs s'utilitza per personalitzar les dades que es retornen.

```php
php artisan make:resource MovieResource
```

**Definir el format al reecurs**

```php
namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class MovieResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'title' => $this->title,
            'director' => $this->director,
            'release_year' => $this->year,
        ];
    }
}
```

**Ús al controlador:**

```php
use App\Http\Resources\MovieResource;

public function show(Movie $movie)
{
    return new MovieResource($movie);
}
```

##### 5. Col·leccions i Paginació

**Generar un recurs per col·leccions:**
També es poden crear recursos per transformar col·leccions de dades, incloent-hi metadades i enllaços addicionals.

```bash
php artisan make:resource MovieCollection
```

**Personalitzar les col·leccions:**

```php
namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\ResourceCollection;

class MovieCollection extends ResourceCollection
{
    public function toArray($request)
    {
        return [
            'data' => $this->collection,
            'meta' => [
                'total_movies' => $this->collection->total(),
                'per_page' => $this->collection->perPage(),
                'current_page' => $this->collection->currentPage(),
                'last_page' => $this->collection->lastPage(),
            ],
            'links' => [
                'self' => url('/api/movies'),
            ],
        ];
    }
}
```


### **Paginar resultats:**
Utilitza el mètode `paginate()` per retornar resultats paginats. Les respostes amb `paginate()` inclouen metadades com el nombre total de registres, la pàgina actual i els enllaços de navegació.

```php
use App\Http\Resources\MovieCollection;

public function index()
{
    return new MovieCollection(Movie::paginate(10));
}
```


### **Respostes JSON amb paginació:**
Quan utilitzes `paginate()`, Laravel afegeix metadades útils a la resposta JSON, com ara el total de registres, el nombre per pàgina, la pàgina actual, etc.

```json
{
    "data": [
        {
            "id": 1,
            "title": "The Godfather",
            "director": "Francis Ford Coppola",
            "release_year": 1972
        },
        {
            "id": 2,
            "title": "The Godfather: Part II",
            "director": "Francis Ford Coppola",
            "release_year": 1974
        }
    ],
    "meta": {
        "total_movies": 50,
        "per_page": 10,
        "current_page": 1,
        "last_page": 5
    },
    "links": {
        "self": "http://example.com/api/movies"
    }
}
```

## 6. Personalització dels Recursos

Els recursos també poden incloure dades de relacions o camps calculats, com ara informació agregada o camps derivats.

```php
class MovieResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'title' => $this->title,
            'director' => $this->director,
            'release_year' => $this->year,
            'genre' => $this->genre->name ?? 'Unknown', // Relació amb gènere
            'rating' => $this->reviews->avg('rating'), // Mitjana de valoracions
        ];
    }
}
```


##### Resum

1. **`response()->json()`**: Útil per a respostes senzilles.
2. **Camps ocults o visibles**: Control directe al model.
3. **API Resources**: Separen la lògica de transformació i ofereixen flexibilitat.
4. **Paginació**: Facilita la navegació de dades grans amb `paginate()`.

Laravel 11 fa que el maneig de respostes JSON siga flexible, escalable i fàcil d'implementar.

### Resta dels serveis


Vegem ara com implementar la resta de serveis (POST, PUT i DELETE). En el cas de la inserció (POST), haurem de rebre en la petició les dades de l'objecte a inserir (un llibre, en el nostre exemple). Igual que les dades del servidor al client s'envien en format JSON, és d'esperar en aplicacions que segueixen l'arquitectura REST que les dades del client al servidor també s'envien en format JSON.
El nostre mètode **store** , associat al servei POST, podria quedar d'aquesta manera (retornem el codi d'estat 201, que s'utilitza quan s'han inserit elements nous):

```php
public function store(MoviePost $request)
{
        $movie = new Movie();
        $movie->title = $request->title;
        $movie->year = $request->year;
        $movie->director = $request->director;
        $movie->poster = $request->poster;
        $movie->synopsis = $request->synopsis;
        $movie->save();
        return response()->json($movie, 201);
}
```

De forma semblant tindriem el mètode **update** per al servei PUT. En est cas tornem un codi 200.

```php
 public function update(MoviePost $request, Movie $movie)
    {
        $movie->title = $request->title;
        $movie->year = $request->year;
        $movie->director = $request->director;
        $movie->poster = $request->poster;
        $movie->synopsis = $request->synopsis;
        $movie->save();
        return response()->json($movie);
    }
```    

Finalment, pel servei DELETE, hem d'implementar el mètode **destroy** , que podria quedar així:

```php
public function destroy(Movie $movie)
{
	$movie->delete();
	return response()->json(null, 204);
}
```

Notar que retornem un codi d'estat 204, que indica que no estem retornant contingut (és null). D'altra banda, és habitual en aquesta mena d'operacions d'esborrat retornar en format JSON l'objecte que s'ha eliminat, per si de cas es vol desfer l'operació en un pas posterior. En aquest cas, la resposta del mètode d'esborrat seria així:

```php
return response()->json($movie,204);
```

Com podem començar a intuir, provar aquests serveis no és tan senzill com provar serveis de tipus GET, ja que no podem simplement teclejar una URL en el navegador. Necessitem un mecanisme per a passar-li les dades al servidor en format JSON, i també el mètode (POST, PUT o DELETE).

##### Validació de dades

A l'hora de rebre dades en format JSON per a serveis REST, també podem establir mecanismes de validació similars als vistos per als formularis, a través dels corresponents **requests**, com ja hem fet en els exemples anteriors.

##### Respostes d'error


D'altra banda, hem d'assegurar-nos que qualsevol error que es produïsca en la part del API retorne un contingut en format JSON, i no una pàgina web. Per exemple, si sol·licitem veure la fitxa d'un llibre que el seu id no existeix, no hauria de retornar-nos una pàgina d'error 404, sinó un codi d'estat 404 amb un missatge d'error en format JSON.
Això no es compleix per defecte, ja que Laravel està configurat per a renderitzar una vista amb l'error produït.  Ho podem fer modificant el fitxer bootstrap/app.php.

```php
->withExceptions(function (Exceptions $exceptions) {
        // Gestionar excepcions en format JSON només per a rutes API
        $exceptions->shouldRenderJsonWhen(function (Request $request, Throwable $e) {
            // Només retornar JSON si la ruta comença amb "api/*"
            return $request->is('api/*');
        });

        // Renderitzar excepcions personalitzades
        $exceptions->render(function (Throwable $e, Request $request) {
            // Excepcions de validació
            if ($e instanceof \Illuminate\Validation\ValidationException) {
                return response()->json([
                    'message' => 'Dades no vàlides.',
                    'errors' => $e->errors(),
                ], 422);
            }

            // Excepcions d'autenticació
            if ($e instanceof \Illuminate\Auth\AuthenticationException) {
                return response()->json([
                    'message' => 'No autenticat.',
                ], 401);
            }

            // Ruta no trobada
            if ($e instanceof \Symfony\Component\HttpKernel\Exception\NotFoundHttpException) {
                if ($request->is('api/*')) {
                    return response()->json([
                        'message' => 'Ruta no trobada.',
                    ], 404);
                }
                // Comportament per defecte per a rutes no API (HTML)
                return parent::render($request, $e);
            }

            // Recurs no trobat
            if ($e instanceof \Illuminate\Database\Eloquent\ModelNotFoundException) {
                if ($request->is('api/*')) {
                    return response()->json([
                        'message' => 'Recurs no trobat.',
                    ], 404);
                }
                return parent::render($request, $e);
            }

            // Resposta genèrica per a errors del servidor
            if ($request->is('api/*')) {
                return response()->json([
                    'message' => 'Error del servidor.',
                ], 500);
            }

            // Comportament per defecte per a rutes no API
            return parent::render($request, $e);
        });
```
#### Provant els serveis amb POSTMAN

Ja hem vist que provar uns serveis de llistat (GET) és senzill a través d'un navegador. Però els serveis d'inserció (POST), modificació (PUT) o esborrat (DELETE) exigeixen d'altres eines per a poder ser provats. Podríem definir formularis amb aquests mètodes encapsulats, però l'esforç de definir
aqueixos formularis per a després no utilitzar-los més no mereix molt la pena. Veurem a continuació una eina molt útil per a provar tot tipus de serveis sense necessitat d'implementar gens addicional.

**Postman** és una aplicació gratuïta i multiplataforma que permet enviar tot tipus de peticions a un servidor determinat, i examinar la resposta que aquest produeix. D'aquesta forma, podem comprovar que els serveis ofereixen la informació adequada abans de ser usats per una aplicació client real.

La primera vegada que l'executem ens preguntarà si volem registrar-nos, de manera que puguem compartir els projectes que fem entre els diferents equips en què estiguem registrats, però podem saltar aquest pas fent clic en l'enllaç inferior.

Després d'iniciar l'aplicació, veurem la pantalla d'inici de Postman. Al principi apareixeran diverses opcions en la zona central, per a crear col·leccions o peticions, encara que també les podem crear des del
botó **New** a la cantonada superior esquerra. Per exemple, podem crear una col·lecció "Movies", i apareixerà en el panell esquerre:

Des del mateix botó*New a la cantonada superior esquerra podem crear noves peticions i associar-les a una col·lecció. Existeix una forma alternativa (potser més còmoda) de crear aqueixes peticions, a través del panell
de pestanyes, afegint noves:

##### Afegir peticions GET


Per a afegir una petició, habitualment triarem el tipus de comando sota les pestanyes (GET, POST, PUT, DELETE) i la URL associada a aquest comando. Per exemple:

![](imagenes/08/postman_1.png)

Llavors, podem fer clic en el botó "Save" en la part dreta, i guardar la petició per a poder-la reutilitzar. En guardar-la, ens demanarà que li assignem un nom (per exemple, "GET movies" en aquest cas), i la
col·lecció en la qual s'emmagatzemarà (la nostra col·lecció de "Movies").

![](imagenes/08/postman_2.png)

Després, podrem veure la prova associada a la col·lecció, en el panell esquerre, i si seleccionem aquesta prova i premem en el botó blau de "*Send" (part dreta), podem veure la resposta emesa pel servidor en el panell inferior de resposta (si tenim, és clar, el servidor en marxa)

![](imagenes/08/postman_3.png)

Seguint aquests mateixos passos, podem també crear una nova petició per a obtindre un llibre a partir del seu id, per GET:

![](imagenes/08/postman_4.png)

Bastaria amb reemplaçar l'id de la URL pel qual vulguem consultar realment. Si provem aquesta petició, obtindrem la resposta corresponent:

![](imagenes/08/postman_5.png)

##### Afegir altres tipus de peticions

Les peticions POST difereixen de les peticions GET en què s'envia certa informació en el cos de la petició. Aquesta informació normalment són les dades que es volen afegir en el servidor. Com podem fer això amb Postman?
En primer lloc, creem una nova petició, triem el comando POST i definim la URL (en el nostre cas, videoclub.my/api/movies o una cosa similar, depenent de com tinguem en marxa el servidor).
Llavors, fem clic en la pestanya Body, sota la URL, i establim el tipus com **raw** perquè ens deixe escriure'l sense restriccions. També convé canviar la propietat **Text** perquè siga JSON, i que així el servidor reculla el tipus de dada adequada. S'afegirà automàticament una capçalera de petició (**Header**)
que especificarà que el tipus de contingut que s'enviarà són dades JSON. Després, en el quadre de text sota aquestes opcions, especifiquem l'objecte JSON que volem enviar per a inserir:

![](imagenes/08/postman_6.png)

Després d'això, n'hi ha prou amb guardar la petició com hem fet amb les anteriors, i llançar-la per a veure el resultat.

Quant a les peticions PUT, procedirem de manera similar a les peticions POST: hem de triar el comando (PUT en aquest cas), la URL, i completar el cos de la petició amb les dades que vulguem modificar del contacte. En aquest cas, a més, l'id del llibre l'enviarem també en la pròpia URL:

![](imagenes/08/postman_7.png)

Per a peticions DELETE, la mecànica és similar a la fitxa de l'element (operació GET), canviant el comando GET per DELETE, i sense necessitat d'establir res en el cos de la petició:

![](imagenes/08/postman_8.png)

### Autenticació en serveis REST

 
En una API REST també pot ser necessari protegir certs serveis, de manera que només puguen accedir a ells els usuaris autenticats. No obstant això, en aquest cas no tenim disponible el mecanisme d'autenticació basat en sessions que vam veure en temes anteriors, ja que la parteix client que consula la API
REST no té per què estar basada en un navegador. Podríem accedir des d'una aplicació d'escriptori feta a Java, per exemple, o des d'una aplicació mòbil, i en aquests casos no podríem disposar de les sessions, pròpies de clients web o navegadors. En el seu lloc, emprarem un mecanisme d'autenticació basat en tokens.

#### Fonaments de l'autenticació basada en tokens

L'autenticació basada en tokens és un mecanisme de validació d'usuaris en aplicacions client/servidor que podríem dir que és més universal que l'autenticació basada en sessions, ja que permet autenticar usuaris provinents de diferents tipus de clients. El que es fa és el següent:

* L'usuari necessita enviar les seues credencials (login i password), de manera similar a com es fa en una aplicació web normal, encara que aquesta vegada les dades s'envien normalment en format JSON.
* El servidor valida aqueixes credencials i, si són correctes, genera una cadena de text anomenada **token**, d'una certa longitud, i que servirà per a identificar unívocament a l'usuari a partir d'aqueix moment. Dit token ha de ser enviat de tornada (també en format JSON) al client que es va validar.
* A partir d'aquest punt, el client ha d'adjuntar el token com a part de la informació en cada petició que realitza a una zona d'accés restringit, de manera que el servidor puga consultar el token i comprovar si correspon amb el d'algun usuari autoritzat. Aquest token normalment s'envia en una capçalera de la petició anomenada **Authorization**, com veurem després, i el servidor pot consultar el valor d'aquesta capçalera per a verificar l'accés del client.

  
#### Generant tokens

Sanctum us permet emetre tokens API / tokens d'accés personal que es poden utilitzar per autenticar les peticions API a la vostra aplicació. Quan es fan sol·licituds utilitzant tokens API, el token s'ha d'incloure a la capçalera d'autorització com a token Bearer.

Per començar a emetre tokens per als usuaris, el model d'usuari hauria d'utilitzar el trait Laravel\Sanctum\HasApiTokens:

```php
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
use HasApiTokens, HasFactory, Notifiable;
}
```

Per a emetre un token, podeu utilitzar el mètode createToken. El mètode createToken retorna una instància Laravel\Sanctum\NewAccessToken. Els tokens de l'API es generen utilitzant el hash SHA-256 abans de ser emmagatzemats a la vostra base de dades, però podeu accedir al valor de text net del token utilitzant la propietat PlainTextToken de la instància NewAccessToken.
Per a vincular la generació del token amb un procediment d'autenticació podem fer-ho definint un mètode login , per exemple, que validarà les credencials que li arriben (login i password). Si són correctes, cridarà al mètode **createToken** de Sanctum (incorporat a l'usuari a través del **trait HasApiTokens** ), associant-lo al login de l'usuari entrant, i li retornarà el token en
format text pla, com un objecte JSON. En cas que hi haja un error en l'autenticació, enviarà de tornada un missatge d'error, amb el codi 401 d'accés no autoritzat.


```console
php artisan make:controller Api/AuthController
```


```php
namespace App\Http\Controllers\Api;
 use App\Http\Controllers\Controller as Controller;
class BaseController extends Controller
{
    /**
     * success response method.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function sendResponse($result, $message, $code = 200)
    {
        $response = [
            'success' => true,
            'data'    => $result,
            'message' => $message,
        ];
        return response()->json($response, $code);
    }
    /**
     * return error response.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function sendError($error, $errorMessages = [], $code = 200)
    {
        $response = [
            'success' => false,
            'message' => $error,
        ];
        if(!empty($errorMessages)){
            $response['info'] = $errorMessages;
        }
        return response()->json($response, $code);
    }
}
```

```php
namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Api\BaseController as BaseController;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use App\Models\User;

class AuthController extends BaseController
{
    public function login(Request $request)
    {
        if (Auth::attempt(['email' => $request->email, 'password' => $request->password])){
            $authUser = Auth::user();
            $result['token'] =  $authUser->createToken('MyAuthApp')->plainTextToken;
            $result['name'] =  $authUser->name;

            return $this->sendResponse($result, 'User signed in');
        }
        return $this->sendError('Unauthorised.', ['error'=>'incorrect Email/Password']);
    }
    public function register(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'email' => 'required|email',
            'password' => 'required',
            'confirm_password' => 'required|same:password',
        ]);

        if ($validator->fails()){
            return $this->sendError('Error validation', $validator->errors());
        }

        try {
            $input = $request->all();
            $input['password'] = bcrypt($input['password']);
            $user = User::create($input);
            $result['token'] =  $user->createToken('MyAuthApp')->plainTextToken;
            $result['name'] =  $user->name;

            return $this->sendResponse($result, 'User created successfully.');
        } catch (\Exception $e) {
            return $this->sendError('Registration Error' , $e->getMessage());
        }
    }
    public function logout(Request $request)
    {
 
        $user = request()->user(); //or Auth::user()
        $user->tokens()->where('id', $user->currentAccessToken()->id)->delete();
        $success['name'] =  $user->name;
         return $this->sendResponse($success, 'User successfully signed out.');
    }

}

```

Definim en l'arxiu **routes/api.php** una ruta que redirigisca a aquest mètode, per a quan l'usuari vulga autenticar-se (recorda afegir amb use la corresponent classe):

```php
Route::post('login', [AuthController::class, 'login'])->middleware('api');
Route::post('register', [AuthController::class, 'register'])->middleware('api');


Route::middleware(['auth:sanctum','api'])->group( function () {
    Route::post('logout', [AuthController::class, 'logout']);

});

 ```

##### Protecció de rutes


Per protegir rutes de manera que totes les sol·licituds entrants s'hagin d'autenticar, hauríeu d'adjuntar el guard d'autenticació sanctum a les rutes protegides dins dels vostres fitxers de rutes/api.php. Aquest guard assegurarà que les peticions entrants s'autentiquen com a peticions d'estat, galetes autenticades o continguin una capçalera vàlida de testimoni API si la petició és d'un tercer.


 ```php
  
Route::get('/user',[userController::class,'show'])->middleware('auth:sanctum');
```

##### Revocant tokens

Podeu "revocar" tokens suprimint-los de la base de dades utilitzant la relació tokens que proporciona el tret Laravel\Sanctum\HasApiTokens:

```php
// Revoke all tokens...
$user->tokens()->delete();

// Revoke the token that was used to authenticate the current request...
$request->user()->currentAccessToken()->delete();

// Revoke a specific token...
$user->tokens()->where('id', $tokenId)->delete();
```

##### Caducitat del tokens
Per defecte, els tokens de Sanctum no caduquen i només poden ser invalidats revocant el token. No obstant això, si voleu configurar un temps de venciment per als toekns API de la vostra aplicació, podeu fer-ho mitjançant l'opció de configuració de venciment definida al fitxer de configuració de sanctum de la vostra aplicació. Aquesta opció de configuració defineix el nombre de minuts fins que un token emès es consideri expirat:

```
'expiració' =, 525600,
```

Si heu configurat un temps de venciment del token per a la vostra aplicació, també podeu programar una tasca per a eliminar els tokens caducats de la vostra aplicació. Afortunadament, Sanctum inclou un ordre sanctum:prune-expired Artisan que podeu utilitzar per aconseguir això. Per exemple, podeu configurar les tasques programades per a suprimir tots els registres de la base de dades de tokens caducats que hagin expirat almenys 24 hores:

```console
$schedule->command('sanctum:prune-expired --hours=24')->daily();
```

##### Prova d'autenticació amb POSTMAN

Vegem com provar l'autenticació per token en el projecte de videoclub, per qualsevol dels mètodes vistos abans.
En primer lloc, i després de posar en marxa el projecte, ens assegurarem que podem accedir sense restriccions als dos serveis que no requereixen autorització ( index o show ), igual que abans.


Si accedim a un recurs protegit obtenim 

```json
{ "error": "Credenciales no válidas"}
```

Ara anem a loguejar-se


![](imagenes/08/postman_9.png)

Ara hem de copiar aquest token, i pegar-ho en la petició d'accés restringit. Haurem de pegar-ho en la capçalera Authorization (obrir aqueixa pestanya sota la URL de la petició en Postman), i el normal és enviar-ho com un **Bearer token**, segons els estàndards. Llavors sí que tindrem la resposta correcta de l'operació
sol·licitada.

![](imagenes/08/postman_10.png)

A l'hora de traslladar aquestes proves a una aplicació "real", enviaríem les credencials per JSON al servidor, obtindríem el token de tornada i l'emmagatzemaríem localment en alguna variable o suport
(per exemple, en l'element localStorage , si treballem amb algun framework Javascript). Després, davant cada petició JSON que férem al servidor, adjuntaríem aquest token en la capçalera Authorization perquè fóra validat pel servidor.

### [Què és swagger](https://www.chakray.com/es/swagger-y-swagger-ui-por-que-es-imprescindible-para-tus-apis/)


[![](../img/ull.png)Video](https://youtu.be/3-gZqyhuFPY)
[![](../img/ull.png)Video](https://youtu.be/thXuHLM54K4)

### Documentació

Per a poder utilitzar swagger en Laravel podem instal·lar el següent paquet que utilitza Swagger-php i swagger-ui adaptat per treballar amb Laravel.

```
composer require "darkaonline/l5-swagger"
```

i publicarem el fitxers de configuració i vistes

```
php artisan vendor:publish --provider "L5Swagger\L5SwaggerServiceProvider"
```

A continuació, obriu un fitxer **config/l5-swagger.php**.  Passem per les claus essencials:

* routes.api - Aquest és una URL per accedir a la documentació d'interfície d'usuari.  El vostre equip de frontend l'utilitzarà per accedir a la documentació.  Per defecte és api/documentació.  Podeu canviar-ho a quelcom més petit com api/docs

* Generar_always — Es millor desactivar-ho ja que generarà documentació sobre la marxa.  No és útil amb l'API gran.  Sempre podeu executar manualment

```
    php artisan config:cache
	php artisan l5-swagger:generate
```

Aquests són els més importants per a començar.  Ara si intenteu crear documents mitjançant aquesta ordre retornarà un error

```
Required @OA\Info() not found
```

Això vol dir que primer heu de crear aquesta notació.  Així que afegim-ho.  Prefereixo crear un controlador abstracte per a una API, però podeu afegir això a **app/Http/Controllers/Controller.php**


```
/**
 * @OA\Info(
 *    title="Your super  ApplicationAPI",
 *    version="1.0.0",
 * )
 */
class Controller extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;
}
```

A continuació, hem d'afegir documents per a almenys una ruta, per exemple per per app/Http/Controllers/Api/LoginController.php:

```
/**
 * @OA\Post(
 * path="/login",
 * summary="Sign in",
 * description="Login by email, password",
 * operationId="authLogin",
 * tags={"auth"},
 * @OA\RequestBody(
 *    required=true,
 *    description="Pass user credentials",
 *    @OA\JsonContent(
 *       required={"email","password"},
 *       @OA\Property(property="email", type="string", format="email", example="user1@mail.com"),
 *       @OA\Property(property="password", type="string", format="password", example="PassWord12345"),
 *       @OA\Property(property="persistent", type="boolean", example="true"),
 *    ),
 * ),
 * @OA\Response(
 *    response=422,
 *    description="Wrong credentials response",
 *    @OA\JsonContent(
 *       @OA\Property(property="message", type="string", example="Sorry, wrong email address or password. Please try again")
 *        )
 *     )
 * )
 */
```

Ara, estàs preparat per generar **php artisan l5-swagger:generate** i vés a l'URL que has proporcionat a la teva configuració.  En el meu cas, serà http://videoclub/api/docs.

Veuràs una cosa així:

![](../img/swagger_1.png)

Ara mirarem les anotacions.  Intentaré explicar com utilitzar-les:

* **@OA** — significa anotació d'Open API.  Podeu llegir més [aquí](https://swagger.io/specification/)
* **@OA/POST**  — vol dir petició DE POST.  Hi ha GET, POST, DELETE, etc.
* **Path** — és un URL
* **Tags** — us agruparà API per seccions.
* **@OA\RequestBody** — és obvi pel nom.  Hauria de tenir una anotació JsonContent dins amb propietats (és a dir, descripcions de camp).
* **OA\Response** — podeu tenir tantes respostes com vulgueu.  Hauríeu de proporcionar totes les respostes possibles d'èxit i error.

Anem a afegir un codi de resposta 200:

```
* 	@OA\Response(
*     response=200,
*     description="Success",
*     @OA\JsonContent(
*        @OA\Property(property="user", type="object", ref="#/components/schemas/User"),
*     )
*  ),
```

L'anotació **@OA\Property** té una clau de propietat(nom de camp) i un tipus.  El tipus pot tenir valors diferents: string, object, integer, array, boolean, etc.
En aquesta resposta, vaig utilitzar el tipus objecte.  Podeu passar una referència a aquest objecte.  Crearem un objecte **user**.  Prefereixo afegir això a la classe Model.

```
/**
 *
 * @OA\Schema(
 * required={"password"},
 * @OA\Xml(name="User"),
 * @OA\Property(property="id", type="integer", readOnly="true", example="1"),
 * @OA\Property(property="role", type="string", readOnly="true", description="User role"),
 * @OA\Property(property="email", type="string", readOnly="true", format="email", description="User unique email address", example="user@gmail.com"),
 * @OA\Property(property="email_verified_at", type="string", readOnly="true", format="date-time", description="Datetime marker of verification status", example="2019-02-25 12:59:20"),
 * @OA\Property(property="first_name", type="string", maxLength=32, example="John"),
 * @OA\Property(property="last_name", type="string", maxLength=32, example="Doe"),

 * )
 *
 * Class User
 *
 */
```

Mireu aquesta notació **@OA\Xml(nom=” Usuari)**.  Aquest nom s'utilitzarà en una clau ref de la **@OA\Property**



Ara veureu una icona de bloqueig prop de la ruta.  Quan feu clic sobre això, podreu afegir l'autenticació de Bearer.

![](../img/swagger_2.png)

### [Exemple](https://blog.quickadminpanel.com/laravel-api-documentation-with-openapiswagger/)

El gran problema d'este component és que no està ben documentat. Partint del següent exemple he documentant el mètode get i post del videoclub i ha quedat així:

Primer cal possar l'inici del swagger en el **Controller.php** de la següent manera:


```
/**
 * @OA\Info(
 *    title="VideoClub ApplicationAPI",
 *    version="1.0.0",
 * )
 */

/**
 * @OA\SecurityScheme(
 *     type="http",
 *     description="Login with email and password to get the authentication token",
 *     name="Token based Based",
 *     in="header",
 *     scheme="bearer",
 *     bearerFormat="JWT",
 *     securityScheme="apiAuth",
 * )
 */
```
La primera part serveix per a identificar el projecte i la segon per a l'autenticació de la API basada en tokens.

Ara omplirem el **model Movie.php** per a generar el schema Movie.

```
/**
 *
 * @OA\Schema(
 * required={"id,title"},
 * @OA\Xml(name="Movie"),
 * @OA\Property(property="id", type="integer", readOnly="true", example="1"),
 * @OA\Property(property="title", type="string", readOnly="true", description="User role"),
 * @OA\Property(property="year", type="integer", readOnly="true",  description="Year", example="1956"),
 * @OA\Property(property="director", type="string", readOnly="true",  description="Director", example="Copolla"),
 * @OA\Property(property="genre", type="string", readOnly="true",  description="Genre", example="Thriller"),
 * )
 */
```
Observeu que en el genre retorne un string perquè serà el que voldrè retornar, en compte de la id de Genre.

Ara generarè el schema de la petició request del post de movie. No és exactament igual que esta perquè ací voldré el genre amb ID i restriccions en alguns camps. Ho puc fer en el **MoviePost.php** dins de request.

```
/**
 * @OA\Schema(
 *      title="Store Movie Request",
 *      required={"title,director,year"},
 *      description="Store Movie request body data",
 *      @OA\Xml(name="MoviePost"),
 * )
 */
 /**
     * @OA\Property(
     *      property = "title",
     *      title="name",
     *      description="Title",
     *      example="Titanic"
     * )
     *
     * @var string
     */
  /**
     * @OA\Property(
     *      property = "year",
     *      title="year",
     *      description="Year",
     *      example="1998"
     * )
     *
     * @var integer
     */
 /**
     * @OA\Property(
     *      property = "genre",
     *      title="genre",
     *      description="Genre",
     *      example="1"
     * )
     *
     * @var integer
     */
 /**
     * @OA\Property(
     *      property = "director",
     *      title="director",
     *      description="Director",
     *      example="Steven Spilberg"
     * )
     *
     * @var string
     */
    /**
     * @OA\Property(
     *      property = "synopsis",
     *      title="synopsis",
     *      description="Synopsis",
     *      example="De que va la pelicula"
     * )
     *
     * @var string
     */

    /**
     * @OA\Property(
     *      property = "poster",
     *      title="poster",
     *      description="Poster",
     *      example="adreça del poster"
     * )
     *
     * @var string
     */         
``` 
No he pogut fer-ho d'un altra manera. Diferix un poc de la que he utilitzat al model Movie, però si no ho feia així no funcionaba.

Falta ara generar la resposta de totes les pelicules per al index. Per aço genere un Resource per a Movies, amb el següent codi.

```php
<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
/**
 * @OA\Schema(
 *     title="MovieResource",
 *     description="Project resource",
 *     @OA\Xml(name="MovieResource"),
 * )
 */
class MovieResource extends JsonResource
{
    /**
     * Transform the resource collection into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */

    /**
     * @OA\Property(
     *     property="data",
     *     title="data",
     *     description="Data wrapper"
     * )
     *
     * @var \App\Models\Movie[]
     */
    public function toArray($request)
    {
        return [ 'id' => $this->id,
            'title' => $this->title,
            'director' => $this->director,
            'year' => $this->year,
            'genre' => $this->Genre->title??'Desconocido'];
    }
}
``` 
Este resource farà que quan l'utilitze hem retornarà els camps que he possat en la funció toArray i no tots els camps. El puc utilitzar per tornar camps de relacions o canviar el nom dels camps. En quan al swagger, noteu que torne un array de Movies dins d'un camp data.

Per últim el controlador de movies queda de la següent manera.

```php
  /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    /**
     * @OA\Get(
     *      path="/api/movies",
     *      operationId="getMoviesList",
     *      tags={"Movies"},
     *      summary="Get list of movies",
     *      description="Returns list of movies",
     *      @OA\Response(
     *          response=200,
     *          description="Successful operation",
     *          @OA\JsonContent(ref="#/components/schemas/MovieResource")
     *       ),
     *      @OA\Response(
     *          response=401,
     *          description="Unauthenticated",
     *      ),
     *      @OA\Response(
     *          response=403,
     *          description="Forbidden"
     *      )
     *     )
     */
    public function index()
    {

        return MovieResource::collection(Movie::get());
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    /**
     * @OA\Post(
     *      path="/api/movies",
     *      operationId="movieProject",
     *      tags={"Movies"},
     *      summary="Store new movie",
     *      description="Returns movie data",
     *      security={ {"apiAuth": {} }},
     *      @OA\RequestBody(
     *          required=true,
     *          @OA\JsonContent(ref="#/components/schemas/MoviePost")
     *      ),
     *      @OA\Response(
     *          response=201,
     *          description="Successful operation",
     *          @OA\JsonContent(ref="#/components/schemas/Movie")
     *       ),
     *      @OA\Response(
     *          response=400,
     *          description="Bad Request"
     *      ),
     *      @OA\Response(
     *          response=401,
     *          description="Unauthenticated",
     *           @OA\JsonContent(
     *              @OA\Property(
     *                  property="error",
     *                  type="string",
     *                  example="Usuario no autenticado"))
     *      ),
     *      @OA\Response(
     *          response=403,
     *          description="Forbidden"
     *      )
     * )
     */
    public function store(MoviePost $request)
    {
        $movie = new Movie();
        $movie->title = $request->title;
        $movie->year = $request->year;
        $movie->director = $request->director;
        $movie->poster = $request->poster;
        $movie->synopsis = $request->synopsis;
        $movie->save();
        response()->json($movie, 201);
    }
```

Mireu que per al post utilitze la seguretat que ja havia definit.
Ara veureu una icona de bloqueig prop de la ruta.  Quan feu clic sobre això, podreu afegir l'autenticació de Bearer.

![](../img/swagger_2.png)

Us encomane a que vejau el video on està tot explicat perquè amb els apunt soles queda una mica difícil d'entendre.

[Documentació de swagger-php](http://zircote.github.io/swagger-php/Getting-started.html)


## Exercici Pràctic: API per a la Guia d'Equips de Futbol Femení.

L'objectiu de l'exercici consisteix a implementar una API REST completa per gestionar la lliga femenina, incloent-hi les operacions CRUD, autenticació, autorització, i documentació amb Swagger.

### Pas 1: Configuració inicial de l’API (instal·lació Sanctum)

- Instal·la Laravel Sanctum al projecte:
  
  ```bash
  composer require laravel/sanctum
  php artisan vendor:publish --provider="Laravel\Sanctum\SanctumServiceProvider"
  php artisan migrate
  ```
  
- Configura el fitxer bootstrap/app.php per tal que els missatges d'errada vinguen en format json:

  ```php
  return Application::configure(basePath: dirname(__DIR__))
    ->withRouting(
        web: __DIR__.'/../routes/web.php',
        api: __DIR__.'/../routes/api.php',
        commands: __DIR__.'/../routes/console.php',
        health: '/up',
    )
    ->withMiddleware(function (Middleware $middleware) {

    })
    ->withExceptions(function (Exceptions $exceptions) {
        $exceptions->shouldRenderJsonWhen(function (Request $request, Throwable $e) {
            return $request->is('api/*') || $request->expectsJson();
        });
        $exceptions->render(function (Throwable $e, Request $request) {
            if ($e instanceof \Illuminate\Validation\ValidationException) {
                return response()->json([
                    'message' => 'Dades no vàlides.',
                    'errors' => $e->errors(),
                ], 422);
            }

            if ($e instanceof \Illuminate\Auth\AuthenticationException) {
                return response()->json([
                    'message' => 'No autenticat.',
                ], 401);
            }
        });
    })->create();
  ```

### Pas 2: Controladors i Rutes 
 
- Genera controladors per als models utilitzant Artisan:
  
  ```bash
   php artisan make:controller Api/JugadoraController --api --model=Jugadora
  ```
-   Crea les rutes CRUD per als models:

```php
Route::apiResource('jugadores', Api\JugadoraController::class)->middleware('api');
 ```
- Crea un controller BaseController per a gestionar les respostes de l'API:

```php

namespace App\Http\Controllers\Api;
 use App\Http\Controllers\Controller as Controller;
class BaseController extends Controller
{
    /**
     * success response method.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function sendResponse($result, $message, $code = 200)
    {
        $response = [
            'success' => true,
            'data'    => $result,
            'message' => $message,
        ];
        return response()->json($response, $code);
    }
    /**
     * return error response.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function sendError($error, $errorMessages = [], $code = 200)
    {
        $response = [
            'success' => false,
            'message' => $error,
        ];
        if(!empty($errorMessages)){
            $response['info'] = $errorMessages;
        }
        return response()->json($response, $code);
    }
}
```


- Completa els mètodes CRUD en el controlador utilitzant els models i Form Requests per validar les dades:

```php
namespace App\Http\Controllers\Api;

 
use App\Http\Requests\JugadoraRequest;
use App\Models\Jugadora;
 

class JugadoraController extends BaseController
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return Jugadora::paginate(10);
    }

    public function store(JugadoraRequest $request)
    {
        $jugadora = Jugadora::create($request->validated());
        return $this->sendResponse($jugadora, 'Jugadora Creada amb exit',201);
    }

    public function show(Jugadora $jugadora)
    {
        return $this->sendResponse($jugadora, 'Jugadora Recuperada amb exit', 201);
    }

    public function update(JugadoraRequest $request, Jugadora $jugadora)
    {
        $jugadora->update($request->validated());
        return $this->sendResponse($jugadora, 'Jugadora Actualitzada amb exit', 201);
    }

    public function destroy(Jugadora $jugadora)
    {
        $jugadora->delete();
        return $this->sendResponse(null, 'Jugadora Eliminada amb exit', 201);
    }
}

``` 

### Pas 3: Autenticació i autorització

- Afegir al model User el trait HasApiTokens:

```php
use Laravel\Sanctum\HasApiTokens;
class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;
}
``` 

- Afegir les rutes d'autenticació a **routes/api.php**:

```php

Route::post('login', [AuthController::class, 'login'])->middleware('api');
Route::post('register', [AuthController::class, 'register'])->middleware('api');
 

Route::middleware(['auth:sanctum','api'])->group( function () {
    Route::apiResource('jugadores',  JugadoraController::class);
    Route::post('logout', [AuthController::class, 'logout']);

});
```

- Implementar el controlador   AuthController amb els mètodes login, register i logout:
 
```php
namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Api\BaseController as BaseController;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use App\Models\User;

class AuthController extends BaseController
{
    public function login(Request $request)
    {
        if (Auth::attempt(['email' => $request->email, 'password' => $request->password])){
            $authUser = Auth::user();
            $result['token'] =  $authUser->createToken('MyAuthApp')->plainTextToken;
            $result['name'] =  $authUser->name;

            return $this->sendResponse($result, 'User signed in');
        }
        return $this->sendError('Unauthorised.', ['error'=>'incorrect Email/Password']);
    }
    public function register(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'email' => 'required|email',
            'password' => 'required',
            'confirm_password' => 'required|same:password',
        ]);

        if ($validator->fails()){
            return $this->sendError('Error validation', $validator->errors());
        }

        try {
            $input = $request->all();
            $input['password'] = bcrypt($input['password']);
            $user = User::create($input);
            $result['token'] =  $user->createToken('MyAuthApp')->plainTextToken;
            $result['name'] =  $user->name;

            return $this->sendResponse($result, 'User created successfully.');
        } catch (\Exception $e) {
            return $this->sendError('Registration Error' , $e->getMessage());
        }
    }
    public function logout(Request $request)
    {
 
        $user = request()->user(); //or Auth::user()
        $user->tokens()->where('id', $user->currentAccessToken()->id)->delete();
        $success['name'] =  $user->name;
         return $this->sendResponse($success, 'User successfully signed out.');
    }

}

```

### Pas 4: Documentació amb Swagger

- Instal·la el paquet l5-swagger:

```bash
composer require "darkaonline/l5-swagger"
php artisan vendor:publish --provider "L5Swagger\L5SwaggerServiceProvider"
```
 
- Afegeix les anotacions OpenAPI als controladors, models i requests:

app/Http/Controllers/Controller.php
```php
 /**
 * @OA\Info(
 *    title="Futbol Femeni API Documentation",
 *    version="1.0.0",
 * )
 */

 
```

- Genera les annotacions per al login:    

```php
/**
     * @OA\Post(
     *     path="/api/login",
     *     summary="Autenticació de l'usuari",
     *     tags={"Autenticació"},
     *     @OA\RequestBody(
     *         required=true,
     *         @OA\JsonContent(
     *             required={"email", "password"},
     *             @OA\Property(property="email", type="string", format="email", example="1@manager.com"),
     *             @OA\Property(property="password", type="string", example="1234"),
     *         )
     *     ),
     *     @OA\Response(
     *         response=200,
     *         description="Login correcte",
     *         @OA\JsonContent(
     *             @OA\Property(property="success", type="boolean", example=true),
     *             @OA\Property(property="data", type="object",
     *                 @OA\Property(property="token", type="string", example="jwt-token"),
     *                 @OA\Property(property="name", type="string", example="John Doe")
     *             ),
     *             @OA\Property(property="message", type="string", example="User signed in")
     *         )
     *     ),
     *     @OA\Response(
     *         response=401,
     *         description="No autoritzat",
     *         @OA\JsonContent(
     *             @OA\Property(property="success", type="boolean", example=false),
     *             @OA\Property(property="message", type="string", example="Unauthorised."),
     *             @OA\Property(property="info", type="object",
     *                 @OA\Property(property="error", type="string", example="incorrect Email/Password")
     *             )
     *         )
     *     )
     * )
     */
```
- Executa la comanda per generar la documentació:

```bash
php artisan l5-swagger:generate
```

- Accedeix a la documentació a través de la URL configurada en **config/l5-swagger.php** (per defecte /api/documentation).
- Genera les annotacions per al model de Jugadora.
 ```php
  /**
* @OA\Schema(
*     schema="Jugadora",
*     description="Esquema del model Jugadora",
*     @OA\Property(property="id", type="integer", description="ID de la jugadora"),
*     @OA\Property(property="posicio", type="string", description="Posició de la jugadora"),
*     @OA\Property(property="dorsal", type="integer", description="Dorsal de la jugadora"),
*     @OA\Property(property="equip_id", type="integer", description="ID de l'equip de la jugadora"),
*     @OA\Property(property="nom", type="string", description="Nom de la jugadora"),
*     @OA\Property(property="foto", type="string", description="URL de la foto de la jugadora"),
*     @OA\Property(property="data_naixement", type="string", format="date", description="Data de naixement de la jugadora"),
*     @OA\Property(property="created_at", type="string", format="date-time", description="Data de creació del registre"),
*     @OA\Property(property="updated_at", type="string", format="date-time", description="Data d'actualització del registre")
* )
  */
```
- Genera les annotacions per al request

```php

/**
 * @OA\Schema(
 *     schema="JugadoraRequest",
 *     description="Validació per a la creació i actualització de jugadores",
 *     required={"nom", "posicio", "equip_id", "data_naixement"},
 *     @OA\Property(property="nom", type="string", maxLength=255, description="Nom de la jugadora", example="Maria López"),
 *     @OA\Property(
 *         property="posicio",
 *         type="string",
 *         enum={"defensa", "migcampista", "davantera", "porter"},
 *         description="Posició de la jugadora",
 *         example="davantera"
 *     ),
 *     @OA\Property(property="equip_id", type="integer", description="ID de l'equip de la jugadora", example=1),
 *     @OA\Property(
 *         property="data_naixement",
 *         type="string",
 *         format="date",
 *         description="Data de naixement de la jugadora (ha de tenir entre 16 i 100 anys)",
 *         example="2002-05-15"
 *     ),
 *     @OA\Property(
 *         property="foto",
 *         type="string",
 *         format="binary",
 *         description="Foto de la jugadora en format PNG (opcional, màxim 2MB)"
 *     )
 * )
 */
```
 
- Genera les annotacions per a la resta de mètodes de l'API.

```php
namespace App\Http\Controllers\Api;

use App\Http\Requests\JugadoraRequest;
use App\Models\Jugadora;

class JugadoraController extends BaseController
{
/**
* @OA\Get(
*     path="/api/jugadores",
*     summary="Llista totes les jugadores",
*     tags={"Jugadores"},
*     @OA\Response(
*         response=200,
*         description="Llista de jugadores",
*         @OA\JsonContent(
*             @OA\Property(property="data", type="array",
*                 @OA\Items(ref="#/components/schemas/Jugadora")
*             ),
*             @OA\Property(property="links", type="object"),
*             @OA\Property(property="meta", type="object")
*         )
*     )
* )
*/
public function index()
{
return Jugadora::paginate(10);
}

    /**
     * @OA\Post(
     *     path="/api/jugadores",
     *     summary="Crea una nova jugadora",
     *     tags={"Jugadores"},
     *     @OA\RequestBody(
     *         required=true,
     *         @OA\JsonContent(ref="#/components/schemas/JugadoraRequest")
     *     ),
     *     @OA\Response(
     *         response=201,
     *         description="Jugadora creada amb èxit",
     *         @OA\JsonContent(ref="#/components/schemas/Jugadora")
     *     )
     * )
     */
    public function store(JugadoraRequest $request)
    {
        $jugadora = Jugadora::create($request->validated());
        return $this->sendResponse($jugadora, 'Jugadora Creada amb èxit', 201);
    }

    /**
     * @OA\Get(
     *     path="/api/jugadores/{id}",
     *     summary="Mostra una jugadora",
     *     tags={"Jugadores"},
     *     @OA\Parameter(
     *         name="id",
     *         in="path",
     *         description="ID de la jugadora",
     *         required=true,
     *         @OA\Schema(type="integer")
     *     ),
     *     @OA\Response(
     *         response=200,
     *         description="Jugadora recuperada amb èxit",
     *         @OA\JsonContent(ref="#/components/schemas/Jugadora")
     *     )
     * )
     */
    public function show(Jugadora $jugadora)
    {
        return $this->sendResponse($jugadora, 'Jugadora Recuperada amb èxit', 201);
    }

    /**
     * @OA\Put(
     *     path="/api/jugadores/{id}",
     *     summary="Actualitza una jugadora",
     *     tags={"Jugadores"},
     *     @OA\Parameter(
     *         name="id",
     *         in="path",
     *         description="ID de la jugadora",
     *         required=true,
     *         @OA\Schema(type="integer")
     *     ),
     *     @OA\RequestBody(
     *         required=true,
     *         @OA\JsonContent(ref="#/components/schemas/JugadoraRequest")
     *     ),
     *     @OA\Response(
     *         response=200,
     *         description="Jugadora actualitzada amb èxit",
     *         @OA\JsonContent(ref="#/components/schemas/Jugadora")
     *     )
     * )
     */
    public function update(JugadoraRequest $request, Jugadora $jugadora)
    {
        $jugadora->update($request->validated());
        return $this->sendResponse($jugadora, 'Jugadora Actualitzada amb èxit', 201);
    }

    /**
     * @OA\Delete(
     *     path="/api/jugadores/{id}",
     *     summary="Elimina una jugadora",
     *     tags={"Jugadores"},
     *     @OA\Parameter(
     *         name="id",
     *         in="path",
     *         description="ID de la jugadora",
     *         required=true,
     *         @OA\Schema(type="integer")
     *     ),
     *     @OA\Response(
     *         response=200,
     *         description="Jugadora eliminada amb èxit"
     *     )
     * )
     */
    public function destroy(Jugadora $jugadora)
    {
        $jugadora->delete();
        return $this->sendResponse(null, 'Jugadora Eliminada amb èxit', 201);
    }
}
```
## Exercici     

# Enunciat: Creació d'una API i la seva documentació

Aquest exercici consisteix a crear una API per gestionar les taules que no són `jugadores` i documentar-la correctament utilitzant Swagger (`l5-swagger`). Segueix els passos indicats per implementar i documentar les operacions CRUD i altres funcionalitats específiques.

  
### 1. **Entitats a gestionar**
- **Estadis**
- **Equips**
- **Partits**

### 2. **Endpoints**
Implementa els següents endpoints per a cada entitat, seguint els estàndards REST:

- `GET /api/{resource}`: Retorna una llista paginada de recursos.
- `POST /api/{resource}`: Crea un nou recurs.
- `GET /api/{resource}/{id}`: Retorna un recurs específic.
- `PUT /api/{resource}/{id}`: Actualitza un recurs específic.
- `DELETE /api/{resource}/{id}`: Elimina un recurs específic.

 
### 3. **Documentació amb Swagger (`l5-swagger`)**
- Defineix els esquemes per a cada entitat a la documentació Swagger.
- Afegeix anotacions als controladors per documentar els endpoints creats.
 
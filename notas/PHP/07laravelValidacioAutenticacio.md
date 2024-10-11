# Formularis i validació de dades
	
[Validació de Formularis](#validació-de-formularis)

[Casos Especials](#casos-especials)

	
## [Dades d'entrada](https://laravel.com/docs/9.x/requests#retrieving-input)

Laravel facilita l'accés a les dades d'entrada de l'usuari a través de solament uns pocs mètodes. No importa el tipus de petició que s'haja realitzat (POST, GET, PUT, DELETE), si les dades són d'un formulari o si s'han afegit a la query string, en tots els casos s'obtindran de la mateixa forma.

Per a aconseguir accés a aquests mètodes Laravel utilitza **injecció de dependències**. Açò és simplement afegir la classe **Request** al constructor o mètode del controlador en el qual ho necessitem. Laravel s'encarregarà d'injectar aquesta dependència ja inicialitzada i directament podrem usar aquest paràmetre per a obtenir les dades d'entrada. 

### Creació i enviament de formularis

Si definim un formulari en una vista, es defineix amb els conceptes que ja sabem d'HTML. Com a únic afegit, en el camp **action** del formulari podem utilitzar Blade i la funció **route** per a indicar el nom de ruta a la qual volem enviar el formulari.
Vegem, per exemple, com definir un formulari per a donar d'alta noves pelicules.
Creem una vista anomenada **create.blade.php** en la subcarpeta
**resources/views/catalog** , amb un contingut com aquest:

```html
@extends('plantilla')
@section('titulo', 'Nueva Pelicula')
@section('contenido')
	<h1>Nueva pelicula</h1>
	<form action="{{ route('catalog.store') }}" method='POST'>
        @csrf
            <div class="form-group">
                <label for="title">Título</label>
                <input type="text" name="title" id="title" class="form-control">
            </div>
            <div class="form-group">
                <label for='year'>Any:</label>
                <input type='number' name='year' />
            </div>
            <div class="form-group">
                <label for='director'>Director:</label>
                <input type='text' name='director' />
            </div>
           <div class="form-group">
                <label for='poster'>Poster:</label>
                <input type='url' name='poster' />
            </div>
            <div class="form-group">
                <label for="synopsis">Resumen</label>
                <textarea name="synopsis" id="synopsis" class="form-control" rows="3"></textarea>
            </div>
             <div class="form-group text-center">
                <button type="submit" class="btn btn-primary" style="padding:8px 100px;margin-top:25px;">Afegir pel.lícula</button>
            </div>
    </form>	
@endsection
```

Un segon afegit més que hem de tindre en compte és que Laravel per defecte protegeix d'atacs XSS (Cross Site Scripting) de suplantació d'identitat, per la qual cosa obtindrem un error de tipus 419 si enviem un formulari no validat. Per a solucionar aquest problema, n'hi ha prou amb utilitzar la directiva **@csrf**
en el formulari, que afig un camp ocult amb un **token** de validació de l'usuari.

En qualsevol cas, aquest formulari s'enviarà a la ruta indicada, que serà el mètode store de catalog que s'encarregarà de recollir les dades de la petició a través del paràmetre **Request** d'aquest mètode. Disposem d'un mètode **get** per a accedir a cada camp del formulari a partir del seu nom:

```php
public function store(Request $request)
{
	$movie = new Movie();
	$movie->titulo = $request->get('titulo');
	$movie->director = $request->get('director');
	$movie->year = $request->get('year');
	..
	$movie->save();
	return redirect()->route('movie.index');
}
```

En aquest exemple com es pot veure s'ha afegit la classe Request com a paràmetre al mètode store. Laravel automàticament s'encarrega d'injectar aquestes dependències pel que directament podem usar la variable **$request** per a obtenir les dades d'entrada.

Si el mètode del controlador tinguera més paràmetres simplement els haurem d'afegir a continuació de les dependències, per exemple:

```php
	public function edit(Request $request, $id) {
	//... }
```
	
A continuació veurem els mètodes i dades que podem obtenir a partir de la variable $request.

#### Obtenir els valors d'entrada

Per a obtenir el valor d'una variable d'entrada usem el mètode **input** indicant el nom de la variable: 

```php
	$name = $request->input('nom');
	// O simplement....
	$name = $request->nom;
```
	
També podem especificar un valor per defecte com a segon paràmetre: 

```php
	$name = $request->input('nom', 'Pedro');
```
	
#### Comprovar si una variable existeix
Si ho necessitem podem comprovar si un determinat valor existeix en les dades d'entrada: 

```php
	if ($request->has('nom')) { //...}
```
### Actualitzacions i esborrats

Per defecte, l'atribut **method** d'un formulari només admet els valors GET o POST. Si volem enviar un formulari d'actualització o esborrat, aquest ha d'anar associat als mètodes **PUT** o **DELETE**,respectivament. Per a això, podem emprar dins del mateix formulari la directiva **@method** ,indicant el nom del mètode que volem usar:

```php
<form ...>
	@csrf
	@method('PUT')
	...
</form>
```

## Validació de formularis

A més d'aplicar una validació en el client a través d'HTML5, que també és recomanable, s'han de validar les dades en el servidor. Per a fer això, el propi objecte **request** proporciona un mètode anomenat **validate** , al qual li passem un array amb les regles de validació.
Per exemple, així comprovaríem que el títol i l'editorial s'han enviat, i que el títol té una grandària mínima de 3 caràcters. A més, comprovem que el preu és un valor numèric real positiu.

```php
public function store()
{
	request()->validate(
	[
		'title' => 'required|min:3',
		'director' => 'required',
		'year' => 'required|numeric|min:1900'
	]
);
// ... Código para procesar el formulario
}
```

### Utilitzar form requests per a validacions més complexes

Si hem de validar uns pocs camps, pot ser adequat cridar al mètode **validate** des del propi mètode del controlador, però per a formularis més grans el codi pot créixer massa.
Una alternativa que ofereix laravel és crear un **form request**, una classe addicional que conté la lògica de validació d'una petició. Es creen amb el comando php artisan , i l'opció make:request ,seguida del nom de la classe a crear:

```php
php artisan make:request MoviePost
```

Aquesta classe s'emmagatzema per defecte en **app/Http/Requests** , i conté un parell de mètodes predefinits:
**authorize** : retorna un booleà depenent de si l'usuari actual està autoritzat a enviar la petició o no. Per a molts formularis que no requerisquen autorització prèvia podem simplement retornar **true** . Serà el que farem de moment en aquest formulari.
**rules** : aquest és el mètode que més ens interessa. Retorna un array de regles de validació com les que teníem en el controller, així que movem aqueix codi ací:


```php
public function rules()
{
return [
	'title' => 'required|min:3',
	'director' => 'required',
	'year' => 'required|numeric|min:1900'
];
}
```

Ara, en el mètode del controlador simplement hem d'injectar aquest form request com a paràmetre (si observem la classe que s'ha creat, és un subtipus de Request ), i usar-lo per a validar. La validació és automàtica, és a dir, no hem d'afegir més codi al controlador que l'objecte injectat com a paràmetre,
que s'encarregarà de validar la pròpia petició que conté a través del mètode rules .

```php
public function store(MoviePost $request)
{
// Si entramos aquí, el formulario es válido
}
```

#### Mostrar missatges derror

Si la validació és correcta, es retornarà la dada del final de la funció, però si falla algun camp, es tornarà a la pàgina del formulari, amb la informació de l'error que s'haja produït. Podem accedir des de qualsevol
lloc de Laravel a la variable \$errors amb els errors que s'hagen produït en una
operació determinada. Aquesta variable té un mètode booleà anomenat **any** que comprova si hi ha algun error, i un altre mètode anomenat **all** que retorna el array d'errors produïts. Combinant aquests dos mètodes amb Blade, podem mostrar el llistat d'errors de validació abans del formulari, d'aquesta manera:

```php
@if ($errors->any())
	<ul>
		@foreach($errors->all() as $error)
			<li>{{ $error }}</li>
		@endforeach
	</ul>
@endif
<form ...>
	@csrf
	...
</form>
```

També podem emprar el mètode first del array d'errors per a obtindre el primer error associat a un camp, i mostrar-lo baix o sobre el camp en qüestió. Per exemple:

```php
<form action="{{ route('movies.store') }}" method="POST">
	@csrf
	<div class="form-group">
		<label for="titulo">Título:</label>
		<input type="text" class="form-control" name="titulo"
id="titulo">
		@if ($errors->has('titulo'))
			<div class="text-danger">
				{{ $errors->first('titulo') }}
			</div>
		@endif
	</div>
...
```

A més, podem personalitzar el missatge d'error a mostrar, redefinint en la classe del *form request el mètode **messages** . En aquest mètode retornem un array amb el missatge a mostrar per a cada possible error de validació. Per exemple:

```php
public function messages()
{
	return [
		'titulo.required' => 'El título es obligatorio',
		...
	];
}
```


De manera alternativa, si optem per validar el formulari en el propi controlador, aquest array de missatges
és passa com a segon paràmetre en l'anomenada al mètode **validate** :

```php
request()->validate(
[
	'title' => 'required|min:3',
	'director' => 'required',
	'year' => 'required|numeric|min:1900'
], [
	'titulo.required' => 'El título es obligatorio',
	...
]
);
```

#### Recordar valors enviats

Un problema derivat de la validació de dades és que, en tornar a la pàgina del formulari després d'un error, els camps que ja s'han examinat fins a l'error, encara que foren correctes, han perdut el valor que tenien, i pot resultar enutjós haver-los de que emplenar una altra vegada. Per a mantindre el seu antic valor, podem afegir l'atribut **value** en cada camp del formulari, i utilitzar amb Blade una funció anomenada **old** , que permet accedir a l'anterior valor d'un determinat camp, referenciat pel seu nom:

```
<form action="{{ route('movies.store') }}" method="POST">
	@csrf
	<div class="form-group">
		<label for="titulo">Título:</label>
		<input type="text" class="form-control" name="titulo"
			id="titulo" value="{!! old('titulo') !!}">
		@if ($errors->has('titulo'))
			<div class="text-danger">
				{{ $errors->first('titulo') }}
			</div>
		@endif
	</div>
...
```

## Casos especials

#### Obtenir dades agrupades

O també podem obtenir totes les dades d'entrada alhora (en un array) o solament alguns d'ells:

```php
	// Obtenir tots:
		$input = $request->all();
	// Obtenir solament els camps indicats:
		$input = $request->only('username', 'password');
	// Obtenir tots excepte els indicats: 
		$input = $request->except('credit_card');
```

#### Assignació Massiva 

També es pot utilitzar el mètode **create** per a emmagatzemar un model en una única línia. Des del mètode es retornarà la instància del model inserit. No obstant açò, abans d'açò, cal especificar la propietat **fillable** o **guarded** del model, doncs tots els models Eloquent posseeixen protecció contra l'assignació en massa.

Una vulnerabilitat d'assignació massiva té lloc quan un usuari passa un paràmetre HTTP inesperat a través de la sol·licitud, i aquest paràmetre canvia una columna de la base de dades que no s'esperava. Per exemple, un usuari malintencionat podria enviar un paràmetre **is_admin** a través d'una petició HTTP, el qual es marejaria dins del mètode **create** del model, permetent a l'usuari postular-se com un administrador.

Així que, per a començar, cal definir a quins atributs se'ls permet l'assignació massiva. Açò s'estableix en la propietat **fillable** del model. Per exemple, anem a permetre l'assignació massiva sobre l'atribut **name** d'un model Flight:

	<?php
	
	namespace App;
	
	use Illuminate\Database\Eloquent\Model;
	
	class Flight extends Model
	{
	    /**
	     * The attributes that are mass assignable.
	     *
	     * @var array
	     */
	    protected $fillable = ['name'];
	}

##### Atributes Guarding

Mentre que \$fillable serveix com una "llista blanca" d'atributs que poden ser assignats massivament, també es pot optar per \$guarded. La propietat guarded conté un array d'atributs que no poden ser assignats de forma massiva. 
La resta d'atributs que no es troben en el array si podran. Pel que, \$guarded actua com una "llista negra". Per descomptat, s'ha d'establir \$fillable o \$guarded - mai tots dos. En l'exemple que segueix, tots els atributs excepte **price** comptaran amb assignació massiva:

	<?php
	
	namespace App;
	
	use Illuminate\Database\Eloquent\Model;
	
	class Flight extends Model
	{
	    /**
	     * The attributes that aren't mass assignable.
	     *
	     * @var array
	     */
	    protected $guarded = ['price'];
	}

Si es desitja que tots els atributs es puguen assignar en massa, es pot definir la propietat $guarded com un array buit:

	/*
	* The attributes that llauren't mass assignable.
	*
	* @var array
	/
	protected $guarded = [];
	
#### Fitxers d'entrada

Laravel facilita una sèrie de classes per a treballar amb els fitxers d'entrada. Per exemple per a obtenir un fitxer que s'ha enviat en el camp amb nom photo i guardar-ho en una variable, hem de fer:

	$file = $request->file('photo');
	// O simplement... 
	$file = $request->photo;
	
Si volem podem comprovar si un determinat camp té un fitxer assignat:
	
	if ($request->hasFile('photo')) { //...}

El Symfony\Component\HttpFoundation\File\UploadedFile estén de la classe de PHP [SplFileInfo](http://php.net/manual/es/class.splfileinfo.php), per tant, tindrem molts mètodes que podem utilitzar per a obtenir dades del fitxer o per a gestionar-ho.

Per exemple, per a comprovar si el fitxer que s'ha pujat és vàlid:

	if ($request->file('photo')->isValid()) { //...}

O per a moure el fitxer d'entrada a una ruta determinada: 

	// Moure el fitxer a la ruta conservant el nom original
		$request->file('photo')->move($destinationPath);
	// Moure el fitxer a la ruta amb un nou nom: 
		$request->file('photo')->move($destinationPath, $fileName);
		
Laravel incorpora una llibreria que ens permet gestionar l'accés i escriptura de fitxers en un [emmagatzematge](https://laravel.com/docs/8.x/filesystem). L'interessant d'açò és que ens permet manejar de la mateixa forma l'emmagatzematge en local, en Amazon S3 i en Rackspace Cloud Storage, simplement ho hem de configurar en config/filesystems.php i posteriorment els podrem usar de la mateixa forma. 

Per exemple, per a emmagatzemar un fitxer pujat mitjançant un formulari hem d'usar el mètode store indicant com a paràmetre la ruta on volem emmagatzemar el fitxer (sense el nom del fitxer):

```php
$path = $request->photo->store('images');
$path = $request->photo->store('images', 's3'); // Especificar un emmagatzematge
```

Aquests mètodes retornaran el path fins al fitxer emmagatzemat de forma relativa a l'arrel de disc configurada. Per al nom del fitxer es generarà automàticament un UUID (identificador únic universal). Si volem especificar nosaltres el nom hauríem d'usar el mètode storeAs:

	$path = $request->photo->storeAs('images', 'filename.jpg'); 
	$path = $request->photo->storeAs('images', 'filename.jpg', 's3');
	
Altres mètodes que podem utilitzar per a recuperar informació del fitxer són:

```php
	// Obtenir la ruta:
	$path = $request->file('photo')->getRealPath();
	// Obtenir el nom original:
	$name = $request->file('photo')->getClientOriginalName();
	// Obtenir l'extensió:
	$extension = $request->file('photo')->getClientOriginalExtension();
	// Obtenir la grandària:
	$size = $request->file('photo')->getSize();
	// Obtenir el Type:
	$acarone = $request->file('photo')->getMimeType();
```

## [Control d'usuaris](https://laravel.com/docs/9.x/authentication)

Primer, hauríeu d'instal·lar un kit d'iniciador d'aplicacions Laravel. Els kits d'inici actuals, Laravel Breeze i Laravel Jetstream, ofereixen punts de partida molt ben dissenyats per incorporar l'autenticació a l'aplicació Laravel.

Laravel Breeze és una implementació mínima i simple de totes les funcions d'autenticació de Laravel, incloent-hi l'inici de sessió, registre, restabliment de contrasenya, verificació de correu electrònic i confirmació de contrasenya. La capa de visió de Laravel Breeze està formada per plantilles simples de Blade amb CSS de Tailwind. Breeze també ofereix una opció de bastida basada en Inertia utilitzant Vue o React.

El Laravel Jetstream és un kit d'inici d'aplicació més robust que inclou suport per a bastides de la vostra aplicació amb Livewire o Inertia i Vue. A més, Jetstream ofereix suport opcional per a l'autenticació de dos factors, equips, gestió de perfils, gestió de sessions del navegador, suport d'API via Laravel Sanctum, supressió de comptes, i més.

### Recuperanció l'usuari autenticat
Després d'instal·lar un kit d'inici d'autenticació i permetre als usuaris registrar-se i autenticar-se amb la vostra aplicació, sovint haureu d'interactuar amb l'usuari actualment autenticat. Mentre gestioneu una sol·licitud entrant, podeu accedir a l'usuari autenticat mitjançant el mètode d'usuari de la façana Auth:

```php
use Illuminate\Support\Facades\Auth;
 
// Retrieve the currently authenticated user...
$user = Auth::user();
 
// Retrieve the currently authenticated user's ID...
$id = Auth::id();
```

Alternativament, un cop un usuari estiga autenticat, podeu accedir a l'usuari autenticat mitjançant una instància d'**Illuminate\Http\Request**. Recordeu, les classes amb tipus s'injectaran automàticament als vostres mètodes de control. 
Per escriure l'objecte Illuminate\Http\Request, podeu accedir convenientment a l'usuari autenticat des de qualsevol mètode de control de la vostra aplicació mitjançant el mètode d'usuari de la sol·licitud:

```php
<?php
 
namespace App\Http\Controllers;
 
use Illuminate\Http\Request;
 
class FlightController extends Controller
{
    /**
     * Update the flight information for an existing flight.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request)
    {
        // $request->user()
    }
}
```

### Determinar si l'usuari actual està autenticat
Per determinar si l'usuari que fa la petició HTTP entrant està autenticat, podeu utilitzar el mètode de comprovació a la façana d'Auth. Aquest mètode retornarà cert si l'usuari està autenticat:

```php
use Illuminate\Support\Facades\Auth;

if (Auth::check()) {
// The user is logged in...
}
```


### Protegir les rutes d'accés restringit

Ara que ja tenim definit el mecanisme de login (controlador amb mètode d'autenticació,
formulari de login i ruta associada), podem protegir aquelles rutes o enllaços que vulguem que siguen d'accés restringit. Per exemple, podem fer que les operacions de creació, esborrat i edició de videos
(funcions create , store , edit , update i destroy ) només estiguen disponibles per a usuaris
autenticats. Això pot fer-se de diverses formes.

Si tenim una ruta de recursos ( Route::resource ) en l'arxiu routes/web.php , llavors l'opció més còmoda és definir un constructor en el controlador associat (en aquest cas,MovieController ), i especificar quines funcions volem protegir, bé amb **only** o amb
**except** (en aquest últim cas, es protegiran totes les rutes excepte les indicades en la llista):

```php
class LibroController extends Controller
{
	public function __construct()
	{
		$this->middleware('auth',['only' => ['create', 'store', 'edit', 'update', 'destroy']]);
	}
...
```

Si definim les rutes soltes, podem emprar el mètode middleware per a indicar en cadascuna si
volem que s'aplique el middleware d'autenticació:

```php
Route::get('prueba', [PruebaController::class, 'create'])->middleware('auth');
```

#### Redirigir els usuaris no autenticats
Quan el middleware auth detecta un usuari no autenticat, redirigirà l'usuari a la ruta amb nom d'inici de sessió. Podeu modificar aquest comportament actualitzant la funció redirectTo al fitxer app/Http/Middleware/Authenticate de la vostra aplicació:

```php
/**
* Get the path the user should be redirected to.
*
* @param  \Illuminate\Http\Request  $request
* @return string
  */
  protected function redirectTo($request)
  {
  return route('login');
  }
```

## Configurar la configuració regional
L'idioma predeterminat per a l'aplicació s'emmagatzema a l'opció de configuració regional del fitxer de configuració config/app.php. 
Es pot modificar aquest valor per adaptar-lo a les necessitats de l'aplicació.

Podeu modificar la llengua per defecte per a una sol·licitud HTTP única en temps d'execució utilitzant el mètode setLocale proporcionat per la façana de l'aplicació:

```php
use Il·lumina\Support\Facades\App;

Route::get('/greeting/{locale}', funció ($locale) {
if (! in,array($locale, ['en', 'es', 'ca'])) {
    abort(400);
}

    App::setLocale($locale);
 
    //
});
```

Es pot configurar una "llengua alternativa", que s'utilitzarà quan la llengua activa no contingui una cadena de traducció donada. Igual que la llengua per defecte, la llengua alternativa també està configurada al fitxer de configuració config/app.php:

'fallback =locale' => 'en',

### Definició de cadenes de traducció
 #### Ús de tecles curtes
Normalment, les cadenes de traducció s'emmagatzemen en fitxers dins del directori de lang. Dins d'aquest directori, hi ha d'haver un subdirectori per a cada llengua compatible amb l'aplicació. Aquesta és l'aproximació que Laravel utilitza per gestionar les cadenes de traducció per a les característiques integrades de Laravel, com ara missatges d'error de validació:

/lang
/en
message.php
/es
message.php

Tots els fitxers d'idioma retornen una matriu de cadenes clau. Per exemple:

```php

// lang/en/messages.php

return [
"Benvinguts" => "Benvinguts a la nostra aplicació!",
];
```

#### Ús de les cadenes de traducció com a claus

Per a aplicacions amb un gran nombre de cadenes traduïbles, definir cada cadena amb una "tecla curta" pot resultar confús quan es fa referència a les claus en les vistes i és complicat inventar contínuament claus per a cada cadena de traducció admesa per la vostra aplicació.

Per aquesta raó, Laravel també proporciona suport per definir cadenes de traducció utilitzant la traducció "per defecte" de la cadena com a clau. Els fitxers de traducció que utilitzen cadenes de traducció com a claus s'emmagatzemen com a fitxers JSON al directori de lang. Per exemple, si la vostra aplicació té una traducció al castellà, hauríeu de crear un fitxer lang/es.json:

```php
{
"I love programming.": "Me encanta programar."
}
```


### Recuperant les cadenes de traducció
Podeu recuperar les cadenes de traducció dels vostres fitxers de llengua utilitzant la funció auxiliar .. Si esteu utilitzant «tecles curtes» per a definir les cadenes de traducció, haureu de passar el fitxer que conté la clau i la clau mateixa a la funció . utilitzant la sintaxi «punt». Per exemple, recuperarem la cadena de traducció benvinguda del fitxer de llengua lang/en/messages.php:

```php
echo __('messages.welcome');
```
Si la cadena de traducció especificada no existeix, la funció __ retornarà la clau de la cadena de traducció. Per tant, utilitzant l'exemple anterior, la funció . retornaria messages.wellcome amb satisfacció si la cadena de traducció no existeix.

Si esteu utilitzant les cadenes de traducció predeterminades com a claus de traducció, haureu de passar la traducció predeterminada de la cadena a la __funció

```php
echo __('I love programming.');
```
De nou, si la cadena de traducció no existeix, la funció __ retornarà la clau de la cadena de traducció que s'ha donat.

Si utilitzeu el motor de templating Blade, podeu utilitzar la {{ }} sintaxi d'eco per mostrar la cadena de traducció:

```php
{{ __('missages.welcome') }}
```

###Substitució de paràmetres a les cadenes de traducció
Si ho desitgeu, podeu definir paràmetres a les cadenes de traducció. Tots els paràmetres estan prefixats amb un :. Per exemple, podeu definir un missatge de benvinguda amb un paràmetre:

```php
'benvingut' => 'Benvingut, :name',
```

Per a reemplaçar els paràmetre en recuperar una cadena de traducció, podeu passar una matriu de reemplaçaments com a segon argument a la funció __

```php
echo __('missages.welcome', ['name' => 'dayle']);
```
Si el paràmetres conté totes les lletres majúscules, o només té la primera lletra en majúscula, el valor traduït es posarà en majúscula en conseqüència:

```php
'wellcome' => 'Benvingut, :NAME', // Benvingut, DAYLE
'goodbye' => 'Adéu, :Nom', // Adéu, Dayle
```

### Altres consideracions

La incorporació del scaffolding d'autenticació, com podem comprovar, estalvia molta faena a l'hora
de definir els mecanismes de registre i login d'usuaris en el sistema. No obstant això, queden algunes
tasques pendents que poden requerir una configuració addicional, i que no veurem en aquest curs per falta
de temps.

Una d'elles, per exemple, és l'opció de recuperar contrasenya quan punxem en l'enllaç de Vas
oblidar la teua contrasenya?. En principi, i atés que ens registrem amb un e-mail com login, ens demana que
facilitem aquest e-mail per a enviar-nos un enllaç per a restablir la contrasenya. No obstant això, hem de configurar apropiadament el correu SMTP per a poder enviar el missatge. Per a això, necessitem un
compte origen, i depenent del servidor de correu on el tinguem creat (Gmail, Outlook, etc), la
configuració és diferent. [Ací](https://medium.com/@agavitalis/how-to-send-an-email-in-laravel-using-gmail-smtp-server-53d962f01a0c), per exemple, explica els passos a seguir per a configurar com a compte
emissora una de Gmail.

## Definir roles. Ús de middleware

Per a poder definir rols per als diferents usuaris de la nostra aplicació, òbviament hem de començar
per definir un nou camp en la taula d'usuaris per a emmagatzemar aquest rol.

Després, per a protegir certes rutes en funció dels rols, podem ocultar l'enllaç en les vistes amb
una simple comprovació. Per exemple, assumint que el camp dels rols es diu rol:

```
@if (Auth::user()->rol === 'admin')
	// Mostrar contenido
@endif
```

No obstant això, si accedim a la URL sense passar per l'enllaç, podrem veure el contingut. Devem
novament incorporar el middleware auth al controlador que corresponga (si no ho està ja), per a protegir
l'accés general per a usuaris autenticats.
A més, hem de definir un middleware propi que verifique el rol de l'usuari logueado. Podem crear-ho
amb aquest comando:

```
php artisan make:middleware RolCheck
```

En aquest cas hem anomenat al **middleware RolCheck** , però el nom pot ser el que vulguem. Aquest
middleware es crearà en la carpeta **App\Http\Middleware** . Hem d'editar el seu mètode **handle** per a verificar que els usuaris són de tipus "admin":

```php
public function handle($request, Closure $next, $rol)
{
	if (Auth::user()->rol === $rol)
		return $next($request);
	else
		return redirect('/');
}
```

Després de definir el middleware, ho registrem en l'arxiu **App/Http/Kernel.php** (en l'apartat de **routeMiddleware**):

```php
protected $routeMiddleware = [
...
'roles' => \App\Http\Middleware\RolCheck::class
```

Finalment, ho carreguem en el constructor del nostre controlador. Podem incloure amb **except** i
**only** restriccions sobre quins mètodes del controlador es veuran afectats o no pel middleware.

```
public function __construct()
{
	$this->middleware(['auth', 'roles:admin']);
}
```

En aquest exemple, hem mapatge el middleware amb l'àlies rols en l'arxiu **Kernel.php** , i el que hi ha
després dels dos punts és el paràmetre extra que té el mètode **handle** del middleware (el rol a comprovar).
En el cas de voler passar més paràmetres, es pot fer separats per comes.

#### Sobre el concepte de middleware


Hem comentat breument el concepte de middleware associat tant al mecanisme d'autenticació
com a la classe "extra" que podem crear per a comprovar rols. En general, un middleware és un
fragment de codi (normalment una funció) que s'executa enmig d'un procés. En aquest cas, s'executa
des que es rep la petició fins que s'emet la resposta, i permet alterar aqueix flux normal,
fent certes comprovacions sobre la petició. Per exemple, com és el cas, verificar que l'usuari
té els permisos adequats abans d'emetre una resposta o una altra.

## Exercicis

Sobre el projecte blog, afegirem aquests canvis:

721. Crea un [formulari](#creació-i-enviament-de-formularis) per a donar d'alta nous posts, en la vista
  **resources/views/posts/create.blade.php** . 
     * Afig un parell de camps (un text curt i un text llarg) per a emplenar el títol i el contingut, i com a autor o usuari del post de moment deixa un predefinit; per exemple, l'autor amb id = 1, o el primer autor que trobes en la base de dades ( Autor::get()->first() ). Més endavant ja ho farem dependent de l'usuari que s'haja autenticat. Recorda definir el mètode store en el controlador de posts per a donar d'alta el post, i redirigir després al llistat principal de posts. Per a carregar el formulari, afig una nova opció en el menú principal de navegació. 
     * En la fitxa d'un post, afig un botó amb un formulari per a esborrar el post. Hauràs de definir el codi del mètode **destroy** per a eliminar el post i redirigir de nou al llistat. Deuràs eliminar tots els comentaris associats a aqueix post, i després esborrar el post. Per a filtrar els comentaris d'un post i esborrar-los, utilitza la clàusula **where**.

```
Comentario::where('post_id', $id)->delete();
```

722. Ara afegirem el [formulari d'edició](#actualitzacions-i-esborrats) d'un post, també des de la vista de la fitxa del post. El formulari haurà de mostrar les dades ja farcides del post. Aquestformulari es carrega a partir del mètode **edit** (que haurà de renderitzar la vista amb el formulari d'edició,
**resources/views/posts/edit.blade.php** ), i el formulari s'enviarà al mètode **update** del controlador, passant-li com a paràmetre l'id del post a modificar.

723. Crea un **form request** anomenat **PostRequest** , que [valide](#utilitzar-form-requests-per-a-validacions-més-complexes) les
dades del post. En concret, han de complir-se aquests requisits:

	* El títol del post ha de ser obligatori, i d'almenys 5 caràcters de longitud
	* El contingut del post ha de ser obligatori, i d'almenys 50 caràcters de longitud

Defineix [missatges d'error](#mostrar-missatges-derror) personalitzats per a cada possible error de validació, i mostra'ls al costat de cada camp afectat. A més, utilitza la [funció **old**](#recordar-valors-enviats) per a recordar el valor antic correcte, en el cas que un camp passe la validació però un altre(s) no.

724. Fes els següents canvis:

* En el controlador de posts, [protegeix](#protegir-les-rutes-daccés-restringit) totes les opcions menys les de index i show .


* Fes que només es mostren els enllaços i botons de crear, editar o esborrar posts quan l'usuari estiga
  autenticat. En aqueix mateix cas, fes que també es mostre una opció de logout en el menú
  superior, que hauràs d'implementar.

* Finalment, afig la funcionalitat que l'usuari autenticat només pot editar i esborrar els seus
  propis posts, però no els dels altres usuaris.

* Crea un nou [middleware](#definir-roles-ús-de-middleware) anomenat **EnsureUserIsAuthor** per fer-ho

725. Idioma

* Cerca el paquet de castellà o valencia i possa'l en la carpeta corresponent.
* Canvia l'idioma de l'aplicació al paquet baixat.

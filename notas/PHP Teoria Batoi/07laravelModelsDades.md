# FRAMEWORK LARAVEL

## [Base de dades](https://laravel.com/docs/9.x/database)

[Video](https://www.youtube.com/watch?v=SYAffKndJTI&t=444s)

Laravel facilita la configuració i l'ús de diferents tipus de base de dades: MySQL, Postgres, SQLite i SQL Server. En el fitxer de configuració (**config/database.php**) hem d'indicar tots els paràmetres d'accés a les nostres bases de dades i a més especificar com és la connexió que s'utilitzarà per defecte. En Laravel podem fer ús de diverses bases de dades alhora, encara que siguen de diferent tipus. Per defecte s'accedirà a la qual especifiquem en la configuració i si volem accedir a una altra connexió ho haurem d'indicar expressament en realitzar la consulta.

En aquest capítol veurem com configurar una base de dades, com crear taules i especificar els seus camps des de codi, com inicialitzar la base de dades i com construir consultes tant de forma directa com a través del ORM anomenat **Eloquent**.

### Configuració inicial

##### Configuració de la Base de dades
El primer que hem de fer per a treballar amb bases de dades és completar la configuració. Com a exemple anem a configurar l'accés a una base de dades tipus **MySQL**. Si editem el fitxer amb la configuració config/database.php podem veure en primer lloc la següent línia:

	'default' => env('DB_CONNECTION', 'mysql'),

Aquest valor indica el tipus de base de dades a utilitzar per defecte. Com vam veure en el primer capítol Laravel utilitza el sistema de variables d'entorn per a separar les diferents configuracions d'usuari o de màquina. 
El mètode env('DB_CONNECTION', 'mysql') el que fa és obtenir el valor de la variable DB_CONNECTION del fitxer **.env**. En cas que aquesta variable **no estiga definida** retornarà el valor per defecte mysql.

En aquest mateix fitxer de configuració, dins de la secció connections, podem trobar tots els camps utilitzats per a configurar cada tipus de base de dades, en concret la base de dades tipus mysql té els següents valors:

```php
	'mysql' => [
            'driver' => 'mysql',
            'host' => env('DB_HOST', '127.0.0.1'),
            'port' => env('DB_PORT', '3306'),
            'database' => env('DB_DATABASE', 'forge'),
            'username' => env('DB_USERNAME', 'forge'),
            'password' => env('DB_PASSWORD', ''),
            'unix_socket' => env('DB_SOCKET', ''),
            'charset' => 'utf8mb4',
            'collation' => 'utf8mb4_unicode_ci',
            'prefix' => '',
            'prefix_indexes' => true,
            'strict' => true,
            'engine' => null,
        ],
```        

##### Contrasenya d'accés
Com es pot veure, bàsicament els camps que hem de configurar per a usar la nostra base de dades són: host, database, username i password. El host ho podem deixar com està si anem a usar una base de dades local, mentre que els altres tres camps sí que hem d'actualitzar-los amb el noms de la base de dades a utilitzar i l'usuari i la contrasenya d'accés. Per a posar aquests valors obrim el fitxer **.env** de l'arrel del projecte i els actualitzem:

	DB_CONNECTION=mysql 
	DB_HOST=localhost 
	DB_DATABASE=nom-base-de-dades 
	DB_USERNAME=nom-de-usuari
	DB_PASSWORD=contrasenya-de-accés
	
##### Crear la base de dades
L'únic pas necessari des de fora de Laravel per a accedir a la base de dades serà crear-la. La resta d'operacions(creació de taules, camps, claus, relacions, dades, etc) es podran fer des del propi
Laravel, com anirem veient a continuació.
La base de dades podem crear-la a través d'algun administrador que tinguem disponible (per exemple,
**phpMyAdmin** per a bases de dades **MySQL**), o bé per línia de comandos, connectant amb el SGBD en
qüestió i creant la base de dades.


## Migracions

Les migracions són un sistema de control de versions per a bases de dades. Permeten que un equip treballe sobre una base de dades afegint i modificant camps, mantenint un històric dels canvis realitzats i de l'estat actual de la base de dades. 

Les migracions s'utilitzen de forma conjunta amb l'eina Schema builder (que veurem en la següent secció) per a gestionar l'esquema de base de dades de l'aplicació.

La forma de funcionar de les migracions és crear fitxers (PHP) amb la descripció de la taula a crear i posteriorment, si es vol modificar aquesta taula s'afegiria una nova migració (un nou fitxer PHP) amb els camps a modificar.

Artisan inclou comandos per a crear migracions, per a executar les migracions o per a fer rollback de les mateixes (tornar arrere).

#### Estructura de les migracions

Per defecte, Laravel porta unes migracions predefinides, que es troben en la carpeta
**database/migrations** . Cadascuna té un nom d'arxiu que comença per la data en què es va fer, seguida d'una breu descripció del que conté (creació de la taula d'usuaris, reinicialitze de contrasenyes...).
Pot ser que algunes d'aquestes migracions no ens vagen a ser necessàries, amb el que podem esborrar-les directament, i pot ser que altres (especialment la creació de la taula d'usuaris) sí que ens servisca, però amb altres camps, amb el que haurem d'editar-la, com veurem a continuació.
Si examinem el contingut d'una migració, totes han de tindre dos mètodes:

* **up** : permet agregar taules, columnes o índexs a la base de dades
* **down** : reverteix el fet pel mètode anterior

Si observem el contingut d'un mètode up dels quals vénen predefinits per a crear una taula, veiem
que s'utilitzen diferents mètodes per a definir els tipus de dades de cada camp de la taula, com per exemple **id()** per a camps que puguen contindre sencers *autoincrementales, o **string()** per a camps
de tipus text. A més, existeixen altres mètodes modificadors per a agregar propietats addicionals,
com per exemple **unique()** per a indicar valors únics (claus alternatives), o **nullable()** per a indicar
que un camp admet nuls. Ací tenim un exemple de mètode **up** :

```php
public function up()
{
	Schema::create('usuarios', function(BluePrint $tabla) {
		$tabla->id();
		$tabla->string('nombre');
		$tabla->string('email')->unique();
		...
		$tabla->timestamps();
	});
}
```
Per defecte, com veiem en els exemples que es proporcionen, els esquemes es creen amb un id
autonumèric, i uns **timestamps** per a indicar la data de creació i de modificació de cada registre, i que
Laravel gestiona de manera automàtica quan inserim o actualitzem continguts, la qual cosa resulta molt
útil.

Sobre aquesta base, podem afegir o llevar els camps que vulguem. Per a veure els tipus disponibles per a les
columnes de la taula, podem visitar la documentació de Laravel sobre migracions, en concret
buscarem el subapartat **Available Column Types**. 

Convé tindre present, per exemple, que el tipus **string** que hem utilitzat en l'exemple anterior té una limitació de 255 caràcters. Per a textos
més grans, es pot emprar el tipus **text** (20.000 caràcters aproximadament) o **longText** .
Podem especificar una clau primària amb el mètode **primary** , al qual li podem passar o bé el
nom del camp clau, o un array de camps clau, en el cas que aquesta siga composta. 
Per defecte, els
camps de tipus **id** s'acte-estableixen com a claus primàries.

```
$table->primary(['campo1', 'campo2']);
```

#### Crear una nova migració

Per a crear una nova migració s'utilitza el comando de Artisan **make:migration**, al com li passarem el nom del fitxer a crear i el nom de la taula:

```
	php artisan make:migration nom_migracio
```
	
Açò ens crearà un fitxer de migració en la carpeta database/migrations amb el nom **<TIMESTAMP>_nom_migracio.php**. En afegir un timestamp a les migracions el sistema sap l'ordre en el qual ha d'executar (o desfer) les mateixes.

Notar que Laravel ja assigna automàticament la data de la migració, només hem d'especificar el nom
descriptiu d'aquesta. A més, si Laravel detecta la paraula create en el nom de la migració,
finalitzada en table, intueix que és per a crear una taula nova. 
En canvi, si detecta la paraula to (entre
altres), i al final la paraula table, intueix que s'alterarà o modificar una taula existent. Això és gràcies a la classe **TableGuesser** incorporada en Laravel, que detecta uns certs patrons en els noms de migracions.

La diferència entre la creació i la modificació és que en el mètode **up** de la migració s'utilitzarà
**Schema::create** o **Schema::table** sobre la taula en qüestió, respectivament.

En qualsevol cas, també podem especificar un paràmetre addicional en el comando de migració per a indicar
si volem crear o modificar una taula, i d'aquesta manera podem definir el nom de la migració
en l'idioma que vulguem, i sense restriccions de patrons. Aquestes dues migracions creen una taula (comandes) i modifiquen una altra (usuaris), respectivament:

```
php artisan make:migration crear_tabla_pedidos --create=pedidos
php artisan make:migration nuevo_campo_usuario --table=usuarios	
```
En el cas de la segona migració, si, per exemple, volem afegir una columna amb el número de telèfon
 dels usuaris, pot quedar així (tant el mètode up com el down ):
 
``` 
public function up()
{
	Schema::table('usuarios', function(Blueprint $tabla) 	{
		$tabla->string('telefono')->nullable();
	});
}

public function down()
{
	Schema::table('usuarios', function(Blueprint $tabla) 	{
		$tabla->dropColumn('telefono');
	});
}
```


Si volem que el camp en qüestió estiga en un ordre concret, podem usar el mètode after per a indicar
darrere de quin camp volem posar-ho (en el mètode up ):

```
$tabla->string('telefono')->after('email')->nullable();
```
 
#### Executar i esborrat de migracions

Després de crear una migració i de definir els camps de la taula (en la següent secció veurem com especificar açò) hem de llançar la migració amb el següent comando:

	php artisan migrate

Aquest comanament aplicarà la migració sobre la base de dades. Si hi haguera més d'una migració pendent s'executaran totes. Per a cada migració es dirà al seu mètode up perquè creu o modifique la base de dades. Posteriorment en cas que vulguem desfer els últims canvis podrem executar:

	php artisan migrate:rollback
	
	

O si volem desfer totes les migracions 

	php artisan migrate:reset

Un comanament interessant quan estem desenvolupant un nou lloc web és **migrate:refresh**, el qual desfarà tots els canvis i tornar a aplicar les migracions:

	php artisan migrate:fresh
	
A més si volem comprovar l'estat de les migracions, per a veure les que ja estan instal·lades i les que queden pendents, podem executar:

	php artisan migrate:status


### Schema Builder

Una vegada creada una migració hem de completar els seus mètodes up i down per a indicar la taula que volem crear o el camp que volem modificar. En el mètode down sempre haurem d'afegir l'operació inversa, eliminar la taula que s'ha creat en el mètode up o eliminar la columna que s'ha afegit. 

Açò ens permetrà desfer migracions deixant la base de dades en el mateix estat en el qual es trobaven abans que s'afegiren.

Per a especificar la taula a crear o modificar, així com les columnes i tipus de dades de les mateixes, s'utilitza la classe **Schema**. Aquesta classe té una sèrie de mètodes que ens permetrà especificar l'estructura de les taules independentment del sistema de base de dades que utilitzem.

##### Crear i esborrar una taula
Per a afegir una nova taula a la base de dades s'utilitza el següent constructor:

	Schema::create('users', function (Blueprint $table) 	{ 
		$table->increments('id');
	});
	
On el primer argument és el nom de la taula i el segon és una funció que rep com a paràmetre un objecte
del tipus Blueprint que utilitzarem per a configurar les columnes de la taula.

En la secció down de la migració haurem d'eliminar la taula que hem creat, per a açò usarem algun dels
següents mètodes: 

	Schema::drop('users');
	Schema::dropIfExists('users');
		
En crear una migració amb el comando de Artisan make:migration ja ens ve aquest codi afegit per defecte, la creació i eliminació de la taula que s'ha indicat i a més s'afigen un parell de columnes per defecte (id i timestamps).

##### Afegir columnes
El constructor Schema::create rep com a segon paràmetre una funció que ens permet especificar les columnes que va a tenir aquesta taula. 

En aquesta funció podem anar afegint tots els camps que vulguem, indicant per a cadascun d'ells el seu tipus i nom, i a més si volem també podrem indicar una sèrie de modificadors com a valor per defecte, índexs, etc. Per exemple:

```php
	Schema::create('users', function($table) {
		$table->increments('id'); 
		$table->string('username', 32); 
		$table->string('password'); 
		$table->smallInteger('vots'); 
		$table->string('direccion'); 
		$table->boolean('confirmat')->default(false);
		$table->timestamps();
	});
```
	
Schema defineix molts tipus de dades que podem utilitzar per a definir les columnes d'una taula, alguns dels principals són:

|Comando|Tipus de camp|
|--|--|
|$table->boolean('confirmed');| BOOLEAN|
|$table->enum('choices', array('foo', 'bar'));| ENUM |
|$table->float('amount');| FLOAT|
|$table->increments('id');| Clau principal tipus INTEGER amb Acte-Increment| 
|$table->integer('votes');| INTEGER|
|$table->mediumInteger('numbers');| MEDIUMINT|
|$table->smallInteger('votes');| SMALLINT|
|$table->tinyInteger('numbers');| TINYINT|
|$table->string('email');| VARCHAR|
|$table->string('name', 100);| VARCHAR amb la longitud indicada TEXT|
|$table->text('description');| TEXT|
|$table->timestamp('added_on');| |TIMESTAMP|
|$table->timestamps();|Afig els timestamps "created_at" i "updated_at"|
|->nullable()|Indicar que la columna permet valors NULL|
|->default($value)|Declara un valor per defecte per a una columna|
|->unsigned()|Afig UNSIGNED a les columnes tipus INTEGER|

Els tres últims es poden combinar amb la resta de tipus per a crear, per exemple, una columna que permeta nuls, amb un valor per defecte i de tipus unsigned.

Per a consultar tots els tipus de dades que podem utilitzar podeu consultar la documentació de Laravel [en](http://laravel.com/docs/8.x/migrations#creating-columns):

#### Afegir índexs
Schema suporta els següents tipus d'índexs:

| Comanament                               | Descripció|
|------------------------------------------|--|
| $table->id();                            |Afegir un clau primària id|
| $table->primary('id');                   | Afegir una clau primària|
| $table->primary(array('first', 'last')); | Definir una clau primària composta|
| $table->unique('email');                 |  Definir el camp com UNIQUE|
| $table->index('state');                  |Afegir un índex a una columna|

En la taula s'especifica com afegir aquests índexs després de crear el camp, però també permet indicar aquests índexs alhora que es crea el camp:

	$table->string('email')->unique();

##### Claus alienes
Amb Schema també podem definir claus alienes entre taules:
 
	$table->foreignId('module_id')->constrained('modules');

	$table->foreign('module_id')->references('code')->on('modules');
	
En el primer exemple, a més de crear el camp crea la rel·lacio, i serveix si la clau a la que faig referència s'ha creat utilitzant $table->id();

En cas contrari he d'especificar el camp ja creat i on es rel·laciona.

La columna amb la clau aliena ha de ser del **mateix tipus** que la columna a la qual apunta. Si per exemple vam crear una columna a un índex auto-incremental haurem d'especificar que la columna siga **unsigned** per que no es produïsquen errors.

També podem especificar les accions que s'han de realitzar per a "**on delete**" i "**on update**":

	$table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');


## [Models de dades mitjançant ORM](https://laravel.com/docs/9.x/eloquent)

[Video](https://www.youtube.com/watch?v=Y0W5GNNQFXU)

El mapeado objecte-relacional (més conegut pel seu nom en anglès, Object-Relational mapping, o per les seues sigles ORM) és una tècnica de programació per a convertir dades entre un llenguatge de programació orientat a objectes i una base de dades relacional com a motor de persistència. Açò possibilita l'ús de les característiques pròpies de l'orientació a objectes, podrem accedir directament als camps d'un objecte per a llegir les dades d'una base de dades o per a inserir-los o modificar-los.
Laravel inclou el seu propi sistema de ORM anomenat **Eloquent**, el qual ens proporciona una manera elegant i fàcil d'interactuar amb la base de dades. Per a cada taula de la base dades haurem de definir el seu corresponent **model**, el qual s'utilitzarà per a interactuar des de codi amb la taula.

### Definició dun model de dades

Per defecte els models es guardaran com a classes PHP dins de la carpeta **app/Models**.

```
	php artisan make:model Movie
```

Aquest comando crearà el fitxer movie.php dins de la carpeta **app/Models** amb el codi bàsic d'un model.

```php
<?php
	namespace App\Models;
	use Illuminate\Database\Eloquent\Model;
	class Movie extends Model
	{
	...
	}
?>
```

Automàticament, s'associa aquest model a una taula amb el mateix nom, però en plural i en minúscula,
per la qual cosa els models anteriors estarien associats a unes taules llibres i usuaris en la base de dades, respectivament. En cas que no vulguem que siga així, definim una propietat \$table en la classe amb el nom que vulguem que tinga la taula associada. Per exemple:

```php
class Movie extends Model
{
	protected $table = 'movies';
}
```

##### Altres opcions de crear models

El comando anterior **make:model** admet uns paràmetres addicionals, de manera que es pot crear alhora
el model i la migració, i més encara, el model, la migració i el controlador associat. Vegem alguns
exemples:

```php
php artisan make:model Movie -m
```

El comando anterior crea un model **Pelicula** en la carpeta **app\Models** i, a més, crea una
migració anomenada **create_peliculas_table** en la carpeta **database/migrations** , llista perquè
editem el mètode **up** i especifiquem els camps necessaris.
**Notar** que el nom de la migració afig una "s" al nom de la taula automàticament, a partir del model en singular.

```php
php artisan make:model Movie -mc
```

Aquest altre comando crea el mateix que l'anterior, i a més, un controlador anomenat **PeliculaController** en la carpeta **app\Http\Controllers** . Aquest controlador està buit, perquè afegim els mètodes que considerem.

```php
php artisan make:model Movie -mcr
```
Aquesta altra opció crea el mateix que l'anterior, però el controlador **PeliculaController** és en aquest
cas un controlador de recursos, per la qual cosa té ja incorporats el conjunt de mètodes propis d'aquesta
mena de controladors: **index , show , etc**.

#### Seguir una nomenclatura uniforme 

Recorda que, de sessions anteriors, hem comentat la recomanació/necessitat de seguir una nomenclatura uniforme en els models, controladors i vistes. Així, per al **model Movie** ja tindríem el seu controlador associat **MovieController** , i les vistes es definirien en la subcarpetac **resources/views/movies** , amb els noms corresponents a cada mètode del controlador (per exemple **index.blade.php**  o **show.blade.php** ), i amb una taula associada **movies**.

	
##### Clau primària
Laravel també assumeix que cada taula té declarada una clau primària amb el nom **id**. En el cas que no siga així i vulguem canviar-ho haurem de sobreescriure el valor de la propietat protegida **\$primaryKey** del model, per exemple: 

```php
	protected $primaryKey = 'my_id';
```
	
És important definir correctament aquest valor ja que s'utilitza en determinats mètodes de Eloquent, com per exemple per a cercar registres o per a crear les relacions entre models.

##### Timestamps

Una altra propietat que en ocasions haurem d'establir són els timestamps automàtics. Per defecte Eloquent assumeix que totes les taules contenen els camps updated_at i created_at (els quals els podem afegir molt fàcilment amb Schema afegint **\$table->timestamps()** en la migració). Aquests camps s'actualitzaran automàticament quan es creu un nou registre o es modifique. En el cas que no vulguem utilitzar-los (i que no estiguen afegits a la taula) haurem d'indicar-ho en el model o d'una altra forma ens donaria un error. Per a indicar que no els actualitze automàticament haurem de modificar el valor de la propietat pública **\$timestamps** a false, per exemple: 

```php	
	public $timestamps = false;
```
	
A continuació es mostra un exemple d'un model de Eloquent en el qual s'afigen totes les especificacions que hem vist:

```php
	<?php namespace App;
	use Illuminate\Database\Eloquent\Model; 
	class User extends Model
		{
		protected $table = 'my_users'; 
		protected $primaryKey = 'my_id';
		public $timestamps = false;
		}
```
		
### Ús d'un model de dades

Una vegada creat el model ja podem començar a utilitzar-ho per a recuperar dades de la base de dades, per a inserir noves dades o per a actualitzar-los. 
El lloc correcte on realitzar aquestes accions és en el controlador, el qual li'ls /els hi haurà de passar a la vista ja preparats per a la seua visualització.

És important que per a la seua utilització indiquem a l'inici de la classe l'espai de noms del model o models a utilitzar. 
Per exemple, si anem a usar els models User i Orders hauríem d'afegir:
	
```		
	use App\Models\User;
	use App\Models\Orders;
```

#### Consultar dades

Per a obtenir totes les files de la taula associada a un model usarem el mètode all():
 
```		
	use App\Models\Movie;
	...
	class MovieController extends Controller
	{
		public function index()
		{
			$movies = Movie::get();
			return view('movies.index', compact('movies'));
		}
	}	
```
Aquest mètode pasarà a la vista un array de objectes, on cada item del array serà una instància del model movie i accedirem a les seues propietats com a tals. Així en la vista tindriem alguna cosa com:

```	
@forelse($movies as $movie)
	{{ "{{  $movies->titulo " }}}}
@endforelse
```


Alternativament, també podem obtindre una consulta filtrada, amb el mètode **get** i especificant amb el mètode **where** la condició que han de complir els registres a obtindre. Per exemple, així obtindríem els llibres el preu dels quals siga inferior a 10 euros

```	
$movies = Movie::where('precio', '<', 10)->get();
```
o combinant-les

```
$movies = Movie::where('precio', '<', 10)
->where('precio', '>', 5)->get();
```

Sobre aquestes consultes base podem aplicar una sèrie d'afegits. Per exemple, podem voler ordenar
els llibres per títol, per al que faríem això en el controlador:

```	php
$movies = Movie::orderBy('titulo', 'DESC')->get();
```

**Nota**: Tots els mètodes que es descriuen en la secció de "Constructor de consultes" i en la documentació de Laravel sobre "Query Builder" també es poden utilitzar en els models Eloquent. Per tant podrem utilitzar where, orWhere, first, get, orderBy, groupBy, having, skip, take, etc. per a elaborar les consultes.

		
També podem utilitzar els mètodes agregats per a calcular el total de registres obtinguts, o el màxim, mínim, mitjana o summa d'una determinada columna. Per exemple:

```php
	$count = User::where('votes', '>', 100)->count(); 
	$price = Orders::max('price');
	$price = Orders::min('price');
	$price = Orders::avg('price');
	$total = User::sum('votes');
```

##### Paginaciò de resultats

Si volem paginar els resultats obtinguts, devem, d'una banda, quan obtinguem el llistat des del
controlador, indicar amb **paginate** quants registres volem per pàgina:

```php
public function index()
	{
		$movies = Movie::paginate(5);
		return view('movies.index', compact('moviemovies'));
	}
```

Després, en la vista associada ( **movies.index** en l'exemple anterior), podem emprar el mètode
links perquè mostre els botons de paginació en el lloc desitjat:

```php
	@forelse($movies as $movie)
		{{  $movie->titulo " }}
	@endforelse
	{{   $movies->links() }}
```

#### Objectes individuals

Una operació bastant habitual és mostrar una fitxa d'un objecte a partir d'un llistat, fent clic en el
títol o alguna part visible d'aqueix objecte. Per exemple, si volem veure les dades d'un llibre a partir d'un
llistat amb els seus títols, podem fer alguna cosa com això en la plantilla **Blade**:

```php
@forelse($movies as $movie)
	<li>
		<a href="{{  route('movies.show', $movie) }}">
		{{   $movie->titulo " }}</a>
	</li>
@endforelse
```

Veiem que hem utilitzat el mètode **route** per a indicar la ruta a seguir, amb un segon paràmetre,
que en aquest cas és l'objecte concret d'aqueixa fila. Laravel automàticament ho reemplaçarà en l'enllaç per l'identificador d'aquest objecte.
Per part seua, la ruta associada a aquest enllaç podria ser una cosa així (en l'arxiu de rutes):

```php
Route::get('/movies/{id}', [movieController::class, 'show'])
->name('movies.show');
```
#### Mostar dades

Finalment, el mètode show del controlador associat s'encarregarà d'obtindre les dades del llibre a partir de el seu **id**, i generar la vista corresponent. Per a obtindre les dades d'un objecte a partir del seu identificador,podem emprar el mètode **find** del model, passant-li com a paràmetre l'identificador. Així,podríem generar una vista amb les dades com aquesta:

```php
...
class movieController extends Controller
{
	...
	public function show($id)
	{
		$movie = movie::find($id);
		return view('movies.show', compact('movie'));
	}
}
```

En el cas que l'objecte no es trobe (perquè, per exemple, utilitzem un aneu equivocat), la vista
generada fallarà. Per a evitar-ho, en lloc del mètode **find** podem emprar *findOrFail , que, en cas que
   no es trobe l'objecte, generarà una vista amb un error 404, més apropiada. A més,
recorda que pots personalitzar aquestes pàgines d'error definint les vistes corresponents.

```
$movie = movie::findOrFail($id);
```


#### Inserir dades

[Video](https://www.youtube.com/watch?v=eg47wpRMNxw&list=PL3hkkJmy9pApI_gtgXELwy31PVf5Uafs0&index=7)

Per a afegir una entrada en la taula de la base de dades associada amb un model simplement hem de crear una nova instància d'aquest model, assignar els valors que vulguem i finalment guardar-los amb el mètode save():

```php
	$movie = new movie();
	$movie->titulo = "La guerra de las galaxias";
	$movie->director = "George Lucas";
	$movie->precio = 3.95;
	$movie->save();
```

Per a obtenir l'identificador assignat en la base de dades després de guardar (quan es tracte de taules amb índex auto-incremental), ho podrem recuperar simplement accedint al camp id de l'objecte que havíem creat, per exemple:

 	$insertedId = $movie->id;
 	
Com a alternativa, també es pot utilitzar el mètode **create** del model, i passar-li totes les dades de la
petició, que arribarien des d'un formulari, com veurem més endavant: 	

```php
movie::create($request->all());
```
Perquè això últim funcione, han de complir-se dues premisses:

* Cada camp de la petició ha de tindre associat un camp del mateix nom en el model.

* Hem de definir en el model una propietat anomenada **\$fillable** amb els noms dels camps
de la petició que ens interessa processar (la resta es descarten). Això és obligatori especificar-ho,
encara que ens interessen tots els camps, per a evitar insercions massives malintencionades (per exemple
, editant el codi font per a afegir altres camps i modificar dades inesperades).

```php
class movie extends Model
{
protected $fillable = ['titulo', 'director', 'precio'];
}
```

Aquest codi d'inserció (o bé camp a camp, o usant el mètode **all** ) se sol posar en el mètode
**store** del controlador, perquè reba les dades del formulari d'inserció i la faça en la base de dades
.Ho acabarem de veure quan abordem el tema dels formularis.

#### Modificar dades

La modificació consisteix en dos passos:

* Trobar l'objecte a modificar (buscant-lo per l'id amb **findOrFail()** , per exemple, com s'ha
explicat abans).
* Modificar les propietats que es necessiten, i cridar al mètode **save()** de l'objecte per a guardar els
canvis.

```php
$movieAModificar = movie::findOrFail($id);
$movieAModificar->titulo="Otro título";
$movieAModificar->save();
```
També podem utilitzar el mètode **update** enllaçat amb **findOrFail** , i passar-li com a paràmetre
totes les dades de la petició, igual que s'ha explicat per a la inserció, i sempre que hàgem
declarat l'atribut **\$fillable** en el model per a indicar quins camps s'accepten:

```
movie::findOrFail($id)->update($request->all());
```
	
#### Esborrar dades

Per a esborrar una instància d'un model en la base de dades simplement hem d'usar el seu mètode delete():

```
	movie::findOrFail($id)->delete();
```
	
Això ho farem normalment en el mètode **destroy** del controlador en qüestió. Després, podem
redirigir o renderitzar alguna vista resultat, com el llistat de llibres general per a comprovar que s'ha
esborrat.

```php
public function destroy($id)
{
	movie::findOrFail($id)->delete();
	$movies = movie::get();
	return view('movies.index', compact('movies'));
}
```

##### Sobre l'esborrat des de les vistes

El normal és que l'esborrat s'active fent clic en algun element d'una vista. Per exemple, fent
clic en un botó o enllaç que pose "Esborrar". Tanmateix, si implementem això així:

```html	
	<a href="{{ "{{  route('movies.destroy', $movie " }}}}">
Borrar
</a>
```

Si volem esborrar el llibre amb id 3, es generarà una ruta **http://biblioteca/movies/3**. Ho podem comprovar
passant el ratolí per l'enllaç i veient la barra inferior d'estat del navegador. Aquesta ruta, no obstant això,ens enviarà a la fitxa del llibre 3, no a l'esborrat, ja que estem enviant una petició **GET**, i no una d'esborrat (**DELETE**). Per a evitar això, l'opció d'esborrat ha de fer-se sempre des d'un formulari, on a través del **helper** **@method** indiquem que és una petició d'esborrat (DELETE). Amb el que l'enllaç per a esborrar un llibre quedaria així:

```html
<form action="{{ "{{  route('movies.destroy', $movie) " }}}}" method="POST">
	@method('DELETE')
	@csrf
	<button>Borrar</button>
</form>
```


NOTA el helper @csrf ho veurem amb més detall en parlar de formularis, però s'afig als formularis Laravel per a evitar atacs de tipus cross-site, és a dir, accessos a una URL de la nostra web
des d'altres webs.

## Relacions en Laravel

Les taules de les bases de dades es relacionen sovint unes amb unes altres. Eloquent facilita la gestió i el treball amb aquestes relacions fàcilment suportant diversos tipus de relacions diferents:

* Un a un – One to one
* Un a molts – One to many
* Molts a molts – Many to many
* Molta a molts mitjançant - Has Many Through

Les relacions entre models **Eloquent** es defineixen com a mètodes en les pròpies classes. Atès que, com els propis **models** Eloquent, les relacions també serveixen com a poderosos **query builders**, la definició de relacions com a mètodes proporciona potents **funcions d'encadenament** i consulta de mètodes.

### Un a Un

Suposem que tenim dos models Usuario i Telefono , de manera que podem establir una relació un a un entre ells: un usuari té un telèfon, i un telèfon pertany a un usuari.
Per a reflectir aquesta relació en taules, una de les dues hauria de tindre una referència a l'altra. En aquest cas, podríem tindre un camp usuari_id en la taula de telefonos que indique a qui pertany
aquest telèfon. És important que el camp es diga usuari_id , com veurem a continuació.
Per a indicar que un usuari té un telèfon, afegim un nou mètode en el model d'Usuari , que
es cride igual que el model amb el qual volem connectar ( telefono , en aquest cas):

```php
class Usuario extends Model
{
	public function telefono()
	{
		return $this->hasOne('App\Models\Telefono');
	}
}
```

Ara, si volem obtindre el telèfon d'un usuari, n'hi ha prou que fem això:

$telefono = Usuario::findOrFail($id)->telefono;

Hem emprat una característica de **Eloquent** denominada propietats dinàmiques, per la qual podem
referenciar un mètode de relació com si fóra una propietat (en lloc d'usar **telefono()** , hem
emprat **telefono** ).
La instrucció anterior obté l'objecte **Telefono** associat amb l'usuari buscat (a través del \$id
de l'usuari). Perquè aquesta associació tinga efecte, cal que en la taula **telefonos** existisca un
camp **usuario_id** i que es corresponga amb un camp **id** de la taula d'usuaris , de manera que
**Eloquent** estableix la connexió entre una i una altra taula. Haurem de definir una nova migració de modificació sobre la taula **telefonos** per a afegir aqueix nou camp, o refrescar la migració original amb ell i esborrar els continguts previs.
Si volem utilitzar altres camps diferents en una i una altra taula per a connectar-les, hem d'indicar dos
paràmetres més en cridar a **hasOne** . Per exemple, així relacionaríem les dues taules anteriors, indicant
que la clau aliena de telefonos és **idUsuario** , i que la clau local a la qual es referencia en
usuaris és **codigo** :

```php
return $this->hasOne('App\Models\Telefono', 'idUsuario', 'codigo');
```

També és possible obtindre la relació inversa, és a dir, a partir d'un telèfon, obtindre l'usuari al qual
pertany. Per a això, afegim un mètode en el model Telefono i emprem el mètode
**belongsTo** per a indicar a quin model s'associa:

```php
class Telefono extends Model
{
	public function usuario()
	{
		return $this->belongsTo('App\Models\Usuario');
	}
}
```

Novament, podem especificar altres noms de clau passant paràmetres addicionals a **belongsTo**
, igual que es fa per a **hasOne** .
D'aquesta manera, si volem obtindre l'usuari a partir del telèfon, podem fer-lo així:

```
$usuario = Telefono::findOrFail($idTelefono)->usuario;
```

#### Guardar dades relacionades


Suposem que volem guardar un usuari amb el seu telèfon associat. Podem simplement guardar l'id del telèfon com un camp més de l'usuari:

```php
// Buscamos el teléfono que queremos asociar
// (suponiendo que existe previamente)
$telefono = Telefono::findOrFail($idTelefono);
$usuario = new Usuario();
$usuario->nombre = "Pepe";
$usuario->email = "pepe@gmail.com";
$usuario->telefono_id = $telefono->id;
$usuario->save();
```

Però, a més, podem vincular tots dos objectes en la relació, usant el mètode **associate** , d'aquesta manera:

```php
// Buscamos el teléfono que queremos asociar
// (suponiendo que existe previamente)
$telefono = Telefono::findOrFail($idTelefono);
$usuario = new Usuario();
$usuario->nombre = "Pepe";
$usuario->email = "pepe@gmail.com";
$usuario->telefono()->associate($telefono);
$usuario->save();
```

### Un a molts

Una relació "un-a-molts" s'usa per a definir relacions en les quals un model únic posseeix qualsevol quantitat d'altres models. Per exemple: suposem que tenim els models Autor i Llibre , de manera que un autor pot tindre diversos llibres, i un llibre està associat a un autor.
La manera d'establir la relació entre tots dos consistirà a afegir en la taula de llibres una clau
aliena a l'autor al qual pertany. A l'hora de plasmar aquesta relació en els models, es fa de manera similar
al cas anterior, només que en lloc d'utilitzar el mètode **hasOne** en la classe Autor usaríem el
mètode **hasMany** :

```php
class Autor extends Model
{
	public function libros()
	{
		return $this->hasMany('App\Models\Libro');
	}
}
```

Igual que ocorria abans, s'assumeix que la taula de llibres té una clau primària id , i que la clau aliena
corresponent cap a la taula d'autors és autor_id . En cas contrari, es poden especificar uns altres
passant més paràmetres a **hasMany** .
D'aquesta manera obtenim els llibres associats a un autor:

```php
$libros = Autor::findOrFail($id)->libros();
```

Finalment, també podem establir la relació inversa, i recuperar l'autor al qual pertany un
determinat llibre, definint un mètode en la classe Llibre que empre *belongsTo , com en les
relacions un a un:

```php
class Libro extends Model
{
	public function autor()
	{
		return $this->belongsTo('App\Models\Autor');
	}
}
```

I obtindre, per exemple, el nom de l'autor a partir del llibre:

```
$nombreAutor = Libro::findOrFail($id)->autor->nombre;
```

#### Accés eficient a dades relacionades. Eager loading

Si en una vista Blade, accedim al nom de l'autor de esta manera:

```
{{  $libro->autor->nombre }}
```
aquest codi provoca una nova consulta en la base de dades per a buscar les dades de l'autor
associat al llibre, al que, per a un llistat de 100 llibres, estarem fent 100 consultes addicionals
per a extraure la informació dels respectius autors.
Per a evitar aquesta sobrecàrrega, podem emprar una tècnica anomenada **eager loading** (que en valencià
podríem traduir com a càrrega precipitada o impacient). Consisteix a emprar el mètode **with** per a indicar
quina relació volem deixar pre-carregada en el resultat. Per exemple, si indiquem una cosa així en la
funció **index** del controlador de llibres:

```php
public function index()
{
	$libros = Libro::with('autor')->get();
	return view('libros.index', compact('libros'));
}
```

### Molts a molts – Many to many

Les relacions molts-a-molts són una mica més complicades que les hasOne o les hasMany. Un exemple de tal relació és un usuari que conté diversos rols, on els rols són compartits per altres usuaris. Per exemple, diversos usuaris poden tenir el rol de "Admin". Per a definir aquesta relació, es requereixen tres taules de la base de dades: users, rols, i role_user. La taula role_user és derivada de l'ordre alfabètic dels noms dels models relacionats i conté les columnes user_id i role_id.

Les relacions molts-a-molts es defineixen amb un mètode que retorna el resultat del mètode **belongsToMany**. Per exemple, definir el mètode rols en el model User:

```php
	class User extends Model
	{
	    /
	      The roles that belong to the user.
	     /
	    public function roles()
	    {
	        return $this->belongsToMany('App\Models\Role');
	    }
	}
```
	
Una vegada definida la relació, es pot accedir als rols de l'usuari usant la propietat dinàmica rols:

```
	$roles = App\User::find($id)->roles;
```

Per a definir la inversa d'una relació de molts a molts, simplement cal posar una altra cridada a belongsToMany en el model relacionat. 

```php
class Rol extends Model
{
	public function usuarios()
	{
		return $this->belongsToMany('App\Models\Usuario');
	}
}
```

A l'efecte d'automatització, és a dir, perquè Eloquent establisca els nexes de manera automàtica, si
volem establir una relació molts a molts entre un model A i un altre B , s'assumeix que existirà
una altra taula a_b (l'ordre en què es col·loquen els noms de les taules és alfabètic), amb els camps
a_id i b_id , que relacionen els dos models. En este cas, s'assumirà que existeix una taula
rol_usuari amb un camp **rol_id** i un altre anomenat **usuario_id** , que enllacen amb els
corresponents id de les taules d'usuaris i rols. Si això no fóra així, podem passar més
paràmetres a **belongsToMany** per a indicar-ho.

En el cas de les relacions molts a molts, és possible que ens interesse accedir a alguna dada d'aqueixa taula
intermèdia que els relaciona. En aqueix cas, fem ús de l'atribut **pivot** , predefinit, i que apunta a la
taula o model intermedi entre els dos relacionats. Per exemple, si volguérem obtindre la data de creació
de la relació entre un usuari i un rol, podríem fer això:

```
$roles = Usuario::findOrFail($id)->roles;
for($roles as $rol)
{
	echo $rol->pivot->created_at;
}
```

Per defecte, només les claus del model estaran presents en l'objecte pivot. Si la taula pivot conté atributs addicionals, s'han d'especificar en definir la relació:

```
	return $this->belongsToMany('App\Role')->withPivot('column1', 'column2');
```

Si es desitja que els camps crated_at i updated_at es mantinguen de forma automàtica, cal utilitzar el mètode withTimestamps en definir la relació:

```
	return $this->belongsToMany('App\Role')->withTimestamps();
```

##### Filtrant Relacions Via Columnes de Taula Intermèdia

També pots filtrar els resultats van retornar per belongsToMany utilitzant el **wherePivot** i **wherePivotIn** mètodes quan definint la relació:

```
	retorn $this->belongsToMany('App\Notes')->wherePivot('aprovat', 1);
```

## Seeders i factories

En les proves que hem fet fins ara, per a tindre dades amb què provar l'aplicació, ens hem limitat a afegir-los a mà des de **phpMyAdmin**.
Atés que les dades d'inici són necessaris per a provar algunes funcionalitats bàsiques de l'aplicació,
com són les cerques i filtrats, i atés que els formularis per a donar d'alta i gestionar aquestes dades normalment no es tenen llestos fins a etapes més tardanes, pot resultar convenient disposar d'algun
mecanisme que genere aquestes dades de prova a l'inici, sense preocupar-nos de tocar la base de dades a mà o
alterar el codi de l'aplicació per a això. En aquest aspecte, els **seeders i factories** juguen un paper
important.

### Los seeds

Els **seeders** són classes especials que permeten sembrar (seed) de contingut una aplicació. Per a crear-los, utilitzem el comando **php artisan** com segueix:

php artisan make:seeder NombreSeeder

Això crearà una classe anomenada **NombreSeeder** en la carpeta **database/seeders**. En el mètode **run** d'aquesta classe podem crear els elements que necessitem afegir a la base de dades.
Per exemple, per a emplenar un taula de llibres podem fer un LibrosSeeder:

```
php artisan make:seeder LibrosSeeder
```

Editem el mètode run del seeder que hem creat, i definim aquest codi per a crear un autor amb
un llibre associat (haurem d'incorporar amb use els models d'Autor i Llibre prèviament):

```php
public function run()
{
	$autor = new Autor();
$autor->nombre = "Juan Seeder";
$autor->nacimiento = 1960;
$autor->save();
$libro = new Libro();
$libro->titulo = "El libro del Seeder";
$libro->editorial = "Seeder S.A.";
$libro->precio = 10;
$libro->autor()->associate($autor);
$libro->save();
}
```

#### Afegint els seeders a l'aplicació

Per defecte, els *seeders que creguem no formen part de l'aplicació encara, en el sentit que encara no els
podem executar. Per a això, hem de donar-los d'alta en el seeder general, anomenat **DatabaseSeeder** ,
situat en la mateixa carpeta que els seeders que definim:

```
class DatabaseSeeder extends Seeder
{
	public function run()
	{
		...
		$this->call(LibrosSeeder::class);
	}
}
```

#### Llançant els seeders

Si només volem executar aquest *seeder perquè afija les dades, emprarem aquest comando:

```
php artisan db:seed
```

Això llançarà tots els seeders que tinguem declarats en la classe DatabaseSeeder . Si només volem
llançar un en concret, podem fer el següent:

```
php artisan db:seed --class=LibrosSeeder
```

També pot ser necessari (i a vegades convenient) netejar la base de dades i omplir-la des de zero amb les dades dels seeds per a començar a provar l'aplicació. En aquest cas, el comando és el següent:

```
php artisan migrate:fresh --seed
```

### Els factories

Els seeders són una eina útil per a poblar la nostra aplicació amb dades a l'inici. Podem, per exemple
, donar d'alta una sèrie d'usuaris inicials amb accés a l'aplicació, perquè amb ells es puguen
emplenar la resta de dades. També podem donar d'alta una sèrie de dades predefinides en unes certes taules, o dades de prova que després poder esborrar.
No obstant això, els **seeders** per si sols es queden una mica "coixos". Què hauríem de fer per a donar d'alta 10 o 20 llibres en la nostra taula. Hauríem de definir algun tipus de bucle en el **seeder**,
i definir dades diferents (per exemple, amb identificadors o comptadors aleatoris) per a cada llibre. Per a facilitar
aquesta tasca, podem tirar mà dels **factories**.

Els factories són classes que permeten generar dades per lots. Es creen amb el següent comando,
emmagatzemant-se la classe en la carpeta **database/factories** :

```
php artisan make:factory NombreFactory
```

Per exemple, anem a crear un factori per crear autors:

```
php artisan make:factory AutorFactory
```

Un dels canvis importants que ha portat la versió 8 de Laravel és que ara els factories estan
orientats a objectes, per la qual cosa s'engloben en classes. A més, per defecte s'associen als models que creguem, de manera que podem generar una factoria d'objectes a partir d'una classe, com veurem a continuació. Per aquest motiu, quan creguem un model s'afig una clàusula use indicant que
empra el **trait HasFactory**.

```
class Libro extends Model
{
use HasFactory;
...
}
```

Un **trait** bàsicament és un conjunt de mètodes que es pot emprar per qualsevol classe que vulga
utilitzar-los. D'aquesta manera, s'esmorteeix en part la limitació de només poder heretar d'una classe, i
mitjançant aquests **traits** podem incorporar la funcionalitat d'unes altres.

Quan creem una factoria en **Laravel 8** emprant el comando **php artisan make:factory**
comentat anteriorment, obtindrem una classe amb el nom que hàgem indicat, en la carpeta
**database/factories** . Per exemple:

```
namespace Database\Factories;
use App\Models\Autor;
use Illuminate\Database\Eloquent\Factories\Factory;
class AutorFactory extends Factory
{
	/**
	* The name of the factory's corresponding model.
	*
	* @var string
	*/
	protected $model = Autor::class;
		/**
		* Define the model's default state.
		*
		* @return array
		*/
		public function definition()
		{
			return [
				//
			];
	}
}
```
Ara haurem d'emplenar el mètode **definition** amb les dades que vulguem generar per a cada objecte
que es cree. Per exemple, així empraríem el **faker** (ara automàticament incorporat en el propi
objecte \$this ), per a generar dades a l'atzar per als autors:

```php
public function definition()
{
	return [
		'nombre' => $this->faker->name,
		'nacimiento' => $this->faker->numberBetween(1950, 1990)
	];
}
```

Finalment, en el seeder corresponent, podem utilitzar aquest factory per a generar N objectes del model
associat. Per exemple:

```php
class AutoresSeeder extends Seeder
{
	public function run()
	{
		Autor::factory()->count(5)->create();
	}
}
```

Per a generar dades relacionades entre models (per exemple, llibres amb els seus autors), procedim igual queen les versions anteriors de Laravel, però tenint en compte que per a cridar a la factoria s'ha d'utilitzar
el mètode estàtic del model associat. Per exemple:

```php
class LibrosSeeder extends Seeder
{
	public function run()
	{
		$autores = Autor::all();
		$autores->each(function($autor) {
			Libro::factory()->count(2)->create([
'autor_id' => $autor->id]);
		});
	}
}
```
## Query Builder

Laravel inclou una sèrie de classes que ens facilita la construcció de consultes i un altre tipus d'operacions amb la base de dades. A més, en utilitzar aquestes classes, vam crear una notació molt més llegible, compatible amb tots els tipus de bases de dades suportats per Laravel i que ens prevé de cometre errors o d'atacs per injecció de codi SQL.

#### Consultes
Per a realitzar una "Select" que retorne totes les files d'una taula utilitzarem el següent codi:

```php
	$users = DB::table('users')->get();
	foreach ($users as $user) {
		echo $user->name; 
	}
```
	
En l'exemple s'utilitza el constructor DB::taula indicant el nom de la taula sobre la qual es va a realitzar la consulta, i finalment es diu al mètode get() per a obtenir totes les files de la mateixa.

Si volem obtenir un sol element podem utilitzar first en lloc de get, de la forma: 

```
	$user = DB::table('users')->first();
```

##### Clausula where

Per a filtrar les dades usem la clausula where, indicant el nom de la columna i el valor a filtrar:

```	
	$user = DB::table('users')->where('name','Pedro')->get();
```
	 
En aquest exemple, la clausula where filtrarà totes les files la columna de les quals name siga igual a Pedro. Si volem realitzar un altre tipus de filtrats, com a columnes que tinguen un valor major (>), major o igual (>=), menor (<), menor o igual (<=), diferent de l'indicat (<>) o usar l'operador like, ho podem indicar com a segon paràmetre de la forma:

```	
	$users = DB::table('users')->where('votes', '>', 100)->get(); 
	$users = DB::table('users')->where('status', '<>', 'active')->get();
	$users = DB::table('users')->where('name', 'like', 'T%')->get();
```

Si afegim més clausulas where a la consulta per defecte s'uniran mitjançant l'operador lògic AND. En cas que vulguem utilitzar l'operador lògic OR ho haurem de realitzar usant **orWhere** de la forma:

```
	$users = DB::table('users') ->where('votes', '>', 100)->orWhere('name', 'Pedro') ->get();
```

##### orderBy / groupBy / having

També podem utilitzar els mètodes orderBy, groupBy i having en les consultes:

```
	$users = DB::table('users') ->orderBy('name', 'desc')->groupBy('count') ->having('count', '>', 100)->get();
```

##### Offset / Limit

Si volem indicar un offset o limit ho realitzarem mitjançant els mètodes skip (per a l'offset) i take (para limit), per exemple:

```
	$users = DB::table('users')->skip(10)->take(5)->get();
```

### Transaccions

Laravel també permet crear transaccions sobre un conjunt d'operacions:

```
	DB::transaction(function() {
		DB::table('users')->update(array('votes' => 1));
		DB::table('posts')->delete(); 
	});
```

En cas que es produïsca qualsevol excepció en les operacions que es realitzen en la transacció es desfarien tots els canvis aplicats fins a aqueix moment de forma automàtica.

## Us de dates

En algunes taules que hem vist o creat, s'ha usat un tipus **timestamp**, que bàsicament genera un
tipus data en la taula corresponent. Aquests camps de tipus taula són instàncies d'una llibreria PHP
anomenada **Carbon**, molt útil per a treballar amb dates. Així que, si tenim un registre de tipus Persona amb un camp **created_at** de tipus data, podem treballar amb ell com una data **Carbon**, i, per exemple,
mostrar-la en una vista amb un format específic:

<p>Fecha creación: {{ "{{ Carbon\Carbon::parse($persona->created_at)->format('d/m/Y) " }}}}</p>

A més, per a treballar sobre els camps created_at i updated_at que per defecte es creen en una
taula des d'una migració Laravel, podem emprar aquesta llibreria **Carbon** per a donar-los valor, encara que d'això ja s'encarrega Eloquent automàticament, però per si ho volem fer manualment, ací va un exemple:

```php 
DB::table('personas')->insert([
'nombre' => 'Juan',
'edad' => 56,
'created_at' => Carbon::now(),
'updated_at' => Carbon::now()
]);
```

Per a poder emprar la classe Carbon , hem d'importar-la ( **use Carbon\Carbon** ).



## Addendum sobre relacions

### Has Many Through

El "Has Many Through" proporciona una drecera convenient per accedir relacions distants via una relació intermèdia.Per exemple, un model Country, pot tenir molts models Post a través d'un model intermedi User. En aquest exemple, es podria reunir fàcilment tots els missatges d'un blog per a un país determinat. Fem una ullada a les taules per a definir aquesta relació:

countries
id - integer
name - string

users
id - integer
country_id - integer
name - string

posts
id - integer
user_id - integer
title - string

Encara que Post no conté una columna country_id, la relació hasManyThrough proporciona accés als missatges d'un país via \$country->posts.

Per a realitzar aquesta consulta, Eloquent inspecciona country_id en la taula intermèdia users. Després de trobar els IDs d'usuaris coincidents, seran usats per a la consulta a la taula posts.

Ara que s'ha examinat l'estructura de la taula per a la relació, es va a definir sobre el model Country:

```php	
	class Country extends Model
	{
	    /*
	     * Get all of the posts for the country.
	     */
	    public function posts()
	    {
	        return $this->hasManyThrough('App\Post', 'App\User');
	    }
	}
```

El primer paràmetre passat al mètode hasManyThrough és el nom del model final al que es desitja accedir, mentre que el segon paràmetre és el nom del model intermedi.

Els convenis típics per a claus de Eloquent seran usats per a realitzar les consultes de la relació. Si es desitja personalitzar les claus de la relació, es pot fer pels paràmetres tercer i quart al mètode hasManyThrough. El tercer paràmetre és el nom de la clau aliena del model intermediari. El quart paràmetre correspon amb el nom de la clau aliena del model final. El cinquè argument és la clau local, mentre que el sisè és la clau local del model intermedi:

```php
	class Country extends Model
	{
	    public function posts()
	    {
	        return $this->hasManyThrough(
	            'App\Post',
	            'App\User',
	            'country_id', // Foreign key on users table...
	            'user_id', // Foreign key on posts table...
	            'id', // Local key on countries table...
	            'id' // Local key on users table...
	        );
	    }
	}
```

##### Consultar l'Existència de Relacions

Quan s'accedeixen als registres d'un model, es poden limitar els resultats basats en l'existència d'una relació. Per exemple, imaginar que es desitja obtenir tots els posts que continguen almenys un comentari. Per a açò, es passaria el nom de la relació al mètode has o a orHas:

```
	// Retrieve all posts that have at least one comment...
	$posts = App\Post::has('comments')->get();
```

A més es pot especificar un operador i un comptador per a personalitzar la consulta:

```
	// Retrieve all posts that have three or habite comments...
	$posts = Post::has('comments', '>=', 3)->get();
```

Es poden nigar estructures has utilitzant la notació de "punts". Per exemple, es podrien obtenir tots els posts que tenen almenys un comentari i un vot:

```
	// Retrieve all posts that have at least one comment with votes
	$posts = Post::has('comments.votes')->get();
	
```

Si es necessita encara més control, es poden utilitzar els mètodes whereHas i orWhereHas per a incloure condicions "where" en les consultes has. Aquests mètodes permeten afegir restricciones personalitzades a una relació, així com comprovar el contingut d'un comentari:

```
	// Retrieve all posts with at least one comment containing words like foo%
	$posts = Post::whereHas('comments', function ($query) {
	    $query->where('content', 'like', 'foo%');
	})->get();
```
	
Quan s'accedeixen als registres d'un model, es poden limitar els resultats basats en la **inexistència** d'una relació. Per exemple, imaginar que es desitja obtenir tots els posts que no continguen almenys un comentari. Per a açò, es passaria el nom de la relació al mètode doesntHave o a orDoesntHave:

```
	$posts = App\Post::doesntHave('comments')->get();
```

#### Insertant i modificant Models rel.lacionats

##### El mètode Save

Eloquent proveeix mètodes convenients per a l'addició de nous models a les relacions. Per exemple, potser necessite inserir un nou Comment a un model Post. En lloc de configurar manualment l'atribut **post_id** en el Comment, pot inserir el Comment directament des del mètode **save** de la relació:

	$comment = new App\Comment(['message' => 'A new comment.']);
	$post = App\Post::find(1);
	$post->comments()->save($comment);
	
Note's que no accedim als comments de la relació com una propietat dinàmica. En el seu lloc, cridem al mètode comments per a obtenir una instància de la relació. El mètode save agregarà automàticament el valor post_id apropiat al nou model Comment.

Si necessitem gravar multiples models relacionats, pot usar el mètode **saveMany**

```
	$post = App\Post::find(1);
	
	$post->comments()->saveMany([
	    new App\Comment(['message' => 'A new comment.']),
	    new App\Comment(['message' => 'Another comment.']),
	]);
```

#### El mètode Create

A més dels mètodes save i saveMany, es pot utilitzar també el mètode **create**, eque accepta una matriu d'atributs, crea el model i ho insereix en la base de dades. De nou, la diferència entre save i create és que save accepta una instància d'un model complet de Eloquent mentre que create accepta una matriu de PHP:

```
	$post = App\Post::find(1);
	
	$comment = $post->comments()->create([
	    'message' => 'A new comment.',
	]);
```
	

Abans d'utilitzar el crear mètode, revisa la documentació d'assignment masssiu.
Pots utilitzar el createMany mètode per crear el múltiple va relacionar models:

```
	$post = App\Post::find(1);
	$post->comments()->createMany([
	    [
	        'message' => 'A new comment.',
	    ],
	    [
	        'message' => 'Another new comment.',
	    ],
	]);
```
	
#### Belongs To Relationships

Quan actualitzem una relació **belongsTo**, utilitzaem el mètode associate. Aquest mètode establirà la clau forània en el model fill.

	$account = App\Account::find(10);
	$user->account()->associate($account);
	$user->save();
	
Per a llevar-la, pots utilitzar el mètode **dissociate**. Aquest mètode posarà la clau forània de la relació a null:

	$user->account()->dissociate();
	$user->save();
	
#### Relacions Molts a Molts

##### Adjuntar / Separar (Attaching / Detaching)

Eloquent també proporciona uns quants helpers addicionals helper mètodes per fer que treballen amb va relacionar models habite convenient. Per exemple, imaginar que un usuari pot tenir diversos rols i un rol pot tenir diversos usuaris. Per un adjuntar un rol un un usuari inserint un registre en la taula intermèdia que uneix els models, utilitzar el mètode attach:

	$user = App\User::find(1);
	$user->rols()->attach($roleId);
	
Quan s'adjunta una relació a un model, es pot passar a més un array de dades addicional per a inserir-ho en la taula intermèdia:

	$user->rols()->attach($roleId, ['expires' => $expires]);

Per descomptat, a voltes és necessari eliminar un rol d'un usuari. Per a eliminar un registre d'una relació molts-a-molts, utilitzar el mètode **detach**. El mètode detach eliminarà el registre apropiat de la taula intermèdia; no obstant açò, tots dos models romandran en la base de dades:

	// Detach a single role from the user...
	$user->rols()->dettach($roleId);
	
	// Detach all rols from the user...
	$user->rols()->dettach();

Per comoditat, attach i dettach accepten a més un array de IDs com a entrada:

	$user = App\User::find(1);
	
	$user->rols()->detach([1, 2, 3]);
	
	$user->rols()->attach([
	    1 => ['expires' => $expires],
	    2 => ['expires' => $expires]
	]);
	
##### Guardant dades addicional en la taula pivot

Quan treballem amb una relació molts-a-molts, el mètode Save accepta , com a segon argument, una matriu de attributes de la taula annexa (taula pivot)

	App\User::find(1)->rols()->save($role, ['expires' => $expires]);

##### Modificant un registre en la taula Pivot 

Si necessites actualitzar una fila en el taula pivot, pots utilitzar el mètode **updateExistingPivot**. Aquest mètode accepta la clau forània i una varietat d'atributs per actualitzar:

	$user = App\User::find(1);
	$user->rols()->updateExistingPivot($roleId, $attributes);
	

Consulta [documentación](https://laravel.com/docs/9.x/eloquent-relationships)

## Exercicis 


#### Exercisi 721:
 
Sobre el projecte blog de la sessió anterior, afegirem aquests canvis:
	
* Crea una base de dades anomenada blog en el teu servidor de bases de dades a través de **phpMyAdmin**.
Modifica també l'arxiu **.env** del projecte per a accedir a aquesta base de dades amb les
credencials adequades.

* Crea una nova migració anomenada crear_taula_posts , que crearà una taula anomenada posts amb aquests camps:

	* **Id** autonumérico
	* **Titol** del post (string )
	* **Contingut** del post (text )
	* **Timestamps** per a gestionar automàticament la data de creació o modificació del post

* Llança les migracions i comprova que es creen les taules corresponents amb els camps associats
en la base de dades.	

#### Exercisi 722:

Continuem amb el projecte blog anterior. Crea un nou [model](#definició-dun-model-de-dades) anomenat Post per als posts del nostre blog. Ha de quedar  juntament amb el model d'Usuari a la subcarpeta **App\Models** del projecte.
Després, modifica els mètodes del controlador **PostController** creat en exercisis anteriors, d'aquesta manera:

* El [mètode](#consultar-dades) **index** ha d'obtindre tots els posts de la taula, i mostrar la vista **posts.index** amb aqueix llistat de posts.
	* La vista posts.index , per part seua, rebrà el llistat de posts i mostrarà els títols de cadascun, i un botó Veure per a mostrar la seua fitxa ( posts.show ).
	* Has de mostrar el llistat de posts ordenat per títol en ordre ascendent, i [paginat](#paginaciò-de-resultats) de 5 en 5.
* El [mètode](#mostrar-dades) **show** ha d'obtindre el post que el seu id es passarà com a paràmetre, i mostrar-lo en la vista posts.show .
	* La vista posts.show rebrà l'objecte amb el post a mostrar, i mostrarem el títol,contingut i data de creació del post, amb el format que vulgues.
* El [mètode](#esborrar-dades) **destroy** eliminarà el post que el seu id rebrà com a paràmetre, i retornarà la vista posts.index amb el llistat actualitzat. Per a provar aquest mètode, recorda que has de definir un formulari en una vista (el pots fer per a cada post mostrat en la vista posts.index ) que envie a la ruta posts.destroy usant un mètode [DELETE](../7.5.Laravel_models.md#sobre-lesborrat-des-de-les-vistes), com hem explicat en un exemple anterior.
* Els mètodes **create , edit , store i update** de moment els deixarem sense fer, fins que vegem com gestionar formularis.
 
* Per a simular la inserció i la modificació, crearem dos mètodes addicionals en el controlador, que usarem de manera temporal:
	* Un mètode anomenat **nuevoPrueba** , que cada vegada que el cridem crearà un post amb un títol a l'atzar (per exemple, "Títol X", sent X un enter aleatori), i un contingut a l'atzar ("Contingut
X"). Pots emprar la funció **rand** de PHP per a generar aquests números aleatoris per a títol i contingut.
	* Un mètode anomenat **editarPrueba** , que rebrà com a paràmetre un id i modificarà el títol i contingut del post altres generats aleatòriament, com en el punt anterior.
	* Aquests dos mètodes (especialment el primer) ens serviran per a crear una sèrie de posts de prova que després ens serviran per a provar el llistat i la fitxa dels posts.

* En l'arxiu **routes/web.php** , recorda afegir dues noves rutes temporals de tipus **get** per a provar aquestes insercions i modificacions. La primera pot apuntar a **/nuevoPrueba** ,per exemple, i la segona a **/editarPrueba/{id}** . Recorda també eliminar o editar la restricció **only** de les rutes del controlador que vas establir la sessió anterior, perquè no sols permeta les rutes **index, show, create i edit**, i a més permeta la de destroy (o totes les possibles, si vols, ja que tard o d'hora les utilitzarem).


#### Exercisi 723:

Sobre el projecte blog de la sessió anterior, afegirem aquests canvis:

* Crea una [relació](#un-a-molts) un a molts entre el model d'Usuari i el model de Post , tots dos ja existents en l'aplicació, de manera que un post és d'un usuari, i un usuari pot tindre molts posts. Hauràs de definir una nova [migració de modificació](../7.6.Laravel_dades.md#crear-una-nova-migració) sobre la taula posts que afija un nou camp usuari_id , i establir a partir d'ell la relació.
* Registra una sèrie d'usuaris  en la taula usuaris, i associa alguns d'ells als posts que hi haja des del phpMyaAdmin.

* Modifica la vista posts/index.blade.php perquè, al costat del títol de cada post, entre parèntesi, aparega el **name** de l'usuari que el va crear.

#### Exercisi 724:

Continuem amb el projecte blog anterior. Ara afegirem el següent:

* Crea un [seeder](#los-seeds) anomenat **UsersSeeder** , amb el factory associat anomenat **UserFactory** que ja està creat. Crea amb això 3 usuaris de prova.
* Crea un altre seeder anomenat **PostsSeeder** amb un factory associat anomenat **PostFactory** . En el factory, defineix amb el faker títols aleatoris (frases) i continguts aleatoris (textos llargs). Usa el seeder per a crear 3 posts per a cadascun dels usuaris existents.
* Utilitza l'opció **php artisan migrate:fresh --seed** per a esborrar tot contingut previ i poblar la base de dades amb aquests nous elements. Comprova després des de la pàgina del llistat de posts, i des de phpmyAdmin que la informació és correcta.

#### Exercisi 725:

Afig al projecte blog un nou model anomenat Comentari , juntament amb la seua migració i controlador associats. Cada comentari tindrà com a camp el contingut del comentari, i estarà relacionat un a molts amb el model Usuari , de manera que un usuari pot tindre molts comentaris, i cada comentari pertany a un usuari. També tindrà una relació un a molts amb el model Post , de manera que un comentari pertany a un post, i un post pot tindre molts comentaris. Per tant, la
migració dels comentaris haurà de tindre com a camps addicionals la relació amb l'usuari ( usuario_id ) i amb el post al qual pertany ( post_id ).

Aplica la migració per a reflectir la nova taula en la base de dades, i utilitza un **seeder** i un **factory** per a crear 3 comentaris en cada post, amb l'usuari que siga. A l'hora d'aplicar tot això, esborra els continguts previs de la base de dades ( **migrate:fresh --seed** ).

AJUDA: si vols triar un usuari a l'atzar com a autor de cada comentari, pots fer una cosa així:

	Usuario::inRandomOrder()->first();


En aquest cas, seria convenient que aqueix usuari aleatori s'afija directament en el factory del comentari, i no en el seeder, ja que en cas contrari és possible que genere el mateix usuari per a tots els comentaris d'un post.
En la fitxa dels posts (vista posts/show.blade.php ), afig el codi necessari per a mostrar el **login** de l'usuari que ha fet el post, i el llistat de comentaris associat al post, mostrant per a cadascun el login de l'usuari que el va fer, i el text del comentari en si. Utilitza també la [llibreria)(us-de-dates) **Carbon** per a mostrar la data de creació del post (o la dels comentaris, com preferisques) en format d/m/Y .

# **Gestió de Dades amb Laravel**

## **1. Introducció**
Laravel és un framework PHP modern que simplifica el desenvolupament d'aplicacions web, incloent-hi la gestió de bases de dades. La integració amb Eloquent, el seu ORM (Object-Relational Mapping), permet treballar amb bases de dades de forma intuïtiva i eficient.
 
## **2. Configuració inicial**
Laravel suporta diversos motors de bases de dades com MySQL, PostgreSQL, SQLite i SQL Server. La configuració principal es fa al fitxer `.env` i `config/database.php`.

**Exemple de configuració al fitxer `.env`:**
```env
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=nom_base_de_dades
DB_USERNAME=usuari
DB_PASSWORD=contrasenya
```

**Comprovació de connexió:**

Després de configurar el `.env`, utilitza el comandament:
```bash
php artisan migrate:status
```
Aquest comandament confirma si Laravel pot connectar-se a la base de dades configurada.

#### **Detecció de problemes comuns**

- Comprovar que l'extensió del driver de la base de dades (com `pdo_mysql` o `pdo_pgsql`) estigui habilitada al `php.ini`.
- Utilitzar `php artisan config:clear` per esborrar la memòria cau de configuracions si els canvis al `.env` no es reflecteixen. 

## **3. Migracions en Laravel**

### **Introducció**
Les migracions són un sistema de control de versions per a bases de dades que permet treballar de manera col·laborativa, mantenint un històric dels canvis realitzats en l'esquema. Amb migracions, pots:
- Crear, modificar i esborrar taules.
- Gestionar l'esquema de manera programàtica utilitzant Artisan i el **Schema Builder**.
- Revertir canvis mitjançant `rollback` o tornar a aplicar tots els canvis amb `refresh`.

Laravel proporciona un conjunt d'eines intuïtives per gestionar migracions, com Artisan i la classe **Schema**.
 
### **Estructura de les migracions**
Totes les migracions es guarden a la carpeta `database/migrations` i segueixen una estructura predefinida amb dos mètodes principals:
- **`up`**: Defineix les operacions que s'han d'aplicar a la base de dades (crear taules, afegir columnes, etc.).
- **`down`**: Defineix les operacions inverses per revertir els canvis aplicats per `up`.

Exemple bàsic:
```php
public function up()
{
    Schema::create('usuarios', function (Blueprint $tabla) {
        $tabla->id();
        $tabla->string('nombre');
        $tabla->string('email')->unique();
        $tabla->timestamps();
    });
}

public function down()
{
    Schema::dropIfExists('usuarios');
}
```

Per defecte, Laravel afegeix un camp autonumèric `id` i dues columnes `timestamps` (`created_at` i `updated_at`) gestionades automàticament.

 
### **Crear una migració**
Utilitza Artisan per crear una nova migració:
```bash
php artisan make:migration nom_migracio
```

Aquest comando genera un fitxer amb un nom que inclou un **timestamp** per assegurar l'ordre cronològic.

### **Exemples**
- Crear una taula:
```bash
php artisan make:migration crear_tabla_usuarios --create=usuarios
```

- Modificar una taula existent:
```bash
php artisan make:migration afegir_camp_a_usuarios --table=usuarios
```

Laravel pot inferir accions del nom de la migració gràcies a la classe **TableGuesser**. Per exemple, si el nom conté `create` o `to`, Artisan deduirà si és per crear o modificar taules.

 
### **Schema Builder**
La classe **Schema** és el nucli per definir i modificar l'esquema de les bases de dades. Inclou constructors per crear, modificar i eliminar taules i columnes.

#### **Crear una taula**
```php
Schema::create('users', function (Blueprint $table) {
    $table->id();
    $table->string('username', 32);
    $table->timestamps();
});
```

#### **Eliminar una taula**
```php
Schema::dropIfExists('users');
```

#### **Afegir columnes**
```php
Schema::table('usuarios', function (Blueprint $table) {
    $table->string('telefono')->after('email')->nullable();
});
```

#### **Eliminar columnes**
```php
Schema::table('usuarios', function (Blueprint $table) {
    $table->dropColumn('telefono');
});
```
 
### **Tipus de columnes disponibles**
Laravel ofereix una àmplia varietat de tipus de columnes per satisfer diferents [necessitats](https://laravel.com/docs/11.x/migrations#available-column-types) 
  
### **Índexs i claus forànies**
#### **Crear índexs**
```php
$table->unique('email');
$table->index('state');
$table->primary(['first_name', 'last_name']);
```

#### **Definir claus forànies**
```php
$table->foreignId('user_id')->constrained()->onDelete('cascade');
```
 
### **Executar i revertir migracions**
- **Executar migracions pendents:**
```bash
php artisan migrate
```

- **Revertir l'última migració:**
```bash
php artisan migrate:rollback
```

- **Revertir totes les migracions:**
```bash
php artisan migrate:reset
```

- **Refrescar totes les migracions:**
```bash
php artisan migrate:refresh
```

- **Comprovar l'estat de les migracions:**
```bash
php artisan migrate:status
```

Aquest conjunt de comandes permet un control complet sobre l'estat de les migracions durant el desenvolupament.
 

##  **4. Laravel Query Builder**

El **Query Builder** de Laravel proporciona una interfície fluida per construir i executar consultes de bases de dades. Permet treballar amb diverses bases de dades de manera senzilla sense escriure SQL brut.

---

### **Exemples d'ús**

#### Obtenir tots els registres:
```php
$users = DB::table('users')->get();
```

#### Filtrar registres:
```php
$users = DB::table('users')
    ->where('active', 1)
    ->get();
```

#### Seleccionar columnes específiques:
```php
$users = DB::table('users')
    ->select('name', 'email')
    ->get();
```
 
#### Ordenar resultats:
```php
$users = DB::table('users')
    ->orderBy('name', 'asc')
    ->get();
```

#### Comptar registres:
```php
$count = DB::table('users')->count();
```

#### Consultes amb agregats:
```php
$maxSalary = DB::table('employees')->max('salary');
```
 
#### Consultes amb subconsultes:
```php
$users = DB::table('users')
    ->whereExists(function ($query) {
        $query->select(DB::raw(1))
              ->from('orders')
              ->whereColumn('orders.user_id', 'users.id');
    })
    ->get();
```

#### Unions:
```php
$first = DB::table('users')->where('type', 'admin');
$second = DB::table('users')->where('type', 'customer');

$users = $first->union($second)->get();
```
#### Inserir un registre:
```php
DB::table('users')->insert([
    'name' => 'John Doe',
    'email' => 'john@example.com',
]);
```
#### Actualitzar un registre:
```php
DB::table('users')
    ->where('id', 1)
    ->update(['name' => 'Updated Name']);
```
#### Esborrar un registre:
```php
DB::table('users')
    ->where('id', 1)
    ->delete();
```

#### Esborrar tots els registres:
```php
DB::table('users')->truncate();
```
  
###  **Avantatges**
El Query Builder és ideal per a:

- Consultes personalitzades on el rendiment és una prioritat.
- Consultes complexes que no es poden expressar fàcilment amb Eloquent.

---
 

## **5.Laravel Eloquent**

Eloquent és l'ORM (Object-Relational Mapping) de Laravel. Proporciona una interfície senzilla i elegant per treballar amb bases de dades relacionals mitjançant models.
 
### **Definició de Models**

Els models es defineixen dins de la carpeta `app/Models` i es poden crear mitjançant Artisan:
```bash
php artisan make:model Movie
```

#### Exemple bàsic:
```php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Movie extends Model
{
    // Taula associada al model
    protected $table = 'movies';
}
```

Per defecte:

- El model s'associa a una taula plural (`movies` per al model `Movie`).
- Utilitza `id` com a clau primària.
- Assumeix l'ús de camps `created_at` i `updated_at` gestionats automàticament.
 
### **Ús bàsic d'un model**
#### Recuperar dades:
- Tots els registres:
```php
$movies = Movie::all();
```

- Registres filtrats:
```php
$movies = Movie::where('rating', '>', 4)->get();
```

- Registre únic:
```php
$movie = Movie::findOrFail($id);
```

#### Inserir dades:
```php
$movie = new Movie();
$movie->title = "Inception";
$movie->director = "Christopher Nolan";
$movie->save();
```

#### Actualitzar dades:
```php
$movie = Movie::find($id);
$movie->title = "Updated Title";
$movie->save();
```

#### Esborrar dades:
```php
$movie = Movie::find($id);
$movie->delete();
```
### Propietats comuns dels Models Eloquent

Els models d'Eloquent ofereixen diverses propietats que permeten configurar el comportament de la interacció amb la base de dades. A continuació es detallen les més importants:

```php
<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Example extends Model
{
    // Especifica el nom de la taula si no segueix la convenció per defecte
    protected $table = 'custom_table_name';

    // Defineix la clau primària de la taula
    protected $primaryKey = 'custom_id';

    // Indica si la clau primària és autoincremental
    public $incrementing = false;

    // Especifica el tipus de la clau primària (per exemple, string si no és integer)
    protected $keyType = 'string';

    // Defineix quins camps poden ser assignats massivament
    protected $fillable = ['name', 'email', 'password'];

    // Defineix quins camps no poden ser assignats massivament
    protected $guarded = ['is_admin'];

    // Oculta camps quan es converteix a JSON o arrays
    protected $hidden = ['password', 'remember_token'];

    // Defineix quins camps són visibles quan es converteix a JSON o arrays
    protected $visible = ['name', 'email'];

    // Transformació automàtica de camps a un tipus específic
    protected $casts = [
        'is_admin' => 'boolean',
        'settings' => 'array',
    ];

    // Indica si la taula té els camps `created_at` i `updated_at`
    public $timestamps = true;

    // Defineix la connexió a la base de dades
    protected $connection = 'mysql';
}
```

### **Relacions en Eloquent**

#### 1. **Un a un (One-to-One):**
Un usuari té un perfil:
```php
class User extends Model
{
    public function profile()
    {
        return $this->hasOne(Profile::class);
    }
}

$user = User::find(1);
$profile = $user->profile;
```

#### 2. **Un a molts (One-to-Many):**
Un autor té molts llibres:
```php
class Author extends Model
{
    public function books()
    {
        return $this->hasMany(Book::class);
    }
}

$author = Author::find(1);
$books = $author->books;
```

#### 3. **Molts a molts (Many-to-Many):**
Un usuari té molts rols:
```php
class User extends Model
{
    public function roles()
    {
        return $this->belongsToMany(Role::class);
    }
}

$user = User::find(1);
$roles = $user->roles;
```

#### 4. **Has Many Through (Relacions transitives):**
Permet accedir a dades relacionades a través d'un altre model.
```php
class Country extends Model
{
    public function posts()
    {
        return $this->hasManyThrough(Post::class, User::class);
    }
}
```
 
### **Eager Loading (Càrrega eficient de relacions)**

Per evitar múltiples consultes a la base de dades, pots carregar relacions amb `with`:
```php
$authors = Author::with('books')->get();
```
 
### **Col·leccions i Agrupacions**

Eloquent retorna col·leccions per defecte, que permeten treballar amb [mètodes](https://laravel.com/docs/11.x/eloquent-collections#available-methods)  
 
 
### **Mutators i Accessors**

Els **mutators** permeten transformar dades abans de guardar-les, i els **accessors** les transformen en recuperar-les.

#### Exemple:
```php
class User extends Model
{
    // Accessor
    public function getFullNameAttribute()
    {
        return "{$this->first_name} {$this->last_name}";
    }

    // Mutator
    public function setPasswordAttribute($value)
    {
        $this->attributes['password'] = bcrypt($value);
    }
}
```

#### Ús:
```php
$user = User::find(1);
$fullName = $user->full_name;

$user->password = 'new_password';
$user->save();
```

---

### **Paginació**

Laravel facilita la paginació:
```php
$movies = Movie::paginate(10);
```

En la vista:
```php
{{ $movies->links() }}
```



## **6. Seeders i Factories en Laravel**

Els **seeders** i **factories** permeten generar dades de prova de manera fàcil i ràpida, útils durant el desenvolupament per simular dades inicials en una aplicació.

---

### **Seeders**
Els seeders són classes especials que permeten "sembrar" dades a la base de dades.

#### **Crear un Seeder**
```bash
php artisan make:seeder NomSeeder
```
Això crea un fitxer a la carpeta database/seeders. Per exemple:

```php
class BooksSeeder extends Seeder
{
    public function run()
    {
        // Exemple: Crear un llibre
        $book = new Book();
        $book->title = "Laravel for Beginners";
        $book->author = "John Doe";
        $book->save();
    }
}
```

#### Afegir Seeders al Seeder General
Inclou els seeders al fitxer DatabaseSeeder:

```php
class DatabaseSeeder extends Seeder
{
    public function run()
    {
        $this->call([
            BooksSeeder::class,
            AuthorsSeeder::class,
        ]);
    }
}
```

#### Executar Seeders

Executar tots els seeders:
Executar un seeder específic:
Reiniciar les migracions i executar els seeders:

```bash
php artisan db:seed
php artisan db:seed --class=BooksSeeder
php artisan migrate:fresh --seed
```

### Factories

Els factories permeten crear grans quantitats de dades de manera ràpida i dinàmica mitjançant Faker.

#### Crear un Factory

```bash
php artisan make:factory NomFactory -m Model
```

Per exemple, per al model Author:

```php
namespace Database\Factories;

use App\Models\Author;
use Illuminate\Database\Eloquent\Factories\Factory;

class AuthorFactory extends Factory
{
protected $model = Author::class;

    public function definition()
    {
        return [
            'name' => $this->faker->name,
            'birth_year' => $this->faker->year,
        ];
    }
}
```

#### Utilitzar un Factory
Per generar dades amb un factory:

```php
use App\Models\Author;

// Crear un únic autor
Author::factory()->create();

// Crear diversos autors
Author::factory()->count(10)->create();
```
#### Integració amb Seeders

Combina factories amb seeders per generar dades dinàmiques:

```php
class AuthorsSeeder extends Seeder
{
    public function run()
    {
        Author::factory()->count(10)->create();
    }
}
```

#### Dades Relacionades

Els factories permeten generar dades relacionades. Per exemple, llibres amb els seus autors:

```php
class BooksSeeder extends Seeder
{
    public function run()
    {
        $authors = Author::factory()->count(5)->create();

        $authors->each(function ($author) {
            Book::factory()->count(2)->create(['author_id' => $author->id]);
        });
    }
}
```
 
#### Exemples Avançats

Podem cercar com construir factories més complexes a la [documentació oficial](https://fakerphp.org).  

##### Utilitzar Factories per Relacions
Definir relacions dins d’un factory:
```php
class BookFactory extends Factory
{
    public function definition()
    {
        return [
            'title' => $this->faker->sentence,
            'author_id' => Author::factory(),
        ];
    }
}
```
Llançar el factory:
```php
Book::factory()->count(10)->create();
```

##### Factories amb Estats
Els estats permeten definir configuracions personalitzades per un model:

```php
class BookFactory extends Factory
{
    public function withDiscount()
    {
        return $this->state([
        'price' => $this->faker->numberBetween(5, 10),
        ]);
    }
}
```
Ús d'un estat:
```php
Book::factory()->withDiscount()->create();
```

### Avantatges dels Factories

- Faciliten la generació massiva de dades.
- Simplifiquen les proves i el desenvolupament amb dades fictícies realistes.
- Redueixen el temps d'inicialització de les aplicacions.

---
## **7.Requests, Responses i Validació en Laravel**  

### **1. Requests**

#### **Introducció**
Un *Request* en Laravel és un objecte que encapsula la informació sobre la petició HTTP, incloent dades, capçaleres, paràmetres i fitxers.
 
#### **Accés a dades del Request**
  
 ```php
$input = $request->all(); //Accedir a tots els inputs.
$name = $request->input('name'); //Obtenir un input específic.
$age = $request->input('age', 18); //Especificar valors per defecte.
$id = $request->route('id'); //Accedir a paràmetres de ruta.
```
 
#### **Validació de presència**
 
```php
if ($request->has('email')) {
    // Input 'email' present
}
if ($request->filled('name')) {
    // Input 'name' no està buit
}
$filtered = $request->only(['name', 'email']); //Filtrar inputs específics.
$excluded = $request->except(['password']); //Excloure certs inputs.
```

### **Tractament de fitxers**
 
```php
if ($request->hasFile('photo')) { //Comprovar si hi ha un fitxer.
    $file = $request->file('photo');
}
$path = $request->file('photo')->store('photos'); //Emmagatzemar un fitxer.
    
```
 
## **2. Responses**

### **Creació de respostes**
 
```php
return response('Hello World', 200); //Crear una resposta bàsica.
return response()->json([
    'name' => 'John',
    'status' => 'success'
]); //Crear una resposta JSON.
return redirect('dashboard'); //Redirecció .
return redirect('login')->with('status', 'Sessió iniciada'); //Redirecció amb dades de sessió.
``` 
 
### **Manipular capçaleres**
 
```php
//Afegeix una o múltiples capçaleres.
return response('Hello')->header('Content-Type', 'text/plain');
return response('Hello')
->header('Content-Type', 'application/json')
->header('Cache-Control', 'no-cache');
```
 
### **Respostes de fitxers**
 
```php

return response()->download($pathToFile); //Descàrrega de fitxers.
return response()->file($pathToFile); //Mostrar fitxers.
``` 

## **3. Validació**

### **Introducció**
Laravel ofereix un sistema potent i senzill per validar dades d'inputs.
 
 
### **Validació bàsica**
 
```php
    // Validar dades amb un Request.
$request->validate([
    'name' => 'required|string|max:255',
    'email' => 'required|email',
    'password' => 'required|min:8',
]);
```
 
```php
    // Validar manualment.
$validator = Validator::make($request->all(), [
    'title' => 'required|max:255',
    'body' => 'required',
]);

if ($validator->fails()) {
    return redirect('/form')->withErrors($validator);
}
```
 
### **Regles comunes**
- `required`: Camp obligatori.
- `email`: Validació d'un correu electrònic.
- `min:value`: Mínim de caràcters o valor numèric.
- `max:value`: Màxim de caràcters o valor numèric.
- `unique:table,column`: Ha de ser únic en una taula/columna.
[Llista sencera de regles](https://laravel.com/docs/11.x/validation#available-validation-rules)
 

### **Missatges personalitzats**

```php
// Es poden definir missatges personalitzats per a les regles de validació.

$request->validate([
    'name' => 'required',
], [
    'name.required' => 'El nom és obligatori.',
]);
```
    
 
### **Validació condicional**

```php
 // Validació basada en altres camps o condicions.
$request->validate([
    'password' => 'required_if:is_admin,true',
]);
```

### **Validació personalitzada**

```php
// Es poden afegir regles personalitzades mitjançant extensions del Validator.

Validator::extend('uppercase', function ($attribute, $value, $parameters, $validator) {
    return strtoupper($value) === $value;
});
```
 
### **Errors de validació**
 

```php
// Obtenir tots els errors en la vista
@if ($errors->any())
    <ul>
        @foreach ($errors->all() as $error)
            <li>{{ $error }}</li>
        @endforeach
    </ul>
@endif
```
 
```php
    // Mostrar errors per camp específic
@error('name')
    <div>{{ $message }}</div>
@enderror
```
 

## Exercici Pràctic: Guia d'Equips de Futbol Femení amb Base de Dades

L'objectiu d'aquest exercici és estendre la Guia d'Equips de Futbol Femení per utilitzar una base de dades relacional. Aprendràs a crear taules amb migracions, models per gestionar les dades, i a integrar-los amb controladors i vistes.

---

## **1. Crear la Migració per a la Taula `equips`**

### **Migració**

1. Genera una migració per a la taula `equips` amb la següent estructura:
    - `id`: Clau primària, autoincremental.
    - `nom`: Nom de l'equip (cadena, únic, obligatori).
    - `estadi`: Nom de l'estadi de l'equip (cadena, obligatori).
    - `titols`: Nombre de títols guanyats (entero, predeterminat 0).
    - `created_at` i `updated_at`: Camps de timestamps generats automàticament.

```bash
php artisan make:migration create_equips_table --create=equips
```
   
2. Modifica el fitxer de migració per incloure l'estructura de la taula:

```php
public function up()
{
    Schema::create('equips', function (Blueprint $table) {
        $table->id();
        $table->string('nom')->unique();
        $table->string('estadi');
        $table->integer('titols')->default(0);
        $table->timestamps();
    });
}
```

3. Executa la migració per crear la taula:

```bash 
php artisan migrate
```

### **Models i Seeders**
  
1. Genera un model anomenat `Equip` per gestionar la taula:

```bash
php artisan make:model Equip 
```

2. Modifica el model Equip a app/Models/Equip.php per definir els camps que es poden emplenar mitjançant assignació massiva:

 ```php
 protected $fillable = ['nom', 'estadi', 'titols'];
 ```
   
3. Crea un seeder per a la taula `equips`:

 ```bash
 php artisan make:seeder EquipsSeeder
 ```
   
4. Modifica el seeder EquipsSeeder per generar dades d'exemple:

 ```php
 public function run()
 {
     DB::table('equips')->insert([
             ['nom' => 'Barça Femení', 'estadi' => 'Camp Nou', 'titols' => 30],
             ['nom' => 'Atlètic de Madrid', 'estadi' => 'Cívitas Metropolitano', 'titols' => 10],
             ['nom' => 'Real Madrid Femení', 'estadi' => 'Alfredo Di Stéfano', 'titols' => 5],
     ]);
 }
 ```

5. Afegeix el seeder EquipsSeeder al fitxer DatabaseSeeder:

 ```php
 public function run()
 {
     $this->call([
         EquipsSeeder::class,
     ]);
 }
 ```

6. Executa els seeders per omplir la taula `equips` amb dades d'exemple:

 ```bash
    php artisan db:seed
 ```

### **Controladors i CRUD**
  
1. Modifica el mètode `index`,`show`,`create`,`edit` i `destroy` del controlador per obtenir els equips des de la base de dades:

   ```php
   public function index() {
        $equips = Equip::all();
        return view('equips.index', compact('equips'));
    }

    public function show(Equip $equip) {
        return view('equips.show', compact('equip'));
    }

    public function create() {
        return view('equips.create');
    }

    public function edit(Equip $equip) {
        return view('equips.edit', compact('equip'));
    }

    public function destroy(Equip $equip) {
        $equip->delete();
        return redirect()->route('equips.index')->with('success', 'Equip esborrat correctament!');
    } 
   ```
 

### **Relacions entre Taules**

1. Anem a crear la migració, model i seeder per la taula `estadis` i vincular-la amb la taula `equips`.

```bash
php artisan make:migration create_estadis_table
php artisan make:migration add_estadi_id_to_equips_table
php artisan make:model Estadi
php artisan make:seeder EstadisSeeder
```

2. Modifica la migració `create_estadis_table` per incloure l'estructura de la taula `estadis`:

```php
public function up()
{
    Schema::create('estadis', function (Blueprint $table) {
        $table->id();
        $table->string('nom')->unique();
        $table->integer('capacitat');
        $table->timestamps();
    });
}
```

3. Modifica la migració `add_estadi_id_to_equips_table` per afegir la clau forana `estadi_id` a la taula `equips`:

```php
public function up()
{
    Schema::table('equips', function (Blueprint $table) {
        $table->dropColumn('estadi'); // Esborra el camp estadi
        $table->foreignId('estadi_id')->constrained(); // Afegir la clau forana
    });
 }

public function down()
{
    Schema::table('equips', function (Blueprint $table) {
        $table->string('estadi');
        $table->dropForeign(['estadi_id']);
        $table->dropColumn('estadi_id');
    });
}
```

4. Modifica el model `Equip` per definir la relació amb l'estadi:

```php
public function estadi()
{
    return $this->belongsTo(Estadi::class);
}
```

5. Modifica el model `Estadi` per definir la relació amb els equips:

```php
public function equips()
{
    return $this->hasMany(Equip::class);
}
```

6. Modifica el seeder `EstadisSeeder` per generar dades d'exemple per a la taula `estadis`:

```php
public function run()
{
    DB::table('estadis')->insert([
        ['nom' => 'Camp Nou', 'capacitat' => 99000],
        ['nom' => 'Wanda Metropolitano', 'capacitat' => 68000],
        ['nom' => 'Santiago Bernabéu', 'capacitat' => 81000],
    ]);
}
```

7. Afegeix el seeder `EstadisSeeder` al fitxer `DatabaseSeeder`:

```php
public function run()
{
    $this->call([
        EstadisSeeder::class,
        EquipsSeeder::class,
        
    ]);
}
```

8. Modifica el seeder `EquipsSeeder` per assignar equips a estadis existents:

```php
public function run()
{
    $estadi = Estadi::where('nom', 'Camp Nou')->first();
    $estadi->equips()->create([
        'nom' => 'Barça Femení',
        'titols' => 30,
    ]);
    $estadi = Estadi::where('nom', 'Wanda Metropolitano')->first();
    $estadi->equips()->create([
        'nom' => 'Atlètic de Madrid',
        'titols' => 10,
    ]);
    $estadi = Estadi::where('nom', 'Santiago Bernabéu')->first();
    $estadi->equips()->create([
        'nom' => 'Real Madrid Femení',
        'titols' => 5,
    ]);
 }
```

9. Executa els seeders per omplir les taules `equips` i `estadis` amb dades d'exemple:

```bash
php artisan migrate:fresh --seed 
```

10. Modifica la vista `equips.index` per mostrar l'estadi de cada equip:

```php
@foreach ($equips as $equip)
    <tr class="hover:bg-gray-100">
        <td class="border border-gray-300 p-2">
            <a href="{{ route('equips.show', $equip->id) }}" class="text-blue-700 hover:underline">{{ $equip->nom }}</a>
        </td>
        <td class="border border-gray-300 p-2">{{ $equip->estadi->nom }}</td>
        <td class="border border-gray-300 p-2">{{ $equip->titols }}</td>
        <td class="border border-gray-300 p-2 flex space-x-2">
            <a href="{{ route('equips.show', $equip->id) }}" class="text-green-600 hover:underline">Mostrar</a>
            <a href="{{ route('equips.edit', $equip->id) }}" class="text-yellow-600 hover:underline">Editar</a>
        </td>
    </tr>
@endforeach

```
11. Crea la vista `equips.create` per incloure un desplegable amb els estadis disponibles:

```php
<form action="{{ route('equips.store') }}" method="POST" class="bg-white p-6 rounded-lg shadow-md max-w-md mx-auto">
    @csrf
    <div class="mb-4">
        <label for="nom" class="block text-sm font-medium text-gray-700 mb-1">Nom:</label>
        <input type="text" name="nom" id="nom" required
            class="w-full border-gray-300 rounded-lg shadow-sm focus:ring-blue-500 focus:border-blue-500">
    </div>
    
    <div class="mb-4">
        <label for="titols" class="block text-sm font-medium text-gray-700 mb-1">Títols:</label>
        <input type="number" name="titols" id="titols" required
            class="w-full border-gray-300 rounded-lg shadow-sm focus:ring-blue-500 focus:border-blue-500">
    </div>
    
    <div class="mb-4">
        <label for="estadi_id" class="block text-sm font-medium text-gray-700 mb-1">Estadi:</label>
        <select name="estadi_id" id="estadi_id" required
            class="w-full border-gray-300 rounded-lg shadow-sm focus:ring-blue-500 focus:border-blue-500">
            @foreach ($estadis as $estadi)
                <option value="{{ $estadi->id }}">{{ $estadi->nom }}</option>
            @endforeach
        </select>
    </div>
    
    <button type="submit"
        class="w-full bg-blue-500 text-white font-medium py-2 px-4 rounded-lg shadow hover:bg-blue-600 focus:ring focus:ring-blue-300">
        Crear Equip
    </button>
</form>

```

**Cal modificar el controlador `EquipController` per obtenir els estadis disponibles.**

 
12. Crea el mètode store en el controlador EquipController per emmagatzemar un nou equip:

```php
public function store(Request $request) {
    $validated = $request->validate([
        'nom' => 'required|unique:equips',
        'estadi_id' => 'required|exists:estadis,id',
        'titols' => 'integer|min:0',
    ]);
    Equip::create($validated);
    return redirect()->route('equips.index')->with('success', 'Equip creat correctament!');
}
```
**Cal modificat el model `Equip` per permetre l'assignació massiva de l'estadi.**


13. Modifica la vista `equips.edit` per incloure un desplegable amb els estadis disponibles:

```php
<form action="{{ route('equips.update', $equip->id) }}" method="POST" class="bg-white p-6 rounded-lg shadow-md max-w-md mx-auto">
    @csrf
    @method('PUT')

    <div class="mb-4">
        <label for="nom" class="block text-sm font-medium text-gray-700 mb-1">Nom:</label>
        <input type="text" name="nom" id="nom" value="{{ old('nom', $equip->nom) }}" required
            class="w-full border-gray-300 rounded-lg shadow-sm focus:ring-blue-500 focus:border-blue-500 
            @error('nom') border-red-500 @enderror">
        @error('nom')
            <p class="text-red-500 text-sm mt-1">{{ $message }}</p>
        @enderror
    </div>

    <div class="mb-4">
        <label for="titols" class="block text-sm font-medium text-gray-700 mb-1">Títols:</label>
        <input type="number" name="titols" id="titols" value="{{ old('titols', $equip->titols) }}" required
            class="w-full border-gray-300 rounded-lg shadow-sm focus:ring-blue-500 focus:border-blue-500 
            @error('titols') border-red-500 @enderror">
        @error('titols')
            <p class="text-red-500 text-sm mt-1">{{ $message }}</p>
        @enderror
    </div>

    <div class="mb-4">
        <label for="estadi_id" class="block text-sm font-medium text-gray-700 mb-1">Estadi:</label>
        <select name="estadi_id" id="estadi_id" required
            class="w-full border-gray-300 rounded-lg shadow-sm focus:ring-blue-500 focus:border-blue-500 
            @error('estadi_id') border-red-500 @enderror">
            @foreach ($estadis as $estadi)
                <option value="{{ $estadi->id }}" {{ $estadi->id == $equip->estadi_id ? 'selected' : '' }}>
                    {{ $estadi->nom }}
                </option>
            @endforeach
        </select>
        @error('estadi_id')
            <p class="text-red-500 text-sm mt-1">{{ $message }}</p>
        @enderror
    </div>

    <button type="submit"
        class="w-full bg-blue-500 text-white font-medium py-2 px-4 rounded-lg shadow hover:bg-blue-600 focus:ring focus:ring-blue-300">
        Actualitzar Equip
    </button>
</form>

```

14. Crea el mètode update en el controlador EquipController per actualitzar un equip existent:

```php
public function update(Request $request, $id) {
    $validated = $request->validate([
        'nom' => 'required|unique:equips,nom,'.$id,
        'estadi_id' => 'required|exists:estadis,id',
        'titols' => 'integer|min:0',
    ]);
    $equip = Equip::findOrFail($id);
    $equip->update($validated);
    return redirect()->route('equips.index')->with('success', 'Equip actualitzat correctament!');
}
```

### **Afegir un escut a l'equip**

1. Crea una migració per afegir un camp `escut` a la taula `equips`:

```bash
php artisan make:migration add_escut_to_equips_table
```

2. Modifica la migració `add_escut_to_equips_table` per incloure el camp `escut`:

```php
public function up()
{
    Schema::table('equips', function (Blueprint $table) {
        $table->string('escut')->nullable();
    });
}
public function down()
{
    Schema::table('equips', function (Blueprint $table) {
        $table->dropColumn('escut');
    });
}
```   

3. Aplicar la migració

```bash
php artisan migrate
```   

4. Modifica el model `Equip` per incloure el camp `escut`:

```php
protected $fillable = ['nom', 'estadi_id', 'titols', 'escut'];
```

5. Modifica la vista `equips.create` per incloure un camp d'arxiu per pujar l'escut de l'equip:

```php
<div class="mb-4">
    <label for="escut" class="block text-sm font-medium text-gray-700 mb-1">Escut:</label>
    <input type="file" name="escut" id="escut"
        class="w-full border-gray-300 rounded-lg shadow-sm focus:ring-blue-500 focus:border-blue-500">
</div>
```

6. Modifica la vista `equips.edit` per incloure un camp d'arxiu per actualitzar l'escut de l'equip:

```php
<div class="mb-4">
    <label for="escut" class="block text-sm font-medium text-gray-700 mb-1">Escut:</label>
    <input type="file" name="escut" id="escut" 
        class="w-full border-gray-300 rounded-lg shadow-sm focus:ring-blue-500 focus:border-blue-500">
    @if ($equip->escut)
        <p class="mt-2 text-sm text-gray-500">Escut actual:</p>
        <img src="{{ asset('storage/' . $equip->escut) }}" alt="Escut de {{ $equip->nom }}" class="h-16 mt-2">
    @endif
</div>
```

7. Afegeix enctype="multipart/form-data" al dos formularis:

```html
<form action="{{ route('equips.store') }}" method="POST" enctype="multipart/form-data">
```

8. Crea un enllaç simbòlic a la carpeta storage

```bash
php artisan storage:link
```

9. Actualitza el mètode store del controlador

```php
public function store(Request $request)
{
    $validated = $request->validate([
        'nom' => 'required|unique:equips',
        'titols' => 'integer|min:0',
        'estadi_id' => 'required|exists:estadis,id',
        'escut' => 'nullable|image|mimes:jpeg,png,jpg|max:2048', // Validació del fitxer
    ]);

    if ($request->hasFile('escut')) {
        $path = $request->file('escut')->store('escuts', 'public');
        $validated['escut'] = $path;
    }

    Equip::create($validated);

    return redirect()->route('equips.index')->with('success', 'Equip creat correctament!');
}

``` 

10. Actualitza el mètode update del controlador

```php
public function update(Request $request, $id)
{
    $validated = $request->validate([
        'nom' => 'required|unique:equips,nom,' . $id,
        'titols' => 'integer|min:0',
        'estadi_id' => 'required|exists:estadis,id',
        'escut' => 'nullable|image|mimes:jpeg,png,jpg|max:2048',
    ]);

    $equip = Equip::findOrFail($id);

    if ($request->hasFile('escut')) {
        if ($equip->escut) {
            Storage::disk('public')->delete($equip->escut); // Esborra l'escut antic
        }
        $path = $request->file('escut')->store('escuts', 'public');
        $validated['escut'] = $path;
    }

    $equip->update($validated);

    return redirect()->route('equips.index')->with('success', 'Equip actualitzat correctament!');
}
```

11. Crea el mètode delete per esborrar l'escut de l'equip:

```php
public function delete(Equip $equip)
{
    if ($equip->escut) {
        Storage::disk('public')->delete($equip->escut);
    }
    $equip->delete();
    return redirect()->route('equips.index')->with('success', 'Equip esborrat correctament!');
}
```

12. Modificat el component de la vista `equips.show` per mostrar l'escut de l'equip:

```php
<div class="equip border rounded-lg shadow-md p-4 bg-white">
      @if ($escut)
          <td class="border border-gray-300 p-2">
              <img src="{{ asset('storage/' . $escut) }}" alt="Escut de {{ $nom }}" class="h-8 w-8 object-cover rounded-full">
          </td>
      @endif
    <h2 class="text-xl font-bold text-blue-800">{{ $nom }}</h2>
    <p><strong>Estadi:</strong> {{ $estadi }}</p>
    <p><strong>Títols:</strong> {{ $titols }}</p>
</div>
```
 
### **Utilitzar Factories per a Dades d'Exemple**

1. Crea un factory per a la taula `equips`:

```bash
php artisan make:factory EquipFactory --model=Equip
```

2. Modifica el factory `EquipFactory` per generar dades aleatòries:

```php
public function definition()
{
       return [
           'nom' => $this->faker->unique()->company,
           'titols' => $this->faker->numberBetween(0, 50),
           'estadi_id' => \App\Models\Estadi::factory(),
           'escut' => 'escuts/dummy.png', // Imatge de prova predefinida
        ];
    }
}
``` 

3. Actualitza el seeder `EquipsSeeder` per utilitzar el factory:

```php
public function run()
{
    ...
    Equip::factory()->count(10)->create();
}
```

4. Modifica el model `Equip` per permetre els factories:

```php
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Estadi extends Model
{
    use HasFactory;
 ...  
}
```

5. Crea el factory per a la taula `estadis`:

```bash
php artisan make:factory EstadiFactory --model=Estadi
```

6. Modifica el factory `EstadiFactory` per generar dades aleatòries:

```php
public function definition()
{
    return [
        'nom' => $this->faker->unique()->city.' Stadium',
        'capacitat' => $this->faker->numberBetween(10000, 100000),
    ];
}
```
 
4. Executa els seeders per omplir la taula `equips` amb dades generades pel factory:

```bash
php artisan migrate:fresh --seed
```   
 



## **Qüestions per Reflexió**

1. **Migracions:** Quins avantatges té utilitzar migracions per gestionar l'esquema de la base de dades?
2. **Relacions:** Com gestionaries les relacions many-to-many (per exemple, entre equips i partits)?
3. **Blade i Components:** Quins beneficis aporta l'ús de components Blade en formularis complexos?


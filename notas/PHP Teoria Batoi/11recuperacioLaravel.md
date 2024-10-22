# Sistema de Gestió Torns de Preguntes i Respostes per a l'Aula

Per aquest exercici, proposem el desenvolupament d'un sistema de gestió de preguntes i respostes per a l'aula, utilitzant Laravel. Aquest sistema permetrà als alumnes llançar preguntes al professor, qui les podrà gestionar i respondre en ordre. Anem a detallar els passos a seguir per a la implementació d'aquest projecte.

## Objectius
Crear un sistema on els alumnes puguin registrar-se, iniciar sessió, i enviar preguntes al professor.
El professor pot veure les preguntes ordenades per data de creació, respondre-les, i gestionar-les.
Les respostes del professor es guardaran juntament amb les preguntes per a futures consultes.

## Requisits


### Instal·lacio amb docker (laravel sail)

Si ja esteu desenvolupant Linux i Docker Compose està instal·lat, podeu utilitzar una senzilla ordre de terminal per a crear un nou projecte Laravel. Per exemple, per a crear una nova aplicació Laravel en un directori anomenat "exemple-app", podeu executar l'ordre següent al terminal:

curl -s https://laravel.build/tornsAula | bash

Cal modificar el .env inclou la configuració de la base de dades:

Ara podeu navegar al directori de l'aplicació i iniciar Laravel Sail. Laravel Sail proporciona una interfície senzilla de línia d'ordres per a interactuar amb la configuració predeterminada de l'acoblador Laravel:
```php
cd tornsAula && ./vendor/bin/sail up &
```

Un cop iniciats els contenidors Docker de l'aplicació, podeu accedir a l'aplicació al vostre navegador web a: http://localhost.

Per a executar una terminal en el contenidor haurem d'executar:

```php
./vendor/bin/sail bash
```

I per a inicialitzar la base de dades des de dins del contenidor:

```php
./vendor/bin/sail artisan migrate
```

#### phpmyadmin

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

### Autenticació

Utilitza Laravel Breeze, per a generar la funcionalitat d'autenticació.

```php
composer require laravel/breeze --dev
php artisan breeze:install
php artisan migrate
```

```code
npm install
npm run dev
```

#### Model de Dades i migracions

##### Users

Ja tindrem la migració d'usuaris per defecte amb Laravel. Serà necessari afegir camps addicionals com rol per distingir entre alumnes (ROL_ALUMNO) i professors(ROL_PROFESOR).

##### Mòduls

Crearem un nou model **Module** amb la seva migració per a representar els diferents mòduls del curs.

```
php artisan make:model Module -m
```
Exemple de creació de la taula Moduls:
```php
Schema::create('modules', function (Blueprint $table) {
    $table->id();
    $table->string('name');
    $table->text('description')->nullable();
    $table->timestamps();
});
```

##### Preguntes
Crearem el model **Question** amb una migració que incloga una clau forània cap a users i una altra cap a moduls.

##### Respostes
El model **Answer** necessitarà una migració amb una clau forània cap a preguntes.

#### Seeders i Factories

Per a poblar la base de dades amb dades de prova, utilitzarem seeders i factories.

Per a cada model (User, Module, Question, Answer), crea un factory amb dades fictícies.

```php
// Exemple de comanda per crear un factory
php artisan make:factory ModuleFactory --model=Modul
```

Defineix les dades fictícies dins de cada factory utilitzant la llibreria Faker.


Crea un seeder per a cada model. Aquests seeders utilitzaran els factories per a generar dades.

```php
php artisan make:seeder ModulesTableSeeder
```

En el seeder, especifica quantes instàncies de cada model vols crear.

```php
// Exemple d'ús d'un factory dins d'un seeder
Module::factory()->count(5)->create();
```

Registra els Seeders en el fitxer DatabaseSeeder.php per a poder executar-los tots junts.

```php
// Exemple de crida a un seeder des de DatabaseSeeder.php
$this->call(ModulesTableSeeder::class);
```

Executa els seeders per a poblar la base de dades amb dades fictícies.

```php  
php artisan db:seed
```


Crea els models necessaris per a l'aplicació: Pregunta i Resposta.
Pregunta ha de tenir com a mínim els camps: id, titol, descripció, user_id (creador), creat_a, i actualitzat_a.
Resposta ha de tenir com a mínim els camps: id, pregunta_id, contingut, creat_a, i actualitzat_a.

#### Rutes i Controladors

Defineix les rutes necessàries per a gestionar les preguntes i respostes.
Crea controladors per a gestionar la lògica d'usuari, preguntes i respostes.

#### Vistes

Crea vistes per a: registrar-se, iniciar sessió, llistar preguntes, veure detalls de preguntes, i respondre preguntes.
Utilitza Blade per a desenvolupar les teves vistes.

#### Validació

Afegeix validació als formularis per a assegurar que les dades entrades són correctes.

##### Funcionalitats Extra

Implementa un sistema de cua per a gestionar les preguntes que s'envien.
Afegeix la possibilitat de notificar al alumne quan la seva pregunta ha estat responduda.
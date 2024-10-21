
## 4. Login & Password
![[imagenes/06/06-login-password.gif]]
Per a manejar un sistema complet de login i password amb contrasenyes xifrades, necessitem un mètode que xifre aqueixos *strings* que l'usuari introdueix com a contrasenya; tant en el formulari de registre com en el del *login*, ja que en codificar una contrasenya, després hem de descodificar-la per a comprovar que totes dues *contrasenyes (la que introdueix l'usuari en el login i la que tenim en la base de dades) coincidisquen.

Necessitem doncs:

- `password_hash()` per a emmagatzemar la contrasenya en la base de dades a l'hora de fer el *INSERT*
- `PASSWORD_DEFAULT` emmagatzemem la contrasenya usant el mètode d'encriptació bcrypt

- `PASSWORD_BCRYPT` emmagatzemem la contrasenya usant l'algorisme CRYPT_BLOWFISH compatible amb crypt()

- `password_verify()` per a verificar l'usuari i la contrasenya

``` php
<?php
    //  ▒▒▒▒▒▒▒▒ Almacenando usuario y password en BD ▒▒▒▒▒▒▒▒

    $usu = $_POST["usuario"];
    $pas = $_POST["password"];

    $sql = "INSERT INTO usuarios(usuario, password) VALUES (:usuario, :password)";

    $sentencia = $conexion -> prepare($sql);

    $isOk = $sentencia -> execute([
        "usuario" => $usu,
        "password" => password_hash($pas,PASSWORD_DEFAULT)
    ]);
```

Ara que tenim l'usuari codificat i guardat en la base de dades, el recuperarem per a poder loguejar-lo correctament.
``` php
<?php
    //  ▒▒▒▒▒▒▒▒ Recuperando usuario y password en BD ▒▒▒▒▒▒▒▒

    $usu = $_POST["login"] ?? "";

    $sql = "select * from usuarios where usuario = ?";

    $sentencia = $conexion -> prepare($sql);
    $sentencia -> execute([$usu]);

    $usuario = $sentencia -> fetch();

    if($usuario && password_verify($_POST['pass'], $usuario['password'])) {
        echo"OK!";
    } else {
        echo"KO";
    }
```

## 5. QueryBuilder

Un Query Builder (Constructor de Consultes) és una eina o classe que facilita la creació, execució i manipulació de consultes SQL en un programa. L'objectiu principal és proporcionar una interfície més intuïtiva i segura per interactuar amb bases de dades, sense haver d'escriure consultes SQL en brut.

A continuació, detallo algunes de les principals avantatges i característiques d'un Query Builder com el que has compartit anteriorment:

* 1. Abstracció de la Base de Dades:
    - El Query Builder proporciona una capa d'abstracció que permet interactuar amb diferents tipus de bases de dades (MySQL, PostgreSQL, SQLite, etc.) sense canviar el codi de la teva aplicació. Això facilita la portabilitat i l'escalabilitat del codi.

* 2. Seguretat:
    - Prevé injeccions SQL: Gràcies a l'ús de sentències preparades i enllaçament de paràmetres, el Query Builder ajuda a prevenir atacs d'injecció SQL, una de les amenaces més comunes en desenvolupament web.

* 3. Sintaxi Més Neta i Més Fàcil:
    - Els Query Builders solen proporcionar una sintaxi més neta i fàcil d'entendre que les cadenes SQL pures. Això fa que el codi sigui més llegible i fàcil de mantenir.

* 4. Reutilització de Codi:
    - Les funcions del Query Builder es poden reutilitzar a tot el projecte, reduint la duplicació de codi i facilitant el manteniment.

* 5. Flexibilitat:
    - Permet realitzar consultes complexes amb una sintaxi simplificada, facilitant l'adaptació del codi a canvis en els requeriments de l'aplicació.

* 6. Desenvolupament Més Ràpid:
    - Ajuda a accelerar el procés de desenvolupament, ja que els desenvolupadors no necessiten recordar la sintaxi SQL exacta per a cada tipus de base de dades.

* 7. Fàcil de Depurar:
    - El codi generat pel Query Builder és més fàcil de depurar en comparació amb les llargues cadenes SQL.

* 8. Suport per a Operacions CRUD:
    - Els Query Builders solen incloure suport integrat per a operacions CRUD (Crear, Llegir, Actualitzar, Esborrar), fent més fàcil la manipulació de dades.

En resum, un Query Builder serveix per simplificar la interacció amb bases de dades, proporcionant una interfície més segura, neta i fàcil d'utilitzar que les cadenes SQL pures. Ajuda a accelerar el desenvolupament, facilita el manteniment i millora la seguretat de l'aplicació.
Ací en tenim un exemple de construcció casera:

```php
<?php

namespace BatBook;

use PDO;

class QueryBuilder
{
    // Aquesta funció serveix per a construir i executar consultes SQL de tipus SELECT.
    // Es pot filtrar per valors, limitar la quantitat de resultats i establir un offset.
    public static function sql($class, $values=null, $limit = null, $offset = null)
    {
        // Obté el nom de la taula a partir de la propietat estàtica $nameTable de la classe passada com argument.
        $table = $class::$nameTable;
        
        // Obté una connexió a la base de dades.
        $conn = Connection::get();
        
        // Construeix la consulta SQL bàsica.
        $sql = "SELECT * FROM $table";
        
        // Afegeix condicions WHERE si es proporcionen valors per a filtrar.
        if ($values) {
            $sql .= " WHERE ";
            foreach (array_keys($values) as $key => $id) {
                if ($key != 0) {
                    $sql .= " AND $id=:$id";
                } else {
                    $sql .= "$id=:$id";
                }
            }
        }
        
        // Afegeix les clàusules LIMIT i OFFSET si són necessàries.
        if (isset($limit) && isset($offset)) {
            $sql .= " LIMIT $limit OFFSET $offset";
        }
        
        // Prepara la sentència SQL.
        $sentence = $conn->prepare($sql);
        
        // Enllaça els valors a la sentència.
        foreach ($values??[] as $key => $value) {
            $sentence->bindValue(":$key", $value);
        }
        
        // Estableix el mode de recuperació a objectes de la classe especificada.
        $sentence -> setFetchMode(PDO::FETCH_CLASS | PDO::FETCH_PROPS_LATE , $class);
        
        // Executa la consulta.
        $sentence -> execute();
        
        // Retorna tots els resultats obtinguts.
        return  $sentence->fetchAll();
    }

    // Aquesta funció serveix per a trobar una fila en una taula basant-se en el seu ID.
    public static function find($class, $id)
    {
        //TODO
    }

    // Aquesta funció serveix per a insertar una fila en una taula.
    public static function insert($class, $values)
    {
        $table = $class::$nameTable;
        $conn = Connection::get();
        $sql = "INSERT INTO $table (";
        foreach (array_keys($values) as $key => $id) {
            if ($key != 0) {
                $sql .= ','.$id;
            } else {
                $sql .= $id;
            }
        }
        $sql .= ") VALUES (";
        foreach (array_keys($values) as $key => $id) {
            if ($key != 0) {
                $sql .= ',:'.$id;
            } else {
                $sql .= ':'.$id;
            }
        }
        $sql .= ")";
        $sentence = $conn->prepare($sql);
        foreach ($values as $key => $value) {
            $sentence->bindValue(":$key", $value);
        }
        $sentence -> execute();
        return $conn->lastInsertId();
    }

    // Aquesta funció serveix per a actualitzar una fila en una taula.
    public static function update($class, $values, $id)
    {
        $table = $class::$nameTable;
        $conn = Connection::get();
        $sql = "UPDATE $table SET ";
        foreach (array_keys($values) as $key => $value) {
            if ($key != 0) {
                $sql .= ','.$value.'=:'.$value;
            } else {
                $sql .= $value.'=:'.$value;
            }
        }
        $sql .= " WHERE id=:id";
        $sentence = $conn->prepare($sql);
        foreach ($values as $key => $value) {
            $sentence->bindValue(":$key", $value);
        }
        $sentence->bindValue(":id", $id);  
        $sentence -> execute();
        return $id;
    }

    // Aquesta funció serveix per a eliminar una fila en una taula basant-se en el seu ID.
    public static function delete($class, $id)
    {
        //TODO
    }
}
```

En resum, aquesta classe proporciona funcions estàtiques per a la construcció i execució de consultes SQL bàsiques com SELECT, INSERT, UPDATE, i DELETE. Utilitza l'extensió PDO per a la connexió a bases de dades i la preparació de sentències SQL, la qual cosa ajuda a prevenir injeccions SQL. També permet la manipulació fàcil de files en bases de dades, tot retornant objectes de la classe especificada.

### Respotes d'error

Quan no trebem un recurs en al nostra web, podem mostrar a l'usuari una pàgina específica d'error utilitzant la funció header. Una típica seria:

```php
<!-- not-found.php -->
<?php http_response_code(404); ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>No trobat</title>
</head>
<body>
    <h1>404 - Pàgina no trobada</h1>
    <p>Ho sentim, la pàgina que estàs buscant no s'ha pogut trobar.</p>
    <a href="index.php">Torna a l'inici</a>
</body>
</html>
```

I per a utilitzar-la:

```php
<?php
header("Location: not-found.php");
exit;
?>

```

## 6. Accès a fitxers

Gràcies a la funció fopen() des de PHP podem obrir arxius que es troben en els nostres servidor o una URL.

A aquesta funció cal passar-li 2 paràmetres; el nom de l'arxiu que volem obrir i la manera en què s'obrirà

``` php
$fp = fopen("miarchivo.txt", "r");
```

Moltes vegades no podem obrir l'arxiu perquè aquest no es troba o no tenim accés a ell, per això és recomanable comprovar que podem fer-ho

``` php
if (!$fp = fopen("miarchivo.txt", "r")){
    echo "No se ha podido abrir el archivo";
}
```

### Maneres d'obertura de fitxers

- `r`: Manera lectura. Punter al principi de l'arxiu.
- `r+`: Obertura per a lectura i escriptura. Punter al principi de l'arxiu
- `w`: Obertura per a escriptura. Punter al principi de l'arxiu i el sobreescriu. Si no existeix s'intenta crear.
- `w+`: Obertura per a lectura i escriptura. Punter al principi de l'arxiu i el sobreescriu. Si no existeix s'intenta crear.
- `a`: Obertura per a escriptura. Punter al final de l'arxiu. Si no existeix s'intenta crear.
- `a+`: Obertura per a lectura i escriptura. Punter al final de l'arxiu. Si no existeix s'intenta crear.
- `x`: Creació i obertura per a només escriptura. Punter al principi de l'arxiu. Si l'arxiu ja existeix donarà error E_*WARNING. Si no existeix s'intenta crear.
- `x+`: Creació i obertura per a lectura i escriptura. Mateix comportament que x.
- `c`: Obertura per a escriptura. Si no existeix es crea. Si existeix no se sobreescriu ni dona cap error. Punter al principi de l'arxiu.
- `c+`: Obertura per a lectura i escriptura. Mateix comportament que C.
- `b`: Quan es treballa amb arxius binaris com *jpg, pdf, *png i altres. Se sol col·locar al final de la manera, és a dir *rb, r+b, x+b, *wb...

### Operacions amb arxius

Per a poder **llegir** un arxiu necessitem usar la funció *fread()* de *PHP*

```php
//  ▒▒▒▒▒▒▒▒ Abriendo un archivo y leyendo su contenido ▒▒▒▒▒▒▒▒

$file = "miarchivo.txt";
$fp = fopen($file, "r");

// filesize() nos devuelve el tamaño del archivo en cuestión
$contents = fread($fp, filesize($file));

// Cerramos la conexión con el archivo
fclose();
```

Si el que volem és **escriure** en un arxiu, haurem de fer ús de la funció *fwrite()*

```php
//  ▒▒▒▒▒▒▒▒ Escribiendo en un archivo ▒▒▒▒▒▒▒▒

$file = "miarchivo.txt";
$texto = "Hola que tal";

$fp = fopen($file, "w");

fwrite($fp, $texto);
fclose($fp);
```

### Informació d'un fitxer

Amb PHP i el seu mètode *stat()* podem obtindre informació sobre els arxius que li indiquem. Aquest mètode retorna fins a un total de 12 elements amb *informació* sobre el nostre arxiu.

0.	*dev*	 número de dispositiu
1.	*ino*	 número d'i-node
2.	*mode*	 manera de protecció de l'i-node
3.	*nlink*	 nombre d'enllaços
4.	*uid*	 ID d'usuari del propietari
5.	*gid*	 ID de grup del propietari
6.	*rdev*	 tipus de dispositiu, si és un dispositiu i-node
7.	*size*	 grandària en bytes
8.	*atime*	 moment de l'últim accés (temps Unix)
9.	*mtime*	 moment de l'última modificació (temps Unix)
10.	*ctime*	 moment de l'última modificació de l'i-node (temps Unix)
11.	*blksize*	 grandària del bloc E/S del sistema de fitxers
12.	*blocks*	 nombre de blocs de 512 bytes assignats

Uns exemples...

``` php
<?php

//  ▒▒▒▒▒▒▒▒ Información del archivo ▒▒▒▒▒▒▒▒

$file = "miarchivo.txt";
$texto = "Todos somos muy ignorantes, lo que ocurre es que no todos ignoramos las mismas cosas.";

$fp = fopen($file, "w");
fwrite($fp, $texto);

$datos = stat($file);

echo $datos[3] . "<br>"; // Número de enlaces, 1
echo $datos[7] . "<br>"; // Tamaño en bytes, 85
echo $datos[8] . "<br>"; // Momento de último acceso, 1444138104
echo $datos[9] . "<br>"; // Momento de última modificación, 1444138251

?>
```

Dona una ullada a [les funcions de directoris](https://www.php.net/manual/es/book.dir.php) que té **PHP**, és molt interessant.

## 7. Web Scraping 

Consisteix a navegar a una pàgina web i extraure informació automàticament, a partir del codi HTML generat, i organitzar la informació pública disponible en Internet.
Aquesta pràctica requereix l'ús d'una llibreria que facilite la descàrrega de la informació desitjada imitant la interacció d'un navegador web. Aquest "robot" pot accedir a diverses pàgines simultàniament.

!!! question "¿És legal?"
Si el lloc web indica que té el contingut protegit per drets d'autor o en les normes d'accés via usuari/contrasenya ens avisa de la seua prohibició, estaríem incorrent en un delicte.
És recomanable estudiar l'arxiu `robots.txt` que es troba en l'arrel de cada lloc web.
Més informació en l'article [El manual complet per al web scraping legal i ètic en 2021](https://ichi.pro/es/el-manual-completo-para-el-web-scraping-legal-y-etico-en-2021-69178542830388)

### Goutte

[Goutte](https://github.com/FriendsOfPHP/Goutte) és un senzill client HTTP per a PHP creat específicament per a fer web scraping. Ho va desenvolupar el mateix autor del framework *Symfony* i ofereix un API senzilla per a extraure dades de les respostes HTML/XML dels llocs web.

Els components principals que abstrau *Goutte* sobre *Symfony* són:

* `BrowserKit`: simula el comportament d'un navegador web.
* `CssSelector`: tradueix consultes CSS en consultes XPath.
* `DomCrawler`: facilita l'ús del DOM i XPath.

Per a poder utilitzar *Goutte* en el nostre projecte, executarem el següent comando en el terminal:

``` bash
composer require fabpot/goutte
```

### Goutte con selectores CSS

A continuació farem un exemple molt senzill utilitzant els selectors CSS, extraient informació de la web `https://books.toscrape.com/`, la qual és una pàgina per a proves que no rebutjarà les nostres peticions.

Després de crear un client amb *Goutte*, hem de realitzar un petició a una URL. Amb la resposta obtinguda, podem utilitzar el mètode `filter` per a indicar-li la ruta CSS que volem recórrer i iterar sobre els resultats mitjançant una funció anònima. Una vegada estem dins d'un determinat node, el mètode `text()` ens retornarà el contingut del propi node.

En concret, ficarem en un array associatiu el títol i el preu de tots els llibres de la categoria *Classics*.

``` php
<?php
require '../vendor/autoload.php';

$httpClient = new \Goutte\Client();
$response = $httpClient->request('GET', 'https://books.toscrape.com/catalogue/category/books/classics_6/index.html');
// colocamos los precios en un array
$precios = [];
$response->filter('.row li article div.product_price p.price_color')->each(
    // le pasamos $precios por referencia para poder editarla dentro del closure
    function ($node) use (&$precios) {
        $precios[] = $node->text();
    }
);

// colocamos el nombre y el precio en un array asociativo
$contadorPrecios = 0;
$libros = [];
$response->filter('.row li article h3 a')->each(
    function ($node) use ($precios, &$contadorPrecios, &$libros) {
        $libros[$node->text()] = $precios[$contadorPrecios];
        $contadorPrecios++;
    }
);
```

### Crawler

Un cas molt comú és obtindre la informació d'una pàgina que té els resultats paginados, de manera que anem recorrent els enllaços i accedint a cadascun dels resultats.

En aquest cas agafarem tots els preus dels llibres de fantasia, i els sumarem:

``` php
<?php
require '../vendor/autoload.php';

use Goutte\Client;
use Symfony\Component\HttpClient\HttpClient;

$client = new Client(HttpClient::create(['timeout' => 60]));
$crawler = $client->request('GET', 'https://books.toscrape.com/catalogue/category/books/fantasy_19/index.html');

$salir = false;

$precios = [];
while (!$salir) {
    $crawler->filter('.row li article div.product_price p.price_color')->each(
        function ($node) use (&$precios) {
            $texto = $node->text();
            $cantidad = substr($texto, 2); // Le quitamos las libras ¿2 posiciones?
            $precios[] = floatval($cantidad);
        }
    );

    $enlace = $crawler->selectLink('next');
    if ($enlace->count() != 0) {
        // el enlace next existe
        $sigPag = $crawler->selectLink('next')->link();
        $crawler = $client->click($sigPag); // hacemos click
    } else {
        // ya no hay enlace next
        $salir = true;
    }
}

$precioTotal = array_sum($precios);
echo $precioTotal;
```


## 8. Exercisis

### Bateria d'exercicis solucionats 
 
##### Exercici 1. Connexió bàsica

1. Crea un fitxer PHP que faça una connexió a una base de dades MySQL utilitzant PDO.


<summary>Solució</summary>

``` php
<?php
try {
    $dsn = 'mysql:host=localhost;dbname=test';
    $usuari = 'usuari';
    $contrasenya = 'contrasenya';
    $pdo = new PDO($dsn, $usuari, $contrasenya);
    echo "Connexió establerta!";
} catch (PDOException $e) {
    echo "Error de connexió: " . $e->getMessage();
}
 
```



##### Exercici 2. Inserir un registre

1. Escriu una funció que insereixi un nou usuari a la taula `users` amb el nom i correu electrònic passats per paràmetre.


<summary>Solució</summary>

``` php
<?php
function inserirUsuari($nom, $correu) {
    global $pdo;
    $sql = "INSERT INTO users (nom, correu) VALUES (:nom, :correu)";
    $stmt = $pdo->prepare($sql);
    $stmt->bindParam(':nom', $nom);
    $stmt->bindParam(':correu', $
    echo "Usuari inserit!";
}
```



##### Exericici 3. Recuperar dades
 
1. Fes una consulta SQL que mostri tots els usuaris registrats a la taula `users` i mostra'ls en una taula HTML.


<summary>Solució</summary>

``` php
<?php
function mostrarUsuaris() {
    global $pdo;
    $sql = "SELECT * FROM users";
    $stmt = $pdo->query($sql);
    echo "<table>";
    while ($fila = $stmt->fetch(PDO::FETCH_ASSOC)) {
        echo "<tr><td>{$fila['nom']}</td><td>{$fila['correu']}</td></tr>";
    }
    echo "</table>";
}
```



##### Exercici 4. Actualitzar dades

1. Escriu una funció que actualitzi el correu electrònic d'un usuari segons el seu identificador (`id`).


<summary>Solució</summary>

``` php
<?php
function actualitzarCorreu($id, $nouCorreu) {
    global $pdo;
    $sql = "UPDATE users SET correu = :correu WHERE id = :id";
    $stmt = $pdo->prepare($sql);
    $stmt->execute([':correu' => $nouCorreu, ':id' => $id]);
    echo "Correu actualitzat!";
}
```



##### Exercici 5. Eliminar un registre

1. Implementa un script que esborri un usuari per identificador (`id`).


<summary>Solució</summary>

``` php
<?php
function eliminarUsuari($id) {
    global $pdo;
    $sql = "DELETE FROM users WHERE id = :id";
    $stmt = $pdo->prepare($sql);
    $stmt->execute([':id' => $id]);
    echo "Usuari eliminat!";
}
```


##### Exercici 6. Ús de sentències preparades

1. Refactoritza els exercicis anteriors per utilitzar sentències preparades per evitar injecció SQL.


<summary>Solució</summary>

``` php
<?php
function inserirAmbPreparada($nom, $correu) {
    global $pdo;
    $sql = "INSERT INTO users (nom, correu) VALUES (:nom, :correu)";
    $stmt = $pdo->prepare($sql);
    $stmt->bindParam(':nom', $nom);
    $stmt->bindParam(':correu', $correu);
    $stmt->execute();
    echo "Usuari inserit amb sentència preparada!";
}
```



##### Exercici 7. Tractament d'errors

1. Modifica el codi anterior per gestionar els errors amb `try-catch` i mostrar missatges d'error clars.


<summary>Solució</summary>

``` php
<?php
 try {
    actualitzarCorreu(5, 'noucorreu@example.com');
} catch (PDOException $e) {
    echo "Error en actualitzar: " . $e->getMessage();
}
```


##### Exercici 8. Ús de Query Builder

1. Utilitza un Query Builder per fer consultes a la base de dades de manera més fàcil i segura sense escriure SQL explícitament.


<summary>Solució</summary>

``` php
<?php
#  Ús de Query Builder (amb Laravel com a exemple)
use Illuminate\Support\Facades\DB;

function obtenirUsuaris() {
    $usuaris = DB::table('users')->get();
    foreach ($usuaris as $usuari) {
        echo $usuari->nom . ' - ' . $usuari->correu . "<br>";
    }
}
```
##### Exercici 9. Tractament de fitxers

1. Crea un script que llegeixi un fitxer CSV i insereixi les dades en una taula de la base de dades.


<summary>Solució</summary>

``` php
<?php
 
function llegirCSV($fitxerCSV) {
    global $pdo;
    if (($gestor = fopen($fitxerCSV, "r")) !== FALSE) {
        while (($dades = fgetcsv($gestor, 1000, ",")) !== FALSE) {
            $sql = "INSERT INTO users (nom, correu) VALUES (:nom, :correu)";
            $stmt = $pdo->prepare($sql);
            $stmt->execute([':nom' => $dades[0], ':correu' => $dades[1]]);
        }
        fclose($gestor);
        echo "Dades inserides des del CSV!";
    }
}

```



##### Exercici 10. Web Scraping

1. Utilitza Goutte per a fer web scraping a la pàgina `https://books.toscrape.com/` i extreu el títol i preu de tots els llibres de la categoria `Classics`.
2. Mostra els resultats en una taula HTML.
3. Suma tots els preus i mostra el preu total.
4. Modifica el codi per a recórrer totes les pàgines de resultats.
  

<summary>Solució</summary>
    
``` php    
<?php
     require '../vendor/autoload.php';
     
     
     use Goutte\Client;
     use Symfony\Component\HttpClient\HttpClient;
     
     $client = new Client(HttpClient::create(['timeout' => 60]));
     $crawler = $client->request('GET', 'https://books.toscrape.com/catalogue/category/books/classics_6/index.html');
     
     $salir = false;
     
     $precios = [];
     while (!$salir) {
         $crawler->filter('.row li article div.product_price p.price_color')->each(
             function ($node) use (&$precios) {
                 $texto = $node->text();
                 $cantidad = substr($texto, 2); // Le quitamos las libras ¿2 posiciones?
                 $precios[] = floatval($cantidad);
             }
         );
     
         $enlace = $crawler->selectLink('next');
         if ($enlace->count() != 0) {
             // el enlace next existe
             $sigPag = $crawler->selectLink('next')->link();
             $crawler = $client->click($sigPag); // hacemos click
         } else {
             // ya no hay enlace next
             $salir = true;
         }
     }    
     
     $precioTotal = array_sum($precios);
     echo $precioTotal;
```


 
### Exercicis proposats

#### Exercici 1: Creació d'una base de dades

1. **Descripció:**
   Crea una base de dades amb una taula `empleats` que tinga els camps `id`, `nom`, `cognom` i `sou`.

2. **Requisits:**
    - Crear la base de dades i la taula.
    - Definir els tipus de dades adequats per als camps.

#### Exercici 2: Llistat d'empleats

1. **Descripció:**
   Crea un script PHP que mostre tots els empleats de la taula `empleats` en una taula HTML.

2. **Requisits:**
    - Connectar-se a la base de dades.
    - Recuperar els empleats i mostrar-los en una taula HTML.

#### Exercici 3: Formulari per a afegir empleats

1. **Descripció:**
   Afegeix un formulari HTML que permeta afegir nous empleats a la taula `empleats`.

2. **Requisits:**
    - Crear un formulari per a introduir el `nom`, `cognom` i `sou` de l'empleat.
    - Crear un script PHP per a gestionar la inserció de nous empleats en la taula.

#### Exercici 4: Formulari per a actualitzar el sou d'un empleat

1. **Descripció:**
   Afegeix un formulari per a modificar el sou d'un empleat existent.

2. **Requisits:**
    - Crear un formulari per a seleccionar l'empleat i introduir el nou sou.
    - Escriure un script PHP per a actualitzar el sou en la base de dades.

#### Exercici 5: Formulari per a eliminar un empleat

1. **Descripció:**
   Afegeix un formulari per a eliminar un empleat de la taula `empleats`.

2. **Requisits:**
    - Crear un formulari per a seleccionar l'empleat a eliminar.
    - Escriure un script PHP per a eliminar l'empleat de la base de dades.

#### Exercici 6: Creació de la classe `Empleat`

1. **Descripció:**
   Crea una classe `Empleat` en PHP amb els atributs `id`, `nom`, `cognom` i `sou` i utilitza-la per a representar els empleats.

2. **Requisits:**
    - Definir la classe `Empleat` amb els seus atributs.
    - Modificar els exercicis anteriors per a utilitzar aquesta classe en lloc de variables simples.

#### Exercici 7: Ús d'un Query Builder

1. **Descripció:**
   Modifica els exercicis anteriors per a utilitzar un Query Builder per a fer les consultes a la base de dades.

2. **Requisits:**
    - Implementar el Query Builder en les operacions de consulta, inserció, actualització i eliminació.

#### Exercici 8: Poblar la taula amb dades de webscraping

1. **Descripció:**
   Modifica l'exercici de webscraping per a poblar una taula de la base de dades amb els llibres de la categoria `Classics` de la pàgina `https://books.toscrape.com/`.

2. **Requisits:**
    - Realitzar el webscraping de la pàgina esmentada.
    - Inserir els llibres en una taula de la base de dades.

## 9. Enunciat dels projectes

### Projecte "Ofegat" i "4 en Ratlla"

#### 1. Autenticació d'Usuaris i Gestió de Partides Guardades

1. **Registre d'Usuari:**
   - Crea un formulari de registre perquè nous usuaris es puguen registrar.
   - **Validació del registre**: Comprova que el nom d'usuari no estiga duplicat i que la contrasenya complisca certs requisits.
   - Emmagatzema la contrasenya de l'usuari en forma de **hash** utilitzant `password_hash()` per garantir la seguretat.

2. **Inici de Sessió (Login):**
   - Crea un formulari d’inici de sessió (nom d’usuari i contrasenya).
   - Autentica l’usuari comprovant el nom d’usuari i la contrasenya amb `password_verify()`.
   - Si l'autenticació és correcta, inicialitza una sessió per a l'usuari i guarda l'**ID de l’usuari** en la sessió.

3. **Gestió de Partides Guardades:**
   - Quan l'usuari inicia sessió, comprova si té una partida guardada:
      - Si té una partida guardada, ofereix l’opció de **reprendre** la partida.
      - Si no té cap partida guardada, permet iniciar una **nova partida**.
   - Si l'usuari decideix iniciar una nova partida, la partida guardada anteriorment es **sobrescriu**.

4. **Opcions per als Usuaris:**
   - **Iniciar nova partida**: L’usuari pot començar una nova partida. Aquesta acció esborrarà la partida anterior guardada.
   - **Reprendre partida**: Si l’usuari té una partida guardada, pot continuar-la des d’on ho va deixar.
   - **Tancar sessió**: Afig una opció perquè l’usuari puga tancar sessió i finalitzar la seua sessió activa.

5. **Manteniment de la Sessió de Joc:**
   - Una vegada que l'usuari ha iniciat sessió, guarda l’estat del joc a la sessió.
   - Quan l'usuari finalitza la sessió o vol guardar el seu progrés, emmagatzema l’estat actual de la partida a la base de dades.

#### 2. Requisits Específics per a Cada Joc

##### **Ofegat:**
1. **Guardar i carregar partida:**
   - Desa l'estat de la partida a la base de dades: la paraula a endevinar, les lletres encertades, els intents restants, i l’estat de la partida (en curs, guanyada o perduda).
   - Permet que l'usuari reprenga la partida guardada quan torna a iniciar sessió.

2. **Lògica de la Partida:**
   - Gestiona el joc amb sessions mentre l'usuari juga activament. La base de dades només s’utilitza per guardar o carregar una partida guardada.

##### **4 en Ratlla:**
1. **Guardar i carregar partida:**
   - Desa l'estat de la partida a la base de dades: l’estat de la graella, el torn del jugador actual, i l’estat de la partida (en curs, guanyada o empatada).
   - Quan l’usuari reprén la partida, carrega l'estat de la graella i continua des del torn correcte.

2. **Lògica de la Partida:**
   - La graella es manté en la sessió durant el joc actiu. Només es guarda a la base de dades quan es desitja interrompre la partida i es carrega al reprendre-la.

#### 3. Consideracions Addicionals

1. **Seguretat:**
   - Utilitza **hashing** de contrasenyes amb `password_hash()` per emmagatzemar-les de forma segura.
   - Gestiona les **sessions** i les **cookies** de manera segura per evitar robatoris de sessió.

2. **Millores de la Interfície d'Usuari:**
   - Proporciona missatges clars d'error en cas de contrasenyes incorrectes o usuaris inexistents.
   - Implementa una navegació senzilla per iniciar una nova partida o continuar una partida guardada.

3. **Proves:**
   - Realitza proves per assegurar que l’autenticació d’usuaris funciona correctament.
   - Verifica que les partides es guarden i es recuperen adequadament.

---

### **Exemple d'Estructura de la Base de Dades:**

```sql
CREATE TABLE usuaris (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom_usuari VARCHAR(50) UNIQUE NOT NULL,
    contrasenya VARCHAR(255) NOT NULL
);

CREATE TABLE partides (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuari_id INT NOT NULL,
    paraula VARCHAR(100), -- Només per al joc Ofegat
    lletres_encertades VARCHAR(100), -- Només per al joc Ofegat
    intents_restants INT, -- Només per al joc Ofegat
    graella TEXT, -- Només per al joc 4 en Ratlla
    torn_actual INT, -- Només per al joc 4 en Ratlla
    estat_partida ENUM('en_curs', 'guanyada', 'perduda') NOT NULL,
    FOREIGN KEY (usuari_id) REFERENCES usuaris(id) ON DELETE CASCADE
);
```

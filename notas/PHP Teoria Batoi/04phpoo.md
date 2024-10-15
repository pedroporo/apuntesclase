# Desenvolupament d'Aplicacions Web: POO, Separació de Lògica i Presentació, Gestió d'Errors i Proves











## 12. Referències Bibliogràfiques  

### Programació Orientada a Objectes en PHP

- **"PHP Objects, Patterns, and Practice"**  
  per M. Zandstra. Apress, 2017. ISBN: 978-1-4842-1361-3. Aquest llibre és un recurs essencial per entendre els fonaments de la programació orientada a objectes en PHP, així com patrons de disseny.

- **"Learning PHP, MySQL & JavaScript: With jQuery, CSS & HTML5"**  
  per Robin Nixon. O'Reilly Media, 2018. ISBN: 978-1-4919-2070-2. Ofereix una introducció completa a la programació amb PHP, incloent-hi el model d'objectes de PHP.

### Constructors i Destructors

- **PHP Manual: Constructors and Destructors**  
  Documentació oficial de PHP sobre constructors i destructors en la programació orientada a objectes. Disponible a [https://www.php.net/manual/en/language.oop5.decon.php](https://www.php.net/manual/en/language.oop5.decon.php).

### Encapsulació i Visibilitat

- **PHP Manual: Visibility**  
  Secció del manual oficial de PHP que explica les paraules clau `public`, `protected`, i `private`, així com el concepte d'encapsulació. Accessible a [https://www.php.net/manual/en/language.oop5.visibility.php](https://www.php.net/manual/en/language.oop5.visibility.php).

### Herència i Polimorfisme

- **"Programming PHP"**  
  per Kevin Tatroe, Peter MacIntyre, i Rasmus Lerdorf. O'Reilly Media, 2013. ISBN: 978-1-4493-5053-6. Aquest llibre cobreix àmpliament els conceptes d'herència i polimorfisme en PHP, proporcionant exemples pràctics.

- **PHP Manual: Inheritance**  
  Documentació oficial de PHP que tracta sobre l'herència en classes, incloent el polimorfisme. Disponible a [https://www.php.net/manual/en/language.oop5.inheritance.php](https://www.php.net/manual/en/language.oop5.inheritance.php).

### Classes Abstractes i Interfícies

- **PHP Manual: Interfaces and Abstract Classes**  
  Explicació oficial de les classes abstractes i les interfícies en PHP. Disponible a [https://www.php.net/manual/en/language.oop5.interfaces.php](https://www.php.net/manual/en/language.oop5.interfaces.php).

### Nombres màgics i Metodes màgics

- **PHP Manual: Magic Methods**  
  Guia completa sobre els mètodes màgics en PHP, com `__construct()`, `__destruct()`, `__get()`, `__set()`, entre altres. Disponible a [https://www.php.net/manual/en/language.oop5.magic.php](https://www.php.net/manual/en/language.oop5.magic.php).

### Trait en PHP

- **PHP Manual: Traits**  
  Documentació sobre traits en PHP, que permeten reutilitzar codi entre diferents classes. Disponible a [https://www.php.net/manual/en/language.oop5.traits.php](https://www.php.net/manual/en/language.oop5.traits.php).

### Excepcions en PHP

- **"The Pragmatic Programmer: Your Journey to Mastery"**  
  per David Thomas i Andrew Hunt. Addison-Wesley Professional, 2019. ISBN: 978-0-1359-5202-8. Inclou bones pràctiques per a la gestió d'excepcions, aplicables també a PHP.

- **PHP Manual: Exceptions**  
  Secció del manual de PHP dedicada a les excepcions, explicant com llençar i capturar excepcions en PHP. Accessible a [https://www.php.net/manual/en/language.exceptions.php](https://www.php.net/manual/en/language.exceptions.php).

### Proves amb PHPUnit

- **"Modern PHP: New Features and Good Practices"**  
  per Josh Lockhart. O'Reilly Media, 2015. ISBN: 978-1-4919-2904-0. Aquest llibre inclou una secció sobre proves amb PHPUnit.

- **PHPUnit Documentation**  
  Documentació oficial de PHPUnit, que cobreix com escriure i executar proves unitàries en PHP. Accessible a [https://phpunit.de/documentation.html](https://phpunit.de/documentation.html).

### Eines de Desenvolupament i Autocàrrega

- **Composer Documentation**  
  Accessible des de [https://getcomposer.org/doc/](https://getcomposer.org/doc/). Composer és l'eina estàndard per a la gestió de dependències en PHP, i inclou suport per a l'autocàrrega de classes.

- **PHP Manual: Autoloading Classes**  
  Guia sobre el mecanisme d'autocàrrega en PHP, que facilita la inclusió automàtica de classes en els teus projectes. Disponible a [https://www.php.net/manual/en/language.oop5.autoload.php](https://www.php.net/manual/en/language.oop5.autoload.php).

### POO Avançada: Patrons de Disseny

- **"Head First Design Patterns"**  
  per Eric Freeman i Elisabeth Robson. O'Reilly Media, 2020. ISBN: 978-1-4919-7175-9. Un recurs excel·lent per aprendre patrons de disseny aplicables a PHP.

- **"PHP Design Patterns"**  
  per Stephan Schmidt. Publicat per Packt Publishing, 2008. ISBN: 978-1-84719-255-3. Aquest llibre explora com aplicar patrons de disseny en projectes PHP.

### Webs de Referència Addicionals

- **PHP: The Right Way**  
  [https://phptherightway.com/](https://phptherightway.com/). Una guia per a desenvolupar aplicacions PHP seguint les millors pràctiques de la indústria.

- **Stack Overflow**  
  [https://stackoverflow.com/questions/tagged/php](https://stackoverflow.com/questions/tagged/php). Una font d'informació valuosa per resoldre problemes específics de PHP i discutir amb altres desenvolupadors.

---


## 13. Exercicis

### Bateria d'Exercicis Solucionats per a la Unitat de Programació Orientada a Objectes

##### Exercici 1: Crear una Classe Bàsica

1. Crea una classe `Cotxe` que tinga les propietats `marca` i `model`. Afegeix un mètode `mostraInformacio` que retorne un string amb la marca i el model del cotxe.
2. Crea una instància de la classe `Cotxe`, assigna-li una marca i un model, i mostra la informació utilitzant el mètode `mostraInformacio`.


<details>
<summary>Solució</summary>


```php
<?php
class Cotxe {
    public $marca;
    public $model;

    public function mostraInformacio() {
        return "Marca: " . $this->marca . ", Model: " . $this->model;
    }
}
 
$cotxe = new Cotxe();
$cotxe->marca = "Toyota";
$cotxe->model = "Corolla";
echo $cotxe->mostraInformacio(); // Output: Marca: Toyota, Model: Corolla
``` 
</details>
##### Exercici 2. Afegir un Constructor i destructor

1. Modifica la classe `Cotxe` per afegir un constructor que prenga com a paràmetres la `marca` i el `model`, i que establisca aquestes propietats automàticament.
2. Afegeix un destructor a la classe `Cotxe` que mostre un missatge quan l'objecte és destruït. Crea un objecte i permet que es destruïsca al final del programa.

<details>
<summary>Solució</summary>

```php
<?php
class Cotxe {
    public $marca;
    public $model;

    public function __construct($marca, $model) {
        $this->marca = $marca;
        $this->model = $model;
    }
    public function __destruct() {
        echo "L'objecte Cotxe ha estat destruït.\n";
    }

    public function mostraInformacio() {
        return "Marca: " . $this->marca . ", Model: " . $this->model;
    }
}
```
</details>

##### Exercici 3. Encapsulació de Propietats
 
1. Modifica la classe `Cotxe` per a que les propietats `marca` i `model` siguen privades. Afegeix mètodes públics `getMarca`, `setMarca`, `getModel`, i `setModel` per accedir i modificar aquestes propietats.

<details>
<summary>Solució</summary>

```php
<?php
class Cotxe {
    private $marca;
    private $model;

    public function __construct($marca, $model) {
        $this->marca = $marca;
        $this->model = $model;
    }

    public function getMarca() {
        return $this->marca;
    }

    public function setMarca($marca) {
        $this->marca = $marca;
    }

    public function getModel() {
        return $this->model;
    }

    public function setModel($model) {
        $this->model = $model;
    }

    public function mostraInformacio() {
        return "Marca: " . $this->getMarca() . ", Model: " . $this->getModel();
    }
}

$cotxe = new Cotxe("Ford", "Fiesta");
echo $cotxe->mostraInformacio(); // Output: Marca: Ford, Model: Fiesta
```
</details>
 
##### Exercici 4. Herència i Polimorfisme
 
1. Crea una classe `Vehicle` amb una propietat `tipus`. A continuació, crea una classe `Motocicleta` que herete de `Vehicle` i tinga una propietat `cilindrada`. Afegeix un mètode a `Motocicleta` que retorne el tipus i la cilindrada.
2. Crea una funció `mostraDetallsVehicle` que accepte un objecte de tipus `Vehicle` i mostre les seues propietats. Prova aquesta funció amb objectes de `Cotxe` i `Motocicleta`.

<details>
<summary>Solució</summary>

```php
<?php
class Vehicle {
    protected $tipus;

    public function __construct($tipus) {
        $this->tipus = $tipus;
    }

    public function mostraDetalls() {
        return "Tipus: " . $this->tipus;
    }
}

class Cotxe extends Vehicle {
    private $marca;
    private $model;

    public function __construct($marca, $model) {
        parent::__construct("Cotxe");
        $this->marca = $marca;
        $this->model = $model;
    }

    public function mostraDetalls() {
        return parent::mostraDetalls() . ", Marca: " . $this->marca . ", Model: " . $this->model;
    }
}

class Motocicleta extends Vehicle {
    private $cilindrada;

    public function __construct($cilindrada) {
        parent::__construct("Motocicleta");
        $this->cilindrada = $cilindrada;
    }

    public function mostraDetalls() {
        return parent::mostraDetalls() . ", Cilindrada: " . $this->cilindrada;
    }
}

function mostraDetallsVehicle(Vehicle $vehicle) {
    echo $vehicle->mostraDetalls() . "\n";
}

$cotxe = new Cotxe("Toyota", "Corolla");
$moto = new Motocicleta(600);

mostraDetallsVehicle($cotxe); // Output: Tipus: Cotxe, Marca: Toyota, Model: Corolla
mostraDetallsVehicle($moto);  // Output: Tipus: Motocicleta, Cilindrada: 600
```
</details>

##### Exercici 5. Implementació del Patró MVC amb Vehicles
 
Continuant amb l'exercici anterior on has creat les classes `Vehicle`, `Cotxe`, i `Motocicleta`, ara refactoritzaràs el codi per seguir el patró Model-Vista-Controlador (MVC). El teu objectiu és separar la lògica de negoci (models) de la presentació (vistes) i gestionar la interacció entre aquestes capes mitjançant un controlador.
   
1.  **Crear el Model**:
    - Refactoritza les classes `Vehicle`, `Cotxe`, i `Motocicleta` perquè representen el model de negoci i només contenen la lògica relacionada amb la gestió de vehicles.
    - Assegura't que els models no contenen cap codi de presentació.

2. **Crear les Vistes**:
    - Crea vistes separades per mostrar els detalls dels vehicles:
        - Una vista HTML que mostre la informació dels vehicles en format HTML.
        - Una vista en text simple que mostre els detalls dels vehicles en un format de text senzill.

3. **Crear el Controlador**:
    - Implementa un controlador que gestione la interacció entre els models i les vistes.
    - El controlador ha de ser capaç de rebre una sol·licitud per mostrar un vehicle i triar la vista adequada per mostrar-ne els detalls.

<details>
<summary>Solució</summary>

```php
<?php
// Models

class Vehicle {
    protected $tipus;

    public function __construct($tipus) {
        $this->tipus = $tipus;
    }

    public function getTipus() {
        return $this->tipus;
    }
}

class Cotxe extends Vehicle {
    private $marca;
    private $model;

    public function __construct($marca, $model) {
        parent::__construct("Cotxe");
        $this->marca = $marca;
        $this->model = $model;
    }

    public function getMarca() {
        return $this->marca;
    }

    public function getModel() {
        return $this->model;
    }
}

class Motocicleta extends Vehicle {
    private $cilindrada;

    public function __construct($cilindrada) {
        parent::__construct("Motocicleta");
        $this->cilindrada = $cilindrada;
    }

    public function getCilindrada() {
        return $this->cilindrada;
    }
}

// Vistes

class VehicleView {
    public function renderHtml(Vehicle $vehicle) {
        $output = "<p>Tipus: " . $vehicle->getTipus() . "</p>";
        if ($vehicle instanceof Cotxe) {
            $output .= "<p>Marca: " . $vehicle->getMarca() . "</p>";
            $output .= "<p>Model: " . $vehicle->getModel() . "</p>";
        } elseif ($vehicle instanceof Motocicleta) {
            $output .= "<p>Cilindrada: " . $vehicle->getCilindrada() . " cc</p>";
        }
        return $output;
    }

    public function renderText(Vehicle $vehicle) {
        $output = "Tipus: " . $vehicle->getTipus() . "\n";
        if ($vehicle instanceof Cotxe) {
            $output .= "Marca: " . $vehicle->getMarca() . "\n";
            $output .= "Model: " . $vehicle->getModel() . "\n";
        } elseif ($vehicle instanceof Motocicleta) {
            $output .= "Cilindrada: " . $vehicle->getCilindrada() . " cc\n";
        }
        return $output;
    }
}

// Controlador

class VehicleController {
    private $view;

    public function __construct(VehicleView $view) {
        $this->view = $view;
    }

    public function mostrarVehicle(Vehicle $vehicle, $format = 'html') {
        if ($format === 'html') {
            echo $this->view->renderHtml($vehicle);
        } else {
            echo $this->view->renderText($vehicle);
        }
    }
}

// Exemple d'ús

$view = new VehicleView();
$controller = new VehicleController($view);

$cotxe = new Cotxe("Toyota", "Corolla");
$moto = new Motocicleta(600);

// Mostrar en HTML
$controller->mostrarVehicle($cotxe, 'html');
$controller->mostrarVehicle($moto, 'html');

// Mostrar en Text
$controller->mostrarVehicle($cotxe, 'text');
$controller->mostrarVehicle($moto, 'text');
```
</details>

#### Exercici 5. Classes Abstractes i Interfícies
 
1. Crea una classe abstracta `Figura` amb un mètode abstracte `calculaArea`. Després, crea classes `Cercle` i `Rectangle` que estiguen basades en `Figura` i implementen el mètode `calculaArea`.
2. Defineix una interfície `OperacionsBàsiques` amb els mètodes `suma` i `resta`. Implementa aquesta interfície en una classe `CalculadoraSimple`.

<details>
<summary>Solució</summary>

```php
<?php
abstract class Figura {
    abstract public function calculaArea();
}

class Cercle extends Figura {
    private $radi;

    public function __construct($radi) {
        $this->radi = $radi;
    }

    public function calculaArea() {
        return pi() * $this->radi * $this->radi;
    }
}

class Rectangle extends Figura {
    private $ample;
    private $llarg;

    public function __construct($ample, $llarg) {
        $this->ample = $ample;
        $this->llarg = $llarg;
    }

    public function calculaArea() {
        return $this->ample * $this->llarg;
    }
}

$cercle = new Cercle(5);
$rectangle = new Rectangle(4, 6);

echo "Àrea del cercle: " . $cercle->calculaArea() . "\n"; // Output: Àrea del cercle: 78.5398
echo "Àrea del rectangle: " . $rectangle->calculaArea() . "\n"; // Output: Àrea del rectangle: 24

``` 

```php
<?php
interface OperacionsBàsiques {
    public function suma($a, $b);
    public function resta($a, $b);
}

class CalculadoraSimple implements OperacionsBàsiques {
    public function suma($a, $b) {
        return $a + $b;
    }

    public function resta($a, $b) {
        return $a - $b;
    }
}

$calculadora = new CalculadoraSimple();
echo "Suma: " . $calculadora->suma(5, 3) . "\n"; // Output: Suma: 8
echo "Resta: " . $calculadora->resta(5, 3) . "\n"; // Output: Resta: 2
```
</details>

#### Exercici 6.  Utilitzar Traits

1. Crea un trait `Informacio` amb un mètode `mostraInformacio`. Inclou aquest trait en les classes `Cotxe` i `Motocicleta`, i utilitza'l per mostrar informació addicional.

<details>
<summary>Solució</summary>

```php
<?php
trait Informacio {
    public function mostraInformacio() {
        return "Aquest és un objecte de tipus " . get_class($this);
    }
}

class Cotxe {
    use Informacio;
}

class Motocicleta {
    use Informacio;
}

$cotxe = new Cotxe();
$moto = new Motocicleta();

echo $cotxe->mostraInformacio() . "\n"; // Output: Aquest és un objecte de tipus Cotxe
echo $moto->mostraInformacio() . "\n"; // Output: Aquest és un objecte de tipus Motocicleta
```
</details>

#### Exercici 7.  Gestionar Excepcions

1. Escriu una funció `divideix` que prenga dos nombres com a paràmetres i retorne el resultat de la divisió. Si el segon nombre és zero, llença una excepció amb un missatge adequat. Captura aquesta excepció quan crides a la funció i mostra un missatge d'error.

<details>
<summary>Solució</summary>

```php
<?php
function divideix($a, $b) {
    if ($b == 0) {
        throw new Exception("No es pot dividir per zero.");
    }
    return $a / $b;
}

try {
    echo divideix(10, 2) . "\n"; // Output: 5
    echo divideix(10, 0) . "\n"; // Aquesta línia llançarà una excepció
} catch (Exception $e) {
    echo "Error: " . $e->getMessage() . "\n"; // Output: Error: No es pot dividir per zero.
}
```
</details>

#### Exercici 8. Proves amb PHPUnit
 
1. Crea una classe `Calculadora` amb els mètodes `suma` i `resta`. Escriu una prova unitària amb PHPUnit per verificar que aquests mètodes funcionen correctament.
2. Afegeix un mètode `divideix` a la classe `Calculadora` que llance una excepció quan es divideix per zero. Escriu una prova unitària que assegure que aquesta excepció es llança correctament.

<details>
<summary>Solució</summary>

```php
<?php
// Arxiu: tests/CalculadoraTest.php
use PHPUnit\Framework\TestCase;

class Calculadora {
    public function suma($a, $b) {
        return $a + $b;
    }

    public function resta($a, $b) {
        return $a - $b;
    }
}

class CalculadoraTest extends TestCase {
    public function testSuma() {
        $calculadora = new Calculadora();
        $resultat = $calculadora->suma(2, 3);
        $this->assertEquals(5, $resultat);
    }

    public function testResta() {
        $calculadora = new Calculadora();
        $resultat = $calculadora->resta(5, 3);
        $this->assertEquals(2, $resultat);
    }
}
``` 
```php
 
// Arxiu: tests/CalculadoraTest.php
use PHPUnit\Framework\TestCase;

class Calculadora {
    public function divideix($a, $b) {
        if ($b == 0) {
            throw new InvalidArgumentException("No es pot dividir per zero.");
        }
        return $a / $b;
    }
}

class CalculadoraTest extends TestCase {
    public function testDivideix() {
        $this->expectException(InvalidArgumentException::class);
        
        $calculadora = new Calculadora();
        $calculadora->divideix(5, 0);
    }
}
```
</details>

#### Exercici 9. Espais de Noms (Namespaces)

1. Crea un espai de noms `App\Models` i defineix una classe `Usuari` dins d'aquest espai de noms. Afegeix un mètode `getNomComplet` que retorne el nom complet de l'usuari.
2. En un fitxer separat, importa la classe `Usuari` de l'espai de noms `App\Models` i crea una instància d'aquesta classe. Utilitza el mètode `getNomComplet` per mostrar el nom complet d'un usuari.

<details>
<summary>Solució</summary>

```php
<?php
// Arxiu: src/Models/Usuari.php
namespace App\Models;

class Usuari {
    private $nom;
    private $cognom;

    public function __construct($nom, $cognom) {
        $this->nom = $nom;
        $this->cognom = $cognom;
    }

    public function getNomComplet() {
        return $this->nom . " " . $this->cognom;
    }
}
``` 
```php

// Arxiu: index.php
require 'vendor/autoload.php';

use App\Models\Usuari;

$usuari = new Usuari("Joan", "Garcia");
echo $usuari->getNomComplet(); // Output: Joan Garcia
```
</details>

#### Exercici 10. Autoloading i Composer

1. Configura un projecte PHP amb Composer que utilitze l'autoloading PSR-4. Crea l'estructura de directoris `src/Models` i col·loca una classe `Producte` dins de `src/Models`. Verifica que l'autoloading funcione correctament instanciant la classe `Producte` en un fitxer separat.
2. Afegeix la llibreria `monolog/monolog` al projecte utilitzant Composer. Crea una instància de `Logger` i afegeix una entrada al registre de logs.

<details>
<summary>Solució</summary>

1. Crea l'estructura de directoris src/Models i col·loca el següent codi a src/Models/Producte.php:

```php
<?php
namespace App\Models;

class Producte {
    private $nom;

    public function __construct($nom) {
        $this->nom = $nom;
    }

    public function getNom() {
        return $this->nom;
    }
}
```

2. Configura l'autoloading en composer.json:

```json
{
    "autoload": {
        "psr-4": {
            "App\\": "src/"
        }
    }
}
```

3. Executa composer dump-autoload per generar els fitxers d'autoload.
4. Utilitza la classe producte:

```php
<?php
// Arxiu: index.php
require 'vendor/autoload.php';

use App\Models\Producte;

$producte = new Producte("Ordinador");
echo $producte->getNom(); // Output: Ordinador
```
5. Afegeix Monolog a composer.json:

```bash
composer require monolog/monolog
```
6. Utilitza Monolog per crear un logger:

```php
<?php
require 'vendor/autoload.php';

use Monolog\Logger;
use Monolog\Handler\StreamHandler;

$log = new Logger('nom_aplicacio');
$log->pushHandler(new StreamHandler('app.log', Logger::WARNING));

// Afegeix una entrada al log
$log->warning('Aquesta és una entrada d'advertència');
$log->error('Aquesta és una entrada d'error');

```
</details>
 
#### Exercici 11. Logger

1. Utilitzant la llibreria `Monolog`, crea un logger que escriga missatges a un fitxer `app.log`. Configura el logger per registrar missatges d'informació i d'error.
2. Configura un logger que escriga missatges de registre tant a un fitxer com a la consola. Prova el logger registrant missatges d'error.

<details>
<summary>Solució</summary>

```php
<?php
require 'vendor/autoload.php';

use Monolog\Logger;
use Monolog\Handler\StreamHandler;

$log = new Logger('nom_aplicacio');
$log->pushHandler(new StreamHandler('app.log', Logger::INFO));
$log->pushHandler(new StreamHandler('app.log', Logger::ERROR));

// Registra missatges d'informació i d'error
$log->info('Aquesta és una entrada d’informació');
$log->error('Aquesta és una entrada d’error');

```

```php
<?php
require 'vendor/autoload.php';

use Monolog\Logger;
use Monolog\Handler\StreamHandler;
use Monolog\Handler\ErrorLogHandler;

$log = new Logger('nom_aplicacio');
$log->pushHandler(new StreamHandler('app.log', Logger::WARNING));
$log->pushHandler(new ErrorLogHandler());

// Registra missatges d’error al fitxer i a la consola
$log->error('Aquesta és una entrada d’error');

```

</details>

#### Exercici 12. Documentació

1. Documenta la classe `Producte` creada en l'exercici anterior utilitzant comentaris PHPDoc. Assegura't d'incloure la descripció de la classe, les propietats, i els mètodes.
2. Utilitza una eina com `phpDocumentor` per generar la documentació automàtica del codi PHP del projecte, incloent-hi la classe `Producte`.

<details>
<summary>Solució</summary>

```php
<?php
namespace App\Models;

/**
 * Classe Producte
 *
 * Representa un producte amb un nom.
 */
class Producte {
    /**
     * @var string El nom del producte
     */
    private $nom;

    /**
     * Constructor de la classe Producte
     *
     * @param string $nom El nom del producte
     */
    public function __construct($nom) {
        $this->nom = $nom;
    }

    /**
     * Obté el nom del producte
     *
     * @return string El nom del producte
     */
    public function getNom() {
        return $this->nom;
    }
}
```

1. Instal·la phpDocumentor globalment o com a dependència de desenvolupament:

```bash
composer require --dev phpdocumentor/phpdocumentor
```

2. Genera la documentació:

```bash
vendor/bin/phpdoc -d src -t docs
```

Aquest comandament generarà la documentació a la carpeta docs.
 
</details>

#### Exercici 13. Generació de PDFs amb DomPDF

1. Instal·la la llibreria `dompdf/dompdf` amb Composer. Crea un script PHP que genere un PDF senzill amb un títol i un paràgraf de text.
2. Crea un PDF utilitzant DomPDF que incloga una taula amb dades i una imatge. Assegura't que el PDF es renderitze correctament i que la imatge s'incloga en el document.

<details>
<summary>Solució</summary>

1. Instal·la DomPDF amb Composer:

```bash
composer require dompdf/dompdf
```

2. Crea un script PHP que generi un PDF senzill:

```php
<?php
require 'vendor/autoload.php';

use Dompdf\Dompdf;

$dompdf = new Dompdf();
$html = '<h1>Informe de Vendes</h1><p>Aquest és un informe de les vendes.</p>';

$dompdf->loadHtml($html);
$dompdf->setPaper('A4', 'landscape');
$dompdf->render();
$dompdf->stream('informe.pdf');
```

3. Crea un PDF amb una taula i una imatge:

```php
<?php
require 'vendor/autoload.php';

use Dompdf\Dompdf;

$dompdf = new Dompdf();
$html = '
    <h1>Informe de Productes</h1>
    <table border="1" cellpadding="10">
        <thead>
            <tr>
                <th>Producte</th>
                <th>Preu</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>Ordinador</td>
                <td>500€</td>
            </tr>
            <tr>
                <td>Teclat</td>
                <td>20€</td>
            </tr>
        </tbody>
    </table>
    <img src="https://example.com/imatge.png" alt="Imatge de Producte" />
';

$dompdf->loadHtml($html);
$dompdf->setPaper('A4', 'portrait');
$dompdf->render();
$dompdf->stream("informe_productes.pdf");
```

</details>


##  Exercicis proposats
 
#### Exercici 1. Creació de la Classe Bàsica i Gestió de Propietats

* Crea una classe `Persona` amb les propietats privades `nom`, `cognoms`, i `edat`. Encapsula aquestes propietats mitjançant getters i setters. Afig els següents mètodes:

      - `getNomComplet(): string` – Retorna el nom complet de la persona.
      - `estaJubilat(): bool` – Retorna `true` si l'edat és major o igual a 65, `false` en cas contrari.

* Modifica la classe `Persona` afegint un constructor que assigna nom i cognoms. Si es proporciona un tercer paràmetre, assigna l'edat; en cas contrari, assigna una edat per defecte de 25 anys.

* Modifica la classe `Persona` per utilitzar una constant `LIMITE_EDAT` amb el valor de 66 anys i utilitza-la en el mètode `estaJubilat`.

#### Exercici 2. Herència i Polimorfisme

* Crea una classe `Empleado` que herete de `Persona`. Afig les següents propietats i mètodes:

    - `private float $sou`
    - `private array $telefons`
    - `anyadirTelefono(int $telefon): void` – Afig un número de telèfon a l'array.
    - `listarTelefonos(): string` – Retorna els números de telèfon separats per comes.
    - `vaciarTelefonos(): void` – Buida l'array de telèfons.
    - `debePagarImpuestos(): bool` – Retorna `true` si el sou és superior a 3333€, `false` en cas contrari.

* Afig un mètode estàtic `toHtml(Empleado $emp): string` que genere un codi HTML que mostre el nom complet de l'empleat dins d'un paràgraf i els seus telèfons dins d'una llista ordenada.
* Afig un mètode estàtic `toHtml(Persona $p)` a la classe Persona que mostre el nom complet de la persona dins d'un paràgraf. Modifica el mètode `toHtml` de `Empleado` per rebre una `Persona` com a paràmetre i comprovar si es tracta d'un `Empleado` amb `instanceof`.
* Transforma `Persona` en una classe abstracta. Redefineix el mètode estàtic `toHtml(Persona $p)` en totes les seues subclasses. Afig una classe `Worker` que siga també abstracta i que emmagatzeme els `telefonos`. Crea mètodes per calcular el sou en `Empleado` i `Gerent`, segons la descripció.

#### Exercici 3. Integració d'Espais de Noms, Autoloading, i Composer

* Crea una classe `Empresa` que incloga una propietat amb un array de `Workers`, ja siguen `Employees` o `Managers`. Implementa:

    - `public function addWorker(Worker $t)`
    - `public function listWorkersHtml(): string` – Genera la llista de treballadors en format HTML.
    - `public function getCosteNominas(): float` – Calcula el cost total de les nòmines.

* Configura un projecte PHP amb Composer que utilitze l'autoloading PSR-4. Afig un fitxer `composer.json` i defineix l'estructura de directoris `src/Models`, `src/Services`, etc. Crea una classe `Producte` dins de `src/Models` i verifica que l'autoloading funcione correctament instanciant la classe en un fitxer separat.

#### Exercici 4. Logger i Documentació

* Utilitza la llibreria `Monolog` per configurar un logger que escriga missatges a un fitxer `app.log`. Afig funcionalitat perquè el logger registre missatges d'informació i d'error en diferents arxius segons la gravetat.

* Configura un logger que escriga missatges de registre tant a un fitxer com a la consola. Prova el logger registrant missatges d'error i advertència.

* Documenta la classe `Producte` creada en exercicis anteriors utilitzant comentaris PHPDoc. Inclou la descripció de la classe, les propietats, i els mètodes. Utilitza una eina com `phpDocumentor` per generar documentació automàtica.

* Escriu proves unitàries per als mètodes de les classes `Persona`, `Empleado`, i `Empresa` utilitzant PHPUnit. Prova els mètodes `getNomComplet`, `estaJubilat`, `addWorker`, i `getCosteNominas`. Assegura't que les proves cobreixen diferents escenaris, incloent errors potencials.

* Escriu una prova unitària que comprove que el logger està registrant correctament els missatges d'error a l'arxiu corresponent. Utilitza un mock per assegurar-te que el logger funciona sense necessitat d'escriure en un fitxer real durant la prova.

#### Exercici 5. Generació de PDFs amb DomPDF

* Instal·la la llibreria `dompdf/dompdf` amb Composer. Crea un script PHP que genere un PDF senzill amb un títol i un paràgraf de text.

* Crea un PDF utilitzant DomPDF que incloga una taula amb dades i una imatge. Assegura't que el PDF es renderitze correctament i que la imatge s'incloga en el document.

* Utilitzant la classe `Empresa` i `Empleado`, genera un informe en PDF amb la llista de treballadors i el seu sou. Utilitza DomPDF per generar aquest informe.

#### Exercici 6. Serialització i JSON

* Crea una interfície `JSerializable` que incloga els mètodes:

    - `toJSON(): string` – Converteix l'objecte a un JSON utilitzant `json_encode()`.
    - `toSerialize(): string` – Serialitza l'objecte utilitzant `serialize()`.

* Modifica les classes `Persona`, `Empleado`, i `Empresa` per implementar aquesta interfície. Assegura't que les propietats privades es puguen serialitzar correctament.

* Escriu mètodes per deserialitzar un objecte a partir d'una cadena JSON o d'una cadena serialitzada. Prova aquests mètodes amb PHPUnit per assegurar-te que la deserialització funciona correctament.

#### Exercici 7. Separació del Model de Negoci i la Presentació (MVC)
 
Fins ara, has creat diverses classes que gestionen la lògica del joc i les dades (models), com `Persona`, `Empleado`, i `Empresa`, i has generat sortides HTML i PDFs amb DomPDF. Ara és el moment de refactoritzar la teua aplicació per assegurar una separació clara entre la lògica del negoci i la presentació, seguint el patró Model-Vista-Controlador (MVC).
  
* **Crear el Model**:
    - Refactoritza les classes `Persona`, `Empleado`, i `Empresa` per assegurar que només gestionen la lògica de negoci (per exemple, càlcul de nòmines, gestió d'empleats, etc.).
    - Assegura't que aquestes classes no contenen codi relacionat amb la presentació (HTML o PDF).

* **Crear les Vistes**:
    - Crea vistes separades per presentar la informació als usuaris:
        - Una vista HTML per mostrar la informació de `Empleado` i `Empresa` com a llistats.
        - Una vista PDF per generar informes amb DomPDF, basant-se en les dades proporcionades pel model.

* **Crear el Controlador**:
    - Implementa un controlador que reba les sol·licituds dels usuaris, interactue amb el model (`Persona`, `Empleado`, `Empresa`), i tria la vista adequada per mostrar els resultats (HTML o PDF).
    - El controlador ha d'encapsular tota la lògica necessària per a gestionar la interacció entre la vista i el model, assegurant que el model no estiga lligat a la capa de presentació.

#### Exercici 8. Creació de Proves Unitàries per al Patró MVC

Després de refactoritzar l'aplicació per separar la lògica del negoci de la presentació seguint el patró Model-Vista-Controlador (MVC), és fonamental assegurar-se que tots els components funcionen correctament i que la interacció entre ells es realitza tal com s'espera. Per això, has de crear una sèrie de proves unitàries utilitzant PHPUnit per verificar el funcionament del model, les vistes i els controladors.
  
* **Proves del Model**:
    - Escriu proves unitàries per verificar el funcionament dels mètodes de les classes `Persona`, `Empleado`, i `Empresa`.
    - Assegura't que els mètodes funcionen correctament, com ara:
        - `getNomComplet()`
        - `debePagarImpuestos()`
        - `addWorker()` i `getCosteNominas()`
    - Prova que els càlculs es realitzen correctament i que les dades es gestionen segons el que s'espera.

* **Proves del Controlador**:
    - Escriu proves unitàries per assegurar-te que els controladors interactuen correctament amb els models i que seleccionen la vista adequada per a cada situació.
    - Prova que les dades es passen correctament del model a la vista a través del controlador.
    - Implementa proves per verificar que el controlador respon correctament a diferents sol·licituds de l'usuari, per exemple:
        - Mostrar una llista d'empleats en HTML.
        - Generar un informe en PDF utilitzant DomPDF.

* **Proves de les Vistes**:
    - Escriu proves unitàries per comprovar que les vistes reben i mostren correctament la informació proporcionada pel controlador.
    - Prova que la generació de contingut HTML o PDF es realitza correctament a partir de les dades proporcionades pel model.
 
## 14. Enunciat dels projectes

### Projecte "Ofegat"

#### 1. Refactorització amb Programació Orientada a Objectes (POO)
- **Crear una Classe `JocOfegat`**: Refactoritza la lògica principal del joc en una classe `JocOfegat` que gestione l'estat del joc, la paraula a endevinar, les lletres endevinades, i el nombre d'intents restants.
- **Mètodes Principals**:
    - `iniciarJoc($paraula): void` – Inicia una nova partida amb la paraula donada.
    - `endevinaLletra($lletra): bool` – Comprova si la lletra és part de la paraula i actualitza l'estat del joc.
    - `estaAcabat(): bool` – Retorna `true` si el joc ha acabat, ja siga per guanyar o per perdre.
    - `obteEstat(): array` – Retorna l'estat actual del joc, incloent les lletres encertades, intents restants, etc.
#### 2. Separació del Model de Negoci de la Presentació
- **Model-Vista-Controlador (MVC)**: 
   - **Model**: La classe JocOfegat actua com a model, gestionant la lògica del joc i mantenint l'estat. Aquest model ha d'estar completament separat de qualsevol codi que gestione la presentació (HTML, CSS).
   - **Vista**: Crea vistes que s'encarreguen exclusivament de mostrar la informació a l'usuari. Aquestes vistes poden utilitzar plantilles HTML i accedir al model a través de controladors.
   - **Controlador**: El controlador serà responsable de rebre les entrades de l'usuari (com l'endevinació d'una lletra), interactuar amb el model (JocOfegat) per actualitzar l'estat del joc, i seleccionar la vista adequada per a mostrar els resultats a l'usuari.

#### 3. Integració de Composer i Autoloading
- **Configuració de Composer**: Utilitza Composer per gestionar les dependències del projecte. Defineix l'autoloading per carregar automàticament les classes de `JocOfegat`.
- **Estructura del Projecte**:
    - Organitza el codi en directoris com `src/Models` per a les classes del joc, i `src/Services` per a la gestió de sessions i autenticació.
    - Defineix un `composer.json` per configurar l'autoloading PSR-4.

#### 4. Proves amb PHPUnit
- **Escriu Proves Unitàries**: Crea proves unitàries per a la classe `JocOfegat` utilitzant PHPUnit. Les proves poden incloure:
    - Prova per assegurar que una paraula es configura correctament.
    - Prova per verificar que una lletra encertada actualitza l'estat correctament.
    - Prova per assegurar que el joc detecta correctament quan s'ha guanyat o perdut.
- **Prova de Gestió de Sessions**: Afig proves per a la gestió de sessions, comprovant que l'estat del joc es guarda i es recupera correctament.

#### 5. Logger amb Monolog
- **Configuració de Logger**: Utilitza `Monolog` per registrar esdeveniments importants, com quan s'inicia un nou joc, quan un jugador endevina una lletra o quan es produeixen errors.
- **Diversos Handlers**:
    - Registra missatges a un fitxer `game.log` per a esdeveniments generals.
    - Afig un handler per registrar errors greus, com intents invàlids o problemes de sessió, en un fitxer d'errors separat.

### Projecte "4 en Ratlla"

#### 1. Refactorització amb Programació Orientada a Objectes (POO)
- **Classe `Joc4enRatlla`**: Refactoritza la lògica del joc en una classe `Joc4enRatlla` que gestione la graella, el torn del jugador, i la lògica per determinar el guanyador.
- **Mètodes Principals**:
    - `iniciarPartida(): void` – Inicia una nova partida.
    - `ferMoviment($columna): bool` – Permet que un jugador faça un moviment en una columna determinada.
    - `comprovaGuanyador(): ?int` – Comprova si hi ha un guanyador després d'un moviment.
    - `obteEstatGraella(): array` – Retorna l'estat actual de la graella.

#### 2. Separació del Model de Negoci de la Presentació
- **Model-Vista-Controlador (MVC)**:
    - **Model**: La classe Joc4enRatlla representa el model, que s'encarrega de tota la lògica del joc, incloent la gestió de la graella i la determinació del guanyador.
    - **Vista**: Les vistes presenten la graella del joc, el torn actual del jugador, i els resultats finals (guanyador o empat). Aquestes vistes han d'estar separades del model i només han de mostrar la informació proporcionada pel controlador.
    - **Controlador**: El controlador gestiona les interaccions de l'usuari, com els moviments en la graella. Aquest component comunica el model amb les vistes, assegurant-se que els canvis en l'estat del joc es reflectisquen correctament en la presentació.

#### 3. Integració de Composer i Autoloading
- **Configuració de Composer**: Defineix un `composer.json` per al projecte, configurant l'autoloading PSR-4 per carregar automàticament les classes de `Joc4enRatlla`.
- **Estructura del Projecte**:
    - Organitza el codi en directoris com `src/Models` per a les classes del joc i `src/Controllers` per a la gestió del flux del joc.
    - Configura Composer per gestionar les dependències del projecte.

#### 4. Proves amb PHPUnit
- **Escriu Proves Unitàries**: Crea proves unitàries per a la classe `Joc4enRatlla` utilitzant PHPUnit. Les proves poden incloure:
    - Verificació de la configuració inicial de la graella.
    - Proves per assegurar que un moviment s'aplica correctament a la graella.
    - Proves per assegurar que el joc detecta correctament un guanyador o un empat.
- **Proves de Gestió de Sessions**: Afig proves per assegurar que l'estat del joc i el torn del jugador es mantenen correctament a través de les sessions.

#### 5. Logger amb Monolog
- **Configuració de Logger**: Utilitza `Monolog` per registrar esdeveniments importants del joc, com quan un jugador fa un moviment, quan s'inicia una nova partida, o quan es produeixen errors.
- **Diversos Handlers**:
    - Registra els moviments dels jugadors i els resultats del joc en un fitxer `game.log`.
    - Registra errors greus o problemes amb les sessions en un fitxer d'errors separat.

### Consideracions Addicionals per a Ambdós Projectes

#### 1. Documentació amb PHPDoc
- **Documentació Completa**: Documenta totes les classes i mètodes amb comentaris PHPDoc. Això inclou les descripcions dels paràmetres i els valors de retorn per a cada mètode.
- **Generació Automàtica**: Utilitza `phpDocumentor` o una eina similar per generar la documentació automàticament. Afig la documentació generada al projecte per facilitar el manteniment i la comprensió del codi.

#### 2. Implementació d'Interfícies
- **Interfície `JocInterface`**: Crea una interfície que definisca els mètodes bàsics que qualsevol joc (com Ofegat o 4 en Ratlla) ha de tindre (`iniciarJoc`, `ferMoviment`, `comprovaGuanyador`, etc.). Assegura't que les classes `JocOfegat` i `Joc4enRatlla` implementen aquesta interfície.

#### 3. Serialització i Persistència
- **Serialització de l'Estat del Joc**: Implementa funcionalitats per serialitzar l'estat del joc (usant JSON o `serialize()`) i deserialitzar-lo per mantenir la persistència entre sessions o guardar l'estat per a reprendre la partida posteriorment.

### Rúbrica d'Avaluació per als Projectes "Ofegat" i "4 en Ratlla"

| **Criteri**                                                 | ** Insuficient (1 punt)**                                                                                   | ** Adequat (2 punts)**                                                                                                                          | ** Bé (3 punts)**                                                                                                      | ** Excel·lent (4 punts)**                                                                                                 |
|-------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------|
| **Implementació de Programació Orientada a Objectes (POO)** | Les classes no estan ben dissenyades, falta encapsulació, ús incorrecte d'herència, o mètodes no funcional. | Les classes estan creades però poden tindre errors o una estructura confusa. S'aplica la POO de manera bàsica, però hi ha problemes de disseny. | Classes correctament estructurades i funcionalment completes. Ús adequat d'encapsulació, herència i polimorfisme.      | Disseny de classes ben organitzat, reutilitzable i amb una implementació clara dels principis de POO.                     |
| **Separació del Model de Negoci de la Presentació (MVC)**      | No s'ha implementat la separació de model i presentació; el codi de lògica i presentació està mesclat.      | Hi ha una separació parcial, però algunes parts de la lògica del negoci es barregen amb la presentació o a l'inrevés.                           | La separació entre model, vista i controlador està ben implementada, però podria millorar en alguns aspectes.          | Excel·lent separació entre el model, vista i controlador, seguint els principis del patró MVC i mantenint un codi net.   |
| **Integració de Composer i Autoloading**                    | No s'ha configurat Composer o l'autoloading, o està mal configurat i no funciona correctament.              | Composer s'ha utilitzat, però amb una estructura de projectes i autoloading bàsics o incorrectes.                                               | Composer i l'autoloading estan configurats correctament amb una estructura de projectes ben definida.                  | Ús excel·lent de Composer amb una configuració avançada d'autoloading i una estructura de projecte organitzada i modular. |
| **Implementació de Proves amb PHPUnit**                     | No s'han creat proves, o les proves creades són mínimes i no adequades per a verificar la funcionalitat.    | Es presenten proves bàsiques amb PHPUnit, però cobreixen parcialment les funcionalitats requerides.                                             | Proves unitàries completes que cobreixen la majoria dels casos, incloent proves de gestió de sessions i lògica de joc. | Proves exhaustives que cobreixen totes les funcionalitats i consideren casos límit, amb ús de mocks quan necessari.       |
| **Ús de Logger amb Monolog**                                | No s'ha implementat el logger o no s'utilitza de manera efectiva per registrar esdeveniments importants.    | Logger implementat, però amb ús limitat o incorrecte en la registració d'esdeveniments i errors.                                                | Logger ben implementat, amb esdeveniments i errors registrats adequadament en diferents fitxers o canals.              | Ús avançat de logger amb diferents handlers per registrar informació, errors, i seguiment detallat del flux del joc.      |
| **Documentació amb PHPDoc**                                 | Falta documentació o és insuficient per comprendre les classes i mètodes del projecte.                      | Documentació bàsica amb PHPDoc, però amb omisions o descripcions poc clares.                                                                    | Documentació completa amb PHPDoc per a totes les classes i mètodes, amb descripcions clares i detallades.              | Documentació excel·lent amb PHPDoc, ben estructurada i completa, facilitant la comprensió i manteniment del projecte.     |
| **Qualitat del Codi i Bones Pràctiques**                    | Codi desorganitzat, amb molts errors de sintaxi, mala nomenclatura, o sense bones pràctiques de codi.       | Codi funcional però amb problemes d'estructura, estil inconsistent o incompliment parcial de bones pràctiques.                                  | Codi ben escrit, seguint les convencions de nomenclatura i bones pràctiques de desenvolupament.                        | Codi de qualitat professional, net, ben organitzat, i seguint rigorosament les millors pràctiques de programació.         |

### Explicació dels Criteris

#### **1 punt: Insuficient**
- **POO**: Les classes no segueixen els principis bàsics de la programació orientada a objectes. Hi ha problemes greus com la falta d'encapsulació, l'ús inadequat de l'herència o mètodes que no funcionen correctament.
- **MVC**: No s'ha implementat la separació del model de negoci i la presentació. El codi de la lògica del negoci està mesclat amb la presentació (HTML, CSS), cosa que dificulta el manteniment i l'escalabilitat del projecte.
- **Composer i Autoloading**: No s'ha configurat Composer o l'autoloading. Si estan configurats, no funcionen correctament.
- **Proves amb PHPUnit**: Les proves estan absents o són mínimes, i no verifiquen adequadament la funcionalitat del projecte.
- **Logger amb Monolog**: El logger no s'ha implementat, o si està present, no s'utilitza de manera efectiva per registrar esdeveniments importants.
- **Documentació amb PHPDoc**: Falta documentació essencial, o la que existeix és insuficient per a entendre el codi.
- **Qualitat del Codi**: El codi és desorganitzat, amb molts errors de sintaxi i no segueix les bones pràctiques de programació.

#### **2 punts: Adequat**
- **POO**: Les classes estan creades, però poden contindre errors o una estructura confusa. L'aplicació de la POO és bàsica, amb alguns problemes de disseny.
- **MVC**: Hi ha una separació parcial entre el model de negoci i la presentació. No obstant això, encara hi ha parts del codi on la lògica del negoci està barrejada amb la presentació o a l'inrevés, cosa que indica una comprensió bàsica però incompleta del patró MVC.
- **Composer i Autoloading**: Composer s'ha utilitzat, però l'estructura de projectes o l'autoloading no són òptims, presentant configuracions bàsiques o incorrectes.
- **Proves amb PHPUnit**: Es presenten proves bàsiques que cobreixen parcialment les funcionalitats requerides.
- **Logger amb Monolog**: El logger està implementat, però l'ús és limitat o incorrecte en la registració d'esdeveniments i errors.
- **Documentació amb PHPDoc**: La documentació amb PHPDoc és bàsica, amb algunes omisions o descripcions poc clares.
- **Qualitat del Codi**: El codi és funcional però presenta problemes d'estructura, estil inconsistent o incompliment parcial de bones pràctiques.

#### **3 punts: Bé**
- **POO**: Les classes estan correctament estructurades i són funcionalment completes. Es fa un ús adequat de l'encapsulació, l'herència i el polimorfisme.
- **MVC**: La separació entre el model, vista i controlador està ben implementada, seguint majoritàriament els principis del patró MVC. El codi és clar i estructurat, amb algunes àrees que podrien millorar-se per aconseguir una millor modularitat i mantenibilitat.
- **Composer i Autoloading**: Composer i l'autoloading estan configurats correctament, amb una estructura de projectes ben definida.
- **Proves amb PHPUnit**: Les proves unitàries estan completes i cobreixen la majoria dels casos, incloent-hi la gestió de sessions i la lògica del joc.
- **Logger amb Monolog**: El logger està ben implementat, amb esdeveniments i errors registrats adequadament en diferents fitxers o canals.
- **Documentació amb PHPDoc**: La documentació amb PHPDoc és completa per a totes les classes i mètodes, amb descripcions clares i detallades.
- **Qualitat del Codi**: El codi està ben escrit, seguint les convencions de nomenclatura i les bones pràctiques de desenvolupament.

#### **4 punts: Excel·lent**
- **POO**: El disseny de classes està ben organitzat, és reutilitzable i implementa clarament els principis de la programació orientada a objectes. El codi és elegant i eficient.
- **MVC**: Excel·lent separació entre el model, vista i controlador, seguint rigorosament els principis del patró MVC. El codi està ben organitzat, modular i fàcil de mantenir, cosa que facilita l'escalabilitat del projecte. Hi ha una clara distinció de responsabilitats entre les diferents capes.
- **Composer i Autoloading**: S'utilitza Composer de manera excel·lent, amb una configuració avançada de l'autoloading i una estructura de projecte organitzada i modular.
- **Proves amb PHPUnit**: Les proves són exhaustives, cobrint totes les funcionalitats i considerant casos límit, amb ús de mocks quan necessari.
- **Logger amb Monolog**: S'utilitza el logger de manera avançada, amb diferents handlers per registrar informació, errors, i fer un seguiment detallat del flux del joc.
- **Documentació amb PHPDoc**: La documentació amb PHPDoc és excel·lent, ben estructurada i completa, facilitant la comprensió i el manteniment del projecte.
- **Qualitat del Codi**: El codi és de qualitat professional, net, ben organitzat, i segueix rigorosament les millors pràctiques de programació.

## 15. Autoavaluació: Programació Orientada a Objectes en PHP

#### Exercici 1: Constructors en PHP

##### Pregunta:
Quina és la funció principal d'un constructor en una classe PHP?

##### Opcions:
<form>
  <input type="radio" id="q1a" name="question1" value="a">
  <label for="q1a">a) Destruir els objectes de la classe quan ja no són necessaris.</label><br>
  <input type="radio" id="q1b" name="question1" value="b">
  <label for="q1b">b) Inicialitzar les propietats de l'objecte quan es crea.</label><br>
  <input type="radio" id="q1c" name="question1" value="c">
  <label for="q1c">c) Executar una funció arbitrària abans de cada mètode.</label><br>
  <input type="radio" id="q1d" name="question1" value="d">
  <label for="q1d">d) Crear mètodes màgics automàticament.</label><br><br>
  <input type="button" value="Comprovar" onclick="checkAnswer1()">
</form>

<p id="result1"></p>

<script>
function checkAnswer1() {
    var correctAnswer = "b";
    var radios = document.getElementsByName('question1');
    var userAnswer;
    for (var i = 0; i < radios.length; i++) {
        if (radios[i].checked) {
            userAnswer = radios[i].value;
            break;
        }
    }
    var resultText = userAnswer === correctAnswer ? "Correcte!" : "Incorrecte. La resposta correcta és b) Inicialitzar les propietats de l'objecte quan es crea.";
    document.getElementById('result1').innerText = resultText;
}
</script>

#### Exercici 2: Herència en PHP

##### Pregunta:
Quina és l'avantatge principal de l'herència en la programació orientada a objectes?

##### Opcions:
<form>
  <input type="radio" id="q2a" name="question2" value="a">
  <label for="q2a">a) Permet reutilitzar codi definint classes noves basades en classes existents.</label><br>
  <input type="radio" id="q2b" name="question2" value="b">
  <label for="q2b">b) Permet ocultar totes les propietats i mètodes de la classe.</label><br>
  <input type="radio" id="q2c" name="question2" value="c">
  <label for="q2c">c) Permet definir funcions globals sense necessitat de classes.</label><br>
  <input type="radio" id="q2d" name="question2" value="d">
  <label for="q2d">d) Permet cridar a funcions de JavaScript des de PHP.</label><br><br>
  <input type="button" value="Comprovar" onclick="checkAnswer2()">
</form>

<p id="result2"></p>

<script>
function checkAnswer2() {
    var correctAnswer = "a";
    var radios = document.getElementsByName('question2');
    var userAnswer;
    for (var i = 0; i < radios.length; i++) {
        if (radios[i].checked) {
            userAnswer = radios[i].value;
            break;
        }
    }
    var resultText = userAnswer === correctAnswer ? "Correcte!" : "Incorrecte. La resposta correcta és a) Permet reutilitzar codi definint classes noves basades en classes existents.";
    document.getElementById('result2').innerText = resultText;
}
</script>

#### Exercici 3: Polimorfisme

##### Pregunta:
Què permet el polimorfisme en el context de la POO?

##### Opcions:
<form>
  <input type="radio" id="q3a" name="question3" value="a">
  <label for="q3a">a) Permet que una funció tinga múltiples implementacions depenent de l'objecte que la cride.</label><br>
  <input type="radio" id="q3b" name="question3" value="b">
  <label for="q3b">b) Permet la creació d'objectes a partir de funcions anònimes.</label><br>
  <input type="radio" id="q3c" name="question3" value="c">
  <label for="q3c">c) Permet la connexió entre PHP i bases de dades relacionals.</label><br>
  <input type="radio" id="q3d" name="question3" value="d">
  <label for="q3d">d) Permet executar múltiples scripts PHP alhora.</label><br><br>
  <input type="button" value="Comprovar" onclick="checkAnswer3()">
</form>

<p id="result3"></p>

<script>
function checkAnswer3() {
    var correctAnswer = "a";
    var radios = document.getElementsByName('question3');
    var userAnswer;
    for (var i = 0; i < radios.length; i++) {
        if (radios[i].checked) {
            userAnswer = radios[i].value;
            break;
        }
    }
    var resultText = userAnswer === correctAnswer ? "Correcte!" : "Incorrecte. La resposta correcta és a) Permet que una funció tinga múltiples implementacions depenent de l'objecte que la cride.";
    document.getElementById('result3').innerText = resultText;
}
</script>

#### Exercici 4: Espais de Noms

##### Pregunta:
Per a què s'utilitzen els espais de noms (namespaces) en PHP?

##### Opcions:
<form>
  <input type="radio" id="q4a" name="question4" value="a">
  <label for="q4a">a) Per executar codi PHP de forma asincrònica.</label><br>
  <input type="radio" id="q4b" name="question4" value="b">
  <label for="q4b">b) Per evitar conflictes entre noms de classes, funcions o constants en diferents parts del codi.</label><br>
  <input type="radio" id="q4c" name="question4" value="c">
  <label for="q4c">c) Per definir variables globals accessibles des de qualsevol punt del codi.</label><br>
  <input type="radio" id="q4d" name="question4" value="d">
  <label for="q4d">d) Per importar codi d'altres llenguatges de programació com JavaScript.</label><br><br>
  <input type="button" value="Comprovar" onclick="checkAnswer4()">
</form>

<p id="result4"></p>

<script>
function checkAnswer4() {
    var correctAnswer = "b";
    var radios = document.getElementsByName('question4');
    var userAnswer;
    for (var i = 0; i < radios.length; i++) {
        if (radios[i].checked) {
            userAnswer = radios[i].value;
            break;
        }
    }
    var resultText = userAnswer === correctAnswer ? "Correcte!" : "Incorrecte. La resposta correcta és b) Per evitar conflictes entre noms de classes, funcions o constants en diferents parts del codi.";
    document.getElementById('result4').innerText = resultText;
}
</script>

#### Exercici 5: Traits en PHP

##### Pregunta:
Quin avantatge ofereixen els traits en PHP?

##### Opcions:
<form>
  <input type="radio" id="q5a" name="question5" value="a">
  <label for="q5a">a) Permet escriure codi reutilitzable que es pot incloure en múltiples classes, independentment de la jerarquia d'herència.</label><br>
  <input type="radio" id="q5b" name="question5" value="b">
  <label for="q5b">b) Permet la creació de funcions globals en PHP.</label><br>
  <input type="radio" id="q5c" name="question5" value="c">
  <label for="q5c">c) Permet la comunicació entre diferents servidors web.</label><br>
  <input type="radio" id="q5d" name="question5" value="d">
  <label for="q5d">d) Permet executar codi PHP dins de plantilles HTML.</label><br><br>
  <input type="button" value="Comprovar" onclick="checkAnswer5()">
</form>

<p id="result5"></p>

<script>
function checkAnswer5() {
    var correctAnswer = "a";
    var radios = document.getElementsByName('question5');
    var userAnswer;
    for (var i = 0; i < radios.length; i++) {
        if (radios[i].checked) {
            userAnswer = radios[i].value;
            break;
        }
    }
    var resultText = userAnswer === correctAnswer ? "Correcte!" : "Incorrecte. La resposta correcta és a) Permet escriure codi reutilitzable que es pot incloure en múltiples classes, independentment de la jerarquia d'herència.";
    document.getElementById('result5').innerText = resultText;
}
</script>

#### Exercici 6: Excepcions en PHP

##### Pregunta:
Quina és la finalitat d'utilitzar excepcions en PHP?

##### Opcions:
<form>
  <input type="radio" id="q6a" name="question6" value="a">
  <label for="q6a">a) Evitar l'execució de codi mal format.</label><br>
  <input type="radio" id="q6b" name="question6" value="b">
  <label for="q6b">b) Gestionar errors i condicions excepcionals de manera controlada dins d'una aplicació.</label><br>
  <input type="radio" id="q6c" name="question6" value="c">
  <label for="q6c">c) Declarar funcions dins d'una classe.</label><br>
  <input type="radio" id="q6d" name="question6" value="d">
  <label for="q6d">d) Garantir que totes les variables estiguen inicialitzades abans del seu ús.</label><br><br>
  <input type="button" value="Comprovar" onclick="checkAnswer6()">
</form>

<p id="result6"></p>

<script>
function checkAnswer6() {
    var correctAnswer = "b";
    var radios = document.getElementsByName('question6');
    var userAnswer;
    for (var i = 0; i < radios.length; i++) {
        if (radios[i].checked) {
            userAnswer = radios[i].value;
            break;
        }
    }
    var resultText = userAnswer === correctAnswer ? "Correcte!" : "Incorrecte. La resposta correcta és b) Gestionar errors i condicions excepcionals de manera controlada dins d'una aplicació.";
    document.getElementById('result6').innerText = resultText;
}
</script>

#### Exercici 7: Autoloading en PHP

##### Pregunta:
Quin avantatge ofereix l'autoloading en PHP?

##### Opcions:
<form>
  <input type="radio" id="q7a" name="question7" value="a">
  <label for="q7a">a) Permet que les classes es carreguen automàticament quan s'utilitzen, sense necessitat de fer incloure manualment cada fitxer.</label><br>
  <input type="radio" id="q7b" name="question7" value="b">
  <label for="q7b">b) Permet l'execució de múltiples scripts alhora.</label><br>
  <input type="radio" id="q7c" name="question7" value="c">
  <label for="q7c">c) Permet la manipulació de fitxers en el servidor.</label><br>
  <input type="radio" id="q7d" name="question7" value="d">
  <label for="q7d">d) Permet la connexió amb bases de dades.</label><br><br>
  <input type="button" value="Comprovar" onclick="checkAnswer7()">
</form>

<p id="result7"></p>

<script>
function checkAnswer7() {
    var correctAnswer = "a";
    var radios = document.getElementsByName('question7');
    var userAnswer;
    for (var i = 0; i < radios.length; i++) {
        if (radios[i].checked) {
            userAnswer = radios[i].value;
            break;
        }
    }
    var resultText = userAnswer === correctAnswer ? "Correcte!" : "Incorrecte. La resposta correcta és a) Permet que les classes es carreguen automàticament quan s'utilitzen, sense necessitat de fer incloure manualment cada fitxer.";
    document.getElementById('result7').innerText = resultText;
}
</script>

# Exercicis de recuperació de PHP

## DAMERO

### Part 1. Pintar Tauler

#### Exercici 1.1 Pintar Tauler

Fes un programa que pinte un tauler de damas. El tauler ha de ser de 8x8 i ha de ser de colors. Pots utilitzar la següent taula de colors:

```css
body {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    background-color: #f0f0f0;
}

.taula-de-dames {
    display: grid;
    grid-template-columns: repeat(8, 50px);
    grid-template-rows: repeat(8, 50px);
    gap: 2px;
}

.taula-de-dames div {
    width: 50px;
    height: 50px;
    display: flex;
    justify-content: center;
    align-items: center;
}

.negre {
    background-color: #444;
}

.blanc {
    background-color: #fff;
}
```

Partim del següent fitxer
```html
<!DOCTYPE html>
<html lang="ca">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Taula de Dames</title>
    <link rel="stylesheet" href="../css/damero.css">
</head>
<body>
<div class="container">
    <div class="taula-de-dames">
        <?= $partida->getTauler() ?>
    </div>
</div>
<form id="movimentForm" action="index.php" method="POST" style="display:none;">
    <input type="hidden" name="origenFila" id="origenFila">
    <input type="hidden" name="origenColumna" id="origenColumna">
    <input type="hidden" name="destinoFila" id="destinoFila">
    <input type="hidden" name="destinoColumna" id="destinoColumna">
</form>
<script src="../javascript/moviment.js"></script>
</body>
</html>
```

Guarda el fitxer com a `tauler.view.php` referència-lo des de `index.php`.

#### Exercici 1.2 Classe Tauler

Crea una classe `Tauler` que siga capaç de pintar el tauler de la forma que s'ha indicat en l'exercici anterior. La classe ha de tindre un mètode `__toString` que pinte el tauler.

A més la classe tauler acceptarà el paràmetre `tamany` que per defecte serà 8. La classe anirà dins d'un  directori `classes`.

Utilitza esta classe des de la vista tauler per a pintar el tauler.

#### Exercici 1.3 Classe casella

Crea una classe `Casella` que represente una casella del tauler. La classe tindrà un atribut `color` que serà `blanc` o `negre` i un mètode `__toString` que pintarà la casella.
A més tindrà un atribut  `ocupant` que serà `null` si està buida, o `jugador1`, `jugador2`.
Tam bé tindrà un atribut `fila` i `columna` que indicarà la posició de la casella.

#### Exercici 1.3 Posició inicial

En la classe `Tauler`, crea un mètode `taulerInicial` per inicialitzar el tauler amb fitxes per als dos jugadors en les posicions correctes. 

Hauras de crear un array en el constructor de la classe `Tauler` per a guardar les caselles.

```php
class Tauler {
    private $tamany; // Tamany del tauler, típicament 8 per a dames
    private $caselles;

    public function __construct($tamany = 8) {
        $this->tamany = $tamany;
        $this->inicialitzarCaselles();
    }
```
Crea un mètode per obtenir les caselles del tauler.

Utilitza aquest .css actualitzat.

```css
body {
display: flex;
justify-content: center;
align-items: center;
height: 100vh;
background-color: #f0f0f0;
}

.taula-de-dames {
display: grid;
grid-template-columns: repeat(8, 60px); /* Ajusta la mida de les caselles */
grid-template-rows: repeat(8, 60px);
gap: 2px;
}

.negre {
background-color: #769656; /* Color verd fosc per a les caselles jugables */
}

.blanc {
background-color: #eeeed2; /* Color clar per a les caselles no jugables */
}

.taula-de-dames div.negre, .taula-de-dames div.blanc {
width: 60px; /* Ajusta la mida de les caselles */
height: 60px;
display: flex;
justify-content: center;
align-items: center;
position: relative; /* Permet posicionament absolut dins */
}

.taula-de-dames div.negre::before, .taula-de-dames div.blanc::before {
content: '';
width: 80%; /* Ajusta la mida del marcador de la fitxa */
height: 80%; /* Ajusta la mida del marcador de la fitxa */
border-radius: 50%;
position: absolute;
}

.taula-de-dames div.negre.fitxa-jugador1::before {
background-color: #fff; /* Color de les fitxes del jugador 1 */
box-shadow: 0 2px 4px rgba(0,0,0,0.3);
}

.taula-de-dames div.negre.fitxa-jugador2::before {
background-color: #000; /* Color de les fitxes del jugador 2 */
box-shadow: 0 2px 4px rgba(255,255,255,0.3);
}
```

#### Exercici 1.4 Moviment de fitxes

Crea un mètode `moureFitxa` en la classe `Tauler` que reba la posició inicial i la posició final de la fitxa a moure. El mètode comprovarà si el moviment és vàlid i si ho és, mourà la fitxa.
S'ha de comprovar que les coordenades estiguen dins del tauler, que la casella de destí estiga lliure i que el moviment és cap a davant.
Podrem comprovar que funciona modificant el fitxer `index.php` de la següent manera:
    
```php
$tauler = new Tauler();
if ($tauler->moureFitxa(2, 1, 3, 0)) {
    echo "Moviment realitzat amb èxit!";
} else {
    echo "Moviment invàlid.";
}
include_once './views/tauler.view.php';
```
 

#### Exercici 1.5 Pintar Coordenades

Pinta les coordenades del tauler. Pots utilitzar la següent taula de colors:

```css
.capcalera-coordenades, .buit {
    width: 60px;
    height: 30px; /* Ajusta segons necessitat */
}
.coordenada {
    display: flex;
    justify-content: center;
    align-items: center;
    width: 60px;
    height: 30px; /* Ajusta segons necessitat */
    font-family: Arial, sans-serif;
    font-size: 14px;
}

```

Cal pintar-les baix i dalt, a la dreta i a l'esquerra.

#### Exercici 1.6 Javascript

Afegix el següent javascript i enllaça-lo a tauler.view.php

```javascript
 document.addEventListener('DOMContentLoaded', () => {
    const fitxes = document.querySelectorAll('.fitxa[draggable="true"]');
    let fitxaArrossegada = null;

    fitxes.forEach(fitxa => {
        fitxa.addEventListener('dragstart', e => {
            fitxaArrossegada = fitxa;
            e.dataTransfer.setData('text/plain', null); // Necessari per a alguns navegadors
        });
    });

    const caselles = document.querySelectorAll('.casella');
    caselles.forEach(casella => { // Corregit per utilitzar forEach amb 'casella'
        casella.addEventListener('dragover', e => e.preventDefault()); // Permetre drop
        casella.addEventListener('drop', function(e) {
            e.preventDefault();
            if (!fitxaArrossegada) return; // Comprova si hi ha una fitxa arrossegada

            const origen = fitxaArrossegada.parentNode.dataset;
            const destino = this.dataset; // Utilitza 'this' per referir-se a la casella sobre la qual es fa el drop

            // Suposem que tens els inputs en el teu formulari per aquests valors
            document.getElementById('origenFila').value = origen.fila;
            document.getElementById('origenColumna').value = origen.columna;
            document.getElementById('destinoFila').value = destino.fila;
            document.getElementById('destinoColumna').value = destino.columna;

            document.getElementById('movimentForm').submit(); // Envía el formulari
        });
    });
});
```

Afegeix `draggable="true"` al dibuixar les caselles ocupades.

```php
public function __toString()
{

        $string =  "<div class='casella {$this->color}' data-fila='{$this->fila}' data-columna='{$this->columna}'>";
        if ($this->ocupant){
            $classeOcupant = $this->ocupant ? "fitxa-{$this->ocupant}" : "";
            $draggable = $this->ocupant ? 'draggable="true"' : '';
            $string .= "<div class='fitxa {$this->color} {$classeOcupant}' {$draggable}></div>";
        }
        $string .= "</div>";
        return $string;
    }
```

### Part 2. Pintar Tauler

#### Exercici 2.1 Sessions i composer

Afegix en el autoload de composer la carpeta `classes` per a que pugues utilitzar les classes des de qualsevol lloc del teu projecte amb el namespace Damero

```php
"autoload": {
        "psr-4": {
            "Damero\\": "src/classes"
        }
    },
```
Afegix en les classes el namespace `Damero` i utilitza `composer dump-autoload` per a que es carreguen les classes.

Crea un fitxer `load.php` que carregue el autoload i que carregue la variable de sessió $_SESSION['tauler'] o la cree si no existeix.

Fes que el fitxer `index.php` carregue el `load.php`. 

#### Exercici 2.2: Formulari de moviment

Crea un formulari que permeti moure les fitxes del tauler. El formulari tindrà dos camps de text per a les coordenades inicials i finals i un botó per a enviar el formulari.

```php
<form id="movimentForm" action="index.php" method="POST" style="display:none;">
        <input type="hidden" name="origenFila" id="origenFila">
        <input type="hidden" name="origenColumna" id="origenColumna">
        <input type="hidden" name="destinoFila" id="destinoFila">
        <input type="hidden" name="destinoColumna" id="destinoColumna">
</form>
```

El formulari estarà ocult i el procesarà el javascript en moure una fitxa.



Modificat el fitxer `index.php` per a que processe el moviment i el guarde en la sessió.

```php  
    require_once $_SERVER['DOCUMENT_ROOT'].'/load.php';
   
    // TODO: Llegir el formulari
    // TODO : mourefitxa tauler
    
```

#### Exercici 2.3: Captura

Utilitza el codi següent per fer una captura i integra-lo dins del procediment per a moure la fitxa `moureFitxa`.
Primer 

```php
    $diferenciaFila = abs($destiFila - $origenFila);
    $diferenciaColumna = abs($destiColumna - $origenColumna); 
    if ($diferenciaFila === 2 && $diferenciaColumna === 2) {
            // Calcular la posició de la fitxa a ser capturada
        $filaCaptura = ($origenFila + $destiFila) / 2;
        $columnaCaptura = ($origenColumna + $destiColumna) / 2;
        $casellaCaptura = $this->caselles[$filaCaptura][$columnaCaptura];
        $casellaOrigen = $this->caselles[$origenFila][$origenColumna];

        // Comprovar si la casella conté una fitxa de l'oponent
        if ($casellaCaptura->ocupant && $casellaCaptura->ocupant !== $casellaOrigen->ocupant) {
            // Realitzar la captura
            $casellaCaptura->ocupant = null;
        }
    }
```

Extrau el codi que fa moure la fitxa de posició fora d'este procediment a un metode mou que pot utilitzar també el procediment de moureFitxa.
    
```php
    $casellaDesti->ocupant = $casellaOrigen->ocupant;
    $casellaOrigen->ocupant = null;
    $_SESSION['tauler'] = serialize($this);
```

Crea un fitxer  per començar una partida nova `nouJoc.php` que carregue el tauler i el guarde en la sessió, i redirigixca a `index.php`.

#### Exercici 2.4: Refactoritzar codi

Crea el següent mètodes en la classe `Tauler`:

* `coordenades_correctes($origenFila, $origenColumna, $destiFila, $destiColumna)` que comprovarà si les coordenades estan dins del tauler.
* `moviment_correcte($casellaOrigen, $casellaDesti)` que comprovarà si el moviment és correcte.
* `captura_correcta($casellaOrigen, $casellaDesti)` que comprovarà si la captura és correcta.

Estos mètodes llançaran una exempció amb el missatge d'error que serà capturada en  `moure_fitxa()` i es mostrarà en el tauler utilitzant el següent css

```css
#missatgeError {
    color: red;
    text-align: center;
    margin-bottom: 10px;
    background-color: #fff3f3;
    border: 1px solid red;
    padding: 5px;
}
```

Crea un mètode per pintar les coordenades de l'esquerra i de la dreta del tauler.

### Part 3. Partida

#### Exercici 3.1: Classe Partida

Crea una classe `Partida` que tinga un tauler i que siga capaç de guardar la partida en la sessió. La classe tindrà un mètode `nouJoc` que crearà un nou tauler i el guardarà en la sessió.

Haurà de tenir els següents attributs privats:

    * Tauler
    * Torn Actual
    * Estat de joc 
    * Guanyador

I a banda dels getters, els següents mètodes:
    
    * canviarTorn()
    * moureFitxa($origenFila, $origenColumna, $destiFila, $destiColumna) 
    * comprovarEstatJoc()

Modifica el mètode de `Tauler` `moureFitxa` per tal que accepte un paràmetre més `$tornActual`.
El mètode ara haurà de comprovar que el torn actual siga el mateix que el de la fitxa a moure, per a lo que 
afegirem un mètode més que serà `tornCorrecte($casellaOrigen, $tornActual)`.

Ara la lògica del joc recau en el mètode moureFitxa de la classe Partidal, i hauràs de refactoritzar el fitxers `load.php`,`index.php` i `tauler.view.php`.

#### Exercici 3.2: Refactorització

Crea un mètode en `partida` `finalitzada()` que comprove si l'estat del joc és `acabat`.

Fes que les exempcions de moviments incorrectes es capturen en el fitxer `index.php` en conte de en `moure_fitxa()`.

Fes que en la variable que es guarde en la sessió siga la partida en conte del taules.

Crea un procediment `getColumna()` en la classe `Casella` per mostrar la lletra de la columna, a partide la A.

#### Exercici 3.3: Finalització del joc

Crea un mètode `comptarFitxes($jugador)` en la classe `Tauler` que compte el numero de fitxes del jugador que queden en el tauler

Afegix els següents mètodes a la clase `Tauler`

```php
    public function potMoure($jugador) {
        for ($fila = 1; $fila <= $this->tamany; $fila++) {
            for ($columna = 1; $columna <= $this->tamany; $columna++) {
                $casellaActual = $this->caselles[$fila][$columna];
                if ($casellaActual->ocupant === $jugador) {
                    if ($this->comprovarMovimentsFitxa($casellaActual, $jugador)) {
                        return true; // Hi ha almenys un moviment vàlid.
                    }
                }
            }
        }
        return false; // No s'ha trobat cap moviment vàlid.
    }

    private function comprovarMovimentsFitxa($casella, $jugador) {
        $direccions = $jugador === 'jugador1' ? [[1, -1], [1, 1]] : [[-1, -1], [-1, 1]]; // Direccions de moviment per a cada jugador

        foreach ($direccions as $direccio) {
            $destiFila = $casella->fila + $direccio[0];
            $destiColumna = $casella->columna + $direccio[1];
            $desti = $this->caselles[$destiFila][$destiColumna]??null;

            // Comprovar moviment simple
            if ($this->esMovimentValid($casella, $desti)) {

                return true;
            }

            // Comprovar captura
            $destiFilaCaptura = $casella->fila + 2 * $direccio[0];
            $destiColumnaCaptura = $casella->columna + 2 * $direccio[1];
            $desti = $this->caselles[$destiFilaCaptura][$destiColumnaCaptura]??null;
            if ($this->esCapturaValida($casella, $desti)) {
                return true;
            }
        }

        return false;
    }

    private function esMovimentValid($origen,$desti) {
        try {
            $this->movimentCorrecte($origen,$desti);
            return true;
        } catch (\Exception $e){
            return false;
        }

    }

    private function esCapturaValida($origen,$desti) {
        try {
            return $this->capturaCorrecta($origen,$desti,false);
        } catch (\Exception $e){
            return false;
        }
    }
}
```

Modifica el màtode `capturaCorrecta()` per a que accepte un paràmetre boolean `$captura` per a que efectue la captura realment o simplement comprove si és possible.

```php
private function capturaCorrecta($casellaOrigen,$casellaDesti,$captura = true): bool {
    if ($casellaOrigen && $casellaDesti) {
        $diferenciaFila = abs($casellaDesti->fila - $casellaOrigen->fila);
        $diferenciaColumna = abs($casellaDesti->columna - $casellaOrigen->columna);
        if ($diferenciaFila === 2 && $diferenciaColumna === 2) {
            // Calcular la posició de la fitxa a ser capturada
            $filaCaptura = ($casellaOrigen->fila + $casellaDesti->fila) / 2;
            $columnaCaptura = ($casellaOrigen->columna + $casellaDesti->columna) / 2;
            $casellaCaptura = $this->caselles[$filaCaptura][$columnaCaptura];

            // Comprovar si la casella conté una fitxa de l'oponent
            if ($casellaCaptura->ocupant && $casellaCaptura->ocupant !== $casellaOrigen->ocupant) {
                // Realitzar la captura
                if ($captura) {
                    $casellaCaptura->ocupant = null;
                } else {
                    return true;
                }
            }
        }
    }
    return false;
}
```

En `partida.php` modificar el mètode `comprovarEstatJoc()` per a que comprove si hi ha un jugador sense fitxes o el jugador actual pot moure fitxes, i si no pot, finalitzar el joc. 

#### Exercici 3.4: Arreplegar el moviment del formulari

En el fitxer `index.php` fes que si arriba un mètode post, arreplegue les dades del formulari i efectue el moviment.
Si arriba un esdeveniment, carrega una variable d'error amb el missatge corresponent i mostra-lo al tauler.
Crea una classe `Exempcions\MovimentException.php` i substituix totes les exempcions de moviments per esta.

#### Exercici 3.5: Captura Obligada

En el procediment `moureFitxa` de la classe `Partida` afegix una variable que indique si el jugador ha de capturar una fitxa que haurà de retornar el mètode`comprovarEstatJoc` de la classe `Tauler`.

```php
    $obligat = $this->comprovarEstatJoc();
```

Ara el procediment `captura` haurà d'acceptar un camp més per obligar-lo a capturar.

```php
$captura = $this->tauler->moureFitxa($origenFila, $origenColumna, $destiFila, $destiColumna, $this->tornActual,$obligat);
```

I el mètode `moureFitxa` de la classe `Tauler` haurà de comprovar també si el jugador ha de capturar fitxes.

```php
    public function moureFitxa($origenFila, $origenColumna, $destiFila, $destiColumna, $tornActual,$obligat =false,$doblecaptura = null) {

        $this->coordenadesCorrectes($origenFila, $origenColumna, $destiFila, $destiColumna);
        $casellaOrigen = $this->caselles[$origenFila][$origenColumna];
        $this->tornCorrecte($casellaOrigen, $tornActual,$doblecaptura);
        $casellaDesti = $this->caselles[$destiFila][$destiColumna];

        // Verificar que la casella d'origen té una fitxa i la de destinació està buida
        if (!$this->capturaCorrecta($casellaOrigen, $casellaDesti)){
            if (!$obligat) {
                $this->movimentCorrecte($casellaOrigen, $casellaDesti);
                $this->mou($casellaOrigen, $casellaDesti);
                return null;
            } else {
                throw new MovementException('Has de capturar');
            }
        } else {
            $this->mou($casellaOrigen, $casellaDesti);
            return $casellaDesti;
        }
    }
    
    public function potMoure($jugador) {
        $teCaptures = false;

        for ($fila = 1; $fila <= $this->tamany; $fila++) {
            for ($columna = 1; $columna <= $this->tamany; $columna++) {
                $casellaActual = $this->caselles[$fila][$columna];
                if ($casellaActual->ocupant === $jugador) {
                    // Primer, comprova si hi ha captures disponibles per aquesta fitxa
                    if ($this->teCapturesDisponibles($casellaActual)) {
                        $teCaptures = true;
                    }
                }
            }
        }
        if ($teCaptures) {
            // Si hi ha captures disponibles, el jugador ha de capturar
            return 1;
        }
        for ($fila = 1; $fila <= $this->tamany; $fila++) {
            for ($columna = 1; $columna <= $this->tamany; $columna++) {
                $casellaActual = $this->caselles[$fila][$columna];
                if ($casellaActual->ocupant === $jugador) {
                    if ($this->comprovarMovimentsFitxa($casellaActual)) {
                        return 2; // Hi ha almenys un moviment vàlid.
                    }
                }
            }
        }
        return 0; // No s'ha trobat cap moviment vàlid.
    }

    public function teCapturesDisponibles($casella) {
        $direccions = $this->obtenirMovimentsPosibles($casella->ocupant);
        foreach ($direccions as $direccio) {
            $destiFilaCaptura = $casella->fila + 2 * $direccio[0];
            $destiColumnaCaptura = $casella->columna + 2 * $direccio[1];
            $desti = $this->caselles[$destiFilaCaptura][$destiColumnaCaptura]??null;
            if ( $this->capturaCorrecta($casella,$desti,false)) {
                return true;
            }
        }
        return false;
    }

    private function obtenirMovimentsPosibles($jugador) {
        // Retorna les direccions de captura basades en el jugador
        // Això pot variar si estàs implementant dames que poden moure's/capturar en qualsevol direcció
        return $jugador === 'jugador2' ? [[1, -1], [1, 1]] : [[-1, -1], [-1, 1]];
    }
```



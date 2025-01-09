# Solucions

## Tema 2: Introducció a PHP

#### Exercici 1: Manipulació de Variables i Operadors

Assigna múltiples variables i utilitza operadors aritmètics i lògics. Mostra el resultat de cada operació.


```php
<html>
<?php 
    $a = 10;
    $b = 5;
    $c = 3;
?>    
<body>
    
    <table style='border: 1px solid'>
        <thead>
            <tr>
                <th>Operació</th>
                <th>a i b</th>
                <th>b i c</th>
                <th>a i c</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>+</td>
                <td><?= $a+$b ?></td>
                <td><?= $b+$c ?></td>
                <td><?= $a+$c ?></td>
            </tr> 
            <tr><td>-</td><td><?= $a-$b ?></td><td><?= $b-$c ?></td><td><?= $a-$c ?></td></tr> 
            <tr><td>*</td><td><?= $a*$b ?></td><td><?= $b*$c ?></td><td><?= $a*$c ?></td></tr> 
            <tr><td>/</td><td><?= $a/$b ?></td><td><?= $b/$c ?></td><td><?= $a/$c ?></td></tr> 
        </tbody>        
    </table> 

</body>
</html>
```

#### Exercici 2: Control de Flux amb Bucles

Utilitza un bucle `for` per imprimir els números parells del 0 al 20.
Fes-ho també amb un bucle `while`.

```php
 <html>
    <body>
        <ul>
            <?php
            for($i=2;$i<20;$i=$i+2){
            ?>    
                <li><?= $i ?></li>
            <?php    
            }
            ?>
            <?php
           
            do {
                echo "<li>$i</li>";
                $i = $i -2;
            } while ($i>0)
            ?>
        </ul>
    </body>
</html>
```


#### Exercici 3: Treballar amb Arrays i Funcions

Escriu una funció que prenga un array de números, calculi la mitjana i retorni el resultat. Utilitza aquesta funció per imprimir la mitjana d'un array de cinc números.

```php
<?php 
include_once "helpers/funciones.php";

$numeros = array(45,3,46,7,8,9,12,90);

echo media($numeros);
 
```

```php
<?php
function media(Array $numeros){
    return array_sum($numeros) / count($numeros);
}
```
 

#### Exercici 4: Manipulació de Strings

Escriu un script que prenga una cadena de text i compti el nombre de vocals. Imprimeix el resultat.

```php
<?php
include_once "helpers/funciones.php";

$cadena = "Men to the left beucase women are always right.AEIOU";

echo contar_vocales(strtolower($cadena));
```

```php
<?php
function contar_vocales($sentence){
    $vocales = ['a','e','i','o','u'];
    $total = 0;
    foreach ($vocales as $vocal){
        $total += substr_count($sentence,$vocal);
    }
    return $total;
}
```

#### Exercici 5: Arrays Multidimensionals

Crea un array multidimensional que represente una taula de multiplicar del 1 al 5 i imprimeix els resultats en forma de taula.

```php
<?php


$tabla = [];
$quantes = 13;
$fins = 60;


for ($i= 1; $i<= $quantes;$i++){
    for ($j=1 ; $j<= $fins; $j++){
        $tabla[$i][$j] = $i * $j;
    }
}

?>

<body> 
    <table style='border: 1px solid'>
        <thead>
            <tr>
                <th>Multiplicar</th>
                <?php
                for ($j = 1; $j<= $fins ; $j++){
                    ?>
                    <th><?= $j ?>
                <?php } ?>
            </tr>
        </thead>
        <tbody>     
            <?php for ($i = 1; $i<= $quantes ; $i++){ ?>
                <tr>
                <th><?= $i ?></th>
                <?php for ($j=1;$j<= $fins; $j++){ ?>
                    <td><?= $tabla[$i][$j] ?></td>    
                <?php } ?>
                </tr>
            <?php } ?>
        </tbody>        
    </table> 
</body>
</html>

```


#### Exercici 6: Utilitzant `match` per a categoritzar

Crea un fitxer que utilitze la instrucció `match` per categoritzar una variable `$nota` segons el següent criteri:
- Si la nota és 10, imprimir "Excel·lent".
- Si la nota és 8 o 9, imprimir "Molt bé".
- Si la nota és 5, 6 o 7, imprimir "Bé".
- Per qualsevol altra nota, imprimir "Insuficient".
    
```php
  <html>
    <body>
        <?php
     $nota = 7;

    $qualificacio= match (true) {
        $nota === 10 => 'Excel.lent',
        $nota >= 8 && $nota < 10 => 'Molt bé',
        $nota >= 5 && $nota < 8 => 'Bé',
        default => 'Insuficient',
    };

    echo $qualificacio;
    ?>
    </body>
</html>
```

#### Exercici 7: Validació de Formularis

Crea un formulari en HTML que permetis als usuaris introduir el seu nom, el correu electrònic i un password (dues vegades). Després de l'enviament del formulari, valida que tots els camps han estat completats i que el correu electrònic és vàlid, que el password tinga complexitat i que coincidixen. Mostra un missatge d'error si alguna validació falla, i si tot és correcte, mostra un missatge confirmant que l'usuari s'ha registrat correctament.

```php
<?php

// Funció per processar l'entrada
function test_input($data) {
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data);
    return $data;
}

// Inicialitzar variables d'error i missatge de confirmació
$error = array();
$name = $email = $password = $confirmPassword = "";
$successMessage = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Validar el nom
    if (empty($_POST["name"])) {
        $error['name'] = "El nom és obligatori";
    } else {
        $name = test_input($_POST["name"]);
    }

    // Validar el correu electrònic
    if (empty($_POST["email"])) {
        $error['email'] = "El correu electrònic és obligatori";
    } else {
        $email = test_input($_POST["email"]);
        if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
            $error['email'] = "El format del correu electrònic no és vàlid";
        }
    }

    // Validar la contrasenya
    if (empty($_POST["password"])) {
        $error['password'] = "La contrasenya és obligatòria";
    } else {
        $password = test_input($_POST["password"]);
        // Comprovar la complexitat de la contrasenya (mínim 8 caràcters, majúscula, minúscula i un número)
        if (!preg_match("/^(?=.*[A-Z])(?=.*[a-z])(?=.*\d).{8,}$/", $password)) {
            $error['password'] = "La contrasenya ha de tenir almenys 8 caràcters, una majúscula, una minúscula i un número";
        }
    }

    // Validar la confirmació de la contrasenya
    if (empty($_POST["confirm_password"])) {
        $error['confirm_password'] = "Has de confirmar la contrasenya";
    } else {
        $confirmPassword = test_input($_POST["confirm_password"]);
        if ($password !== $confirmPassword) {
            $error['confirm_password'] = "Les contrasenyes no coincideixen";
        }
    }

    // Si no hi ha errors, mostrar missatge d'èxit
    if (!count($error)) {
        $successMessage = "L'usuari s'ha registrat correctament!";
    }
}




?>

<!DOCTYPE html>
<html lang="ca">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulari de registre</title>
</head>
<body>

<h2>Formulari de registre</h2>

<!-- Mostrar missatge d'èxit si l'usuari s'ha registrat -->
<?php if ($successMessage): ?>
    <p style="color: green;"><?= $successMessage; ?></p>
<?php else: ?>

<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>">
    Nom: <input type="text" name="name" value="<?= $name; ?>">
    <span style="color: red;"><?= $error['name']??''; ?></span>
    <br><br>

    Correu electrònic: <input type="text" name="email" value="<?php echo $email; ?>">
    <span style="color: red;"><?php echo $error['email']??''; ?></span>
    <br><br>

    Contrasenya: <input type="password" name="password">
    <span style="color: red;"><?php echo $error['password']??''; ?></span>
    <br><br>

    Confirmar contrasenya: <input type="password" name="confirm_password">
    <span style="color: red;"><?php echo $error['confirm_password']??''; ?></span>
    <br><br>

    <input type="submit" value="Registrar">
</form>
<?php endif; ?>

</body>
</html>
```

#### Exercici 8: Processament de Formularis amb Select i Radio Buttons

A partir del formulari [newBook.php](recursos/newBook.php), fes que el mòdul i el estat els agafe de valors introduïts en arrays. Mostra el resultat en una taula.

```php
<?php
// Arrays de valors per a "Mòdul" i "Estat"
$modules = ["mat" => "Matemàtiques","his" => "Història","cie" => "Ciències", "lit"=>"Literatura"];
$statuses = ["Disponible", "No disponible", "Pròximament"];

// Inicialitzar variables per emmagatzemar els valors introduïts
$module = $publisher = $price = $pages = $status = $comments = "";

// Comprovar si el formulari ha estat enviat
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $module = $_POST['module'];
    $publisher = $_POST['publisher'];
    $price = $_POST['price'];
    $pages = $_POST['pages'];
    $status = $_POST['status'];
    $comments = $_POST['comments'];
}
?>

<!DOCTYPE html>
<html lang="ca">
<head>
    <meta charset="UTF-8">
    <title>Alta Llibre</title>
    <style>
        .error {
            color: red;
        }
        table, th, td {
            border: 1px solid black;
            border-collapse: collapse;
            padding: 10px;
        }
    </style>
</head>
<body>

<form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post" enctype="multipart/form-data">
    <div>
        <label for="module">Mòdul:</label>
        <select id="module" name="module">
            <?php foreach ($modules as $key => $mod): ?>
                <option value="<?php echo $key; ?>"><?php echo $mod; ?></option>
            <?php endforeach; ?>
        </select>
    </div>
    
    <div>
        <label for="publisher">Editorial:</label>
        <input type="text" id="publisher" name="publisher" value="<?php echo $publisher; ?>">
    </div>

    <div>
        <label for="price">Preu:</label>
        <input type="text" id="price" name="price" value="<?php echo $price; ?>">
    </div>

    <div>
        <label for="pages">Pàgines:</label>
        <input type="text" id="pages" name="pages" value="<?php echo $pages; ?>">
    </div>

    <div>
        <label for="status">Estat:</label>
        <?php foreach ($statuses as $stat): ?>
            <input type="radio" name="status" value="<?php echo $stat; ?>" <?php if ($status == $stat) echo "checked"; ?>>
            <?php echo $stat; ?>
        <?php endforeach; ?>
    </div>

    <div>
        <label for="photo">Foto:</label>
        <input type="file" id="photo" name="photo">
    </div>

    <div>
        <label for="comments">Comentaris:</label>
        <textarea id="comments" name="comments"><?php echo $comments; ?></textarea>
    </div>

    <div>
        <button type="submit">Donar d'alta</button>
    </div>
</form>

<?php if ($_SERVER["REQUEST_METHOD"] == "POST"): ?>
    <h2>Dades introduïdes:</h2>
    <table>
        <tr>
            <th>Mòdul</th>
            <th>Editorial</th>
            <th>Preu</th>
            <th>Pàgines</th>
            <th>Estat</th>
            <th>Comentaris</th>
        </tr>
        <tr>
            <td><?php echo $modules[$module]; ?></td>
            <td><?php echo $publisher; ?></td>
            <td><?php echo $price; ?></td>
            <td><?php echo $pages; ?></td>
            <td><?php echo $status; ?></td>
            <td><?php echo $comments; ?></td>
        </tr>
    </table>
<?php endif; ?>

</body>
</html>
```

#### Exercici 9: Pujar imatges des de formulari

A partir del formulari anterior fes que es puga pujar una imatge. Mostra la imatge en la taula.

```php
<?php
// Arrays de valors per a "Mòdul" i "Estat"
$modules = ["Matemàtiques", "Història", "Ciències", "Literatura"];
$statuses = ["Disponible", "No disponible", "Pròximament"];

// Inicialitzar variables per emmagatzemar els valors introduïts
$module = $publisher = $price = $pages = $status = $comments = $imagePath = "";
$imageError = "";

// Comprovar si el formulari ha estat enviat
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $module = $_POST['module'];
    $publisher = $_POST['publisher'];
    $price = $_POST['price'];
    $pages = $_POST['pages'];
    $status = $_POST['status'];
    $comments = $_POST['comments'];

    // Gestionar la pujada de la imatge
    if (isset($_FILES['photo']) && $_FILES['photo']['error'] == 0) {
        // Definir el directori on es pujarà la imatge
        $targetDir = "uploads/";
        // Agafar el nom del fitxer
        $fileName = basename($_FILES["photo"]["name"]);
        $fileType = pathinfo($fileName, PATHINFO_EXTENSION);
        $permitted_chars = '0123456789abcdefghijklmnopqrstuvwxyz';

        $newFileName = substr(str_shuffle($permitted_chars), 0, 10).".$fileType";
        // Definir la ruta completa per guardar la imatge
        $targetFilePath = $targetDir . $newFileName;
        // Comprovar el tipus de fitxer
        
        // Permetre només imatges (formats png, jpg, jpeg, gif)
        $allowedTypes = ['jpg', 'jpeg', 'png', 'gif'];
        if (in_array(strtolower($fileType), $allowedTypes)) {
            // Intentar moure la imatge pujada al directori definit
            if (move_uploaded_file($_FILES["photo"]["tmp_name"], $targetFilePath)) {
                $imagePath = $targetFilePath;
            } else {
                $imageError = "No s'ha pogut pujar la imatge.";
            }
        } else {
            $imageError = "Només es permeten arxius de tipus JPG, JPEG, PNG, GIF.";
        }
    } else {
        $imageError = "Si us plau, selecciona una imatge per pujar.";
    }
}
?>

<!DOCTYPE html>
<html lang="ca">
<head>
    <meta charset="UTF-8">
    <title>Alta Llibre</title>
    <style>
        .error {
            color: red;
        }
        table, th, td {
            border: 1px solid black;
            border-collapse: collapse;
            padding: 10px;
        }
    </style>
</head>
<body>

<form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post" enctype="multipart/form-data">
    <div>
        <label for="module">Mòdul:</label>
        <select id="module" name="module">
            <?php foreach ($modules as $mod): ?>
                <option value="<?php echo $mod; ?>"><?php echo $mod; ?></option>
            <?php endforeach; ?>
        </select>
    </div>
    
    <div>
        <label for="publisher">Editorial:</label>
        <input type="text" id="publisher" name="publisher" value="<?php echo $publisher; ?>">
    </div>

    <div>
        <label for="price">Preu:</label>
        <input type="text" id="price" name="price" value="<?php echo $price; ?>">
    </div>

    <div>
        <label for="pages">Pàgines:</label>
        <input type="text" id="pages" name="pages" value="<?php echo $pages; ?>">
    </div>

    <div>
        <label for="status">Estat:</label>
        <?php foreach ($statuses as $stat): ?>
            <input type="radio" name="status" value="<?php echo $stat; ?>" <?php if ($status == $stat) echo "checked"; ?>>
            <?php echo $stat; ?>
        <?php endforeach; ?>
    </div>

    <div>
        <label for="photo">Foto:</label>
        <input type="file" id="photo" name="photo">
        <span class="error"><?php echo $imageError; ?></span>
    </div>

    <div>
        <label for="comments">Comentaris:</label>
        <textarea id="comments" name="comments"><?php echo $comments; ?></textarea>
    </div>

    <div>
        <button type="submit">Donar d'alta</button>
    </div>
</form>

<?php if ($_SERVER["REQUEST_METHOD"] == "POST" && empty($imageError)): ?>
    <h2>Dades introduïdes:</h2>
    <table>
        <tr>
            <th>Mòdul</th>
            <th>Editorial</th>
            <th>Preu</th>
            <th>Pàgines</th>
            <th>Estat</th>
            <th>Comentaris</th>
            <th>Imatge</th>
        </tr>
        <tr>
            <td><?php echo $module; ?></td>
            <td><?php echo $publisher; ?></td>
            <td><?php echo $price; ?></td>
            <td><?php echo $pages; ?></td>
            <td><?php echo $status; ?></td>
            <td><?php echo $comments; ?></td>
            <td>
                <?php if (!empty($imagePath)): ?>
                    <img src="<?php echo $imagePath; ?>" alt="Imatge del llibre" style="width: 100px;">
                <?php else: ?>
                    Sense imatge
                <?php endif; ?>
            </td>
        </tr>
    </table>
<?php endif; ?>

</body>
</html>
```

## Tema 3: Programació Web

#### Exercici 1: Sistema de Carret de Compres sense Base de Dades

1. **Descripció:**

   Desenvolupa una aplicació PHP que permeta als usuaris afegir productes a un carret de compres i mostrar el contingut del carret. Utilitza sessions per a mantindre l'estat del carret entre pàgines.

2. **Requisits:**
    - Crear una pàgina on l'usuari puga seleccionar productes.
    - Afegir els productes seleccionats a un carret emmagatzemat en una sessió.
    - Mostrar un resum del carret amb els productes afegits i les seues quantitats.
    - Permetre que l'usuari elimine productes del carret.


```html
<!DOCTYPE html>
<html lang="ca">
<head>
    <meta charset="UTF-8">
    <title>Selecció de productes</title>
</head>
<body>
    <h1>Afegir productes al carret</h1>
    <form action="carret.php" method="POST">
        <label for="producte">Tria un producte:</label>
        <select name="producte" id="producte">
            <option value="Poma">Poma</option>
            <option value="Plàtan">Plàtan</option>
            <option value="Taronja">Taronja</option>
        </select>
        <input type="submit" value="Afegir al carret">
    </form>
    <a href="carret.php">Veure carret</a>
</body>
</html>
```

```php
<?php
session_start();

// Inicialitzar el carret si no existeix
if (!isset($_SESSION['carret'])) {
    $_SESSION['carret'] = [];
}

// Afegir producte al carret si s'ha enviat un producte
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['producte'])) {
    $producte = $_POST['producte'];
    if (isset($_SESSION['carret'][$producte])) {
        $_SESSION['carret'][$producte]++;
    } else {
        $_SESSION['carret'][$producte] = 1;
    }
}

// Eliminar producte del carret si s'ha enviat un producte a eliminar
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['eliminar'])) {
    $producte = $_POST['eliminar'];
    unset($_SESSION['carret'][$producte]);
}

?>

<!DOCTYPE html>
<html lang="ca">
<head>
    <meta charset="UTF-8">
    <title>Carret de la compra</title>
</head>
<body>
    <h1>Carret de la compra</h1>
    <table>
        <thead>
            <tr>
                <th>Producte</th>
                <th>Quantitat</th>
                <th>Eliminar</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($_SESSION['carret'] as $producte => $quantitat): ?>
                <tr>
                    <td><?php echo $producte; ?></td>
                    <td><?php echo $quantitat; ?></td>
                    <td>
                        <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="POST">
                            <input type="hidden" name="eliminar" value="<?php echo $producte; ?>">
                            <input type="submit" value="Eliminar">
                        </form>
                    </td>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
    <a href="index.php">Tornar a la selecció de productes</a>
</body>
</html>
```

#### Exercici 2: Autenticació Bàsica d'Usuaris amb Sessions

1. **Descripció:**

   Crea una aplicació PHP que permeta als usuaris iniciar sessió mitjançant un formulari. Utilitza sessions per a mantindre l'estat d'autenticació de l'usuari i mostrar missatges personalitzats basats en aquest estat.

2. **Requisits:**
    - Crear un formulari d'inici de sessió que sol·licite el nom d'usuari i la contrasenya.
    - Emmagatzemar l'estat d'autenticació en una sessió després de verificar les credencials.
    - Mostrar una pàgina de benvinguda personalitzada per a l'usuari autenticat.
    - Proporcionar un enllaç per a tancar sessió i destruir la sessió.

```php
<?php
session_start();

// Inicialitzar variables d'error i missatge de benvinguda
$error = "";
$welcomeMessage = "";

// Comprovar si l'usuari ha enviat el formulari
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Comprovar les credencials de l'usuari
    if ($_POST['username'] == 'usuari' && $_POST['password'] == 'contrasenya') {
        // Iniciar sessió i emmagatzemar l'estat d'autenticació
        $_SESSION['authenticated'] = true;
        $welcomeMessage = "Benvingut, " . $_POST['username'] . "!";
    } else {
        $error = "Credencials incorrectes. Si us plau, intenta-ho de nou.";
    }
}

// Tancar sessió si s'ha enviat la sol·licitud
if (isset($_GET['logout'])) {
    session_destroy();
    header("Location: index.php");
    exit;
}
?>

<!DOCTYPE html>
<html lang="ca">
<head>
    <meta charset="UTF-8">
    <title>Inici de sessió</title>
</head>
<body>
    <h1>Inici de sessió</h1>
    <?php if ($_SESSION['authenticated']): ?>
        <p><?php echo $welcomeMessage; ?></p>
        <a href="index.php?logout=true">Tancar sessió</a>
    <?php else: ?>
        <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="POST">
            <label for="username">Nom d'usuari:</label>
            <input type="text" id="username" name="username">
            <br>
            <label for="password">Contrasenya:</label>
            <input type="password" id="password" name="password">
            <br>
            <input type="submit" value="Iniciar sessió">
        </form>
        <p style="color: red;"><?php echo $error; ?></p>
    <?php endif; ?>
</body>
</html>
```
     
#### Exercici 3: Recordatori d'Usuari amb Cookies

1. **Descripció:**

   Afig una funcionalitat de "recordar-me" a l'exercici anterior que emmagatzeme el nom d'usuari en una cookie i permeta a l'usuari ser recordat en futures visites al lloc web.

2. **Requisits:**
    - Afig una opció de "recordar-me" al formulari d'inici de sessió.
    - Emmagatzemar el nom d'usuari en una cookie quan l'opció és seleccionada.
    - Comprovar la cookie en futures visites i iniciar sessió automàticament si la cookie existeix.
    - Assegurar que les cookies es configuren amb atributs de seguretat adequats (`HttpOnly`, `Secure`, `SameSite`).


```php
<?php
session_start();

// Inicialitzar variables d'error i missatge de benvinguda
$error = "";
$welcomeMessage = "";

// Comprovar si l'usuari ha enviat el formulari
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Comprovar les credencials de l'usuari
    if ($_POST['username'] == 'usuari' && $_POST['password'] == 'contrasenya') {
        // Iniciar sessió i emmagatzemar l'estat d'autenticació
        $_SESSION['authenticated'] = true;
        $welcomeMessage = "Benvingut, " . $_POST['username'] . "!";

        // Emmagatzemar el nom d'usuari en una cookie si s'ha seleccionat "recordar-me"
        if (isset($_POST['remember'])) {
            setcookie('username', $_POST['username'], time() + 3600 * 24 * 30, '/', '', true, true);
        }
    } else {
        $error = "Credencials incorrectes. Si us plau, intenta-ho de nou.";
    }
}

// Comprovar la cookie de recordatori i iniciar sessió automàticament si existeix
if (!$_SESSION['authenticated'] && isset($_COOKIE['username'])) {
    $_SESSION['authenticated'] = true;
    $welcomeMessage = "Benvingut, " . $_COOKIE['username'] . "!";
}

// Tancar sessió si s'ha enviat la sol·licitud
if (isset($_GET['logout'])) {
    session_destroy();
    header("Location: index.php");
    exit;
}
?>

<!DOCTYPE html>
<html lang="ca">
<head>
    <meta charset="UTF-8">
    <title>Inici de sessió</title>
</head>
<body>
    <h1>Inici de sessió</h1>
    <?php if ($_SESSION['authenticated']): ?>
        <p><?php echo $welcomeMessage; ?></p>
        <a href="index.php?logout=true">Tancar sessió</a>
    <?php else: ?>
        <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="POST">
            <label for="username">Nom d'usuari:</label>
            <input type="text" id="username" name="username" value="<?php echo $_COOKIE['username'] ?? ''; ?>">
            <br>
            <label for="password">Contrasenya:</label>
            <input type="password" id="password" name="password">
            <br>
            <input type="checkbox" id="remember" name="remember">
            <label for="remember">Recorda'm</label>
            <br>
            <input type="submit" value="Iniciar sessió">
        </form>
        <p style="color: red;"><?php echo $error; ?></p>
    <?php endif; ?>
</body>
</html>
```
 
#### Exercici 4: Formulari de Contacte amb Protecció CSRF

1. **Descripció:**

   Desenvolupa un formulari de contacte que permeta als usuaris enviar missatges i implementa protecció CSRF per a assegurar que les sol·licituds siguen legítimes.

2. **Requisits:**
    - Crear un formulari de contacte amb camps per al nom, correu electrònic i missatge.
    - Generar i emmagatzemar un token CSRF en una sessió quan es carrega el formulari.
    - Incloure el token CSRF com a camp ocult en el formulari.
    - Verificar el token CSRF quan s'envia el formulari i mostrar un missatge de confirmació si és vàlid.
    - Mostrar un missatge d'error si el token CSRF no és vàlid o no existeix.


```php
<?php
session_start();

// Generar un token CSRF si no existeix
if (!isset($_SESSION['csrf_token'])) {
    $_SESSION['csrf_token'] = bin2hex(random_bytes(32));
}

// Comprovar si l'usuari ha enviat el formulari
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Comprovar el token CSRF
    if (!hash_equals($_SESSION['csrf_token'], $_POST['csrf_token'])) {
        die("Error CSRF");
    }

    // Processar el formulari
    $name = $_POST['name'];
    $email = $_POST['email'];
    $message = $_POST['message'];
    $successMessage = "Missatge enviat per $name ($email): $message";
}
?>

<!DOCTYPE html>
<html lang="ca">
<head>
    <meta charset="UTF-8">
    <title>Formulari de contacte</title>
</head>
<body>
    <h1>Formulari de contacte</h1>
    <?php if (isset($successMessage)): ?>
        <p><?php echo $successMessage; ?></p>
    <?php else: ?>
        <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="POST">
            <input type="hidden" name="csrf_token" value="<?php echo $_SESSION['csrf_token']; ?>">
            <label for="name">Nom:</label>
            <input type="text" id="name" name="name">
            <br>
            <label for="email">Correu electrònic:</label>
            <input type="email" id="email" name="email">
            <br>
            <label for="message">Missatge:</label>
            <textarea id="message" name="message"></textarea>
            <br>
            <input type="submit" value="Enviar">
        </form>
    <?php endif; ?>
</body>
</html>
```


#### Exercici 5: Seguiment d'Activitat de l'Usuari amb Sessions

1. **Descripció:**

   Crea un sistema que registre les pàgines visitades per l'usuari durant una sessió i mostre aquesta informació quan l'usuari visita una pàgina d'activitat.

2. **Requisits:**
    - Emmagatzemar una llista de pàgines visitades per l'usuari en una sessió.
    - Actualitzar la llista de pàgines cada vegada que l'usuari visite una nova pàgina.
    - Crear una pàgina que mostre l'historial de pàgines visitades durant la sessió actual.
    - Assegurar que l'historial es restableix quan l'usuari tanca la sessió.

```php
<?php
session_start();

// Inicialitzar la llista de pàgines visitades si no existeix
if (!isset($_SESSION['pages'])) {
    $_SESSION['pages'] = [];
}

// Afegir la pàgina actual a la llista de pàgines visitades
$_SESSION['pages'][] = $_SERVER['REQUEST_URI'];
?>

<!DOCTYPE html>
<html lang="ca">
<head>
    <meta charset="UTF-8">
    <title>Activitat de l'usuari</title>
</head>
<body>
    <h1>Activitat de l'usuari</h1>
    <ul>
        <?php foreach ($_SESSION['pages'] as $page): ?>
            <li><?php echo $page; ?></li>
        <?php endforeach; ?>
    </ul>
</body>
</html>
```

## Tema 4: POO

#### Exercici 1. Creació de la Classe Bàsica i Gestió de Propietats

* Crea una classe `Persona` amb les propietats privades `nom`, `cognoms`, i `edat`. Encapsula aquestes propietats mitjançant getters i setters. Afig els següents mètodes:

      - `getNomComplet(): string` – Retorna el nom complet de la persona.
      - `estaJubilat(): bool` – Retorna `true` si l'edat és major o igual a 65, `false` en cas contrari.

* Modifica la classe `Persona` afegint un constructor que assigna nom i cognoms. Si es proporciona un tercer paràmetre, assigna l'edat; en cas contrari, assigna una edat per defecte de 25 anys.

* Modifica la classe `Persona` per utilitzar una constant `LIMITE_EDAT` amb el valor de 66 anys i utilitza-la en el mètode `estaJubilat`.

```php
<?php
namespace App\Models;
abstract class Persona {
    private $nom;
    private $cognoms;
    private $edat;
    const LIMITE_EDAT = 66;

    public function __construct($nom, $cognoms, $edat = 25) {
        $this->nom = $nom;
        $this->cognoms = $cognoms;
        $this->edat = $edat;
    }

    public function getNom() {
        return $this->nom;
    }

    public function getCognoms() {
        return $this->cognoms;
    }

    public function getEdat() {
        return $this->edat;
    }

    public function setNom($nom) {
        $this->nom = $nom;
    }

    public function setCognoms($cognoms) {
        $this->cognoms = $cognoms;
    }

    public function setEdat($edat) {
        $this->edat = $edat;
    }

    public function getNomComplet() {
        return $this->nom . ' ' . $this->cognoms;
    }

    public function estaJubilat() {
        return $this->edat >= self::LIMITE_EDAT;
    }

    public static function toHtml(Persona $p) {
        return '<p>' . htmlspecialchars($p->getNomComplet()) . '</p>';
    }
}


```

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
* Transforma `Persona` en una classe abstracta. Redefineix el mètode estàtic `toHtml(Persona $p)` en totes les seues subclasses. 

```php
namespace App\Models;
class Empleado extends Persona {
    private $sou;
    private $telefons = [];

    public function __construct($nom, $cognoms, $sou, $edat = 25) {
        parent::__construct($nom, $cognoms, $edat);
        $this->sou = $sou;
    }

    public function getSou() {
        return $this->sou;
    }

    public function setSou($sou) {
        $this->sou = $sou;
    }

    public function anyadirTelefono($telefon) {
        $this->telefons[] = $telefon;
    }

    public function listarTelefonos() {
        return implode(', ', $this->telefons);
    }

    public function vaciarTelefonos() {
        $this->telefons = [];
    }

    public function debePagarImpuestos() {
        return $this->sou > 3333;
    }

    public static function toHtml(Persona $p) {
        $html = '<p>' . htmlspecialchars($p->getNomComplet()) . '</p>';
        if ($p instanceof Empleado) {
            $html .= '<ol>';
            foreach ($p->listarTelefonos() as $telefon) {
                $html .= '<li>' . htmlspecialchars($telefon) . '</li>';
            }
            $html .= '</ol>';
        }
        return $html;
    }
}



```

#### Exercici 3. Integració d'Espais de Noms, Autoloading, i Composer

* Crea una classe `Empresa` que incloga una propietat amb un array de `Empleados` . Implementa:

    - `public function addWorker(Empleado $t)`
    - `public function listWorkersHtml(): string` – Genera la llista de treballadors en format HTML.
    - `public function getCosteNominas(): float` – Calcula el cost total de les nòmines.

* Configura el projecte PHP amb Composer que utilitze l'autoloading PSR-4.  

```php

<?php
namespace App\Models;

class Empresa {
    private $workers = [];

    public function addWorker(Empleado $t) {
        $this->workers[] = $t;
    }

    public function getWorkers(){
        return $this->workers;
    }


    public function getCosteNominas() {
        $total = 0;
        foreach ($this->workers as $worker) {
            if ($worker instanceof Empleado) {
                $total += $worker->getSou();
            }
        }
        return $total;
    }

    public function listWorkersHtml(): string
    {
        $html = "<ul>";
        foreach ($this->empleados as $empleado) {
            $html .= "<li>{$empleado->getNom()} - Salari: {$empleado->getSalari()}€</li>";
        }
        $html .= "</ul>";

        return $html;
    }

}

```

```json
{
    "autoload": {
        "psr-4": {
            "App\\": "src/App"
        }
    },
    "require": {}
}
```

Amb esta estructura de directoris : 

```bash
/projecte
    /src
        /App
            Empresa.php
            Empleado.php
    composer.json
```  

I executar

```bash
composer dump-autoload
```

#### Exercici 4. Logger i Documentació

* Utilitza la llibreria `Monolog` per configurar un logger que escriga missatges a un fitxer `app.log`. Afig funcionalitat perquè el logger registre missatges d'informació i d'error en diferents arxius segons la gravetat.


* Configura un logger que escriga missatges de registre tant a un fitxer com a la consola. Prova el logger registrant missatges d'error i advertència.

```php
<?php
<?php

namespace App\Logger;

use Monolog\Logger;
use Monolog\Handler\StreamHandler;
use Monolog\Level;

class LoggerFactory
{
    public static function createLogger(): Logger
    {
        $logger = new Logger('app');

        // Handler per a missatges d'informació
        $infoHandler = new StreamHandler($_SERVER['DOCUMENT_ROOT']. '/logs/info.log', Level::INFO);
        $logger->pushHandler($infoHandler);

        // Handler per a missatges d'error
        $errorHandler = new StreamHandler($_SERVER['DOCUMENT_ROOT'] . '/logs/error.log', Level::ERROR);
        $logger->pushHandler($errorHandler);

        return $logger;
    }

    public static function createConsoleLogger(): Logger
    {
        $logger = new Logger('console');

        // Handler per escriure missatges a la consola
        $consoleHandler = new StreamHandler('php://stdout', Level::WARNING);
        $logger->pushHandler($consoleHandler);

        return $logger;
    }
}
```

Provar el logger

```php
<?php

require __DIR__ . '/vendor/autoload.php';

use App\Logger\LoggerFactory;

$logger = LoggerFactory::createLogger();
$consoleLogger = LoggerFactory::createConsoleLogger();

// Registra missatges d'informació i error
$logger->info('Això és un missatge d\'informació.');
$logger->error('Això és un missatge d\'error.');

// Registra un missatge d'advertència a la consola
$consoleLogger->warning('Això és un advertiment.');
$consoleLogger->error('Això és un missatge d\'error per consola.');

```


* Documenta la classe `Empleado` creada en exercicis anteriors utilitzant comentaris PHPDoc. Inclou la descripció de la classe, les propietats, i els mètodes. Utilitza una eina com `phpDocumentor` per generar documentació automàtica.

```php
<?php
namespace App\Models;

class Empleado extends Persona {
    private $sou;
    private $telefons = [];

    /**
     * Constructor de la clase Empleado
     * @param string $nom
     * @param string $cognoms
     * @param float $sou
     * @param int $edat
     */
    public function __construct($nom, $cognoms, $sou, $edat = 25) {
        parent::__construct($nom, $cognoms, $edat);
        $this->sou = $sou;
    }

    /**
     * Obtiene el sueldo del empleado
     * @return float
     */
    public function getSou() {
        return $this->sou;
    }

    /**
     * Establece el sueldo del empleado
     * @param float $sou
     */
    public function setSou($sou) {
        $this->sou = $sou;
    }

    /**
     * Obtiene los teléfonos del empleado
     * @return array
     */
    public function getTelefonos() {
        return $this->telefons;
    }

    /**
     * Establece un teléfono al empleado
     * @param string $telefon
     */
    public function setTelefono($telefon) {
        $this->telefons[] = $telefon;
    }

    /**
     * Devuelve los teléfonos del empleado
     * @return string
     */
    public function listarTelefonos() {
        return implode(', ', $this->telefons);
    }

    
    /**
     * Vacía la llista de telèfons de l'empleat.
     *
     * Aquest mètode elimina tots els telèfons associats a l'empleat, deixant l'array de telèfons buit.
     *
     * @return void
     */
    public function vaciarTelefonos(): void
    {
        $this->telefons = [];
    }

    /**
     * Comprova si l'empleat ha de pagar impostos.
     *
     * Aquest mètode determina si l'empleat està obligat a pagar impostos en funció del seu salari.
     * Si el salari de l'empleat és superior a 3333€, haurà de pagar impostos.
     *
     * @return bool Retorna `true` si l'empleat ha de pagar impostos, `false` en cas contrari.
     */
    public function debePagarImpuestos(): bool
    {
        return $this->sou > 3333;
    }
}
```

Des dewl directori php execute : 
```bash
docker run --rm -v $(pwd):/data phpdoc/phpdoc:latest run -d /data/src -t /data/src/docs
```

* Escriu proves unitàries per als mètodes de les classes `Persona`, `Empleado`, i `Empresa` utilitzant PHPUnit. Prova els mètodes `getNomComplet`, `estaJubilat`, `addWorker`, i `getCosteNominas`. Assegura't que les proves cobreixen diferents escenaris, incloent errors potencials.


```php
use PHPUnit\Framework\TestCase;
use App\Models\Persona;

class PersonaTest extends TestCase
{
    public function testGetNomComplet()
    {
        $persona = new Persona('Joan', 'Garcia');
        $this->assertEquals('Joan Garcia', $persona->getNomComplet());
    }

    public function testEstaJubilat()
    {
        // Persona amb edat inferior a la de jubilació
        $persona = new Persona('Joan', 'Garcia', 50);
        $this->assertFalse($persona->estaJubilat());

        // Persona amb edat igual o superior a la de jubilació
        $persona = new Persona('Pere', 'Martí', 66);
        $this->assertTrue($persona->estaJubilat());
    }

    public function testEstaJubilatEdgeCase()
    {
        // Prova del cas límit a l'edat exacta de jubilació
        $persona = new Persona('Maria', 'Lopez', 66);
        $this->assertTrue($persona->estaJubilat());
    }
}
```

```php

use PHPUnit\Framework\TestCase;
use App\Models\Empleado;

class EmpleadoTest extends TestCase
{
    public function testDebePagarImpuestos()
    {
        // Empleado amb salari inferior al llindar d'impostos
        $empleado = new Empleado('Joan', 'García',2500);
        $this->assertFalse($empleado->debePagarImpuestos());

        // Empleado amb salari superior al llindar d'impostos
        $empleado = new Empleado('Maria', 'Abradelo',5000);
        $this->assertTrue($empleado->debePagarImpuestos());
    }

    public function testVaciarTelefonos()
    {
        // Afegim telèfons i després els buidem
        $empleado = new Empleado('Joan','Petit', 2500);
        $empleado->setTelefono('123456789');
        $empleado->setTelefono('987654321');

        $empleado->vaciarTelefonos();

        // Assegurar-nos que la llista de telèfons està buida
        $this->assertCount(0, $empleado->getTelefonos());
    }
}

```

```php
use PHPUnit\Framework\TestCase;
use App\Models\Empresa;
use App\Models\Empleado;

class EmpresaTest extends TestCase
{
    public function testAddWorker()
    {
        $empresa = new Empresa();
        $empleado = new Empleado('Joan','Petit', 2500);

        // Afegim un treballador i comprovem que la llista de treballadors té 1 element
        $empresa->addWorker($empleado);
        $this->assertCount(1, $empresa->getWorkers());

        // Afegim un altre treballador i comprovem que ara la llista té 2 elements
        $empleado2 = new Empleado('Maria','Abradelo' ,3000);
        $empresa->addWorker($empleado2);
        $this->assertCount(2, $empresa->getWorkers());
    }

    public function testGetCosteNominas()
    {
        $empresa = new Empresa();
        $empleado1 = new Empleado('Joan','García' ,2500);
        $empleado2 = new Empleado('Maria','Serra' ,3000);

        // Afegim treballadors i calculem el cost de les nòmines
        $empresa->addWorker($empleado1);
        $empresa->addWorker($empleado2);

        // El cost hauria de ser 2500 + 3000 = 5500
        $this->assertEquals(5500, $empresa->getCosteNominas());
    }

    public function testGetCosteNominasEmpty()
    {
        $empresa = new Empresa();

        // Si no hi ha treballadors, el cost de les nòmines ha de ser 0
        $this->assertEquals(0, $empresa->getCosteNominas());
    }
}
```

* Escriu una prova unitària que comprove que el logger està registrant correctament els missatges d'error a l'arxiu corresponent. Utilitza un mock per assegurar-te que el logger funciona sense necessitat d'escriure en un fitxer real durant la prova.

```php
<?php

use PHPUnit\Framework\TestCase;
use Monolog\Logger;
use Monolog\Handler\StreamHandler;

class LoggerTest extends TestCase
{
    public function testLoggerErrorMessageIsHandledCorrectly()
    {
        // Creem un mock per al StreamHandler, simulant el comportament d'un logger d'arxius
        $mockHandler = $this->createMock(StreamHandler::class);

        // El mock s'espera que el mètode 'handle' es cridi exactament una vegada.
        // Això s'executa quan el logger maneja un missatge d'error.
        $mockHandler->expects($this->once())
                    ->method('handle')
                    ->with($this->callback(function ($record) {
                        // Verifiquem que el missatge sigui del tipus ERROR i que continga el missatge esperat
                        return $record['level'] === Logger::ERROR && $record['message'] === 'Això és un missatge d\'error';
                    }));

        // Creem un logger de Monolog i li afegim el nostre handler mock
        $logger = new Logger('test');
        $logger->pushHandler($mockHandler);

        // Registrem un missatge d'error
        $logger->error('Això és un missatge d\'error');
    }
}
```

#### Exercici 5. Generació de PDFs amb DomPDF

* Instal·la la llibreria `dompdf/dompdf` amb Composer. Crea un script PHP que genere un PDF senzill amb un títol i un paràgraf de text.

```bash
composer require dompdf/dompdf
```

```php
<?php

require __DIR__ . '/vendor/autoload.php';

use Dompdf\Dompdf;

// Crear una instància de Dompdf
$dompdf = new Dompdf();

// Contingut HTML
$html = '<h1>Títol del PDF</h1><p>Aquest és un paràgraf de text senzill.</p>';

// Carregar el contingut HTML en Dompdf
$dompdf->loadHtml($html);

// Configurar la mida del paper i l'orientació
$dompdf->setPaper('A4', 'portrait');

// Renderitzar el PDF
$dompdf->render();

// Desar el PDF o mostrar-lo
$dompdf->stream("document_senzill.pdf", ["Attachment" => false]);
```

* Crea un PDF utilitzant DomPDF que incloga una taula amb dades i una imatge. Assegura't que el PDF es renderitze correctament i que la imatge s'incloga en el document.

```php
<?php

require __DIR__ . '/vendor/autoload.php';

use Dompdf\Dompdf;

// Crear una instància de Dompdf
$dompdf = new Dompdf();

// Contingut HTML amb una taula i una imatge
$html = '
<h1>Informe amb Taula i Imatge</h1>
<table border="1" cellpadding="10">
    <thead>
        <tr>
            <th>Nom</th>
            <th>Cognoms</th>
            <th>Edat</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Joan</td>
            <td>Garcia</td>
            <td>35</td>
        </tr>
        <tr>
            <td>Maria</td>
            <td>Perez</td>
            <td>28</td>
        </tr>
    </tbody>
</table>
<br>
<img src="ruta_a_la_teva_imatge/imatge.png" alt="Imatge Exemple" width="200">
';

// Carregar el contingut HTML en Dompdf
$dompdf->loadHtml($html);

// Configurar la mida del paper i l'orientació
$dompdf->setPaper('A4', 'portrait');

// Renderitzar el PDF
$dompdf->render();

// Desar el PDF o mostrar-lo
$dompdf->stream("informe_taula_imatge.pdf", ["Attachment" => false]);
```

* Utilitzant la classe `Empresa` i `Empleado`, genera un informe en PDF amb la llista de treballadors i el seu sou. Utilitza DomPDF per generar aquest informe.

```php
<?php

require __DIR__ . '/vendor/autoload.php';


use Dompdf\Dompdf;
use App\Empresa;
use App\Empleado;

// Crear instàncies d'Empresa i Empleado
$empresa = new Empresa();
$empleado1 = new Empleado("Joan", 2500);
$empleado2 = new Empleado("Maria", 3000);

$empresa->addWorker($empleado1);
$empresa->addWorker($empleado2);

// Generar contingut HTML per al PDF
$html = '<h1>Informe de Treballadors</h1>';
$html .= '<table border="1" cellpadding="10">';
$html .= '<thead><tr><th>Nom</th><th>Salari</th></tr></thead>';
$html .= '<tbody>';

foreach ($empresa->getWorkers() as $empleado) {
    $html .= '<tr>';
    $html .= '<td>' . $empleado->getNom() . '</td>';
    $html .= '<td>' . $empleado->getSalari() . ' €</td>';
    $html .= '</tr>';
}

$html .= '</tbody></table>';
$html .= '<p>Cost total de les nòmines: ' . $empresa->getCosteNominas() . ' €</p>';

// Crear una instància de Dompdf
$dompdf = new Dompdf();

// Carregar el contingut HTML en Dompdf
$dompdf->loadHtml($html);

// Configurar la mida del paper i l'orientació
$dompdf->setPaper('A4', 'portrait');

// Renderitzar el PDF
$dompdf->render();

// Desar el PDF o mostrar-lo
$dompdf->stream("informe_treballadors.pdf", ["Attachment" => false]);
```

#### Exercici 6. Serialització i JSON

* Crea una interfície `JSerializable` que incloga els mètodes:

    - `toJSON(): string` – Converteix l'objecte a un JSON utilitzant `json_encode()`.
    - `toSerialize(): string` – Serialitza l'objecte utilitzant `serialize()`.

* Modifica les classes `Persona`, `Empleado`, i `Empresa` per implementar aquesta interfície. Assegura't que les propietats privades es puguen serialitzar correctament.

* Escriu mètodes per deserialitzar un objecte a partir d'una cadena JSON o d'una cadena serialitzada. Prova aquests mètodes amb PHPUnit per assegurar-te que la deserialització funciona correctament.


Es mostra soles la classe Persona :

```php
namespace App\Models;

interface JSerializable
{
    /**
     * Converteix l'objecte a una cadena JSON.
     * 
     * @return string
     */
    public function toJSON(): string;

    /**
     * Serialitza l'objecte a una cadena.
     * 
     * @return string
     */
    public function toSerialize(): string;
}
```

```php
namespace App\Models;

class Persona implements JSerializable{
    

    ...

    public function toJSON(): string
    {
        return json_encode(get_object_vars($this));
    }

    public function toSerialize(): string
    {
        return serialize($this);
    }

    // Deserialitzar des d'un JSON
    public static function fromJSON(string $json): self
    {
        $data = json_decode($json, true);
        return new self($data['nom'], $data['cognoms'], $data['edat']);
    }

    // Deserialitzar des d'una cadena serialitzada
    public static function fromSerialized(string $serialized): self
    {
        return unserialize($serialized);
    }

    
}

```

```php

use PHPUnit\Framework\TestCase;
use App\Models\Persona;

class PersonaTest extends TestCase
{
    
    ...

    public function testToJSON()
    {
        $persona = new Persona('Joan', 'Garcia', 30);
        $json = $persona->toJSON();
        $this->assertJson($json);
        $this->assertStringContainsString('"nom":"Joan"', $json);
    }

    public function testFromJSON()
    {
        $json = '{"nom":"Joan","cognoms":"Garcia","edat":30}';
        $persona = Persona::fromJSON($json);
        $this->assertEquals('Joan Garcia', $persona->getNomComplet());
    }

    public function testToSerialize()
    {
        $persona = new Persona('Maria', 'Perez', 40);
        $serialized = $persona->toSerialize();
        $this->assertIsString($serialized);
    }

    public function testFromSerialized()
    {
        $persona = new Persona('Maria', 'Perez', 40);
        $serialized = $persona->toSerialize();
        $personaDeserialized = Persona::fromSerialized($serialized);
        $this->assertEquals('Maria Perez', $personaDeserialized->getNomComplet());
    }
}
```

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



EmpleadoController
```php
<?php

namespace App\Controllers;

use App\Models\Empleado;

class EmpleadoController {

    // Llista tots els empleats i els mostra en una vista HTML
    public function listAll(){
        // Crea alguns empleats de prova
        $persona1 = new Empleado('Ignasi', 'Gomis Mullor', 50);
        $persona2 = new Empleado('Juan', 'Segura Vasco', 50);
        $persona1->setSou(2500);
        $persona2->setSou(2500);

        $empleados = [$persona1, $persona2];

        // Inclou la vista HTML per llistar els empleats
        include $_SERVER['DOCUMENT_ROOT'].'/views/empleado.view.php';
    }

    // Genera un PDF amb la llista d'empleats
    public function generatePDF(){
        // Crea alguns empleats de prova
        $persona1 = new Empleado('Ignasi', 'Gomis Mullor', 50);
        $persona2 = new Empleado('Juan', 'Segura Vasco', 50);
        $persona1->setSou(2500);
        $persona2->setSou(2500);

        $empleados = [$persona1, $persona2];

        // Inclou la vista que generarà el PDF amb DomPDF
        include $_SERVER['DOCUMENT_ROOT'].'/views/informe_empleado_pdf.php';
    }
}

```

empleado.view.php
```html


<!DOCTYPE html>
<html lang="ca">
<head>
    <meta charset="UTF-8">
    <title>Empleado</title>
</head>
<body>

<table>
    <tr>
        <th>Nom</th><th>Telefons</th><th>Sou</th>
    </tr>
    <?php foreach ($empleados as $empleado): ?>
    <tr>
        <td><?= $empleado ?></td><td><?= $empleado->listarTelefonos() ?></td><td><?= $empleado->getSou() ?></td>
    </tr>
    <?php endforeach; ?>
</table>
</body>
</html>
```
informe_empleado_pdf.view.php
```php
<?php

// Aquesta vista s'utilitza per generar el PDF amb DomPDF

use Dompdf\Dompdf;

// Genera l'HTML per al PDF
$html = '
<h1>Informe de Treballadors</h1>
<table border="1" cellpadding="10">
    <thead>
        <tr>
            <th>Nom</th>
            <th>Telefons</th>
            <th>Sou</th>
        </tr>
    </thead>
    <tbody>';

foreach ($empleados as $empleado) {
    $html .= '<tr>';
    $html .= '<td>' . $empleado->getNomComplet() . '</td>';
    $html .= '<td>' . implode(', ', $empleado->listarTelefonos()) . '</td>';
    $html .= '<td>' . $empleado->getSou() . ' €</td>';
    $html .= '</tr>';
}

$html .= '</tbody></table>';

// Crea i renderitza el PDF amb DomPDF
$dompdf = new Dompdf();
$dompdf->loadHtml($html);
$dompdf->setPaper('A4', 'portrait');
$dompdf->render();
$dompdf->stream("informe_empleado.pdf", ["Attachment" => false]);
```

index.php
```php

<?php
include_once __DIR__ .'/../vendor/autoload.php';

use App\Controllers\EmpleadoController;

// Crea una instància del controlador
$controller = new EmpleadoController();

// Comprova si l'usuari ha demanat una llista HTML o un PDF
if (isset($_GET['format']) && $_GET['format'] === 'pdf') {
    // Genera el PDF
    $controller->generatePDF();
} else {
    // Mostra la llista d'empleats en HTML
    $controller->listAll();
}


```
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


```php
<?php

use PHPUnit\Framework\TestCase;
use App\Controllers\EmpleadoController;
use App\Models\Empleado;

class EmpleadoControllerTest extends TestCase
{
    public function testListAll()
    {
         
        $controller = new EmpleadoController();

        // Captura la sortida HTML del controlador
        ob_start();
        $controller->listAll();
        $output = ob_get_clean();

        // Comprova que la vista inclou les dades esperades
        $this->assertStringContainsString('Ignasi', $output);
        $this->assertStringContainsString('Segura Vasco', $output);
    }

    public function testGeneratePDF()
    {
         
        $controller = new EmpleadoController();

        // Captura la sortida PDF generada pel controlador
        ob_start();
        $controller->generatePDF();
        $output = ob_get_clean();

        // Comprova que el contingut PDF conté les dades correctes
        $this->assertStringContainsString('Informe de Treballadors', $output);
        $this->assertStringContainsString('Ignasi', $output);
    }
}

```

```php
<?php

use PHPUnit\Framework\TestCase;

class EmpleadoViewTest extends TestCase
{
    public function testRenderHTML()
    {
        // Simulem els empleats que seran passats a la vista
        $empleados = [
            new App\Models\Empleado('Ignasi', 'Gomis Mullor', 50, 2500),
            new App\Models\Empleado('Juan', 'Segura Vasco', 50, 2500)
        ];

        // Captura la sortida HTML
        ob_start();
        include __DIR__ . '/../views/empleado.view.php';
        $output = ob_get_clean();

        // Verifica que els noms i salaris dels empleats apareixen en l'HTML generat
        $this->assertStringContainsString('Ignasi', $output);
        $this->assertStringContainsString('2500', $output);
    }
}
```

```php
<?php

use PHPUnit\Framework\TestCase;
use Dompdf\Dompdf;

class InformeEmpleadoPDFTest extends TestCase
{
    public function testRenderPDF()
    {
        // Simulem els empleats que seran passats a la vista
        $empleados = [
            new App\Models\Empleado('Ignasi', 'Gomis Mullor', 50, 2500),
            new App\Models\Empleado('Juan', 'Segura Vasco', 50, 2500)
        ];

        // Genera el PDF utilitzant la vista
        ob_start();
        include __DIR__ . '/../views/informe_empleado_pdf.php';
        $output = ob_get_clean();

        // Comprova que el contingut del PDF inclou les dades correctes
        $this->assertStringContainsString('Informe de Treballadors', $output);
        $this->assertStringContainsString('Ignasi', $output);
        $this->assertStringContainsString('2500', $output);
    }
}
```    

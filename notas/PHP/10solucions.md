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



## Examen PHP

* Heu de fer una rama que es diga examen_php.
* Cal modificar la taula sales perque agafe data per defecte i status per defecte.
* Els exercicis es fan en la carpeta src i les classes en la carpeta que utilitzeu per a les clases.
* Els exercicis s'han de poder enllaçar des de la pàgina principal (index.php) del BatoiBook.
* El lloc addient per fer-ho seria des de la capçalera del BatoiBook, tenint en compte que:
   
[recursos](recursos/examen.zip) 

## RAMA Part1

### Exercici RA2   

1. Modifica el codi de la pàgina `salutacions.php` per a que mostre el nom complet de la persona que ha accedit a la pàgina (situada en `config/nom.php`) i la data.
 
   
### Exercici RA3  

* Modifica  la pàgina `matriu.php` de forma que a partir del número introduït pel usuari:
  * Genera una matriu de números aleatoris entre 1 i 500 de 10xnumero i mostra-los en una taula, afegint una columna al final de cada fila on es mostre la suma de la fila.
  * S'ha de comprovar que el número estiga entre 1 i 10, en cas contrari s'ha de tornar al formulari amb les dades introduïdes i amb un missatge d'error.
  * Els números par estaran en blau i els senars en vermell.
  * Calen, al meyns, les següents funcions: `generaMatriu(int $n,int $m): array` i `printCela(int $num): void`.
  * L'estructura del html ha de ser completa. 
  * Tot el codi ha d'estar en un únic fitxer.

 
### Exercici RA4 
 
Crea una petita aplicació web amb les següents funcionalitats:

1. **Sessió per Mantenir l’Estat de l'Usuari**:
  - Implementa una pàgina `welcome.php` que només siga accessible per a usuaris autenticats.
  - Desa l’estat d’autenticació en una sessió i assegura’t que l’usuari siga redirigit a una pàgina d'inici de sessió si no ha iniciat sessió `inici.php`.

2. **Preferència d'Idioma amb Cookies**:
  - A la pàgina d'inici de sessió, permet a l'usuari seleccionar una preferència d'idioma  des de l'array que hi ha.
  - Desa la preferència en una cookie i mostra un missatge de benvinguda a `welcome.php` en l'idioma seleccionat.

3. **Prova del Codi amb Eines de Depuració**:
  - Afegeix una línia de `var_dump` o `error_log` per verificar l'estat de la sessió i de la cookie.
  - Deixa un comentari en el codi explicant com aquesta línia t’ajuda a comprovar el correcte funcionament del codi.

## Detalls Addicionals
- En aquesta activitat, no cal fer una pàgina d'inici de sessió completa; simplement pots simular que l'usuari s'ha autenticat desant una variable en la sessió.
- El codi PHP pot ser mínim; l'important és que s'incloguin les sessions, la cookie per l'idioma, i una línia per a depuració.

## RAMA Part2 (RA5 i RA6) 
  
Crea una aplicació web per gestionar una llista de productes. Aquesta aplicació ha de permetre les operacions bàsiques de **CRUD** (creació, lectura, actualització, eliminació) sobre una base de dades. Completa les següents funcionalitats:

### 1. Connexió amb la Base de Dades
- Crea una classe `Database` que s'encarregui de la connexió amb la base de dades. Assegura't que la connexió es gestioni correctament amb principis d'OOP i un patró com el Singleton per evitar múltiples connexions.

### 2. Recuperació i Visualització de Productes
- Implementa un controlador `ProductController` i una classe `Product` en la carpeta **Models** que s’encarreguin de recuperar els productes de la base de dades i passar-los a la vista.
-Adapta la vista `products.view.php` per tal que mostre la llista de productes en una taula amb les opcions d'editar i eliminar cada producte.

### 3. Afegir nous Productes
- Implementa una funcionalitat que permeta afegir nous productes a la base de dades mitjançant el formulari de la vista `create_product.view.php`.
 
### 4. Actualització de Productes Existents
 - Adapta la vista `update_product.php` per tal d'actualitzar el nom i el preu del producte seleccionat.

### 5. Eliminació de Productes
- Implementa una funcionalitat que permeta eliminar productes de la base de dades directament des de la vista `products.view.php`.

### 6. Prova i Documentació del Codi
- Documenta el codi amb comentaris explicant les parts principals.

### 7. Tria una de les següents opcions:
  
- Prova amb phpunit que les operacions de creació, actualització i eliminació funcionen correctament.
- Crea un registre de log per a les operacions de creació, actualització i eliminació.
- Imprimeix en pdf la llista de productes.

## Estructura i Configuració del Projecte

- **Configura una base de dades** amb una taula `productes` que contingui els camps següents:
  - `id`: Enter, clau primària, autoincremental.
  - `nom`: Text, no pot ser nul.
  - `preu`: Decimal, no pot ser nul.

- **Organitza el projecte** seguint el patró **Model-Vista-Controlador (MVC)**, utilitzant les carpetes:
  - `Models`: Inclou la classe `Product.php` que representa els productes.
  - `Controllers`: Inclou `ProductController.php` per gestionar les operacions.
  - `Views`: Inclou les vistes `products.php`, `create_product.php`, i `update_product.php`.

## Detalls Addicionals

- Exempcions: Implementa un sistema d'excepcions per a gestionar errors en les operacions a la base de dades. 
  
```
/php
├── config
│   ├── db.php                    // Connexió a la base de dades 
├── src                           // Directori públic principal (com un directori public)
│   ├── index.php                 // Punt d'entrada principal 
├── App                           // Directori principal de l'aplicació (lògica de negoci)
│   ├── Controllers               // Directori per als controladors 
│   │   └── ProductController.php // Controlador per a operacions CRUD
│   └── Models                    // Directori per als models  
│   │   ├── Product.php           // Model de producte
│   └── Services                  // Directori per als serveis
│       └── Database.php          // Classe de connexió a la base de dades
└── views                         // Directori per a les vistes
    ├── products.view.php         // Vista per mostrar la llista de productes
    ├── create_product.view.php   // Vista per afegir un nou producte
    └── update_product.view.php   // Vista per editar un producte existent 
```
 
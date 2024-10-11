## Examen PHP

* Heu de fer una rama que es diga examen_php.
* Cal modificar la taula sales perque agafe data per defecte i status per defecte.
* Els exercicis es fan en la carpeta src i les classes en la carpeta que utilitzeu per a les clases.
* Els exercicis s'han de poder enllaçar des de la pàgina principal (index.php) del BatoiBook.
* El lloc addient per fer-ho seria des de la capçalera del BatoiBook, tenint en compte que:
  
        En els exercicis 1,2,3,4 no cal estar loguejat per a accedir-hi.
        L'exercici 3 ha de tindre una pàgina on es prove la classe sales (que funcionen els mètodes)
        L'exercici 4 no cal que l'enllaçeu des de cap lloc, es una API.
        L'exercici 5 només l'eixirà l'enllaç a l'usuari que siga administrador.

[recursos](recursos/examen.zip) 

## Exercici 1 (1,5p)

Modifica la capçalera del batoiBook per tal que es mostre el següent:

* Si és la primera vegada que visita index.php, li dira 'Benvingut/uda per primera vegada'.
* En cas contrari li dira 'Benvingut/uda, la teua darrera visita va ser...', i la data amb format "Y-m-d H:i:s".
* No cal autenticar-se per mostrar la informació, o siga no depen de l'usuari sinó de la sessió.
* S'actulitzarà la data cada vegada que es visite la pàgina index.php.

## Exercici 2 (1,5p)

* Genera una matriu de números aleatoris entre 1 i 500 de 10x10 i mostra-los en una taula, afegint una fila i una columna on es mostre la suma de cada fila i de cada columna.
* Els numeros par estaran en blau i els senars en vermell.
* Calen, al meyns, les següent funcions: `generaMatriu(int $n,int $m): array` i `printCela(int $num): void`.
* L'estructura del html ha de ser completa i s'ha d'incorporar la capçalera del BatoiBook.

## Exercici 3 (1,5p)

Crea la classe `sales` que gestione les transaccions entre usuaris. Aquesta classe tindrà els següents mètodes:

* `__construct($idBook,$idUser)` constructor que rep l'identificador de la transacció.
* `getUser():User` retorna l'objecte usuari que ha realitzat la transacció.
* `getBook():Book` retorna l'objecte llibre que s'ha transaccionat.
* `save():Sales` guarda la transacció a la base de dades.
* `delete():int` elimina la transacció de la base de dades.
* `getSales($idUser):Array` retorna un array amb els llibres venuts per l'usuari passat per paràmetre.

## Exercici 4 (4p)

Mostra una taula amb els cicles (courses) que hi ha a la base de dades.
Afegeix un enllaç en la capçalera del BatoiBook que diga 'Cicles' per accedir-hi a esta pàgina.

  * Els camps ha mostrar en la taula són: id, cycle, vliteral, cliteral.

  * Afegeix les operacions de :

    * Modificar un cicle.
  
            Els camps que es poden modificar son cycle, vliteral i cliteral. 
            No es pot modificar ni la familia ni el codi. 
            Hauràs de comprovar que la longitud dels camps es menor a la que està permesa en la base de dades.
    
    * Eliminar un cicle.
    * Mostrar un cicle.
    
            S'haurà de vore el literal de la familia.

Afegix un camp `administrador` (boolean) a la taula users. Fes a un usuari administrador.
Soles l'usuari administrador li eixirà el manteniment de cicles en el menu del header.


## Exercici 5 (1,5p)

Crea la pàgina `api/sales.php` que gestione les peticions POST que li arriben y done d'alta la venda en la BBDD.

* Els paràmetres que li arriben a la petició POST són: `idBook` i `idUser`.
* S'han de gestionar els errors que pugen sorgir per tal que es retornen en format JSON (que no existisca l'usuari, el llibre no estiga disponible)
* Has de tenir en compte que el llibre pasarà a venut amb la data actual i deixarà d'estar disponible para venda. 

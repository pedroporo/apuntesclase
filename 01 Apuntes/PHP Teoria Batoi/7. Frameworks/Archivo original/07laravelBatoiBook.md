## Activitats 


701. Crea les migracions per a les taules **books**, **courses**, **families**, **modules** i **sales**. 
     * L'ordre per a crear les migracions depedrà de les claus alienes. Així en este cas hauria de ser (families,courses,modules,books,sales).
     * Mira de crear també les claus alienes
     * Tria el tipus de dades adequat per a cada camp.
     * Sigues curós en la nomenclatura de les claus aliènes.
     * Afegiex un camp administrador a la taula **users** per a saber si un usuari és administrador o no.

702. Crea els models per a les taules **books**, **courses**, **families**, **modules** i **sales**. 
     * Crea les relacions entre models.

703. Crea els seeders i els factorys per a cada model.
    * Per als models **courses**, **modules** i **families** fes-ho des del sql (**no cal factory**).

!!! tip "Recomanació"
        Hauràs de copiar els fitxers .json a la carpeta storage/app/public. Podràs accedir-hi amb l'instrucció **Storage::disk('public')->path('nomfitxer.json')**.

!!! tip "Recomanació"
        Una vegada que accedim al fitxer json, per a convertir-lo a un array associatiu, utilitzarem la funció **json_decode**. Després per a accedir a les dades utilitzarem la notació **$array[2]['data']**.


* Crea 100 usuaris registrats. Un ha de ser administrador.
* Crea 100 llibres amb un preu aleatori entre 5 i 25 i disponibles per a la venda.
* Crea les 100 vendes per a 100 llibres més.

!!! tip "Recomanació"
    Al crear el seeder de sales, pots crear primer el llibre i desprès vendre'l. Per això pots utilitzar el mètode **create** del model **Book**. Per exemple:
    
    ```php
    $soldDate = $this->faker->dateTimeBetween('-1 years', 'now');
    $book = Book::factory()->create([
        'soldDate' => $soldDate->format('Y-m-d'), // Data de l'any passat
    ]);
    ```

704. Crea les rutes corresponents a cada acció del controlador, i els mètodes per a visualitzar les vistes. 
    * Crea un controlador de recursos per a **Book**, **Course**,  **Family** i **Module**.
705. Crea les vistes corresponents a cada acció del controlador bookController (per a crear les vistes pots utilitzar el chatGtp).
    * Es millor que create i edit siguen vistes diferents.
    * Per a la vista show crea un component per a vore el llibre.
     <x-book-card book="{{$book->id}}" />
706. Fes que la pàgina principal (quan no s'estiga loguejat) mostre la llista de llibres disponibles - no venuts - (en modo fitxa, paginades de 10 en 10) 
     * Uutilitza un el comonent que has creat abans.
707. Quan un usuari es logueja mostra-li la seua llista de llibres a la venda, amb el botons per modificar, esborrar i crear un llibre nou.
708. Fes un enllaç per vore les seues vendes.
709. L'administrador podrà veure la llista d'usuaris per a donar de baixa i la llista de totes les vendes.

720. Afig un camp admes a la taula books
     * El valor per defecte ha de ser false.
     * Modifica els seeders per a que tots els llibres creat tinguen el camp admes a true.
     * Quan un llibre es dona d'alta no ix en la pàgina principal fins que no és admés.
721. Envia una notificació al usuari administrador quan un usuari done d'alta un llibre
     * Amb un botó per admetre el llibre.
     * Crear la ruta i el mètode per admetre el llibre.
722. Crea un mailable PurchaseConfirmationMail que s'envie quan un usuari compre un llibre.
     * Afegix un botó al component de book per poder comprar el llibre si l'usuari està autenticat.
     * Fes que el botó faça tots el procediments de compra i al final envia el correu.
   
723. Crea un comando send:regards que envia una felicitació a tots els usuaris que han fet vendes l'ultim any.
     * No cal programar-lo. L'enviarem amb l'artisan quan vulguem.

724. Envia un correu de benvinguda quan un usuari es registra en l'aplicació.
    * Utilitza events i listeners.
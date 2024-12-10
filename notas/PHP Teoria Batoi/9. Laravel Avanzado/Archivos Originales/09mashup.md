<style>
    img { margin: 20px 0; border-radius: 8px; }

    .alert { color: #BD1550; }
    .warning { color: #E97F02; }
    .success { color: #8A9B0F; }

    .center { text-align: center; }
    .right { text-align: right; }

    .img-small { max-width: 200px; margin: auto; }
    .img-medium { max-width: 400px; margin: auto; }
    .img-large { max-width: 800px; margin: auto; }

    .leyenda {
        font-size: small;
        margin: 10px 0;
    }
</style>

# Webs híbrides

> Duració estimada: 8 sessions

## Característiques de les webs híbrides

Les aplicacions web híbrides, també conegudes com a "mashups", són una combinació de dades i/o funcionalitats provinents de diverses fonts per a crear un nou tipus d'aplicació o servei.
Les seues característiques principals són:

* **Integració de Dades de Diversos Orígens**: Les aplicacions web híbrides aprofiten dades i funcionalitats de múltiples fonts, com ara serveis web, APIs, i altres recursos en línia. Això permet combinar i reutilitzar recursos existents de manera creativa per a desenvolupar aplicacions més complexes i funcionals.
* **Ús de Serveis Web i APIs**: Moltes d'aquestes aplicacions utilitzen dades accessibles a través de serveis web, com els que ofereixen empreses com Google, Yahoo!, Flickr, Microsoft, i Amazon. Aquestes dades es troben sovint en formats com JSON o XML i es poden accedir i manipular mitjançant APIs específiques.
* **Sindicació Web (RSS/Atom)**: Algunes aplicacions web híbrides fan ús de protocols de sindicació web, com RSS o Atom, per accedir a continguts actualitzats de manera regular. Aquests protocols simplifiquen el procés de compartir i distribuir continguts web.
* **Dades Internes**: A més de les fonts externes, les aplicacions web híbrides poden incloure dades internes generades i gestionades per l'entitat propietària de l'aplicació, com podrien ser les dades corporatives o de negoci.
* **Web Scraping**: Encara que és menys comú, algunes aplicacions utilitzen tècniques d'enginyeria inversa, com el web scraping, per extreure dades des de llocs web. Això pot ser útil per obtenir informació com els preus dels productes en les botigues en línia.

Aquesta actualització reflecteix l'evolució constant en el camp del desenvolupament web i la integració de tecnologies, destacant la importància de les fonts diverses de dades i la capacitat de combinar-les de forma innovadora en el disseny d'aplicacions web híbrides​​.

## Utilització de repositoris d'informació

Per a poder reutilitzar codi i informació cal que tingem en conte les següents consideracions:

* **Integració de Serveis Web de Tercers**: En el desenvolupament d'aplicacions web híbrides, és comú utilitzar serveis proporcionats per tercers. Aquests serveis poden oferir funcionalitats específiques que enriquiran l'aplicació sense necessitat de desenvolupar-les des de zero. Un exemple podria ser l'ús de l'API de Google Maps per mostrar la ubicació geogràfica de les franquícies d'una empresa en un mapa.
* **Desenvolupament d'Aplicacions Pràctiques**: En aquest context, es posa l'accent en el desenvolupament d'aplicacions que faciliten processos específics, com podria ser la gestió d'enviaments en una botiga en línia. Aquest tipus d'aplicació pot millorar significativament l'experiència dels usuaris i l'eficiència de les operacions de l'empresa.
* **Reconeixement de Necessitats i Oportunitats**: És important identificar funcionalitats que poden ser útils per als usuaris, fins i tot quan aquests no les han sol·licitat explícitament. Aquesta anticipació de necessitats pot ser un factor clau en el desenvolupament d'aplicacions web híbrides exitoses.
* **Condicions i Límits en l'Ús de Serveis de Tercers**: Quan s'utilitzen serveis de tercers, cal tenir en compte les condicions i límits que aquests imposen. Això inclou restriccions d'ús, límits de sol·licituds, entre d'altres aspectes legals i tècnics.
* **Adquisició d'Experiència en Desenvolupament Web**: El desenvolupament d'aquestes aplicacions també serveix com una oportunitat per adquirir experiència pràctica en l'àmbit del desenvolupament web, millorant així les habilitats tècniques dels desenvolupadors.

Per exemple podriem desenvolupar:

* **Integració de Google Maps API**: Imaginem que estàs desenvolupant una aplicació web per a una cadena de restaurants. Pots integrar l'API de Google Maps per mostrar la ubicació de tots els restaurants en un mapa interactiu. Els usuaris poden buscar el restaurant més proper, obtenir direccions, i fins i tot veure imatges del lloc.
* **Gestió d'Enviaments amb APIs de Logística**: Per una botiga en línia, pots integrar APIs de serveis de missatgeria com UPS, FedEx o DHL. Això permet als usuaris fer seguiment dels seus enviaments en temps real, calcular costos d'enviament, i gestionar devolucions de manera eficient.
* **Integració de Passarel·les de Pagament**: En una aplicació d'e-commerce, l'ús de passarel·les de pagament com Stripe, PayPal, o Square és essencial. Això no només ofereix una solució de pagament segura als usuaris, sinó que també simplifica la gestió financera de la botiga.
* **Ús de APIs de Xarxes Socials**: Podries integrar APIs de xarxes socials com Facebook, Twitter, o Instagram per permetre als usuaris compartir productes o experiències directament des de la teva aplicació. Això pot augmentar la visibilitat i l'engagement del teu negoci.
* **Serveis Meteorològics Integrats**: Per a una aplicació d'activitats a l'aire lliure, com una app de senderisme, integrar dades meteorològiques en temps real mitjançant APIs com OpenWeatherMap pot ser molt útil. Els usuaris podrien planificar les seves activitats basant-se en les condicions meteorològiques actuals i les previsions.
* **Recollida d'Opinions amb APIs de Ressenyes**: En una aplicació per a hotels o restaurants, integrar un sistema de recollida d'opinions com Yelp o TripAdvisor pot ajudar a obtenir feedback valuós dels clients i millorar la qualitat del servei.

## Exemple de reutilització de codi

### Autenticació amb Google


#### Pas 1 - Instal·lació

Se suposa que ja tenim instal·lat el paquet sanctum. En cas contrari caldria instal·lar-lo:

```console
composer require laravel/sanctum
```

Instal·lem el paquet de Google:

```console
composer require laravel/socialite
```
#### Pas 2 - Configuració

Publica la Configuració de Sanctum:

```console
php artisan vendor:publish --provider="Laravel\Sanctum\SanctumServiceProvider"
```

Afegeix el middleware de Sanctum a la teva API en app/Http/Kernel.php.
    
```php
'api' => [
            \Laravel\Sanctum\Http\Middleware\EnsureFrontendRequestsAreStateful::class,
            \Illuminate\Routing\Middleware\ThrottleRequests::class.':api',
            \Illuminate\Routing\Middleware\SubstituteBindings::class,
        ],
```
#### Pas 3 - Crear credencials a Google cloud

* Obre la Consola de Google Cloud: Visita [Google Cloud Console](https://goo.gle/3oFLcJ5).

**Crear un Projecte a Google Cloud**

* Crea un Nou Projecte: En la consola, crea un nou projecte si encara no en tens cap.
* Navega al Projecte: Un cop creat, selecciona el projecte per a configurar les credencials.

**Configurar OAuth Consent Screen**
  
* Vés a "APIs & Services > OAuth consent screen".
* Selecciona l'usuari extern i omple els detalls necessaris. ![Fig.1](imagenes/09/consentiment1.png).
* Afegeix la informació del teu domini i els detalls de l'aplicació. ![Fig.2](imagenes/09/consentiment2.png).


**Crear Credencials**

* Vés a "APIs & Services > Credentials". 
* Clica a "Create Credentials" i selecciona "OAuth client ID".
* Selecciona l'aplicació web com a tipus d'aplicació. ![Fig.3](imagenes/09/credencials1.png).
* Afegeix les URL de redirecció autoritzades des de Laravel (p. ex., http://localhost/auth/google/callback per a l'entorn de desenvolupament).
* Obté l'ID de Client i el Secret de Client: Després de crear les credencials, anota l'ID de client i el secret que Google proporciona. ![Fig.4](imagenes/09/credencials2.png).

#### Pas 4 - Configuració de Socialite per a Google

```php
GOOGLE_CLIENT_ID=your-google-client-id
GOOGLE_CLIENT_SECRET=your-google-client-secret
GOOGLE_REDIRECT=http://your-callback-url
```
Afegeix la Configuració de Google a config/services.php:

```php
'google' => [
    'client_id' => env('GOOGLE_CLIENT_ID'),
    'client_secret' => env('GOOGLE_CLIENT_SECRET'),
    'redirect' => env('GOOGLE_REDIRECT'),
],
```
#### Pas 5 - Creació de Rutes i Controladors

Defineix rutes en routes/web.php per a redirigir cap a Google i per al callback.

```php  
Route::get('auth/google', 'Auth\LoginController@redirectToGoogle');
Route::get('auth/google/callback', 'Auth\LoginController@handleGoogleCallback');
```

En LoginController, afegeix la lògica per a redirigir a l'usuari cap a Google i manejar el callback.

redirectToGoogle: Redirigeix l'usuari a la pàgina d'autenticació de Google.
handleGoogleCallback: Processa la resposta de Google, crea o troba un usuari, i genera un token de Sanctum.

```php  
<?php
// En LoginController 

public function redirectToGoogle()
{
    return Socialite::driver('google')->redirect();
}


public function handleGoogleCallback()
{
    try {
        $user = Socialite::driver('google')->user();

        // Trobar o crear l'usuari basat en la informació de Google
        $localUser = User::updateOrCreate(
            ['email' => $user->email],
            [
                'name' => $user->name,
                'google_id' => $user->id,
                // Altres camps que vulguis guardar
            ]
        );

        // Iniciar sessió de l'usuari
        Auth::login($localUser);

        // Generar token Sanctum
        $token = $localUser->createToken('Personal Access Token')->plainTextToken;

        // Redirigir l'usuari amb el token
        return view('auth.success', ['token' => $token]); // Asumint que tens una vista 'auth.success'

    } catch (\Exception $e) {
        // Maneig d'errors
        return view('auth.error', ['error' => $e->getMessage()]); // Asumint que tens una vista 'auth.error'
    }
}
```
Caldrà fer unes modificacions en el model User.php

```php
<?php
protected $fillable = [
        'name',
        'email',
        'password',
        'google_id',
        'administrador',
    ];
?>
```

I afegir el camp google_id a la migració de la base de dades

#### Pas 6 - Creació de les vistes de comprovació

Crea dues vistes en resources/views/auth: success.blade.php i error.blade.php.

```php
{{-- resources/views/auth/success.blade.php --}}

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Autenticació Exitosa</title>
</head>
<body>
    <h1>Benvingut/da!</h1>
    <p>La teua autenticació ha sigut exitosa.</p>
    <p>El teu token d'accés és: {{ $token }}</p>
</body>
</html>
```

```php
{{-- resources/views/auth/error.blade.php --}}

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Error d'Autenticació</title>
</head>
<body>
    <h1>Error d'Autenticació</h1>
    <p>Ha ocorregut un error durant el procés d'autenticació: {{ $error }}</p>
</body>
</html>
```
## WebSockets

Els WebSockets permeten comunicacions bidireccionals en temps real entre el servidor i els clients. Laravel facilita treballar amb WebSockets a través de Laravel Echo i canals de difusió.

### Configuració Bàsica

**Instal·lar Laravel Echo**: Utilitza npm per a instal·lar les dependències necessàries.

```bash
npm install --save laravel-echo pusher-js
```

**Configuració del Fitxer .env**: Defineix les claus i secrets de Pusher (o la teua solució WebSocket).

### Creació de Canals

Defineix canals en routes/channels.php. Per exemple, un canal privat:

```php
Broadcast::channel('channel-name', function ($user) {
    return true; // Autorització
});
```

### Escoltar Esdeveniments amb Echo

A l'frontend, utilitza Laravel Echo per a escoltar esdeveniments en un canal:

```js
Echo.channel('channel-name')
.listen('EventName', (e) => {
console.log(e);
});
```

### Disparar Esdeveniments en Temps Real

Crea esdeveniments que implementen ShouldBroadcast i defineix en quin canal s'han d'emetre.

```php
class EventName implements ShouldBroadcast
{
    public function broadcastOn()
    {
        return new Channel('channel-name');
    }
}
```

### Exemple Complet

#### Pas 1: Configuració dels WebSockets
Primer, has de configurar el teu sistema per a utilitzar WebSockets. Laravel Echo i Laravel WebSockets (un paquet que permet crear un servidor de WebSockets directament en Laravel) són opcions populars.

1. Instal·la Laravel WebSockets:

```bash
composer require beyondcode/laravel-websockets
```

2. Publica les Configuracions i Migracions:

```bash
php artisan vendor:publish --provider="BeyondCode\LaravelWebSockets\WebSocketsServiceProvider" --tag="migrations"
php artisan vendor:publish --provider="BeyondCode\LaravelWebSockets\WebSocketsServiceProvider" --tag="config"
```

3. Executa les Migracions:

```bash
php artisan migrate
```

4. Configura .env per a usar el driver pusher:

```bash
BROADCAST_DRIVER=pusher

PUSHER_APP_ID=local
PUSHER_APP_KEY=local
PUSHER_APP_SECRET=local
PUSHER_APP_CLUSTER=mt1
```

5. Inicia el servidor de WebSockets:

```bash
php artisan websockets:serve
```

#### Pas 2: Crear Event Que Utilitza WebSockets

Ara, crearem un esdeveniment Laravel que utilitza WebSockets per a enviar notificacions.

1. Crea un esdeveniment que implemente ShouldBroadcast:

```bash
php artisan make:event BookSold
```

2. Edita l'esdeveniment BookSold:

```php
namespace App\Events;

use Illuminate\Broadcasting\Channel;
use Illuminate\Queue\SerializesModels;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Broadcasting\PresenceChannel;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;

class BookSold implements ShouldBroadcast
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    public $book;
    public $user;

    public function __construct($book, $user)
    {
        $this->book = $book;
        $this->user = $user;
    }

    public function broadcastOn()
    {
        return new PrivateChannel('user.'.$this->user->id);
    }
}
```

#### Pas 3: Disparar l'Esdeveniment

Quan es realitze una venda, dispara l'esdeveniment:

```php
event(new BookSold($book, $user));
```

#### Pas 4: Escoltar l'Esdeveniment al Frontend

Amb Laravel Echo, pots escoltar l'esdeveniment al frontend. Primer, assegura't de tindre Laravel Echo instal·lat i configurat al teu projecte frontend.

```js
Echo.private('user.' + userId)
    .listen('BookSold', (e) => {
        alert("El teu llibre s'ha venut!");
        // Actualitza la UI segons corresponga
    });
```

Aquest codi JavaScript escoltarà l'esdeveniment BookSold en un canal privat associat amb l'usuari. Quan es dispara l'esdeveniment, es mostrarà una alerta (o qualsevol altra acció que vulgues realitzar).


##  Integració amb ChatGPT API


#### Registra't i Obté les Credencials de l'API

  * Registra't a OpenAI: Visita el lloc web d'OpenAI i crea un compte si encara no en tens un.
  * Accedeix a la Secció d'API: Un cop registrat, busca l'opció per accedir a les credencials de l'API.
  * Crea un Nou Projecte/API Key: Segueix les instruccions per crear un nou projecte i genera una clau API. Aquesta clau et permetrà realitzar peticions a l'API de ChatGPT.

#### Configura les Credencials de l'API

Guarda les Credencials: Un cop tinguis la clau API, hauràs de guardar-la de manera segura.
Actualitza el Fitxer .env: Afegeix la teva clau API al teu fitxer .env de Laravel. Això manté les teves credencials segures i separades del teu codi font.

```php
OPENAI_API_KEY=tua_clau_api
```
Conselles de Seguretat: No compartisques les teves claus API en el codi font, especialment si el codi és públic.

En el teu fitxer de configuració (per exemple, config/services.php), afegeix una entrada per a OpenAI.

```php
'openai' => [
    'api_key' => env('OPENAI_API_KEY'),
]
```

#### Creació d'un service per a OpenAI

Per a això creem un directori Services i un fixer ChatGPTService.php

```php
<?php

namespace App\Http\Services;

use GuzzleHttp\Client;


class ChatGTPService
{
    /**
     * Register services.
     */

    protected $client;

    public function __construct()
    {
        $this->client = new Client([
            'base_uri' => 'https://api.openai.com/v1/',
            'headers' => [
                'Authorization' => 'Bearer ' . config('services.openai.api_key'),
            ],
        ]);
    }

    public function response($question){
        try {
            $response = $this->client->post('chat/completions', [
                'json' => [
                    'model' => 'gpt-3.5-turbo',
                    'messages' => [
                        ['role' => 'system', 'content' => 'Ets un fan del Barça.'],
                        ['role' => 'user', 'content' => $question],
                   ],
                    'max_tokens' => 250,
                ],
            ]);

            $body = $response->getBody();
            $content = json_decode($body->getContents(), true);
            return $content['choices'];
        } catch (\Exception $e) {
            // Gestiona l'error
            echo "Error: " . $e->getMessage();
        }
    }
}
```

Ara la forma de utilitzar-lo de forma bàsica és la següent:

```php
    $chatService = new ChatGTPService();
    $reply = $chatService->response($question);
    $message = '';
    foreach ($reply as $r){
        if ($r['message']['role'] == 'assistant') {
                $message .= $r['message']['content'];
        }
    }
```        


A partir d'ahi hem de estudiar la [documentació de l'API](https://platform.openai.com/docs/api-reference) per a poder fer peticions i tractar les respostes.
Al mateix temps crearem les rutes, les vistes i els metodes necessaries per incrementar la funcionalitat de la nostra aplicació.


## Gestió de pagaments

La primera decisió que hem de pendre es triar la passarel·la de Pagament: Hi ha moltes opcions com Stripe, PayPal, PayU, Braintree, Square, Authorize.Net...
Totes solen tindre entorn de proves(sanbox) on fer transaccions fictícies per a provar el funcionament de la passarel·la de pagament.

### PayPal

Per permetre que un usuari pague amb el seu compte PayPal Sandbox a un compte Business de Sandbox en una aplicació Laravel, hauràs de seguir una sèrie de passos. Aquests passos impliquen la configuració del teu entorn de Sandbox a PayPal i la integració amb la teva aplicació Laravel utilitzant el paquet paypal/rest-api-sdk-php o una altra biblioteca similar. Aquí tens una guia pas a pas:

* Configura els Comptes Sandbox: Assegura't que tens dos comptes en PayPal Sandbox: un compte personal (que simula el comprador) i un compte Business (que simula el venedor).

* Instal·la el Paquet de PayPal en Laravel: Utilitza Composer per instal·lar el paquet `paypal/rest-api-sdk-php` o una altra biblioteca de PayPal compatible amb Laravel.

* Configura les Credencials de Sandbox en Laravel: Obté les credencials del teu compte Business de Sandbox (ID de client i secret) i configura-les en el teu projecte Laravel, normalment a través del fitxer .env. i configura el `services.php
     
```php
'paypal' => [
'client_id' => env('PAYPAL_CLIENT_ID'),
'client_secret' => env('PAYPAL_CLIENT_SECRET'),
],
```  

* Crea un Context d'API de PayPal: Utilitza les credencials del teu compte Business de Sandbox per crear un objecte ApiContext. Aquest objecte s'utilitzarà per a realitzar crides a l'API de PayPal.

```php
use PayPal\Rest\ApiContext;
use PayPal\Auth\OAuthTokenCredential;

// ...

public function createPayment()
{
    $apiContext = new ApiContext(new OAuthTokenCredential(
            env('PAYPAL_CLIENT_ID'),     // ClientID
            env('PAYPAL_SECRET')         // ClientSecret
        )
    );

    // Configura el `ApiContext` segons les teves necessitats
    $apiContext->setConfig([
        'mode' => 'sandbox', // Mode Sandbox per a proves
        // Altres configuracions...
    ]);

    // Aquí va la resta de la teva lògica de pagament...
}
```

* Implementa la Lògica de Pagament:

        * Desenvolupa la lògica en els teus controladors Laravel per crear sol·licituds de pagament. Això inclou la creació d'objectes de pagament amb detalls com l'import, la moneda, i la descripció.
        * Redirigeix l'Usuari a PayPal: Quan un usuari iniciï un pagament, redirigeix-lo a la pàgina de pagament de PayPal utilitzant l'URL proporcionada per la biblioteca. L'usuari iniciarà sessió amb el seu compte personal de Sandbox per completar el pagament.
        * Gestiona la Resposta de PayPal: Després que l'usuari completi el pagament, serà redirigit de tornada a la teva aplicació. Necessitaràs gestionar aquesta resposta per confirmar la transacció.
        * Prova el Procés de Pagament: Realitza proves utilitzant els teus comptes de Sandbox per assegurar-te que tot funciona com s'espera. Això inclou iniciar un pagament amb el compte personal de Sandbox i rebre el pagament en el compte Business de Sandbox.
        * Revisa i Depura: Comprova que les transaccions es mostren correctament en els panells de control de Sandbox tant del comprador com del venedor. Depura qualsevol problema que puguis trobar.

Exemple de creació d'un pagament amb el SDK de PayPal:

```php
use PayPal\Api\Amount;
use PayPal\Api\Payer;
use PayPal\Api\Payment;
use PayPal\Api\RedirectUrls;
use PayPal\Api\Transaction;
use PayPal\Rest\ApiContext;
use PayPal\Auth\OAuthTokenCredential;

class PaymentController extends Controller
{
    private $apiContext;

    public function __construct()
    {
        $this->apiContext = new ApiContext(
            new OAuthTokenCredential(
                env('PAYPAL_SANDBOX_CLIENT_ID'),     // ClientID
                env('PAYPAL_SANDBOX_SECRET')         // ClientSecret
            )
        );
        $this->apiContext->setConfig(['mode' => 'sandbox']);
    }

    public function createPayment()
    {
        $payer = new Payer();
        $payer->setPaymentMethod('paypal');

        $amount = new Amount();
        $amount->setTotal('10.00');  // Defineix l'import del pagament
        $amount->setCurrency('EUR'); // Defineix la moneda

        $transaction = new Transaction();
        $transaction->setAmount($amount);
        $transaction->setDescription('Descripció del pagament');

        $redirectUrls = new RedirectUrls();
        $redirectUrls->setReturnUrl(url('/payment/success')) // URL de retorn en cas d'èxit
                     ->setCancelUrl(url('/payment/cancel')); // URL de retorn en cas de cancel·lació

        $payment = new Payment();
        $payment->setIntent('sale')
                ->setPayer($payer)
                ->setTransactions([$transaction])
                ->setRedirectUrls($redirectUrls);

        try {
            $payment->create($this->apiContext);
            return redirect()->away($payment->getApprovalLink());
        } catch (Exception $e) {
            // Gestiona l'error aquí
            return back()->with('error', 'Hi ha hagut un problema en processar el pagament');
        }
    }
    
    public function successPayment(Request $request)
    {
        $paymentId = $request->get('paymentId');
        $payerId = $request->get('PayerID');
    
        if (empty($paymentId) || empty($payerId)) {
            // Redirigeix a una pàgina d'error o mostra un missatge
            return redirect('/')->with('error', "El pagament no s'ha pogut verificar.");
        }
    
        $payment = Payment::get($paymentId, $this->apiContext);
    
        $execution = new PaymentExecution();
        $execution->setPayerId($payerId);
    
        try {
            // Executa el pagament
            $result = $payment->execute($execution, $this->apiContext);
    
            // Comprova que el pagament s'ha completat amb èxit
            if ($result->getState() == 'approved') {
                // Aquí pots processar la informació de la transacció, 
                // com ara actualitzar la base de dades, etc.
                return redirect('/')->with('success', 'Pagament completat amb èxit.');
            }
        } catch (Exception $e) {
            // Gestiona els errors aquí
            return redirect('/')->with('error', 'Hi ha hagut un problema en processar el teu pagament.');
        }
    
        return redirect('/')->with('error', "El pagament no s'ha pogut completar.");
    }

    // Aquí pots afegir els mètodes per gestionar la cancel·lació  del pagament
}
```
Defineix les rutes
    
```php  
Route::get('/payment/create', 'PaymentController@createPayment');
Route::get('/payment/success', 'PaymentController@successPayment');
Route::get('/payment/cancel', 'PaymentController@cancelPayment');
```

És important seguir aquests passos detalladament i referir-se a la documentació específica de la biblioteca que estàs utilitzant per obtenir instruccions detallades i exemples de codi. La clau està en la correcta configuració i integració de les credencials de PayPal Sandbox i la correcta gestió de les respostes de l'API de PayPal.

**Notes Importants**
Aquest exemple és molt bàsic i només per a fins educatius. En un entorn de producció, hauràs de gestionar molts altres aspectes com la verificació de seguretat, el maneig d'errors més detallat, i la integració amb la base de dades.
Assegura't de provar aquest codi en l'entorn de Sandbox de PayPal abans de considerar la seva implementació en producció.
Personalitza els imports del pagament (import, moneda, descripció) segons les necessitats del teu projecte.

## Activitats

901. Crea l'autenticació mitjançant google per a l'aplicació de BatoiBook

Tria un: 

902. Crea un canal de difusió per a l'aplicació de BatoiBook. Crea un esdeveniment que s'envie per aquest canal de difusió quan es realitze una venda
903. Crea un chat per a l'API de ChatGPT en l'aplicació de BatoiBook. Fes que al mostrar el llibre (soles en show) ixca un index del llibre generat per chatgtp.
904. Crea una pasarela de pagament per a l'aplicació de BatoiBook.

Investiga:

905. Tria un e intenta intregrar en batoibooks:

        * Integració de Google Maps API.
        * Gestió d'Enviaments amb APIs de Logística.
        * Integració de Passarel·les de Pagament.
        * Ús de APIs de Xarxes Socials.
        * Serveis Meteorològics Integrats.
        * Recollida d'Opinions amb APIs de Ressenyes.


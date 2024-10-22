# Notificacions, correu i cues

## Notificacions

Les notificacions ens permeten enviar missatges a l'usuari de forma que aquest puga veure'ls en el moment que accedeix a la nostra aplicació.
A Laravel, les notificacions són una forma còmoda d'enviar notificacions a través de diversos canals com correu electrònic, SMS, Slack, etc.

Creació de Notificacions
Per crear una notificació, pots utilitzar Artisan:

```bash
php artisan make:notification NomNotificacio
```

Això crearà una nova classe de notificació dins del directori app/Notifications.

### Enviament de Notificacions
Pots enviar notificacions a un usuari utilitzant el mètode notify en una instància de l'usuari:
    
```php
$user->notify(new NomNotificacio($data));
```

On $user és una instància del model User i $data són les dades que vols passar a la notificació.

### Personalització del Canal
Pots definir quins canals utilitzarà la notificació (per exemple, correu electrònic, base de dades) en el mètode via de la classe de notificació:

```php
/**
 * Obtenir els canals de notificació per a l'aplicació.
 *
 * @param  mixed  $notifiable
 * @return array|string
 */
public function via($notifiable)
{
    return ['mail','database'];
}
```

### Exemple

#### Notificacions: Notificar a un Usuari sobre una Nova Venda
Primer, creem una notificació per a notificar a un usuari quan un dels seus llibres s'ha venut.
    
```bash
php artisan make:notification BookSoldNotification
```

Ara, edita la classe de notificació BookSoldNotification:

```php
namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Notification;
use Illuminate\Notifications\Messages\MailMessage;

class BookSoldNotification extends Notification
{
    use Queueable;

    public $book;
    public $sale;

    public function __construct($book, $sale)
    {
        $this->book = $book;
        $this->sale = $sale;
    }

    public function via($notifiable)
    {
        return ['mail'];
    }

    public function toMail($notifiable)
    {
        return (new MailMessage)
                    ->line('El teu llibre ha estat venut!')
                    ->action('Veure Detalls', url('/sales/'.$this->sale->id))
                    ->line('Gràcies per utilitzar la nostra aplicació!');
    }
}
```

Després, envia la notificació quan es realitza una venda:

```php
use App\Notifications\BookSoldNotification;

// Suposem que $user és el propietari del llibre, $book és el llibre venut, i $sale és la venda
$user->notify(new BookSoldNotification($book, $sale));
```

## Correu

Laravel facilita l'enviament de correus electrònics amb diverses opcions de personalització.

#### Creació de Mailables
Primer, crea una classe Mailable amb Artisan:
    
```bash
php artisan make:mail NomMailable
```

Aquesta classe es troba dins de app/Mail i pot ser personalitzada per definir com es veurà el correu.

Enviament de Correus
Pots enviar correus electrònics utilitzant el façade Mail:

```php
use App\Mail\NomMailable;
use Illuminate\Support\Facades\Mail;

Mail::to($request->user())->send(new NomMailable($data));
```
On $data conté les dades que vols passar al mailable.

### Estructura Bàsica de la Classe Mailable
Dins de la teva classe CustomMail, tindràs la següent estructura bàsica:

```php
namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class CustomMail extends Mailable
{
    use Queueable, SerializesModels;

    // Defineix les propietats i el constructor

    public function build()
    {
        return $this->view('view.name');
    }
}
```
### Personalització del Mailable

#### Passar Dades al Mailable:
Pots passar dades al mailable utilitzant el constructor. Aquestes dades es poden utilitzar després en la vista del correu.

```php
public $data;

public function __construct($data)
{
    $this->data = $data;
}
```

#### Definir la Vista:
Especifica la vista que utilitzarà el correu. Pots crear una vista Blade dins de resources/views/emails.

```php
public function build()
{
    return $this->view('emails.custom')
                ->with(['data' => $this->data]);
}
```
#### Configurar el Correu:
Dins del mètode build, pots encadenar mètodes per a configurar el correu, com l'assumpte, l'emissor, etc.

```php
return $this->from('example@example.com')
            ->subject('Assumpte del Correu')
            ->view('emails.custom');
```

#### Utilitzar Components de Markdown:
Laravel permet utilitzar components de Markdown per a construir correus de manera senzilla. Pots utilitzar markdown en lloc de view per a utilitzar una vista Markdown.

```php
return $this->subject('Assumpte del Correu')
            ->markdown('emails.custom_markdown', ['data' => $this->data]);
```

#### Adjuntar Fitxers:
Si vols adjuntar fitxers al correu, pots fer-ho dins del mètode build.

```php
return $this->view('emails.custom')
->attach('/path/to/file');
```

#### Exemple de Vista Blade per al Correu

Dins de resources/views/emails/custom.blade.php:

```php
<!DOCTYPE html>
<html>
<head>
    <title>Correu Personalitzat</title>
</head>
<body>
    <h1>{{ $data['title'] }}</h1>
    <p>{{ $data['body'] }}</p>
</body>
</html>
```
### Exemple d'enviar un Correu de Confirmació de Compra

Creem un mailable per enviar un correu de confirmació de compra.
    
```bash
php artisan make:mail PurchaseConfirmationMail
```

Edita la classe PurchaseConfirmationMail:

```php
namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class PurchaseConfirmationMail extends Mailable
{
    use Queueable, SerializesModels;

    public $sale;

    public function __construct($sale)
    {
        $this->sale = $sale;
    }

    public function build()
    {
        return $this->view('emails.purchase_confirmation')
                    ->with(['sale' => $this->sale]);
    }
}
```
Crea una vista resources/views/emails/purchase_confirmation.blade.php per aquest correu. Després, envia el correu quan es realitza una compra:

```php
use App\Mail\PurchaseConfirmationMail;

Mail::to($buyer->email)->send(new PurchaseConfirmationMail($sale));
```

## Cues

Les cues permeten retardar l'execució de tasques llargues, com l'enviament de correus electrònics, per no bloquejar la petició HTTP del teu usuari.

### Configuració
La configuració de les cues en Laravel es troba en l'arxiu config/queue.php. Aquest arxiu defineix connexions de cua per a diferents controladors com database, sqs, redis, etc. Pots seleccionar el controlador de cua predeterminat en l'arxiu .env amb la clau QUEUE_CONNECTION.

Per exemple, per a usar una cua de base de dades:

1. Configura el Controlador de Cua: En el teu arxiu .env, estableix:

```php  
QUEUE_CONNECTION=database
```

2. Crea la Taula de Cues: Si estàs utilitzant el controlador database, necessitaràs una taula per a emmagatzemar els treballs en cua. Pots generar una migració per a esta taula amb l'ordre:

```bash
php artisan queue:table
php artisan migrate
```

3. Executar el Worker de Cua: Per a processar treballs en cua, has de tindre un worker en execució. Pots iniciar un worker amb:
    
```bash
php artisan queue:work
```

### Treballs de Cua
Crea treballs de cua per manejar tasques:
    
```bash
php artisan make:job NomTreball
```

Aquest treball es troba dins de app/Jobs. Pots definir la lògica de la teva tasca dins del mètode handle.

```php
namespace App\Jobs;

use App\Models\Venda;
// Importa altres models o classes necessàries

class ProcessarVenda extends Job
{
    protected $venda;

    public function __construct(Venda $venda)
    {
        $this->venda = $venda;
    }

    public function handle()
    {
        // Lògica per a processar la venda
        // Per exemple, actualitzar l'estat, notificar a l'usuari, etc.

        $this->venda->update(['estat' => 'processada']);
        // Més lògica segons siga necessari
    }
}
```

### Despatxar Treballs
Envia treballs a la cua:

```php
NomTreball::dispatch($data);
```
Això afegirà el treball a la teva cua per ser executat.

### Exemple: Processar la Venda en Fons

Suposem que vols processar les dades de la venda en fons. Primer, crea un treball de cua:

```bash
php artisan make:job ProcessSale
```

Edita ProcessSale per a incloure la lògica de processament de vendes:

```php
namespace App\Jobs;

use Illuminate\Bus\Queueable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;

class ProcessSale implements ShouldQueue
{
    use InteractsWithQueue, Queueable, SerializesModels;

    protected $sale;

    public function __construct($sale)
    {
        $this->sale = $sale;
    }

    public function handle()
    {
        // Lògica de processament de la venda
        // Per exemple, actualitzar l'estat, notificar a l'usuari, etc.
    }
}
```
Despatxa aquest treball quan es realitza una venda:

```php
ProcessSale::dispatch($sale);
```



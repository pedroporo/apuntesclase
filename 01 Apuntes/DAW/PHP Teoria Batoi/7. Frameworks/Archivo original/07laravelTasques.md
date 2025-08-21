# Tasques

## Tasques Programades (Task Scheduling)

Laravel proporciona una manera elegant d'executar tasques programades com l'enviament de correus, neteja de la base de dades, etc., sense necessitat de crear crons complexos al servidor.

### Configuració del Scheduler
Cron a Nivell de Servidor: Necessites afegir una entrada a crontab en el teu servidor que executa schedule:run cada minut.

```bash
* * * * * cd /path-de-tu-projecte && php artisan schedule:run >> /dev/null 2>&1
```

### Creació de Comandos

Pots crear comandos amb Artisan per a ser programats:

```bash
php artisan make:command NomComando
```

Això generarà una nova classe de comando en el directori app/Console/Commands.

#### Estructura del Comando
La classe del comando contindrà un parell de propietats i mètodes importants:

$signature: Una cadena que defineix com s'invoca el comando des de la línia de comandes.
$description: Una breu descripció del que fa el comando.
handle(): El mètode on escriuràs la lògica que s'executarà quan es cridi el comando.

#### Exemple de Comando
Suposem que vols crear un comando per a enviar correus de recordatori als usuaris. Ací tens un exemple:

```php
namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Models\User;
use App\Mail\ReminderMail;
use Illuminate\Support\Facades\Mail;

class SendReminders extends Command
{
    protected $signature = 'send:reminders';
    protected $description = 'Envia correus de recordatori als usuaris.';

    public function handle()
    {
        $users = User::all(); // Obtenir tots els usuaris

        foreach ($users as $user) {
            Mail::to($user->email)->send(new ReminderMail());
        }

        $this->info('Correus de recordatori enviats correctament!');
    }
}
```

### Programar el Comando

Una vegada creat el comando, el següent pas és programar-lo en l'arxiu app/Console/Kernel.php. Ací, pots definir quan s'ha d'executar el comando usant una varietat de mètodes com daily, hourly, everyMinute, etc.
    
```php
protected function schedule(Schedule $schedule)
{
$schedule->command('send:reminders')->daily();
}
```

En aquest exemple, el comando send:reminders s'executarà diàriament.



## Esdeveniments (Events) i Oïdors (Listeners)

Els esdeveniments són una forma de desacoplar diverses parts de l'aplicació i consisteixen en dos parts principals: esdeveniments (events) i oïdors (listeners).

### Creació d'Esdeveniments

```bash
php artisan make:event NomEsdeveniment
```
Açò crearà una nova classe d'esdeveniment dins del directori app/Events.

Exemple d'Esdeveniment:

```php  
namespace App\Events;

use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;

class UserRegistered
{
    use Dispatchable, SerializesModels;

    public $user;

    public function __construct(User $user)
    {
        $this->user = $user;
    }
}
```
En aquest exemple, l'esdeveniment UserRegistered s'utilitza per a anunciar que un usuari s'ha registrat.


### Creació d'Oïdors

```bash
php artisan make:listener NomOidor --event=NomEsdeveniment
```

Els oïdors reaccionen quan s'activa un esdeveniment. Defineix la lògica de resposta en l'oïdor.

Exemple d'Oïdor:

```php
namespace App\Listeners;

use App\Events\UserRegistered;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;

class SendWelcomeEmail
{
    use InteractsWithQueue;

    public function handle(UserRegistered $event)
    {
        // Enviar correu de benvinguda
        Mail::to($event->user->email)->send(new WelcomeEmail($event->user));
    }
}
```
En aquest exemple, l'oïdor SendWelcomeEmail escolta l'esdeveniment UserRegistered i envia un correu de benvinguda.

### Registrar Esdeveniments i Oïdors

Has de registrar els teus esdeveniments i oïdors en l'arxiu EventServiceProvider.php dins del directori app/Providers.
    
```php
protected $listen = [
'App\Events\UserRegistered' => [
'App\Listeners\SendWelcomeEmail',
],
];
```

### Disparar Esdeveniments

Pots disparar un esdeveniment en qualsevol part de la teua aplicació:    
```php  
event(new NomEsdeveniment($data));
```












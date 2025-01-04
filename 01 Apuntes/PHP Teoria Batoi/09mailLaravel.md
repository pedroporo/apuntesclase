# Introducció
No cal complicar enviar correus electrònics. Laravel proporciona una API de correu electrònic neta i senzilla alimentada pel popular component Symfony Mailer.
El Laravel i el Symfony Mailer proporcionen controladors per enviar correus electrònics via SMTP, Mailgun, Postmark, Amazon SES i sendmail, permetent-vos començar ràpidament a enviar correus a través d'un servei local o basat en el núvol de la vostra elecció.

## Configuració
Els serveis de correu electrònic de Laravel es poden configurar a través del fitxer de configuració config/mail.php de la vostra aplicació. 
Cada mailer configurat dins d'aquest fitxer pot tenir la seva pròpia configuració única i fins i tot el seu propi "transport", permetent a la vostra aplicació utilitzar diferents serveis de correu electrònic per enviar certs missatges de correu electrònic. 
Per exemple, la vostra aplicació pot utilitzar Postmark per enviar correus electrònics transaccionals mentre s'utilitza Amazon SES per enviar correus electrònics massius.

Dins del fitxer de configuració de correu, trobareu una matriu de configuració de mailers. Aquesta matriu conté una entrada de configuració d'exemple per a cadascun dels principals controladors de correu / transports admesos per Laravel, mentre que el valor de configuració predeterminat determina quin gestor de correu s'utilitzarà per defecte quan la vostra aplicació hagi d'enviar un missatge de correu electrònic.

## Generant els mailables
Quan es construeixen aplicacions Laravel, cada tipus de correu electrònic enviat per la vostra aplicació es representa com una classe "mailable".
Aquestes classes s'emmagatzemen al directori app/mail. No us preocupeu si no veieu aquest directori a la vostra aplicació, ja que es generarà quan creeu la primera classe de mailable utilitzant l'ordre make:mail d'Artisan

```code
php artisan make:mail OrdreShipped
```

## Escriure Mailables
Un cop heu generat una classe de correu, obriu-la perquè poder explorar el seu contingut. La configuració de la classe mailable es fa en diversos mètodes, incloent-hi els mètodes de envelope, content i attachments.

El mètode de **envelope** retorna un objecte **Illuminate\Mail\Mailables\Envelope** que defineix l'assumpte i, de vegades, els destinataris del missatge. 
El mètode de **content** retorna un objecte Illuminate\Mail\Mailables\Content que defineix la plantilla Blade que s'utilitzarà per generar el contingut del missatge.


### Configurar el remitent
#### Ús mètode envelope

Primer, explorem la configuració del remitent del correu electrònic. O, en altres paraules, de qui serà el correu electrònic. Hi ha dues maneres de configurar el remitent. Primer, podeu especificar l'adreça «de» en el from del missatge:


```php
use Illuminate\Mail\Mailables\Address;
use Illuminate\Mail\Mailables\Envelope;

/**
* Get the message envelope.
*
* @return \Illuminate\Mail\Mailables\Envelope
  */
  public function envelope()
  {
      return new Envelope(
          from: new Address('jeffrey@example.com', 'Jeffrey Way'),
          subject: 'Order Shipped',
      );
  }
```

Si ho desitgeu, també podeu especificar una adreça «replyTo»:

```php
return new Envelope(
    from: new Address('jeffrey@example.com', 'Jeffrey Way'),
    replyTo: [
        new Address('taylor@example.com', 'Taylor Otwell'),
    ],
    subject: 'Order Shipped',
);
```

#### Ús d'una adreça global des de
No obstant això, si la vostra aplicació utilitza la mateixa adreça «des de» per a tots els seus correus electrònics, pot resultar difícil trucar al mètode «des de» en cada classe de correu que genereu. En lloc d'això, podeu especificar una adreça global «from» al fitxer de configuració config/mail.php. Aquesta adreça s'utilitzarà si no s'especifica cap altra adreça "de" dins de la classe de correu:

```php
'from' => ['address' => 'example@example.com', 'name' => 'App Name'],
```

A més, podeu definir una adreça global «reply"to» dins del fitxer de configuració config/mail.php:

```php
'reply_to' => ['adreça' = = 'exemple@exemple.com', 'nom' =  'nom d'aplicació'],
```

### Configurar la vista
Dins del mètode content d'una classe de correu, podeu definir la vista, o quina plantilla s'ha d'utilitzar quan es renderitza el contingut del correu electrònic. 
Atès que cada correu electrònic normalment utilitza una plantilla de Blade per representar el seu contingut, teniu tota la potència i conveniència del motor de templating Blade en construir l'HTML del vostre correu electrònic:

```php
/**
* Get the message content definition.
*
* @return \Illuminate\Mail\Mailables\Content
  */
  public function content()
  {
      return new Content(
        view: 'emails.orders.shipped',
      );
  }
```

### Mostra les dades

#### Via Propietats públiques
Normalment, voldreu passar algunes dades a la vostra vista que podeu utilitzar en renderitzar l'HTML del correu electrònic. 
Hi ha dues maneres de posar les dades a disposició de la vostra vista. Primer, qualsevol propietat pública definida a la vostra classe de correu es posarà automàticament a disposició de la vista. 
Així, per exemple, podeu passar dades al constructor de la classe de correu i establir aquestes dades a les propietats públiques definides a la classe:

```php
<?php
namespace App\Mail;

use App\Models\Order;
use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Queue\SerializesModels;

class OrderShipped extends Mailable
{
use Queueable, SerializesModels;

    /**
     * The order instance.
     *
     * @var \App\Models\Order
     */
    public $order;
 
    /**
     * Create a new message instance.
     *
     * @param  \App\Models\Order  $order
     * @return void
     */
    public function __construct(Order $order)
    {
        $this->order = $order;
    }
 
    /**
     * Get the message content definition.
     *
     * @return \Illuminate\Mail\Mailables\Content
     */
    public function content()
    {
        return new Content(
            view: 'emails.orders.shipped',
        );
    }
}
```

Una vegada que les dades s'hagin establert en una propietat pública, estaran disponibles automàticament a la vostra vista, de manera que podreu accedir-hi com ho faríeu amb qualsevol altra dada a les vostres plantilles de Blade:

```html
<div>
    Price: {{ $order->price }}
</div>
```

#### Via paràmetre 
Si voleu personalitzar el format de les dades del vostre correu electrònic abans d'enviar-les a la plantilla, podeu passar manualment les vostres dades a la vista mitjançant la definició de contingut amb el paràmetre.
Normalment, encara passareu dades a través del constructor de la classe de correu; no obstant això, haureu d'establir aquestes dades a propietats protegides o privades, de manera que les dades no estiguin disponibles automàticament a la plantilla:

```php
<?php
 
namespace App\Mail;
 
use App\Models\Order;
use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Queue\SerializesModels;
 
class OrderShipped extends Mailable
{
    use Queueable, SerializesModels;
 
    /**
     * The order instance.
     *
     * @var \App\Models\Order
     */
    protected $order;
 
    /**
     * Create a new message instance.
     *
     * @param  \App\Models\Order  $order
     * @return void
     */
    public function __construct(Order $order)
    {
        $this->order = $order;
    }
 
    /**
     * Get the message content definition.
     *
     * @return \Illuminate\Mail\Mailables\Content
     */
    public function content()
    {
        return new Content(
            view: 'emails.orders.shipped',
            with: [
                'orderName' => $this->order->name,
                'orderPrice' => $this->order->price,
            ],
        );
    }
}
```

## Attachments

Per a afegir adjunts a un correu electrònic, afegireu adjunts a la matriu retornada pel mètode d'adjunts del missatge.
En primer lloc, podeu afegir un adjunt proporcionant un camí de fitxer al mètode fromPath proporcionat per la classe attachment:


```php
use Illuminate\Mail\Mailables\Attachment;

/**
* Get the attachments for the message.
*
* @return \Illuminate\Mail\Mailables\Attachment[]
  */
  public function attachments()
  {
    return [
        Attachment::fromPath('/path/to/file'),
    ];
  }
```

En adjuntar fitxers a un missatge, també podeu especificar el nom a mostrar i / o tipus MIME per a l'adjunt usant els mètodes as i withMime:

```php
/**
* Get the attachments for the message.
*
* @return \Illuminate\Mail\Mailables\Attachment[]
  */
  public function attachments()
  {
  return [
        Attachment::fromPath('/path/to/file')
        ->as('name.pdf')
        ->withMime('application/pdf'),
    ];
  }
```

# Enviant correu

Per enviar un missatge, utilitzeu el mètode to a la façana del Correu.
El mètode to accepta una adreça de correu electrònic, una instància d'usuari o una col·lecció d'usuaris.
Si passeu un objecte o una col·lecció d'objectes, el mailer utilitzarà automàticament les seves propietats de correu electrònic i de nom quan determini els destinataris del correu, així que assegureu-vos que aquests atributs estiguin disponibles en els vostres objectes.
Un cop hàgiu especificat els destinataris, podeu passar una instància de la vostra classe de correu al mètode d'enviament:

```php
<?php
 
namespace App\Http\Controllers;
 
use App\Http\Controllers\Controller;
use App\Mail\OrderShipped;
use App\Models\Order;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
 
class OrderShipmentController extends Controller
{
    /**
     * Ship the given order.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $order = Order::findOrFail($request->order_id);
 
        // Ship the order...
 
        Mail::to($request->user())->send(new OrderShipped($order));
    }
}

```

No esteu limitat a especificar els destinataris «a» quan envieu un missatge. Sou lliure d'establir els destinataris "a", "cc" i "bcc" encadenant els seus respectius mètodes junts:

```php
Mail::to($request->user())
->cc($moreUsers)
->bcc($evenMoreUsers)
->send(new OrderShipped($order));
```
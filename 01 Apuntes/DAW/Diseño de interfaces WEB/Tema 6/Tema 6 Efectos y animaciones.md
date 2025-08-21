---
sidebar_label: 'Efectos y animaciones'
sidebar_position: 2
---

# Efectos y animaciones

## Tabla de Contenidos
- [Transformaciones](#transformaciones)
- [Transiciones](#transiciones)
- [Ejemplos de Efectos CSS](#ejemplos-de-efectos-css)
- [Animaciones con Keyframes](#animaciones-con-keyframes)
- [Efectos con Animaciones](#efectos-con-animaciones)
- [Efectos 3D en CSS](#efectos-3d-en-css)

## Transformaciones

Las transformaciones permiten manipular el tamaño, la posición y la forma de los elementos sin alterar el flujo de los elementos en la página. Estas transformaciones se aplican utilizando la propiedad `transform`.

### Tipos de Transformaciones

- **Rotate (deg)**: Rota un elemento en grados. Se puede combinar con `transform-origin` para cambiar el centro de rotación.
- **Skew (deg)**: Inclina un elemento. Puedes usar `skewX()` o `skewY()` para inclinar en un solo eje.
- **Translate ()**: Mueve un elemento en el eje X o Y. Ejemplos: `translateX()`, `translateY()`.
- **Scale ()**: Escala un elemento en el eje X o Y. Ejemplos: `scaleX()`, `scaleY()`.

**Nota**: Las transformaciones se pueden combinar escribiéndolas una tras otra sin comas.

```css
/* Ejemplo de Transformación */
.transformacion {
    transform: rotate(45deg) translateX(100px) scale(1.5);
}
```

## Transiciones
Las transiciones permiten que los cambios en las propiedades CSS ocurran de forma gradual en lugar de instantánea.

### Propiedades de Transición
- **All**: Aplica la transición a todas las propiedades transformables.
- **Duration**: Duración de la transición, generalmente en segundos (s).
- **Timing-function**: Controla la velocidad de la transición. Valores: `ease`, `ease-in`, `ease-out`, `linear`, etc.

```css
/* Ejemplo de Transición */
.transicion {
    transition: all 0.5s ease-in-out;
}
```
## Ejemplos de Efectos CSS
### Ejemplo 1: Bordes Redondeados
Este ejemplo redondea los bordes de una caja cuando se pasa el ratón sobre ella.
```html
<div class="esquinas_redondeadas">
    <p>Esquina página</p>
</div>

<style>
.esquinas_redondeadas {
    transition-duration: 0.2s;
    font-family: Arial;
    background-color: #a8cf45;
    margin: 10px 10px;
    text-align: center;
    font-weight: bold;
    padding: 15px 30px;
    width: 40%;
    display: inline-block;
    vertical-align: middle;
}
.esquinas_redondeadas:hover {
    border-radius: 20px;
}
</style>
```
**Resultado:**
<div class="esquinas_redondeadas">
    <p>Esquinas redondeadas</p>
</div>

### Ejemplo 2: Resaltado de Bordes en Menú
Este ejemplo aplica diferentes estilos de borde cuando se pasa el ratón sobre las opciones de un menú.

```html
<nav class="nav_ejemplo_bordes">
    <ul>
        <li>Opción 1</li>
        <li>Opción 2</li>
        <li>Opción 3</li>
    </ul>
</nav>

<style>
.nav_ejemplo_bordes {
    height: 40px;
}

.nav_ejemplo_bordes li {
    display: inline-block;
    text-decoration: none;
    margin: 0 10px;
    padding: 5px;
    transition-duration: 0.2s;
}

.nav_ejemplo_bordes li:nth-of-type(1):hover { 
    border-bottom: 3px dotted red; 
}
.nav_ejemplo_bordes li:nth-of-type(2):hover { 
    border-bottom: 3px solid green; 
}
.nav_ejemplo_bordes li:nth-of-type(3):hover { 
    border-bottom: 3px solid blue; 
}
</style>
```
**Resultado:**
<nav class="nav_ejemplo_bordes">
    <ul>
        <li>Opción 1</li>
        <li>Opción 2</li>
        <li>Opción 3</li>
    </ul>
</nav>

### Ejemplo 3: Esquina Doblada de una Caja
Este ejemplo muestra un efecto en el que una esquina de la caja parece doblarse.

```html
<div class="esquina">
    <p>Esquina página</p>
</div>

<style>
.esquina {
    font-family: Arial;
    background-color: #a8cf45;
    margin: 10px 10px;
    text-align: center;
    font-weight: bold;
    padding: 15px 30px;
    width: 40%;
    display: inline-block;
    vertical-align: middle;
    position: relative;
}
.esquina:before {
    content: '';
    position: absolute;
    left: 0px;
    bottom: 0px;
    width: 0;
    height: 0;
    background: linear-gradient(45deg, white 45%, #aaa 50%, #ccc 60%, white);
    transition-duration: 0.3s;
}
.esquina:hover:before {
    width: 35px;
    height: 30px;
}
</style>
```
**Resultado:**
<div class="esquina">
    <p>Esquina doblada</p>
</div>

## Animaciones con Keyframes
Los `@keyframes` permiten definir una secuencia de cambios en las propiedades CSS para animar elementos.

### Ejemplo: Cambiar Color con Keyframes
Este ejemplo cambia el color de fondo de un elemento de azul a rojo y viceversa infinitamente.

```html
<div class="animacion">
    <p>Cambia Color</p>
</div>

<style>
.animacion {
    font-family: Arial;
    background-color: blue;
    margin: 15px 2px;
    padding: 5px 40px;
    text-align: center;
    font-weight: bold;
    width: 40%;
    display: inline-block;
    vertical-align: middle;
    animation: 5s cambia_color infinite;
}

@keyframes cambia_color {
    0%, 70% { background: blue; }
    50% { background: red; }
}
</style>
```
**Resultado:**
<div class="animacion">
    <p>Cambia Color</p>
</div>

## Efectos con Animaciones
### Efecto Flash
Este efecto hace que un elemento parpadee rápidamente cuando se pasa el ratón sobre él.

```html
<div class="flash">
    <p>Flash</p>
</div>

<style>
.flash {
    font-family: Arial;
    background-color: #a8cf45;
    margin: 15px 2px;
    padding: 5px 40px;
    text-align: center;
    font-weight: bold;
    width: 40%;
    display: inline-block;
    vertical-align: middle;
}
.flash:hover {
    animation: flash 0.7s 1;
}

@keyframes flash {
    50% { opacity: 1; }
    25%, 75% { opacity: 0; }
}
</style>
```
**Resultado:**
<div class="flash">
    <p>Flash</p>
</div>

### Efecto Vibrar
Este efecto hace que un elemento vibre de lado a lado cuando se pasa el ratón sobre él.

```html
<div class="vibrar">
    <p>Vibrar</p>
</div>

<style>
.vibrar {
    font-family: Arial;
    background-color: #a8cf45;
    margin: 15px 2px;
    padding: 5px 40px;
    text-align: center;
    font-weight: bold;
    width: 40%;
    display: inline-block;
    vertical-align: middle;
}
.vibrar:hover {
    animation: vibrar 1s infinite;
}

@keyframes vibrar {
    5%, 25%, 45%, 65%, 85% { transform: translateX(-10px); }
    15%, 35%, 55%, 75%, 95% { transform: translateX(10px); }
}
</style>
```
**Resultado:**
<div class="vibrar">
    <p>Vibrar</p>
</div>

### Efecto Aparición
Este efecto hace que un elemento aparezca gradualmente.

```html
<div class="aparicion">
    <p>Aparición</p>
</div>

<style>
.aparicion {
    font-family: Arial;
    background-color: #a8cf45;
    margin: 15px 2px;
    padding: 5px 40px;
    text-align: center;
    font-weight: bold;
    width: 40%;
    display: inline-block;
    vertical-align: middle;
    animation: aparicion 2s infinite;
    transform-origin: top left;
}

@keyframes aparicion {
    0% { opacity: 0; }
    50% { opacity: 0.8; }
}
</style>
```
**Resultado:**
<div class="aparicion">
    <p>Aparición</p>
</div>

### Efecto Descolgado
Este efecto simula un objeto que cae o se descuelga.

```html
<div class="descolgado">
    <p>Descolgado</p>
</div>

<style>
.descolgado {
    font-family: Arial;
    background-color: #a8cf45;
    margin: 15px 2px;
    padding: 5px 40px;
    text-align: center;
    font-weight: bold;
    width: 40%;
    display: inline-block;
    vertical-align: middle;
    animation: descolgado 2s infinite;
    transform-origin: top left;
}

@keyframes descolgado {
    20%, 60% { transform: rotate(80deg); }
    40% { transform: rotate(60deg); }
    80% { opacity: 1; transform: rotate(60deg); }
    100% { transform: translateY(400px); opacity: 0; }
}
</style>
```
**Resultado:**
<div class="descolgado">
    <p>Descolgado</p>
</div>

### Efecto Veloz
Este efecto hace que un elemento se desplace rápidamente de un lado a otro de la pantalla.

```html
<div class="veloz">
    <p>Veloz</p>
</div>

<style>
.veloz {
    font-family: Arial;
    background-color: #a8cf45;
    margin: 15px 2px;
    padding: 5px 40px;
    text-align: center;
    font-weight: bold;
    width: 40%;
    display: inline-block;
    vertical-align: middle;
    animation: veloz 1.5s infinite;
}

@keyframes veloz {
    0% { opacity: 0; transform: translateX(-200%) skewX(30deg); }
    60% { opacity: 1; transform: translateX(20%) skewX(-30deg); }
    80% { transform: translateX(0%) skewX(15deg); }
}
</style>
```
**Resultado:**
<div class="veloz">
    <p>Veloz</p>
</div>

### Efecto Sombra Móvil
Este efecto añade una sombra que se mueve junto con el elemento cuando se pasa el ratón sobre él.

```html
<div class="sombra_movil">
    <p>Sombra Móvil</p>
</div>

<style>
.sombra_movil {
    font-family: Arial;
    background-color: #a8cf45;
    margin: 15px 2px;
    padding: 5px 40px;
    text-align: center;
    font-weight: bold;
    width: 40%;
    display: inline-block;
    vertical-align: middle;
    position: relative;
    transition-duration: 0.3s;
    transform: translateX(0);
}

.sombra_movil:before {
    position: absolute;
    content: '';
    top: 100%;
    left: 5%;
    height: 10px;
    width: 90%;
    opacity: 0;
    transition-duration: 0.3s;
}

.sombra_movil:hover:before {
    opacity: 0.4;
    transform: translateY(6px);
    animation: moversombra 1.5s infinite;
}

@keyframes moversombra {
    50% { opacity: 1; transform: translateY(3px); }
}

/* Estilos para modo claro */
@media (prefers-color-scheme: light) {
    .sombra_movil:before {
        background: radial-gradient(ellipse, rgba(0,0,0,0.5) 0%, rgba(0,0,0,0) 80%);
    }
}

/* Estilos para modo oscuro */
@media (prefers-color-scheme: dark) {
    .sombra_movil:before {
        background: radial-gradient(ellipse, rgba(255,255,255,0.5) 0%, rgba(255,255,255,0) 80%);
    }
}
</style>

```
**Resultado:**
<div class="sombra_movil">
    <p>Sombra Móvil</p>
</div>

## Efectos 3D en CSS
### Giro en el Eje X
Este efecto gira un elemento alrededor de su eje X al pasar el ratón por encima.

```html
<div class="giroX">
    <p>Giro X</p>
</div>

<style>
.giroX {
  font-family: Arial;
  background-color: #a8cf45;
  margin: 15px 2px;
  padding: 5px 40px;
  text-align: center;
  font-weight: bold;
  width: 40%;
  display: inline-block;
  vertical-align: middle;
  animation: giroX 1.5s 1;
  backface-visibility: visible;
}

.giroX:hover {
  animation: 3s giros infinite; /* Ajuste de la duración de la animación */
  backface-visibility: visible;
}

@keyframes giroX {
  0% { opacity: 0.5; transform: perspective(200px) rotateX(0deg); }
  25% { transform: perspective(200px) rotateX(30deg); } 
  50% { transform: perspective(200px) rotateX(-20deg); } 
  75% { transform: perspective(200px) rotateX(10deg); } 
  100% { opacity: 1; transform: perspective(200px) rotateX(0deg); } 
}
</style>
```
**Resultado:**
<div class="giroX">
    <p>Giro X</p>
</div>

### Efecto Cubo 3D
Este ejemplo crea un cubo que rota en 3D.

```html
<div class="box3D">
    <div class="front"></div>
    <div class="back"></div>
</div>

<style>
.box3D {
    display: inline-block;
    margin: 50px;
    width: 200px;
    height: 200px;
    position: relative;
    transition-duration: 0.5s;
    transform-style: preserve-3d;
    transform-origin: left center;
}

.box3D > div {
    border: 2px solid black;
    position: absolute;
    width: 100%;
    height: 100%;
}

.front {
    background: green;
}

.back {  
    background: red;
    transform: translateZ(-100px) rotateY(90deg);
    left: 100px;
}

.box3D:hover {
    transform: perspective(800px) rotateY(-80deg);
}
</style>
```
**Resultado:**
<div class="box3D">
    <div class="front"></div>
    <div class="back"></div>
</div>
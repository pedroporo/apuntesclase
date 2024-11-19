---
sidebar_label: 'jQuery'
sidebar_position: 2
---
# jQuery

## Tabla de Contenidos
- [Introducción](#introducción)
- [Instalación](#instalación)
- [Principales Funcionalidades de jQuery](#principales-funcionalidades-de-jquery)
- [Usar jQuery: Selectores y Eventos](#usar-jquery-selectores-y-eventos)
- [Efectos y Animaciones en jQuery](#efectos-y-animaciones-en-jquery)
- [Ejemplo Completo](#ejemplo-completo)

---
## Introducción
jQuery es una librería de JavaScript creada en 2006 por John Resig. Su objetivo es simplificar la escritura de JavaScript, permitiendo realizar tareas comunes con menos código. jQuery es compatible con navegadores antiguos y se utiliza ampliamente para manejar eventos, manipular el DOM, y agregar animaciones y efectos.

- **Sitio oficial**: [jQuery.com](https://jquery.com/)
- **Documentación**: [jQuery Docs](http://docs.jquery.com/)

---
## Instalación
Puedes incluir jQuery en tu proyecto de dos maneras:

### Usando un CDN:
```html
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
```
### Descargándolo y usándolo localmente:
```html
<script src="ruta_a_jquery/jquery-3.4.1.min.js"></script>`
```

---
## Principales Funcionalidades de jQuery
- **Compatibilidad**: Funciona bien en múltiples navegadores, incluidos los antiguos.
- **Manipulación del DOM**: Permite seleccionar, alterar y mover elementos HTML con facilidad.
- **Animaciones**: Agrega transiciones y efectos visuales.
- **Eventos**: Responde fácilmente a interacciones del usuario.
- **Ajax**: Simplifica las peticiones HTTP.

---
## Usar jQuery: Selectores y Eventos
jQuery usa el símbolo `$` para seleccionar elementos y ejecutar acciones sobre ellos. Por ejemplo:

```javascript
// Ocultar un párrafo
$("p").hide();

// Mostrar un elemento con ID
$("#miElemento").show();
```
### Eventos
El evento más común es `$(document).ready()`, que se ejecuta cuando la página ha terminado de cargarse:

```javascript
$(document).ready(function() {
  console.log("Página cargada completamente");
});
```

También se pueden manejar eventos como `click`, `hover`, `focus`, entre otros:

```javascript
$("button").click(function() {
  alert("¡Botón clicado!");
});
```

### Selectores en jQuery
Los selectores permiten seleccionar elementos del DOM de manera rápida y sencilla:

- **De etiqueta**: `$("p")` selecciona todos los párrafos.
- **De ID**: `$("#miID")` selecciona el elemento con ese ID.
- **De clase**: `$(".miClase")` selecciona todos los elementos con esa clase.

#### Ejemplo:
```javascript
$("h1").css("color", "red");  // Cambia el color del texto de todos los <h1>
$("#boton").hide();            // Oculta el elemento con id="boton"
$(".importante").show();       // Muestra todos los elementos con clase "importante"
```

### Filtros y Combinaciones de Selectores
Puedes refinar las selecciones con filtros como `:first`, `:last`, `:even`, o combinarlos:

```javascript
Copiar código
$("ul > li:first").css("background-color", "yellow");  // Primer <li> dentro de una <ul>
$("p:even").css("color", "blue");                      // Cambia el color de los párrafos pares
```
---
## Efectos y Animaciones en jQuery
jQuery facilita la creación de animaciones y transiciones en la web:

- `hide()` / `show()`: Ocultar o mostrar elementos.
- `fadeIn()` / `fadeOut()`: Fundir entrada o salida de elementos.
- `slideUp()` / `slideDown()`: Deslizar elementos hacia arriba o abajo.

```javascript
$("div").fadeOut("slow");
$("#miElemento").slideDown(500);
```
---
## Ejemplo Completo:
```html
<!DOCTYPE html>
<html>
<head>
  <title>Ejemplo jQuery</title>
  <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
  <script>
    $(document).ready(function() {
      $("#boton").click(function() {
        $("p").toggle();  // Alterna entre mostrar y ocultar todos los <p>
      });
    });
  </script>
</head>
<body>
  <button id="boton">Mostrar/Ocultar párrafos</button>
  <p>Este es el párrafo 1.</p>
  <p>Este es el párrafo 2.</p>
</body>
</html>
```
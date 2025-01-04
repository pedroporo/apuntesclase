---
sidebar_label: 'Maquetación web'
sidebar_position: 1
---
# Maquetación web

## Tabla de Contenidos
- [Introducción](#introducción)
- [HTML5](#html5)
- [CSS: Hojas de Estilo en Cascada](#css-hojas-de-estilo-en-cascada)
- [CSS: Aplicando Estilo](#css-aplicando-estilo)
---

## Introducción

La maquetación web se refiere a la distribución de los elementos que componen una página web dentro del espacio disponible. En otras palabras, maquetar es organizar y posicionar las distintas partes de una página web dentro de sus límites. Esta idea está estrechamente relacionada con conceptos como el diseño y la estructura de la página, así como con el uso de tecnologías como HTML y CSS.

---
## HTML5

### Estructura General de un Documento HTML5

```html
<!DOCTYPE html> <!-- Indica el tipo de documento -->
<html lang="es"> <!-- Delimita el documento -->
  <head>
    <meta charset="utf-8"> <!-- Juego de caracteres -->
    <title>Plantilla HTML5</title> <!-- Título que aparece en la pestaña -->
    <meta name="description" content="HTML5"> <!-- Metadatos de la página -->
    <meta name="author" content="Autor de la autoria"> <!-- Autor de la página -->
    <link rel="stylesheet" href="css/estilos.css"> <!-- Hojas de estilo externas -->
  </head>
  <body>
    <script src="js/scripts.js"></script> <!-- Incluye código JavaScript -->
  </body>
</html>
```

### Nuevas Etiquetas de Estructuración en HTML5
- `<header>`: Sección de encabezado.
- `<nav>`: Área de navegación, generalmente para menús.
- `<main>`: Contenido principal de la página.
- `<section>`: Sección de contenido relacionada.
- `<article>`: Contenido independiente, como un artículo.
- `<aside>`: Contenido adicional o complementario, como barras laterales.
- `<footer>`: Sección de pie de página.

### Otras Etiquetas Organizativas
- `<div>`: Contenedor genérico, utilizado si no hay una etiqueta específica.
- `<a href=""></a>`: Enlaces con atributos `href` (URL) y `target`.
- `<ul>`: Lista no ordenada.
- `<ol>`: Lista ordenada.
- `<li>`: Elemento de lista.
- `<dl>`: Lista de descripción.
- `<dt>`: Término de la lista de descripción.
- `<dd>`: Descripción del término.

### Atributos Importantes
- `class`: Define una clase CSS para un elemento.
- `id`: Define un identificador único para un elemento.
- `href`: Especifica la URL en un enlace.
- `target`: Establece cómo se abrirá el enlace (e.g., `_blank` para nueva pestaña).

### Ejemplo de Menú de Navegación
```html
<nav>
  <ul>
    <li><a href="">Opción 1</a></li>
    <li><a href="">Opción 2</a></li>
    <li><a href="">Opción 3</a></li>
  </ul>
</nav>
```

### Errores Comunes en HTML5
Usar una etiqueta incorrecta para el menú (distinta de `<nav>`).
Incluir más de un menú dentro de la misma etiqueta `<nav>`.
Colocar el título de la página dentro de un banner de imagen.
Ubicar los enlaces `<a>` fuera de los elementos `<li>` en una lista.

### Tablas en HTML
```html
<table>
  <caption>Descripción de la tabla</caption>
  <thead>
    <tr><th>Encabezado 1</th><th>Encabezado 2</th></tr>
  </thead>
  <tbody>
    <tr><td>Celda 1</td><td>Celda 2</td></tr>
  </tbody>
</table>
```
### Atributos Importantes de las Tablas:
- `colspan`: Combina columnas.
- `rowspan`: Combina filas.
- `border`: Define el borde de la tabla (mejor usar CSS para este propósito).

---
## CSS: Hojas de Estilo en Cascada
### Formas de Uso
- **En línea**: Añadir estilo directamente a la etiqueta usando el atributo `style`. **No recomendado**.
- **Incrustados o Internos**: Añadir un bloque de estilo en la cabecera entre las etiquetas `<style>`. **No recomendado**.
- **Externos**: Usar archivos `.css` enlazados con la etiqueta `<link>`. **Forma recomendada**.

### Tipos de Elementos CSS
- **Elementos de bloque**: Generan saltos de línea antes y después. Ejemplos: `<p>`, `<h1>`, `<div>`.
- **Elementos en línea**: Solo pasan de línea si no hay espacio. Ejemplos: `<a>`, `<span>`.

### Modelo de Cajas en CSS
Cada elemento HTML genera una caja rectangular que consiste en:

1. **Contenido** (`width`, `height`)
2. **Relleno** (`padding`)
3. **Borde** (`border`)
4. **Margen** (`margin`)


### Características del Modelo de Cajas
- Los bordes, márgenes y relleno son opcionales.
- Los márgenes siempre son transparentes.
- El tamaño del elemento depende del contenido, pero el relleno, borde y margen se suman al tamaño total.

### Selectores en CSS
- **Selectores de elementos**: Se aplican a un tipo específico de elemento.
```css
h1 {
  color: red;
}
```
- **Selectores universales**: Se aplica a todos los elementos.
```css
* {
  margin: 0;
  padding: 0;
}
```

### Selectores Contextuales
- **Descendiente**: Afecta a los elementos dentro de otro.
```css
ul li em {
  color: blue;
}
```
- **Hijo directo**: Afecta a los hijos directos de un elemento 
```css
p > em {
  color: green;
}
```
- **Adyacente**: Afecta al elemento que sigue inmediatamente después del indicado.
```css
h1 + p {
  margin-top: 10px;
}
```
- **Hermano**: Generaliza el selector adyacente para aplicar a todos los elementos hermanos que siguen en el código.
```css
h1 ~ p {
  color: gray;
}
```

### Selectores de ID y Clases
- **ID**: Se aplica a un elemento único con un ID específico.
css.
```css
#nombreId {
  background-color: yellow;
}
```
- **Clases**: Se aplican a grupos de elementos con una clase común.
```css
.nombreClase {
  font-weight: bold;
}
```
### Selectores de Combinaciones en CSS

Los selectores de combinaciones permiten aplicar estilos basados en la relación entre elementos:

- **.clase1 .clase2**  
Se aplica a los elementos con `clase2` que están dentro de un elemento con `clase1`.
```css
.contenedor .elemento {
    color: blue;
    }
```
- **Elemento1.clase1 Elemento2.clase2**
Se seleccionan los elementos `Elemento2` con la clase `clase2` que están dentro de un `Elemento1` con la clase `clase1`.
```css
div.contenedor p.texto {
  margin: 10px;
}
```
- **Combinación compleja**
Puedes combinar selectores más avanzados para seleccionar elementos específicos en una jerarquía.
```css
ul#menuPrincipal li.destacado a#inicio {
  font-weight: bold;
}
```
En este caso, se selecciona el enlace con `id="inicio"` dentro de un `<li>` con la clase `destacado`, que a su vez está dentro de una lista desordenada (`<ul>`) con `id="menuPrincipal"`.

### Selectores de Atributos en CSS
Los selectores de atributos permiten aplicar estilos a los elementos basados en los atributos que tienen:

- **[atributo]**
Selecciona los elementos que contienen un atributo específico, sin importar el valor.
```css
a[target] {
  color: red;
}
```
- **[atributo="valor"]**
Selecciona los elementos que tienen un atributo con un valor específico.
```css
input[type="text"] {
  border: 1px solid #ccc;
}
```
- **[atributo~="valor"]**
Selecciona los elementos que tienen el atributo con al menos uno de los valores igual al especificado (útil cuando los atributos contienen múltiples valores separados por espacios).
```css
img[alt~="logo"] {
  width: 100px;
}
```
- **[atributo^="valor"]**
Selecciona los elementos cuyo atributo comienza con un valor específico.
```css
a[href^="https://"] {
  color: green;
}
```
- **[atributo$="valor"]**
Selecciona los elementos cuyo atributo termina con un valor específico.
```css
a[href$=".pdf"] {
  text-decoration: underline;
}
```
- **[atributo="valor"]***
Selecciona los elementos cuyo atributo contiene una cadena específica.
```css
p[class*="warning"] {
  background-color: yellow;
}
```

### Pseudoclases en CSS
Las pseudoclases definen estados específicos de los elementos, como:

- `:link`: Elemento que no ha sido visitado.
- `:visited`: Elemento que ya ha sido visitado.
- `:hover`: Cuando el ratón pasa sobre el elemento.
- `:focus`: Cuando el elemento obtiene el foco.

### Pseudoelementos en CSS
Se utilizan para definir partes específicas de un elemento, como:

- `::before`: Antes del contenido del elemento.
- `::after`: Después del contenido d el elemento.
- `::first-line`: Primera línea del contenido.
- `::first-letter`: Primera letra del contenido.

```css
p::first-line {
  font-weight: bold;
}
```

---
## CSS: Aplicando Estilo
### Tamaño

- **Propiedades de tamaño**:
  - `height` y `width`: Definen la altura y anchura del contenido, respectivamente. Pueden especificarse en píxeles, porcentajes, etc.
  - `max-height`, `max-width`, `min-height`, `min-width`: Permiten definir los tamaños máximos y mínimos de un elemento.

### Padding y Margin

- **Padding**: Espacio entre el contenido y el borde del elemento.
  - Los valores se definen en el orden: superior, derecha, inferior, izquierda (siguiendo el sentido de las agujas del reloj).
  - Si se omiten algunos valores, se asumen los valores de sus opuestos.
  - El padding se suma a las dimensiones (`height` y `width`) del contenido.

- **Margin**: Espacio entre el borde del elemento y otros elementos.
  - Los márgenes superiores e inferiores de dos elementos adyacentes se "colapsan", utilizando el valor mayor entre ambos.
  - Los márgenes también se pueden especificar en píxeles, porcentajes, etc.

### Borde

- El borde es la línea que separa el padding del margin.
- **Propiedades del borde**:
  - Se pueden definir conjuntamente: grosor, estilo y color.
  - **Estilos del borde**:
    - `dotted`: Borde punteado.
    - `dashed`: Borde discontinuo.
    - `solid`: Borde sólido.
    - `double`: Borde doble.
    - `groove`: Borde 3D con apariencia cóncava.
    - `ridge`: Borde 3D con apariencia convexa.
    - `inset`: Borde 3D hundido.
    - `outset`: Borde 3D emergente.
    - `none`: Sin borde.
    - `hidden`: Borde oculto.
  - `border-radius`: Permite crear bordes redondeados.
  - `border-top`, `border-bottom`, `border-left`, `border-right`: Permiten definir bordes específicos para cada lado.

### Display

- Define cómo un elemento se comporta en relación con otros elementos.
  - **Opciones de `display`**:
    - `block`: El elemento se comporta como un bloque.
    - `inline`: El elemento se comporta como un elemento en línea.
    - `none`: El elemento no se muestra y su espacio puede ser ocupado por otros elementos.

### Visibility

- Controla la visibilidad del elemento sin alterar su espacio en la página.
  - **Opciones de `visibility`**:
    - `hidden`: Oculta el elemento, pero el espacio que ocupa permanece visible.
    - `collapse`: Similar a `hidden`, pero se aplica principalmente a filas y columnas de tablas.

### Opacity

- Controla la opacidad del elemento.
  - Los valores van desde `0` (totalmente transparente) hasta `1` (totalmente opaco).

### Position

- Controla la ubicación de un elemento en la página.
  - **Valores de `position`**:
    - `static`: Posición por defecto, desde la esquina superior izquierda del elemento padre.
    - `relative`: Posiciona el elemento relativo a su posición original.
    - `absolute`: Posiciona el elemento relativo al elemento padre más cercano con `position: relative`.
    - `fixed`: El elemento se mantiene fijo en la ventana, independientemente del scroll.

### Overflow

- Controla cómo se muestran los contenidos que sobresalen del elemento padre.
  - **Valores de `overflow`**:
    - `visible`: El contenido sobresaliente es visible.
    - `hidden`: El contenido sobresaliente se oculta.
    - `scroll`: Añade barras de desplazamiento para el contenido sobresaliente.
    - `auto`: Depende del navegador, generalmente es similar a `scroll`.

### Z-index

- Define la posición del elemento en el eje Z (profundidad).
  - Los valores positivos acercan el elemento al usuario; los negativos lo alejan.
  - El elemento debe tener `position: relative` o `position: absolute` para que `z-index` funcione.

### Float

- Permite que los elementos floten a la izquierda o derecha, afectando el flujo de los elementos que los rodean.
  - Los elementos flotantes no siguen el flujo normal del documento.
  - Se utiliza para crear diseños multicolumna, barras de navegación, etc.
  - **Valores de `float`**:
    - `none`: No flota.
    - `left`: Flota a la izquierda.
    - `right`: Flota a la derecha.
    - `inherit`: Hereda el valor del elemento padre.

### Clear

- Limpia el área al lado del elemento flotante para que el siguiente elemento se coloque en su posición normal dentro del bloque contenedor.
  - **Valores de `clear`**:
    - `none`
    - `left`
    - `right`
    - `both`
    - `inherit`

### Relación entre Display, Float y Position

Cuando se configuran estas tres propiedades en un mismo elemento, CSS lo interpreta de la siguiente manera:

1. Si `display` es `none`, se ignoran `float` y `position`, y el elemento no se muestra.
2. Si `position` es `absolute` o `fixed`, el elemento se posiciona de forma absoluta, se ignora `float`, y `display` se establece en `block`.
3. En cualquier otro caso, si `float` tiene un valor distinto de `none`, el elemento se comporta como un bloque flotante.

### Tablas

- `caption-side`: Indica dónde se coloca el título de la tabla.
- `empty-cells`: Controla la visualización de celdas vacías. Valores: `show`, `hide`, `inherit`.
- `border-collapse`: Define cómo se dibujan los bordes de las celdas. Valores: `separate`, `collapse`, `inherit`.
- `border-spacing`: Establece la separación horizontal y vertical entre celdas contiguas.
- `table-layout`: Define cómo el navegador dibuja la tabla. Valores: `fixed` (basado en el código fuente), `auto` (basado en el contenido).

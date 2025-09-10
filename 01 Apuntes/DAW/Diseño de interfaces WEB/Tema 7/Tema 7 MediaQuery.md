---
sidebar_label: 'MediaQuery'
sidebar_position: 1
---
# MediaQuery
## Tabla de Contenidos
- [Diseño Responsive y Mobile First](#diseño-responsive-y-mobile-first)
- [Media Queries](#media-queries)
- [Ejemplos detallados](#ejemplos-detallados)
- [Rango de dispositivos comunes y breakpoints recomendado](#rango-de-dispositivos-comunes-y-breakpoints-recomendados)

---

## Diseño Responsive y Mobile First
### ¿Qué es Mobile First?
Mobile First es una filosofía de diseño que prioriza los dispositivos móviles. Esto significa que las páginas web deben diseñarse primero para pantallas pequeñas, como teléfonos, y luego adaptarse a pantallas más grandes.

Frameworks como **Bootstrap** están diseñados pensando en esta filosofía.

### ¿Qué es Responsive Design?
El **Responsive Design** o diseño adaptable es una técnica que permite que una página web se ajuste automáticamente al tamaño del dispositivo en el que se visualiza. Esto se logra gracias al uso de media queries en las hojas de estilo.

### La etiqueta Meta Viewport
La etiqueta `<meta name="viewport">` es esencial para permitir que las páginas web se ajusten correctamente en dispositivos móviles.

#### Ejemplo:

```html
<meta name="viewport" content="width=device-width, initial-scale=1">
```

### Medidas Responsivas
En diseño adaptable, se utilizan principalmente **medidas relativas** como `%`, `em`, `rem`, `vw`, y `vh` para que los elementos se ajusten a diferentes tamaños de pantalla.

### Imágenes Responsive
Las imágenes pueden hacerse responsivas usando `max-width: 100%` y `height: auto`, lo que asegura que se adapten al tamaño del contenedor sin perder proporción.

#### Ejemplo:

```css
img {
  max-width: 100%;
  height: auto;
}
```

### Flexbox
**Flexbox** es un modelo de diseño que permite organizar elementos en contenedores flexibles, adaptándose a diferentes tamaños de pantalla.

**Propiedades del contenedor**:

- `flex-direction`: Define la dirección de los elementos.
- `justify-content`: Alinea los elementos en el eje principal.
- `align-items`: Alinea los elementos en el eje transversal.

#### Ejemplo con Flexbox:
```css
.contenedor {
  display: flex;
  flex-direction: row;
  justify-content: center;
  align-items: center;
}
```

---
## Media Queries
Las **media queries** son una característica clave de CSS que permite aplicar reglas de estilo según las características del dispositivo en el que se visualiza una página web. Esto hace posible que una página se adapte automáticamente a diferentes tamaños de pantalla y resoluciones, lo que es fundamental para un **diseño responsive**.

### Sintaxis básica de las media queries
La sintaxis de una media query es sencilla. Se puede utilizar con el selector `@media` seguido de una o más condiciones que determinan cuándo se deben aplicar ciertos estilos.

```css
@media (condición) {
  /* Estilos CSS aquí */
}
```

#### Ejemplo básico: cambiar el color de fondo según el ancho de la pantalla
```css
/* Para pantallas de 600px o más */
@media (min-width: 600px) {
  body {
    background-color: lightblue;
  }
}

/* Para pantallas menores de 600px */
@media (max-width: 599px) {
  body {
    background-color: lightpink;
  }
}
```

#### En este ejemplo:
- Si la pantalla tiene un ancho de 600 píxeles o más, el color de fondo será azul claro.
- Si la pantalla tiene menos de 600 píxeles de ancho, el color de fondo será rosa claro.

### Tipos de media queries
Las **media queries** se pueden aplicar en función de varias propiedades del dispositivo, como el tamaño de la pantalla, la orientación, la resolución, y más.

#### Propiedades más comunes en media queries:
- `width`y `height`: Ancho y alto del viewport.
- `min-width` y `max-width`: Especifican un rango mínimo o máximo de ancho.
- `orientation`: Detecta la orientación de la pantalla, ya sea `landscape` (apaisado) o `portrait` (vertical).
- `resolution`: Para controlar la resolución del dispositivo, medida en **dpi** (dots per inch).
- `aspect-ratio`: Detecta la relación de aspecto del dispositivo (ancho/alto).

---
## Ejemplos detallados
### Ejemplo 1: Usar media queries para cambiar el diseño en diferentes tamaños de pantalla
```css
/* Para dispositivos con un ancho mínimo de 768px (tablets) */
@media (min-width: 768px) {
  .contenedor {
    width: 750px;
    margin: 0 auto;
  }
}

/* Para dispositivos con un ancho máximo de 767px (móviles) */
@media (max-width: 767px) {
  .contenedor {
    width: 100%;
    padding: 0 10px;
  }
}
```

#### En este caso:

- En pantallas más grandes (como tablets), el contenedor tiene un ancho fijo de 750 píxeles.
- En pantallas pequeñas (móviles), el contenedor ocupa el 100% del ancho de la pantalla con un pequeño padding para evitar que el contenido toque los bordes.

### Ejemplo 2: Adaptar fuentes según el tamaño de la pantalla
```css
/* Aumentar el tamaño de la fuente en pantallas grandes */
@media (min-width: 1024px) {
  h1 {
    font-size: 3em;
  }
}

/* Reducir el tamaño de la fuente en pantallas pequeñas */
@media (max-width: 767px) {
  h1 {
    font-size: 1.5em;
  }
}
```

#### En este caso:
Este ejemplo adapta el tamaño del encabezado `<h1>` según el ancho de la pantalla:

- En pantallas grandes, el tamaño del texto será mayor para mejorar la legibilidad.
- En pantallas pequeñas, el texto se reduce para que no ocupe demasiado espacio.

### Ejemplo 3: Cambiar el diseño en función de la orientación del dispositivo
```css
/* Si el dispositivo está en modo apaisado (horizontal) */
@media (orientation: landscape) {
  .imagen {
    width: 70%;
    height: auto;
  }
}

/* Si el dispositivo está en modo vertical (portrait) */
@media (orientation: portrait) {
  .imagen {
    width: 100%;
    height: auto;
  }
}
```

#### En este caso:
El ancho de una imagen cambia según la orientación del dispositivo:

- En modo apaisado (`landscape`), la imagen ocupa el 70% del ancho del contenedor.
- En modo vertical (`portrait`), la imagen ocupa el 100%.

### Ejemplo 4: Usar media queries combinadas con lógicas como `and`, `or` y `not`
- `and`: Aplica varias condiciones a la vez.
- `or`: Aplica la media query si cualquiera de las condiciones - `es verdadera.
- `not`: Niega una condición.

```css
/* Aplicar estilos a pantallas de al menos 768px de ancho y con orientación vertical */
@media (min-width: 768px) and (orientation: portrait) {
  .contenedor {
    background-color: lightgreen;
  }
}

/* Aplicar estilos a pantallas menores de 600px o a dispositivos en modo apaisado */
@media (max-width: 600px), (orientation: landscape) {
  .contenedor {
    background-color: lightcoral;
  }
}
```

#### En este caso:
- Si la pantalla tiene un ancho mínimo de 768 píxeles **y** está en orientación vertical, el fondo del contenedor será verde claro.
- Si la pantalla es menor de 600 píxeles **o** está en modo apaisado, el fondo será coral claro.

### Ejemplo 5: Ajustar el layout con media queries y flexbox
```css
/* Para pantallas grandes */
@media (min-width: 1024px) {
  .contenedor {
    display: flex;
    flex-direction: row;
    justify-content: space-between;
  }

  .elemento {
    width: 30%;
  }
}

/* Para pantallas pequeñas */
@media (max-width: 1023px) {
  .contenedor {
    display: block;
  }

  .elemento {
    width: 100%;
    margin-bottom: 20px;
  }
}
```

#### En este caso:
Aquí, utilizamos **flexbox** para organizar los elementos:

- En pantallas grandes, los elementos `.elemento` se disponen en fila (`row`) con un ancho del 30% cada uno y espacio entre ellos.
- En pantallas pequeñas, los elementos ocupan el 100% del ancho y se apilan uno debajo del otro.

---
## Rango de dispositivos comunes y breakpoints recomendados
Aunque las resoluciones de los dispositivos cambian con el tiempo, los siguientes son rangos de ancho de pantalla comunes para usar en media queries:

- **Móviles pequeños**: `< 576px`
- **Móviles**: `576px - 768px`
- **Tablets**: `768px - 992px`
- **Laptops**: `992px - 1200px`
- **Escritorios grandes**: `> 1200px`

Bootstrap, por ejemplo, sigue estos breakpoints en sus media queries predefinidas.

### Aplicar media queries directamente en los archivos CSS
Puedes usar media queries dentro de tus hojas de estilo para que las reglas CSS se apliquen automáticamente según el tamaño del dispositivo:

```css
/* Media query aplicada para pantallas de más de 1200px */
@media screen and (min-width: 1200px) {
  body {
    font-size: 18px;
  }
}
```
Esto permite personalizar las hojas de estilo sin necesidad de cargar archivos adicionales, optimizando el rendimiento.
---
sidebar_label: 'Bootstrap'
sidebar_position: 2
---
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"></link>
</head>


# Bootstrap
## Tabla de Contenidos
- [¿Qué es Bootstrap?](#qué-es-bootstrap)
- [Sistema de rejilla (Grid System)](#sistema-de-rejilla-grid-system)
- [Márgenes y Padding](#márgenes-y-padding)
- [Colores y Temas](#colores-y-temas)
- [Puesta en práctica de lo que hemos visto](#puesta-en-práctica-de-lo-que-hemos-visto)
- [Componentes adicionales](#componentes-adicionales)

---

## ¿Qué es Bootstrap?

Bootstrap es un **framework de código abierto** para el diseño de sitios y aplicaciones web. Contiene plantillas con tipografías, formularios, botones, cuadros, menús de navegación, entre otros elementos de diseño basados en **HTML** y **CSS**. Además, cuenta con extensiones opcionales en **JavaScript**.

### Características clave:
- **Modularidad**: Se basa en hojas de estilo que pueden ser reutilizadas.
- **SASS y Flexbox**: Usa el preprocesador SASS y el sistema de diseño Flexbox.
- **Sistema de rejilla**: Permite estructurar contenido con un sistema de 12 columnas.
- **Componentes reutilizables**: Botones, formularios, tarjetas, entre otros.
- **Plugins basados en jQuery**: Ofrece plugins preconstruidos para añadir funcionalidades interactivas.

### Cómo añadir Bootstrap a un proyecto

1. **Descargar** las hojas de estilo de Bootstrap o utilizar las versiones online.
2. **Referenciar** los archivos CSS y JS en el documento HTML.
3. **Utilizar las clases de Bootstrap** en el HTML para aplicar estilos predefinidos.

**Ejemplo básico** de una plantilla con Bootstrap:
```html
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap Demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  </head>
  <body>
    <h1>Hello, world!</h1>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  </body>
</html>
```
---
## Sistema de rejilla (Grid System)
Bootstrap organiza la página en un sistema de **12 columnas** que permite estructurar el contenido de manera adaptable. Para comenzar, puedes usar las clases `.container` y `.row`.

#### Ejemplo de rejilla básica:

```html
<div class="container">
  <div class="row">
    <div class="col-5">Columna 1</div>
    <div class="col-7">Columna 2</div>
  </div>
</div>
```
<div class="container">
  <div class="row">
    <div class="col-5 divbootstrap">Columna 1</div>
    <div class="col-7 divbootstrap">Columna 2</div>
  </div>
</div>

### Breakpoints y tamaños de pantalla:
Bootstrap se adapta a diferentes tamaños de dispositivos mediante breakpoints:

- **xs**:`< 576px` (Móviles)
- **sm**:`>= 576px` (Tablets)
- **md**:`>= 768px` (Notebooks)
- **lg**:`>= 992px` (Ordenadores)
- **xl**:`>= 1200px`
- **xxl**: `>= 1400px`

### Ejemplo con breakpoints:
```html
<div class="container-fluid">
  <div class="row">
    <div class="col-sm-6">Columna para Tablets</div>
    <div class="col-md-4">Columna para Notebooks</div>
    <div class="col-lg-2">Columna para Ordenadores</div>
  </div>
</div>
```
<div class="container-fluid">
  <div class="row">
    <div class="col-sm-6 divbootstrap">Columna para Tablets</div>
    <div class="col-md-4 divbootstrap">Columna para Notebooks</div>
    <div class="col-lg-2 divbootstrap">Columna para Ordenadores</div>
  </div>
</div>

### Espacios en blanco (Offset)
El **offset** en Bootstrap se utiliza para crear espacio en blanco a la izquierda de una columna, desplazando el contenido hacia la derecha. Es útil cuando deseas centrar o alinear columnas sin añadir márgenes manuales. Las clases de offset siguen la misma nomenclatura que las columnas, por ejemplo, `offset-sm-*`, `offset-md-*`, `offset-lg-*`, donde el `*` representa el número de columnas a desplazar.

#### Ejemplo básico de offset

```html
<div class="container">
  <div class="row">
    <!-- Columna con un desplazamiento de 2 columnas en pantallas grandes -->
    <div class="col-lg-4 offset-lg-2">
      <div class="p-3 bg-primary text-white">Columna desplazada</div>
    </div>
    <!-- Columna normal -->
    <div class="col-lg-4">
      <div class="p-3 bg-secondary text-white">Columna normal</div>
    </div>
  </div>
</div>
```
<div class="container">
  <div class="row">
    <!-- Columna con un desplazamiento de 2 columnas en pantallas grandes -->
    <div class="col-lg-4 offset-lg-2">
      <div class="p-3 bg-primary text-white">Columna desplazada</div>
    </div>
    <!-- Columna normal -->
    <div class="col-lg-4">
      <div class="p-3 bg-secondary text-white">Columna normal</div>
    </div>
  </div>
</div>

---
## Márgenes y Padding
Bootstrap facilita la gestión de márgenes y paddings a través de clases como `m-`, `p-` seguidas de los valores para el tamaño (`0-5` o `auto`).

#### Ejemplo de centrado con márgenes automáticos:
```html
<div class="col-5 mx-auto p-3 bg-warning">
  Contenido centrado
</div>
```
<div class="col-5 mx-auto p-3 bg-warning divbootstrap">
  Contenido centrado
</div>

---
## Colores y Temas
Bootstrap permite aplicar colores predefinidos a los elementos mediante clases como `bg-*`, `text-*`, `btn-*`, `btn-outline-*`, etc. Algunos ejemplos de colores son: `primary`, `secondary`, `success`, `danger`, `warning`, `info`, `light`, `dark`.


### Ejemplo 1: Cambiar el color de fondo y texto
```html
<div class="bg-primary text-white p-3">
  Este div tiene un fondo azul (primary) y texto blanco.
</div>
```
<div class="bg-primary text-white p-3 divbootstrap">
  Este div tiene un fondo azul (primary) y texto blanco.
</div>

### Ejemplo 2: Usar colores en botones y botones con contorno
```html
<button class="btn btn-success">Botón Éxito</button>
<button class="btn btn-danger">Botón Error</button>
<button class="btn btn-outline-info">Botón Info con borde</button>
```
<button class="btn btn-success divbootstrap">Botón Éxito</button>
<button class="btn btn-danger divbootstrap">Botón Error</button>
<button class="btn btn-outline-info divbootstrap">Botón Info con borde</button>

---
## Puesta en práctica de lo que hemos visto 
```html
<div class="container">
  <div class="row">
    <!-- Columna principal que ocupa 8 columnas en pantallas grandes y 12 en móviles -->
    <div class="col-lg-8 col-12">
      <div class="p-3 bg-info">Columna principal</div>
    </div>
    
    <!-- Columna secundaria que ocupa 4 columnas en pantallas grandes y 12 en móviles -->
    <div class="col-lg-4 col-12">
      <div class="p-3 bg-warning">Columna secundaria</div>
    </div>
  </div>

  <div class="row mt-3">
    <!-- Columna con un desplazamiento de 2 columnas a la izquierda en pantallas grandes -->
    <div class="col-lg-6 offset-lg-2 col-12">
      <div class="p-3 bg-success">Columna con desplazamiento</div>
    </div>
    
    <!-- Columna alineada al centro en todas las pantallas -->
    <div class="col-lg-4 col-12 mx-auto">
      <div class="p-3 bg-danger">Columna centrada</div>
    </div>
  </div>
</div>
```
<div class="container">
  <div class="row">
    <!-- Columna principal que ocupa 8 columnas en pantallas grandes y 12 en móviles -->
    <div class="col-lg-8 col-12">
      <div class="p-3 bg-info">Columna principal</div>
    </div>
    
    <!-- Columna secundaria que ocupa 4 columnas en pantallas grandes y 12 en móviles -->
    <div class="col-lg-4 col-12">
      <div class="p-3 bg-warning">Columna secundaria</div>
    </div>
  </div>

  <div class="row mt-3">
    <!-- Columna con un desplazamiento de 2 columnas a la izquierda en pantallas grandes -->
    <div class="col-lg-6 offset-lg-2 col-12">
      <div class="p-3 bg-success">Columna con desplazamiento</div>
    </div>
    
    <!-- Columna alineada al centro en todas las pantallas -->
    <div class="col-lg-4 col-12 mx-auto">
      <div class="p-3 bg-danger">Columna centrada</div>
    </div>
  </div>
</div>

---
## Componentes adicionales
Bootstrap incluye varios componentes para mejorar la experiencia de usuario, como:

- **Badges**: Insignias que muestran contadores.
- **Cards**: Tarjetas para agrupar contenido.
- **Carousel**: Carruseles de imágenes.
- **Collapse**: Contenido que puede expandirse o contraerse.
- **Popovers y Tooltips**: Indicaciones emergentes para elementos interactivos.

#### Ejemplo de una insignia (Badge):

```html
<button type="button" class="btn btn-primary position-relative">
  Inbox
  <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
    99+
    <span class="visually-hidden">unread messages</span>
  </span>
</button>
```
<button type="button" class="btn btn-primary position-relative">
  Inbox
  <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
    99+
    <span class="visually-hidden">unread messages</span>
  </span>
</button>

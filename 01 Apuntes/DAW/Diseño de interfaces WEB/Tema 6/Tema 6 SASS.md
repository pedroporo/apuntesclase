---
sidebar_label: 'Procesador de CSS: SASS'
sidebar_position: 3
---
# Procesador de CSS: SASS

## Tabla de Contenidos
- [¿Qué es SASS?](#qué-es-sass)
- [Usando SASS](#usando-sass)
- [Elementos básicos de SASS](#elementos-básicos-de-sass)
- [Operaciones matemáticas](#operaciones-matemáticas)
- [Estructuras de control](#estructuras-de-control)
- [Mixins](#mixins)
- [Directivas importantes](#directivas-importantes)
- [Media Queries en SASS](#media-queries-en-sass)

---

## ¿Qué es SASS?

SASS (Syntactically Awesome Stylesheets) es un preprocesador de código CSS que permite escribir estilos de manera más eficiente y organizada. A través de SASS, podemos crear scripts que luego se convierten en CSS estándar, facilitando el desarrollo de sitios web. Algunas de las ventajas clave de SASS incluyen:

- Organización modular de archivos.
- Uso de lógica en los estilos (condicionales).
- Variables y reglas anidadas.
- Reutilización de código mediante mixins.
- Funciones para manipular colores, valores numéricos y cadenas.
- Compatibilidad total con CSS.
- Soporte para cálculos matemáticos con módulos específicos.

**Nota:** SASS ya no se desarrolla en Ruby, ahora se usa Dart.

## Instalación de SASS

Existen dos formas principales de instalar SASS:

1. **Desde el repositorio en GitHub**: [SASS Releases](https://github.com/sass/dart-sass/releases)
2. **Desde un gestor de paquetes**:
   - **npm** (NodeJS): `npm install -g sass`
   - **Chocolatery** (Windows): `choco install sass`
   - **Homebrew** (Mac): `brew install sass/sass/sass`

Para verificar la instalación:  
```bash
sass --version
```

### Sintaxis
SASS se puede escribir en dos sintaxis distintas:

- **SCSS**: Similar a la sintaxis de CSS (usa llaves {} y punto y coma ;). Es compatible con cualquier archivo CSS3 y tiene la extensión .scss.
- **SASS**: Sintaxis propia que usa tabulaciones en lugar de llaves y elimina los puntos y comas. Más fácil de leer y escribir. Extensión .sass.

---
## Usando SASS
Hay varias formas de usar SASS:

- **Modo gráfico**: A través de herramientas como CodeKit, Ghostlab, etc.
- **Consola**: Utilizaremos la consola. Para compilar un archivo SASS en CSS:
```bash
sass archivo.scss archivo.css
```
### Tipos de compilación
- **Compilación simple**:
```bash
sass archivo.scss salida.css
```
- **Compilación múltiple**:
```bash
sass archivo1.scss:salida1.css archivo2.scss:salida2.css
```
- **Estilo expandido** (formato por defecto, 1 selector por línea):
```bash
sass --style=expanded archivo.scss salida.css
```
- **Estilo comprimido** (quita caracteres innecesarios para un archivo CSS más compacto):
```bash
sass --style=compressed archivo.scss salida.css
```
- **Vigilancia de cambios**:
```bash
sass --watch archivo.scss salida.css
```
### Tipos de archivos en SASS
- **Maestros**: Archivos que SASS usará para generar el CSS final.
- **Parciales**: Fragmentos de código que se importan con `@use` en un archivo maestro. Su nombre debe comenzar con `_` (ejemplo: `_archivo.scss`).

---
## Elementos básicos de SASS
### Variables
Las variables en SASS permiten reutilizar valores a lo largo del código. Su declaración es sencilla:

```css
$nombreVariable: valor;
```
**Tipos de variables**:
- **Booleanas**: `$visible: true;`
- **Numéricas**: `$line-height: 1.5;`
- **Colores**: `$color: #ffcc00;`
- **Strings**: `$font-family: "Arial";`
- **Listas**: `$margins: 10px 15px 20px 25px;`
- **Mapas**: `$mapa-colores: ("error": #f00, "aviso": #ff0);`

### Comentarios
SASS soporta dos tipos de comentarios:
- **De una línea**: `// Esto es un comentario`
- **Multilínea** (que se mantienen en la compilación):
```css
/* 
Esto es un comentario
en varias líneas
*/
```
### Anidamientos
SASS permite anidar reglas CSS para mantener el código más organizado y legible.

```css
nav {
  ul {
    li {
      a {
        text-decoration: none;
      }
    }
  }
}
```

### Interpolación
La interpolación permite insertar expresiones dentro de las reglas de CSS:

```css
$button-type: "primary";
.btn-#{$button-type} {
  color: blue;
}
```
---
## Operaciones matemáticas
SASS permite realizar operaciones matemáticas como sumar, restar, multiplicar, dividir y usar funciones como `round()`, `ceil()`, `floor()`, entre otras.
Para realizar cálculos, ahora se usa el módulo `sass:math` que debemos importar con `@use`al comienzo de nuestro archivo.

```css
// Ejemplo de operaciones matemáticas usando el módulo math
@use "sass:math";
$ancho: 100px;
.elemento {
  width: math.div($ancho, 2);
}
```
---
## Estructuras de control
SASS ofrece directivas de control como `@if`, `@else`, `@for`, `@while`, y `@each`, lo que añade elementos de programación al código CSS:

```css
$theme: light;
@if $theme == light {
  background-color: white;
} @else {
  background-color: black;
}
```
---
## Mixins
Los mixins permiten reutilizar bloques de código, y pueden aceptar parámetros. Son útiles para evitar duplicar código.

### Definición:
```css
@mixin spacing($margin, $padding) {
  margin: $margin;
  padding: $padding;
}
```
### Uso:
```css
.elemento {
  @include spacing(20px, 10px);
}
```

### Ejemplo de un mixin que gestiona prefijos específicos del navegador:
```css
@mixin border-radius($radius) {
  -webkit-border-radius: $radius;
  -moz-border-radius: $radius;
  border-radius: $radius;
}

.elemento {
  @include border-radius(10px);
}
```
--- 
## Directivas importantes
### `@use`

La directiva `@use` incluye el archivo con un prefijo predeterminado (generalmente el nombre del archivo), permitiendo controlar el acceso a variables y mixins de manera más clara.

```css
// Importar archivos
@use 'variables' as *;
@use 'mixins' as *;

```
### `@extend`
La directiva `@extend` se utiliza para compartir estilos entre diferentes selectores sin necesidad de duplicar código. Es útil para reutilizar estilos entre diferentes componentes.

```css
// Definir un bloque de estilos
.boton {
  padding: 10px;
  border-radius: 5px;
  color: white;
}

// Extender el estilo de .boton en otros componentes
.boton-primario {
  @extend .boton;
  background-color: blue;
}

.boton-secundario {
  @extend .boton;
  background-color: gray;
}
```

### `@mixin`
Los mixins permiten definir bloques de código reutilizables que pueden aceptar parámetros para personalizar su comportamiento. Se utilizan principalmente para gestionar propiedades con prefijos de navegador o para estilos reutilizables complejos.

```css
// Definir un mixin para centrado de elementos
@mixin centrado-vertical {
  display: flex;
  align-items: center;
  justify-content: center;
}

// Usar el mixin en un selector
.caja {
  @include centrado-vertical;
  height: 100px;
  background-color: lightgray;
}
```

### `@function`
Las funciones en SASS permiten realizar cálculos y devolver valores que se pueden reutilizar en el código. A diferencia de los mixins, una función devuelve un valor que se puede utilizar directamente dentro de una propiedad.

```css
// Definir una función para calcular el porcentaje de una columna
@use "sass:math";
@function ancho-columna($col, $total) {
  @return math.div($col,$total);
}

// Usar la función para definir el ancho de un contenedor
.contenedor {
  width: ancho-columna(3, 12); // Devuelve 25%
}
```

### `@error`, `@warn`, y `@debug`
Estas directivas son útiles para depurar el código durante la fase de desarrollo, permitiendo mostrar mensajes personalizados o información sobre el estado de las variables.

- `@error`: Muestra un error crítico que detiene la compilación.
- `@warn`: Muestra una advertencia sin detener la compilación.
- `@debug`: Imprime información sobre el estado de las variables durante la compilación.
```css
$valor: 15px;

// Usar @warn para advertencias
@if $valor < 10px {
  @warn "El valor es menor de lo esperado.";
}

// Usar @error para errores críticos
@if $valor == 0 {
  @error "El valor no puede ser cero.";
}

// Usar @debug para depuración
@debug "El valor actual es: #{$valor}";
```

---
## Media Queries en SASS
SASS permite incluir media queries dentro de las propias reglas, haciendo que el código sea más claro:

```css
.elemento {
  width: 100%;

  @media (min-width: 600px) {
    width: 50%;
  }
}
```

También es posible crear **mixins para media queries**:

```css
@mixin respond-to($media) {
  @if $media == tablet {
    @media (min-width: 768px) { @content; }
  }
}

.elemento {
  @include respond-to(tablet) {
    font-size: 1.5em;
  }
}
```
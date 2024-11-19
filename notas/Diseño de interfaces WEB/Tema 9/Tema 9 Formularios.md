---
sidebar_label: 'Formularios'
sidebar_position: 1
---
# Formularios

## Tabla de Contenidos
- [Introducción](#introducción)
- [Agrupación de Campos](#agrupación-de-campos)
- [Tipos de Campos `<input>`](#tipos-de-campos-input)
- [Nuevos Campos en HTML5](#nuevos-campos-en-html5)
- [Otros Elementos Importantes](#otros-elementos-importantes)

---
## Introducción
Los formularios son una parte esencial de la interacción en sitios web. Permiten a los usuarios enviar datos a un servidor, donde serán procesados para diferentes propósitos, como registrarse, iniciar sesión o realizar una búsqueda.

Un formulario se define entre las etiquetas `<form></form>`, y dentro de él se incluyen diferentes elementos de entrada de datos.

### Atributos de la etiqueta `<form>`
- **action**: Define la URL a la que se enviarán los datos del formulario. Si no se especifica, se envía a la misma página.
- **method**: Puede ser `GET` o `POST`. `GET` envía los datos en la URL, mientras que `POST` los envía en el cuerpo de la solicitud, siendo más seguro para datos sensibles.

#### Ejemplo:
```html
<form action="procesar.php" method="POST">
  <!-- Campos del formulario -->
</form>
```
---
## Agrupación de Campos
Para organizar los formularios, se puede usar la etiqueta `<fieldset>` para agrupar varios campos, añadiendo un título descriptivo con `<legend>`.

#### Ejemplo:
```html
<fieldset>
  <legend>Información Personal</legend>
  <label for="nombre">Nombre:</label>
  <input type="text" id="nombre" name="nombre">
</fieldset>
```
<fieldset>
  <legend>Información Personal</legend>
  <label for="nombre">Nombre:</label>
  <input type="text" id="nombre" name="nombre"></input>
</fieldset>

---
## Tipos de Campos `<input>`
La etiqueta `<input>` define diferentes tipos de entradas. Algunos ejemplos comunes incluyen:

- **text**: Entrada de texto.
- **password**: Texto oculto (generalmente para contraseñas).
- **submit**: Botón para enviar el formulario.
- **reset**: Botón para resetear los valores del formulario.
- **radio**: Botón de opción exclusiva (debe compartir el mismo name para que solo se seleccione uno).
- **checkbox**: Selección múltiple.
- **button**: Botón sin comportamiento definido (requiere JavaScript).

#### Ejemplo:
```html
<label for="nombre">Nombre:</label>
<input type="text" name="usuario">
<label for="password">Contraseña:</label>
<input type="password" name="clave">
<input type="submit" value="Enviar">
<input type="reset" value="Limpiar">
```
<label for="nombre">Nombre:</label>
<input type="text" name="usuario"></input>
<label for="password">Contraseña:</label>
<input type="password" name="clave"></input>
<input type="submit" value="Enviar"></input>
<input type="reset" value="Limpiar"></input>

---
## Nuevos Campos en HTML5
Con la llegada de HTML5, se introdujeron nuevos tipos de entrada que facilitan la creación de formularios avanzados sin necesidad de scripts adicionales.

### Fechas:
- **date**: Calendario para seleccionar fecha.
- **datetime-local**: Selección de fecha y hora.
- **month**, **week**, **time**: Selección de mes, semana o hora.

#### Ejemplo:
```html
<input type="date" name="fecha_nacimiento">
<input type="time" name="hora_cita">
```
<input type="date" name="fecha_nacimiento"></input>
<input type="time" name="hora_cita"></input>

### Números:
- **number**: Entrada con flechas para incrementar o reducir.
- **range**: Selector deslizante.

#### Ejemplo:
```html
<input type="number" name="cantidad" min="1" max="10">
<input type="range" name="volumen" min="0" max="100">
```
<input type="number" name="cantidad" min="1" max="10"></input>
<input type="range" name="volumen" min="0" max="100"></input>

### Otros tipos:
- **email**: Entrada validada para correos electrónicos.
- **tel**: Entrada para números de teléfono (teclado numérico en móviles).
- **url**: Validación para URLs.

#### Ejemplo:
```html
<label for="email">Email:</label>
<input type="email" name="correo" required>
<label for="page">Página:</label>
<input type="url" name="pagina">
<label for="tlf">Teléfono:</label>
<input type="tel" name="telefono">
```
<label for="email">Email:</label>
<input type="email" name="correo" required></input>
<label for="page">Página:</label>
<input type="url" name="pagina"></input>
<label for="tlf">Teléfono:</label>
<input type="tel" name="telefono"></input>

---
## Otros Elementos Importantes
Además de los inputs, existen otros elementos esenciales para formularios:

`<select>`: Desplegable de opciones con `<option>`.
`<textarea>`: Área de texto para entradas largas.
`<datalist>`: Lista de sugerencias para un campo de texto.

#### Ejemplo:
```html
<label for="country">País:</label>
<select name="pais">
  <option value="es">España</option>
  <option value="fr">Francia</option>
  <option value="pt">Portugal</option>
  <option value="it">Italia</option>
</select>

<label for="comments">Comentarios:</label>
<textarea name="comentarios" rows="5" cols="30"></textarea>

<label for="browser">Navegador:</label>
<input list="navegadores" name="navegador">
<datalist id="navegadores">
  <option value="Chrome">
  <option value="Firefox">
  <option value="Safari">
</datalist>
```
<label for="country">País:</label>
<select name="pais">
  <option value="es">España</option>
  <option value="fr">Francia</option>
  <option value="pt">Portugal</option>
  <option value="it">Italia</option>
</select>

<label for="comments">Comentarios:</label>
<textarea name="comentarios" rows="5" cols="30"></textarea>

<label for="browser">Navegador:</label>
<input list="navegadores" name="navegador"></input>
<datalist id="navegadores">
  <option value="Chrome"></option>
  <option value="Firefox"></option>
  <option value="Safari"></option>
</datalist>
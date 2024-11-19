---
sidebar_label: 'Textos y tipografías'
sidebar_position: 1
---
# Textos y tipografías

## Tabla de Contenidos
- [Tipografías](#tipografías)
- [Etiquetas HTML para formateo de texto](#etiquetas-html-para-formateo-de-texto)
- [Estilos de texto en CSS](#estilos-de-texto-en-css)

---

## Tipografías
El diseño web no solo se trata de imágenes y colores, sino que la tipografía juega un papel crucial en la experiencia del usuario. Elegir la combinación correcta de fuentes puede hacer que un sitio web sea estéticamente atractivo y fácil de leer.

### 1. **Sistemas Tipográficos:**
   - **Fuentes Serif:** Clásicas y tradicionales. Ejemplo: Times New Roman.
   - **Fuentes Sans Serif:** Modernas y minimalistas. Ejemplo: Arial.
   - **Fuentes Display:** Decorativas y usadas en encabezados.
   - **Monospace:** Cada carácter ocupa el mismo ancho. Ejemplo: Courier.

### 2. **Combinación de Tipografías:**
   - **Regla de las 2 Tipografías:** No uses más de dos tipos de fuente distintos para evitar que el diseño se vea desordenado.
   - **Contraste:** Combina tipografías con suficiente contraste para crear jerarquía visual. Por ejemplo, una fuente serif para los encabezados y una sans serif para el cuerpo del texto.
   - **Consistencia:** Mantén la consistencia en el uso de las fuentes a lo largo de todo el sitio web. Usa el mismo estilo de fuente para elementos similares, como títulos y párrafos.

### 3. **Legibilidad:**
   - El objetivo principal de la tipografía es facilitar la lectura. Elige tamaños adecuados (mínimo 16px para textos de cuerpo) y asegúrate de que haya suficiente contraste entre el texto y el fondo.

### 4. **Accesibilidad:**
   - Utiliza tamaños y colores de fuente que sean accesibles para todos los usuarios. Herramientas como Google Fonts ofrecen una amplia gama de fuentes optimizadas para la web.

## Etiquetas HTML para formateo de texto

HTML5 ofrece varias etiquetas semánticas y de formato para definir el estilo y la estructura del texto. A continuación se muestran algunas etiquetas comunes que se deben considerar al trabajar con tipografías:

- `<h1></h1>` a `<h6></h6>`: Para definir encabezados jerárquicos.
- `<p></p>`: Para párrafos.
- `<b></b>` vs. `<strong></strong>`: Negritas.
- `<i></i>` vs. `<em></em>`: Itálicas o texto enfatizado.
- `<u></u>` y `<del></del>`: Subrayado y tachado.
- `<mark></mark>`: Resaltar texto importante.
- `<small></small>`: Para texto de menor importancia, como notas legales.
- `<cite></cite>`: Para citar fuentes.
- `<code></code>` y `<pre></pre>`: Para mostrar código preformateado.

## Estilos de texto en CSS

Para mejorar la presentación de las tipografías en la web, CSS ofrece un conjunto de propiedades que permiten un control detallado sobre el estilo del texto.

### 1. **Propiedades font-**
   - **`font-family`**: Define la familia tipográfica. Puedes usar fuentes externas con Google Fonts o cargar fuentes personalizadas mediante `@font-face`:
     ```css
     @font-face {
       font-family: 'MiFuentePersonalizada';
       src: url('mi-fuente.woff2') format('woff2');
     }
     ```
   - **`font-size`**: Controla el tamaño de la fuente. Se recomienda utilizar unidades relativas como `em` o `rem`.
   - **`font-weight`**: Controla el grosor del texto, desde `100` (muy delgado) hasta `900` (muy grueso).
   - **`font-style`**: Define si el texto es normal, cursivo o inclinado (`italic`, `oblique`).

### 2. **Propiedades text-**
   - **`text-decoration`**: Define subrayado, tachado, etc.:
     ```css
     text-decoration: underline;
     ```
   - **`text-transform`**: Controla si el texto debe mostrarse en mayúsculas, minúsculas o con capitalización de cada palabra:
     ```css
     text-transform: uppercase;
     ```
   - **`text-align`**: Alineación del texto (`left`, `right`, `center`, `justify`).

### 3. **Otras Propiedades Útiles**
   - **`line-height`**: Controla el espaciado entre líneas. Un valor adecuado mejora la legibilidad.
   - **`letter-spacing`** y **`word-spacing`**: Ajustan el espacio entre letras o palabras.
   - **`word-wrap`**: Permite que las palabras largas se ajusten al ancho del contenedor:

   - **`white-space`**:  normal (ignora los espacios en blanco
adicionales), pre (mantiene los espacios adicionales),
nowrap (no realiza el ajuste de línea)

     ```css
     word-wrap: break-word;
     ```

### 4. **Columnas**
   Para crear textos en columnas:
   - **`column-count`**: Indica el número de columnas.
   - **`column-width`**: Para indicar el ancho de cada columna.
   - **`column-gap`**: Establece la separación entre columnas.
   - **`column-rule`**: Pone una línea entre columnas.

   ```css
   column-count: 3;
   column-gap: 20px;
   ```
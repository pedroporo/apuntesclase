---
sidebar_label: 'Preparar y añadir elementos multimedia'
sidebar_position: 1
---
# Preparar y añadir elementos multimedia

## Tabla de Contenidos
- [Imágenes para la web](#imágenes-para-la-web)
- [Audio en la Web](#audio-en-la-web)
- [Vídeo en la Web](#vídeo-en-la-web)

## Imágenes para la Web

### Importancia de las Imágenes
Las imágenes son fundamentales para la comunicación visual en la web. La efectividad de un mensaje visual depende de la elección adecuada de imágenes y del conocimiento sobre cómo usarlas correctamente. Es crucial recordar que las imágenes solo pueden comunicar experiencias comunes y por ello deben seleccionarse cuidadosamente para transmitir el mensaje deseado.

### Tipos de Imágenes

#### Imágenes de Mapa de Bits (Raster)
- **Construcción**: Formadas por píxeles.
- **Características**:
  - Pierden calidad al hacer zoom.
  - El tamaño del archivo es proporcional al tamaño de la imagen.
  - Adecuadas para imágenes realistas o complejas.
- **Formatos Comunes**:
  - **BMP**
  - **GIF**
  - **JPG/JPEG**
  - **PNG**
  - **TIFF**
  - **EPS**

#### Imágenes Vectoriales
- **Construcción**: Formadas por funciones matemáticas.
- **Características**:
  - No pierden calidad al hacer zoom.
  - El tamaño del archivo es independiente del tamaño de la imagen.
  - Adecuadas para representar esquemas o planos.
- **Formatos Comunes**:
  - **SVG**
  - **FLA**
  - **ODG**
  - **WMF**
  - **EPS**

### Formatos de Imágenes y Usos

#### GIF (Graphics Interchange Format)
- **Colores**: 256 colores.
- **Uso**: Ideal para iconos y gráficos con grandes áreas de color sólido.
- **Características**:
  - Soporta animaciones.
  - No es adecuado para fotografías debido a la limitada paleta de colores.

#### PNG (Portable Network Graphics)
- **Bits de color**: Puede trabajar con 8, 16 o 48 bits.
- **Uso**: Creado como alternativa al GIF, especialmente para imágenes que requieren transparencia.
- **Características**:
  - Soporta canal alfa (transparencia).
  - Mejor compresión que el GIF.
  - No soporta animaciones.

#### JPG/JPEG (Joint Photographic Experts Group)
- **Bits de color**: 8 a 24 bits.
- **Uso**: El formato más utilizado para fotografías y gráficos complejos.
- **Características**:
  - Alta compresión con mínima pérdida de calidad.
  - No soporta transparencia ni animaciones.

### Uso de Imágenes en la Web

- **Logos**:
  - Identifican la marca.
  - Pueden servir como enlace al inicio del sitio web.
  - Generalmente en formatos GIF o PNG.
  
- **Iconos**:
  - Complementan textos y enlaces.
  - Deben ser simples pero significativos.
  - Generalmente en formatos GIF o PNG.

- **Banners**:
  - Utilizados en publicidad.
  - Formatos comunes: GIF, PNG, JPEG, o animaciones en Flash.

- **Imágenes en Artículos**:
  - Aportan información adicional al contenido.
  - Generalmente en formato JPEG.

### Etiquetas HTML para Imágenes

- **Etiqueta `<img>`**:
    ```html
    <img src="url" alt="Descripción de la imagen" style="width:auto;">
    ```
- **Atributos**:
    - `src`: Dirección del archivo de imagen.
    - `alt`: Texto alternativo, importante para accesibilidad.
    - `width` y `height`: Dimensiones de la imagen.

- **Etiqueta `<picture>`**:
    ```html
    <picture>
    <source media="(min-width: 650px)" srcset="img_grande.jpg">
    <source media="(min-width: 465px)" srcset="img_mediana.jpg">
    <img src="img_pequeña.jpg" alt="Imagen adaptativa">
    </picture>
    ```
    - Permite cargar diferentes versiones de la misma imagen según el tamaño de la pantalla.

- **Áreas Clickables**:
```html
<img src="workplace.jpg" alt="Workplace" usemap="#workmap">
<map name="workmap">
  <area shape="rect" coords="34,44,270,350" alt="Computer" href="computer.htm">
  <area shape="circle" coords="337,300,44" alt="Coffee" href="coffee.htm">
</map>
```

### Herramientas para Imágenes
- **Visualización**:
    - XnView, GwenView, FFView.

- **Creación**:
    - Iconos: IcoFx, IconArt.
    - Banners: BannerShop Gif Animator, iDraw.
    - Logotipos: EazyDraw, The Logo Creator.

- **Edición**:
    - Photoshop, GIMP.

- **Conversión**:
    - AVS Image Converter, PixRev.

### Optimización de Imágenes para la Web
- **Resolución**: 72 ppp para imágenes web.
- **Formato Inicial**: TIFF para escaneos por su menor pérdida de calidad.
- **Redimensionado**: Ajusta las imágenes al tamaño necesario antes de subirlas.
- **Miniaturas**: Crea versiones pequeñas para previsualizaciones.
- **Compresión**: Reduce la calidad sin que sea perceptible para el usuario.
- **Colores**: Prioriza líneas horizontales sobre verticales en la creación de imágenes.

## Audio en la Web
### Conceptos Generales
- **Canales**: Mono (1 canal), Estéreo (2 canales), Surround (5.1 canales).
- **Frecuencia de Muestreo**: Medida en KHz (p.ej. 44.1 KHz para CD).
- **Tamaño de Muestra**: Profundidad de bits, afecta la calidad del sonido (p.ej. 16 bits en CD).
- **Bitrate**: Tasa de bits, influye en la calidad del archivo (p.ej. 128 Kbps para MP3).

### Formatos de Audio y Códecs
- **OGG**: Contenedor libre con VBR, ideal para streaming.
- **MP3**: Popular por su alta compresión con poca pérdida perceptible.
- **RA** (Real Audio): Optimizado para transmisión en tiempo real.
- **WMA** (Windows Media Audio): Formato de Microsoft, competencia directa del MP3.
- **AAC**: Superior a MP3, utilizado en conjunto con H.264 en MP4.
- **Vorbis**: Códec estándar para OGG y WebM.

### Uso del Audo en la Web
- **Etiqueta `<audio>`**:
    ```html
    <audio controls autoplay loop>
    <source src="audio.mp3" type="audio/mpeg">
    <source src="audio.ogg" type="audio/ogg">
    </audio>
    ```
    - Atributos:
        - `src`: URL del archivo de audio.
        - `controls`: Muestra los controles del reproductor.
        - `autoplay`: Reproduce automáticamente.
        - `loop`: Reproduce en bucle.
        - `preload`: Define si el archivo se carga al inicio.

### MIME Types para Audio
- mp4: .mp4, .m4a
- ogg: .ogg, .oga
- mp3: .mp3
- wav: .wav
- webm: .webm

## Vídeo en la Web
### Conceptos Básicos
- **Duración**: Tiempo total del vídeo.
- **Tamaño de Fotograma**: Dimensiones del vídeo.
- **Relación de Aspecto**: Proporción ancho/alto del vídeo.
- **FPS**: Cuadros por segundo; 24 fps para cine, 10-15 fps para web.
- **Códec**: Algoritmo de compresión (p.ej. H.264).

### Formatos de Vídeo
- **RealVideo**: Formato de RealNetworks, requiere RealPlayer.
- **FlashVideo**: Formato de Adobe Flash, extensiones .FLV y .F4V.
- **WMV**: Formato de Windows Media Video.

### Uso del Vídeo en la Web
- **Etiqueta `<video>`**:
    ```html
    <video width="720" height="400" controls poster="poster.jpg">
    <source src="video.webm" type="video/webm">
    <source src="video.ogv" type="video/ogg">
    </video>
    ```
    - **Atributos**:
        - `width` y `height`: Dimensiones del vídeo.
        - `poster`: Imagen que se muestra antes de la reproducción.

### MIME Types para Vídeo
mp4: .mp4, .m4v
ogg: .ogg, .ogv
webm: .webm

### Conversión de Audio/Vídeo
- **Formatos de Conversión**:
    - **Audio**: De MP3 a OGG.
    - **Vídeo**: De AVI a MP4.

- **Herramientas de Conversión**:
    - **Audio**: Free Audio Converter, AVS, SoundConverter.
    - **Vídeo**: FreeMake Video Converter, AVC Video Converter, Selene.

### Contenedores Multimedia
- **OGG**: Estándar abierto soportado por HTML5.
- **MATROSKA (MKV)**: Alta calidad con capacidad para múltiples pistas.
- **ASF**: Propiedad de Microsoft, diseñado para streaming.
- **MP4**: Formato estándar para almacenamiento audiovisual.
- **MOV**: Sistema de Apple, compatible con alta calidad en web.
- **AVI**: Capaz de almacenar vídeo y audio simultáneamente.
- **WebM**: Estándar de HTML5, usa VP8 para vídeo y Vorbis para audio.



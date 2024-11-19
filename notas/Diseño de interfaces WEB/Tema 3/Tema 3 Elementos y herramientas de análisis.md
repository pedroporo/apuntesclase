---
sidebar_label: 'Guías de estilo: Elementos, herramientas de análisis y mapas de navegación'
sidebar_position: 1
---
# Guías de estilo: Elementos, herramientas de análisis y mapas de navegación

## Tabla de Contenidos
- [Introducción](#introducción)
- [Elementos Clave de una Guía de Estilo](#elementos-clave-de-una-guía-de-estilo)
- [Herramientas de Análisis](#herramientas-de-análisis)
- [Mapas de Navegación](#mapas-de-navegación)


---
## Introducción

Una guía de estilo es un documento que recopila elementos y reglas que definen diferentes aspectos de una interfaz web para asegurar que sean utilizados de manera consistente a lo largo del ciclo de vida del proyecto. Está dirigida a los roles que participan en el diseño, programación, generación de contenido, gestión y mantenimiento de un sitio web. Aunque no existe un estándar definido para crear estas guías, se pueden identificar elementos comunes que deben incluirse basándose en la experiencia y la observación.

### Importancia de una Guía de Estilo

- **Coherencia Visual**: Garantiza que todos los elementos visuales del proyecto mantengan una apariencia uniforme.
- **Eficiencia en el Desarrollo**: Facilita el trabajo de los equipos al proporcionar directrices claras.
- **Mantenimiento Sencillo**: Unifica el aspecto visual y funcional, lo que facilita futuras modificaciones.
- **Colaboración**: Actúa como referencia para todos los miembros del equipo, evitando malentendidos y errores.

---
## Elementos Clave de una Guía de Estilo

### 1. Tipografías

Las tipografías son los estilos de letra utilizados en el diseño de una web. Los aspectos fundamentales a considerar son:

- **Legibilidad**: Elegir una tipografía que sea fácil de leer.
- **Tamaño**: Ajustar el tamaño de la tipografía para que sea coherente y accesible.
- **Contraste**: Asegurarse de que haya suficiente contraste entre el texto y el fondo para mejorar la legibilidad.

#### Directrices para el Uso de Tipografías:

- **Fuente**: Seleccionar la fuente que mejor se adapte al proyecto.
- **Estilo**: Definir variaciones como negrita, cursiva o subrayado.
- **Tamaño y Color**: Establecer un tamaño y color que faciliten la lectura.

Es recomendable utilizar un máximo de dos fuentes: una para los títulos y otra para el cuerpo del texto. Las propiedades CSS más importantes para definir una tipografía son:

- `font-family`: Fuente
- `font-size`: Tamaño
- `font-weight`: Grosor
- `font-style`: Estilo

Recursos adicionales:
- [Google Fonts](https://fonts.google.com/)
- [Tipografías seguras para la web](https://www.w3schools.com/cssref/css_websafe_fonts.asp)

### 2. Colores

El uso adecuado de los colores es crucial en el diseño de interfaces web. Se debe definir una paleta de colores que será utilizada de manera consistente en todo el sitio web. Los colores aditivos se basan en el modelo RGB (Rojo, Verde, Azul), donde la combinación de estos tres colores en diferentes proporciones permite obtener una amplia gama de colores.

#### Directrices para el Uso de Colores:

- **Colores de Marca**: Definir colores corporativos que representen la identidad visual.
- **Títulos y Textos**: Especificar colores para los encabezados (`<h1> - <h6>`) y los párrafos (`<p>`).
- **Fondos y Bordes**: Establecer colores para los fondos de página y los bordes de elementos.
- **Colores Seguros para la Web**: Utilizar colores seguros para garantizar una visualización consistente en todos los navegadores.

Los colores seguros se forman con combinaciones específicas de los valores hexadecimales `00, 33, 66, 99, CC, FF`, lo que da un total de 216 colores que son consistentes en todos los navegadores.

### 3. Estructura y Layout

La estructura de la web se refiere a la disposición de los diferentes bloques de contenido. Es importante definir si se utilizará una rejilla o layout, y especificar el framework CSS que se empleará, como Bootstrap.

#### Directrices para la Estructura:

- **Rejilla o Layout**: Especificar si se utiliza una rejilla para la disposición de los elementos.
- **Clases de Apoyo**: Indicar las clases CSS especiales que se utilizarán.
- **Adaptabilidad**: Describir cómo se adaptará el layout en diferentes dispositivos.

Recursos adicionales:
- [Bootstrap](https://getbootstrap.com/)

### 4. Iconografía

Los iconos son pequeños gráficos que representan objetos o acciones en la interfaz. Es esencial que los iconos utilizados sean familiares para los usuarios y que se empleen de manera coherente en toda la web.

#### Directrices para el Uso de Iconos:

- **Selección de Iconos**: Utilizar iconos reconocibles por los usuarios.
- **Ubicación y Finalidad**: Especificar dónde se utilizarán los iconos y con qué propósito.
- **Formato**: Preferentemente, utilizar iconos en formato vectorial.

Recursos adicionales:
- [Font Awesome](https://fontawesome.com/)

### 5. Unidades de Medida

En CSS, las unidades de medida son utilizadas para definir dimensiones como la altura, anchura, márgenes, y tamaño de las fuentes. Existen dos tipos de unidades: absolutas y relativas.

#### Unidades Absolutas:

- **cm**: Centímetros
- **mm**: Milímetros
- **pt**: Puntos (1 punto = 1/72 pulgadas)
- **pc**: Picas (1 pica = 12 puntos)
- **in**: Pulgadas (1 pulgada = 2.54 cm)

#### Unidades Relativas:

- **em**: Relativa al tamaño de la fuente del elemento actual.
- **rem**: Relativa al tamaño de la fuente del elemento raíz (`<html>`).
- **vw**: 1% del ancho del viewport.
- **vh**: 1% de la altura del viewport.
- **vmin**: Valor mínimo entre el ancho y la altura del viewport.
- **vmax**: Valor máximo entre el ancho y la altura del viewport.
- **%**: Porcentaje, relativo al valor del elemento contenedor.

### 6. Otros Elementos

En una guía de estilo también se deben considerar otros elementos que contribuyen a la consistencia y usabilidad de la web:

- **Contenido**: Establecer el tono y la terminología a utilizar.
- **Estilo de Imágenes**: Definir cómo deben ser tratadas las imágenes.
- **Enlaces**: Especificar el estilo y comportamiento de los enlaces.
- **Usabilidad y Accesibilidad**: Considerar aspectos de usabilidad y accesibilidad.
- **Plantillas de Página**: Definir plantillas base para diferentes tipos de páginas.
- **Tablas y Otros Elementos**: Establecer directrices para el diseño de tablas y otros componentes de contenido.
- **Interacción**: Describir cómo debe ser la interacción con los elementos de la interfaz.

---
## Herramientas de Análisis

Existen herramientas que permiten extraer estilos y analizar aspectos importantes de una interfaz web. Los navegadores incluyen herramientas de desarrollo que permiten inspeccionar código, visualizar cambios en CSS y analizar el rendimiento de la página.

### Herramientas Comunes:

- **Inspector de Código**: Permite visualizar y editar el HTML y CSS en tiempo real.
- **Consola**: Muestra mensajes, errores y advertencias.
- **Editor CSS**: Permite modificar y probar estilos CSS en caliente.
- **Debugger**: Herramienta para depurar código JavaScript.
- **Registro de Red**: Muestra la actividad de la red, útil para analizar tiempos de carga.
- **Visor de Almacenamiento**: Permite ver y gestionar cookies, local storage, entre otros.

---

## Mapas de Navegación

### ¿Qué son los Mapas de Navegación?

Los mapas de navegación son representaciones visuales de la estructura de un sitio web, mostrando cómo están interconectadas las diferentes páginas y secciones. Su función es similar a la de un índice en un libro, ya que permiten organizar y visualizar el contenido antes de su creación, facilitando tanto el proceso de diseño como la posterior navegación para los usuarios.

### Importancia de los Mapas de Navegación

En sitios web complejos con múltiples páginas, es crucial tener una estructura clara para evitar que tanto el diseñador como los usuarios se pierdan en la navegación. Al crear un mapa de navegación, se define de antemano la organización de las secciones del sitio y cómo se relacionan entre sí. Esto permite:

1. **Organizar el contenido de forma lógica:** Los mapas de navegación ayudan a dividir el sitio en bloques de contenido coherentes y facilitan la creación de un flujo de navegación intuitivo.
2. **Facilitar la navegación del usuario:** Una buena estructura permite que los usuarios encuentren rápidamente lo que buscan.
3. **Comunicación efectiva dentro del equipo de desarrollo:** Los mapas de navegación son una herramienta visual que ayuda a transmitir la visión del sitio entre los diseñadores, desarrolladores y otros miembros del equipo.

### Tipos de Estructuras de Navegación

La estructura de un sitio web dependerá de la relación entre sus páginas y puede adoptar diferentes formas:

#### 1. Estructura Lineal
En esta estructura, las páginas están organizadas de manera secuencial, similar a un libro. Es adecuada para sitios donde la lectura debe seguir un orden específico, permitiendo al usuario avanzar o retroceder entre páginas. Sin embargo, su uso es limitado a sitios con un contenido lineal.

![Estructura lineal](../img/estructura%20lineal.png)

#### 2. Estructura Reticular
Este tipo de estructura conecta todas las páginas del sitio entre sí, permitiendo al usuario moverse libremente en cualquier dirección. Aunque es flexible, no es recomendable para sitios con un gran número de páginas, ya que el usuario podría perderse en la navegación.

![Estructura reticular](../img/estructura%20reticular.png)

#### 3. Estructura Jerárquica
Es la estructura más común en sitios web. Se organiza en secciones bien diferenciadas y de baja complejidad, permitiendo a los usuarios navegar entre secciones sin tener que pasar por otras. Es ideal para sitios con una clara división de contenidos.

![Estructura jerarquica](../img/estructura%20jerarquica.gif)

#### 4. Estructura Lineal-Jerárquica
Esta estructura combina la jerarquía con la secuencialidad, siendo útil en sitios donde cada sección contiene un volumen considerable de información que debe ser leída en orden. También se emplea en sitios donde las secciones representan diferentes niveles de complejidad, permitiendo la navegación entre ellas.

![Estructura -jerarquica](../img/estructura%20lineal-jerarquica.gif)

### Ejemplo de un Mapa de Navegación

A continuación, se presenta un ejemplo del mapa de navegación de Netflix. En él, se puede observar cómo están interconectadas las diferentes áreas del sitio, como "Inicio", "Series", "Películas", "Novedades populares" y "Mi lista".

![Mapa navegación](../img/mapa%20navegacion%20netflix.png)

### Consideraciones al Crear Mapas de Navegación

Cuando se crean mapas de navegación, es importante tener en cuenta lo siguiente:

- **Objetivo de cada página:** No todas las páginas deben cubrir el mismo objetivo ni ofrecer la misma información. La página principal (homepage) debe servir como el eje central desde donde se accede al resto del contenido.
- **Claridad y simplicidad:** La estructura debe ser clara y fácil de entender tanto para los usuarios como para el equipo de desarrollo.
- **Evolución del sitio:** A medida que el sitio crece o cambia, el mapa de navegación debe actualizarse para reflejar la nueva estructura de contenido.

### Recursos Adicionales

Para obtener más información sobre cómo crear mapas de navegación y organizar contenidos en sitios web, revisa los siguientes enlaces:

- [Generalitat Valenciana. Conselleria de Educación, Cultura y Deporte](http://www.ceice.gva.es/).
- [Comunidad Autónoma de Galicia](http://www.xunta.gal/).
- [Comunidad Autónoma de Euskadi](https://www.euskadi.eus/).
- [Comunidad Autónoma de Cataluña](https://web.gencat.cat/).
- [Amazon España](https://www.amazon.es/).
- [Guía para agrupar contenidos sueltos en mapas de navegación](https://blog.ida.cl/diseno/como-agrupar-contenidos-sueltos-en-mapas-de-navegacion/).

Estos ejemplos ilustran cómo diferentes organizaciones estructuran sus sitios para facilitar la navegación y mejorar la experiencia del usuario.



---
title: "Colores en Bash"
source: "https://soloconlinux.org.es/colores-en-bash/"
author:
  - "[[Luis GuLo]]"
published: 2023-10-29
created: 2025-10-05
description: "Porqué usar colores en BashEl mostrar colores en la salida de la ejecución de comandos, facilita mucho la lectura o localización de una forma más sencilla la salida de la ejecución de un script que hayamos desarrollado para ejecutar en Linux.Colores disponiblesUn ejemplo de salida de colores"
tags:
  - "clippings"
---
### Porqué usar colores en Bash

El mostrar colores en la salida de la ejecución de comandos, facilita mucho la lectura o localización de una forma más sencilla la salida de la ejecución de un script que hayamos desarrollado para ejecutar en Linux.

### Colores disponibles

Un ejemplo de salida de colores en la Bash

![](https://soloconlinux.org.es/content/images/2023/10/cod-colores.webp)

Un poco de color para indicar rápidamente donde está el fallo

### Cómo construir salida de colores en Bash

A la hora de imprimir en la terminal texto con estilo o colores diferentes a los que tiene predefinidos por defecto la terminal podemos usar el comando *echo* ó *printf*.

El formato a usar deberá estar identificado mediante lo que se denominan 'caracteres de escape' que formatean el texto a imprimir en pantalla.

Si usamos el comando *echo*, deberemos usar el parámetro - *e* para que la bash interprete los denominados caracteres de escape, si usamos printf no hace falta indicar ningún parámetro.

El formato a usar es el siguiente:

**CodigoEscape** **\[****CodigoFormato** **m**

*Nota: No dejar espacios en blanco, aquí se muestran para mayor claridad*

El *Código de Escape* se puede escribir de 3 maneras:

| Opción 1 | Opción 2 | Opción 3 |
| --- | --- | --- |
| \\e | \\033 | \\x1B |

Generalmente se utiliza **\\e** por ser el más corto a la hora de escribirse.

**Código de Formato**  
formato definido mediante *CodigoFormato* está dividido en 3 tipos:

- Código de Estilo (*CodEstilo*)
- Código de color del Texto (*CodColorFuente*)
- Código de color del Fondo (*CodColorFondo*)

**Código de Estilo**  
Podemos usar diferentes estilos, según los siguiente valores:

| Estilo | Valor |
| --- | --- |
| Normal/Defecto | 0 |
| Negrita | 1 |
| Atenuado | 2 |
| Cursiva | 3 |
| Subrayado | 4 |
| Parpadeo | 5 |
| Parpadeo intenso | 6 |
| Invertido | 7 |
| *Oculto* | 8 |
| Tachado | 9 |

*Oculto*: Usará el mismo color que el fondo para que no se vea.

**Códigos de Color**  
Simplemente conociendo los valores de los colores, podemos construir el color del texto sumando 30 al valor del color deseado, en el caso del color del fondo sumaremos 40 al valor del color.

Tabla con los valores para los colores de texto fondo:

| COLOR       | Valor | Color TEXTO (+30) | Color FONDO (+40) |
| ----------- | ----- | ----------------- | ----------------- |
| ⚫ Negro     | 0     | 30                | 40                |
| 🔴 Rojo     | 1     | 31                | 41                |
| 🟢 Verde    | 2     | 32                | 42                |
| 🟡 Amarillo | 3     | 33                | 43                |
| 🔵 Azul     | 4     | 34                | 44                |
| 🟣 Morado   | 5     | 35                | 45                |
| 🔵 Cian     | 6     | 36                | 46                |
| ⚪ Gris      | 7     | 37                | 47                |
| ⚪ Blanco    | 8     | 38                | 48                |
| \-RESET-    | 9     | 39 (Reset Color)  | 49 (Reset Fondo)  |

**Combinar Estilo, Texto y Fondo**  
Si queremos usar al mismo tiempo un estilo junto a un color de texto o un fondo determinado, simplemente separaremos cada uno de los códigos por un punto y coma (;)  
También se pueden combinar varios estilos separándolos siempre por;

**CodigoEscape \[ Estilo; ColorTexto; ColorFondo m**

*Nota: No dejar espacios en blanco, aquí se muestran para mayor claridad*

**Código para dejar valores por defecto al Texto**  
Si no incluimos un *código de reset* para volver a dejar el texto en el formato por defecto, seguirá mostrándose en el estilo y color indicado.  
Para resetear o volver al estilo por defecto podemos usar los siguiente códigos:

| RESET de TODO | Reset de ESTILO | Reset color FUENTE | Reset color FONDO |
| --- | --- | --- | --- |
| \\e\[0m | 20 + CodEstilo | \\e\[39m | \\e\[49m |

Ejemplos de uso:

```
# Colores (Sin estilo)
echo -e "\e[31m ROJO \e[33m  AMARILLO \e[32m VERDE \e[0m NORMAL"

# Negrita + Colores
echo -e "\e[1;31m ROJO \e[1;33m  AMARILLO \e[1;32m VERDE \e[1;39m NEGRITA \e[0m"

# Tachado + Colores
echo -e "\e[9;31m ROJO \e[9;33m  AMARILLO \e[9;32m VERDE \e[9;39m TACHADO \e[0m"
```

Distintos estilos

El resultado es:

![](https://soloconlinux.org.es/content/images/size/w600/2023/10/resultado-01.webp)

Un poco de color para indicar rápidamente donde está el fallo

Nota: Es importante especificar *echo -e* y usar comillas dobles (") en vez de simples o no se interpretarán los caracteres de escape.

Ejemplo incluyendo color de fondo:

```
# Colores en texto + Fondo Morado
echo -e "\e[31;45m ROJO \e[33m  AMARILLO \e[32m VERDE \e[0;45m NORMAL \e[0m"

# Negrita + Colores texto + Fondo morado
echo -e "\e[1;31;45m ROJO \e[1;33m  AMARILLO \e[1;32m VERDE \e[1;39m NEGRITA \e[0m"

# Tachado + Colores en texto + Fondo morado
echo -e "\e[9;31;45m ROJO \e[9;33m  AMARILLO \e[9;32m VERDE \e[9;39m TACHADO \e[0m"
```

El resultado que se mostrará es:

![](https://soloconlinux.org.es/content/images/size/w600/2023/10/resultado-02.webp)

Un poco de color para indicar rápidamente donde está el fallo

Nota: Solo es necesario fijar el color del fondo una vez, hasta que no se resetea un atributo se mantiene.

**Ejemplo de uso en un script**

![](https://soloconlinux.org.es/content/images/size/w600/2023/10/ejemplo-codigo.webp)

Un poco de color para indicar rápidamente donde está el fallo

Si se produce algún error se mostraría un resultado de la siguiente forma:

![](https://soloconlinux.org.es/content/images/size/w600/2023/10/ejemplo-salida-error-coloreada.webp)

Un poco de color para indicar rápidamente donde está el fallo

---

### Códigos ANSI

Si quieres saber más sobre los códigos ANSI para la gestión del formato de la consola o terminal, puede leer el artículo de la Wikipedia:

### Scripts de terceros para usar códigos ANSI

Si te resulta complicado usar caracteres de escape o colores puedes usar un script que se llama 'ansi' para mostrar el texto con los colores o formatos deseados.

Puedes descargarlo simplemente escribiendo en tu terminal:

```
# Descargar script/aplicacion ansi
curl -OL git.io/ansi

# Hacerlo ejecutable:
chmod +x ansi

# Dejarlo en la ruta de ejecucion
sudo mv ansi /usr/local/bin/
```

El código de este script y su uso está en:

> Te recomiendo que no dependas de programas externos para colorear tu bash. Simplemente aprendete unos pocos colores y estilos necesarios para incluirlo en tus propios scripts.
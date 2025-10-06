---
title: "Introducción a Python - Primeros pasos con Python"
source: "https://j2logo.com/python/tutorial/introduccion-a-python/"
author:
  - "[[j2logo]]"
published: 2020-03-04
created: 2025-10-06
description: "En este tutorial de introducción a Python descubrirás las características principales del lenguaje para crear tu primera aplicación."
tags:
  - "clippings"
---
En este tutorial de introducción a Python vas a descubrir las características principales del lenguaje, aquello que lo hace único y que te hará falta conocer para implementar cualquier programa en este lenguaje.

## Índice

- [Características del lenguaje Python](https://j2logo.com/python/tutorial/introduccion-a-python/#intro-caracteristicas)
- [El intérprete de Python](https://j2logo.com/python/tutorial/introduccion-a-python/#intro-interprete)
- [Operadores, expresiones y sentencias en Python](https://j2logo.com/python/tutorial/introduccion-a-python/#intro-expresiones-sentencias)
- [Bloques de código (Indentación)](https://j2logo.com/python/tutorial/introduccion-a-python/#intro-bloques)
- [Comentarios en Python](https://j2logo.com/python/tutorial/introduccion-a-python/#intro-comentarios)
- [Convenciones de nombres en Python](https://j2logo.com/python/tutorial/introduccion-a-python/#intro-convenciones)
- [Palabras reservadas de Python](https://j2logo.com/python/tutorial/introduccion-a-python/#intro-palabras-reservadas)
- [Constantes en Python](https://j2logo.com/python/tutorial/introduccion-a-python/#intro-constantes)

## Introducción a Python: Características del lenguaje

Python es un lenguaje de programación de alto nivel cuya máxima es la legibilidad del código. Las principales características de Python son las siguientes:

- **Es multiparadigma**, ya que soporta la programación imperativa, programación orientada a objetos y funcional.
- **Es multiplataforma**: Se puede encontrar un intérprete de Python para los principales sistemas operativos: *Windows*, *Linux*  y  *Mac OS*. Además, se puede reutilizar el mismo código en cada una de las plataformas.
- **Es dinámicamente tipado**: Es decir, el tipo de las variables se decide en tiempo de ejecución.
- **Es fuertemente tipado:** No se puede usar una variable en un contexto fuera de su tipo. Si se quisiera, habría que hacer una conversión de tipos.
- **Es interpretado**: El código no se compila a lenguaje máquina.

❗️ El hecho de que Python sea **interpretado** quiere decir que **hace falta un intérprete** que permita ejecutar un programa o script escrito en Python sin necesidad de compilarlo.

## El intérprete de Python

Cuando instalas Python correctamente (en cualquier sistema operativo) ocurren, entre otras, dos cosas: se añade el comando `python` (o `python3`, en caso de que instales la versión 3.x de Python) al path y se instala el intérprete de Python correspondiente.

### Cómo saber qué versión de Python tengo instalada

Si ya has instalado Python, abre una consola o terminal y ejecuta el comando `python3`. Este comando lanzará el intérprete de Python correspondiente. Debes ver algo similar a esta imagen:

![Introducción a Python - Versión del intérprete](https://j2logo.com/wp-content/uploads/introduccion-a-python-version.png)

Introducción a Python - Versión del intérprete

Si te fijas bien, en la primera línea podemos ver la versión del intérprete de Python que tenemos instalado en nuestro ordenador. En mi caso es la versión 3.7.4.

En el intérprete de Python podemos escribir expresiones e instrucciones que este interpretará y ejecutará.

Puedes probar, por ejemplo, a escribir `2 + 3`. El resultado debe ser el siguiente:

\>>> 2 \+ 3

5

\>>> 2 + 3 5

```
>>> 2 + 3
5
```

O ejecutar la instrucción `print('¡Hola mundo!')`:

\>>> print ('¡Hola mundo!')

¡Hola mundo!

\>>> print('¡Hola mundo!') ¡Hola mundo!

```
>>> print('¡Hola mundo!')
¡Hola mundo!
```

Para salir del intérprete basta con ejecutar la instrucción `quit()`.

No obstante, aunque esta forma de escribir código puede ser útil para aprender y en casos muy puntuales, no es la habitual a la hora de escribir un programa o script en Python.

### Primer programa en Python

Normalmente, los programas en Python se escriben en archivos con la extensión `.py`. Estos archivos se pasan al intérprete de Python para que los interprete y ejecute.

Vamos a verlo con un ejemplo. Crea con un editor de texto un fichero llamado `suma.py` con el siguiente contenido:

suma = 2 \+ 3

print (suma)

suma = 2 + 3 print(suma)

```
suma = 2 + 3
print(suma)
```

A continuación abre un terminal, sitúate en el directorio en el que creaste el archivo `suma.py` y ejecuta lo siguiente:

python3 suma.py

python3 suma.py

```
python3 suma.py
```

En el terminal verás que aparece el número `5` como resultado de ejecutar el programa anterior. ¿Qué ha ocurrido aquí? Básicamente que el intérprete de Python ha leído y ejecutado las líneas de código que hemos escrito en el fichero `suma.py`.

Esta es la manera más común de crear y ejecutar programas en Python.

## Operadores, expresiones y sentencias en Python

En este tutorial de introducción a Python quiero que aprendas la diferencia entre operador, expresión y sentencia, ya que son las formas básicas que componen la estructura de cualquier programa.

### Operador

Un **operador** es un carácter o conjunto de caracteres que actúa sobre una, dos o más **variables** y/o **literales** para llevar a cabo una **operación** con un **resultado** determinado.

Ejemplos de operadores comunes son los operadores aritméticos `+` (suma), `-` (resta) o `*` (producto), aunque en Python existen otros operadores.

### Expresión

Una expresión es una unidad de código que devuelve un valor y está formada por una combinación de operandos (variables y literales) y operadores. Los siguientes son ejemplos de expresiones (cada línea es una expresión diferente):

5 + 2 \# Suma del número 5 y el número 2

a < 10 \# Compara si el valor de la variable a es menor que 10

b is None \# Compara si la identidad de la variable b es None

3 \* (200 \- c) \# Resta a 200 el valor de c y lo multiplica por 3

5 + 2 # Suma del número 5 y el número 2 a < 10 # Compara si el valor de la variable a es menor que 10 b is None # Compara si la identidad de la variable b es None 3 \* (200 - c) # Resta a 200 el valor de c y lo multiplica por 3

```
5 + 2  # Suma del número 5 y el número 2
a < 10  # Compara si el valor de la variable a es menor que 10
b is None  # Compara si la identidad de la variable b es None
3 * (200 - c) # Resta a 200 el valor de c y lo multiplica por 3
```

### Sentencia

Por su parte, una sentencia o declaración es una instrucción que define una acción. Una sentencia puede estar formada por una o varias expresiones, aunque no siempre es así.

En definitiva, las sentencias son las instrucciones que componen nuestro programa y determinan su comportamiento.

Ejemplos de sentencias son la asignación `=` o las instrucciones `if`, `if ... else ...`, `for` o `while` entre otras.

> ❗️ Una sentencia está delimitada por el carácter `Enter (\n)`.

#### Sentencias de más de una línea

Normalmente, las sentencias ocupan una sola línea. Por ejemplo:

a = 2 \+ 3 \# Asigna a la variable <a> el resultado de 2 + 3

a = 2 + 3 # Asigna a la variable <a> el resultado de 2 + 3

```
a = 2 + 3  # Asigna a la variable <a> el resultado de 2 + 3
```

Sin embargo, aquellas sentencias que son muy largas pueden ocupar más de una línea ([la guía de estilo PEP 8](https://www.python.org/dev/peps/pep-0008/), recomienda una longitud de línea máxima de 72 caracteres).

Para dividir una sentencia en varias líneas se utiliza el carácter `\`. Por ejemplo:

a = 2 \+ 3 \+ 5 \+ \\

7 \+ 9 \+ 4 \+ \\

6

a = 2 + 3 + 5 + \\ 7 + 9 + 4 + \\ 6

```
a = 2 + 3 + 5 + \
    7 + 9 + 4 + \
    6
```

Además de la separación explícita (la que se realiza con el carácter `\`), en Python la continuación de línea es implícita siempre y cuando la expresión vaya dentro de los caracteres `()`, `[]` y `{}`.

Por ejemplo, podemos inicializar una lista del siguiente modo:

a = \[1, 2, 7,

3, 8, 4,

9\]

a = \[1, 2, 7, 3, 8, 4, 9\]

```
a = [1, 2, 7,
     3, 8, 4,
     9]
```

No te preocupes si no sabes lo que es una lista o no entiendes lo que hace el ejemplo anterior. Lo importante es que comprendas que lo anterior es una sentencia multi-línea ya que está comprendida entre los caracteres `[]`.

## Bloques de código (Indentación)

Lo último que veremos sobre sentencias en esta introducción a Python es cómo se pueden agrupar en bloques de código.

Un bloque de código es un grupo de sentencias relacionadas bien delimitadas. A diferencia de otros lenguajes como JAVA o C, en los que se usan los caracteres `{}` para definir un bloque de código, en Python se usa la indentación o sangrado.

El sangrado o indentación consiste en mover un bloque de texto hacia la derecha insertando espacios o tabuladores al principio de la línea, dejando un margen a la izquierda.

👉🏻 Esta es una de las principales características de Python.

Un bloque comienza con un nuevo sangrado y acaba con la primera línea cuyo sangrado sea menor. De nuevo, la guía de estilo de Python recomienda usar los espacios en lugar de las tabulaciones para realizar el sangrado. Yo suelo utilizar 4 espacios.

❗️ Configura tu IDE de desarrollo para que use los espacios en lugar de los tabuladores para el sangrado. Establece el número de espacios a 4 ó 2.

Veamos todo esto con un ejemplo:

def suma\_numeros (numeros): \# Bloque 1

suma = 0 \# Bloque 2

for n in numeros: \# Bloque 2

suma += n \# Bloque 3

print (suma) \# Bloque 3

return suma \# Bloque 2

def suma\_numeros(numeros): # Bloque 1 suma = 0 # Bloque 2 for n in numeros: # Bloque 2 suma += n # Bloque 3 print(suma) # Bloque 3 return suma # Bloque 2

```
def suma_numeros(numeros):  # Bloque 1
    suma = 0                # Bloque 2
    for n in numeros:       # Bloque 2
        suma += n           # Bloque 3
        print(suma)         # Bloque 3
    return suma             # Bloque 2
```

Como te decía en la sección anterior, no hace falta todavía que entiendas lo que hace el ejemplo. Simplemente debes comprender que en la línea 1 se define la función `suma_numeros`. El cuerpo de esta función está definido por el grupo de sentencias que pertenecen al bloque 2 y 3. A su vez, la sentencia `for` define las acciones a realizar dentro de la misma en el conjunto de sentencias que pertenecen al bloque 3.

## Comentarios en Python

Como cualquier otro lenguaje de programación, Python permite escribir comentarios en el código. Los comentarios son útiles para explicar por qué estamos programando algo de un modo concreto o añadir indicaciones. Te aseguro que son de utilidad cuando se retoma un programa o aplicación en el futuro

Los comentarios son ignorados por el intérprete de Python. Solo tienen sentido para los programadores.

Para añadir un comentario a tu código simplemente comienza una línea con el carácter `#`:

\# Esta línea es un comentario

a = 5

\# Resultado de multiplicar a por 2

print (a \* 2)

\# Esta línea es un comentario a = 5 # Resultado de multiplicar a por 2 print(a \* 2)

```
# Esta línea es un comentario

a = 5

# Resultado de multiplicar a por 2
print(a * 2)
```

### Comentarios de varias líneas

Para escribir comentarios que ocupan varias líneas, simplemente escribe cada una de las líneas anteponiendo el carácter `#`:

\# Este comentario ocupa

\# 2 líneas

\# Este comentario ocupa # 2 líneas

```
# Este comentario ocupa
# 2 líneas
```

También puedes escribir un comentario en varias líneas si lo encierras entre tres comillas simples `'''` o dobles `"""`

a = 2

'' 'Este comentario

también ocupa 2 líneas' ''

print (a)

a = 2 '''Este comentario también ocupa 2 líneas''' print(a)

```
a = 2

'''Este comentario
también ocupa 2 líneas'''

print(a)
```

Sin embargo, personalmente no me gusta este modo de definir un comentario en varias líneas porque también es la forma de definir un `string` en varias líneas.

### Docstrings

Los docstrings son un tipo de comentarios especiales que se usan para documentar un módulo, función, clase o método. En realidad son la primera sentencia de cada uno de ellos y se encierran entre tres comillas simples o dobles.

Los docstrings son utilizados para generar la documentación de un programa. Además, suelen utilizarlos los entornos de desarrollo para mostrar la documentación al programador de forma fácil e intuitiva.

Veámoslo con un ejemplo:

def suma (a, b):

"" "Esta función devuelve la suma de los parámetros a y b"

return a + b

def suma(a, b): """Esta función devuelve la suma de los parámetros a y b" return a + b

```
def suma(a, b):
    """Esta función devuelve la suma de los parámetros a y b"
    return a + b
```

## Convenciones de nombres en Python

A la hora de nombrar una variable, una función, un módulo, una clase, etc. en Python, siempre se siguen las siguientes reglas y recomendaciones:

- Un identificador puede ser cualquier combinación de letras (mayúsculas y minúsculas), números y el carácter guión bajo (`_`).
- Un identificador no puede comenzar por un número.
- A excepción de los nombres de clases, es una convención que todos los identificadores se escriban en minúsculas, separando las palabras con el guión bajo. Ejemplos: `contador`, `suma_enteros`.
- Es una convención que los nombres de clases sigan la notación *Camel Case*, es decir, todas las letras en minúscula a excepción del primer carácter de cada palabra, que se escribe en mayúscula. Ejemplos: `Coche`, `VehiculoMotorizado`.
- No se pueden usar como identificadores las palabras reservadas.
- Como recomendación, usa identificadores que sean expresivos. Por ejemplo, `contador` es mejor que simplemente `c`.
- Python diferencia entre mayúsculas y minúsculas, de manera que `variable_1` y `Variable_1` son dos identificadores totalmente diferentes.

## Palabras reservadas de Python

Python tiene una serie de palabras clave **reservadas**, por tanto, **no pueden usarse como nombres de variables, funciones, etc.**

Estas palabras clave se utilizan para definir la sintaxis y estructura del lenguaje Python.

La lista de palabras reservadas es la siguiente:

`and`, `as`, `assert`, `break`, `class`, `continue`, `def`, `del`, `elif`, `else`, `except`, `False`, `finally`, `for`, `from`, `global`, `if`, `import`, `in`, `is`, `lambda`, `None`, `nonlocal`, `not`, `or`, `pass`, `raise`, `return`, `True`, `try`, `yield`, `while` y `with`

## Constantes en Python

Terminamos esta introducción a Python señalando que, a diferencia de otros lenguajes, **en Python no existen las constantes**.

Entendemos como *constante* una variable que una vez asignado un valor, este no se puede modificar. Es decir, que a la variable no se le puede asignar ningún otro valor una vez asignado el primero.

Se puede simular este comportamiento, siempre desde el punto de vista del programador y atendiendo a convenciones propias, pero no podemos cambiar la naturaleza mutable de las variables.

No obstante, sí que es cierto que el propio Python define una serie de valores constantes en su propio namespace. Los más importantes son:

- **False:** El valor *false* del tipo `bool`.
- **True:** El valor *true* del tipo `bool`.
- **None:** El valor del tipo `NoneType`. Generalmente `None` se utiliza para representar la ausencia de valor de una variable.

Y con esto terminamos esta introducción a Python. En el siguiente tutorial repasaremos [las variables, cómo asignarles un valor y cómo modificarlas](https://j2logo.com/python/tutorial/variables-python/).
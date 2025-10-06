---
title: "Resolver problema ‘externally-managed-environment’ al instalar mediante pip3 – Red-Orbita"
source: "https://red-orbita.com/?p=11681"
author:
  - "[[rokitoh]]"
published: 2024-02-28
created: 2025-10-06
description:
tags:
  - "clippings"
---
¿Alguna vez has intentado instalar una herramienta crucial en tu sistema Debian 12 Bookworm solo para encontrarte con el desconcertante mensaje de error ‘externally-managed-environment’ al usar pip3? En este artículo, te proporcionaremos una solución rápida y sencilla para superar este obstáculo y seguir adelante con tus proyectos sin problemas.

```
error: externally-managed-environment

× This environment is externally managed
╰─> To install Python packages system-wide, try apt install
    python3-xyz, where xyz is the package you are trying to
    install.

    If you wish to install a non-Debian-packaged Python package,
    create a virtual environment using python3 -m venv path/to/venv.
    Then use path/to/venv/bin/python and path/to/venv/bin/pip. Make
    sure you have python3-full installed.

    If you wish to install a non-Debian packaged Python application,
    it may be easiest to use pipx install xyz, which will manage a
    virtual environment for you. Make sure you have pipx installed.

    See /usr/share/doc/python3.11/README.venv for more information.

note: If you believe this is a mistake, please contact your Python installation or OS distribution provider. You can override this, at the risk of breaking your Python installation or OS, by passing --break-system-packages.
hint: See PEP 668 for the detailed specification.
```

El mensaje de error indica que puedes pasar la bandera –break-system-packages, pero eso suena aterrador. Simplemente quiero que pip deje de molestarme, pero me permita administrar mis dependencias del sistema como lo he hecho durante muchos años.

Creo que algunos desarrolladores de Python realmente quieren que personas como yo utilicen entornos virtuales, pero eso requiere demasiado esfuerzo cuando realmente no me importa hacerlo, muchas gracias. Si prefieres usar venv, adelante. Simplemente me gusta hacer las cosas en mis pequeños servidores.

### Soluciones disponibles

#### Eliminar el archivo EXTERNALLY-MANAGED

Entonces, la solución para Debian 12, al menos, es eliminar el archivo EXTERNALLY-MANAGED de tu instalación de Python del sistema:

```
sudo rm -rf /usr/lib/python3.11/EXTERNALLY-MANAGED
```

Si estás utilizando Ansible, puedes agregar esta tarea a tu playbook antes de ejecutar cualquier tarea de pip:

```
- name: Ignorar PEP 668 porque es ridículo.
  ansible.builtin.file:
    path: /usr/lib/python3.11/EXTERNALLY-MANAGED
    state: absent
```

Ten en cuenta que el número de versión python3.11 debería coincidir con lo que tengas instalado; era 3.11 en el momento de la redacción de esta publicación en el blog.

### Usar pipx

Otra opción interesante es instalar y usar pipx, que realiza el trabajo pesado de administrar los entornos virtuales por ti.

Instala `pipx` si aún no lo tienes:

```
sudo apt install pipx
```

También asegúrate de que `pipx` esté disponible en tu entorno:

```
python3 -m pip install --user pipx
python3 -m pipx ensurepath
```

Usa `pipx` para instalar una herramienta, como `black` (un formateador de código):

```
pipx install black
```

Esto instalará `black` en su propio entorno virtual y lo hará accesible desde cualquier parte del sistema.

Verifica que la herramienta funciona correctamente:

```
black --version
```

Con `pipx`, puedes instalar y gestionar herramientas Python sin preocuparte por conflictos en el sistema ni por los entornos virtuales. Es ideal para aplicaciones como linters, formateadores o gestores de tareas.

### Aporte adicional: Instalar paquetes con --break-system-packages

Gracias al aporte de Serch, otra manera de instalar paquetes sin modificar tu sistema es usar el siguiente comando:

```
pip3 install [PAQUETE_A_INSTALAR] --break-system-packages
```

Esto permite instalar cualquier paquete necesario sin necesidad de eliminar archivos del sistema ni configurar entornos virtuales adicionales.

:wq!
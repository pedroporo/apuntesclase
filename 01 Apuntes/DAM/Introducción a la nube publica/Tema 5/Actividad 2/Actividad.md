---
dg-publish: false
---

Ultima Modificacion: `$= dv.current().file.mtime`

Curso: Desarollo de aplicaciones multiplataforma segundo

Titulo de la actividad: **# AP-Q.5.2. Pràctica API Gateway + Funcions Lambda**

Alumno: Pedro Guill Ferri

Fecha de entrega: `$= dv.date("today")`


<center><img src="https://picsum.photos/500/700" alt="Portada" /></center>



# Paso 1 Crear la función en la web
En este paso vamos a crear la funcion lambda, para ello vamos a elegir el nombre FakerAPI y la version sera python3.14

![[Pasted image 20260202172127.png]]

# Paso 2 Escribir el codigo de la API
En este paso e elejido usar la libreria [Faker](https://faker.readthedocs.io/en/master/) para la funcionalidad de la api, lo que ara esta api es que en la url le vas a pedir un proveedor, si no sabes cuales hay puedes poner help y re devolvera un json con todos los proveedores, comente que es lo que hacia cada cosa para que puedas leer el codigo ya que lo de la lista de proveedores puede ser dificil de entender
```python
import json
from typing import Any, Dict, List
from faker import Faker

fake = Faker()

key1Name='proveedor'
key2Name='num'

print('Loading function')
def _list_providers() -> List[str]:
	names = set()
	
	# El get_providers lo tiene la clase Generator de Faker
	for provider in fake.get_providers():
		for attr in dir(provider):
			if attr.startswith('_'):
				continue
			try:
				member = getattr(provider, attr)
			except Exception:
				continue
			if callable(member):
				names.add(attr)
	return sorted(names)
	
def _generate(provider: str, count: int) -> List[Any]:
	# Que no salga excepcion si no existe el provider
	if not hasattr(fake, provider):
		raise ValueError(f"Proveedor/metodo '{provider}' no encontrado en la instancia de Faker")
		
	# Recoger la funcion del provider
	func = getattr(fake, provider)
	if not callable(func):
		raise ValueError(f"Atributo '{provider}' existe pero no se puede llamar como funcion")
	# Esto ejecuta la funcion recogida
	results = []
	for _ in range(count):
		results.append(func().__str__())
	
	return results
	
def lambda_handler(event: Dict[str, Any], context) -> Dict[str, Any]:
	# el valor por defecto de key1 es 'help' o provider, el de key2 = cantidad (int)
	# se espera que key1 sea un string y key2 un int
	key1 = str(event.get(key1Name, 'help'))
	try:
		key2 = int(event.get(key2Name, 1))
	except Exception:
		key2 = 1
		
	if key1.lower() == 'help':
		providers = _list_providers()
		print(f"Retornando {len(providers)} proveedores/metodos disponibles")
		return { 'statusCode': 200, 'body': {'provider': 'help', 'available_providers_count': len(providers), 'providers': providers} }
		
	try:
		results = _generate(key1, max(0, key2))
	except Exception as e:
		print(f"Error generando valores: {e}")
		return { 'statusCode': 500, 'body':{'error': str(e), 'provider': key1} }
		
	print(f"Generados {len(results)} valores para el proveedor '{key1}'")
	return {'statusCode': 200,'body':{'provider': key1,'count': len(results),'results':results}}
```

![[Pasted image 20260202172601.png]]

y luego de poner el codigo hay se publica una version para que se guarde
![[Pasted image 20260202173301.png]]
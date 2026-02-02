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
	params= event.get('queryStringParameters',{})
	key1 = str(params.get(key1Name, 'help'))
	try:
		key2 = int(params.get(key2Name, 1))
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

# Paso 3 Crear, configurar y desplegar API
En este paso vamos a crear una api rest para poder acceder a nuestro metodo lambda que hemos creado.
primero tenemos que crear la api
![[Pasted image 20260202173606.png]]

Luego crearemos un metodo que use esa funcion

![[Pasted image 20260202173857.png]]

y se hace un deploy de la api

![[Pasted image 20260202180841.png]]

Y esto es lo que retorna la api cuando se ejecuta

`curl --request GET --url 'https://xlcbdjmwbuqipilkkmsts7hrna0oekbj.lambda-url.us-east-1.on.aws/?proveedor=address&num=1'`

```
{
  "provider": "address",
  "count": 1,
  "results": [
    "53975 Payne Mills Apt. 358\nNorth Amber, OR 11023"
  ]
}
```

`curl --request GET --url 'https://xlcbdjmwbuqipilkkmsts7hrna0oekbj.lambda-url.us-east-1.on.aws/?proveedor=address&num=1'`

```
{
  "provider": "address",
  "count": 1,
  "results": [
    "53975 Payne Mills Apt. 358\nNorth Amber, OR 11023"
  ]
}
```
`curl --request GET  --url 'https://xlcbdjmwbuqipilkkmsts7hrna0oekbj.lambda-url.us-east-1.on.aws/?proveedor=help'`

```
{
  "provider": "help",
  "available_providers_count": 280,
  "providers": [
    "aba",
    "address",
    "administrative_unit",
    "am_pm",
    "android_platform_token",
    "ascii_company_email",
    "ascii_email",
    "ascii_free_email",
    "ascii_safe_email",
    "bank",
    "bank_country",
    "basic_phone_number",
    "bban",
    "binary",
    "boolean",
    "bothify",
    "bs",
    "building_number",
    "catch_phrase",
    "century",
    "chrome",
    "city",
    "city_prefix",
    "city_suffix",
    "color",
    "color_hsl",
    "color_hsv",
    "color_name",
    "color_rgb",
    "color_rgb_float",
    "company",
    "company_email",
    "company_suffix",
    "coordinate",
    "country",
    "country_calling_code",
    "country_code",
    "credit_card_expire",
    "credit_card_full",
    "credit_card_number",
    "credit_card_provider",
    "credit_card_security_code",
    "cryptocurrency",
    "cryptocurrency_code",
    "cryptocurrency_name",
    "csv",
    "currency",
    "currency_code",
    "currency_name",
    "currency_symbol",
    "current_country",
    "current_country_code",
    "date",
    "date_between",
    "date_between_dates",
    "date_object",
    "date_of_birth",
    "date_this_century",
    "date_this_decade",
    "date_this_month",
    "date_this_year",
    "date_time",
    "date_time_ad",
    "date_time_between",
    "date_time_between_dates",
    "date_time_this_century",
    "date_time_this_decade",
    "date_time_this_month",
    "date_time_this_year",
    "day_of_month",
    "day_of_week",
    "dga",
    "doi",
    "domain_name",
    "domain_word",
    "dsv",
    "ean",
    "ean13",
    "ean8",
    "ein",
    "email",
    "emoji",
    "enum",
    "file_extension",
    "file_name",
    "file_path",
    "firefox",
    "first_name",
    "first_name_female",
    "first_name_male",
    "first_name_nonbinary",
    "fixed_width",
    "free_email",
    "free_email_domain",
    "future_date",
    "future_datetime",
    "get_words_list",
    "hex_color",
    "hexify",
    "hostname",
    "http_method",
    "http_status_code",
    "iana_id",
    "iban",
    "image",
    "image_url",
    "internet_explorer",
    "invalid_ssn",
    "ios_platform_token",
    "ipv4",
    "ipv4_network_class",
    "ipv4_private",
    "ipv4_public",
    "ipv6",
    "isbn10",
    "isbn13",
    "iso8601",
    "itin",
    "job",
    "job_female",
    "job_male",
    "json",
    "json_bytes",
    "language_code",
    "language_name",
    "last_name",
    "last_name_female",
    "last_name_male",
    "last_name_nonbinary",
    "latitude",
    "latlng",
    "lexify",
    "license_plate",
    "linux_platform_token",
    "linux_processor",
    "local_latlng",
    "locale",
    "localized_ean",
    "localized_ean13",
    "localized_ean8",
    "location_on_land",
    "longitude",
    "mac_address",
    "mac_platform_token",
    "mac_processor",
    "md5",
    "military_apo",
    "military_dpo",
    "military_ship",
    "military_state",
    "mime_type",
    "month",
    "month_name",
    "msisdn",
    "name",
    "name_female",
    "name_male",
    "name_nonbinary",
    "nic_handle",
    "nic_handles",
    "null_boolean",
    "numerify",
    "opera",
    "paragraph",
    "paragraphs",
    "passport_dates",
    "passport_dob",
    "passport_full",
    "passport_gender",
    "passport_number",
    "passport_owner",
    "password",
    "past_date",
    "past_datetime",
    "phone_number",
    "port_number",
    "postalcode",
    "postalcode_in_state",
    "postalcode_plus4",
    "postcode",
    "postcode_in_state",
    "prefix",
    "prefix_female",
    "prefix_male",
    "prefix_nonbinary",
    "pricetag",
    "profile",
    "psv",
    "pybool",
    "pydecimal",
    "pydict",
    "pyfloat",
    "pyint",
    "pyiterable",
    "pylist",
    "pyobject",
    "pyset",
    "pystr",
    "pystr_format",
    "pystruct",
    "pytimezone",
    "pytuple",
    "random_choices",
    "random_digit",
    "random_digit_above_two",
    "random_digit_not_null",
    "random_digit_not_null_or_empty",
    "random_digit_or_empty",
    "random_element",
    "random_elements",
    "random_int",
    "random_letter",
    "random_letters",
    "random_lowercase_letter",
    "random_number",
    "random_sample",
    "random_uppercase_letter",
    "randomize_nb_elements",
    "rgb_color",
    "rgb_css_color",
    "ripe_id",
    "safari",
    "safe_color_name",
    "safe_domain_name",
    "safe_email",
    "safe_hex_color",
    "sbn9",
    "secondary_address",
    "sentence",
    "sentences",
    "sha1",
    "sha256",
    "simple_profile",
    "slug",
    "ssn",
    "state",
    "state_abbr",
    "street_address",
    "street_name",
    "street_suffix",
    "suffix",
    "suffix_female",
    "suffix_male",
    "suffix_nonbinary",
    "swift",
    "swift11",
    "swift8",
    "tar",
    "text",
    "texts",
    "time",
    "time_delta",
    "time_object",
    "time_series",
    "timezone",
    "tld",
    "tsv",
    "unix_device",
    "unix_partition",
    "unix_time",
    "upc_a",
    "upc_e",
    "uri",
    "uri_extension",
    "uri_page",
    "uri_path",
    "url",
    "user_agent",
    "user_name",
    "uuid4",
    "vin",
    "windows_platform_token",
    "word",
    "words",
    "xml",
    "year",
    "zip",
    "zipcode",
    "zipcode_in_state",
    "zipcode_plus4"
  ]
}
```
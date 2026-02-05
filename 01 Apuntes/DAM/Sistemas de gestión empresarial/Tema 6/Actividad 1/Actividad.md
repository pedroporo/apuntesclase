---
dg-publish: false
---
Ultima Modificacion: `$= dv.current().file.mtime`

Curso: Desarollo de aplicaciones multiplataforma segundo

Titulo de la actividad: **Act 4.4 - Página web y Comercio electrónico**

Alumno: Pedro Guill Ferri

Fecha de entrega: `$= dv.date("today")`


<center><img src="https://picsum.photos/500/700" alt="Portada" /></center>

```
Password: 57gg-kgyy-q3nn
User: pedro@test.com
```

# 1. Modelo de Película

## Código
Modelo de python
```python
class videoclub_movie(models.Model):
	_name = 'videoclub.movie'
	_description = 'Movie in the Videoclub'
	
	name = fields.Char(string='Titulo', required=True)
	price= fields.Float(string='Precio de Alquiler')
	generom = fields.Many2one("videoclub.generom",string="Categoría",required=True,ondelete="cascade")
	release_year = fields.Integer(string='Anio de Lanzamiento')
	available_copies = fields.Integer(string='Copias Disponibles', default=0)
	second_hand = fields.Boolean(string='Es de segunda mano', default=False)
	state= fields.Selection([('0','Bueno'),('1','Regular'),('2','Malo')], string='Estado de la pelicula', default='0')
	tags = fields.Many2many("videoclub.etiquetas", string="Etiquetas",required=True,ondelete="cascade")
	importetotal = fields.Float(string='Importe Total', compute='_importetotal')
	
	@api.depends('price','available_copies')
	def _importetotal(self):
		for r in self:
			r.importetotal = r.available_copies*r.price

```


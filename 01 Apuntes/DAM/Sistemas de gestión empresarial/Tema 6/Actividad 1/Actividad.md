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
# 1. Codigo general
Foto de la extension
![[Pasted image 20260205201832.png]]
XML del menu
```xml
<menuitem name="Videoclub" id="menu_videoclub"/>
```
CSV de los permisos
```
id,name,model_id:id,group_id:id,perm_read,perm_write,perm_create,perm_unlink

encargado_videoclub_movie,videoclub.movie,model_videoclub_movie,videoclub_group_manager,1,1,1,1
encargado_videoclub_generoM,videoclub.generom,model_videoclub_generom,videoclub_group_manager,1,1,1,1
encargado_videoclub_generoG,videoclub.generog,model_videoclub_generog,videoclub_group_manager,1,1,1,1
encargado_videoclub_game,videoclub.game,model_videoclub_game,videoclub_group_manager,1,1,1,1
encargado_videoclub_etiquetas,videoclub.etiquetas,model_videoclub_etiquetas,videoclub_group_manager,1,1,1,1

usuario_videoclub_movie,videoclub.movie,model_videoclub_movie,videoclub_group_user,1,0,0,0
usuario_videoclub_generoM,videoclub.generom,model_videoclub_generom,videoclub_group_user,1,0,0,0
usuario_videoclub_generoG,videoclub.generog,model_videoclub_generog,videoclub_group_user,1,0,0,0
usuario_videoclub_game,videoclub.game,model_videoclub_game,videoclub_group_user,1,0,0,0
usuario_videoclub_etiquetas,videoclub.etiquetas,model_videoclub_etiquetas,videoclub_group_user,1,0,0,0
```
XML de los permisos
```xml
<odoo>
	<record id="module_videoclub_category" model="ir.module.category">
		<field name="name">Videoclub</field>
	</record>
	
	<record id="videoclub_group_manager" model="res.groups">
		<field name="name">Administrador</field>
		<field name="category_id" ref="module_videoclub_category"/>
	</record>
	
	<record id="videoclub_group_user" model="res.groups">
		<field name="name">Usuario</field>
		<field name="category_id" ref="module_videoclub_category"/>
	</record>
</odoo>
```

Foto de que se le pueden asignar los permisos a los usuarios o administradores
![[Pasted image 20260205201758.png]]

Captura del menu
![[Pasted image 20260205201943.png]]
# 2. Modelo de Película

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

Código xml del tree
```xml
<record model="ir.ui.view" id="videoclub.movie_tree">
	<field name="name">videoclub.movie.tree</field>
	<field name="model">videoclub.movie</field>
	<field name="arch" type="xml">
		<tree>
			<field name="name"/>
			<field name="price"/>
			<field name="generom"/>
			<field name="release_year"/>
			<field name="available_copies"/>
		</tree>
	</field>
</record>
```

Codigo xml del form

```xml
<record model="ir.ui.view" id="videoclub.movie_form">
	<field name="name">videoclub.movie.form</field>
	<field name="model">videoclub.movie</field>
	<field name="arch" type="xml">
		<form>
			<group colespan="2" col="2">
				<field name="name"/>
				<field name="price"/>
				<field name="generom"/>
				<field name="release_year"/>
				<field name="available_copies"/>
				<field name="second_hand"/>
				<field name="state"/>
				<field name="importetotal"/>
				<field name="tags" widget="many2many_tags" placeholder="Introduzca las etiquetas..."/>
			</group>
		</form>
	</field>
</record>
```

Código xml de su action
```xml
<record model="ir.actions.act_window" id="videoclub.movie_action_window">
	<field name="name">Peliculas</field>
	<field name="res_model">videoclub.movie</field>
	<field name="view_mode">tree,form</field>
</record>
```

Codigo xml del action relacionado a películas

```xml
<menuitem name="Películas" id="menu_videoclub_movies" parent="videoclub.menu_videoclub" action="videoclub.movie_action_window"/>
```

Código xml de las búsquedas de películas

```xml
<record model="ir.ui.view" id="videoclub.movie_search_view">
	<field name="name">videoclub.movie.search</field>
	<field name="model">videoclub.movie</field>
	<field name="arch" type="xml">
		<search>
			<field name="name" string="Título"/>
			<field name="generom" string="Categoría"/>
			<field name="state" string="Estado"/>
			<filter name="caros" domain="[('price','&gt;=',5)]"/>
			<filter name="recientes" string="Recientes" domain="[('release_year','&gt;',2020)]"/>
			<filter name="segunda_mano" string="Segunda Mano" domain="[('second_hand','=',True)]"/>
		</search>
	</field>
</record>
```
## Capturas
Captura general de la sección de Películas
![[Pasted image 20260205202025.png]]

Captura del form de películas

![[Pasted image 20260205202241.png]]
Captura de los filtros de peliculas:
![[Pasted image 20260205202444.png]]

# 3. Modulo de categoría videojuegos
## Código
Codigo python

```python
class videoclub_game(models.Model):
	_name = 'videoclub.game'
	_description = 'Videojuego en el videoclub'
	
	name = fields.Char(string='Titulo', required=True)
	price= fields.Float(string='Precio de Alquiler')
	platform = fields.Char(string='Plataforma')
	generog = fields.Many2one("videoclub.generog",string="Categoría",required=True,ondelete="cascade")
	release_year = fields.Integer(string='Anio de Lanzamiento')
	available_copies = fields.Integer(string='Copias Disponibles', default=0)
	second_hand = fields.Boolean(string='Es de segunda mano', default=False)
	require_internet = fields.Boolean(string='Requiere internet', default=False)
	state= fields.Selection([('0','Bueno'),('1','Regular'),('2','Malo')], string='Estado del videojuego', default='0')
	tags = fields.Many2many("videoclub.etiquetas", string="Etiquetas",required=True,ondelete="cascade")
	importetotal = fields.Float(string='Importe Total', compute='_importetotal')
	@api.depends('price','available_copies')
	def _importetotal(self):
		for r in self:
			r.importetotal = r.available_copies*r.price
```

Codigo xml del tree
```xml
<record model="ir.ui.view" id="videoclub.game_tree">
	<field name="name">videoclub.game.tree</field>
    <field name="model">videoclub.game</field>
    <field name="arch" type="xml">
	    <tree>
          <field name="name"/>
          <field name="price"/>
          <field name="generog"/>
          <field name="release_year"/>
          <field name="require_internet"/>
        </tree>
    </field>
</record>
```

codigo xml del form
```xml
<record model="ir.ui.view" id="videoclub.game_form">
      <field name="name">videoclub.game.form</field>
      <field name="model">videoclub.game</field>
      <field name="arch" type="xml">
        <form>
          <group colespan="2" col="2">
            <field name="name"/>
            <field name="price"/>
            <field name="platform"/>
            <field name="generog"/>
            <field name="release_year"/>
            <field name="available_copies"/>
            <field name="second_hand"/>
            <field name="require_internet"/>
            <field name="state"/>
            <field name="importetotal"/>
            <field name="tags" widget="many2many_tags" placeholder="Introduzca las etiquetas..."/>
          </group>
        </form>
    </field>
</record>
```

Codigo xml del action
```xml
    <record model="ir.actions.act_window" id="videoclub.game_action_window">
      <field name="name">Juegos</field>
      <field name="res_model">videoclub.game</field>
      <field name="view_mode">tree,form</field>
    </record>
```
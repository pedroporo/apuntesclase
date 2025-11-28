---
dg-publish: true
---

Ultima Modificacion: `$= dv.current().file.mtime`

Curso: Desarollo de aplicaciones multiplataforma segundo

Titulo de la actividad: **Act 5.1 - Modo desarollador odoo**

Alumno: Pedro Guill Ferri

Fecha de entrega: `$= dv.date("today")`


<center><img src="https://picsum.photos/500/700" alt="Portada" /></center>

> [!important]+
> **Para poder realizar la actividad hay que mostrar tanto el código que habéis tocado y la vista gráfica con lo que habéis generado.**

Para la actividad debéis generar una nueva base de datos, con la opción de “demo data” activa, y además para trabajar debéis instalar el módulo de inventario. Además de la opción de “**Desarrollador**” activa.
57gg-kgyy-q3nn
![[Pasted image 20251127201618.png]]
## 1. Debes generar 2 grupos nuevos para el módulo de inventario, con los siguientes nombres y permisos.
- Jefe de departamento, con todos los permisos de los apartados de "Información general”, “Operaciones”, “Productos”, “Informes”. 
![[Pasted image 20251127202713.png]]
- Empleados departamento, con acceso de lectura en “Operaciones/transferencias”, “Operaciones/reposición” y todas las opciones de “Productos”.
![[Pasted image 20251128164805.png]]
## 2. Debéis añadir 3 campos nuevos dentro de las transacciones, pidiendo la siguiente información:
- Es importante (boolean). `isImportant boo`
- Fecha de pedido del cliente (fecha). `clientPurcharseDate date`
- Previsión de envío en días (entero). `arribeInDays int`
![[Pasted image 20251128202459.png]]

## 3. Genera un nuevo apartado (Ventana dentro de la transacción) donde muestres los días previstos de envío en lugar de en la parte superior. (Podéis utilizar xpath o html).
![[Pasted image 20251128202742.png]]
## 4. Busca una vista Kanban y modifica algo de ella (Que no sea hacer invisible la imagen).
> Voy a agregar la misma imagen otra vez :)

Codigo:
```
<?xml version="1.0"?>
<kanban sample="1">
                <field name="id"/>
                <field name="product_variant_count"/>
                <field name="currency_id"/>
                <field name="activity_state"/>
                <progressbar field="activity_state" colors="{&quot;planned&quot;: &quot;success&quot;, &quot;today&quot;: &quot;warning&quot;, &quot;overdue&quot;: &quot;danger&quot;}"/>
                <templates>
                    <t t-name="kanban-box">
                        <div class="oe_kanban_card oe_kanban_global_click">
                            <div class="o_kanban_image mr-1">
                                <img t-att-src="kanban_image('product.template', 'image_128', record.id.raw_value)" alt="Product" class="o_image_64_contain"/>
                            </div>
                            <div class="o_kanban_image mr-1">
                                <img t-att-src="kanban_image('product.template', 'image_128', record.id.raw_value)" alt="Product" class="o_image_64_contain"/>
                            </div>
                            <div class="oe_kanban_details">
                                <div class="o_kanban_record_top mb-0">
                                    <div class="o_kanban_record_headings">
                                        <strong class="o_kanban_record_title">
                                            <field name="name"/>
                                        </strong>
                                    </div>
                                    <field name="priority" widget="priority"/>
                                </div>
                                <t t-if="record.default_code.value">[<field name="default_code"/>]</t>
                                <div t-if="record.product_variant_count.value &gt; 1" groups="product.group_product_variant">
                                    <strong>
                                        <t t-esc="record.product_variant_count.value"/> Variants
                                    </strong>
                                </div>
                                <div name="product_lst_price" class="mt-1">
                                    Price: <field name="list_price" widget="monetary" options="{'currency_field': 'currency_id', 'field_digits': True}"/>
                                </div>
                                <div name="aaaa" class="mt-1">
                                    aaaaaaaaaaaaaaaaa
                                </div>
                            </div>
                        </div>
                    </t>
                </templates>
            </kanban>
        
```

![[Pasted image 20251128203045.png]]
## 5. Genera un elemento de menú dentro de Inventario con las transferencias que sean importantes. Añade o modifica varias transferencias activándole la opción para comprobar que se muestran.
![[Pasted image 20251128222850.png]]
El elemento es importantes
## 6. Modifícala la factura de la empresa añadiendo información sobre vuestra empresa. (Que no sean las redes sociales).

```
<li t-if="company.vat" class="list-inline-item d-inline"><span t-field="company.vat"></span></li>
```
![[Pasted image 20251128224422.png]]
## 7. Elimina información de la factura de la empresa, que no sea ni lo del punto 6, ni el comercial.
> Procedo a eliminar el body

Elimine el logo
```
<?xml version="1.0"?>
<t t-name="web.external_layout_standard">
        <div t-attf-class="header o_company_#{company.id}_layout" t-att-style="report_header_style">
            <div class="row">
                <div class="col-9 text-right" style="margin-top:22px;" t-field="company.report_header" name="moto"/>
            </div>
            <div t-if="company.logo or company.report_header" class="row zero_min_height">
                <div class="col-12">
                    <div style="border-bottom: 1px solid black;"/>
                </div>
            </div>
            <div class="row">
                <div class="col-6" name="company_address">
                    <ul class="list-unstyled" t-if="company.company_details or forced_vat">
                        <li t-if="company.company_details"> <t t-esc="company.company_details"/></li>
                        <li t-if="forced_vat">
                            <t t-esc="company.country_id.vat_label or 'Tax ID'"/>:
                            <span t-esc="forced_vat"/>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

        <div t-attf-class="article o_report_layout_standard o_company_#{company.id}_layout {{  'o_layout_background' if company.layout_background in ['Geometric', 'Custom']  else  '' }}" t-attf-style="background-image: url({{ 'data:image/png;base64,%s' % company.layout_background_image.decode('utf-8') if company.layout_background_image and company.layout_background == 'Custom' else '/base/static/img/bg_background_template.jpg' if company.layout_background == 'Geometric' else ''}});" t-att-data-oe-model="o and o._name" t-att-data-oe-id="o and o.id" t-att-data-oe-lang="o and o.env.context.get('lang')">
            <div class="pt-5">
                <!-- This div ensures that the address is not cropped by the header. -->
                <t t-call="web.address_layout"/>
            </div>
            <t t-out="0"/>
        </div>

        <div t-attf-class="footer o_standard_footer o_company_#{company.id}_layout">
            <div class="text-center" style="border-top: 1px solid black;">
                <ul class="list-inline mb4">
                  <li t-if="company.vat" class="list-inline-item d-inline"><span t-field="company.vat"></span></li>
                    <div t-field="company.report_footer"/>
                </ul>

                <div t-if="report_type == 'pdf'" class="text-muted">
                    Page: <span class="page"/> / <span class="topage"/>
                </div>
                <div t-if="report_type == 'pdf' and display_name_in_footer" class="text-muted">
                    <span t-field="o.name"/>
                </div>
            </div>
        </div>
    </t>

    
```
![[Pasted image 20251128224603.png]]
## 8. Genera un nuevo modelo con un mínimo de 3 campos, además genera los permisos que debería tener el módulo. Con 2 vistas mínimos, a elección vuestra. Junto a la acción o acciones de ventana pertinentes y los elementos de menú. Para finalizar mostrad que funciona y generad el producto al que haga referencia. (“No podéis realizar el de videojuegos”).
 > `>:(`


---
dg-publish: false
---

```
Medida_Número_Ventas = count(Ventas[ID_Venta])
Medida_Total_Ventas = sum(Ventas[Importe])
Medida_Unidades_Vendidas = sum(Ventas[Cantidad])
Medida_Venta_Media = DIVIDE([Medida_Total_Ventas],[Medida_Número_Ventas])

Medida_Número_Productos = count(Productos[ID_Producto])

Medida_Número_Clientes = COUNT(Clientes[ID_Cliente])
Medida_Venta_Media_Cliente = divide([Medida_Total_Ventas],[Medida_Número_Clientes])

--- Sin uso ya que solo es arrastrar Medida_Total_Ventas y luego la categoria o el campo fecha

Medida_Venta_Categoria = SUMX(VALUES(Productos[Categoría]),CALCULATE(SUM(Ventas[Importe])))
Medida_Venta_Mes = SUMX(VALUES(Ventas[Fecha].[Mes]),CALCULATE(SUM(Ventas[Importe])))


```

# 1. Análisis e interpretación de resultados

1. ¿Qué categoría de productos genera más ingresos?
La categoría que genera mas ingresos es los monitores
![[Pasted image 20260125130609.png]]
2. ¿Existen meses con mayor volumen de ventas? Indica los tres mejores.
Si. esos tres meses son Julio, noviembre y diciembre
![[Pasted image 20260125130708.png]]
3. ¿Qué tipo de cliente resulta más rentable?
El tipo de cliente que resulta mas rentable es el Particular
![[Pasted image 20260125130949.png]]
4. ¿Qué tipo de producto resulta más rentable?
El producto mas tentable es el monitor 32" 4k Neo
![[Pasted image 20260125131012.png]]
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

# 1. Analisis e interpretación de resultados
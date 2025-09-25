---
dg-publish: true
---

```mermaid
erDiagram

CLIENTE{
	int id pk
	varchar nombre
	varchar dni
}
DIRECCTION{
}

CODIGOPOSTAL{
}
CIUDAD{
}
FACTURA{
}
PEDIDO{
}
ALBARAN{
}
RUTA{
}
REPARTIDOR{
}
UBICACION{
}
CAMION{
}
LINEAPEDIDO{
}
PRODUCTO{
}
PEDIDOPROV{
}
PROVEEDOR{
}
INVENTARIO{
}
CLIENTE ||--o{ PED
```





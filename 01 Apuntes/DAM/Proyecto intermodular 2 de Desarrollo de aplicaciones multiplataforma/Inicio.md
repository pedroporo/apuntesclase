---
dg-publish: true
---

```mermaid
erDiagram

CUSTOMER ||--o{ ORDER : places

ORDER ||--|{ ORDER_ITEM : contains

PRODUCT ||--o{ ORDER_ITEM : includes

CUSTOMER {

string id

string name

string email

internal-link

}

ORDER {

string id PK "Hola"

date orderDate

string status

}

PRODUCT {

string id

string name

float price

}

ORDER_ITEM {

int quantity

float price

}

```

```mermaid
graph TD

Biology --> Chemistry

class Biology,Chemistry internal-link;
```



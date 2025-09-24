---
dg-publish: true
---

```mermaid
erDiagram

CAR {

string registrationNumber

string make

string model

}

PERSON {

string firstName

string lastName

int age

}

PERSON ||--|| CAR : owns

PERSON o{--|| HOUSE : has


```


```mermaid
graph TD

Biology --> Chemistry

class Biology,Chemistry internal-link;
```



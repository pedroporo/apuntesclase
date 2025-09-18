---
dg-publish: true
---

```dataviewjs
const folder = "01 Apuntes/DAM/Desarrollo de interfaces";  // Cambia esto por la carpeta raíz que quieres listar
const pages = dv.pages(`"${folder}"`).sort(p => p.file.name);

const grouped = pages.groupBy(p => p.file.folder);

for (let group of grouped) {
    dv.header(3, group.key);
    for (let page of group.rows) {
        dv.list([dv.fileLink(page.file.path)]);
    }
}

```

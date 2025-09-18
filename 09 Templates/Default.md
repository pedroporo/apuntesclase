---
dg-publish: true
---

```dataview
LIST
FROM "<% tp.file.folder(true) %>"
WHERE file.name != "<% tp.file.title %>"
SORT file.name ASC   
```

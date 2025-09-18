# {{title}} 
> Carpeta: `<% tp.file.folder(true) %>` 
📅 Creada el: `<% tp.file.creation_date("YYYY-MM-DD") %>` 
--- 
## 📂 Archivos en esta carpeta

```dataview LIST FROM "<% tp.file.folder(true) %>" WHERE file.name != "00 - Índice" SORT file.name ASC

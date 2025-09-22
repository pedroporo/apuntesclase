---
dg-publish: true
---

 
```dataviewjs
const temasRoot = dv.current().file.folder;
dv.header(1, temasRoot.split("/").pop());

// Detecta carpetas de tema
const allPages = dv.pages(`"${temasRoot}"`).where(p => p.file.path.startsWith(temasRoot));
//dv.paragraph(allPages);
const temasKeys = new Set();
allPages.forEach(p => {
  let folders = p.file.folder.split("/");
  folders.forEach(f => {
    if (f.startsWith("Tema ")) temasKeys.add(f);
  });
});

[...temasKeys].sort().forEach(temaKey => {
  dv.header(2, temaKey);
  // Carpeta Temario
  const temarioFolder = `${temasRoot}/${temaKey}/Temario`;
  // Markdown recursivos
  let temarioMdFiles = dv.pages().where(
    p => p.file.path.startsWith(temarioFolder)
  );
  // PDFs recursivos usando API de Obsidian
  let pdfFiles = app.vault.getFiles().filter(
    f => f.extension === "pdf" && f.path.startsWith(temarioFolder)
  );

  if (temarioMdFiles.length === 0 && pdfFiles.length === 0) {
    dv.paragraph("No hay temario");
  } else {
    dv.header(3, "Temario");
    if (temarioMdFiles.length > 0) {
      dv.list(temarioMdFiles.map(f => dv.fileLink(f.file.path)));
    }
    if (pdfFiles.length > 0) {
      dv.list(pdfFiles.map(f => dv.fileLink(f.path)));
    }
  }

  // Actividades igual que antes
  let actividades = dv.pages(`"${temasRoot}/${temaKey}"`)
    .where(p => p.file.folder.includes("Actividad"));
    
  let actividadesPdf = app.vault.getFiles().filter(
    f => f.extension === "pdf" && f.path.startsWith(`${temasRoot}/${temaKey}/Actividad`)
  );
  
  
  if (actividades.length && actividadesPdf.length) {
    dv.header(3, "Actividades");
    actividades.forEach(act => {
      dv.paragraph(dv.fileLink(act.file.name));
    });
    dv.list(actividadesPdf.map(f => dv.fileLink(f.path)));
  } else {
    dv.paragraph("No hay actividades");
  }
});
```

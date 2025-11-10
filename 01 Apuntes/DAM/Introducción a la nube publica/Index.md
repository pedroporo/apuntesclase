---
dg-publish: true
---
```bash
eval $(ssh-agent)
ssh-add ~/Documentos/credentials/awsKeys.pem
ssh-add -l
ssh -i awsKeys.pem -A ubuntu@3.81.118.106
```

```dataviewjs
const temasRoot = dv.current().file.folder;
dv.header(1, temasRoot.split("/").pop());

// Detecta carpetas de tema
const allPages = dv.pages(`"${temasRoot}"`).where(p => p.file.path.startsWith(temasRoot));
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
  if (actividades.length) {
    dv.header(3, "Actividades");
    actividades.forEach(act => {
      dv.paragraph(dv.fileLink(act.file.name));
    });
  } else {
    dv.paragraph("No hay actividades");
  }
});
```

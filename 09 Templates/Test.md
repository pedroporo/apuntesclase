<%*
// Obtener todas las carpetas disponibles en el vaul
const allFolders = tp.app.vault.getAllLoadedFiles().filter(item => item instanceof tp.obsidian.TFolder).map(folder => folder.path);

const parentPath = await tp.system.suggester(allFolders, allFolders); // Elegir carpeta padre
const plantillaNombre = "Plantilla1";
const notaIndiceNombre = "00 - Índice";
const abrirNota = true;

// Pedir nombre de la nueva carpeta
const folderName = await tp.system.prompt("Nombre de la carpeta", "Sin título");
if (!folderName || folderName.trim() === "") {
    tp.file.error("Nombre de carpeta no válido.");
}

const fullPath = `${parentPath}/${folderName}`.replace(/\/+/g, "/");

// Crear la carpeta si no existe
try {
    await app.vault.createFolder(fullPath);
    tR += `✅ Carpeta creada: ${fullPath}\n\n`;
} catch (e) {
    tR += `⚠️ La carpeta ya existe o hubo un error: ${e.message}\n\n`;
}

const folder = app.vault.getAbstractFileByPath(fullPath);

// Crear la nota de índice usando una plantilla
try {
    const nuevaNota = await tp.file.create_new(plantillaNombre, notaIndiceNombre, abrirNota, folder);
    tR += `📄 Nota de índice creada: ${nuevaNota.basename}`;
} catch (e) {
    tp.file.error(`No se pudo crear la nota: ${e.message}`);
}
%>

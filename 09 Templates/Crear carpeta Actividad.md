<%*// Configuración
const parentPath = "Proyectos"; // Cambia esta ruta si lo deseas (ej: "Área/Personal")
const plantillaNombre = "Plantilla Índice"; // Nombre exacto de tu plantilla
const notaIndiceNombre = "00 - Índice"; // Nombre de la nota que se creará
const abrirNota = true; // Cambia a false si no quieres que se abra automáticamente

// Pedir nombre de la carpeta
const folderName = await tp.system.prompt("Nombre de la carpeta", "Sin título");
if (!folderName || folderName.trim() === "") {
    tp.file.error("Nombre de carpeta no válido.");
}

// Ruta completa de la nueva carpeta
const fullPath = `${parentPath}/${folderName}`.replace(/\/+/g, "/");

// Crear la carpeta si no existe
try {
    await app.vault.createFolder(fullPath);
    tR += `✅ Carpeta creada: ${fullPath}\n\n`;
} catch (e) {
    tR += `⚠️ La carpeta ya existe o hubo un error: ${e.message}\n\n`;
}

// Ruta de la carpeta como objeto AbstractFile
const folder = app.vault.getAbstractFileByPath(fullPath);

// Crear la nota de índice usando una plantilla
try {
    const nuevaNota = await tp.file.create_new(plantillaNombre, notaIndiceNombre, abrirNota, folder);
    tR += `📄 Nota de índice creada: ${nuevaNota.basename}`;
} catch (e) {
    tp.file.error(`No se pudo crear la nota: ${e.message}`);
    }
    %>   

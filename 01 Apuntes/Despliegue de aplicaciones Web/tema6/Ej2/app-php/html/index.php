<!DOCTYPE html>
<html lang="ca">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pujar Imatges</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 2em;
        }

        .success {
            color: green;
        }

        .error {
            color: red;
        }
    </style>
</head>

<body>
    <h1>Pujar Imatges</h1> <?php $targetDir = "uploads/";
                            if (!is_dir($targetDir)) {
                                mkdir($targetDir, 0755, true);
                            }
                            if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_FILES['image'])) {
                                $targetFile = $targetDir . basename($_FILES["image"]["name"]);
                                $fileType = strtolower(pathinfo($targetFile, PATHINFO_EXTENSION)); // Comprovar que és una imatge 
                                $check = getimagesize($_FILES["image"]["tmp_name"]);
                                if ($check !== false) {
                                    if (move_uploaded_file($_FILES["image"]["tmp_name"], $targetFile)) {
                                        echo "<p class='success'>Imatge pujada correctament: <a href='$targetFile'>" . htmlspecialchars($_FILES["image"]["name"]) . "</a></p>";
                                    } else {
                                        echo "<p class='error'>Error en pujar la imatge.</p>";
                                    }
                                } else {
                                    echo "<p class='error'>El fitxer seleccionat no és una imatge.</p>";
                                }
                            } ?> <form action="index.php" method="post" enctype="multipart/form-data"> <label for="image">Selecciona una imatge:</label> <input type="file" name="image" id="image" accept="image/*" required> <br><br> <button type="submit">Pujar</button> </form>
    <h2>Imatges pujades</h2>
    <ul> <?php // Llistar les imatges al directori d'uploads 
            $files = array_diff(scandir($targetDir), array('.', '..'));
            foreach ($files as $file) {
                echo "<li><a href='$targetDir$file' target='_blank'>$file</a></li>";
            } ?> </ul>
</body>

</html>
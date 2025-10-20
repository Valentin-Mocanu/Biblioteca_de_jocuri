<!-- Adauga film (pentru admin) -->
<?php
// Conectare la baza de date
include 'conectare_baza_date.php';

$error = "";

// Preluam listele de genuri si platforme
$genuri = $conn->query("SELECT id_gen, nume_gen FROM genuri ORDER BY nume_gen ASC");
$platforme = $conn->query("SELECT id_platforma, nume_platforma FROM platforme ORDER BY nume_platforma ASC");

// Procesare formular
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $nume_joc = $conn->real_escape_string($_POST['nume_joc']);
    $descriere = $conn->real_escape_string($_POST['descriere']);
    $an_lansare = intval($_POST['an_lansare']);
    $id_gen = intval($_POST['id_gen']);
    $id_platforma = intval($_POST['id_platforma']);
    $box_art = $conn->real_escape_string($_POST['box_art']);

    $sql = "INSERT INTO jocuri (nume_joc, descriere, an_lansare, id_gen, id_platforma, box_art) 
            VALUES ('$nume_joc', '$descriere', '$an_lansare', '$id_gen', '$id_platforma', '$box_art')";

    if ($conn->query($sql) === TRUE) {
        echo "Joc adaugat cu succes!";
    } else {
        echo "Eroare: " . $conn->error;
    }
}
?>

<!DOCTYPE html>
<html lang="ro">
<head>
    <meta charset="UTF-8">
    <title>Adauga joc (admin)</title>
</head>
<body>
    <h2>Adauga un joc nou</h2>
    <form action="adauga_film.php" method="post">
        <label>Numele joc: <br>
            <input type="text" name="nume_joc" required><br><br>
		</label>

        <label>Descrierea: <br>
            <textarea name="descriere" rows="5" cols="40"></textarea><br><br>
		</label>
			
        <label>Anul lansarii: <br>
            <input type="number" name="an_lansare" min="1970" max="2099" required><br><br>
		</label>

        <label>Genul: <br>
            <select name="id_gen" required>
                <option value="">-- Alege genul --</option>
                <?php while($row = $genuri->fetch_assoc()) { ?>
                    <option value="<?= $row['id_gen'] ?>"><?= htmlspecialchars($row['nume_gen']) ?></option>
                <?php } ?>
            </select><br><br>
		</label>

        <label>Platforma: <br>
            <select name="id_platforma" required>
                <option value="">-- Alege platforma --</option>
                <?php while($row = $platforme->fetch_assoc()) { ?>
                    <option value="<?= $row['id_platforma'] ?>"><?= htmlspecialchars($row['nume_platforma']) ?></option>
                <?php } ?>
            </select><br><br>
		</label>

        <label>Box Art-ul (box_art/'nume_consola'/'fisier'): <br>
            <input type="text" name="box_art"><br><br>
		</label>

        <button type="submit">Adauga jocul</button>
		<br><br><br><br><br>
    </form>
</body>
</html>

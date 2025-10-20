<!-- Inregistrare -->
<?php
// Conectare la baza de date
include 'conectare_baza_date.php';

$error = "";

// Procesarea formularului
if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $username = trim($_POST['username'] ?? '');
    $email = trim($_POST['email'] ?? '');
    $parola = trim($_POST['parola'] ?? '');

    // Validarea username/email/parola
    if (empty($username) || strlen($username) < 3) {
        $error = "Nume de utilizator invalid! Trebuie sa contina cel putin 3 caractere!!";
    } elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $error = "Adresa de email nu este valida!";
    } elseif (strlen($parola) < 6) {
        $error = "Parola trebuie sa aiba cel putin 6 caractere!";
    } else {
        // Verificam daca exista deja email sau username
        $sqlCheck = "SELECT id_utilizator FROM utilizatori WHERE email = ? OR username = ? LIMIT 1";
        $stmtCheck = $conn->prepare($sqlCheck);
        if (!$stmtCheck) {
            $error = "Eroare SQL: " . $conn->error;
        } else {
            $stmtCheck->bind_param("ss", $email, $username);
            $stmtCheck->execute();
            $result = $stmtCheck->get_result();

            if ($result->num_rows > 0) {
                $error = "Email sau username deja inregistrat!";
            } else {
                // Hasharea parolei
                $hashParola = password_hash($parola, PASSWORD_DEFAULT);

                // Inserarea utilizatorului in tabela 'utilizatori'
                $sqlInsert = "INSERT INTO utilizatori (username, email, password_hash) VALUES (?, ?, ?)";
                $stmtInsert = $conn->prepare($sqlInsert);
                if (!$stmtInsert) {
                    $error = "Eroare SQL la inserare: " . $conn->error;
                } else {
                    $stmtInsert->bind_param("sss", $username, $email, $hashParola);
                    if ($stmtInsert->execute()) {
                        // Inregistrare reusita
                        echo "Inregistrare reusita! Autentifica-te <a href='conectare.php'>aici</a>!";
                        $stmtInsert->close();
                        $stmtCheck->close();
                        $conn->close();
                        exit;
                    } else {
                        $error = "Eroare la inregistrare! Incercati din nou!";
                    }
                    $stmtInsert->close();
                }
            }
            $stmtCheck->close();
        }
    }
}

// Inchiderea conexiunii
$conn->close();
?>
<!DOCTYPE html>
<html lang="ro">
<head>
    <meta charset="utf-8">
    <title>Inregistrare</title>
</head>
<body>
    <h2>Inregistrare</h2>
    <?php 
	if (!empty($error)) echo "<p style='color:red;'>$error</p>"; 
	?>
    <form action="inregistrare.php" method="post">
        <label>Username: 
		    <input type="text" name="username" required minlength="3"><br><br>
		</label>
        <label>Email: 
		    <input type="email" name="email" required><br><br>
		</label>
        <label>Parola: 
		    <input type="password" name="parola" required minlength="6"><br><br>
		</label>
        <button type="submit">Inregistreaza-te</button>
    </form>
	<p>Daca aveti un cont, va puteti conecta <a href="conectare.php">aici!</a></p>
</body>
</html>

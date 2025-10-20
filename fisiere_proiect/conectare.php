<!-- Autentificare/Login -->
<?php
session_start();
// Conectare la baza de date
include 'conectare_baza_date.php';

$error = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = trim($_POST['email'] ?? '');
    $password = trim($_POST['password'] ?? '');

    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $error = "Email invalid!";
    } else {
        $sql = "SELECT id_utilizator, username, email, password_hash FROM utilizatori WHERE email = ? LIMIT 1";
        $stmt = $conn->prepare($sql);
        if ($stmt === false) {
            $error = "Eroare la pregatirea interogarii: " . $conn->error;
        } else {
            $stmt->bind_param("s", $email);
            $stmt->execute();
            $result = $stmt->get_result();

            if ($result->num_rows == 1) {
                $row = $result->fetch_assoc();
                $parolaHash = $row['password_hash'];

                if (password_verify($password, $parolaHash)) {
                    // Stocare sesiune utilizator
                    $_SESSION['user_id']   = $row['id_utilizator'];
                    $_SESSION['email']     = $row['email'];
                    $_SESSION['username']  = $row['username'];
                    $_SESSION['logged_in'] = true;
					
					if ($row['email'] === "admin@gmail.com") {
						// Daca esti admin, te redirectioneaza la 'adauga_film.php'
						header("Location: adauga_film.php");
					}else{
						// Daca esti un utilizator normal, te redirectioneaza la pagina prncipala
						header("Location: ../home.php");
					}
					exit;

                } else {
                    $error = "Parola incorecta!";
                }
            } else {
                $error = "Email incorect!";
            }
            $stmt->close();
        }
    }
}

$conn->close();
?>

<!DOCTYPE html>
<html lang="ro">
<head>
    <meta charset="UTF-8">
    <title>Conectare</title>
</head>
<body>
        <h2>Conectare</h2>
        <?php 
		if (!empty($error)) echo "<p class='error'>$error</p>"; 
		?>
        <form action="conectare.php" method="post">
            <label>Email: 
                <input type="email" name="email" required><br><br>
			</label>
            <label>Parola: 
                <input type="password" name="password" required><br><br>
			</label>
            <button type="submit">Conecteaza-te</button>
        </form>
        <p>Daca nu aveti un cont, va puteti inregistra <a href="inregistrare.php">aici!</a></p>
</body>
</html>

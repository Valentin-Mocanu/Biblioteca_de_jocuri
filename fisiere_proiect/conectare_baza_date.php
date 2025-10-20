<!-- Conectarea la baza de date -->
<?php
$host = 'localhost';
$user = 'root';
$password = ''; // Parola utilizatorului root
$db_name = 'retro_games_site'; // Numele bazei de date

$conn = new mysqli($host, $user, $password, $db_name);

if ($conn->connect_error) {
    die("Conexiunea la baza de date a esuat: " . $conn->connect_error);
}

// Charset recomandat
$conn->set_charset('utf8mb4');
?>

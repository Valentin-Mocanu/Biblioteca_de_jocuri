<!-- Deconectare -->
<?php
session_start();
session_destroy();
header("Location: ../home.php"); // Redirectionare la pagina principala
exit;
?>

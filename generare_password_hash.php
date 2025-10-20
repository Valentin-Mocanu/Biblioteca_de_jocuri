<!-- Genereaza un password hash pentru parola utilizatorului (utilizat la testare) -->
<?php
echo password_hash("password", PASSWORD_DEFAULT);
?>

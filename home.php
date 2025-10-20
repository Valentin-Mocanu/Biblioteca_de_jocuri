<!-- Pagina principala -->
<?php
session_start();
include 'conectare_baza_date.php';

// Parametrii de filtrare
$search_term = isset($_GET['search']) ? $_GET['search'] : '';
$selected_gen = isset($_GET['gen']) ? $_GET['gen'] : '';

// Helper: prepared statement simplu
function stmt_get_results($conn, $sql, $params = [], $types = '')
{
    $stmt = $conn->prepare($sql);
    if (!$stmt) {
        die("Eroare prepare: " . $conn->error);
    }
    if (!empty($params)) {
        $bind_names[] = $types;
        for ($i = 0; $i < count($params); $i++) {
            $bind_names[] = &$params[$i];
        }
        call_user_func_array([$stmt, 'bind_param'], $bind_names);
    }
    $stmt->execute();
    $res = $stmt->get_result();
    $stmt->close();
    return $res;
}

// Genuri disponibile din tabelul genuri
$sql_genuri = "SELECT id_gen, nume_gen FROM genuri ORDER BY nume_gen ASC";
$result_genuri = $conn->query($sql_genuri);

// Jocuri (cu JOIN pe genuri)
$sql_jocuri = "SELECT j.id_joc, j.nume_joc, j.descriere, j.an_lansare, j.box_art, g.nume_gen
               FROM jocuri j
               INNER JOIN genuri g ON j.id_gen = g.id_gen
               WHERE j.nume_joc LIKE ?";
$params = ['%' . $search_term . '%'];
$types = 's';

if ($selected_gen !== '') {
    $sql_jocuri .= " AND g.id_gen = ?";
    $params[] = $selected_gen;
    $types .= 'i';
}

$result_jocuri = stmt_get_results($conn, $sql_jocuri, $params, $types);
?>

<!DOCTYPE html>
<html lang="ro">
<head>
    <meta charset="UTF-8"> 
    <title>Biblioteca de Jocuri.ro</title>
    <link rel="stylesheet" type="text/css" href="stilizare.css">
</head>
<body class="body">

<!-- Header-ul -->
<header>
    <div class="navigation_bar">
        <!-- Stanga: Logo -->
        <div class="nav_left">
            <h1>Biblioteca de Jocuri.ro</h1>
        </div>

        <!-- Mijloc: Mesaj user -->
        <div class="nav_center">
            <?php if (!empty($_SESSION['logged_in']) && $_SESSION['logged_in'] === true): ?>
                <p>Bine ai revenit, <strong><?php echo htmlspecialchars($_SESSION['username'] ?? $_SESSION['email']); ?></strong>!</p>
                <a href="deconectare.php">Deconectare</a>
            <?php else: ?>
                <p>Nu esti logat!</p>
            <?php endif; ?>
        </div>

        <!-- Dreapta: Logare/Inregistrare -->
        <div class="nav_right">
            <!-- Inregistrare -->
            <form action="inregistrare.php" method="POST" class="login_form">
                <input type="text" name="username" placeholder="Username" required>
                <input type="email" name="email" placeholder="Email" required>
                <input type="password" name="parola" placeholder="Parola" required>
                <button type="submit">Inregistreaza-te</button>
            </form>

            <!-- Logare -->
            <form action="conectare.php" method="post" class="login_form">
                <input type="email" name="email" placeholder="Email" required>
                <input type="password" name="password" placeholder="Parola" required>
                <button type="submit">Conecteaza-te</button>
            </form>
        </div>
    </div>
</header>

<!-- Meniul de cautare -->
<div class="search_bar">
    <form method="GET" class="search_form">
        <input type="text" name="search" placeholder="Cautare jocuri..." value="<?php echo htmlspecialchars($search_term); ?>">

        <select name="gen">
            <option value="">Selecteaza un gen</option>
            <?php
            if ($result_genuri && $result_genuri->num_rows > 0) {
                while ($row_gen = $result_genuri->fetch_assoc()) {
                    $selected = ($selected_gen == $row_gen['id_gen']) ? 'selected' : '';
                    echo "<option value='" . (int)$row_gen['id_gen'] . "' $selected>" . htmlspecialchars($row_gen['nume_gen']) . "</option>";
                }
            }
            ?>
        </select>

        <button type="submit">Cauta</button>
    </form>
</div>


<!-- Jocuri -->
<section class="game_list">
    <h2>Jocuri Recomandate:</h2>
    <div class="game_slider">
        <?php
        if ($result_jocuri->num_rows > 0) {
            while ($row = $result_jocuri->fetch_assoc()) {
                echo "<div class='game_item'>";
                $box_art = !empty($row['box_art']) ? htmlspecialchars($row['box_art']) : 'box_art/default_game.jpg';
                echo "<img src='" . $box_art . "' alt='" . htmlspecialchars($row['nume_joc']) . "'>";
                echo "<div class='game_info'>";
                echo "<h3>" . htmlspecialchars($row['nume_joc']) . " (" . htmlspecialchars($row['an_lansare']) . ")</h3>";
                echo "<p><b style='color: #e64a19'>Gen</b>: " . htmlspecialchars($row['nume_gen']) . "</p>";
                echo "<p><b style='color: #e64a19'>Descriere</b>: " . htmlspecialchars($row['descriere']) . "</p><br>";
                echo "<a href='test.php?id=" . (int)$row['id_joc'] . "'>Detalii</a>";
                echo "</div></div>";
            }
        } else {
            echo "<p>Nu exista jocuri care corespund criteriilor de cautare!</p>";
        }
        ?>
    </div>
</section>

<!-- Footer-ul -->
<footer>
    <p>2025 Biblioteca de Jocuri. Toate drepturile rezervate.</p>
</footer>
</body>
</html>
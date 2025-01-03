<?php

session_start();
include('config.php'); 


if (!isset($_SESSION['id_user'])) {
    header("location: login.php");
    exit;
}


if (isset($_GET['logout'])) {
    session_destroy();
    header("location: login.php");
    exit;
}

$query = "SELECT * FROM game";
$result = $conn->query($query);
$games = [];
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $games[] = [
            'id_game' => $row['id_game'],
            'judul' => $row['judul'],
            'deskripsi' => $row['deskripsi'],
            'gambar' => $row['gambar']
        ];
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DGame - Home</title>
    <link rel="stylesheet" href="style/style.css">
    <script>
        const games = <?= json_encode($games); ?>;
    </script>
    <script src="script.js" defer></script>
</head>
<body>
    <header>
        <h1>DGame</h1>
        <nav>
            <a href="index.php">Home</a>
            <a href="#games">Games</a>
            <a href="about.php">About</a>
            <a href="?logout=true" style="color: #e50914; font-weight: bold;">Logout</a>
        </nav>
    </header>

    <section class="hero">
        <h2>Welcome to DGame</h2>
        <p>Sebuah platform penyedia informasi game terbaik dan terupdate! </p>
    </section>

    <section class="game-section" id="games">
      <!-- diisi dengan javascript -->
    </section>

    <div id="pagination" style="text-align: center; margin: 20px 0;"></div>

    <footer>
        <p>&copy; 2024 DGame.</p>
    </footer>
</body>
</html>
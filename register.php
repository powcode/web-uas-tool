<?php
session_start();
include "config.php";

if (isset($_SESSION['id_user'])) {
    header('Location: index.php');
    exit;
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $username = $_POST['username'];
    $nama = $_POST['nama'];
    $password = $_POST['password'];
    $confirm_password = $_POST['confirm_password'];

    if ($password !== $confirm_password) {
        $error = "Password tidak sesuai, coba lagi.";
    } else {
        $hashed_password = password_hash($password, PASSWORD_BCRYPT);
        $role = 'user';


        $checkQuery = "SELECT * FROM users WHERE username = ?";
        $checkStmt = $conn->prepare($checkQuery);
        $checkStmt->bind_param('s', $username);
        $checkStmt->execute();
        $checkResult = $checkStmt->get_result();

        if ($checkResult->num_rows > 0) {
            $error = "Username sudah digunakan, coba lagi.";
        } else {
            $query = "INSERT INTO users (username, nama, password, role) VALUES (?, ?, ?, ?)";
            $stmt = $conn->prepare($query);
            $stmt->bind_param('ssss', $username, $nama, $hashed_password, $role);

            if ($stmt->execute()) {
                header('Location: login.php');
                exit;
            } else {
                $error = "Gagal Registrasi, coba lagi.";
            }
        }
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
    <link rel="stylesheet" href="style/user.css">
</head>
<body>
    <div class="form-container">
        <h2>Register</h2>
        <?php if (isset($error)): ?>
            <p class="error-message"><?= $error ?></p>
        <?php endif; ?>
        <form action="register.php" method="POST">
            <input class="form-input" type="text" name="username" placeholder="Username" required>
            <input class="form-input" type="text" name="nama" placeholder="Full Name" required>
            <input class="form-input" type="password" name="password" placeholder="Password" required>
            <input class="form-input" type="password" name="confirm_password" placeholder="Confirm Password" required>
            <button class="form-button" type="submit">Register</button>
        </form>
        <p>Apakah sudah memiliki akun? <a href="login.php">Login</a></p>
    </div>
</body>
</html>

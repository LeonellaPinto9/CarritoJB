<?php
define('DB_HOST', 'localhost');
define('DB_USER', 'root');
define('DB_PORT', 3306);
define('DB_PASS', '');
define('DB_NAME', 'db_gliese');

try {
    $conexion = new PDO(
        "mysql:host=" . DB_HOST . ";port=" . DB_PORT . ";dbname=" . DB_NAME,
        DB_USER,
        DB_PASS
    );
    $conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch(PDOException $e) {
    die("Error de conexión: " . $e->getMessage());
}
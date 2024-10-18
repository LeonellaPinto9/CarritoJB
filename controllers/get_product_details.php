<?php
// Es para Visualizar posibles errores
ini_set('display_errors', 1);
error_reporting(E_ALL);

// Log de debug
error_log("Iniciando get_product_details.php");

// Verificamos la ruta de la config
$config_path = realpath('../config/db_connect.php');
error_log("Ruta del archivo de configuración: " . $config_path);

if (!file_exists($config_path)) {
    header('HTTP/1.1 500 Internal Server Error');
    echo json_encode(['error' => 'No se puede encontrar el archivo de configuración']);
    exit;
}

require_once $config_path;

// Verificamos constantes en la base de datos
if (!defined('DB_HOST') || !defined('DB_NAME') || !defined('DB_USER') || !defined('DB_PASS')) {
    header('HTTP/1.1 500 Internal Server Error');
    echo json_encode(['error' => 'Configuración de base de datos incompleta']);
    exit;
}

// Verificamos el id del producto
if (!isset($_GET['id']) || !is_numeric($_GET['id'])) {
    header('HTTP/1.1 400 Bad Request');
    echo json_encode(['error' => 'ID de producto no válido']);
    exit;
}

$productId = intval($_GET['id']);

try {
    // Intentar conexion a la base de datos con manejo de errores detallado
    try {
        $pdo = new PDO(
            "mysql:host=" . DB_HOST . ";dbname=" . DB_NAME . ";charset=utf8mb4",
            DB_USER,
            DB_PASS,
            [
                PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
                PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
                PDO::ATTR_EMULATE_PREPARES => false
            ]
        );
    } catch (PDOException $e) {
        error_log("Error de conexión: " . $e->getMessage());
        throw new Exception('Error de conexión a la base de datos');
    }

    $query = "SELECT p.id, p.name, p.description, p.price, 
                     ps.stock,
                     GROUP_CONCAT(COALESCE(pi.image_url, '')) AS images
              FROM products p
              LEFT JOIN product_images pi ON p.id = pi.id_product
              LEFT JOIN product_stock ps ON p.id = ps.id_product
              WHERE p.id = :id
              GROUP BY p.id, p.name, p.description, p.price, ps.stock";

    $stmt = $pdo->prepare($query);
    $stmt->bindParam(':id', $productId, PDO::PARAM_INT);
    $stmt->execute();

    $product = $stmt->fetch();

    if ($product) {
        // Formateammos el producto
        $product['images'] = $product['images'] ? array_filter(explode(',', $product['images'])) : [];
        $product['id'] = intval($product['id']);
        $product['price'] = floatval($product['price']);
        $product['stock'] = intval($product['stock']);
        $product['description'] = $product['description'] ?? '';

        header('Content-Type: application/json; charset=utf-8');
        echo json_encode($product, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
    } else {
        header('HTTP/1.1 404 Not Found');
        echo json_encode(['error' => 'Producto no encontrado']);
    }
} catch (Exception $e) {
    error_log("Error en get_product_details.php: " . $e->getMessage());
    header('HTTP/1.1 500 Internal Server Error');
    echo json_encode(['error' => 'Error del servidor: ' . $e->getMessage()]);
}
?>

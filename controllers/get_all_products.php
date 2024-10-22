<?php
// get_all_products.php
require '../config/db_connect.php';

header('Content-Type: application/json');

try {
    $productManager = new ProductManager($conexion);
    $products = $productManager->getAllProducts();
    echo json_encode($products);
} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(['error' => 'Error al obtener todos los productos: ' . $e->getMessage()]);
}
?>
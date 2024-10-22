<?php
require '../config/db_connect.php';

$type = $_GET['type'] ?? '';
$id = $_GET['id'] ?? '';

$sql = "SELECT p.*, pi.image_url, c.id as category_id, sc.id as subcategory_id
        FROM products p 
        LEFT JOIN product_images pi ON p.id = pi.id_product
        LEFT JOIN categories c ON p.id_category = c.id
        LEFT JOIN subcategories sc ON p.id_subcategory = sc.id
        WHERE p.status = 1 ";

if ($type === 'category') {
    $sql .= "AND p.id_category = :id";
} elseif ($type === 'subcategory') {
    $sql .= "AND p.id_subcategory = :id";
} elseif ($type === 'label') {
    $sql .= "AND p.id_label = :id";
}

try {
    $stmt = $conexion->prepare($sql);
    if ($type !== '') {
        $stmt->bindParam(':id', $id, PDO::PARAM_INT);
    }
    $stmt->execute();

    $products = $stmt->fetchAll(PDO::FETCH_ASSOC);

    header('Content-Type: application/json');
    echo json_encode($products);
} catch (PDOException $e) {
    error_log("Error en la consulta: " . $e->getMessage());
    echo json_encode(['error' => 'Error al filtrar productos']);
}

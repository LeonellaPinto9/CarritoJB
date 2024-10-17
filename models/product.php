<?php
header('Content-Type: application/json');
include '../config/db_connect.php';

try {
    if (!isset($_POST['productId'])) {
        throw new Exception('No se proporcionó el ID del producto');
    }

    $productId = $_POST['productId'];
    
    $query = "SELECT ct.id_header, ct.position, ct.content, h.name 
              FROM content_headers ct 
              INNER JOIN headers h ON h.id = ct.id_header 
              WHERE ct.id_product = :id_product
              ORDER BY ct.position, ct.id_header";
    $stmt = $conexion->prepare($query);
    $stmt->bindParam(':id_product', $productId, PDO::PARAM_INT);
    $stmt->execute();
    $resultados = $stmt->fetchAll(PDO::FETCH_ASSOC);

    $data = [
        'headers' => [],
        'rows' => []
    ];

    foreach ($resultados as $row) {
        if (!in_array($row['name'], $data['headers'])) {
            $data['headers'][] = $row['name'];
        }
        $data['rows'][$row['position']][$row['name']] = $row['content'];
    }

    echo json_encode($data);
} catch (Exception $e) {
    echo json_encode(['error' => $e->getMessage()]);
}
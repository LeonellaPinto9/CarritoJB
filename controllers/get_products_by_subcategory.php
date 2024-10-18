<?php
header('Content-Type: application/json');
error_reporting(E_ALL);
ini_set('display_errors', 1);

try {
    require '../config/db_connect.php';
    
    $query = "SELECT p.*, pi.image_url 
              FROM products p
              LEFT JOIN product_images pi ON p.id = pi.id_product
              LEFT JOIN product_inventories pi2 ON p.id = pi2.id_product
              WHERE p.status = 1";
    
    if (isset($_GET['subcategory_id'])) {
        $subcategoryId = intval($_GET['subcategory_id']);
        
        // Usamos la tabla product_inventories para filtrar por id_subcategory
        $query .= " AND pi2.id_subcategory = :subcategoryId";
    }
    
    $stmt = $conexion->prepare($query);
    if (isset($subcategoryId)) {
        $stmt->bindParam(':subcategoryId', $subcategoryId, PDO::PARAM_INT);
    }
    $stmt->execute();
    $products = $stmt->fetchAll(PDO::FETCH_ASSOC);
    
    // Agrupar las imágenes por producto
    $groupedProducts = [];
    foreach ($products as $product) {
        $productId = $product['id'];
        if (!isset($groupedProducts[$productId])) {
            $groupedProducts[$productId] = $product;
            $groupedProducts[$productId]['images'] = [];
        }
        if ($product['image_url']) {
            $groupedProducts[$productId]['images'][] = $product['image_url'];
        }
        unset($groupedProducts[$productId]['image_url']);
    }
    
    echo json_encode(array_values($groupedProducts));
} catch (Exception $e) {
    echo json_encode(['error' => 'Error al obtener los productos: ' . $e->getMessage()]);
}
?>
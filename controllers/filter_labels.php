<?php
header('Content-Type: application/json');

try {
    // Incluir tu archivo de conexión a la base de datos
    require_once '../config/db_connect.php';

    if (!isset($_POST['label_id'])) {
        throw new Exception('No se proporcionó ID de etiqueta');
    }

    $label_id = intval($_POST['label_id']);

    // Consulta SQL mejorada
    $sql = "SELECT p.*, pi.image_url, l.name as label_name, l.color as label_color 
            FROM products p 
            LEFT JOIN product_images pi ON p.id = pi.id_product
            LEFT JOIN labels l ON p.id_label = l.id 
            WHERE p.id_label = :label_id AND p.status = 1";

    $stmt = $conexion->prepare($sql);
    $stmt->bindParam(':label_id', $label_id, PDO::PARAM_INT);
    $stmt->execute();
    $products = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Reemplazar la URL de la imagen si no está disponible
    foreach ($products as &$product) {
        if (empty($product['image_url'])) {
            $product['image_url'] = 'img/no-image.jpg'; // Ruta de la imagen predeterminada
        }
    }

    echo json_encode([
        'success' => true,
        'products' => $products
    ]);

} catch (Exception $e) {
    echo json_encode([
        'success' => false,
        'error' => $e->getMessage()
    ]);
}
?>

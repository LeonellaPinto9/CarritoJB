<!-- Topbar End -->
<?php
require_once 'config/db_connect.php';

function getSectionName($id_section)
{
    global $conexion;  // Asumiendo que $conexion es tu conexión a la base de datos

    try {
        $stmt = $conexion->prepare("SELECT name FROM sections WHERE id = :id_section");
        $stmt->bindParam(':id_section', $id_section, PDO::PARAM_INT);
        $stmt->execute();

        $result = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($result) {
            return $result['name'];
        } else {
            return "Sección Desconocida";
        }
    } catch (PDOException $e) {
        // Manejo de errores
        error_log("Error al obtener el nombre de la sección: " . $e->getMessage());
        return "Error al obtener la sección";
    }
}


try {
    // Consulta de productos
    $sql = "SELECT p.*, pi.* FROM products p INNER JOIN product_images pi ON p.id = pi.id_product";
    $stmt = $conexion->query($sql);
    $products = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Consulta de etiquetas
    $sql_labels = "SELECT * FROM labels ORDER BY name";
    $stmt_labels = $conexion->query($sql_labels);
    $labels = $stmt_labels->fetchAll(PDO::FETCH_ASSOC);

    // Consulta de categorías activas
    $sql_categories = "SELECT * FROM categories WHERE status = 1 ORDER BY name";
    $stmt_categories = $conexion->query($sql_categories);
    $categories = $stmt_categories->fetchAll(PDO::FETCH_ASSOC);

    // Consulta de subcategorías activas
    $sql_subcategories = "SELECT * FROM subcategories WHERE status = 1 ORDER BY id_category, name";
    $stmt_subcategories = $conexion->query($sql_subcategories);
    $subcategories = $stmt_subcategories->fetchAll(PDO::FETCH_ASSOC);

    // Organizar categorías y subcategorías
    $categoriesOrganized = [];
    foreach ($categories as $category) {
        $categoriesOrganized[$category['id']] = $category;
        $categoriesOrganized[$category['id']]['subcategories'] = [];
    }

    foreach ($subcategories as $subcategory) {
        if (isset($categoriesOrganized[$subcategory['id_category']])) {
            $categoriesOrganized[$subcategory['id_category']]['subcategories'][] = $subcategory;
        }
    }
} catch (PDOException $e) {
    die("Error en la consulta: " . $e->getMessage());
}
?>
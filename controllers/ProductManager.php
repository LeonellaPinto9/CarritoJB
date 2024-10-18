<?php
class ProductManager {
    private $conexion;

    public function __construct($conexion) {
        $this->conexion = $conexion;
    }

    public function getAllProducts() {
        $query = "SELECT * FROM products WHERE status = 1";
        $stmt = $this->conexion->prepare($query);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getProductsBySubcategory($subcategoryId) {
        $query = "SELECT p.* FROM products p 
                  JOIN producto_subcategory ps ON p.id = ps.producto_id 
                  WHERE ps.subcategory_id = :subcategoryId AND p.status = 1";
        $stmt = $this->conexion->prepare($query);
        $stmt->bindParam(':subcategoryId', $subcategoryId, PDO::PARAM_INT);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
}
?>
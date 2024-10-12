<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>EShopper - Bootstrap Shop Template</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
</head>
<style>
    .product-item {
    height: 400px; /* Ajusta la altura según tus necesidades */
}

.product-img img {
    height: 200px; /* Ajusta la altura según tus necesidades */
    width: 100%; /* Asegura que la imagen ocupe todo el ancho del contenedor */
    object-fit: contain; /* La imagen se adapta al contenedor sin recortarse */
}
.card-body {
    height: 150px; /* Asegura que el cuerpo de la tarjeta tenga una altura constante */
}
</style>

<body>
    <!-- Topbar Start -->
    <div class="container-fluid">
        <div class="row bg-secondary py-2 px-xl-5">
            <div class="col-lg-6 d-none d-lg-block">
                <div class="d-inline-flex align-items-center">
                    <a class="text-dark" href="">FAQs</a>
                    <span class="text-muted px-2">|</span>
                    <a class="text-dark" href="">Help</a>
                    <span class="text-muted px-2">|</span>
                    <a class="text-dark" href="">Support</a>
                </div>
            </div>
            <div class="col-lg-6 text-center text-lg-right">
                <div class="d-inline-flex align-items-center">
                    <a class="text-dark px-2" href="">
                        <i class="fab fa-facebook-f"></i>
                    </a>
                    <a class="text-dark px-2" href="">
                        <i class="fab fa-twitter"></i>
                    </a>
                    <a class="text-dark px-2" href="">
                        <i class="fab fa-linkedin-in"></i>
                    </a>
                    <a class="text-dark px-2" href="">
                        <i class="fab fa-instagram"></i>
                    </a>
                    <a class="text-dark pl-2" href="">
                        <i class="fab fa-youtube"></i>
                    </a>
                </div>
            </div>
        </div>
        <div class="row align-items-center py-3 px-xl-5">
            <div class="col-lg-3 d-none d-lg-block">
                <a href="" class="text-decoration-none">
                    <h1 class="m-0 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border px-3 mr-1">JB</span>S.A.C.</h1>
                </a>
            </div>
            <div class="col-lg-6 col-6 text-left">
                <form action="">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Search for products">
                        <div class="input-group-append">
                            <span class="input-group-text bg-transparent text-primary">
                                <i class="fa fa-search"></i>
                            </span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="col-lg-3 col-6 text-right">
                <a href="" class="btn border">
                    <i class="fas fa-heart text-primary"></i>
                    <span class="badge">0</span>
                </a>
                <a href="" class="btn border">
                    <i class="fas fa-shopping-cart text-primary"></i>
                    <span class="badge">0</span>
                </a>
            </div>
        </div>
    </div>
    <!-- Topbar End -->


    <!-- Navbar Start -->
    <?php
    require 'config/db_connect.php';

    try {
        // Consulta de productos
        $sql = "SELECT p.*, pi.* FROM products p INNER JOIN product_images pi ON p.id = pi.id_product";
        $stmt = $conexion->query($sql);
        $products = $stmt->fetchAll(PDO::FETCH_ASSOC);

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
    <div class="container-fluid">
        <div class="row border-top px-xl-5">
            

            <!-- Menú principal de navegación -->
            <div class="col-lg-9">
                <nav class="navbar navbar-expand-lg bg-light navbar-light">
                    <div class="collapse navbar-collapse justify-content-end">
                        <div class="navbar-nav">
                            <a href="" class="nav-item nav-link">Inicio</a>
                            <a href="" class="nav-item nav-link">Nosotros</a>
                            <a href="" class="nav-item nav-link">Conctactenos</a>
                            <a href="" class="nav-item nav-link">Productos</a>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
    </div>
    <!-- Navbar End -->

    <!-- Page Header Start -->
    <div class="container-fluid bg-secondary mb-5">
        <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
            <h1 class="font-weight-semi-bold text-uppercase mb-3">Our Shop</h1>
            <div class="d-inline-flex">
                <p class="m-0"><a href="">Home</a></p>
                <p class="m-0 px-2">-</p>
                <p class="m-0">Shop</p>
            </div>
        </div>
    </div>
    <!-- Page Header End -->

    <!-- Shop Start -->
    <div class="container-fluid pt-5">
        <div class="row px-xl-5">
            <!-- Shop Sidebar Start -->
            <div class="col-lg-3 col-md-12">
                <!-- CATEGORIAS -->
                <div class="border-bottom mb-4 pb-4">
                    <h5 class="font-weight-semi-bold mb-4">CATEGORIAS</h5>
                    <form>
                    <?php foreach ($categoriesOrganized as $category): ?>
                            <?php if (!empty($category['subcategories'])): ?>
                                <div class="nav-item dropdown">
                                    <a href="#" class="nav-link" data-toggle="dropdown" data-category-id="<?= htmlspecialchars($category['id']) ?>">
                                        <?= htmlspecialchars($category['name']) ?>
                                        <i class="fa fa-angle-down float-right mt-1"></i>
                                    </a>
                                    <div class="dropdown-menu position-absolute bg-secondary border-0 rounded-0 w-100 m-0">
                                        <?php foreach ($category['subcategories'] as $subcategory): ?>
                                            <a href="#" class="dropdown-item" data-subcategory-id="<?= htmlspecialchars($subcategory['id']) ?>">
                                                <?= htmlspecialchars($subcategory['name']) ?>
                                            </a>
                                        <?php endforeach; ?>
                                    </div>
                                </div>
                            <?php else: ?>
                                <a href="#" class="nav-item nav-link" data-category-id="<?= htmlspecialchars($category['id']) ?>">
                                    <?= htmlspecialchars($category['name']) ?>
                                </a>
                            <?php endif; ?>
                        <?php endforeach; ?>
                    </form>
                </div> 
                <!-- Categorias End -->

                 
            </div>
            <!-- Shop Sidebar End -->

            <!-- Shop Product Start -->
            <div class="col-lg-9 col-md-12">
                <div class="row pb-3">
                    <div class="col-12 pb-1">
                        <div class="d-flex align-items-center justify-content-between mb-4">
                            <!-- <form action="">
                                <div class="input-group">
                                    <input type="text" class="form-control" placeholder="Search by name">
                                    <div class="input-group-append">
                                        <span class="input-group-text bg-transparent text-primary">
                                            <i class="fa fa-search"></i>
                                        </span>
                                    </div>
                                </div>
                            </form>
                            <div class="dropdown ml-4">
                                <button class="btn border dropdown-toggle" type="button" id="triggerId" data-toggle="dropdown" aria-haspopup="true"
                                        aria-expanded="false">
                                            Sort by
                                        </button>
                                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="triggerId">
                                    <a class="dropdown-item" href="#">Latest</a>
                                    <a class="dropdown-item" href="#">Popularity</a>
                                    <a class="dropdown-item" href="#">Best Rating</a>
                                </div>-->
                        </div>
                    </div>
                </div>
                <div class="row pb-3" id="product-container">
                    <?php if (!empty($products)): ?>
                        <?php foreach ($products as $product): ?>
                            <div class="col-lg-4 col-md-6 col-sm-12 pb-1 product-item"
                                data-category-id="<?= isset($product['category_id']) ? $product['category_id'] : '' ?>"
                                data-subcategory-id="<?= isset($product['subcategory_id']) ? $product['subcategory_id'] : '' ?>">
                                <div class="card product-item border-0 mb-4">
                                    <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                                        <?= error_log(htmlspecialchars($product['image_url'] ?? '')) ?>
                                        <img class="img-fluid w-100" src="<?= htmlspecialchars($product['image_url'] ?? '') ?>" alt="<?= htmlspecialchars($product['name'] ?? '') ?>">
                                    </div>
                                    <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                                        <h6 class="text-truncate mb-3"><?= htmlspecialchars($product['name'] ?? '') ?></h6>
                                        <!-- <div><span><?= htmlspecialchars($product['description'] ?? '') ?></span></div> -->
                                        <div class="d-flex justify-content-center">
                                            <h6>$<?= number_format($product['price'] ?? 0, 2) ?></h6>
                                            <?php if (!empty($product['original_price'])): ?>
                                                <h6 class="text-muted ml-2"><del>$<?= number_format($product['original_price'], 2) ?></del></h6>
                                            <?php endif; ?>
                                        </div>
                                    </div>
                                    <div class="card-footer d-flex justify-content-between bg-light border">
                                        <a class="btn btn-sm text-dark p-0 view-detail-btn" data-product-id="<?= $product['id_product'] ?? '' ?>">
                                            <i class="fas fa-eye text-primary mr-1"></i>View Detail
                                        </a>
                                        <a href="#" class="btn btn-sm text-dark p-0 add-to-cart" data-product-id="<?= $product['id'] ?? '' ?>"><i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>
                                    </div>
                                </div>
                            </div>
                        <?php endforeach; ?>
                    <?php else: ?>
                        <div class="col-12">
                            <p>No se Encontraron los Productos.</p>
                        </div>
                    <?php endif; ?>
                </div>

            </div>
        </div>
        
    </div>
    </div>
    <!-- Shop Product End -->
    </div>
    </div>
    <!-- Shop End -->


    <!-- Footer Start -->
    <div class="container-fluid bg-secondary text-dark mt-5 pt-5">
        <div class="row px-xl-5 pt-5">
            <div class="col-lg-4 col-md-12 mb-5 pr-3 pr-xl-5">
                <a href="" class="text-decoration-none">
                    <h1 class="mb-4 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border border-white px-3 mr-1">Soluciones</span>Integrales</h1>
                </a>
                <p>Dolore erat dolor sit lorem vero amet. Sed sit lorem magna, ipsum no sit erat lorem et magna ipsum dolore amet erat.</p>
                <p class="mb-2"><i class="fa fa-map-marker-alt text-primary mr-3"></i>123 Street, New York, USA</p>
                <p class="mb-2"><i class="fa fa-envelope text-primary mr-3"></i>info@example.com</p>
                <p class="mb-0"><i class="fa fa-phone-alt text-primary mr-3"></i>+012 345 67890</p>
            </div>
            <div class="col-lg-8 col-md-12">
                <div class="row">
                    <div class="col-md-4 mb-5">
                        <h5 class="font-weight-bold text-dark mb-4">Quick Links</h5>
                        <div class="d-flex flex-column justify-content-start">
                            <a class="text-dark mb-2" href="index.html"><i class="fa fa-angle-right mr-2"></i>Home</a>
                            <a class="text-dark mb-2" href="shop.html"><i class="fa fa-angle-right mr-2"></i>Our Shop</a>
                            <a class="text-dark mb-2" href="detail.html"><i class="fa fa-angle-right mr-2"></i>Shop Detail</a>
                            <a class="text-dark mb-2" href="cart.html"><i class="fa fa-angle-right mr-2"></i>Shopping Cart</a>
                            <a class="text-dark mb-2" href="checkout.html"><i class="fa fa-angle-right mr-2"></i>Checkout</a>
                            <a class="text-dark" href="contact.html"><i class="fa fa-angle-right mr-2"></i>Contact Us</a>
                        </div>
                    </div>
                    <div class="col-md-4 mb-5">
                        <h5 class="font-weight-bold text-dark mb-4">Quick Links</h5>
                        <div class="d-flex flex-column justify-content-start">
                            <a class="text-dark mb-2" href="index.html"><i class="fa fa-angle-right mr-2"></i>Home</a>
                            <a class="text-dark mb-2" href="shop.html"><i class="fa fa-angle-right mr-2"></i>Our Shop</a>
                            <a class="text-dark mb-2" href="detail.html"><i class="fa fa-angle-right mr-2"></i>Shop Detail</a>
                            <a class="text-dark mb-2" href="cart.html"><i class="fa fa-angle-right mr-2"></i>Shopping Cart</a>
                            <a class="text-dark mb-2" href="checkout.html"><i class="fa fa-angle-right mr-2"></i>Checkout</a>
                            <a class="text-dark" href="contact.html"><i class="fa fa-angle-right mr-2"></i>Contact Us</a>
                        </div>
                    </div>
                    <div class="col-md-4 mb-5">
                        <h5 class="font-weight-bold text-dark mb-4">Newsletter</h5>
                        <form action="">
                            <div class="form-group">
                                <input type="text" class="form-control border-0 py-4" placeholder="Your Name" required="required" />
                            </div>
                            <div class="form-group">
                                <input type="email" class="form-control border-0 py-4" placeholder="Your Email"
                                    required="required" />
                            </div>
                            <div>
                                <button class="btn btn-primary btn-block border-0 py-3" type="submit">Subscribe Now</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="row border-top border-light mx-xl-5 py-4">
            <div class="col-md-6 px-xl-0">
                <p class="mb-md-0 text-center text-md-left text-dark">
                    &copy; <a class="text-dark font-weight-semi-bold" href="#">Your Site Name</a>. All Rights Reserved. Designed
                    by
                    <a class="text-dark font-weight-semi-bold" href="https://htmlcodex.com">HTML Codex</a>
                </p>
            </div>
            <div class="col-md-6 px-xl-0 text-center text-md-right">
                <img class="img-fluid" src="img/payments.png" alt="">
            </div>
        </div>
    </div>
    <!-- Footer End -->

    <!-- Modal Detalles Producto -->
    <div class="modal fade" id="productModal" tabindex="-1" role="dialog" aria-labelledby="productModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="productModalLabel">Nombre del Producto</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p>Descripción del producto.</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal Detalles Producto End -->

    <!-- Back to Top -->
    <a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Contact Javascript File -->
    <script src="mail/jqBootstrapValidation.min.js"></script>
    <script src="mail/contact.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>

    <!-- JS -->
    <script src="js/index.js"></script>
</body>

</html>
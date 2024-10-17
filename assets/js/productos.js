document.addEventListener('DOMContentLoaded', function() {
    // Escuchar clics en categorías y subcategorías de forma dinámica
    document.querySelector('.border-bottom').addEventListener('click', function(e) {
        // Prevenir el comportamiento por defecto de los enlaces
        e.preventDefault();

        // Verificar si el elemento tiene un data-category-id o data-subcategory-id
        var categoryId = e.target.getAttribute('data-category-id');
        var subcategoryId = e.target.getAttribute('data-subcategory-id');

        if (categoryId) {
            // Filtrar por categoría
            filterProducts('category', categoryId);
        } else if (subcategoryId) {
            // Filtrar por subcategoría
            filterProducts('subcategory', subcategoryId);
        }
    });

    // Función para realizar la solicitud y actualizar los productos
    function filterProducts(type, id) {
        fetch(`filter-products.php?type=${type}&id=${id}`)
            .then(response => response.json())
            .then(data => {
                console.log(data);  // Verificar qué datos llegan del servidor
                if (data.error) {
                    console.error('Error en el servidor:', data.error);
                    return;
                }
                if (!Array.isArray(data)) {
                    console.error('Los datos no son un arreglo válido');
                    return;
                }
                updateProductList(data); // Actualizar la lista de productos
            })
            .catch(error => {
                console.error('Error al filtrar productos:', error);
            });
    }

    // Función para actualizar la lista de productos en el DOM
    function updateProductList(products) {
        var productContainer = document.getElementById('product-container');
        if (!productContainer) {
            console.error('Contenedor de productos no encontrado');
            return;
        }
        
        if (products.length === 0) {
            productContainer.innerHTML = '<div class="col-12"><p>No se encontraron productos.</p></div>';
            return;
        }

        // Generar el HTML de los productos
        var productsHtml = products.map(product => `
            <div class="col-lg-4 col-md-6 col-sm-12 pb-1 product-item"
                data-category-id="${product.category_id || ''}"
                data-subcategory-id="${product.subcategory_id || ''}">
                <div class="card product-item border-0 mb-4">
                    <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                        <img class="img-fluid w-100" src="${product.image_url || ''}" alt="${product.name || ''}">
                    </div>
                    <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                        <h6 class="text-truncate mb-3">${product.name || ''}</h6>
                        <div class="d-flex justify-content-center">
                            <h6>$${Number(product.price || 0).toFixed(2)}</h6>
                            ${product.original_price ? `<h6 class="text-muted ml-2"><del>$${Number(product.original_price).toFixed(2)}</del></h6>` : ''}
                        </div>
                    </div>
                    <div class="card-footer d-flex justify-content-between bg-light border">
                        <a class="btn btn-sm text-dark p-0 view-detail-btn" data-product-id="${product.id_product || ''}">
                            <i class="fas fa-eye text-primary mr-1"></i>View Detail
                        </a>
                        <a href="#" class="btn btn-sm text-dark p-0 add-to-cart" data-product-id="${product.id || ''}">
                            <i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart
                        </a>
                    </div>
                </div>
            </div>
        `).join('');

        productContainer.innerHTML = productsHtml; // Reemplazar el HTML con los nuevos productos
    }
});
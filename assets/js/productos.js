function loadProducts(subcategoryId, subcategoryName) {
    const productContainer = document.getElementById('product-container');
    const loadingSpinner = document.getElementById('loading-spinner');
    
    if (loadingSpinner) loadingSpinner.classList.remove('d-none');
    if (productContainer) productContainer.classList.add('opacity-50');


    fetch(`controllers/get_products_by_subcategory.php${subcategoryId ? `?subcategory_id=${subcategoryId}` : ''}`)
        .then(response => response.json())
        .then(data => {
            if (data.error) {
                showError(data.error);
            } else if (Array.isArray(data) && data.length > 0) {
                displayProducts(data, subcategoryName);
            } else {
                showMessage('No hay productos disponibles en esta categoría');
            }
        })
        .catch(error => {
            console.error('Error:', error);
            showError('Error al cargar los productos. Por favor, intente de nuevo.');
        })
        .finally(() => {
            if (loadingSpinner) loadingSpinner.classList.add('d-none');
            if (productContainer) productContainer.classList.remove('opacity-50');
        });
}

function openProductModal(productId) {
    const modalLabel = document.getElementById('productModalLabel');
    const modalBody = document.querySelector('#productModal .modal-body');
    
    modalLabel.textContent = 'Cargando...';
    modalBody.innerHTML = '<div class="text-center"><div class="spinner-border" role="status"><span class="sr-only">Cargando...</span></div></div>';
    
    $('#productModal').modal('show');

    fetch(`controllers/get_product_details.php?id=${productId}`)
        .then(response => {
            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }
            return response.json();
        })
        .then(product => {
            if (product.error) {
                throw new Error(product.error);
            }
            
            modalLabel.textContent = product.name || 'Producto';
            modalBody.innerHTML = `
            <div class="product-details">
                ${product.images && product.images.length > 0 
                    ? `<img src="${product.images[0]}" alt="${product.name}" class="img-fluid mb-3">`
                    : '<img src="img/no-image.jpg" alt="No imagen disponible" class="img-fluid mb-3">'}
                <div class="card mt-3">
                    <div class="card-body">
                        <h5 class="card-title">${product.name || 'Producto'}</h5>
                        <p class="card-text description">${product.description || 'Sin descripción'}</p>
                        <p class="price"><strong>Precio:</strong> $${parseFloat(product.price).toFixed(2)}</p>
                        <p class="stock"><strong>Stock:</strong> ${product.stock || 0}</p>
                    </div>
                </div>
            </div>
        `;
        
        })
        .catch(error => {
            console.error('Error:', error);
            modalLabel.textContent = 'Error';
            modalBody.innerHTML = `
                <div class="alert alert-danger">
                    Error al cargar los detalles del producto: ${error.message}
                </div>
            `;
        });
}

function displayProducts(products, subcategoryName) {
    const productContainer = document.getElementById('product-container');
    const sectionTitle = document.getElementById('current-section');
    
    if (sectionTitle) {
        sectionTitle.textContent = subcategoryName;
    }
    
    productContainer.innerHTML = products.map(product => `
        <div class="col-lg-4 col-md-6 col-sm-12 pb-1">
            <div class="card product-item border-0 mb-4">
                <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                    <img class="img-fluid w-100" 
                         src="${product.images[0] || 'img/no-image.jpg'}" 
                         alt="${product.name}"
                         onerror="this.src='img/no-image.jpg'">
                </div>
                <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                    <h6 class="text-truncate mb-3" style="color: black;">${product.name}</h6>
                    <p class="mb-3" style="color: black;">${product.description}</p>
                    <div class="d-flex justify-content-center">
                        <h6 style="color: gray;">$${parseFloat(product.price).toFixed(2)}</h6>
                    </div>
                </div>
                <div class="card-footer d-flex justify-content-between bg-light border">
                    <button onclick="openProductModal(${product.id})" class="btn btn-sm text-dark p-0">
                        <i class="fas fa-eye text-primary mr-1"></i>Ver Detalle
                    </button>
                    <button onclick="addToCart(${product.id})" class="btn btn-sm text-dark p-0" ${product.stock > 0 ? '' : 'disabled'}>
                        <i class="fas fa-shopping-cart text-primary mr-1"></i>
                        ${product.stock > 0 ? 'Agregar al Carrito' : 'Sin Stock'}
                    </button>
                </div>
            </div>
        </div>
    `).join('');
}

function showError(message) {
    const productContainer = document.getElementById('product-container');
    productContainer.innerHTML = `
        <div class="col-12">
            <div class="alert alert-danger text-center">
                ${message}
            </div>
        </div>
    `;
}

function showMessage(message) {
    const productContainer = document.getElementById('product-container');
    productContainer.innerHTML = `
        <div class="col-12">
            <div class="alert alert-info text-center">
                ${message}
            </div>
        </div>
    `;
}

// Ejecutar al cargar la página
document.addEventListener('DOMContentLoaded', () => {
    loadProducts(null, 'Todos los productos');
    
    document.querySelectorAll('.dropdown-item').forEach(item => {
        item.addEventListener('click', (e) => {
            e.preventDefault();
            const subcategoryId = e.target.dataset.subcategoryId;
            const subcategoryName = e.target.textContent.trim();
            loadProducts(subcategoryId, subcategoryName);
        });
    });
});

document.addEventListener('DOMContentLoaded', () => {
    loadProducts(null, 'Todos los productos');
    
    document.querySelectorAll('.dropdown-item').forEach(item => {
        item.addEventListener('click', (e) => {
            e.preventDefault();
            const subcategoryId = e.target.dataset.subcategoryId;
            const subcategoryName = e.target.textContent.trim();
            loadProducts(subcategoryId, subcategoryName);
        });
    });

    document.querySelector('.border-bottom').addEventListener('click', function(e) {
        e.preventDefault();
        var categoryId = e.target.getAttribute('data-category-id');
        var subcategoryId = e.target.getAttribute('data-subcategory-id');

        if (categoryId) {
            filterProducts('category', categoryId);
        } else if (subcategoryId) {
            filterProducts('subcategory', subcategoryId);
        }
    });

        function filterProducts(type, id) {
            fetch(`filter-products.php?type=${type}&id=${id}`)
                .then(response => response.json())
                .then(data => {
                    console.log(data);
                    if (data.error) {
                        console.error('Error en el servidor:', data.error);
                        return;
                    }
                    if (!Array.isArray(data)) {
                        console.error('Los datos no son un arreglo válido');
                        return;
                    }
                    updateProductList(data);
                })
                .catch(error => {
                    console.error('Error al filtrar productos:', error);
                });
        }

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

            productContainer.innerHTML = productsHtml;
        }
    });
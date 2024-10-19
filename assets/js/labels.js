$(document).ready(function () {
    // Filtro por etiquetas
    $('.label-filter').on('click', function (e) {
        e.preventDefault();
        const labelId = $(this).data('label-id');

        // Mostrar indicador de carga
        $('#product-container').html('<div class="text-center">Cargando...</div>');

        // Añadir clase activa a la etiqueta seleccionada
        $('.label-filter').removeClass('active');
        $(this).addClass('active');

        $.ajax({
            url: 'controllers/filter_labels.php', // Ruta a tu controlador de filtrado
            type: 'POST',
            dataType: 'json',
            data: { label_id: labelId },
            success: function (response) {
                if (response.success) {
                    displayProducts(response.products);
                    $('#current-section').text('Productos relacionados con la etiqueta');
                } else {
                    showError('Error: ' + (response.error || 'Error desconocido'));
                }
            },
            error: function (xhr, status, error) {
                console.error('Error en la petición:', error);
                showError('Error al conectar con el servidor');
            }
        });
    });

    // Función para mostrar productos
    function displayProducts(products, subcategoryName) {
        const productContainer = document.getElementById('product-container');
        const sectionTitle = document.getElementById('current-section');

        if (sectionTitle) {
            sectionTitle.textContent = subcategoryName || 'Productos'; // Cambia el nombre de la sección si se proporciona
        }

        productContainer.innerHTML = products.map(product => `
        <div class="col-lg-4 col-md-6 col-sm-12 pb-1">
            <div class="card product-item border-0 mb-4">
                <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                    <img class="img-fluid w-100" 
                        src="${product.image_url || 'img/no-image.jpg'}" 
                        alt="${product.name || 'Sin nombre'}"
                        onerror="this.src='img/no-image.jpg'">
                </div>
                <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                    <h6 class="text-truncate mb-3 product-name">${product.name || 'Sin nombre'}</h6>
                    <p class="mb-3">${product.description || 'Sin descripción'}</p>
                    <div class="d-flex justify-content-center">
                        <h6 class="product-price">$${parseFloat(product.price || 0).toFixed(2)}</h6>
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

    // Función para mostrar errores
    function showError(message) {
        $('#product-container').html(`
            <div class="alert alert-danger">
                ${message}
            </div>
        `);
    }
});

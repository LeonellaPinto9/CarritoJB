$(document).ready(function () {
    // Manejar clic en categoría
    $('[data-category-id]').click(function (e) {
        e.preventDefault();
        var categoryId = $(this).data('category-id');
        filterProducts(categoryId);
    });

    // Manejar clic en subcategoría
    $('[data-subcategory-id]').click(function (e) {
        e.preventDefault();
        var subcategoryId = $(this).data('subcategory-id');
        filterProducts(null, subcategoryId);
    });

    function filterProducts(categoryId, subcategoryId) {
        $('.product-item').each(function () {
            var $product = $(this);
            var productCategoryId = $product.data('category-id');
            var productSubcategoryId = $product.data('subcategory-id');

            if ((categoryId && productCategoryId == categoryId) ||
                (subcategoryId && productSubcategoryId == subcategoryId) ||
                (!categoryId && !subcategoryId)) {
                $product.show();
            } else {
                $product.hide();
            }
        });
    }

    // Manejar clic en "Add To Cart"
    $('.add-to-cart').click(function (e) {
        e.preventDefault();
        var productId = $(this).data('product-id');
        // Aquí puedes agregar la lógica para añadir el producto al carrito
        console.log('Adding product ' + productId + ' to cart');
    });
});

document.addEventListener('DOMContentLoaded', function () {
    const viewDetailButtons = document.querySelectorAll('.view-detail-btn');
    viewDetailButtons.forEach(button => {
        button.addEventListener('click', function () {
            const productId = this.getAttribute('data-product-id');
            $.ajax({
                url: 'model/product.php',
                method: 'POST',
                data: { productId: productId },
                dataType: 'json',
                success: function (response) {
                    const tableHtml = generateTable(response);
                    $('#productModal .modal-body').html(tableHtml);
                },
                error: function (xhr, status, error) {
                    console.error('Error al cargar los datos del producto:', error);
                }
            });
            $('#productModal').modal('show');
        });
    });

    function generateTable(data) {
        let tableHtml = '<table class="table"><thead><tr>';

        // Generar encabezados
        data.headers.forEach(header => {
            //tableHtml += `<th>${header}</th>`;
            
        });
        tableHtml += '</tr></thead><tbody>';

        // Generar filas
        Object.keys(data.rows).forEach(position => {
            tableHtml += '<tr>';
            //tableHtml += `<td>${position}</td>`;
            data.headers.forEach(header => {
                tableHtml += `<td>${data.rows[position][header] || ''}</td>`;
            });
            tableHtml += '</tr>';
        });
        tableHtml += '</tbody></table>';
        return tableHtml;
    }
});



function addItem(evt) {

    var productId = $(this).attr('id');

    var route = '/products';

    if ( $(this).hasClass('prod_page') ) {
        route = '/products/' + productId;
    }

    var data = {
        productId: productId
    };

    $.post(route,
        data,
        function(evt) {
            alert("Item added to cart!");
    });
}


$('.add_to_cart').on('click', addItem);
function addItem(evt) {

    var productId = $(this).attr('id');
    var data = {
        productId: productId
    };
    $.post('/products',
        data,
        function(evt) {
            alert("Item added to cart!");
    });
}


$('.add_to_cart').on('click', addItem);
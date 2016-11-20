"use strict";

$(document).ready(function() {

    //event handler for "Add to Cart" buttons
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

    //event binding for "Add to Cart" buttons
    $('.add_to_cart').on('click', addItem);

    //event handler for Filters at top of All Products page
    function showFilters(evt) {

        $('.filters').removeClass('hidden');
        $('.nofilters').addClass('hidden');
    }

    //event handler for Filters at top of All Products page
    function hideFilters(evt) {

        $('.filters').addClass('hidden');
        $('.nofilters').removeClass('hidden');
    }

    //event binding for filters at top of All Products page
    $('.showfilters').on('click', showFilters);
    $('.hidefilters').on('click', hideFilters);

    //
    function toggleFilter(evt) {

        if ($(this).hasClass('bright-category')) {
            $(this).removeClass('bright-category');
        } else {
            $(this).addClass('bright-category');
        }
    }

    $('.category').on('click', toggleFilter);
    // //populating dropdown fields in Shopping Cart table
    // $('#cart-table select').html('<option value=1>1</option><option value=2>2</option><option value=3>3</option><option value=4>4</option><option value=5>5</option><option value=6>6</option><option value=7>7</option><option value=8>8</option><option value=9>9</option><option value=10>10</option>');

    // //setting default value for each dropdown
    // $('#cart-table select').each( function() {
    //     var prodQty = $(this).data('qty');
    //     var children = $(this).children('[value=' + prodQty + ']').attr('selected', 'selected');
    // });

    // //event handler for shopping cart dropdowns
    // function updateTotal(evt) {
    //     var selectId = $(this).attr('id');
    //     var selectQty = $('#' + selectId).val();
    //     var updateData = {'product_id': selectId,
    //                       'qty': selectQty};
    //     console.log(updateData);
    //     $.post('/cart', updateData, function() {
    //         alert('Cart updated!');
    //     });
    // }

    // //event binding for shopping cart dropdowns
    // $('#cart-table select').on('change', updateTotal);

    });



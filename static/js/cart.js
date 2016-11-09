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

//angular code below!

angular.module('cart', []).controller('CartController', function($scope, $http) {

    $http.get("/customer.json").then(function(response) {
        $scope.customer = response.data;
    });

    $http.get("/cart.json").then(function(response) {
        $scope.cart = response.data.cart;
        $scope.contents = response.data.contents;
        $scope.cartWeight = $scope.getWeight($scope.contents, $scope.cart);
        $scope.cartPrice = $scope.getPrice($scope.contents, $scope.cart);
    });

    $scope.getPrice = function(contents, cart) {
        var price = 0;
        for (var i = 0; i < contents.length; i++) {
            price = price + cart[contents[i]].price * cart[contents[i]].qty;
        }
        return price;
    }

    $scope.getWeight = function(contents, cart) {
        var weight = 0;
        var fudged = false;
        var prodWeight = 0;
        for (var i = 0; i < contents.length; i++) {
            if (cart[contents[i]].per_unit === "lb" || cart[contents[i]].per_unit === "oz") {
                prodWeight = cart[contents[i]].price / cart[contents[i]].price_per * cart[contents[i]].qty;
                console.log(prodWeight);
                if (cart[contents[i]].per_unit === "oz") {
                    prodWeight = prodWeight / 16;
                }
            } else {
                fudged = true;
            }
            weight = weight + prodWeight;
        }

        return {'weight': $scope.convertUnits(weight), 'fudged': fudged};
    };

    $scope.convertUnits = function(totalWeight) {
        var lbs = Math.floor(totalWeight);
        var oz = (totalWeight - lbs) * 16;

        return {'lb': lbs, 'oz': oz.toFixed(2)};
    };

});


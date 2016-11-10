"use strict";

//angular code below!

angular.module('cart', []).controller('CartController', function($scope, $http) {

    $scope.dropdownOptions = [1,2,3,4,5,6,7,8,9,10];

    // $scope.getCart() {}

    $http.get("/customer.json").then(function(response) {
        $scope.customer = response.data;
    });

    $http.get("/cart.json").then(function(response) {
        $scope.cart = response.data.cart;
        $scope.contents = response.data.contents;
        $scope.cartWeight = $scope.getWeight($scope.contents, $scope.cart);
        $scope.cartPrice = $scope.getPrice($scope.contents, $scope.cart);
    });

    $http.get("/recipes.json").then(function(response) {
        $scope.recipes = response.data.results;
    });

    $scope.getPrice = function(contents, cart) {
        var price = 0;
        for (var i = 0; i < contents.length; i++) {
            price = price + cart[contents[i]].price * cart[contents[i]].qty;
        }
        return price;
    };

    $scope.getWeight = function(contents, cart) {
        var weight = 0;
        var fudged = false;
        var prodWeight = 0;
        for (var i = 0; i < contents.length; i++) {
            if (cart[contents[i]].per_unit === "lb" || cart[contents[i]].per_unit === "oz") {
                prodWeight = cart[contents[i]].price / cart[contents[i]].price_per * cart[contents[i]].qty;
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

    $scope.updateCart = function(product) {
        
        var product_id = product.product_id;
        var qty = product.qty;
        console.log("Quantity is " + qty);
        console.log("Product id is " + product_id);
        var payload = {"product_id": product_id, "qty": qty};
        $http.post("/update-cart", payload).then(function(response) {
            console.log(response);
        });
    };

    $scope.deleteProd = function(product) {

        var product_id = product.product_id;
        var payload = {"product_id": product_id};
        $http.post("/delete-product", payload).then(function(response) {
            console.log(response);
        })

    }

});
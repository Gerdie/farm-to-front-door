"use strict";

//cart.html angular

(function() {
    var app = angular.module("cart", []);

    app.controller('CartController', function($scope, $http) {

        $scope.dropdownOptions = [1,2,3,4,5,6,7,8,9,10];

        // $scope.pickups = {'Alameda': {name: 'Alameda', address: '600 Alameda St', zipcode: 94458}, 'Nob Hill': {name: 'Nob Hill', address: '1 Nob Hill Lane', zipcode: 94549}, 'Oakland': {name: 'Oakland', address: '75 Oakland Street', zipcode: 98864}};

        // $scope.getCustomer = function() {
        //     $http.get("/customer.json").then(function(response) {
        //         $scope.customer = response.data;
        //     });
        // };

        $http.get("/customer.json").then(function(response) {
            $scope.customer = response.data;
        });

        $http.get("/cart.json").then(function(response) {
            $scope.cart = response.data.cart;
            $scope.contents = response.data.contents;
            $scope.cartWeight = $scope.getWeight($scope.contents, $scope.cart);
            $scope.cartPrice = $scope.getPrice($scope.contents, $scope.cart);
        });

        // $http.get("/recipes.json").then(function(response) {
        //     $scope.recipes = response.data.results;
        // });

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
            console.log(product);
            var qty = parseInt(product.qty);
            console.log("Quantity is " + qty);
            console.log("Product id is " + product_id);
            var payload = {"product_id": product_id, "qty": qty};
            $http.post("/update-cart", payload).then(function(response) {
                $scope.cartWeight = $scope.getWeight($scope.contents, $scope.cart);
                $scope.cartPrice = $scope.getPrice($scope.contents, $scope.cart);
            });
        };

        $scope.deleteProd = function(product) {

            var product_id = product.product_id;
            var payload = {"product_id": product_id};
            $http.post("/delete-product", payload).then(function(response) {
                console.log(response);
                console.log(product_id);
                console.log($scope.contents);
                var index = $scope.contents.indexOf(product_id.toString());
                delete $scope.cart[product_id];
                $scope.contents.splice(index, 1);
                console.log($scope.contents);
                $scope.cartWeight = $scope.getWeight($scope.contents, $scope.cart);
                $scope.cartPrice = $scope.getPrice($scope.contents, $scope.cart);
            });
        };
    });


    // RecipeController
    app.controller("RecipeController", function($http, $scope) {
        
        $http.get("/recipes.json").then(function(response) {
            $scope.recipes = response.data.results;
        });

        $scope.saveRecipe = function(recipe) {
            $http.post("/save-recipe", {"recipe": recipe}).then(function(response) {
                console.log(response);
            });
        };

    });

    //FormController
    app.controller("FormController", function($scope, $http, $window) {

        $scope.deliveryForm = {delivery: "", pickup: "", which_address: "", address: "", zipcode: "", state: ""};

        $http.get("/pickups.json").then(function(results) {
            $scope.pickups = results.data.locations;
        });

        $scope.validateDelivery = function() {

            var data = {};
            data.delivery = $scope.deliveryForm.delivery;
            // debugger;
            if (data.delivery === 'delivery') {
                var whichAddress = $scope.deliveryForm.which_address;
                if (whichAddress === 'my_address') {
                    data.address = {'street': $scope.customer.street_address, 'zipcode': $scope.customer.zipcode};
                } else if (whichAddress === 'new_address' && $scope.deliveryForm.address && $scope.deliveryForm.zipcode) {
                    data.address = {'street': $scope.deliveryForm.address, 'zipcode': $scope.deliveryForm.zipcode};
                } else {
                    return "Please enter an address for delivery";
                }

            } else if (data.delivery === 'pickup') {
                var pickup = $scope.deliveryForm.pickup;
                console.log("pickup: " + pickup);
                if (pickup) {
                    data.address = {'street': pickup.address, 'zipcode': pickup.zipcode};
                    console.log("data.address: " + data.address);
                } else {
                    return "Please choose a pickup location";
                }
            }

            $http.post('/cart', data).then( function(response) {
                console.log(response);
                if (response.data === "Success") {
                    $window.location.href = '/checkout';
                }
            });
        };
    });
})();
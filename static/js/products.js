//filter.html angular
(function() {
    var prods = angular.module("prods", []);

    prods.controller('ProductsController', function($scope, $http) {

        $scope.prods = {"filtered_prods": {}, "categories": [], "filters": []};
        $scope.showfilters = false;

        $http.get("/filters.json", {"filters": $scope.prods.filters}).then( function(response) {
            $scope.prods.filtered_prods = response.data.products;
            $scope.prods.categories = response.data.categories;
            // console.log($scope.prods);
        });

        $scope.toggleFilter = function(category) {
            console.log("at beginning" + $scope.prods.filters);
            var catIndex = $scope.prods.filters.indexOf(category);
            if (catIndex != -1) {
                console.log("this is the index: " + catIndex);
                $scope.prods.filters.splice(catIndex, 1);
            } else {
                $scope.prods.filters.push(category);
            }
            console.log($scope.prods.filters);

            $http.get("/filters.json", {params: {"filters": $scope.prods.filters}}).then( function(response) {
                $scope.prods.filtered_prods = response.data.products;
                console.log("finished");
            });
        };

        $scope.addToCart = function(productId) {
            $http.post("/add-item", {"product_id": productId}).then(function(response) {
                console.log(response);
                // alert("Added item to cart!");
            });
        };

    });
})();
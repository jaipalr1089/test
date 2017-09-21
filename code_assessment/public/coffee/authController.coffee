app.controller "authController", ["$scope", "$location", "$http", ($scope, $location, $http) ->


    $scope.signup = ->
        data = {
            username: $scope.username,
            password: $scope.password
        }
        $http.post("http://localhost:8000/api/signup", data)
            .then (data) -> 
                alert("registered successfully")
                $location.path('/signin')
            .catch (data) ->
                alert("Error in registering");

            

    $scope.signin = ->
        data = {
            username: $scope.username,
            password: $scope.password
        }
        $http.post("http://localhost:8000/api/login", data)
            .then (data) ->
                alert("successfully logged in");
                $location.path('/home')
            .catch (data) ->
                alert("Error in signing in");


                
    $scope.login = ->
        $location.path('/signin')

]
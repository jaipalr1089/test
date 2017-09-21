app = angular.module 'codeAssess', ["ngResource", "ngRoute"]
app.config ($routeProvider, $locationProvider) ->
    $routeProvider
      .when '/',
        templateUrl: '/auth'
        controller: 'authController'
      .when '/signin', 
        templateUrl: '/signin',
        controller: 'authController'
      .when '/home', 
        templateUrl: '/home',
        controller: 'authController'  
      .otherwise
        redirectTo: '/'
	# $locationProvider.html5Mode true      

BookRouter = angular.module("BookRouter", [
  "ngRoute"
])

class Router
  
  constructor: (@routeProvider, @locationProvider)->
    console.log("Initialized Router")
    console.log("Setting Up")
    @routeProvider
      .when "/",
        templateUrl: "/book_templates",
        controller: "BooksCtrl as books"
 #     .when "/books",
 #       templateUrl: "/book_templates",
 #       controller: "BooksCtrl as books"

    @locationProvider.html5Mode(true)

BookRouter.config(["$routeProvider", "$locationProvider", Router])

BookRouter.config ["$httpProvider", ($httpProvider)->
  $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
]
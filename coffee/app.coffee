'use strict'
@kitd = kitd = angular.module 'kitd', ['ngRoute', 'ngTouch']

#kitd.run()

kitd.config ['$routeProvider', ($routeProvider) ->
  $routeProvider
    .when '/',
      templateUrl: 'main.jade'
      controller : 'Main'

    .when '/team/',
      templateUrl: 'contents/team.jade'
      controller : 'Team'

    .when '/spy/',
      templateUrl: 'contents/spy.jade'
      controller: 'Spy'
]



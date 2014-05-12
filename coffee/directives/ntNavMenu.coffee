'use strict'
kitd.directive 'ntNavMenu', ['$location', 'LABEL', ($location, LABEL) ->
  return {
    restrict: 'E'
    templateUrl: 'contents/navMenu.jade'
    link: ($scope, element, attrs) ->
      links = element.find('a')
      activeClass = attrs.navActiveClass || LABEL.modifier.active
      routePattern = /^#[^/]*/
      urlMap = {}

      _.each links, (link) ->
        _link = angular.element(link)
        url = _link.attr('href')
        urlMap[url.replace(routePattern, '')] = _link

      $scope.$on '$routeChangeStart', ()->
        _pathLink = urlMap[$location.path()]
        links.removeClass(activeClass)
        return unless _pathLink
        _pathLink.addClass(activeClass)
        @
  }
]

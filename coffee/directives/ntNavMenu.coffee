'use strict'
kitd.directive 'ntNavMenu', ['$location', 'LABEL', ($location, LABEL) ->
  return {
    restrict: 'E'
    templateUrl: 'contents/navMenu.jade'
    link: ($scope, element, attrs) ->
      links = element.find('a')
      $links = angular.element(links)
      activeClass = attrs.navActiveClass || LABEL.modifier.active
      routePattern = /^#[^/]*/
      urlMap = {}

      _.each links, (link) ->
        $link = angular.element(link)
        url = $link.attr('href')
        urlMap[url.replace(routePattern, '')] = $link

      $scope.$on '$routeChangeStart', ()->
        $pathLink = urlMap[$location.path()]
        $links.removeClass(activeClass)
        return unless $pathLink
        $pathLink.addClass(activeClass)
        @
  }
]

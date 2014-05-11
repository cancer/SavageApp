'use strict'
kitd.directive 'ntNavMenu', ($location) ->
  return {
    restrict: 'E'
    templateUrl: 'contents/navMenu.jade'
    link: ($scope, element, attrs) ->
      links = element.find('a')
      $links = $(links)
      activeClass = attrs.navActiveClass || 'active'
      routePattern = /^#[^/]*/
      urlMap = {}

      _.each links, (link) ->
        $link = angular.element(link)
        url = $link.attr('href')
        urlMap[url.replace(routePattern, '')] = $link

      $scope.$on '$routeChangeStart', ()->
        $pathLink = urlMap[$location.path()]
        if !$pathLink
          return
        $links.removeClass(activeClass)
        $pathLink.addClass(activeClass)
        @
  }

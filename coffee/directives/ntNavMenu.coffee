'use strict'
kitd.directive 'ntNavMenu', ['$location', 'LABEL', ($location, LABEL) ->
  return {
    restrict: 'E'
    templateUrl: 'contents/navMenu.jade'
    link: (scope, element, attrs) ->
      links = element.find('a')
      activeClass = attrs.navActiveClass || LABEL.modifier.active
      routePattern = /^#[^/]*/
      urlMap = {}

      #ラチェットが反応するので自前でhashを変更する
      links.on 'click', (e)->
        e.preventDefault()
        location.hash = angular.element(this).attr('data-href')

      _.each links, (link) ->
        _link = angular.element(link)
        url = _link.attr('data-href')
        urlMap[url.replace(routePattern, '')] = _link

      scope.$on '$routeChangeStart', ()->
        _pathLink = urlMap[$location.path()]
        links.removeClass(activeClass)
        return unless _pathLink
        _pathLink.addClass(activeClass)
        @
  }
]

'use strict'
kitd.directive 'ntPreventTap', () ->
  return (scope, element, attrs) ->
    preventDefault = (e) ->
      e.preventDefault()
      e.stopPropagation()

    element.on 'touchstart click', preventDefault


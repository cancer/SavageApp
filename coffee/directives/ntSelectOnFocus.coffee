'use strict'
kitd.directive 'ntSelectOnFocus', () ->
  return (scope, element, attrs) ->
    element.on 'focus', () ->
      @selectionStart = 0
      @selectionEnd = @value.length
      @

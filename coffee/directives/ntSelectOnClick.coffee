'use strict'
kitd.directive 'ntSelectOnClick', () ->
  return (scope, element, attrs) ->
    element.on 'click', () ->
      textarea = $('.mail-template__textarea').find('textarea')
      textarea[0].focus()
      @

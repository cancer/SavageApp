'use strict'
kitd.directive 'selectOnClick', () ->
  return (scope, element, attrs) ->
    element.on 'click', () ->
      textarea = $('.mail-template__textarea').find('textarea')
      textarea[0].focus()
      @

kitd.directive 'selectOnFocus', () ->
  return (scope, element, attrs) ->
    element.on 'focus', () ->
      @selectionStart = 0
      @selectionEnd = @value.length
      @

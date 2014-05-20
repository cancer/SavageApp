'use strict'
kitd.factory 'Member', ['Model', (Model) ->
  class Member extends Model
    isAwaken: () ->
      @get 'isAwaken'

    toggleAwaken: () ->
      isAwaken = !@get 'isAwaken'
      @set _.extend @data, isAwaken: isAwaken

]

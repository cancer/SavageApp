'use strict'
#Model
kitd.factory 'Spy', () ->
  class Spy
    constructor: (member) ->
      @data = {}
      @set(member) if member?

    set: (member) ->
      @data = _.extend {isSpy: true}, member
      @

    get: (attr) ->
      @data[attr]


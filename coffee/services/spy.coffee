'use strict'
#Model
kitd.factory 'kitd.Spy', () ->
  class Spy
    constructor: (member) ->
      @data = {}
      @set(member) if member?

    set: (member) ->
      @data = _.extend {}, member, {isSpy: true}
      @

    get: (attr) ->
      @data[attr]


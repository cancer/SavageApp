'use strict'
#Model
kitd.factory 'Spy', () ->
  class Spy
    constructor: (member) ->
      @data = {}
      @set(member) if member?

    set: (member) ->
      member.isSpy = true
      @data = member
      @

    get: (attr) ->
      @data[attr]


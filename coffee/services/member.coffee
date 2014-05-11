'use strict'
#Model
kitd.factory 'Member', [() ->
  class Member
    constructor: (member) ->
      @data = {}
      @set member if member?

    set: (member) ->
      @data = member
      @

    get: (attr) ->
      @data[attr]
]

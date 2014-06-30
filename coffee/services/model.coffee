'use strict'
kitd.factory 'Model', [() ->
  class Model
    constructor: (data = {}, options) ->
      @data = {}
      @set data

    set: (key, val, options) ->
      return unless key?
      if typeof key is 'object'
        @data = key
        options = val
      else
        @data[key] = val
      @

    get: (key) ->
      @data[key]

    toObject: ->
      _.clone @data
]


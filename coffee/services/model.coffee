'use strict'
kitd.factory 'kitd.Model', [() ->
  class Model
    constructor: (data = {}, options) ->
      @set data

    set: (key, val, options) ->
      return unless key?
      if typeof key is 'object'
        @data = key
        options = val
      else
        @data[key] = options
      @

    get: (key) ->
      @data[key]
]


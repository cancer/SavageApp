'use strict'
kitd.factory 'Model', [() ->
  class Model
    constructor: (data) ->
      @data = {}
      @set data if data?

    set: (data) ->
      @data = data
      @

    get: (attr) ->
      @data[attr]
]


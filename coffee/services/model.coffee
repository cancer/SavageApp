'use strict'
kitd.factory 'Model', [() ->
  class Model
    constructor: (data = {}) ->
      @set data

    set: (data) ->
      @data = data
      @

    get: (attr) ->
      @data[attr]
]


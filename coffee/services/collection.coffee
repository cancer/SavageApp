'use strict'
kitd.factory 'Collection', [() ->
  class Spies
    constructor: (models) ->
      @models = []
      @set models if models?

    set: (models) ->
      _.each members, (member) =>
        @push member

    push: (model) ->
      @models.push model

    reset: (models) ->
      @models = []
      @set models if models?

    get: () ->
      return undefined unless @models?
      @models

    getAt: (index) ->
      return undefined unless @models?
      @models[index]

    filter: (attr, val) ->
      return undefined unless @models?
      _.filter @models, (model) ->
        model[attr] == val

]


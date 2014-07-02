'use strict'
kitd.factory 'Collection', [() ->
  class Collection
    constructor: (models, options) ->
      @models = []
      @model = options.model if options?.model?
      @set models, options

    set: (models, options) ->
      return unless models
      _.each models, (model, idx, models) =>
        return @push new @model model, options unless model instanceof @model
        @push model

    push: (model) ->
      @models.push model

    reset: (models) ->
      return unless models
      @models = []
      @set models

    get: () ->
      return undefined unless @models?
      @models

    getData: ->
      return undefined unless @models?
      dataList = _.map @models, (model) ->
        model.toObject()
      dataList

    getByName: (name) ->
      @filter('name', name)[0]

    getByLabel: (name) ->
      @filter('name_en', name)[0]

    getAt: (index) ->
      return undefined unless @models?
      @models[index]

    filter: (attr, val) ->
      return undefined unless @models?
      _.filter @models, (model) ->
        model.get(attr) == val

]


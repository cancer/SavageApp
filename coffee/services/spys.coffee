'use strict'
#Collection
kitd.factory 'spys', ['Spy', (Spy) ->
  class Spys
    constructor: () ->
      @models = []

    set: (members) ->
      _.each members, (member) =>
        @push member

    push: (member) ->
      spy = new Spy(member) unless member instanceof Spy
      @models.push spy

    getAt: (index) ->
      @models[index]

    filter: (attr, val) ->
      _.filter @models, (spy) ->
        spy.name == val.name

    assignSpy: (members) ->
      spy = _.sample members
      @push spy

  new Spys()
]


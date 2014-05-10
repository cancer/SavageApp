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

    reset: (members) ->
      @models = []
      @set members if members?

    assignSpy: (members) ->
      spy = _.sample members
      @push spy

    get: () ->
      return undefined unless @models?
      @models

    getAt: (index) ->
      return undefined unless @models?
      @models[index]

    friends: (team) ->
      return undefined unless @models?
      _friends = _.reject @models, (spy) ->
        console.log spy.team
        console.log team
        spy.team is team

    filter: (attr, val) ->
      return undefined unless @models?
      _.filter @models, (spy) ->
        spy[attr] == val

  new Spys()
]


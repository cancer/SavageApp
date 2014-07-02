'use strict'
kitd.factory 'teams', ['Collection', 'Team', 'members', (Collection, Team, kitdMembers) ->
  class Teams extends Collection
    constructor: (models, options)->
      @members = options.members
      super

    set: (models, options) ->
      _.each models, (model, idx, models) =>
        if model instanceof @model then @push model else @push new @model model
      @toggleShowContent @getAt(0).get('name_en')

    shuffle: () ->
      count = 0
      _members = _.shuffle @members
      _list = _.partition _members, ->
        # 最後にカウントアップさせられない
        count++
        (count % 2) is 1
      models = _.map @models, (model, idx) ->
        model.set
          'members': _list[idx]
          'length': _list[idx].length
      @reset models

    toggleShowContent: (name) ->
      model = @getByLabel name
      model.toggleShowContent()

  new Teams [
    {
      id: 0
      members: null
    }
    {
      id: 1
      members: null
    }
  ],
    model: Team
    members: kitdMembers.getData()
]


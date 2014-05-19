'use strict'
kitd.factory 'kitd.teams', ['kitd.Collection', 'kitd.Team', 'kitd.members', 'LABEL', (Collection, Team, members, LABEL) ->
  class Teams extends Collection
    set: (models, options) ->
      _.each models, (model, idx, models) =>
        return if model instanceof @model
        attr = _.extend {},
          name: LABEL.team.name[idx]
          name_en: LABEL.team.name_en[idx]
          members: model
        @push new @model attr

    shuffle: (members) ->
      count = 0
      _members = _.shuffle members.get()
      _list = _.partition _members, ->
        # 最後にカウントアップさせられない
        count++
        (count % 2) is 1
      @reset _list

  new Teams members, model: Team
]


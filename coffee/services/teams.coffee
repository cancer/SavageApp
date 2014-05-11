'use strict'
kitd.factory 'teams', ['Collection', 'Team', 'members', 'LABEL', (Collection, Team, members, LABEL) ->
  class Teams extends Collection
    constructor: (models) ->
      @models = []
      @shuffle models

    set: (models) ->
      unless models[0] instanceof Team
        idx = @models.length
        models = _.map models, (model) ->
          _model = _.extend {},
            name: LABEL.team.name[idx]
            name_en: LABEL.team.name_en[idx]
            members: model
          idx++
          new Team _model
      super models

    shuffle: (members) ->
      count = 0
      _members = _.shuffle members
      _list = _.partition _members, ->
        # 最後にカウントアップさせられない
        count++
        (count % 2) is 1
      @reset _list

  new Teams members
]


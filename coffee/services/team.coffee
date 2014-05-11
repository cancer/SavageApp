'use strict'
kitd.factory 'Team', ['Model', (Model) ->
  class Team extends Model
    TEAM_NAMES     = ['red', 'yellow']
    TEAM_LABELS    = ['Red', 'Yellow']
    TEAM_LABELS_JP = ['赤', '黄']
    set: (members) ->
      @data =
        members: members
        name: ''
        label: ''
        label_jp: ''
]


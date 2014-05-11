'use strict'
kitd.factory 'Team', ['Model', (Model) ->
  class Team extends Model
    set: (data) ->
      @data = _.extend {length: data.members.length}, data
      _.each data.members, (member) ->
        member.team = data
      super
]


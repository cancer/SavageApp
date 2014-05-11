'use strict'
kitd.factory 'Team', ['Model', (Model) ->
  class Team extends Model
    set: (data) ->
      @data = _.extend {}, data, {length: data.members.length}
      _.each @data.members, (member) ->
        member.team = data
      super
]


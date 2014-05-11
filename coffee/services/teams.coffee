'use strict'
kitd.factory 'teams', ['Collection', 'Team', 'members', (Collection, Team, members) ->
  class Teams extends Collection
    constructor: (members) ->
      @models = []
      @shuffle members

    set: (members) ->
      team = new Team members
      super

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


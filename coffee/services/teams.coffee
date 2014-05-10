'use strict'
kitd.factory 'teams', () ->
  # FIXME: class Teamも作ったほうがいい
  class Teams
    TEAM_NAMES     = ['red', 'yellow']
    TEAM_LABELS    = ['Red', 'Yellow']
    TEAM_LABELS_JP = ['赤', '黄']
    constructor: ->
      @members = null
      @list = _.map TEAM_LABELS, (val, idx) ->
        {
          name: TEAM_NAMES[idx]
          label: val
          label_jp: TEAM_LABELS_JP[idx]
        }

    init: (members) ->
      @members = members
      @shuffle()

    isInitialized: -> @members?

    shuffle: ->
      _members = _.shuffle @members
      count = 0
      _list = _.partition _members, =>
        # 最後にカウントアップさせられない
        count++
        (count % 2) is 1

      # 振り分けたmembersをlist[n].membersの形にする
      # FIXME: もうちょっといい方法ないかな…
      _.each _list, (members, idx) =>
        @list[idx].members = members

    # FIXME: -> Spys#assignSpy
    assignSpy: ->
      _.each @list, (team, idx) =>
        team.spy = _.sample team.members
        _.each team, (member, idx, team) =>
          member.isSpy = if member.name is team.spy.name then true else false

  new Teams()


'use strict'
kitd.factory 'teams', (members) ->
  class Teams
    constructor: ->
      @first = null
      @second = null
      @spy = []

    shuffle: ->
      _members = _.shuffle members
      count = 0
      [@first, @second] = _.partition _members, =>
        # 最後にカウントアップさせられない
        count++
        (count % 2) is 1

    assignSpy: ->
      @spy[0] = _.sample @first
      @spy[1] = _.sample @second
      _.each [@first, @second], (team, idx) =>
        _.each team, (member) =>
          member.isSpy = if member.name is @spy[idx].name then true else false

    toObj: ->
      return {
        first: @first
        second: @second
      }

  new Teams()


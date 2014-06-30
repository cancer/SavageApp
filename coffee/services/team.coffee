'use strict'
kitd.factory 'Team', ['Model', (Model) ->
  class Team extends Model
    constructor: (data, options)->
      data = _.extend {}, data,
        length: data.members?.length
        isShowContent: false
      super
    set: (key, val) ->
      super unless @data.members?
      _.each @data.members, (member) =>
        member.team = @data
      super @data

    toggleShowContent: () ->
      isShow = @get 'isShowContent'
      @set _.extend @data, isShowContent: !isShow
]


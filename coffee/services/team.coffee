'use strict'
kitd.factory 'Team', ['Model', 'LABEL', (Model, LABEL) ->
  class Team extends Model
    constructor: (data, options)->
      data = _.extend {}, data,
        name: LABEL.team.name[data.id]
        name_en: LABEL.team.name_en[data.id]
        length: data?.members?.length
        isShowContent: false
      super data
    set: (key, val) ->
      return super unless @data.members?
      _.each @data.members, (member) =>
        member.team = @data
      super key, val

    toggleShowContent: () ->
      isShow = @get 'isShowContent'
      @set _.extend @data, isShowContent: !isShow
]


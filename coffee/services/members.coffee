'use strict'
kitd.factory 'members', ['Member', (Member) ->
  # TODO: サーバーとかから取ってくる
  class Members
    constructor: (members) ->
      @models = []

    set: (members) ->
      _.each members, (member) =>
        @push member

    @push: (member) ->
      @models.push member

    @reset: (members) ->
      @models = []
      @set members if members?

    @get: () ->
      return undefined unless @models?
      @models

  new Members
    {
      id: 1
      name: 'うの'
      isAwaken: false
      isEditorShow: false
      isSpy: false
    }
    {
      id: 2
      name: 'げこ'
      isAwaken: true
      isEditorShow: false
      isSpy: false
    }
    {
      id: 3
      name: 'はし'
      isAwaken: false
      isEditorShow: false
      isSpy: false
    }
    {
      id: 4
      name: 'ガンダム'
      isAwaken: false
      isEditorShow: false
      isSpy: false
    }
    {
      id: 5
      name: 'みさー'
      isAwaken: true
      isEditorShow: false
      isSpy: false
    }
]

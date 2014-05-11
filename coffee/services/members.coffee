'use strict'
kitd.factory 'members', ['Collection', 'Member', (Collection, Member) ->
  # TODO: サーバーとかから取ってくる
  class Members extends Collection

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

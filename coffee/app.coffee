'use strict'
@kitd = kitd = angular.module 'kitd', ['ngRoute']

#kitd.run()

kitd.config ['$routeProvider', ($routeProvider) ->
  $routeProvider
    .when '/',
      templateUrl: 'main.html'
      controller : 'Main'

    .when '/main/',
      templateUrl: 'main.html'
      controller : 'Main'
]

kitd.controller 'Main', ['$scope', ($scope) ->
  @members = [
    {
      id: 1
      name: 'うの'
      isAwaken: false
      isEditorShow: false
    }
    {
      id: 2
      name: 'げこ'
      isAwaken: true
      isEditorShow: false
    }
    {
      id: 3
      name: 'はし'
      isAwaken: false
      isEditorShow: false
    }
    {
      id: 4
      name: 'ガンダム'
      isAwaken: false
      isEditorShow: false
    }
    {
      id: 5
      name: 'みさー'
      isAwaken: true
      isEditorShow: false
    }
  ]
  console.log @members
  $scope.members = @members

  $scope.showEdit = (member) ->
    console.log member
    member.isEditorShow = true

  $scope.hideEdit = (member) ->
    console.log member
    member.isEditorShow = false

  $scope.save = (member) ->
    # TODO: サーバーとかstorageに保存する
    console.log member

  $scope.delete = (member) ->
    # TODO: サーバーとかstorageから削除する
    console.log member

  $scope.awakenMembers = null

  $scope.createWakeUpMail = () ->
    members = []
    _.each @members, (member) ->
      members.push(member.name) if member.isAwaken
    $scope.awakenMembers = members
]

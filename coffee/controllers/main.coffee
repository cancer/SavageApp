'use strict'
kitd.controller 'Main', ['$scope', 'members', ($scope, members) ->
  $scope.members = members

  $scope.showEdit = (member, $event) ->
    $event.preventDefault()
    $event.stopPropagation()
    member.isEditorShow = true

  $scope.hideEdit = (member, $event) ->
    $event.preventDefault()
    $event.stopPropagation()
    member.isEditorShow = false

  $scope.save = (member) ->
    # TODO: サーバーとかstorageに保存する
    console.log member

  $scope.delete = (member) ->
    # TODO: サーバーとかstorageから削除する
    console.log member

  $scope.awakenMembers = null
  $scope.isMailFormShow = false

  $scope.createWakeUpMail = ($event) ->
    $event.preventDefault()
    $event.stopPropagation()
    awaken = []
    _.each members, (member) ->
      awaken.push(member.name) if member.isAwaken
    $scope.awakenMembers = awaken
    console.log $scope.awakenMembers
    $scope.toggleMailForm($event)

  $scope.toggleMailForm = ($event) ->
    $event.preventDefault()
    $event.stopPropagation()
    $scope.isMailFormShow = !$scope.isMailFormShow

]


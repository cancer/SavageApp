'use strict'
kitd.controller 'Main', ['$scope', 'members', ($scope, members) ->
  $scope.members = members.get()
  $scope.isMailFormShow = false

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

  $scope.toggleMailForm = ($event) ->
    $event.preventDefault()
    $event.stopPropagation()
    $scope.isMailFormShow = !$scope.isMailFormShow

]

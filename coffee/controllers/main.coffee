'use strict'
kitd.controller 'Main', ['$scope', 'kitd.members', ($scope, kitd.members) ->
  $scope.kitd.members = kitd.members.get()
  $scope.isMailFormShow = false

  console.log $scope.kitd.members

  $scope.showEdit = (member) ->
    member.isEditorShow = true

  $scope.hideEdit = (member) ->
    member.isEditorShow = false

  $scope.save = (member) ->
    # TODO: サーバーとかstorageに保存する
    console.log member

  $scope.delete = (member) ->
    # TODO: サーバーとかstorageから削除する
    console.log member

  $scope.toggleMailForm = () ->
    $scope.isMailFormShow = !$scope.isMailFormShow

]

'use strict'
kitd.controller 'Main', ['$scope', 'members', ($scope, members) ->
  $scope.members = members.get()
  $scope.isMailFormShow = false

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

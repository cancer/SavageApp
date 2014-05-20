'use strict'
kitd.controller 'Main', ['$scope', 'members', ($scope, kitdMembers) ->
  $scope.members = kitdMembers.getData()
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

  $scope.toggleAwaken = (name, $event) ->
    member = kitdMembers.getByName name
    member.toggleAwaken()
    changing = member.isAwaken()
    target = angular.element $event.currentTarget
    target.addClass if changing and not target.hasClass 'active'
    target.removeClass if not changing and target.hasClass 'active'
    $scope.members = kitdMembers.getData()

  $scope.isAwaken = (name) ->
    member = kitdMembers.getByName(name)
    member.isAwaken()
]

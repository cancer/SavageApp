'use strict'
@kitd = kitd = angular.module 'kitd', ['ngRoute']

#kitd.run()

kitd.config ['$routeProvider', ($routeProvider) ->
  $routeProvider
    .when '/',
      templateUrl: 'main.jade'
      controller : 'Main'

    .when '/team/',
      templateUrl: 'contents/team.jade'
      controller : 'Team'
]

kitd.controller 'Team', ['$scope', 'members', ($scope, @members) ->
  $scope.members = @members

  $scope.modalShow = false

  $scope.shuffledTeam = null

  $scope.shuffleMembers = (members = @members)->
    members = _.shuffle members
    count = 0
    [first, second] = _.partition members, =>
      # 最後にカウントアップさせられない
      count++
      (count % 2) is 1

    $scope.shuffledTeam =
      first: first
      second: second
    $scope.modalShow = false if $scope.modalShow
]

kitd.controller 'Main', ['$scope', 'members', ($scope, @members) ->
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

kitd.factory 'members', ->
  # TODO: サーバーとかから取ってくる
  [
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


'use strict'
@kitd = kitd = angular.module 'kitd', ['ngRoute']

#kitd.run()

kitd.config ['$routeProvider', ($routeProvider) ->
  $routeProvider
    .when '/',
      templateUrl: 'main.html'
      controller : 'Main'

    .when '/team/',
      templateUrl: 'contents/team.html'
      controller : 'Team'

    .when '/spy/',
      templateUrl: 'contents/spy.html'
      controller: 'Spy'
]

kitd.controller 'Spy', ['$scope', 'members','teams', ($scope, members, teams) ->
  $scope.members = members
  # TODO: まだ保存できないからシャッフルしちゃう
  teams.shuffle()
  $scope.teams = teams
  console.log $scope.teams
  $scope.modalShow = false
  $scope.showFirstSpy = false
  $scope.showSecondSpy = false
  $scope.isSpyAssigned = false

  $scope.assignSpy = ->
    teams.assignSpy()
    console.log teams
    $scope.isSpyAssigned = true
    $scope.modalShow = false if $scope.modalShow

  $scope.checkSpy = (team) ->
    if team is 'first'
      $scope.showFirstSpy = true
    else
      $scope.showSecondSpy = true

  $scope.closeSpyModal = ->
    $scope.showSpy = false
    $scope.showFirstSpy = false
    $scope.showSecondSpy = false
]

kitd.controller 'Team', ['$scope', 'members', 'teams', ($scope, members, teams) ->
  $scope.members = members
  $scope.teams = teams
  $scope.modalShow = false
  $scope.initTeam = false

  $scope.shuffleMembers = ->
    $scope.initTeam = true unless $scope.initTeam
    teams.shuffle()
    $scope.modalShow = false if $scope.modalShow
]

kitd.factory 'teams', (members) ->
  class Teams
    constructor: ->
      @first = null
      @second = null
      @spy = {}

    shuffle: ->
      _members = _.shuffle members
      count = 0
      [@first, @second] = _.partition _members, =>
        # 最後にカウントアップさせられない
        count++
        (count % 2) is 1

    assignSpy: ->
      @spy.first = _.sample @first
      @spy.second = _.sample @second

    toObj: ->
      return {
        first: @first
        second: @second
      }

  new Teams()

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


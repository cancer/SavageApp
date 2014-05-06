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

    .when '/spy/',
      templateUrl: 'contents/spy.jade'
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
  $scope.showFirstRole = false
  $scope.showSecondRole = false
  $scope.identifier = null

  # スパイを決める
  teams.assignSpy()

  $scope.checkSpy = (team) ->
    if team is 'first'
      $scope.showFirstSpy = true
    else
      $scope.showSecondSpy = true

  identifiers = null
  $scope.assignRole = (team) ->
    if team is 'first'
      $scope.showFirstRole = true
      identifiers = teams.first
      $scope.identifier = teams.first[0]
    else
      $scope.showSecondRole = true
      identifiers = teams.second
      $scope.identifier = teams.second[0]

  count = 0
  $scope.nextRole = ->
    count++
    console.log identifiers[count]
    $scope.identifier = identifiers[count]
    console.log $scope.identifier
    showRoleComplete() unless $scope.identifier
    $scope.showRole = false

  showRoleComplete = ->
    $scope.shownRole = true

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
      @spy = []

    shuffle: ->
      _members = _.shuffle members
      count = 0
      [@first, @second] = _.partition _members, =>
        # 最後にカウントアップさせられない
        count++
        (count % 2) is 1

    assignSpy: ->
      @spy[0] = _.sample @first
      @spy[1] = _.sample @second
      _.each [@first, @second], (team, idx) =>
        _.each team, (member) =>
          member.isSpy = if member.name is @spy[idx].name then true else false

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


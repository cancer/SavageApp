'use strict'
kitd.controller 'Spy', ['$scope', 'members', 'teams', 'spys', ($scope, members, teams, spys) ->
  # TODO: まだ保存できないからシャッフルしちゃう
  if teams.isInitialized() then teams.shuffle() else teams.init(members)



  $scope.teams = teams.list
  $scope.currentTeam = teams.list[0]
  # FIXME: -> directive
  $scope.teams[0].showContent = true

  $scope.isAssignedSpy = false

  # UI
  $scope.isInitializedTeam = ->
    teams.isInitialized()

  $scope.toggleTeamTab = (team) ->
    _.each $scope.teams, (team) ->
      team.showContent = !team.showContent
    $scope.currentTeam = team

  $scope.closeSpyModal = ->
    $scope.showSpy = false
    $scope.showFirstSpy = false
    $scope.showSecondSpy = false

  # スパイを決める
  $scope.assignSpy = ->
    spys.reset()
    _.each teams.list, (team) ->
      spys.assignSpy team.members
    $scope.isAssignedSpy = true
    $scope.spys = spys.get()

    # FIXME: membersの対応待ち
    # $scope.friends = spys.friends $scope.currentTeam
    $scope.friends = [
      id: 1
      name: 'うの'
      isSpy: true
      team:
        name: 'yellow'
        label: 'Yellow'
    ]

  # スパイを確認する
  completedConfirmFriend = []

  isCompleteConfirmFriend = (team) ->
    _.contains completedConfirmFriend, team.name

  $scope.initConfirmFriend = (friend) ->
    $scope.showFriendState = if isCompleteConfirmFriend(friend.team) then 'complete' else 'passed'
    $scope.currentFriend = friend

  $scope.confirmFriend = () ->
    completedConfirmFriend.push $scope.currentFriend.team.name
    $scope.showFriendState = 'showing'

  # 役割を確認する
  currentPlayerIndex = 0
  showRoleCompleted = []

  isCompleteShowRole = (team) ->
    _.contains showRoleCompleted, team.name

  $scope.initShowRole = () ->
    $scope.roleShowState = if isCompleteShowRole($scope.currentTeam) then 'complete' else 'passed'
    $scope.currentPlayer = $scope.currentTeam.members[0]
    currentPlayerIndex = 0

  $scope.nextRole = (members = $scope.currentTeam.members) ->
    $scope.roleShowState = 'passed'
    currentPlayerIndex++
    return completeShowRole() if members.length <= currentPlayerIndex
    $scope.currentPlayer = members[currentPlayerIndex]

  completeShowRole = () ->
    $scope.showRoleCompleted.push $scope.currentTeam.name
    $scope.roleShowState = 'complete'
    console.log $scope.roleShowState
]


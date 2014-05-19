'use strict'
kitd.controller 'Spy', ['$scope', 'kitd.members', 'kitd.teams', 'kitd.spies', ($scope, kitd.members, kitd.teams, kitd.spies) ->
  $scope.kitd.teams = kitd.teams.get()
  $scope.currentTeam = $scope.kitd.teams[0]
  # FIXME: -> directive
  $scope.kitd.teams[0].showContent = true
  isInitializedTeam = true

  $scope.isAssignedSpy = false
  console.log $scope.kitd.teams[0].get('length')

  # UI
  $scope.isInitializedTeam = -> isInitializedTeam

  $scope.toggleTeamTab = (team) ->
    _.each $scope.kitd.teams, (team) ->
      team.showContent = !team.showContent
    $scope.currentTeam = team

  $scope.closeSpyModal = ->
    $scope.showSpy = false
    $scope.showFirstSpy = false
    $scope.showSecondSpy = false

  # スパイを決める
  $scope.assignSpy = ->
    kitd.spies.reset()
    _.each kitd.teams.list, (team) ->
      kitd.spies.assignSpy team.kitd.members
    $scope.isAssignedSpy = true
    $scope.kitd.spies = kitd.spies.get()

    # FIXME: kitd.membersの対応待ち
    # $scope.friends = kitd.spies.friends $scope.currentTeam
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
    $scope.currentPlayer = $scope.currentTeam.get('kitd.members')[0]
    $scope.currentTeam.get('kitd.members')
    console.log $scope.currentPlayer
    currentPlayerIndex = 0

  $scope.nextRole = (kitd.members = $scope.currentTeam.get('kitd.members')) ->
    $scope.roleShowState = 'passed'
    currentPlayerIndex++
    return completeShowRole() if kitd.members.length <= currentPlayerIndex
    $scope.currentPlayer = kitd.members[currentPlayerIndex]

  completeShowRole = () ->
    showRoleCompleted.push $scope.currentTeam.name
    $scope.roleShowState = 'complete'
]


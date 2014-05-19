'use strict'
kitd.controller 'Spy', ['$scope', 'members', 'teams', 'spies', ($scope, members, teams, spies) ->
  $scope.teams = teams.get()
  $scope.currentTeam = $scope.teams[0]
  # FIXME: -> directive
  $scope.teams[0].showContent = true
  isInitializedTeam = true

  $scope.isAssignedSpy = false
  console.log $scope.teams[0].get('length')

  # UI
  $scope.isInitializedTeam = -> isInitializedTeam

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
    spies.reset()
    _.each teams.list, (team) ->
      spies.assignSpy team.members
    $scope.isAssignedSpy = true
    $scope.spies = spies.get()

    # FIXME: membersの対応待ち
    # $scope.friends = spies.friends $scope.currentTeam
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
    $scope.currentPlayer = $scope.currentTeam.get('members')[0]
    $scope.currentTeam.get('members')
    console.log $scope.currentPlayer
    currentPlayerIndex = 0

  $scope.nextRole = (members = $scope.currentTeam.get('members')) ->
    $scope.roleShowState = 'passed'
    currentPlayerIndex++
    return completeShowRole() if members.length <= currentPlayerIndex
    $scope.currentPlayer = members[currentPlayerIndex]

  completeShowRole = () ->
    showRoleCompleted.push $scope.currentTeam.name
    $scope.roleShowState = 'complete'
]


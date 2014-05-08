'use strict'
kitd.controller 'Team', ['$scope', 'members', 'teams', ($scope, members, teams) ->
  $scope.members = members
  $scope.teams = teams.list
  #$scope.teams.first.showContent = true
  #$scope.teams.second.showContent = false

  console.log $scope.teams

  $scope.shuffleMembers = ->
    console.log teams
    unless $scope.initTeam
      teams.init members
      $scope.initTeam = true
    else
      teams.shuffle()
    console.log teams.list
    $scope.teams = teams.list

  $scope.toggleTeamTab = ->
    $scope.teams.first.showContent  = !$scope.teams.first.showContent
    $scope.teams.second.showContent = !$scope.teams.second.showContent

  $scope.isInitializedTeam = ->
    teams.isInitialized()

]


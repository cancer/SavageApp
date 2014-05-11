'use strict'
kitd.controller 'Team', ['$scope', 'members', 'teams', ($scope, members, teams) ->
  $scope.members = members
  $scope.teams = teams.get()
  $scope.teams[0].showContent = true
  isInitializedTeam = false
  console.log $scope.teams

  $scope.shuffleMembers = ->
    teams.shuffle members
    $scope.teams = teams.get()
    $scope.currentTeam = teams.getAt 0
    isInitializedTeam = true unless isInitializedTeam

  $scope.currentTeam = teams.getAt 0
  $scope.toggleTeamTab = (team) ->
    _.each $scope.teams, (team) ->
      team.showContent = !team.showContent
    $scope.currentTeam = team

  $scope.isInitializedTeam = -> isInitializedTeam

]


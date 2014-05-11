'use strict'
kitd.controller 'Team', ['$scope', 'members', 'teams', ($scope, members, teams) ->
  $scope.members = members
  $scope.teams = teams.get()
  $scope.teams[0].showContent = true
  isInitializedTeam = false

  $scope.shuffleMembers = ->
    teams.shuffle members
    $scope.teams = teams.get()
    isInitializedTeam = true unless isInitializedTeam

  $scope.toggleTeamTab = ->
    _.each $scope.teams, (team) ->
      team.showContent = !team.showContent

  $scope.isInitializedTeam = -> isInitializedTeam

]


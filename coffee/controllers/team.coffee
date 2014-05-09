'use strict'
kitd.controller 'Team', ['$scope', 'members', 'teams', ($scope, members, teams) ->
  $scope.members = members
  $scope.teams = teams.list
  $scope.teams[0].showContent = true

  $scope.shuffleMembers = ->
    unless $scope.initTeam
      teams.init members
      $scope.initTeam = true
    else
      teams.shuffle()
    $scope.teams = teams.list

  $scope.toggleTeamTab = ->
    _.each $scope.teams, (team) ->
      team.showContent = !team.showContent

  $scope.isInitializedTeam = ->
    teams.isInitialized()

]


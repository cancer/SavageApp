'use strict'
kitd.controller 'Team', ['$scope', 'kitd.members', 'kitd.teams', ($scope, kitd.members, kitd.teams) ->
  $scope.kitd.members = kitd.members
  $scope.kitd.teams = kitd.teams.get()
  $scope.kitd.teams[0].showContent = true
  isInitializedTeam = false

  $scope.shuffleMembers = ->
    kitd.teams.shuffle kitd.members
    $scope.kitd.teams = kitd.teams.get()
    $scope.currentTeam = kitd.teams.getAt 0
    isInitializedTeam = true unless isInitializedTeam

  $scope.currentTeam = kitd.teams.getAt 0
  $scope.toggleTeamTab = (team) ->
    _.each $scope.kitd.teams, (team) ->
      team.showContent = !team.showContent
    $scope.currentTeam = team

  $scope.isInitializedTeam = -> isInitializedTeam

]


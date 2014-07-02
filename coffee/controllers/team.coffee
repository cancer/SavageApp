'use strict'
kitd.controller 'Team', ['$scope', 'members', 'teams', ($scope, kitdMembers, kitdTeams) ->
  $scope.members = kitdMembers.getData()
  $scope.teams = kitdTeams.getData()

  $scope.currentTeam = kitdTeams.getAt(0)?.toObject()

  $scope.isInitializedTeam = false

  $scope.shuffleMembers = ->
    kitdTeams.shuffle()
    $scope.teams = kitdTeams.getData()
    $scope.currentTeam = kitdTeams.getAt(0).toObject()
    $scope.isInitializedTeam = true unless $scope.isInitializedTeam

  $scope.toggleTeamTab = (name) ->
    _.each $scope.teams, (team) ->
      model = kitdTeams.getByName team.name
      model.toggleShowContent()
    $scope.currentTeam = kitdTeams.getByName(name).toObject()

]


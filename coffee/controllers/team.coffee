'use strict'
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


'use strict'
kitd.controller 'Spy', ['$scope', 'members','teams', ($scope, members, teams) ->
  $scope.members = members
  # TODO: まだ保存できないからシャッフルしちゃう
  teams.shuffle()
  $scope.teams = teams
  console.log $scope.teams
  $scope.modalShow = false
  $scope.showFirstSpy = false
  $scope.showSecondSpy = false
  $scope.showFirstRole = false
  $scope.showSecondRole = false
  $scope.identifier = null

  # スパイを決める
  teams.assignSpy()

  $scope.checkSpy = (team) ->
    if team is 'first'
      $scope.showFirstSpy = true
    else
      $scope.showSecondSpy = true

  identifiers = null
  $scope.assignRole = (team) ->
    if team is 'first'
      $scope.showFirstRole = true
      identifiers = teams.first
      $scope.identifier = teams.first[0]
    else
      $scope.showSecondRole = true
      identifiers = teams.second
      $scope.identifier = teams.second[0]

  count = 0
  $scope.nextRole = ->
    count++
    console.log identifiers[count]
    $scope.identifier = identifiers[count]
    console.log $scope.identifier
    showRoleComplete() unless $scope.identifier
    $scope.showRole = false

  showRoleComplete = ->
    $scope.shownRole = true

  $scope.closeSpyModal = ->
    $scope.showSpy = false
    $scope.showFirstSpy = false
    $scope.showSecondSpy = false
]


'use strict'
kitd.controller 'Spy', ['$scope', 'members', 'teams', ($scope, members, teams) ->
  # TODO: まだ保存できないからシャッフルしちゃう
  if teams.isInitialized() then teams.shuffle() else teams.init(members)
  $scope.teams = teams.list
  $scope.teams[0].showContent = true
  console.log $scope.teams
  $scope.modalShow = false
  $scope.showFirstRole = false
  $scope.showSecondRole = false
  $scope.identifier = null

  # スパイを決める
  teams.assignSpy()

  $scope.toggleTeamTab = ->
    _.each $scope.teams, (team) ->
      team.showContent = !team.showContent

  $scope.checkSpy = (team) ->
    if team is 'first'
      $scope.showFirstSpy = true
    else
      $scope.showSecondSpy = true

  identifiers = null
  $scope.assignRole = (team) ->
    return
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


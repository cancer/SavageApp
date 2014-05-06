(function() {
  'use strict';
  var kitd;

  this.kitd = kitd = angular.module('kitd', ['ngRoute']);

  kitd.config([
    '$routeProvider', function($routeProvider) {
      return $routeProvider.when('/', {
        templateUrl: 'main.jade',
        controller: 'Main'
      }).when('/team/', {
        templateUrl: 'contents/team.jade',
        controller: 'Team'
      }).when('/spy/', {
        templateUrl: 'contents/spy.html',
        controller: 'Spy'
      });
    }
  ]);

  kitd.controller('Spy', [
    '$scope', 'members', 'teams', function($scope, members, teams) {
      $scope.members = members;
      teams.shuffle();
      $scope.teams = teams;
      console.log($scope.teams);
      $scope.modalShow = false;
      $scope.showFirstSpy = false;
      $scope.showSecondSpy = false;
      $scope.isSpyAssigned = false;
      $scope.assignSpy = function() {
        teams.assignSpy();
        console.log(teams);
        $scope.isSpyAssigned = true;
        if ($scope.modalShow) {
          return $scope.modalShow = false;
        }
      };
      $scope.checkSpy = function(team) {
        if (team === 'first') {
          return $scope.showFirstSpy = true;
        } else {
          return $scope.showSecondSpy = true;
        }
      };
      return $scope.closeSpyModal = function() {
        $scope.showSpy = false;
        $scope.showFirstSpy = false;
        return $scope.showSecondSpy = false;
      };
    }
  ]);

  kitd.controller('Team', [
    '$scope', 'members', 'teams', function($scope, members, teams) {
      $scope.members = members;
      $scope.teams = teams;
      $scope.modalShow = false;
      $scope.initTeam = false;
      return $scope.shuffleMembers = function() {
        if (!$scope.initTeam) {
          $scope.initTeam = true;
        }
        teams.shuffle();
        if ($scope.modalShow) {
          return $scope.modalShow = false;
        }
      };
    }
  ]);

  kitd.factory('teams', function(members) {
    var Teams;
    Teams = (function() {
      function Teams() {
        this.first = null;
        this.second = null;
        this.spy = {};
      }

      Teams.prototype.shuffle = function() {
        var count, _members, _ref;
        _members = _.shuffle(members);
        count = 0;
        return _ref = _.partition(_members, (function(_this) {
          return function() {
            count++;
            return (count % 2) === 1;
          };
        })(this)), this.first = _ref[0], this.second = _ref[1], _ref;
      };

      Teams.prototype.assignSpy = function() {
        this.spy.first = _.sample(this.first);
        return this.spy.second = _.sample(this.second);
      };

      Teams.prototype.toObj = function() {
        return {
          first: this.first,
          second: this.second
        };
      };

      return Teams;

    })();
    return new Teams();
  });

  kitd.controller('Main', [
    '$scope', 'members', function($scope, members) {
      this.members = members;
      console.log(this.members);
      $scope.members = this.members;
      $scope.showEdit = function(member) {
        console.log(member);
        return member.isEditorShow = true;
      };
      $scope.hideEdit = function(member) {
        console.log(member);
        return member.isEditorShow = false;
      };
      $scope.save = function(member) {
        return console.log(member);
      };
      $scope["delete"] = function(member) {
        return console.log(member);
      };
      $scope.awakenMembers = null;
      return $scope.createWakeUpMail = function() {
        members = [];
        _.each(this.members, function(member) {
          if (member.isAwaken) {
            return members.push(member.name);
          }
        });
        return $scope.awakenMembers = members;
      };
    }
  ]);

  kitd.factory('members', function() {
    return [
      {
        id: 1,
        name: 'うの',
        isAwaken: false,
        isEditorShow: false
      }, {
        id: 2,
        name: 'げこ',
        isAwaken: true,
        isEditorShow: false
      }, {
        id: 3,
        name: 'はし',
        isAwaken: false,
        isEditorShow: false
      }, {
        id: 4,
        name: 'ガンダム',
        isAwaken: false,
        isEditorShow: false
      }, {
        id: 5,
        name: 'みさー',
        isAwaken: true,
        isEditorShow: false
      }
    ];
  });

}).call(this);

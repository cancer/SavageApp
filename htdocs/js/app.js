(function() {
  'use strict';
  var kitd;

  this.kitd = kitd = angular.module('kitd', ['ngRoute']);

  kitd.config([
    '$routeProvider', function($routeProvider) {
      return $routeProvider.when('/', {
        templateUrl: 'main.html',
        controller: 'Main'
      }).when('/team/', {
        templateUrl: 'contents/team.html',
        controller: 'Team'
      });
    }
  ]);

  kitd.controller('Team', [
    '$scope', 'members', function($scope, members) {
      this.members = members;
      $scope.members = this.members;
      $scope.modalShow = false;
      $scope.shuffledTeam = null;
      return $scope.shuffleMembers = function(members) {
        var count, first, second, _ref;
        if (members == null) {
          members = this.members;
        }
        members = _.shuffle(members);
        count = 0;
        _ref = _.partition(members, (function(_this) {
          return function() {
            count++;
            return (count % 2) === 1;
          };
        })(this)), first = _ref[0], second = _ref[1];
        $scope.shuffledTeam = {
          first: first,
          second: second
        };
        if ($scope.modalShow) {
          return $scope.modalShow = false;
        }
      };
    }
  ]);

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

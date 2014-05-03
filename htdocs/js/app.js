(function() {
  'use strict';
  var kitd;

  this.kitd = kitd = angular.module('kitd', ['ngRoute']);

  kitd.config([
    '$routeProvider', function($routeProvider) {
      return $routeProvider.when('/', {
        templateUrl: 'main.html',
        controller: 'Main'
      }).when('/main/', {
        templateUrl: 'main.html',
        controller: 'Main'
      });
    }
  ]);

  kitd.controller('Main', [
    '$scope', function($scope) {
      this.members = [
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
        var members;
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

}).call(this);

'use strict'
kitd.directive 'ntAwakenCheckbox', ['LABEL', (LABEL) ->
  return {
    restrict: 'E'
    transclude: true
    templateUrl: 'contents/checkbox.jade'
    link: (scope, element, attrs) ->
      member = scope.member
      element.find('input').attr 'checked', member.data.isAwaken
      element.on 'change', ($event) ->
        scope.$parent.toggleAwaken(member)
      @
  }
]

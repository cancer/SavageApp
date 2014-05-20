'use strict'
kitd.directive 'ntMailTemplateStr', [() ->
  return {
    link: (scope, element, attrs) ->
      scope.$watch 'members', (members) ->
        scope.standingMembers = _.filter members, (m) -> m.isAwaken
        scope.sleepingMembers = _.filter members, (m) -> !m.isAwaken

        tmpl = """
        ✌('ω'✌ )三✌('ω')✌三( ✌'ω')✌
                朝起きた速報
        ✌('ω'✌ )三✌('ω')✌三( ✌'ω')✌
        <% _.each(standingMembers, function(member) {%><%= member.name %>\n<%})%>
        ▂▅▇█▓▒░(’ω’)░▒▓█▅▂
            まだ朝起きてない速報
        ▂▅▇█▓▒░(’ω’)░▒▓█▅▂
        <% _.each(sleepingMembers, function(member) {%><%= member.name %>\n<%})%>
        """
        element.html(_.template(tmpl, scope))
  }
]


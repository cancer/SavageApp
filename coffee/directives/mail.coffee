'use strict'
kitd.directive 'selectOnClick', () ->
  return (scope, element, attrs) ->
    element.on 'click', () ->
      textarea = $('.mail-template__textarea').find('textarea')
      textarea[0].focus()
      @

kitd.directive 'selectOnFocus', () ->
  return (scope, element, attrs) ->
    element.on 'focus', () ->
      @selectionStart = 0
      @selectionEnd = @value.length
      @

kitd.directive 'mailTemplateStr', () ->
  return {
    link: (scope, element, attrs) ->
      members = scope.members
      scope.standingMembers = _.filter members, (m)-> m.isAwaken
      scope.sleepingMembers = _.filter members, (m)-> !m.isAwaken
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

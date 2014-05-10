'use strict'
#Collection
kitd.service 'spys', ['spy', (spy) ->
  @data = []

  @set = (member) =>
    @data.push spy.set member

  @getAt = (index) =>
    @data[index]

  @filter = (attr, val) =>
    _.filter

  @assignSpy = (members) =>
    spy = _.sample members
    spy.isSpy = true
    @set spy
]


'use strict'
#Collection
kitd.service 'spys', () ->
  @data = []

  @set = (spy) =>
    @data.push spy

  @getAt = (index) =>
    @data[index]

  @filter = (attr, val) =>
    _.filter

  @assignSpy = (members) =>
    spy = _.sample members
    spy.isSpy = true
    @set spy


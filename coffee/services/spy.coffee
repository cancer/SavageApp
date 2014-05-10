'use strict'
#Model
kitd.service 'spy', () ->
  @data = {}

  @set = (member) =>
    @data = member
    @

  @get = (attr) =>
    @data[attr]


class Foosballer.Models.Tournament extends Backbone.Model
  url: '/api/tournaments'

  toJSON: ->
    tournament: @attributes

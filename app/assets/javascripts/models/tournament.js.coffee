class Foosballer.Models.Tournament extends Backbone.Model
  urlRoot: '/api/tournaments'

  toJSON: ->
    tournament: @attributes

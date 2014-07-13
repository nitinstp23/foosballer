class Foosballer.Models.Tournament extends Backbone.Model
  urlRoot: '/api/tournaments'

  toJSON: ->
    tournament: @attributes

  games: ->
    return [] if @get('games') == undefined
    _.sortBy @get('games'), (game) ->
      game.position

  teams: ->
    return [] if @get('teams') == undefined
    _.sortBy @get('teams'), (team) ->
      team.name

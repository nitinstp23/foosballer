class Foosballer.Collections.Players extends Backbone.Collection

  url: '/api/players'

  model: Foosballer.Models.Player

  parse: (response) ->
    response.players

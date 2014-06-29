class Foosballer.Collections.Tournaments extends Backbone.Collection

  url: '/api/tournaments'

  model: Foosballer.Models.Tournament

  parse: (response) ->
    response.tournaments

  in_groups_of: (n) ->
    tournaments_list = _.groupBy @models, (element, index) ->
      Math.floor(index/n)

    _.toArray(tournaments_list)

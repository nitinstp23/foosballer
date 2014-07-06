class Foosballer.Collections.Teams extends Backbone.Collection

  url: '/api/tournaments/create_teams'

  model: Foosballer.Models.Team

  parse: (response) ->
    _.flatten response.teams

  in_groups_of: (n) ->
    teams_list = _.groupBy @models, (element, index) ->
      Math.floor(index/n)

    _.toArray(teams_list)

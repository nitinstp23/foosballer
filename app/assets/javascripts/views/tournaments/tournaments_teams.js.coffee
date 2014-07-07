class Foosballer.Views.TournamentsTeams extends Backbone.View

  id:        'tournament_teams_section'
  className: 'container'
  template:  JST['tournaments/teams']

  initialize: (player_ids)->
    @teams = new Foosballer.Collections.Teams()

    Foosballer.showLoading()
    @teams.fetch
      type: 'POST'
      data: { player_ids: player_ids }
      success: =>
        Foosballer.hideLoading()
        @render()

  render: ->
    $(@el).html @template(teams: @teams)
    this

  hide: ->
    $(@el).hide()

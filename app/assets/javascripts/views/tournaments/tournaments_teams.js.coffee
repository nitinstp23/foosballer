class Foosballer.Views.TournamentsTeams extends Backbone.View

  id:        'tournament_teams_section'
  className: 'container'
  template:  JST['tournaments/teams']

  events:
    'click #create_tournament_link' : 'createTournament'

  initialize: (player_ids) ->
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

  # teams_attributes:
  #   name: 'Team One', game_sessions_attributes: [{player_id: 1}, {player_id: 2}]
  #   name: 'Team Two', game_sessions_attributes: [{player_id: 3}, {player_id: 4}]
  teamsAttributes: ->
    attributes = []
    teams      = $(@el).find('.create_tournament_panel .team')
    for team in teams
      players = $(team).find('.player-name')
      attributes.push
        name: $(team).find('.team-name')[0].id
        game_sessions_attributes: [
          { player_id: players[0].id }
          { player_id: players[1].id }
        ]
    attributes

  createTournament: (event) ->
    event.preventDefault()
    Foosballer.showLoading()
    tournament = new Foosballer.Models.Tournament(teams_attributes: @teamsAttributes())

    tournament.save(
      null
      wait: true
      success: (model, response, options) =>
        Foosballer.hideLoading()
        TOURNAMENTS_ROUTER.navigate("tournaments/#{response.id}", trigger: true)
      error: (model, response, options) =>
        Foosballer.hideLoading()
        TOURNAMENTS_ROUTER.navigate('tournaments', trigger: true)
    )

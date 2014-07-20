class Foosballer.Views.TournamentsShow extends Foosballer.Views.Base

  id:        'tournament_show_section'
  className: 'container'
  template:  JST['tournaments/show']

  events: ->
    'click #finish_tournament_link' : 'finish'

  initialize: (attributes) ->
    Foosballer.showLoading()

    @model = new Foosballer.Models.Tournament(id: attributes.tournament_id)
    @model.fetch
      success: =>
        Foosballer.hideLoading()
        @render()
        @addTooltip()
        @copyTeamsToClipboard()

  render: ->
    $(@el).html @template(tournament: @model)
    this

  # games_attributes:
  #   id: 1
  #   team_one_score: 0
  #   team_two_score: 0
  gamesAttributes: ->
    attributes = []
    games      = $(@el).find('.show_tournament_panel .team-schedule li')
    for game in games
      game_id = $(game).find('.game-number').id
      attributes.push
        id: game_id
        team_one_score: 0
        team_two_score: 0

    attributes

  finish: ->
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

  copyTeamsToClipboard: ->
    $('#copyTeams').zclip
      path:
        'assets/ZeroClipboard.swf'
      copy: ->
        teams = []
        for team in $('.teams-list .panel-body ul li')
          team_name = $(team).find('.game-number').text().replace(/^\s+|\s+$/g, "")
          players   = $(team).find('.teams-row .team-name')
          players   = ($(player).text().replace(/^\s+|\s+$/g, "") for player in players)
          teams.push "#{team_name} #{players.join(' & ')}"
        teams.join('\n')
      afterCopy: (event) ->


  addTooltip: ->
    $('.copy-to-clipboard').tooltip
      title: 'Copy to clipboard'
      placement: 'left'

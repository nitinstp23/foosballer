class Foosballer.Views.TournamentsTeams extends Backbone.View

  id:        'tournament_teams_section'
  className: 'container'
  template:  JST['tournaments/teams']

  # events:
    # 'click #create_tournament_link' : 'buildTeams'

  initialize: (player_ids)->
    @teams = new Foosballer.Collections.Teams()

    _.bindAll(this, 'render')
    @teams.fetch(type: 'POST', data: {player_ids: player_ids}, success: @render)

  render: ->
    $(@el).html @template(teams: @teams)
    this

  hide: ->
    $(@el).hide()

  # buildTeams: (event)->
  #   event.preventDefault()
  #   @hide()
  #   TOURNAMENTS_ROUTER.navigate('tournaments/new/teams', trigger: true)

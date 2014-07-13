class Foosballer.Views.TournamentsShow extends Backbone.View

  id:        'tournament_show_section'
  className: 'container'
  template:  JST['tournaments/show']

  events:
    'click #copyTeams'    : 'copyTeamsToClipboard'
    'click #copySchedule' : 'copyScheduleToClipboard'

  initialize: (attributes) ->
    Foosballer.showLoading()

    @model = new Foosballer.Models.Tournament(id: attributes.tournament_id)
    @model.fetch
      success: =>
        Foosballer.hideLoading()
        @render()


  render: ->
    $(@el).html @template(tournament: @model)
    this

  hide: ->
    $(@el).hide()

  copyTeamsToClipboard: (event) ->
    event.preventDefault()
    console.log $('.teams-list .panel-body ul').text();

  copyScheduleToClipboard: (event) ->
    event.preventDefault()
    console.log $('.team-schedule .panel-body ul').text();

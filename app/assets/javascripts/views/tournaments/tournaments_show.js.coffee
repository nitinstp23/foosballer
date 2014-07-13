class Foosballer.Views.TournamentsShow extends Backbone.View

  id:        'tournament_show_section'
  className: 'container'
  template:  JST['tournaments/show']

  # events:
  #   'click #create_tournament_link' : 'createTournament'

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

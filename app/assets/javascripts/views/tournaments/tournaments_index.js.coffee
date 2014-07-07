class Foosballer.Views.TournamentsIndex extends Backbone.View

  id:        'tournaments_section'
  className: 'container'
  template:  JST['tournaments/index']

  events:
    'click #new_tournament_link' : 'newTournament'

  initialize: ->
    Foosballer.showLoading()
    @collection.fetch
      success: =>
        Foosballer.hideLoading()
        @render()

  render: ->
    $(@el).html(@template(tournaments: @collection))
    this

  newTournament: (event)->
    event.preventDefault()
    @hide()
    TOURNAMENTS_ROUTER.navigate('tournaments/new', trigger: true)

  hide: ->
    $(@el).hide()

class Foosballer.Views.TournamentsIndex extends Backbone.View

  template: JST['tournaments/index']

  events:
    'click #new_tournament_link' : 'newTournament'

  initialize: ->
    _.bindAll(this, 'render')
    @collection.fetch(success: @render)

  render: ->
    $(@el).html(@template(tournaments: @collection))
    this

  newTournament: (event)->
    event.preventDefault()
    view = new Foosballer.Views.TournamentsNew()
    $('#new_tournament_form').append(view.render().el)
    @hide()

  hide: ->
    $(@el).hide()

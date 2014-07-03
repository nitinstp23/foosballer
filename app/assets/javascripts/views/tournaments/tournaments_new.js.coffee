class Foosballer.Views.TournamentsNew extends Backbone.View

  template: JST['tournaments/new']

  events:
    'submit #new_tournament' : 'createTournament'

  # initialize: ->
  #   _.bindAll(this, 'render')
  #   @collection.fetch(success: @render)

  render: ->
    $(@el).html(@template())
    this

  createTournament: (event)->
    event.preventDefault()
    console.log 'hi'
    # @collection.create()#name: $('#')

  hide: ->
    $(@el).hide()

class Foosballer.Views.TournamentsIndex extends Backbone.View

  template: JST['tournaments/index']

  initialize: ->
    _.bindAll(this, 'render')
    @collection.fetch(success: @render)

  render: ->
    console.log @collection
    $(@el).html(@template(tournaments: @collection))
    this

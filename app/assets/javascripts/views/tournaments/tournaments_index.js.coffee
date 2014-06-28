class Foosballer.Views.TournamentsIndex extends Backbone.View

  template: JST['tournaments/index']

  render: ->
    $(@el).html(@template())
    this

window.Foosballer =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    window.TOURNAMENTS_ROUTER = new Foosballer.Routers.Tournaments()
    Backbone.history.start()

$(document).ready ->
  Foosballer.initialize()

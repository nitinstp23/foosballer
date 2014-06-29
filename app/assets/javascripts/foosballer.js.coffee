window.Foosballer =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    new Foosballer.Routers.Tournaments()
    Backbone.history.start()

$(document).ready ->
  Foosballer.initialize()

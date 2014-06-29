window.Foosballer =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    @router = new Foosballer.Routers.Tournaments()
    Backbone.history.start()

$(document).ready ->
  Foosballer.initialize()

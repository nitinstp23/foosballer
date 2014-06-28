window.Foosballer =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    new Foosballer.Routers.Tournaments()
    Backbone.history.start()#(pushState: true)

$(document).ready ->
  Foosballer.initialize()

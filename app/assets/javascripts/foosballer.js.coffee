window.Foosballer =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    window.TOURNAMENTS_ROUTER = new Foosballer.Routers.Tournaments()
    Backbone.history.start()

  showLoading: ->
    spinner = new Spinner().spin()
    $('#loading').html(spinner.el);

  hideLoading: ->
    $("#loading").fadeOut()

$(document).ready ->
  Foosballer.initialize()

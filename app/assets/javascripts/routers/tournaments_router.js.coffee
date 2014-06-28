class Foosballer.Routers.Tournaments extends Backbone.Router
  routes:
    ''                : 'index'
    'tournaments/:id' : 'show'

  index: ->
    view = new Foosballer.Views.TournamentsIndex()
    $('#tournaments').html(view.render().el)

  show: (id) ->
    console.log "Tournament #{id}"

class Foosballer.Routers.Tournaments extends Backbone.Router
  routes:
    ''                : 'index'
    'tournaments/:id' : 'show'

  initialize: ->
    @collection = new Foosballer.Collections.Tournaments()

  index: ->
    view = new Foosballer.Views.TournamentsIndex(collection: @collection)
    $('#tournaments').html(view.render().el)


  show: (id) ->
    console.log "Tournament #{id}"

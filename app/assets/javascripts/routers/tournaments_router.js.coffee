class Foosballer.Routers.Tournaments extends Backbone.Router
  routes:
    ''                : 'index'
    'tournaments/new' : 'new'
    'tournaments/:id' : 'show'

  initialize: ->
    @collection = new Foosballer.Collections.Tournaments()

  index: ->
    view = new Foosballer.Views.TournamentsIndex(collection: @collection)
    $('#tournaments_section').html(view.render().el)

  new: ->
    view = new Foosballer.Views.TournamentsNew()
    $('#new_tournament_section').html(view.render().el)
    view.dragAndDrop()


  show: (id) ->
    console.log "Tournament #{id}"

class Foosballer.Routers.Tournaments extends Backbone.Router
  routes:
    ''                      : 'index'
    'tournaments/new'       : 'new'
    'tournaments/:id'       : 'show'
    'tournaments/new/teams' : 'createTeams'

  initialize: ->
    @mainContainer = $('#main-container')

  index: ->
    @tournaments = new Foosballer.Collections.Tournaments()
    view = new Foosballer.Views.TournamentsIndex(collection: @tournaments)
    @mainContainer.html(view.render().el)

  new: ->
    @players = new Foosballer.Collections.Players()
    view = new Foosballer.Views.TournamentsNew(collection: @players)
    @mainContainer.html(view.render().el)

  show: (id) ->
    console.log "Tournament #{id}"

  createTeams: ->
    player_ids = _.map $('#current-pool .player .thumbnail'), (player) ->
      parseInt player.id

    view = new Foosballer.Views.TournamentsTeams(player_ids)
    @mainContainer.html(view.render().el)

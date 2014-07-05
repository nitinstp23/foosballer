class Foosballer.Views.TournamentsNew extends Backbone.View

  template: JST['tournaments/new']

  initialize: ->
    @players = new Foosballer.Collections.Players()

    _.bindAll(this, 'render')
    @players.fetch(success: @render)

  render: ->
    $(@el).html @template(players: @players.models)
    @dragAndDrop()
    this

  hide: ->
    $(@el).hide()

  dragAndDrop: ->
    $('#all-players .player').draggable
      appendTo: 'body'
      helper:   'clone'

    $('#current-pool .player').draggable
      appendTo: 'body'
      helper:   'clone'

    $('#current-pool').droppable
      tolerance: 'touch'
      drop: (event, ui) ->
        $(this).find('.panel-body .row').append(ui.draggable[0])

    $('#all-players').droppable
      tolerance: 'touch'
      drop: (event, ui) ->
        $(this).find('.panel-body .row').append(ui.draggable[0])

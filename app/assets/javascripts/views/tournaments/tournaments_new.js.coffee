class Foosballer.Views.TournamentsNew extends Backbone.View

  template: JST['tournaments/new']

  events:
    'submit #create_tournament_form' : 'createTournament'

  # initialize: ->

  render: ->
    $(@el).html(@template())
    this

  createTournament: (event)->
    event.preventDefault()
    console.log 'hi'

  hide: ->
    $(@el).hide()

  dragAndDrop: ->
    $('#all-players .player').draggable
      appendTo: 'body'
      helper:   'clone'

    $('#current-pool').droppable
      activeClass: 'ui-state-default'
      hoverClass:  'ui-state-hover'
      accept:      ':not(.ui-sortable-helper)'
      drop: (event, ui) ->
        $(this).find('.panel-body .row').append(ui.draggable[0])

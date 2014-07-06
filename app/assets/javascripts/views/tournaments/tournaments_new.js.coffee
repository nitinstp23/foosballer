class Foosballer.Views.TournamentsNew extends Backbone.View

  id:        'new_tournament_section'
  className: 'container'
  template:  JST['tournaments/new']

  events:
    'click #create_teams_link' : 'buildTeams'

  initialize: ->
    _.bindAll(this, 'render')
    @collection.fetch(success: @render)

  render: ->
    $(@el).html @template(players: @collection.models)
    @dragAndDrop()
    this

  hide: ->
    $(@el).hide()

  buildTeams: (event)->
    event.preventDefault()
    @hide()
    TOURNAMENTS_ROUTER.navigate('tournaments/new/teams', trigger: true)

  enableBuildTeamsLink: ->
    $('#create_teams_link').removeClass('disabled').addClass('enabled')

  disableBuildTeamsLink: ->
    $('#create_teams_link').removeClass('enabled').addClass('disabled')

  dragAndDrop: ->
    current_scope     = this
    draggable_options = { appendTo: 'body', helper: 'clone' }

    $('#all-players .player').draggable(draggable_options)
    $('#current-pool .player').draggable(draggable_options)

    $('#current-pool').droppable
      tolerance: 'touch'
      drop: (event, ui) ->
        $(this).find('.panel-body .row').append(ui.draggable[0])
        players_count = $(this).find('.player').length
        if (players_count >= 4) && (players_count % 2 == 0)
          current_scope.enableBuildTeamsLink()
        else
          current_scope.disableBuildTeamsLink()

    $('#all-players').droppable
      tolerance: 'touch'
      drop: (event, ui) ->
        $(this).find('.panel-body .row').append(ui.draggable[0])
        players_count = $('#current-pool').find('.player').length
        if (players_count <= 3) || (players_count % 2 != 0)
          current_scope.disableBuildTeamsLink()
        else
          current_scope.enableBuildTeamsLink()

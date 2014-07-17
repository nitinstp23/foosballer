class Foosballer.Views.TournamentsShow extends Backbone.View

  id:        'tournament_show_section'
  className: 'container'
  template:  JST['tournaments/show']

  initialize: (attributes) ->
    Foosballer.showLoading()

    @model = new Foosballer.Models.Tournament(id: attributes.tournament_id)
    @model.fetch
      success: =>
        Foosballer.hideLoading()
        @render()
        @addTooltip()
        @copyTeamsToClipboard()

  render: ->
    $(@el).html @template(tournament: @model)
    this

  hide: ->
    $(@el).hide()

  copyTeamsToClipboard: ->
    $('#copyTeams').zclip
      path:
        'assets/ZeroClipboard.swf'
      copy: ->
        teams = []
        for team in $('.teams-list .panel-body ul li')
          team_name = $(team).find('.game-number').text().replace(/^\s+|\s+$/g, "")
          players   = $(team).find('.teams-row .team-name')
          players   = ($(player).text().replace(/^\s+|\s+$/g, "") for player in players)
          teams.push "#{team_name} #{players.join(' & ')}"
        teams.join('\n')
      afterCopy: (event) ->


  addTooltip: ->
    $('.copy-to-clipboard').tooltip
      title: 'Copy to clipboard'
      placement: 'left'

class Foosballer.Models.Player extends Backbone.Model

  name: ->
    "#{@get('first_name')} #{@get('last_name')}"

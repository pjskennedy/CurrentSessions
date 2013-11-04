class CurrentSessions.Views.Session extends Backbone.View

  template: JST["sessions/session"]
  cell: JST["sessions/cell"]
  player: JST["sessions/session_player"]

  render: (model) ->
    @model = new CurrentSessions.Models.Video(model)
    $(@el).html(@template(@model.attributes))
    this

  cellerize: =>
    @playerMode = false
    $("#session#{@model.id}").html(@cell(@model.attributes))

  playerize: =>
    @playerMode = true
    $("#session#{@model.id}").html(@player(@model.attributes))
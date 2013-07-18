class CurrentSessions.Views.Session extends Backbone.View

  template: JST["sessions/session"]
  cell: JST["sessions/cell"]
  player: JST["sessions/session_player"]

  render: (model) ->
    @model = new CurrentSessions.Models.Video(model)
    $(@el).html(@template(model: @model))
    this

  cellerize: =>
    @playerMode = false
    console.log $("#session#{@model.id}")
    $("#session#{@model.id}").html(@cell(model:@model))

  playerize: =>
    @playerMode = true
    $("#session#{@model.id}").html(@player(model:@model))
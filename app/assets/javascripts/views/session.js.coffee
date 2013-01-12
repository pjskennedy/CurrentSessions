class CurrentSessions.Views.Session extends Backbone.View

  template: JST["sessions/session"]

  events: 
    'mouseenter .session-cell' : 'titleSelected'
    'mouseleave .session-cell' : 'titleDeselected'

  render: (model) ->
    $(@el).html(@template(model: model))
    this

  titleSelected: (event) =>
    object = $(event.currentTarget).children().eq(1)
    object.removeClass("session-cell-title-deselected")
    object.addClass("session-cell-title-selected")

  titleDeselected: (event) =>
    object = $(event.currentTarget).children().eq(1)
    object.removeClass("session-cell-title-selected")
    object.addClass("session-cell-title-deselected")

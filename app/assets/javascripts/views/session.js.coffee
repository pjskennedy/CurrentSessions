class CurrentSessions.Views.Session extends Backbone.View

  template: JST["sessions/session"]

  events: 
    'mouseover .session-cell'  : 'titleSelected'
    'mouseleave .session-cell' : 'titleDeselected'

  render: (model) ->
    @model = new CurrentSessions.Models.Video(model)
    $(@el).html(@template(model: model))
    this

  titleSelected: (event) =>
    title_object = $(event.currentTarget).children().eq(1)
    title_object.switchClass("session-cell-title-deselected", "session-cell-title-selected", 60)

  titleDeselected: (event) =>
    title_object = $(event.currentTarget).children().eq(1)
    title_object.switchClass("session-cell-title-selected", "session-cell-title-deselected", 60)

    
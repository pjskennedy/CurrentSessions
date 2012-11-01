class CurrentSessions.Views.Video extends Backbone.View

  template: JST['video']

  render: () ->
    $(@el).hide().html(@template(model : this.model)).show("slide", { direction: "down" }, 200)
    this

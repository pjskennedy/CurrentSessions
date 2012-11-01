class CurrentSessions.Views.AdminMain extends Backbone.View

  template: JST['admin/main']

  render: () ->
    $(@el).html(@template())
    this

 
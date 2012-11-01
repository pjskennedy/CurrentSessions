class CurrentSessions.Views.Contact extends Backbone.View

  template: JST['contact']


  render: () ->
    $(@el).html(@template())
    this

 
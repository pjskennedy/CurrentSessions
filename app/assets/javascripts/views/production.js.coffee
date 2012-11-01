class CurrentSessions.Views.Production extends Backbone.View

  template: JST['production']

  render: () -> 
    $(@el).html(@template())
    this

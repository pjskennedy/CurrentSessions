class CurrentSessions.Views.AdminContainer extends Backbone.View

  template: JST['admin/admin_container']

  render: () ->
    $(@el).html(@template())
    this
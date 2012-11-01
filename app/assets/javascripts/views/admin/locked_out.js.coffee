class CurrentSessions.Views.AdminLockedOut extends Backbone.View

  template: JST['admin/locked_out']

  render: () ->
    $(@el).html(@template(collection: @admins))
    this


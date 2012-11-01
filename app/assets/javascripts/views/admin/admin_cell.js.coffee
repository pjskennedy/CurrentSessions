class CurrentSessions.Views.AdminCell extends Backbone.View

  template: JST['admin/admin_cell']

  render: () ->
    $(@el).html(@template(model: this.options))
    this

 
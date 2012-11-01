class CurrentSessions.Views.Admins extends Backbone.View

  template: JST['admin/admins']

  initialize: () ->
    @admins = new CurrentSessions.Collections.Admins()
    @admins.fetch( {success: @adminsFetched})

  adminsFetched: () =>
    for admin in @admins.models
      video_page = new CurrentSessions.Views.AdminCell( model: admin )
      $(".table-heading").parent().append(video_page.render().el.children[0])


  render: () ->
    $(@el).html(@template(collection: @admins))
    this

 
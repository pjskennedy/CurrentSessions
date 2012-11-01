class CurrentSessions.Views.AdminSessions extends Backbone.View

  template: JST['admin/sessions']


  initialize: ->
    @videos = new CurrentSessions.Collections.Videos    

  videosFetched: =>
    for video in @videos.models
      @page = new CurrentSessions.Views.AdminVideoCell({model: video})
      $("#admin-session").append(@page.render().el)


  validateForm: =>
    console.log 'fart!'

  render: () ->
    $(@el).html(@template())
    @videos.fetch( success: @videosFetched )
    this

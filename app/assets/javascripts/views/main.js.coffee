class CurrentSessions.Views.Main extends Backbone.View

  template: JST['main']

  initialize: () ->
    @videos = new CurrentSessions.Collections.Videos()
    @videos.fetch( success: @displayVideos)

  displayVideos: () =>
    for video in @videos.models
      video_page = new CurrentSessions.Views.Video({model : video})
      $("#video-container").append(video_page.render().el)

  render: () ->
    $(@el).html(@template())
    this

 
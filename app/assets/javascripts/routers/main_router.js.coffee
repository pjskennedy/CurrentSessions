class CurrentSessions.Routers.MainRouter extends Backbone.Router

  routes:
    ''            : 'sessionsPage'
    '/'           : 'sessionsPage'
    'contact'     : 'contactPage'
    'contact/'    : 'contactPage'
    'about'       : 'aboutPage'
    'about/'      : 'aboutPage'
    'blog'        : 'blogPage'
    'blog/'       : 'blogPage'
    'admin'       : 'adminPage'
    'admin/'      : 'adminPage'
    'not-found'   : 'notFound'
    'not-found/'  : 'notFound'
    ':name'       : 'renderSpecificSession'



  sessionsPage: =>

    $("#player-container").html("")
    $("#blackout").animate( 
      {
        opacity: 0
      }, 1000
    )

    $("#blackout").removeClass("blackout-active")

    $('#sessions-container').masonry({
      itemSelector: '.session-cell',
      columnWidth: 500,
      gutterWidth: 11,
      isFitWidth: true,
      isAnimated: true,
      animationOptions: {
        duration: 300, 
        queue: false,
        easing: "easeInOutQuad"
      }
    })

    @videos = new CurrentSessions.Collections.Videos() if @videos == undefined
    if not (@videos.models.length > 0)
      @videos.fetch( success: @sessionsFetched)

  sessionsFetched: (collection) =>
    for video in collection.models
      page = new CurrentSessions.Views.Session()
      data = $(page.render(video).el)
      $("#sessions-container").append(data).masonry( 'appended', data, true );
      
    for item in _.range($(".session-cell").length)
      $(".session-cell").eq(item).carousel({interval: false})

    intervalID = setInterval((() -> (
      num = Math.floor(Math.random()* ($(".session-cell").length))
      $(".session-cell").eq(num).carousel('next')
      $(".session-cell").eq(num).carousel({interval: false})
    )), 5000 )

    $('.session-cell').bind 'click', (event) =>
      @prepareToRenderSpecificSession(event)

  contactPage: =>
    @page = new CurrentSessions.Views.Contact()
    $("#contact-container").html(@page.render().el)

  aboutPage: =>
    console.log 'about page'

  adminPage: =>
    console.log 'Admins'

  blogPage: =>
    console.log 'blog page'

  notFound: =>
    console.log 'not found'

  prepareToRenderSpecificSession: (event) =>
    Backbone.history.navigate( $(event.currentTarget).data("route"), false )
    @renderSpecificSession($(event.currentTarget).data("route"))

  renderSpecificSession: (event) =>
    video = new CurrentSessions.Models.Video()
    video.fetch( 
      data: $.param({url_route: event}),
      success: (video) -> (
        console.log video
        if video.models.length == 0
          window.location.href = '/not-found'
        else
          page  = new CurrentSessions.Views.Player()
          $("#player-container").html(page.render(video).el)
      ), 
    )


class CurrentSessions.Routers.MainRouter extends Backbone.Router

  routes:
    ''            : 'sessionsPage'
    '/'           : 'sessionsPage'
    'contact'     : 'contactPage'
    'contact/'    : 'contactPage'

  sessionsPage: =>

    $('#sessions-container').masonry({
      itemSelector: '.session-cell',
      columnWidth: 303,
      gutterWidth: 1,
      isFitWidth: true,
      isAnimated: true,
      animationOptions: {
        duration: 500, 
        queue: false,
        easing: "easeInOutQuad"
      }
    })

    @videos = new CurrentSessions.Collections.Videos() if @videos == undefined
    if not (@videos.models.length > 0)
      @videos.fetch( success: @sessionsFetched)

  sessionsFetched: (collection) =>
    @viewCol = {}
    for video in collection.models
      page = new CurrentSessions.Views.Session()
      @viewCol[video.id] = page
      data = $(page.render(video).el)
      $("#sessions-container").append(data).masonry( 'appended', data, true )
      page.cellerize()
      
    for item in _.range($(".session-cell").length)
      $(".session-cell").eq(item).carousel({interval: false})

    intervalID = setInterval((() -> (
      num = Math.floor(Math.random()* ($(".session-cell").length))
      $(".session-cell").eq(num).carousel('next')
      $(".session-cell").eq(num).carousel({interval: false})
    )), 5000 )

    container = document.querySelector('.masonry')

    eventie.bind( container, 'click', (event) => (
      # don't proceed if item was not clicked on

      id = $(event.target).data("id")
      loc = $("#session#{id}")

      if ( !classie.has( loc[0], 'session-cell' ) ) 
        return
      
      _.each(_.values(@viewCol), (v) => 
        v.cellerize() if v.playerMode
        $("#session#{v.model.id}").removeClass("gigante")
      )

      # change size of item via class
      classie.toggle(loc[0], 'gigante' )
        
      # trigger layout
      @viewCol[id].playerize()
      $('#sessions-container').masonry()

    ))

  contactPage: =>
    @page = new CurrentSessions.Views.Contact()
    $("#contact-container").html(@page.render().el)


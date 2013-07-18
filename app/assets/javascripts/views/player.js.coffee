class CurrentSessions.Views.Player extends Backbone.View

  events: 
    'click .session-player-image' : 'carouselPlayer'
    'click .return-to-sessions'   : 'exitPlayer'
    "click a.carousel-control.left" : 'carouselLeft'
    "click a.carousel-control.right" : 'carouselRight'

  initialize: ->
    $(document).keyup((event) -> (
      switch (event.keyCode)
        when 37 then $("#playerCarousel").carousel('prev')
        when 39 then $("#playerCarousel").carousel('next')
    ))
